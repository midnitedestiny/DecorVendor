-- ============================================================
-- Decor Vendor Gallery
-- GalleryUI.lua
-- Standalone gallery browser window
-- ============================================================
local addonName, DVD = ...

local HEADER_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\FilterBarBackground"
local BOTTOM_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\MetallicBorderStrip"

--------------------------------------------------------------------------------
-- SECTION 1: GALLERY NAMESPACE, RUNTIME STATE & ITEM BUILDER ENGINE
--------------------------------------------------------------------------------
DVD.Gallery = DVD.Gallery or {}
local Gallery = DVD.Gallery
local C = Gallery.C or DVD.CONSTANTS or DVD.C
local Sizing = C.GalleryFrameSizing
local SOURCE_ORDER = C.SOURCE_ORDER or {}
Gallery.C = C
Gallery.Data = DVD

function Gallery.SyncSharedData()
    Gallery.ActiveItems = DVD.ActiveItems or Gallery.ActiveItems or {}
    Gallery.npcs = DVD.npcs or Gallery.npcs or {}
    Gallery.quests = DVD.quests or Gallery.quests or {}
    Gallery.professions = DVD.professions or Gallery.professions or {}
    Gallery.achievements = DVD.achievements or Gallery.achievements or {}
    Gallery.bossdrops = DVD.bossdrops or Gallery.bossdrops or {}

    Gallery.ItemDetails = DVD.ItemDetails or Gallery.ItemDetails or {}
    Gallery.VendorDetails = DVD.VendorDetails or Gallery.VendorDetails or {}

    Gallery.catalogRecords = DVD.catalogRecords or Gallery.catalogRecords or {}
    Gallery.catalogByDecorID = DVD.catalogByDecorID or Gallery.catalogByDecorID or {}
    Gallery.catalogByItemID = DVD.catalogByItemID or Gallery.catalogByItemID or {}

    Gallery.catalogLoaded = DVD.catalogLoaded == true
    Gallery.catalogLoading = DVD.catalogLoading == true

    Gallery.ClearCatalogRecords = DVD.ClearCatalogRecords or Gallery.ClearCatalogRecords
    Gallery.ProcessCatalogSearchResults = DVD.ProcessCatalogSearchResults or Gallery.ProcessCatalogSearchResults
    Gallery.LoadCatalogRecords = DVD.LoadCatalogRecords or Gallery.LoadCatalogRecords

    Gallery.VendorCameraOverrides = DVD.VendorCameraOverrides or Gallery.VendorCameraOverrides or {}
    Gallery.DecorCameraOverrides = DVD.DecorCameraOverrides or Gallery.DecorCameraOverrides or {}
end

Gallery.SyncSharedData()

local BACKDROP_SOLID = {
    bgFile   = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
    insets   = { left = 1, right = 1, top = 1, bottom = 1 },
}
Gallery.items = Gallery.items or {}
Gallery.cards = Gallery.cards or {}
Gallery.catalogInfoCache = Gallery.catalogInfoCache or {}
Gallery.sourceIndex = Gallery.sourceIndex or {}
Gallery.activeItemSet = Gallery.activeItemSet or {}
Gallery.categoryInfoCache = Gallery.categoryInfoCache or {}
Gallery.categoryList = Gallery.categoryList or {}

Gallery.filters = Gallery.filters or {}
local filters = Gallery.filters

if filters.search == nil then filters.search = "" end
if filters.category == nil then filters.category = "all" end
if type(filters.categories) ~= "table" then filters.categories = {} end
if filters.source == nil then filters.source = "all" end
if filters.hideCollected == nil then filters.hideCollected = false end
if filters.showCollected == nil then filters.showCollected = true end
if filters.showNotCollected == nil then filters.showNotCollected = true end
if type(filters.sources) ~= "table" then filters.sources = {} end

local validSourceKeys = {}
for _, sourceKey in ipairs(SOURCE_ORDER) do
    validSourceKeys[sourceKey] = true
    if filters.sources[sourceKey] == nil then
        filters.sources[sourceKey] = false
    end
end

for sourceKey in pairs(filters.sources) do
    if not validSourceKeys[sourceKey] then
        filters.sources[sourceKey] = nil
    end
end

local function GetUsableValue(primary, fallback)
    if primary ~= nil and primary ~= "" and primary ~= 0 then
        return primary
    end
    return fallback
end

function Gallery.BuildItemList()
    Gallery.SyncSharedData()
    Gallery.items = Gallery.items or {}
    wipe(Gallery.items)

    local activeItems = DVD.ActiveItems or {}

    if Gallery.BuildSourceIndex then
        Gallery.BuildSourceIndex(activeItems)
    end

    local activeByItemID = {}
    local activeByDecorID = {}

    for rawItemID, activeData in pairs(activeItems) do
        local itemID = tonumber(rawItemID)
        if itemID and type(activeData) == "table" then
            activeByItemID[itemID] = activeData
            local decorID = tonumber(activeData.decorID)
            if decorID and not activeByDecorID[decorID] then
                activeByDecorID[decorID] = {
                    itemID = itemID,
                    data = activeData
                }
            end
        end
    end

    local seenItems = {}
    local seenDecor = {}

    local function AddGalleryItem(rawItemID, itemData, sourceMode, sourceData)
        if type(itemData) ~= "table" then return end

        local itemID = tonumber(rawItemID) or rawItemID
        local decorID = tonumber(itemData.decorID) or itemData.decorID
        local sources = {}
        local sourceLookupData = type(sourceData) == "table" and sourceData or itemData

        if Gallery.GetItemSources then
            sources = Gallery.GetItemSources(itemID, sourceLookupData) or {}
        end

        local rawSource = itemData.source or itemData.sourceType
        local normalizedSource = Gallery.NormalizeSource and Gallery.NormalizeSource(rawSource)
        if normalizedSource then
            sources[normalizedSource] = true
        end

        if not next(sources) then
            if sourceMode == "catalog" then
                sources.catalog = true
            else
                sources.other = true
            end
        end

        local sourceType = Gallery.GetPrimarySourceType and Gallery.GetPrimarySourceType(sources) or "other"
        local itemName = itemData.name

        if itemName == nil or itemName == "" then
            itemName = Gallery.GetItemName and Gallery.GetItemName(itemID, itemData) or "Unknown Decor"
        end

        local icon = itemData.icon or itemData.iconTexture or itemData.iconFileID
        if icon == nil or icon == "" or icon == 0 then
            icon = Gallery.GetItemIcon and Gallery.GetItemIcon(itemID, itemData) or "Interface\\Icons\\INV_Misc_QuestionMark"
        end

        table.insert(
            Gallery.items,
            {
                itemID = itemID,
                decorID = decorID,
                data = itemData,
                name = itemName,
                icon = icon,
                iconType = itemData.iconType,
                isCollected = itemData.isCollected,
                sources = sources,
                sourceType = sourceType
            }
        )

        if itemID ~= nil then seenItems[itemID] = true end
        if decorID ~= nil then seenDecor[decorID] = true end
    end

    if Gallery.catalogLoaded and type(Gallery.catalogRecords) == "table" then
        for _, record in ipairs(Gallery.catalogRecords) do
            if type(record) == "table" then
                local recordItemID = tonumber(record.itemID)
                local recordDecorID = tonumber(record.decorID)
                local activeItemID
                local activeData

                if recordItemID then
                    activeData = activeByItemID[recordItemID]
                    if activeData then activeItemID = recordItemID end
                end

                if not activeData and recordDecorID then
                    local found = activeByDecorID[recordDecorID]
                    if found then
                        activeItemID = found.itemID
                        activeData = found.data
                    end
                end

                local merged = {
                    catalogRecord = true,
                    itemID = activeItemID or recordItemID or record.itemID,
                    decorID = recordDecorID or record.decorID,
                    name = record.name,
                    icon = record.icon,
                    iconType = record.iconType,
                    model3D = record.model3D,
                    asset = record.asset,
                    uiModelSceneID = record.uiModelSceneID,
                    sourceText = record.sourceText,
                    isCollected = record.isCollected,
                    totalOwned = record.totalOwned,
                    quantity = record.quantity,
                    numStored = record.numStored,
                    totalNumStored = record.totalNumStored,
                    numPlaced = record.numPlaced,
                    totalNumPlaced = record.totalNumPlaced,
                    remainingRedeemable = record.remainingRedeemable,
                    categoryIDs = record.categoryIDs,
                    subcategoryIDs = record.subcategoryIDs,
                    isIndoors = record.isIndoors,
                    isOutdoors = record.isOutdoors,
                    canCustomize = record.canCustomize
                }

                if type(activeData) == "table" then
                    for key, value in pairs(activeData) do
                        if key ~= "name" and key ~= "icon" and key ~= "iconTexture" and key ~= "iconFileID" and
                           key ~= "iconType" and key ~= "model3D" and key ~= "asset" and key ~= "uiModelSceneID" then
                            merged[key] = value
                        end
                    end
                    merged.model3D = GetUsableValue(record.model3D, activeData.model3D)
                    merged.asset = GetUsableValue(record.asset, activeData.asset)
                    merged.uiModelSceneID = GetUsableValue(record.uiModelSceneID, activeData.uiModelSceneID)
                end

                AddGalleryItem(activeItemID or recordItemID or record.itemID, merged, "catalog", activeData or merged)
            end
        end
    end

    local manualItems = {}
    for itemID, itemData in pairs(activeByItemID) do
        local decorID = tonumber(itemData.decorID) or itemData.decorID
        local itemAlreadySeen = seenItems[itemID] == true
        local decorAlreadySeen = decorID ~= nil and seenDecor[decorID] == true

        if not itemAlreadySeen and not decorAlreadySeen then
            if C_Item and C_Item.RequestLoadItemDataByID then
                C_Item.RequestLoadItemDataByID(itemID)
            end
            table.insert(manualItems, { itemID = itemID, data = itemData })
        end
    end

    table.sort(manualItems, function(a, b)
        local nameA = Gallery.GetItemName and Gallery.GetItemName(a.itemID, a.data) or ""
        local nameB = Gallery.GetItemName and Gallery.GetItemName(b.itemID, b.data) or ""

        if Gallery.CleanSortName then
            nameA = Gallery.CleanSortName(nameA)
            nameB = Gallery.CleanSortName(nameB)
        else
            nameA = string.lower(tostring(nameA))
            nameB = string.lower(tostring(nameB))
        end

        if nameA ~= nameB then return nameA < nameB end
        local itemIDA = tonumber(a.itemID)
        local itemIDB = tonumber(b.itemID)
        if itemIDA and itemIDB then return itemIDA < itemIDB end
        return tostring(a.itemID or "") < tostring(b.itemID or "")
    end)

    for _, manual in ipairs(manualItems) do
        AddGalleryItem(manual.itemID, manual.data, "active", manual.data)
    end
