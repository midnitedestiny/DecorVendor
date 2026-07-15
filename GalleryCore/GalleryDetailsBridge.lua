-- ============================================================
-- Decor Vendor Gallery
-- GalleryDetailsBridge.lua
--
-- Connects GalleryItemDetails.lua and GalleryVendorDetails.lua
-- to the preview/details UI.
--
-- Rules:
-- 1. GalleryItemDetails.lua wins for quest/achievement/note extras.
-- 2. GalleryVendorDetails.lua wins for vendor display/cost/requirements.
-- 3. DecorVendor vendor data may be used ONLY by exact vendor ID.
-- 4. Never guess vendors by name.
-- 5. Never pull extra vendors from sourceIndex/vendorGoodies here.
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE SCHEMA LINK
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

-- Keep old functions as fallbacks where they are safe.
local OldGetPriceText = Gallery.GetPriceText
local OldBuildPreviewSourceText = Gallery.BuildPreviewSourceText
local OldCleanPriceText = Gallery.CleanPriceText
local OldGetAchievementForItem = Gallery.GetAchievementForItem

-- ============================================================
-- Basic item/detail helpers
-- ============================================================

local function GetItemData(item)
    if not item then return {} end
    return item.data or item or {}
end

local RawItemIDCache = {}

local function LookupActiveItemsTable()
    if DVD and type(DVD.ActiveItems) == "table" then
        return DVD.ActiveItems
    end
    if Gallery and type(Gallery.ActiveItems) == "table" then
        return Gallery.ActiveItems
    end
    return nil
end

local function FindItemIDByRawDataTable(data)
    if type(data) ~= "table" then
        return nil
    end

    if RawItemIDCache[data] then
        return RawItemIDCache[data]
    end

    local activeItems = LookupActiveItemsTable()
    if type(activeItems) ~= "table" then
        return nil
    end

    -- Best case: the UI handed us the exact ActiveItems data table.
    for itemID, itemData in pairs(activeItems) do
        if itemData == data then
            RawItemIDCache[data] = itemID
            data.itemID = data.itemID or itemID
            data.id = data.id or itemID
            return itemID
        end
    end

    -- Safe fallback for copied/raw item data: match by unique decorID/model3D.
    local decorID = data.decorID
    if not decorID then
        return nil
    end

    local model3D = data.model3D or data.asset
    local foundItemID
    local foundCount = 0

    for itemID, itemData in pairs(activeItems) do
        if type(itemData) == "table" and tonumber(itemData.decorID) == tonumber(decorID) then
            if not model3D or tonumber(itemData.model3D or itemData.asset) == tonumber(model3D) then
                foundItemID = itemID
                foundCount = foundCount + 1

                if foundCount > 1 then
                    return nil
                end
            end
        end
    end

    if foundItemID then
        RawItemIDCache[data] = foundItemID
        data.itemID = data.itemID or foundItemID
        data.id = data.id or foundItemID
        return foundItemID
    end

    return nil
end

local function GetItemID(item)
    if not item then return nil end

    local data = GetItemData(item)

    local itemID =
        item.itemID
        or item.itemId
        or item.id
        or data.itemID
        or data.itemId
        or data.id

    if itemID then
        return tonumber(itemID) or itemID
    end

    return FindItemIDByRawDataTable(data)
end

function Gallery.GetItemDetailsForItem(item)
    local itemID = GetItemID(item)

    if not itemID or not Gallery.ItemDetails then
        return nil
    end

    return Gallery.ItemDetails[itemID]
        or Gallery.ItemDetails[tonumber(itemID)]
        or Gallery.ItemDetails[tostring(itemID)]
end

local function LookupDetailsByID(root, itemID)
    if type(root) ~= "table" or not itemID then
        return nil
    end

    local numericItemID = tonumber(itemID)
    local stringItemID = tostring(itemID)

    return root[itemID]
        or (numericItemID and root[numericItemID])
        or root[stringItemID]
end

local function GetActiveItemDataByID(itemID)
    local activeItems = LookupActiveItemsTable()

    if type(activeItems) ~= "table" or not itemID then
        return nil
    end

    return LookupDetailsByID(activeItems, itemID)
end

local function GetVendorIDFromAnySoldByEntry(entry)
    if type(entry) == "number" then
        return entry
    end

    if type(entry) == "table" then
        return entry.vendorID
            or entry.vendorId
            or entry.npcID
            or entry.npcId
            or entry.id
            or entry[1]
    end

    return nil
end

local function BuildAllowedVendorIDs(item, itemID)
    local allowed = {}
    local hasAllowed = false

    local data = GetItemData(item)
    local activeData = GetActiveItemDataByID(itemID)

    local soldBy =
        (type(data) == "table" and (data.soldBy or (data.vendorID and { data.vendorID })))
        or (type(activeData) == "table" and (activeData.soldBy or (activeData.vendorID and { activeData.vendorID })))

    if type(soldBy) == "number" then
        soldBy = { soldBy }
    end

    if type(soldBy) ~= "table" then
        return nil
    end

    for _, soldByEntry in ipairs(soldBy) do
        local vendorID = tonumber(GetVendorIDFromAnySoldByEntry(soldByEntry))

        if vendorID then
            allowed[vendorID] = true
            hasAllowed = true
        end
    end

    if not hasAllowed then
        return nil
    end

    return allowed
end

local function FilterVendorDetailsBySoldBy(details, item, itemID)
    if type(details) ~= "table" then
        return nil
    end

    local allowed = BuildAllowedVendorIDs(item, itemID)

    -- If ActiveItems has no soldBy/vendorID, keep details as-is.
    if not allowed then
        return details
    end

    local filtered = {}
    local found = false

    for vendorID, detail in pairs(details) do
        local numericVendorID = tonumber(vendorID)

        if numericVendorID and allowed[numericVendorID] then
            filtered[vendorID] = detail
            found = true
        end
    end

    if found then
        return filtered
    end

    -- Details exist but do not match this item's soldBy list.
    return nil
end

function Gallery.GetVendorDetailsForItem(item)
    local itemID = GetItemID(item)

    if not itemID then
        return nil
    end

    local details = LookupDetailsByID(Gallery and Gallery.VendorDetails, itemID)
        or LookupDetailsByID(DVD and DVD.VendorDetails, itemID)

    return FilterVendorDetailsBySoldBy(details, item, itemID)
end

function Gallery.GetDetailField(item, key)
    local itemDetails = Gallery.GetItemDetailsForItem(item)
    local data = GetItemData(item)

    if itemDetails and itemDetails[key] ~= nil then
        return itemDetails[key]
    end

    return data[key]
end

-- ============================================================
-- Catalog source text fallback helpers
-- ============================================================

local function CleanCatalogText(text)
    if type(text) ~= "string" or text == "" then
        return nil
    end

    text = text:gsub("|n", "\n")
    text = text:gsub("\r", "\n")
    text = text:gsub("|c%x%x%x%x%x%x%x%x", "")
    text = text:gsub("|r", "")

    return text
end

local function GetCatalogSourceText(item)
    if not item then return nil end

    local data = GetItemData(item)

    local text =
        data.sourceText
        or data.catalogSourceText
        or data.tooltipText

    if text then
        return CleanCatalogText(text)
    end

    local decorID = data.decorID or item.decorID

    if Gallery.GetCatalogInfo and decorID then
        local info = Gallery.GetCatalogInfo(decorID)

        if info then
            return CleanCatalogText(
                info.sourceText
                or info.catalogSourceText
                or info.tooltipText
            )
        end
    end

    return nil
end

local function GetCatalogLineValue(item, label)
    local text = GetCatalogSourceText(item)

    if not text then
        return nil
    end

    for line in text:gmatch("[^\n]+") do
        local value = line:match("^%s*" .. label .. ":%s*(.-)%s*$")

        if value then
            value = value:gsub("^%s+", ""):gsub("%s+$", "")

            if value ~= "" then
                return value
            end
        end
    end

    return nil
end

-- ============================================================
-- Achievement bridge
-- ============================================================

function Gallery.GetAchievementForItem(item)
    if not item then return nil end

    local itemDetails = Gallery.GetItemDetailsForItem and Gallery.GetItemDetailsForItem(item) or {}
    local data = GetItemData(item)

    -- GalleryItemDetails.lua wins first.
    local achievementID = itemDetails.achievementID or data.achievementID

    local achievementName =
        itemDetails.achievementName
        or data.achievementName
        or GetCatalogLineValue(item, "Achievement")

    if achievementID or achievementName then
        return {
            id = achievementID,
            achievementID = achievementID,
            name = achievementName or ("Achievement " .. tostring(achievementID)),
            achievementName = achievementName or ("Achievement " .. tostring(achievementID)),
            category =
            itemDetails.achievementCategory
            or data.achievementCategory
            or itemDetails.category
            or data.category,
            faction = itemDetails.faction or data.faction or "neutral",
        }
    end

    -- Safe fallback to old helper only when our detail files do not have anything.
    if OldGetAchievementForItem then
        return OldGetAchievementForItem(item)
    end

    return nil
end

-- ============================================================
-- Currency / price helpers
-- ============================================================
local function GetItemIconMarkup(itemID, size)
    itemID = tonumber(itemID)
    size = tonumber(size) or 14

    if not itemID then
        return nil
    end

    local icon

    if C_Item and C_Item.GetItemIconByID then
        icon = C_Item.GetItemIconByID(itemID)
    end

    if not icon and GetItemInfo then
        local _, _, _, _, _, _, _, _, _, itemIcon = GetItemInfo(itemID)
        icon = itemIcon
    end

    if icon then
        return "|T" .. tostring(icon) .. ":" .. size .. ":" .. size .. ":0:-1|t"
    end

    return nil
end

local function GetGoldIconMarkup(size)
    size = size or 14
    local goldIcon = Gallery.C and Gallery.C.GOLD_ICON or "Interface\\MoneyFrame\\UI-GoldIcon"
    return "|T" .. goldIcon .. ":" .. tostring(size) .. ":" .. tostring(size) .. ":0:-1|t"
end

