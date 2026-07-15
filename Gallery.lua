-- ============================================================
-- Decor Vendor Gallery
-- Gallery.lua
-- Main data helpers + toggle + slash command
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

-- Initialize core elements directly under our namespace sub-table
Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

-- Align shared core data pointers straight to the primary namespace layout
Gallery.Data = DVD

-- Main shared item database records
Gallery.ActiveItems = DVD.ActiveItems or {}

-- Shared source lists
Gallery.npcs = DVD.npcs or {}
Gallery.quests = DVD.quests or {}
Gallery.professions = DVD.professions or {}
Gallery.achievements = DVD.achievements or {}
Gallery.bossdrops = DVD.bossdrops or {}
Gallery.ItemDetails = DVD.ItemDetails or {}
Gallery.VendorDetails = DVD.VendorDetails or {}
Gallery.catalogRecords = DVD.catalogRecords or {}
Gallery.catalogByDecorID = DVD.catalogByDecorID or {}
Gallery.catalogByItemID = DVD.catalogByItemID or {}

Gallery.catalogLoaded = DVD.catalogLoaded or false
Gallery.catalogLoading = DVD.catalogLoading or false

Gallery.ClearCatalogRecords = DVD.ClearCatalogRecords
Gallery.ProcessCatalogSearchResults = DVD.ProcessCatalogSearchResults
Gallery.LoadCatalogRecords = DVD.LoadCatalogRecords

-- Shared camera overrides
Gallery.VendorCameraOverrides = DVD.VendorCameraOverrides or {}
Gallery.DecorCameraOverrides = DVD.DecorCameraOverrides or {}

-- Gallery core working state caches
Gallery.items = Gallery.items or {}
Gallery.cards = Gallery.cards or {}
Gallery.catalogInfoCache = Gallery.catalogInfoCache or {}
Gallery.catalogInfoMisses = Gallery.catalogInfoMisses or {}
Gallery.sourceIndex = Gallery.sourceIndex or {}
Gallery.activeItemSet = Gallery.activeItemSet or {}
Gallery.categoryList = Gallery.categoryList or {}

Gallery.filters = Gallery.filters or {}

Gallery.filters.search = Gallery.filters.search or ""
Gallery.filters.category = Gallery.filters.category or "all"
Gallery.filters.categories = Gallery.filters.categories or {}

Gallery.filters.source = Gallery.filters.source or "all" -- old support only
Gallery.filters.hideCollected = Gallery.filters.hideCollected or false -- old support only

if Gallery.filters.showCollected == nil then
    Gallery.filters.showCollected = true
end

if Gallery.filters.showNotCollected == nil then
    Gallery.filters.showNotCollected = true
end

Gallery.filters.sources = Gallery.filters.sources or {}

local DEFAULT_SOURCE_KEYS = {
    "vendor",
    "shop",
    "quest",
    "achievement",
    "drop",
    "treasure",
    "oldevent",
    "promo",
    "boss",
    "profession",
    "catalog",
    "unreleased",
    "other",
}

for _, sourceKey in ipairs(DEFAULT_SOURCE_KEYS) do
    if Gallery.filters.sources[sourceKey] == nil then
        Gallery.filters.sources[sourceKey] = false
    end
end