end

local function Gallery_RefreshAfterOpen()
    Gallery.SyncSharedData()
    local loadCatalogRecords = DVD.LoadCatalogRecords or Gallery.LoadCatalogRecords

    local function FinishRefresh()
        Gallery.SyncSharedData()
        if Gallery.BuildItemList then Gallery.BuildItemList() end
        if Gallery.RefreshGrid then Gallery.RefreshGrid() end
    end

    if loadCatalogRecords then
        loadCatalogRecords(FinishRefresh)
    else
        FinishRefresh()
    end
end

local function Gallery_EnsureFrame()
    if Gallery.frame then return true end
    if Gallery.CreateFrame then
        Gallery.CreateFrame()
    else
        print("|cffff4040Decor Vendor Gallery UI is not loaded.|r")
        return false
    end
    return Gallery.frame ~= nil
end

function DVD.ToggleGallery()
    if not Gallery_EnsureFrame() then return end
    local shouldShow = not Gallery.frame:IsShown()
    Gallery.frame:SetShown(shouldShow)
    if shouldShow then Gallery_RefreshAfterOpen() end
end

function DVD.ShowGallery()
    if not Gallery_EnsureFrame() then return end
    Gallery.frame:Show()
    Gallery_RefreshAfterOpen()
end

function DVD.HideGallery()
    if Gallery.frame then Gallery.frame:Hide() end
end

Gallery.Open = DVD.ShowGallery
Gallery.Toggle = DVD.ToggleGallery
Gallery.Hide = DVD.HideGallery

function DVD.OpenGalleryAddon()
    if not Gallery_EnsureFrame() then return end
    if DVD.frame and DVD.frame:IsShown() then DVD.frame:Hide() end
    Gallery.frame:Show()
    Gallery_RefreshAfterOpen()
end

function DecorVendorGallery_Open()
    if DVD.ShowGallery then
        DVD.ShowGallery()
        return
    end
    print("|cffffcc00Decor Vendor:|r Gallery open function was not found.")
end

function Gallery.CreateFrame()
    local frame = CreateFrame("Frame", "DecorVendorGalleryFrame", UIParent, "BackdropTemplate")
    frame:SetSize(Sizing.Width, Sizing.Height)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, Sizing.CenterOffsetY)
    frame:SetBackdrop(BACKDROP_SOLID)
    frame:SetBackdropColor(0.06, 0.06, 0.08, 0.95)
    frame:SetBackdropBorderColor(0.20, 0.20, 0.22, 1)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(120)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    Gallery.frame = frame

    -- ESC closes frame
    tinsert(UISpecialFrames, "DecorVendorGalleryFrame")

    -- ============================================================
    -- Title bar
    -- ============================================================

    local dvgTitleBar = CreateFrame("Frame", "DecorVendorGallerydvgTitleBar", frame)
    dvgTitleBar:SetHeight(Sizing.TitleBarHeight)
    dvgTitleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
    dvgTitleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
    dvgTitleBar:EnableMouse(true)
    dvgTitleBar:RegisterForDrag("LeftButton")
    dvgTitleBar:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)
    dvgTitleBar:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
    end)

    frame.titleBar = dvgTitleBar

    -- ============================================================
    -- Header background texture
    -- ============================================================

   
    frame.headerBg = dvgTitleBar:CreateTexture(nil, "BACKGROUND")
    frame.headerBg:SetAllPoints(dvgTitleBar)
    frame.headerBg:SetTexture(HEADER_TEXTURE)
    frame.headerBg:SetHorizTile(true)
    frame.headerBg:SetVertTile(false)
    frame.headerBg:SetAlpha(0.85)

    -- Keep the texture from stretching ugly if the art is tile-friendly.
    dvgTitleBar:SetScript("OnSizeChanged", function(self, width)
        if frame.headerBg and width and width > 0 then
            frame.headerBg:SetTexCoord(0, width / 512, 0, 1)
        end
    end)

    -- ============================================================
    -- Title text
    -- ============================================================

    frame.title = dvgTitleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.title:SetPoint("CENTER", dvgTitleBar, "CENTER", 0, 2)
    frame.title:SetText("|cffffd100Decor Vendor Gallery|r")
    frame.title:SetTextColor(1, 0.82, 0, 1)
    frame.title:SetShadowOffset(1, -1)
    frame.title:SetShadowColor(0, 0, 0, 0.9)

    -- ============================================================
    -- Close button
    -- ============================================================

    frame.closeBtn = CreateFrame("Button", nil, dvgTitleBar, "UIPanelCloseButton")
    frame.closeBtn:SetPoint("RIGHT", dvgTitleBar, "RIGHT", -2, 0)
    frame.closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)

    -- ============================================================
    -- Main Decor Vendor button
    -- ============================================================

    frame.mainBtn = CreateFrame("Button", nil, dvgTitleBar, "UIPanelButtonTemplate")
    frame.mainBtn:SetSize(Sizing.MainButtonWidth, Sizing.MainButtonHeight)
    frame.mainBtn:SetPoint("LEFT", dvgTitleBar, "LEFT", 8, 0)
    frame.mainBtn:SetText("Decor Vendor")
    frame.mainBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("Open Decor Vendor", 1, 0.82, 0)
        GameTooltip:AddLine("Return to the Decor Vendor section menu.", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)
    frame.mainBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    frame.mainBtn:SetScript("OnClick", function()
        GameTooltip:Hide()

        -- Close Gallery first.
        if Gallery.frame and Gallery.frame:IsShown() then
            Gallery.frame:Hide()
        end

        -- Open Decor Vendor through the main addon opener natively.
        if DVD.OpenMainUI then
            DVD.OpenMainUI()
            return
        end

        local mainFrame = DVD.frame or _G.DV_MainFrame
        if mainFrame then
            mainFrame:Show()
            if DVD.ShowMainHomePanel then
                DVD.ShowMainHomePanel()
            elseif DVD.CreateMainHomePanel then
                DVD:CreateMainHomePanel(mainFrame)
                if mainFrame.homePanel then
                    mainFrame.homePanel:Show()
                end
            end
            return
        end

        print("|cffff4040Decor Vendor main frame is not loaded.|r")
    end)

    -- ============================================================
    -- Search box
    -- ============================================================

    local searchBox = CreateFrame("EditBox", "DecorVendorGallerySearchBox", dvgTitleBar, "SearchBoxTemplate")
    searchBox:SetSize(Sizing.SearchBoxWidth, Sizing.SearchBoxHeight)
    searchBox:SetPoint("RIGHT", frame.closeBtn, "LEFT", -12, 0)
    searchBox:SetAutoFocus(false)
    if searchBox.Instructions then
        searchBox.Instructions:SetText("Search decor, vendor, quest, boss...")
    end
    searchBox:SetScript("OnTextChanged", function(self)
        if SearchBoxTemplate_OnTextChanged then
            SearchBoxTemplate_OnTextChanged(self)
        end

        Gallery.filters = Gallery.filters or {}
        Gallery.filters.search = string.lower(self:GetText() or "")

        if Gallery.searchTimer then
            Gallery.searchTimer:Cancel()
            Gallery.searchTimer = nil
        end

        Gallery.searchTimer = C_Timer.NewTimer(0.2, function()
            if frame.scroll then
                frame.scroll:SetVerticalScroll(0)
            end

            if Gallery.RefreshGrid then
                Gallery.RefreshGrid()
            end
        end)
    end)
    searchBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    searchBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)

    frame.searchBox = searchBox

    -- ============================================================
    -- Main sections
    -- ============================================================

    if Gallery.CreateSidebar then Gallery.CreateSidebar(frame) end
    if Gallery.CreateGrid then Gallery.CreateGrid(frame) end
    if Gallery.CreatePreview then Gallery.CreatePreview(frame) end
    if Gallery.CreateBottomBar then Gallery.CreateBottomBar(frame) end

    frame:Hide()
end

