--[[
============================================================
Decor Vendor Addon — Unified Constants Registry
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

Merged from the old three-file setup:
• DecorVendor/constants.lua
• DecorVendorData/SharedConstants.lua
• DecorVendorGallery/Constants.lua

This file is now the single shared constants source for the unified
DecorVendor addon namespace: DVD.
============================================================
]]

local addonName, DVD = ...

DVD = DVD or {}

-- Main constants tables.
DVD.CONSTANTS = DVD.CONSTANTS or DVD.C or {}
DVD.C = DVD.CONSTANTS
DVD.Constants = DVD.CONSTANTS

local C = DVD.CONSTANTS

-- Keep the old shared constants table shape so moved files that still read
-- DVD.Shared.CatalogSizing / DVD.Shared.SourceActions continue to work.
DVD.Shared = DVD.Shared or {}
local Shared = DVD.Shared

-- Gallery bridge. The old Gallery constants file only mapped Gallery.C to Shared;
-- now Gallery.C points to the same C table used by the main addon.
DVD.Gallery = DVD.Gallery or {}
DVD.Gallery.C = C
DVD.Gallery.Constants = C
DVD.Gallery.Shared = Shared
DVD.Gallery.ActiveItems = DVD.ActiveItems or DVD.Gallery.ActiveItems or {}

-------------------------------------------------
-- Shared Catalog/UI Sizing
-- Both addons can use this as their base skeleton.
-------------------------------------------------

Shared.CatalogSizing = Shared.CatalogSizing or {
    FrameWidth          = 1100,
    FrameHeight         = 750,

    SidebarWidth        = 200,
    DetailPanelWidth    = 330,
    BottomBarHeight     = 44,
    FilterBarHeight     = 32,

    ModelViewerHeight   = 240,

    DropdownMaxHeight   = 400,
    ProgressBarHeight   = 10,

    GridItemSize        = 110,
    GridItemSpacing     = 10,
    GridColumns         = 4,
    GridRows            = 5,
    ItemsPerPage        = 20,

    SearchBoxWidth      = 260,
}

Shared.GalleryCard = Shared.GalleryCard or {
    CARD_SIZE = 96,
    CARD_GAP = 14,
    GRID_PADDING = 18,
}
-------------------------------------------------
-- Client / Patch Availability
-------------------------------------------------

function DVD.IsDataAvailableForClient(data)
    if not data then return true end

    -- Strictly screen out hidden or unreleased assets
    if data.unreleased == true or data.hiddenOnLive == true then
        return false
    end

    return true
end

function DVD.IsItemAvailableForClient(itemID)
    local data = itemID and DVD.ActiveItems and DVD.ActiveItems[itemID]
    if not data then return true end
    
    return DVD.IsDataAvailableForClient(data)
end
-------------------------------------------------
-- Expansion Order / Colors
-------------------------------------------------

Shared.EXPANSION_ORDER = Shared.EXPANSION_ORDER or {
    "Classic",
    "The Burning Crusade",
    "Wrath of the Lich King",
    "Cataclysm",
    "Mists of Pandaria",
    "Warlords of Draenor",
    "Legion",
    "Battle for Azeroth",
    "Shadowlands",
    "Dragonflight",
    "The War Within",
    "Midnight",
}

Shared.ExpansionColors = Shared.ExpansionColors or {
    ["Classic"]                = "CC8800",
    ["The Burning Crusade"]    = "1EFF00",
    ["Wrath of the Lich King"] = "69CCF0",
    ["Cataclysm"]              = "FF4444",
    ["Mists of Pandaria"]      = "00FF96",
    ["Warlords of Draenor"]    = "B32D2D",
    ["Legion"]                 = "198C19",
    ["Battle for Azeroth"]     = "668FD6",
    ["Shadowlands"]            = "AA6666",
    ["Dragonflight"]           = "DDAA00",
    ["The War Within"]         = "CC6600",
    ["Midnight"]               = "9955CC",
    ["Neighborhoods"]          = "FFFFFF",
    ["Unknown"]                = "888888",
}

Shared.ContinentExpansion = Shared.ContinentExpansion or {
    ["Eastern Kingdoms"]     = "Classic",
    ["Kalimdor"]             = "Classic",
    ["Outland"]              = "The Burning Crusade",
    ["Northrend"]            = "Wrath of the Lich King",
    ["The Maelstrom"]        = "Cataclysm",
    ["Pandaria"]             = "Mists of Pandaria",
    ["Draenor"]              = "Warlords of Draenor",
    ["Broken Isles"]         = "Legion",
    ["Argus"]                = "Legion",
    ["Zandalar"]             = "Battle for Azeroth",
    ["Kul Tiras"]            = "Battle for Azeroth",
    ["Mechagon"]             = "Battle for Azeroth",
    ["The Shadowlands"]      = "Shadowlands",
    ["Dragon Isles"]         = "Dragonflight",
    ["Khaz Algar"]           = "The War Within",
    ["Quel'Thalas"]          = "Midnight",
    ["The Voidstorm"]        = "Midnight",
    ["Harandar"]             = "Midnight",
    ["Neighborhoods"]        = "Neighborhoods",
}

Shared.ContinentColors = Shared.ContinentColors or {
    ["Eastern Kingdoms"]     = "CC8800",
    ["Kalimdor"]             = "CC8800",
    ["Northrend"]            = "69CCF0",
    ["Pandaria"]             = "00FF96",
    ["Draenor"]              = "B32D2D",
    ["Broken Isles"]         = "198C19",
    ["Zandalar"]             = "668FD6",
    ["Kul Tiras"]            = "668FD6",
    ["Mechagon"]             = "668FD6",
    ["The Shadowlands"]      = "AA6666",
    ["Dragon Isles"]         = "DDAA00",
    ["Khaz Algar"]           = "CC6600",
    ["Quel'Thalas"]          = "9955CC",
    ["Neighborhoods"]        = "FFFFFF",
    ["Unknown"]              = "888888",
}

-------------------------------------------------
-- Shared Label Colors
-- Hex strings for inline WoW color labels.
-------------------------------------------------

Shared.LabelColors = Shared.LabelColors or {}

Shared.LabelColors.Collection = {
    all = "FFD100",
    collected = "00FF66",
    notCollected = "FF6666",
    missing = "FF6666",
    unknown = "888888",
}

Shared.LabelColors.GalleryCategories = {
    all = "FFD100",

    accent = "FFAA33",
    accents = "FFAA33",

    lighting = "FFE066",

    furnishing = "C084FC",
    furnishings = "C084FC",

    miscellaneous = "AAAAAA",

    nature = "44DD88",

    structural = "8FB8FF",

    functional = "66D9EF",

    unknown = "888888",
}

Shared.LabelColors.Sources = {
    vendor = "66B2FF",
    shop = "00CCFF",
    quest = "FFD100",
    achievement = "FFDD55",
    drop = "C084FC",
    promo = "FF66CC",
    profession = "FFAA44",
    catalog = "AAAAFF",
    unreleased = "FF5555",
    other = "888888",

    treasure = "C084FC",
    boss = "C084FC",
}

