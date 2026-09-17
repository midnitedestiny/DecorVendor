-- ============================================================
-- Decor Vendor Gallery — Master Helpers
-- Consolidated Source, Achievement, Item, and Price Utilities
-- ============================================================

local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Gallery Helpers:|r constants are missing.")
    return
end

Gallery.C = C

--------------------------------------------------------------------------------
-- SECTION 5: GALLERY SOURCE INDEXING & NORMALIZATION HELPERS
--------------------------------------------------------------------------------
local SOURCE_ALIASES = C.SOURCE_ALIASES
local SOURCE_ORDER = C.SOURCE_ORDER
local SOURCE_LABELS = C.SOURCE_LABELS

Gallery.sourceIndex = Gallery.sourceIndex or {}
Gallery.activeItemSet = Gallery.activeItemSet or {}

function Gallery.NormalizeSource(rawSource)
    if rawSource == nil then return nil end
    local source = string.lower(tostring(rawSource))
    source = source:gsub("[-_%s]+", "")
    return SOURCE_ALIASES[source]
end

local function ForEachNormalizedSource(sourceTable, callback)
    if type(sourceTable) ~= "table" or type(callback) ~= "function" then return end
    for key, value in pairs(sourceTable) do
        local rawSource
        if type(value) == "string" then
            rawSource = value
        elseif value == true and type(key) == "string" then
            rawSource = key
        end
        local sourceType = Gallery.NormalizeSource(rawSource)
        if sourceType then callback(sourceType) end
    end
end

function Gallery.GetSourceType(itemData)
    if type(itemData) ~= "table" then return "other" end
    local rawSource = itemData.source or itemData.sourceType
    local normalized = Gallery.NormalizeSource(rawSource)
    return normalized or "other"
end

function Gallery.AddSource(itemID, sourceType, detail)
    itemID = tonumber(itemID)
    sourceType = Gallery.NormalizeSource(sourceType)
    if not itemID or not sourceType then return end
    if not Gallery.activeItemSet[itemID] then return end

    local entry = Gallery.sourceIndex[itemID]
    if not entry then
        entry = { types = {}, details = {} }
        Gallery.sourceIndex[itemID] = entry
    end

    entry.types[sourceType] = true
    if not detail then return end

    for _, existing in ipairs(entry.details) do
        if existing.source == sourceType and existing.detail == detail then return end
    end

    table.insert(entry.details, { source = sourceType, detail = detail })
end

function Gallery.AddSourcesFromActiveItem(itemID, itemData)
    if type(itemID) ~= "number" or type(itemData) ~= "table" then return end
    local singleSource = Gallery.NormalizeSource(itemData.source or itemData.sourceType)
    if singleSource then Gallery.AddSource(itemID, singleSource, itemData) end

    ForEachNormalizedSource(itemData.sources, function(sourceType)
        Gallery.AddSource(itemID, sourceType, itemData)
    end)
end

function Gallery.AddSourcesFromGalleryDetails(itemID, itemData)
    itemID = tonumber(itemID)
    if not itemID then return end

    local itemDetails = Gallery.ItemDetails and (Gallery.ItemDetails[itemID] or Gallery.ItemDetails[tostring(itemID)])
    local vendorDetails = Gallery.VendorDetails and (Gallery.VendorDetails[itemID] or Gallery.VendorDetails[tostring(itemID)])

    if type(itemData) == "table" and (itemData.soldBy or itemData.vendorID) then
        Gallery.AddSource(itemID, "vendor", { from = "ActiveItems.soldBy" })
    end

    if type(vendorDetails) == "table" and next(vendorDetails) ~= nil then
        Gallery.AddSource(itemID, "vendor", { from = "GalleryVendorDetails" })
    end

    if type(itemDetails) ~= "table" then return end

    local explicitSource = itemDetails.source or itemDetails.sourceType
    if explicitSource then Gallery.AddSource(itemID, explicitSource, itemDetails) end

    ForEachNormalizedSource(itemDetails.sources, function(sourceType)
        Gallery.AddSource(itemID, sourceType, itemDetails)
    end)

    if itemDetails.questID or itemDetails.questName then Gallery.AddSource(itemID, "quest", itemDetails) end
    if itemDetails.achievementID or itemDetails.achievementName then Gallery.AddSource(itemID, "achievement", itemDetails) end
    if itemDetails.professionText or itemDetails.profession or itemDetails.professionID or itemDetails.professionName then
        Gallery.AddSource(itemID, "profession", itemDetails)
    end
    if itemDetails.dropName or itemDetails.bossName or itemDetails.bossencounter or itemDetails.encounterID or itemDetails.treasureName then
        Gallery.AddSource(itemID, "drop", itemDetails)
    end