local function GetHearthsteelIconMarkup(size)
    size = size or 14

    local atlas = Gallery.C and Gallery.C.HEARTHSTEEL_ATLAS
    if atlas then
        return "|A:" .. tostring(atlas) .. ":" .. tostring(size) .. ":" .. tostring(size) .. ":0:-1|a"
    end

    local icon = Gallery.C and Gallery.C.HEARTHSTEEL_ICON
    if icon then
        return "|T" .. tostring(icon) .. ":" .. tostring(size) .. ":" .. tostring(size) .. ":0:-1|t"
    end

    return nil
end

local function GetCurrencyIconMarkup(currencyID, size)
    size = size or 14
    currencyID = tonumber(currencyID)

    if not currencyID then
        return nil
    end

    local icon

    if C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo then
        local info = C_CurrencyInfo.GetCurrencyInfo(currencyID)
        if info and info.iconFileID then
            icon = tostring(info.iconFileID)
        end
    end

    if not icon and Gallery.C and Gallery.C.CURRENCY_ICONS then
        icon = Gallery.C.CURRENCY_ICONS[currencyID]
    end

    if not icon then
        return nil
    end

    return "|T" .. icon .. ":" .. tostring(size) .. ":" .. tostring(size) .. ":0:-1|t"
end

local function ResizeTextureTag(textureTag)
    if type(textureTag) ~= "string" or textureTag == "" then
        return nil
    end

    textureTag = textureTag:gsub("(|T[^|]-):0:0:0:0(|t)", "%1:14:14:0:-1%2")
    textureTag = textureTag:gsub("(|T[^|]-):0:0(|t)", "%1:14:14:0:-1%2")
    textureTag = textureTag:gsub("(|T[^|]-):0(|t)", "%1:14:14:0:-1%2")
    textureTag = textureTag:gsub("^|T([^|:]+)|t$", "|T%1:14:14:0:-1|t")

    return textureTag
end

local function NormalizePriceTextForDisplay(priceText)
    if type(priceText) ~= "string" or priceText == "" then
        return nil
    end

    priceText = priceText:gsub("|c%x%x%x%x%x%x%x%x", "")
    priceText = priceText:gsub("|r", "")

    priceText = priceText:gsub("(%d+)%s*|Hcurrency:(%d+)|h(|T[^|]-|t)|h", function(amount, currencyID, textureTag)
        local icon = GetCurrencyIconMarkup(currencyID, 14)
        if icon then return tostring(amount) .. " " .. icon end
        
        textureTag = ResizeTextureTag(textureTag)
        if textureTag then return tostring(amount) .. " " .. textureTag end

        return tostring(amount) .. " currency " .. tostring(currencyID)
    end)

    priceText = priceText:gsub("(%d+)%s*|Hcurrency:(%d+)|h", function(amount, currencyID)
        local icon = GetCurrencyIconMarkup(currencyID, 14)
        if icon then return tostring(amount) .. " " .. icon end
        return tostring(amount) .. " currency " .. tostring(currencyID)
    end)

    priceText = priceText:gsub("(%d+)%s*|Hitem:(%d+)[^|]*|h(|T[^|]-|t)|h", function(amount, itemID, textureTag)
        local icon = GetItemIconMarkup(itemID, 14)
        if icon then return tostring(amount) .. " " .. icon end

        textureTag = ResizeTextureTag(textureTag)
        if textureTag then return tostring(amount) .. " " .. textureTag end

        return tostring(amount) .. " item " .. tostring(itemID)
    end)

    priceText = priceText:gsub("(%d+)%s*|Hitem:(%d+)[^|]*|h([^|]-)|h", function(amount, itemID, itemName)
        local icon = GetItemIconMarkup(itemID, 14)
        if icon then return tostring(amount) .. " " .. icon end

        itemName = tostring(itemName or ""):gsub("^%[", ""):gsub("%]$", "")
        if itemName ~= "" then return tostring(amount) .. " " .. itemName end

        return tostring(amount) .. " item " .. tostring(itemID)
    end)

    priceText = priceText:gsub("(%d+)%s*|Hitem:(%d+)[^%s|]*", function(amount, itemID)
        local icon = GetItemIconMarkup(itemID, 14)
        if icon then return tostring(amount) .. " " .. icon end
        return tostring(amount) .. " item " .. tostring(itemID)
    end)
    
    priceText = priceText:gsub("|h", "")
    priceText = ResizeTextureTag(priceText) or priceText
    priceText = priceText:gsub("(%d+)(|T)", "%1 %2")
    priceText = priceText:gsub("^%s+", ""):gsub("%s+$", "")

    local hearthsteelIcon = GetHearthsteelIconMarkup(14)
    if hearthsteelIcon then
        priceText = priceText:gsub("(%d+)%s*[Hh]earthsteel", function(amount) return tostring(amount) .. " " .. hearthsteelIcon end)
        priceText = priceText:gsub("(%d+)%s*HEARTHSTEEL", function(amount) return tostring(amount) .. " " .. hearthsteelIcon end)
    end
    
    local plainAmount = priceText:match("^%s*(%d+)%s*$")
    if plainAmount then
        priceText = plainAmount .. " " .. GetGoldIconMarkup(14)
    end

    if priceText == "" then return nil end
    return priceText
end

function Gallery.CleanPriceText(text)
    if OldCleanPriceText then
        text = OldCleanPriceText(text)
    end
    return NormalizePriceTextForDisplay(text)
end

local function FormatPriceTable(price)
    if type(price) ~= "table" then
        return nil
    end

    if type(price[1]) == "table" then
        local parts = {}
        for _, pricePart in ipairs(price) do
            local text = FormatPriceTable(pricePart)
            if text then table.insert(parts, text) end
        end
        if #parts > 0 then return table.concat(parts, " + ") end
    end

    if price.text then
        return NormalizePriceTextForDisplay(price.text)
    end

    if price.amount and price.currencyIcon then
        return NormalizePriceTextForDisplay(
            tostring(price.amount) .. " |T" .. tostring(price.currencyIcon) .. ":14:14:0:-1|t"
        )
    end

    if price.amount and price.currencyID then
        local icon = GetCurrencyIconMarkup(price.currencyID, 12)
        if icon then return tostring(price.amount) .. " " .. icon end
        return tostring(price.amount) .. " currency " .. tostring(price.currencyID)
    end

    if price.amount and (price.itemID or price.itemId or price.item) then
        local itemID = price.itemID or price.itemId or price.item
        local icon = GetItemIconMarkup(itemID, 12)
        if icon then return tostring(price.amount) .. " " .. icon end

        local itemName
        if C_Item and C_Item.GetItemNameByID then itemName = C_Item.GetItemNameByID(itemID) end
        if not itemName and GetItemInfo then itemName = GetItemInfo(itemID) end

        if itemName then return tostring(price.amount) .. " " .. tostring(itemName) end
        return tostring(price.amount) .. " item " .. tostring(itemID)
    end
    
    if price.amount and price.currencyName then
        return NormalizePriceTextForDisplay(tostring(price.amount) .. " " .. tostring(price.currencyName))
    end

    return nil
end

local function GetFirstVendorPrice(item)
    local vendorDetails = Gallery.GetVendorDetailsForItem(item)
    if type(vendorDetails) ~= "table" then return nil end

    local vendorIDs = {}
    for vendorID in pairs(vendorDetails) do table.insert(vendorIDs, vendorID) end
    table.sort(vendorIDs, function(a, b) return tostring(a) < tostring(b) end)

    for _, vendorID in ipairs(vendorIDs) do
        local detail = vendorDetails[vendorID]
        if type(detail) == "table" then
            local priceText = NormalizePriceTextForDisplay(detail.priceText) or FormatPriceTable(detail.price)
            if priceText then return priceText end
        end
    end
    return nil
end

function Gallery.GetPriceText(item)
    local itemDetails = Gallery.GetItemDetailsForItem(item)
    local data = GetItemData(item)

    if itemDetails then
        local itemPrice = NormalizePriceTextForDisplay(itemDetails.priceText) or FormatPriceTable(itemDetails.price)
        if itemPrice then return itemPrice end
    end

    local vendorPrice = GetFirstVendorPrice(item)
    if vendorPrice then return vendorPrice end

    local dataPrice = NormalizePriceTextForDisplay(data.priceText) or FormatPriceTable(data.price)
    if dataPrice then return dataPrice end

    local catalogCost = GetCatalogLineValue(item, "Cost")
    if catalogCost then return NormalizePriceTextForDisplay(catalogCost) end

    if OldGetPriceText then
        return NormalizePriceTextForDisplay(OldGetPriceText(item))
    end

    return nil
end

-- ============================================================
-- Vendor helpers
-- ============================================================
local function IsVendorHiddenInGallery(itemID, vendorID)
    if not itemID or not vendorID then return false end

    local itemVendorDetails = Gallery.GetVendorDetailsForItem and Gallery.GetVendorDetailsForItem({
        itemID = itemID,
        data = GetActiveItemDataByID(itemID) or { itemID = itemID },
    })

    if type(itemVendorDetails) ~= "table" then return false end

    local numericVendorID = tonumber(vendorID)
    local stringVendorID = tostring(vendorID)

    local detail = itemVendorDetails[vendorID] or (numericVendorID and itemVendorDetails[numericVendorID]) or itemVendorDetails[stringVendorID]
    if type(detail) ~= "table" then return false end

    return detail.hideInGallery or detail.hiddenInGallery or detail.galleryHidden or detail.displayInGallery == false
end

local function GetVendorIDFromSoldByEntry(entry)
    if type(entry) == "number" then return entry end
    if type(entry) == "table" then
        return entry.vendorID or entry.vendorId or entry.npcID or entry.npcId or entry.id or entry[1]
    end
    return nil
end

local function FindVendorInTableByExactID(vendorTable, vendorID)
    vendorID = tonumber(vendorID)
    if not vendorID or type(vendorTable) ~= "table" then return nil end

    local directVendor = vendorTable[vendorID] or vendorTable[tostring(vendorID)]
    if type(directVendor) == "table" then
        directVendor.id = directVendor.id or vendorID
        return directVendor
    end

    for _, group in pairs(vendorTable) do
        if type(group) == "table" then
            if tonumber(group.id) == vendorID then
                group.id = group.id or vendorID
                return group
            end
            if type(group.vendors) == "table" then
                for _, vendor in pairs(group.vendors) do
                    if type(vendor) == "table" and tonumber(vendor.id) == vendorID then
                        vendor.id = vendor.id or vendorID
                        return vendor
                    end
                end
            end
        end
    end
    return nil
