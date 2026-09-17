--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

Source actions for maps, coordinates, world-map actions,
Encounter Journal actions, and rotating source locations.
============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

-------------------------------------------------
-- Temporary Shared Compatibility
-------------------------------------------------
DVD.Shared = DVD.Shared or {}
local Shared = DVD.Shared

if not C then
    print(
        "|cffff4040Decor Vendor:|r "
        .. "SourceActions.lua could not find the constants table. "
        .. "Check the TOC load order."
    )
    return
end

-------------------------------------------------
--  Source Actions / Map Pins
-------------------------------------------------
C.SOURCE_ACTIONS = C.SOURCE_ACTIONS or {}



C.SOURCE_ACTIONS["Dreamsurge Event"] = C.SOURCE_ACTIONS["Dreamsurge Event"] or {
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

C.SOURCE_ACTIONS["Darkshore Rares"] = C.SOURCE_ACTIONS["Darkshore Rares"] or {
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

C.SOURCE_ACTIONS["Daily Darkshore Rares"] = C.SOURCE_ACTIONS["Daily Darkshore Rares"] or C.SOURCE_ACTIONS["Darkshore Rares"]

C.SOURCE_ACTIONS["Midnight Delves"] = C.SOURCE_ACTIONS["Midnight Delves"] or {
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
    },
}

C.SOURCE_ACTIONS["The Coiled Isle Delves"] = C.SOURCE_ACTIONS["The Coiled Isle Delves"] or {
    type = "map",
    label = "The Coiled Isle Delves",
    openMapID = 2512,
    locations = {
        { title = "Gnarldor", zone = "The Coiled Isle", mapID = 2512, x = 64.6, y = 77.4 },
        { title = "The Ring of Glory", zone = "The Coiled Isle", mapID = 2512, x = 71.30, y = 56.53 },		
    },
}

C.SOURCE_ACTIONS["Withered Army Training"] = C.SOURCE_ACTIONS["Withered Army Training"] or {
    type = "map",
    label = "Withered Army Training",
    zone = "Suramar",
    mapID = 680,
    locations = {
        { title = "Glimmering Treasure Chest", zone = "Suramar", mapID = 680, x = 22.8, y = 36.2 },
    },
}

C.SOURCE_ACTIONS["Stellar Stash"] = C.SOURCE_ACTIONS["Stellar Stash"] or {
    type = "map",
    label = "Stellar Stash",
    zone = "Masters' Perch",
    mapID = 2444,
    locations = {
        { title = "Stellar Stash", zone = "Masters' Perch", mapID = 2444, x = 53.5, y = 32.2 },
    },
}

C.SOURCE_ACTIONS["Malignant Chest"] = C.SOURCE_ACTIONS["Malignant Chest"] or {
    type = "map",
    label = "Malignant Chest",
    zone = "Voidstorm",
    mapID = 2405,
    locations = {
        { title = "Malignant Chest", zone = "Voidstorm", mapID = 2405, x = 53.3, y = 42.7 },
    },
}

C.SOURCE_ACTIONS["Scraps Heaps"] = C.SOURCE_ACTIONS["Scraps Heaps"] or {
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

C.SOURCE_ACTIONS["Triple-Locked Safebox"] = C.SOURCE_ACTIONS["Triple-Locked Safebox"] or {
    type = "map",
    label = "Triple-Locked Safebox",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Triple-Locked Safebox", zone = "Eversong Woods", mapID = 2395, x = 38.9, y = 76.1 },
    },
}

C.SOURCE_ACTIONS["Incomplete Book of Sonnets"] = C.SOURCE_ACTIONS["Incomplete Book of Sonnets"] or {
    type = "map",
    label = "Incomplete Book of Sonnets",
    zone = "Silvermoon City",
    mapID = 2393,
    locations = {
        { title = "Incomplete Book of Sonnets", zone = "Silvermoon City", mapID = 2393, x = 37.8, y = 52.5 },
    },
}

C.SOURCE_ACTIONS["Stone Vat"] = C.SOURCE_ACTIONS["Stone Vat"] or {
    type = "map",
    label = "Stone Vat",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Stone Vat", zone = "Eversong Woods", mapID = 2395, x = 40.5, y = 60.8 },
    },
}

C.SOURCE_ACTIONS["Gift of the Phoenix"] = C.SOURCE_ACTIONS["Gift of the Phoenix"] or {
    type = "map",
    label = "Gift of the Phoenix",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Gift of the Phoenix", zone = "Eversong Woods", mapID = 2395, x = 40.9, y = 19.5 },
    },
}