end

function Gallery.BuildSourceIndex(activeItems)
    Gallery.sourceIndex = Gallery.sourceIndex or {}
    Gallery.activeItemSet = Gallery.activeItemSet or {}
    wipe(Gallery.sourceIndex)
    wipe(Gallery.activeItemSet)

    activeItems = activeItems or DVD.ActiveItems or {}

    for rawItemID, itemData in pairs(activeItems) do
        local itemID = tonumber(rawItemID)
        if itemID and type(itemData) == "table" then
            Gallery.activeItemSet[itemID] = true
        end
    end

    for itemID in pairs(Gallery.activeItemSet) do
        local itemData = activeItems[itemID] or activeItems[tostring(itemID)] or {}
        Gallery.AddSourcesFromActiveItem(itemID, itemData)
        Gallery.AddSourcesFromGalleryDetails(itemID, itemData)
    end
end

function Gallery.GetItemSources(itemID, itemData)
    local sources = {}
    itemID = tonumber(itemID) or itemID
    local indexed = itemID and Gallery.sourceIndex[itemID]

    if indexed and indexed.types then
        for sourceType in pairs(indexed.types) do
            sources[sourceType] = true
        end
    end

    if type(itemData) == "table" then
        local singleSource = Gallery.NormalizeSource(itemData.source or itemData.sourceType)
        if singleSource then sources[singleSource] = true end

        ForEachNormalizedSource(itemData.sources, function(sourceType)
            sources[sourceType] = true
        end)
    end

    if not next(sources) then sources.other = true end
    return sources
end

function Gallery.GetPrimarySourceType(sources)
    if type(sources) ~= "table" then return "other" end
    for _, sourceType in ipairs(SOURCE_ORDER) do
        if sources[sourceType] then return sourceType end
    end
    return "other"
end

function Gallery.GetSourceLabel(sourceType)
    sourceType = Gallery.NormalizeSource(sourceType) or "other"
    return SOURCE_LABELS[sourceType] or SOURCE_LABELS.other or "Other"
end

function Gallery.GetSourceSummaryText(item)
    if Gallery.GetSourceTextForItem then return Gallery.GetSourceTextForItem(item) end
    return "Unknown"
end

function Gallery.GetSourceTextForItem(item)
    if type(item) ~= "table" then return "Other" end
    local itemData = item.data or item
    local itemID = item.itemID or itemData.itemID
    local sources = Gallery.GetItemSources(itemID, itemData)
    local labels = {}

    for _, sourceType in ipairs(SOURCE_ORDER) do
        if sources[sourceType] and sourceType ~= "other" then
            table.insert(labels, Gallery.GetSourceLabel(sourceType))
        end
    end

    if #labels == 0 then return Gallery.GetSourceLabel("other") end
    return table.concat(labels, " + ")
end

function Gallery.HasSelectedSources()
    local filters = Gallery.filters or {}
    if filters.sources then
        for _, enabled in pairs(filters.sources) do
            if enabled then return true end
        end
    end
    if filters.source and filters.source ~= "all" then return true end
    return false
end

--------------------------------------------------------------------------------
-- SECTION 6: GALLERY ACHIEVEMENT HELPERS & LOOKUPS
--------------------------------------------------------------------------------
local FactionIcons = C.GALLERY_FACTION_ICONS or {}
local Formatting = C.GalleryAchievementFormatting or {}

local function NormalizeFaction(faction)
    faction = string.lower(tostring(faction or "neutral"))
    if faction == "alliance" or faction == "horde" then
        return faction
    end
    return "neutral"
end

function Gallery.GetPlayerFactionKey()
    local faction = UnitFactionGroup("player")
    return NormalizeFaction(faction)
end

function Gallery.GetFactionText(faction)
    faction = NormalizeFaction(faction)
    if faction == "alliance" then
        return "|cff69ccffAlliance|r"
    elseif faction == "horde" then
        return "|cffff4040Horde|r"
    end
    return "|cff80ff80Neutral|r"
end