Shared.LabelColors.Professions = {
    Alchemy = "00FF96",
    Blacksmithing = "AAAAAA",
    Cooking = "FFAA44",
    Enchanting = "B266FF",
    Engineering = "FFCC33",
    Inscription = "66CCFF",
    Jewelcrafting = "FF66CC",
    ["Junkyard Tinkering"] = "CC9966",
    Leatherworking = "CC8844",
    Tailoring = "C084FC",
}

Shared.LabelColors.BossCategories = {
    rare = "FF5555",
    dungeon = "66B2FF",
    delve = "C084FC",
    renown = "FFD100",
    event = "00FFCC",
    raid = "FF8844",
    daily = "44DD88",
    decor = "FF66CC",
    unknown = "888888",
}

Shared.LabelColors.AchievementCategories = {
    Quests = "FFD100",
    Exploration = "44DD88",
    ["Feats of Strength"] = "FF66CC",
    ["Expansion Features"] = "66B2FF",
    ["Dungeons and Raids"] = "C084FC",
    ["Player vs Player"] = "FF5555",
    Professions = "FFAA44",
    ["Midnight Prey"] = "9955CC",
    unknown = "888888",
}

function Shared.ColorizeLabel(label, colorTable, key)
    label = tostring(label or "Unknown")
    key = key or label

    local hex =
        colorTable
        and (
            colorTable[key]
            or colorTable[string.lower(tostring(key))]
            or colorTable.unknown
            or colorTable.Unknown
        )
        or "888888"

    return "|cff" .. hex .. label .. "|r"
end

Shared.SourceFilterOptions = Shared.SourceFilterOptions or {
    { key = "all", text = "All Sources" },
    { key = "vendor", text = "Vendor" },
    { key = "shop", text = "In-Game Shop" },
    { key = "quest", text = "Quest" },
    { key = "achievement", text = "Achievement" },
    { key = "drop", text = "Drop" },
    { key = "promo", text = "Promo" },
    { key = "profession", text = "Profession" },
    { key = "catalog", text = "Housing Catalog" },
    { key = "unreleased", text = "Unreleased" },
    { key = "other", text = "Other" },
}

Shared.SourceLabels = Shared.SourceLabels or {
    all = "All Decor",
    vendor = "Vendor",
    shop = "In-Game Shop",
    quest = "Quest",
    achievement = "Achievement",
    drop = "Drop",
    promo = "Promo",
    profession = "Profession",
    catalog = "Housing Catalog",
    unreleased = "Unreleased",
    other = "Other",

    -- Compatibility aliases.
    treasure = "Drop",
    boss = "Drop",
}

Shared.SourceOrder = Shared.SourceOrder or {
    "vendor",
    "shop",
    "quest",
    "achievement",
    "drop",
    "promo",
    "profession",
    "catalog",
    "unreleased",
    "other",
}

Shared.SourceAtlasIcons = Shared.SourceAtlasIcons or {
    shop = "hearthsteel-icon-32x32",
}

Shared.SourceIcons = Shared.SourceIcons or {
    Vendor      = "Interface\\Icons\\INV_Misc_Bag_07",
    Quest       = "Interface\\GossipFrame\\AvailableQuestIcon",
    Achievement = "Interface\\Icons\\Achievement_Level_100",
    Prey        = "Interface\\Icons\\INV_Misc_Bone_HumanSkull_01",
    Profession  = "Interface\\Icons\\Trade_Tailoring",
    Drop        = "Interface\\Icons\\Achievement_Boss_Blackhand",
    Treasure    = "Interface\\Icons\\INV_Misc_Map02",
    Shop        = "Interface\\Icons\\WoW_Store",
    Other       = "Interface\\Icons\\INV_Misc_QuestionMark",
}

Shared.SourceColors = Shared.SourceColors or {
    Vendor      = { 0.40, 0.70, 1.00, 1.00 },
    Quest       = { 1.00, 0.82, 0.00, 1.00 },
    Achievement = { 0.90, 0.80, 0.20, 1.00 },
    Prey        = { 0.85, 0.20, 0.20, 1.00 },
    Profession  = { 0.60, 0.40, 0.20, 1.00 },
    Drop        = { 0.80, 0.40, 0.80, 1.00 },
    Treasure    = { 0.60, 0.90, 0.60, 1.00 },
    Shop        = { 0.30, 0.80, 1.00, 1.00 },
    Other       = { 0.60, 0.60, 0.60, 1.00 },
}

-------------------------------------------------
-- Currency Icons
-------------------------------------------------

Shared.GOLD_ICON = Shared.GOLD_ICON or "Interface\\MoneyFrame\\UI-GoldIcon"

Shared.CurrencyIcons = Shared.CurrencyIcons or {
    [823]  = "Interface\\ICONS\\INV_Apexis_Draenor.BLP",
    [824]  = "Interface\\ICONS\\INV_Garrison_Resource.blp",
    [1155] = "Interface\\ICONS\\INV_Misc_ancient_mana.BLP",
    [1220] = "Interface\\ICONS\\INV_OrderHall_OrderResources.BLP",
    [1508] = "Interface\\ICONS\\Oshugun_CrystalFragments.BLP",
    [1560] = "Interface\\ICONS\\INV__Faction_WarResources.BLP",
    [1710] = "Interface\\ICONS\\INV_Misc_AzsharaCoin.BLP",
    [1767] = "Interface\\ICONS\\INV_Stygia.BLP",
    [1792] = "Interface\\ICONS\\Achievement_LegionPVPTier4.BLP",
    [1803] = "Interface\\ICONS\\INV_INSCRIPTION_80_VANTUSRUNE_NYALOTHA.BLP",
    [1813] = "Interface\\ICONS\\Spell_AnimaBastion_Orb.BLP",
    [2003] = "Interface\\ICONS\\INV_Faction_WarResources.BLP",
    [2118] = "Interface\\ICONS\\INV_Misc_Powder_Thorium.blp",
    [2657] = "Interface\\ICONS\\INV_7_0Raid_Trinket_05A.BLP",
    [2803] = "Interface\\ICONS\\INV_Misc_ElvenCoins.blp",
    [2815] = "Interface\\ICONS\\SPELL_AZERITE_ESSENCE14.BLP",
    [3056] = "Interface\\ICONS\\INV_10_Tailoring_SilkRare_Color3.BLP",
    [3316] = "Interface\\ICONS\\INV_112_RaidTrinkets_VoidPrism.BLP",
    [3319] = "Interface\\ICONS\\INV12_Twilight_Blade_Cultist_Insignia.BLP",
    [3363] = "Interface\\ICONS\\INV_Misc_Ticket_Tarot_TwistingNether_01.blp",
    [3373] = "Interface\\ICONS\\Item_enchantedpearl.blp",
    [3377] = "Interface\\ICONS\\INV_10_Gathering_BioluminescentSpores_Large.BLP",
    [3379] = "Interface\\ICONS\\INV_Elemental_Primal_Mana.blp",
    [3392] = "Interface\\ICONS\\INV_10_ElementalCombinedFoozles_Blood.BLP",
    [3405] = "Interface\\ICONS\\INV_Belt_Armor_BloodElf_D_01.blp",
}

-------------------------------------------------
-- Shared Source Actions / Map Pins
-- Gallery uses this directly.
-- DecorVendor gets a RareEvents adapter below.
-------------------------------------------------

Shared.SourceActions = Shared.SourceActions or {}