end

local function FindVendorByExactID(vendorID)
    vendorID = tonumber(vendorID)
    if not vendorID then return nil end

    local vendor = FindVendorInTableByExactID(DVD and DVD.npcs, vendorID)
    if vendor then return vendor end

    vendor = FindVendorInTableByExactID(Gallery and Gallery.npcs, vendorID)
    if vendor then return vendor end

    return nil
end

local function GetVendorByIDSafe(vendorID, detail, soldByEntry)
    detail = detail or {}
    local meta = type(soldByEntry) == "table" and soldByEntry or {}
    local exactVendor = FindVendorByExactID(vendorID) or {}

    local mapID = detail.mapID or detail.mapId or meta.mapID or meta.mapId or exactVendor.mapID or exactVendor.mapId
    local x = detail.x or detail.coordX or meta.x or meta.coordX or exactVendor.x or exactVendor.coordX
    local y = detail.y or detail.coordY or meta.y or meta.coordY or exactVendor.y or exactVendor.coordY
    local hasExactLocation = mapID and x and y

    return {
        id = vendorID,
        title = detail.vendorName or detail.name or meta.vendorName or meta.name or exactVendor.title or exactVendor.name or ("Vendor " .. tostring(vendorID)),
        name = detail.vendorName or detail.name or meta.vendorName or meta.name or exactVendor.name or exactVendor.title or ("Vendor " .. tostring(vendorID)),
        zone = detail.displayZone or detail.zone or meta.displayZone or meta.zone or exactVendor.zone,
        mapID = mapID,
        x = x,
        y = y,
        faction = detail.faction or meta.faction or exactVendor.faction,
        expansion = detail.expansion or meta.expansion or exactVendor.expansion,
        variableLocation = not hasExactLocation and (detail.variableLocation or meta.variableLocation or exactVendor.variableLocation) or false,
        noWaypoint = not hasExactLocation and (detail.noWaypoint or meta.noWaypoint or exactVendor.noWaypoint or true) or false,
sourceAction = detail.sourceAction or meta.sourceAction or exactVendor.sourceAction,
mapAction = detail.mapAction or meta.mapAction or exactVendor.mapAction,
locationAction = detail.locationAction or meta.locationAction or exactVendor.locationAction,
    }
end

function Gallery.GetSoldByEntries(item)
    local entries = {}
    local seen = {}

    if not item then return entries end

    local data = GetItemData(item)
    local itemID = GetItemID(item)
    local vendorDetails = Gallery.GetVendorDetailsForItem(item)

    local function IsHiddenVendorDetail(vendorID, detail)
        detail = type(detail) == "table" and detail or {}
        return IsVendorHiddenInGallery(itemID, vendorID) or detail.hideInGallery == true or detail.hiddenInGallery == true or detail.galleryHidden == true or detail.displayInGallery == false
    end

    local function AddVendor(vendorID, detail, soldByEntry)
        vendorID = tonumber(vendorID)
        if not vendorID or seen[vendorID] then return end

        detail = type(detail) == "table" and detail or {}
        if IsHiddenVendorDetail(vendorID, detail) then return end

        seen[vendorID] = true
        local vendor = GetVendorByIDSafe(vendorID, detail, soldByEntry)

        table.insert(entries, {
            vendorID = vendorID,
            vendor = vendor,
            soldBy = soldByEntry,
            detail = detail,
            details = detail,
            item = item,
            itemID = itemID,
        })
    end

    local function AddCombinedVendorGroup(group)
        if not group or not group.firstVendorID then return end
        local firstVendorID = tonumber(group.firstVendorID)
        if not firstVendorID or seen[firstVendorID] then return end

        local sourceDetail = group.detail or {}
        local combinedDetail = {}
        for k, v in pairs(sourceDetail) do combinedDetail[k] = v end

        combinedDetail.isCombinedVendorGroup = true
        combinedDetail.vendorIDs = group.vendorIDs or {}
        combinedDetail.combineVendorIDs = group.vendorIDs or {}
        combinedDetail.title = combinedDetail.combineLabel or combinedDetail.title or combinedDetail.name or "Rotating vendor"
        combinedDetail.name = combinedDetail.combineLabel or combinedDetail.name or combinedDetail.title or "Rotating vendor"
        combinedDetail.zone = combinedDetail.combineZone or combinedDetail.zone

        seen[firstVendorID] = true
        local vendor = GetVendorByIDSafe(firstVendorID, combinedDetail, nil) or {}
        local displayVendor = {}

        if type(vendor) == "table" then
            for k, v in pairs(vendor) do displayVendor[k] = v end
        end

        displayVendor.title = combinedDetail.title
        displayVendor.name = combinedDetail.name
        if combinedDetail.zone then displayVendor.zone = combinedDetail.zone end

        table.insert(entries, {
            vendorID = firstVendorID,
            vendor = displayVendor,
            soldBy = nil,
            detail = combinedDetail,
            details = combinedDetail,
            item = item,
            itemID = itemID,
        })
    end

    if type(vendorDetails) == "table" and next(vendorDetails) ~= nil then
        local combinedGroups = {}

        for vendorID, detail in pairs(vendorDetails) do
            vendorID = tonumber(vendorID)
            detail = type(detail) == "table" and detail or {}

            if vendorID and not IsHiddenVendorDetail(vendorID, detail) then
                local combineKey = detail.combineKey or detail.vendorGroupKey or detail.groupKey
                if combineKey and combineKey ~= "" then
                    combinedGroups[combineKey] = combinedGroups[combineKey] or {
                        firstVendorID = vendorID,
                        vendorIDs = {},
                        detail = detail,
                    }
                    table.insert(combinedGroups[combineKey].vendorIDs, vendorID)
                else
                    AddVendor(vendorID, detail, nil)
                end
            end
        end

        for _, group in pairs(combinedGroups) do AddCombinedVendorGroup(group) end
    else
        local soldBy = data.soldBy or (data.vendorID and { data.vendorID })
        if type(soldBy) == "number" then soldBy = { soldBy } end
        if type(soldBy) == "table" then
            for _, soldByEntry in ipairs(soldBy) do
                AddVendor(GetVendorIDFromSoldByEntry(soldByEntry), nil, soldByEntry)
            end
        end
    end

    table.sort(entries, function(a, b)
        local av = a.vendor or {}
        local bv = b.vendor or {}
        local az = tostring(av.zone or "")
        local bz = tostring(bv.zone or "")
        if az ~= bz then return az < bz end
        return tostring(av.title or av.name or "") < tostring(bv.title or bv.name or "")
    end)

    return entries
end

function Gallery.GetVendorsForItem(item)
    local vendors = {}
    local seen = {}
    local entries = Gallery.GetSoldByEntries and Gallery.GetSoldByEntries(item) or {}

    for _, entry in ipairs(entries) do
        local vendor = entry.vendor
        local vendorID = entry.vendorID or (vendor and vendor.id)
        if vendor and vendorID and not seen[vendorID] then
            seen[vendorID] = true
            table.insert(vendors, vendor)
        end
    end
    return vendors
end

-- ============================================================
-- Vendor waypoint helpers
-- ============================================================

function Gallery.GetPlayerFaction()
    local faction = UnitFactionGroup and UnitFactionGroup("player")
    return faction and string.lower(faction) or nil
end

function Gallery.NormalizeFaction(faction)
    if not faction then return "neutral" end
    faction = string.lower(tostring(faction))
    if faction == "alliance" then return "alliance" end
    if faction == "horde" then return "horde" end
    return "neutral"
end

function Gallery.GetVendorEffectiveFaction(vendor)
    if not vendor then return "neutral" end
    if vendor.faction then return Gallery.NormalizeFaction(vendor.faction) end
    if vendor.zone == "Founder's Point" then return "alliance" end
    if vendor.zone == "Razorwind Shores" then return "horde" end
    return "neutral"
end

function Gallery.VendorMatchesPlayerFaction(vendor)
    local playerFaction = Gallery.GetPlayerFaction()
    local vendorFaction = Gallery.GetVendorEffectiveFaction(vendor)
    if vendorFaction == "neutral" then return true end
    return playerFaction and vendorFaction == playerFaction
end

function Gallery.VendorHasExactLocation(vendor)
    return vendor and vendor.mapID and vendor.x and vendor.y and not vendor.variableLocation and not vendor.noWaypoint
end

function Gallery.SetWaypointToVendor(vendor, itemName)
    if not Gallery.VendorHasExactLocation(vendor) then return false end
    local title = vendor.title or vendor.name or itemName or "Decor Vendor"

    if DVD and DVD.SetWaypoint then
        DVD.SetWaypoint(vendor.mapID, vendor.x, vendor.y, title)
        return true
    end

    if TomTom and TomTom.AddWaypoint then
        local x = tonumber(vendor.x)
        local y = tonumber(vendor.y)
        if x and y then
            TomTom:AddWaypoint(tonumber(vendor.mapID), x / 100, y / 100, {
                title = title,
                persistent = false,
                minimap = true,
                world = true,
            })
            return true
        end
    end

    if C_Map and C_Map.SetUserWaypoint and UiMapPoint then
        local x = tonumber(vendor.x)
        local y = tonumber(vendor.y)
        local mapID = tonumber(vendor.mapID)

        if mapID and x and y then
            local nx = x > 1 and x / 100 or x
            local ny = y > 1 and y / 100 or y
            local point

            if UiMapPoint.CreateFromCoordinates then
                point = UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
            elseif UiMapPoint.CreateFromVector2D and CreateVector2D then
                point = UiMapPoint.CreateFromVector2D(mapID, CreateVector2D(nx, ny))
            end

            if point then
                C_Map.SetUserWaypoint(point)
                if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                end
                if C_Map.OpenWorldMap then C_Map.OpenWorldMap(mapID) end
                return true
            end
        end
    end
    return false
end

