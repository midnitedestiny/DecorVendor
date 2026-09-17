local addonName, DVD = ...
local C = DVD.CONSTANTS or DVD.C

-- Put C.COLORS, C.LabelColors, C.ExpansionColors, and C.CURRENCY_ICONS here.
-------------------------------------------------
-- Expansion and Profession Order  
-------------------------------------------------
C.EXPANSION_ORDER = C.EXPANSION_ORDER or {
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

C.PROFESSION_ORDER = C.PROFESSION_ORDER or {
    "Alchemy",
    "Blacksmithing",
    "Cooking",
    "Enchanting",
    "Engineering",
    "Inscription",
    "Jewelcrafting",
    "Junkyard Tinkering",
    "Leatherworking",
    "Tailoring",
}
-- Temporary compatibility alias.
--C.Profession_Order = C.PROFESSION_ORDER
-------------------------------------------------
-- Colors
-------------------------------------------------
C.COLORS = C.COLORS or {
GOLD = { 1, 0.82, 0, 1 },
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

-------------------------------------------------
-- Label Colors
-------------------------------------------------
C.LabelColors = C.LabelColors or {}

C.LabelColors.Collection = {
    all = "FFD100",
    collected = "00FF66",
    notCollected = "FF6666",
    missing = "FF6666",
    unknown = "888888",
}

C.LabelColors.Factions = {
alliance = "44A1FF",
horde = "F75567",
neutral = "5BC193",
}

C.LabelColors.GalleryCategories = {
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

C.LabelColors.Sources = {
    vendor = "E07A5F",
    shop = "F4A261",
    blossomshop = "FFA07A",
    lushshop = "D97757",
    quest = "E17055",
    achievement = "FAB1A0",
    drop = "FF6B81",
    promo = "FF7979",
	holiday = "dc2f02",
    profession = "E67E22",
    prepurchase = "D68C45",
	forever = "41adea",
    pastcharity = "E84393",
    catalog = "B2B2B2",
    unreleased = "B85D33",
    treasure = "CD7F32",
    boss = "A0522D",
    collab = "FF70A6",
    patch121 = "FF9770",
    prey = "BF6900",
    unknown = "808080",
}

C.LabelColors.Professions = {
    Alchemy = "00FA9A",
    Blacksmithing = "B0C4DE",
    Cooking = "FF9F43",
    Enchanting = "BF5AF2",
    Engineering = "FFC000",
    Inscription = "0A84FF",
    Jewelcrafting = "FF64B4",
    ["Junkyard Tinkering"] = "B38B6D",
    Leatherworking = "D2691E",
    Tailoring = "D6A4FF",
    unknown = "7F8C8D",

}

C.LabelColors.BossCategories = {
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

C.LabelColors.QuestCategories = {
    race = "44DD88",
    spec = "FF66CC",
    unknown = "888888",
}

C.LabelColors.ShopCategories = {
    shop = "44DD88",
    charity = "6ef8fd",
    unknown = "888888",
}

C.LabelColors.VendorCategories = {
    none = "fb7698",
    friendship = "a6f942",
    neighborhood = "C084FC",
    Promo = "FFD100",
    race = "00FFCC",
    renown = "FF8844",
    reputation = "44DD88",
    subfaction = "FF66CC",
    unknown = "888888",
}

C.LabelColors.AchievementCategories = {
    Quests = "FFD100",
    Exploration = "44DD88",
    ["Feats of Strength"] = "FF66CC",
    ["Expansion Features"] = "66B2FF",
    ["Dungeons and Raids"] = "C084FC",
    ["Player vs Player"] = "FF5555",
    Professions = "FFAA44",
    ["Midnight Prey"] = "9955CC",
	["Legacy"] = "abffdc",
	["World Events"] = "cde61b",
    unknown = "888888",
}
-------------------------------------------------
-- Expansion Colors
-------------------------------------------------
C.ExpansionColors = C.ExpansionColors or {
    ["Classic"]                = "b2ccec",
    ["The Burning Crusade"]    = "b6aad1",
    ["Wrath of the Lich King"] = "bbb2d6",
    ["Cataclysm"]              = "cfa4c9",
    ["Mists of Pandaria"]      = "caa794",
    ["Warlords of Draenor"]    = "c598e6", -- Brightened for readability
    ["Legion"]                 = "c3e0f7",
    ["Battle for Azeroth"]     = "dcb8eb",
    ["Shadowlands"]            = "a9aade",
    ["Dragonflight"]           = "b6d9d3",
    ["The War Within"]         = "97bfd2",
    ["Midnight"]               = "d4b9f0",
    ["Neighborhoods"]          = "E0E0E0",
    ["Unknown"]                = "7F8C8D",

}
-------------------------------------------------
-- Currency Icons
-------------------------------------------------
C.CURRENCY_ICONS = C.CURRENCY_ICONS or {
    [823]  = 1061300,
    [824]  = 1005027,
    [1155] = 1377394,
    [1220] = 1397630,
    [1508] = 1064188,
    [1560] = 2032600,
    [1710] = 1604167,
    [1767] = 3743739,
    [1792] = 1455894,
    [1803] = 3069889,
    [1813] = 3528288,
    [2003] = 2065578,
    [2118] = 134388,
    [2657] = 1362650,
    [2803] = 133858,
    [2815] = 2967113,
    [3056] = 4549280,
    [3316] = 7137586,
    [3319] = 7195171,
    [3363] = 134495,
    [3373] = 348545,
    [3377] = 5041790,
    [3379] = 132849,
    [3392] = 4554435,
    [3405] = 2459456,
	[3448] = 8032876,
	[37829] = 133784,
}

C.CurrencyIcons = C.CURRENCY_ICONS

C.GOLD_ICON = C.GOLD_ICON or "Interface\\MoneyFrame\\UI-GoldIcon"

C.HEARTHSTEEL_ATLAS = C.HEARTHSTEEL_ATLAS or "hearthsteel-icon-32x32"

C.GALLERY_FACTION_ICONS = C.GALLERY_FACTION_ICONS or {
    alliance = "Interface\\AddOns\\DecorVendor\\Assets\\blue",
    horde = "Interface\\AddOns\\DecorVendor\\Assets\\red",
    neutral = "Interface\\AddOns\\DecorVendor\\Assets\\neutral",
}





