function Gallery.GetAchievementForItem(item)
    if type(item) ~= "table" then
        return nil
    end

    local itemData = type(item.data) == "table" and item.data or item
    local itemID = tonumber(item.itemID or itemData.itemID)

    local function BuildAchievementResult(achievementID, detail)
        achievementID = tonumber(achievementID)
        if not achievementID then
            return nil
        end

        detail = type(detail) == "table" and detail or {}
        local achievementName, completed, earnedBy = Gallery.GetAchievementNameByID(achievementID)

        return {
            id = achievementID,
            name = detail.achievementName or achievementName,
            title = detail.title or detail.achievementName or achievementName,
            faction = detail.faction or itemData.faction or "neutral",
            completed = completed,
            earnedBy = earnedBy,
        }
    end

    local directAchievementID = itemData.achievementID or item.achievementID or itemData.vendorUnlockAchievementID or item.vendorUnlockAchievementID
    if directAchievementID then
        return BuildAchievementResult(directAchievementID, itemData)
    end

    local indexed = itemID and Gallery.sourceIndex and (Gallery.sourceIndex[itemID] or Gallery.sourceIndex[tostring(itemID)])
    if indexed and type(indexed.details) == "table" then
        for _, entry in ipairs(indexed.details) do
            if entry.source == "achievement" and type(entry.detail) == "table" then
                local detail = entry.detail
                local achievementID = detail.achievementID or detail.achieveID or detail.id
                local result = BuildAchievementResult(achievementID, detail)
                if result then
                    return result
                end
            end
        end
    end

    if type(DVD.achievements) ~= "table" or not itemID then
        return nil
    end

    local visited = {}
    local function ScanAchievementTable(tbl)
        if type(tbl) ~= "table" or visited[tbl] then
            return nil
        end
        visited[tbl] = true

        local tableItemID = tonumber(tbl.itemID)
        local achievementID = tbl.achievementID or tbl.id

        if tableItemID == itemID and achievementID then
            return BuildAchievementResult(achievementID, tbl)
        end

        for _, child in pairs(tbl) do
            if type(child) == "table" then
                local found = ScanAchievementTable(child)
                if found then
                    return found
                end
            end
        end
        return nil
    end

    return ScanAchievementTable(DVD.achievements)
end

function Gallery.GetAchievementSourceText(item)
    local achievement = Gallery.GetAchievementForItem(item)
    if not achievement then
        return nil
    end

    local achievementName = achievement.name or achievement.title or achievement.achievementName or ("Achievement " .. tostring(achievement.id or "?"))
    local factionIcon, factionText = Gallery.GetFactionIconMarkup(achievement.faction)
    local statusText = achievement.completed and "|cff1eff00Earned|r" or "|cffff7777Not Earned|r"

    return "|cffffd100Earn achievement:|r\n" .. factionIcon .. " |cff00aaff" .. achievementName .. "|r\n" .. factionText .. "  •  " .. statusText
end

function Gallery.GetAchievementNameByID(achievementID)
    achievementID = tonumber(achievementID)
    if not achievementID then
        return nil, false, nil
    end

    local achievementName
    local completed = false
    local earnedBy

    if C_AchievementInfo and C_AchievementInfo.GetAchievementInfo then
        local ok, info = pcall(C_AchievementInfo.GetAchievementInfo, achievementID)
        if ok and type(info) == "table" then
            achievementName = info.name or achievementName
            if info.completed or info.wasEarnedByMe then
                completed = true
            end
            if info.earnedBy and info.earnedBy ~= "" then
                completed = true
                earnedBy = info.earnedBy
            end
        end
    end

    if GetAchievementInfo then
        local _, name, _, isCompleted, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedByName = GetAchievementInfo(achievementID)
        achievementName = achievementName or name
        if isCompleted or wasEarnedByMe then
            completed = true
        end
        if earnedByName and earnedByName ~= "" then
            completed = true
            earnedBy = earnedBy or earnedByName
        end
    end

    return achievementName or ("Achievement " .. tostring(achievementID)), completed, earnedBy
end

function Gallery.OpenAchievementByID(achievementID)
    achievementID = tonumber(achievementID)
    if not achievementID then
        return
    end

    if AchievementFrame_LoadUI then
        AchievementFrame_LoadUI()
    elseif C_AddOns and C_AddOns.LoadAddOn then
        pcall(C_AddOns.LoadAddOn, "Blizzard_AchievementUI")
    end

    if OpenAchievementFrameToAchievement then
        OpenAchievementFrameToAchievement(achievementID)
        return
    end

    if AchievementFrame_ToggleAchievementFrame then
        AchievementFrame_ToggleAchievementFrame()
    elseif ToggleAchievementFrame then
        ToggleAchievementFrame()
    end

    if AchievementFrame_SelectAchievement then
        AchievementFrame_SelectAchievement(achievementID)
    elseif AchievementFrame and AchievementFrame.SelectAchievement then
        AchievementFrame:SelectAchievement(achievementID)
    end
end