C.SOURCE_ACTIONS["Forgotten Ink and Quill"] = C.SOURCE_ACTIONS["Forgotten Ink and Quill"] or {
    type = "map",
    label = "Forgotten Ink and Quill",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Forgotten Ink and Quill", zone = "Eversong Woods", mapID = 2395, x = 43.3, y = 69.5 },
    },
}

C.SOURCE_ACTIONS["Reliquary's Lost Paint Supplies"] = C.SOURCE_ACTIONS["Reliquary's Lost Paint Supplies"] or {
    type = "map",
    label = "Reliquary's Lost Paint Supplies",
    zone = "Harandar",
    mapID = 2413,
    locations = {
        { title = "Reliquary's Lost Paint Supplies", zone = "Harandar", mapID = 2413, x = 62.9, y = 51.3 },
    },
}

C.SOURCE_ACTIONS["Theater Troupe"] = C.SOURCE_ACTIONS["Theater Troupe"] or {
    type = "map",
    label = "Theater Troupe",
    zone = "Khaz Algar",
    mapID = 2248,
    locations = {
        { title = "Distinguished Actor's Chest", zone = "Khaz Algar", mapID = 2248, x = 56.42, y = 51.47 },
    },
}

C.SOURCE_ACTIONS["Highmountain Paragon Chest"] = C.SOURCE_ACTIONS["Highmountain Paragon Chest"] or {
    type = "map",
    label = "Highmountain Paragon Chest",
    zone = "Highmountain",
    mapID = 750,
    locations = {
        { title = "Highmountain Paragon Chest", zone = "Highmountain", mapID = 750, x = 38.06, y = 46.05 },
    },
}

C.SOURCE_ACTIONS["Stormarion Assault"] = C.SOURCE_ACTIONS["Stormarion Assault"] or {
    type = "map",
    label = "Stormarion Assault",
    zone = "Voidstorm",
    mapID = 2405,
    openMapID = 2405,
    locations = {
        { title = "Stormarion Cache", zone = "Voidstorm", mapID = 2405, x = 26.83, y = 67.78 },
    },
}
C.SOURCE_ACTIONS["Mechagon Dailies"] = C.SOURCE_ACTIONS["Mechagon Dailies"] or {
    type = "map",
    label = "Mechagon Dailies",
    zone = "Mechagon",
    mapID = 1462,
    openMapID = 1462,
    locations = {
        { title = "Self-Assembling Homeware Kit", zone = "Mechagon", mapID = 1462, x = 56.0, y = 60.0 },
    },
}

C.SOURCE_ACTIONS["Cooking Daily"] = C.SOURCE_ACTIONS["Cooking Daily"] or {
    type = "map",
    label = "Cooking Daily",
    locations = {
        { title = "Katherine Lee", x = 40.3, y = 66.1 },
        { title = "Awilo Lon'gomba", x = 70.0, y = 38.9 },
    },
}

C.SOURCE_ACTIONS["Frederick the Fabulous"] = C.SOURCE_ACTIONS["Frederick the Fabulous"] or {
    type = "map",
    label = "Frederick the Fabulous",
	zone = "Jade Forest",
	mapID = 371,
    locations = {
        { title = "Frederick the Fabulous", x = 55.7, y = 15.7 },
    },
}

-- Temporary source-action compatibility aliases.
Shared.SOURCE_ACTIONS = C.SOURCE_ACTIONS

Shared.SourceActions = C.SOURCE_ACTIONS

DVD.SOURCE_ACTIONS = C.SOURCE_ACTIONS

DVD.SourceActions = C.SOURCE_ACTIONS

C.RARE_EVENTS = C.RARE_EVENTS or {}

local function BuildRareEventsFromSourceActions()
    for key, action in pairs(C.SOURCE_ACTIONS or {}) do
        if type(action) == "table"
        and type(action.locations) == "table" then
            local rareList = C.RARE_EVENTS[key] or {}

            -- Rebuild this action's locations so aliases stay current.
            wipe(rareList)

            for _, loc in ipairs(action.locations) do
                rareList[#rareList + 1] = {
                    name = loc.name or loc.title,
                    title = loc.title or loc.name,
                    zone = loc.zone or action.zone,
                    mapID = loc.mapID or action.mapID,
                    x = loc.x,
                    y = loc.y,
                }
            end

            C.RARE_EVENTS[key] = rareList
        end
    end
end

BuildRareEventsFromSourceActions()

-- Temporary compatibility aliases.
Shared.RARE_EVENTS = C.RARE_EVENTS

Shared.RareEvents = C.RARE_EVENTS

DVD.rareEvents = C.RARE_EVENTS

DVD.RareEvents = C.RARE_EVENTS
-------------------------------------------------
-- Neighborhood Endeavors
-------------------------------------------------