Shared.SourceActions["Dreamsurge Event"] = Shared.SourceActions["Dreamsurge Event"] or {
    type = "map",
    label = "Dreamsurge Event",
    openMapID = 1978, -- Dragon Isles parent map, optional
    locations = {
        { title = "Dreamsurge Event", zone = "The Waking Shores", mapID = 2022, x = 58.4, y = 67.8 },
        { title = "Dreamsurge Event", zone = "Ohn'ahran Plains", mapID = 2023, x = 64.0, y = 41.6 },
        { title = "Dreamsurge Event", zone = "The Azure Span", mapID = 2024, x = 45.6, y = 39.8 },
        { title = "Dreamsurge Event", zone = "Thaldraszus", mapID = 2025, x = 51.2, y = 43.2 },
    },
}

Shared.SourceActions["Darkshore Rares"] = Shared.SourceActions["Darkshore Rares"] or {
    type = "map",
    label = "Daily Darkshore Rares",
    zone = "Darkshore",
    mapID = 62,
    locations = {
        { title = "Granokk", zone = "Darkshore", mapID = 62, x = 48.2, y = 55.6 },
        { title = "Stonebinder Ssra'vess", zone = "Darkshore", mapID = 62, x = 45.4, y = 58.8 },
        { title = "Shattershard", zone = "Darkshore", mapID = 62, x = 43.4, y = 29.2 },
        { title = "Scalefiend", zone = "Darkshore", mapID = 62, x = 47.4, y = 44.6 },
        { title = "Aman", zone = "Darkshore", mapID = 62, x = 37.4, y = 84.2 },
        { title = "Mrggr'marr", zone = "Darkshore", mapID = 62, x = 35.4, y = 81.4 },
        { title = "Glimmerspine", zone = "Darkshore", mapID = 62, x = 43.4, y = 19.8 },
        { title = "Madfeather", zone = "Darkshore", mapID = 62, x = 44.0, y = 48.4 },
    },
}

Shared.SourceActions["Daily Darkshore Rares"] = Shared.SourceActions["Daily Darkshore Rares"] or Shared.SourceActions["Darkshore Rares"]

Shared.SourceActions["Midnight Delves"] = Shared.SourceActions["Midnight Delves"] or {
    type = "map",
    label = "Midnight Delves",
    openMapID = 2537,
    locations = {
        { title = "Parhelion Plaza", zone = "Isle of Quel’Danas", mapID = 2424, x = 46.8, y = 40.9 },
        { title = "The Shadow Enclave", zone = "Eversong Woods", mapID = 2395, x = 45.5, y = 86.0 },
        { title = "Atal'Aman", zone = "Eversong Woods", mapID = 2395, x = 63.7, y = 80.1 },
        { title = "Collegiate Calamity", zone = "Silvermoon City", mapID = 2393, x = 40.6, y = 53.7 },
        { title = "The Darkway", zone = "Silvermoon City", mapID = 2393, x = 39.3, y = 31.7 },
        { title = "Twilight Crypts", zone = "Zul'Aman", mapID = 2437, x = 25.4, y = 84.4 },
        { title = "The Gulf of Memory", zone = "Harandar", mapID = 2413, x = 36.7, y = 49.6 },
        { title = "The Grudge Pit", zone = "Harandar", mapID = 2413, x = 70.4, y = 64.8 },
        { title = "Shadowguard Point", zone = "Voidstorm", mapID = 2405, x = 37.1, y = 49.1 },
        { title = "Sunkiller Sanctum", zone = "Voidstorm", mapID = 2405, x = 54.8, y = 47.1 },
       -- { title = "Gnarldor", zone = "The Coiled Isle", mapID = 2666, x = 64.6, y = 77.4 },
       -- { title = "The Ring of Glory", zone = "The Coiled Isle", mapID = 2666, x = 71.30, y = 56.53 },		
    },
}

Shared.SourceActions["Withered Army Training"] = Shared.SourceActions["Withered Army Training"] or {
    type = "map",
    label = "Withered Army Training",
    zone = "Suramar",
    mapID = 680,
    locations = {
        { title = "Glimmering Treasure Chest", zone = "Suramar", mapID = 680, x = 22.8, y = 36.2 },
    },
}

Shared.SourceActions["Stellar Stash"] = Shared.SourceActions["Stellar Stash"] or {
    type = "map",
    label = "Stellar Stash",
    zone = "Masters' Perch",
    mapID = 2444,
    locations = {
        { title = "Stellar Stash", zone = "Masters' Perch", mapID = 2444, x = 53.5, y = 32.2 },
    },
}

Shared.SourceActions["Malignant Chest"] = Shared.SourceActions["Malignant Chest"] or {
    type = "map",
    label = "Malignant Chest",
    zone = "Voidstorm",
    mapID = 2444,
    locations = {
        { title = "Malignant Chest", zone = "Voidstorm", mapID = 2405, x = 53.3, y = 42.7 },
    },
}

Shared.SourceActions["Scraps Heaps"] = Shared.SourceActions["Scraps Heaps"] or {
    type = "map",
    label = "Scraps Heaps",
    zone = "Undermine",
    mapID = 2346,
	note = "Chance to drop in any of the Scrap Heap Events",
    locations = {
        { title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 31.9, y = 21.4 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 70.0, y = 76.7 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 52.6, y = 83.3 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 50.8, y = 63.6 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 39.0, y = 81.6 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 36.8, y = 45.0 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 67.5, y = 29.9 },
    },
}

Shared.SourceActions["Triple-Locked Safebox"] = Shared.SourceActions["Triple-Locked Safebox"] or {
    type = "map",
    label = "Triple-Locked Safebox",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Triple-Locked Safebox", zone = "Eversong Woods", mapID = 2395, x = 38.9, y = 76.1 },
    },
}

Shared.SourceActions["Incomplete Book of Sonnets"] = Shared.SourceActions["Incomplete Book of Sonnets"] or {
    type = "map",
    label = "Incomplete Book of Sonnets",
    zone = "Silvermoon City ",
    mapID = 2393,
    locations = {
        { title = "Incomplete Book of Sonnets", zone = "Silvermoon City ", mapID = 2393, x = 37.8, y = 52.5 },
    },
}

Shared.SourceActions["Stone Vat"] = Shared.SourceActions["Stone Vat"] or {
    type = "map",
    label = "Stone Vat",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Stone Vat", zone = "Eversong Woods", mapID = 2395, x = 40.5, y = 60.8 },
    },
}

Shared.SourceActions["Gift of the Phoenix"] = Shared.SourceActions["Gift of the Phoenix"] or {
    type = "map",
    label = "Gift of the Phoenix",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Gift of the Phoenix", zone = "Eversong Woods", mapID = 2395, x = 40.9, y = 19.5 },
    },
}

Shared.SourceActions["Forgotten Ink and Quill"] = Shared.SourceActions["Forgotten Ink and Quill"] or {
    type = "map",
    label = "Forgotten Ink and Quill",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Forgotten Ink and Quill", zone = "Eversong Woods", mapID = 2395, x = 43.3, y = 69.5 },
    },
}

Shared.SourceActions["Reliquary's Lost Paint Supplies"] = Shared.SourceActions["Reliquary's Lost Paint Supplies"] or {
    type = "map",
    label = "Reliquary's Lost Paint Supplies",
    zone = "Harandar",
    mapID = 2413,
    locations = {
        { title = "Reliquary's Lost Paint Supplies", zone = "Eversong Woods", mapID = 2413, x = 62.9, y = 51.3 },
    },
}

