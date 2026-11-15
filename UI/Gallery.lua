-- ============================================================
-- Decor Vendor: Gallery.lua
-- Consolidated file. Each section below is one original file,
-- preserved verbatim and wrapped in its own function scope:
-- (function(...) ... end)(...). That gives the section exactly
-- the behavior it had as a separate file - its local variables
-- stay private, and a top-level return or guard clause exits
-- only that section. Sections run in the original .toc order.
-- ============================================================

-- ------------------------------------------------------------
-- SECTION: GalleryCore/GalleryUtils.lua
-- ------------------------------------------------------------
(function(...)
-- ============================================================
-- Decor Vendor Gallery
-- GalleryUtilities.lua
-- Shared graphical UI utilities
-- ============================================================

local addonName, DVD = ...

local Gallery = DVD.Gallery

if not Gallery then
    print("|cffff4040DecorVendor Gallery Utilities:|r DVD.Gallery is missing.")
    return
end

local C =
    DVD.CONSTANTS
    or DVD.C

if not C then
    print("|cffff4040DecorVendor Gallery Utilities:|r constants are missing.")
    return
end

local UtilityStyle =
    C.GalleryUtilityStyle

if not UtilityStyle
or not UtilityStyle.Backdrop then
    print("|cffff4040DecorVendor Gallery Utilities:|r GalleryUtilityStyle.Backdrop is missing.")
    return
end

local BackdropStyle =
    UtilityStyle.Backdrop

-------------------------------------------------
-- Backdrop helper
-------------------------------------------------

function Gallery.SafeSetBackdrop(
    frame,
    backgroundColor,
    borderColor
)
    if not frame
    or type(frame.SetBackdrop) ~= "function" then
        return false
    end

    frame:SetBackdrop({
        bgFile =
            BackdropStyle.BackgroundFile,

        edgeFile =
            BackdropStyle.BorderFile,

        edgeSize =
            BackdropStyle.EdgeSize,

        insets =
            BackdropStyle.Insets,
    })

    if type(backgroundColor) == "table" then
        frame:SetBackdropColor(
            backgroundColor[1] or 0,
            backgroundColor[2] or 0,
            backgroundColor[3] or 0,
            backgroundColor[4] or 1
        )
    end

    if type(borderColor) == "table" then
        frame:SetBackdropBorderColor(
            borderColor[1] or 1,
            borderColor[2] or 1,
            borderColor[3] or 1,
            borderColor[4] or 1
        )
    end

    return true
end

-------------------------------------------------
-- Gallery card cleanup
-------------------------------------------------

function Gallery.ClearCards()
    Gallery.cards =
        Gallery.cards
        or {}

    for _, card in pairs(Gallery.cards) do
        if card then
            if card.Hide then
                card:Hide()
            end

            if card.SetParent then
                card:SetParent(nil)
            end
        end
    end

    wipe(Gallery.cards)
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Helpers/GalleryHelpers.lua
-- ------------------------------------------------------------
(function(...)
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
-- Localization Phase 2, table 1: source key -> DVD.L key.
-- Only custom labels are mapped here. Game-data keys (professions,
-- achievement categories like "Quests"/"Exploration") are NOT in this
-- table on purpose — they fall back to the English Constants label,
-- which is the game client's own name for them.
DVD.SOURCE_L_KEYS = DVD.SOURCE_L_KEYS or {
    all = "SOURCE_ALL", vendor = "SOURCE_VENDOR", shop = "IN_GAME_SHOP",
    talebound = "SOURCE_TALEBOUND", blossomshop = "SOURCE_BLOSSOMSHOP",
    grimtideshop = "SOURCE_GRIMTIDESHOP", lushshop = "SOURCE_LUSHSHOP",
    quest = "SOURCE_QUEST", achievement = "SOURCE_ACHIEVEMENT",
    drop = "SOURCE_DROP", promo = "SOURCE_PROMO", holiday = "SOURCE_HOLIDAY",
    brewfest = "SOURCE_BREWFEST", halloween = "SOURCE_HALLOWEEN",
    winterveil = "SOURCE_WINTERVEIL", catalog = "SOURCE_CATALOG",
    unreleased = "SOURCE_UNRELEASED", collab = "SOURCE_COLLAB",
    expiredcollab = "SOURCE_EXPIREDCOLLAB", expireddecor = "SOURCE_EXPIREDDECOR",
    patch125 = "SOURCE_PATCH125", patch127 = "SOURCE_PATCH127",
    prepurchase = "SOURCE_PREPURCHASE", diablo2 = "SOURCE_DIABLO2",
    rexxar = "SOURCE_REXXAR", diablo4 = "SOURCE_DIABLO4",
    midnight = "SOURCE_MIDNIGHT", forever = "SOURCE_FOREVER",
    pastcharity = "SOURCE_PASTCHARITY", dnd = "SOURCE_DND",
    other = "SOURCE_OTHER",
}
DVD.FILTER_SECTION_L_KEYS = DVD.FILTER_SECTION_L_KEYS or {
    collection = "FILTER_MY_COLLECTION", source_standard = "FILTER_SOURCE",
    source_holiday = "SOURCE_HOLIDAY", source_profession = "FILTER_PROFESSION",
    source_achievement = "SOURCE_ACHIEVEMENT",
    source_prepurchase = "FILTER_EXPANSION_PREPURCHASE",
    source_promos = "FILTER_PROMOS", source_shop = "FILTER_SHOP_DECOR",
    source_gamemode = "FILTER_SPECIAL_GAMEMODE",
    source_expired = "SOURCE_EXPIREDDECOR", source_patch = "FILTER_UPCOMING_PATCH",
}

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
    local lk = DVD.SOURCE_L_KEYS and DVD.SOURCE_L_KEYS[sourceType]
    if lk then return DVD.L[lk] end
    return SOURCE_LABELS[sourceType] or SOURCE_LABELS.other or DVD.L["SOURCE_OTHER"]
end

function Gallery.GetSourceSummaryText(item)
    if Gallery.GetSourceTextForItem then return Gallery.GetSourceTextForItem(item) end
    return DVD.L["UNKNOWN"]
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

    -- If we have specific profession sources, drop the generic "profession" fallback
    local hasSpecificProfession = false
    local specificProfessions = {
        Alchemy = true, Blacksmithing = true, Cooking = true, Enchanting = true,
        Engineering = true, Inscription = true, Jewelcrafting = true,
        ["Junkyard Tinkering"] = true, Leatherworking = true, Tailoring = true
    }

    for k in pairs(sources) do
        if specificProfessions[k] then
            hasSpecificProfession = true
            break
        end
    end

    if hasSpecificProfession then
        sources["profession"] = nil
    end

    -- Also drop "other" if we have any valid source
    if next(sources) ~= nil then
        sources["other"] = nil
    end

    if not next(sources) then sources.other = true end
    return sources
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

    return achievementName or (DVD.L["ACHIEVEMENT_LABEL"] .. " " .. tostring(achievementID)), completed, earnedBy
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

    button:SetText(DVD.L["OPEN_ACHIEVEMENT"])
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

    local text = "|cffaaaaaaStorage:|r " .. tostring(stored) .. "  |cffaaaaaaPlaced:|r " .. tostring(placed)

    if priceText and priceText ~= "" then
        text = text .. "  |cffffd100Cost:|r " .. priceText
    else
        text = text .. "  |cffaaaaaaRedeemable:|r " .. tostring(redeemable)
    end

    return text
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: GalleryCore/FilterHelpers.lua
-- ------------------------------------------------------------
(function(...)
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
end)(...);

-- ------------------------------------------------------------
-- SECTION: GalleryCore/GalleryDetailsBridge.lua
-- ------------------------------------------------------------
(function(...)
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

local addonName, DVD = ...

local Gallery = DVD.Gallery

if not Gallery then
    print("|cffff4040DecorVendor Gallery DetailsBridge:|r DVD.Gallery is missing.")
    return
end

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Gallery DetailsBridge:|r constants are missing.")
    return
end

local SOURCE_ACTIONS = C.SOURCE_ACTIONS or {}
local RARE_EVENTS = C.RARE_EVENTS or {}
local SOURCE_LABELS = C.SOURCE_LABELS or {}

-- GalleryAchievements.lua owns the base achievement lookup.
local BaseGetAchievementForItem = Gallery.GetAchievementForItem

-- ============================================================
-- Basic item/detail helpers
-- ============================================================

local function GetItemData(item)
    if not item then return {} end
    return item.data or item or {}
end

local RawItemIDCache =
    setmetatable(
        {},
        {
            __mode = "k",
        }
    )

local function LookupActiveItemsTable()
    if type(DVD.ActiveItems) == "table" then
        return DVD.ActiveItems
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
        return foundItemID
    end

    return nil
end

local function GetVendorIDFromSoldByEntry(entry)
    if type(entry) == "number"
    or type(entry) == "string" then
        return tonumber(entry)
    end

    if type(entry) ~= "table" then
        return nil
    end

    return tonumber(
        entry.vendorID
        or entry.vendorId
        or entry.npcID
        or entry.npcId
        or entry.id
        or entry[1]
    )
end

local function ForEachSoldByVendor(soldBy, callback)
    if type(callback) ~= "function" then
        return
    end

    if type(soldBy) == "number"
    or type(soldBy) == "string" then
        local vendorID =
            tonumber(soldBy)

        if vendorID then
            callback(
                vendorID,
                soldBy
            )
        end

        return
    end

    if type(soldBy) ~= "table" then
        return
    end

    local seen = {}

    for key, entry in pairs(soldBy) do
        local vendorID

        if entry == true then
            vendorID =
                tonumber(key)
        else
            vendorID =
                GetVendorIDFromSoldByEntry(entry)
        end

        if vendorID
        and not seen[vendorID] then
            seen[vendorID] = true

            callback(
                vendorID,
                entry
            )
        end
    end
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

local function BuildAllowedVendorIDs(item, itemID)
    local allowed = {}
    local hasAllowed = false

    local data =
        GetItemData(item)

    local activeData =
        GetActiveItemDataByID(itemID)

    local soldBy =
        type(data) == "table"
        and (
            data.soldBy
            or data.vendorID
        )
        or nil

    if soldBy == nil
    and type(activeData) == "table" then
        soldBy =
            activeData.soldBy
            or activeData.vendorID
    end

    ForEachSoldByVendor(
        soldBy,
        function(vendorID)
            allowed[vendorID] = true
            hasAllowed = true
        end
    )

    return hasAllowed
        and allowed
        or nil
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
    if type(item) ~= "table" then
        return nil
    end

    local base =
        BaseGetAchievementForItem
        and BaseGetAchievementForItem(item)
        or nil

    local itemDetails =
        Gallery.GetItemDetailsForItem(item)
        or {}

    local data =
        GetItemData(item)

    local achievementID =
        tonumber(
            itemDetails.achievementID
            or itemDetails.achieveID
            or data.achievementID
            or data.achieveID
            or (
                base
                and (
                    base.id
                    or base.achievementID
                )
            )
        )

    local explicitName =
        itemDetails.achievementName
        or data.achievementName
        or GetCatalogLineValue(
            item,
            "Achievement"
        )

    if not achievementID
    and not explicitName then
        return base
    end

    local apiName
    local completed = false
    local earnedBy

    if achievementID
    and Gallery.GetAchievementNameByID then
        apiName,
        completed,
        earnedBy =
            Gallery.GetAchievementNameByID(
                achievementID
            )
    end

    local achievementName =
        explicitName
        or (
            base
            and (
                base.name
                or base.title
                or base.achievementName
            )
        )
        or apiName
        or (
            "Achievement "
            .. tostring(
                achievementID
                or "?"
            )
        )

    return {
        id = achievementID,
        achievementID = achievementID,

        name = achievementName,
        achievementName = achievementName,

        title =
            itemDetails.title
            or data.title
            or (
                base
                and base.title
            ),

        category =
            itemDetails.achievementCategory
            or data.achievementCategory
            or itemDetails.category
            or data.category
            or (
                base
                and base.category
            ),

        faction =
            itemDetails.faction
            or data.faction
            or (
                base
                and base.faction
            )
            or "neutral",

        completed =
            (
                base
                and base.completed
            )
            or completed
            or false,

        earnedBy =
            (
                base
                and base.earnedBy
            )
            or earnedBy,
    }
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

    -- Check if this vendor is tied to a world event and whether it's active
    local eventID = detail.worldEventID or meta.worldEventID or exactVendor.worldEventID
    local eventName = detail.eventName or meta.eventName or exactVendor.eventName
    
    local isEventActive = true -- default active if no event attached
    if eventID or eventName then
        isEventActive = DVD.IsWorldEventActive(eventID, eventName)
        if isEventActive == nil then isEventActive = false end -- treat loading as inactive until confirmed
    end

    -- If event is not active, force noWaypoint to true so the waypoint button hides/disables
    local noWaypoint = not isEventActive or (detail.noWaypoint or meta.noWaypoint or exactVendor.noWaypoint or false)

    local mapID = detail.mapID or detail.mapId or meta.mapID or meta.mapId or exactVendor.mapID or exactVendor.mapId
    local x = detail.x or detail.coordX or meta.x or meta.coordX or exactVendor.x or exactVendor.coordX
    local y = detail.y or detail.coordY or meta.y or meta.coordY or exactVendor.y or exactVendor.coordY
    local zone = detail.displayZone or detail.zone or meta.displayZone or meta.zone or exactVendor.zone
    local hasExactLocation = mapID and x and y and isEventActive

    return {
        id = vendorID,
        title = detail.vendorName or detail.name or meta.vendorName or meta.name or exactVendor.title or exactVendor.name or ("Vendor " .. tostring(vendorID)),
        name = detail.vendorName or detail.name or meta.vendorName or meta.name or exactVendor.name or exactVendor.title or ("Vendor " .. tostring(vendorID)),
        zone = zone,
        mapID = hasExactLocation and mapID or nil,
        x = hasExactLocation and x or nil,
        y = hasExactLocation and y or nil,
        faction = detail.faction or meta.faction or exactVendor.faction,
        expansion = detail.expansion or meta.expansion or exactVendor.expansion,
        variableLocation = false,
        noWaypoint = noWaypoint,
        sourceAction = detail.sourceAction or meta.sourceAction or exactVendor.sourceAction,
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
local soldBy =
    data.soldBy
    or data.vendorID

ForEachSoldByVendor(
    soldBy,
    function(vendorID, soldByEntry)
        AddVendor(
            vendorID,
            nil,
            soldByEntry
        )
    end
)
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
            local mapID =
    tonumber(vendor.mapID)

local nx =
    x > 1
    and x / 100
    or x

local ny =
    y > 1
    and y / 100
    or y

if mapID then
    TomTom:AddWaypoint(
        mapID,
        nx,
        ny,
        {
            title = title,
            persistent = false,
            minimap = true,
            world = true,
        }
    )

    return true
end
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

function Gallery.TrySetVendorWaypoint(item)
    if not item then
        return false
    end

    -------------------------------------------------
    -- 1. Try sourceAction first.
    -- This handles rotating vendors like Celestine / Dreamsurge.
    -------------------------------------------------

local function GetActionByKey(key)
    if not key
    or key == "" then
        return nil
    end

    local action =
        SOURCE_ACTIONS[key]

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
-------------------------------------------------
-- 1. Boss, drop, treasure, event, and map actions
-------------------------------------------------

if Gallery.RunSpecialItemAction
and Gallery.RunSpecialItemAction(item) then
    return true
end

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
local soldBy =
    data.soldBy
    or data.vendorID

ForEachSoldByVendor(
    soldBy,
    function(vendorID, soldByEntry)
        AddVendor(
            vendorID,
            nil,
            soldByEntry
        )
    end
)
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

local function GetDetailPriceText(detail)
    if type(detail) ~= "table" then
        return nil
    end

    local rawText =
        detail.priceText
        or detail.costText

    if rawText then
        if Gallery.NormalizePriceTextForDisplay then
            local text =
                Gallery.NormalizePriceTextForDisplay(
                    rawText
                )

            if text then
                return text
            end
        end

        if Gallery.CleanPriceText then
            local text =
                Gallery.CleanPriceText(
                    rawText
                )

            if text then
                return text
            end
        end
    end

    local structuredCost =
        detail.price
        or detail.cost
        or detail.currencyCost
        or detail.vendorCost

    if structuredCost ~= nil
    and Gallery.FormatCostText then
        return Gallery.FormatCostText(
            structuredCost
        )
    end

    return nil
end

local function CountUniqueVendorPrices(entries)
    local unique = {}
    local count = 0
    for _, entry in ipairs(entries or {}) do
        local detail = entry.detail or entry.details
        local priceText =
    GetDetailPriceText(detail)
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

        local priceText =
    GetDetailPriceText(detail)
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

    -- Direct flat-table lookups for your newly structured tables
    local sourceTables = {
        { key = "boss",    root = DVD.bossdrops },
        { key = "drop",    root = DVD.drops },
        { key = "event",   root = DVD.events },
        { key = "treasure",root = DVD.treasures or DVD.treasure },
        { key = "quest",   root = DVD.quests },
        { key = "achievement", root = DVD.achievements },
        { key = "profession",  root = DVD.professions },
    }

    for _, sourceInfo in ipairs(sourceTables) do
        local root = sourceInfo.root
        if type(root) == "table" then
            -- Check if it's stored directly by itemID (flat map)
            if root[itemID] and type(root[itemID]) == "table" then
                table.insert(results, { sourceKey = sourceInfo.key, row = root[itemID] })
            elseif root[tostring(itemID)] and type(root[tostring(itemID)]) == "table" then
                table.insert(results, { sourceKey = sourceInfo.key, row = root[tostring(itemID)] })
            else
                -- Fallback to recursive scan for any legacy nested structures
                GalleryScanSourceTable(root, itemID, sourceInfo.key, results, seen)
            end
        end
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
    and RARE_EVENTS
    and RARE_EVENTS[eventKey]

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
        local parentAction = parentActionKey and Gallery.C and SOURCE_ACTIONS and SOURCE_ACTIONS[parentActionKey]
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
        local action = key and Gallery.C and SOURCE_ACTIONS and SOURCE_ACTIONS[key]
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
    local labels = Gallery.C and SOURCE_LABELS
    local lk = DVD.SOURCE_L_KEYS and DVD.SOURCE_L_KEYS[source]
    if lk then return DVD.L[lk] end
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

    local action = Gallery.C and SOURCE_ACTIONS and SOURCE_ACTIONS[eventKey]
    local row = FindBestMainSourceRowForEvent(item, eventKey)
    local rareEvents = C and RARE_EVENTS and RARE_EVENTS[eventKey]

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
    AddLine(lines, "|cff00ffff" .. DVD.L["EVENT_LABEL"] .. "|r " .. tostring(eventLabel))

    if #zoneOrder <= 1 then
        local locationText = zoneOrder[1] or CleanDisplayText(row and row.zone) or CleanDisplayText(data.zone) or CleanDisplayText(action and action.zone)
        if locationText then AddLine(lines, "|cff00ffff" .. DVD.L["LOCATION_LABEL"] .. "|r " .. tostring(locationText)) end

        local dropNames = {}
        for _, loc in ipairs(locations) do if loc.listTitle then table.insert(dropNames, loc.listTitle) end end
        if #dropNames > 0 then
            AddBlank(lines)
            AddLine(lines, "|cff00ff66" .. DVD.L["NOTE_LABEL"] .. "|r " .. DVD.L["DROPS_FROM"])
            for _, dropName in ipairs(dropNames) do AddLine(lines, "• " .. tostring(dropName)) end
        end
        return table.concat(lines, "\n")
    end

    local multiLocationText =
    action
    and action.multiLocationLabel
    or DVD.L["MULTIPLE_LOCATIONS"]

AddLine(
    lines,
    "|cff00ffffLocation:|r "
    .. tostring(multiLocationText)
)
    local hasEntranceNames = false
    for _, zone in ipairs(zoneOrder) do if #(zones[zone] or {}) > 0 then hasEntranceNames = true break end end

    if hasEntranceNames then
        AddBlank(lines)
        AddLine(lines, "|cff00ff66" .. DVD.L["ENTRANCES_LABEL"] .. "|r")
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
            local action = key and Gallery.C and SOURCE_ACTIONS and SOURCE_ACTIONS[key]
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
    sourceKey =
        Gallery.NormalizeSource
        and Gallery.NormalizeSource(sourceKey)
        or sourceKey

    if not sourceKey then
        return false
    end

    local itemID =
        GetItemID(item)

    local sources =
        Gallery.GetItemSources
        and Gallery.GetItemSources(
            itemID,
            data
        )
        or item.sources
        or {}

    return sources[sourceKey] == true
end

if HasSource("shop")
or itemDetails.shopName then
    local shopText =
        itemDetails.shopName
        or data.shopName
        or DVD.L["IN_GAME_SHOP"]

    AddLine(
        lines,
        "|cffffd100" .. DVD.L["IN_GAME_SHOP"] .. ":|r"
    )

    AddLine(
        lines,
        "|cff80ff80"
        .. tostring(shopText)
        .. "|r"
    )
end

    -- Quest.
    local questName = itemDetails.questName or data.questName or GetCatalogLineValue(item, "Quest")
    local questID = itemDetails.questID or data.questID
    local questIDs = itemDetails.questIDs or data.questIDs

    if questName or questID or questIDs then
        AddBlank(lines)
        AddLine(lines, "|cffffd100" .. DVD.L["QUEST_LABEL"] .. "|r")
        AddLine(lines, "|cff80ff80" .. tostring(questName or DVD.L["QUEST_REWARD"]) .. "|r")
    end

    -- Achievement.
    local achievementInfo = Gallery.GetAchievementForItem and Gallery.GetAchievementForItem(item)
    local achievementName = itemDetails.achievementName or data.achievementName or (achievementInfo and (achievementInfo.name or achievementInfo.achievementName)) or GetCatalogLineValue(item, "Achievement")
    local achievementID = itemDetails.achievementID or data.achievementID or (achievementInfo and achievementInfo.id)

    if achievementName or achievementID then
        AddBlank(lines)
        AddLine(lines, "|cffffd100" .. DVD.L["ACHIEVEMENT_LABEL"] .. "|r")
        AddLine(lines, "|cff80ff80" .. tostring(achievementName or (DVD.L["ACHIEVEMENT_LABEL"] .. " " .. tostring(achievementID))) .. "|r")
    end

    local achievementCategory = itemDetails.achievementCategory or data.achievementCategory

    if not achievementCategory and (achievementName or achievementID) then
        achievementCategory = itemDetails.category or data.category
    end

    if achievementCategory and (achievementName or achievementID) then
        AddLine(lines, "|cffaaaaaa" .. DVD.L["ACHIEVEMENT_CATEGORY"] .. "|r " .. tostring(achievementCategory)) 
	end
    --[[else
        local category = itemDetails.category or data.category or GetCatalogLineValue(item, "Category")

        if category then
            AddLine(lines, "|cffaaaaaa" .. DVD.L["CATEGORY_LABEL"] .. "|r " .. tostring(category))
        end
    end]]

    -- Profession.
    local professionText = GetProfessionText()
    if professionText then
        AddBlank(lines)
        AddLine(lines, "|cffffd100" .. DVD.L["PROFESSION_LABEL"] .. "|r " .. tostring(professionText))
    end

    -- Recipe / Learned From.
    local recipeText = GetRecipeText()
    if recipeText then
        AddBlank(lines)
        AddLine(lines, "|cffffd100" .. DVD.L["LEARNED_FROM"] .. "|r " .. tostring(recipeText))
    end

    -- Drop / Treasure.
    local dropName = itemDetails.dropName or itemDetails.bossName or data.dropName or data.bossName or GetCatalogLineValue(item, "Drop")
    local dropZone = itemDetails.dropZone or itemDetails.zone or itemDetails.location or data.dropZone or data.zone or data.location or GetCatalogLineValue(item, "Location") or GetCatalogLineValue(item, "Zone")

    if dropName then
        AddBlank(lines)
        AddLine(lines, "|cffffd100" .. DVD.L["DROP_LABEL"] .. "|r " .. tostring(dropName))

        if dropZone and dropZone ~= "" then
            AddLine(lines, "|cff00ffff" .. DVD.L["LOCATION_LABEL"] .. "|r " .. tostring(dropZone))
        end
    end

    local treasureName = itemDetails.treasureName or data.treasureName or GetCatalogLineValue(item, "Treasure")

    if treasureName then
        AddBlank(lines)
        AddLine(lines, "|cffffd100" .. DVD.L["TREASURE_LABEL"] .. "|r " .. tostring(treasureName))
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
                AddLine(lines, "|cffffd100" .. DVD.L["REQUIRES_LABEL"] .. "|r " .. reqText)
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
            AddLine(lines, "|cffaaaaaa" .. DVD.L["NOTE_LABEL"] .. "|r " .. tostring(finalNote))
        end
    end

local promotionType =
    itemDetails.promotionType
    or data.promotionType

local promotionStatus =
    itemDetails.promotionStatus
    or data.promotionStatus

local promotionName =
    itemDetails.promotionName
    or data.promotionName

if promotionType
and promotionType ~= "" then
    AddBlank(lines)

    AddLine(
        lines,
        "|cffffd100" .. DVD.L["PROMOTION_EVENT"] .. "|r"
    )

    local status =
        string.upper(
            tostring(
                promotionStatus
                or "CURRENT"
            )
        )

    local displayName =
        tostring(
            promotionName
            or promotionType
        )

    if status == "PAST"
    or status == "PREVIOUS"
    or status == "EXPIRED" then
        local clockTexture =
            "|TInterface\\Icons\\Spell_Nature_TimeStop:14:14:0:0|t "

        AddLine(
            lines,
            clockTexture
            .. "|cffde9b6b"
            .. displayName
            .. " " .. DVD.L["PROMO_ENDED"] .. "|r"
        )

    elseif status == "UPCOMING"
    or status == "FUTURE"
    or status == "SOON" then
        AddLine(
            lines,
            "|cffb0b0b0"
            .. displayName
            .. " " .. DVD.L["PROMO_COMING_SOON"] .. "|r"
        )

    else
        local checkTexture =
            "|TInterface\\RaidFrame\\ReadyCheck-Ready:14:14:0:0|t "

        AddLine(
            lines,
            checkTexture
            .. "|cff19ff19"
            .. displayName
            .. " " .. DVD.L["PROMO_ACTIVE_NOW"] .. "|r"
        )
    end
end

-- Fallback for raw catalog / item source text (like Gather nodes)
    if #lines == 0 then
        local rawSourceText = data.sourceText or data.catalogSourceText or GetCatalogSourceText(item)
        if rawSourceText and rawSourceText ~= "" then
            AddLine(lines, CleanCatalogText(rawSourceText))
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

-- ONLY open the map window if an explicit openMapID is defined 
    -- (keeps delves/rares opening the map, while multi-zone vendors stay quiet)
    local mapToOpen = nil
    if action.openMapID or action.parentMapID or action.forceOpenMap then
        mapToOpen = tonumber(action.openMapID or action.parentMapID or action.mapID or (firstLocation and firstLocation.mapID))
    end

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


--[[function Gallery.OpenJournalForItemAction(action)
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
end]]

end)(...);

-- ------------------------------------------------------------
-- SECTION: Frames/GalleryUI.lua
-- ------------------------------------------------------------
(function(...)
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
            itemName = Gallery.GetItemName and Gallery.GetItemName(itemID, itemData) or DVD.L["UNKNOWN_DECOR"]
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
					merged.sourceText = GetUsableValue(activeData.sourceText, record.sourceText)
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
    frame.title:SetText("|cffffd100" .. DVD.L["GALLERY_TITLE"] .. "|r")
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
    frame.mainBtn:SetText(DVD.L["ADDON_TITLE"])
    frame.mainBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine(DVD.L["OPEN_DECOR_VENDOR"], 1, 0.82, 0)
        GameTooltip:AddLine(DVD.L["RETURN_HOME_TOOLTIP"], 0.8, 0.8, 0.8, true)
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
        searchBox.Instructions:SetText(DVD.L["GALLERY_SEARCH_PLACEHOLDER"])
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
    bottom.text:SetText("|cffaaaaaa" .. DVD.L["SHOWING_ZERO_ITEMS"] .. "|r")  
    
    bottom.tipText = bottom:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bottom.tipText:SetPoint("RIGHT", bottom, "RIGHT", -10, 0)
    bottom.tipText:SetJustifyH("RIGHT")
    bottom.tipText:SetText("|cffffd100" .. DVD.L["TIP"] .. ":|r " .. DVD.L["GALLERY_TIP_FIRST_LOAD"])
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
        Gallery.collapsedFilterSections[sectionKey] = true
    end
    local collapsed = Gallery.collapsedFilterSections[sectionKey]
    yOffset = Gallery.CreateSidebarSection(parent, sectionKey, DVD.L["FILTER_CATEGORIES"], yOffset, collapsed)
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
            labelName = ColorLabel(DVD.L["ALL"], categoryColors, "all")
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
        
        -- Pre-check if any options in this section should actually be drawn
        local validOptions = {}
        for _, option in ipairs(section.options or {}) do
            local count = Gallery.GetFilterCount(option.type, option.key)
            local shouldDraw = true
            if option.hideWhenZero and count <= 0 then
                shouldDraw = false
            end
            if shouldDraw and option.devOnly then
                shouldDraw = Gallery.debugMode == true or Gallery.showUnreleasedFilters == true or Gallery.showDevFilters == true
            end
            if shouldDraw then
                table.insert(validOptions, option)
            end
        end

        -- Only create the section header and render if it has valid options
        if #validOptions > 0 then
            if Gallery.collapsedFilterSections[sectionKey] == nil then
                Gallery.collapsedFilterSections[sectionKey] = section.defaultCollapsed == true
            end
            local collapsed = Gallery.collapsedFilterSections[sectionKey]
            yOffset = Gallery.CreateSidebarSection(parent, sectionKey, (DVD.FILTER_SECTION_L_KEYS[sectionKey] and DVD.L[DVD.FILTER_SECTION_L_KEYS[sectionKey]]) or section.title, yOffset, collapsed)
            
            if not collapsed then
                for _, option in ipairs(validOptions) do
                    local checked = false
                    if option.type == "toggle" then
                        checked = Gallery.filters[option.key] ~= false
                    elseif option.type == "source" then
                        Gallery.filters.sources = Gallery.filters.sources or {}
                        checked = Gallery.filters.sources[option.key] == true
                    end
                    local count = Gallery.GetFilterCount(option.type, option.key)
                    local labelName = option.label
                    if option.key == "showCollected" then
                        labelName = DVD.L["COLLECTED"]
                    elseif option.key == "showNotCollected" then
                        labelName = DVD.L["NOT_COLLECTED"]
                    elseif option.type == "source" then
                        local lk = DVD.SOURCE_L_KEYS and DVD.SOURCE_L_KEYS[option.key]
                        if lk then labelName = DVD.L[lk] end
                    end
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
                yOffset = yOffset - GallerySidebarSizing.SectionContentGap
            end
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
    sidebar.help:SetText(DVD.L["SIDEBAR_HELP"])
    
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
    preview.status:SetText("|cffaaaaaa" .. DVD.L["NO_DECOR_SELECTED"] .. "|r")

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
    preview.sourceHeader:SetText("|cffffd100" .. DVD.L["SOURCE_HEADER"] .. "|r")

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
    preview.actionButton:SetText(DVD.L["NO_ACTION"])
    preview.actionButton:Disable()

    preview.sourceButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.sourceButton:SetSize(GalleryFrameSizing.DetailPanelWidth - GalleryPreviewSizing.ButtonWidthPadding, GalleryPreviewSizing.SecondaryButtonHeight)
    preview.sourceButton:SetPoint("BOTTOM", preview.actionButton, "TOP", 0, GalleryPreviewSizing.ButtonGap)
    preview.sourceButton:SetText(DVD.L["SHOW_SOURCE_LOCATION"])
    preview.sourceButton:Hide()

    preview.achievementButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.achievementButton:SetSize(
        GalleryFrameSizing.DetailPanelWidth - GalleryPreviewSizing.ButtonWidthPadding,
        GalleryPreviewSizing.SecondaryButtonHeight
    )
    preview.achievementButton:SetPoint("BOTTOM", preview.sourceButton, "TOP", 0, GalleryPreviewSizing.ButtonGap)
    preview.achievementButton:SetText(DVD.L["OPEN_ACHIEVEMENT"])
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

--[[function Gallery.ShowItem(item)
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

        preview.status:SetText("|cffff4040" .. DVD.L["PREVIEW_UNAVAILABLE"] .. "|r")

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
            preview.actionButton:SetText(DVD.L["OPEN_HOUSING_CATALOGUE_LINK"])
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

        local sourceText = DVD.L["UNKNOWN"]
        if Gallery.BuildPreviewSourceText then
            sourceText = Gallery.BuildPreviewSourceText(item)
        elseif Gallery.GetSourceTextForItem then
            sourceText = Gallery.GetSourceTextForItem(item)
        end

        preview.sourceText:SetText(
            (sourceText or DVD.L["UNKNOWN"]) ..
            "\n\n|cffff4040" .. DVD.L["MISSING_3D_DATA"] .. "|r"
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
        preview.status:SetText("|cff00ff00" .. DVD.L["COLLECTED"] .. "|r")
    else
        preview.status:SetText("|cffff4040" .. DVD.L["NOT_COLLECTED"] .. "|r")
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
                    preview.watermarkText:SetText(DVD.L["NO_PREVIEW_AVAILABLE"] .. "\n|cfff5ebd1" .. DVD.L["ASSET_MISSING"] .. "|r")
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
            preview.requirementText:SetText("|cffffd100" .. DVD.L["REQUIREMENT_LABEL"] .. "|r\n" .. requirementText)
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
        if vendors then sourceText = sourceText .. "\n\n|cff80ff80" .. DVD.L["SOLD_BY_PREFIX"] .. "|r " .. vendors end

        if itemData.questName then
            sourceText = sourceText .. "\n|cff80ff80" .. DVD.L["QUEST_LABEL"] .. "|r " .. itemData.questName
        elseif itemData.questID then
            sourceText = sourceText .. "\n|cff80ff80" .. DVD.L["QUEST_ID_LABEL"] .. "|r " .. tostring(itemData.questID)
        end

        if itemData.bossName then
            sourceText = sourceText .. "\n|cff80ff80" .. DVD.L["BOSS_LABEL"] .. "|r " .. itemData.bossName
        elseif itemData.bossevent then
            sourceText = sourceText .. "\n|cff80ff80" .. DVD.L["EVENT_LABEL"] .. "|r " .. tostring(itemData.bossevent)
        elseif itemData.bossencounter then
            sourceText = sourceText .. "\n|cff80ff80" .. DVD.L["BOSS_ENCOUNTER_LABEL"] .. "|r " .. tostring(itemData.bossencounter)
        end

        if itemData.profession then
            sourceText = sourceText .. "\n|cff80ff80" .. DVD.L["PROFESSION_LABEL"] .. "|r " .. tostring(itemData.profession)
        end
    end

    preview.sourceText:SetText(sourceText)
    preview.sourceText:SetTextColor(1, 1, 1, 1)

    if Gallery.UpdateActionButton then
        Gallery.UpdateActionButton(item)
    end

    if itemData.skip3DPreview then
        preview.actionButton:SetText(DVD.L["OPEN_HOUSING_CATALOGUE"])
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
end]]

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

        preview.status:SetText("|cffff4040" .. DVD.L["PREVIEW_UNAVAILABLE"] .. "|r")

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
            preview.actionButton:SetText(DVD.L["OPEN_HOUSING_CATALOGUE"])
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
        end

        local sourceText = DVD.L["UNKNOWN"]
        if Gallery.BuildPreviewSourceText then
            sourceText = Gallery.BuildPreviewSourceText(item)
        elseif Gallery.GetSourceTextForItem then
            sourceText = Gallery.GetSourceTextForItem(item)
        end

        preview.sourceText:SetText(
            (sourceText or DVD.L["UNKNOWN"]) ..
            "\n\n|cffff4040" .. DVD.L["MISSING_3D_DATA"] .. "|r"
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
        preview.status:SetText("|cff00ff00" .. DVD.L["COLLECTED"] .. "|r")
    else
        preview.status:SetText("|cffff4040" .. DVD.L["NOT_COLLECTED"] .. "|r")
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
                preview.watermarkText:SetText("")
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
            preview.requirementText:SetText("|cffffd100" .. DVD.L["REQUIREMENT_LABEL"] .. "|r\n" .. requirementText)
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
    preview.actionButton:SetText(DVD.L["NO_ACTION"])

    if preview.sourceButton then
        preview.sourceButton:SetScript("OnClick", nil)
        preview.sourceButton:Disable()
        preview.sourceButton:SetAlpha(0.55)
        preview.sourceButton:SetText(DVD.L["SHOW_SOURCE_LOCATION"])
        preview.sourceButton:Hide()
    end

    if preview.achievementButton then
        preview.achievementButton:SetScript("OnClick", nil)
        preview.achievementButton:Disable()
        preview.achievementButton:SetAlpha(0.55)
        preview.achievementButton:SetText(DVD.L["OPEN_ACHIEVEMENT"])
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
    local hasShopPath = HasSource("shop") or HasSource("lushshop") or HasSource("grimtideshop") or HasSource("blossomshop")	or HasSource("rexxar")
	local hasTaleboundPath = HasSource("talebound")




    if achievementInfo and achievementInfo.id and preview.achievementButton then
        preview.achievementButton:SetText(DVD.L["OPEN_ACHIEVEMENT"])
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
            preview.sourceButton:SetText(DVD.L["OPEN_SOURCE_JOURNAL"])
        elseif specialAction.type == "map" then
            local count = specialAction.locations and #specialAction.locations or 0
            preview.sourceButton:SetText(count > 1 and DVD.L["PIN_SOURCE_LOCATIONS"] or DVD.L["SHOW_SOURCE_LOCATION"])
        elseif specialAction.type == "worldmap" then
            preview.sourceButton:SetText(DVD.L["OPEN_SOURCE_MAP"])
        else
            preview.sourceButton:SetText(DVD.L["OPEN_SOURCE"])
        end

        preview.sourceButton:Show()
        preview.sourceButton:Enable()
        preview.sourceButton:SetAlpha(1)
        preview.sourceButton:SetScript("OnClick", function()
            RunPreviewAction(item, specialAction)
        end)
    end

	if hasTaleboundPath then
		preview.actionButton:SetText(DVD.L["OPEN_TALEBOUND_SHOP"])
		preview.actionButton:Enable()
		preview.actionButton:SetAlpha(1)
		preview.actionButton:SetScript("OnClick", function()
			print("|cffb86cffDecor Vendor Gallery:|r This decoration is sold in the Talebound Shop. Play Talebound and visit Nib in Quillgrave to open the Talebound shop window, or open the Talebound store from the character selection screen or Game Menu, and spend Bound Silver.")
		end)
		return
	end

    if hasShopPath then
        preview.actionButton:SetText(DVD.L["OPEN_SHOP_MANUALLY"])
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        preview.actionButton:SetScript("OnClick", function()
            print("|cffb86cffDecor Vendor Gallery:|r This decoration is sold through the in-game shop. Click the |cffffd100Shop|r button on Blizzard's micro menu to open it.")
        end)
        return
    end

    if bestVendor then
        preview.actionButton:SetText(string.format(DVD.L["NAVIGATE_VENDOR"], bestVendor.title or bestVendor.name or DVD.L["VENDOR_FALLBACK"]))
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
            preview.actionButton:SetText(DVD.L["OPEN_ENCOUNTER_JOURNAL"])
        elseif specialAction.type == "map" then
            local count = specialAction.locations and #specialAction.locations or 0
            preview.actionButton:SetText(count > 1 and DVD.L["PIN_LOCATIONS"] or DVD.L["SHOW_LOCATION"])
        elseif specialAction.type == "worldmap" then
            preview.actionButton:SetText(DVD.L["OPEN_MAP"])
        else
            preview.actionButton:SetText(DVD.L["OPEN_SOURCE"])
        end

        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        preview.actionButton:SetScript("OnClick", function()
            RunPreviewAction(item, specialAction)
        end)
        return
    end

    if #vendors > 0 then
        preview.actionButton:SetText(DVD.L["LOCATION_VARIES"])
        preview.actionButton:Disable()
        preview.actionButton:SetAlpha(0.55)
        preview.actionButton:SetScript("OnClick", nil)
        return
    end

    local achievementID = itemData.achievementID or item.achievementID or itemData.vendorUnlockAchievementID or item.vendorUnlockAchievementID or (achievementInfo and achievementInfo.id)

    if achievementID and not (achievementInfo and achievementInfo.id) then
        preview.actionButton:SetText(DVD.L["OPEN_ACHIEVEMENT"])
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
        return DVD.L["SOURCE_ALL"]
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
        GameTooltip:AddLine(itemName or DVD.L["UNKNOWN_DECOR"], 1, 0.82, 0, true)
        GameTooltip:AddLine(DVD.L["HOUSING_DECOR"], 0.35, 0.75, 1, true)

        if sourceText and sourceText ~= "" then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(DVD.L["SOURCE_PREFIX"] .. sourceText, 0.4, 1, 0.4, true)
        end

        if vendors and vendors ~= "" then
            GameTooltip:AddLine(DVD.L["SOLD_BY_PREFIX"] .. vendors, 0.4, 1, 0.4, true)
        end

        if reqText and reqText ~= "" then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(reqText, 1, 0.82, 0.1, true)
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine(DVD.L["LEFT_CLICK_PREVIEW_GALLERY"], 0.7, 0.7, 0.7, true)
        GameTooltip:AddLine(DVD.L["RIGHT_CLICK_WAYPOINT_GALLERY"], 0.7, 0.7, 0.7, true)
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
            string.format("|cffaaaaaa" .. DVD.L["SHOWING_ITEMS"] .. "|r", #visibleItems, availableTotal, sourceText)
        )
    end

    if Gallery.RefreshCategorySidebar then
        Gallery.RefreshCategorySidebar()
    elseif frame.sidebar and frame.sidebar.filtersContainer and Gallery.CreateSidebarFilters then
        Gallery.CreateSidebarFilters(frame.sidebar.filtersContainer)
    end
end
end)(...);