function Gallery.CreateBottomBar(frame)
    local bottom = CreateFrame("Frame", "DecorVendorGalleryBottom", frame, "BackdropTemplate")
    bottom:SetHeight(Sizing.BottomBarHeight)
    bottom:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, 0)
    bottom:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    bottom:SetBackdrop(BACKDROP_SOLID)
    bottom:SetBackdropColor(0.06, 0.06, 0.08, 0.95)
    bottom:SetBackdropBorderColor(0.20, 0.20, 0.22, 1)

    -- Metallic border strip at bottom
    local bottomBorder = bottom:CreateTexture(nil, "ARTWORK")
    bottomBorder:SetHeight(Sizing.BottomBorderHeight)
    bottomBorder:SetPoint("BOTTOMLEFT", bottom, "BOTTOMLEFT", 0, 0)
    bottomBorder:SetPoint("BOTTOMRIGHT", bottom, "BOTTOMRIGHT", 0, 0)
    bottomBorder:SetTexture(BOTTOM_TEXTURE)
    
    local function UpdatebottomBorderCoords(_, w)
        if not w or w <= 0 then w = bottom:GetWidth() end
        if w > 0 then
            bottomBorder:SetTexCoord(0, w / 512, 0, 1)
        end
    end
    bottom:HookScript("OnSizeChanged", UpdatebottomBorderCoords)
    bottom:HookScript("OnShow", UpdatebottomBorderCoords)
    frame.bottom = bottom
        
    bottom.text = bottom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    bottom.text:SetPoint("TOPLEFT", bottom, "TOPLEFT", 8, -4)
    bottom.text:SetText("|cffaaaaaaShowing 0 items|r")  
    
    bottom.tipText = bottom:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bottom.tipText:SetPoint("RIGHT", bottom, "RIGHT", -10, 0)
    bottom.tipText:SetJustifyH("RIGHT")
    bottom.tipText:SetText("|cffffd100Tip:|r First load may take a moment.")
end

function Gallery.GetAvailableItemCount()
    local total = 0
    for _, item in ipairs(Gallery.items or {}) do
        if not DVD.IsDataAvailableForClient or DVD.IsDataAvailableForClient(item) then
            total = total + 1
        end
    end

    return total
end

--------------------------------------------------------------------------------
-- SECTION 2: GALLERY SIDEBAR & CATEGORY FILTERS
--------------------------------------------------------------------------------
local GallerySidebarSizing = C.GallerySidebarSizing
local GalleryFrameSizing = C.GalleryFrameSizing
local FILTER_SECTION_DEFS = C.GALLERY_FILTER_SECTIONS

local function RefreshGridFromSidebar()
    if Gallery.frame and Gallery.frame.scroll then
        Gallery.frame.scroll:SetVerticalScroll(0)
    end
    if Gallery.RefreshGrid then
        Gallery.RefreshGrid()
    end
end

local function ClearFrameChildren(frame)
    if not frame then return end
    local children = {frame:GetChildren()}
    for _, child in ipairs(children) do
        child:Hide()
        child:SetParent(nil)
    end
end

-------------------------------------------------
-- Sidebar Count Cache
-------------------------------------------------
function Gallery.RebuildSidebarCountCache()
    Gallery.sidebarCountCache = {
        categories = {},
        collection = {
            showCollected = 0,
            showNotCollected = 0
        },
        sources = {}
    }
    local cache = Gallery.sidebarCountCache
    local availableTotal = 0
    for _, item in ipairs(Gallery.items or {}) do
        if DVD.IsDataAvailableForClient and not DVD.IsDataAvailableForClient(item) then
            -- Skip future/unreleased items in sidebar counts.
        else
            availableTotal = availableTotal + 1
            -- Collection counts
            local collected =
                item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID)) or false
            if collected then
                cache.collection.showCollected = cache.collection.showCollected + 1
            else
                cache.collection.showNotCollected = cache.collection.showNotCollected + 1
            end
            -- Source counts
            if item.sources then
                for sourceKey in pairs(item.sources) do
                    cache.sources[sourceKey] = (cache.sources[sourceKey] or 0) + 1
                end
            end
            -- Category counts
            if Gallery.categoryList then
                for _, category in ipairs(Gallery.categoryList) do
                    local categoryKey = category.key
                    if categoryKey and categoryKey ~= "all" then
                        if Gallery.ItemMatchesCategory and Gallery.ItemMatchesCategory(item, categoryKey) then
                            cache.categories[categoryKey] = (cache.categories[categoryKey] or 0) + 1
                        end
                    end
                end
            end
        end
    end
    cache.categories.all = availableTotal
    cache.availableTotal = availableTotal
end

-------------------------------------------------
-- Shared Label Color Helpers
-------------------------------------------------
local function ColorLabel(label, colorTable, key)
    if DVD.ColorizeLabel then
        return DVD.ColorizeLabel(label, colorTable, key)
    end
    return tostring(label or "Unknown")
end

local function LabelWithCount(label, count)
    return tostring(label or "Unknown") .. " |cff888888(" .. tostring(count or 0) .. ")|r"
end

function Gallery.GetCategoryFilterCount(categoryKey)
    if not Gallery.sidebarCountCache then
        Gallery.RebuildSidebarCountCache()
    end
    local cache = Gallery.sidebarCountCache
    if not categoryKey or categoryKey == "all" then
        return cache.categories.all or #(Gallery.items or {})
    end
    return cache.categories[categoryKey] or 0
end

function Gallery.GetFilterCount(optionType, optionKey)
    if not Gallery.sidebarCountCache then
        Gallery.RebuildSidebarCountCache()
    end
    local cache = Gallery.sidebarCountCache
    if optionType == "toggle" then
        return cache.collection[optionKey] or 0
    elseif optionType == "source" then
        return cache.sources[optionKey] or 0
    end
    return 0
end

function Gallery.CreateSidebarSection(parent, sectionKey, title, yOffset, collapsed)
    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", GallerySidebarSizing.SectionHorizontalInset, yOffset)
    header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -GallerySidebarSizing.SectionHorizontalInset, yOffset)
    header:SetHeight(GallerySidebarSizing.SectionHeight)
    
    header.bg = header:CreateTexture(nil, "BACKGROUND")
    header.bg:SetAllPoints()
    header.bg:SetColorTexture(0, 0, 0, 0)
    
    header.text = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.text:SetPoint("LEFT", header, "LEFT", 0, 0)
    header.text:SetText("|cffffd100" .. title .. "|r")
    
    header.arrow = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.arrow:SetPoint("RIGHT", header, "RIGHT", -GallerySidebarSizing.SectionArrowRightInset, 0)
    header.arrow:SetText(collapsed and "|cffffd100+|r" or "|cffffd100-|r")
    
    header.line = header:CreateTexture(nil, "ARTWORK")
    header.line:SetColorTexture(1, 0.82, 0, 0.45)
    header.line:SetHeight(GallerySidebarSizing.SectionDividerHeight)
    header.line:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 0, -GallerySidebarSizing.SectionDividerBottomOffset)
    header.line:SetPoint("BOTTOMRIGHT", header, "BOTTOMRIGHT", 0, -GallerySidebarSizing.SectionDividerBottomOffset)

    header:SetScript("OnEnter", function(self)
        self.bg:SetColorTexture(1, 0.82, 0, 0.08)
        self.text:SetText("|cffffffff" .. title .. "|r")
    end)
    header:SetScript("OnLeave", function(self)
        self.bg:SetColorTexture(0, 0, 0, 0)
        self.text:SetText("|cffffd100" .. title .. "|r")
    end)
    header:SetScript("OnClick", function()
        Gallery.collapsedFilterSections = Gallery.collapsedFilterSections or {}
        Gallery.collapsedFilterSections[sectionKey] = not Gallery.collapsedFilterSections[sectionKey]
        if Gallery.frame and Gallery.frame.sidebar and Gallery.frame.sidebar.filterContent then
            Gallery.BuildSidebarContent(Gallery.frame.sidebar.filterContent)
        end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)
    return yOffset - GallerySidebarSizing.SectionAdvance
end

function Gallery.CreateSidebarCheckbox(parent, yOffset, labelText, checked, onClick, color)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check:SetSize(GallerySidebarSizing.CheckboxSize, GallerySidebarSizing.CheckboxSize)
    check:SetPoint("TOPLEFT", parent, "TOPLEFT", GallerySidebarSizing.CheckboxLeftInset, yOffset + GallerySidebarSizing.CheckboxTopAdjustment)
    check:SetChecked(checked)

    check.label = check:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    check.label:SetPoint("LEFT", check, "RIGHT", GallerySidebarSizing.CheckboxLabelGap, 0)
    check.label:SetWidth(GallerySidebarSizing.CheckboxLabelWidth)
    check.label:SetJustifyH("LEFT")
    check.label:SetText(labelText)
    
    if color then
        check.label:SetTextColor(color[1], color[2], color[3], 1)
    else
        check.label:SetTextColor(0.82, 0.82, 0.82, 1)
    end

    check:SetScript("OnClick", function(self)
        if onClick then
            onClick(self:GetChecked() and true or false)
        end
    end)
    return yOffset - GallerySidebarSizing.CheckboxAdvance, check
end