function Gallery.GetBestFactionVendorForItem(item)
    if not item then return nil end

    local itemData = item.data or {}
    local vendors = Gallery.GetVendorsForItem(item)
    if #vendors == 0 then return nil end

    local playerFaction = Gallery.GetPlayerFaction()
    local currentMapID = C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")

    if itemData.preferredVendorID then
        for _, vendor in ipairs(vendors) do
            if tonumber(vendor.id) == tonumber(itemData.preferredVendorID) and Gallery.VendorHasExactLocation(vendor) and Gallery.VendorMatchesPlayerFaction(vendor) then
                return vendor
            end
        end
    end

    if playerFaction and currentMapID then
        for _, vendor in ipairs(vendors) do
            if Gallery.VendorHasExactLocation(vendor) and Gallery.GetVendorEffectiveFaction(vendor) == playerFaction and tonumber(vendor.mapID) == tonumber(currentMapID) then
                return vendor
            end
        end
    end

    if currentMapID then
        for _, vendor in ipairs(vendors) do
            if Gallery.VendorHasExactLocation(vendor) and Gallery.GetVendorEffectiveFaction(vendor) == "neutral" and tonumber(vendor.mapID) == tonumber(currentMapID) then
                return vendor
            end
        end
    end

    if playerFaction then
        for _, vendor in ipairs(vendors) do
            if Gallery.VendorHasExactLocation(vendor) and Gallery.GetVendorEffectiveFaction(vendor) == playerFaction then
                return vendor
            end
        end
    end

    for _, vendor in ipairs(vendors) do
        if Gallery.VendorHasExactLocation(vendor) and Gallery.GetVendorEffectiveFaction(vendor) == "neutral" then return vendor end
    end

    for _, vendor in ipairs(vendors) do
        if Gallery.VendorHasExactLocation(vendor) and Gallery.VendorMatchesPlayerFaction(vendor) then return vendor end
    end

    for _, vendor in ipairs(vendors) do
        if Gallery.VendorHasExactLocation(vendor) then return vendor end
    end

    return nil
end

--[[function Gallery.TrySetVendorWaypoint(item)
    if not item then return false end
    local bestVendor = Gallery.GetBestFactionVendorForItem(item)

    if bestVendor then
        return Gallery.SetWaypointToVendor(bestVendor, Gallery.GetItemName and Gallery.GetItemName(item.itemID, item.data) or nil)
    end

    local vendors = Gallery.GetVendorsForItem(item)
    if #vendors > 0 then
        print("|cffffd100Decor Vendor Gallery:|r This vendor has no fixed waypoint location.")
        return false
    end

    print("|cffffd100Decor Vendor Gallery:|r No vendor location found for this item.")
    return false
end]]


function Gallery.TrySetVendorWaypoint(item)
    if not item then
        return false
    end

    -------------------------------------------------
    -- 1. Try sourceAction first.
    -- This handles rotating vendors like Celestine / Dreamsurge.
    -------------------------------------------------

    local function GetActionByKey(key)
        if not key or key == "" then
            return nil
        end

        local action =
            Gallery.C
            and Gallery.C.SOURCE_ACTIONS
            and Gallery.C.SOURCE_ACTIONS[key]

        action =
            action
            or (Gallery.C and Gallery.C.SourceActions and Gallery.C.SourceActions[key])
            or (DVD and DVD.SOURCE_ACTIONS and DVD.SOURCE_ACTIONS[key])
            or (DVD and DVD.SourceActions and DVD.SourceActions[key])
            or (DVD and DVD.Shared and DVD.Shared.SourceActions and DVD.Shared.SourceActions[key])

        if type(action) ~= "table" then
            return nil
        end

        return action
    end

    local function RunActionKey(key)
        local action = GetActionByKey(key)

        if not action then
            return false
        end

        if action.type == "map" then
            return Gallery.SetGalleryMapWaypoints({
                type = "map",
                title = action.label or key,
                locations = action.locations,
                openMapID = action.openMapID or action.parentMapID or action.mapID,
                mapID = action.mapID,
            })
        end

        if action.type == "worldmap" and Gallery.OpenWorldMapForAction then
            return Gallery.OpenWorldMapForAction(action)
        end

        if action.type == "journal" and Gallery.OpenJournalForItemAction then
            return Gallery.OpenJournalForItemAction(action)
        end

        return false
    end

    local itemDetails =
        Gallery.GetItemDetailsForItem
        and Gallery.GetItemDetailsForItem(item)
        or {}

    local data = item.data or item or {}

    -- Item / ActiveItems / ItemDetails source actions.
    local directActionKey =
        item.sourceAction
        or data.sourceAction
        or itemDetails.sourceAction
        or item.rareEvent
        or data.rareEvent
        or itemDetails.rareEvent
        or item.bossevent
        or data.bossevent
        or itemDetails.bossevent
        or item.eventName
        or data.eventName
        or itemDetails.eventName

    if RunActionKey(directActionKey) then
        return true
    end

    -- VendorDetails source actions.
    local vendorDetails =
        Gallery.GetVendorDetailsForItem
        and Gallery.GetVendorDetailsForItem(item)
        or nil

    if type(vendorDetails) == "table" then
        for vendorID, detail in pairs(vendorDetails) do
            if type(detail) == "table" then
                local key =
                    detail.sourceAction
                    or detail.mapAction
                    or detail.locationAction
                    or detail.rareEvent
                    or detail.eventName

                if RunActionKey(key) then
                    return true
                end
            end
        end
    end

    -- Vendor table source actions from DVD.npcs.
    local vendors =
        Gallery.GetVendorsForItem
        and Gallery.GetVendorsForItem(item)
        or {}

    for _, vendor in ipairs(vendors) do
        local key =
            vendor.sourceAction
            or vendor.mapAction
            or vendor.locationAction
            or vendor.rareEvent
            or vendor.eventName

        if RunActionKey(key) then
            return true
        end

        local vendorID = vendor.id or vendor.vendorID

        if vendorID and DVD and DVD.npcs then
            local exactVendor = DVD.npcs[tonumber(vendorID)] or DVD.npcs[tostring(vendorID)]

            if type(exactVendor) == "table" then
                key =
                    exactVendor.sourceAction
                    or exactVendor.mapAction
                    or exactVendor.locationAction
                    or exactVendor.rareEvent
                    or exactVendor.eventName

                if RunActionKey(key) then
                    return true
                end
            end
        end
    end

    -------------------------------------------------
    -- 2. Normal fixed vendor waypoint fallback.
    -------------------------------------------------

    local bestVendor =
        Gallery.GetBestFactionVendorForItem
        and Gallery.GetBestFactionVendorForItem(item)
        or nil

    if bestVendor then
        return Gallery.SetWaypointToVendor(
            bestVendor,
            Gallery.GetItemName and Gallery.GetItemName(item.itemID, item.data) or nil
        )
    end

    -------------------------------------------------
    -- 3. Final fallback messages.
    -------------------------------------------------

    if #vendors > 0 then
        print("|cffffd100Decor Vendor Gallery:|r This vendor has no fixed waypoint location.")
        return false
    end

    print("|cffffd100Decor Vendor Gallery:|r No vendor location found for this item.")
    return false
end

function Gallery.GetVendorNamesFromItem(itemOrData)
    if not itemOrData then return nil end
    local item = itemOrData.data and itemOrData or { itemID = itemOrData.itemID or itemOrData.id, decorID = itemOrData.decorID, data = itemOrData }

    local entries = Gallery.GetSoldByEntries and Gallery.GetSoldByEntries(item) or {}
    local names = {}
    local seen = {}

    for _, entry in ipairs(entries) do
        local vendor = entry.vendor or {}
        local detail = entry.detail or entry.details or {}
        local vendorID = entry.vendorID or vendor.id
        local name = detail.vendorName or detail.name or vendor.title or vendor.name or (vendorID and ("Vendor " .. tostring(vendorID)))

        if name and name ~= "" and not seen[name] then
            seen[name] = true
            table.insert(names, name)
        end
    end

    if #names == 0 then
        local data = item.data or {}
        local soldBy = data.soldBy or (data.vendorID and { data.vendorID })
        if type(soldBy) == "number" then soldBy = { soldBy } end
        if type(soldBy) == "table" then
            for _, entry in ipairs(soldBy) do
                local vendorID = type(entry) == "number" and entry or (type(entry) == "table" and (entry.vendorID or entry.vendorId or entry.npcID or entry.npcId or entry.id or entry[1]))
                vendorID = tonumber(vendorID)
                if vendorID then
                    local name = "Vendor " .. tostring(vendorID)
                    if not seen[name] then
                        seen[name] = true
                        table.insert(names, name)
                    end
                end
            end
        end
    end

    if #names == 0 then return nil end
    table.sort(names)
    return table.concat(names, ", ")
end

-- ============================================================
-- Requirement helpers
-- ============================================================

local function GetItemRequirement(item)
    local itemDetails = Gallery.GetItemDetailsForItem(item)
    local data = GetItemData(item)
    if itemDetails then
        return itemDetails.requirement or itemDetails.requires or data.requirement or data.requires
    end
    return data.requirement or data.requires
end

function Gallery.GetRequirementTextForVendorEntry(entry, itemData)
    local item = entry and entry.item
    local detail = entry and (entry.detail or entry.details)

    local requirement = detail and (detail.requirement or detail.requires) or GetItemRequirement(item) or itemData and (itemData.requirement or itemData.requires)
    if not requirement then return nil end

    if Gallery.FormatRequirement then return Gallery.FormatRequirement(requirement) end
    if type(requirement) == "string" then return requirement end

    if type(requirement) == "table" then
        if requirement.type == "quest" then
            return "Requires " .. tostring(requirement.questName or requirement.name or requirement.questID or "quest")
        end
        if requirement.type == "renown" and requirement.rank and requirement.faction then
            return "Requires Renown " .. tostring(requirement.rank) .. " with " .. tostring(requirement.faction)
        end
        if requirement.faction and requirement.rank then
            return "Requires " .. tostring(requirement.faction) .. " - " .. tostring(requirement.rank)
        end
        if requirement.faction then
            return "Requires " .. tostring(requirement.faction)
        end
    end
    return tostring(requirement)
end

-- ============================================================
-- Vendor purchase text
-- ============================================================

