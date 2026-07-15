-- ============================================================
-- Decor Vendor Gallery
-- FilterHelpers.lua
-- Main grid filter rules, client interface versions validation, and visibility pipelines
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

Gallery.ActiveItems = DVD.ActiveItems or {}

-------------------------------------------------
-- Client / Patch Availability Helpers
-------------------------------------------------

local function GetActiveItemDataForGalleryItem(item)
    if not item then
        return nil, nil
    end

    local data = item.data or {}
    local itemID = item.itemID or data.itemID

    if itemID and DVD.ActiveItems and DVD.ActiveItems[itemID] then
        return DVD.ActiveItems[itemID], itemID
    end

    local decorID = item.decorID or data.decorID

    if decorID and DVD.ActiveItems then
        for activeItemID, activeData in pairs(DVD.ActiveItems) do
            if type(activeData) == "table" and activeData.decorID == decorID then
                return activeData, activeItemID
            end
        end
    end

    return data, itemID
end

local function IsDataAvailableForClient(data)
    if not data then
        return true
    end

    if DVD.IsDataAvailableForClient then
        return DVD.IsDataAvailableForClient(data)
    end

    local _, _, _, tocVersion = GetBuildInfo()
    local currentInterface = tonumber(tocVersion) or 0

    local minInterface = tonumber(data.minInterface) or tonumber(data.minToc) or tonumber(data.addedInInterface)
    local maxInterface = tonumber(data.maxInterface) or tonumber(data.maxToc) or tonumber(data.removedAfterInterface)

    if minInterface and currentInterface > 0 and currentInterface < minInterface then
        return false
    end

    if maxInterface and currentInterface > 0 and currentInterface > maxInterface then
        return false
    end

    if data.unreleased == true
        or data.hiddenOnLive == true
        or data.source == "unreleased"
        or data.sourceType == "unreleased"
    then
        return false
    end

    return true
end

function Gallery.IsItemAvailableForClient(item)
    local activeData, activeItemID = GetActiveItemDataForGalleryItem(item)

    if activeItemID and DVD.IsItemAvailableForClient then
        return DVD.IsItemAvailableForClient(activeItemID)
    end

    return IsDataAvailableForClient(activeData)
end

function Gallery.HasSelectedCategories()
    local categories = Gallery.filters and Gallery.filters.categories

    if not categories then
        return false
    end

    for _, enabled in pairs(categories) do
        if enabled then
            return true
        end
    end

    return false
end

function Gallery.ItemMatchesSelectedCategories(item)
    if not Gallery.HasSelectedCategories() then
        return true
    end

    local selected = Gallery.filters.categories or {}

    for categoryKey, enabled in pairs(selected) do
        if enabled and Gallery.ItemMatchesCategory(item, categoryKey) then
            return true
        end
    end

    return false
end

function Gallery.GetItemCategoryIDs(item)
    if not item then
        return {}
    end

    local data = item.data or item or {}

    -- 1. Direct item/category data
    if type(data.categoryIDs) == "table" and #data.categoryIDs > 0 then
        return data.categoryIDs
    end

    if type(item.categoryIDs) == "table" and #item.categoryIDs > 0 then
        return item.categoryIDs
    end

    -- 2. Shared catalog lookup by decorID
    local decorID = item.decorID or data.decorID or item.decorIDValue or data.decorIDValue

    local catalogRecord = decorID and (
        (Gallery.catalogByDecorID and Gallery.catalogByDecorID[decorID])
        or (DVD.catalogByDecorID and DVD.catalogByDecorID[decorID])
    )

    if catalogRecord and type(catalogRecord.categoryIDs) == "table" then
        return catalogRecord.categoryIDs
    end

    -- 3. Shared catalog lookup by itemID
    local itemID = item.itemID or data.itemID or data.id

    catalogRecord = itemID and (
        (Gallery.catalogByItemID and Gallery.catalogByItemID[itemID])
        or (DVD.catalogByItemID and DVD.catalogByItemID[itemID])
    )

    if catalogRecord and type(catalogRecord.categoryIDs) == "table" then
        return catalogRecord.categoryIDs
    end

    return {}
end

