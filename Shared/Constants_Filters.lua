local addonName, DVD = ...
local C = DVD.CONSTANTS or DVD.C

-- Put C.GALLERY_FILTER_SECTIONS, C.SOURCE_ALIASES, C.SOURCE_LABELS, C.SOURCE_ORDER, and C.MAIN_SECTIONS here.

-------------------------------------------------
-- Gallery Sidebar Filter Sections
-------------------------------------------------
C.GALLERY_FILTER_SECTIONS = C.GALLERY_FILTER_SECTIONS or {
    {
        key = "collection",
        title = "My Collection",
        defaultCollapsed = false,

        options = {
            {
                key = "showCollected",
                label = "Collected",
                type = "toggle",
            },
            {
                key = "showNotCollected",
                label = "Not Collected",
                type = "toggle",
            },
        },
    },
    {
        key = "source",
        title = "Source",
        defaultCollapsed = false,

        options = {
            {
                key = "vendor",
                label = "Vendor",
                type = "source",
            },
            {
                key = "holiday",
                label = "Holiday Decor",
                type = "source",
                hideWhenZero = true,
            },			
            {
                key = "quest",
                label = "Quest",
                type = "source",
            },
            {
                key = "achievement",
                label = "Achievement",
                type = "source",
            },
            {
                key = "drop",
                label = "Drop",
                type = "source",
            },
            {
                key = "profession",
                label = "Profession",
                type = "source",
            },
            {
                key = "shop",
                label = "Shop",
                type = "source",
            },
            {
                key = "prepurchase",
                label = "Pre Purchase",
                type = "source",
                hideWhenZero = true,
            },
            {
                key = "forever",
                label = "Warcraft Forever",
                type = "source",
                hideWhenZero = true,
            },			
            {
                key = "lushshop",
                label = "Lush Garden Pack",
                type = "source",
            },
            {
                key = "blossomshop",
                label = "Spring Blossom Pack",
                type = "source",
            },
            {
                key = "pastcharity",
                label = "Expired The Roofus Pack",
                type = "source",
                hideWhenZero = true,
            },			
            {
                key = "promo",
                label = "Twitch Grrgle Promos",
                type = "source",
                hideWhenZero = true,
            },			
            {
                key = "collab",
                label = "Expired Collabs",
                type = "source",
                hideWhenZero = true,
            },			
            {
                key = "patch125",
                label = "Patch 12.1.5",
                type = "source",
                hideWhenZero = true,
            },			
        },
    },
}

-------------------------------------------------
-- Gallery Source Aliases / Labels / Order
-------------------------------------------------
C.SOURCE_ALIASES = C.SOURCE_ALIASES or {
    -- Vendors
    vendor = "vendor",
    vendors = "vendor",

    -- Shop
    shop = "shop",
    ingameshop = "shop",
	soon = "shop",

    -- Quests
    quest = "quest",
    quests = "quest",

    -- Achievements
    achievement = "achievement",
    achievements = "achievement",
    achieve = "achievement",
    ach = "achievement",

    -- Drops, bosses, and treasures
    drop = "drop",
    drops = "drop",
    boss = "drop",
    bossdrop = "drop",
    bossdrops = "drop",
    encounter = "drop",
    encounterdrop = "drop",
    encounterdrops = "drop",
    treasure = "drop",
    treasures = "drop",
    chest = "drop",
    chests = "drop",

    -- Promotions
    promo = "promo",
    promotion = "promo",
    promotional = "promo",

    -- Collaborations
    collab = "collab",
    collabs = "collab",
    collaboration = "collab",
    collaborations = "collab",
    expiredcollab = "collab",
    expiredcollabs = "collab",

    -- Patch 12.1
    patch125 = "patch125",
    ["patch12.1.5"] = "patch125",
    patch1201 = "patch125",
    ["125"] = "patch125",

	-- Holiday
	holiday = "holiday",
	
    -- Patch 12.1
    prepurchase = "prepurchase",
	
	--Warcraft Forever
	forever = "forever",
	
	-- Charity
	pastcharity = "pastcharity",
	
	-- Charity
	blossomshop = "blossomshop",
	
	-- Charity
	lushshop = "lushshop",
	
    -- Professions
    profession = "profession",
    professions = "profession",
    crafted = "profession",
    crafting = "profession",
    recipe = "profession",
}

C.SOURCE_LABELS = C.SOURCE_LABELS or {
    all = "All Decor",
    vendor = "Vendor",
    shop = "In-Game Shop",
	blossomshop = "Spring Blossom Pack",
	lushshop = "Lush Garden Pack",
    quest = "Quest",
    achievement = "Achievement",
    drop = "Drop",
    promo = "Promo",
	holiday = "Holiday Decor",
    profession = "Profession",
    catalog = "Housing Catalog",
    unreleased = "Unreleased",
    collab = "Expired Collabs",
    patch125 = "Patch 12.1.5",
	prepurchase = "Pre Purchase",
	forever = "Warcraft Forever",
	pastcharity = "Expired The Roofus Pack",
}