local function CleanVendorZone(zone)
    if not zone or zone == "" then return nil end
    zone = tostring(zone):gsub("%s+%-%s+.*$", "")
    local afterComma = zone:match(",%s*(.+)$")
    if afterComma and afterComma ~= "" then zone = afterComma end
    zone = zone:gsub("^%s+", ""):gsub("%s+$", "")
    return zone == "" and nil or zone
end

local function CountUniqueVendorPrices(entries)
    local unique = {}
    local count = 0
    for _, entry in ipairs(entries or {}) do
        local detail = entry.detail or entry.details
        local priceText = detail and (NormalizePriceTextForDisplay(detail.priceText) or FormatPriceTable(detail.price))
        if priceText and not unique[priceText] then
            unique[priceText] = true
            count = count + 1
        end
    end
    return count
end

local function StripRequiresPrefix(reqText)
    if not reqText then return nil end
    reqText = tostring(reqText):gsub("^%s*[Rr]equire:%s*", ""):gsub("^%s*[Rr]equires:%s*", ""):gsub("^%s*[Rr]equires%s+", ""):gsub("^%s+", ""):gsub("%s+$", "")
    return reqText == "" and nil or reqText
end

function Gallery.BuildVendorPurchaseText(item)
    local data = GetItemData(item)
    local entries = Gallery.GetSoldByEntries and Gallery.GetSoldByEntries(item) or {}
    if #entries == 0 then return nil end

    for _, entry in ipairs(entries) do entry.item = item end
    local uniquePriceCount = CountUniqueVendorPrices(entries)
    local lines = {}
    local sharedRequirementText
    local mixedRequirements = false

    for _, entry in ipairs(entries) do
        local reqText = Gallery.GetRequirementTextForVendorEntry and Gallery.GetRequirementTextForVendorEntry(entry, data)
        reqText = StripRequiresPrefix(reqText)
        if reqText then
            if not sharedRequirementText then
                sharedRequirementText = reqText
            elseif sharedRequirementText ~= reqText then
                mixedRequirements = true
            end
        end
    end

    if sharedRequirementText and not mixedRequirements then
        table.insert(lines, "|cffffd100Requires:|r " .. sharedRequirementText)
        table.insert(lines, "")
    end

    for index, entry in ipairs(entries) do
        local vendor = entry.vendor or {}
        local detail = entry.detail or entry.details or {}
        local vendorName = detail.vendorName or detail.name or vendor.title or vendor.name or "Unknown Vendor"
        local zone = CleanVendorZone(detail.displayZone or detail.zone or vendor.zone or data.zone)

        local line = "|cff80ccffPurchase from|r |cffffd100" .. tostring(vendorName) .. "|r"
        if zone then line = line .. "\n |cffaaaaaaIn " .. tostring(zone) .. "|r" end
        table.insert(lines, line)

        local vendorNote = detail.note or detail.vendorNote or detail.locationNote
        if vendorNote and vendorNote ~= "" then table.insert(lines, "   |cffaaaaaaNote: " .. tostring(vendorNote) .. "|r") end

        local priceText = NormalizePriceTextForDisplay(detail.priceText) or FormatPriceTable(detail.price)
        if uniquePriceCount > 1 and priceText then table.insert(lines, "   |cffffd100Cost: " .. tostring(priceText) .. "|r") end

        if mixedRequirements then
            local reqText = Gallery.GetRequirementTextForVendorEntry and Gallery.GetRequirementTextForVendorEntry(entry, data)
            reqText = StripRequiresPrefix(reqText)
            if reqText then table.insert(lines, "   |cffffd100Requires: " .. reqText .. "|r") end
        end

        if index < #entries then table.insert(lines, "") end
    end

    return table.concat(lines, "\n")
end

-- ============================================================
-- Main DecorVendor source lookup/actions
-- ============================================================

local function GalleryRowMatchesItemID(row, itemID)
    if type(row) ~= "table" or not itemID then return false end
    itemID = tonumber(itemID)
    local directItemID = row.itemID or row.itemId or row.item or row.item_id

    if tonumber(directItemID) == itemID then return true end
    if tonumber(row.id) == itemID then
        if row.model3D or row.decorID or row.bossencounter or row.encounterID or row.mapID or row.note or row.name or row.title then
            return true
        end
    end
    return false
end

local function GalleryScanSourceTable(root, itemID, sourceKey, results, seen)
    if type(root) ~= "table" or seen[root] then return end
    seen[root] = true

    if GalleryRowMatchesItemID(root, itemID) then
        table.insert(results, { sourceKey = sourceKey, row = root })
    end

    for _, child in pairs(root) do
        if type(child) == "table" then GalleryScanSourceTable(child, itemID, sourceKey, results, seen) end
    end
end

function Gallery.GetMainSourceRowsForItem(item)
    local itemID = GetItemID(item)
    if not itemID then return {} end

    local results = {}
    local seen = {}
    local sourceTables = {
        { key = "boss",        root = DVD.bossdrops },
        { key = "drop",        root = DVD.drops },
        { key = "event",       root = DVD.events },
        { key = "treasure",    root = DVD.treasures or DVD.treasure },
        { key = "quest",       root = DVD.quests },
        { key = "achievement", root = DVD.achievements },
        { key = "profession",  root = DVD.professions },
    }

    for _, sourceInfo in ipairs(sourceTables) do
        GalleryScanSourceTable(sourceInfo.root, itemID, sourceInfo.key, results, seen)
    end
    return results
end

local function GalleryAddLocation(locations, mapID, x, y, title)
    mapID, x, y = tonumber(mapID), tonumber(x), tonumber(y)
    if mapID and x and y then
        table.insert(locations, { mapID = mapID, x = x, y = y, title = title or "Decor Location" })
    end
end

local function GalleryCollectLocationsFromRow(row)
    local locations = {}
    if type(row) ~= "table" then return locations end
    local title = row.pinTitle or row.locationName or row.rareName or row.dropName or row.name or row.title or "Decor Location"

    GalleryAddLocation(locations, row.mapID or row.mapId, row.x or row.coordX, row.y or row.coordY, title)
    local locationTables = { row.locations, row.waypoints, row.pins, row.mapPins }

    for _, locationTable in ipairs(locationTables) do
        if type(locationTable) == "table" then
            for _, loc in pairs(locationTable) do
                if type(loc) == "table" then
                    local locMapID, locX, locY
                    if loc.mapID or loc.mapId then
                        locMapID = loc.mapID or loc.mapId
                        locX = loc.x or loc.coordX or loc[1]
                        locY = loc.y or loc.coordY or loc[2]
                    elseif loc[3] then
                        locMapID, locX, locY = loc[1], loc[2], loc[3]
                    else
                        locMapID = row.mapID or row.mapId
                        locX, locY = loc[1], loc[2]
                    end
                    GalleryAddLocation(locations, locMapID, locX, locY, loc.title or loc.name or loc.rareName or title)
                end
            end
        end
    end
    return locations
end

function Gallery.GetSpecialActionForItem(item)
    if not item then return nil end
    local itemDetails = Gallery.GetItemDetailsForItem and Gallery.GetItemDetailsForItem(item) or {}
    local data = GetItemData(item)
    local rows = Gallery.GetMainSourceRowsForItem and Gallery.GetMainSourceRowsForItem(item) or {}

    local allLocations = {}
    local seenLocations = {}
    local actionTitle
local vendorDetails =
    Gallery.GetVendorDetailsForItem
    and Gallery.GetVendorDetailsForItem(item)
    or nil

local function GetVendorSourceAction()
    if type(vendorDetails) ~= "table" then
        return nil
    end

    for vendorID, detail in pairs(vendorDetails) do
        if type(detail) == "table" then
            local key =
                detail.sourceAction
                or detail.mapAction
                or detail.locationAction
                or detail.rareEvent
                or detail.eventName

            if key and key ~= "" then
                return key
            end
        end
    end

    return nil
end

