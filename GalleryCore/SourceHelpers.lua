-- ============================================================
-- Decor Vendor Gallery
-- SourceHelpers.lua
-- Data indexing engine for normalizing, caching, and matching decor item sources
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

Gallery.ActiveItems = DVD.ActiveItems or {}

function Gallery.NormalizeSource(rawSource)
    if not rawSource then return nil end

    local source = string.lower(tostring(rawSource))
    source = source:gsub("%s+", "")
    source = source:gsub("%-", "")

    if source == "vendor" or source == "vendors" then
        return "vendor"
    end

    if source == "shop"
        or source == "store"
        or source == "ingameshop"
        or source == "wowshop"
        or source == "battlenetshop"
    then
        return "shop"
    end

    if source == "quest" or source == "quests" then
        return "quest"
    end

    if source == "achievement"
        or source == "achievements"
        or source == "achieve"
        or source == "ach"
    then
        return "achievement"
    end

    -- One filter bucket for all loot/findable sources.
    -- Bosses and treasures still keep their detail fields/actions,
    -- but the sidebar filter will show only "Drop".
    if source == "drop"
        or source == "drops"
        or source == "boss"
        or source == "bossdrop"
        or source == "bossdrops"
        or source == "encounter"
        or source == "encounterdrop"
        or source == "encounterdrops"
        or source == "treasure"
        or source == "treasures"
        or source == "chest"
        or source == "chests"
    then
        return "drop"
    end

    if source == "promo"
        or source == "promotion"
        or source == "promotional"
    then
        return "promo"
    end

    if source == "collab"
        or source == "collabs"
        or source == "collaboration"
        or source == "collaborations"
        or source == "expiredcollab"
        or source == "expiredcollabs"
    then
        return "collab"
    end

    if source == "patch121"
        or source == "patch12.1"
        or source == "patch1201"
        or source == "121"
    then
        return "patch121"
    end

    if source == "profession"
        or source == "professions"
        or source == "crafted"
        or source == "crafting"
        or source == "recipe"
    then
        return "profession"
    end

    if source == "catalog"
        or source == "housingcatalog"
    then
        return "catalog"
    end

    if source == "unreleased"
        or source == "unused"
        or source == "unknownrelease"
    then
        return "unreleased"
    end

    if source == "other" then
        return "other"
    end

    return nil
end

function Gallery.GetSourceType(itemData)
    if type(itemData) ~= "table" then
        return "other"
    end

    local rawSource = itemData.source or itemData.sourceType
    local normalized = Gallery.NormalizeSource(rawSource)

    return normalized or "other"
end

function Gallery.AddSource(itemID, sourceType, detail)
    itemID = tonumber(itemID)
    sourceType = Gallery.NormalizeSource(sourceType)

    if not itemID or not sourceType then return end

    -- Only index real ActiveItems so quest IDs / vendor IDs don't accidentally count.
    if Gallery.activeItemSet and not Gallery.activeItemSet[itemID] then
        return
    end

    Gallery.sourceIndex[itemID] = Gallery.sourceIndex[itemID] or {
        types = {},
        details = {},
    }

    Gallery.sourceIndex[itemID].types[sourceType] = true

    if detail then
        table.insert(Gallery.sourceIndex[itemID].details, {
            source = sourceType,
            detail = detail,
        })
    end
end

function Gallery.AddSourcesFromActiveItem(itemID, itemData)
    if type(itemID) ~= "number" or type(itemData) ~= "table" then
        return
    end

    local singleSource = Gallery.NormalizeSource(itemData.source or itemData.sourceType)

    if singleSource then
        Gallery.AddSource(itemID, singleSource, itemData)
    end

    if type(itemData.sources) == "table" then
        for _, rawSource in ipairs(itemData.sources) do
            local sourceType = Gallery.NormalizeSource(rawSource)

            if sourceType then
                Gallery.AddSource(itemID, sourceType, itemData)
            end
        end
    end
end

function Gallery.AddSourcesFromGalleryDetails(itemID, itemData)
    itemID = tonumber(itemID)

    if not itemID then
        return
    end

    local itemDetails = Gallery.ItemDetails and (Gallery.ItemDetails[itemID] or Gallery.ItemDetails[tostring(itemID)])
    local vendorDetails = Gallery.VendorDetails and (Gallery.VendorDetails[itemID] or Gallery.VendorDetails[tostring(itemID)])

    if type(itemData) == "table" then
        if itemData.soldBy or itemData.vendorID then
            Gallery.AddSource(itemID, "vendor", {
                from = "ActiveItems.soldBy",
            })
        end
    end

    if type(vendorDetails) == "table" and next(vendorDetails) ~= nil then
        Gallery.AddSource(itemID, "vendor", {
            from = "GalleryVendorDetails",
        })
    end

    if type(itemDetails) ~= "table" then
        return
    end

    local explicitSource = itemDetails.source or itemDetails.sourceType

    if explicitSource then
        Gallery.AddSource(itemID, explicitSource, itemDetails)
    end

    if type(itemDetails.sources) == "table" then
        for _, rawSource in ipairs(itemDetails.sources) do
            Gallery.AddSource(itemID, rawSource, itemDetails)
        end
    end

    if itemDetails.questID or itemDetails.questName then
        Gallery.AddSource(itemID, "quest", itemDetails)
    end

    if itemDetails.achievementID or itemDetails.achievementName then
        Gallery.AddSource(itemID, "achievement", itemDetails)
    end

    if itemDetails.professionText
        or itemDetails.profession
        or itemDetails.professionID
        or itemDetails.professionName
    then
        Gallery.AddSource(itemID, "profession", itemDetails)
    end

    if itemDetails.dropName
        or itemDetails.bossName
        or itemDetails.bossencounter
        or itemDetails.encounterID
        or itemDetails.treasureName
    then
        Gallery.AddSource(itemID, "drop", itemDetails)
    end