Shared.SourceActions["Theater Troupe"] = Shared.SourceActions["Theater Troupe"] or {
    type = "map",
    label = "Theater Troupe",
    zone = "Khaz Algar",
    mapID = 2248,
    locations = {
        { title = "Distinguished Actor's Chest", zone = "Khaz Algar", mapID = 2248, x = 56.42, y = 51.47 },
    },
}

Shared.SourceActions["Highmountain Paragon Chest"] = Shared.SourceActions["Highmountain Paragon Chest"] or {
    type = "map",
    label = "Highmountain Paragon Chest",
    zone = "Highmountain",
    mapID = 750,
    locations = {
        { title = "Highmountain Paragon Chest", zone = "Highmountain", mapID = 750, x = 38.06, y = 46.05 },
    },
}

Shared.SourceActions["Stormarion Assault"] = Shared.SourceActions["Stormarion Assault"] or {
    type = "map",
    label = "Stormarion Assault",
    zone = "Voidstorm",
    mapID = 2405,
    openMapID = 2405,
    locations = {
        { title = "Stormarion Cache", zone = "Voidstorm", mapID = 2405, x = 26.83, y = 67.78 },
    },
}

-- DecorVendor legacy delves/event names.
Shared.SourceActions["Cooking Daily"] = Shared.SourceActions["Cooking Daily"] or {
    type = "map",
    label = "Cooking Daily",
    locations = {
        { title = "Katherine Lee", x = 40.3, y = 66.1 },
        { title = "Awilo Lon'gomba", x = 70.0, y = 38.9 },
    },
}

Shared.SourceActions["Frederick the Fabulous"] = Shared.SourceActions["Frederick the Fabulous"] or {
    type = "map",
    label = "Frederick the Fabulous",
	zobe = "Jade Forest",
	mapID = 371,
    locations = {
        { title = "Frederick the Fabulous", x = 55.7, y = 15.7 },
    },
}


-------------------------------------------------
-- Final SourceAction aliases
-- Must be AFTER Shared.SourceActions is created/populated.
-------------------------------------------------

C.SourceActions = Shared.SourceActions
C.SOURCE_ACTIONS = Shared.SourceActions

DVD.SourceActions = Shared.SourceActions
DVD.SOURCE_ACTIONS = Shared.SourceActions

DVD.Gallery.C = C
DVD.Gallery.C.SourceActions = Shared.SourceActions
DVD.Gallery.C.SOURCE_ACTIONS = Shared.SourceActions
-------------------------------------------------
-- DecorVendor rareEvents adapter
-------------------------------------------------

Shared.RareEvents = Shared.RareEvents or {}

local function BuildRareEventsFromSourceActions()
    for key, action in pairs(Shared.SourceActions or {}) do
        if action.locations then
            Shared.RareEvents[key] = Shared.RareEvents[key] or {}

            -- Rebuild to keep aliases current.
            wipe(Shared.RareEvents[key])

            for _, loc in ipairs(action.locations) do
                table.insert(Shared.RareEvents[key], {
                    name = loc.name or loc.title,
                    title = loc.title or loc.name,
                    zone = loc.zone or action.zone,
                    mapID = loc.mapID or action.mapID,
                    x = loc.x,
                    y = loc.y,
                })
            end
        end
    end
end

BuildRareEventsFromSourceActions()
-------------------------------------------------
-- Final RareEvents aliases
-------------------------------------------------

C.RareEvents = Shared.RareEvents
C.RARE_EVENTS = Shared.RareEvents

DVD.rareEvents = Shared.RareEvents
DVD.RareEvents = Shared.RareEvents
-------------------------------------------------
-- Profession / Reputation / Renown / Friendship
-------------------------------------------------

Shared.ProfessionOrder = Shared.ProfessionOrder or {
    "Alchemy",
    "Blacksmithing",
    "Cooking",
    "Enchanting",
    "Engineering",
    "Inscriptions",
    "Jewelcrafting",
    "Junkyard Tinkering",
    "Leatherworking",
    "Tailoring",
}

Shared.ProfessionIcons = Shared.ProfessionIcons or {
    Alchemy         = "Interface\\Icons\\Trade_Alchemy",
    Blacksmithing   = "Interface\\Icons\\Trade_BlackSmithing",
    Cooking         = "Interface\\Icons\\INV_Misc_Food_15",
    Enchanting      = "Interface\\Icons\\Trade_Engraving",
    Engineering     = "Interface\\Icons\\Trade_Engineering",
    Inscription     = "Interface\\Icons\\INV_Inscription_Tradeskill01",
    Jewelcrafting   = "Interface\\Icons\\INV_Misc_Gem_01",
    Leatherworking  = "Interface\\Icons\\Trade_LeatherWorking",
    Tailoring       = "Interface\\Icons\\Trade_Tailoring",
}

Shared.ReputationRanks = Shared.ReputationRanks or {
    [1] = "Neutral",
    [2] = "Friendly",
    [3] = "Honored",
    [4] = "Revered",
    [5] = "Exalted",
}

Shared.RenownFactionIDs = Shared.RenownFactionIDs or {
    ["Valdrakken Accord"] = 2510,
    ["Dragonscale Expedition"] = 2507,
    ["Flame's Radiance"] = 2688,
    ["The Singularity"] = 2699,
    ["Amani Tribe"] = 2696,
    ["Hara'ti"] = 2704,
    ["Silvermoon Court"] = 2710,
    ["Ritual Sites"] = 2792,
}

Shared.SubfactionIDs = Shared.SubfactionIDs or {
    ["Blood Knights"] = 2712,
    ["Farstriders"] = 2713,
    ["Magisters"] = 2711,
    ["Shades of the Row"] = 2714,
}

Shared.SubfactionRanks = Shared.SubfactionRanks or {
    ["Blood Knights"] = {
        [1] = "Interloper",
        [2] = "Guest",
        [3] = "Socialite",
        [4] = "Trendsetter",
        [5] = "Host",
        [6] = "Luminary",
    },

    ["Farstriders"] = {
        [1] = "Interloper",
        [2] = "Guest",
        [3] = "Socialite",
        [4] = "Trendsetter",
        [5] = "Host",
        [6] = "Luminary",
    },

    ["Magisters"] = {
        [1] = "Interloper",
        [2] = "Guest",
        [3] = "Socialite",
        [4] = "Trendsetter",
        [5] = "Host",
        [6] = "Luminary",
    },

    ["Shades of the Row"] = {
        [1] = "Interloper",
        [2] = "Guest",
        [3] = "Socialite",
        [4] = "Trendsetter",
        [5] = "Host",
        [6] = "Luminary",
    },
}

Shared.FriendshipRanks = Shared.FriendshipRanks or {
    [1] = "Stranger",
    [2] = "Acquaintance",
    [3] = "Buddy",
    [4] = "Friend",
    [5] = "Good Friend",
    [6] = "Best Friend",
}