local vendorSourceAction = GetVendorSourceAction()
    local function AddLocation(mapID, x, y, title, zone)
        mapID, x, y = tonumber(mapID), tonumber(x), tonumber(y)
        if not mapID or not x or not y then return end
        local key = tostring(mapID) .. ":" .. tostring(x) .. ":" .. tostring(y) .. ":" .. tostring(title or "")

        if seenLocations[key] then return end
        seenLocations[key] = true
        table.insert(allLocations, { mapID = mapID, x = x, y = y, title = title or "Decor Location", zone = zone })
    end

    for _, result in ipairs(rows) do
        local row = result.row or {}

        local eventKey =
        row.bossevent
        or row.rareEvent
        or row.sourceAction
        or row.eventName
        or row.dropName

        or itemDetails.sourceAction
        or itemDetails.bossevent
        or itemDetails.rareEvent
        or itemDetails.eventName
        or itemDetails.dropName
		
		or vendorSourceAction

        or data.sourceAction
        or data.bossevent
        or data.rareEvent
        or data.eventName
        or data.dropName

        local rares =
            eventKey
            and DVD.rareEvents
            and DVD.rareEvents[eventKey]

        if type(rares) == "table" then
            actionTitle =
                row.bossevent
                or row.dropName
                or row.name
                or row.title
                or itemDetails.dropName
                or eventKey
                or "Decor Locations"

            for _, rare in ipairs(rares) do
                if type(rare) == "table" then
                    AddLocation(
                        rare.mapID or row.mapID or itemDetails.mapID or data.mapID,
                        rare.x,
                        rare.y,
                        rare.title or rare.name or actionTitle,
                        rare.zone or row.zone
                    )
                end
            end
        end

        if GalleryCollectLocationsFromRow then
            local locations = GalleryCollectLocationsFromRow(row)

            for _, location in ipairs(locations or {}) do
                AddLocation(
                    location.mapID or row.mapID,
                    location.x,
                    location.y,
                    location.title or row.name or row.title or actionTitle,
                    location.zone or row.zone
                )
            end
        end
    end

    if #allLocations > 0 then
        local parentActionKey = itemDetails.sourceAction or data.sourceAction or vendorSourceAction or itemDetails.bossevent or data.bossevent or itemDetails.rareEvent or data.rareEvent or itemDetails.eventName or data.eventName or itemDetails.dropName or data.dropName
        local parentAction = parentActionKey and Gallery.C and Gallery.C.SOURCE_ACTIONS and Gallery.C.SOURCE_ACTIONS[parentActionKey]
        local openMapID = parentAction and (parentAction.openMapID or parentAction.parentMapID or parentAction.mapID)

        return {
            type = "map",
            title = (parentAction and parentAction.label) or actionTitle or itemDetails.dropName or data.dropName or "Decor Locations",
            locations = allLocations,
            openMapID = openMapID,
        }
    end

    for _, result in ipairs(rows) do
        local row = result.row or {}
        local encounterID = row.encounterID or row.journalEncounterID or row.bossencounter or itemDetails.encounterID or itemDetails.bossencounter or data.encounterID or data.bossencounter
        local instanceID = row.instanceID or row.journalInstanceID or row.ejInstanceID or itemDetails.instanceID or itemDetails.journalInstanceID or data.instanceID or data.journalInstanceID

        if instanceID and encounterID then
            return {
                type = "journal",
                instanceID = instanceID,
                encounterID = encounterID,
                difficultyID = row.difficultyID or itemDetails.difficultyID or data.difficultyID or 1,
                title = row.name or row.title or itemDetails.dropName or data.dropName or "Boss Drop",
            }
        end
    end

    do
        local encounterID = itemDetails.encounterID or itemDetails.bossencounter or data.encounterID or data.bossencounter
        local instanceID = itemDetails.instanceID or itemDetails.journalInstanceID or data.instanceID or data.journalInstanceID
        if instanceID and encounterID then
            return {
                type = "journal",
                instanceID = instanceID,
                encounterID = encounterID,
                difficultyID = itemDetails.difficultyID or data.difficultyID or 1,
                title = itemDetails.dropName or itemDetails.bossName or data.dropName or data.bossName or "Boss Drop",
            }
        end
    end
    
    local possibleKeys = { itemDetails.sourceAction, data.sourceAction, vendorSourceAction, itemDetails.bossevent, data.bossevent, itemDetails.rareEvent, data.rareEvent, itemDetails.eventName, data.eventName, itemDetails.dropName, data.dropName, itemDetails.delveName, data.delveName, itemDetails.treasureName, data.treasureName }
    for _, key in ipairs(possibleKeys) do
        local action = key and Gallery.C and Gallery.C.SOURCE_ACTIONS and Gallery.C.SOURCE_ACTIONS[key]
        if type(action) == "table" then
            if action.type == "map" then
                local locations = {}
                if type(action.locations) == "table" then
                    for _, loc in ipairs(action.locations) do
                        if type(loc) == "table" then
                            local mapID = loc.mapID or action.mapID
                            if mapID and loc.x and loc.y then
                                table.insert(locations, { mapID = mapID, x = loc.x, y = loc.y, title = loc.title or loc.name or loc.label or action.label or key, zone = loc.zone or action.zone })
                            end
                        end
                    end
                elseif action.mapID and action.x and action.y then
                    table.insert(locations, { mapID = action.mapID, x = action.x, y = action.y, title = action.label or key, zone = action.zone })
                end

                if #locations > 0 then
                    return { type = "map", title = action.label or key, locations = locations, openMapID = action.openMapID or action.parentMapID or action.mapID }
                end
            end

            if action.type == "worldmap" and action.mapID then
                return { type = "worldmap", mapID = action.mapID, title = action.label or key }
            end

            if action.type == "journal" then
                local encounterID = action.encounterID or action.bossencounter
                local instanceID = action.instanceID or action.journalInstanceID
                if instanceID and encounterID then
                    return { type = "journal", instanceID = instanceID, encounterID = encounterID, difficultyID = action.difficultyID or 1, title = action.label or key }
                end
            end
        end
    end

    for _, result in ipairs(rows) do
        if result.row and result.row.mapID then
            return { type = "worldmap", mapID = result.row.mapID, title = result.row.name or result.row.title or itemDetails.dropName or data.dropName or "Boss Map" }
        end
    end

    if itemDetails.mapID and not itemDetails.x and not itemDetails.y then
        return { type = "worldmap", mapID = itemDetails.mapID, title = itemDetails.dropName or itemDetails.bossName or "Map" }
    end

    if data.mapID and not data.x and not data.y then
        return { type = "worldmap", mapID = data.mapID, title = data.dropName or data.bossName or itemDetails.dropName or "Map" }
    end

    return nil
end

function Gallery.SetGalleryMapWaypoints(action)
    if not action or type(action.locations) ~= "table" or #action.locations == 0 then
        print("|cffff4040Decor Vendor Gallery:|r No locations found for this source.")
        return false
    end

    local firstLocation = action.locations[1]
    local openMapID = tonumber(action.openMapID or action.parentMapID or action.mapID)
    local hasTomTom = TomTom and TomTom.AddWaypoint

    for _, location in ipairs(action.locations) do
        local mapID, x, y = tonumber(location.mapID), tonumber(location.x), tonumber(location.y)
        if mapID and x and y then
            local nx = x > 1 and x / 100 or x
            local ny = y > 1 and y / 100 or y
            local title = location.title or location.name or action.title or "Decor Location"
            if location.zone then title = tostring(title) .. " - " .. tostring(location.zone) end

            if hasTomTom then
                TomTom:AddWaypoint(mapID, nx, ny, { title = title, persistent = false, minimap = true, world = true })
            end
        end
    end

    if not hasTomTom then
        if openMapID then
            print("|cffffd100Decor Vendor Gallery:|r TomTom is needed to pin all delve entrances. Opening the overview map instead.")
        elseif firstLocation then
            local mapID, x, y = tonumber(firstLocation.mapID), tonumber(firstLocation.x), tonumber(firstLocation.y)
            if mapID and x and y and C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                local nx, ny = x > 1 and x / 100 or x, y > 1 and y / 100 or y
                local point
                if UiMapPoint.CreateFromCoordinates then point = UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                elseif UiMapPoint.CreateFromVector2D and CreateVector2D then point = UiMapPoint.CreateFromVector2D(mapID, CreateVector2D(nx, ny)) end
                if point then
                    C_Map.SetUserWaypoint(point)
                    if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then C_SuperTrack.SetSuperTrackedUserWaypoint(true) end
                end
            end
        end
    end

    local mapToOpen = tonumber(openMapID or (firstLocation and firstLocation.mapID))
    if mapToOpen then
        C_Timer.After(0.05, function()
            if C_Map and C_Map.OpenWorldMap then C_Map.OpenWorldMap(mapToOpen) return end
            if WorldMapFrame then ShowUIPanel(WorldMapFrame) if WorldMapFrame.SetMapID then WorldMapFrame:SetMapID(mapToOpen) end
            elseif OpenWorldMap then OpenWorldMap(mapToOpen) end
        end)
    end

    print("|cff00ccffDecor Vendor Gallery:|r Location pins added for " .. tostring(action.title or "decor source") .. ".")
    return true
end

function Gallery.OpenJournalForItemAction(action)
    if not action then return false end
    local instanceID, encounterID, difficultyID = tonumber(action.instanceID), tonumber(action.encounterID), tonumber(action.difficultyID) or 1
    if not instanceID or not encounterID then print("|cffff4040Decor Vendor Gallery:|r Missing instanceID or encounterID for Encounter Journal action.") return false end

    if EncounterJournal_LoadUI then EncounterJournal_LoadUI() end
    if EncounterJournal then ShowUIPanel(EncounterJournal) end
    if EJ_SetDifficulty then pcall(EJ_SetDifficulty, difficultyID) end
    if EJ_SelectInstance then pcall(EJ_SelectInstance, instanceID) end

    if EJ_SelectEncounter then
        if C_Timer and C_Timer.After then
            C_Timer.After(0.10, function()
                if EncounterJournal then ShowUIPanel(EncounterJournal) end
                pcall(EJ_SelectEncounter, encounterID)
            end)
        else pcall(EJ_SelectEncounter, encounterID) end
        return true
    end

    if EncounterJournal_OpenJournal then EncounterJournal_OpenJournal(difficultyID, instanceID, encounterID) return true end
    print("|cffff4040Decor Vendor Gallery:|r Could not open Encounter Journal.")
    return false
end

function Gallery.RunSpecialItemAction(item)
    local action = Gallery.GetSpecialActionForItem and Gallery.GetSpecialActionForItem(item)
    if not action then return false end
    if action.type == "journal" then return Gallery.OpenJournalForItemAction(action) end
    if action.type == "map" then return Gallery.SetGalleryMapWaypoints(action) end
    if action.type == "worldmap" then return Gallery.OpenWorldMapForAction(action) end
    return false
end

function Gallery.OpenWorldMapForAction(action)
    if not action or not action.mapID then return false end
    local mapID = tonumber(action.mapID)
    if not mapID then return false end

    if C_Map and C_Map.OpenWorldMap then C_Map.OpenWorldMap(mapID) return true end
    if WorldMapFrame then ShowUIPanel(WorldMapFrame) if WorldMapFrame.SetMapID then WorldMapFrame:SetMapID(mapID) end return true end
    return false
end

-- ============================================================
-- Preview source/details text
-- ============================================================

local function AddLine(lines, text)
    if text and text ~= "" then table.insert(lines, text) end
end

local function AddBlank(lines)
    if #lines > 0 and lines[#lines] ~= "" then table.insert(lines, "") end
end

local function GetSourceHeader(item)
    if Gallery.GetSourceSummaryText then
        local text = Gallery.GetSourceSummaryText(item)
        if text and text ~= "" then return text end
    end

    if Gallery.GetSourceTextForItem then
        local text = Gallery.GetSourceTextForItem(item)
        if text and text ~= "" then return text end
    end

    local source = Gallery.GetDetailField(item, "source") or Gallery.GetDetailField(item, "sourceType") or "Unknown"
    local labels = Gallery.C and Gallery.C.SOURCE_LABELS
    if labels and labels[source] then return labels[source] end
    return tostring(source)
end

local function CleanDisplayText(text)
    if type(text) ~= "string" then return nil end
    text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("^%s+", ""):gsub("%s+$", "")
    return text == "" and nil or text
end

local function AddUniqueText(list, seen, text)
    text = CleanDisplayText(text)
    if not text or seen[text] then return end
    seen[text] = true
    table.insert(list, text)