function Gallery.GetFactionIconMarkup(faction)
    faction = NormalizeFaction(faction)
    local texture = FactionIcons[faction] or FactionIcons.neutral
    local text = Gallery.GetFactionText(faction)

    if not texture then
        return "", text
    end

    local iconSize = tonumber(Formatting.FactionIconSize) or 14
    local markup = string.format("|T%s:%d:%d:0:0|t", texture, iconSize, iconSize)

    return markup, text
end

function Gallery.UpdateAchievementButton(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview
    local button = preview and preview.achievementButton

    if not button then
        return
    end

    button:SetScript("OnClick", nil)
    button:Disable()
    button:SetAlpha(0.55)
    button:Hide()

    local achievement = Gallery.GetAchievementForItem(item)
    if not achievement or not achievement.id then
        return
    end

    button:SetText("Open Achievement")
    button:Show()
    button:Enable()
    button:SetAlpha(1)
    button:SetScript("OnClick", function()
        if Gallery.OpenAchievementByID then
            Gallery.OpenAchievementByID(achievement.id)
        end
    end)
end

--------------------------------------------------------------------------------
-- SECTION 7: GALLERY ITEM UTILITIES & STRING HELPERS
--------------------------------------------------------------------------------
Gallery.catalogInfoCache = Gallery.catalogInfoCache or {}

function Gallery.GetCatalogInfo(decorID, forceRefresh)
    decorID = tonumber(decorID)
    if not decorID then return nil end

    if not forceRefresh and Gallery.catalogInfoCache[decorID] then
        return Gallery.catalogInfoCache[decorID]
    end

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end

    local entryType = Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1
    local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, entryType, decorID, true)

    if not ok or type(info) ~= "table" then return nil end

    Gallery.catalogInfoCache[decorID] = info
    return info
end

function Gallery.ClearCatalogInfoCache()
    Gallery.catalogInfoCache = Gallery.catalogInfoCache or {}
    wipe(Gallery.catalogInfoCache)
end

function Gallery.GetItemName(itemID, itemData)
    itemID = tonumber(itemID)
    itemData = type(itemData) == "table" and itemData or {}

    local decorID = itemData.decorID or itemData.decorId
    local catalogInfo = Gallery.GetCatalogInfo(decorID)

    if catalogInfo and catalogInfo.name and catalogInfo.name ~= "" then
        return catalogInfo.name
    end

    if itemData.name and itemData.name ~= "" then
        return itemData.name
    end

    if C_Item and C_Item.GetItemNameByID and itemID then
        local name = C_Item.GetItemNameByID(itemID)
        if name and name ~= "" then return name end
    end

    if itemID and GetItemInfo then
        local name = GetItemInfo(itemID)
        if name and name ~= "" then return name end
    end

    return "Item " .. tostring(itemID or decorID or "Unknown")
end

function Gallery.GetItemIcon(itemID, itemData)
    itemID = tonumber(itemID)
    itemData = type(itemData) == "table" and itemData or {}

    local decorID = itemData.decorID or itemData.decorId
    local catalogInfo = Gallery.GetCatalogInfo(decorID)

    if catalogInfo and catalogInfo.iconTexture and catalogInfo.iconTexture ~= 0 then
        return catalogInfo.iconTexture
    end

    local databaseIcon = itemData.iconTexture or itemData.iconFileID or itemData.icon
    if databaseIcon and databaseIcon ~= 0 and databaseIcon ~= "" then
        return databaseIcon
    end

    if C_Item and C_Item.GetItemIconByID and itemID then
        local icon = C_Item.GetItemIconByID(itemID)
        if icon then return icon end
    end

    if itemID and GetItemInfo then
        local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
        if icon then return icon end
    end

    return "Interface\\Icons\\INV_Misc_QuestionMark"
end