Shared.FriendshipFactionIDs = Shared.FriendshipFactionIDs or {
    ["Tina Mudclaw"] = 1280,
    ["Ella"] = 1275,
    ["Jogu the Drunk"] = 1273,
    ["Sho"] = 1278,
    ["Farmer Fung"] = 1283,
    ["Fish Fellreed"] = 1282,
    ["Chee Chee"] = 1277,
    ["Gina Mudclaw"] = 1281,
    ["Old Hillpaw"] = 1276,
    ["Haohan Mudclaw"] = 1279,
}

-------------------------------------------------
-- DecorVendor Shared Theme / UI Constants
-------------------------------------------------

Shared.Colors = Shared.Colors or {
    ALLIANCE = {0.3, 0.6, 1},
    HORDE = {1, 0.2, 0.2},
    NEUTRAL = {0.2, 0.8, 0.3},
    GOLD = {1, 0.82, 0},
    GOLD_DIM = { 0.8, 0.66, 0, 1 },
    TITLE = { 0.9, 0.85, 0.5, 1 },
    SIDEBAR_BG = { 0.05, 0.05, 0.08, 0.9 },
    CONTENT_BG = { 0, 0, 0, 0.8 },
    TAB_NORMAL = { 0.1, 0.1, 0.12, 0.8 },
    TAB_HOVER = { 0.15, 0.15, 0.17, 0.9 },
    TAB_SELECTED = { 0.12, 0.12, 0.14, 1 },
    TAB_TEXT_INACTIVE = { 0.56, 0.56, 0.56, 1 },
    TAB_ICON_ALPHA_INACTIVE = 0.75,
    TEXT_PRIMARY = { 1, 1, 1, 1 },
    TEXT_SECONDARY = { 0.9, 0.9, 0.9, 1 },
    TEXT_TERTIARY = { 0.7, 0.7, 0.7, 1 },
    TEXT_DISABLED = { 0.5, 0.5, 0.5, 1 },
    BORDER = { 0.3, 0.3, 0.3, 1 },
    PROGRESS_COMPLETE = { 0.2, 1, 0.2, 1 },
    PROGRESS_NEAR_COMPLETE = { 0.6, 0.9, 0.1, 1 },
    PROGRESS_MID = { 0.75, 0.65, 0.35, 1 },
    PROGRESS_LOW_DIM = { 0.6, 0.6, 0.6, 1 },
    PANEL_NORMAL = { 0.14, 0.14, 0.16, 0.9 },
    PANEL_HOVER = { 0.19, 0.19, 0.21, 1 },
    PANEL_NORMAL_ALT = { 0.12, 0.12, 0.14, 0.95 },
    PANEL_HOVER_ALT = { 0.16, 0.16, 0.18, 1 },
    ROW_BG = { 0.08, 0.08, 0.10, 0.9 },
    ROW_BG_SOLID = { 0.08, 0.08, 0.10, 1 },
    SOURCE_NAME_GOLD = { 0.92, 0.76, 0, 1 },
    ROW_SELECTED = { 0.20, 0.20, 0.22, 1 },
}

Shared.Spacing = Shared.Spacing or {
    SMALL = 4,
    NORMAL = 8,
    LARGE = 16,
}

Shared.Camera = Shared.Camera or {
    TRANSITION_IMMEDIATE = CAMERA_TRANSITION_TYPE_IMMEDIATE or 1,
    MODIFICATION_DISCARD = CAMERA_MODIFICATION_TYPE_DISCARD or 1,
    MODIFICATION_MAINTAIN = CAMERA_MODIFICATION_TYPE_MAINTAIN or 1,
    ORBIT_MOUSE_NOTHING = ORBIT_CAMERA_MOUSE_MODE_NOTHING or 0,
    ORBIT_MOUSE_YAW = ORBIT_CAMERA_MOUSE_MODE_YAW_ROTATION or 1,
    ORBIT_MOUSE_PITCH = ORBIT_CAMERA_MOUSE_MODE_PITCH_ROTATION or 2,
    ORBIT_MOUSE_ZOOM = ORBIT_CAMERA_MOUSE_MODE_ZOOM or 6,
    ORBIT_MOUSE_PAN_HORIZONTAL = ORBIT_CAMERA_MOUSE_PAN_HORIZONTAL or 7,
    ORBIT_MOUSE_PAN_VERTICAL = ORBIT_CAMERA_MOUSE_PAN_VERTICAL or 8,
    PREVIEW_MIN_ZOOM_SCALE = 0.5,
    ROTATION_SPEED = 0.5,
    ZOOM_STEP = 0.02,
}

Shared.ScenePresets = Shared.ScenePresets or {
    [0]  = Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorDefault or 0,
    [65] = Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorTiny or 65,
    [66] = Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorSmall or 66,
    [67] = Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorMedium or 67,
    [68] = Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorLarge or 68,
    [69] = Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorHuge or 69,
}

Shared.DefaultSceneID =
    Shared.DefaultSceneID
    or (Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorDefault)
    or 0

Shared.ModelSceneID = Shared.ModelSceneID or 1317

Shared.LegacySizing = Shared.LegacySizing or {
    SEARCHBOX_HEIGHT = 22,

    HEADER_HEIGHT = Shared.CatalogSizing.FilterBarHeight,
    TITLEBG_HEIGHT = Shared.CatalogSizing.FilterBarHeight,

    DIVIDER_HEIGHT = 2,
    TITLESEPERATOR_HEIGHT = 2,

    VENDOR_HEADER_HEIGHT = 22,
    LINE_HEIGHT = 20,

    RESETBTN_WIDTH = 120,
    RESETBTN_HEIGHT = 22,

    RESETCACHE_WIDTH = 170,
    RESETCACHE_HEIGHT = 22,

    INFOSIZE_WIDTH = 22,
    INFOSIZE_HEIGHT = 22,

    CLOSE_WIDTH = 28,
    CLOSE_HEIGHT = 28,

    CHECKTOGGLE_WIDTH = 28,
    CHECKTOGGLE_HEIGHT = 28,

    PREVBTN_WIDTH = 24,
    PREVBTN_HEIGHT = 24,
    NEXTBTN_WIDTH = 24,
    NEXTBTN_HEIGHT = 24,

    RECIPEFRAME_WIDTH = 300,
    RECIPEFRAME_HEIGHT = 40,
    RECIPEICON_WIDTH = 40,
    RECIPEICON_HEIGHT = 40,
    RECIPETEXT_WIDTH = 200,

    MODEL_ROTATION_SENSITIVITY = 0.01,
    MODEL_ZOOM_SCALE = 1.2,
    MODEL_ZOOM_MIN = 0.5,
    MODEL_ZOOM_MAX = 3.0,
    MODEL_ZOOM_STEP = 0.1,
    MODEL_VERTICAL_OFFSET = -0.1,
}

-------------------------------------------------
-- Zidormi Zones
-------------------------------------------------