end

local function FindBestMainSourceRowForEvent(item, eventKey)
    local rows = Gallery.GetMainSourceRowsForItem and Gallery.GetMainSourceRowsForItem(item) or {}
    for _, result in ipairs(rows) do
        local row = result.row or {}
        if row.bossevent == eventKey or row.rareEvent == eventKey or row.sourceAction == eventKey or row.eventName == eventKey or row.dropName == eventKey then
            return row
        end
    end
    return rows[1] and rows[1].row or nil
end

function Gallery.BuildEventDropSourceText(item)
    if not item then return nil end
    local itemDetails = Gallery.GetItemDetailsForItem and Gallery.GetItemDetailsForItem(item) or {}
    local data = GetItemData(item)

    local eventKey = itemDetails.sourceAction or data.sourceAction or itemDetails.bossevent or data.bossevent or itemDetails.rareEvent or data.rareEvent or itemDetails.eventName or data.eventName or itemDetails.dropName or data.dropName or GetCatalogLineValue(item, "Drop")
    eventKey = CleanDisplayText(eventKey)
    if not eventKey then return nil end

    local action = Gallery.C and Gallery.C.SOURCE_ACTIONS and Gallery.C.SOURCE_ACTIONS[eventKey]
    local row = FindBestMainSourceRowForEvent(item, eventKey)
    local rareEvents = DVD and DVD.rareEvents and DVD.rareEvents[eventKey]

    if type(action) ~= "table" and type(rareEvents) ~= "table" then return nil end

    local locations, zones, zoneOrder, zoneSeen, locationSeen = {}, {}, {}, {}, {}
    local function AddLocation(title, zone, mapID, x, y, hasExplicitTitle)
        title, zone = CleanDisplayText(title), CleanDisplayText(zone)
        local listTitle = (hasExplicitTitle and title and title ~= "") and title or nil
        local key = tostring(title or "") .. "|" .. tostring(zone or "") .. "|" .. tostring(mapID or "") .. "|" .. tostring(x or "") .. "|" .. tostring(y or "")

        if locationSeen[key] then return end
        locationSeen[key] = true
        table.insert(locations, { title = title, listTitle = listTitle, zone = zone, mapID = mapID, x = x, y = y })

        if zone then
            if not zones[zone] then zones[zone] = {} end
            if listTitle then table.insert(zones[zone], listTitle) end
            if not zoneSeen[zone] then zoneSeen[zone] = true table.insert(zoneOrder, zone) end
        end
    end

    local usedActionLocations = false
    if type(action) == "table" and type(action.locations) == "table" then
        usedActionLocations = true
        for _, loc in ipairs(action.locations) do
            if type(loc) == "table" then
                local explicitTitle = loc.title or loc.name
                AddLocation(explicitTitle, loc.zone or action.zone, loc.mapID or action.mapID, loc.x, loc.y, explicitTitle ~= nil)
            end
        end
    end

    if not usedActionLocations and type(rareEvents) == "table" then
        for _, rare in ipairs(rareEvents) do
            if type(rare) == "table" then
                local explicitTitle = rare.title or rare.name
                AddLocation(explicitTitle, rare.zone or (row and row.zone) or data.zone, rare.mapID or (row and row.mapID) or data.mapID, rare.x, rare.y, explicitTitle ~= nil)
            end
        end
    end

    local eventLabel = (action and action.label) or (row and row.bossevent) or (row and row.eventName) or eventKey
    local lines = {}
    AddLine(lines, "|cff00ffffEvent:|r " .. tostring(eventLabel))

    if #zoneOrder <= 1 then
        local locationText = zoneOrder[1] or CleanDisplayText(row and row.zone) or CleanDisplayText(data.zone) or CleanDisplayText(action and action.zone)
        if locationText then AddLine(lines, "|cff00ffffLocation:|r " .. tostring(locationText)) end

        local dropNames = {}
        for _, loc in ipairs(locations) do if loc.listTitle then table.insert(dropNames, loc.listTitle) end end
        if #dropNames > 0 then
            AddBlank(lines)
            AddLine(lines, "|cff00ff66Note:|r Drops from:")
            for _, dropName in ipairs(dropNames) do AddLine(lines, "• " .. tostring(dropName)) end
        end
        return table.concat(lines, "\n")
    end

    AddLine(lines, "|cff00ffffLocation:|r Multiple delve entrances")
    local hasEntranceNames = false
    for _, zone in ipairs(zoneOrder) do if #(zones[zone] or {}) > 0 then hasEntranceNames = true break end end

    if hasEntranceNames then
        AddBlank(lines)
        AddLine(lines, "|cff00ff66Entrances:|r")
        for _, zone in ipairs(zoneOrder) do
            local names = zones[zone] or {}
            if #names > 0 then AddLine(lines, "|cffffd100" .. tostring(zone) .. ":|r " .. table.concat(names, ", ")) end
        end
    end
    return table.concat(lines, "\n")
end

