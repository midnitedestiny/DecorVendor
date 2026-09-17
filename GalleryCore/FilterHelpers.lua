-- ============================================================
-- Decor Vendor Gallery
-- FilterHelpers.lua
-- Main grid filter rules, client interface versions validation, and visibility pipelines
-- ============================================================
local addonName, DVD = ...

local Gallery = DVD.Gallery

if not Gallery then
    print("|cffff4040DecorVendor Gallery FilterHelpers:|r DVD.Gallery is missing.")
    return
end

Gallery.categoryInfoCache = Gallery.categoryInfoCache or {}

Gallery.categoryList = Gallery.categoryList or {}

-------------------------------------------------
-- Client / Patch Availability Helpers
-------------------------------------------------

local function GetActiveItemDataForGalleryItem(item)
    if type(item) ~= "table" then
        return nil, nil
    end

    local data =
        type(item.data) == "table"
        and item.data
        or item

    local activeItems =
        DVD.ActiveItems
        or {}

    -------------------------------------------------
    -- Direct itemID lookup
    -------------------------------------------------

    local rawItemID =
        item.itemID
        or data.itemID

    local itemID =
        tonumber(rawItemID)

    if rawItemID ~= nil then
        local activeData =
            activeItems[itemID]
            or activeItems[rawItemID]
            or (
                itemID
                and activeItems[tostring(itemID)]
            )

        if type(activeData) == "table" then
            return activeData, itemID or rawItemID
        end
    end

    -------------------------------------------------
    -- decorID lookup
    -------------------------------------------------

    local decorID =
        tonumber(
            item.decorID
            or data.decorID
            or item.decorIDValue
            or data.decorIDValue
        )

    if decorID then
        local mappedItemID =
            (
                DVD.decorToItem
                and DVD.decorToItem[decorID]
            )
            or (
                DVD.decorIdToItemId
                and DVD.decorIdToItemId[decorID]
            )

        if mappedItemID then
            mappedItemID =
                tonumber(mappedItemID)
                or mappedItemID

            local activeData =
                activeItems[mappedItemID]
                or activeItems[tostring(mappedItemID)]

            if type(activeData) == "table" then
                return activeData, mappedItemID
            end
        end

        -- Compatibility fallback while the lookup
        -- tables are not available.
        for activeItemID, activeData in pairs(activeItems) do
            if type(activeData) == "table"
            and tonumber(activeData.decorID) == decorID then
                return
                    activeData,
                    tonumber(activeItemID)
                    or activeItemID
            end
        end
    end

    return data, itemID or rawItemID
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

local sourceType

if Gallery.NormalizeSource then
    sourceType =
        Gallery.NormalizeSource(
            data.source
            or data.sourceType
        )
else
    sourceType =
        string.lower(
            tostring(
                data.source
                or data.sourceType
                or ""
            )
        )
end

if data.unreleased == true
or data.hiddenOnLive == true
or sourceType == "unreleased" then
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
    if type(item) ~= "table" then
        return {}
    end

    local data =
        type(item.data) == "table"
        and item.data
        or item

    local function NormalizeCategoryIDs(value)
        local result = {}
        local seen = {}

        local function Add(categoryID)
            categoryID =
                tonumber(categoryID)

            if categoryID
            and not seen[categoryID] then
                seen[categoryID] = true

                table.insert(
                    result,
                    categoryID
                )
            end
        end

        if type(value) == "table" then
            for key, entry in pairs(value) do
                if type(entry) == "number"
                or type(entry) == "string" then
                    Add(entry)

                elseif entry == true then
                    Add(key)
                end
            end
        else
            Add(value)
        end

        return result
    end

    -------------------------------------------------
    -- Direct item/category data
    -------------------------------------------------

    local directCategories =
        NormalizeCategoryIDs(
            data.categoryIDs
            or data.categoryID
        )

    if #directCategories > 0 then
        return directCategories
    end

    local itemCategories =
        NormalizeCategoryIDs(
            item.categoryIDs
            or item.categoryID
        )

    if #itemCategories > 0 then
        return itemCategories
    end

    -------------------------------------------------
    -- Catalog lookup by decorID
    -------------------------------------------------

    local decorID =
        tonumber(
            item.decorID
            or data.decorID
            or item.decorIDValue
            or data.decorIDValue
        )

    local catalogRecord

    if decorID then
        catalogRecord =
            (
                Gallery.catalogByDecorID
                and (
                    Gallery.catalogByDecorID[decorID]
                    or Gallery.catalogByDecorID[tostring(decorID)]
                )
            )
            or (
                DVD.catalogByDecorID
                and (
                    DVD.catalogByDecorID[decorID]
                    or DVD.catalogByDecorID[tostring(decorID)]
                )
            )
    end

    local catalogCategories =
        NormalizeCategoryIDs(
            catalogRecord
            and (
                catalogRecord.categoryIDs
                or catalogRecord.categoryID
            )
        )

    if #catalogCategories > 0 then
        return catalogCategories
    end

    -------------------------------------------------
    -- Catalog lookup by itemID
    -------------------------------------------------

    local itemID =
        tonumber(
            item.itemID
            or data.itemID
            or data.id
        )

    if itemID then
        catalogRecord =
            (
                Gallery.catalogByItemID
                and (
                    Gallery.catalogByItemID[itemID]
                    or Gallery.catalogByItemID[tostring(itemID)]
                )
            )
            or (
                DVD.catalogByItemID
                and (
                    DVD.catalogByItemID[itemID]
                    or DVD.catalogByItemID[tostring(itemID)]
                )
            )
    end

    return NormalizeCategoryIDs(
        catalogRecord
        and (
            catalogRecord.categoryIDs
            or catalogRecord.categoryID
        )
    )
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