C.NEIGHBORHOOD_ENDEAVORS = C.NEIGHBORHOOD_ENDEAVORS or {}

function DVD.GetNeighborhoodEndeavorByID(initiativeID)
    initiativeID = tonumber(initiativeID)

    if not initiativeID then
        return nil
    end

    return C.NEIGHBORHOOD_ENDEAVORS[initiativeID]
end

C.NEIGHBORHOOD_ENDEAVORS[17] = {
    title = "Moderate Mechanization",
}
C.NEIGHBORHOOD_ENDEAVORS[13] = {
    title = "Friend of the Grummles",
}
C.NEIGHBORHOOD_ENDEAVORS[16] = {
    title = "Reaching Beyond the Possible",
}
C.NEIGHBORHOOD_ENDEAVORS[15] = {
    title = "Artistic Aid",
}
C.NEIGHBORHOOD_ENDEAVORS[19] = {
    title = "Smell Sensation",
}
C.NEIGHBORHOOD_ENDEAVORS[18] = {
    title = "Consortium Consternation",
}

C.SOURCE_ACTIONS["Pascal-K1N6"] = {
    type = "map",
    label = "Pascal-K1N6",
    availability = "endeavor",
    initiativeID = 17, -- we will discover the real ID

    locations = {
        {
            title = "Pascal-K1N6",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Pascal-K1N6",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Brother Dovetail"] = {
    type = "map",
    label = "Brother Dovetail",
    availability = "endeavor",

    initiativeID = 13, -- we will discover the real ID
    locations = {
        {
            title = "Brother Dovetail",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Brother Dovetail",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Hordranin"] = {
    type = "map",
    label = "Hordranin",
    availability = "endeavor",

    initiativeID = 16, -- we will discover the real ID
    locations = {
        {
            title = "Hordranin",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Hordranin",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Hesta Forlath"] = {
    type = "map",
    label = "Hesta Forlath",
    availability = "endeavor",

    initiativeID = 15, -- we will discover the real ID
    locations = {
        {
            title = "Hesta Forlath",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Hesta Forlath",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Harlowe Marl"] = {
    type = "map",
    label = "Harlowe Marl",
    availability = "endeavor",

    initiativeID = 19, -- we will discover the real ID
    locations = {
        {
            title = "Harlowe Marl",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Harlowe Marl",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Aeeshna"] = {
    type = "map",
    label = "Aeeshna",
    availability = "endeavor",

    initiativeID = 18, -- we will discover the real ID
    locations = {
        {
            title = "Aeeshna",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Aeeshna",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

-----------------Patch 12.1-------------------------
C.NEIGHBORHOOD_ENDEAVORS[24] = {
    title = "Vacation Season",
}
C.NEIGHBORHOOD_ENDEAVORS[20] = {
    title = "Every Bakar Has Its Day",
}
C.NEIGHBORHOOD_ENDEAVORS[22] = {
    title = "Knock-off Amani",
}
C.NEIGHBORHOOD_ENDEAVORS[12] = {
    title = "Candle Culture",
}


C.SOURCE_ACTIONS["Taifa"] = {
    type = "map",
    label = "Taifa",
    availability = "endeavor",

    initiativeID = 24, -- we will discover the real ID
    locations = {
        {
            title = "Taifa",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Taifa",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Griftah"] = {
    type = "map",
    label = "Griftah",
    availability = "endeavor",

    initiativeID = 22, -- we will discover the real ID
    locations = {
        {
            title = "Griftah",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Griftah",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Roshai Lightstep"] = {
    type = "map",
    label = "Roshai Lightstep",
    availability = "endeavor",

    initiativeID = 20, -- we will discover the real ID
    locations = {
        {
            title = "Roshai Lightstep",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Roshai Lightstep",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Timicky"] = {
    type = "map",
    label = "Timicky",
    availability = "endeavor",

    initiativeID = 12, -- we will discover the real ID
    locations = {
        {
            title = "Timicky",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Timicky",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}


C.SOURCE_ACTIONS["Cousin Shortkaf"] = {
    type = "map",
    label = "Cousin Shortkaf",
    availability = "endeavor",

    initiativeID = 123, -- we will discover the real ID
    locations = {
        {
            title = "Cousin Shortkaf",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Cousin Shortkaf",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Unquestionably Griftah"] = {
    type = "map",
    label = "Unquestionably Griftah",
    availability = "endeavor",

    initiativeID = 123, -- we will discover the real ID
    locations = {
        {
            title = "Unquestionably Griftah",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Unquestionably Griftah",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Throska"] = {
    type = "map",
    label = "Throska",
    availability = "endeavor",

    initiativeID = 123, -- we will discover the real ID
    locations = {
        {
            title = "Throska",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Throska",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}