function Gallery.BuildItemList()
    wipe(Gallery.items)

    local activeItems = DVD.ActiveItems or {}

    -- Build source index from your Decor Vendor data.
    if Gallery.BuildSourceIndex then
        Gallery.BuildSourceIndex(activeItems)
    end

    -- Fast lookup: decorID -> ActiveItems entry
    -- This avoids scanning every ActiveItem for every catalog record.
    local activeByDecorID = {}

    for activeItemID, activeData in pairs(activeItems) do
        if type(activeItemID) == "number"
            and type(activeData) == "table"
            and activeData.decorID
        then
            activeByDecorID[activeData.decorID] = {
                itemID = activeItemID,
                data = activeData,
            }
        end
    end

    local seenItems = {}
    local seenDecor = {}

    local function AddGalleryItem(itemID, itemData, sourceMode)
        if type(itemData) ~= "table" then return end

        local decorID = itemData.decorID
        local sources = {}

        -- Pull source data from ActiveItems/source index when this item exists in your data.
        if itemID and activeItems[itemID] and Gallery.GetItemSources then
            sources = Gallery.GetItemSources(itemID, activeItems[itemID])
        end

        -- Also respect direct source tags on this specific merged/manual item.
        local rawSource = itemData.sourceType or itemData.source 

        local normalized = Gallery.NormalizeSource and Gallery.NormalizeSource(rawSource)

        if normalized then
            sources[normalized] = true
        end

        -- Catalog-only items get "catalog" source.
        -- Manual ActiveItems with no known source become "other".
        if not next(sources) then
            if sourceMode == "catalog" then
                sources.catalog = true
            else
                sources.other = true
            end
        end

        local sourceType = Gallery.GetPrimarySourceType and Gallery.GetPrimarySourceType(sources) or "other"

        table.insert(Gallery.items, {
            itemID = itemID,
            decorID = decorID,
            data = itemData,

            name = itemData.name or (Gallery.GetItemName and Gallery.GetItemName(itemID, itemData)) or "Unknown Decor",
            icon = itemData.icon or (Gallery.GetItemIcon and Gallery.GetItemIcon(itemID, itemData)) or "Interface\\Icons\\INV_Misc_QuestionMark",
            iconType = itemData.iconType,

            isCollected = itemData.isCollected,

            sources = sources,
            sourceType = sourceType,
        })

        if itemID then
            seenItems[itemID] = true
        end

        if decorID then
            seenDecor[decorID] = true
        end
    end

    -- ============================================================
    -- 1. Blizzard live housing catalog first
    --    This keeps the catalog/dashboard style order.
    -- ============================================================
    if Gallery.catalogLoaded and Gallery.catalogRecords then
        for _, record in ipairs(Gallery.catalogRecords) do
            local activeItemID
            local activeData

            -- First try exact itemID match.
            if record.itemID and activeItems[record.itemID] then
                activeItemID = record.itemID
                activeData = activeItems[record.itemID]
            else
                -- Then try decorID match using fast lookup.
                local found = activeByDecorID[record.decorID]

                if found then
                    activeItemID = found.itemID
                    activeData = found.data
                end
            end

            local merged = {
                catalogRecord = true,

                itemID = activeItemID or record.itemID,
                decorID = record.decorID,

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
                numPlaced = record.numPlaced,
                remainingRedeemable = record.remainingRedeemable,

                categoryIDs = record.categoryIDs,
                subcategoryIDs = record.subcategoryIDs,
                isIndoors = record.isIndoors,
                isOutdoors = record.isOutdoors,
                canCustomize = record.canCustomize,
            }

            -- Merge your Decor Vendor source data on top.
            -- Keep Blizzard's visual catalog info when it is better.
            if activeData then
                for key, value in pairs(activeData) do
                    if key ~= "name"
                        and key ~= "icon"
                        and key ~= "iconType"
                        and key ~= "model3D"
                        and key ~= "asset"
                        and key ~= "uiModelSceneID"
                    then
                        merged[key] = value
                    end
                end

                merged.model3D = record.model3D or activeData.model3D
                merged.asset = record.asset or activeData.asset
                merged.uiModelSceneID = record.uiModelSceneID or activeData.uiModelSceneID
            end

            AddGalleryItem(activeItemID or record.itemID, merged, "catalog")
        end
    end

    -- ============================================================
    -- 2. Add ActiveItems that Blizzard catalog did not return.
    --    These are your unreleased/manual/hidden/source-only items.
    -- ============================================================
    local manualItems = {}

    for itemID, itemData in pairs(activeItems) do
        if type(itemID) == "number" and type(itemData) == "table" then
            local decorID = itemData.decorID

            if not seenItems[itemID] and not seenDecor[decorID] then
                if C_Item and C_Item.RequestLoadItemDataByID then
                    C_Item.RequestLoadItemDataByID(itemID)
                end

                table.insert(manualItems, {
                    itemID = itemID,
                    data = itemData,
                })
            end
        end
    end

    -- Manual-only leftovers can be alphabetized at the end.
    -- Blizzard catalog records stay in catalog order.
    table.sort(manualItems, function(a, b)
        local nameA = Gallery.CleanSortName and Gallery.CleanSortName(Gallery.GetItemName(a.itemID, a.data)) or ""
        local nameB = Gallery.CleanSortName and Gallery.CleanSortName(Gallery.GetItemName(b.itemID, b.data)) or ""

        if nameA == nameB then
            return tostring(a.itemID or 0) < tostring(b.itemID or 0)
        end

        return nameA < nameB
    end)

    for _, manual in ipairs(manualItems) do
        AddGalleryItem(manual.itemID, manual.data, "active")
    end
end

local function Gallery_RefreshAfterOpen()
    if Gallery.LoadCatalogRecords then
        Gallery.LoadCatalogRecords(function()
            if Gallery.BuildItemList then
                Gallery.BuildItemList()
            end

            if Gallery.RefreshGrid then
                Gallery.RefreshGrid()
            end
        end)
    else
        if Gallery.BuildItemList then
            Gallery.BuildItemList()
        end

        if Gallery.RefreshGrid then
            Gallery.RefreshGrid()
        end
    end
end

local function Gallery_EnsureFrame()
    if not Gallery.frame then
        if Gallery.CreateFrame then
            Gallery.CreateFrame()
        else
            print("|cffff4040Decor Vendor Gallery UI is not loaded.|r")
            return false
        end
    end

    return true
end

function DVD.ToggleGallery()
    if not Gallery_EnsureFrame() then
        return
    end

    Gallery.frame:SetShown(not Gallery.frame:IsShown())

    if Gallery.frame:IsShown() then
        Gallery_RefreshAfterOpen()
    end
end

function DVD.ShowGallery()
    if not Gallery_EnsureFrame() then
        return
    end

    Gallery.frame:Show()
    Gallery_RefreshAfterOpen()
end

function DVD.HideGallery()
    if Gallery.frame then
        Gallery.frame:Hide()
    end
end

-- These aliases make your loader/fallback code easier.
Gallery.Open = DVD.ShowGallery
Gallery.Toggle = DVD.ToggleGallery
Gallery.Hide = DVD.HideGallery

-- This is the global function your main DecorVendor addon calls
-- after C_AddOns.LoadAddOn("DecorVendorGallery").
function DecorVendorGallery_Open()
    if DVD.ShowGallery then
        DVD.ShowGallery()
        return
    end

    if Gallery and Gallery.Open then
        Gallery.Open()
        return
    end

    print("|cffffcc00DecorVendorGallery:|r Gallery loaded, but no open function was found.")
end