Shared.ZidormiZones = Shared.ZidormiZones or {
    ["Darkshore"]                = { npcID = 141489, x = 48.4, y = 25.0, npcZone = "Darkshore" },
    ["Tirisfal Glades"]          = { npcID = 141488, x = 69.4, y = 62.8, npcZone = "Tirisfal Glades" },
    ["Arathi Highlands"]         = { npcID = 141649, x = 38.2, y = 90.0, npcZone = "Arathi Highlands" },
    ["Blasted Lands"]            = { npcID = 88206,  x = 48.2, y = 7.2,  npcZone = "Blasted Lands" },
    ["Silithus"]                 = { npcID = 128607, x = 78.8, y = 22.0, npcZone = "Silithus" },
    ["Uldum"]                    = { npcID = 162419, x = 56.0, y = 35.2, npcZone = "Uldum" },
    ["Vale of Eternal Blossoms"] = { npcID = 163463, x = 81.0, y = 29.6, npcZone = "Vale of Eternal Blossoms" },
    ["Dustwallow Marsh"]         = { npcID = 63546,  x = 55.8, y = 49.6, npcZone = "Dustwallow Marsh" },
    ["Eastern Plaguelands"]      = { npcID = 0,      x = 53.8, y = 8.8,  npcZone = "Eastern Plaguelands" },
    ["Eversong Woods"]           = { npcID = 0,      x = 53.8, y = 8.8,  npcZone = "Eastern Plaguelands" },
    ["Ghostlands"]               = { npcID = 0,      x = 53.8, y = 8.8,  npcZone = "Eastern Plaguelands" },
    ["Silvermoon City"]          = { npcID = 0,      x = 53.8, y = 8.8,  npcZone = "Eastern Plaguelands" },
    ["Isle of Quel'Danas"]       = { npcID = 0,      x = 53.8, y = 8.8,  npcZone = "Eastern Plaguelands" },
}


-------------------------------------------------------------------------------
-- Unified post-merge corrections and aliases
-------------------------------------------------------------------------------

-- Add the newer source filters that were added after the original shared file.
local function HasSourceOption(key)
    for _, option in ipairs(Shared.SourceFilterOptions or {}) do
        if option.key == key then
            return true
        end
    end
    return false
end

local function InsertSourceOptionAfter(afterKey, key, text)
    Shared.SourceFilterOptions = Shared.SourceFilterOptions or {}

    if HasSourceOption(key) then
        return
    end

    local insertIndex = #Shared.SourceFilterOptions + 1

    for index, option in ipairs(Shared.SourceFilterOptions) do
        if option.key == afterKey then
            insertIndex = index + 1
            break
        end
    end

    table.insert(Shared.SourceFilterOptions, insertIndex, { key = key, text = text })
end

local function HasSourceOrder(key)
    for _, value in ipairs(Shared.SourceOrder or {}) do
        if value == key then
            return true
        end
    end
    return false
end

local function InsertSourceOrderAfter(afterKey, key)
    Shared.SourceOrder = Shared.SourceOrder or {}

    if HasSourceOrder(key) then
        return
    end

    local insertIndex = #Shared.SourceOrder + 1

    for index, value in ipairs(Shared.SourceOrder) do
        if value == afterKey then
            insertIndex = index + 1
            break
        end
    end

    table.insert(Shared.SourceOrder, insertIndex, key)
end

InsertSourceOptionAfter("promo", "collab", "Expired Collabs")
InsertSourceOptionAfter("catalog", "patch121", "Patch 12.1")
InsertSourceOrderAfter("promo", "collab")
InsertSourceOrderAfter("profession", "patch121")

Shared.SourceLabels = Shared.SourceLabels or {}
Shared.SourceLabels.collab = Shared.SourceLabels.collab or "Expired Collabs"
Shared.SourceLabels.patch121 = Shared.SourceLabels.patch121 or "Patch 12.1"
Shared.SourceLabels.treasure = Shared.SourceLabels.treasure or "Drop"
Shared.SourceLabels.boss = Shared.SourceLabels.boss or "Drop"

Shared.LabelColors = Shared.LabelColors or {}
Shared.LabelColors.Sources = Shared.LabelColors.Sources or {}
Shared.LabelColors.Sources.collab = Shared.LabelColors.Sources.collab or "F94144"
Shared.LabelColors.Sources.patch121 = Shared.LabelColors.Sources.patch121 or "FF758F"

-- Keep any newer currency icon from the merged/current constants.
Shared.CurrencyIcons = Shared.CurrencyIcons or {}
Shared.CurrencyIcons[3448] = Shared.CurrencyIcons[3448] or 8032876

-- Fix old typo from the shared source action entry.
if Shared.SourceActions and Shared.SourceActions["Frederick the Fabulous"] then
    local frederick = Shared.SourceActions["Frederick the Fabulous"]
    frederick.zone = frederick.zone or frederick.zobe or "Jade Forest"
    frederick.zobe = nil
end

-- Restore the newer Coiled Isle delve pins if the older shared file did not have them.
Shared.SourceActions = Shared.SourceActions or {}

if Shared.SourceActions["Midnight Delves"] then
    local midnight = Shared.SourceActions["Midnight Delves"]
    midnight.locations = midnight.locations or {}

    local function HasLocation(title)
        for _, loc in ipairs(midnight.locations) do
            if loc.title == title then
                return true
            end
        end
        return false
    end

    if not HasLocation("Gnarldor") then
        table.insert(midnight.locations, { title = "Gnarldor", zone = "The Coiled Isle", mapID = 2666, x = 64.6, y = 77.4 })
    end

    if not HasLocation("The Ring of Glory") then
        table.insert(midnight.locations, { title = "The Ring of Glory", zone = "The Coiled Isle", mapID = 2666, x = 71.30, y = 56.53 })
    end
end

Shared.SourceActions["The Coiled Isle Delves"] = Shared.SourceActions["The Coiled Isle Delves"] or {
    type = "map",
    label = "The Coiled Isle Delves",
    zone = "The Coiled Isle",
    mapID = 2666,
    locations = {
        { title = "Gnarldor", zone = "The Coiled Isle", mapID = 2666, x = 64.6, y = 77.4 },
        { title = "The Ring of Glory", zone = "The Coiled Isle", mapID = 2666, x = 71.30, y = 56.53 },
    },
}

-- Keep newer Midnight reputation/renown lookup if present in data.
Shared.RenownFactionIDs = Shared.RenownFactionIDs or {}
Shared.RenownFactionIDs["Zul'jarra's Forces"] = Shared.RenownFactionIDs["Zul'jarra's Forces"] or 2772

-------------------------------------------------------------------------------
-- Scene defaults
-------------------------------------------------------------------------------
-- The old shared file used Enum.HousingCatalogEntryModelScenePresets.DecorDefault
-- and only fell back to 0. Keep that old value for compatibility, but also expose
-- DEFAULT_DECOR_SCENE_ID as a safe actual preview fallback used by the merged UI.

local DecorDefaultSceneID =
    Enum
    and Enum.HousingCatalogEntryModelScenePresets
    and Enum.HousingCatalogEntryModelScenePresets.DecorDefault

Shared.DefaultSceneID = Shared.DefaultSceneID or DecorDefaultSceneID or 0
Shared.ModelSceneID = Shared.ModelSceneID or 1317

-- Gallery has already proven 859 works as a safe fallback for the preview scene.
Shared.DefaultDecorSceneID = Shared.DefaultDecorSceneID or 859

-------------------------------------------------------------------------------
-- Rebuild RareEvents after post-merge SourceActions corrections
-------------------------------------------------------------------------------

Shared.RareEvents = Shared.RareEvents or {}