function Gallery.FormatRequirement(req)
    if req == nil then return nil end

    if type(req) == "string" then
        return req ~= "" and req or nil
    end

    if type(req) ~= "table" then
        return tostring(req)
    end

    local reqType = req.type and string.lower(tostring(req.type)) or nil

    if reqType == "quest" then
        local questName = req.questName or req.title or req.name
        if questName and questName ~= "" then
            return "Requires quest: " .. tostring(questName)
        end
        local questID = req.questID or req.id
        if questID then
            return "Requires quest ID: " .. tostring(questID)
        end
        return "Requires a quest"
    end

    if reqType == "achievement" then
        local achievementName = req.achievementName or req.title or req.name
        if achievementName and achievementName ~= "" then
            return "Requires achievement: " .. tostring(achievementName)
        end
        local achievementID = req.achievementID or req.id
        if achievementID then
            return "Requires achievement ID: " .. tostring(achievementID)
        end
        return "Requires an achievement"
    end

    local faction = req.faction or req.factionName or req.reputation or req.renown or req.subfaction or req.friendship or req.name
    local rank = req.rank or req.level or req.standing or req.value

    if not faction and rank == nil then
        return nil
    end

    if not reqType and faction then
        if DVD.renownFactionIDs and DVD.renownFactionIDs[faction] then
            reqType = "renown"
        elseif DVD.subfactionIDs and DVD.subfactionIDs[faction] then
            reqType = "subfaction"
        elseif DVD.friendshipFactionIDs and DVD.friendshipFactionIDs[faction] then
            reqType = "friendship"
        else
            reqType = "reputation"
        end
    end

    if reqType == "renown" then
        if faction and rank ~= nil then
            return "Requires Renown " .. tostring(rank) .. " with " .. tostring(faction)
        elseif rank ~= nil then
            return "Requires Renown " .. tostring(rank)
        elseif faction then
            return "Requires Renown with " .. tostring(faction)
        end
    end

    if reqType == "reputation" or reqType == "rep" then
        local standing = rank
        if type(rank) == "number" and DVD.reputationRanks then
            standing = DVD.reputationRanks[rank] or rank
        end

        if faction and standing ~= nil then
            return "Requires " .. tostring(faction) .. " - " .. tostring(standing)
        elseif faction then
            return "Requires " .. tostring(faction)
        elseif standing ~= nil then
            return "Requires reputation - " .. tostring(standing)
        end
    end

    if reqType == "subfaction" then
        local standing = rank
        if faction and type(rank) == "number" and DVD.subfactionRanks and DVD.subfactionRanks[faction] then
            standing = DVD.subfactionRanks[faction][rank] or rank
        end

        if faction and standing ~= nil then
            return "Requires " .. tostring(faction) .. " - " .. tostring(standing)
        elseif faction then
            return "Requires " .. tostring(faction)
        end
    end

    if reqType == "friendship" then
        local standing = rank
        if type(rank) == "number" and DVD.friendshipRanks then
            standing = DVD.friendshipRanks[rank] or rank
        end

        if faction and standing ~= nil then
            return "Requires " .. tostring(faction) .. " - " .. tostring(standing)
        elseif faction then
            return "Requires friendship with " .. tostring(faction)
        end
    end

    if faction and rank ~= nil then
        return "Requires " .. tostring(faction) .. " - " .. tostring(rank)
    elseif faction then
        return "Requires " .. tostring(faction)
    elseif rank ~= nil then
        return "Requires rank " .. tostring(rank)
    end

    return nil
end

function Gallery.CleanSortName(name)
    name = tostring(name or "")
    name = name:gsub("|c%x%x%x%x%x%x%x%x", "")
    name = name:gsub("|r", "")
    name = name:gsub("^%s+", "")
    name = name:gsub("%s+$", "")
    name = name:gsub('^"', "")
    name = name:gsub('"$', "")
    return string.lower(name)
end

function Gallery.LuaString(value)
    value = tostring(value or "")
    value = value:gsub("\\", "\\\\")
    value = value:gsub("\r", "\\r")
    value = value:gsub("\n", "\\n")
    value = value:gsub("\t", "\\t")
    value = value:gsub('"', '\\"')
    return '"' .. value .. '"'
end

function Gallery.ShortText(text, maxLen)
    text = tostring(text or "")
    maxLen = math.max(0, tonumber(maxLen) or 26)

    if string.len(text) <= maxLen then
        return text
    end

    if maxLen <= 3 then
        return string.sub("...", 1, maxLen)
    end

    return string.sub(text, 1, maxLen - 3) .. "..."
end

function Gallery.SortItemsAZ(items)
    if type(items) ~= "table" then return end

    table.sort(items, function(a, b)
        a = type(a) == "table" and a or {}
        b = type(b) == "table" and b or {}

        local nameA = a.name or (a.data and a.data.name) or Gallery.GetItemName(a.itemID, a.data) or ""
        local nameB = b.name or (b.data and b.data.name) or Gallery.GetItemName(b.itemID, b.data) or ""

        nameA = Gallery.CleanSortName(nameA)
        nameB = Gallery.CleanSortName(nameB)

        if nameA ~= nameB then
            return nameA < nameB
        end

        local idA = tonumber(a.itemID or a.decorID)
        local idB = tonumber(b.itemID or b.decorID)

        if idA and idB then
            return idA < idB
        end

        return tostring(a.itemID or a.decorID or "") < tostring(b.itemID or b.decorID or "")
    end)