function Gallery.BuildCategoryCheckboxes(parent, yOffset)
    Gallery.filters.categories = Gallery.filters.categories or {}
    Gallery.collapsedFilterSections = Gallery.collapsedFilterSections or {}
    local sectionKey = "categories"
    if Gallery.collapsedFilterSections[sectionKey] == nil then
        Gallery.collapsedFilterSections[sectionKey] = false
    end
    local collapsed = Gallery.collapsedFilterSections[sectionKey]
    yOffset = Gallery.CreateSidebarSection(parent, sectionKey, "Categories", yOffset, collapsed)
    if collapsed then
        return yOffset - GallerySidebarSizing.SectionContentGap
    end
    if Gallery.BuildCategoryList then
        Gallery.BuildCategoryList()
    end
    for _, category in ipairs(Gallery.categoryList or {}) do
        local categoryKey = category.key
        local isAll = categoryKey == "all"
        local checked
        if isAll then
            checked = not Gallery.HasSelectedCategories or not Gallery.HasSelectedCategories()
        else
            checked = Gallery.filters.categories[categoryKey] == true
        end
        local count = Gallery.GetCategoryFilterCount(categoryKey)
        local name = category.name or "Unknown"
        local categoryColors = C.LabelColors and C.LabelColors.GalleryCategories
        local labelName
        if isAll then
            labelName = ColorLabel("All", categoryColors, "all")
        else
            labelName = ColorLabel(name, categoryColors, name)
        end
        local label = LabelWithCount(labelName, count)
        yOffset = Gallery.CreateSidebarCheckbox(
            parent,
            yOffset,
            label,
            checked,
            function(isChecked)
                Gallery.filters.categories = Gallery.filters.categories or {}
                if categoryKey == "all" then
                    wipe(Gallery.filters.categories)
                    Gallery.filters.category = "all"
                else
                    Gallery.filters.categories[categoryKey] = isChecked and true or nil
                    Gallery.filters.category = "all"
                end
                if Gallery.frame and Gallery.frame.scroll then
                    Gallery.frame.scroll:SetVerticalScroll(0)
                end
                if Gallery.RefreshGrid then
                    Gallery.RefreshGrid()
                end
            end
        )
    end
    return yOffset - GallerySidebarSizing.SectionContentGap
end

function Gallery.BuildFilterSections(parent, yOffset)
    Gallery.collapsedFilterSections = Gallery.collapsedFilterSections or {}
    for _, section in ipairs(FILTER_SECTION_DEFS or {}) do
        local sectionKey = section.key or section.title
        if Gallery.collapsedFilterSections[sectionKey] == nil then
            Gallery.collapsedFilterSections[sectionKey] = section.defaultCollapsed == true
        end
        local collapsed = Gallery.collapsedFilterSections[sectionKey]
        yOffset = Gallery.CreateSidebarSection(parent, sectionKey, section.title, yOffset, collapsed)
        if not collapsed then
            for _, option in ipairs(section.options or {}) do
                local checked = false
                if option.type == "toggle" then
                    checked = Gallery.filters[option.key] ~= false
                elseif option.type == "source" then
                    Gallery.filters.sources = Gallery.filters.sources or {}
                    checked = Gallery.filters.sources[option.key] == true
                end
                local count = Gallery.GetFilterCount(option.type, option.key)
                local shouldDraw = true
                if option.hideWhenZero and count <= 0 then
                    shouldDraw = false
                end
                if shouldDraw and option.devOnly then
                    shouldDraw = Gallery.debugMode == true or Gallery.showUnreleasedFilters == true or Gallery.showDevFilters == true
                end
                if shouldDraw then
                    local labelName = option.label
                    if option.type == "toggle" then
                        local collectionColors = C.LabelColors and C.LabelColors.Collection
                        local colorKey = option.key
                        if option.key == "showCollected" then
                            colorKey = "collected"
                        elseif option.key == "showNotCollected" then
                            colorKey = "notCollected"
                        end
                        labelName = ColorLabel(option.label, collectionColors, colorKey)
                    elseif option.type == "source" then
                        local sourceColors = C.LabelColors and C.LabelColors.Sources
                        labelName = ColorLabel(option.label, sourceColors, option.key)
                    end
                    local label = LabelWithCount(labelName, count)
                    yOffset = Gallery.CreateSidebarCheckbox(
                        parent,
                        yOffset,
                        label,
                        checked,
                        function(isChecked)
                            if option.type == "toggle" then
                                Gallery.filters[option.key] = isChecked
                                if Gallery.filters.showCollected == false and Gallery.filters.showNotCollected == false then
                                    Gallery.filters.showCollected = true
                                    Gallery.filters.showNotCollected = true
                                end
                            elseif option.type == "source" then
                                Gallery.filters.sources = Gallery.filters.sources or {}
                                Gallery.filters.sources[option.key] = isChecked and true or false
                            end
                            RefreshGridFromSidebar()
                        end
                    )
                end
            end
            yOffset = yOffset - GallerySidebarSizing.SectionContentGap
        end
    end
    return yOffset
end

function Gallery.BuildSidebarContent(parent)
    if not parent then return end
    ClearFrameChildren(parent)
    if Gallery.BuildCategoryList then
        Gallery.BuildCategoryList()
    end
    Gallery.RebuildSidebarCountCache()
    local yOffset = GallerySidebarSizing.ContentStartY
    yOffset = Gallery.BuildCategoryCheckboxes(parent, yOffset)
    yOffset = Gallery.BuildFilterSections(parent, yOffset)
    parent:SetHeight(math.abs(yOffset) + GallerySidebarSizing.ContentBottomPadding)
end

function Gallery.CreateSidebar(frame)
    local sidebarWidth = GalleryFrameSizing.SidebarWidth
    local sidebar = CreateFrame("Frame", "DecorVendorGallerySidebar", frame, "BackdropTemplate")
    sidebar:SetPoint("TOPLEFT", frame, "TOPLEFT", GallerySidebarSizing.GallerySidebarSizingLeftInset or 8, -GallerySidebarSizing.FrameTopOffset)
    sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", GallerySidebarSizing.GallerySidebarSizingLeftInset or 8, GallerySidebarSizing.FrameBottomInset)
    sidebar:SetWidth(sidebarWidth)
    sidebar:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8"})
    sidebar:SetBackdropColor(0.04, 0.04, 0.06, 1)
    frame.sidebar = sidebar

    local content = CreateFrame("Frame", "DecorVendorGallerySidebarContent", sidebar)
    content:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 0, -GallerySidebarSizing.ContentTopInset)
    content:SetPoint("TOPRIGHT", sidebar, "TOPRIGHT", -GallerySidebarSizing.ContentRightInset, -GallerySidebarSizing.ContentTopInset)
    content:SetPoint("BOTTOMRIGHT", sidebar, "BOTTOMRIGHT", -GallerySidebarSizing.ContentRightInset, GallerySidebarSizing.ContentBottomReserve)
    content:SetWidth(sidebarWidth - GallerySidebarSizing.ContentWidthPadding)
    
    if content.SetClipsChildren then
        content:SetClipsChildren(true)
    end
    
    sidebar.filterContent = content
    sidebar.filtersContainer = content

    sidebar.help = sidebar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    sidebar.help:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMLEFT", GallerySidebarSizing.HelpLeftInset, GallerySidebarSizing.HelpBottomInset)
    sidebar.help:SetWidth(GallerySidebarSizing.HelpWidth)
    sidebar.help:SetJustifyH("LEFT")
    sidebar.help:SetTextColor(0.72, 0.72, 0.72)
    sidebar.help:SetText("Left-click to preview.\nRight-click vendor decor to\nset a waypoint.")
    
    Gallery.BuildSidebarContent(content)
end

function Gallery.BuildCategorySidebar(frame)
    if frame and frame.sidebar and frame.sidebar.filterContent then
        Gallery.BuildSidebarContent(frame.sidebar.filterContent)
    end
end

function Gallery.RefreshCategorySidebar()
    if Gallery.frame and Gallery.frame.sidebar and Gallery.frame.sidebar.filterContent then
        Gallery.BuildSidebarContent(Gallery.frame.sidebar.filterContent)
    end
end

--------------------------------------------------------------------------------
-- SECTION 3: GALLERY PREVIEW & 3D INSPECTOR CANVAS
--------------------------------------------------------------------------------
local GalleryPreviewSizing = C.GalleryPreviewSizing
local GalleryFrameSizing = C.GalleryFrameSizing
local SourceActions = C.SOURCE_ACTIONS or {}

local DEFAULT_SCENE_ID = tonumber(C.GALLERY_DEFAULT_DECOR_SCENE_ID)