for key, action in pairs(Shared.SourceActions or {}) do
    if action.locations then
        Shared.RareEvents[key] = Shared.RareEvents[key] or {}
        wipe(Shared.RareEvents[key])

        for _, loc in ipairs(action.locations) do
            table.insert(Shared.RareEvents[key], {
                name = loc.name or loc.title,
                title = loc.title or loc.name,
                zone = loc.zone or action.zone,
                mapID = loc.mapID or action.mapID,
                x = loc.x,
                y = loc.y,
            })
        end
    end
end

-------------------------------------------------------------------------------
-- DecorVendor bridge: old main constants.lua behavior, now under DVD
-------------------------------------------------------------------------------

C.VERSION_TEXT = C.VERSION_TEXT or "Current Version %s"
C.VERSION = C.VERSION or "2.06"
C.ADDON_PREFIX = C.ADDON_PREFIX or "|cff00ccff[Decor Vendor]|r "

DVD.ADDON_NAME = addonName
DVD.ADDON_PREFIX = C.ADDON_PREFIX

DVD.EXPANSION_ORDER = Shared.EXPANSION_ORDER or DVD.EXPANSION_ORDER
DVD.rareEvents = Shared.RareEvents or DVD.rareEvents or {}
DVD.RareEvents = DVD.rareEvents
DVD.SOURCE_ACTIONS = Shared.SourceActions or DVD.SOURCE_ACTIONS or {}
DVD.SourceActions = DVD.SOURCE_ACTIONS

DVD.Profession_Order = Shared.ProfessionOrder or DVD.Profession_Order
DVD.ProfessionOrder = Shared.ProfessionOrder or DVD.ProfessionOrder
DVD.ProfessionIcons = Shared.ProfessionIcons or DVD.ProfessionIcons

DVD.reputationRanks = Shared.ReputationRanks or DVD.reputationRanks
DVD.renownFactionIDs = Shared.RenownFactionIDs or DVD.renownFactionIDs
DVD.subfactionIDs = Shared.SubfactionIDs or DVD.subfactionIDs
DVD.subfactionRanks = Shared.SubfactionRanks or DVD.subfactionRanks
DVD.friendshipRanks = Shared.FriendshipRanks or DVD.friendshipRanks
DVD.friendshipFactionIDs = Shared.FriendshipFactionIDs or DVD.friendshipFactionIDs

DVD.ExpansionColors = Shared.ExpansionColors or DVD.ExpansionColors
DVD.ContinentExpansion = Shared.ContinentExpansion or DVD.ContinentExpansion
DVD.ContinentColors = Shared.ContinentColors or DVD.ContinentColors
DVD.ZidormiZones = Shared.ZidormiZones or DVD.ZidormiZones

DVD.SourceIcons = Shared.SourceIcons or DVD.SourceIcons or {}
DVD.SourceColors = Shared.SourceColors or DVD.SourceColors or {}

DVD.LabelColors = Shared.LabelColors or DVD.LabelColors or {}
DVD.ColorizeLabel = Shared.ColorizeLabel or DVD.ColorizeLabel

-------------------------------------------------------------------------------
-- C table bridge: old constants.lua + old Gallery Constants.lua behavior
-------------------------------------------------------------------------------

C.COLORS = Shared.Colors or C.COLORS or {}
C.CAMERA = Shared.Camera or C.CAMERA or {}
C.SCENE_PRESETS = Shared.ScenePresets or C.SCENE_PRESETS or {}

C.DEFAULT_SCENE_ID = Shared.DefaultSceneID or C.DEFAULT_SCENE_ID or 0
C.DEFAULT_DECOR_SCENE_ID = Shared.DefaultDecorSceneID or C.DEFAULT_DECOR_SCENE_ID or 859
C.MODEL_SCENE_ID = Shared.ModelSceneID or C.MODEL_SCENE_ID or 1317

C.CatalogSizing = Shared.CatalogSizing or C.CatalogSizing or {}

C.CARD_SIZE = (Shared.GalleryCard and Shared.GalleryCard.CARD_SIZE) or C.CARD_SIZE or 96
C.CARD_GAP = (Shared.GalleryCard and Shared.GalleryCard.CARD_GAP) or C.CARD_GAP or 14
C.GRID_PADDING = (Shared.GalleryCard and Shared.GalleryCard.GRID_PADDING) or C.GRID_PADDING or 18

C.FILTER_SOURCE_OPTIONS = Shared.SourceFilterOptions or C.FILTER_SOURCE_OPTIONS or {}
C.SourceFilterOptions = C.FILTER_SOURCE_OPTIONS

C.SOURCE_LABELS = Shared.SourceLabels or C.SOURCE_LABELS or {}
C.SourceLabels = C.SOURCE_LABELS

C.SOURCE_ORDER = Shared.SourceOrder or C.SOURCE_ORDER or {}
C.SourceOrder = C.SOURCE_ORDER

C.SOURCE_ATLAS_ICONS = Shared.SourceAtlasIcons or C.SOURCE_ATLAS_ICONS or {}
C.SourceAtlasIcons = C.SOURCE_ATLAS_ICONS

C.GOLD_ICON = Shared.GOLD_ICON or C.GOLD_ICON or "Interface\\MoneyFrame\\UI-GoldIcon"
C.CURRENCY_ICONS = Shared.CurrencyIcons or C.CURRENCY_ICONS or {}
C.CurrencyIcons = C.CURRENCY_ICONS

C.SOURCE_ACTIONS = Shared.SourceActions or C.SOURCE_ACTIONS or {}
C.SourceActions = C.SOURCE_ACTIONS

C.RARE_EVENTS = Shared.RareEvents or C.RARE_EVENTS or {}
C.RareEvents = C.RARE_EVENTS

C.ExpansionColors = Shared.ExpansionColors or C.ExpansionColors or {}
C.ContinentExpansion = Shared.ContinentExpansion or C.ContinentExpansion or {}
C.ContinentColors = Shared.ContinentColors or C.ContinentColors or {}
C.ZidormiZones = Shared.ZidormiZones or C.ZidormiZones or {}

C.LabelColors = Shared.LabelColors or C.LabelColors or {}
C.ColorizeLabel = Shared.ColorizeLabel or C.ColorizeLabel or function(label, colorTable, key)
    label = tostring(label or "Unknown")
    key = key or label

    local hex =
        colorTable
        and (
            colorTable[key]
            or colorTable[string.lower(tostring(key))]
            or colorTable.unknown
            or colorTable.Unknown
        )
        or "888888"

    return "|cff" .. hex .. label .. "|r"
end

-------------------------------------------------------------------------------
-- Legacy layout aliases from old main constants.lua
-------------------------------------------------------------------------------

local CatSizing = C.CatalogSizing or {}
local LegacySizing = Shared.LegacySizing or {}

C.DEFAULT_FRAME_WIDTH  = CatSizing.FrameWidth or C.DEFAULT_FRAME_WIDTH or 1100
C.DEFAULT_FRAME_HEIGHT = CatSizing.FrameHeight or C.DEFAULT_FRAME_HEIGHT or 750
C.MIN_FRAME_WIDTH      = CatSizing.FrameWidth or C.MIN_FRAME_WIDTH or 1100
C.MIN_FRAME_HEIGHT     = CatSizing.FrameHeight or C.MIN_FRAME_HEIGHT or 750