C.SOURCE_ORDER = C.SOURCE_ORDER or {
    "vendor",
    "shop",
	"blossomshop",
	"lushshop",
    "quest",
    "achievement",
    "drop",
	"holiday",
    "promo",
    "collab",
	"prepurchase",
	"forever",
    "patch125",
	"pastcharity",	
    "profession",
}

-------------------------------------------------
-- Main Addon Sections
-- Shared by BottomTabs and MainHomePanel
-------------------------------------------------
C.MAIN_SECTIONS = C.MAIN_SECTIONS or {
    {
        id = "vendors",
        text = "Vendors",
        icon = "Interface\\Icons\\inv_misc_5potionbag_special",
        width = 128,

        homeColor = { 0.35, 0.75, 1.00 },
        homeDescription = "Browse original decor vendors, waypoint support, and vendor locations.",
        showHomeCount = true,
    },
    {
        id = "professions",
        text = "Professions",
        icon = "Interface\\Icons\\Trade_Tailoring",
        width = 136,

        homeColor = { 0.55, 1.00, 0.70 },
        homeDescription = "View crafted decor, recipes, materials, and profession requirements.",
        showHomeCount = true,
    },
    {
        id = "quests",
        text = "Quests",
        icon = "Interface\\Icons\\Inv_misc_note_01",
        width = 128,

        homeColor = { 1.00, 0.82, 0.10 },
        homeDescription = "Track decor earned from quests and quest-related unlocks.",
        showHomeCount = true,
    },
    {
        id = "achievements",
        text = "Achievements",
        icon = "Interface\\Icons\\achievement_level_100",
        width = 158,

        homeColor = { 0.75, 0.45, 1.00 },
        homeDescription = "Find decor tied to achievements and collection progress.",
        showHomeCount = true,
    },
    {
        id = "bossdrops",
        text = "Drops",
        icon = "Interface\\Icons\\achievement_boss_blackhand",
        width = 136,

        homeColor = { 1.00, 0.45, 0.45 },
        homeDescription = "Browse decor from bosses, rares, treasures, events, and drops.",
        showHomeCount = true,
    },
--[[	{
        id = "shop",
        text = "Shop Decor",
		icon = "Interface\\Icons\\ui_shop",
		width = 136,
			
        homeColor = {0.00, 0.68, 0.94}, -- A crisp Blizzard Blue
        homeDescription = "View premium decor items available through the in-game shop",
        showHomeCount = true,
    },
   {
        id = "decor",
        text = "Vendor Decor Catalog",
		icon = "Interface\\Icons\\garrison_building_magetower",
        width = 160,
		
        homeColor = { 1.00, 0.35, 0.85 },
        homeDescription = "Preview decor in 3D, compare sources, and browse the full  vendor collection.",
        showHomeCount = true,
    },]]	
   {
        id = "gallery",
        text = "Gallery Browser",
		icon = "Interface\\Icons\\garrison_building_magetower",
        width = 160,
		
        homeColor = { 1.00, 0.35, 0.85 },
        homeDescription = "Preview decor in 3D, compare sources, and browse the full collection.",
        showHomeCount = false,
    },
}

-------------------------------------------------
-- Main Source Filter Options
-------------------------------------------------
C.MAIN_SOURCE_PRIORITY = C.MAIN_SOURCE_PRIORITY or {
        "quest",
        "achievement",
        "prey",
        "profession",
        "drop",
        "treasure",
        "vendor",
        "shop",
    }

C.MAIN_SOURCE_LABELS = C.MAIN_SOURCE_LABELS or {
        quest = "Quest",
        achievement = "Achievement",
        prey = "Prey",
        profession = "Profession",
        drop = "Drop",
        treasure = "Treasure",
        vendor = "Vendor",
        shop = "Shop",
    }

C.MAIN_SOURCE_ALIASES = C.MAIN_SOURCE_ALIASES or {
        quest = "quest",
        quests = "quest",

        achievement = "achievement",
        achievements = "achievement",
        achieve = "achievement",
        ach = "achievement",

        prey = "prey",

        profession = "profession",
        professions = "profession",
        crafted = "profession",
        crafting = "profession",
        recipe = "profession",

        drop = "drop",
        drops = "drop",
        boss = "drop",
        bossdrop = "drop",
        bossdrops = "drop",
        encounter = "drop",
        encounterdrop = "drop",

        treasure = "treasure",
        treasures = "treasure",
        chest = "treasure",
        chests = "treasure",

        vendor = "vendor",
        vendors = "vendor",

        shop = "shop",
        store = "shop",
        ingameshop = "shop",
        wowshop = "shop",
        battlenetshop = "shop",

    }
