end

--------------------------------------------------------------------------------
-- SECTION 8: GALLERY PRICE FORMATTING & CATALOG STATS HELPERS
--------------------------------------------------------------------------------
local GalleryPriceFormatting = C.GalleryPriceFormatting or {}

local CurrencyIcons = C.CURRENCY_ICONS or C.CurrencyIcons or {}
local INLINE_ICON_SIZE = tonumber(GalleryPriceFormatting.InlineIconSize) or 14
local PART_SEPARATOR = tostring(GalleryPriceFormatting.PartSeparator or "  ")

local PRICE_FIELDS = {
    "price",
    "cost",
    "currencyCost",
    "vendorCost",
    "shopCost",
}

local function FirstNumber(...)
    local limit = select("#", ...)
    for index = 1, limit do
        local rawValue = select(index, ...)
        local numericValue = tonumber(rawValue)
        if numericValue ~= nil then
            return numericValue
        end
    end
    return nil
end

local function GetItemID(item)
    if type(item) ~= "table" then return nil end
    local itemData = item.data or item
    return tonumber(item.itemID or itemData.itemID)
end

local function GetCurrencyIconFileID(currencyID)
    currencyID = tonumber(currencyID)
    if not currencyID then return nil end

    local configuredIcon = CurrencyIcons[currencyID] or CurrencyIcons[tostring(currencyID)]
    if configuredIcon then
        return tonumber(configuredIcon) or configuredIcon
    end

    if C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo then
        local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(currencyID)
        if currencyInfo then
            return currencyInfo.iconFileID or currencyInfo.icon
        end
    end
    return nil
end

local function GetItemIconFileID(itemID)
    itemID = tonumber(itemID)
    if not itemID then return nil end

    if C_Item and C_Item.GetItemIconByID then
        local ok, icon = pcall(C_Item.GetItemIconByID, itemID)
        if ok and icon then return icon end
    end

    if GetItemIcon then
        local ok, icon = pcall(GetItemIcon, itemID)
        if ok and icon then return icon end
    end
    return nil
end

local function GetGoldIconMarkup(size)
    size = tonumber(size) or INLINE_ICON_SIZE or 14
    local icon = C.GOLD_ICON or "Interface\\MoneyFrame\\UI-GoldIcon"
    return string.format("|T%s:%d:%d:0:-1|t", tostring(icon), size, size)
end

local function GetHearthsteelIconMarkup(size)
    size = tonumber(size) or INLINE_ICON_SIZE or 14
    local atlas = C.HEARTHSTEEL_ATLAS
    if not atlas or atlas == "" then return nil end

    if CreateAtlasMarkup then
        return CreateAtlasMarkup(atlas, size, size)
    end
    return string.format("|A:%s:%d:%d:0:-1|a", tostring(atlas), size, size)
end

local function FormatAmountWithIcon(amount, iconFileID, fallbackText)
    amount = tostring(amount or 0)
    if iconFileID then
        return string.format("%s |T%s:%d:%d:0:0|t", amount, tostring(iconFileID), INLINE_ICON_SIZE, INLINE_ICON_SIZE)
    end
    return amount .. " " .. tostring(fallbackText or "Token")
end

function Gallery.CleanPriceText(text)
    if type(text) ~= "string" then return text end

    text = text:gsub("|n", "\n")
    text = text:gsub("\r", "\n")
    text = text:gsub("|c%x%x%x%x%x%x%x%x", "")
    text = text:gsub("|r", "")

    text = text:match("^%s*([^\n]+)") or text

    text = text:gsub("^%s*[Cc]ost:%s*", "")
    text = text:gsub("^%s*[Pp]rice:%s*", "")
    text = text:gsub("^%s*[Bb]uy [Pp]rice:%s*", "")
    text = text:gsub("^%s*[Ss]ell [Pp]rice:%s*", "")
    text = text:gsub("^%s*[Pp]urchase [Pp]rice:%s*", "")

    text = text:gsub("%s+[Vv]endor:.*$", "")
    text = text:gsub("%s+[Pp]urchase from.*$", "")
    text = text:gsub("%s+[Zz]one:.*$", "")
    text = text:gsub("%s+[Ff]action:.*$", "")

    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    if text == "" then return nil end
    return text
end