function Gallery.BuildPreviewSourceText(item)
    if not item then
        return "Unknown"
    end

    local itemDetails = Gallery.GetItemDetailsForItem(item) or {}
    local data = GetItemData(item) or {}
    local lines = {}

    local function GetSourceActionNote()
        local possibleKeys = {
            itemDetails.sourceAction,
            data.sourceAction,
            itemDetails.bossevent,
            data.bossevent,
            itemDetails.rareEvent,
            data.rareEvent,
            itemDetails.eventName,
            data.eventName,
            itemDetails.dropName,
            data.dropName,
            itemDetails.delveName,
            data.delveName,
            itemDetails.treasureName,
            data.treasureName,
        }

        for _, key in ipairs(possibleKeys) do
            local action = key and Gallery.C and Gallery.C.SOURCE_ACTIONS and Gallery.C.SOURCE_ACTIONS[key]
            if type(action) == "table" and action.note then
                return action.note
            end
        end

        return nil
    end

    local function NormalizeNoteText(text)
        return tostring(text or ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("%s+", " "):lower()
    end

    local function GetProfessionText()
        return itemDetails.professionText or itemDetails.profession or data.profession or GetCatalogLineValue(item, "Profession")
    end

    local function GetRecipeText()
        local recipeName = itemDetails.recipeName or data.recipeName
        local recipeItemID = itemDetails.recipeItemID or data.recipeItemID or itemDetails.recipe or data.recipe

        if recipeName and recipeName ~= "" then
            return tostring(recipeName)
        end

        if recipeItemID then
            return "Recipe Item " .. tostring(recipeItemID)
        end

        return nil
    end

    local eventDropText = Gallery.BuildEventDropSourceText and Gallery.BuildEventDropSourceText(item)

    if eventDropText then
        local prefixLines = {}

        local professionText = GetProfessionText()
        if professionText and professionText ~= "" then
            table.insert(prefixLines, "|cffffd100Profession:|r " .. tostring(professionText))
        end

        local recipeText = GetRecipeText()
        if recipeText and recipeText ~= "" then
            table.insert(prefixLines, "|cffffd100Learned From:|r " .. tostring(recipeText))
        end

        if #prefixLines > 0 then
            eventDropText = table.concat(prefixLines, "\n") .. "\n\n" .. eventDropText
        end

        local extraNote = itemDetails.note or data.note or GetSourceActionNote()

        if extraNote and extraNote ~= "" then
            local existingText = NormalizeNoteText(CleanDisplayText(eventDropText) or eventDropText)
            local noteText = NormalizeNoteText(CleanDisplayText(extraNote) or extraNote)

            if noteText ~= "" and not existingText:find(noteText, 1, true) then
                eventDropText = eventDropText .. "\n\n|cffaaaaaaNote:|r " .. tostring(extraNote)
            end
        end

        return eventDropText
    end

    local function HasSource(sourceKey)
        sourceKey = Gallery.NormalizeSource and Gallery.NormalizeSource(sourceKey) or sourceKey

        local rawSource = Gallery.GetDetailField(item, "source") or Gallery.GetDetailField(item, "sourceType")
        rawSource = Gallery.NormalizeSource and Gallery.NormalizeSource(rawSource) or rawSource

        if rawSource == sourceKey then
            return true
        end

        local dataSources = data.sources

        if type(dataSources) == "table" then
            for _, source in ipairs(dataSources) do
                if (Gallery.NormalizeSource and Gallery.NormalizeSource(source) or source) == sourceKey then
                    return true
                end
            end
        end

        return type(item.sources) == "table" and item.sources[sourceKey] or false
    end

    local function GetAtlasMarkupForSource(sourceKey, size)
        size = size or 16
        local atlas = Gallery.C and Gallery.C.SOURCE_ATLAS_ICONS and Gallery.C.SOURCE_ATLAS_ICONS[sourceKey]
        return (atlas and CreateAtlasMarkup) and CreateAtlasMarkup(atlas, size, size) or nil
    end

    if HasSource("shop") or itemDetails.shopName then
        local icon = GetAtlasMarkupForSource("shop", 16)
        local shopText = itemDetails.shopName or data.shopName or "In-Game Shop"

        AddLine(lines, "|cffffd100In-Game Shop:|r")

        if icon then
            AddLine(lines, icon .. " |cff80ff80" .. tostring(shopText) .. "|r")
        else
            AddLine(lines, "|cff80ff80" .. tostring(shopText) .. "|r")
        end
    end

    -- Quest.
    local questName = itemDetails.questName or data.questName or GetCatalogLineValue(item, "Quest")
    local questID = itemDetails.questID or data.questID
    local questIDs = itemDetails.questIDs or data.questIDs

    if questName or questID or questIDs then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Quest:|r")
        AddLine(lines, "|cff80ff80" .. tostring(questName or "Quest reward") .. "|r")
    end

    -- Achievement.
    local achievementInfo = Gallery.GetAchievementForItem and Gallery.GetAchievementForItem(item)
    local achievementName = itemDetails.achievementName or data.achievementName or (achievementInfo and (achievementInfo.name or achievementInfo.achievementName)) or GetCatalogLineValue(item, "Achievement")
    local achievementID = itemDetails.achievementID or data.achievementID or (achievementInfo and achievementInfo.id)

    if achievementName or achievementID then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Achievement:|r")
        AddLine(lines, "|cff80ff80" .. tostring(achievementName or ("Achievement " .. tostring(achievementID))) .. "|r")
    end

    local achievementCategory = itemDetails.achievementCategory or data.achievementCategory

    if not achievementCategory and (achievementName or achievementID) then
        achievementCategory = itemDetails.category or data.category
    end

    if achievementCategory and (achievementName or achievementID) then
        AddLine(lines, "|cffaaaaaaAchievement Category:|r " .. tostring(achievementCategory))
    else
        local category = itemDetails.category or data.category or GetCatalogLineValue(item, "Category")

        if category then
            AddLine(lines, "|cffaaaaaaCategory:|r " .. tostring(category))
        end
    end

    -- Profession.
    local professionText = GetProfessionText()
    if professionText then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Profession:|r " .. tostring(professionText))
    end

    -- Recipe / Learned From.
    local recipeText = GetRecipeText()
    if recipeText then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Learned From:|r " .. tostring(recipeText))
    end

    -- Drop / Treasure.
    local dropName = itemDetails.dropName or itemDetails.bossName or data.dropName or data.bossName or GetCatalogLineValue(item, "Drop")
    local dropZone = itemDetails.dropZone or itemDetails.zone or itemDetails.location or data.dropZone or data.zone or data.location or GetCatalogLineValue(item, "Location") or GetCatalogLineValue(item, "Zone")

    if dropName then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Drop:|r " .. tostring(dropName))

        if dropZone and dropZone ~= "" then
            AddLine(lines, "|cff00ffffLocation:|r " .. tostring(dropZone))
        end
    end

    local treasureName = itemDetails.treasureName or data.treasureName or GetCatalogLineValue(item, "Treasure")

    if treasureName then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Treasure:|r " .. tostring(treasureName))
    end

    -- Vendor details.
    local vendorText = Gallery.BuildVendorPurchaseText and Gallery.BuildVendorPurchaseText(item)

    if vendorText then
        AddBlank(lines)
        AddLine(lines, vendorText)
    end

    -- Requirement for non-vendor items only.
    local vendorDetails = Gallery.GetVendorDetailsForItem(item)

    local hasVendor =
        data.soldBy
        or data.vendorID
        or (type(vendorDetails) == "table" and next(vendorDetails) ~= nil)
        or vendorText

    if not hasVendor then
        local requirement = GetItemRequirement(item)

        if requirement then
            local reqText

            if Gallery.FormatRequirement then
                reqText = Gallery.FormatRequirement(requirement)
            elseif type(requirement) == "string" then
                reqText = requirement
            end

            reqText = StripRequiresPrefix(reqText)

            if reqText then
                AddBlank(lines)
                AddLine(lines, "|cffffd100Requires:|r " .. reqText)
            end
        end
    end

    -- Notes logic.
    local finalNote = itemDetails.note or data.note 

    if finalNote and finalNote ~= "" then
        local existingText = NormalizeNoteText(CleanDisplayText(table.concat(lines, "\n")) or table.concat(lines, "\n"))
        local noteText = NormalizeNoteText(CleanDisplayText(finalNote) or finalNote)

        if noteText ~= "" and not existingText:find(noteText, 1, true) then
            AddBlank(lines)
            AddLine(lines, "|cffaaaaaaNote:|r " .. tostring(finalNote))
        end
    end

    -- === PERFECT PROMOTION LOGIC HOOK ===
    local promotionType = itemDetails.promotionType or data.promotionType
    local promotionStatus = itemDetails.promotionStatus or data.promotionStatus
    local promotionName = itemDetails.promotionName or data.promotionName

    if promotionType and promotionType ~= "" then
        AddBlank(lines)
        AddLine(lines, "|cffffd100Promotion Event:|r")
        
        local isBeforeEvent = true
        if C_DateAndTime and C_DateAndTime.GetCurrentCalendarTime then
            local serverTime = C_DateAndTime.GetCurrentCalendarTime()
            if serverTime and serverTime.year >= 2026 and serverTime.month >= 6 and serverTime.monthDay >= 16 then
                isBeforeEvent = false
            end
        end

        if isBeforeEvent and promotionStatus ~= "PAST" and promotionStatus ~= "PREVIOUS" then
            AddLine(lines, "|cffb0b0b0" .. tostring(promotionName or promotionType) .. " (Coming Soon on June 16th)|r")
        elseif promotionStatus == "PAST" or promotionStatus == "PREVIOUS" then
            local clockTexture = "|TInterface\\Icons\\Spell_Nature_TimeStop:14:14:0:0|t "
            AddLine(lines, clockTexture .. "|cffde9b6b" .. tostring(promotionName or promotionType) .. " (Ended - Obtainable below)|r")
        else
            local checkTexture = "|TInterface\\RaidFrame\\ReadyCheck-Ready:14:14:0:0|t "
            AddLine(lines, checkTexture .. "|cff19ff19" .. tostring(promotionName or promotionType) .. " (Active Now via Twitch!)|r")
        end
    end

    if #lines == 0 then
        local sourceHeader = GetSourceHeader(item)
        if sourceHeader and sourceHeader ~= "" then
            return sourceHeader
        end
        return "Unknown Source"
    end

    return table.concat(lines, "\n")
end

function Gallery.SetGalleryMapWaypoints(action)
    if not action or type(action.locations) ~= "table" or #action.locations == 0 then
        print("|cffff4040Decor Vendor Gallery:|r No locations found for this source.")
        return false
    end

    local firstLocation = action.locations[1]
    local openMapID = tonumber(action.openMapID or action.parentMapID or action.mapID)
    local hasTomTom = TomTom and TomTom.AddWaypoint

    for _, location in ipairs(action.locations) do
        local mapID = tonumber(location.mapID)
        local x = tonumber(location.x)
        local y = tonumber(location.y)

        if mapID and x and y then
            local nx = x > 1 and x / 100 or x
            local ny = y > 1 and y / 100 or y

            local title = location.title or location.name or action.title or "Decor Location"

            if location.zone then
                title = tostring(title) .. " - " .. tostring(location.zone)
            end

            if hasTomTom then
                TomTom:AddWaypoint(mapID, nx, ny, {
                    title = title,
                    persistent = false,
                    minimap = true,
                    world = true,
                })
            end
        end
    end

    if not hasTomTom then
        if openMapID then
            print("|cffffd100Decor Vendor Gallery:|r TomTom is needed to pin all delve entrances. Opening the overview map instead.")
        elseif firstLocation then
            local mapID = tonumber(firstLocation.mapID)
            local x = tonumber(firstLocation.x)
            local y = tonumber(firstLocation.y)

            if mapID and x and y and C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                local nx = x > 1 and x / 100 or x
                local ny = y > 1 and y / 100 or y

                local point

                if UiMapPoint.CreateFromCoordinates then
                    point = UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                elseif UiMapPoint.CreateFromVector2D and CreateVector2D then
                    point = UiMapPoint.CreateFromVector2D(mapID, CreateVector2D(nx, ny))
                end

                if point then
                    C_Map.SetUserWaypoint(point)

                    if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                    end
                end
            end
        end
    end

    local mapToOpen = tonumber(openMapID or (firstLocation and firstLocation.mapID))

    if mapToOpen then
        C_Timer.After(0.05, function()
            if C_Map and C_Map.OpenWorldMap then
                C_Map.OpenWorldMap(mapToOpen)
                return
            end

            if WorldMapFrame then
                ShowUIPanel(WorldMapFrame)

                if WorldMapFrame.SetMapID then
                    WorldMapFrame:SetMapID(mapToOpen)
                end
            elseif OpenWorldMap then
                OpenWorldMap(mapToOpen)
            end
        end)
    end

    print("|cff00ccffDecor Vendor Gallery:|r Location pins added for " .. tostring(action.title or "decor source") .. ".")

    return true
end

function Gallery.OpenJournalForItemAction(action)
    if not action then
        return false
    end

    local instanceID = tonumber(action.instanceID)
    local encounterID = tonumber(action.encounterID)
    local difficultyID = tonumber(action.difficultyID) or 1

    if not instanceID or not encounterID then
        print("|cffff4040Decor Vendor Gallery:|r Missing instanceID or encounterID for Encounter Journal action.")
        return false
    end

    if EncounterJournal_LoadUI then
        EncounterJournal_LoadUI()
    end

    if EncounterJournal then
        ShowUIPanel(EncounterJournal)
    end

    if EJ_SetDifficulty then
        pcall(EJ_SetDifficulty, difficultyID)
    end

    if EJ_SelectInstance then
        pcall(EJ_SelectInstance, instanceID)
    end

    if EJ_SelectEncounter then
        if C_Timer and C_Timer.After then
            C_Timer.After(0.10, function()
                if EncounterJournal then
                    ShowUIPanel(EncounterJournal)
                end

                pcall(EJ_SelectEncounter, encounterID)
            end)
        else
            pcall(EJ_SelectEncounter, encounterID)
        end

        return true
    end

    if EncounterJournal_OpenJournal then
        EncounterJournal_OpenJournal(difficultyID, instanceID, encounterID)
        return true
    end

    print("|cffff4040Decor Vendor Gallery:|r Could not open Encounter Journal.")
    return false
end

function Gallery.RunSpecialItemAction(item)
    local action = Gallery.GetSpecialActionForItem and Gallery.GetSpecialActionForItem(item)

    if not action then
        return false
    end

    if action.type == "journal" then
        return Gallery.OpenJournalForItemAction(action)
    end

    if action.type == "map" then
        return Gallery.SetGalleryMapWaypoints(action)
    end

    if action.type == "worldmap" then
        return Gallery.OpenWorldMapForAction(action)
    end

    return false
end

function Gallery.OpenWorldMapForAction(action)
    if not action or not action.mapID then
        return false
    end

    local mapID = tonumber(action.mapID)

    if not mapID then
        return false
    end

    if C_Map and C_Map.OpenWorldMap then
        C_Map.OpenWorldMap(mapID)
        return true
    end

    if WorldMapFrame then
        ShowUIPanel(WorldMapFrame)

        if WorldMapFrame.SetMapID then
            WorldMapFrame:SetMapID(mapID)
        end

        return true
    end

    return false
end