local itemSources =
    item.sources

if type(itemSources) ~= "table"
and Gallery.GetItemSources then
    itemSources =
        Gallery.GetItemSources(
            item.itemID,
            itemData
        )
end

itemSources =
    type(itemSources) == "table"
    and itemSources
    or {}

if type(filters.sources) == "table" then
    for sourceKey, enabled in pairs(filters.sources) do
        if enabled then
            selectedSourceCount =
                selectedSourceCount
                + 1

            local normalizedKey =
                Gallery.NormalizeSource
                and Gallery.NormalizeSource(sourceKey)
                or sourceKey

            if normalizedKey
            and itemSources[normalizedKey] then
                matchedSelectedSource = true
            end
        end
    end
end

    -- if user checked at least one source, item must match one of them
    if selectedSourceCount > 0 and not matchedSelectedSource then
        return false
    end

-------------------------------------------------
-- Search
-------------------------------------------------

local searchQuery =
    tostring(
        filters.search
        or ""
    )

searchQuery =
    searchQuery:gsub(
        "^%s+",
        ""
    ):gsub(
        "%s+$",
        ""
    )

if searchQuery ~= "" then
    local query =
        string.lower(searchQuery)

    local itemName =
        Gallery.GetItemName
        and Gallery.GetItemName(
            item.itemID,
            itemData
        )
        or ""

    local vendorNames =
        Gallery.GetVendorNamesFromItem
        and Gallery.GetVendorNamesFromItem(
            itemData
        )
        or ""

    local sourceText =
        Gallery.GetSourceTextForItem
        and Gallery.GetSourceTextForItem(
            item
        )
        or ""

    local extraText =
        table.concat(
            {
                tostring(item.name or ""),
                tostring(itemData.name or ""),
                tostring(itemData.zone or ""),
                tostring(itemData.displayZone or ""),
                tostring(itemData.location or ""),
                tostring(itemData.note or ""),
                tostring(itemData.notes or ""),
                tostring(itemData.keyword or ""),
                tostring(itemData.searchText or ""),
                tostring(itemData.source or ""),
                tostring(itemData.sourceType or ""),
            },
            " "
        )

    local searchableText =
        string.lower(
            table.concat(
                {
                    tostring(itemName),
                    tostring(vendorNames),
                    tostring(sourceText),
                    extraText,
                },
                " "
            )
        )

    if not string.find(
        searchableText,
        query,
        1,
        true
    ) then
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
    categoryID =
        tonumber(categoryID)

    if not categoryID then
        return nil
    end

    Gallery.categoryInfoCache =
        Gallery.categoryInfoCache
        or {}

    local cached =
        Gallery.categoryInfoCache[categoryID]

    if cached then
        return cached
    end

    if not C_HousingCatalog
    or not C_HousingCatalog.GetCatalogCategoryInfo then
        return nil
    end

    local ok, info =
        pcall(
            C_HousingCatalog.GetCatalogCategoryInfo,
            categoryID
        )

    if not ok
    or type(info) ~= "table" then
        return nil
    end

    Gallery.categoryInfoCache[categoryID] =
        info

    return info
end

function Gallery.BuildCategoryList()
    Gallery.categoryList =
        Gallery.categoryList
        or {}

    wipe(Gallery.categoryList)

    table.insert(
        Gallery.categoryList,
        {
            key = "all",
            name = "All",
            icon = "communities-icon-chat",
            iconType = "atlas",
        }
    )

    local seen = {}

    -- Preserve Blizzard/catalog category order.
    for _, record in ipairs(
        Gallery.catalogRecords
        or {}
    ) do
        if type(record) == "table" then
            local categoryIDs =
                record.categoryIDs
                or {}

            for _, rawCategoryID in ipairs(categoryIDs) do
                local categoryID =
                    tonumber(rawCategoryID)

                if categoryID
                and not seen[categoryID] then
                    seen[categoryID] = true

                    local info =
                        Gallery.GetCatalogCategoryInfo(
                            categoryID
                        )

                    table.insert(
                        Gallery.categoryList,
                        {
                            key =
                                tostring(categoryID),

                            id =
                                categoryID,

                            name =
                                (
                                    info
                                    and info.name
                                )
                                or (
                                    "Category "
                                    .. tostring(categoryID)
                                ),

                            icon =
                                info
                                and info.icon,

                            iconType =
                                info
                                and info.icon
                                and "atlas"
                                or "texture",
                        }
                    )
                end
            end
        end
    end

    return Gallery.categoryList
end