function Gallery.NormalizePriceTextForDisplay(text)
    text = Gallery.CleanPriceText(text)
    if not text then return nil end

    text = text:gsub(
        "(%d+)%s*|Hcurrency:(%d+)[^|]*|h.-|h",
        function(amount, currencyID)
            local iconFileID = GetCurrencyIconFileID(currencyID)
            return FormatAmountWithIcon(amount, iconFileID, "Currency " .. tostring(currencyID))
        end
    )

    text = text:gsub(
        "(%d+)%s*|Hitem:(%d+)[^|]*|h.-|h",
        function(amount, itemID)
            local iconFileID = GetItemIconFileID(itemID)
            return FormatAmountWithIcon(amount, iconFileID, "Item " .. tostring(itemID))
        end
    )

    local hearthsteelIcon = GetHearthsteelIconMarkup(INLINE_ICON_SIZE)
    if hearthsteelIcon then
        text = text:gsub(
            "(%d[%d,]*)%s+[Hh][Ee][Aa][Rr][Tt][Hh][Ss][Tt][Ee][Ee][Ll]",
            function(amount)
                return tostring(amount) .. " " .. hearthsteelIcon
            end
        )
    end

    local plainGoldAmount = text:match("^%s*(%d[%d,]*)%s*$")
    if plainGoldAmount then
        text = tostring(plainGoldAmount) .. " " .. GetGoldIconMarkup(INLINE_ICON_SIZE)
    end

    return Gallery.CleanPriceText(text)
end

local function FormatSingleCostEntry(entry)
    if entry == nil then return nil end
    if type(entry) == "string" then
        return Gallery.NormalizePriceTextForDisplay(entry)
    end

    if type(entry) == "number" then
        return tostring(entry) .. " " .. GetGoldIconMarkup(INLINE_ICON_SIZE)
    end

    if type(entry) ~= "table" then return nil end

    local directText = entry.priceText or entry.costText or entry.text
    if directText then
        return Gallery.NormalizePriceTextForDisplay(directText)
    end

    local amount = entry.amount or entry.quantity or entry.count or entry.costAmount
    local currencyID = entry.currencyID or entry.currencyId

    if currencyID and amount ~= nil then
        local iconFileID = GetCurrencyIconFileID(currencyID)
        return FormatAmountWithIcon(amount, iconFileID, "Token " .. tostring(currencyID))
    end

    local itemID = entry.itemID or entry.itemId or entry.item
    if itemID and amount ~= nil then
        local iconFileID = GetItemIconFileID(itemID)
        return FormatAmountWithIcon(amount, iconFileID, "Item " .. tostring(itemID))
    end

    local money = entry.money or entry.copper
    if money ~= nil then
        money = tonumber(money)
        if money and GetMoneyString then
            return GetMoneyString(money)
        end
        return money and tostring(money) or nil
    end

    return nil
end

function Gallery.FormatCostText(cost)
    if cost == nil then return nil end
    if type(cost) ~= "table" then
        return FormatSingleCostEntry(cost)
    end

    if #cost > 0 then
        local parts = {}
        for _, entry in ipairs(cost) do
            local formatted = FormatSingleCostEntry(entry)
            if formatted and formatted ~= "" then
                table.insert(parts, formatted)
            end
        end

        if #parts == 0 then return nil end
        return table.concat(parts, PART_SEPARATOR)
    end

    return FormatSingleCostEntry(cost)
end

function Gallery.ExtractCostFromText(text)
    if type(text) ~= "string" or text == "" then return nil end

    text = text:gsub("|n", "\n"):gsub("\r", "\n"):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")

    local cost = text:match("[Cc]ost:%s*([^\n]+)")
        or text:match("[Bb]uy [Pp]rice:%s*([^\n]+)")
        or text:match("[Pp]urchase [Pp]rice:%s*([^\n]+)")
        or text:match("[Ss]ell [Pp]rice:%s*([^\n]+)")
        or text:match("[Pp]rice:%s*([^\n]+)")

    return Gallery.NormalizePriceTextForDisplay(cost)
end

local function GetPriceFromData(data)
    if type(data) ~= "table" then return nil end

    if data.priceText then
        local text = Gallery.NormalizePriceTextForDisplay(data.priceText)
        if text then return text end
    end

    local textCost = Gallery.ExtractCostFromText(data.sourceText)
        or Gallery.ExtractCostFromText(data.catalogSourceText)
        or Gallery.ExtractCostFromText(data.tooltipText)

    if textCost then return textCost end

    for _, fieldName in ipairs(PRICE_FIELDS) do
        local value = data[fieldName]
        if value ~= nil then
            local text = Gallery.FormatCostText(value)
            if text then return text end
        end
    end

    local currencyID = data.currencyID or data.priceCurrencyID
    local currencyAmount = data.currencyAmount or data.amount or data.costAmount or data.priceAmount

    if currencyID and currencyAmount ~= nil then
        return Gallery.FormatCostText({ currencyID = currencyID, amount = currencyAmount })
    end

    local itemID = data.costItemID or data.tokenItemID or data.priceItemID
    local itemAmount = data.costItemAmount or data.tokenAmount or data.priceItemAmount

    if itemID and itemAmount ~= nil then
        return Gallery.FormatCostText({ itemID = itemID, amount = itemAmount })
    end

    local money = data.money or data.copper
    if money ~= nil then
        return Gallery.FormatCostText(money)
    end

    return nil