function Gallery.CreatePreview(frame)
    local preview = CreateFrame("Frame", "DecorVendorGalleryPreview", frame, "BackdropTemplate")
    preview:SetWidth(GalleryFrameSizing.DetailPanelWidth)

    preview:SetPoint(
        "TOPRIGHT",
        frame,
        "TOPRIGHT",
        -GalleryPreviewSizing.FrameInset,
        -(GalleryFrameSizing.TitleBarHeight + GalleryPreviewSizing.TitleBarGap)
    )

    preview:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -GalleryPreviewSizing.FrameInset, GalleryPreviewSizing.FrameBottomInset)
    preview:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8"})
    preview:SetBackdropColor(0.05, 0.05, 0.07, 1)

    frame.preview = preview

    preview.modelBox = CreateFrame("Frame", nil, preview)
    preview.modelBox:SetHeight(GalleryFrameSizing.ModelViewerHeight)
    preview.modelBox:SetPoint("TOPLEFT", preview, "TOPLEFT", GalleryPreviewSizing.ModelBoxInset, -GalleryPreviewSizing.ModelBoxInset)
    preview.modelBox:SetPoint("TOPRIGHT", preview, "TOPRIGHT", -GalleryPreviewSizing.ModelBoxInset, -GalleryPreviewSizing.ModelBoxInset)

    preview.modelBg = preview.modelBox:CreateTexture(nil, "BACKGROUND")
    preview.modelBg:SetAllPoints()
    preview.modelBg:SetAtlas("catalog-list-preview-bg")

    preview.modelScene = CreateFrame("ModelScene", nil, preview.modelBox, "PanningModelSceneMixinTemplate")
    preview.modelScene:SetPoint("TOPLEFT", preview.modelBox, "TOPLEFT", GalleryPreviewSizing.ModelSceneInset, -GalleryPreviewSizing.ModelSceneInset)

    preview.modelScene:SetPoint(
        "BOTTOMRIGHT",
        preview.modelBox,
        "BOTTOMRIGHT",
        -GalleryPreviewSizing.ModelSceneInset,
        GalleryPreviewSizing.ModelSceneInset
    )
    preview.modelScene:EnableMouse(true)
    preview.modelScene:EnableMouseWheel(true)

    local dragLastX, dragLastY = nil, nil

    preview.modelScene:HookScript(
        "OnMouseDown",
        function(self, button)
            if button == "LeftButton" then
                dragLastX, dragLastY = GetCursorPosition()
            end
        end
    )

    preview.modelScene:HookScript(
        "OnMouseUp",
        function(self, button)
            if button == "LeftButton" then
                dragLastX, dragLastY = nil, nil
            end
        end
    )

    preview.modelScene:HookScript(
        "OnUpdate",
        function(self)
            if dragLastX and dragLastY then
                local x, y = GetCursorPosition()
                local dx = (x - dragLastX) * 0.02
                local dy = (y - dragLastY) * 0.02

                dragLastX, dragLastY = x, y

                local actor = self:GetActorByTag("decor")

                if actor then
                    actor:SetYaw((actor:GetYaw() or 0) + dx)
                    actor:SetPitch((actor:GetPitch() or 0) - dy)
                end
            end
        end
    )

    preview.controls = CreateFrame("Frame", nil, preview.modelBox, "ModelSceneControlFrameTemplate")
    preview.controls:SetPoint("BOTTOM", preview.modelBg, "BOTTOM", 0, GalleryPreviewSizing.ModelControlsBottomInset)
    preview.controls:SetModelScene(preview.modelScene)

    preview.corbelLeft = preview.modelBox:CreateTexture(nil, "OVERLAY")
    preview.corbelLeft:SetAtlas("catalog-corbel-bottom-left")
    preview.corbelLeft:SetSize(GalleryPreviewSizing.CorbelWidth, GalleryPreviewSizing.CorbelHeight)
    preview.corbelLeft:SetPoint("BOTTOMLEFT", preview.modelBox, "BOTTOMLEFT", 0, 0)

    preview.corbelRight = preview.modelBox:CreateTexture(nil, "OVERLAY")
    preview.corbelRight:SetAtlas("catalog-corbel-bottom-right")
    preview.corbelRight:SetSize(GalleryPreviewSizing.CorbelWidth, GalleryPreviewSizing.CorbelHeight)
    preview.corbelRight:SetPoint("BOTTOMRIGHT", preview.modelBox, "BOTTOMRIGHT", 0, 0)

    -- Watermark / fallback icon
    preview.watermarkFrame = CreateFrame("Frame", nil, preview)
    preview.watermarkFrame:SetPoint("TOPLEFT", preview.modelBg, "TOPLEFT", 0, 0)
    preview.watermarkFrame:SetPoint("BOTTOMRIGHT", preview.modelBg, "BOTTOMRIGHT", 0, 0)
    preview.watermarkFrame:SetFrameStrata("HIGH")

    preview.watermark = preview.watermarkFrame:CreateTexture(nil, "ARTWORK")
    preview.watermark:SetSize(GalleryPreviewSizing.WatermarkSize, GalleryPreviewSizing.WatermarkSize)
    preview.watermark:SetPoint("CENTER", preview.watermarkFrame, "CENTER", 0, 0)
    preview.watermark:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga")
    preview.watermark:SetAlpha(GalleryPreviewSizing.WatermarkAlpha)

    preview.watermarkText = preview.watermarkFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    preview.watermarkText:SetFont(STANDARD_TEXT_FONT, GalleryPreviewSizing.WatermarkTextFontSize, "OUTLINE")
    preview.watermarkText:SetPoint("CENTER", preview.watermarkFrame, "CENTER", 0, 0)
    preview.watermarkText:SetWidth(GalleryPreviewSizing.WatermarkTextWidth)
    preview.watermarkText:SetJustifyH("CENTER")
    preview.watermarkText:SetTextColor(1, 0.25, 0.25)
    preview.watermarkText:SetText("")

    preview.watermarkFrame:Show()

    preview.name = preview:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    preview.name:SetPoint("TOP", preview.modelBox, "BOTTOM", 0, -GalleryPreviewSizing.NameTopGap)
    preview.name:SetWidth(GalleryPreviewSizing.DetailTextWidth)
    preview.name:SetHeight(GalleryPreviewSizing.NameHeight)
    preview.name:SetJustifyH("CENTER")
    preview.name:SetJustifyV("TOP")
    preview.name:SetWordWrap(true)

    preview.status = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    preview.status:SetPoint("TOP", preview.name, "BOTTOM", 0, -GalleryPreviewSizing.StatusTopGap)
    preview.status:SetWidth(GalleryPreviewSizing.DetailTextWidth)
    preview.status:SetHeight(GalleryPreviewSizing.StatusHeight)
    preview.status:SetJustifyH("CENTER")
    preview.status:SetText("|cffaaaaaaNo Decor Selected|r")

    preview.statsText = preview:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    local statsText = preview.statsText
    statsText:SetPoint("TOP", preview.status, "BOTTOM", 0, -GalleryPreviewSizing.StatsTopGap)
    statsText:SetWidth(GalleryPreviewSizing.StatsWidth)
    statsText:SetHeight(GalleryPreviewSizing.StatsHeight)
    statsText:SetFont(STANDARD_TEXT_FONT, GalleryPreviewSizing.StatsFontSize, "OUTLINE")
    statsText:SetJustifyH("CENTER")
    statsText:SetJustifyV("MIDDLE")
    statsText:SetWordWrap(false)
    statsText:SetTextColor(0.9, 0.9, 0.9)
    statsText:SetText("")

    preview.sourceHeader = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    preview.sourceHeader:SetPoint(
        "TOPLEFT",
        statsText,
        "BOTTOMLEFT",
        GalleryPreviewSizing.SourceHeaderLeftInset,
        -GalleryPreviewSizing.SourceHeaderTopGap
    )
    preview.sourceHeader:SetText("|cffffd100SOURCE|r")

    preview.sourceLine = preview:CreateTexture(nil, "ARTWORK")
    preview.sourceLine:SetColorTexture(0.85, 0.65, 0.2, 0.85)
    preview.sourceLine:SetPoint("TOPLEFT", preview.sourceHeader, "BOTTOMLEFT", 0, -GalleryPreviewSizing.SourceLineTopGap)
    preview.sourceLine:SetPoint("TOPRIGHT", preview, "TOPRIGHT", -GalleryPreviewSizing.SourceLineRightInset, 0)
    preview.sourceLine:SetHeight(GalleryPreviewSizing.SourceLineHeight)

    preview.sourceText = preview:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    preview.sourceText:SetPoint("TOPLEFT", preview.sourceLine, "BOTTOMLEFT", 0, -GalleryPreviewSizing.SourceTextTopGap)
    preview.sourceText:SetWidth(GalleryPreviewSizing.DetailTextWidth)
    preview.sourceText:SetJustifyH("LEFT")

    preview.requirementText = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    preview.requirementText:SetPoint("TOPLEFT", preview.sourceText, "BOTTOMLEFT", 0, -GalleryPreviewSizing.RequirementTopGap)
    preview.requirementText:SetWidth(GalleryPreviewSizing.DetailTextWidth)
    preview.requirementText:SetJustifyH("LEFT")
    preview.requirementText:SetTextColor(1, 0.82, 0.2)
    preview.requirementText:SetText("")

    preview.noteText = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    preview.noteText:SetPoint("TOPLEFT", preview.requirementText, "BOTTOMLEFT", 0, -GalleryPreviewSizing.NoteTopGap)
    preview.noteText:SetWidth(GalleryPreviewSizing.DetailTextWidth)
    preview.noteText:SetJustifyH("LEFT")
    preview.noteText:SetTextColor(0.85, 0.78, 0.55)
    preview.noteText:SetText("")

    preview.actionButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.actionButton:SetSize(GalleryFrameSizing.DetailPanelWidth - GalleryPreviewSizing.ButtonWidthPadding, GalleryPreviewSizing.ActionButtonHeight)
    preview.actionButton:SetPoint("BOTTOM", preview, "BOTTOM", 0, GalleryPreviewSizing.ActionButtonBottomInset)
    preview.actionButton:SetText("No Action")
    preview.actionButton:Disable()

    preview.sourceButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.sourceButton:SetSize(GalleryFrameSizing.DetailPanelWidth - GalleryPreviewSizing.ButtonWidthPadding, GalleryPreviewSizing.SecondaryButtonHeight)
    preview.sourceButton:SetPoint("BOTTOM", preview.actionButton, "TOP", 0, GalleryPreviewSizing.ButtonGap)
    preview.sourceButton:SetText("Show Source Location")
    preview.sourceButton:Hide()

    preview.achievementButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.achievementButton:SetSize(
        GalleryFrameSizing.DetailPanelWidth - GalleryPreviewSizing.ButtonWidthPadding,
        GalleryPreviewSizing.SecondaryButtonHeight
    )
    preview.achievementButton:SetPoint("BOTTOM", preview.sourceButton, "TOP", 0, GalleryPreviewSizing.ButtonGap)
    preview.achievementButton:SetText("Open Achievement")
    preview.achievementButton:Hide()