function Gallery.ItemMatchesCategory(item, categoryKey)
    if not item or not categoryKey or categoryKey == "all" then
        return true
    end

    local wantedID = tonumber(categoryKey)

    -- If it is not a Blizzard category ID, do not block the item.
    if not wantedID then
        return true
    end

    local categoryIDs = Gallery.GetItemCategoryIDs and Gallery.GetItemCategoryIDs(item) or {}

    for _, categoryID in ipairs(categoryIDs) do
        if tonumber(categoryID) == wantedID then
            return true
        end
    end

    return false
end

function Gallery.ItemPassesFilters(item)
    if not item then return false end

    local filters = Gallery.filters or {}
    local itemData = item.data or {}

    -- Hide future/unreleased items from the Gallery grid.
    if Gallery.IsItemAvailableForClient and not Gallery.IsItemAvailableForClient(item) then
        return false
    end

    local collected = item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID)) or false

    -- collection filters
    if collected and filters.showCollected == false then
        return false
    end

    if not collected and filters.showNotCollected == false then
        return false
    end

    -- category filter
    if not Gallery.ItemMatchesSelectedCategories(item) then
        return false
    end

    -- source checkbox filtering
    local selectedSourceCount = 0
    local matchedSelectedSource = false

    if filters.sources then
        for sourceKey, enabled in pairs(filters.sources) do
            if enabled then
                selectedSourceCount = selectedSourceCount + 1

                if item.sources and item.sources[sourceKey] then
                    matchedSelectedSource = true
                end
            end
        end
    end

    -- if user checked at least one source, item must match one of them
    if selectedSourceCount > 0 and not matchedSelectedSource then
        return false
    end

    -- search
    if filters.search and filters.search ~= "" then
        local q = string.lower(filters.search)

        local itemName = string.lower((Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData)) or "")
        local vendorNames = string.lower((Gallery.GetVendorNamesFromItem and Gallery.GetVendorNamesFromItem(itemData)) or "")
        local sourceText = string.lower((Gallery.GetSourceTextForItem and Gallery.GetSourceTextForItem(item)) or "")

        if not string.find(itemName, q, 1, true)
            and not string.find(vendorNames, q, 1, true)
            and not string.find(sourceText, q, 1, true)
        then
            return false
        end
    end

    return true
end

function Gallery.GetVisibleItems()
    local visible = {}

    for _, item in ipairs(Gallery.items or {}) do
        if Gallery.ItemPassesFilters(item) then
            table.insert(visible, item)
        end
    end

    -- Keep All Decor in Blizzard/catalog order. Only source-filtered views sort A-Z.
    if Gallery.HasSelectedSources and Gallery.HasSelectedSources() then
        if Gallery.SortItemsAZ then Gallery.SortItemsAZ(visible) end
    end

    return visible
end

function Gallery.GetCatalogCategoryInfo(categoryID)
    if not categoryID then return nil end

    if Gallery.categoryInfoCache and Gallery.categoryInfoCache[categoryID] then
        return Gallery.categoryInfoCache[categoryID]
    end

    Gallery.categoryInfoCache = Gallery.categoryInfoCache or {}

    if C_HousingCatalog and C_HousingCatalog.GetCatalogCategoryInfo then
        local info = C_HousingCatalog.GetCatalogCategoryInfo(categoryID)

        if info then
            Gallery.categoryInfoCache[categoryID] = info
            return info
        end
    end

    return nil
end

function Gallery.BuildCategoryList()
    wipe(Gallery.categoryList)

    table.insert(Gallery.categoryList, {
        key = "all",
        name = "All",
        icon = "communities-icon-chat",
        iconType = "atlas",
    })

    local seen = {}

    -- Keep category order based on Blizzard catalog order.
    for _, record in ipairs(Gallery.catalogRecords or {}) do
        for _, categoryID in ipairs(record.categoryIDs or {}) do
            if categoryID and not seen[categoryID] then
                seen[categoryID] = true

                local info = Gallery.GetCatalogCategoryInfo(categoryID)

                table.insert(Gallery.categoryList, {
                    key = tostring(categoryID),
                    id = categoryID,
                    name = (info and info.name) or ("Category " .. tostring(categoryID)),
                    icon = info and info.icon,
                    iconType = info and info.icon and "atlas" or "texture",
                })
            end
        end
    end

    return Gallery.categoryList
end