C.SIDEBAR_WIDTH         = CatSizing.SidebarWidth or C.SIDEBAR_WIDTH or 200
C.PREVIEW_WIDTH         = CatSizing.DetailPanelWidth or C.PREVIEW_WIDTH or 330
C.PREVIEW_DEFAULT_WIDTH = CatSizing.DetailPanelWidth or C.PREVIEW_DEFAULT_WIDTH or 330

C.MODELCONTAINER_HEIGHT = CatSizing.ModelViewerHeight or C.MODELCONTAINER_HEIGHT or 240
C.MODEL_VIEWER_HEIGHT   = CatSizing.ModelViewerHeight or C.MODEL_VIEWER_HEIGHT or 240
C.SCROLLCHILD_WIDTH     = C.SCROLLCHILD_WIDTH or 1

C.SEARCHBOX_WIDTH       = CatSizing.SearchBoxWidth or C.SEARCHBOX_WIDTH or 260
C.SEARCHBOX_HEIGHT      = LegacySizing.SEARCHBOX_HEIGHT or C.SEARCHBOX_HEIGHT or 22

C.HEADER_HEIGHT         = LegacySizing.HEADER_HEIGHT or CatSizing.FilterBarHeight or C.HEADER_HEIGHT or 32
C.TITLEBG_HEIGHT        = LegacySizing.TITLEBG_HEIGHT or CatSizing.FilterBarHeight or C.TITLEBG_HEIGHT or 32

C.DIVIDER_HEIGHT        = LegacySizing.DIVIDER_HEIGHT or C.DIVIDER_HEIGHT or 2
C.TITLESEPERATOR_HEIGHT = LegacySizing.TITLESEPERATOR_HEIGHT or C.TITLESEPERATOR_HEIGHT or 2

C.VENDOR_HEADER_HEIGHT  = LegacySizing.VENDOR_HEADER_HEIGHT or C.VENDOR_HEADER_HEIGHT or 22
C.LINE_HEIGHT           = LegacySizing.LINE_HEIGHT or C.LINE_HEIGHT or 20

C.RESETBTN_WIDTH        = LegacySizing.RESETBTN_WIDTH or C.RESETBTN_WIDTH or 120
C.RESETBTN_HEIGHT       = LegacySizing.RESETBTN_HEIGHT or C.RESETBTN_HEIGHT or 22

C.RESETCACHE_WIDTH      = LegacySizing.RESETCACHE_WIDTH or C.RESETCACHE_WIDTH or 170
C.RESETCACHE_HEIGHT     = LegacySizing.RESETCACHE_HEIGHT or C.RESETCACHE_HEIGHT or 22

C.INFOSIZE_WIDTH        = LegacySizing.INFOSIZE_WIDTH or C.INFOSIZE_WIDTH or 22
C.INFOSIZE_HEIGHT       = LegacySizing.INFOSIZE_HEIGHT or C.INFOSIZE_HEIGHT or 22

C.CLOSE_WIDTH           = LegacySizing.CLOSE_WIDTH or C.CLOSE_WIDTH or 28
C.CLOSE_HEIGHT          = LegacySizing.CLOSE_HEIGHT or C.CLOSE_HEIGHT or 28

C.CHECKTOGGLE_WIDTH     = LegacySizing.CHECKTOGGLE_WIDTH or C.CHECKTOGGLE_WIDTH or 28
C.CHECKTOGGLE_HEIGHT    = LegacySizing.CHECKTOGGLE_HEIGHT or C.CHECKTOGGLE_HEIGHT or 28

C.PREVBTN_WIDTH         = LegacySizing.PREVBTN_WIDTH or C.PREVBTN_WIDTH or 24
C.PREVBTN_HEIGHT        = LegacySizing.PREVBTN_HEIGHT or C.PREVBTN_HEIGHT or 24
C.NEXTBTN_WIDTH         = LegacySizing.NEXTBTN_WIDTH or C.NEXTBTN_WIDTH or 24
C.NEXTBTN_HEIGHT        = LegacySizing.NEXTBTN_HEIGHT or C.NEXTBTN_HEIGHT or 24

C.RECIPEFRAME_WIDTH     = LegacySizing.RECIPEFRAME_WIDTH or C.RECIPEFRAME_WIDTH or 300
C.RECIPEFRAME_HEIGHT    = LegacySizing.RECIPEFRAME_HEIGHT or C.RECIPEFRAME_HEIGHT or 40
C.RECIPEICON_WIDTH      = LegacySizing.RECIPEICON_WIDTH or C.RECIPEICON_WIDTH or 40
C.RECIPEICON_HEIGHT     = LegacySizing.RECIPEICON_HEIGHT or C.RECIPEICON_HEIGHT or 40
C.RECIPETEXT_WIDTH      = LegacySizing.RECIPETEXT_WIDTH or C.RECIPETEXT_WIDTH or 200

C.MODEL_ROTATION_SENSITIVITY = LegacySizing.MODEL_ROTATION_SENSITIVITY or C.MODEL_ROTATION_SENSITIVITY or 0.01
C.MODEL_ZOOM_SCALE           = LegacySizing.MODEL_ZOOM_SCALE or C.MODEL_ZOOM_SCALE or 1.2
C.MODEL_ZOOM_MIN             = LegacySizing.MODEL_ZOOM_MIN or C.MODEL_ZOOM_MIN or 0.5
C.MODEL_ZOOM_MAX             = LegacySizing.MODEL_ZOOM_MAX or C.MODEL_ZOOM_MAX or 3.0
C.MODEL_ZOOM_STEP            = LegacySizing.MODEL_ZOOM_STEP or C.MODEL_ZOOM_STEP or 0.1
C.MODEL_VERTICAL_OFFSET      = LegacySizing.MODEL_VERTICAL_OFFSET or C.MODEL_VERTICAL_OFFSET or -0.1

C.SPACING_SMALL = C.SPACING_SMALL or (Shared.Spacing and Shared.Spacing.SMALL) or 4
C.SPACING_NORMAL = C.SPACING_NORMAL or (Shared.Spacing and Shared.Spacing.NORMAL) or 8
C.SPACING_LARGE = C.SPACING_LARGE or (Shared.Spacing and Shared.Spacing.LARGE) or 16

-------------------------------------------------------------------------------
-- Client availability aliases on C/Shared for moved files
-------------------------------------------------------------------------------

C.GetClientInterface = DVD.GetClientInterface
C.IsDataAvailableForClient = DVD.IsDataAvailableForClient
C.IsItemAvailableForClient = DVD.IsItemAvailableForClient

Shared.GetClientInterface = DVD.GetClientInterface
Shared.IsDataAvailableForClient = DVD.IsDataAvailableForClient
Shared.IsItemAvailableForClient = DVD.IsItemAvailableForClient

-------------------------------------------------------------------------------
-- Final alias refresh
-------------------------------------------------------------------------------

DVD.CONSTANTS = C
DVD.C = C
DVD.Constants = C

DVD.Gallery = DVD.Gallery or {}
DVD.Gallery.C = C
DVD.Gallery.Constants = C
DVD.Gallery.Shared = Shared
DVD.Gallery.ActiveItems = DVD.ActiveItems or DVD.Gallery.ActiveItems or {}

_G.DecorVendor = DVD
_G.Decorvendor = DVD
_G.DecorVendorData = DVD
_G.DecorVendor_Data = DVD
_G[addonName] = DVD