end

function Gallery.LoadDecorSceneSafe(scene, preferredID)
    if not scene or not scene.TransitionToModelSceneID then
        return nil
    end

    local sceneID = tonumber(preferredID) or DEFAULT_SCENE_ID

    local function tryScene(id)
        local ok = pcall(function()
            scene:TransitionToModelSceneID(
                id,
                CAMERA_TRANSITION_TYPE_IMMEDIATE,
                CAMERA_MODIFICATION_TYPE_DISCARD,
                true
            )
        end)
        if not ok then return nil end
        return scene:GetActorByTag("decor")
    end

    local actor = tryScene(sceneID)
    if actor then return actor end

    if sceneID ~= DEFAULT_SCENE_ID then
        pcall(function() scene:ClearScene() end)
        actor = tryScene(DEFAULT_SCENE_ID)
    end

    return actor
end

function Gallery.ShowPreviewModel(preview, item)
    if not preview or not item then return false end

    local itemData = item.data or {}
    local decorID = itemData.decorID or item.decorID
    local catalogInfo = Gallery.GetCatalogInfo and Gallery.GetCatalogInfo(decorID)

    if itemData.skip3DPreview then
        if preview.modelScene then preview.modelScene:Hide() end
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        return false
    end

    local asset = (catalogInfo and catalogInfo.asset) or itemData.asset or itemData.model3D
    asset = tonumber(asset)

    local sceneID = tonumber((catalogInfo and catalogInfo.uiModelSceneID) or itemData.uiModelSceneID) or DEFAULT_SCENE_ID

    if not asset or asset <= 0 then return false end

    local scene = preview.modelScene
    if not scene then return false end

    if preview.watermarkFrame then preview.watermarkFrame:Hide() end
    scene:Show()

    if preview.controls then preview.controls:Show() end

    local actor = Gallery.LoadDecorSceneSafe(scene, sceneID)
    if not actor then
        scene:Hide()
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        return false
    end

    actor:SetPreferModelCollisionBounds(true)

    local ok = pcall(function()
        actor:SetModelByFileID(asset)
    end)

    if not ok then
        scene:Hide()
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        return false
    end

    if actor.SetYaw then actor:SetYaw(0) end
    if actor.SetPitch then actor:SetPitch(0) end

    if preview.watermarkFrame then preview.watermarkFrame:Hide() end
    return true
end

function Gallery.UpdatePreviewDetails(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview

    if not preview or not item then return end

    if preview.statsText then
        local statsText = (Gallery.BuildPreviewStatsText and Gallery.BuildPreviewStatsText(item)) or ""
        preview.statsText:SetText(statsText)
    end
end

function Gallery.ShowItem(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview

    if not preview or not item then return end

    local itemData = item.data or {}
    preview._currentItem = item

    local decorID = itemData.decorID or item.decorID
    local catalogInfo = Gallery.GetCatalogInfo and Gallery.GetCatalogInfo(decorID)
    local previewAsset = tonumber((catalogInfo and catalogInfo.asset) or itemData.asset or itemData.model3D)
    local hasNoModelAsset = (previewAsset == nil or previewAsset <= 0 or itemData.skip3DPreview == true)

    if hasNoModelAsset then
        local itemName = item.name or itemData.name or (Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData)) or "Unknown Decor"

        preview.name:SetText("|cffffd100" .. itemName .. "|r")

        if string.len(itemName) > GalleryPreviewSizing.LongNameThreshold then
            preview.name:SetFont(STANDARD_TEXT_FONT, GalleryPreviewSizing.LongNameFontSize, "")
        else
            preview.name:SetFont(STANDARD_TEXT_FONT, GalleryPreviewSizing.NameFontSize, "")
        end

        preview.status:SetText("|cffff4040Preview Unavailable|r")

        if preview.modelScene then preview.modelScene:Hide() end
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        if preview.watermarkText then preview.watermarkText:SetText("") end

        if preview.requirementText then
            preview.requirementText:SetText("")
            preview.requirementText:Hide()
        end

        if preview.noteText then
            preview.noteText:SetText("")
            preview.noteText:Hide()
        end

        if Gallery.UpdatePreviewDetails then
            Gallery.UpdatePreviewDetails(item)
        elseif preview.statsText then
            preview.statsText:SetText("")
        end

        if preview.sourceButton then preview.sourceButton:Hide() end
        if preview.achievementButton then preview.achievementButton:Hide() end

        if preview.actionButton then
            preview.actionButton:SetText("Open Housing Catalogue Link")
            preview.actionButton:Enable()
            preview.actionButton:SetAlpha(1)
            preview.actionButton:SetScript("OnClick", function()
                if C_Housing and C_Housing.OpenToDecorID then
                    local targetDecor = itemData.decorID or item.decorID or 0
                    C_Housing.OpenToDecorID(targetDecor)
                else
                    print("|cffff4040Decor Vendor Gallery:|r Housing Catalogue API is unavailable.")
                end
            end)
        end

        local sourceText = "Unknown"
        if Gallery.BuildPreviewSourceText then
            sourceText = Gallery.BuildPreviewSourceText(item)
        elseif Gallery.GetSourceTextForItem then
            sourceText = Gallery.GetSourceTextForItem(item)
        end

        preview.sourceText:SetText(
            (sourceText or "Unknown") ..
            "\n\n|cffff4040* 3D data files are missing from this game patch. Click the button below to view via the official Catalogue.*|r"
        )
        preview.sourceText:SetTextColor(1, 1, 1, 1)
        return
    end

    local itemName = item.name or itemData.name or (Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData)) or "Unknown Decor"
    preview.name:SetText("|cffffd100" .. itemName .. "|r")

    if string.len(itemName or "") > GalleryPreviewSizing.LongNameThreshold then
        preview.name:SetFont(STANDARD_TEXT_FONT, GalleryPreviewSizing.LongNameFontSize, "")
    else
        preview.name:SetFont(STANDARD_TEXT_FONT, GalleryPreviewSizing.NameFontSize, "")
    end

    local collected = item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID)) or false
    if collected then
        preview.status:SetText("|cff00ff00Collected|r")
    else
        preview.status:SetText("|cffff4040Not Collected|r")
    end

    local modelShown = Gallery.ShowPreviewModel and Gallery.ShowPreviewModel(preview, item)

    if modelShown then
        if preview.watermarkFrame then preview.watermarkFrame:Hide() end
        if preview.watermarkText then preview.watermarkText:SetText("") end
    else
        if preview.modelScene then preview.modelScene:Hide() end
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then
            if preview.watermarkText then
                if itemData and itemData.skip3DPreview then
                    preview.watermarkText:SetText("NO PREVIEW AVAILABLE\n|cfff5ebd1(Asset missing from game files)|r")
                else
                    preview.watermarkText:SetText("")
                end
            end
            preview.watermarkFrame:Show()
        end
    end

    local requirementText = nil
    local itemDetails = Gallery.GetItemDetailsForItem and Gallery.GetItemDetailsForItem(item) or {}
    local vendorDetails = Gallery.GetVendorDetailsForItem and Gallery.GetVendorDetailsForItem(item)
    local hasVendorDetails = itemData.soldBy or itemData.vendorID or (type(vendorDetails) == "table" and next(vendorDetails) ~= nil)

    if not hasVendorDetails then
        local requirement = itemDetails.requirement or itemDetails.requires or itemData.requirement or itemData.requires
        if requirement and Gallery.FormatRequirement then
            requirementText = Gallery.FormatRequirement(requirement)
        elseif type(requirement) == "string" then
            requirementText = requirement
        end
    end

    if preview.requirementText then
        if requirementText and requirementText ~= "" then
            preview.requirementText:SetText("|cffffd100Requirement:|r\n" .. requirementText)
            preview.requirementText:Show()
        else
            preview.requirementText:SetText("")
            preview.requirementText:Hide()
        end
    end

    if preview.noteText then
        preview.noteText:SetText("")
        preview.noteText:Hide()
    end

    if Gallery.UpdatePreviewDetails then
        Gallery.UpdatePreviewDetails(item)
    end

    local sourceText
    if Gallery.BuildPreviewSourceText then
        sourceText = Gallery.BuildPreviewSourceText(item)
    elseif Gallery.GetSourceTextForItem then
        sourceText = Gallery.GetSourceTextForItem(item)
    else
        sourceText = "Unknown"
    end

    sourceText = sourceText or "Unknown"

    if not Gallery.BuildPreviewSourceText then
        local achievementText = Gallery.GetAchievementSourceText and Gallery.GetAchievementSourceText(item)
        if achievementText then sourceText = sourceText .. "\n\n" .. achievementText end

        local vendors = Gallery.GetVendorNamesFromItem and Gallery.GetVendorNamesFromItem(itemData)
        if vendors then sourceText = sourceText .. "\n\n|cff80ff80Sold by:|r " .. vendors end

        if itemData.questName then
            sourceText = sourceText .. "\n|cff80ff80Quest:|r " .. itemData.questName
        elseif itemData.questID then
            sourceText = sourceText .. "\n|cff80ff80Quest ID:|r " .. tostring(itemData.questID)
        end

        if itemData.bossName then
            sourceText = sourceText .. "\n|cff80ff80Boss:|r " .. itemData.bossName
        elseif itemData.bossevent then
            sourceText = sourceText .. "\n|cff80ff80Event:|r " .. tostring(itemData.bossevent)
        elseif itemData.bossencounter then
            sourceText = sourceText .. "\n|cff80ff80Boss Encounter:|r " .. tostring(itemData.bossencounter)
        end

        if itemData.profession then
            sourceText = sourceText .. "\n|cff80ff80Profession:|r " .. tostring(itemData.profession)
        end
    end

    preview.sourceText:SetText(sourceText)
    preview.sourceText:SetTextColor(1, 1, 1, 1)

    if Gallery.UpdateActionButton then
        Gallery.UpdateActionButton(item)
    end

    if itemData.skip3DPreview then
        preview.actionButton:SetText("Open Housing Catalogue")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        local targetItemID = item.itemID or itemData.itemID or 0

        preview.actionButton:SetScript("OnClick", function(self, button)
            if button == "LeftButton" and targetItemID > 0 then
                DressUpItemLink("item:" .. tostring(targetItemID))
            else
                print("|cffff4040Decor Vendor Gallery:|r Missing itemID for dress-up fallback.")
            end
        end)
        return
    end

    if Gallery.UpdateAchievementButton then
        Gallery.UpdateAchievementButton(item)
    end
