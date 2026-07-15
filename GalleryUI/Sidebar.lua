-- ============================================================
-- Decor Vendor Gallery
-- UI/Sidebar.lua
-- Categories + filter sidebar
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

local C = DVD.CONSTANTS or DVD.C or {}
local CatSizing = C.CatalogSizing or {}

local FILTER_SECTION_DEFS = {
    {
        key = "collection",
        title = "My Collection",
        defaultCollapsed = false,
        options = {
            {key = "showCollected", label = "Collected", type = "toggle"},
            {key = "showNotCollected", label = "Not Collected", type = "toggle"}
        }
    },
    {
        key = "source",
        title = "Source",
        defaultCollapsed = false,
        options = {
            {key = "vendor", label = "Vendor", type = "source"},
            {key = "shop", label = "Shop", type = "source"},
            {key = "quest", label = "Quest", type = "source"},
            {key = "achievement", label = "Achievement", type = "source"},
            {key = "drop", label = "Drop", type = "source"},            
            {key = "profession", label = "Profession", type = "source"},
            -- Hidden when count is 0
            {key = "catalog", label = "Housing Catalog", type = "source", hideWhenZero = true},
            {key = "other", label = "Other", type = "source", hideWhenZero = true},
            {key = "promo", label = "Twitch Promos", type = "source", hideWhenZero = true},
            {key = "collab", label = "Expired Collabs", type = "source", hideWhenZero = true},
            {key = "patch121", label = "Patch 12.1", type = "source", hideWhenZero = true},
            -- Better for dev/PTR only
            {key = "unreleased", label = "Unreleased", type = "source", devOnly = true}
        }
    }
}

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
    local children = { frame:GetChildren() }
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
            showNotCollected = 0,
        },
        sources = {},
    }
    local cache = Gallery.sidebarCountCache
    local availableTotal = 0
    for _, item in ipairs(Gallery.items or {}) do
        if DVD.IsDataAvailableForClient and not DVD.IsDataAvailableForClient(item) then
            -- Skip future/unreleased items in sidebar counts.
        else
            availableTotal = availableTotal + 1
            -- Collection counts
            local collected = item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID)) or false
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
    -- Important: this must be available items, not raw Gallery.items.
    cache.categories.all = availableTotal
    cache.availableTotal = availableTotal
end

-------------------------------------------------
-- Shared Label Color Helpers
-------------------------------------------------
local function ColorLabel(label, colorTable, key)
    if C and C.ColorizeLabel then
        return C.ColorizeLabel(label, colorTable, key)
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
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", 4, yOffset)
    header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -4, yOffset)
    header:SetHeight(20)
    header.bg = header:CreateTexture(nil, "BACKGROUND")
    header.bg:SetAllPoints()
    header.bg:SetColorTexture(0, 0, 0, 0)
    header.text = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.text:SetPoint("LEFT", header, "LEFT", 0, 0)
    header.text:SetText("|cffffd100" .. title .. "|r")
    header.arrow = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.arrow:SetPoint("RIGHT", header, "RIGHT", -4, 0)
    header.arrow:SetText(collapsed and "|cffffd100+|r" or "|cffffd100-|r")
    header.line = header:CreateTexture(nil, "ARTWORK")
    header.line:SetColorTexture(1, 0.82, 0, 0.45)
    header.line:SetHeight(1)
    header.line:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 0, -2)
    header.line:SetPoint("BOTTOMRIGHT", header, "BOTTOMRIGHT", 0, -2)
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
    return yOffset - 26
end

function Gallery.CreateSidebarCheckbox(parent, yOffset, labelText, checked, onClick, color)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check:SetSize(20, 20)
    check:SetPoint("TOPLEFT", parent, "TOPLEFT", 2, yOffset + 4)
    check:SetChecked(checked)
    check.label = check:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    check.label:SetPoint("LEFT", check, "RIGHT", 2, 0)
    check.label:SetWidth(150)
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
    return yOffset - 22, check
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
        return yOffset - 8
    end
    if Gallery.BuildCategoryList then Gallery.BuildCategoryList() end
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
        yOffset = Gallery.CreateSidebarCheckbox(parent, yOffset, label, checked, function(isChecked)
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
        end)
    end
    return yOffset - 8
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
                    yOffset = Gallery.CreateSidebarCheckbox(parent, yOffset, label, checked, function(isChecked)
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
                    end)
                end
            end
            yOffset = yOffset - 8
        end
    end
    return yOffset
end

function Gallery.BuildSidebarContent(parent)
    if not parent then return end
    ClearFrameChildren(parent)
    if Gallery.BuildCategoryList then Gallery.BuildCategoryList() end
    Gallery.RebuildSidebarCountCache()
    local yOffset = -4
    yOffset = Gallery.BuildCategoryCheckboxes(parent, yOffset)
    yOffset = Gallery.BuildFilterSections(parent, yOffset)
    parent:SetHeight(math.abs(yOffset) + 20)
end

function Gallery.CreateSidebar(frame)
    local sidebarWidth = CatSizing.SidebarWidth or 205
    local sidebar = CreateFrame("Frame", "DecorVendorGallerySidebar", frame, "BackdropTemplate")
    sidebar:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -33)
    sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 1, 1)
    sidebar:SetWidth(sidebarWidth)
    sidebar:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
    sidebar:SetBackdropColor(0.04, 0.04, 0.06, 1)
    frame.sidebar = sidebar

    local content = CreateFrame("Frame", "DecorVendorGallerySidebarContent", sidebar)
    content:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 0, -4)
    content:SetPoint("TOPRIGHT", sidebar, "TOPRIGHT", -6, -4)
    content:SetPoint("BOTTOMRIGHT", sidebar, "BOTTOMRIGHT", -6, 76)
    content:SetWidth(sidebarWidth - 8)
    if content.SetClipsChildren then
        content:SetClipsChildren(true)
    end
    sidebar.filterContent = content
    sidebar.filtersContainer = content
    sidebar.filterScroll = nil
    sidebar.UpdateSidebarScrollBar = nil

    sidebar.help = sidebar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    sidebar.help:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMLEFT", 16, 18)
    sidebar.help:SetWidth(155)
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

function Gallery.CreateSidebarFilters(parent)
    if parent then
        Gallery.BuildSidebarContent(parent)
    end
end