end

function Gallery.BuildSourceIndex(activeItems)
    wipe(Gallery.sourceIndex)
    wipe(Gallery.activeItemSet)

    activeItems = activeItems or {}

    for itemID, itemData in pairs(activeItems) do
        if type(itemID) == "number" and type(itemData) == "table" then
            Gallery.activeItemSet[itemID] = true
        end
    end

    if type(Gallery.ItemDetails) == "table" then
        for itemID in pairs(Gallery.ItemDetails) do
            itemID = tonumber(itemID)

            if itemID then
                Gallery.activeItemSet[itemID] = true
            end
        end
    end

    if type(Gallery.VendorDetails) == "table" then
        for itemID in pairs(Gallery.VendorDetails) do
            itemID = tonumber(itemID)

            if itemID then
                Gallery.activeItemSet[itemID] = true
            end
        end
    end

    for itemID, itemData in pairs(activeItems) do
        if type(itemID) == "number" and type(itemData) == "table" then
            Gallery.AddSourcesFromActiveItem(itemID, itemData)
            Gallery.AddSourcesFromGalleryDetails(itemID, itemData)
        end
    end

    if type(Gallery.ItemDetails) == "table" then
        for itemID in pairs(Gallery.ItemDetails) do
            itemID = tonumber(itemID)

            if itemID then
                Gallery.AddSourcesFromGalleryDetails(
                    itemID,
                    activeItems[itemID] or {}
                )
            end
        end
    end

    if type(Gallery.VendorDetails) == "table" then
        for itemID in pairs(Gallery.VendorDetails) do
            itemID = tonumber(itemID)

            if itemID then
                Gallery.AddSourcesFromGalleryDetails(
                    itemID,
                    activeItems[itemID] or {}
                )
            end
        end
    end
end

function Gallery.GetItemSources(itemID, itemData)
    local sources = {}

    local indexed = Gallery.sourceIndex and Gallery.sourceIndex[itemID]

    if indexed and indexed.types then
        for sourceType in pairs(indexed.types) do
            sources[sourceType] = true
        end
    end

    if type(itemData) == "table" then
        local singleSource = Gallery.NormalizeSource(itemData.source or itemData.sourceType)

        if singleSource then
            sources[singleSource] = true
        end

        if type(itemData.sources) == "table" then
            for _, rawSource in ipairs(itemData.sources) do
                local sourceType = Gallery.NormalizeSource(rawSource)

                if sourceType then
                    sources[sourceType] = true
                end
            end
        end
    end

    if not next(sources) then
        sources.other = true
    end

    return sources
end

function Gallery.GetPrimarySourceType(sources)
    if not sources then return "other" end

    local order = Gallery.C and Gallery.C.SOURCE_ORDER or {}
    for _, sourceType in ipairs(order) do
        if sources[sourceType] then
            return sourceType
        end
    end

    return "other"
end

function Gallery.GetSourceLabel(sourceType)
    local labels = Gallery.C and Gallery.C.SOURCE_LABELS or {}
    return labels[sourceType or "other"] or "Other"
end

function Gallery.GetSourceSummaryText(item)
    if Gallery.GetSourceTextForItem then
        return Gallery.GetSourceTextForItem(item)
    end

    return "Unknown"
end

function Gallery.GetSourceTextForItem(item)
    if not item or not item.sources then
        return "Other"
    end

    local labels = {}
    local order = Gallery.C and Gallery.C.SOURCE_ORDER or {}

    for _, sourceType in ipairs(order) do
        if item.sources[sourceType] and sourceType ~= "other" then
            table.insert(labels, Gallery.GetSourceLabel(sourceType))
        end
    end

    if #labels == 0 then
        return "Other"
    end

    return table.concat(labels, " + ")
end

function Gallery.HasSelectedSources()
    local filters = Gallery.filters or {}

    if filters.sources then
        for _, enabled in pairs(filters.sources) do
            if enabled then
                return true
            end
        end
    end

    if filters.source and filters.source ~= "all" then
        return true
    end

    return false
end