end

local function RunPreviewAction(item, specialAction)
    if not item then return false end

    if specialAction and specialAction.type == "map" then
        if Gallery.TrySetVendorWaypoint then
            return Gallery.TrySetVendorWaypoint(item)
        end
        print("|cffff4040Decor Vendor Gallery:|r The waypoint function is unavailable.")
        return false
    end

    if Gallery.RunSpecialItemAction then
        return Gallery.RunSpecialItemAction(item)
    end

    print("|cffff4040Decor Vendor Gallery:|r No action handler is available.")
    return false
end

function Gallery.UpdateActionButton(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview

    if not preview or not preview.actionButton then return end

    preview.actionButton:SetScript("OnClick", nil)
    preview.actionButton:Disable()
    preview.actionButton:SetAlpha(0.55)
    preview.actionButton:SetText("No Action")

    if preview.sourceButton then
        preview.sourceButton:SetScript("OnClick", nil)
        preview.sourceButton:Disable()
        preview.sourceButton:SetAlpha(0.55)
        preview.sourceButton:SetText("Show Source Location")
        preview.sourceButton:Hide()
    end

    if preview.achievementButton then
        preview.achievementButton:SetScript("OnClick", nil)
        preview.achievementButton:Disable()
        preview.achievementButton:SetAlpha(0.55)
        preview.achievementButton:SetText("Open Achievement")
        preview.achievementButton:Hide()
    end

    if not item then return end

    local itemData = item.data or {}

    local function NormalizeSource(value)
        if Gallery.NormalizeSource then return Gallery.NormalizeSource(value) end
        return string.lower(tostring(value or ""))
    end

    local function HasSource(sourceKey)
        sourceKey = NormalizeSource(sourceKey)
        if Gallery.ItemHasSource and Gallery.ItemHasSource(item, sourceKey) then return true end
        if NormalizeSource(item.source) == sourceKey or NormalizeSource(item.sourceType) == sourceKey then return true end
        if NormalizeSource(itemData.source) == sourceKey or NormalizeSource(itemData.sourceType) == sourceKey then return true end

        local sources = item.sources or item.sourceTypes or itemData.sources or itemData.sourceTypes
        if type(sources) == "table" then
            for key, value in pairs(sources) do
                if value == true and NormalizeSource(key) == sourceKey then return true end
                if NormalizeSource(value) == sourceKey then return true end
            end
        end
        return false
    end

    local specialAction = Gallery.GetSpecialActionForItem and Gallery.GetSpecialActionForItem(item)
    local achievementInfo = Gallery.GetAchievementForItem and Gallery.GetAchievementForItem(item)
    local bestVendor = Gallery.GetBestFactionVendorForItem and Gallery.GetBestFactionVendorForItem(item)
    local vendors = Gallery.GetVendorsForItem and Gallery.GetVendorsForItem(item) or {}

    if not specialAction and type(vendors) == "table" then
        for _, vendor in ipairs(vendors) do
            local actionKey = vendor.sourceAction or vendor.mapAction or vendor.locationAction or vendor.rareEvent or vendor.eventName

            if not actionKey and vendor.id and DVD.npcs then
                local exactVendor = DVD.npcs[tonumber(vendor.id)] or DVD.npcs[tostring(vendor.id)]
                if type(exactVendor) == "table" then
                    actionKey = exactVendor.sourceAction or exactVendor.mapAction or exactVendor.locationAction or exactVendor.rareEvent or exactVendor.eventName
                end
            end

            local action = actionKey and SourceActions[actionKey]
            if type(action) == "table" then
                if action.type == "map" then
                    local locations = {}
                    if type(action.locations) == "table" then
                        for _, loc in ipairs(action.locations) do
                            if type(loc) == "table" then
                                local mapID = loc.mapID or action.mapID
                                if mapID and loc.x and loc.y then
                                    table.insert(locations, {
                                        mapID = mapID,
                                        x = loc.x,
                                        y = loc.y,
                                        title = loc.title or loc.name or action.label or actionKey,
                                        zone = loc.zone or action.zone
                                    })
                                end
                            end
                        end
                    end
                    if #locations > 0 then
                        specialAction = {
                            type = "map",
                            title = action.label or actionKey,
                            locations = locations,
                            openMapID = action.openMapID or action.parentMapID or action.mapID
                        }
                        break
                    end
                elseif action.type == "worldmap" and action.mapID then
                    specialAction = {
                        type = "worldmap",
                        mapID = action.mapID,
                        title = action.label or actionKey
                    }
                    break
                elseif action.type == "journal" then
                    specialAction = action
                    break
                end
            end
        end
    end

    local hasVendorPath = bestVendor or #vendors > 0
    local hasShopPath = HasSource("shop")

    if achievementInfo and achievementInfo.id and preview.achievementButton then
        preview.achievementButton:SetText("Open Achievement")
        preview.achievementButton:Show()
        preview.achievementButton:Enable()
        preview.achievementButton:SetAlpha(1)
        preview.achievementButton:SetScript("OnClick", function()
            if Gallery.OpenAchievementByID then
                Gallery.OpenAchievementByID(achievementInfo.id)
                return
            end
            if AchievementFrame_LoadUI then AchievementFrame_LoadUI() end
            if AchievementFrame_ToggleAchievementFrame then AchievementFrame_ToggleAchievementFrame() end
            if AchievementFrame_SelectAchievement then AchievementFrame_SelectAchievement(achievementInfo.id) end
        end)
    end

    if specialAction and preview.sourceButton and (bestVendor or hasShopPath) then
        if specialAction.type == "journal" then
            preview.sourceButton:SetText("Open Source Journal")
        elseif specialAction.type == "map" then
            local count = specialAction.locations and #specialAction.locations or 0
            preview.sourceButton:SetText(count > 1 and "Pin Source Locations" or "Show Source Location")
        elseif specialAction.type == "worldmap" then
            preview.sourceButton:SetText("Open Source Map")
        else
            preview.sourceButton:SetText("Open Source")
        end

        preview.sourceButton:Show()
        preview.sourceButton:Enable()
        preview.sourceButton:SetAlpha(1)
        preview.sourceButton:SetScript("OnClick", function()
            RunPreviewAction(item, specialAction)
        end)
    end

    if hasShopPath then
        preview.actionButton:SetText("Open Shop Manually")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        preview.actionButton:SetScript("OnClick", function()
            print("|cffb86cffDecor Vendor Gallery:|r This decoration is sold through the in-game shop. Click the |cffffd100Shop|r button on Blizzard's micro menu to open it.")
        end)
        return
    end

    if bestVendor then
        preview.actionButton:SetText("Navigate (" .. (bestVendor.title or bestVendor.name or "Vendor") .. ")")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        preview.actionButton:SetScript("OnClick", function()
            if Gallery.SetWaypointToVendor then
                local itemName = (Gallery.GetItemName and Gallery.GetItemName(item.itemID, item.data)) or item.name or itemData.name or "Decor"
                Gallery.SetWaypointToVendor(bestVendor, itemName)
            end
        end)
        return
    end

    if specialAction then
        if specialAction.type == "journal" then
            preview.actionButton:SetText("Open Encounter Journal")
        elseif specialAction.type == "map" then
            local count = specialAction.locations and #specialAction.locations or 0
            preview.actionButton:SetText(count > 1 and "Pin Locations" or "Show Location")
        elseif specialAction.type == "worldmap" then
            preview.actionButton:SetText("Open Map")
        else
            preview.actionButton:SetText("Open Source")
        end

        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        preview.actionButton:SetScript("OnClick", function()
            RunPreviewAction(item, specialAction)
        end)
        return
    end

    if #vendors > 0 then
        preview.actionButton:SetText("Location Varies")
        preview.actionButton:Disable()
        preview.actionButton:SetAlpha(0.55)
        preview.actionButton:SetScript("OnClick", nil)
        return
    end

    local achievementID = itemData.achievementID or item.achievementID or itemData.vendorUnlockAchievementID or item.vendorUnlockAchievementID or (achievementInfo and achievementInfo.id)

    if achievementID then
        preview.actionButton:SetText("Open Achievement")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        preview.actionButton:SetScript("OnClick", function()
            if Gallery.OpenAchievementByID then
                Gallery.OpenAchievementByID(achievementID)
                return
            end
            if AchievementFrame_LoadUI then AchievementFrame_LoadUI() end
            if AchievementFrame_ToggleAchievementFrame then AchievementFrame_ToggleAchievementFrame() end
            if AchievementFrame_SelectAchievement then AchievementFrame_SelectAchievement(achievementID) end
        end)
        return
    end
end

--------------------------------------------------------------------------------
-- SECTION 4: GALLERY GRID VIEWPORT & ITEM CARDS COMPILER
--------------------------------------------------------------------------------
local GalleryGridSizing = C.GalleryGridSizing
local GalleryFrameSizing = C.GalleryFrameSizing

Gallery.cards = Gallery.cards or {}

local function GetSelectedSourceSummary()
    local selectedSources = {}
    local filters = Gallery.filters or {}
    local sourceFilters = filters.sources or {}

    for sourceKey, isSelected in pairs(sourceFilters) do
        if isSelected then
            local label = Gallery.GetSourceLabel and Gallery.GetSourceLabel(sourceKey) or tostring(sourceKey)
            table.insert(selectedSources, tostring(label))
        end
    end

    if #selectedSources == 0 then
        return "All"
    end

    table.sort(selectedSources)
    return table.concat(selectedSources, ", ")
end

function Gallery.CreateGrid(frame)
    if not frame or not frame.sidebar then return end

    local detailWidth = GalleryFrameSizing.DetailPanelWidth
    local bottomHeight = GalleryFrameSizing.BottomBarHeight

    local scroll = CreateFrame("ScrollFrame", "DecorVendorGalleryScrollFrame", frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", frame.sidebar, "TOPRIGHT", GalleryGridSizing.ScrollLeftGap, GalleryGridSizing.ScrollTopOffset)
    scroll:SetPoint(
        "BOTTOMRIGHT",
        frame,
        "BOTTOMRIGHT",
        -(detailWidth + GalleryGridSizing.ScrollRightExtraReserve),
        bottomHeight + GalleryGridSizing.ScrollBottomGap
    )

    local child = CreateFrame("Frame", nil, scroll)
    child:SetSize(GalleryGridSizing.InitialChildSize, GalleryGridSizing.InitialChildSize)
    scroll:SetScrollChild(child)

    frame.scroll = scroll
    frame.scrollChild = child
end

function Gallery.CreateCard(parent, item, x, y)
    if not parent or not item then return nil end

    local card = CreateFrame("Button", nil, parent)
    card:SetSize(GalleryGridSizing.CardSize, GalleryGridSizing.CardSize)
    card:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    card:SetFrameLevel(parent:GetFrameLevel() + GalleryGridSizing.CardFrameLevelOffset)

    card.slotBg = card:CreateTexture(nil, "BACKGROUND")
    card.slotBg:SetAllPoints()
    card.slotBg:SetAtlas("house-chest-list-Item-default")

    card.hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    card.hoverBg:SetAllPoints()
    card.hoverBg:SetAtlas("house-chest-list-Item-default")
    card.hoverBg:SetBlendMode("ADD")
    card.hoverBg:SetAlpha(0.65)
    card.hoverBg:Hide()

    card.icon = card:CreateTexture(nil, "ARTWORK")
    card.icon:SetPoint("TOPLEFT", card, "TOPLEFT", GalleryGridSizing.CardIconInset, -GalleryGridSizing.CardIconInset)
    card.icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -GalleryGridSizing.CardIconInset, GalleryGridSizing.CardIconInset)
    card.icon:SetTexCoord(
        GalleryGridSizing.CardIconCropMinimum,
        GalleryGridSizing.CardIconCropMaximum,
        GalleryGridSizing.CardIconCropMinimum,
        GalleryGridSizing.CardIconCropMaximum
    )

    local icon = item.icon or (Gallery.GetItemIcon and Gallery.GetItemIcon(item.itemID, item.data))
    if item.iconType == "atlas" and icon and card.icon.SetAtlas then
        card.icon:SetAtlas(icon)
    else
        card.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    end

    local collected = item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID)) or false
    card.collected = card:CreateTexture(nil, "OVERLAY")
    card.collected:SetSize(GalleryGridSizing.CollectedBadgeSize, GalleryGridSizing.CollectedBadgeSize)
    card.collected:SetPoint("TOPRIGHT", card, "TOPRIGHT", -GalleryGridSizing.CollectedBadgeInset, -GalleryGridSizing.CollectedBadgeInset)
    card.collected:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    card.collected:SetShown(collected and true or false)

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()
        local itemData = item.data or {}
        local itemName = item.name or (Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData))
        local sourceText = Gallery.GetSourceTextForItem and Gallery.GetSourceTextForItem(item) or (Gallery.GetSourceLabel and Gallery.GetSourceLabel(item.sourceType))
        local requirement = itemData.requirement or itemData.requires
        local reqText = requirement and Gallery.FormatRequirement and Gallery.FormatRequirement(requirement)
        local vendors = Gallery.GetVendorNamesFromItem and Gallery.GetVendorNamesFromItem(itemData)

        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(itemName or "Unknown Decor", 1, 0.82, 0, true)
        GameTooltip:AddLine("Housing Decor", 0.35, 0.75, 1, true)

        if sourceText and sourceText ~= "" then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Source: " .. sourceText, 0.4, 1, 0.4, true)
        end

        if vendors and vendors ~= "" then
            GameTooltip:AddLine("Sold by: " .. vendors, 0.4, 1, 0.4, true)
        end

        if reqText and reqText ~= "" then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(reqText, 1, 0.82, 0.1, true)
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Left-click: Preview", 0.7, 0.7, 0.7, true)
        GameTooltip:AddLine("Right-click: Set vendor waypoint", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    card:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if Gallery.ShowItem then Gallery.ShowItem(item) end
        elseif button == "RightButton" then
            if Gallery.TrySetVendorWaypoint then Gallery.TrySetVendorWaypoint(item) end
        end
    end)

    return card