end

local function GetVendorDetailsPrice(item, itemID)
    if not itemID or type(Gallery.VendorDetails) ~= "table" then return nil end

    local vendorDetails = Gallery.VendorDetails[itemID] or Gallery.VendorDetails[tostring(itemID)]
    if type(vendorDetails) ~= "table" then return nil end

    local directPrice = GetPriceFromData(vendorDetails)
    if directPrice then return directPrice end

    local bestVendor = Gallery.GetBestFactionVendorForItem and Gallery.GetBestFactionVendorForItem(item)
    local bestVendorID = bestVendor and tonumber(bestVendor.id or bestVendor.vendorID)

    if bestVendorID then
        local preferredDetails = vendorDetails[bestVendorID] or vendorDetails[tostring(bestVendorID)]
        local preferredPrice = GetPriceFromData(preferredDetails)
        if preferredPrice then return preferredPrice end
    end

    for _, details in pairs(vendorDetails) do
        local price = GetPriceFromData(details)
        if price then return price end
    end

    return nil
end

function Gallery.GetPriceText(item)
    if type(item) ~= "table" then return nil end

    local itemID = GetItemID(item)
    local itemData = item.data or {}

    if itemID and type(Gallery.ItemDetails) == "table" then
        local itemDetails = Gallery.ItemDetails[itemID] or Gallery.ItemDetails[tostring(itemID)]
        local text = GetPriceFromData(itemDetails)
        if text then return text end
    end

    local vendorText = GetVendorDetailsPrice(item, itemID)
    if vendorText then return vendorText end

    local itemText = GetPriceFromData(itemData)
    if itemText then return itemText end

    if itemID then
        local activeItem = DVD.ActiveItems and (DVD.ActiveItems[itemID] or DVD.ActiveItems[tostring(itemID)])
        if activeItem ~= itemData then
            local activeText = GetPriceFromData(activeItem)
            if activeText then return activeText end
        end
    end

    local decorID = itemData.decorID or item.decorID
    local catalogInfo = Gallery.GetCatalogInfo and decorID and Gallery.GetCatalogInfo(decorID)
    local catalogText = GetPriceFromData(catalogInfo)
    if catalogText then return catalogText end

    return nil
end

function Gallery.GetCatalogStats(item)
    if type(item) ~= "table" then return 0, 0, 0, 0 end

    local data = item.data or {}
    local decorID = data.decorID or item.decorID
    local info = Gallery.GetCatalogInfo and decorID and Gallery.GetCatalogInfo(decorID)

    local stored = FirstNumber(
        data.numStored,
        data.totalNumStored,
        data.quantity,
        info and info.numStored,
        info and info.totalNumStored,
        info and info.quantity
    ) or 0

    local placed = FirstNumber(
        data.numPlaced,
        data.totalNumPlaced,
        info and info.numPlaced,
        info and info.totalNumPlaced
    ) or 0

    local redeemable = FirstNumber(
        data.remainingRedeemable,
        data.numRedeemable,
        info and info.remainingRedeemable,
        info and info.numRedeemable
    ) or 0

    local totalOwned = FirstNumber(
        data.totalOwned,
        data.ownedCount,
        info and info.totalOwned,
        info and info.ownedCount
    )

    if totalOwned == nil then
        totalOwned = stored + placed + redeemable
    end

    return stored, placed, redeemable, totalOwned
end

function Gallery.BuildPreviewStatsText(item)
    local stored, placed, redeemable = Gallery.GetCatalogStats(item)
    local priceText = Gallery.GetPriceText(item)

    local text = "|cffaaaaaaStorage:|r " .. tostring(stored) .. "    |cffaaaaaaPlaced:|r " .. tostring(placed)

    if priceText and priceText ~= "" then
        text = text .. "    |cffffd100Cost:|r " .. priceText
    else
        text = text .. "    |cffaaaaaaRedeemable:|r " .. tostring(redeemable)
    end

    return text
end