end

function Gallery.RefreshGrid()
    local frame = Gallery.frame
    if not frame or not frame.scroll or not frame.scrollChild then return end

    if Gallery.ClearCards then Gallery.ClearCards() end
    Gallery.cards = {}

    local visibleItems = Gallery.GetVisibleItems and Gallery.GetVisibleItems() or {}
    local width = frame.scroll:GetWidth() or 0
    if width <= 0 then width = GalleryGridSizing.FallbackViewportWidth end

    local padding = GalleryGridSizing.GridPadding
    local cardSize = GalleryGridSizing.CardSize
    local columns = GalleryGridSizing.PreferredColumns
    local contentWidth = width - (padding * 2)

    local gapX = math.floor((contentWidth - (columns * cardSize)) / math.max(1, columns - 1))

    if gapX < GalleryGridSizing.MinimumHorizontalGap then
        columns = GalleryGridSizing.NarrowColumns
        gapX = GalleryGridSizing.CardGap
    end

    local gapY = GalleryGridSizing.CardGap

    for index, item in ipairs(visibleItems) do
        local col = (index - 1) % columns
        local row = math.floor((index - 1) / columns)

        local x = padding + col * (cardSize + gapX)
        local y = -padding - row * (cardSize + gapY)

        local card = Gallery.CreateCard(frame.scrollChild, item, x, y)
        if card then
            table.insert(Gallery.cards, card)
        end
    end

    local rows = math.ceil(#visibleItems / columns)
    frame.scrollChild:SetSize(
        math.max(1, width - GalleryGridSizing.ScrollChildWidthPadding),
        padding + rows * (cardSize + gapY) + GalleryGridSizing.ScrollChildBottomPadding
    )

    if frame.bottom and frame.bottom.text then
        local sourceText = GetSelectedSourceSummary()
        local availableTotal = Gallery.sidebarCountCache and Gallery.sidebarCountCache.availableTotal

        if not availableTotal then
            availableTotal = 0
            for _, item in ipairs(Gallery.items or {}) do
                if not DVD.IsDataAvailableForClient or DVD.IsDataAvailableForClient(item) then
                    availableTotal = availableTotal + 1
                end
            end
        end

        frame.bottom.text:SetText(
            string.format("|cffaaaaaaShowing %d of %d items  |  Source: %s|r", #visibleItems, availableTotal, sourceText)
        )
    end

    if Gallery.RefreshCategorySidebar then
        Gallery.RefreshCategorySidebar()
    elseif frame.sidebar and frame.sidebar.filtersContainer and Gallery.CreateSidebarFilters then
        Gallery.CreateSidebarFilters(frame.sidebar.filtersContainer)
    end
end