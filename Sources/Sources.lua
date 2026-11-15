-- ============================================================
-- Decor Vendor: Sources.lua
-- Consolidated file. Each section below is one original file,
-- preserved verbatim and wrapped in its own function scope:
-- (function(...) ... end)(...). That gives the section exactly
-- the behavior it had as a separate file - its local variables
-- stay private, and a top-level return or guard clause exits
-- only that section. Sections run in the original .toc order.
-- ============================================================

-- ------------------------------------------------------------
-- SECTION: Sources/MainSources.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
This file is part of the Decor Vendor addon.
All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.
You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects
without explicit permission from the author.
This addon is distributed for personal use only.

[1] = "Classic", [2] = "The Burning Crusade", [3] = "Wrath of the Lich King",
[4] = "Cataclysm", [5] = "Mists of Pandaria", [6] = "Warlords of Draenor",
[7] = "Legion", [8] = "Battle for Azeroth", [9] = "Shadowlands",
[10] = "Dragonflight", [11] = "The War Within", [12] = "Midnight"
============================================================
]]
local addonName, DVD = ...
--[[
    Combined source database file.
    Original load order preserved:
    Vendors -> Quests -> Professions -> Achievements -> Boss Drops
]]

-------------------------------------------------
-- VENDORS
-------------------------------------------------
DVD.npcs = DVD.npcs or {}
DVD.VendorCameraOverrides = DVD.VendorCameraOverrides or {}

-- [model3D] = { targetZ = 1.0, pitch = 0.15, zoom = 8.5 },
DVD.VendorCameraOverrides = {    
    [110855] = { targetZ = 1.0, pitch = 0.15, zoom = 15.5 }, --evantkis
    [140647] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --construct alia
	[137681] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --construct V'anore
	[32689] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --bob
	[114528] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --thripps
	[28080] = { targetZ = 1.0, pitch = 0.15, zoom = 15.5 }, --Berazus
	[72055] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --durnolf
	[15958] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --ozorg
	[92584] = { targetZ = 12.4, pitch = 0.05, zoom = 1000.5 }, --pascal king
	[92583] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 },-- royal vendorbot
	[91066] = { targetZ = 2.5, pitch = 0.15, zoom = 15.5 }, --mother
	[140891] = { targetZ = 1.0, pitch = 0.15, zoom = 10.5 }, --thraxadar	
	[112100] = { targetZ = 1.0, pitch = 0.15, zoom = 15.5 },
	
}

do--expansion vendors

do--Classic Vendors 29
DVD.npcs[1247] = { zone = "Kharanos", model3D = 3434, title = "Innkeeper Belm", expansion = 1, zoneGroup = "Dun Morogh", faction = "alliance", x=54.4, y=50.8, mapID = 27, note = "Gnome or Dwarf", category = "race" }
DVD.npcs[68364] = { zone = "Brawl'gar Arena", model3D = 46757, title = "Paul North", expansion = 1, zoneGroup = "Brawl'gar Arena", faction = "horde", x=52, y=27.8, mapID = 503 }
DVD.npcs[48258] = { zone = "Talonbranch Glade", model3D = 36183, title = "Willard Harrington", expansion = 1, zoneGroup = "Felwood", faction = "alliance", x=61.6, y=25.8, mapID = 77 }
DVD.npcs[13217] = { zone = "Pvp Vendor", model3D = 13319, title = "Thanthaldis Snowgleam", expansion = 1, zoneGroup = "Hillsbrad Foothill", faction = "neutral", x=44.8, y=46.4, mapID = 25 }
DVD.npcs[44337] = { zone = "Surwich", model3D = 33806, title = "Maurice Essman", expansion = 1, zoneGroup = "Blasted Lands", faction = "alliance", x=45.8, y=88.6, mapID = 17 }
DVD.npcs[115805] = { zone = "Chiselgrip", model3D = 73953, title = "Hoddruc Bladebender", expansion = 1, zoneGroup = "Burning Steppes", faction = "neutral", x=46.8, y=44.6, mapID = 36 }
DVD.npcs[68363] = { zone = "Bizmo's Brawlpub", model3D = 46755, title = "Quackenbush", expansion = 1, zoneGroup = "Bizmo's Brawlpub", faction = "alliance", x=51, y=30, mapID = 499 }
DVD.npcs[44114] = { zone = "Raven Hill", model3D = 33678, title = "Wilkinson", expansion = 1, zoneGroup = "Duskwood", faction = "alliance", x=20.27, y=58.35, mapID = 47 }
DVD.npcs[23995] = { zone = "Mudsprocket", model3D = 31082, title = "Axle", expansion = 1, zoneGroup = "Dustwallow Marsh", faction = "neutral", x=41.9, y=73.9, mapID = 70 }
DVD.npcs[45417] = { zone = "Lights Hope Chapel", model3D = 34450, title = "Fiona", expansion = 1, zoneGroup = "Eastern PlagueLands", faction = "neutral", x=73.8, y=52.2, mapID = 23 }
DVD.npcs[1465] = { zone = "Thelsamar", model3D = 1820, title = "Drac Roughcut", expansion = 1, zoneGroup = "Loch Modan", faction = "alliance", x=35.6, y=49, mapID = 48 }
DVD.npcs[254606] = { zone = "Hall of Legends", model3D = 138276, title = "Joruh", expansion = 1, zoneGroup = "Orgrimmar", faction = "horde", x=38.8, y=71.93, mapID = 85 }
DVD.npcs[50488] = { zone = "Orgrimmar", model3D = 37020, title = "Stone Guard Nargol", expansion = 1, zoneGroup = "Orgrimmar", faction = "horde", x=50.2, y=58.4, mapID = 85 }
DVD.npcs[256119] = { zone = "The Drag", model3D = 139508, title = "Lonalo", expansion = 1, zoneGroup = "Orgrimmar", faction = "horde", x=58.4, y=50.6, mapID = 85 }
DVD.npcs[261262] = { zone = "Near Trading Post", model3D = 34566, title = "Gabbi", expansion = 1, zoneGroup = "Orgrimmar", faction = "horde", x=48.4, y=81, mapID = 85, category = "Promo", note = "Most items listed must have been bought from in game store before seeing them"  }
DVD.npcs[14624] = { zone = "Thorium Point", model3D = 14652, title = "Master Smith Burninate", expansion = 1, zoneGroup = "Searing Gorge", faction = "neutral", x=38.6, y=28.7, mapID = 32 }
DVD.npcs[2140] = { zone = "The Sepulcher", model3D = 3542, title = "Edwin Harly", expansion = 1, zoneGroup = "Silverpine Forest", faction = "horde", x=44.06, y=39.68, mapID = 21 }
DVD.npcs[252520] = { zone = "Rut'theran Village", model3D = 137447, title = "Ripley Kiefer", expansion = 1, zoneGroup = "Teldrassil", faction = "alliance", x=55.2, y=89.3, mapID = 47, note = "she is a few feet from the portal to  Darnassus", category = "reputation" }
DVD.npcs[49877] = { zone = "Trade District", model3D = 36758, title = "Captain Lancy Revshon", expansion = 1, zoneGroup = "Stormwind", faction = "alliance", x=67.79, y=73.05, mapID = 84, category = "reputation" }
DVD.npcs[256071] = { zone = "Mage Quarter", model3D = 139467, title = "Solelo", expansion = 1, zoneGroup = "Stormwind", faction = "alliance", x=49, y=80, mapID = 84 }
DVD.npcs[254603] = { zone = "Old Town", model3D = 138274, title = "Riica", expansion = 1, zoneGroup = "Stormwind", faction = "alliance", x=77.8, y=65.8, mapID = 84 }
DVD.npcs[261231] = { zone = "Near Trading Post", model3D = 17507, title = "Tuuran", expansion = 1, zoneGroup = "Stormwind", faction = "alliance", x=48.6, y=68.8, mapID = 84, category = "Promo", note = "Most items listed must have been bought from in game store before seeing them"  }
DVD.npcs[2483] = { zone = "Nesingwary Expedition", model3D = 4394, title = "Jacquilina Dramet", expansion = 1, zoneGroup = "Stranglethorn Vale", faction = "neutral", x=43.8, y=23.2, mapID = 50 }
DVD.npcs[50483] = { zone = "Thunder Bluff", model3D = 37022, title = "Brave Tuho", expansion = 1, zoneGroup = "Thunder Bluff", faction = "horde", x=46.2, y=50.6, mapID = 88, note = "Regular Tauren Only", category = "race" }
DVD.npcs[50304] = { zone = "PRE-DESTRUCTION", model3D = 37023, title = "Captain Donald Adams", expansion = 1, zoneGroup = "Undercity", faction = "horde", x=63.2, y=49, mapID = 90 }
DVD.npcs[3178] = { zone = "Menethil Harbor", model3D = 3468, title = "Stuart Fleming", expansion = 1, zoneGroup = "Wetlands", faction = "alliance", x=6.27, y=57.45, mapID = 56 }
DVD.npcs[253235] = { zone = "The Commons", model3D = 137770, title = "Dedric Sleetshaper", expansion = 1, zoneGroup = "Ironforge", faction = "alliance", x=24.72, y=43.93, mapID = 87, category = "reputation" }
DVD.npcs[50309] = { zone = "Ironforge", model3D = 37017, title = "Captain Stonehelm", expansion = 1, zoneGroup = "Ironforge", faction = "alliance", x=55.6, y=48.2, mapID = 87, category = "reputation" }
DVD.npcs[253232] = { zone = "The Library", model3D = 137768, title = "Inge Brightview", expansion = 1, zoneGroup = "Ironforge", faction = "alliance", x=75.8, y=9.4, mapID = 87 }

DVD.npcs[955] = { zone = "Westbook Garrison", model3D = 3338, title = "Sergeant De Vries", expansion = 1, zoneGroup = "Elwynn Forest", faction = "alliance", x=24.1, y=73.2, mapID = 37 }
end

do-- The Burning Crusade
DVD.npcs[16528] = { zone = "Tranquillien - Pre Midnight", model3D = 16242, title = "Provisioner Vredigar", expansion = 2, zoneGroup = "Ghostlands", faction = "horde", x=47.6, y=32.4, mapID = 95, note = "Use the portal in Eastern Plaguelands at 53.9, 8.8 to go to Pre Midnight", category = "reputation" }
end

do--Wrath of the Lich King
DVD.npcs[28038] = { zone = "Nesingwary Base Camp", model3D = 25056, title = "Purser Boulian", expansion = 3, zoneGroup = "Scholazar Basin", faction = "neutral", x=26.8, y=59.2, mapID = 119 }
DVD.npcs[27391] = { zone = "Amberpine Lodge", model3D = 24604, title = "Woodsman Drake", expansion = 3, zoneGroup = "Grizzly Hills", faction = "alliance", x=32.4, y=59.8, mapID = 116 }
DVD.npcs[25206] = { zone = "Winterfin Retreat", model3D = 4920, title = "Ahlurglgr", expansion = 3, zoneGroup = "Borean Tundra", faction = "neutral", x=43.03, y=13.78, mapID = 114 }
end

do--Cataclysm
DVD.npcs[211065] = { zone = "Stormglen Village", model3D = 30289, title = "Marie Allen", expansion = 4, zoneGroup = "Gilneas Post Takeover", faction = "alliance", x=60.4, y=92.4, mapID = 217 }
DVD.npcs[50307] = { zone = "Gilneas City", model3D = 37015, title = "Lord Candren", expansion = 4, zoneGroup = "Gilneas Post Takeover", faction = "alliance", x=56.94, y=55.91, mapID = 217, category = "reputation" }
DVD.npcs[216888] = { zone = "Gilneas City", model3D = 30289, title = "Samantha Buckley", expansion = 4, zoneGroup = "Gilneas Post Takeover", faction = "alliance", x=65.2, y=47.2, mapID = 217 }
DVD.npcs[253227] = { zone = "Thundermar", model3D = 137766, title = "Breana Bitterbrand", expansion = 4, zoneGroup = "Twilight Highlands", faction = "neutral", x=49.6, y=29.6, mapID = 241, note = "Friendly to horde but be careful of hostile npcs nearby", category = "reputation" }
DVD.npcs[49386] = { zone = "Thundermar", model3D = 36453, title = "Craw MacGraw", expansion = 4, zoneGroup = "Twilight Highlands", faction = "alliance", x=48.6, y=30.6, mapID = 241, category = "reputation" }
end

do--Mists of Pandaria
DVD.npcs[58414] = { zone = "Arboretum", model3D = 40146, title = "San Redscale", expansion = 5, zoneGroup = "Jade Forest", faction = "neutral", x=56.8, y=44.4, mapID = 371, category = "reputation" }
DVD.npcs[59698] = { zone = "One Keg", model3D = 45821, title = "Brother Furtrim", expansion = 5, zoneGroup = "Kun-Lai Summit", faction = "neutral", x=57.24, y=60.96, mapID = 379 }
DVD.npcs[58706] = { zone = "Halfhill", model3D = 41769, title = "Gina Mudclaw", expansion = 5, zoneGroup = "Valley of the Four Winds", faction = "neutral", x=53.2, y=51.8, mapID = 376, category = "friendship" }
DVD.npcs[64001] = { zone = "Shrine of 2 Moons", model3D = 43420, title = "Sage Lotusbloom", expansion = 5, zoneGroup = "Vale of Eternal Blossoms - Shrine of 2 Moons", faction = "horde", x=62.8, y=23.2, mapID = 390 }
DVD.npcs[64032] = { zone = "Shrine of 7 Stars", model3D = 44182, title = "Sage Whiteheart", expansion = 5, zoneGroup = "Vale of Eternal Blossoms - Shrine of 7 Stars", faction = "alliance", x=85.2, y=61.6, mapID = 1530 }
DVD.npcs[64605] = { zone = "Seat of Knowledge", model3D = 44814, title = "Tan Shin Tiao", expansion = 5, zoneGroup = "Vale of Eternal Blossoms", faction = "neutral", x=82.23, y=29.33, mapID = 390, category = "reputation" }
DVD.npcs[62088] = { zone = "Seat of Knowledge", model3D = 42350, title = "Lali the Assistant", expansion = 5, zoneGroup = "Vale of Eternal Blossoms", faction = "neutral", x=82.8, y=30.8, mapID = 390 }
end

do--Warlords of Draenor 
DVD.npcs[79812] = { zone = "Barracks", model3D = 56555, title = "Moz'def", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[76872] = { zone = "Horde Garrison", model3D = 53501, title = "Supplymaster Eri", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[79774] = { zone = "Horde Garrison Tier 3", model3D = 56527, title = "Sergeant Grimjaw", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[87015] = { zone = "Trading Post Level 2", model3D = 56923, title = "Kil'rip", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[87312] = { zone = "Horde Garrison", model3D = 27957, title = "Vora Strongarm", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86776] = { zone = "Trading Post", model3D = 56923, title = "Ribchewer", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86779] = { zone = "Trading Post", model3D = 56410, title = "Krixel Pinchwhistle", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86777] = { zone = "Trading Post", model3D = 53501, title = "Elder Surehide", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86778] = { zone = "Trading Post", model3D = 55043, title = "Pyxni Pennypocket", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86683] = { zone = "Trading Post", model3D = 4087, title = "Tai'tasi ", expansion = 6, zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[78564] = { zone = "Alliance Garrison Tier 3", model3D = 61187, title = "Sergeant Crowler", expansion = 6, zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[85427] = { zone = "Trading Post Tier 3", model3D = 61418, title = "Maaria", expansion = 6, zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[88220] = { zone = "Alliance Garrison", model3D = 60816, title = "Peter", expansion = 6, zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[88126] = { zone = "Alliance Garrison", model3D = 3323, title = "Maybell Maclure-Stonefield", expansion = 6, zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (Barn-dependent location)" }
DVD.npcs[81133] = { zone = "Embaari Village", model3D = 56229, title = "Artificer Kallaes", expansion = 6, zoneGroup = "Shadowmoon Valley", faction = "alliance", x=46.2, y=39.3, mapID = 539 }
DVD.npcs[87775] = { zone = "Veil Terokk", model3D = 61065, title = "Ruuan the Seer", expansion = 6, zoneGroup = "Spires of Arak", faction = "neutral", x=46.6, y=45, mapID = 542 }
DVD.npcs[85950] = { zone = "Stormshield", model3D = 59234, title = "Trader Caerel", expansion = 6, zoneGroup = "Ashran", faction = "alliance", x=41.4, y=59.8, mapID = 622 }
DVD.npcs[85932] = { zone = "Stormshield", model3D = 59224, title = "Vindicator Nuurem", expansion = 6, zoneGroup = "Ashran", faction = "alliance", x=46.2, y=76.5, mapID = 622 }
DVD.npcs[85946] = { zone = "The Town Hall", model3D = 59471, title = "Shadow-Sage Brakoss", expansion = 6, zoneGroup = "Ashran", faction = "alliance", x=46.49, y=75.03, mapID = 622 }
DVD.npcs[86037] = { zone = "Warspear Hold", model3D = 61112, title = "Ravenspeaker Skeega", expansion = 6, zoneGroup = "Ashran", faction = "horde", x=53.3, y=59.96, mapID = 624 }
DVD.npcs[256946] = { zone = "Terokkar Refuge", model3D = 139888, title = "Duskcaller Erthix", expansion = 6, zoneGroup = "Talador", faction = "neutral", x=70.4, y=57.6, mapID = 535 }

DVD.npcs[274250] = { zone = "Elodor ", model3D = 147697, title = "Botanist Taania", expansion = 6, zoneGroup = "Shadowmoon Valley", faction = "alliance", x=58.05, y=26.63, mapID = 539 }
DVD.npcs[274291] = { zone = "Wor'var", model3D = 147698, title = "Botanist Gril'ka", expansion = 6, zoneGroup = "Nagrand", faction = "horde", x=82.10 , y=44.77, mapID = 550 }

end

do--Legion 
DVD.npcs[127151] = { zone = "The Vindicaar", model3D = 79278, title = "Toraan the Revered", expansion = 7, zoneGroup = "Argus", faction = "neutral", x=68.22, y=56.91, mapID = 831 }
DVD.npcs[89939] = { zone = "Leyhollow Cave", model3D = 28080, title = "Berazus", expansion = 7, zoneGroup = "Azsuna", faction = "neutral", x=47.8, y=23.6, mapID = 630 }
DVD.npcs[112716] = { zone = "Photonic Playground", model3D = 56737, title = "Rasil Fireborne", expansion = 7, zoneGroup = "Dalaran", faction = "neutral", x=43.4, y=49.4, mapID = 627 }
DVD.npcs[252043] = { zone = "Sunreaver Sanctuary", model3D = 137328, title = "Halenthos Brightstride", expansion = 7, zoneGroup = "Dalaran", faction = "horde", x=67.46, y=33.89, mapID = 627 }
DVD.npcs[105333] = { zone = "The Underbelly", model3D = 69095, title = "Val'zuun", expansion = 7, zoneGroup = "Dalaran", faction = "neutral", x=67.36, y=63.22, mapID = 628 }
DVD.npcs[106902] = { zone = "Thunder Totem", model3D = 72888, title = "Ransa Greyfeather", expansion = 7, zoneGroup = "Highmountain", faction = "neutral", x=38.06, y=46.05, mapID = 750, category = "reputation" }
DVD.npcs[108017] = { zone = "Thunder Totem - Bottom Half", model3D = 70380, title = "Torv Dubstomp", expansion = 7, zoneGroup = "Highmountain", faction = "neutral", x=54.8, y=78.08, mapID = 652 }
DVD.npcs[108537] = { zone = "Shipwreck Cove", model3D = 70605, title = "Crafty Palu", expansion = 7, zoneGroup = "Highmountain", faction = "neutral", x=41.62, y=10.44, mapID = 650 }
DVD.npcs[115736] = { zone = "Shal'Aran", model3D = 67345, title = "First Arcanist Thalyssra", expansion = 7, zoneGroup = "Suramar", faction = "neutral", x=36.49, y=45.83, mapID = 680, category = "reputation" }
DVD.npcs[93971] = { zone = "The Grand Promenade", model3D = 70030, title = "Leyweaver Inondra", expansion = 7, zoneGroup = "Suramar", faction = "neutral", x=40.32, y=69.73, mapID = 680 }
DVD.npcs[252969] = { zone = "Concourse of Destiny", model3D = 137688, title = "Jocenna", expansion = 7, zoneGroup = "Suramar", faction = "neutral", x=49.63, y=62.83, mapID = 680 }
DVD.npcs[255101] = { zone = "Shimmershade Garden", model3D = 138645, title = "Mynde", expansion = 7, zoneGroup = "Suramar", faction = "neutral", x=45.58, y=69.15, mapID = 680 }
DVD.npcs[253434] = { zone = "Irongrove Retreat", model3D = 137851, title = "Sileas Duskvine", expansion = 7, zoneGroup = "Suramar", faction = "neutral", x=79.92, y=73.89, mapID = 641 }
DVD.npcs[248594] = { zone = "suramar", model3D = 73413, title = "Sundries Merchant", expansion = 7, zoneGroup = "Suramar", faction = "neutral", x=50.9, y=77.78, mapID = 680, category = "reputation" }
DVD.npcs[253387] = { zone = "Lorlathil", model3D = 137846, title = "Selfira Ambergrove", expansion = 7, zoneGroup = "Val'sharah", faction = "neutral", x=54.26, y=72.36, mapID = 641, category = "reputation" }
DVD.npcs[106901] = { zone = "Lorlathil", model3D = 74537, title = "Sylvia Hartshorn", expansion = 7, zoneGroup = "Val'sharah", faction = "neutral", x=54.7, y=73.25, mapID = 641, category = "reputation" }
DVD.npcs[252498] = { zone = "Bradenbrook", model3D = 137440, title = "Corbin Branbell", expansion = 7, zoneGroup = "Val'sharah", faction = "neutral", x=42.09, y=59.38, mapID = 641 }
DVD.npcs[112634] = { zone = "Field of Dreamers (patrols)", model3D = 72149, title = "Hilseth Travelstride", expansion = 7, zoneGroup = "Val'sharah", faction = "neutral", x=57.14, y=71.91, mapID = 641 }
DVD.npcs[109306] = { zone = "Lightsong", model3D = 70971, title = "Myria Glenbrook", expansion = 7, zoneGroup = "Val'sharah", faction = "neutral", x=60.2, y=84.86, mapID = 641 }
DVD.npcs[256826] = { zone = "Val'sharah", model3D = 139842, title = "Mrgrgrl", expansion = 7, zoneGroup = "Val'sharah", faction = "neutral", x=68.72, y=95.1, mapID = 641 }
DVD.npcs[112407] = { zone = "Demon Hunter", model3D = 61734, title = "Falara Nightsong", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=61, y=56.73, mapID = 720 }
DVD.npcs[100196] = { zone = "Paladin", model3D = 28836, title = "Eadric the Pure", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=75.64, y=49.09, mapID = 23 }
DVD.npcs[103693] = { zone = "Hunter", model3D = 68326, title = "Outfitter Reynolds", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=44.56, y=48.88, mapID = 739 }
DVD.npcs[112323] = { zone = "Druid", model3D = 72032, title = "Amurra Thistledew", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=40.02, y=17.72, mapID = 747 }
DVD.npcs[105986] = { zone = "Rogue", model3D = 31159, title = "Kelsey Steelspark", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=26.92, y=36.83, mapID = 626 }
DVD.npcs[112338] = { zone = "Monk", model3D = 72042, title = "Caydori Brightstar", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=50.4, y=59, mapID = 709 }
DVD.npcs[93550] = { zone = "Death Knight", model3D = 15958, title = "Quartermaster Ozorg", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=43.9, y=37.17, mapID = 647 }
DVD.npcs[112434] = { zone = "Warlock", model3D = 72070, title = "Gigi Gigavoid", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=58.76, y=32.69, mapID = 717 }
DVD.npcs[112440] = { zone = "Mage", model3D = 72075, title = "Jackson Watkins", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=44.75, y=57.87, mapID = 735 }
DVD.npcs[112318] = { zone = "Shaman", model3D = 72029, title = "Flamesmith Lanying", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=30.32, y=60.69, mapID = 726 }
DVD.npcs[112392] = { zone = "Warrior", model3D = 72055, title = "Quartermaster Durnolf", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=55.49, y=25.91, mapID = 695 }
DVD.npcs[112401] = { zone = "Priest", model3D = 72056, title = "Meridelle Lightspark", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=38.62, y=23.77, mapID = 702 }

DVD.npcs[127518] = { zone = "The Vindicaar", model3D = 79483, title = "Adjutant Vortus", expansion = 7, zoneGroup = "Argus", faction = "neutral", x=33.3, y=65.9, mapID = 831 }
DVD.npcs[127120] = { zone = "The Vindicaar", model3D = 79263, title = "Vindicator Jaelaana", expansion = 7, zoneGroup = "Argus", faction = "neutral", x=43.3, y=72.8, mapID = 831 }
end

do--Battle for Azeroth 
DVD.npcs[152194] = { zone = "Chamber of Heart", model3D = 91066, title = "MOTHER", expansion = 8, zoneGroup = "Silithus", faction = "neutral", x=48.3, y=72.1, mapID = 1473 }
DVD.npcs[252313] = { zone = "Brennadom", model3D = 137393, title = "Caspian", expansion = 8, zoneGroup = "Stormsong Valley", faction = "alliance", x=59.6, y=69.6, mapID = 942, category = "reputation" }
DVD.npcs[150716] = { zone = "Mechagon", model3D = 92583, title = "Stolen Royal Vendorbot", expansion = 8, zoneGroup = "Mechagon", faction = "neutral", x=73.7, y=36.91, mapID = 1462, category = "reputation" }
DVD.npcs[135808] = { zone = "Harbormaster's Office", model3D = 84415, title = "Provisioner Fray", expansion = 8, zoneGroup = "Tiragarde Sound", faction = "alliance", x=67.6, y=21.8, mapID = 1161, category = "reputation" }
DVD.npcs[252345] = { zone = "Tradewinds Market", model3D = 137409, title = "Pearl Barlow", expansion = 8, zoneGroup = "Tiragarde Sound", faction = "alliance", x=70.74, y=15.66, mapID = 1161 }
DVD.npcs[142115] = { zone = "Boralus Harbor", model3D = 34450, title = "Fiona", expansion = 8, zoneGroup = "Tiragarde Sound", faction = "alliance", x=67.6, y=40.8, mapID = 1161 }
DVD.npcs[246721] = { zone = "Hook Point", model3D = 130151, title = "Janey Forrest", expansion = 8, zoneGroup = "Tiragarde Sound", faction = "alliance", x=56.29, y=45.82, mapID = 1161 }
DVD.npcs[252316] = { zone = "Norwington Estate", model3D = 137394, title = "Delphine", expansion = 8, zoneGroup = "Tiragarde Sound", faction = "neutral", x=53.4, y=31.2, mapID = 895 }
DVD.npcs[135459] = { zone = "Zu'jan Ruins", model3D = 84261, title = "Provisioner Lija", expansion = 8, zoneGroup = "Nazmir", faction = "horde", x=39.11, y=79.47, mapID = 863, category = "reputation" }
DVD.npcs[148924] = { zone = "Port of Zandalar", model3D = 90164, title = "Provisioner Mukra", expansion = 8, zoneGroup = "Zuldazar", faction = "horde", x=51.22, y=95.08, mapID = 1165 }
DVD.npcs[148923] = { zone = "Port of Zandalar", model3D = 90162, title = "Captain Zen'taga", expansion = 8, zoneGroup = "Zuldazar", faction = "horde", x=44.6, y=94.4, mapID = 1165 }
DVD.npcs[251921] = { zone = "Zuldazar Docks", model3D = 137265, title = "Arcanist Peroleth", expansion = 8, zoneGroup = "Zuldazar", faction = "horde", x=58, y=62.6, mapID = 862, category = "reputation" }
DVD.npcs[252326] = { zone = "Zuldazar - The Great Seal", model3D = 137395, title = "T'lama", expansion = 8, zoneGroup = "Zuldazar", faction = "horde", x=36.94, y=59.17, mapID = 1164, category = "reputation" }
DVD.npcs[144129] = { zone = "Grim Guzzler", model3D = 8652, title = "Plugger Spazzring", expansion = 8, zoneGroup = "Blackrock Mountain", faction = "neutral", x=49.77, y=32.22, mapID = 1186, note = "Dark Iron Dwarf : Non Instanced Grim Guzzler", category = "race" }

DVD.npcs[143325] = { zone = "Vulpera Highway", model3D = 87765, title = "Jeni", expansion = 8, zoneGroup = "Vol'dun", faction = "horde", x=56.4, y=50.4, mapID = 864 }
DVD.npcs[135804] = { zone = "Vulpera Highway", model3D = 84414, title = "Hoarder Jena", expansion = 8, zoneGroup = "Vol'dun", faction = "horde", x=56.6, y=49.8, mapID = 864 }
DVD.npcs[274690] = { zone = "Aroms Stand", model3D = 80766, title = "Fenwir", expansion = 8, zoneGroup = "Drustvar", faction = "alliance", x=37.8, y=49.0, mapID = 896 }
DVD.npcs[143244] = { zone = "Boralus", model3D = 87780, title = "Victor Esquivas", expansion = 8, zoneGroup = "Tiragarde Sound", faction = "alliance", x=73.9, y=12.8, mapID = 1161, note = "He patrols around start in Snug Harbor Inn and target him" }
end

do--Shadowlands 
DVD.npcs[174710] = { zone = "Sinfall", model3D = 99162, title = "Chachi the Artiste", expansion = 9, zoneGroup = "Revendreth", faction = "neutral", x=54, y=24.8, mapID = 1699, note = "Venthyr Only", category = "Covenants" }
DVD.npcs[162804] = { zone = "Ve'nari's Refuge", model3D = 95004, title = "Ve'nari", expansion = 9, zoneGroup = "The Maw", faction = "neutral", x=46.8, y=41.6, mapID = 1543 }


DVD.npcs[173003] = { zone = "Theater of Pain", model3D = 96135, title = "Nalcorn Talsen", expansion = 9, zoneGroup = "Maldraxxus", faction = "neutral", x=50.7, y=53.4, mapID = 1536 }
DVD.npcs[274682] = { zone = "Theater of Pain", model3D = 96189, title = "Collector Xorik", expansion = 9, zoneGroup = "Maldraxxus", faction = "neutral", x=50.7, y=53.4, mapID = 1536 }
DVD.npcs[274686] = { zone = "Darkhaven", model3D = 93046, title = "Verayn", expansion = 9, zoneGroup = "Revendreth", faction = "neutral", x=61.9, y=63.7, mapID = 1525 }
DVD.npcs[156822] = { zone = "Darkhaven", model3D = 92783, title = "Mistress Mihaela", expansion = 9, zoneGroup = "Revendreth", faction = "neutral", x=61.4, y=63.8, mapID = 1525 }
DVD.npcs[274062] = { zone = "Halls of Atonement", model3D = 147654, title = "Mumples", expansion = 9, zoneGroup = "Revendreth", faction = "neutral", x=73.1, y=52.6, mapID = 1525 }
DVD.npcs[169524] = { zone = "Hall of Curiosities", model3D = 93585, title = "Acquirer Ta'gosh", expansion = 9, zoneGroup = "Oribos", faction = "neutral", x=61.7, y=71.7, mapID = 1670 }
DVD.npcs[175419] = { zone = "Heart of Forest", model3D = 99621, title = "Lunelle", expansion = 9, zoneGroup = "Ardenweald", faction = "alliance", x=61.0, y=37.8, mapID = 1701, note = "NightFae Only", category = "Covenants" }
DVD.npcs[158556] = { zone = "Heart of Forest", model3D = 99153, title = "Aithlyn", expansion = 9, zoneGroup = "Ardenweald", faction = "alliance", x=48.5, y=50.5, mapID = 1565, note = "NightFae Only", category = "Covenants" }
DVD.npcs[274668] = { zone = "Hero's Rest", model3D = 98927, title = "Curator Ilaros", expansion = 9, zoneGroup = "Bastion", faction = "neutral", x=52.4, y=47.2, mapID = 1533 }
DVD.npcs[160470] = { zone = "Hero's Rest", model3D = 92191, title = "Adjutant Nikos", expansion = 9, zoneGroup = "Bastion", faction = "neutral", x=52.3, y=47.1, mapID = 1533 }
end

do--Dragonflight 
DVD.npcs[253086] = { zone = "Morqut Village", model3D = 137722, title = "Jolinth", expansion = 10, zoneGroup = "The Forbidden Reach", faction = "neutral", x=35.2, y=57, mapID = 2151 }
DVD.npcs[193015] = { zone = "The Seat of Aspects - Lower", model3D = 108045, title = "Unatos", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=58.2, y=35.6, mapID = 2112, category = "renown" }
DVD.npcs[253067] = { zone = "The Parting Glass", model3D = 137718, title = "Silvrath", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=71.53, y=49.62, mapID = 2112, category = "renown" }
DVD.npcs[199605] = { zone = "Valdrakken Treasury Hoard", model3D = 110855, title = "Evantkis", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=58.4, y=57.4, mapID = 2112 }
DVD.npcs[193659] = { zone = "The Obsidian Enclave", model3D = 108249, title = "Provisioner Thom", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=36.8, y=50.6, mapID = 2112 }
DVD.npcs[209192] = { zone = "Azerothian Archives", model3D = 113800, title = "Provisioner Aristta", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=61.4, y=31.4, mapID = 2025 }
DVD.npcs[209220] = { zone = "Eon's Fringe", model3D = 112638, title = "Ironus Coldsteel", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=52.2, y=80.8, mapID = 2025 }
DVD.npcs[196637] = { zone = "Valdrakken", model3D = 109197, title = "Tethalash", expansion = 10, zoneGroup = "Thaldraszus", faction = "neutral", x=25.52, y=33.65, mapID = 2112, note = "Dracthyr", category = "race" }
DVD.npcs[189226] = { zone = "Dragonscale Basecamp", model3D = 106843, title = "Cataloger Jakes", expansion = 10, zoneGroup = "The Waking Shores", faction = "neutral", x=47, y=82.6, mapID = 2022, category = "renown" }
DVD.npcs[188265] = { zone = "Dragonscale Basecamp", model3D = 106418, title = "Rae'ana", expansion = 10, zoneGroup = "The Waking Shores", faction = "neutral", x=47.8, y=82.2, mapID = 2022, category = "renown" }
DVD.npcs[191025] = { zone = "Ruby Lifeshrine", model3D = 102721, title = "Lifecaller Tzadrak", expansion = 10, zoneGroup = "The Waking Shores", faction = "neutral", x=62, y=73.8, mapID = 2022 }
DVD.npcs[210608] = { zone = "Dreamsurge Location", model3D = 33840, title = "Celestine", expansion = 10, zoneGroup = "Dragonflight Dreamsurge", faction = "neutral", sourceAction = "Dreamsurge Event", openmapID = 1978, pinSourceAction = true, noteY = -220, note = "Possible Locations:\n\n• The Waking Shores\n• Ohn'ahran Plains\n• The Azure Span\n• Thaldraszus"}
DVD.npcs[216286] = { zone = "Bel'ameth", model3D = 113048, title = "Moon Priestess Lasara", expansion = 10, zoneGroup = "Amirdrassil", faction = "alliance", x=46.6, y=70.6, mapID = 2239 }
DVD.npcs[216284] = { zone = "Bel'ameth", model3D = 113507, title = "Mythrin'dir", expansion = 10, zoneGroup = "Amirdrassil", faction = "alliance", x=54, y=60.8, mapID = 2239 }
DVD.npcs[216285] = { zone = "Bel'ameth", model3D = 113508, title = "Ellandrieth", expansion = 10, zoneGroup = "Amirdrassil", faction = "alliance", x=48.4, y=53.6, mapID = 2239 }

DVD.npcs[188623] = { zone = "Obsidian Throne", model3D = 106468, title = "Samia Inkling", expansion = 10, zoneGroup = "The Waking Shores", faction = "neutral", x=24.7, y=56.8, mapID = 2022 }

end

do--The War Within 
DVD.npcs[223728] = { zone = "Dornogal - Foundation Hall", model3D = 120830, title = "Auditor Balwurz", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=39.2, y=24.4, mapID = 2339 }
DVD.npcs[219318] = { zone = "Dornogal - The Forgegrounds", model3D = 117779, title = "Jorid", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=57, y=60.6, mapID = 2339 }
DVD.npcs[252910] = { zone = "Dornogal - The Forgegrounds", model3D = 137662, title = "Garnett", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=54.68, y=57.24, mapID = 2339 }
DVD.npcs[252312] = { zone = "Dornogal", model3D = 137392, title = "Second Chair Pawdo", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=52.84, y=68, mapID = 2339 }
DVD.npcs[219217] = { zone = "Dornogal", model3D = 120603, title = "Velerd", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=55.2, y=76.4, mapID = 2339 }
DVD.npcs[252901] = { zone = "Freywold Village", model3D = 137660, title = "Cinnabar", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=42, y=73, mapID = 2248 }
DVD.npcs[226205] = { zone = "Isle of Dorn", model3D = 120579, title = "Cendvin", expansion = 11, zoneGroup = "Isle of Dorn", faction = "neutral", x=74.4, y=45.2, mapID = 2248 }
DVD.npcs[221390] = { zone = "Gundargaz", model3D = 118619, title = "Waxmonger Squick", expansion = 11, zoneGroup = "The Ringing Deeps", faction = "neutral", x=43.2, y=32.8, mapID = 2214 }
DVD.npcs[252887] = { zone = "Gundargaz", model3D = 137648, title = "Chert", expansion = 11, zoneGroup = "The Ringing Deeps", faction = "neutral", x=43.4, y=33, mapID = 2214 }
DVD.npcs[256783] = { zone = "Gundargaz", model3D = 139804, title = "Gabbun", expansion = 11, zoneGroup = "The Ringing Deeps", faction = "neutral", x=43.32, y=33.03, mapID = 2214 }
DVD.npcs[217642] = { zone = "Mereldar", model3D = 118635, title = "Nalina Ironsong", expansion = 11, zoneGroup = "Hallowfall", faction = "neutral", x=42.8, y=55.83, mapID = 2215 }
DVD.npcs[240852] = { zone = "Hallowfall", model3D = 128126, title = "Lars Bronsmaelt", expansion = 11, zoneGroup = "Hallowfall", faction = "neutral", x=28.28, y=56.18, mapID = 2215, category = "renown" }
DVD.npcs[251911] = { zone = "The Incontinental Hotel", model3D = 137264, title = "Stacks Topskimmer", expansion = 11, zoneGroup = "Undermine", faction = "neutral", x=43.19, y=50.47, mapID = 2346 }
DVD.npcs[231409] = { zone = "The Incontinental Hotel", model3D = 126125, title = "Smaks Topskimmer", expansion = 11, zoneGroup = "Undermine", faction = "neutral", x=43.8, y=50.8, mapID = 2346 }
DVD.npcs[226994] = { zone = "Undermine", model3D = 127681, title = "Blair Bass", expansion = 11, zoneGroup = "Undermine", faction = "neutral", x=34, y=70.8, mapID = 2346 }
DVD.npcs[239333] = { zone = "Undermine", model3D = 127373, title = "Street Food Vendor", expansion = 11, zoneGroup = "Undermine", faction = "neutral", x=26.2, y=42.8, mapID = 2346 }
DVD.npcs[235621] = { zone = "Liberation of Undermine", model3D = 127136, title = "Ando the Gat", expansion = 11, zoneGroup = "Undermine", faction = "neutral", x=43.29, y=51.89, mapID = 2406 }
DVD.npcs[235314] = { zone = "Tazavesh, the Veiled Market", model3D = 130299, title = "Ta'sam", expansion = 11, zoneGroup = "K'aresh", faction = "neutral", x=43.2, y=34.8, mapID = 2472 }
DVD.npcs[235252] = { zone = "Tazavesh, the Veiled Market", model3D = 124755, title = "Om'sirik", expansion = 11, zoneGroup = "K'aresh", faction = "neutral", x=40.33, y=29.36, mapID = 2472 }
DVD.npcs[218202] = { zone = "City of Threads", model3D = 114528, title = "Thripps", expansion = 11, zoneGroup = "Azj-Kahet", faction = "neutral", x=50, y=31.6, mapID = 2213 }

DVD.npcs[231406] = { zone = "The Scrapshop", model3D = 126189, title = "Rocco Razzboom", expansion = 11, zoneGroup = "The Cartels of Undermine", faction = "neutral", x=39.16, y=22.2, mapID = 2346, category = "subfaction" }
DVD.npcs[231405] = { zone = "Port Authority", model3D = 126190, title = "Boatswain Hardee", expansion = 11, zoneGroup = "The Cartels of Undermine", faction = "neutral", x=63.43, y=16.8, mapID = 2346, category = "subfaction" }
DVD.npcs[231408] = { zone = "The Vatworks", model3D = 126191, title = "Lab Assistant Laszly", expansion = 11, zoneGroup = "The Cartels of Undermine", faction = "neutral", x=27.18, y=72.54, mapID = 2346, category = "subfaction" }
DVD.npcs[231407] = { zone = "Venture Plaza", model3D = 125885, title = "Shredz the Scrapper", expansion = 11, zoneGroup = "The Cartels of Undermine", faction = "neutral", x=53.34, y=72.69, mapID = 2346, category = "subfaction" }
DVD.npcs[231396] = { zone = "Hovel Hill", model3D = 125504, title = "Sitch Lowdown", expansion = 11, zoneGroup = "The Cartels of Undermine", faction = "neutral", x=30.78, y=38.93, mapID = 2346, category = "subfaction" }
end

do--Midnight
DVD.npcs[258181] = { zone = "Astalor's Sanctum", model3D = 140647, title = "Construct Ali'a", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=55.81, y=66.04, mapID = 2393 }
DVD.npcs[252915] = { zone = "The Bazaar", model3D = 137524, title = "Corlen Hordralin", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=44.16, y=62.72, mapID = 2393 }
DVD.npcs[264056] = { zone = "Falconwing Square", model3D = 143986, title = "Decor Duel Vendor", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=31.6, y=76.7, mapID = 2393 }
DVD.npcs[256828] = { zone = "Murder Row", model3D = 139843, title = "Dennia Silvertongue", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=51.16, y=56.47, mapID = 2393, category = "Promo", note = "Most items listed must have been bought from in game store before seeing them" }
DVD.npcs[250982] = { zone = "Murder Row", model3D = 136657, title = "Dethelin", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=52.5, y=47.3, mapID = 2393 }
DVD.npcs[266188] = { zone = "Silvermoon City", model3D = 144735, title = "Estella Archtender", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=39.3, y=80.2, mapID = 2393, note = "Her location is where the event is located at in Silvermoon" }
DVD.npcs[252916] = { zone = "The Bazaar", model3D = 137667, title = "Hesta Forlath", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=44.16, y=62.72, mapID = 2393 }
DVD.npcs[256026] = { zone = "The Bazaar", model3D = 139450, title = "Irodalmin", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=48.2, y=51.6, mapID = 2393 }
DVD.npcs[251091] = { zone = "Murder Row", model3D = 136777, title = "Nael Silvertongue", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=50.7, y=56.2, mapID = 2393, note = "do Flowers for Amalthea to see item" }
DVD.npcs[242398] = { zone = "The Bazaar", model3D = 105169, title = "Naleidea Rivergleam", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=52.67, y=77.96, mapID = 2393 }
DVD.npcs[255495] = { zone = "Falconwing Square", model3D = 106418, title = "Rae'ana", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=47.6, y=50.6, mapID = 2393, category = "renown" }
DVD.npcs[242399] = { zone = "The Bazaar", model3D = 107574, title = "Telemancer Astrandis", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=52.44, y=78.87, mapID = 2393 }


DVD.npcs[243359] = { zone = "The Bazaar", model3D = 138953, title = "Melaris", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=47, y=51.8, mapID = 2393 }
DVD.npcs[241451] = { zone = "The Bazaar", model3D = 138907, title = "Eriden", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=43.6, y=51.6, mapID = 2393 }
DVD.npcs[257914] = { zone = "The Bazaar", model3D = 140527, title = "Quelis", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=56.4, y=69.8, mapID = 2393 }
DVD.npcs[243350] = { zone = "The Bazaar", model3D = 138944, title = "Lyna", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=47.8, y=53.6, mapID = 2393}
DVD.npcs[241453] = { zone = "The Bazaar", model3D = 138909, title = "Yatheon", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=43.6, y=53.8, mapID = 2393 }
DVD.npcs[243555] = { zone = "The Bazaar", model3D = 138961, title = "Lelorian", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=46.4, y=51.2, mapID = 2393 }
DVD.npcs[243353] = { zone = "The Bazaar", model3D = 138947, title = "Deynna", expansion = 12, zoneGroup = "Silvermoon City", faction = "neutral", x=48.2, y=54.2, mapID = 2393}

DVD.npcs[255114] = { zone = "Underground Den", model3D = 138651, title = "Maku", expansion = 12, zoneGroup = "Harandar", faction = "neutral", x=62.5, y=34.4, mapID = 2576 }
DVD.npcs[240407] = { zone = "The Den", model3D = 137949, title = "Naynar", expansion = 12, zoneGroup = "Harandar", faction = "neutral", x=51, y=50.7, mapID = 2413 }
DVD.npcs[251259] = { zone = "The Den", model3D = 136942, title = "Mothkeeper Wew'tam", expansion = 12, zoneGroup = "Harandar", faction = "neutral", x=49.3, y=54.4, mapID = 2413 }
DVD.npcs[258507] = { zone = "The Den", model3D = 140811, title = "Mowaia", expansion = 12, zoneGroup = "Harandar", faction = "neutral", x=52.2, y=54, mapID = 2413, profession="fishing" }
DVD.npcs[258540] = { zone = "Underground Den", model3D = 140815, title = "Hawli", expansion = 12, zoneGroup = "Harandar", faction = "neutral", x=59.3, y=33.1, mapID = 2576, profession="mining" }
DVD.npcs[258480] = { zone = "Underground Den", model3D = 140800, title = "Amwa'ana", expansion = 12, zoneGroup = "Harandar", faction = "neutral", x=57.3, y=32.6, mapID = 2576, profession="jewelcrafter" }
DVD.npcs[252873] = { zone = "Arcantina", model3D = 130151, title = "Morta Gage", expansion = 12, zoneGroup = "Arcantina", faction = "neutral", x=42, y=50, mapID = 2541, note = "portal to get to her is in the Main inn" }
DVD.npcs[258328] = { zone = "Masters Perch", model3D = 140891, title = "Thraxadar", expansion = 12, zoneGroup = "Voidstorm", faction = "neutral", x=39.4, y=81, mapID = 2444, category = "reputation" }
DVD.npcs[259922] = { zone = "The Howling Ridge", model3D = 142075, title = "Void Researcher Aemely", expansion = 12, zoneGroup = "Voidstorm", faction = "neutral", x=52.6, y=72.8, mapID = 2405 }
DVD.npcs[248328] = { zone = "The Howling Ridge", model3D = 139916, title = "Void Researcher Anomander", expansion = 12, zoneGroup = "Voidstorm", faction = "neutral", x=52.6, y=72.9, mapID = 2405, category = "renown" }
DVD.npcs[240838] = { zone = "FairBreeze Village", model3D = 137812, title = "Caeris Fairdawn", expansion = 12, zoneGroup = "Eversong Woods", faction = "neutral", x=43.47, y=47.44, mapID = 2395, category = "renown" }
DVD.npcs[259864] = { zone = "FairBreeze Village", model3D = 141933, title = "Sathren Azuredawn", expansion = 12, zoneGroup = "Eversong Woods", faction = "neutral", x=43.2, y=47.5, mapID = 2395 }
DVD.npcs[242726] = { zone = "FairBreeze Village", model3D = 137811, title = "Neriv", expansion = 12, zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.49, y=47.64, mapID = 2395, category = "subfaction" }
DVD.npcs[242724] = { zone = "FairBreeze Village", model3D = 137806, title = "Ranger Allorn", expansion = 12, zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.46, y=47.55, mapID = 2395, category = "subfaction" }
DVD.npcs[242725] = { zone = "FairBreeze Village", model3D = 137809, title = "Armorer Goldcrest", expansion = 12, zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.53, y=47.5, mapID = 2395, category = "subfaction" }
DVD.npcs[242723] = { zone = "FairBreeze Village", model3D = 137808, title = "Apprentice Diell", expansion = 12, zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.53, y=47.5, mapID = 2395, category = "subfaction" }
DVD.npcs[240279] = { zone = "Amani'Zar Village", model3D = 141039, title = "Magovu", expansion = 12, zoneGroup = "Zul'Aman", faction = "neutral", x=46, y=65.9, mapID = 2437, category = "renown" }
DVD.npcs[254944] = { zone = "Amani'Zar Village", model3D = 141092, title = "Tajaka Sawtusk", expansion = 12, zoneGroup = "Zul'Aman", faction = "neutral", x=46, y=66.1, mapID = 2437 }
DVD.npcs[241928] = { zone = "Zul'Aman", model3D = 140057, title = "Chel the Chip", expansion = 12, zoneGroup = "Zul'Aman", faction = "neutral", x=31.6, y=26.3, mapID = 2437, note = "He is located in each zone by all abundance entrances this is the main one though" }
DVD.npcs[260180] = { zone = "Zul'Aman Depths", model3D = 142239, title = "Depthdiver Tu'nakit", expansion = 12, zoneGroup = "Zul'Aman", faction = "neutral", x=68.3, y=20.2, mapID = 2437 }
DVD.npcs[255098] = { zone = "Amani'Zar Village", model3D = 141051, title = "Jan'zel", expansion = 12, zoneGroup = "Zul'Aman", faction = "neutral", x=45.2, y=69.8, mapID = 2437, profession="leatherworking" }
DVD.npcs[255095] = { zone = "Amani'Zar Village", model3D = 141050, title = "Kuvahn", expansion = 12, zoneGroup = "Zul'Aman", faction = "neutral", x=45.2, y=69.6, mapID = 2437, profession="skinning" }
DVD.npcs[270399] = { zone = "Tokka's Landing", model3D = 130738, title = "Firetender Zab'ni", expansion = 12, zoneGroup = "The Coiled Isle", faction = "neutral", x=58.6, y=45.9, mapID = 2512 }
DVD.npcs[268228] = { zone = "Tokka's Landing", model3D = 141051, title = "Jan'sari the Watchful", expansion = 12, zoneGroup = "The Coiled Isle", faction = "neutral", x=58.6, y=45.9, mapID = 2512, category = "renown" }
DVD.npcs[257598] = { zone = "Tokka's Folly", model3D = 87552, title = "Second Mate Sluggs", expansion = 12, zoneGroup = "The Coiled Isle", faction = "neutral", x=51.6, y=49.8, mapID = 2512, category = "reputation" }
DVD.npcs[272751] = { zone = "Amani Foothold", model3D = 64062, title = "Skull of Er'inye", expansion = 12, zoneGroup = "The Coiled Isle", faction = "neutral", x=51.2, y=62.4, mapID = 2509 }
DVD.npcs[265581] = { zone = "Val or Naigtal", model3D = 109934, title = "Zuronar", expansion = 12, zoneGroup = "Voidstorm", faction = "neutral", variableLocation=true, note = " Location may rotate between Val and Naigtal." }




end
end

do --housing vendors

do --Founders Point 14
DVD.npcs[255228] = { zone = "Founders Point", model3D = 138698, title = "\"Len\" Splinthoof", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=62.4, y=80, mapID = 2352, category = "neighborhood" }
DVD.npcs[255222] = { zone = "Founders Point", model3D = 138691, title = "\"High Tides\" Ren", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=62.4, y=80.2, mapID = 2352, category = "neighborhood" }
DVD.npcs[255230] = { zone = "Founders Point", model3D = 138699, title = "\"Yen\" Malone", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=62.23, y=80.3, mapID = 2352, category = "neighborhood" }
DVD.npcs[255203] = { zone = "Founders Point", model3D = 138684, title = "Xiao Dan", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=51.95, y=38.31, mapID = 2352, category = "neighborhood" }
DVD.npcs[255221] = { zone = "Founders Point", model3D = 138690, title = "Trevor Grenner", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=53.47, y=40.93, mapID = 2352, category = "neighborhood" }
DVD.npcs[256750] = { zone = "Founders Point", model3D = 139782, title = "Klasa", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=58.3, y=61.68, mapID = 2352, category = "neighborhood" }
DVD.npcs[255213] = { zone = "Founders Point", model3D = 138687, title = "Faarden the Builder", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=52, y=38.4, mapID = 2352, category = "neighborhood" }
DVD.npcs[255216] = { zone = "Founders Point", model3D = 138688, title = "Balen Starfinder", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=52.2, y=38, mapID = 2352, category = "neighborhood" }
DVD.npcs[255218] = { zone = "Founders Point", model3D = 138689, title = "Argan Hammerfist", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=52.2, y=37.8, mapID = 2352, category = "neighborhood" }
DVD.npcs[248854] = { zone = "Founders Point", model3D = 136070, title = "The Last Architect", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=52.7, y=37.5, mapID = 2352, category = "neighborhood", note = "Rank 10 house to do weekly Curated Gift quest" }
DVD.npcs[257321] = { zone = "Founders Point", model3D = 140026, title = "Fel'orei Moonstrider", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=52.0, y=38.6, mapID = 2352, category = "neighborhood"}
DVD.npcs[267795] = { zone = "Founders Point", model3D = 145169, title = "Perry Winkles", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=53.8, y=41.6, mapID = 2352, category = "neighborhood" }
DVD.npcs[257332] = { zone = "Founders Point", model3D = 140031, title = "Devin Slatesmith", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=52.1, y=38.5, mapID = 2352, category = "neighborhood" }

DVD.npcs[271604] = { zone = "Founders Point", model3D = 129552, title = "Holly Twinklebright", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=54.4, y=32.7, mapID = 2352, category = "holiday", note = "Holiday Vendor " }

end

do --razorwind shores 14
DVD.npcs[255325] = { zone = "Razorwind Shores", model3D = 138691, title = "\"High Tides\" Ren", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=39.9, y=72.78, mapID = 2351, category = "neighborhood" }
DVD.npcs[255319] = { zone = "Razorwind Shores", model3D = 138699, title = "\"Yen\" Malone", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=40.3, y=73, mapID = 2351, category = "neighborhood" }
DVD.npcs[255326] = { zone = "Razorwind Shores", model3D = 138698, title = "\"Len\" Splinthoof", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=39.91, y=73.3, mapID = 2351, category = "neighborhood" }
DVD.npcs[255297] = { zone = "Razorwind Shores", model3D = 138751, title = "Shon'ja", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=54.13, y=59.05, mapID = 2351, category = "neighborhood" }
DVD.npcs[240465] = { zone = "Razorwind Shores", model3D = 127583, title = "Lonomia", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=68.29, y=75.5, mapID = 2351, category = "neighborhood" }
DVD.npcs[255301] = { zone = "Razorwind Shores", model3D = 138755, title = "Botanist Boh'an", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=53.7, y=57.6, mapID = 2351, category = "neighborhood" }
DVD.npcs[255278] = { zone = "Razorwind Shores", model3D = 138741, title = "Gronthul", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=54.12, y=59.11, mapID = 2351, category = "neighborhood" }
DVD.npcs[255298] = { zone = "Razorwind Shores", model3D = 138752, title = "Jehzar Starfall", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=53.56, y=58.49, mapID = 2351, category = "neighborhood" }
DVD.npcs[255299] = { zone = "Razorwind Shores", model3D = 138753, title = "Lefton Farrer", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=53.4, y=58.4, mapID = 2351, category = "neighborhood" }
DVD.npcs[253596] = { zone = "Razorwind Shores", model3D = 136070, title = "The Last Architect", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=53.8, y=57.4, mapID = 2351, category = "neighborhood", note = "Rank 10 house to do weekly Curated Gift quest" }
DVD.npcs[257303] = { zone = "Razorwind Shores", model3D = 140016, title = "Den Nightshade", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=39.5, y=70.3, mapID = 2351, category = "neighborhood" }
DVD.npcs[267794] = { zone = "Razorwind Shores", model3D = 145168, title = "Agratha", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=53.6, y=54.5, mapID = 2351, category = "neighborhood" }
DVD.npcs[257257] = { zone = "Razorwind Shores", model3D = 140000, title = "Merki", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=54.1, y=58.9, mapID = 2351, category = "neighborhood" }

DVD.npcs[271366] = { zone = "Razorwind Shores", model3D = 146645, title = "Jolli Maxiboom", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=52.4, y=54.3, mapID = 2351, category = "holiday", note = "Holiday Vendor" }
end

do--special vendors
DVD.npcs[257168] = { model3D = 139949, title = "Throska", expansion = 12, zoneGroup = "Razorwind | Founders", variableLocation=true, sourceAction = "Throska", note = "Requires the  Tortollan Endeauver to be active to see his decor", category = "neighborhood" }
DVD.npcs[267870] = { model3D = 145184, title = "Special Griftah", expansion = 12, zoneGroup = "Razorwind | Founders", variableLocation = true, sourceAction = "Special Griftah", note = "May not be up", category = "neighborhood" }
end

do--Housing Endeauver Vendors
DVD.npcs[252917] = { zone = "It Depends", model3D = 137667, title = "Hesta Forlath", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Hesta Forlath", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[257897] = { zone = "It Depends", model3D = 106374, title = "Harlowe Marl", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Harlowe Marl", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[252605] = { zone = "It Depends", model3D = 140447, title = "Aeeshna", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Aeeshna", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[249684] = { zone = "It Depends", model3D = 40842, title = "Brother Dovetail", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Brother Dovetail", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[250820] = { zone = "It Depends", model3D = 136498, title = "Hordranin", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Hordranin", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[248525] = { zone = "It Depends", model3D = 92584, title = "Pascal-K1N6", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Pascal-K1N6", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[268106] = { zone = "It Depends", model3D = 87552, title = "Taifa", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Taifa", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[260485] = { zone = "It Depends", model3D = 82235, title = "Griftah", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Griftah", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[265551] = { zone = "It Depends", model3D = 109681, title = "Roshai Lightstep", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Roshai Lightstep", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[249741] = { zone = "It Depends", model3D = 43184, title = "Cousin Shortkaf", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Cousin Shortkaf", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[271173] = { zone = "It Depends", model3D = 118388, title = "Timicky", expansion = 12, zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Timicky", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
end

do -- Holiday Vendors
DVD.npcs[273470] = {zone = "Razorwind Shores", model3D = 147405, title = "Spew Gutstout", expansion = 12, zoneGroup = "Strictly Halloween Vendors (Returns in 2027)", faction = "horde", x=52.4, y=54.3, mapID = 2351, worldEventID = 324, eventName = "Hallow's End", category = "holiday" }
DVD.npcs[273402] = {zone = "Tirisfal Glades", model3D = 108469, title = "Echo", expansion = 12, zoneGroup = "Strictly Halloween Vendors (Returns in 2027)", faction = "horde", x=62.2, y= 66.6, mapID = 18, worldEventID = 324, eventName = "Hallow's End", category = "holiday"}
DVD.npcs[272042] = {zone = "Durotar", model3D = 146907, title = "Dizzy Alechux", expansion = 12, zoneGroup = "Strictly Brewfest Vendors (Returns in 2027)", faction = "horde", x=40.3, y= 17.3, mapID = 1, worldEventID = 372, eventName = "Brewfest", category = "holiday"}
DVD.npcs[271372] = {zone = "Razorwind Shores", model3D = 24983, title = "Fizz Alechux", expansion = 12, zoneGroup = "Strictly Brewfest Vendors (Returns in 2027)", faction = "horde", x=52.4, y=54.3, mapID = 2351, worldEventID = 372, eventName = "Brewfest", category = "holiday" }

DVD.npcs[273472] = {zone = "Founders Point", model3D = 147407, title = "Cordula Wolfgang", expansion = 12, zoneGroup = "Strictly Halloween Vendors (Returns in 2027)", faction = "alliance", x=54.4, y=32.7, mapID = 2352, worldEventID = 324, eventName = "Hallow's End", category = "holiday"}
DVD.npcs[273403] = {zone = "Elwynn Forest", model3D = 77041, title = "Jack", expansion = 12, zoneGroup = "Strictly Halloween Vendors (Returns in 2027)", faction = "alliance", x=31.8, y= 50.0, mapID = 37, worldEventID = 324, eventName = "Hallow's End", category = "holiday"}
DVD.npcs[272030] = {zone = "Dun Morogh", model3D = 146903, title = "Fay Stouthammer", expansion = 12, zoneGroup = "Strictly Brewfest Vendors (Returns in 2027)", faction = "alliance", x=56.1, y= 36.7, mapID = 27, worldEventID = 372, eventName = "Brewfest", category = "holiday"}
DVD.npcs[271603] = {zone = "Founders Point", model3D = 128230, title = "Kay Stouthammer", expansion = 12, zoneGroup = "Strictly Brewfest Vendors (Returns in 2027)", faction = "alliance", x=54.4, y=32.7, mapID = 2352, worldEventID = 372, eventName = "Brewfest", category = "holiday"}


end
end
-------------------------------------------------
-- 12.1.7 vendors 
-------------------------------------------------
if (select(4, GetBuildInfo()) or 0) >= 120107 then
do
DVD.npcs[277593] = {zone = "Founders Point", model3D = 148923, title = "Burlee Jinglepocket", expansion = 12, zoneGroup = "Strictly Winter Veil Vendors", faction = "alliance", x=54.4, y=32.7, mapID = 2352, worldEventID = 141, eventName = "Winter Veil", category = "holiday" }
DVD.npcs[277592] = {zone = "Razorwind Shores", model3D = 148925, title = "Roz Copperpinch", expansion = 12, zoneGroup = "Strictly Winter Veil Vendors", faction = "horde", x=52.4, y=54.3, mapID = 2351, worldEventID = 141, eventName = "Winter Veil", category = "holiday"  }

DVD.npcs[255949] = { zone = "Razorwind Shores", model3D = 139382, title = "Zin'nin", expansion = 12, zoneGroup = "Razorwind Shores", faction = "horde", x=41.3, y=79.1, mapID = 2351, category = "neighborhood" }
DVD.npcs[255943] = { zone = "Founders Point", model3D = 129758, title = "Torm Swindel", expansion = 12, zoneGroup = "Founders Point", faction = "alliance", x=56.3, y=41.2, mapID = 2352, category = "neighborhood" }
DVD.npcs[191954] = { zone = "Ruby Lifeshrine", model3D = 109608, title = "Kskeiton ", expansion = 10, zoneGroup = "The Waking Shores", faction = "neutral", x=60.0, y=71.6, mapID = 2022 }
DVD.npcs[96483] = { zone = "The Wonderworks", model3D = 26300, title = "Jepetto Joybuzz ", expansion = 7, zoneGroup = "Dalaran", faction = "neutral", x=43.6, y=46.4, mapID = 627 }
DVD.npcs[59908] = { zone = "Both Shrines", model3D = 44273, title = "Jaluu the Generous", expansion = 5, zoneGroup = "Vale of Eternal Blossoms - Both Shrines", faction = "neutral",  mapID = 390, note = "He is at both shrines on bottom floor", category = "reputation" }
DVD.npcs[188625] = { zone = "Obsidian Throne", model3D = 71112, title = "Lorena Belle", expansion = 10, zoneGroup = "The Waking Shores", faction = "neutral", x=24.7, y=56.8, mapID = 2022 }
DVD.npcs[77354] = { zone = "Enchanters Study", model3D = 53958, title = "Ayada the White", expansion = 6, zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[50382] = { zone = "Highbank", model3D = 37063, title = "Brundall Chiselgut", expansion = 4, zoneGroup = "Twilight Highlands", faction = "alliance", x=79.0, y=76.6, mapID = 241 }
DVD.npcs[50375] = { zone = "Dragonmaw Port", model3D = 37029, title = "Kuldar Steeltooth", expansion = 4, zoneGroup = "Twilight Highlands", faction = "horde", x=77.2, y=53.0, mapID = 241 }
DVD.npcs[98059] = { zone = "Druid", model3D = 65601, title = "Skysea Wanderer", expansion = 7, zoneGroup = "Class Halls", faction = "neutral", x=61.7, y=35.9, mapID = 747, note = "By flightpatch" }
DVD.npcs[76198] = { zone = "Exiles Reach", model3D = 53103, title = "Mokarg", expansion = 6, zoneGroup = "Shadowmoon Valley", faction = "neutral", x=45.7, y=26.5, mapID = 539 }
DVD.npcs[276134] = { zone = "Terrance of Crafters", model3D = 148485, title = "Ayan'wu", expansion = 8, zoneGroup = "Zuldazar", faction = "horde", x=42.2, y=35.5, mapID = 1165 }

--Timewalking Vendors
DVD.npcs[255019] = { zone = "Valdrakken", model3D = 112100, title = "Xydan", expansion = 10, zoneGroup = "Timewalking Vendors", faction = "neutral", x = 81.4, y = 47.3, mapID = 2112, worldEventID = 1722, eventName = "Dragonflight Timewalking", category = "timewalking" }
DVD.npcs[98690] = { zone = "Northrend Dalaran", model3D = 65992, title = "Auzin", expansion = 3, zoneGroup = "Timewalking Vendors", faction = "neutral", x = 51.0, y = 47.6, mapID = 125, worldEventID = 562, eventName = "Wrath of the Lich King Timewalking", category = "timewalking" }
DVD.npcs[98685] = { zone = "Shattrath City", model3D = 65949, title = "Cupri", expansion = 2, zoneGroup = "Timewalking Vendors", faction = "neutral", x = 54.6, y = 39.6, mapID = 111, worldEventID = 559, eventName = "The Burning Crusade Timewalking", category = "timewalking" }
DVD.npcs[118828] = { zone = "Timeless Isle", model3D = 74495, title = "Mistweaver Xia", expansion = 5, zoneGroup = "Timewalking Vendors", faction = "neutral", x = 43.0, y = 55.6, mapID = 544, worldEventID = 643, eventName = "Mists of Pandaria Timewalking", category = "timewalking" }
DVD.npcs[252687] = { zone = "Oribos", model3D = 137518, title = "Collector Ta'steld", expansion = 9, zoneGroup = "Timewalking Vendors", faction = "neutral", x = 56.24, y = 64.13, mapID = 1670, worldEventID = 1703, eventName = "Shadowlands Timewalking", category = "timewalking" }
--DVD.npcs[151955] = { zone = "Stormshield", model3D = 91324, title = "Tempra", expansion = 6, zoneGroup = "Timewalking Vendors", faction = "alliance", x = 37.3, y = 72.8, mapID = 622, worldEventID = 1056, eventName = "Warlords of Dranor Timewalking", category = "timewalking"}


DVD.npcs[223884] = { model3D = 119888, title = "Bobadormu", expansion = 1, zoneGroup = "Timewalking Vendors", category = "timewalking", worldEventID = 1508, eventName = "Classic Timewalking" , 
alliance = { zone = "Stormwind", mapID = 84, x = 56.0, y = 19.0 }, 
horde = { zone = "Orgrimmar", mapID = 85, x = 52.8, y = 83.0 } 
}
DVD.npcs[101759] = { model3D = 67320, title = "Kiatke", expansion = 4, zoneGroup = "Timewalking Vendors", category = "timewalking", worldEventID = 587, eventName = "Cataclysm Timewalking" , 
alliance = { zone = "Stormwind", mapID = 84, x = 76.6, y = 16.6 }, 
horde = { zone = "Orgrimmar", mapID = 85, x = 52.0, y = 41.6 } 
}

DVD.npcs[239840] = { model3D = 127411, title = "Churbro", expansion = 8, zoneGroup = "Timewalking Vendors", category = "timewalking", worldEventID = 1669, eventName = "Battle for Azeroth Timewalking" , 
alliance = { zone = "Boralus", mapID = 1161, x = 70.9, y = 17.2 }, 
horde = { zone = "Dazalor'alor", mapID = 1165, x = 46.0, y = 94.9 } 
}

DVD.npcs[248599] = {zone = "Quillgrave", model3D = 131642, title = "Nib", expansion = 12, zoneGroup = "Quillgrave", faction = "neutral", noWaypoint = true, note = "Talebound Shop - addons do not run in Talebound, track in Midnight"}
end
end
-------------------------------------------------
-- QUESTS
-------------------------------------------------
DVD.quests = DVD.quests or {}

DVD.quests = { 
{ 
 name = "Amirdrassil",
		quests =	{
        { id = 78864, questName = "The Returning", type = "quest", itemID = 251022, model3D = 4756256, title = "Bel'ameth Traveler's Pack", expansion = 10, faction = "neutral"},
		{ id = 77283, questName = "A Multi-Front Battle", type = "quest", itemID = 257352, model3D = 4690349, title = "Large Brazier of Elune", expansion = 10, faction = "neutral" },
		}
    },
{    
	    name = "Arcantina",
		quests = {
		{ id = 92319, questName = "A Favor to Axe", type = "quest", itemID = 253542, model3D = 874421, title = "Scarred Orcish Spear", expansion = 12, faction = "neutral"},--9439
		{ id = 92321, questName = "A Frostbitten Tally", type = "quest", itemID = 253598, model3D = 194802, title = "Banner of the Ebon Blade", expansion = 12, faction = "neutral"},--9475
		{ id = 92327, questName = "A Generational Moment", type = "quest", itemID = 253174, model3D = 305201, title = "Dried Gilnean Roses", expansion = 12, faction = "neutral"},
		{ id = 92327, questName = "A Generational Moment", type = "quest", itemID = 253543, model3D = 902697, title = "Clefthoof Hide Rug", expansion = 12, faction = "neutral" },
		{ id = 92325, questName = "Hellscream's Heritage", type = "quest", itemID = 253544, model3D = 985164, title = "Weathered History of the Warchiefs", expansion = 12, faction = "neutral"}, --9441
		{ id = 95780, questName = "Hope for the Orphans", type = "quest", itemID = 278038, model3D = 5658299, title = "Arathor Toy Sword", expansion = 12, faction = "neutral"},
		{ id = 95779, questName = "Moments in a Mug", type = "quest", itemID = 278694, model3D = 526368, title = "Stormstout Hanging Lantern", expansion = 12, faction = "neutral"},
		{ id = 92320, questName = "Still Behind Enemy Portals", type = "quest", itemID = 253178, model3D = 1383910, title = "Inactive Filigree Moon Lamp", expansion = 12, faction = "neutral"},--9252
		{ id = 92326, questName = "The Fragrance of the Dunes", type = "quest", itemID = 253179, model3D = 1611709, title = "Ornamental Proudmoore Anchor", expansion = 12, faction = "neutral"},--9253
		{ id = 92326, questName = "The Fragrance of the Dunes", type = "quest", itemID = 253700, model3D = 1674723, title = "Sandy Vulpera Banner", expansion = 12, faction = "neutral"},--9253		
        { id = 92322, questName = "Timear Foresees a Proof of Demise!", type = "quest", itemID = 253176, model3D = 774267, title = "Ancient Zandalari Ritual Scroll", expansion = 12, faction = "neutral"}, --9250    		
		{ id = 92324, questName = "Uncrowned's Cold Case", type = "quest", itemID = 253177, model3D = 1327768, title = "Pylon Fragment", expansion = 12, faction = "neutral"},--9251
		{ id = 92323, questName = "Where the Fire Once Burned", type = "quest", itemID = 253175, model3D = 651497, title = "Hyjal Climbing Vine", expansion = 12, faction = "neutral"},--9249
		}
    },
{ 
 name = "Ardenweald", -- 2 notes
		quests =  {
	  { id = 60778, questName = "Wildseed Rescue", type = "quest", itemID = 283341, model3D = 3024728, title = "Dormant Wildseed", expansion = 9, faction = "neutral" },
		}
    },	
{	
 name = "Azj-Kahet",
		quests = {
        { id = 82141, questName = "To Kill a Queen", type = "quest", itemID = 260583, model3D = 4892782, title = "Arathi Bartender's Shelves", expansion = 11, faction = "neutral" },
		}
    },	
{ 
 name = "Azsuna", 
		quests =	{
        { id = 41143, questName = "Mglrgrs Of Our Grmlgrlr", type = "quest", itemID = 258222, model3D = 1091599, title = "Shellscale Standard", expansion = 7, faction = "neutral"},
        { id = 37470, questName = "The Head of the Snake", type = "quest", itemID = 246864, model3D = 4298560, title = "Tome of the Lost Dragon", expansion = 7, faction = "neutral"},
		}
    },
{ 
 name = "Bastion", -- 2 notes
		quests =	{
	  { id = 59426, questName = "Your Personal Assistant", type = "quest", itemID = 284542, model3D = 3220602, title = "Kyrian Steward Effigy", expansion = 9, faction = "neutral" },
		}
    },	
{ 
 name = "Blackrock Depths", 
		quests =	{
		{ id = 7604, questName = "A Binding Contract", type = "quest", itemID = 256673, model3D = 953668, title = "Stormwind Forge", expansion = 1, faction = "neutral", note = "purchase a sulfuron ingot" },
		{ id = 53566, category = "race", questName = "Dark Iron Dwarves", type = "quest", itemID = 245427, model3D = 1019061, title = "Dark Iron Expedition Tent", expansion = 8, faction = "alliance", note = "Dark Iron Dwarf Only" },		
		}
    },
{ 
 name = "Blasted Lands", -- 2 notes
		quests =	{
		{ id = 25720, questName = "The Downfall of Marl Wormthorn", type = "quest", itemID = 244777, model3D = 304416, title = "Surwich Peddler's Wagon", expansion = 4, faction = "alliance", note = "Quest chain to start it  is  with Mayor Charlton Connisport" },	
		}
    },	
{ 
 name = "Borean Tundra", -- 2 notes
		quests =	{
	  { id = 11566, questName = "Surrender... Not!", type = "quest", itemID = 258220, model3D = 1091581, title = "Murloc Driftwood Hut", expansion = 3, faction = "neutral", note = "Unlocks after doing Winterfin Commerce" },
		}
    },
{ 
 name = "Burning Steppes", 
		quests =	{
        { id = 28183, questName = "Return to Keeshan", type = "quest", itemID = 256331, model3D = 7385423, title = "Shadowforge Lamppost", expansion = 4, faction = "alliance" },
		}
    },
{ 
    name = "Dalaran(Northrend)", 
    quests = {
		{ id = { 13103, 13115 }, questName = "Cheese for Glowergold", type = "quest", itemID = 258145, model3D = 6051297, title = "Eversong Party Platter", expansion = 3, faction = "neutral", note = "This is a rare daily Cooking quest" },
    }
},
{ 
    name = "Dalaran(Legion)", 
    quests = {
        { id = 44004, questName = "Bringer of the Light", type = "quest", itemID = 251480, model3D = 902396, title = "Draenic Wooden Wall Shelf", expansion = 7, faction = "neutral"},
    }
},
{ 
 name = "Dornogal",  -- 1 note
		quests =	{
        { id = 92580, questName = "Spare A Chair", type = "quest", itemID = 246487, model3D = 6699745, title = "Gnomish Tesla Coil", expansion = 11, faction = "neutral"  },
        { id = 92572, questName = "Furniture Favor", type = "quest", itemID = 253173, model3D = 7262874, title = "Meadery Storage Barrel", expansion = 11, faction = "neutral"  },
        { id = 92577, questName = "Dreamy Inspiration", type = "quest", itemID = 245259, model3D = 1096761, title = "Small Val'sharah Bookcase", expansion = 11, faction = "neutral" },
        { id = 92581, questName = "Last Light", type = "quest", itemID = 247915, model3D = 1361710, title = "Square Suramar Table", expansion = 11, faction = "neutral"},
        { id = 92578, questName = "Draconic Decor", type = "quest", itemID = 248116, model3D = 4290181, title = "Valdrakken Chandelier", expansion = 11, faction = "neutral"   },
		{ id = 79530, questName = "Bad Business", type = "quest", itemID = 252756, model3D = 5335168, title = "Stonelight Countertop", expansion = 11, faction = "neutral"  },
		}
    },
{ 
 name = "Drustvar", 
		quests =	{
        { id = 51985, questName = "Return to Zuldazar", type = "quest", itemID = 245475, model3D = 2445708, title = "Forsaken Long Table", expansion = 8, faction = "horde" },
		}
    },
{ 
 name = "Duskwood", 
		quests =	{
        { id = 26754, questName = "Morbent's Bane", type = "quest", itemID = 256905, model3D = 322634, title = "Small Gilnean Table", expansion = 4, faction = "alliance"},
        { id = 26760, questName = "Cry For The Moon", type = "quest", itemID = 245624, model3D = 464019, title = "Waning Wood Fence", expansion = 4, faction = "alliance"},
		}
    },
{ 
 name = "Elwynn Forest", 
		quests =	{
        { id = 114, questName = "The Escape", type = "quest", itemID = 253527, model3D = 936454, title = "Goldshire Wardrobe", expansion = 1, faction = "alliance"},
        { id = 60, questName = "Kobold Candles", type = "quest", itemID = 248938, model3D = 960094, title = "Hooded Iron Lantern", expansion = 1, faction = "alliance" },
		{ id = 54, questName = "Report to Goldshire", type = "quest", itemID = 248798, model3D = 950755, title = "Northshire Barrel", expansion = 1, faction = "alliance"},
		}
    },
{ 
 name = "Eredath", 
		quests = {
        { id = 47691, questName = "A Non-Prophet Organization", type = "quest", itemID = 245422, model3D = 979926, title = "Draenic Bookcase", expansion = 7, faction = "neutral" },
		}
    },	
{ 
 name = "Eversong Woods", 
		quests =	{
		{ id = 90493, questName = "The Heart of Tranquillien", type = "quest", itemID = 253485, model3D = 6036095, title = "Sin'dorei Honor Stone", expansion = 12, faction = "neutral"},--1159
		{ id = 90907, questName = "The First to Know", type = "quest", itemID = 244783, model3D = 6856603, title = "Majestic Lightwood Table", expansion = 12, faction = "neutral"},--1489
		{ id = 86741, questName = "Lightbloom Looming", type = "quest", itemID = 245992, model3D = 6985813, title = "Ornate Silvermoon Candelabra", expansion = 12, faction = "neutral"},--1908
		{ id = 92025, questName = "Flowers for Amalthea", type = "quest", itemID = 257418, model3D = 6210870, title = "Ornate Sin'dorei Sconce", expansion = 12, faction = "neutral"},
		{ id = 86739, questName = "Fairbreeze Favors", type = "quest", itemID = 264248, model3D = 6026041, title = "Sin'dorei Storage Jar", expansion = 12, faction = "neutral" },
		{ id = 88941, questName = "For Quel'Thalas", type = "quest", itemID = 251914, model3D = 6051300, title = "Sumptuous Berry Pie", expansion = 12, faction = "neutral" },
        { id = 86650, questName = "Fractured", type = "quest", itemID = 244538, model3D = 6367922, title = "Silvermoon Sundial", expansion = 12, faction = "neutral" },
		}
    },
{ 
 name = "Felwood", 
		quests =	{
        { id = 28337, questName = "The Shredders of Irontree", type = "quest", itemID = 256903, model3D = 304626, title = "Gilnean Banded Crate", expansion = 4, faction = "alliance"},--11301		
		{ id = 76213, questName = "Honor of the Goddess", type = "quest", itemID = 248401, model3D = 4756262, title = "Ornamental Kaldorei Glaive", expansion = 10, faction = "alliance", category = "race", note = "Night Elf Only"},
		}
    },
{ 
 name = "Frostfire Ridge", 
		quests =	{
        { id = 33470, questName = "Pool of Visions", type = "quest", itemID = 244320, model3D = 996200, title = "Youngling's Courser Toys", expansion = 6, faction = "horde"},
		{ id = 33527, questName = "Last Steps", type = "quest", itemID = 245438, model3D = 971699, title = "Frostwolf Bookcases", expansion = 6, faction = "horde"},
		}
    },	
{ 
 name = "Frostwall", 
		quests =	{
        { id = 36614, questName = "My Very Own Fortress", type = "quest", itemID = 244315, model3D = 979433, title = "Orcish Warlords's Planning Table", expansion = 6, faction = "horde" },
		}
    },
{ 
 name = "Gilneas", 
		quests =	{
		{ id = 24675, category = "race", questName = "Last Meal", type = "quest", itemID = 245518, model3D = 305584, title = "Worgen's Chicken Coop", expansion = 4, faction = "alliance", note = "worgen locked"},
		{ id = 14402, category = "race", questName = "Ready to Go", type = "quest", itemID = 245620, model3D = 321660, title = "Little Wolf's Loo", expansion = 4, faction = "alliance", note = "worgen locked" },        
		}
    },	
{ 
 name = "Grizzly Hills", 
		quests =	{
        { id = 12227, questName = "Doing Your Duty", type = "quest", itemID = 248622, model3D = 1048173, title = "Wooden Outhouse", expansion = 3, faction = "alliance" },
		}
    },
{ 
 name = "Harandar", 
		quests =	{
		{ id = 86851, questName = "The Foundation of Aln", type = "quest", itemID = 266259, model3D = 6310381, title = "Altar of the Shul'ka", expansion = 12, faction = "neutral" },--17886
		{ id = 88994, questName = "The Cauldron of Echoes", type = "quest", itemID = 263315, model3D = 5163359, title = "Bubbling Haranir Cauldron", expansion = 12, faction = "neutral" },--15155
		{ id = 86861, questName = "Herding Manifestations", type = "quest", itemID = 252045, model3D = 6225718, title = "Fungal Pergola", expansion = 12, faction = "neutral" },--8993
		{ id = 88997, questName = "Russula's Outreach", type = "quest", itemID = 262906, model3D = 6310371, title = "Harandar Anvil", expansion = 12, faction = "neutral" },--14799
		{ id = 91589, questName = "Root Dash Delivery", type = "quest", itemID = 264178, model3D = 6326888, title = "Harandar Charcuterie Board", expansion = 12, faction = "neutral" },--15463
		{ id = 88995, questName = "Aln'hara's Bloom", type = "quest", itemID = 263196, model3D = 6252873, title = "Harandar Glowvine Lantern", expansion = 12, faction = "neutral" },--14968
		{ id = 86956, questName = "The Traveling Flowers", type = "quest", itemID = 262614, model3D = 6796710, title = "Harandar Runestone", expansion = 12, faction = "neutral" },--14639
		{ id = 88996, questName = "The Echoless Flame", type = "quest", itemID = 264262, model3D = 6252870, title = "Haranir Whistling Arrow", expansion = 12, faction = "neutral" },--15497
		{ id = 88998, questName = "Root of the World", type = "quest", itemID = 263041, model3D = 6252867, title = "Replica Root of the World", expansion = 12, faction = "neutral" },--14827
		{ id = 88999, questName = "Sky's Hope", type = "quest", itemID = 253443, model3D = 6796713, title = "Replica Sky's Hope", expansion = 12, faction = "neutral" },--1080
		{ id = 88993, questName = "Wey'nan's Ward", type = "quest", itemID = 263037, model3D = 4732015, title = "Replica Wey'nan's Ward", expansion = 12, faction = "neutral" },--14823
		{ id = 86866, questName = "Can We Heal This?", type = "quest", itemID = 254319, model3D = 6225721, title = "Root-Woven Door", expansion = 12, faction = "neutral" },--10327
		{ id = 86891, questName = "A Last Resort", type = "quest", itemID = 254878, model3D = 6225720, title = "Root-Woven Window", expansion = 12, faction = "neutral" },--10778
		{ id = 86911, questName = "Echoes and Memories", type = "quest", itemID = 246415, model3D = 6326881, title = "Ruddy Haranir Pigment Bowl", expansion = 12, faction = "neutral" },--2232
		{ id = 86896, questName = "Light Finds a Way", type = "quest", itemID = 247234, model3D = 6225702, title = "Rustic Harandar Planter", expansion = 12, faction = "neutral" },--2605
		{ id = 86867, questName = "Into the Lightbloom", type = "quest", itemID = 253467, model3D = 6055100, title = "Rutaani Sporepod", expansion = 12, faction = "neutral" },--1147
		{ id = 86857, questName = "Descent into the Rift", type = "quest", itemID = 246407, model3D = 6326912, title = "Stoppered Spring Water Gourd", expansion = 12, faction = "neutral" },--2224
		{ id = 86973, questName = "Halting Harm in Har'mara", type = "quest", itemID = 245535, model3D = 6310382, title = "Sturdy Haranir Handcart", expansion = 12, faction = "neutral" },--1726
		{ id = 90834, questName = "From this Point Forward", type = "quest", itemID = 263020, model3D = 4732018, title = "Ward of the Shul'ka", expansion = 12, faction = "neutral" },--14809
		{ id = 96504, questName = "Warm Haranir Blanket", type = "quest", itemID = 264245, model3D = 5161741, title = "Warm Haranir Blanket", expansion = 12, faction = "neutral" },--14809
		{ id = 96507, questName = "Haranir Reclined Bed", type = "quest", itemID = 263038, model3D = 4899957, title = "Haranir Reclined Bed", expansion = 12, faction = "neutral" },--14809
		{ id = 96500, questName = "Firm Haranir Pillow", type = "quest", itemID = 264243, model3D = 5161737, title = "Firm Haranir Pillow", expansion = 12, faction = "neutral" },--14809
		}
    },	
{ 
 name = "Highmountain", 
		quests =	{
        { id = 39305, questName = "Empty Nest", type = "quest", itemID = 257723, model3D = 1255422, title = "Skyhorn Eagle Kite", expansion = 7, faction = "neutral" },	
        { id = 39426, questName = "Blood Debt", type = "quest", itemID = 257722, model3D = 1255418, title = "Hanging Arrow Kite", expansion = 7, faction = "neutral"  },
        { id = 39387, questName = "The Skies of Highmountain", type = "quest", itemID = 257401, model3D = 1255331, title = "Skyhorn Banner", expansion = 7, faction = "neutral" },
        { id = 39496, questName = "The Flow of the River", type = "quest", itemID = 245409, model3D = 6877680, title = "Dried Whitewash Corn", expansion = 7, faction = "neutral" },        
        { id = 39579, questName = "The Backdoor", type = "quest", itemID = 245456, model3D = 1253406, title = "Warbrave's Brazier", expansion = 7, faction = "neutral"  },
        { id = 39992, questName = "Huln's War - The Nathrezim", type = "quest", itemID = 257397, model3D = 1345313, title = "Tauren Storyteller's Frame", expansion = 7, faction = "neutral"  },
        { id = 40230, questName = "Oh, the Clawdacity!", type = "quest", itemID = 258221, model3D = 1091587, title = "Driftwood Junk Pile", expansion = 7, faction = "neutral" },
        { id = 39487, questName = "Crystal Fury", type = "quest", itemID = 264477, model3D = 1253823, title = "Thunder Totem Mailbox", expansion = 7, faction = "neutral" },--15741
        { id = 39614, questName = "Fish Out of Water", type = "quest", itemID = 245457, model3D = 1323065, title = "Riverbend Netting", expansion = 7, faction = "neutral" },
        { id = 39772, questName = "Can't Hold a Candle To You", type = "quest", itemID = 260698, model3D = 1255019, title = "Kobold Trassure Pile", expansion = 7, faction = "neutral" },		
        { id = 39780, questName = "The Underking", type = "quest", itemID = 245461, model3D = 1305130, title = "Tauren Vertical Windmill", expansion = 7, faction = "neutral"  },
        { id = 42590, questName = "Moozy's Reunion", type = "quest", itemID = 245453, model3D = 1322950, title = "Whitewash River Basket", expansion = 7, faction = "neutral" },
        { id = 42622, questName = "Ceremonial Drums", type = "quest", itemID = 245405, model3D = 6711671, title = "Large Highmountain Drum", expansion = 7, faction = "neutral" },
		}
    },
{ 
 name = "Isle of Dorn", 
		quests =	{
        { id = 79565, questName = "Janky Candles", type = "quest", itemID = 258267, model3D = 5169960, title = "Candle-Festooned Wooden Awning", expansion = 11, faction = "neutral"},
        { id = 82895, questName = "The Weight of Duty", type = "quest", itemID = 253034, model3D = 4860713, title = "Fallside Lantern", expansion = 11, faction = "neutral"}, 
        { id = 78999, questName = "Heart of a Hero", type = "quest", itemID = 253021, model3D = 4896177, title = "Freywold Bench", expansion = 11, faction = "neutral" },
        { id = 78759, questName = "To Wake a Giant", type = "quest", itemID = 253166, model3D = 4906199, title = "Freywold Fountain", expansion = 11, faction = "neutral" },
        { id = 79703, questName = "Hope, An Anomaly", type = "quest", itemID = 253035, model3D = 4896174, title = "Freywold Seat", expansion = 11, faction = "neutral"  },
		}
    },
{ 
 name = "K'aresh", 
		quests =	{
        { id = 86820, questName = "Manaforge Omega: Dimensius Looms", type = "quest", itemID = 260582, model3D = 3565798, title = "Cartel Collector's Cage", expansion = 11, faction = "neutral"},  		
		}
    },	
{ 
 name = "Krokuun", 
		quests = {
        --{ id = 47654, questName = "Seat of the Triumvirate: The Crest of Knowledge", type = "quest", itemID = 282148, model3D = 1686555, title = "Replica Crown of the Triumvirate", expansion = 7, faction = "neutral" },
		}
    },	
{ 
 name = "Kun-Lai Summit", 
		quests =	{
        { id = 30612, questName = "The Leader Hozen", type = "quest", itemID = 264349, model3D = 7508746, title = "Kun-Lai Lacquered Rickshaw", expansion = 5, faction = "neutral"},
        { id = 32816, questName = "Path of the Last Emperor", type = "quest", itemID = 247858, model3D = 531955, title = "Shaohao Ceremonial Bell", expansion = 5, faction = "neutral"},
		}
    },
{ 
 name = "Loch Modan", 
		quests =	{
        { id = 26868, questName = "Axis of Awful", type = "quest", itemID = 246422, model3D = 197430, title = "Thelsamar Hanging Lantern", expansion = 1, faction = "alliance"},
		}
    },
{ 
 name = "Lunarfall",
		quests =	{
        { id = 36615, questName = "My Very Own Castle", type = "quest", itemID = 248800, model3D = 969975, title = "Architect's Drafting Table", expansion = 6, faction = "alliance"},
        { id = 36592, questName = "Bigger is Better", type = "quest", itemID = 248661, model3D = 949629,  title = "Northshire Scribe's Desk", expansion = 6, faction = "alliance"},
        { id = 35176, questName = "Keeping it Together", type = "quest", itemID = 248810, model3D = 7151868, title = "Rough Wooden Chair", expansion = 6, faction = "alliance"},
        { id = 36404, questName = "Clearing the Garden", type = "quest", itemID = 248334, model3D = 7571145, title = "Stormwind Wooden Bench", expansion = 6, faction = "alliance"},
        { id = 34192, questName = "Things Are Not Goren Our Way", type = "quest", itemID = 248660, model3D = 943720,  title = "Stormwind Workbench", expansion = 6, faction = "alliance" },
        { id = 34586, questName = "Establish Your Garrison", type = "quest", itemID = 248799, model3D = 950767,  title = "Wooden Storage Crate", expansion = 6, faction = "alliance"},		
        { id = 36202, questName = "Anglin' In Our Garrison", type = "quest", itemID = 248335, model3D = 953802, title = "Stormwind Wooden Stool", expansion = 6, faction = "alliance"},        		
		}
    },
{ 
 name = "Maldraxxus", 
		quests =	{
        { id = 57982, questName = "Breaking Down Barriers", type = "quest", itemID = 284500, model3D = 3307174, title = "Maldraxxi Shielding Lattice", expansion = 8, faction = "neutral"},
		}
    },	
{ 
 name = "Mechagon", 
		quests =	{
        { id = 55736, questName = "Welcome to the Resistance", type = "quest", itemID = 246703, model3D = 1842930, title = "Double-Sprocket Table", expansion = 8, faction = "neutral"},
		}
    },
{ 
 name = "Nagrand", 
		quests =	{
        { id = 35396, questName = "The Dark Heart of Oshu'gun", type = "quest", itemID = 245425, model3D = 917996, title = "Hanging Draenethyst Light", expansion = 6, faction = "alliance"},
		}
    },
{ 
 name = "Nazmir", 
		quests =	{
        { id = 50808, questName = "Halting the Empire's Fall", type = "quest", itemID = 245491, model3D = 1661034, title = "Bwonsamdi's Golden Gong", expansion = 8, faction = "horde" },
        { id = 47188, questName = "The Aid of the Loa", type = "quest", itemID = 245488, model3D = 1590851, title = "Zandalari Rickshaw", expansion = 8, faction = "horde" },
        { id = 47250, questName = "We'll Meet Again", type = "quest", itemID = 245489, model3D = 1597479, title = "Zuldazar Stool", expansion = 8, faction = "horde"},
		}
    },
{ 
 name = "Founders Point | Razorwind Shores", 
		quests =	{        
	{ id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 256684, model3D = 6654719, title = "Purified Troll Amulet", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 278701, model3D = 5793093, title = "Purified Goblin Cup", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 267355, model3D = 7554177, title = "Purified Elven Mirror", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 267435, model3D = 7554186, title = "Purified Kaldorei Candle", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 252042, model3D = 6212457, title = "Purified Troll Pitcher", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 263876, model3D = 7338169, title = "Purified Folk Mirror", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 253703, model3D = 6654736, title = "Purified Crude Hammer", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 255712, model3D = 6654760, title = "Purified Ancient Urn", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 245991, model3D = 6985812, title = "Purified Sin'dorei Candle", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 245993, model3D = 6985814, title = "Purified Floating Lantern", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 255652, model3D = 6654716, title = "Purified Troll Loop", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 267205, model3D = 7345175, title = "Purified Folk Candle", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 268943, model3D = 7554195, title = "Purified Elven Glowlamp", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 272129, model3D = 1324327, title = "Purified Tauren Pot", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 253396, model3D = 6654738, title = "Purified Crude Axe", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 272142, model3D = 5203782, title = "Purified Earthen Pot", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 256361, model3D = 6654720, title = "Purified Troll Pendant", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 258540, model3D = 6654715, title = "Purified Troll Ring", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 278696, model3D = 4495230, title = "Purified Dracthyr Stein", expansion = 12, faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 244347, model3D = 6904849, title = "Purified Troll Urn", expansion = 12, faction = "neutral" },
	
	{ id = 98406, questName = "A Curated Gift", type = "quest", itemID = 245539, model3D = 6930643, title = "Elegant Enchanted Vanity", expansion = 12, faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 254561, model3D = 6654718, title = "Ogre Champion's Prized Skull", expansion = 12, faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 246958, model3D = 6225703, title = "Mastercrafted Fungal Row Planter", expansion = 12, faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 253397, model3D = 6654743, title = "Revered Deepstone Table", expansion = 12, faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 249923, model3D = 7216049, title = "Sin'dorei Golden Welcome", expansion = 12, faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 253481, model3D = 6036347, title = "Masterful Sin'dorei Gravestone", expansion = 12, faction = "neutral" },
		}
    },		
{ 
 name = "Northshire", 
		quests =	{        
        { id = 26390, questName = "Ending the Invasion!", type = "quest", itemID = 248621, model3D = 1004965, title = "Stormwind Arched Trellis", expansion = 4, faction = "alliance"},
		}
    },
{ 
 name = "Thunder Bluff", 
		quests =	{        
		{ id = 26397, questName = "Walk With The Earth Mother", type = "quest", itemID = 243335, model3D = 6711674, title = "Tauren Bluff Rug", expansion = 1, faction = "horde", category = "race", note = "Regular Tauren Only" },
		}
    },	
{ 
 name = "Searing Gorge", 
		quests =	{
        { id = 28064, questName = "Welcome to the Brotherhood", type = "quest", itemID = 246409, model3D = 197155, title = "Shadowforge Grinding Wheel", expansion = 1, faction = "neutral"},
        { id = 28035, questName = "The Mountain-Lord's Support", type = "quest", itemID = 245333, model3D = 6877809, title = "Shadowforge Wooden Box", expansion = 4, faction = "neutral" },
		}
    },
{ 
 name = "Shadowmoon Valley", 
		quests =	{
        { id = 33256, questName = "The Defense of Karabor", type = "quest", itemID = 251654, model3D = 7273284, title = "Large Karabor Fountain", expansion = 6, faction = "alliance" },
        { id = 34792, questName = "The Traitor's True Name", type = "quest", itemID = 251548, model3D = 916279,  title = "Draenic Fence", expansion = 6, faction = "alliance"},
		{ id = 34792, questName = "The Traitor's True Name", type = "quest", itemID = 251330, model3D = 916603, title = "Draenic Fencepost", expansion = 6, faction = "alliance" },
		{ id = 35196, questName = "Forging Ahead", type = "quest", itemID = 251478, model3D = 875150, title = "Square Draenic Table", expansion = 6, faction = "alliance" },
        { id = 36169, questName = "The Trial of Champions", type = "quest", itemID = 251477, model3D = 875146, title = "Draenic Wooden Table", expansion = 6, faction = "alliance" },
		{ id = 37322, questName = "The Prophet's Final Message", type = "quest", itemID = 251549, model3D = 944218, title = "Emblem of the Naaru's Blessing", expansion = 6, faction = "alliance"},
		{ id = 38197, questName = "Missive: Assault on Socrethar's Rise", type = "quest", itemID = 251329, model3D = 878999, title = "Shadowmoon Open-Air Shed", expansion = 6, faction = "alliance"},
		}
    },
{ 
 name = "Silverpine Forest", 
		quests =	{
        { id = 27098, questName = "Lordaeron", type = "quest", itemID = 245504, model3D = 397900, title = "Lordaeron Fence", expansion = 1, faction = "horde"},
		{ id = 27098, questName = "Lordaeron", type = "quest", itemID = 245505, model3D = 397901, title = "Lordaeron Fencepost", expansion = 1, faction = "horde"},
        { id = 27550, questName = "Pyrewood's Fall", type = "quest", itemID = 257412, model3D = 304495, title = "Stoppered Gilnean Barrel", expansion = 4, faction = "horde"},
		}
    },
{ 
 name = "Silvermoon City", 
		quests =	{
        { id = 86735, questName = "Paved in Ash", type = "quest", itemID = 263231, model3D = 6050876, title = "Silvermoon Curio Shelves", expansion = 12, faction = "neutral" },
	    { id = 90867, questName = "From Darkness, Light", type = "quest", itemID = 265631, model3D = 6684021, title = "Farstriders' Glory Statue", expansion = 12, faction = "horde" },
        { id = 90867, questName = "From Darkness, Light", type = "quest", itemID = 265106, model3D = 6684020, title = "Farstriders' Pride Statue", expansion = 12, faction = "horde" },	
		{ id = 88942, questName = "The Elves are Going to War", type = "quest", itemID = 246458, model3D = 6427293, title = "Grand Aethercharged Crystal", expansion = 12, faction = "horde" },
		
		{ id = 95533, questName = "The Aqir Swarm", type = "quest", itemID = 280050, model3D = 8123341, title = "Aqir Hunter's Trophy", expansion = 12, faction = "neutral" },
		}
    },	
{ 
 name = "Spires of Arak", 
		quests =	{
        { id = 35704, questName = "When All Is Aligned", type = "quest", itemID = 258745, model3D = 7277023, title = "High Arakkoan Library Shelf", expansion = 6, faction = "neutral"},
        { id = 35273, questName = "Hot Seat", type = "quest", itemID = 258748, model3D = 7277026, title = "\"Rising Glory of Rukhmar\" Statue", expansion = 6, faction = "neutral" },
        { id = 35896, questName = "The Avatar of Terokk", type = "quest", itemID = 258749, model3D = 1113349, title = "Uncorrupted Eye of Terokk", expansion = 6, faction = "neutral"  },
        { id = 35671, questName = "A Gathering of Shadows", type = "quest", itemID = 258741, model3D = 968336, title = "Writings of Reshad the Outcast", expansion = 6, faction = "neutral"},
		}
    },
{ 
 name = "Stormheim ", 
		quests =	{
        { id = 38882, questName = "A New Life for Undeath", type = "quest", itemID = 245411, model3D = 6431407, title = "Dark Ship's Lantern", expansion = 7, faction = "horde"},
        { id = 39801, questName = "The Splintered Fleet", type = "quest", itemID = 253251, model3D = 1598111, title = "Blightfire Candle", expansion = 7, faction = "horde"},--durataur		
		}
    },	
{ 
 name = "Stormsong Valley", 
		quests =	{
        { id = 51401, questName = "Carry On", type = "quest", itemID = 252395, model3D = 1709395, title = "Brennadam Coop", expansion = 8, faction = "alliance"},
        { id = 50611, questName = "Storm's Vengeance", type = "quest", itemID = 252655, model3D = 7301013, title = "Copper Tidesage's Sconce", expansion = 8, faction = "alliance" },
        { id = 52122, questName = "To Be Forsaken", type = "quest", itemID = 245469, model3D = 2353882, title = "Lordaeron Lantern", expansion = 8, faction = "horde" },
        { id = 51986, questName = "Return to Zuldazar", type = "quest", itemID = 245473, model3D = 2341256, title = "Forsaken Studded Table", expansion = 8, faction = "horde" },
        { id = 50783, questName = "The Abyssal Council", type = "quest", itemID = 245984, model3D = 6988296, title = "Sagehold Window", expansion = 8, faction = "alliance"},		
		}
    },
{ 
 name = "Stormwind City",  
		quests =	{
        { id = 543, questName = "The Perenolde Tiara", type = "quest", itemID = 248662, model3D = 950140, title = "Jewelcrafter's Tent", expansion = 1, faction = "alliance" },
        { id = 59583, questName = "Welcome to Stormwind", type = "quest", itemID = 248336, model3D = 953804, title = "Stormwind Wooden Table", expansion = 9, faction = "alliance"},   

		}
    },
{ 
 name = "Suramar", 
		quests =	{
        { id = 44052, questName = "And They Will Tremble", type = "quest", itemID = 247914, model3D = 1361709, title = "Covered Ornate Suramar Table", expansion = 7, faction = "neutral" }, 
        { id = 41915, questName = "The Master's Legacy", type = "quest", itemID = 247917, model3D = 1361714, title = "Covered Small Suramar Table", expansion = 7, faction = "neutral"},  
        { id = 44955, questName = "Visitor in Shal'Aran", type = "quest", itemID = 245558, model3D = 6924250, title = "Elaborate Suramar Window", expansion = 7, faction = "neutral" },
        { id = 40321, questName = "Feathersong's Redemption", type = "quest", itemID = 245701, model3D = 1096883, title = "Elven Round Table", expansion = 7, faction = "neutral" },		
        { id = 42489, questName = "Thalyssra's Drawers", type = "quest", itemID = 248009, model3D = 1309274, title = "Suramar Window", expansion = 7, faction = "neutral" },
        { id = 44756, questName = "Sign of the Dusk Lily", type = "quest", itemID = 247842, model3D = 1352412, title = "Nightborne Merchant's Stall", expansion = 7, faction = "neutral" },
        { id = 43318, questName = "Ly'leth's Champion", type = "quest", itemID = 247911, model3D = 1361686, title = "Shal'dorei Seat", expansion = 7, faction = "neutral" },		
		}
    },
{ 
 name = "Talador", 
		quests =	{
        { id = 35685, questName = "Socrethar's Demise", type = "quest", itemID = 251653, model3D = 7273283, title = "Draenethyst Lamppost", expansion = 6, faction = "alliance"},
        { id = 34099, questName = "The Battle for Shattrath", type = "quest", itemID = 251640, model3D = 942422, title = "Draenic Forge", expansion = 6, faction = "alliance"},
        { id = 33582, questName = "Kura's Vengeance", type = "quest", itemID = 258742, model3D = 968424, title = "Scroll of the Adherent", expansion = 6, faction = "neutral"},
		{ id = 36685, questName = "Assault on the Heart of Shattrath", type = "quest", itemID = 251547, model3D = 915354, title = "Draenei Farmer's Trellis", expansion = 6, faction = "alliance"},
        { id = 38201, questName = "Missive: Assault on Shattrath Harbor", type = "quest", itemID = 241043, model3D = 875378, title = "Elodor Barrel", expansion = 6, faction = "alliance"},		
		}
    },
{ 
 name = "Thaldraszus", 
		quests =	{
        { id = 72935, questName = "Archives Return", type = "quest", itemID = 248651, model3D = 7141928, title = "Draconic Memorial Stone", expansion = 10, faction = "neutral" },
        { id = 70745, questName = "Enforced Relaxation", type = "quest", itemID = 256429, model3D = 3952854, title = "Valdrakken Lamppost", expansion = 10, faction = "neutral" },
		}
    },
{ 
 name = "The Azure Span", 
		quests =	{
        { id = 76597, questName = "On New Wings", type = "quest", itemID = 250912, model3D = 6892651, title = "Draconic Crafter's Forge", expansion = 10, faction = "neutral" },
        { id = 67047, questName = "Warm Away These Shivers", type = "quest", itemID = 246706, model3D = 4201172, title = "Elegant Dracthyr's Tea Cup", expansion = 10, faction = "neutral" },
        { id = 71097, questName = "A Helping Claw", type = "quest", itemID = 248653, model3D = 7141933, title = "Valdrakken Stone Stool", expansion = 10, faction = "neutral"  },
		}
    },
{ 
 name = "The Coiled Isle", 
		quests =	{
        { id = 95564, questName = "The Serpent's Tail", type = "quest", itemID = 271851, model3D = 7277199, title = "Oozing Vilescar Barricade", expansion = 12, faction = "neutral" },
		{ id = 96457, questName = "Last Promise", type = "quest", itemID = 271609, model3D = 7277186, title = "Destroyed Clutch of Ula'tek", expansion = 12, faction = "neutral" },
		{ id = 93339, questName = "Trinket Trading", type = "quest", itemID = 271176, model3D = 7277162, title = "Feathered Ula'tek Talisman", expansion = 12, faction = "neutral" },
		{ id = 92933, questName = "Haunted Shore", type = "quest", itemID = 279285, model3D = 1675098, title = "Lost Tortollan Scroll", expansion = 12, faction = "neutral" },
		{ id = 93420, questName = "Lor'themar's Judgement", type = "quest", itemID = 279292, model3D = 5933618, title = "Zul'Aman Pine Tree", expansion = 12, faction = "neutral" },
		{ id = 92930, questName = "Written by the Victors", type = "quest", itemID = 279452, model3D = 7498517, title = "Summoning of Ula'tek", expansion = 12, faction = "neutral" },
		{ id = 93418, questName = "The Venomous Abyss", type = "quest", itemID = 279508, model3D = 8117702, title = "The Hunger Awakens Mural", expansion = 12, faction = "neutral" },
		{ id = 96099, questName = "La'una's Fate", type = "quest", itemID = 280218, model3D = 1661561, title = "Tortollan Scholar Satchel", expansion = 12, faction = "neutral" },
		}
    },	
{ 
 name = "The Forbidden Reach", 
		quests =	{
        { id = 72515, category = "race", questName = "Augmenting a Dragon", type = "quest", itemID = 249549, model3D = 4528488, title = "Draconic Crafter's Table", expansion = 10, faction = "neutral", note = "Evoker Only" },
		}
    },
{ 
 name = "The Great Sea", 
		quests =	{
        { id = 52978, questName = "With Prince in Tow", type = "quest", itemID = 245470, model3D = 2470997, title = "Lordaeron Hanging Lantern", expansion = 8, faction = "horde"},
		}
    },
{ 
 name = "The Jade Forest", 
		quests =	{
        { id = 30000, questName = "The Jade Serpent", type = "quest", itemID = 264362, model3D = 576300, title = "Golden Pandaren Privacy Screen", expansion = 5, faction = "neutral" },
		{ id = 31230, questName = "Welcome to Dawn's Blossom", type = "quest", itemID = 247729, model3D = 519135, title = "Pandaren Stone Lamppost", expansion = 5, faction = "neutral" },
		}
    },
{ 
 name = "The Ringing Deeps", 
		quests =	{
		{ id = 82144, questName = "On the Road", type = "quest", itemID = 253040, model3D = 5248936, title = "Coreway Sentinel Lamppost", expansion = 11, faction = "neutral" },
        { id = 83160, questName = "Cinderbrew Reserve", type = "quest", itemID = 253172, model3D = 7262833, title = "Gundargaz Grand Keg", expansion = 11, faction = "neutral" },
        { id = 78642, questName = "New Candle, New Hope", type = "quest", itemID = 258264, model3D = 5169939, title = "Kobold Candle Trio", expansion = 11, faction = "neutral" },
        { id = 79510, questName = "The Wickless Candle", type = "quest", itemID = 258262, model3D = 5169937, title = "Kobold Digger's Chair", expansion = 11, faction = "neutral"},
        { id = 80516, questName = "Bump off the Boss", type = "quest", itemID = 258265, model3D = 5169958, title = "Kobold Wagon", expansion = 11, faction = "neutral"},
		{ id = 78761, questName = "Into the Machine", type = "quest", itemID = 253020, model3D = 4860701, title = "Earthen Etched Throne", expansion = 11, faction = "neutral" },
		}
    },
{ 
 name = "The Waking Shores", 
		quests =	{
        { id = 67063, questName = "10,000 Years of Roasting", type = "quest", itemID = 247223, model3D = 7109344, title = "Roast Riverbeast Platter", expansion = 10, faction = "neutral" },
		{ id = 66001, questName = "A Last Hope", type = "quest", itemID = 246863, model3D = 4298559, title = "Open Tome of the Dragon's Dedication", expansion = 10, faction = "neutral" },
		}
    },
{ 
 name = "Tiragarde Sound", 
		quests =	{
        { id = 55045, questName = "My Brother's Keeper", type = "quest", itemID = 252754, model3D = 1887706, title = "Seaworthy Boralus Bell", expansion = 8, faction = "alliance" },
        { id = 53887, questName = "War Marches On", type = "quest", itemID = 252400, model3D = 1852941, title = "Tiragarde Emblem", expansion = 8, faction = "alliance"},
        { id = 51984, questName = "Return to Zuldazar", type = "quest", itemID = 245465, model3D = 2341259, title = "Tirisfal Wooden Chair", expansion = 8, faction = "horde" },
        { id = 47489, questName = "Stow and Go", type = "quest", itemID = 252406, model3D = 2023436, title = "Green Boralus Market Tent", expansion = 8, faction = "alliance"},		
        { id = 48089, questName = "Mountain Sounds", type = "quest", itemID = 252392, model3D = 1602483, title = "Admiral's Chandelier", expansion = 8, faction = "alliance"},
        { id = 50972, questName = "Proudmoore's Parley", type = "quest", itemID = 252386, model3D = 1602427, title = "Admiralty's Upholstered Chair", expansion = 8, faction = "alliance"},	
        { id = 54992, questName = "The Start of Something Bigger", type = "quest", itemID = 246701, model3D = 1842929, title = "Gnomish Sprocket Table", expansion = 8, faction = "alliance"},		
		{ id = 53720, questName = "Allegiance of Kul Tiras", type = "quest", itemID = 252403, model3D = 1852975, title = "Admiral's Bed", expansion = 8, faction = "alliance", note = "Unlocks Kul Tiran"},	
		{ id = 51601, questName ="The Bridgeport Ride", type = "quest", itemID = 245466, model3D = 2341260, title = "Forsaken Spiked Chair", expansion = 8, faction = "horde" },		
		}
    },
{ 
 name = "Twilight Highlands", 
		quests =	{
        { id = 28244, questName = "Eye Spy", type = "quest", itemID = 246427, model3D = 391448, title = "Dilapidated Wildhammer Well", expansion = 4, faction = "alliance"},
        { id = 28655, questName = "Wild, Wild, Wildhammer Wedding", type = "quest", itemID = 246428, model3D = 392127, title = "Overgrown Wildhammer Fountain", expansion = 4, faction = "alliance"},
		}
    },
{ 
 name = "Undermine", 
		quests =	{
        { id = 87297, questName = "Cashing the Check", type = "quest", itemID = 243321, model3D = 5700691, title = "Cartel Head's Schmancy Desk", expansion = 11, faction = "neutral"},
		{ id = 86408, questName = "My Hole in the Wall", type = "quest", itemID = 245306, model3D = 5793099, title = "Cozy Four-Pipe Bed", expansion = 11, faction = "neutral"},
        { id = 85711, questName = "Unsolicited Feedback", type = "quest", itemID = 245325, model3D = 5689844, title = "Undermine Market Stall", expansion = 11, faction = "neutral" },		
        { id = 87008, questName = "Ad-Hoc Wedding Planner", type = "quest", itemID = 245308, model3D = 5793083, title = "\"Elegant\" Lawn Flamingo", expansion = 11, faction = "neutral" },
        { id = 84675, questName = "Showdown in the Attic", type = "quest", itemID = 260700, model3D = 5689810, title = "Gob-chanical Trash Heap", expansion = 11, faction = "neutral" },
        { id = 83176, questName = "Just a Hunch", type = "quest", itemID = 245310, model3D = 5793102, title = "Reinforced Goblin Umbrella", expansion = 11, faction = "neutral"},
        { id = 85780, questName = "Right Where We Want Him", type = "quest", itemID = 245303, model3D = 5900860, title = "Rocket-Unpowered Rocket", expansion = 11, faction = "neutral" },		
		}
    },
{ 
 name = "Valdrakken", 
		quests =	{
        { id = 70880, questName = "To Cook With Finery", type = "quest", itemID = 248655, model3D = 7141935, title = "Elegant Dracthyr's Tea Set", expansion = 10, faction = "neutral" },
		}
    },
{ 
 name = "Valley of the Four Winds", 
		quests =	{
        { id = 30526, questName = "Lost and Lonely", type = "quest", itemID = 248663, model3D = 955690, title = "Wooden Doghouse", expansion = 7, faction = "neutral" },
		}
    },
{ 
 name = "Val'sharah", 
		quests =	{
        { id = 40890, questName = "The Tears of Elune", type = "quest", itemID = 245739, model3D = 1096777, title = "Crescent Moon Lamppost", expansion = 7, faction = "neutral"  }, 
        { id = 38663, questName = "The Die is Cast", type = "quest", itemID = 245700, model3D = 7508794, title = "Kaldorei Cushioned Seat", expansion = 7, faction = "neutral"  },
        { id = 40573, questName = "The Nightmare Lord", type = "quest", itemID = 245698, model3D = 1096764, title = "Kaldorei Stone Fence", expansion = 7, faction = "neutral" },
        { id = 38147, questName = "Entangled Dreams", type = "quest", itemID = 245702, model3D = 1128060, title = "Kaldorei Wall Shelf", expansion = 7, faction = "neutral" }, 	
        { id = 42751, questName = "Moon Reaver", type = "quest", itemID = 245258, model3D = 1096759, title = "Val'sharah Bookcase", expansion = 7, faction = "neutral" },  
        { id = 39117, questName = "Shriek No More", type = "quest", itemID = 245615, model3D = 6930894, title = "Bradensbrook Smoke Lantern", expansion = 7, faction = "neutral" },
        { id = 46107, questName = "Source of the Corruption", type = "quest", itemID = 245616, model3D = 6930897, title = "Bradensbrook Thorned Well", expansion = 7, faction = "neutral", category = "spec", note = "Healing Artificat Quest so any healing spec" },					
		}
    },
{ 
 name = "Voidstorm", 
		quests =	{
		{ id = 86513, questName = "Face the Tide", type = "quest", itemID = 262351, model3D = 6700982, title = "Ornate Cosmic Rug", expansion = 12, faction = "neutral" },
		{ id = 86541, questName = "Just In Case...", type = "quest", itemID = 267209, model3D = 6701003, title = "Open Void Elf Bedroll", expansion = 12, faction = "neutral" },		
		{ id = 88706, questName = "Nothing Stands Forever", type = "quest", itemID = 264660, model3D = 6701018, title = "Ren'dorei Spired Tent", expansion = 12, faction = "neutral" },--15895
		{ id = 86521, questName = "Nexus-Point Xenas: Eclipse", type = "quest", itemID = 262606, model3D = 6700978, title = "Smoldering Energy Forge", expansion = 12, faction = "neutral" },--14631
		{ id = 88700, questName = "Two Tons of Metal and Holy Fire", type = "quest", itemID = 262610, model3D = 6701008, title = "Swirling Ritual Pedestal", expansion = 12, faction = "neutral" },
	    { id = 86516, questName = "All Become Prey", type = "quest", itemID = 267082, model3D = 6885569, title = "Ornate Cosmic Table", expansion = 12, faction = "neutral" },		
		{ id = 86557, questName = "A Matter of Strife and Death", type = "quest", itemID = 264508, model3D = 6700991, title = "Sturdy Void Elf Barricade", expansion = 12, faction = "neutral" },
		{ id = 86561, questName = "A Strange, Different World", type = "quest", itemID = 262472, model3D = 7412672, title = "Cosmic Kettle", expansion = 12, faction = "neutral" },
		{ id = 86530, questName = "First, The Shells", type = "quest", itemID = 264657, model3D = 6701010, title = "Open Sturdy Void Elf Trunk", expansion = 12, faction = "neutral" },
		{ id = 86512, questName = "The Harvest", type = "quest", itemID = 264659, model3D = 6701014, title = "Cosmic Traveler's Satchel", expansion = 12, faction = "neutral" },
		{ id = 86540, questName = "Third, Blow It Up", type = "quest", itemID = 264340, model3D = 6391988, title = "Cosmic Barrel", expansion = 12, faction = "neutral" },
		{ id = 86531, questName = "Work Disruption", type = "quest", itemID = 263240, model3D = 6701011, title = "Sturdy Void Elf Crate", expansion = 12, faction = "neutral" },	
		}
    },
{ 
 name = "Vol'dun", 
		quests =	{
        { id = 47874, questName = "Clearing the Fog", type = "quest", itemID = 245417, model3D = 6877803, title = "Akunda the Tapestry", expansion = 8, faction = "horde"},
		{ id = 48554, questName = "The Source of the Problem", type = "quest", itemID = 245263, model3D = 1707340, title = "Zocalo Drinks", expansion = 8, faction = "horde" },
		
		{ id = 51364, questName = "An Explosive Exit", type = "quest", itemID = 283343, model3D = 1674721, title = "Ornate Vulpera Caravan", expansion = 8, faction = "horde" },
		{ id = 49676, questName = "Dressed for Battle", type = "quest", itemID = 283269, model3D = 3154166, title = "Vulpera War Banner", expansion = 8, faction = "horde" },
		}
    },
{ 
 name = "Westfall", 
		quests =	{
        { id = 26229, questName = "\"I TAKE Candle!\"", type = "quest", itemID = 248797, model3D = 936393, title = "City Wanderer's Candleholder", expansion = 4, faction = "alliance" },
        { id = 26297, questName = "The Dawning of a New Day", type = "quest", itemID = 248801, model3D = 4618938, title = "Stormwind Weapon Rack", expansion = 4, faction = "alliance" },
        { id = 26270, questName = "You Have Our Thanks", type = "quest", itemID = 248618, model3D = 949210, title = "Westfall Woven Basket", expansion = 4, faction = "alliance"},
		}
    },
{ 
 name = "Zul'Aman", 
		quests =	{
		{ id = 91087, questName = "Reports Returned", type = "quest", itemID = 256928, model3D = 6212436, title = "Banner of the Amani Tribe", expansion = 12, faction = "neutral" },
		{ id = 86681, questName = "Den of Nalorakk: A Taste of Vengeance", type = "quest", itemID = 264479, model3D = 6212406, title = "Skyweave Amani Tapestry", expansion = 12, faction = "neutral" },
		{ id = 86660, questName = "Rescue from the Shadows", type = "quest", itemID = 253469, model3D = 6195750, title = "Ritual-Cursed Sarcophagus", expansion = 12, faction = "neutral" },
		{ id = 86693, questName = "De Legend of de Hash'ey", type = "quest", itemID = 255648, model3D = 6195754, title = "Zul'Aman Ancestral Fountain", expansion = 12, faction = "neutral" },
		{ id = 86663, questName = "Embers to a Flame", type = "quest", itemID = 264715, model3D = 6075575, title = "Zul'Aman Flame Cradle", expansion = 12, faction = "neutral" },
		{ id = 94531, questName = "Like Mother, Like Son", type = "quest", itemID = 278691, model3D = 5975164, title = "Twilight Brazier", expansion = 12, faction = "neutral" },
		{ id = 86654, questName = "Gnarldin Bashing", type = "quest", itemID = 264255, model3D = 6212416, title = "Amani Trophy Frame", expansion = 12, faction = "neutral" },
		{ id = 86711, questName = "Amani Clarion Call", type = "quest", itemID = 264334, model3D = 6153822, title = "Amani War Drum", expansion = 12, faction = "neutral" },
		{ id = 86712, questName = "The Amani Stand Strong", type = "quest", itemID = 264257, model3D = 6212430, title = "Zul'Aman Armament Rest", expansion = 12, faction = "neutral" },
		
	    { id = 95200, questName = "An Offering For Halazzi", type = "quest", itemID = 279067, model3D = 6935592, title = "Symbol of Halazzi", expansion = 12, faction = "neutral" },
        { id = 95203, questName = "The Ties That Bind", type = "quest", itemID = 264718, model3D = 6195764, title = "Amani Fishing Canoe", expansion = 12, faction = "neutral" },	
		}
    },	
{ 
 name = "Zuldazar", 
		quests =	{
        { id = 46931, questName = "Speaker of the Horde", type = "quest", itemID = 239606, model3D = 2620663, title = "Forsaken Round Rug", expansion = 8, faction = "horde" },
        { id = 50963, questName = "Of Dark Deeds and Dark Days", type = "quest", itemID = 245485, model3D = 2098556, title = "Golden Zandalari Bed", expansion = 8, faction = "horde"},
        { id = 47432, questName = "The Bargain is Struck", type = "quest", itemID = 245486, model3D = 1597478, title = "Tired Troll's Bench", expansion = 8, faction = "horde"},
        { id = 47741, questName = "To Sacrifice a Loa", type = "quest", itemID = 245493, model3D = 1888157, title = "Idol of Rezan, Loa of Kings", expansion = 8, faction = "horde" },	
		}
    },
}
-------------------------------------------------
-- PROFESSIONS
-------------------------------------------------
DVD.professions = DVD.professions or {}

DVD.professions = {
  {
    name = "Junkyard Tinkering",
    items = {
      { id = 246596, expansion = 8, model3D= 1841734, spell = 1243780, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 166846, amount = 100}} },
      { id = 246595, expansion = 8, model3D= 1841733, spell = 1243783, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 166846, amount = 150}} },
      { id = 246485, expansion = 8, model3D= 2851774, spell = 1243803, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 3}, {id = 166970, amount = 9}} },
      { id = 246606, expansion = 8, model3D= 2967733, spell = 1243801, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 2}, {id = 166970, amount = 3}, {id = 168832, amount = 1}} },
      { id = 246482, expansion = 8, model3D= 1841735, spell = 1243788, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 1}, {id = 166970, amount = 1}} },
      { id = 246597, expansion = 8, model3D= 1842225, spell = 1243793, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 2}} },
    }
  },
  {
    name = "Alchemy", --33
    items = {
{ id = 262355, expansion = 12, model3D = 6701005, spell = 1233132, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236952, amount = 2}, {id = 256963, amount = 12}, {id = 241281, amount = 4}, {id = 241283, amount = 1}} }, 
{ id = 253506, expansion = 12, model3D = 6865595, spell = 1233133, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236950, amount = 6}, {id = 256963, amount = 16}, {id = 241281, amount = 4}, {id = 241283, amount = 4}} }, 
{ id = 256356, expansion = 12, model3D = 6024532, spell = 1233135, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236949, amount = 1}, {id = 256963, amount = 6}, {id = 241281, amount = 4}} }, 
{ id = 262354, expansion = 12, model3D = 6700987, spell = 1233136, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236952, amount = 2}, {id = 256963, amount = 4}, {id = 241281, amount = 4}} }, 
{ id = 262356, expansion = 12, model3D = 6796712, spell = 1233137, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236950, amount = 1}, {id = 256963, amount = 4}, {id = 241281, amount = 4}} }, 
{ id = 257420, expansion = 12, model3D = 6023421, spell = 1233138, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236951, amount = 6}, {id = 236950, amount = 6}, {id = 256963, amount = 20}, {id = 241281, amount = 4}, {id = 241283, amount = 4}} }, 
{ id = 252758, expansion = 11, model3D = 5389585, spell = 1259673, skill = "Khaz Algar Alchemy", skillNeeded = 80, reagents = {{id = 248012, amount = 34}, {id = 221758, amount = 4}, {id = 226205, amount = 12}, {id = 213610, amount = 6}, {id = 212563, amount = 1}} }, 
{ id = 244318, expansion = 6, model3D = 987248, spell = 1260985, skill = "Warlords of Draenor Alchemy", skillNeeded = 80, reagents = {{id = 251766, amount = 16}, {id = 113262, amount = 6}, {id = 117454, amount = 6}, {id = 108996, amount = 10}} }, 
{ id = 257043, expansion = 5, model3D = 528627, spell = 1261233, skill = "Mists of Pandaria Alchemy", skillNeeded = 60, reagents = {{id = 251763, amount = 6}, {id = 72096, amount = 6}, {id = 72237, amount = 8}, {id = 76061, amount = 2}} }, 
{ id = 245517, expansion = 4, model3D = 304249, spell = 1261255, skill = "Cataclysm Alchemy", skillNeeded = 60, reagents = {{id = 251764, amount = 30}, {id = 54849, amount = 16}, {id = 52326, amount = 40}, {id = 56850, amount = 6}, {id = 69237, amount = 1}} }, 
{ id = 257041, expansion = 1, model3D = 243479, spell = 1261495, skill = "Classic Alchemy", skillNeeded = 240, reagents = {{id = 245586, amount = 10}, {id = 20520, amount = 2}, {id = 2325, amount = 2}, {id = 3371, amount = 1}} }, 
{ id = 257102, expansion = 11, model3D = 5201694, spell = 1261878, skill = "Khaz Algar Alchemy", skillNeeded = 80, reagents = {{id = 248012, amount = 8}, {id = 221763, amount = 2}, {id = 211806, amount = 1}, {id = 212245, amount = 3}} }, 
{ id = 257052, expansion = 10, model3D = 4240488, spell = 1261882, skill = "Dragonflight Alchemy", skillNeeded = 80, reagents = {{id = 251773, amount = 7}, {id = 194874, amount = 1}, {id = 191474, amount = 1}, {id = 191384, amount = 3}} }, 
{ id = 248111, expansion = 10, model3D = 4204641, spell = 1261885, skill = "Dragonflight Alchemy", skillNeeded = 80, reagents = {{id = 251773, amount = 28}, {id = 190316, amount = 4}, {id = 191496, amount = 6}, {id = 190312, amount = 3}, {id = 192883, amount = 6}} }, 
{ id = 257050, expansion = 9, model3D = 3158888, spell = 1261958, skill = "Shadowlands Alchemy", skillNeeded = 140, reagents = {{id = 251772, amount = 12}, {id = 171292, amount = 3}, {id = 177061, amount = 2}, {id = 173170, amount = 2}} }, 
{ id = 257051, expansion = 9, model3D = 3184576, spell = 1261972, skill = "Shadowlands Alchemy", skillNeeded = 140, reagents = {{id = 251772, amount = 9}, {id = 171289, amount = 4}, {id = 183953, amount = 6}, {id = 173202, amount = 2}} }, 
{ id = 257046, expansion = 8, model3D = 2026782, spell = 1262005, skill = "Battle for Azeroth Alchemy", skillNeeded = 140, reagents = {{id = 251768, amount = 5}, {id = 3371, amount = 1}, {id = 152511, amount = 8}, {id = 152576, amount = 4}} }, 
{ id = 257044, expansion = 6, model3D = 984595, spell = 1262011, skill = "Warlords of Draenor Alchemy", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 127759, amount = 15}, {id = 109119, amount = 10}, {id = 108996, amount = 20}} },
{ id = 257047, expansion = 8, model3D = 2026876, spell = 1262151, skill = "Battle for Azeroth Alchemy", skillNeeded = 140, reagents = {{id = 251768, amount = 12}, {id = 3371, amount = 3}, {id = 152510, amount = 3}} }, 
{ id = 257045, expansion = 7, model3D = 1309272, spell = 1262152, skill = "Legion Alchemy", skillNeeded = 80, reagents = {{id = 251767, amount = 18}, {id = 124440, amount = 12}, {id = 124105, amount = 2}, {id = 127835, amount = 5}} }, 
{ id = 256680, expansion = 7, model3D = 1363069, spell = 1262154, skill = "Legion Alchemy", skillNeeded = 80, reagents = {{id = 251767, amount = 50}, {id = 124461, amount = 25}, {id = 124106, amount = 5}, {id = 127835, amount = 15}, {id = 127838, amount = 20}} }, 
{ id = 257100, expansion = 1, model3D = 7658442, spell = 1262829, skill = "Classic Alchemy", skillNeeded = 240, reagents = {{id = 245586, amount = 40}, {id = 12808, amount = 16}, {id = 12360, amount = 12}, {id = 13468, amount = 8}, {id = 3371, amount = 6}} }, 
{ id = 258214, expansion = 5, model3D = 528655, spell = 1263548, skill = "Mists of Pandaria Alchemy", skillNeeded = 60, reagents = {{id = 251763, amount = 16}, {id = 72234, amount = 12}, {id = 76098, amount = 5}, {id = 72238, amount = 3}, {id = 3371, amount = 1}} }, 
{ id = 258212, expansion = 3, model3D = 243528, spell = 1263558, skill = "Wrath of the Lich King Alchemy", skillNeeded = 60, reagents = {{id = 251762, amount = 20}, {id = 36905, amount = 10}, {id = 35627, amount = 4}, {id = 36908, amount = 3}, {id = 3371, amount = 1}} }, 
{ id = 258213, expansion = 3, model3D = 243545, spell = 1263559, skill = "Wrath of the Lich King Alchemy", skillNeeded = 60, reagents = {{id = 251762, amount = 40}, {id = 40077, amount = 5}, {id = 33447, amount = 10}, {id = 36908, amount = 5}, {id = 35625, amount = 2}, {id = 43102, amount = 1}} },
{ id = 257694, expansion = 4, model3D = 304700, spell = 1269506, skill = "Cataclysm Alchemy", skillNeeded = 60, reagents = {{id = 251764, amount = 10}, {id = 52329, amount = 5}, {id = 52988, amount = 5}, {id = 52985, amount = 3}, {id = 3371, amount = 1}} },
{ id = 264705, expansion = 2, model3D = 191966, spell = 1272712, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 6}, {id = 34440, amount = 5}, {id = 23449, amount = 4}, {id = 3371, amount = 1}} }, 
{ id = 264709, expansion = 2, model3D = 198443, spell = 1272715, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 8}, {id = 3820, amount = 10}, {id = 21840, amount = 4}} }, 
{ id = 264706, expansion = 2, model3D = 192707, spell = 1272723, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 16}, {id = 22861, amount = 4}, {id = 23573, amount = 3}, {id = 21884, amount = 4}} }, 
{ id = 264900, expansion = 2, model3D = 191826, spell = 1273064, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 10}, {id = 22789, amount = 5}, {id = 22785, amount = 3}, {id = 3371, amount = 1}} }, 
{ id = 264899, expansion = 2, model3D = 191825, spell = 1273070, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 15}, {id = 22794, amount = 2}, {id = 22793, amount = 7}, {id = 22791, amount = 6}, {id = 3371, amount = 1}} }, 
{ id = 279359, expansion = 12, model3D = 7880108, spell = 1296429, skill = "Midnight Alchemy", skillNeeded = 50, reagents = {{id = 274777, amount = 6}, {id = 236950, amount = 6}, {id = 256963, amount = 6}, {id = 241281, amount = 4}} },   

{ id = 284552, expansion = 9, model3D = 3154975, spell = 1316323, skill = "Shadowlands Alchemy", skillNeeded = 140, reagents = {{id = 251772, amount = 5}, {id = 171292, amount = 5}, {id = 171289, amount = 5}, {id = 3371, amount = 2}} },
    }
  },
  {
    name = "Blacksmithing", -- 36
    items = {
{ id = 245312, expansion = 11, model3D = 5689818, spell = 1259675, skill = "Khaz Algar Blacksmithing", skillNeeded = 80, reagents = {{id = 248012, amount = 15}, {id = 221853, amount = 4}, {id = 222417, amount = 5}} }, 
{ id = 245323, expansion = 11, model3D = 5788112, spell = 1259681, skill = "Khaz Algar Blacksmithing", skillNeeded = 80, reagents = {{id = 248012, amount = 30}, {id = 222523, amount = 1}, {id = 222420, amount = 1}, {id = 222417, amount = 5}, {id = 221856, amount = 1}} }, 
{ id = 252397, expansion = 8, model3D = 1733921, spell = 1260691, skill = "Battle for Azeroth Blacksmithing", skillNeeded = 140, reagents = {{id = 251768, amount = 18}, {id = 152579, amount = 20}, {id = 154898, amount = 15}} }, 
{ id = 252399, expansion = 8, model3D = 1852119, spell = 1260692, skill = "Battle for Azeroth Blacksmithing", skillNeeded = 140, reagents = {{id = 251768, amount = 20}, {id = 152579, amount = 25}, {id = 160298, amount = 10}} }, 
{ id = 247922, expansion = 7, model3D = 1408526, spell = 1260693, skill = "Legion Blacksmithing", skillNeeded = 80, reagents = {{id = 251767, amount = 15}, {id = 124461, amount = 10}, {id = 124441, amount = 1}} }, 
{ id = 247909, expansion = 7, model3D = 1360361, spell = 1260695, skill = "Legion Blacksmithing", skillNeeded = 80, reagents = {{id = 251767, amount = 10}, {id = 124461, amount = 5}, {id = 124441, amount = 1}} }, 
{ id = 245408, expansion = 7, model3D = 6877807, spell = 1260698, skill = "Legion Blacksmithing", skillNeeded = 80, reagents = {{id = 251767, amount = 35}, {id = 124461, amount = 20}, {id = 133588, amount = 3}, {id = 124109, amount = 5}, {id = 133591, amount = 3}, {id = 133589, amount = 3}} },
{ id = 245600, expansion = 6, model3D = 6905311, spell = 1260987, skill = "Warlords of Draenor Blacksmithing", skillNeeded = 80, reagents = {{id = 251766, amount = 45}, {id = 109119, amount = 50}, {id = 113261, amount = 25}, {id = 120945, amount = 5}, {id = 109118, amount = 25}} }, 
{ id = 245436, expansion = 6, model3D = 1005512, spell = 1260988, skill = "Warlords of Draenor Blacksmithing", skillNeeded = 80, reagents = {{id = 251766, amount = 40}, {id = 109118, amount = 30}, {id = 110609, amount = 15}, {id = 118472, amount = 5}} }, 
{ id = 247752, expansion = 5, model3D = 6431405, spell = 1261234, skill = "Mists of Pandaria Blacksmithing", skillNeeded = 60, reagents = {{id = 251763, amount = 40}, {id = 72095, amount = 35}, {id = 76061, amount = 6}} },
{ id = 247661, expansion = 5, model3D = 520142, spell = 1261235, skill = "Mists of Pandaria Blacksmithing", skillNeeded = 60, reagents = {{id = 251763, amount = 25}, {id = 72104, amount = 3}, {id = 80433, amount = 4}, {id = 3857, amount = 5}} }, 
{ id = 257042, expansion = 4, model3D = 304141, spell = 1261256, skill = "Cataclysm Blacksmithing", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 52186, amount = 12}, {id = 52327, amount = 6}} }, 
{ id = 257040, expansion = 3, model3D = 242964, spell = 1261327, skill = "Wrath of the Lich King Blacksmithing", skillNeeded = 60, reagents = {{id = 251762, amount = 40}, {id = 37663, amount = 8}, {id = 45087, amount = 6}, {id = 35624, amount = 4}} }, 
{ id = 257035, expansion = 2, model3D = 192356, spell = 1261347, skill = "The Burning Crusade Blacksmithing", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23449, amount = 8}, {id = 22452, amount = 4}, {id = 21845, amount = 2}} }, 
{ id = 257039, expansion = 2, model3D = 538413, spell = 1261359, skill = "The Burning Crusade Blacksmithing", skillNeeded = 60, reagents = {{id = 242691, amount = 50}, {id = 23573, amount = 8}, {id = 23449, amount = 10}, {id = 21884, amount = 10}, {id = 25868, amount = 2}} }, 
{ id = 257036, expansion = 2, model3D = 192362, spell = 1261383, skill = "The Burning Crusade Blacksmithing", skillNeeded = 60, reagents = {{id = 242691, amount = 25}, {id = 23573, amount = 4}, {id = 23449, amount = 6}, {id = 22452, amount = 4}} }, 
{ id = 246111, expansion = 1, model3D = 6995868, spell = 1261497, skill = "Classic Blacksmithing", skillNeeded = 240, reagents = {{id = 245586, amount = 10}, {id = 11371, amount = 12}, {id = 17011, amount = 4}, {id = 14344, amount = 2}} }, 
{ id = 246489, expansion = 1, model3D = 7014377, spell = 1261499, skill = "Classic Blacksmithing", skillNeeded = 240, reagents = {{id = 245586, amount = 20}, {id = 11371, amount = 20}, {id = 12360, amount = 8}, {id = 12810, amount = 4}} }, 
{ id = 256430, expansion = 10, model3D = 4695276, spell = 1261892, skill = "Dragonflight Blacksmithing", skillNeeded = 80, reagents = {{id = 251773, amount = 46}, {id = 204634, amount = 1}, {id = 193922, amount = 4}, {id = 190312, amount = 9}, {id = 191363, amount = 5}} }, 
{ id = 256427, expansion = 10, model3D = 3883456, spell = 1261896, skill = "Dragonflight Blacksmithing", skillNeeded = 80, reagents = {{id = 251773, amount = 42}, {id = 189541, amount = 12}, {id = 192849, amount = 1}, {id = 192843, amount = 1}, {id = 192846, amount = 1}, {id = 192837, amount = 1}, {id = 192840, amount = 1}} }, 
{ id = 257049, expansion = 9, model3D = 3153975, spell = 1261980, skill = "Shadowlands Blacksmithing", skillNeeded = 80, reagents = {{id = 251772, amount = 8}, {id = 171832, amount = 3}, {id = 171828, amount = 5}, {id = 173109, amount = 1}, {id = 173171, amount = 1}} }, 
{ id = 257048, expansion = 9, model3D = 3022762, spell = 1261982, skill = "Shadowlands Blacksmithing", skillNeeded = 80, reagents = {{id = 251772, amount = 45}, {id = 172437, amount = 15}, {id = 171828, amount = 20}, {id = 173060, amount = 20}, {id = 173173, amount = 5}} }, 
{ id = 257409, expansion = 4, model3D = 311627, spell = 1262308, skill = "Cataclysm Blacksmithing", skillNeeded = 60, reagents = {{id = 251764, amount = 35}, {id = 54849, amount = 20}, {id = 52193, amount = 8}, {id = 52078, amount = 4}} }, 
{ id = 264710, expansion = 3, model3D = 243135, spell = 1272614, skill = "Wrath of the Lich King Blacksmithing", skillNeeded = 60, reagents = {{id = 251762, amount = 8}, {id = 37663, amount = 4}, {id = 36860, amount = 3}} }, 
{ id = 264676, expansion = 3, model3D = 243143, spell = 1272662, skill = "Wrath of the Lich King Blacksmithing", skillNeeded = 60, reagents = {{id = 251762, amount = 30}, {id = 37663, amount = 6}, {id = 45087, amount = 4}, {id = 35622, amount = 2}} }, 
{ id = 262451, expansion = 12, model3D = 6033614, spell = 1276108, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, 
{ id = 262456, expansion = 12, model3D = 6209622, spell = 1276109, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 238197, amount = 12}, {id = 238202, amount = 3}, {id = 238204, amount = 3}, {id = 247725, amount = 1}} }, 
{ id = 262457, expansion = 12, model3D = 6209623, spell = 1276110, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 238197, amount = 12}, {id = 238202, amount = 3}, {id = 238204, amount = 3}, {id = 247725, amount = 1}} }, 
{ id = 262460, expansion = 12, model3D = 6700980, spell = 1276111, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, 
{ id = 262452, expansion = 12, model3D = 6033619, spell = 1276112, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 238197, amount = 8}, {id = 238202, amount = 2}, {id = 238204, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 263709, expansion = 12, model3D = 6125155, spell = 1296495, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 16}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, 
{ id = 275305, expansion = 12, model3D = 6212428, spell = 1296496, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 238197, amount = 8}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, 
{ id = 279329, expansion = 12, model3D = 6212431, spell = 1296497, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 16}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} },

{ id = 282124, expansion = 7, model3D = 1608421, spell = 1313521, skill = "Legion Blacksmithing", skillNeeded = 85, reagents = {{id = 251767, amount = 12}, {id = 124461, amount = 3}, {id = 151564, amount = 50}} },
{ id = 283260, expansion = 9, model3D = 3429594, spell = 1315292, skill = "Shadowlands Blacksmithing", skillNeeded = 85, reagents = {{id = 171833, amount = 6}, {id = 180733, amount = 3}, {id = 171831, amount = 20}, {id = 251772, amount = 8}} },
{ id = 283303, expansion = 8, model3D = 2013143, spell = 1315468, skill = "Battle for Azeroth Blacksmithing", skillNeeded = 140, reagents = {{id = 251768, amount = 5}, {id = 152579, amount = 5}, {id = 152512, amount = 10}, {id = 180733, amount = 5}} }, 
    }
  },
  {
    name = "Cooking", --11
    items = {
      { id = 247220, expansion = 5, model3D= 643880, spell = 1266563, skill = "Mists of Pandaria Cooking", skillNeeded = 60, reagents = {{id = 251763, amount = 10}, {id = 74662, amount = 1}, {id = 74853, amount = 1}, {id = 74839, amount = 10}, {id = 74845, amount = 10}, {id = 74843, amount = 50}, {id = 259894, amount = 10}} },
      { id = 245428, expansion = 6, model3D= 960868, spell = 1266560, skill = "Warlords of Draenor Cooking", skillNeeded = 80, recipe = 260556, reagents = {{id = 251766, amount = 8}, {id = 109119, amount = 10}, {id = 111449, amount = 5}, {id = 115352, amount = 5}, {id = 259894, amount = 5}} },
      { id = 245484, expansion = 8, model3D= 1852909, spell = 1260337, skill = "Battle for Azeroth Cooking", skillNeeded = 140, reagents = {{id = 251768, amount = 8}, {id = 152579, amount = 4}, {id = 154886, amount = 5}, {id = 160711, amount = 2}, {id = 259894, amount = 5}} },
      { id = 246705, expansion = 9, model3D= 3870812, spell = 1260334, skill = "Shadowlands Cooking", skillNeeded = 60, reagents = {{id = 251772, amount = 8}, {id = 171829, amount = 4}, {id = 172049, amount = 5}, {id = 172055, amount = 6}, {id = 259894, amount = 5}} },
      { id = 247225, expansion = 10, model3D= 7109346, spell = 1260333, skill = "Dragonflight Cooking", skillNeeded = 80, reagents = {{id = 251773, amount = 25}, {id = 197745, amount = 2}, {id = 197774, amount = 3}, {id = 197776, amount = 4}, {id = 259894, amount = 15}, {id = 190312, amount = 4}} },
      { id = 247222, expansion = 10, model3D= 7109343, spell = 1266555, skill = "Dragonflight Cooking", skillNeeded = 80, reagents = {{id = 251773, amount = 28}, {id = 197764, amount = 5}, {id = 197788, amount = 4}, {id = 259894, amount = 15}, {id = 189143, amount = 10}} },
      { id = 247224, expansion = 10, model3D= 7109345, spell = 1260331, skill = "Dragonflight Cooking", skillNeeded = 80, reagents = {{id = 251773, amount = 22}, {id = 200953, amount = 5}, {id = 197756, amount = 6}, {id = 259894, amount = 15}, {id = 190312, amount = 4}} },
      { id = 239170, expansion = 11, model3D= 5203802, spell = 1245993, skill = "Khaz Algar Cooking", skillNeeded = 80, recipe = 248013, reagents = {{id = 248012, amount = 15}, {id = 212508, amount = 2}, {id = 222737, amount = 25}, {id = 259894, amount = 10}, {id = 210930, amount = 15}, {id = 210933, amount = 5}, {id = 210936, amount = 5}} },
      { id = 246708, expansion = 11, model3D= 5203791, spell = 1245995, skill = "Khaz Algar Cooking", skillNeeded = 80, reagents = {{id = 248012, amount = 10}, {id = 222739, amount = 10}, {id = 259894, amount = 10}, {id = 210930, amount = 10}, {id = 210936, amount = 5}} },
      { id = 246709, expansion = 11, model3D= 5203794, spell = 1245994, skill = "Khaz Algar Cooking", skillNeeded = 80, reagents = {{id = 248012, amount = 5}, {id = 222737, amount = 10}, {id = 259894, amount = 5}, {id = 210930, amount = 8}} },
      { id = 245326, expansion = 11, model3D= 5650143, spell = 1266541, skill = "Khaz Algar Cooking", skillNeeded = 80, reagents = {{id = 248012, amount = 25}, {id = 221754, amount = 4}, {id = 223971, amount = 1}, {id = 222705, amount = 2}, {id = 222731, amount = 2}, {id = 259894, amount = 15}} },
    }
  },
  {
    name = "Enchanting", --39
    items = {
{ id = 262458, expansion = 12, model3D = 6427291, spell = 1246902, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 243060, amount = 10}, {id = 256963, amount = 6}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 238204, amount = 6}} }, 
{ id = 262468, expansion = 12, model3D = 6861008, spell = 1246903, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 236952, amount = 10}, {id = 245881, amount = 20}, {id = 256963, amount = 8}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 242788, amount = 5}} }, 
{ id = 262450, expansion = 12, model3D = 6024551, spell = 1246904, skill = "Midnight Enchanting", skillNeeded = 80, reagents = {{id = 251665, amount = 50}, {id = 256963, amount = 12}, {id = 243599, amount = 30}, {id = 243602, amount = 5}, {id = 243605, amount = 5}} }, 
{ id = 262455, expansion = 12, model3D = 6033624, spell = 1246905, skill = "Midnight Enchanting", skillNeeded = 80, reagents = {{id = 236951, amount = 10}, {id = 245882, amount = 10}, {id = 256963, amount = 6}, {id = 243599, amount = 30}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 242788, amount = 5}} }, 
{ id = 262459, expansion = 12, model3D = 6427292, spell = 1246906, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 243060, amount = 10}, {id = 256963, amount = 6}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 238204, amount = 6}} }, 
{ id = 262470, expansion = 12, model3D = 7009238, spell = 1246907, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 236949, amount = 10}, {id = 245881, amount = 20}, {id = 256963, amount = 10}, {id = 243599, amount = 20}, {id = 243602, amount = 10}, {id = 243605, amount = 3}} }, 
{ id = 262590, expansion = 12, model3D = 4928309, spell = 1246908, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 236950, amount = 10}, {id = 256963, amount = 16}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 236774, amount = 10}} }, 
{ id = 246693, expansion = 12, model3D = 7033362, spell = 1246909, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 243602, amount = 10}, {id = 243605, amount = 5}, {id = 242787, amount = 5}} }, 
{ id = 253171, expansion = 11, model3D = 7262810, spell = 1259690, skill = "Khaz Algar Enchanting", skillNeeded = 80, reagents = {{id = 248012, amount = 40}, {id = 221754, amount = 6}, {id = 213610, amount = 5}, {id = 219952, amount = 8}, {id = 221859, amount = 6}} }, 
{ id = 253039, expansion = 11, model3D = 5149702, spell = 1259715, skill = "Khaz Algar Enchanting", skillNeeded = 80, reagents = {{id = 248012, amount = 10}, {id = 219949, amount = 4}, {id = 222417, amount = 2}, {id = 224108, amount = 2}} }, 
{ id = 247923, expansion = 7, model3D = 1408528, spell = 1260700, skill = "Legion Enchanting", skillNeeded = 80, reagents = {{id = 251767, amount = 34}, {id = 124442, amount = 16}, {id = 124461, amount = 10}, {id = 124124, amount = 2}} }, 
{ id = 245601, expansion = 6, model3D = 6905328, spell = 1260990, skill = "Warlords of Draenor Enchanting", skillNeeded = 80, reagents = {{id = 251766, amount = 30}, {id = 113588, amount = 12}, {id = 113261, amount = 8}, {id = 113263, amount = 4}} }, 
{ id = 251655, expansion = 6, model3D = 7280505, spell = 1261008, skill = "Warlords of Draenor Enchanting", skillNeeded = 80, reagents = {{id = 251766, amount = 10}, {id = 111245, amount = 6}, {id = 109118, amount = 5}, {id = 111557, amount = 5}} }, 
{ id = 257037, expansion = 2, model3D = 192427, spell = 1261331, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 22449, amount = 4}, {id = 22446, amount = 4}, {id = 22445, amount = 12}} }, 
{ id = 257038, expansion = 2, model3D = 192433, spell = 1261340, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 22449, amount = 4}, {id = 22446, amount = 4}, {id = 22445, amount = 12}} }, 
{ id = 253250, expansion = 1, model3D = 195048, spell = 1261501, skill = "Classic Enchanting", skillNeeded = 240, reagents = {{id = 245586, amount = 20}, {id = 16203, amount = 12}, {id = 12365, amount = 12}, {id = 17010, amount = 5}} }, 
{ id = 256171, expansion = 10, model3D = 4326554, spell = 1261919, skill = "Dragonflight Enchanting", skillNeeded = 80, reagents = {{id = 251773, amount = 16}, {id = 193922, amount = 2}, {id = 190327, amount = 1}, {id = 194784, amount = 4}, {id = 194124, amount = 6}} }, 
{ id = 256170, expansion = 10, model3D = 4216958, spell = 1261933, skill = "Dragonflight Enchanting", skillNeeded = 80, reagents = {{id = 251773, amount = 50}, {id = 256171, amount = 1}, {id = 200113, amount = 5}, {id = 194784, amount = 9}, {id = 190312, amount = 10}} }, 
{ id = 257098, expansion = 9, model3D = 3641039, spell = 1261998, skill = "Shadowlands Enchanting", skillNeeded = 90, reagents = {{id = 251772, amount = 6}, {id = 172230, amount = 4}, {id = 171832, amount = 3}} }, 
{ id = 256681, expansion = 7, model3D = 1363079, spell = 1262238, skill = "Legion Enchanting", skillNeeded = 80, reagents = {{id = 251767, amount = 48}, {id = 124461, amount = 25}, {id = 124441, amount = 25}, {id = 127835, amount = 10}, {id = 124124, amount = 3}} }, 
{ id = 257097, expansion = 5, model3D = 591464, spell = 1262302, skill = "Mists of Pandaria Enchanting", skillNeeded = 60, reagents = {{id = 251763, amount = 30}, {id = 74248, amount = 15}, {id = 94289, amount = 4}, {id = 3857, amount = 5}} }, 
{ id = 257096, expansion = 5, model3D = 522294, spell = 1262306, skill = "Mists of Pandaria Enchanting", skillNeeded = 60, reagents = {{id = 251763, amount = 8}, {id = 74247, amount = 9}, {id = 72988, amount = 4}, {id = 76061, amount = 2}} }, 
{ id = 257095, expansion = 4, model3D = 317822, spell = 1262318, skill = "Cataclysm Enchanting", skillNeeded = 60, reagents = {{id = 251764, amount = 20}, {id = 52722, amount = 8}, {id = 52328, amount = 20}, {id = 53039, amount = 2}, {id = 69237, amount = 1}} }, 
{ id = 257404, expansion = 4, model3D = 304698, spell = 1262331, skill = "Cataclysm Enchanting", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 3371, amount = 1}, {id = 52555, amount = 6}, {id = 52325, amount = 3}} }, 
{ id = 257094, expansion = 3, model3D = 243044, spell = 1262824, skill = "Wrath of the Lich King Enchanting", skillNeeded = 60, reagents = {{id = 251762, amount = 12}, {id = 34057, amount = 2}, {id = 34055, amount = 6}, {id = 34054, amount = 8}} }, 
{ id = 257101, expansion = 3, model3D = 242720, spell = 1262825, skill = "Wrath of the Lich King Enchanting", skillNeeded = 60, reagents = {{id = 251762, amount = 20}, {id = 34057, amount = 3}, {id = 34055, amount = 3}, {id = 41163, amount = 4}, {id = 41510, amount = 6}} }, 
{ id = 257093, expansion = 2, model3D = 538417, spell = 1262828, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 40}, {id = 22450, amount = 6}, {id = 22449, amount = 6}, {id = 22446, amount = 8}, {id = 22445, amount = 20}} }, 
{ id = 258237, expansion = 9, model3D = 3036110, spell = 1263238, skill = "Shadowlands Enchanting", skillNeeded = 90, reagents = {{id = 251772, amount = 30}, {id = 172232, amount = 8}, {id = 172230, amount = 15}, {id = 177061, amount = 6}} }, 
{ id = 258559, expansion = 8, model3D = 2057302, spell = 1263870, skill = "Battle for Azeroth Enchanting", skillNeeded = 140, reagents = {{id = 251768, amount = 35}, {id = 168185, amount = 30}, {id = 152877, amount = 2}, {id = 152875, amount = 15}, {id = 158186, amount = 10}} }, 
{ id = 258560, expansion = 8, model3D = 2438950, spell = 1263877, skill = "Battle for Azeroth Enchanting", skillNeeded = 140, reagents = {{id = 251768, amount = 6}, {id = 152876, amount = 4}, {id = 152541, amount = 2}, {id = 154165, amount = 1}} }, 
{ id = 263027, expansion = 1, model3D = 203845, spell = 1270459, skill = "Classic Enchanting", skillNeeded = 240, reagents = {{id = 245586, amount = 30}, {id = 12808, amount = 16}, {id = 14344, amount = 12}, {id = 16203, amount = 8}, {id = 20520, amount = 8}} }, 
{ id = 268038, expansion = 12, model3D = 7009238, spell = 1281342, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 30}, {id = 236949, amount = 20}, {id = 245881, amount = 50}, {id = 243599, amount = 50}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 245805, amount = 2}} }, 
{ id = 268039, expansion = 12, model3D = 7009238, spell = 1281348, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 30}, {id = 236951, amount = 20}, {id = 245881, amount = 50}, {id = 243599, amount = 50}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 245805, amount = 2}} }, 
{ id = 268041, expansion = 12, model3D = 7009238, spell = 1281349, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 30}, {id = 236952, amount = 20}, {id = 245881, amount = 50}, {id = 243599, amount = 50}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 245801, amount = 2}} }, 
{ id = 279332, expansion = 12, model3D = 6195676, spell = 1296498, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 274781, amount = 8}, {id = 243599, amount = 12}, {id = 243602, amount = 6}} },
{ id = 279362, expansion = 12, model3D = 6163852, spell = 1296499, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 274777, amount = 6}, {id = 243599, amount = 12}, {id = 243602, amount = 6}} }, 
{ id = 279335, expansion = 12, model3D = 7143556, spell = 1296500, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 274781, amount = 6}, {id = 238383, amount = 1}, {id = 243599, amount = 25}} }, 

{ id = 265331, expansion = 2, model3D = 192430, spell = 1313520, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 22449, amount = 4}, {id = 22446, amount = 4}, {id = 22445, amount = 12}} },
{ id = 282140, expansion = 7, model3D = 1616779, spell = 1313525, skill = "Legion Enchanting", skillNeeded = 85, reagents = {{id = 251767, amount = 8}, {id = 124461, amount = 2}, {id = 151568, amount = 3}, {id = 151564, amount = 40}} },
    }
  },
  {
    name = "Engineering", --37
    items = {
{ id = 262618, expansion = 12, model3D = 7119312, spell = 1248610, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 10}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 4}, {id = 247725, amount = 1}} }, 
{ id = 263049, expansion = 12, model3D = 6210884, spell = 1248611, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 6}, {id = 247725, amount = 1}} },
{ id = 246460, expansion = 12, model3D = 6427295, spell = 1248612, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 5}, {id = 247725, amount = 1}} }, 
{ id = 262465, expansion = 12, model3D = 6700990, spell = 1248613, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 16}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 10}, {id = 247725, amount = 1}} }, 
{ id = 262789, expansion = 12, model3D = 5661242, spell = 1248614, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 8}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 262617, expansion = 12, model3D = 6980931, spell = 1248615, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 10}, {id = 247725, amount = 1}} }, 
{ id = 262602, expansion = 12, model3D = 6404236, spell = 1248616, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 14}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 6}, {id = 247725, amount = 1}} }, 
{ id = 248113, expansion = 10, model3D = 4222966, spell = 1259404, skill = "Dragonflight Engineering", skillNeeded = 80, reagents = {{id = 251773, amount = 25}, {id = 192876, amount = 2}, {id = 198183, amount = 4}, {id = 198198, amount = 4}, {id = 198186, amount = 4}} }, 
{ id = 246066, expansion = 11, model3D = 6914980, spell = 1259724, skill = "Khaz Algar Engineering", skillNeeded = 80, reagents = {{id = 248012, amount = 12}, {id = 213399, amount = 6}, {id = 221856, amount = 6}, {id = 221865, amount = 1}} }, 
{ id = 253252, expansion = 11, model3D = 5464693, spell = 1259778, skill = "Khaz Algar Engineering", skillNeeded = 80, reagents = {{id = 248012, amount = 42}, {id = 221756, amount = 1}, {id = 212498, amount = 1}, {id = 221859, amount = 6}, {id = 221868, amount = 10}, {id = 221853, amount = 18}, {id = 222417, amount = 15}} }, 
{ id = 246604, expansion = 8, model3D = 2816738, spell = 1260349, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 42}, {id = 152579, amount = 30}, {id = 152512, amount = 35}, {id = 163569, amount = 20}, {id = 166970, amount = 5}} }, 
{ id = 246486, expansion = 8, model3D = 6699744, spell = 1260352, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 45}, {id = 163569, amount = 18}, {id = 160502, amount = 15}, {id = 152579, amount = 10}, {id = 152512, amount = 20}, {id = 166970, amount = 1}} }, 
{ id = 246500, expansion = 8, model3D = 2765483, spell = 1260425, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 16}, {id = 163569, amount = 6}, {id = 152579, amount = 8}, {id = 152512, amount = 8}, {id = 154123, amount = 1}} }, 
{ id = 251482, expansion = 6, model3D = 928023, spell = 1261025, skill = "Warlords of Draenor Engineering", skillNeeded = 80, reagents = {{id = 251766, amount = 20}, {id = 109118, amount = 20}, {id = 113588, amount = 3}, {id = 113264, amount = 12}} }, 
{ id = 244314, expansion = 6, model3D = 979341, spell = 1261027, skill = "Warlords of Draenor Engineering", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 109119, amount = 15}, {id = 109118, amount = 10}, {id = 114931, amount = 5}, {id = 39354, amount = 2}} }, 
{ id = 247733, expansion = 5, model3D = 526861, spell = 1261236, skill = "Mists of Pandaria Engineering", skillNeeded = 60, reagents = {{id = 251763, amount = 30}, {id = 72095, amount = 20}, {id = 77467, amount = 12}, {id = 76061, amount = 8}, {id = 3857, amount = 10}} }, 
{ id = 245602, expansion = 4, model3D = 6930893, spell = 1261258, skill = "Cataclysm Engineering", skillNeeded = 60, reagents = {{id = 251764, amount = 40}, {id = 53039, amount = 4}, {id = 60224, amount = 8}, {id = 53010, amount = 6}} }, 
{ id = 246700, expansion = 1, model3D = 197653, spell = 1261504, skill = "Classic Engineering", skillNeeded = 240, reagents = {{id = 245586, amount = 25}, {id = 16000, amount = 4}, {id = 16006, amount = 4}, {id = 7078, amount = 4}, {id = 14048, amount = 8}} }, 
{ id = 246410, expansion = 1, model3D = 197212, spell = 1261509, skill = "Classic Engineering", skillNeeded = 240, reagents = {{id = 245586, amount = 40}, {id = 11371, amount = 12}, {id = 16006, amount = 8}, {id = 7076, amount = 8}, {id = 15994, amount = 6}} }, 
{ id = 257689, expansion = 4, model3D = 305999, spell = 1262340, skill = "Cataclysm Engineering", skillNeeded = 60, reagents = {{id = 251764, amount = 50}, {id = 54849, amount = 15}, {id = 60224, amount = 6}, {id = 52976, amount = 12}, {id = 67749, amount = 5}} }, 
{ id = 258253, expansion = 10, model3D = 4420607, spell = 1263237, skill = "Dragonflight Engineering", skillNeeded = 80, reagents = {{id = 251773, amount = 50}, {id = 190324, amount = 4}, {id = 198487, amount = 20}, {id = 201406, amount = 2}, {id = 198183, amount = 8}, {id = 198192, amount = 7}, {id = 198198, amount = 9}} }, 
{ id = 258240, expansion = 9, model3D = 3154869, spell = 1263239, skill = "Shadowlands Engineering", skillNeeded = 80, reagents = {{id = 251772, amount = 18}, {id = 171829, amount = 6}, {id = 173110, amount = 2}, {id = 172935, amount = 4}, {id = 173173, amount = 2}} }, 
{ id = 258252, expansion = 9, model3D = 4005944, spell = 1263240, skill = "Shadowlands Engineering", skillNeeded = 80, reagents = {{id = 251772, amount = 42}, {id = 171441, amount = 1}, {id = 172934, amount = 8}, {id = 171428, amount = 15}, {id = 172936, amount = 6}, {id = 172935, amount = 4}} },
{ id = 258226, expansion = 7, model3D = 1355598, spell = 1263319, skill = "Legion Engineering", skillNeeded = 80, reagents = {{id = 251767, amount = 22}, {id = 132514, amount = 1}, {id = 124461, amount = 15}} }, 
{ id = 258225, expansion = 7, model3D = 1355533, spell = 1263338, skill = "Legion Engineering", skillNeeded = 80, reagents = {{id = 251767, amount = 28}, {id = 124461, amount = 20}, {id = 136637, amount = 15}, {id = 136633, amount = 10}, {id = 130183, amount = 3}} }, 
{ id = 258216, expansion = 5, model3D = 666489, spell = 1263551, skill = "Mists of Pandaria Engineering", skillNeeded = 60, reagents = {{id = 251763, amount = 50}, {id = 72095, amount = 40}, {id = 77468, amount = 30}, {id = 77467, amount = 16}, {id = 87872, amount = 4}} },
{ id = 258194, expansion = 2, model3D = 192446, spell = 1263643, skill = "The Burning Crusade Engineering", skillNeeded = 60, reagents = {{id = 242691, amount = 50}, {id = 32423, amount = 50}, {id = 23783, amount = 12}, {id = 23786, amount = 4}, {id = 23785, amount = 3}} }, 
{ id = 258193, expansion = 2, model3D = 192441, spell = 1263654, skill = "The Burning Crusade Engineering", skillNeeded = 60, reagents = {{id = 242691, amount = 25}, {id = 23787, amount = 6}, {id = 23786, amount = 2}} },
{ id = 258196, expansion = 2, model3D = 192461, spell = 1263663, skill = "The Burning Crusade Engineering", skillNeeded = 60, reagents = {{id = 242691, amount = 15}, {id = 23783, amount = 6}, {id = 23782, amount = 4}} }, 
{ id = 264711, expansion = 3, model3D = 244205, spell = 1272676, skill = "Wrath of the Lich King Engineering", skillNeeded = 60, reagents = {{id = 251762, amount = 46}, {id = 41163, amount = 20}, {id = 39683, amount = 8}, {id = 39682, amount = 4}, {id = 39681, amount = 2}} }, 
{ id = 264708, expansion = 3, model3D = 197708, spell = 1272688, skill = "Wrath of the Lich King Engineering", skillNeeded = 60, reagents = {{id = 251762, amount = 28}, {id = 44501, amount = 2}, {id = 39681, amount = 12}, {id = 39682, amount = 4}} }, 
{ id = 264707, expansion = 3, model3D = 197671, spell = 1272707, skill = "Wrath of the Lich King Engineering", skillNeeded = 60, reagents = {{id = 251762, amount = 20}, {id = 41163, amount = 20}, {id = 39681, amount = 2}} }, 
{ id = 279337, expansion = 12, model3D = 6715093, spell = 1296501, skill = "Midnight Engineering", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 3}, {id = 243576, amount = 3}, {id = 247725, amount = 1}} }, 
{ id = 279339, expansion = 12, model3D = 1852970, spell = 1296502, skill = "Midnight Engineering", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 5}, {id = 243576, amount = 5}, {id = 247725, amount = 1}} }, 
{ id = 279341, expansion = 12, model3D = 1668078, spell = 1296503, skill = "Midnight Engineering", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 5}, {id = 247725, amount = 1}} },	

{ id = 282144, expansion = 7, model3D = 1660051, spell = 1313527, skill = "Legion Engineering", skillNeeded = 85, reagents = {{id = 251767, amount = 9}, {id = 124461, amount = 5}, {id = 151564, amount = 20}, {id = 151568, amount = 1}} },
{ id = 283291, expansion = 8, model3D = 1674748, spell = 1315426, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 5}, {id = 163569, amount = 10}, {id = 152512, amount = 8}, {id = 152579, amount = 8}} },	
    }
  },
  {
    name = "Inscription", --82
    items = {
{ id = 262612, expansion = 12, model3D = 6701016, spell = 1248619, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 245764, amount = 4}, {id = 245766, amount = 4}, {id = 247725, amount = 1}} }, 
{ id = 262790, expansion = 12, model3D = 5915398, spell = 1248620, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 10}, {id = 245764, amount = 4}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 262464, expansion = 12, model3D = 6700989, spell = 1248621, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 10}, {id = 245764, amount = 2}, {id = 245766, amount = 4}, {id = 247725, amount = 1}} }, 
{ id = 262594, expansion = 12, model3D = 6050872, spell = 1248622, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 245764, amount = 4}, {id = 245766, amount = 6}, {id = 247725, amount = 1}} }, 
{ id = 262616, expansion = 12, model3D = 6935640, spell = 1248623, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 4}, {id = 245764, amount = 3}, {id = 245766, amount = 1}, {id = 247725, amount = 1}} }, 
{ id = 262598, expansion = 12, model3D = 6103388, spell = 1248624, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 4}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 262597, expansion = 12, model3D = 6074149, spell = 1248625, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 262615, expansion = 12, model3D = 6935637, spell = 1248626, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 4}, {id = 245764, amount = 1}, {id = 245766, amount = 1}, {id = 247725, amount = 1}} }, 
{ id = 262595, expansion = 12, model3D = 6050877, spell = 1248627, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 245764, amount = 2}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 262601, expansion = 12, model3D = 6326918, spell = 1248628, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 245764, amount = 3}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 253508, expansion = 12, model3D = 6330347, spell = 1248630, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 245764, amount = 2}, {id = 245766, amount = 4}, {id = 247725, amount = 1}} },
{ id = 263034, expansion = 12, model3D = 7476200, spell = 1248631, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 24}, {id = 245764, amount = 10}, {id = 245766, amount = 8}, {id = 247725, amount = 1}} }, 
{ id = 248118, expansion = 10, model3D = 4317323, spell = 1259422, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 15}, {id = 194784, amount = 15}, {id = 194751, amount = 3}, {id = 194856, amount = 5}, {id = 194850, amount = 4}} }, 
{ id = 248120, expansion = 10, model3D = 4317325, spell = 1259429, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 16}, {id = 194784, amount = 16}, {id = 194751, amount = 7}, {id = 194856, amount = 5}} }, 
{ id = 248119, expansion = 10, model3D = 4317324, spell = 1259433, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 16}, {id = 194784, amount = 16}, {id = 194850, amount = 6}, {id = 194856, amount = 3}, {id = 194751, amount = 2}} }, 
{ id = 248106, expansion = 10, model3D = 3917374, spell = 1259441, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 10}, {id = 194850, amount = 3}, {id = 190395, amount = 8}} }, 
{ id = 248107, expansion = 10, model3D = 3917382, spell = 1259451, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 10}, {id = 194751, amount = 4}, {id = 190395, amount = 8}} }, 
{ id = 248108, expansion = 10, model3D = 3917383, spell = 1259461, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 14}, {id = 194751, amount = 6}, {id = 190395, amount = 10}} }, 
{ id = 253167, expansion = 11, model3D = 4906204, spell = 1259784, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 18}, {id = 222417, amount = 2}, {id = 222609, amount = 2}} }, 
{ id = 253022, expansion = 11, model3D = 4902723, spell = 1259796, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 50}, {id = 226204, amount = 30}, {id = 212508, amount = 2}, {id = 222615, amount = 9}, {id = 222555, amount = 4}} }, 
{ id = 253169, expansion = 11, model3D = 5128194, spell = 1259805, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 26}, {id = 222523, amount = 1}, {id = 222609, amount = 3}, {id = 222417, amount = 5}, {id = 212664, amount = 2}} }, 
{ id = 253036, expansion = 11, model3D = 4896176, spell = 1259818, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 35}, {id = 221754, amount = 3}, {id = 222558, amount = 3}, {id = 222555, amount = 6}} }, 
{ id = 253164, expansion = 11, model3D = 4896178, spell = 1260005, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 15}, {id = 222417, amount = 1}, {id = 222609, amount = 2}} },
{ id = 253165, expansion = 11, model3D = 4896180, spell = 1260044, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 10}, {id = 222417, amount = 1}, {id = 222609, amount = 1}} }, 
{ id = 245416, expansion = 8, model3D = 6877805, spell = 1260508, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 10}, {id = 152512, amount = 6}, {id = 158188, amount = 4}} }, 
{ id = 245415, expansion = 8, model3D = 6877806, spell = 1260564, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 15}, {id = 152512, amount = 18}, {id = 158188, amount = 8}} }, 
{ id = 245499, expansion = 8, model3D = 1597475, spell = 1260577, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 35}, {id = 158187, amount = 20}, {id = 152512, amount = 24}} }, 
{ id = 252035, expansion = 8, model3D = 1602488, spell = 1260583, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 6}, {id = 160711, amount = 5}, {id = 152576, amount = 10}} }, 
{ id = 252389, expansion = 8, model3D = 1602479, spell = 1260593, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 8}, {id = 158187, amount = 5}, {id = 160711, amount = 5}} }, 
{ id = 252401, expansion = 8, model3D = 1852949, spell = 1260596, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 8}, {id = 152576, amount = 8}, {id = 152512, amount = 8}, {id = 160711, amount = 1}} },
{ id = 245459, expansion = 7, model3D = 1402225, spell = 1260704, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 15}, {id = 129032, amount = 10}, {id = 129034, amount = 15}, {id = 124437, amount = 8}} }, 
{ id = 247916, expansion = 7, model3D = 1361711, spell = 1260711, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 35}, {id = 129032, amount = 25}, {id = 127004, amount = 6}, {id = 124461, amount = 15}} }, 
{ id = 247918, expansion = 7, model3D = 1368700, spell = 1260719, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 28}, {id = 129034, amount = 20}, {id = 129032, amount = 10}, {id = 124461, amount = 5}, {id = 127004, amount = 3}, {id = 129100, amount = 5}} },
{ id = 247925, expansion = 7, model3D = 1445014, spell = 1260730, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 20}, {id = 129034, amount = 20}, {id = 124461, amount = 12}} }, 
{ id = 245396, expansion = 7, model3D = 6749303, spell = 1260737, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 30}, {id = 129034, amount = 25}, {id = 127004, amount = 6}, {id = 124461, amount = 15}, {id = 129032, amount = 10}} }, 
{ id = 245534, expansion = 6, model3D = 6711645, spell = 1261032, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 109119, amount = 20}, {id = 118472, amount = 10}, {id = 113261, amount = 6}} }, 
{ id = 244319, expansion = 6, model3D = 987255, spell = 1261045, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 8}, {id = 109118, amount = 12}, {id = 114931, amount = 10}, {id = 113263, amount = 6}} }, 
{ id = 244317, expansion = 6, model3D = 986851, spell = 1261066, skill = "Warlords of Draenor Inscription", skillNeeded = 0, reagents = {{id = 251766, amount = 6}, {id = 109118, amount = 8}, {id = 114931, amount = 6}, {id = 113263, amount = 4}} },
{ id = 247731, expansion = 5, model3D = 525038, spell = 1261237, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 15}, {id = 79255, amount = 5}, {id = 82441, amount = 2}} }, 
{ id = 245514, expansion = 5, model3D = 538827, spell = 1261238, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 25}, {id = 79254, amount = 6}, {id = 76061, amount = 4}, {id = 87872, amount = 5}} }, 
{ id = 245513, expansion = 5, model3D = 538547, spell = 1261239, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 20}, {id = 79254, amount = 6}, {id = 76061, amount = 4}} }, 
{ id = 247735, expansion = 5, model3D = 7508792, spell = 1261240, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 20}, {id = 79254, amount = 6}, {id = 87872, amount = 5}} }, 
{ id = 247669, expansion = 5, model3D = 6854354, spell = 1261241, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 45}, {id = 79255, amount = 20}, {id = 76061, amount = 8}, {id = 72104, amount = 4}, {id = 39354, amount = 18}} }, 
{ id = 245621, expansion = 4, model3D = 322293, spell = 1261259, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 25}, {id = 61981, amount = 8}, {id = 52327, amount = 6}, {id = 56850, amount = 4}} }, 
{ id = 245623, expansion = 4, model3D = 322635, spell = 1261278, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 25}, {id = 61981, amount = 8}, {id = 52328, amount = 6}, {id = 56850, amount = 4}} },
{ id = 245622, expansion = 4, model3D = 322355, spell = 1261288, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 10}, {id = 61978, amount = 4}, {id = 52186, amount = 2}} }, 
{ id = 245503, expansion = 1, model3D = 189416, spell = 1261549, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 15}, {id = 12808, amount = 4}, {id = 7076, amount = 4}, {id = 43123, amount = 2}} }, 
{ id = 245502, expansion = 1, model3D = 189415, spell = 1261572, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 25}, {id = 12808, amount = 8}, {id = 7076, amount = 8}, {id = 43123, amount = 5}} }, 
{ id = 246420, expansion = 1, model3D = 197288, spell = 1261587, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 50}, {id = 10308, amount = 50}, {id = 12365, amount = 24}, {id = 12359, amount = 12}} },
{ id = 246423, expansion = 1, model3D = 197555, spell = 1261644, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 45}, {id = 6037, amount = 12}, {id = 43119, amount = 8}, {id = 12810, amount = 8}, {id = 20963, amount = 4}} }, 
{ id = 258244, expansion = 9, model3D = 3246827, spell = 1263241, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 24}, {id = 173204, amount = 8}, {id = 171828, amount = 8}, {id = 173059, amount = 8}} }, 
{ id = 258250, expansion = 9, model3D = 3836261, spell = 1263243, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 35}, {id = 171829, amount = 10}, {id = 173059, amount = 16}, {id = 173110, amount = 1}} }, 
{ id = 258245, expansion = 9, model3D = 3507170, spell = 1263247, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 16}, {id = 173202, amount = 5}, {id = 177061, amount = 5}} }, 
{ id = 258235, expansion = 9, model3D = 3033118, spell = 1263272, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 28}, {id = 173059, amount = 15}, {id = 173110, amount = 2}} }, 
{ id = 258247, expansion = 9, model3D = 3607336, spell = 1263278, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 20}, {id = 171832, amount = 5}, {id = 173058, amount = 10}} }, 
{ id = 258239, expansion = 9, model3D = 3036651, spell = 1263285, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 10}, {id = 175970, amount = 5}, {id = 173126, amount = 1}, {id = 172092, amount = 8}, {id = 175886, amount = 10}, {id = 173172, amount = 2}} }, 
{ id = 258242, expansion = 9, model3D = 3158874, spell = 1263293, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 50}, {id = 175970, amount = 25}, {id = 172230, amount = 15}, {id = 173170, amount = 8}, {id = 173202, amount = 4}, {id = 177061, amount = 4}} },
{ id = 258224, expansion = 7, model3D = 1319120, spell = 1263344, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 22}, {id = 129032, amount = 15}, {id = 151565, amount = 10}, {id = 136693, amount = 1}} }, 
{ id = 258203, expansion = 3, model3D = 194464, spell = 1263562, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 18}, {id = 37663, amount = 4}, {id = 43127, amount = 10}} }, 
{ id = 258210, expansion = 3, model3D = 243054, spell = 1263564, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 10}, {id = 41163, amount = 6}, {id = 43126, amount = 5}, {id = 39354, amount = 10}} }, 
{ id = 258207, expansion = 3, model3D = 242995, spell = 1263570, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 45}, {id = 37663, amount = 12}, {id = 43127, amount = 6}, {id = 43126, amount = 6}, {id = 36931, amount = 4}} },
{ id = 258209, expansion = 3, model3D = 243030, spell = 1263574, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 6}, {id = 36931, amount = 2}, {id = 43127, amount = 3}} }, 
{ id = 258204, expansion = 3, model3D = 194471, spell = 1263575, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 12}, {id = 36916, amount = 6}, {id = 43126, amount = 3}} }, 
{ id = 258199, expansion = 2, model3D = 193332, spell = 1263810, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 25}, {id = 33458, amount = 50}, {id = 43124, amount = 10}, {id = 22452, amount = 4}} }, 
{ id = 258198, expansion = 2, model3D = 192515, spell = 1263811, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23793, amount = 3}, {id = 23449, amount = 2}} }, 
{ id = 258215, expansion = 2, model3D = 538411, spell = 1263812, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23793, amount = 3}, {id = 22457, amount = 2}} },
{ id = 258197, expansion = 2, model3D = 192468, spell = 1263813, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 12}, {id = 22446, amount = 4}, {id = 43125, amount = 3}, {id = 39354, amount = 1}} }, 
{ id = 258192, expansion = 2, model3D = 191859, spell = 1263814, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 10}, {id = 43124, amount = 3}, {id = 21886, amount = 2}} }, 
{ id = 258289, expansion = 1, model3D = 200451, spell = 1269495, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 30}, {id = 7076, amount = 8}, {id = 43121, amount = 6}} }, 
{ id = 244313, expansion = 6, model3D = 969529, spell = 1269500, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 15}, {id = 109119, amount = 15}, {id = 113263, amount = 8}, {id = 111557, amount = 10}} }, 
{ id = 245441, expansion = 6, model3D = 969535, spell = 1269501, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 10}, {id = 109119, amount = 10}, {id = 113263, amount = 4}} }, 
{ id = 257696, expansion = 4, model3D = 305396, spell = 1269534, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 61978, amount = 8}, {id = 54849, amount = 3}, {id = 39354, amount = 1}} },
{ id = 257695, expansion = 4, model3D = 305385, spell = 1269540, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 35}, {id = 52186, amount = 12}, {id = 61978, amount = 10}, {id = 55053, amount = 1}} }, 
{ id = 264679, expansion = 10, model3D = 4286997, spell = 1272572, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 18}, {id = 192872, amount = 2}, {id = 194862, amount = 2}, {id = 190312, amount = 2}} },
{ id = 280752, expansion = 12, model3D = 7498518, spell = 1296505, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, 
{ id = 280757, expansion = 12, model3D = 6212409, spell = 1296506, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} },

{ id = 282132, expansion = 7, model3D = 1616728, spell = 1313522, skill = "Legion Inscription", skillNeeded = 85, reagents = {{id = 251767, amount = 20}, {id = 123918, amount = 10}, {id = 151565, amount = 15}, {id = 151567, amount = 5}} },
{ id = 283301, expansion = 9, model3D = 3448138, spell = 1315335, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 4}, {id = 173059, amount = 5}, {id = 175886, amount = 10}, {id = 173204, amount = 3}} },
{ id = 282190, expansion = 12, model3D = 5019423, spell = 1315433, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 10}, {id = 33226, amount = 15}, {id = 253043, amount = 5}, {id = 245882, amount = 20}} },
{ id = 283321, expansion = 8, model3D = 1624534, spell = 1315465, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 4}, {id = 158189, amount = 10}, {id = 39354, amount = 25}, {id = 152576, amount = 3}} },
{ id = 284504, expansion = 9, model3D = 3040291, spell = 1316306, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 10}, {id = 168589, amount = 15}, {id = 173058, amount = 5}, {id = 180732, amount = 1}, {id = 171315, amount = 3}} }, 
    }
  },
  {
    name = "Jewelcrafting", --34
    items = {
{ id = 262461, expansion = 12, model3D = 6700985, spell = 1246889, skill = "Midnight Jewelcrafting", skillNeeded = 80, reagents = {{id = 256963, amount = 12}, {id = 240974, amount = 1}, {id = 242620, amount = 5}, {id = 242788, amount = 15}, {id = 246447, amount = 1}} }, 
{ id = 262471, expansion = 12, model3D = 7050760, spell = 1246891, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 251665, amount = 25}, {id = 256963, amount = 12}, {id = 240974, amount = 1}, {id = 242620, amount = 15}, {id = 246447, amount = 1}} }, 
{ id = 248965, expansion = 12, model3D = 7152563, spell = 1246892, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 24}, {id = 242620, amount = 15}, {id = 242788, amount = 25}, {id = 246447, amount = 1}} }, 
{ id = 262613, expansion = 12, model3D = 6715097, spell = 1246893, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 18}, {id = 240974, amount = 1}, {id = 242620, amount = 5}, {id = 242788, amount = 25}, {id = 246447, amount = 1}} }, 
{ id = 262454, expansion = 12, model3D = 6033623, spell = 1246894, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 242620, amount = 8}, {id = 242787, amount = 50}, {id = 246447, amount = 1}} }, 
{ id = 262469, expansion = 12, model3D = 6929052, spell = 1246895, skill = "Midnight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251665, amount = 25}, {id = 256963, amount = 18}, {id = 242620, amount = 20}, {id = 242788, amount = 20}, {id = 246447, amount = 1}} }, 
{ id = 248654, expansion = 10, model3D = 7141934, spell = 1259369, skill = "Dragonflight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251773, amount = 26}, {id = 190312, amount = 6}, {id = 192883, amount = 10}, {id = 192869, amount = 1}} }, 
{ id = 248109, expansion = 10, model3D = 3952852, spell = 1259384, skill = "Dragonflight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251773, amount = 15}, {id = 192872, amount = 2}, {id = 192883, amount = 4}, {id = 190395, amount = 18}} }, 
{ id = 248110, expansion = 10, model3D = 3952853, spell = 1259386, skill = "Dragonflight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251773, amount = 10}, {id = 192883, amount = 4}, {id = 190395, amount = 8}} }, 
{ id = 245559, expansion = 11, model3D = 6924251, spell = 1260096, skill = "Khaz Algar Jewelcrafting", skillNeeded = 80, reagents = {{id = 248012, amount = 16}, {id = 212498, amount = 4}, {id = 221754, amount = 1}, {id = 213756, amount = 5}} }, 
{ id = 253253, expansion = 11, model3D = 5636650, spell = 1260172, skill = "Khaz Algar Jewelcrafting", skillNeeded = 80, reagents = {{id = 248012, amount = 25}, {id = 212498, amount = 7}, {id = 213759, amount = 1}, {id = 222417, amount = 2}, {id = 213219, amount = 14}} }, 
{ id = 245414, expansion = 8, model3D = 6653375, spell = 1260492, skill = "Battle for Azeroth Jewelcrafting", skillNeeded = 140, reagents = {{id = 251768, amount = 40}, {id = 152512, amount = 30}, {id = 154123, amount = 3}, {id = 152513, amount = 5}} }, 
{ id = 245496, expansion = 8, model3D = 1929218, spell = 1260501, skill = "Battle for Azeroth Jewelcrafting", skillNeeded = 140, reagents = {{id = 251768, amount = 20}, {id = 154120, amount = 2}, {id = 158187, amount = 6}, {id = 152513, amount = 10}} }, 
{ id = 245557, expansion = 7, model3D = 6924249, spell = 1260757, skill = "Legion Jewelcrafting", skillNeeded = 80, reagents = {{id = 251767, amount = 14}, {id = 127004, amount = 3}, {id = 124461, amount = 10}, {id = 129100, amount = 20}} },
{ id = 251495, expansion = 6, model3D = 7273285, spell = 1261071, skill = "Warlords of Draenor Jewelcrafting", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 109118, amount = 20}, {id = 113262, amount = 12}, {id = 115811, amount = 1}} },
{ id = 251550, expansion = 6, model3D = 6436480, spell = 1261075, skill = "Warlords of Draenor Jewelcrafting", skillNeeded = 80, reagents = {{id = 251766, amount = 8}, {id = 109118, amount = 10}, {id = 111557, amount = 4}, {id = 113261, amount = 2}, {id = 115805, amount = 1}} },
{ id = 247736, expansion = 5, model3D = 530128, spell = 1261242, skill = "Mists of Pandaria Jewelcrafting", skillNeeded = 60, reagents = {{id = 251763, amount = 50}, {id = 83092, amount = 1}, {id = 72095, amount = 30}, {id = 76061, amount = 6}, {id = 76734, amount = 2}} }, 
{ id = 245509, expansion = 5, model3D = 518523, spell = 1261243, skill = "Mists of Pandaria Jewelcrafting", skillNeeded = 60, reagents = {{id = 251763, amount = 15}, {id = 72096, amount = 10}, {id = 76061, amount = 2}} }, 
{ id = 247728, expansion = 5, model3D = 519133, spell = 1261244, skill = "Mists of Pandaria Jewelcrafting", skillNeeded = 60, reagents = {{id = 251763, amount = 10}, {id = 72096, amount = 6}, {id = 76061, amount = 2}} }, 
{ id = 249143, expansion = 4, model3D = 7130714, spell = 1261305, skill = "Cataclysm Jewelcrafting", skillNeeded = 60, reagents = {{id = 251764, amount = 12}, {id = 54849, amount = 10}, {id = 52193, amount = 4}, {id = 53010, amount = 4}, {id = 52078, amount = 2}} },
{ id = 246488, expansion = 1, model3D = 7014376, spell = 1261659, skill = "Classic Jewelcrafting", skillNeeded = 240, reagents = {{id = 245586, amount = 30}, {id = 6037, amount = 12}, {id = 20963, amount = 8}, {id = 12799, amount = 8}} },
{ id = 246413, expansion = 1, model3D = 379433, spell = 1261667, skill = "Classic Jewelcrafting", skillNeeded = 240, reagents = {{id = 245586, amount = 40}, {id = 11371, amount = 16}, {id = 7910, amount = 20}, {id = 17011, amount = 6}} }, 
{ id = 257406, expansion = 4, model3D = 311599, spell = 1262357, skill = "Cataclysm Jewelcrafting", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 54849, amount = 6}, {id = 52193, amount = 4}, {id = 52078, amount = 2}} }, 
{ id = 258227, expansion = 7, model3D = 1396746, spell = 1263351, skill = "Legion Jewelcrafting", skillNeeded = 80, reagents = {{id = 251767, amount = 12}, {id = 130176, amount = 4}, {id = 151718, amount = 2}, {id = 130181, amount = 2}, {id = 151720, amount = 1}, {id = 130182, amount = 1}, {id = 127004, amount = 1}} }, 
{ id = 258211, expansion = 3, model3D = 243189, spell = 1263577, skill = "Wrath of the Lich King Jewelcrafting", skillNeeded = 60, reagents = {{id = 251762, amount = 22}, {id = 36916, amount = 8}, {id = 42225, amount = 4}} }, 
{ id = 258208, expansion = 3, model3D = 243016, spell = 1263605, skill = "Wrath of the Lich King Jewelcrafting", skillNeeded = 60, reagents = {{id = 251762, amount = 8}, {id = 36916, amount = 6}, {id = 41266, amount = 4}} }, 
{ id = 258201, expansion = 2, model3D = 193371, spell = 1263815, skill = "The Burning Crusade Jewelcrafting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 31079, amount = 6}, {id = 32230, amount = 2}} }, 
{ id = 258200, expansion = 2, model3D = 193369, spell = 1263817, skill = "The Burning Crusade Jewelcrafting", skillNeeded = 60, reagents = {{id = 242691, amount = 10}, {id = 31079, amount = 3}, {id = 23441, amount = 3}} }, 
{ id = 262347, expansion = 2, model3D = 538415, spell = 1269496, skill = "The Burning Crusade Jewelcrafting", skillNeeded = 60, reagents = {{id = 242691, amount = 15}, {id = 23573, amount = 4}, {id = 25867, amount = 2}} }, 
{ id = 262663, expansion = 9, model3D = 2991599, spell = 1269502, skill = "Shadowlands Jewelcrafting", skillNeeded = 80, reagents = {{id = 251772, amount = 18}, {id = 171829, amount = 6}, {id = 173173, amount = 4}, {id = 172230, amount = 4}} }, 
{ id = 260699, expansion = 9, model3D = 3038200, spell = 1269504, skill = "Shadowlands Jewelcrafting", skillNeeded = 80, reagents = {{id = 251772, amount = 30}, {id = 171828, amount = 25}, {id = 173172, amount = 8}, {id = 172232, amount = 2}} }, 
{ id = 279356, expansion = 12, model3D = 2438984, spell = 1297679, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 242607, amount = 4}, {id = 242620, amount = 6}, {id = 242788, amount = 8}, {id = 246447, amount = 1}} }, 
{ id = 279343, expansion = 12, model3D = 2438985, spell = 1297680, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 242554, amount = 4}, {id = 242620, amount = 6}, {id = 242788, amount = 8}, {id = 246447, amount = 1}} }, 
{ id = 280762, expansion = 12, model3D = 2438987, spell = 1297681, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 242553, amount = 4}, {id = 242620, amount = 6}, {id = 242788, amount = 8}, {id = 246447, amount = 1}} }, 

{ id = 282126, expansion = 7, model3D = 1608443, spell = 1313526, skill = "Legion Jewelcrafting", skillNeeded = 85, reagents = {{id = 251767, amount = 6}, {id = 151719, amount = 2}, {id = 130245, amount = 1}, {id = 151564, amount = 10}} },
    }
  },
  {
    name = "Leatherworking", --36
    items = {
{ id = 262449, expansion = 12, model3D = 6005302, spell = 1246937, skill = "Midnight Leatherworking", skillNeeded = 80, reagents = {{id = 251665, amount = 20}, {id = 238525, amount = 5}, {id = 256963, amount = 8}, {id = 244631, amount = 2}, {id = 246447, amount = 1}} }, 
{ id = 253457, expansion = 12, model3D = 6856605, spell = 1246938, skill = "Midnight Leatherworking", skillNeeded = 80, reagents = {{id = 238525, amount = 5}, {id = 238528, amount = 1}, {id = 238523, amount = 5}, {id = 256963, amount = 8}, {id = 246447, amount = 1}} }, 
{ id = 265791, expansion = 12, model3D = 4899958, spell = 1246939, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 238529, amount = 2}, {id = 238530, amount = 1}, {id = 236950, amount = 20}, {id = 251665, amount = 20}, {id = 238522, amount = 5}, {id = 256963, amount = 22}, {id = 246447, amount = 1}} },
{ id = 262589, expansion = 12, model3D = 5163362, spell = 1246940, skill = "Midnight Leatherworking", skillNeeded = 80, reagents = {{id = 238530, amount = 1}, {id = 236950, amount = 20}, {id = 238525, amount = 5}, {id = 256963, amount = 8}, {id = 244631, amount = 2}, {id = 246447, amount = 1}} }, 
{ id = 262600, expansion = 12, model3D = 6310375, spell = 1246941, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 10}, {id = 238525, amount = 5}, {id = 256963, amount = 8}, {id = 246447, amount = 1}, {id = 238518, amount = 4}} }, 
{ id = 243090, expansion = 12, model3D = 6854359, spell = 1246942, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 238528, amount = 1}, {id = 251665, amount = 2}, {id = 238525, amount = 2}, {id = 256963, amount = 6}, {id = 246447, amount = 1}} }, 
{ id = 264244, expansion = 12, model3D = 5161738, spell = 1246943, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 10}, {id = 238525, amount = 5}, {id = 256963, amount = 4}, {id = 246447, amount = 1}, {id = 238518, amount = 4}} }, 
{ id = 248114, expansion = 10, model3D = 4237314, spell = 1259195, skill = "Dragonflight Leatherworking", skillNeeded = 80, reagents = {{id = 251773, amount = 45}, {id = 192869, amount = 5}, {id = 193229, amount = 2}, {id = 190312, amount = 10}, {id = 193216, amount = 10}} }, 
{ id = 248657, expansion = 10, model3D = 7141938, spell = 1259233, skill = "Dragonflight Leatherworking", skillNeeded = 80, reagents = {{id = 251773, amount = 40}, {id = 193922, amount = 6}, {id = 193208, amount = 60}, {id = 190312, amount = 7}} }, 
{ id = 243327, expansion = 11, model3D = 5793046, spell = 1260328, skill = "Khaz Algar Leatherworking", skillNeeded = 80, reagents = {{id = 248012, amount = 30}, {id = 224764, amount = 10}, {id = 219889, amount = 2}, {id = 212670, amount = 1}} }, 
{ id = 245412, expansion = 8, model3D = 6653373, spell = 1260485, skill = "Battle for Azeroth Leatherworking", skillNeeded = 140, reagents = {{id = 251768, amount = 40}, {id = 154722, amount = 30}, {id = 152513, amount = 5}, {id = 154164, amount = 12}} },
{ id = 245406, expansion = 7, model3D = 6711672, spell = 1260762, skill = "Legion Leatherworking", skillNeeded = 80, reagents = {{id = 251767, amount = 20}, {id = 124113, amount = 20}, {id = 124438, amount = 5}} }, 
{ id = 245407, expansion = 7, model3D = 6711673, spell = 1260765, skill = "Legion Leatherworking", skillNeeded = 80, reagents = {{id = 251767, amount = 15}, {id = 124113, amount = 10}, {id = 124438, amount = 5}} },
{ id = 245432, expansion = 6, model3D = 1005469, spell = 1261081, skill = "Warlords of Draenor Leatherworking", skillNeeded = 80, reagents = {{id = 251766, amount = 40}, {id = 110609, amount = 45}, {id = 109119, amount = 20}, {id = 111557, amount = 15}, {id = 120945, amount = 5}} },
{ id = 244323, expansion = 6, model3D = 1013304, spell = 1261122, skill = "Warlords of Draenor Leatherworking", skillNeeded = 80, reagents = {{id = 251766, amount = 22}, {id = 110609, amount = 30}, {id = 109119, amount = 15}} },
{ id = 247856, expansion = 5, model3D = 531405, spell = 1261245, skill = "Mists of Pandaria Leatherworking", skillNeeded = 60, reagents = {{id = 251763, amount = 40}, {id = 72163, amount = 8}, {id = 79255, amount = 5}, {id = 76061, amount = 5}} }, 
{ id = 247767, expansion = 5, model3D = 579248, spell = 1261248, skill = "Mists of Pandaria Leatherworking", skillNeeded = 60, reagents = {{id = 251763, amount = 30}, {id = 72163, amount = 6}, {id = 79254, amount = 5}, {id = 76061, amount = 3}} },
{ id = 242948, expansion = 1, model3D = 4871092, spell = 1261672, skill = "Classic Leatherworking", skillNeeded = 240, reagents = {{id = 245586, amount = 15}, {id = 8170, amount = 12}, {id = 15407, amount = 2}, {id = 14341, amount = 2}} }, 
{ id = 257400, expansion = 7, model3D = 1253405, spell = 1262273, skill = "Legion Leatherworking", skillNeeded = 80, reagents = {{id = 251767, amount = 34}, {id = 124113, amount = 25}, {id = 124116, amount = 5}, {id = 124438, amount = 10}} }, 
{ id = 258248, expansion = 9, model3D = 3619351, spell = 1263308, skill = "Shadowlands Leatherworking", skillNeeded = 80, reagents = {{id = 251772, amount = 30}, {id = 172089, amount = 14}, {id = 172094, amount = 3}, {id = 177062, amount = 5}} }, 
{ id = 258238, expansion = 9, model3D = 3036549, spell = 1263313, skill = "Shadowlands Leatherworking", skillNeeded = 80, reagents = {{id = 251772, amount = 18}, {id = 171830, amount = 6}, {id = 172089, amount = 12}, {id = 172092, amount = 12}} }, 
{ id = 258205, expansion = 3, model3D = 200015, spell = 1263613, skill = "Wrath of the Lich King Leatherworking", skillNeeded = 60, reagents = {{id = 251762, amount = 18}, {id = 38425, amount = 14}, {id = 35623, amount = 4}, {id = 35624, amount = 2}} }, 
{ id = 257725, expansion = 1, model3D = 6711676, spell = 1263633, skill = "Classic Leatherworking", skillNeeded = 240, reagents = {{id = 245586, amount = 18}, {id = 15417, amount = 8}, {id = 2604, amount = 2}, {id = 4342, amount = 2}, {id = 14341, amount = 2}} }, 
{ id = 258191, expansion = 2, model3D = 191839, spell = 1263818, skill = "The Burning Crusade Leatherworking", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23793, amount = 6}, {id = 29539, amount = 4}, {id = 14341, amount = 3}} }, 
{ id = 258190, expansion = 2, model3D = 191781, spell = 1263819, skill = "The Burning Crusade Leatherworking", skillNeeded = 60, reagents = {{id = 242691, amount = 12}, {id = 25708, amount = 8}, {id = 22452, amount = 2}, {id = 21886, amount = 2}} }, 
{ id = 258558, expansion = 8, model3D = 1830320, spell = 1263859, skill = "Battle for Azeroth Leatherworking", skillNeeded = 140, reagents = {{id = 251768, amount = 22}, {id = 152541, amount = 20}, {id = 152579, amount = 15}, {id = 160059, amount = 4}} }, 
{ id = 257693, expansion = 3, model3D = 195749, spell = 1269499, skill = "Wrath of the Lich King Leatherworking", skillNeeded = 60, reagents = {{id = 251762, amount = 12}, {id = 38425, amount = 8}, {id = 35627, amount = 6}, {id = 44128, amount = 2}} }, 
{ id = 257806, expansion = 4, model3D = 360034, spell = 1269550, skill = "Cataclysm Leatherworking", skillNeeded = 60, reagents = {{id = 251764, amount = 40}, {id = 52979, amount = 20}, {id = 54849, amount = 15}, {id = 56516, amount = 10}, {id = 52190, amount = 1}} }, 
{ id = 239214, expansion = 11, model3D = 5929346, spell = 1270836, skill = "Khaz Algar Leatherworking", skillNeeded = 80, reagents = {{id = 248012, amount = 38}, {id = 224764, amount = 10}, {id = 219880, amount = 6}, {id = 212664, amount = 4}, {id = 221853, amount = 9}} }, 
{ id = 264712, expansion = 4, model3D = 306120, spell = 1272580, skill = "Cataclysm Leatherworking", skillNeeded = 60, reagents = {{id = 251764, amount = 12}, {id = 52980, amount = 4}, {id = 54849, amount = 4}, {id = 38426, amount = 8}} }, 
{ id = 264677, expansion = 4, model3D = 424389, spell = 1272588, skill = "Cataclysm Leatherworking", skillNeeded = 60, reagents = {{id = 251764, amount = 14}, {id = 56516, amount = 10}, {id = 38426, amount = 8}, {id = 52327, amount = 4}} }, 
{ id = 266170, expansion = 12, model3D = 7277141, spell = 1296509, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 20}, {id = 256963, amount = 16}, {id = 274777, amount = 8}, {id = 244631, amount = 8}, {id = 246447, amount = 1}} }, 
{ id = 279346, expansion = 12, model3D = 6125163, spell = 1296510, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 20}, {id = 238525, amount = 5}, {id = 256963, amount = 24}, {id = 244631, amount = 2}, {id = 246447, amount = 1}} }, 
{ id = 279348, expansion = 12, model3D = 1097621, spell = 1296511, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 274589, amount = 1}, {id = 256963, amount = 8}, {id = 244631, amount = 6}, {id = 246447, amount = 1}} }, 

{ id = 284240, expansion = 10, model3D = 5350798, spell = 1315719, skill = "Dragonflight Leatherworking", skillNeeded = 50, reagents = {{id = 251773, amount = 6}, {id = 193208, amount = 20}, {id = 192095, amount = 5}, {id = 193216, amount = 2}} },
{ id = 284242, expansion = 10, model3D = 5350799, spell = 1315728, skill = "Dragonflight Leatherworking", skillNeeded = 50, reagents = {{id = 251773, amount = 8}, {id = 193208, amount = 30}, {id = 192095, amount = 7}, {id = 193216, amount = 3}} },
    }
  },
  {
    name = "Tailoring", --31 plus 2 missing
    items = {
{ id = 262599, expansion = 12, model3D = 6209625, spell = 1229000, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 6}, {id = 239702, amount = 4}} }, 
{ id = 262352, expansion = 12, model3D = 6700983, spell = 1229001, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239201, amount = 4}, {id = 239198, amount = 4}} }, 
{ id = 262591, expansion = 12, model3D = 6050843, spell = 1229002, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 6}, {id = 239201, amount = 4}} },
{ id = 262592, expansion = 12, model3D = 6050852, spell = 1229003, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 22}, {id = 239201, amount = 8}, {id = 239198, amount = 8}} }, 
{ id = 262593, expansion = 12, model3D = 6050855, spell = 1246919, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 4}, {id = 239198, amount = 4}} }, 
{ id = 262611, expansion = 12, model3D = 6701013, spell = 1246929, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239702, amount = 4}} }, 
{ id = 248121, expansion = 10, model3D = 4497614, spell = 1259247, skill = "Dragonflight Tailoring", skillNeeded = 80, reagents = {{id = 251773, amount = 35}, {id = 193926, amount = 20}, {id = 190395, amount = 16}, {id = 192095, amount = 12}, {id = 194751, amount = 5}} }, 
{ id = 252755, expansion = 11, model3D = 4902728, spell = 1260215, skill = "Khaz Algar Tailoring", skillNeeded = 80, reagents = {{id = 248012, amount = 30}, {id = 224764, amount = 12}, {id = 222615, amount = 4}, {id = 224824, amount = 6}} }, 
{ id = 245305, expansion = 11, model3D = 5793097, spell = 1260326, skill = "Khaz Algar Tailoring", skillNeeded = 80, reagents = {{id = 248012, amount = 20}, {id = 224764, amount = 20}, {id = 222804, amount = 6}, {id = 224828, amount = 2}} }, 
{ id = 243101, expansion = 8, model3D = 1590845, spell = 1260458, skill = "Battle for Azeroth Tailoring", skillNeeded = 140, reagents = {{id = 251768, amount = 30}, {id = 152576, amount = 30}, {id = 159959, amount = 12}, {id = 158188, amount = 5}} }, 
{ id = 245418, expansion = 8, model3D = 6877804, spell = 1260475, skill = "Battle for Azeroth Tailoring", skillNeeded = 140, reagents = {{id = 251768, amount = 35}, {id = 158378, amount = 16}, {id = 152513, amount = 2}, {id = 159959, amount = 20}} }, 
{ id = 248010, expansion = 7, model3D = 1373509, spell = 1260769, skill = "Legion Tailoring", skillNeeded = 80, reagents = {{id = 251767, amount = 40}, {id = 127004, amount = 20}, {id = 124461, amount = 12}, {id = 127037, amount = 12}} },
{ id = 247920, expansion = 7, model3D = 1378307, spell = 1260774, skill = "Legion Tailoring", skillNeeded = 80, reagents = {{id = 251767, amount = 30}, {id = 124437, amount = 40}, {id = 129032, amount = 15}, {id = 127037, amount = 8}} }, 
{ id = 251546, expansion = 6, model3D = 902328, spell = 1261231, skill = "Warlords of Draenor Tailoring", skillNeeded = 80, reagents = {{id = 251766, amount = 30}, {id = 111557, amount = 40}, {id = 114931, amount = 15}, {id = 109118, amount = 10}, {id = 120945, amount = 5}} }, 
{ id = 245421, expansion = 6, model3D = 979920, spell = 1261232, skill = "Warlords of Draenor Tailoring", skillNeeded = 80, reagents = {{id = 251766, amount = 35}, {id = 111557, amount = 50}, {id = 114931, amount = 12}} }, 
{ id = 247738, expansion = 5, model3D = 575033, spell = 1261250, skill = "Mists of Pandaria Tailoring", skillNeeded = 60, reagents = {{id = 251763, amount = 25}, {id = 82441, amount = 15}, {id = 82444, amount = 2}} }, 
{ id = 245618, expansion = 4, model3D = 305226, spell = 1261317, skill = "Cataclysm Tailoring", skillNeeded = 60, reagents = {{id = 251764, amount = 35}, {id = 53643, amount = 20}, {id = 54849, amount = 6}, {id = 54450, amount = 4}} }, 
{ id = 243336, expansion = 1, model3D = 6711675, spell = 1261688, skill = "Classic Tailoring", skillNeeded = 240, reagents = {{id = 245586, amount = 18}, {id = 14048, amount = 12}, {id = 2604, amount = 4}, {id = 14341, amount = 2}} }, 
{ id = 246685, expansion = 1, model3D = 197968, spell = 1261695, skill = "Classic Tailoring", skillNeeded = 240, reagents = {{id = 245586, amount = 25}, {id = 14342, amount = 12}, {id = 4341, amount = 20}, {id = 14341, amount = 4}, {id = 13926, amount = 2}} }, 
{ id = 257053, expansion = 10, model3D = 4495939, spell = 1261940, skill = "Dragonflight Tailoring", skillNeeded = 80, reagents = {{id = 251773, amount = 28}, {id = 192872, amount = 3}, {id = 193938, amount = 1}, {id = 193935, amount = 1}, {id = 190395, amount = 3}, {id = 194011, amount = 2}} }, 
{ id = 257402, expansion = 4, model3D = 314545, spell = 1262370, skill = "Cataclysm Tailoring", skillNeeded = 60, reagents = {{id = 251764, amount = 26}, {id = 54440, amount = 2}, {id = 54849, amount = 2}, {id = 38426, amount = 8}, {id = 61981, amount = 6}} }, 
{ id = 258303, expansion = 6, model3D = 903883, spell = 1263360, skill = "Warlords of Draenor Tailoring", skillNeeded = 80, reagents = {{id = 251766, amount = 8}, {id = 111557, amount = 16}, {id = 114931, amount = 5}, {id = 113588, amount = 2}} }, 
{ id = 258302, expansion = 5, model3D = 577662, spell = 1263553, skill = "Mists of Pandaria Tailoring", skillNeeded = 60, reagents = {{id = 251763, amount = 8}, {id = 82441, amount = 5}, {id = 74866, amount = 10}} }, 
{ id = 258206, expansion = 3, model3D = 242983, spell = 1263620, skill = "Wrath of the Lich King Tailoring", skillNeeded = 60, reagents = {{id = 251762, amount = 10}, {id = 41595, amount = 8}, {id = 6260, amount = 2}, {id = 2604, amount = 2}, {id = 36925, amount = 1}} }, 
{ id = 258298, expansion = 3, model3D = 242974, spell = 1263627, skill = "Wrath of the Lich King Tailoring", skillNeeded = 60, reagents = {{id = 251762, amount = 40}, {id = 41595, amount = 8}, {id = 41594, amount = 8}, {id = 2604, amount = 4}, {id = 6260, amount = 4}} }, 
{ id = 258202, expansion = 2, model3D = 193745, spell = 1263669, skill = "The Burning Crusade Tailoring", skillNeeded = 60, reagents = {{id = 242691, amount = 18}, {id = 21842, amount = 4}, {id = 22457, amount = 3}, {id = 14341, amount = 3}} }, 
{ id = 258195, expansion = 2, model3D = 192460, spell = 1263692, skill = "The Burning Crusade Tailoring", skillNeeded = 60, reagents = {{id = 242691, amount = 35}, {id = 24271, amount = 4}, {id = 21845, amount = 4}, {id = 24272, amount = 4}} }, 
{ id = 258561, expansion = 9, model3D = 3051055, spell = 1263853, skill = "Shadowlands Tailoring", skillNeeded = 80, reagents = {{id = 251772, amount = 14}, {id = 173202, amount = 12}, {id = 177062, amount = 5}} }, 
{ id = 258557, expansion = 7, model3D = 1282676, spell = 1263858, skill = "Legion Tailoring", skillNeeded = 80, reagents = {{id = 251767, amount = 8}, {id = 124437, amount = 15}, {id = 129032, amount = 5}, {id = 130175, amount = 2}, {id = 127037, amount = 2}} }, 
{ id = 264713, expansion = 9, model3D = 3564033, spell = 1272575, skill = "Shadowlands Tailoring", skillNeeded = 80, reagents = {{id = 251772, amount = 45}, {id = 172439, amount = 20}, {id = 177062, amount = 10}, {id = 177061, amount = 2}, {id = 173170, amount = 6}} },
{ id = 264678, expansion = 9, model3D = 2992361, spell = 1272578, skill = "Shadowlands Tailoring", skillNeeded = 80, reagents = {{id = 251772, amount = 16}, {id = 171828, amount = 12}, {id = 173202, amount = 25}, {id = 177062, amount = 5}, {id = 173173, amount = 1}} }, 
{ id = 279350, expansion = 12, model3D = 5975145, spell = 1296512, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239702, amount = 8}} },
{ id = 279353, expansion = 12, model3D = 1661560, spell = 1296514, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239702, amount = 4}} },

{ id = 282158, expansion = 7, model3D = 1695047, spell = 1313524, skill = "Legion Tailoring", skillNeeded = 85, reagents = {{id = 251767, amount = 6}, {id = 151567, amount = 35}, {id = 127037, amount = 10}} },
{ id = 282184, expansion = 12, model3D = 5019429, spell = 1315440, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 6}, {id = 256963, amount = 6}, {id = 33226, amount = 20}, {id = 252990, amount = 5}, {id = 239198, amount = 2}} },
{ id = 283299, expansion = 8, model3D = 1591070, spell = 1315445, skill = "Battle for Azeroth Tailoring", skillNeeded = 140, reagents = {{id = 251768, amount = 4}, {id = 159959, amount = 10}, {id = 158378, amount = 5}, {id = 168663, amount = 3}} },
{ id = 284244, expansion = 10, model3D = 4551444, spell = 1315691, skill = "Dragonflight Tailoring", skillNeeded = 50, reagents = {{id = 251773, amount = 5}, {id = 193053, amount = 20}, {id = 284249, amount = 2}, {id = 193929, amount = 2}, {id = 192095, amount = 5}} },
{ id = 284246, expansion = 1, model3D = 8096059, spell = 1315757, skill = "Classic Tailoring", skillNeeded = 150, reagents = {{id = 245586, amount = 4}, {id = 14048, amount = 3}, {id = 4339, amount = 3}, {id = 4305, amount = 3}, {id = 14342, amount = 1}, {id = 14341, amount = 2}} },
{ id = 284238, expansion = 6, model3D = 969758, spell = 1315766, skill = "Warlords of Draenor Tailoring", skillNeeded = 0, reagents = {{id = 251766, amount = 6}, {id = 111557, amount = 8}, {id = 114931, amount = 3}, {id = 113588, amount = 1}} },
    },
  },
}
-------------------------------------------------
-- BOSS DROPS
-------------------------------------------------
DVD.bossdrops = DVD.bossdrops or {}
DVD.DecorCameraOverrides = DVD.DecorCameraOverrides or {}

DVD.DecorCameraOverrides = {
[197168] = { zoom = -32.0 }, --Dark Iron Chandelier
[4732009] = {zoom = -32.0}, --Hanging Dawn Flower
}

do --Boss Drops

do -- Broken Isles Dungeons
DVD.bossdrops[238857] = { name = "Moon-Blessed Storage Crate", zone = "Darkheart Thicket, Val'sharah", bossencounter = 1657, model3D = 1096755, mapID = 733, expansion = 7, group = "Broken Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[245451] = { name = "Thunder Totem Brazier", zone = "Neltharions Lair, Highmountain", bossencounter = 1687, model3D = 1313217, mapID = 731, expansion = 7, group = "Broken Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[247913] = { name = "Ornate Suramar Table", zone = "Court of Stars, Suramar", bossencounter = 1720, model3D = 1361708, mapID = 763, expansion = 7, group = "Broken Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[241044] = { name = "Argussian Crate", zone = "Seat of Triumvirate, Argus", bossencounter = 1982, model3D = 877007, mapID = 903, expansion = 7, group = "Broken Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Broken Isles Raids
DVD.bossdrops[256682] = { name = "Magistrix's Garden Fountain", zone = "Nighthold, Suramar", bossencounter = 1751, model3D = 1405830, mapID = 766, expansion = 7, group = "Broken Isles Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Broken Isles Events
DVD.bossdrops[257724] = { name = "Bloodtotem Banner", zone = "Highmountain", bossevent = "Highmountain Paragon Chest", model3D = 1313472, mapID = 750, expansion = 7, group = "Broken Isles Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[245449] = { name = "Ancient Elven Highback Chair", zone = "Suramar", bossevent = "Withered Army Training", model3D = 1096835, mapID = 680, expansion = 7, group = "Broken Isles Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Darkshore Rares
DVD.bossdrops[241066] = { name = "Forsaken Spiked Brazier", zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6431408, mapID = 62, expansion = 8, group = "Darkshore Rares", note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[245462] = { name = "Banshee Queen's Banner", zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 2530077, mapID = 62, expansion = 8, group = "Darkshore Rares", note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[245627] = { name = "Elven Temple Brazier", zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6938369, mapID = 62, expansion = 8, group = "Darkshore Rares", note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[246110] = { name = "Filigree Moon Sconce", zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6980565, mapID = 62, expansion = 8, group = "Darkshore Rares", note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Draenor Dungeons
DVD.bossdrops[251331] = { name = "Draenic Ottoman", zone = "Auchindoun, Talador", bossencounter = 1225, model3D = 1025872, mapID = 593, expansion = 6, group = "Draenor Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[245434] = { name = "Orgrimmar Sconce", zone = "Iron Docks, Gorgrond", bossencounter = 1238, model3D = 1005503, mapID = 595, expansion = 6, group = "Draenor Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[258744] = { name = "Skyreach Circular Table", zone = "Skyreach, Spires of Arak", bossencounter = 968, model3D = 971695, mapID = 602, expansion = 6, group = "Draenor Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }

DVD.bossdrops[284194] = { name = "Everbloom Forest Floor", zone = "The Everbloom, Gorgrond", bossencounter = 1756, model3D = 1033500, mapID = 621, expansion = 6, group = "Draenor Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Dragon Isles Dungeons
DVD.bossdrops[256354] = { name = "Qalashi Goulash", zone = "Neltharus, Waking Shores", bossencounter = 2501, model3D = 4420033, mapID = 2080, expansion = 10, group = "Dragon Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[256428] = { name = "Valdrakken Hanging Lamp", zone = "Ruby Life Pools, Waking Shores", bossencounter = 2503, model3D = 3883458, mapID = 2094, expansion = 10, group = "Dragon Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[260359] = { name = "Valdrakken Bookcase", zone = "Algeth'ar Academy, Thaldraszus", bossencounter = 2514, model3D = 6431406, mapID = 2099, expansion = 10, group = "Dragon Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Eastern Kingdoms Dungeons
DVD.bossdrops[248332] = { name = "Stormwind Footlocker", zone = "The Deadmines, Westfall", bossencounter = 95, model3D = 936398, mapID = 292, expansion = 1, group = "Eastern Kingdoms Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[244655] = { name = "Gilnean Circular Rug", zone = "Shadowfang Keep, Silverpine Forest", bossencounter = 100, model3D = 1379266, mapID = 315, expansion = 1, group = "Eastern Kingdoms Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[246429] = { name = "Dark Iron Chandelier", zone = "Blackrock Depths, Burning Steppes", bossencounter = 387, model3D = 197168, mapID = 243, expansion = 1, group = "Eastern Kingdoms Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[245435] = { name = "Horde Battle Emblem", zone = "Upper Blackrock Spire, Burning Steppes", bossencounter = 1234, model3D = 1005505, mapID = 618, expansion = 1, group = "Eastern Kingdoms Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[246865] = { name = "Tome of Reliquary Insights", zone = "Karazhan, Deadwind Pass", bossencounter = 1838, model3D = 4335906, mapID = 822, expansion = 1, group = "Eastern Kingdoms Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Eversong Woods Dungeons
DVD.bossdrops[256683] = { name = "Silvermoon Training Dummy", zone = "Winderunner Spire, Eversong Woods", bossencounter = 2658, model3D = 6190527, mapID = 2499, expansion = 12, group = "Eversong Woods Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Eversong Woods Events
DVD.bossdrops[243106] = { name = "Gemmed Eversong Lantern", zone = "Eversong Woods", bossevent = "Triple-Locked Safebox", model3D = 4381789, mapID = 2395, expansion = 12, group = "Eversong Woods Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[245282] = { name = "Silvermoon Library Bookcase", zone = "Eversong Woods", bossevent = "Incomplete Book of Sonnets", model3D = 4478904, mapID = 2393, expansion = 12, group = "Eversong Woods Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[251912] = { name = "Goldenmist Grapes", zone = "Eversong Woods", bossevent = "Stone Vat", model3D = 6051298, mapID = 2395, expansion = 12, group = "Eversong Woods Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[263211] = { name = "Gilded Eversong Cup", zone = "Eversong Woods", bossevent = "Gift of the Phoenix", model3D = 6025940, mapID = 2395, expansion = 12, group = "Eversong Woods Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Harandar Dungeons
DVD.bossdrops[253451] = { name = "Veilroot Fountain", zone = "The Binding Vale, Harandar", bossencounter = 2772, model3D = 6839738, mapID = 2500, expansion = 12, group = "Harandar Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Harandar Raids
DVD.bossdrops[247235] = { name = "Luminous Rotshroom", zone = "Sporefall, Harandar", bossencounter = 2711, model3D = 6225707, mapID = 2427, expansion = 12, group = "Harandar Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264246] = { name = "Eerie Iridescent Riftshroom", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 5746809, mapID = 2532, expansion = 12, group = "Harandar Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[265950] = { name = "Vanquisher's Aureate Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7550712, mapID = 2532, expansion = 12, group = "Harandar Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[266886] = { name = "Vanquisher's Gleaming Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7556293, mapID = 2532, expansion = 12, group = "Harandar Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[267645] = { name = "Vanquisher's Argent Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7633281, mapID = 2532, expansion = 12, group = "Harandar Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Isle of Quel'Danas Dungeons
DVD.bossdrops[263230] = { name = "Magister's Bookshelf", zone = "Magisters' Terrace, Isle of Quel'Danas", bossencounter = 2662, model3D = 6050875, mapID = 2520, expansion = 12, group = "Isle of Quel'Danas Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Isle of Quel'Danas Raids
DVD.bossdrops[264187] = { name = "Blessed Phoenix Egg", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2739, model3D = 7317243, mapID = 2533, expansion = 12, group = "Isle of Quel'Danas Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264492] = { name = "Chaotic Void Maw", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 6224353, mapID = 2534, expansion = 12, group = "Isle of Quel'Danas Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[265949] = { name = "Vanquisher's Aureate Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7550710, mapID = 2534, expansion = 12, group = "Isle of Quel'Danas Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[266885] = { name = "Vanquisher's Gleaming Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7556292, mapID = 2534, expansion = 12, group = "Isle of Quel'Danas Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[267646] = { name = "Vanquisher's Argent Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7633282, mapID = 2534, expansion = 12, group = "Isle of Quel'Danas Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Khaz Algar Events
DVD.bossdrops[245294] = { source = "drop", name = "Distinguished Actor's Chest", zone = "Isle of Dorn", bossevent = "Theater Troupe", model3D = 5647269, mapID = 2248, expansion = 11, group = "Khaz Algar Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[245320] = { source = "drop", name = "Undermine", zone = "Undermine", bossevent = "Shipping and Handling Jobs", model3D = 5689822, mapID = 2346, expansion = 11, group = "Khaz Algar Events", note = "Requires Shipping and Handling Job Streak" }
DVD.bossdrops[245315] = { source = "treasure", zone = "Undermine", bossevent = "Scraps Heaps", model3D = 5788649, mapID = 2346, expansion = 11, group = "Khaz Algar Events", note = "Requires Scraps Heaps" }
end

do -- Khaz Algar Dungeons
DVD.bossdrops[245938] = { name = "Overgrown Arathi Trellis", zone = "Priory of the Sacred Flame, Hallowfall", bossencounter = 2573, model3D = 5360239, mapID = 2309, expansion = 11, group = "Khaz Algar Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[245560] = { name = "Meadery Ochre Window", zone = "Cinderbrew Meadery, Isle of Dorn", bossencounter = 2589, model3D = 6924252, mapID = 2335, expansion = 11, group = "Khaz Algar Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[258268] = { name = "Waxmaster's Candle Rack", zone = "DarkFlame Cleft, Ringing Deeps", bossencounter = 2561, model3D = 5503818, mapID = 2303, expansion = 11, group = "Khaz Algar Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Kul Tiras Dungeons
DVD.bossdrops[246421] = { name = "Stolen Ironforge Seat", zone = "Freehold, Tiragarde Sound", bossencounter = 2095, model3D = 197304, mapID = 936, expansion = 8, group = "Kul Tiras Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[245681] = { name = "Tidesage's Fireplace", zone = "Shrine of the Storm, Stormsong Valley", bossencounter = 2156, model3D = 6980179, mapID = 1040, expansion = 8, group = "Kul Tiras Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Kul Tiras Raids
DVD.bossdrops[267008] = { name = "Crucible Votive Rack", zone = "Crucible of Storms, Stormsong Valley", bossencounter = 2328, model3D = 1959305, mapID = 1345, expansion = 8, group = "Kul Tiras Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do --  Labyrinth of Kindo'jan 
DVD.bossdrops[244350] = { name = "Shattered Amani Ritual Urn", zone = "Eversong Woods", bossevent = "Labyrinth of Kindo'jan", model3D = 6904854, mapID = 2395, expansion = 12, group = "Labyrinth of Kindo'jan", note = "|cffFFD700Right-click to pin location on the map|r" }
DVD.bossdrops[252044] = { name = "Amani Horn Cup", zone = "Eversong Woods", bossevent = "Labyrinth of Kindo'jan", model3D = 6212459, mapID = 2395, expansion = 12, group = "Labyrinth of Kindo'jan", note = "|cffFFD700Right-click to pin location on the map|r" }
DVD.bossdrops[264484] = { name = "Blue Amani Tapestry", zone = "Eversong Woods", bossevent = "Labyrinth of Kindo'jan", model3D = 6797442, mapID = 2395, expansion = 12, group = "Labyrinth of Kindo'jan", note = "|cffFFD700Right-click to pin location on the map|r" }
DVD.bossdrops[263321] = { name = "Frayed Amani Offering Basket", zone = "Eversong Woods", bossevent = "Labyrinth of Kindo'jan", model3D = 6075569, mapID = 2395, expansion = 12, group = "Labyrinth of Kindo'jan", note = "|cffFFD700Right-click to pin location on the map|r" }
DVD.bossdrops[284359] = { name = "Corroded Amani Sconce", zone = "Eversong Woods", bossevent = "Labyrinth of Kindo'jan", model3D = 7914429, mapID = 2395, expansion = 12, group = "Labyrinth of Kindo'jan", note = "|cffFFD700Right-click to pin location on the map|r" }
DVD.bossdrops[264256] = { name = "Wall-Mounted Amani Animal Trophy", zone = "Eversong Woods", bossevent = "Labyrinth of Kindo'jan", model3D = 6212417, mapID = 2395, expansion = 12, group = "Labyrinth of Kindo'jan", note = "|cffFFD700Right-click to pin location on the map|r" }


end

do -- Mechagon Island Events
DVD.bossdrops[257928] = { name = "Gnomeregan Recyli-Kiln", zone = "Mechagon Island", bossevent = "Junkwatt Depot Recycling", model3D = 2929684, mapID = 1462, expansion = 8, group = "Mechagon Island Events", note = "Strange Recycling Requisition" }
DVD.bossdrops[246481] = { name = "Retired Industrial Gnomegrabber", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1624683, mapID = 1462, expansion = 8, group = "Mechagon Island Events", note = "Self-Assembling Homeware Kit" }
DVD.bossdrops[246599] = { name = "Self-Sealing Stembarrel", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1842467, mapID = 1462, expansion = 8, group = "Mechagon Island Events", note = "Self-Assembling Homeware Kit" }
DVD.bossdrops[246602] = { name = "Small H.O.M.E. Cog", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 2067166, mapID = 1462, expansion = 8, group = "Mechagon Island Events", note = "Self-Assembling Homeware Kit" }
DVD.bossdrops[246600] = { name = "Small Mechanical Crate", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1842492, mapID = 1462, expansion = 8, group = "Mechagon Island Events", note = "Self-Assembling Homeware Kit" }
end

do -- Mechagon Island Dungeons
DVD.bossdrops[255672] = { name = "Gnomish Tesla Tower", zone = "Mechagon", bossencounter = 2331, model3D = 2745099, mapID = 1497, expansion = 8, group = "Mechagon Island Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Midnight Delves
DVD.bossdrops[264330] = { name = "Amani Hanging Brazier", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6075573, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[267009] = { name = "Amani Training Dummy", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6212435, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[264258] = { name = "Blossoming Forge", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6225683, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[264342] = { name = "Cosmic Void Cache", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 7136759, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[251967] = { name = "Fungarian Banner", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6225689, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[263036] = { name = "Hanging Dawnflower", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 4732009, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[263042] = { name = "Rootlight Lamppost", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6252874, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[263233] = { name = "Sin'dorei Spinning Library", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6050885, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[264329] = { name = "Amani Dining Table", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6075571, mapID = 2537, expansion = 12, group = "Midnight Delves", note = "Drops in:\n\n• Parhelion Plaza\n• The Shadow Enclave\n• Atal'Aman\n• Collegiate Calamity\n• The Darkway\n• Twilight Crypts\n• The Gulf of Memory\n• The Grudge Pit\n• Shadowguard Point\n• Sunkiller Sanctum\n\n|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Northrend Dungeons
DVD.bossdrops[267007] = { name = "Eye of Acherus", zone = "Pit of Saron, IceCrown", bossencounter = 610, model3D = 328250, mapID = 184, expansion = 3, group = "Northrend Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Northrend Events
--DVD.bossdrops[258145] = { name = "Cheese for Glowergold", zone = "Dalaran, Northrend", bossevent = "Cooking Daily", model3D = 6051297, mapID = 125, expansion = 3, group = "Northrend Events", note = "This is a daily Cooking quest on both horde and alliance side" }
end

do -- Pandaria Dungeons
DVD.bossdrops[246846] = { name = "Tome of Pandaren Wisdom", zone = "Temple of the Jade Serpant, Jade Forest", bossencounter = 335, model3D = 534950, mapID = 429, expansion = 5, group = "Pandaria Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Pandaria Raids
DVD.bossdrops[253242] = { name = "Horde Warlord's Throne", zone = "Siege of Orgrimmar, Vale of Eternal Blossoms", bossencounter = 869, model3D = 6905426, mapID = 567, expansion = 5, group = "Pandaria Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Pandaria Events
DVD.bossdrops[248934] = { name = "Golden Cloud Serpent Treasure Chest", zone = "Jade Forest", bossevent = "Frederick the Fabulous", model3D = 629723, mapID = 371, expansion = 5, group = "Pandaria Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Silvermoon City Dungeons
DVD.bossdrops[263238] = { name = "Illicit Long Table", zone = "Murder Row, Silvermoon City", bossencounter = 2682, model3D = 7296096, mapID = 2434, expansion = 12, group = "Silvermoon City Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[246857] = { name = "Shu'halo Perspective Painting", zone = "Murder Row, Silvermoon City", bossevent = "Cravitz Lorent", model3D = 1600035, mapID = 2433, expansion = 12, group = "Silvermoon City Dungeons", note = "13 of Sargle's Fortunes." }
end

do -- The Arcanostorage Sphere
DVD.bossdrops[253397] = { name = "Revered Deepstone Table", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6654743, expansion = 12, group = "The Arcanostorage Sphere", note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" }
DVD.bossdrops[245539] = { name = "Elegant Enchanted Vanity", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6930643, expansion = 12, group = "The Arcanostorage Sphere", note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" }
DVD.bossdrops[253481] = { name = "Masterful Sin'dorei Gravestone", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6036347, expansion = 12, group = "The Arcanostorage Sphere", note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" }
DVD.bossdrops[249923] = { name = "Sin'dorei Golden Welcome", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 7216049, expansion = 12, group = "The Arcanostorage Sphere", note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" }
DVD.bossdrops[254561] = { name = "Ogre Champion's Prized Skull", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6654718, expansion = 12, group = "The Arcanostorage Sphere", note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" }
DVD.bossdrops[246958] = { name = "Mastercrafted Fungal Row Planter", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6225703, expansion = 12, group = "The Arcanostorage Sphere", note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" }
end

do -- The Coiled Isle Dungeons
DVD.bossdrops[279211] = { name = "Pillar of the Fanged Altar", zone = "Altar of Fangs", bossencounter = 2880, model3D = 7277191, mapID = 2590, expansion = 12, group = "The Coiled Isle Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- The Coiled Isle Delves
DVD.bossdrops[267080] = { name = "Amani Blueflame Chandelier", zone = "The Coiled Isle", bossevent = "The Coiled Isle Delves", model3D = 6153830, mapID = 2512, expansion = 12, group = "The Coiled Isle Delves", note = "Drops in:\n\n• Ring of Glory\n• Gnarldor\n\n |cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[275855] = { name = "Zul'Aman Swamp Palm Sprout", zone = "The Coiled Isle", bossevent = "The Coiled Isle Delves", model3D = 5869189, mapID = 2512, expansion = 12, group = "The Coiled Isle Delves", note = "Drops in:\n\n• Ring of Glory\n• Gnarldor\n\n |cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[248963] = { name = "Spirit-Touched Amani Mask", zone = "The Coiled Isle", bossevent = "The Coiled Isle Delves", model3D = 6163854, mapID = 2512, expansion = 12, group = "The Coiled Isle Delves", note = "Drops in:\n\n• Ring of Glory\n• Gnarldor\n\n |cffFFD700Right-click to pin locations on the map|r" }
end

do -- The Coiled Isle Raids
DVD.bossdrops[279112] = { name = "Clumped Asteroidea", zone = "The Tidebound Grotto", bossencounter = 2849, model3D = 2433564, mapID = 2632, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[272361] = { name = "Venomous Pyre", zone = "The Venomous Abyss", bossencounter = 2882, model3D = 7277208, mapID = 2608, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279500] = { name = "Rage of the Shackled Mural", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 8117703, mapID = 2610, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279125] = { name = "The Venomous Abyss Aureate Trophy", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 7930280, mapID = 2610, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279129] = { name = "The Venomous Abyss Gleaming Trophy", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 7930281, mapID = 2610, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279127] = { name = "The Venomous Abyss Argent Trophyl", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 7930282, mapID = 2610, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279118] = { name = "Lost Explorers Mailbox", zone = "The Venomous Abyss", bossencounter = 2894, model3D = 1992950, mapID = 2609, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279115] = { name = "Soulcoiler's Ritual Candle", zone = "The Venomous Abyss", bossencounter = 2888, model3D = 7515872, mapID = 2606, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279122] = { name = "Venom-Fanged Font", zone = "The Venomous Abyss", bossencounter = 2887, model3D = 7277192, mapID = 2607, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[279131] = { name = "Pillar of the Coiled Isle", zone = "The Venomous Abyss", bossencounter = 2883, model3D = 7277190, mapID = 2610, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[244343] = { name = "Vessel of the Howling Ossuary", zone = "The Venomous Abyss", bossencounter = 2871, model3D = 6870560, mapID = 2609, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264716] = { name = "Hexed Tomb Brazier", zone = "The Venomous Abyss", bossencounter = 2874, model3D = 6153828, mapID = 2608, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[281213] = { name = "Kith'ix's Seal", zone = "The Unbinding of Kith'ix", bossencounter = 3513, model3D = 7949197, mapID = 2669, expansion = 12, group = "The Coiled Isle Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- The Coiled Isles Rares
DVD.bossdrops[263874] = { name = "Emerald-Encrusted Amani Ritual Skull", zone = "The Coiled Isle", bossevent = "Ral'kala", model3D = 6153816, mapID = 2512, expansion = 12, group = "The Coiled Isles Rares", note = "Drops from:\n\n• Ral'kala\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[278154] = { name = "Hooked Net Trap", zone = "The Coiled Isle", bossevent = "Ral'kala", model3D = 2025842, mapID = 2512, expansion = 12, group = "The Coiled Isles Rares", note = "Drops from:\n\n• Ral'kala\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[278374] = { name = "Preyhunter's Fanged Bust", zone = "The Coiled Isle", bossevent = "Ral'kala", model3D = 7808628, mapID = 2512, expansion = 12, group = "The Coiled Isles Rares", note = "Drops from:\n\n• Ral'kala\n\n|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[278378] = { name = "Preyhunter's Scaled Bust", zone = "The Coiled Isle", bossevent = "Ral'kala", model3D = 7808625, mapID = 2512, expansion = 12, group = "The Coiled Isles Rares", note = "Drops from:\n\n• Ral'kala\n\n|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Voidstorm Dungeons
DVD.bossdrops[264338] = { name = "Domanaar Control Console", zone = "Nexus-Point Xenas, Voidstorm", bossencounter = 2815, model3D = 6210900, mapID = 2556, expansion = 12, group = "Voidstorm Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264336] = { name = "Voidlight Brazier", zone = "Voidscar Arena, Voidstorm", bossencounter = 2793, model3D = 6210883, mapID = 2573, expansion = 12, group = "Voidstorm Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Voidstorm Raids
DVD.bossdrops[264497] = { name = "Imperator's Torment Crystal", zone = "The Voidspire, Voidstorm", bossencounter = 2733, model3D = 7136760, mapID = 2529, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264498] = { name = "Voltaic Trigore Egg", zone = "The Voidspire, Voidstorm", bossencounter = 2734, model3D = 7302402, mapID = 2529, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264491] = { name = "Voidbound Holding Cell", zone = "The Voidspire, Voidstorm", bossencounter = 2735, model3D = 6210896, mapID = 2529, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264494] = { name = "Banded Domanaar Storage Crate", zone = "The Voidspire, Voidstorm", bossencounter = 2736, model3D = 6391990, mapID = 2529, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[262957] = { name = "Tattered Vanguard Banner", zone = "The Voidspire, Voidstorm", bossencounter = 2737, model3D = 7115753, mapID = 2529, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[265951] = { name = "Vanquisher's Aureate Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7550713, mapID = 2530, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[266887] = { name = "Vanquisher's Gleaming Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7556294, mapID = 2530, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[268049] = { name = "Vanquisher's Argent Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7633283, mapID = 2530, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[269269] = { name = "Devouring Ritual Spire", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 6224355, mapID = 2530, expansion = 12, group = "Voidstorm Raids", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Voidstorm Events
DVD.bossdrops[262608] = { name = "Void Elf Stool", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 6701001, mapID = 2405, expansion = 12, group = "Voidstorm Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[264343] = { name = "Cosmic Void Gravitational Orb", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 7136761, mapID = 2405, expansion = 12, group = "Voidstorm Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[264483] = { name = "Cosmic Void Campfire", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 6701007, mapID = 2405, expansion = 12, group = "Voidstorm Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[262467] = { name = "Void Elf Round Table", zone = "Voidstorm", bossevent = "Stellar Stash", model3D = 6700999, mapID = 2444, expansion = 12, group = "Voidstorm Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
DVD.bossdrops[264482] = { name = "Void Elf Torch", zone = "Voidstorm", bossevent = "Malignant Chest", model3D = 6701004, mapID = 2405, expansion = 12, group = "Voidstorm Events", note = "|cffFFD700Right-click to pin locations on the map|r" }
end

do -- Zandalar Dungeons
DVD.bossdrops[278245] = { name = "Royal Attendant's Coffin", zone = "Kings' Rest", bossencounter = 2172, model3D = 1981805, mapID = 1004, expansion = 8, group = "Zandalar Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[278982] = { name = "Hatchery of Hissing Eggs", zone = "Temple of Sethraliss", bossencounter = 2145, model3D = 1660581, mapID = 1043, expansion = 8, group = "Zandalar Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end

do -- Zul'Aman Dungeons
DVD.bossdrops[264332] = { name = "Amani Ritual Altar", zone = "Den of Nalorakk, Zul'Aman", bossencounter = 2778, model3D = 6153808, mapID = 2513, expansion = 12, group = "Zul'Aman Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
DVD.bossdrops[264717] = { name = "Amani Warding Hex", zone = "Maisara Caverns, Zul'aman", bossencounter = 2812, model3D = 6195760, mapID = 2501, expansion = 12, group = "Zul'Aman Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }
end
end
-------------------------------------------------
-- 12.1.7 Drops
-------------------------------------------------
if (select(4, GetBuildInfo()) or 0) >= 120107 then
DVD.bossdrops[285096] = { name = "Azure Mage Hunter's Rune Circle", zone = "The Nexus", bossencounter = 621, model3D = 8353887, mapID = 129, expansion = 3, group = "Northrend Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  }
DVD.bossdrops[284605] = { name = "Wardens' Pool of Judgment", zone = "Vault of  Wardens", bossencounter = 1470, model3D = 1310776, mapID = 712, expansion = 7, group = "Broken Isles Dungeons", note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  }
end
-------------------------------------------------
-- ACHIEVEMENTS
-------------------------------------------------
DVD.achievements = DVD.achievements or {}
--215
DVD.achievements = {
  {
    name = "Quests", --23
    achievements = {
      --[[Eastern Kingdoms]]{ id = 940, type = "achievement", itemID = 248808, model3D = 6924248, title = "Nesingwary Elk Trophy", faction = "neutral" },
	  --[[Eastern Kingdoms]]{ id = 5442, type = "achievement", itemID = 248796, model3D = 660974, title = "Goldshire Food Cart", faction = "neutral" },
	  --[[Northrend]]{ id = 938, type = "achievement", itemID = 248807, model3D = 6924247, title = "Nesingwary Shoveltusk Trophy", faction = "neutral" },
      --[[Legion]]{ id = 10698, type = "achievement", itemID = 245697, model3D = 1108752, title = "Shala'nir Feather Bed", faction = "neutral" },
      --[[Legion]]{ id = 11340, type = "achievement", itemID = 247843, model3D = 1361683, title = "Deluxe Suramar Sleeper", faction = "neutral" },      
      --[[Legion]]{ id = 11124, type = "achievement", itemID = 245448, model3D = 1399648, title = "\"Night on the Jeweled Estate\" Painting", faction = "neutral" },
      --[[Legion]]{ id = 10398, type = "achievement", itemID = 257721, model3D = 1255415, title = "Skyhorn Arrow Kite", faction = "neutral" },	
	  --[[Battle for Azeroth]]{ id = 12582, type = "achievement", itemID = 245271, model3D = 6905476, title = "Old Salt's Fireplace", faction = "alliance"  },
	  --[[Battle for Azeroth]]{ id = 13284, type = "achievement", itemID = 245476, model3D = 2481224, title = "Large Forsaken War Tent", faction = "horde"  },	  
	  --[[Battle for Azeroth]]{ id = 12614, type = "achievement", itemID = 245497, model3D = 2432865, title = "Golden Loa's Altar", faction = "horde"  },
	  --[[Battle for Azeroth]]{ id = 13039, type = "achievement", itemID = 245494, model3D = 1922339, title = "Idol of Pa'ku, Master of Winds", faction = "horde"  },
	  --[[Battle for Azeroth]]{ id = 13038, type = "achievement", itemID = 245487, model3D = 1597477, title = "Bookcase of Gonk", faction = "horde"  },
	  --[[Battle for Azeroth]]{ id = 12509, type = "achievement", itemID = 241062, model3D = 2620664, title = "Lordaeron Rectangular Rug", faction = "horde"  },	
      --[[Battle for Azeroth]]{ id = 13049, type = "achievement", itemID = 252653, model3D = 7301003, title = "Tiragarde Treasure Chest", faction = "alliance"  },
	  --[[Battle for Azeroth]]{ id = 12997, type = "achievement", itemID = 252654, model3D = 7301012, title = "Proudmoore Green Drape", faction = "alliance" },	  
	  --[[Battle for Azeroth]]{ id = 12479, type = "achievement", itemID = 245522, model3D = 668138, title = "Grand Mask of Bwonsamdi, Loa of Graves", faction = "horde"  },	  
	  --[[Dragonflight]]{ id = 17773, type = "achievement", itemID = 248104, model3D = 3883455, title = "Pentagonal Stone Table", faction = "neutral" },
	  --[[Dragonflight]]{ id = 19507, type = "achievement", itemID = 248105, model3D = 3886996, title = "Valdrakken Sconce", faction = "neutral" },
	  --[[Dragonflight]]{ id = 19719, type = "achievement", itemID = 245520, model3D = 304638, title = "Gilnean Celebration Keg", faction = "neutral" },
	  --[[War Within]]{ id = 20595, type = "achievement", itemID = 252757, model3D = 5389584, title = "Boulder Springs Recliner", faction = "neutral" },
      --[[War Within]]{ id = 40894, type = "achievement", itemID = 245324, model3D = 5788117, title = "Rocket-Powered Fountain", faction = "neutral" },
	  --[[Midnight]]{ id = 61574, type = "achievement", itemID = 264259, model3D = 6252866, title = "On'ohia's Call", faction = "neutral"},

    --[[Shadowlands]]{ id = 14164, type = "achievement", itemID = 283262, model3D = 3229538, title = "Restored Night Fae Sigil", faction = "neutral" }
	  
    }
  },
  {
    name = "Exploration", --27
    achievements = {
      --[[Legion]]{ id = 11257, type = "achievement", itemID = 245460, model3D = 1402222, title = "Skyhorn Storage Chest", faction = "neutral" },
      --[[Legion]]{ id = 11258, type = "achievement", itemID = 245703, model3D = 1349622, title = "Kaldorei Treasure Trove", faction = "neutral" },
	  --[[Legion]]{ id = 12026, type = "achievement", itemID = 282162, model3D = 1861600, title = "Ceremonial Lightforged Standard", faction = "neutral" }, --exploration
      --[[Legion]]{ id = 12102, type = "achievement", itemID = 281682, model3D = 1573324, title = "Shielded Lightforged Pylon", faction = "neutral" }, --exploration
      --[[Shadowlands]]{ id = 14311, type = "achievement", itemID = 284546, model3D = 3189119, title = "Runic Kyrian Reliquary", faction = "neutral" }, --exploration	  
	  --[[Battle for Azeroth]]{ id = 13473, type = "achievement", itemID = 246483, model3D = 2745098, title = "Redundant Reclamation Rig", faction = "neutral" },
	  --[[Battle for Azeroth]]{ id = 13018, type = "achievement", itemID = 244326, model3D = 6877810, title = "Zandalari Wall Shelf", faction = "neutral" },
	  --[[Battle for Azeroth]]{ id = 13477, type = "achievement", itemID = 246598, model3D = 1842466, title = "Screw-Sealed Stembarrel", faction = "neutral" },
	  --[[Battle for Azeroth]]{ id = 13475, type = "achievement", itemID = 246603, model3D = 2068146, title = "Gnomish Cog Stack", faction = "neutral" },	  
	  --[[Dragon Isles]]{ id = 17529, type = "achievement", itemID = 248656, model3D = 7141936, title = "Dragon's Hoard Chest", faction = "neutral" },
	  --[[War Within]]{ id = 40504, type = "achievement", itemID = 253023, model3D = 4904552, title = "Rambleshire Resting Platform", faction = "neutral" },
	  --[[War Within]]{ id = 41186, type = "achievement", itemID = 246867, model3D = 5464689, title = "Tome of Earthen Directives", faction = "neutral" },
	  --[[War Within]]{ id = 40542, type = "achievement", itemID = 246866, model3D = 5007024, title = "Kaheti Scribe's Records", faction = "neutral" },
	  --[[War Within]]{ id = 40859, type = "achievement", itemID = 253037, model3D = 4906427, title = "Dornogal Brazier", faction = "neutral" },	
      --[[Midnight]]{ id = 61264, type = "achievement", itemID = 264266, model3D = 6718307, title = "Lightbloom Moss Mound", faction = "neutral" },
      --[[Midnight]]{ id = 61507, type = "achievement", itemID = 257367, model3D = 7338839, title = "Silvermoon Energy Focus", faction = "neutral" },
      --[[Midnight]]{ id = 62122, type = "achievement", itemID = 264335, model3D = 6163851, title = "Colossal Amani Stone Visage", faction = "neutral" },
      --[[Midnight]]{ id = 62130, type = "achievement", itemID = 264493, model3D = 6391989, title = "Opened Domanaar Storage Crate", faction = "neutral" },
      --[[Midnight]]{ id = 62185, type = "achievement", itemID = 244656, model3D = 4239029, title = "Silvermoon Painter's Cushion", faction = "neutral" },
      --[[Midnight]]{ id = 62186, type = "achievement", itemID = 251909, model3D = 6050866, title = "Eversong Feast Platter", faction = "neutral" },
      --[[Midnight]]{ id = 62288, type = "achievement", itemID = 254773, model3D = 7241260, title = "\"Eversong Lantern\" Painting", faction = "neutral" },
      --[[Midnight]]{ id = 62289, type = "achievement", itemID = 256925, model3D = 6125173, title = "Amani Spearhunter's Spit", faction = "neutral" },
      --[[Midnight]]{ id = 62290, type = "achievement", itemID = 265792, model3D = 6851751, title = "Fungarian Vine Fence", faction = "neutral" },
      --[[Midnight]]{ id = 62291, type = "achievement", itemID = 264656, model3D = 6700992, title = "Void Elf Weapon Rack", faction = "neutral" },
	  --[[Midnight]] { id = 63358, type = "achievement", itemID = 263873, model3D = 6075561, title = "Amani Forge", faction = "neutral" },	 
	  --[[Midnight]]{ id = 63432, type = "achievement", itemID = 248962, model3D = 6163853, title = "Mysterious Voodoo Mask", faction = "neutral" },
	  --[[Midnight]]{ id = 63636, type = "achievement", itemID = 279922, model3D = 7277155, title = "Altar of Corrosion", faction = "neutral" },
    }
  },
    {
    name = "Feats of Strength",--5
    achievements = {
      --[[Events]]{ id = 62387, type = "achievement", itemID = 260785, model3D = 7476464, title = "Mini Dark Portal", faction = "neutral" }, 
      --[[Events]]{ id = 63685, type = "achievement", itemID = 281107, model3D = 8198437, title = "Blizzcon Doormat", faction = "neutral" }, 	  
	  --[[PROMO]]{ id = 63343, type = "achievement", itemID = 274731, model3D = 7845475, title = "Prized Orb of Azeroth", faction = "neutral" },
	  --[[PROMO]]{ id = 63343, type = "achievement", itemID = 274734, model3D = 7845476, title = "Framed Horde Pride", faction = "neutral" },
	  --[[PROMO]]{ id = 63343, type = "achievement", itemID = 274736, model3D = 7845477, title = "Framed Alliance Pride", faction = "neutral" },
    }
  },
     {
    name = "World Events",--1
    achievements = {
      --[[Hallow's End]]{ id = 10365, type = "achievement", itemID = 282287, model3D = 1246563, title = "Scarecrow Pepe", faction = "neutral" }, 
    }
  }, 
  {
    name = "Expansion Features", --103
    achievements = {
      { id = 19458, type = "achievement", itemID = 248124, model3D = 7134811, title = "The Great Hoard", faction = "neutral" },
      { id = 20501, type = "achievement", itemID = 248125, model3D = 7134869, title = "Portal to Damnation", faction = "neutral" },
      { id = 40953, type = "achievement", itemID = 247667, model3D = 1934697, title = "MOTHER's Titanic Brazier", faction = "neutral"  },
	  { id = 40953, type = "achievement", itemID = 247668, model3D = 3074885, title = "N'Zoth's Captured Eye", faction = "neutral"  },
      { id = 61451, type = "achievement", itemID = 257353, model3D = 5160932, title = "Drained Dark Heart of Galakrond", faction = "neutral" },
      --[[Pandaria Scenarios]]{ id = 8316, type = "achievement", itemID = 256425, model3D = 7385422, title = "Shadowforge Stone Chair", faction = "neutral" },	 
      --[[Lorewalking]]{ id = 42187, type = "achievement", itemID = 257354, model3D = 5916218, title = "Scroll of K'aresh's Fall", faction = "neutral" },
      --[[Lorewalking]]{ id = 42188, type = "achievement", itemID = 257355, model3D = 5916220, title = "Tome of the Survivor", faction = "neutral" },
      --[[Lorewalking]]{ id = 42189, type = "achievement", itemID = 257351, model3D = 1354768, title = "Tale of the Penultimate Lich King", faction = "neutral" },
      --[[Lorewalking]]{ id = 61467, type = "achievement", itemID = 245332, model3D = 6717972, title = "Tome of Silvermoon Intrigue", faction = "neutral" },
	  --[[Lorewalking]]{ id = 61442, type = "achievement", itemID = 271971, model3D = 244167, title = "Tome of Kings", faction = "neutral" },	
      --[[Legion Class Hall]]{ id = 42270, type = "achievement", itemID = 250115, model3D = 1355367, title = "Ebon Blade Weapon Rack", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42271, type = "achievement", itemID = 249459, model3D = 1301086, title = "Illidari Glaiverest", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42272, type = "achievement", itemID = 260581, model3D = 1108732, title = "Brazier of Elune", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42273, type = "achievement", itemID = 248011, model3D = 1315073, title = "Trueshot Skeletal Dragon Head", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42274, type = "achievement", itemID = 245429, model3D = 964976, title = "Tirisgarde Book Tempest", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42275, type = "achievement", itemID = 248958, model3D = 6877675, title = "Monastery Gong", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42276, type = "achievement", itemID = 250234, model3D = 1267052, title = "Sanctum of Light Candelabra", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42277, type = "achievement", itemID = 250792, model3D = 7240008, title = "Scroll of the Conclave", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42279, type = "achievement", itemID = 260776, model3D = 1345395, title = "Uncrowned Market Stall", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42280, type = "achievement", itemID = 257403, model3D = 366699, title = "Maelstrom Lava Lamp", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42281, type = "achievement", itemID = 248960, model3D = 6877678, title = "Dreadscar Dais", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42282, type = "achievement", itemID = 249466, model3D = 7155606, title = "Valarjar Shield Wall", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42287, type = "achievement", itemID = 250123, model3D = 6892693, title = "Replica Acherus Soul Forge", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42288, type = "achievement", itemID = 249457, model3D = 1260635, title = "Replica Cursed Forge of the Nathrezim", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42289, type = "achievement", itemID = 250134, model3D = 7233615, title = "Seed of Ages Cutting", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42290, type = "achievement", itemID = 250125, model3D = 1276980, title = "Replica Altar of the Eternal Hunt", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42291, type = "achievement", itemID = 250306, model3D = 1311397, title = "Conjured Altar of the Guardian", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42292, type = "achievement", itemID = 262619, model3D = 7483166, title = "Replica Forge of the Roaring Mountain", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42293, type = "achievement", itemID = 250230, model3D = 1247929, title = "Replica Altar of Ancient Kings", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42294, type = "achievement", itemID = 250790, model3D = 7240006, title = "Replica Altar of Light and Shadow", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42295, type = "achievement", itemID = 250787, model3D = 1337146, title = "Replica Crucible of the Uncrowned", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42296, type = "achievement", itemID = 250914, model3D = 1279203, title = "Elemental Altar of the Maelstrom", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42297, type = "achievement", itemID = 248940, model3D = 1277582, title = "Replica Felblood Altar", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 42298, type = "achievement", itemID = 249458, model3D = 1300920, title = "Replica Forge of Odyn", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60962, type = "achievement", itemID = 260584, model3D = 7474233, title = "Replica Libram of the Dead", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60963, type = "achievement", itemID = 249690, model3D = 6892689, title = "Replica Tome of Fel Secrets", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60964, type = "achievement", itemID = 250111, model3D = 1324674, title = "Replica Tome of the Ancients", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60965, type = "achievement", itemID = 250127, model3D = 7233610, title = "Replica Tales of the Hunt", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60966, type = "achievement", itemID = 256674, model3D = 965217, title = "Conjured Archive of the Tirisgarde", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60967, type = "achievement", itemID = 256679, model3D = 1324675, title = "Replica Chronicle of Ages", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60968, type = "achievement", itemID = 250233, model3D = 1267045, title = "Replica Libram of Ancient Kings", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60969, type = "achievement", itemID = 250791, model3D = 7240007, title = "Replica Word of the Conclave", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60970, type = "achievement", itemID = 250788, model3D = 1338498, title = "Stolen Copy of the Blood Ledger", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60971, type = "achievement", itemID = 250915, model3D = 1323611, title = "Replica Words of Wind and Earth", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60972, type = "achievement", itemID = 256907, model3D = 1125315, title = "Replica Tome of Blighted Implements", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60973, type = "achievement", itemID = 257396, model3D = 1325991, title = "Replica Saga of the Valarjar", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60981, type = "achievement", itemID = 250112, model3D = 1338446, title = "Ebon Blade Planning Map", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60982, type = "achievement", itemID = 249518, model3D = 1321783, title = "Fel Hammer Scouting Map", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60983, type = "achievement", itemID = 251013, model3D = 7233616, title = "Cenarion Arch", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60984, type = "achievement", itemID = 250126, model3D = 7233609, title = "Unseen Path Archer's Gallery", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60985, type = "achievement", itemID = 250131, model3D = 1315074, title = "Tirisgarde War Map", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60986, type = "achievement", itemID = 248942, model3D = 1323662, title = "Five Dawns Planning Table", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60987, type = "achievement", itemID = 250236, model3D = 1270418, title = "Silver Hand Weapon Rack", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60988, type = "achievement", itemID = 251636, model3D = 1339273, title = "Netherlight Command Map", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60989, type = "achievement", itemID = 250786, model3D = 1305549, title = "Uncrowned Planning Table", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60990, type = "achievement", itemID = 251014, model3D = 7262794, title = "Earthen Ring Scouting Map", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60991, type = "achievement", itemID = 264242, model3D = 7506478, title = "Dreadscar Battle Planning Map", faction = "neutral" },
      --[[Legion Class Hall]]{ id = 60992, type = "achievement", itemID = 249461, model3D = 1450335, title = "Skyhold War Table", faction = "neutral" }, 
	  
      --[[War Effort]]{ id = 12867, type = "achievement", itemID = 245463, model3D = 2341255, title = "Lordaeron Banded Barrel", faction = "horde"  },
      --[[War Effort]]{ id = 12869, type = "achievement", itemID = 245467, model3D = 2341251, title = "Lordaeron Banded Crate", faction = "horde"  },
      --[[War Effort]]{ id = 12870, type = "achievement", itemID = 245483, model3D = 2351848, title = "Lordaeron Spiked Weapon Rack", faction = "horde" },
	  --[[Void Assault]]{ id = 63325, type = "achievement", itemID = 276083, model3D = 7940395, title = "Sunstrider Omnium", faction = "neutral" },
	  --[[Void Assault]]{ id = 63384, type = "achievement", itemID = 276432, model3D = 1590817, title = "De-Powered Lightforged Siegebreaker", faction = "neutral" },
	  --[[Void Assault]]{ id = 63384, type = "achievement", itemID = 276429, model3D = 1662222, title = "Grand Artificer's Lightforged Console", faction = "neutral" },
	  --[[Void Assault]]{ id = 63384, type = "achievement", itemID = 276316, model3D = 7320163, title = "Lightveil's Transport Pad", faction = "neutral" },
	  --[[Void Assault]]{ id = 62905, type = "achievement", itemID = 276321, model3D = 7115733, title = "Luminant Defender's Golden Barricade", faction = "neutral" },
	  --[[Void Assault]]{ id = 62905, type = "achievement", itemID = 276318, model3D = 7115754, title = "Luminant Soldier's War Banner", faction = "neutral" },
	  --[[Void Assault]]{ id = 62905, type = "achievement", itemID = 267211, model3D = 7319865, title = "Luminant Scout's Golden Fence", faction = "neutral" },
      --[[Prey]]{ id = 62144, type = "achievement", itemID = 265696, model3D = 7450031, title = "Preyseeker's Magister Bust", faction = "neutral" },
      --[[Prey]]{ id = 62153, type = "achievement", itemID = 265697, model3D = 7450032, title = "Preyseeker's Tinker Bust", faction = "neutral" },
      --[[Prey]]{ id = 62154, type = "achievement", itemID = 265798, model3D = 7450033, title = "Preyseeker's Ren'dorei Bust", faction = "neutral" },
      --[[Prey]]{ id = 62155, type = "achievement", itemID = 265698, model3D = 7450034, title = "Preyseeker's Ethereal Bust", faction = "neutral" },
      --[[Prey]]{ id = 62156, type = "achievement", itemID = 265699, model3D = 7450035, title = "Preyseeker's Breaker Bust", faction = "neutral" },
      --[[Prey]]{ id = 62157, type = "achievement", itemID = 265700, model3D = 7450036, title = "Preyseeker's Amani Bust", faction = "neutral" },
      --[[Prey]]{ id = 62158, type = "achievement", itemID = 265799, model3D = 7450037, title = "Preyseeker's Farstrider Bust", faction = "neutral" },
      --[[Prey]]{ id = 62159, type = "achievement", itemID = 265701, model3D = 7450038, title = "Preyseeker's Rutaani Bust", faction = "neutral" },
      --[[Prey]]{ id = 62160, type = "achievement", itemID = 265702, model3D = 7450039, title = "Preyseeker's Vindicator Bust", faction = "neutral" },
      --[[Prey]]{ id = 62161, type = "achievement", itemID = 265703, model3D = 7450040, title = "Preyseeker's Consul Bust", faction = "neutral" },
      --[[Prey]]{ id = 62162, type = "achievement", itemID = 265704, model3D = 7450041, title = "Preyseeker's Executor Bust", faction = "neutral" },
      --[[Prey]]{ id = 62163, type = "achievement", itemID = 265705, model3D = 7450042, title = "Preyseeker's Knight-Errant Bust", faction = "neutral" },
      --[[Prey]]{ id = 62164, type = "achievement", itemID = 265706, model3D = 7450043, title = "Preyseeker's Wretched Bust", faction = "neutral" },
      --[[Prey]]{ id = 62165, type = "achievement", itemID = 265707, model3D = 7450044, title = "Preyseeker's Thornspeaker Bust", faction = "neutral" },
      --[[Prey]]{ id = 62166, type = "achievement", itemID = 265708, model3D = 7450045, title = "Preyseeker's Twilight Bust", faction = "neutral" },
      --[[Prey]]{ id = 62167, type = "achievement", itemID = 265681, model3D = 7430522, title = "Preyseeker's Magister Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62168, type = "achievement", itemID = 265682, model3D = 7430523, title = "Preyseeker's Tinker Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62169, type = "achievement", itemID = 265796, model3D = 7430524, title = "Preyseeker's Ren'dorei Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62173, type = "achievement", itemID = 265683, model3D = 7430525, title = "Preyseeker's Ethereal Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62174, type = "achievement", itemID = 265684, model3D = 7430526, title = "Preyseeker's Breaker Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62175, type = "achievement", itemID = 265685, model3D = 7430527, title = "Preyseeker's Amani Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62176, type = "achievement", itemID = 265797, model3D = 7430528, title = "Preyseeker's Farstrider Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62177, type = "achievement", itemID = 265686, model3D = 7430529, title = "Preyseeker's Rutaani Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62178, type = "achievement", itemID = 265687, model3D = 7430530, title = "Preyseeker's Vindicator Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62179, type = "achievement", itemID = 265688, model3D = 7430531, title = "Preyseeker's Consul Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62180, type = "achievement", itemID = 265689, model3D = 7430532, title = "Preyseeker's Executor Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62181, type = "achievement", itemID = 265690, model3D = 7430533, title = "Preyseeker's Knight-Errant Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62182, type = "achievement", itemID = 265691, model3D = 7430534, title = "Preyseeker's Wretched Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62183, type = "achievement", itemID = 265692, model3D = 7430535, title = "Preyseeker's Thornspeaker Effigy", faction = "neutral" },
      --[[Prey]]{ id = 62184, type = "achievement", itemID = 265694, model3D = 7430536, title = "Preyseeker's Twilight Effigy", faction = "neutral" },	
	  --[[Prey]]{ id = 63451, type = "achievement", itemID = 278369, model3D = 7808626, title = "Preyhunter's Scaled Effigy", faction = "neutral" },
      --[[Prey]]{ id = 63452, type = "achievement", itemID = 278372, model3D = 7808627, title = "Preyhunter's Fanged Effigy", faction = "neutral"},
      --[[Prey]]{ id = 63454, type = "achievement", itemID = 278376, model3D = 7808630, title = "Preyhunter's Terror Effigy", faction = "neutral" },
	  --[[Prey]]{ id = 63453, type = "achievement", itemID = 278380, model3D = 7808629, title = "Preyhunter's Terror Bust", faction = "neutral"},	  
    }
  },
  {
    name = "Dungeons and Raids", --5
    achievements = {
	  --[[Legion Dungeon]]{ id = 10996, type = "achievement", itemID = 256913, model3D = 1319084, title = "Tauren Jeweler's Roller", faction = "neutral" },
      --[[Battle Dungeon]]{ id = 13723, type = "achievement", itemID = 246479, model3D = 999909, title = "Gnomish T.O.O.L.B.O.X.", faction = "neutral" },
	  --[[Lich King Raid]]{ id = 4405, type = "achievement", itemID = 244852, model3D = 6927099, title = "Head of the Broodmother", faction = "neutral" },	  
	  --[[War Within Raid]]{ id = 41119, type = "achievement", itemID = 245302, model3D = 5933736, title = "Gallagio L.U.C.K. Spinner", faction = "neutral" },
     --[[Legion Raid]]{ id = 11699, type = "achievement", itemID = 258223, model3D = 1095305, title = "Murloc's Wind Chimes", faction = "neutral" },	  	 	 
    }
  },
  {
    name = "Player vs Player", --23
    achievements = {	  
      { id = 229, type = "achievement", itemID = 247745, model3D = 2353835, title = "Horde Dueling Flag", faction = "neutral" },
      { id = 231, type = "achievement", itemID = 247744, model3D = 2353834, title = "Alliance Dueling Flag", faction = "neutral" },
      { id = 1157, type = "achievement", itemID = 247756, model3D = 199687, title = "Challenger's Dueling Flag", faction = "neutral" },
      { id = 61683, type = "achievement", itemID = 247763, model3D = 200305, title = "Berserker's Empowerment", faction = "neutral" },
      { id = 61684, type = "achievement", itemID = 247768, model3D = 660744, title = "Guardian's Empowerment", faction = "neutral" },
      { id = 61685, type = "achievement", itemID = 247769, model3D = 1586378, title = "Chaotic Empowerment", faction = "neutral" },
      { id = 61686, type = "achievement", itemID = 247770, model3D = 1588459, title = "Mysterious Empowerment", faction = "neutral" },
      { id = 61687, type = "achievement", itemID = 247765, model3D = 200308, title = "Healer's Empowerment", faction = "neutral" },
      { id = 61688, type = "achievement", itemID = 247766, model3D = 200309, title = "Runner's Empowerment", faction = "neutral" },
      --[[Alterac Valley]]{ id = 221, type = "achievement", itemID = 247758, model3D = 200273, title = "Fortified Alliance Banner", faction = "neutral" },
      --[[Alterac Valley]]{ id = 222, type = "achievement", itemID = 247760, model3D = 200281, title = "Fortified Horde Banner", faction = "neutral" },
      --[[Arathi Basin]]{ id = 158, type = "achievement", itemID = 247757, model3D = 200268, title = "Alliance Battlefield Banner", faction = "neutral" },
      --[[Arathi Basin]]{ id = 1153, type = "achievement", itemID = 247759, model3D = 200276, title = "Horde Battlefield Banner", faction = "neutral" },
      --[[Battle for Gilneas]]{ id = 5245, type = "achievement", itemID = 256896, model3D = 304027, title = "Smoke Lamppost", faction = "neutral" },
      --[[Deephaul Ravine]]{ id = 40210, type = "achievement", itemID = 253170, model3D = 5278833, title = "Earthen Contender's Target", faction = "neutral" },
      --[[Deephaul Ravine]]{ id = 40612, type = "achievement", itemID = 247750, model3D = 5770750, title = "Deephaul Crystal", faction = "neutral" },
      --[[Eye of the Storm]]{ id = 212, type = "achievement", itemID = 247761, model3D = 200283, title = "Uncontested Battlefield Banner", faction = "neutral" },
      --[[Eye of the Storm]]{ id = 213, type = "achievement", itemID = 247762, model3D = 200301, title = "Netherstorm Battlefield Flag", faction = "neutral" },
      --[[Temple of Kotmogu]]{ id = 6981, type = "achievement", itemID = 247740, model3D = 603539, title = "Kotmogu Pedestal", faction = "neutral" },
	  --[[Temple of Kotmogu]]{ id = 6981, type = "achievement", itemID = 247741, model3D = 604187, title = "Kotmogu Orb of Power", faction = "neutral" },
      --[[Twin Peaks]]{ id = 5223, type = "achievement", itemID = 247727, model3D = 414219, title = "Iron Dragonmaw Gate", faction = "neutral" },
      --[[Warsong Gulch]]{ id = 167, type = "achievement", itemID = 247747, model3D = 2490319, title = "Warsong Outriders Flag", faction = "neutral" },
      --[[Warsong Gulch]]{ id = 200, type = "achievement", itemID = 247746, model3D = 2490318, title = "Silverwing Sentinels Flag", faction = "neutral" },	  
    }
  },
  {
    name = "Professions", -- 18
    achievements = {
      { id = 19408, type = "achievement", itemID = 253163, model3D = 4896167, title = "Fallside Storage Tent", faction = "neutral" },
	  { id = 12733, type = "achievement", itemID = 245490, model3D = 1696757, title = "Dazar'alor Forge", faction = "horde"  },	  
    --[[Archaeology]]{ id = 4859, type = "achievement", itemID = 245426, model3D = 1018949, title = "Dark Iron Brazier", faction = "neutral" },  
    --[[Archaeology]]{ id = 9415, type = "achievement", itemID = 258740, model3D = 965917, title = "Glorious Pendant of Rukhmar", faction = "neutral"  },  
    --[[Cooking]]{ id = 12746, type = "achievement", itemID = 244325, model3D = 6877808, title = "Zuldazar Cook's Griddle", faction = "horde" },  		  		  	  
      { id = 42786, type = "achievement", itemID = 264006, model3D = 6049354, title = "Midnight Leatherworker's Shop Sign", faction = "neutral" },
      { id = 42787, type = "achievement", itemID = 264000, model3D = 6049337, title = "Midnight Enchanter's Shop Sign", faction = "neutral" },
      { id = 42788, type = "achievement", itemID = 263997, model3D = 6049331, title = "Midnight Alchemist's Shop Sign", faction = "neutral" },
      { id = 42789, type = "achievement", itemID = 264005, model3D = 6049346, title = "Midnight Jewelcrafter's Shop Sign", faction = "neutral" },
      { id = 42790, type = "achievement", itemID = 264173, model3D = 6049356, title = "Midnight Skinner's Shop Sign", faction = "neutral" },
      { id = 42791, type = "achievement", itemID = 264172, model3D = 6049355, title = "Midnight Miner's Shop Sign", faction = "neutral" },
      { id = 42792, type = "achievement", itemID = 263998, model3D = 6049335, title = "Midnight Blacksmith's Shop Sign", faction = "neutral" },
      { id = 42793, type = "achievement", itemID = 264003, model3D = 6049344, title = "Midnight Herbalist's Shop Sign", faction = "neutral" },
      { id = 42794, type = "achievement", itemID = 264174, model3D = 6049357, title = "Midnight Tailor's Shop Sign", faction = "neutral" },
      { id = 42795, type = "achievement", itemID = 263999, model3D = 6049336, title = "Midnight Cook's Shop Sign", faction = "neutral" },
      { id = 42796, type = "achievement", itemID = 264004, model3D = 6049345, title = "Midnight Scribe's Shop Sign", faction = "neutral" },
      { id = 42797, type = "achievement", itemID = 264002, model3D = 6049340, title = "Midnight Fisher's Shop Sign", faction = "neutral" },
      { id = 42798, type = "achievement", itemID = 264001, model3D = 6049339, title = "Midnight Engineer's Shop Sign", faction = "neutral" },	  
    }
  },
  {
    name = "Legacy",--17
    achievements = {
      --[[Legion Remix]]{ id = 42674, type = "achievement", itemID = 250693, model3D = 7150660, title = "Altar of the Corrupted Flames", faction = "neutral" },
      --[[Legion Remix]]{ id = 42321, type = "achievement", itemID = 250406, model3D = 7216249, title = "Corruption Pit", faction = "neutral" },
      --[[Legion Remix]]{ id = 42655, type = "achievement", itemID = 252753, model3D = 1349995, title = "Demonic Storage Chest", faction = "neutral" },
      --[[Legion Remix]]{ id = 42627, type = "achievement", itemID = 250690, model3D = 1338587, title = "Eredar Lord's Fel Torch", faction = "neutral" },
      --[[Legion Remix]]{ id = 42689, type = "achievement", itemID = 251779, model3D = 7216247, title = "Fel Fountain", faction = "neutral" },
      --[[Legion Remix]]{ id = 42547, type = "achievement", itemID = 258299, model3D = 7240010, title = "Hanging Felsteel Cage", faction = "neutral" },
      --[[Legion Remix]]{ id = 42675, type = "achievement", itemID = 250404, model3D = 7216246, title = "Hanging Felsteel Chain", faction = "neutral" },	  
      --[[Legion Remix]]{ id = 42628, type = "achievement", itemID = 256677, model3D = 1307161, title = "Large Legion Candle", faction = "neutral" },
      --[[Legion Remix]]{ id = 42619, type = "achievement", itemID = 250407, model3D = 7240009, title = "Legion's Fel Brazier", faction = "neutral" },
      --[[Legion Remix]]{ id = 42692, type = "achievement", itemID = 250403, model3D = 1310272, title = "Legion's Holo-Communicator", faction = "neutral" },
      --[[Legion Remix]]{ id = 61054, type = "achievement", itemID = 250689, model3D = 1308148, title = "Legion Torture Rack", faction = "neutral" },
      --[[Legion Remix]]{ id = 61060, type = "achievement", itemID = 250405, model3D = 7216248, title = "Legion's Fel Torch", faction = "neutral" },	
	  --[[Legion Remix]]{ id = 42628, type = "achievement", itemID = 256678, model3D = 1307162, title = "Small Legion Candle", faction = "neutral" },
      --[[Legion Remix]]{ id = 61218, type = "achievement", itemID = 251778, model3D = 1119129, title = "Sentinel's Moonwing Gaze", faction = "neutral" },	  
      --[[Legion Remix]]{ id = 42318, type = "achievement", itemID = 250307, model3D = 7150661, title = "Tome of the Corrupt", faction = "neutral" },
      --[[Legion Remix]]{ id = 42658, type = "achievement", itemID = 250402, model3D = 1102771, title = "Vrykul Lord's Throne", faction = "neutral" },
      --[[Legion Remix]]{ id = 42675, type = "achievement", itemID = 250622, model3D = 7240011, title = "Vertical Felsteel Chain", faction = "neutral" },
    }
  },  
}
if (select(4, GetBuildInfo()) or 0) >= 120107 then
    local expansionGroup
    for _, group in ipairs(DVD.achievements or {}) do
        if group.name == "Expansion Features" then
            expansionGroup = group
            break
        end
    end
    if expansionGroup then
        --[[Lorewalking]] table.insert(expansionGroup.achievements, { id = 63691, type = "achievement", itemID = 281626, model3D = 985168, title = "Tale of the First Warchief", faction = "neutral" })
        --[[Lorewalking]] table.insert(expansionGroup.achievements, { id = 63710, type = "achievement", itemID = 283475, model3D = 4288162, title = "A Brief History of the Titans", faction = "neutral" })
        --[[Lorewalking]] table.insert(expansionGroup.achievements, { id = 63712, type = "achievement", itemID = 283453, model3D = 1852972, title = "Tome of the Sea", faction = "neutral" })
        --[[Lorewalking]] table.insert(expansionGroup.achievements, { id = 63604, type = "achievement", itemID = 283463, model3D = 983860, title = "Origin of the Silver Hand", faction = "neutral" })
    end
end



end)(...);

-- ------------------------------------------------------------
-- SECTION: Sources/GalleryItemDetails.lua
-- ------------------------------------------------------------
(function(...)
-- ============================================================
-- Decor Vendor Gallery
-- Data/GalleryItemDetails.lua
-- Gallery-only item details and display overrides
--
-- IMPORTANT:
-- Use ITEM ID as the table key, not decorID.
--
-- This file is for gallery-only info such as:
-- price text, requirements, quest unlocks, direct quest rewards,
-- achievement IDs, notes, or display overrides that the main
-- Decor Vendor frame does not need.
--
-- ActiveItems should still handle:
-- itemID -> decorID, model3D, source, soldBy
--
-- Naming rule:
--
-- questID / questName
-- = the item is earned directly from a quest.
--
-- ============================================================

local addonName, DVD = ...

DVD.ItemDetails = DVD.ItemDetails or {}

local Gallery = DVD

Gallery.ItemDetails = Gallery.ItemDetails or {}


Gallery.ItemDetails[262453] = {note = "Rank 6 House to buy"}

Gallery.ItemDetails[263298] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "March 2026 Drop"}
Gallery.ItemDetails[263299] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "March 2026 Drop"}
Gallery.ItemDetails[263301] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "Jan 2026 Drop"}
Gallery.ItemDetails[265394] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "May 2026 Drop"}
Gallery.ItemDetails[265545] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "April 2026 Drop"}
Gallery.ItemDetails[265389] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "June 2026 Drop"}
Gallery.ItemDetails[263303] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "September 2026 Drop"}
Gallery.ItemDetails[263294] = { source = "promo", promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "October 2026 Drop"}


-------------------------------------------------
-- Shop
-------------------------------------------------
do --Shop Stuff

do --Shop Plushies
Gallery.ItemDetails[263052] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Beloved Lion Plushie" }
Gallery.ItemDetails[263053] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Beloved Wolf Plushie" }
end

do --Random Shop Items	
Gallery.ItemDetails[260727] = { source = "shop", priceText = "200 Hearthsteel", shopName = "Alliance Doormat" }
Gallery.ItemDetails[260728] = { source = "shop", priceText = "200 Hearthsteel", shopName = "Horde Doormat" }
Gallery.ItemDetails[250794] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Colorful Shroomic Egg"}
Gallery.ItemDetails[250795] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Colorful Dotted Egg"}
Gallery.ItemDetails[250796] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Colorful Striped Egg"}
end

do--Charity Roofus Pack 8 items
Gallery.ItemDetails[259044] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[259045] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[259046] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[259093] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[259094] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[264275] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[264276] = { source="pastcharity", shopName = "The Roofus Pack"}
Gallery.ItemDetails[264277] = { source="pastcharity", shopName = "The Roofus Pack"}
end

do --Spring Blossom 18 Items
Gallery.ItemDetails[265556] = { source = "blossomshop", priceText = "300 Hearthsteel", shopName = "Spring Blossom Privacy Screen"} 
Gallery.ItemDetails[263291] = { source = "blossomshop", priceText = "300 Hearthsteel", shopName = "Spring Blossom Tree Pond"}
Gallery.ItemDetails[266166] = { source = "blossomshop", priceText = "500 Hearthsteel", shopName = "Spring Blossom Tranquility Garden"}
Gallery.ItemDetails[266167] = { source = "blossomshop", priceText = "600 Hearthsteel", shopName = "Spring Blossom Pond" }
Gallery.ItemDetails[266165] = { source = "blossomshop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Lantern"}
Gallery.ItemDetails[265559] = { source = "blossomshop", priceText = "50 Hearthsteel", shopName = "Spring Blossom Stepping Stone Collection"}
Gallery.ItemDetails[265558] = { source = "blossomshop", priceText = "30 Hearthsteel", shopName = "Spring Blossom Stepping Stone Trio"} 	
Gallery.ItemDetails[265557] = { source = "blossomshop", priceText = "20 Hearthsteel", shopName = "Spring Blossom Stepping Stone Duo"}	
Gallery.ItemDetails[265555] = { source = "blossomshop", priceText = "10 Hearthsteel", shopName = "Spring Blossom Stepping Stone"}  		
Gallery.ItemDetails[266068] = { source = "blossomshop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Tea Set"}
Gallery.ItemDetails[266069] = { source = "blossomshop", priceText = "300 Hearthsteel", shopName = "Spring Blossom Table"}
Gallery.ItemDetails[258569] = { source = "blossomshop", priceText = "800 Hearthsteel", shopName = "Spring Blossom Gazebo" }
Gallery.ItemDetails[254417] = { source = "blossomshop", priceText = "250 Hearthsteel", shopName = "Spring Blossom Hanging Chair" }
Gallery.ItemDetails[253547] = { source = "blossomshop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Wreath" }
Gallery.ItemDetails[250797] = { source = "blossomshop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Ceiling Light" }
Gallery.ItemDetails[250798] = { source = "blossomshop", priceText = "250 Hearthsteel", shopName = "Spring Blossom Shelf" }
Gallery.ItemDetails[263290] = { source = "blossomshop", priceText = "250 Hearthsteel", shopName = "Spring Blossom Tree" }
Gallery.ItemDetails[258568] = { source = "blossomshop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Window" }
end

do--Frimtide Decor
Gallery.ItemDetails[285105] = { source = "grimtideshop", priceText = "200 Hearthsteel", shopName = "Grimtide Grand Table" }
Gallery.ItemDetails[285107] = { source = "grimtideshop", priceText = "100 Hearthsteel", shopName = "Grimtide Side Table" }
Gallery.ItemDetails[285109] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Grimtide Dining Chair" }
Gallery.ItemDetails[285114] = { source = "grimtideshop", priceText = "200 Hearthsteel", shopName = "Grimtide Couch" }
Gallery.ItemDetails[285116] = { source = "grimtideshop", priceText = "100 Hearthsteel", shopName = "Small Grimtide Rug" }
Gallery.ItemDetails[285118] = { source = "grimtideshop", priceText = "100 Hearthsteel", shopName = "Grimtide Rug" }
Gallery.ItemDetails[285120] = { source = "grimtideshop", priceText = "100 Hearthsteel", shopName = "Grimtide Coffee Table" }
Gallery.ItemDetails[285122] = { source = "grimtideshop", priceText = "300 Hearthsteel", shopName = "Grimtide Grand Piano" }
Gallery.ItemDetails[285124] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Grimtide Tentacle" }
Gallery.ItemDetails[286004] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Daytime Grimtide Window" }
Gallery.ItemDetails[286002] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Nighttime Grimtide Window" }
Gallery.ItemDetails[285126] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Grimtide Display Anchor" }
Gallery.ItemDetails[285128] = { source = "grimtideshop", priceText = "30 Hearthsteel", shopName = "Grimtide Enchanted Candles" }
Gallery.ItemDetails[285140] = { source = "grimtideshop", priceText = "10 Hearthsteel", shopName = "Grimtide Tall Enchanted Candle" }
Gallery.ItemDetails[285142] = { source = "grimtideshop", priceText = "10 Hearthsteel", shopName = "Grimtide Enchanted Candle" }
Gallery.ItemDetails[285144] = { source = "grimtideshop", priceText = "10 Hearthsteel", shopName = "Grimtide Small Enchanted Candle" }
Gallery.ItemDetails[285130] = { source = "grimtideshop", priceText = "300 Hearthsteel", shopName = "Grimtide Chandelier" }
Gallery.ItemDetails[285132] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Grimtide Sconce" }
Gallery.ItemDetails[285134] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Grimtide Candelabra" }
Gallery.ItemDetails[285136] = { source = "grimtideshop", priceText = "200 Hearthsteel", shopName = "Grimtide Bookcase" }
Gallery.ItemDetails[285138] = { source = "grimtideshop", priceText = "50 Hearthsteel", shopName = "Grimtide Floor Hatch" }
end

do --lush Garden Items
Gallery.ItemDetails[266162] = { source = "lushshop", priceText = "100 Hearthsteel", shopName = "Lush Garden Hedge"} 
Gallery.ItemDetails[266070] = { source = "lushshop", priceText = "300 Hearthsteel", shopName = "Lush Garden Fungal Table" }
Gallery.ItemDetails[266164] = { source = "lushshop", priceText = "200 Hearthsteel", shopName = "Lush Garden Fungal Picnic"} 	
Gallery.ItemDetails[267203] = { source = "lushshop", priceText = "500 Hearthsteel", shopName = "Lush Garden Stable"}
Gallery.ItemDetails[266163] = { source = "lushshop", priceText = "100 Hearthsteel", shopName = "Lush Garden Fungal Planter" }
Gallery.ItemDetails[268550] = { source = "lushshop", priceText = "200 Hearthsteel", shopName = "Lush Garden Rug"}
Gallery.ItemDetails[264692] = { source = "lushshop", priceText = "100 Hearthsteel", shopName = "Lush Garden Window"}					
Gallery.ItemDetails[253546] = { source = "lushshop", priceText = "100 Hearthsteel", shopName = "Lush Garden Butterfly Sconce" }
Gallery.ItemDetails[252419] = { source = "lushshop", priceText = "250 Hearthsteel", shopName = "Lush Garden Fungal Basin" } 
Gallery.ItemDetails[258567] = { source = "lushshop", priceText = "250 Hearthsteel", shopName = "Lush Garden Fungal Chair" }
Gallery.ItemDetails[258888] = { source = "lushshop", priceText = "500 Hearthsteel", shopName = "Lush Garden Fungal Fountain" }
Gallery.ItemDetails[258294] = { source = "lushshop", priceText = "50 Hearthsteel", shopName = "Lush Garden Gnome-Like Statue" }
Gallery.ItemDetails[250793] = { source = "lushshop", priceText = "250 Hearthsteel", shopName = "Lush Garden Trellis" } 
end

do--Blizzcon  1 item
Gallery.ItemDetails[276873] = { source = "expireddecor", shopName = "BlizzCon 2026 in-game goodie"}
Gallery.ItemDetails[281107] = { source = "blizzcon"}
end

do-- Diablo 2 Preorder 1 item
Gallery.ItemDetails[256764] = { source = "diablo2", shopName = "Diablo 2 DLC" }-- Sanctuary's Horadric Cube
end

do-- Champion of the Wilds Pack 1 item
Gallery.ItemDetails[281372] = { source = "rexxar", priceText = "100 Hearthsteel", shopName = "Zhevraskin Rug" }-- Zhevraskin Rug
end

do --Diablo 4 Preorder 16 items
Gallery.ItemDetails[259055] = { source = "diablo4", shopName = "Hatred's Wolfpelt Rug", note = "Diablo 4 Pre-Order" }
Gallery.ItemDetails[259056] = { source = "diablo4", shopName = "Prime Evil's Chest", note = "Diablo 4 Pre-Order" }
Gallery.ItemDetails[259057] = { source = "diablo4", shopName = "Sanctuary's Chess Match", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259058] = { source = "diablo4", shopName = "Sanctuary's Chess Board", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259059] = { source = "diablo4", shopName = "Sanctuary Chess Dark Bishop", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259060] = { source = "diablo4", shopName = "Sanctuary Chess Dark Rook", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259061] = { source = "diablo4", shopName = "Sanctuary Chess Dark Queen", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259062] = { source = "diablo4", shopName = "Sanctuary Chess Dark Pawn", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259063] = { source = "diablo4", shopName = "Sanctuary Chess Dark Knight", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259064] = { source = "diablo4", shopName = "Sanctuary Chess Dark King", note = "Diablo 4 Pre-Order"}  
Gallery.ItemDetails[259065] = { source = "diablo4", shopName = "Sanctuary Chess Light Bishop", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259066] = { source = "diablo4", shopName = "Sanctuary Chess Light Rook", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259067] = { source = "diablo4", shopName = "Sanctuary Chess Light Queen", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259068] = { source = "diablo4", shopName = "Sanctuary Chess Light Pawn", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259069] = { source = "diablo4", shopName = "Sanctuary Chess Light Knight", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259070] = { source = "diablo4", shopName = "Sanctuary Chess Light King", note = "Diablo 4 Pre-Order"}
end

do --Midnight Preorder
Gallery.ItemDetails[244668] = { source = "midnight", shopName = "Light-Infused Fountain", note = "Midnight Pre-Order"}
Gallery.ItemDetails[245939] = { source = "midnight", shopName = "Void-Corrupted Fountain", note = "Midnight Pre-Order"}
Gallery.ItemDetails[246414] = { source = "midnight", shopName = "Light-Infused Rotunda", note = "Midnight Pre-Order"}
Gallery.ItemDetails[248809] = { source = "midnight", shopName = "Void-Corrupted Rotunda", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252666] = { source = "midnight", shopName = "The High Exarch Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252667] = { source = "midnight", shopName = "The Ranger of the Void Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252668] = { source = "midnight", shopName = "The Harbinger Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252669] = { source = "midnight", shopName = "The Redeemer Painting", note = "Midnight Pre-Order"}
end

do--Warcraft Forever 7 items
Gallery.ItemDetails[268339] = { source="forever", shopName = "Warcraft Forever"}
Gallery.ItemDetails[268340] = { source="forever", shopName = "Warcraft Forever"}
Gallery.ItemDetails[268722] = { source="forever", shopName = "Warcraft Forever"}
Gallery.ItemDetails[268338] = { source="forever", shopName = "Warcraft Forever"}
Gallery.ItemDetails[268337] = { source="forever", shopName = "Warcraft Forever"}
Gallery.ItemDetails[280554] = { source="forever", shopName = "Warcraft Forever"}
Gallery.ItemDetails[280556] = { source="forever", shopName = "Warcraft Forever"}
end

Gallery.ItemDetails[285216] = { source="dnd"}


do--12.1 vendor
Gallery.ItemDetails[276230] = { note = "Found on the Neighborhood Board if you have the transdimensional whistle toy" }
end
end

if (select(4, GetBuildInfo()) or 0) >= 120107 then

Gallery.ItemDetails[288740] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Storyteller's Looking Glass
Gallery.ItemDetails[288733] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Storyteller's Cursed Looking Glass
Gallery.ItemDetails[288747] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Sanguine Looking Glass
Gallery.ItemDetails[288749] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Hexed Looking Glass
Gallery.ItemDetails[288745] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Eldritch Looking Glass
Gallery.ItemDetails[288751] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Fae Looking Glass
Gallery.ItemDetails[287981] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Waxlight
Gallery.ItemDetails[287900] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Hex Scar
Gallery.ItemDetails[287902] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Drust-Carved Rune Marker
Gallery.ItemDetails[287904] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Drust-Carved Rune Pillar
Gallery.ItemDetails[287906] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Wicker Effigy
Gallery.ItemDetails[287908] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Tidesage's Left Copper Mascaron
Gallery.ItemDetails[287910] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Tidesage's Right Copper Mascaron
Gallery.ItemDetails[287862] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Sealight Sconce
Gallery.ItemDetails[287913] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Hex Markings
Gallery.ItemDetails[287915] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Hex Etchings
Gallery.ItemDetails[287917] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Runestone Ring
Gallery.ItemDetails[287983] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Heartsbane Hex Catcher
Gallery.ItemDetails[263884] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Quillgrave Talebound Shadowtome
Gallery.ItemDetails[263885] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Quillgrave Arcanist's Alembic
Gallery.ItemDetails[263886] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Quillgrave Scribe's Gemstation
Gallery.ItemDetails[269638] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Quillgrave Outfitter's Loom
Gallery.ItemDetails[263490] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Quillgrave Craftsman's Workmill
Gallery.ItemDetails[269576] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Quillgrave Storyteller's Lectern
Gallery.ItemDetails[281596] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Ominous Ritual Wall Scroll
Gallery.ItemDetails[272134] = { source = "talebound", price = { currencyID = 3361, amount = 20 }} -- Watchman's Iron Torch
end
-------------------------------------------------
-- Achievements
-------------------------------------------------	
do --Achievement Stuff source = "",

do  --quests --22
	Gallery.ItemDetails[245271] = { source = "Quests", achievementID = 12582, achievementName = "Come Sail Away", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[245476] = { source = "Quests", achievementID = 13284, achievementName = "Frontline Warrior", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[245497] = { source = "Quests", achievementID = 12614, achievementName = "Loa Expectations", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[245494] = { source = "Quests", achievementID = 13039, achievementName = "Paku'ai", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[245487] = { source = "Quests", achievementID = 13038, achievementName = "Raptari Rider", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[241062] = { source = "Quests", achievementID = 12509, achievementName = "Ready for War", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[252653] = { source = "Quests", achievementID = 13049, achievementName = "The Long Con", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[252654] = { source = "Quests", achievementID = 12997, achievementName = "The Pride of Kul Tiras", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[245522] = { source = "Quests", achievementID = 12479, achievementName = "Zandalar Forever!", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[248104] = { source = "Quests", achievementID = 17773, achievementName = "A Blue Dawn", achievementCategory = "Dragonflight" }
	Gallery.ItemDetails[248105] = { source = "Quests", achievementID = 19507, achievementName = "Fringe Benefits", achievementCategory = "Dragonflight" }
	Gallery.ItemDetails[245520] = { source = "Quests", achievementID = 19719, achievementName = "Reclamation of Gilneas", achievementCategory = "Dragonflight" }
	Gallery.ItemDetails[248796] = { source = "Quests", achievementID = 5442, achievementName = "Full Caravan", achievementCategory = "Eastern Kingdoms" }
	Gallery.ItemDetails[248808] = { source = "Quests", achievementID = 940, achievementName = "The Green Hills of Stranglethorn", achievementCategory = "Eastern Kingdoms" }
	Gallery.ItemDetails[257721] = { source = "Quests", achievementID = 10398, achievementName = "Drum Circle", achievementCategory = "Legion" }
	Gallery.ItemDetails[245448] = { source = "Quests", achievementID = 11124, achievementName = "Good Suramaritan", achievementCategory = "Legion" }
	Gallery.ItemDetails[247843] = { source = "Quests", achievementID = 11340, achievementName = "Insurrection", achievementCategory = "Legion" }
	Gallery.ItemDetails[245697] = { source = "Quests", achievementID = 10698, achievementName = "That's Val'sharah Folks!", achievementCategory = "Legion" }
	Gallery.ItemDetails[264259] = { source = "Quests", achievementID = 61574, achievementName = "Legends Never Die", achievementCategory = "Midnight" }
	Gallery.ItemDetails[248807] = { source = "Quests", achievementID = 938, achievementName = "The Snows of Northrend", achievementCategory = "Northrend" }
	Gallery.ItemDetails[252757] = { source = "Quests", achievementID = 20595, achievementName = "Sojourner of Isle of Dorn", achievementCategory = "War Within" }
	Gallery.ItemDetails[245324] = { source = "Quests", achievementID = 40894, achievementName = "Sojourner of Undermine", achievementCategory = "War Within" }
end

do--exploration --24
	Gallery.ItemDetails[245460] = { source = "Exploration", achievementID = 11257, achievementName = "Treasures of Highmountain", achievementCategory = "Legion" }
	Gallery.ItemDetails[245703] = { source = "Exploration", achievementID = 11258, achievementName = "Treasures of Val'sharah", achievementCategory = "Legion" }
	Gallery.ItemDetails[284546] = { source = "Exploration", achievementID = 14311, achievementName = "Treasures of Bastion", achievementCategory = "Legion" }
	Gallery.ItemDetails[281682] = { source = "Exploration", achievementID = 12102, achievementName = "To Kill Demons...", achievementCategory = "Legion" }
	Gallery.ItemDetails[246483] = { source = "Exploration", achievementID = 13473, achievementName = "Diversified Investments", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[244326] = { source = "Exploration", achievementID = 13018, achievementName = "Dune Rider", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[246598] = { source = "Exploration", achievementID = 13477, achievementName = "Junkyard Apprentice", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[246603] = { source = "Exploration", achievementID = 13475, achievementName = "Junkyard Scavenger", achievementCategory = "Battle for Azeroth" }
	Gallery.ItemDetails[248656] = { source = "Exploration", achievementID = 17529, achievementName = "Forbidden Spoils", achievementCategory = "Dragon Isles" }
	Gallery.ItemDetails[253023] = { source = "Exploration", achievementID = 40504, achievementName = "Rocked to Sleep", achievementCategory = "War Within" }
	Gallery.ItemDetails[246867] = { source = "Exploration", achievementID = 41186, achievementName = "Slate of the Union", achievementCategory = "War Within" }
	Gallery.ItemDetails[246866] = { source = "Exploration", achievementID = 40542, achievementName = "Smelling History", achievementCategory = "War Within" }
	Gallery.ItemDetails[253037] = { source = "Exploration", achievementID = 40859, achievementName = "We're Here All Night", achievementCategory = "War Within" }
	Gallery.ItemDetails[264266] = { source = "Exploration", achievementID = 61264, achievementName = "Leaf None Behind", achievementCategory = "Midnight" }
	Gallery.ItemDetails[257367] = { source = "Exploration", achievementID = 61507, achievementName = "A Bloody Song", achievementCategory = "Midnight" }
	Gallery.ItemDetails[264335] = { source = "Exploration", achievementID = 62122, achievementName = "Tallest Tree in the Forest", achievementCategory = "Midnight" }
	Gallery.ItemDetails[264493] = { source = "Exploration", achievementID = 62130, achievementName = "The Ultimate Predator", achievementCategory = "Midnight" }
	Gallery.ItemDetails[244656] = { source = "Exploration", achievementID = 62185, achievementName = "Ever Painting", achievementCategory = "Midnight" }
	Gallery.ItemDetails[251909] = { source = "Exploration", achievementID = 62186, achievementName = "The Party Must Go On", achievementCategory = "Midnight" }
	Gallery.ItemDetails[254773] = { source = "Exploration", achievementID = 62288, achievementName = "Eversong Woods: The Highest Peaks", achievementCategory = "Midnight" }
	Gallery.ItemDetails[256925] = { source = "Exploration", achievementID = 62289, achievementName = "Zul'Aman: The Highest Peaks", achievementCategory = "Midnight" }
	Gallery.ItemDetails[265792] = { source = "Exploration", achievementID = 62290, achievementName = "Harandar: The Highest Peaks", achievementCategory = "Midnight" }
	Gallery.ItemDetails[264656] = { source = "Exploration", achievementID = 62291, achievementName = "Voidstorm: The Highest Peaks", achievementCategory = "Midnight" }
	Gallery.ItemDetails[263873] = { source = "Exploration", achievementID = 63358, achievementName = "Coiled to Strike", achievementCategory = "Midnight" }
	Gallery.ItemDetails[248962] = { source = "Exploration", achievementID = 63432, achievementName = "Mysterious Mix Master", achievementCategory = "Midnight" }
Gallery.ItemDetails[279922] = { source = "Exploration", achievementID = 63636, achievementName = "Fully Corroded", achievementCategory = "Midnight" }
end

do--feats of strength --4
	Gallery.ItemDetails[260785] = { source = "Feats of Strength", achievementID = 62387, achievementName = "It's Nearly Midnight", achievementCategory = "Events"} 
	Gallery.ItemDetails[281107] = { source = "Feats of Strength", achievementID = 63685, achievementName = "Blizzcon 2026", achievementCategory = "Events"} 
Gallery.ItemDetails[274731] = { source = "Feats of Strength", achievementID = 63343, achievementName = "Goal!", achievementCategory = "Promotions"} 
Gallery.ItemDetails[274734] = { source = "Feats of Strength", achievementID = 63343, achievementName = "Goal!", achievementCategory = "Promotions"} 
Gallery.ItemDetails[274736] = { source = "Feats of Strength", achievementID = 63343, achievementName = "Goal!", achievementCategory = "Promotions"} 
end

if (select(4, GetBuildInfo()) or 0) >= 120107 then

  Gallery.ItemDetails[281626] = { source = "Expansion Features", achievementID = 63691, achievementName = "Lorewalking: Thrall", achievementCategory = "Lorewalking" }
  Gallery.ItemDetails[283475] = { source = "Expansion Features", achievementID = 63710, achievementName = "Lorewalking: Titans", achievementCategory = "Lorewalking" }
  Gallery.ItemDetails[283453] = { source = "Expansion Features", achievementID = 63712, achievementName = "Lorewalking: Jaina", achievementCategory = "Lorewalking" }
  Gallery.ItemDetails[283463] = { source = "Expansion Features", achievementID = 63604, achievementName = "Lorewalking: Tyr", achievementCategory = "Lorewalking" }
end


do--expansion features --103
	Gallery.ItemDetails[248124] = { source = "Expansion Features", achievementID = 19458, achievementName = "A World Awoken", achievementCategory = "Expansion Features" }
	Gallery.ItemDetails[248125] = { source = "Expansion Features", achievementID = 20501, achievementName = "Back from the Beyond", achievementCategory = "Expansion Features" }
	Gallery.ItemDetails[257353] = { source = "Expansion Features", achievementID = 61451, achievementName = "Worldsoul-Searching", achievementCategory = "Expansion Features" }
	Gallery.ItemDetails[247667] = { source = "Expansion Features", achievementID = 40953, achievementName = "A Farewell to Arms", achievementCategory = "Expansion Features" }
	Gallery.ItemDetails[247668] = { source = "Expansion Features", achievementID = 40953, achievementName = "A Farewell to Arms", achievementCategory = "Expansion Features" }

	Gallery.ItemDetails[256425] = { source = "Expansion Features", achievementID = 8316, achievementName = "Blood in the Snow", achievementCategory = "Pandaria Scenarios" }
--5 lorewalking
	Gallery.ItemDetails[257355] = { source = "Expansion Features", achievementID = 42188, achievementName = "Lorewalking: Blade's Bane", achievementCategory = "Lorewalking" }
	Gallery.ItemDetails[257354] = { source = "Expansion Features", achievementID = 42187, achievementName = "Lorewalking: Ethereal Wisdom", achievementCategory = "Lorewalking" }
	Gallery.ItemDetails[245332] = { source = "Expansion Features", achievementID = 61467, achievementName = "Lorewalking: The Elves of Quel'thalas", achievementCategory = "Lorewalking" }
	Gallery.ItemDetails[257351] = { source = "Expansion Features", achievementID = 42189, achievementName = "Lorewalking: The Lich King", achievementCategory = "Lorewalking" }
	Gallery.ItemDetails[271971] = { source = "Expansion Features", achievementID = 61442, achievementName = "Lorewalking: The Loa", achievementCategory = "Lorewalking" }
--34 prey
	Gallery.ItemDetails[265798] = { source = "Expansion Features", achievementID = 62154, achievementName = "Prey: A Different Kind of Void (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265796] = { source = "Expansion Features", achievementID = 62169, achievementName = "Prey: A Different Kind of Void (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265707] = { source = "Expansion Features", achievementID = 62165, achievementName = "Prey: A Thorn in the Side (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265692] = { source = "Expansion Features", achievementID = 62183, achievementName = "Prey: A Thorn in the Side (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265699] = { source = "Expansion Features", achievementID = 62156, achievementName = "Prey: Anger Management (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265684] = { source = "Expansion Features", achievementID = 62174, achievementName = "Prey: Anger Mangement (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265702] = { source = "Expansion Features", achievementID = 62160, achievementName = "Prey: Blinded By The Light (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265687] = { source = "Expansion Features", achievementID = 62178, achievementName = "Prey: Blinded By The Light (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265701] = { source = "Expansion Features", achievementID = 62159, achievementName = "Prey: Bloody Green Thumbs (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265686] = { source = "Expansion Features", achievementID = 62177, achievementName = "Prey: Bloody Green Thumbs (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265708] = { source = "Expansion Features", achievementID = 62166, achievementName = "Prey: Breaking the Blade (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265694] = { source = "Expansion Features", achievementID = 62184, achievementName = "Prey: Breaking the Blade (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265705] = { source = "Expansion Features", achievementID = 62163, achievementName = "Prey: Chasing Death (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265690] = { source = "Expansion Features", achievementID = 62181, achievementName = "Prey: Chasing Death (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265704] = { source = "Expansion Features", achievementID = 62162, achievementName = "Prey: Dominating the Void (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265689] = { source = "Expansion Features", achievementID = 62180, achievementName = "Prey: Dominating the Void (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265698] = { source = "Expansion Features", achievementID = 62155, achievementName = "Prey: Ethereal Assassins (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265683] = { source = "Expansion Features", achievementID = 62173, achievementName = "Prey: Ethereal Assassins (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265697] = { source = "Expansion Features", achievementID = 62153, achievementName = "Prey: Insane Inventors (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265682] = { source = "Expansion Features", achievementID = 62168, achievementName = "Prey: Insane Inventors (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265696] = { source = "Expansion Features", achievementID = 62144, achievementName = "Prey: Mad Magisters (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265681] = { source = "Expansion Features", achievementID = 62167, achievementName = "Prey: Mad Magisters (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265706] = { source = "Expansion Features", achievementID = 62164, achievementName = "Prey: No Rest for the Wretched (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265691] = { source = "Expansion Features", achievementID = 62182, achievementName = "Prey: No Rest for the Wretched (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265703] = { source = "Expansion Features", achievementID = 62161, achievementName = "Prey: Outsmarting the Schemers (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265688] = { source = "Expansion Features", achievementID = 62179, achievementName = "Prey: Outsmarting the Schemers (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265700] = { source = "Expansion Features", achievementID = 62157, achievementName = "Prey: Sadistic Shamans (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265685] = { source = "Expansion Features", achievementID = 62175, achievementName = "Prey: Sadistic Shamans (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265799] = { source = "Expansion Features", achievementID = 62158, achievementName = "Prey: The Fallen Farstriders (Hard)", achievementCategory = "Prey" }
	Gallery.ItemDetails[265797] = { source = "Expansion Features", achievementID = 62176, achievementName = "Prey: The Fallen Farstriders (Nightmare)", achievementCategory = "Prey" }
	Gallery.ItemDetails[278369] = { source = "Expansion Features", achievementID = 63451, achievementName = "Scales for Days", achievementCategory = "Prey" }
	Gallery.ItemDetails[278372] = { source = "Expansion Features", achievementID = 63452, achievementName = "Fangs for the Memories", achievementCategory = "Prey" }
	Gallery.ItemDetails[278376] = { source = "Expansion Features", achievementID = 63454, achievementName = "Nine, Ten, Never Sleep Again", achievementCategory = "Prey" }
	Gallery.ItemDetails[278380] = { source = "Expansion Features", achievementID = 63453, achievementName = "One, Two, Ral'kala's Coming for You", achievementCategory = "Prey" }
--48 class hall
	Gallery.ItemDetails[250134] = { source = "Expansion Features", achievementID = 42289, achievementName = "Hidden Potential of the Archdruid", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250306] = { source = "Expansion Features", achievementID = 42291, achievementName = "Hidden Potential of the Archmage", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249458] = { source = "Expansion Features", achievementID = 42298, achievementName = "Hidden Potential of the Battlelord", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250123] = { source = "Expansion Features", achievementID = 42287, achievementName = "Hidden Potential of the Deathlord", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250914] = { source = "Expansion Features", achievementID = 42296, achievementName = "Hidden Potential of the Farseer", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[262619] = { source = "Expansion Features", achievementID = 42292, achievementName = "Hidden Potential of the Grandmaster", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250790] = { source = "Expansion Features", achievementID = 42294, achievementName = "Hidden Potential of the High Priest", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250230] = { source = "Expansion Features", achievementID = 42293, achievementName = "Hidden Potential of the Highlord", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250125] = { source = "Expansion Features", achievementID = 42290, achievementName = "Hidden Potential of the Huntmaster", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[248940] = { source = "Expansion Features", achievementID = 42297, achievementName = "Hidden Potential of the Netherlord", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250787] = { source = "Expansion Features", achievementID = 42295, achievementName = "Hidden Potential of the Shadowblade", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249457] = { source = "Expansion Features", achievementID = 42288, achievementName = "Hidden Potential of the Slayer", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[256679] = { source = "Expansion Features", achievementID = 60967, achievementName = "Legendary Research of Five Dawns", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[256907] = { source = "Expansion Features", achievementID = 60972, achievementName = "Legendary Research of the Black Harvest", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250111] = { source = "Expansion Features", achievementID = 60964, achievementName = "Legendary Research of the Dreamgrove", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[260584] = { source = "Expansion Features", achievementID = 60962, achievementName = "Legendary Research of the Ebon Blade", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249690] = { source = "Expansion Features", achievementID = 60963, achievementName = "Legendary Research of the Illidari", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250915] = { source = "Expansion Features", achievementID = 60971, achievementName = "Legendary Research of the Maelstrom", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250791] = { source = "Expansion Features", achievementID = 60969, achievementName = "Legendary Research of the Netherlight Conclave", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250233] = { source = "Expansion Features", achievementID = 60968, achievementName = "Legendary Research of the Silver Hand", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[256674] = { source = "Expansion Features", achievementID = 60966, achievementName = "Legendary Research of the Tirisgarde", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250788] = { source = "Expansion Features", achievementID = 60970, achievementName = "Legendary Research of the Uncrowned", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250127] = { source = "Expansion Features", achievementID = 60965, achievementName = "Legendary Research of the Unseen Path", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[257396] = { source = "Expansion Features", achievementID = 60973, achievementName = "Legendary Research of the Valarjar", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250112] = { source = "Expansion Features", achievementID = 60981, achievementName = "Raise an Army for Acherus", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249461] = { source = "Expansion Features", achievementID = 60992, achievementName = "Raise an Army for Skyhold", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[264242] = { source = "Expansion Features", achievementID = 60991, achievementName = "Raise an Army for the Dreadscar Rift", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[251013] = { source = "Expansion Features", achievementID = 60983, achievementName = "Raise an Army for the Dreamgrove", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249518] = { source = "Expansion Features", achievementID = 60982, achievementName = "Raise an Army for the Fel Hammer", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250786] = { source = "Expansion Features", achievementID = 60989, achievementName = "Raise an Army for the Hall of Shadows", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250131] = { source = "Expansion Features", achievementID = 60985, achievementName = "Raise an Army for the Hall of the Guardian", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[251014] = { source = "Expansion Features", achievementID = 60990, achievementName = "Raise an Army for the Maelstrom", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[251636] = { source = "Expansion Features", achievementID = 60988, achievementName = "Raise an Army for the Netherlight Temple", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250236] = { source = "Expansion Features", achievementID = 60987, achievementName = "Raise an Army for the Sanctum of Light", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[248942] = { source = "Expansion Features", achievementID = 60986, achievementName = "Raise an Army for the Temple of Five Dawns", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250126] = { source = "Expansion Features", achievementID = 60984, achievementName = "Raise an Army for the Trueshot Lodge", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[260581] = { source = "Expansion Features", achievementID = 42272, achievementName = "The Archdruid's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[245429] = { source = "Expansion Features", achievementID = 42274, achievementName = "The Archmage's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249466] = { source = "Expansion Features", achievementID = 42282, achievementName = "The Battlelord's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250115] = { source = "Expansion Features", achievementID = 42270, achievementName = "The Deathlord's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[257403] = { source = "Expansion Features", achievementID = 42280, achievementName = "The Farseer's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[248958] = { source = "Expansion Features", achievementID = 42275, achievementName = "The Grandmaster's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250792] = { source = "Expansion Features", achievementID = 42277, achievementName = "The High Priest's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[250234] = { source = "Expansion Features", achievementID = 42276, achievementName = "The Highlord's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[248011] = { source = "Expansion Features", achievementID = 42273, achievementName = "The Huntmaster's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[248960] = { source = "Expansion Features", achievementID = 42281, achievementName = "The Netherlord's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[260776] = { source = "Expansion Features", achievementID = 42279, achievementName = "The Shadowblade's Campaign", achievementCategory = "Legion Class Hall" }
	Gallery.ItemDetails[249459] = { source = "Expansion Features", achievementID = 42271, achievementName = "The Slayer's Campaign", achievementCategory = "Legion Class Hall" }

	Gallery.ItemDetails[245467] = { source = "Expansion Features", achievementID = 12869, achievementName = "Azeroth at War: After Lordaeron", achievementCategory = "War Effort" }
	Gallery.ItemDetails[245483] = { source = "Expansion Features", achievementID = 12870, achievementName = "Azeroth at War: Kalimdor on Fire", achievementCategory = "War Effort" }
	Gallery.ItemDetails[245463] = { source = "Expansion Features", achievementID = 12867, achievementName = "Azeroth at War: The Barrens", achievementCategory = "War Effort" }

	Gallery.ItemDetails[276083] = { source = "Expansion Features", achievementID = 63325, achievementName = "Omnium Folio Studies", achievementCategory = "Void Assaults" }

Gallery.ItemDetails[276321] = { source = "Expansion Features", achievementID = 62905, achievementName = "Pain of Command", achievementCategory = "Void Assaults" }
Gallery.ItemDetails[276318] = { source = "Expansion Features", achievementID = 62905, achievementName = "Pain of Command", achievementCategory = "Void Assaults" }
Gallery.ItemDetails[267211] = { source = "Expansion Features", achievementID = 62905, achievementName = "Pain of Command", achievementCategory = "Void Assaults" }
Gallery.ItemDetails[276432] = { source = "Expansion Features", achievementID = 63384, achievementName = "Prepared for a Showdown", achievementCategory = "Void Assaults" }
Gallery.ItemDetails[276429] = { source = "Expansion Features", achievementID = 63384, achievementName = "Prepared for a Showdown", achievementCategory = "Void Assaults" }
Gallery.ItemDetails[276316] = { source = "Expansion Features", achievementID = 63384, achievementName = "Prepared for a Showdown", achievementCategory = "Void Assaults" }
end

do--raids --5
	Gallery.ItemDetails[246479] = { source = "Dungeons and Raids", achievementID = 13723, achievementName = "M.C., Hammered", achievementCategory = "Battle Dungeon" }
	Gallery.ItemDetails[256913] = { source = "Dungeons and Raids", achievementID = 10996, achievementName = "Got to Ketchum All", achievementCategory = "Legion Dungeon" }
	Gallery.ItemDetails[258223] = { source = "Dungeons and Raids", achievementID = 11699, achievementName = "Grand Fin-ale", achievementCategory = "Legion Raid" }
	Gallery.ItemDetails[244852] = { source = "Dungeons and Raids", achievementID = 4405, achievementName = "More Dots! (25 player)", achievementCategory = "Lich King Raid" }
	Gallery.ItemDetails[245302] = { source = "Dungeons and Raids", achievementID = 41119, achievementName = "One Rank Higher", achievementCategory = "War Within Raid" }
end

do--pvp --22
	Gallery.ItemDetails[247758] = { source = "Player vs Player", achievementID = 221, achievementName = "Alterac Grave Robber", achievementCategory = "Alterac Valley" }
	Gallery.ItemDetails[247760] = { source = "Player vs Player", achievementID = 222, achievementName = "Tower Defense", achievementCategory = "Alterac Valley" }
	Gallery.ItemDetails[247757] = { source = "Player vs Player", achievementID = 158, achievementName = "Me and the Cappin' Makin' It Happen", achievementCategory = "Arathi Basin" }
	Gallery.ItemDetails[247759] = { source = "Player vs Player", achievementID = 1153, achievementName = "Overly Defensive", achievementCategory = "Arathi Basin" }
	Gallery.ItemDetails[256896] = { source = "Player vs Player", achievementID = 5245, achievementName = "Battle for Gilneas Victory", achievementCategory = "Battle for Gilneas" }
	Gallery.ItemDetails[253170] = { source = "Player vs Player", achievementID = 40210, achievementName = "Deephaul Ravine Victory", achievementCategory = "Deephaul Ravine" }
	Gallery.ItemDetails[247750] = { source = "Player vs Player", achievementID = 40612, achievementName = "Sprinting in the Ravine", achievementCategory = "Deephaul Ravine" }
	Gallery.ItemDetails[247761] = { source = "Player vs Player", achievementID = 212, achievementName = "Storm Capper", achievementCategory = "Eye of the Storm" }
	Gallery.ItemDetails[247762] = { source = "Player vs Player", achievementID = 213, achievementName = "Stormtrooper", achievementCategory = "Eye of the Storm" }
	Gallery.ItemDetails[247765] = { source = "Player vs Player", achievementID = 61687, achievementName = "Champion in Battle", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247756] = { source = "Player vs Player", achievementID = 1157, achievementName = "Duel-icious", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247763] = { source = "Player vs Player", achievementID = 61683, achievementName = "Entering Battle", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247770] = { source = "Player vs Player", achievementID = 61686, achievementName = "Expert in Battle", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247766] = { source = "Player vs Player", achievementID = 61688, achievementName = "Master in Battle", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247769] = { source = "Player vs Player", achievementID = 61685, achievementName = "Proficient in Battle", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247768] = { source = "Player vs Player", achievementID = 61684, achievementName = "Progressing in Battle", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247745] = { source = "Player vs Player", achievementID = 229, achievementName = "The Grim Reaper", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247744] = { source = "Player vs Player", achievementID = 231, achievementName = "Wrecking Ball", achievementCategory = "Player vs. Player" }
	Gallery.ItemDetails[247727] = { source = "Player vs Player", achievementID = 5223, achievementName = "Master of Twin Peaks", achievementCategory = "Twin Peaks" }
	Gallery.ItemDetails[247746] = { source = "Player vs Player", achievementID = 200, achievementName = "Persistent Defender", achievementCategory = "Warsong Gulch" }
	Gallery.ItemDetails[247747] = { source = "Player vs Player", achievementID = 167, achievementName = "Warsong Gulch Veteran", achievementCategory = "Warsong Gulch" }
	Gallery.ItemDetails[247740] = { source = "Player vs Player", achievementID = 6981, achievementName = "Master of Temple Kotmogu", achievementCategory = "Temple of Kotmogu" }
	Gallery.ItemDetails[247741] = { source = "Player vs Player", achievementID = 6981, achievementName = "Master of Temple Kotmogu", achievementCategory = "Temple of Kotmogu" }
end

do-- Professions --18
	Gallery.ItemDetails[245426] = { source = "Professions", achievementID = 4859, achievementName = "Kings Under the Mountain", achievementCategory = "Archaeology" }
	Gallery.ItemDetails[258740] = { source = "Professions", achievementID = 9415, achievementName = "Secrets of Skettis", achievementCategory = "Archaeology" }
	Gallery.ItemDetails[244325] = { source = "Professions", achievementID = 12746, achievementName = "The Zandalari Menu", achievementCategory = "Cooking" }
	Gallery.ItemDetails[263997] = { source = "Professions", achievementID = 42788, achievementName = "Alchemizing at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[263998] = { source = "Professions", achievementID = 42792, achievementName = "Blacksmithing at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[263999] = { source = "Professions", achievementID = 42795, achievementName = "Cooking at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264000] = { source = "Professions", achievementID = 42787, achievementName = "Enchanting at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264001] = { source = "Professions", achievementID = 42798, achievementName = "Engineering at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264002] = { source = "Professions", achievementID = 42797, achievementName = "Fishing at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264003] = { source = "Professions", achievementID = 42793, achievementName = "Herbalism at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264004] = { source = "Professions", achievementID = 42796, achievementName = "Inscribing at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264005] = { source = "Professions", achievementID = 42789, achievementName = "Jewelcrafting at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264006] = { source = "Professions", achievementID = 42786, achievementName = "Leatherworking at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264172] = { source = "Professions", achievementID = 42791, achievementName = "Mining at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[253163] = { source = "Professions", achievementID = 19408, achievementName = "Professional Algari Master", achievementCategory = "Professions" }
	Gallery.ItemDetails[245490] = { source = "Professions", achievementID = 12733, achievementName = "Professional Zandalari Master", achievementCategory = "Professions" }
	Gallery.ItemDetails[264173] = { source = "Professions", achievementID = 42790, achievementName = "Skinning at Midnight", achievementCategory = "Professions" }
	Gallery.ItemDetails[264174] = { source = "Professions", achievementID = 42794, achievementName = "Tailoring at Midnight", achievementCategory = "Professions" }
end

do--Legacy --17
	Gallery.ItemDetails[250307]  = { source = "Legacy", achievementID = 42318,  achievementName = "Court of Farondis", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250406]  = { source = "Legacy", achievementID = 42321,  achievementName = "Legion Remix Raids", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[258299]  = { source = "Legacy", achievementID = 42547,  achievementName = "Highmountain Tribe", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250407]  = { source = "Legacy", achievementID = 42619,  achievementName = "Dreamweavers", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250690]  = { source = "Legacy", achievementID = 42627,  achievementName = "Argussian reach", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[256677]  = { source = "Legacy", achievementID = 42628,  achievementName = "The Nightfallen", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[252753]  = { source = "Legacy", achievementID = 42655,  achievementName = "The Armies of Legionfall", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250402]  = { source = "Legacy", achievementID = 42658,  achievementName = "Valarjar", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250693]  = { source = "Legacy", achievementID = 42674,  achievementName = "Broken Isles World Quests V", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250622]  = { source = "Legacy", achievementID = 42675,  achievementName = "Defending the Broken Isles III", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[251779]  = { source = "Legacy", achievementID = 42689,  achievementName = "Timesworn Keystone Master", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250403]  = { source = "Legacy", achievementID = 42692,  achievementName = "Broken Isles Dungeoneer", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250689]  = { source = "Legacy", achievementID = 61054,  achievementName = "Heroic Broken World Quests III", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[250405]  = { source = "Legacy", achievementID = 61060,  achievementName = "Power of the Obelisks II", achievementCategory = "Legion Remix "}
	Gallery.ItemDetails[251778]  = { source = "Legacy", achievementID = 61218,  achievementName = "The Wardens", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[256678] = { source = "Legacy",  achievementID = 42628,  achievementName = "The Nightfallen", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250404] = { source = "Legacy",  achievementID = 42675,  achievementName = "Defending the Broken Isles III", achievementCategory = "Legion Remix "}
end 
	Gallery.ItemDetails[282287]  = { source = "World Events", achievementID = 10365,  achievementName = "A Frightening Friend", achievementCategory = "Hallow's End ", note = "Currently no vendor sells duplicates of this decor"}
	Gallery.ItemDetails[283262]  = { source = "Quests", achievementID = 14164,  achievementName = "Awaken, Ardenweald", achievementCategory = "Shadowlands"}
	Gallery.ItemDetails[282162]  = { source = "Exploration", achievementID = 12026,  achievementName = "Invasion Obliteration", achievementCategory = "Legion"}
	
	
local function ApplyGalleryAchievementUnlock(achievementID, achievementName, category, itemIDs)
    Gallery.ItemDetails = Gallery.ItemDetails or {}

    for _, itemID in ipairs(itemIDs or {}) do
        local details = Gallery.ItemDetails[itemID] or {}

        -- Force these because this group is intentional gallery-only data.
        details.achievementID = achievementID
        details.achievementName = achievementName
        details.category = details.category or category

        Gallery.ItemDetails[itemID] = details
    end
end

--[[ApplyGalleryAchievementUnlock(
    42117,
    "The War of Light and Shadow",
    "Quests",
    {
        253602,
        253603,
        253604,
        253605,
        253607,
        253608,
        253614,
        253615,
        253616,
        253617,
        253618,
        253619,
        253620,
    }
)]]

ApplyGalleryAchievementUnlock(
    63343,
    "Goal!",
    "Promotions",
    {
        274731,
        274734,
        274736,
    }
)

ApplyGalleryAchievementUnlock(
    63384,
    "Prepared for a Showdown",
    "Void Assaults",
    {
		276316,
		276429,
		276432,
    }
)

ApplyGalleryAchievementUnlock(
    62905,
    "Pain of Command",
    "Void Assaults",
    {
		276321,
		276318,
		267211,
    }
)

end

-------------------------------------------------
-- Quests
-------------------------------------------------

do --Quest Stuff

do--Amirdrassil"] = {
	Gallery.ItemDetails[251022] = { questID = 78864, questName = "The Returning"}
	Gallery.ItemDetails[257352] = { questID = 77283, questName = "A Multi-Front Battle"}
end

do --Arcantina quests
	Gallery.ItemDetails[253542] = { questID = 92319, questName = "A Favor to Axe" }
	Gallery.ItemDetails[253598] = { questID = 92321, questName = "A Frostbitten Tally" }
	Gallery.ItemDetails[253174] = { questID = 92327, questName = "A Generational Moment" }
	Gallery.ItemDetails[253543] = { questID = 92327, questName = "A Generational Moment" }
	Gallery.ItemDetails[253544] = { questID = 92325, questName = "Hellscream's Heritage" }
	Gallery.ItemDetails[278038] = {questID = 95780, questName = "Hope for the Orphans" } 
	Gallery.ItemDetails[278694] = {questID = 95779, questName = "Moments in a Mug" } 
	Gallery.ItemDetails[253178] = { questID = 92320, questName = "Still Behind Enemy Portals" }
	Gallery.ItemDetails[253179] = { questID = 92326, questName = "The Fragrance of the Dunes" }
	Gallery.ItemDetails[253700] = { questID = 92326, questName = "The Fragrance of the Dunes" }
	Gallery.ItemDetails[253176] = { questID = 92322, questName = "Timear Foresees a Proof of Demise!"}
	Gallery.ItemDetails[253175] = { questID = 92323, questName = "Where the Fire Once Burned" }
	Gallery.ItemDetails[253177] = { questID = 92324, questName = "Uncrowned's Cold Case" }
end

do--Ardenweald"] = {
	Gallery.ItemDetails[283341] = { questID = 60778, questName = "Wildseed Rescue" }
end

do--Atal'Aman"] = {
	Gallery.ItemDetails[264334] = { questID = 86711, questName = "Amani Clarion Call"}
	Gallery.ItemDetails[264257] = { questID = 86712, questName = "The Amani Stand Strong"}
end

do--Azsuna"] = {
	Gallery.ItemDetails[246864] = { questID = 37470, questName = "The Head of the Snake" }
	Gallery.ItemDetails[258222] = { questID = 41143, questName = "Mglrgrs Of Our Grmlgrlr" }
end

do--Bastion"] = {
	Gallery.ItemDetails[284542] = { questID = 59426, questName = "Your Personal Assistant" }
end

do--Blackrock Depths"] = {
	Gallery.ItemDetails[256673] = { questID = 7604, questName = "A Binding Contract" }
	Gallery.ItemDetails[245427] = { questID = 53566, questName = "Dark Iron Dwarves"}
end

do--Blasted Lands"] = {
	Gallery.ItemDetails[244777] = { questID = 25720, questName = "The Downfall of Marl Wormthorn" }
end

do--Borean Tundra"] = {
	Gallery.ItemDetails[258220] = { questID = 11566, questName = "Surrender... Not!" }
end

do--Burning Steppes"] = {
	Gallery.ItemDetails[256331] = { questID = 28183, questName = "Return to Keeshan" }
end

do--City of Threads"] = {
	Gallery.ItemDetails[260583] = { questID = 82141, questName = "To Kill a Queen"}
end

do--Dalaran"] = {
	Gallery.ItemDetails[258145] = { questID = 13103, questIDs = { 13103, 13115 }, questName = "Cheese for Glowergold", note = "Alliance/Horde versions both unlock this decor." }
	Gallery.ItemDetails[251480] = { questID = 44004, questName = "Bringer of the Light" }
end

do--Dornogal"] = {
	Gallery.ItemDetails[248116] = { questID = 92578, questName = "Draconic Decor"}
	Gallery.ItemDetails[245259] = { questID = 92577, questName = "Dreamy Inspiration"}
	Gallery.ItemDetails[247915] = { questID = 92581, questName = "Last Light"}
	Gallery.ItemDetails[246487] = { questID = 92580, questName = "Spare A Chair" }
	Gallery.ItemDetails[253173] = { questID = 92572, questName = "Furniture Favor"}
	Gallery.ItemDetails[252756] = { questID = 79530, questName = "Bad Business" }
end

do--Drustvar"] = {
	Gallery.ItemDetails[245475] = { questID = 51985, questName = "Return to Zuldazar"}
end

do--Duskwood"] = {
	Gallery.ItemDetails[256905] = { questID = 26754, questName = "Morbent's Bane" }
	Gallery.ItemDetails[245624] = { questID = 26760, questName = "Cry For The Moon"}
end

do--Elwynn Forest"] = {
	Gallery.ItemDetails[248938] = { questID = 60, questName = "Kobold Candles"}
	Gallery.ItemDetails[253527] = { questID = 114, questName = "The Escape" }
	Gallery.ItemDetails[248798] = { questID = 54, questName = "Report to Goldshire" }
end

do--Eredath"] = {
	Gallery.ItemDetails[245422] = { questID = 47691, questName = "A Non-Prophet Organization"}
end

do--Eversong Woods"] = {
	Gallery.ItemDetails[251914] = { questID = 88941, questName = "For Quel'Thalas"}
	Gallery.ItemDetails[244538] = { questID = 86650, questName = "Fractured"}
	Gallery.ItemDetails[264248] = { questID = 86739, questName = "Fairbreeze Favors"}
	Gallery.ItemDetails[245992] = { questID = 86741, questName = "Lightbloom Looming"}
	Gallery.ItemDetails[253485] = { questID = 90493, questName = "The Heart of Tranquillien"}
	Gallery.ItemDetails[244783] = { questID = 90907, questName = "The First to Know" }
	Gallery.ItemDetails[257418] = { questID = 92025, questName = "Flowers for Amalthea" }
end

do--Felwood"] = {
	Gallery.ItemDetails[256903] = { questID = 28337, questName = "The Shredders of Irontree"}
	Gallery.ItemDetails[248401] = { questID = 76213, questName = "Honor of the Goddess" }
end

do--Frostfire Ridge"] = {
	Gallery.ItemDetails[245438] = { questID = 33527, questName = "Last Steps"}
	Gallery.ItemDetails[244320] = { questID = 33470, questName = "Pool of Visions" }
end

do--Frostwall"] = {
	Gallery.ItemDetails[244315] = { questID = 36614, questName = "My Very Own Fortress"}
end

do--Gilneas"] = {
	Gallery.ItemDetails[245620] = { questID = 14402, questName = "Ready to Go"}
	Gallery.ItemDetails[245518] = { questID = 24675, questName = "Last Meal"}
end

do--Grizzly Hills"] = {
	Gallery.ItemDetails[248622] = { questID = 12227, questName = "Doing Your Duty"}
end

do--Harandar"] = {
	Gallery.ItemDetails[254878] = { questID = 86891, questName = "A Last Resort"}
	Gallery.ItemDetails[263196] = { questID = 88995, questName = "Aln'hara's Bloom" }
	Gallery.ItemDetails[254319] = { questID = 86866, questName = "Can We Heal This?"}
	Gallery.ItemDetails[246407] = { questID = 86857, questName = "Descent into the Rift" }
	Gallery.ItemDetails[246415] = { questID = 86911, questName = "Echoes and Memories"}
	Gallery.ItemDetails[264243] = { questID = 96500, questName = "Firm Haranir Pillow"}
	Gallery.ItemDetails[263020] = { questID = 90834, questName = "From This Point Forward" }
	Gallery.ItemDetails[245535] = { questID = 86973, questName = "Halting Harm in Har'mara"}
	Gallery.ItemDetails[263038] = { questID = 96507, questName = "Haranir Reclined Bed" }
	Gallery.ItemDetails[252045] = { questID = 86861, questName = "Herding Manifestations"}
	Gallery.ItemDetails[253467] = { questID = 86867, questName = "Into the Lightbloom" }
	Gallery.ItemDetails[247234] = { questID = 86896, questName = "Light Finds a Way"}
	Gallery.ItemDetails[264178] = { questID = 91589, questName = "Root Dash Delivery"}
	Gallery.ItemDetails[263041] = { questID = 88998, questName = "Root of the World"}
	Gallery.ItemDetails[262906] = { questID = 88997, questName = "Russula's Outreach"}
	Gallery.ItemDetails[253443] = { questID = 88999, questName = "Sky's Hope"}
	Gallery.ItemDetails[263315] = { questID = 88994, questName = "The Cauldron of Echoes" }
	Gallery.ItemDetails[264262] = { questID = 88996, questName = "The Echoless Flame" }
	Gallery.ItemDetails[266259] = { questID = 86851, questName = "The Foundation of Aln"}
	Gallery.ItemDetails[262614] = { questID = 86956, questName = "The Traveling Flowers" }
	Gallery.ItemDetails[263037] = { questID = 88993, questName = "Wey'nan's Ward"}
	Gallery.ItemDetails[264245] = { questID = 96504, questName = "Warm Haranir Blanket" }
end

do--Highmountain"] = {
	Gallery.ItemDetails[257723] = { questID = 39305, questName = "Empty Nest" }
	Gallery.ItemDetails[257722] = { questID = 39426, questName = "Blood Debt" }
	Gallery.ItemDetails[257401] = { questID = 39387, questName = "The Skies of Highmountain" }
	Gallery.ItemDetails[245409] = { questID = 39496, questName = "The Flow of the River" }
	Gallery.ItemDetails[245456] = { questID = 39579, questName = "The Backdoor" }
	Gallery.ItemDetails[257397] = { questID = 39992, questName = "Huln's War - The Nathrezim" }
	Gallery.ItemDetails[258221] = { questID = 40230, questName = "Oh, the Clawdacity!" }	
	Gallery.ItemDetails[264477] = { questID = 39487, questName = "Crystal Fury" }
	Gallery.ItemDetails[245457] = { questID = 39614, questName = "Fish Out of Water"}
	Gallery.ItemDetails[260698] = { questID = 39772, questName = "Can't Hold a Candle To You"}
	Gallery.ItemDetails[245461] = { questID = 39780, questName = "The Underking"}
	Gallery.ItemDetails[245453] = { questID = 42590, questName = "Moozy's Reunion" }
	Gallery.ItemDetails[245405] = { questID = 42622, questName = "Ceremonial Drums"}
end

do--Isle of Dorn"] = {
	Gallery.ItemDetails[253166] = { questID = 78759, questName = "To Wake a Giant" }
	Gallery.ItemDetails[253021] = { questID = 78999, questName = "Heart of a Hero" }
	Gallery.ItemDetails[258267] = { questID = 79565, questName = "Janky Candles" }
	Gallery.ItemDetails[253035] = { questID = 79703, questName = "Hope, An Anomaly" }
	Gallery.ItemDetails[253034] = { questID = 82895, questName = "The Weight of Duty" }
end

do--K'aresh"] = {
	Gallery.ItemDetails[260582] = { questID = 86820, questName = "Manaforge Omega: Dimensius Looms"}
end

do--Krokuun"] = {
	Gallery.ItemDetails[282148] = { questID = 47654, questName = "Seat of the Triumvirate: The Crest of Knowledge"}
end

do--Kun-Lai Summit"] = {
	Gallery.ItemDetails[264349] = { questID = 30612, questName = "The Leader Hozen" }
	Gallery.ItemDetails[247858] = { questID = 32816, questName = "Path of the Last Emperor"}
end

do--Loch Modan"] = {
	Gallery.ItemDetails[246422] = { questID = 26868, questName = "Axis of Awful"}
end

do--Lunarfall"] = {
	Gallery.ItemDetails[248800] = { questID = 36615, questName = "My Very Own Castle" }
	Gallery.ItemDetails[248661] = { questID = 36592, questName = "Bigger is Better" }
	Gallery.ItemDetails[248810] = { questID = 35176, questName = "Keeping it Together" }
	Gallery.ItemDetails[248334] = { questID = 36404, questName = "Clearing the Garden" }
	Gallery.ItemDetails[248660] = { questID = 34192, questName = "Things Are Not Goren Our Way" }
	Gallery.ItemDetails[248799] = { questID = 34586, questName = "Establish Your Garrison" }
	Gallery.ItemDetails[248335] = { questID = 36202, questName = "Anglin' In Our Garrison" }	
end

do--Maldraxxus"] = {
	Gallery.ItemDetails[284500] = { questID = 57982, questName = "Breaking Down Barriers" }	
end

do--Mechagon"] = {
	Gallery.ItemDetails[246703] = { questID = 55736, questName = "Welcome to the Resistance" }	
end

do--Mulgore"] = {
	Gallery.ItemDetails[243335] = { questID = 26397, questName = "Walk With The Earth Mother" }	
end

do--Nagrand"] = {
	Gallery.ItemDetails[245425] = { questID = 35396, questName = "The Dark Heart of Oshu'gun" }
end

do--Nazmir"] = {
	Gallery.ItemDetails[245488] = { questID = 47188, questName = "The Aid of the Loa" }
	Gallery.ItemDetails[245489] = { questID = 47250, questName = "We'll Meet Again" }
	Gallery.ItemDetails[245491] = { questID = 50808, questName = "Halting the Empire's Fall" }
end

do--Northshire"] = {

	Gallery.ItemDetails[248621] = { questID = 26390, questName = "Ending the Invasion!" }
end

do--Searing Gorge"] = {
	Gallery.ItemDetails[245333] = { questID = 28035, questName = "The Mountain-Lord's Support" }
	Gallery.ItemDetails[246409] = { questID = 28064, questName = "Welcome to the Brotherhood" }	
end

do--Shadowmoon Valley"] = {
	Gallery.ItemDetails[251654] = { questID = 33256, questName = "The Defense of Karabor" }
	Gallery.ItemDetails[251330] = { questID = 34792, questName = "The Traitor's True Name" }
	Gallery.ItemDetails[251548] = { questID = 34792, questName = "The Traitor's True Name" }	
	Gallery.ItemDetails[251478] = { questID = 35196, questName = "Forging Ahead" }
	Gallery.ItemDetails[251477] = { questID = 36169, questName = "The Trial of Champions" }
	Gallery.ItemDetails[251549] = { questID = 37322, questName = "The Prophet's Final Message" }
	Gallery.ItemDetails[251329] = { questID = 38197, questName = "Missive: Assault on Socrethar's Rise"}
end

do--Silvermoon City"] = {
	Gallery.ItemDetails[246458] = { questID = 88942, questName = "The Elves are Going to War" }
	Gallery.ItemDetails[263231] = { questID = 86735, questName = "Paved in Ash" }
	Gallery.ItemDetails[265106] = { questID = 90867, questName = "From Darkness, Light" }
	Gallery.ItemDetails[265631] = { questID = 90867, questName = "From Darkness, Light" }

	Gallery.ItemDetails[280050] = {questID = 95533, questName = "The Aqir Swarm" } 

end

do--Silverpine Forest"] = {
	Gallery.ItemDetails[245504] = { questID = 27098, questName = "Lordaeron" }
	Gallery.ItemDetails[245505] = { questID = 27098, questName = "Lordaeron" }	
	Gallery.ItemDetails[257412] = { questID = 27550, questName = "Pyrewood's Fall" }
end

do--Spires of Arak"] = {
	Gallery.ItemDetails[258748] = { questID = 35273, questName = "Hot Seat" }
	Gallery.ItemDetails[258741] = { questID = 35671, questName = "A Gathering of Shadows" }
	Gallery.ItemDetails[258745] = { questID = 35704, questName = "When All Is Aligned" }
	Gallery.ItemDetails[258749] = { questID = 35896, questName = "The Avatar of Terokk" }
end

do--Stormheim"] = {
	Gallery.ItemDetails[245411] = { questID = 38882, questName = "A New Life for Undeath" }
	Gallery.ItemDetails[253251] = { questID = 39801, questName = "The Splintered Fleet" }
end

do--Stormsong Valley"] = {
	Gallery.ItemDetails[252655] = { questID = 50611, questName = "Storm's Vengeance" }
	Gallery.ItemDetails[252395] = { questID = 51401, questName = "Carry On" }
	Gallery.ItemDetails[245473] = { questID = 51986, questName = "Return to Zuldazar"}		
	Gallery.ItemDetails[245984] = { questID = 50783, questName = "The Abyssal Council"}
	Gallery.ItemDetails[245469] = { questID = 52122, questName = "To Be Forsaken"}
end

do--Stormwind City"] = {
	Gallery.ItemDetails[248662] = { questID = 543, questName = "The Perenolde Tiara" }
	Gallery.ItemDetails[248336] = { questID = 59583, questName = "Welcome to Stormwind"}
end

do--Suramar"] = {
	Gallery.ItemDetails[247914] = { questID = 44052, questName = "And They Will Tremble" }
	Gallery.ItemDetails[247917] = { questID = 41915, questName = "The Master's Legacy" }
	Gallery.ItemDetails[245558] = { questID = 44955, questName = "Visitor in Shal'Aran" }	
	Gallery.ItemDetails[245701] = { questID = 40321, questName = "Feathersong's Redemption" }
	Gallery.ItemDetails[248009] = { questID = 42489, questName = "Thalyssra's Drawers" }
	Gallery.ItemDetails[247842] = { questID = 44756, questName = "Sign of the Dusk Lily" }
	Gallery.ItemDetails[247911] = { questID = 43318, questName = "Ly'leth's Champion"}
end

do--Talador"] = {
	Gallery.ItemDetails[258742] = { questID = 33582, questName = "Kura's Vengeance" }
	Gallery.ItemDetails[251640] = { questID = 34099, questName = "The Battle for Shattrath" }
	Gallery.ItemDetails[251653] = { questID = 35685, questName = "Socrethar's Demise" }	
	Gallery.ItemDetails[251547] = { questID = 36685, questName = "Assault on the Heart of Shattrath"}
	Gallery.ItemDetails[241043] = { questID = 38201, questName = "Missive: Assault on Shattrath Harbor"}
end

do--Thaldraszus"] = {
	Gallery.ItemDetails[256429] = { questID = 70745, questName = "Enforced Relaxation" }
	Gallery.ItemDetails[248651] = { questID = 72935, questName = "Archives Return" }
end

do--The Azure Span"] = {
	Gallery.ItemDetails[250912] = { questID = 76597, questName = "On New Wings" }
	Gallery.ItemDetails[246706] = { questID = 67047, questName = "Warm Away These Shivers" }
	Gallery.ItemDetails[248653] = { questID = 71097, questName = "A Helping Claw" }
end

do--The Coiled Isle"] = {
	Gallery.ItemDetails[271851] = {questID = 95564, questName = "The Serpent's Tail" }
	Gallery.ItemDetails[271176] = {questID = 93339, questName = "Trinket Trading" }
	Gallery.ItemDetails[279285] = {questID = 92933, questName = "Haunted Shore" }
	Gallery.ItemDetails[279292] = {questID = 93420, questName = "Lor'themar's Judgement" }
	Gallery.ItemDetails[279452] = {questID = 92930, questName = "Written by the Victors" }
	Gallery.ItemDetails[279508] = {questID = 93418, questName = "The Venomous Abyss" }
	Gallery.ItemDetails[280218] = {questID = 96099, questName = "La'una's Fate" }
	Gallery.ItemDetails[271609] = {questID = 96458, questName = "Last Promise"}
end

do--The Forbidden Reach"] = {
	Gallery.ItemDetails[249549] = { questID = 72515, questName = "Augmenting a Dragon" }
end

do--The Great Sea"] = {
	Gallery.ItemDetails[245470] = { questID = 52978, questName = "With Prince in Tow" }
end

do--The Jade Forest"] = {
	Gallery.ItemDetails[264362] = { questID = 30000, questName = "The Jade Serpent" }
	Gallery.ItemDetails[247729] = { questID = 31230, questName = "Welcome to Dawn's Blossom"}
end

do--The Ringing Deeps"] = {
	Gallery.ItemDetails[258264] = { questID = 78642, questName = "New Candle, New Hope" }
	Gallery.ItemDetails[253020] = { questID = 78761, questName = "Into the Machine" }
	Gallery.ItemDetails[258262] = { questID = 79510, questName = "The Wickless Candle" }
	Gallery.ItemDetails[258265] = { questID = 80516, questName = "Bump off the Boss" }
	Gallery.ItemDetails[253040] = { questID = 82144, questName = "On the Road" }
	Gallery.ItemDetails[253172] = { questID = 83160, questName = "Cinderbrew Reserve" }
end

do--The Waking Shores"] = {
	Gallery.ItemDetails[246863] = { questID = 66001, questName = "A Last Hope"}
	Gallery.ItemDetails[247223] = { questID = 67063, questName = "10,000 Years of Roasting"}
end

do--Tiragarde Sound"] = {
	Gallery.ItemDetails[252754] = { questID = 55045, questName = "My Brother's Keeper" }
	Gallery.ItemDetails[252400] = { questID = 53887, questName = "War Marches On"}
	Gallery.ItemDetails[245465] = { questID = 51984, questName = "Return to Zuldazar" }
	Gallery.ItemDetails[252406] = { questID = 47489, questName = "Stow and Go"}
	Gallery.ItemDetails[252403] = { questID = 53720, questName = "Allegiance of Kul Tiras"}
	Gallery.ItemDetails[252392] = { questID = 48089, questName = "Mountain Sounds" }
	Gallery.ItemDetails[252386] = { questID = 50972, questName = "Proudmoore's Parley" }
	Gallery.ItemDetails[246701] = { questID = 54992, questName = "The Start of Something Bigger", }
	Gallery.ItemDetails[245466] = { questID = 51601, questName = "The Bridgeport Ride" }
end

do--Twilight Highlands"] = {
	Gallery.ItemDetails[246427] = { questID = 28244, questName = "Eye Spy" }
	Gallery.ItemDetails[246428] = { questID = 28655, questName = "Wild, Wild, Wildhammer Wedding" }
end

do--Undermine"] = {
	Gallery.ItemDetails[245310] = { questID = 83176, questName = "Just a Hunch"}
	Gallery.ItemDetails[260700] = { questID = 84675, questName = "Showdown in the Attic" }
	Gallery.ItemDetails[245325] = { questID = 85711, questName = "Unsolicited Feedback"}
	Gallery.ItemDetails[245303] = { questID = 85780, questName = "Right Where We Want Him"}
	Gallery.ItemDetails[245306] = { questID = 86408, questName = "My Hole in the Wall" }
	Gallery.ItemDetails[245308] = { questID = 87008, questName = "Ad-Hoc Wedding Planner" }
	Gallery.ItemDetails[243321] = { questID = 87297, questName = "Cashing the Check" }
end

do--Val'sharah"] = {
	Gallery.ItemDetails[245702] = { questID = 38147, questName = "Entangled Dreams" }
	Gallery.ItemDetails[245700] = { questID = 38663, questName = "The Die is Cast"}
	Gallery.ItemDetails[245615] = { questID = 39117, questName = "Shriek No More" }
	Gallery.ItemDetails[245698] = { questID = 40573, questName = "The Nightmare Lord" }
	Gallery.ItemDetails[245739] = { questID = 40890, questName = "The Tears of Elune"}
	Gallery.ItemDetails[245258] = { questID = 42751, questName = "Moon Reaver" }
	Gallery.ItemDetails[245616] = { questID = 46107, questName = "Source of the Corruption"}
end

do--Valdrakken"] = {
	Gallery.ItemDetails[248655] = { questID = 70880, questName = "To Cook With Finery" }
end

do--Valley of the Four Winds"] = {
	Gallery.ItemDetails[248663] = { questID = 30526, questName = "Lost and Lonely" }
end

do--Voidstorm"] = {
	Gallery.ItemDetails[262351] = { questID = 86513, questName = "Face the Tide" }
	Gallery.ItemDetails[267209] = { questID = 86541, questName = "Just In Case..." }
	Gallery.ItemDetails[264660] = { questID = 88706, questName = "Nothing Stands Forever" }
	Gallery.ItemDetails[262606] = { questID = 86521, questName = "Nexus-Point Xenas: Eclipse" }
	Gallery.ItemDetails[262610] = { questID = 88700, questName = "Two Tons of Metal and Holy Fire" }
	Gallery.ItemDetails[267082] = { questID = 86516, questName = "All Become Prey" }

	Gallery.ItemDetails[264508] = { questID = 86557, questName = "A Matter of Strife and Death"}
	Gallery.ItemDetails[262472] = { questID = 86561, questName = "A Strange, Different World" }
	Gallery.ItemDetails[264657] = { questID = 86530, questName = "First, The Shells" }
	Gallery.ItemDetails[264659] = { questID = 86512, questName = "The Harvest" }
	Gallery.ItemDetails[264340] = { questID = 86540, questName = "Third, Blow It Up" }
	Gallery.ItemDetails[263240] = { questID = 86531, questName = "Work Disruption" }
end

do--Vol'dun"] = {
	Gallery.ItemDetails[245417] = { questID = 47874, questName = "Clearing the Fog"}
	Gallery.ItemDetails[245263] = { questID = 48554, questName = "The Source of the Problem" }
	Gallery.ItemDetails[283343] = { questID = 51364, questName = "An Explosive Exit" }
	Gallery.ItemDetails[283269] = { questID = 49676, questName = "Dressed for Battle" }
end

do--Westfall"] = {
	Gallery.ItemDetails[248797] = { questID = 26229, questName = "\"I TAKE Candle!\""}
	Gallery.ItemDetails[248618] = { questID = 26270, questName = "You Have Our Thanks" }
	Gallery.ItemDetails[248801] = { questID = 26297, questName = "The Dawning of a New Day"}
end

do--Zul'Aman"] = {
	Gallery.ItemDetails[256928] = { questID = 91087, questName = "Reports Returned" }
	Gallery.ItemDetails[264479] = { questID = 86681, questName = "Den of Nalorakk: A Taste of Vengeance"}
	Gallery.ItemDetails[253469] = { questID = 86660, questName = "Rescue from the Shadows" }
	Gallery.ItemDetails[255648] = { questID = 86693, questName = "De Legend of de Hash'ey"}
	Gallery.ItemDetails[264715] = { questID = 86663, questName = "Embers to a Flame" }
	Gallery.ItemDetails[278691] = {questID = 94531, questName = "Like Mother, Like Son" }
	Gallery.ItemDetails[264255] = { questID = 86654, questName = "Gnarldin Bashing" }

	Gallery.ItemDetails[279067] = {questID = 95200, questName = "An Offering For Halazzi" } 
Gallery.ItemDetails[264718] = {questID = 95203, questName = "The Ties That Bind" }
end

do--Zuldazar"] = {
	Gallery.ItemDetails[239606] = { questID = 46931, questName = "Speaker of the Horde"}
	Gallery.ItemDetails[245486] = { questID = 47432, questName = "The Bargain is Struck"}
	Gallery.ItemDetails[245493] = { questID = 47741, questName = "To Sacrifice a Loa"}
	Gallery.ItemDetails[245485] = { questID = 50963, questName = "Of Dark Deeds and Dark Days" }
end

if (select(4, GetBuildInfo()) or 0) >= 120107 then
Gallery.ItemDetails[281399] = { questID = 95305,  questName = "Synthesis Scrap"} -- Ancient Uldaman Tome
Gallery.ItemDetails[281401] = { questID = 95307,  questName = "Worldcore Revealed"} -- Broken Uldaman Statue

end



-------------------------------------------------
-- Vendor Related
-------------------------------------------------
do --rank 10 weekly house quest
	Gallery.ItemDetails[253397] = { questID = 98406, questName = "A Curated Gift"} -- Revered Deepstone Table
	Gallery.ItemDetails[245539] = { questID = 98406, questName = "A Curated Gift"} -- Elegant Enchanted Vanity
Gallery.ItemDetails[253481] = { questID = 98406, questName = "A Curated Gift"} -- Masterful Sin'dorei Gravestone
	Gallery.ItemDetails[249923] = { questID = 98406, questName = "A Curated Gift"} -- Sin'dorei Golden Welcome
	Gallery.ItemDetails[254561] = { questID = 98406, questName = "A Curated Gift"} -- Ogre Champion's Prized Skull
	Gallery.ItemDetails[246958] = { questID = 98406, questName = "A Curated Gift"} -- Mastercrafted Fungal Row Planter
end

do -- Cursed Keepsake & Curated Gift Individual Mappings
	Gallery.ItemDetails[256684] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Troll Amulet
	Gallery.ItemDetails[278701] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Goblin Cup
	Gallery.ItemDetails[267355] = { questID = 98204, questName = "Cursed Keepsake" } -- Purified Elven Mirror
	Gallery.ItemDetails[267435] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Kaldorei Candle
	Gallery.ItemDetails[252042] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Troll Pitcher
	Gallery.ItemDetails[263876] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Folk Mirror
	Gallery.ItemDetails[253703] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Crude Hammer
	Gallery.ItemDetails[255712] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Ancient Urn
	Gallery.ItemDetails[245991] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Sindorei Candle
	Gallery.ItemDetails[245993] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Floating Lantern
	Gallery.ItemDetails[255652] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Troll Loop
	Gallery.ItemDetails[267205] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Folk Candle
	Gallery.ItemDetails[268943] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Elven Glowlamp
	Gallery.ItemDetails[272129] = { questID = 98204, questName = "Cursed Keepsake" } -- Purified Tauren Pot
	Gallery.ItemDetails[253396] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Crude Axe
	Gallery.ItemDetails[272142] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Earthen Pot
	Gallery.ItemDetails[256361] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Troll Pendant
	Gallery.ItemDetails[258540] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Troll Ring
	Gallery.ItemDetails[278696] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Dracthyr Stein
	Gallery.ItemDetails[244347] = { questID = 98204, questName = "Cursed Keepsake" }-- Purified Troll Urn
end
end

-------------------------------------------------
-- Professions
-------------------------------------------------

do --Profession Stuff

do --Cooking 11 , source = "Cooking"
-- Profession: Pandaria Cooking (60)
Gallery.ItemDetails[247220] = { professionText = "Pandaria Cooking (60)",  recipeName = "Mushan Dumpling Stack", source = "Cooking"}
-- Profession: Draenor Cooking (80)
Gallery.ItemDetails[245428] = { professionText = "Draenor Cooking (80)",  recipeName = "Hungry Human's Platter", source = "Cooking"}
-- Profession: Battle for Azeroth Cooking (140)
Gallery.ItemDetails[245484] = { professionText = "Battle for Azeroth Cooking (140)",  recipeName = "Boralus-Style Lobster Platter", source = "Cooking"}
-- Profession: Shadowlands Cooking (60)
Gallery.ItemDetails[246705] = { professionText = "Shadowlands Cooking (60)",  recipeName = "Caramel Mint Noodle Dish", source = "Cooking"}
-- Profession: Dragon Isles Cooking (80)
Gallery.ItemDetails[247222] = { professionText = "Dragon Isles Cooking (80)",  recipeName = "Drake Kebab Platter", source = "Cooking"}
Gallery.ItemDetails[247224] = { professionText = "Dragon Isles Cooking (80)",  recipeName = "Valdrakken Blossomfruit Platter", source = "Cooking"}
Gallery.ItemDetails[247225] = { professionText = "Dragon Isles Cooking (80)",  recipeName = "Bruffalon Rib Platter", source = "Cooking"}
-- Profession: Khaz Algar Cooking (80)
Gallery.ItemDetails[239170] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Dornic Mine and Cheese Platter", source = "Cooking"}
Gallery.ItemDetails[245326] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Kaheti Predator's Assortment", source = "Cooking"}
Gallery.ItemDetails[246708] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Dornic Sliced Mineloaf", source = "Cooking"}
Gallery.ItemDetails[246709] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Earthen Hospitality Cheese-Like Brick", source = "Cooking"}
end

do --Tinkering 6
-- Profession: Junkyard Tinkering , source = "Junkyard Tinkering"
Gallery.ItemDetails[246482] = { professionText = "Junkyard Tinkering",  recipeName = "Mechanical Gnomish Lamppost", source = "Junkyard Tinkering"}
Gallery.ItemDetails[246485] = { professionText = "Junkyard Tinkering",  recipeName = "Mechagnome Sustenance Distributor", source = "Junkyard Tinkering"}
Gallery.ItemDetails[246595] = { professionText = "Junkyard Tinkering",  recipeName = "Gnomish Fencepost", source = "Junkyard Tinkering"}
Gallery.ItemDetails[246596] = { professionText = "Junkyard Tinkering",  recipeName = "Gnomish Fence", source = "Junkyard Tinkering"}
Gallery.ItemDetails[246597] = { professionText = "Junkyard Tinkering",  recipeName = "Perpetual Motion Crate", source = "Junkyard Tinkering"}
Gallery.ItemDetails[246606] = { professionText = "Junkyard Tinkering",  recipeName = "Mechagon Armory Rack", source = "Junkyard Tinkering"}
end

do --Jewelcrafting 32 , source = "Jewelcrafting"
-- Profession: Classic Jewelcrafting (240) , source = ""
Gallery.ItemDetails[246413] = { professionText = "Classic Jewelcrafting (240)",  recipeName = "Blackrock Lamppost", source = "Jewelcrafting"}
Gallery.ItemDetails[246488] = { professionText = "Classic Jewelcrafting (240)",  recipeName = "Ironforge Chandelier", source = "Jewelcrafting"}
-- Profession: Outland Jewelcrafting (60)
Gallery.ItemDetails[258200] = { professionText = "Outland Jewelcrafting (60)",  recipeName = "Shattrath Sconce", source = "Jewelcrafting"}
Gallery.ItemDetails[258201] = { professionText = "Outland Jewelcrafting (60)",  recipeName = "Shattrath Lamppost", source = "Jewelcrafting"}
Gallery.ItemDetails[262347] = { professionText = "Outland Jewelcrafting (60)",  recipeName = "Draenei Crystal Chandelier", source = "Jewelcrafting"}
-- Profession: Northrend Jewelcrafting (60)
Gallery.ItemDetails[258208] = { professionText = "Northrend Jewelcrafting (60)",  recipeName = "Kirin Tor Sun Chandelier", source = "Jewelcrafting"}
Gallery.ItemDetails[258211] = { professionText = "Northrend Jewelcrafting (60)",  recipeName = "Kirin Tor Glass Table", source = "Jewelcrafting"}
-- Profession: Cataclysm Jewelcrafting (60)
Gallery.ItemDetails[249143] = { professionText = "Cataclysm Jewelcrafting (60)",  recipeName = "Smoke Sconce", source = "Jewelcrafting"}
Gallery.ItemDetails[257406] = { professionText = "Cataclysm Jewelcrafting (60)",  recipeName = "Smoke Lamp", source = "Jewelcrafting"}
-- Profession: Pandaria Jewelcrafting (60)
Gallery.ItemDetails[245509] = { professionText = "Pandaria Jewelcrafting (60)",  recipeName = "Pandaren Stone Wall", source = "Jewelcrafting"}
Gallery.ItemDetails[247728] = { professionText = "Pandaria Jewelcrafting (60)",  recipeName = "Pandaren Stone Post", source = "Jewelcrafting"}
Gallery.ItemDetails[247736] = { professionText = "Pandaria Jewelcrafting (60)",  recipeName = "Jade Temple Dragon Fountain", source = "Jewelcrafting"}
-- Profession: Draenor Jewelcrafting (80)
Gallery.ItemDetails[251495] = { professionText = "Draenor Jewelcrafting (80)",  recipeName = "Draenic Basin", source = "Jewelcrafting"}
Gallery.ItemDetails[251550] = { professionText = "Draenor Jewelcrafting (80)",  recipeName = "Draenethyst Sconce", source = "Jewelcrafting"}
-- Profession: Legion Jewelcrafting (80)
Gallery.ItemDetails[245557] = { professionText = "Legion Jewelcrafting (80)",  recipeName = "Shaded Suramar Window", source = "Jewelcrafting"}
Gallery.ItemDetails[258227] = { professionText = "Legion Jewelcrafting (80)",  recipeName = "Suramar Jeweler's Assortment", source = "Jewelcrafting"}
Gallery.ItemDetails[282126] = { professionText = "Legion Jewelcrafting (85)", recipeName = "Hanging Argunite Lamp", source = "Jewelcrafting"}

-- Profession: Battle for Azeroth Jewelcrafting (140)
Gallery.ItemDetails[245414] = { professionText = "Battle for Azeroth Jewelcrafting (140)",  recipeName = "Zandalari Skullfire Lamp", source = "Jewelcrafting"}
Gallery.ItemDetails[245496] = { professionText = "Battle for Azeroth Jewelcrafting (140)",  recipeName = "Small Mask of Bwonsamdi, Loa of Graves", source = "Jewelcrafting"}
-- Profession: Shadowlands Jewelcrafting (80)
Gallery.ItemDetails[260699] = { professionText = "Shadowlands Jewelcrafting (80)",  recipeName = "Maldraxxian Runic Tablet", source = "Jewelcrafting"}
Gallery.ItemDetails[262663] = { professionText = "Shadowlands Jewelcrafting (80)",  recipeName = "Kyrian Floating Lamp", source = "Jewelcrafting"}
-- Profession: Dragon Isles Jewelcrafting (80)
Gallery.ItemDetails[248109] = { professionText = "Dragon Isles Jewelcrafting (80)",  recipeName = "Valdrakken Fence", source = "Jewelcrafting"}
Gallery.ItemDetails[248110] = { professionText = "Dragon Isles Jewelcrafting (80)",  recipeName = "Valdrakken Fencepost", source = "Jewelcrafting"}
Gallery.ItemDetails[248654] = { professionText = "Dragon Isles Jewelcrafting (80)",  recipeName = "Valdrakken Gilded Throne", source = "Jewelcrafting"}
-- Profession: Khaz Algar Jewelcrafting (80)
Gallery.ItemDetails[245559] = { professionText = "Khaz Algar Jewelcrafting (80)",  recipeName = "Octagonal Ochre Window", source = "Jewelcrafting"}
Gallery.ItemDetails[253253] = { professionText = "Khaz Algar Jewelcrafting (80)",  recipeName = "Gundargaz Candelabra", source = "Jewelcrafting"}
-- Profession: Midnight Jewelcrafting (50)
Gallery.ItemDetails[248965] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Resplendent Highborne Statue", source = "Jewelcrafting"}
Gallery.ItemDetails[262454] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Shining Sin'dorei Hourglass", source = "Jewelcrafting"}
Gallery.ItemDetails[262471] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Bejeweled Sin'dorei Lyre", source = "Jewelcrafting"}
Gallery.ItemDetails[262613] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Replica Haranir Mural", source = "Jewelcrafting"}
-- Profession: Midnight Jewelcrafting (80)
Gallery.ItemDetails[262461] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Tenebrous Ren'dorei Armillary", source = "Jewelcrafting"}
Gallery.ItemDetails[262469] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Brilliant Phoenix Harp", source = "Jewelcrafting"}
Gallery.ItemDetails[279356] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Opalescent Amani Peridot", source = "Jewelcrafting"}
Gallery.ItemDetails[279343] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Piercing Amani Lapis", source = "Jewelcrafting"}
Gallery.ItemDetails[280762] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Roaring Amani Garnet", source = "Jewelcrafting"}
end

do --Inscription 79  , source = "Inscription"
-- Profession: Classic Inscription (240)
Gallery.ItemDetails[245502] = { professionText = "Classic Inscription (240)",  recipeName = "Brill Coffin", source = "Inscription"}
Gallery.ItemDetails[245503] = { professionText = "Classic Inscription (240)",  recipeName = "Brill Coffin Lid", source = "Inscription"}
Gallery.ItemDetails[246420] = { professionText = "Classic Inscription (240)",  recipeName = "Kharanos Bookcase", source = "Inscription"}
Gallery.ItemDetails[246423] = { professionText = "Classic Inscription (240)",  recipeName = "Wooden Ironforge Table", source = "Inscription"}
Gallery.ItemDetails[258289] = { professionText = "Classic Inscription (240)",  recipeName = "Thunder Bluff Totem", source = "Inscription"}
-- Profession: Outland Inscription (60)
Gallery.ItemDetails[258192] = { professionText = "Outland Inscription (60)",  recipeName = "Talon King's Totem", source = "Inscription"}
Gallery.ItemDetails[258197] = { professionText = "Outland Inscription (60)",  recipeName = "Crystal Signpost", source = "Inscription"}
Gallery.ItemDetails[258198] = { professionText = "Outland Inscription (60)",  recipeName = "Gilded Draenei Round Table", source = "Inscription"}
Gallery.ItemDetails[258199] = { professionText = "Outland Inscription (60)",  recipeName = "Aldor Bookcase", source = "Inscription"}
Gallery.ItemDetails[258215] = { professionText = "Outland Inscription (60)",  recipeName = "Halaa Bench", source = "Inscription"}
-- Profession: Northrend Inscription (60)
Gallery.ItemDetails[258203] = { professionText = "Northrend Inscription (60)",  recipeName = "Silver Dalaran Bench", source = "Inscription"}
Gallery.ItemDetails[258204] = { professionText = "Northrend Inscription (60)",  recipeName = "Dalaran Post", source = "Inscription"}
Gallery.ItemDetails[258207] = { professionText = "Northrend Inscription (60)",  recipeName = "Dalaran Scholar's Bookcase", source = "Inscription"}
Gallery.ItemDetails[258209] = { professionText = "Northrend Inscription (60)",  recipeName = "Kirin Tor Crate", source = "Inscription"}
Gallery.ItemDetails[258210] = { professionText = "Northrend Inscription (60)",  recipeName = "Dalaran Street Sign", source = "Inscription"}
-- Profession: Cataclysm Inscription (60)
Gallery.ItemDetails[245621] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Wooden Table", source = "Inscription"}
Gallery.ItemDetails[245622] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Wall Shelf", source = "Inscription"}
Gallery.ItemDetails[245623] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Rocking Chair", source = "Inscription"}
Gallery.ItemDetails[257695] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Postbox", source = "Inscription"}
Gallery.ItemDetails[257696] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Map", source = "Inscription"}
-- Profession: Pandaria Inscription (60)
Gallery.ItemDetails[245513] = { professionText = "Pandaria Inscription (60)",  recipeName = "Square Pandaren Table", source = "Inscription"}
Gallery.ItemDetails[245514] = { professionText = "Pandaria Inscription (60)",  recipeName = "Pandaren Wooden Table", source = "Inscription"}
Gallery.ItemDetails[247669] = { professionText = "Pandaria Inscription (60)",  recipeName = "Lorewalker's Bookcase", source = "Inscription"}
Gallery.ItemDetails[247731] = { professionText = "Pandaria Inscription (60)",  recipeName = "Hanging Paper Lanterns", source = "Inscription"}
Gallery.ItemDetails[247735] = { professionText = "Pandaria Inscription (60)",  recipeName = "Lucky Traveler's Bench", source = "Inscription"}
-- Profession: Draenor Inscription
Gallery.ItemDetails[244317] = { professionText = "Draenor Inscription",  recipeName = "Orcish Banded Barrel", source = "Inscription"}
-- Profession: Draenor Inscription (80)
Gallery.ItemDetails[244313] = { professionText = "Draenor Inscription (80)",  recipeName = "Orcish Fence", source = "Inscription"}
Gallery.ItemDetails[244319] = { professionText = "Draenor Inscription (80)",  recipeName = "Wooden Shipping Crate", source = "Inscription"}
Gallery.ItemDetails[245441] = { professionText = "Draenor Inscription (80)",  recipeName = "Orcish Fencepost", source = "Inscription"}
Gallery.ItemDetails[245534] = { professionText = "Draenor Inscription (80)",  recipeName = "Frostwall Elevated Brazier", source = "Inscription"}
-- Profession: Legion Inscription (80)
Gallery.ItemDetails[245396] = { professionText = "Legion Inscription (80)",  recipeName = "Suramar Dresser", source = "Inscription"}
Gallery.ItemDetails[245459] = { professionText = "Legion Inscription (80)",  recipeName = "Tauren Storage Chest", source = "Inscription"}
Gallery.ItemDetails[247916] = { professionText = "Legion Inscription (80)",  recipeName = "Covered Square Suramar Table", source = "Inscription"}
Gallery.ItemDetails[247918] = { professionText = "Legion Inscription (80)",  recipeName = "Nightborne Jeweler's Table", source = "Inscription"}
Gallery.ItemDetails[247925] = { professionText = "Legion Inscription (80)",  recipeName = "Suramar Storage Crate", source = "Inscription"}
Gallery.ItemDetails[258224] = { professionText = "Legion Inscription (80)",  recipeName = "Dalaran Display Shelves", source = "Inscription"}
-- Profession: Battle for Azeroth Inscription (140)
Gallery.ItemDetails[245415] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Zuldazar Fence", source = "Inscription" }
Gallery.ItemDetails[245416] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Zuldazar Fencepost", source = "Inscription" }
Gallery.ItemDetails[245499] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Gilded Zandalari Table", source = "Inscription"}
Gallery.ItemDetails[252035] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Boralus Barrel", source = "Inscription"}
Gallery.ItemDetails[252389] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Proudmoore Shipping Crate", source = "Inscription"}
Gallery.ItemDetails[252401] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Boralus Bookshelf", source = "Inscription"}
-- Profession: Shadowlands Inscription (80)
Gallery.ItemDetails[258235] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Aspiring Soul's Chair", source = "Inscription"}
Gallery.ItemDetails[258239] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Tome of Maldraxxian Rituals", source = "Inscription"}
Gallery.ItemDetails[258242] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Hollow Night Fae Shrine", source = "Inscription"}
Gallery.ItemDetails[258244] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Broker's Hex Table", source = "Inscription"}
Gallery.ItemDetails[258245] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Ardenweald Hanging Baskets", source = "Inscription"}
Gallery.ItemDetails[258247] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Large Revendreth Storage Crate", source = "Inscription"}
Gallery.ItemDetails[258250] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Cartel Ta Bookcase", source = "Inscription"}
-- Profession: Dragon Isles Inscription (80)
Gallery.ItemDetails[248106] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Valdrakken Banded Barrel", source = "Inscription"}
Gallery.ItemDetails[248107] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Valdrakken Storage Crate", source = "Inscription"}
Gallery.ItemDetails[248108] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Long Valdrakken Storage Crate", source = "Inscription"}
Gallery.ItemDetails[248118] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Literature of the Blue Dragonflight", source = "Inscription"}
Gallery.ItemDetails[248119] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Literature of the Green Dragonflight", source = "Inscription"}
Gallery.ItemDetails[248120] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Literature of the Red Dragonflight", source = "Inscription"}
Gallery.ItemDetails[264679] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Valdrakken Wall Shelf", source = "Inscription"}
-- Profession: Khaz Algar Inscription (80)
Gallery.ItemDetails[253022] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Dornogal Bookcase", source = "Inscription"}
Gallery.ItemDetails[253036] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Freywold Table", source = "Inscription"}
Gallery.ItemDetails[253164] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Algari Fence", source = "Inscription"}
Gallery.ItemDetails[253165] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Algari Fencepost", source = "Inscription"}
Gallery.ItemDetails[253167] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Forgeground Market Bins", source = "Inscription"}
Gallery.ItemDetails[253169] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Meadery Storage Chest", source = "Inscription"}
-- Profession: Midnight Inscription (50)
Gallery.ItemDetails[253508] = { professionText = "Midnight Inscription (50)",  recipeName = "Harandar Signpost", source = "Inscription"}
Gallery.ItemDetails[262464] = { professionText = "Midnight Inscription (50)",  recipeName = "Floating Void-Touched Tome", source = "Inscription"}
Gallery.ItemDetails[262594] = { professionText = "Midnight Inscription (50)",  recipeName = "Homely Sin'dorei Shelf", source = "Inscription"}
Gallery.ItemDetails[262595] = { professionText = "Midnight Inscription (50)",  recipeName = "Homely Wall Shelves", source = "Inscription"}
Gallery.ItemDetails[262597] = { professionText = "Midnight Inscription (50)",  recipeName = "Gilded Eversong Book", source = "Inscription"}
Gallery.ItemDetails[262598] = { professionText = "Midnight Inscription (50)",  recipeName = "Opened Sin'dorei Scroll", source = "Inscription"}
Gallery.ItemDetails[262601] = { professionText = "Midnight Inscription (50)",  recipeName = "Wild Hanging Scroll", source = "Inscription"}
Gallery.ItemDetails[262612] = { professionText = "Midnight Inscription (50)",  recipeName = "Sturdy Ren'dorei Cask", source = "Inscription"}
Gallery.ItemDetails[262615] = { professionText = "Midnight Inscription (50)",  recipeName = "Sin'dorei Phoenix Quill", source = "Inscription"}
Gallery.ItemDetails[262616] = { professionText = "Midnight Inscription (50)", sourceAction = "Forgotten Ink and Quill", treasureName = "Forgotten Ink and Quill", source = "Inscription" }
Gallery.ItemDetails[262790] = { professionText = "Midnight Inscription (50)",  recipeName = "Restful Bronze Bench", source = "Inscription"}
Gallery.ItemDetails[263034] = { professionText = "Midnight Inscription (50)",  recipeName = "Magnificent Towering Bookcase", source = "Inscription"}
Gallery.ItemDetails[280752] = { professionText = "Midnight Inscription (50)",  recipeName = "Cursed Gaze of Ula'tek Mural", source = "Inscription"}
Gallery.ItemDetails[280757] = { professionText = "Midnight Inscription (50)",  recipeName = "Chiseled Amani Tablet", source = "Inscription"}
end

do--Inscription , source = "Inscription"
Gallery.ItemDetails[283321] = { professionText = "Battle for Azeroth Inscription (140)", recipeName = "Closed Vulpera Scroll", source = "Inscription"}
Gallery.ItemDetails[283301] = { professionText = "Shadowlands Inscription (80)", recipeName = "Fae Moonbough Scroll", source = "Inscription"}
Gallery.ItemDetails[284504] = { professionText = "Shadowlands Inscription (80)", recipeName = "Levitating Lich Library", source = "Inscription"}
Gallery.ItemDetails[282132] = { professionText = "Legion Inscription (85)", recipeName = "Eredath Artisan's Workbench", source = "Inscription"}
Gallery.ItemDetails[282190] = { professionText = "Midnight Inscription (50)", recipeName = "Apple Bobbing Bucket", source = "Inscription"}
end

do --Engineering  34 , source = "Engineering"
-- Profession: Classic Engineering (240)
Gallery.ItemDetails[246410] = { professionText = "Classic Engineering (240)",  recipeName = "Dark Iron Table Saw", source = "Engineering"}
Gallery.ItemDetails[246700] = { professionText = "Classic Engineering (240)",  recipeName = "Gnomish Steam-Powered Bed", source = "Engineering"}
-- Profession: Outland Engineering (60)
Gallery.ItemDetails[258193] = { professionText = "Outland Engineering (60)",  recipeName = "Draenei Holo-Projector Pedestal", source = "Engineering"}
Gallery.ItemDetails[258194] = { professionText = "Outland Engineering (60)",  recipeName = "Tempest Keep Cryo-Pod", source = "Engineering"}
Gallery.ItemDetails[258196] = { professionText = "Outland Engineering (60)",  recipeName = "Draenei Transmitter", source = "Engineering"}
-- Profession: Northrend Engineering (60)
Gallery.ItemDetails[264707] = { professionText = "Northrend Engineering (60)",  recipeName = "Resizable All-Purpose Gear", source = "Engineering"}
Gallery.ItemDetails[264708] = { professionText = "Northrend Engineering (60)",  recipeName = "Home Defense Gadget", source = "Engineering"}
Gallery.ItemDetails[264711] = { professionText = "Northrend Engineering (60)",  recipeName = "Joybuzz's Joyful Wall of Trains", source = "Engineering"}
-- Profession: Cataclysm Engineering (60)
Gallery.ItemDetails[245602] = { professionText = "Cataclysm Engineering (60)",  recipeName = "Gilnean Problem Solver", source = "Engineering"}
Gallery.ItemDetails[257689] = { professionText = "Cataclysm Engineering (60)",  recipeName = "Small Gilnean Windmill", source = "Engineering"}
-- Profession: Pandaria Engineering (60)
Gallery.ItemDetails[247733] = { professionText = "Pandaria Engineering (60)",  recipeName = "Halfhill Cookpot", source = "Engineering"}
Gallery.ItemDetails[258216] = { professionText = "Pandaria Engineering (60)",  recipeName = "Reconstructed Mogu Lightning Drill", source = "Engineering"}
-- Profession: Draenor Engineering (80)
Gallery.ItemDetails[244314] = { professionText = "Draenor Engineering (80)",  recipeName = "Frostwall Architect's Table", source = "Engineering"}
Gallery.ItemDetails[251482] = { professionText = "Draenor Engineering (80)",  recipeName = "Draenei Stargazer's Telescope", source = "Engineering"}
-- Profession: Legion Engineering (80)
Gallery.ItemDetails[258225] = { professionText = "Legion Engineering (80)",  recipeName = "Failed Failure Detection Pylon", source = "Engineering"}
Gallery.ItemDetails[258226] = { professionText = "Legion Engineering (80)",  recipeName = "Dalaran Auto-Hammer", source = "Engineering"}
Gallery.ItemDetails[282144] = { professionText = "Legion Engineering (85)", recipeName = "Lightforged Recall Beacon", source = "Engineering"}
-- Profession: Battle for Azeroth Engineering (140)
Gallery.ItemDetails[246486] = { professionText = "Battle for Azeroth Engineering (140)",  recipeName = "Gnomish Tesla Mega-Coil", source = "Engineering"}
Gallery.ItemDetails[246500] = { professionText = "Battle for Azeroth Engineering (140)",  recipeName = "Mechagon Miniature Artificial Sun", source = "Engineering"}
Gallery.ItemDetails[246604] = { professionText = "Battle for Azeroth Engineering (140)",  recipeName = "Deactivated Atomic Recalibrator", source = "Engineering"}
Gallery.ItemDetails[283291] = { professionText = "Battle for Azeroth Engineering (140)", recipeName = "Nomad's Campfire Grill", source = "Engineering"}
-- Profession: Shadowlands Engineering (80)
Gallery.ItemDetails[258240] = { professionText = "Shadowlands Engineering (80)",  recipeName = "Kyrian Anima Barrel", source = "Engineering"}
Gallery.ItemDetails[258252] = { professionText = "Shadowlands Engineering (80)",  recipeName = "Cartel Xy Capture Crate", source = "Engineering"}
-- Profession: Dragon Isles Engineering (80)
Gallery.ItemDetails[248113] = { professionText = "Dragon Isles Engineering (80)",  recipeName = "Thaldraszus Telescope", source = "Engineering"}
Gallery.ItemDetails[258253] = { professionText = "Dragon Isles Engineering (80)",  recipeName = "Titanic Tyrhold Fountain", source = "Engineering"}
-- Profession: Khaz Algar Engineering (80)
Gallery.ItemDetails[246066] = { professionText = "Khaz Algar Engineering (80)",  recipeName = "Schmancy Goblin String Lights", source = "Engineering"}
Gallery.ItemDetails[253252] = { professionText = "Khaz Algar Engineering (80)",  recipeName = "Replica Rumbling Wastes Drill Pod", source = "Engineering"}
-- Profession: Midnight Engineering
Gallery.ItemDetails[246460] = { professionText = "Midnight Engineering",  recipeName = "Ambient Aethercharged Crystal", source = "Engineering"}
Gallery.ItemDetails[262465] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Stargazer", source = "Engineering"}
Gallery.ItemDetails[262602] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Warp Orb", source = "Engineering"}
Gallery.ItemDetails[262617] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Crafting Framework", source = "Engineering"}
Gallery.ItemDetails[262618] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Void Projector", source = "Engineering"}
Gallery.ItemDetails[262789] = { professionText = "Midnight Engineering",  recipeName = "Small Telogrus Lamp", source = "Engineering"}
Gallery.ItemDetails[263049] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Lightpost", source = "Engineering"}
Gallery.ItemDetails[279337] = { professionText = "Midnight Engineering",  recipeName = "Coiled Amani Hookshot", source = "Engineering"}
Gallery.ItemDetails[279339] = { professionText = "Midnight Engineering",  recipeName = "Proudmoore Ship-in-a-Bottle", source = "Engineering"}
Gallery.ItemDetails[279341] = { professionText = "Midnight Engineering",  recipeName = "Aetherlume Field Lamp", source = "Engineering"}
end

do --Enchanting 39 , source = "Enchanting"
-- Profession: Classic Enchanting (240)
Gallery.ItemDetails[253250] = { professionText = "Classic Enchanting (240)",  recipeName = "Tirisfal Hollow Campfire", source = "Enchanting"}
Gallery.ItemDetails[263027] = { professionText = "Classic Enchanting (240)",  recipeName = "Darkmaster's Mystical Brazier", source = "Enchanting"}
-- Profession: Outland Enchanting (60)
Gallery.ItemDetails[257037] = { professionText = "Outland Enchanting (60)",  recipeName = "Draenei Holo-Dais", source = "Enchanting"}
Gallery.ItemDetails[257038] = { professionText = "Outland Enchanting (60)",  recipeName = "Draenei Holo-Path", source = "Enchanting"}
Gallery.ItemDetails[257093] = { professionText = "Outland Enchanting (60)",  recipeName = "Aldor Stellar Console", source = "Enchanting"}
Gallery.ItemDetails[265331] = { professionText = "Outland Enchanting (60)", recipeName = "Draenei Holo-Junction", source = "Enchanting"}

-- Profession: Northrend Enchanting (60)
Gallery.ItemDetails[257094] = { professionText = "Northrend Enchanting (60)",  recipeName = "Mark of the Mages' Eye", source = "Enchanting"}
Gallery.ItemDetails[257101] = { professionText = "Northrend Enchanting (60)",  recipeName = "Stampwhistle's Postal Portal", source = "Enchanting"}
-- Profession: Cataclysm Enchanting (60)
Gallery.ItemDetails[257095] = { professionText = "Cataclysm Enchanting (60)",  recipeName = "Twilight Fire Canister", source = "Enchanting"}
Gallery.ItemDetails[257404] = { professionText = "Cataclysm Enchanting (60)",  recipeName = "Pyrewood Glass Bottle", source = "Enchanting"}
-- Profession: Pandaria Enchanting (60)
Gallery.ItemDetails[257096] = { professionText = "Pandaria Enchanting (60)",  recipeName = "Pandaren Table Lamp", source = "Enchanting"}
Gallery.ItemDetails[257097] = { professionText = "Pandaria Enchanting (60)",  recipeName = "Intense Mogu Brazier", source = "Enchanting"}
-- Profession: Draenor Enchanting (80)
Gallery.ItemDetails[245601] = { professionText = "Draenor Enchanting (80)",  recipeName = "Ancestral Signal Brazier", source = "Enchanting"}
Gallery.ItemDetails[251655] = { professionText = "Draenor Enchanting (80)",  recipeName = "Draenethyst String Lights", source = "Enchanting"}
-- Profession: Legion Enchanting (80)
Gallery.ItemDetails[247923] = { professionText = "Legion Enchanting (80)",  recipeName = "Suramar Containment Cell", source = "Enchanting"}
Gallery.ItemDetails[256681] = { professionText = "Legion Enchanting (80)",  recipeName = "Nightspire Fountain", source = "Enchanting"}
Gallery.ItemDetails[282140] = { professionText = "Legion Enchanting (85)", recipeName = "Shimmering Lightforged Canister", source = "Enchanting"}

-- Profession: Battle for Azeroth Enchanting (140)
Gallery.ItemDetails[258559] = { professionText = "Battle for Azeroth Enchanting (140)",  recipeName = "Tidesage's Totem", source = "Enchanting"}
Gallery.ItemDetails[258560] = { professionText = "Battle for Azeroth Enchanting (140)",  recipeName = "Drust Enchanter's Rod", source = "Enchanting"}
-- Profession: Shadowlands Enchanting (90)
Gallery.ItemDetails[257098] = { professionText = "Shadowlands Enchanting (90)",  recipeName = "Venthyr Anima Bottle", source = "Enchanting"}
Gallery.ItemDetails[258237] = { professionText = "Shadowlands Enchanting (90)",  recipeName = "Ardenweald Lamppost", source = "Enchanting"}
-- Profession: Dragon Isles Enchanting (80)
Gallery.ItemDetails[256170] = { professionText = "Dragon Isles Enchanting (80)",  recipeName = "Draconic Scribe's Basin", source = "Enchanting"}
Gallery.ItemDetails[256171] = { professionText = "Dragon Isles Enchanting (80)",  recipeName = "Five Flights' Grimoire", source = "Enchanting"}
-- Profession: Khaz Algar Enchanting (80)
Gallery.ItemDetails[253039] = { professionText = "Khaz Algar Enchanting (80)",  recipeName = "Dornogal Hanging Sconce", source = "Enchanting"}
Gallery.ItemDetails[253171] = { professionText = "Khaz Algar Enchanting (80)",  recipeName = "Replica Awakening Machine Stasis Pod", source = "Enchanting"}
-- Profession: Midnight Enchanting (50)
Gallery.ItemDetails[246693] = { professionText = "Midnight Enchanting (50)",  recipeName = "Self-Pouring Thalassian Sunwine", source = "Enchanting"}
Gallery.ItemDetails[262458] = { professionText = "Midnight Enchanting (50)",  recipeName = "Animated Sin'dorei Pick", source = "Enchanting"}
Gallery.ItemDetails[262459] = { professionText = "Midnight Enchanting (50)",  recipeName = "Animated Sin'dorei Hammer", source = "Enchanting"}
Gallery.ItemDetails[262468] = { professionText = "Midnight Enchanting (50)",  recipeName = "Ren'dorei Postal Repository", source = "Enchanting"}
Gallery.ItemDetails[262470] = { professionText = "Midnight Enchanting (50)",  recipeName = "Spellbound Tome of Thalassian Magics", source = "Enchanting"}
Gallery.ItemDetails[262590] = { professionText = "Midnight Enchanting (50)",  recipeName = "Rootflame Campfire", source = "Enchanting"}
Gallery.ItemDetails[268038] = { professionText = "Midnight Enchanting (50)",  recipeName = "Endless Codex of Blooming Light", source = "Enchanting"}
Gallery.ItemDetails[268039] = { professionText = "Midnight Enchanting (50)",  recipeName = "Endless Codex of Nature's Grace", source = "Enchanting"}
Gallery.ItemDetails[268041] = { professionText = "Midnight Enchanting (50)",  recipeName = "Endless Codex of the Voidtouched", source = "Enchanting"}
Gallery.ItemDetails[279332] = { professionText = "Midnight Enchanting (50)",  recipeName = "Keen Hex Mask", source = "Enchanting"}
Gallery.ItemDetails[279362] = { professionText = "Midnight Enchanting (50)",  recipeName = "Furious Tiki Mask", source = "Enchanting"}
Gallery.ItemDetails[279335] = { professionText = "Midnight Enchanting (50)",  recipeName = "Enchanted Voidwell Fish", source = "Enchanting"}
-- Profession: Midnight Enchanting (80)
Gallery.ItemDetails[262450] = { professionText = "Midnight Enchanting (80)",  recipeName = "Ensorcelled Broom", source = "Enchanting"}
Gallery.ItemDetails[262455] = { professionText = "Midnight Enchanting (80)",  recipeName = "Font of Gleaming Water", source = "Enchanting"}
end

do --Blacksmithing 33 , source = "Blacksmithing"
-- Profession: Classic Blacksmithing (240)
Gallery.ItemDetails[246111] = { professionText = "Classic Blacksmithing (240)",  recipeName = "Shadowforge Sconce", source = "Blacksmithing"}
Gallery.ItemDetails[246489] = { professionText = "Classic Blacksmithing (240)",  recipeName = "Steel Ironforge Emblem", source = "Blacksmithing"}
-- Profession: Outland Blacksmithing (60)
Gallery.ItemDetails[257035] = { professionText = "Outland Blacksmithing (60)",  recipeName = "Bronze Banner of the Exiled", source = "Blacksmithing"}
Gallery.ItemDetails[257036] = { professionText = "Outland Blacksmithing (60)",  recipeName = "Draenei Smith's Anvil", source = "Blacksmithing"}
Gallery.ItemDetails[257039] = { professionText = "Outland Blacksmithing (60)",  recipeName = "Draenei Crystal Forge", source = "Blacksmithing"}
-- Profession: Northrend Blacksmithing (60)
Gallery.ItemDetails[257040] = { professionText = "Northrend Blacksmithing (60)",  recipeName = "Dalaran Runic Anvil", source = "Blacksmithing"}
Gallery.ItemDetails[264676] = { professionText = "Northrend Blacksmithing (60)",  recipeName = "Dalaran Sewer Gate", source = "Blacksmithing"}
Gallery.ItemDetails[264710] = { professionText = "Northrend Blacksmithing (60)",  recipeName = "Dalaran Sun Sconce", source = "Blacksmithing"}
-- Profession: Cataclysm Blacksmithing (60)
Gallery.ItemDetails[257042] = { professionText = "Cataclysm Blacksmithing (60)",  recipeName = "Gilnean Pitchfork", source = "Blacksmithing"}
Gallery.ItemDetails[257409] = { professionText = "Cataclysm Blacksmithing (60)",  recipeName = "Standing Smoke Lamp", source = "Blacksmithing"}
-- Profession: Pandaria Blacksmithing (60)
Gallery.ItemDetails[247661] = { professionText = "Pandaria Blacksmithing (60)",  recipeName = "Pandaren Signal Brazier", source = "Blacksmithing"}
Gallery.ItemDetails[247752] = { professionText = "Pandaria Blacksmithing (60)",  recipeName = "Pandaren Fireplace", source = "Blacksmithing"}
-- Profession: Draenor Blacksmithing (80)
Gallery.ItemDetails[245436] = { professionText = "Draenor Blacksmithing (80)",  recipeName = "Blackrock Weapon Rack", source = "Blacksmithing"}
Gallery.ItemDetails[245600] = { professionText = "Draenor Blacksmithing (80)",  recipeName = "Frostwall Forge", source = "Blacksmithing"}
-- Profession: Legion Blacksmithing (80)
Gallery.ItemDetails[245408] = { professionText = "Legion Blacksmithing (80)",  recipeName = "Tauren Soup Pot", source = "Blacksmithing"}
Gallery.ItemDetails[247909] = { professionText = "Legion Blacksmithing (80)",  recipeName = "Suramar Fencepost", source = "Blacksmithing"}
Gallery.ItemDetails[247922] = { professionText = "Legion Blacksmithing (80)",  recipeName = "Suramar Fence", source = "Blacksmithing"}
Gallery.ItemDetails[282124] = { professionText = "Legion Blacksmithing (85)", recipeName = "Gleaming Lightforge", source = "Blacksmithing"}

-- Profession: Battle for Azeroth Blacksmithing (140)
Gallery.ItemDetails[252397] = { professionText = "Battle for Azeroth Blacksmithing (140)",  recipeName = "Brennadam Grinder", source = "Blacksmithing"}
Gallery.ItemDetails[252399] = { professionText = "Battle for Azeroth Blacksmithing (140)",  recipeName = "Stormsong Stove", source = "Blacksmithing"}
Gallery.ItemDetails[283303] = { professionText = "Battle for Azeroth Blacksmithing (140)", recipeName = "Nomad's Steel Forge", source = "Blacksmithing"}

-- Profession: Shadowlands Blacksmithing (80)
Gallery.ItemDetails[257048] = { professionText = "Shadowlands Blacksmithing (80)",  recipeName = "Aspirant's Meditation Pool", source = "Blacksmithing"}
Gallery.ItemDetails[257049] = { professionText = "Shadowlands Blacksmithing (80)",  recipeName = "Bejeweled Venthyr Chalice", source = "Blacksmithing"}
Gallery.ItemDetails[283260] = { professionText = "Shadowlands Blacksmithing (85)", recipeName = "Anima-Powered Anvil", source = "Blacksmithing"}

-- Profession: Dragon Isles Blacksmithing (80)
Gallery.ItemDetails[256427] = { professionText = "Dragon Isles Blacksmithing (80)",  recipeName = "Wingrest Signal Brazier", source = "Blacksmithing"}
Gallery.ItemDetails[256430] = { professionText = "Dragon Isles Blacksmithing (80)",  recipeName = "Valdrakken Hanging Cauldron", source = "Blacksmithing"}
-- Profession: Khaz Algar Blacksmithing (80)
Gallery.ItemDetails[245312] = { professionText = "Khaz Algar Blacksmithing (80)",  recipeName = "Rusting Bolted Bench", source = "Blacksmithing"}
Gallery.ItemDetails[245323] = { professionText = "Khaz Algar Blacksmithing (80)",  recipeName = "Shredderwheel Storage Chest", source = "Blacksmithing"}
-- Profession: Midnight Blacksmithing
Gallery.ItemDetails[262451] = { professionText = "Midnight Blacksmithing",  recipeName = "Gilded Silvermoon Anvil", source = "Blacksmithing"}
Gallery.ItemDetails[262452] = { professionText = "Midnight Blacksmithing",  recipeName = "Masterwork Crafting Hammer", source = "Blacksmithing"}
Gallery.ItemDetails[262456] = { professionText = "Midnight Blacksmithing",  recipeName = "Ornamental Silvermoon Hanger", source = "Blacksmithing"}
Gallery.ItemDetails[262457] = { professionText = "Midnight Blacksmithing",  recipeName = "Gilded Silvermoon Hanger", source = "Blacksmithing"}
Gallery.ItemDetails[262460] = { professionText = "Midnight Blacksmithing",  recipeName = "Ren'dorei Anvil", source = "Blacksmithing"}
Gallery.ItemDetails[263709] = { professionText = "Midnight Blacksmithing",  recipeName = "Amani Forgemaster's Workbench", source = "Blacksmithing"}
Gallery.ItemDetails[275305] = { professionText = "Midnight Blacksmithing",  recipeName = "Amani Forgemaster's Decorative Spear", source = "Blacksmithing"}
Gallery.ItemDetails[279329] = { professionText = "Midnight Blacksmithing",  recipeName = "Amani Forgemaster's Rack", source = "Blacksmithing"}
end

do --Alchemy 32 , source = "Alchemy"
-- Profession: Classic Alchemy (240)
Gallery.ItemDetails[257041] = { professionText = "Classic Alchemy (240)",  recipeName = "Stoppered Black Potion", source = "Alchemy"}
Gallery.ItemDetails[257100] = { professionText = "Classic Alchemy (240)",  recipeName = "Apothecary's Worktable", source = "Alchemy"}
-- Profession: Outland Alchemy (60)
Gallery.ItemDetails[264705] = { professionText = "Outland Alchemy (60)",  recipeName = "Glazed Sin'dorei Vial", source = "Alchemy"}
Gallery.ItemDetails[264706] = { professionText = "Outland Alchemy (60)",  recipeName = "Shadow Council Torch", source = "Alchemy"}
Gallery.ItemDetails[264709] = { professionText = "Outland Alchemy (60)",  recipeName = "Stranglekelp Sack", source = "Alchemy"}
Gallery.ItemDetails[264899] = { professionText = "Outland Alchemy (60)",  recipeName = "Arakkoan Alchemist's Concoction", source = "Alchemy"}
Gallery.ItemDetails[264900] = { professionText = "Outland Alchemy (60)",  recipeName = "Arakkoan Alchemist's Bottle", source = "Alchemy"}
-- Profession: Northrend Alchemy (60)
Gallery.ItemDetails[258212] = { professionText = "Northrend Alchemy (60)",  recipeName = "San'layn Blood Orb", source = "Alchemy"}
Gallery.ItemDetails[258213] = { professionText = "Northrend Alchemy (60)",  recipeName = "Icecrown Plague Canister", source = "Alchemy"}
-- Profession: Cataclysm Alchemy (60)
Gallery.ItemDetails[245517] = { professionText = "Cataclysm Alchemy (60)",  recipeName = "Gilnean Cauldron", source = "Alchemy"}
Gallery.ItemDetails[257694] = { professionText = "Cataclysm Alchemy (60)",  recipeName = "Gilnean Green Potion", source = "Alchemy"}
-- Profession: Pandaria Alchemy (60)
Gallery.ItemDetails[257043] = { professionText = "Pandaria Alchemy (60)",  recipeName = "Pandaren Alchemist's Retort", source = "Alchemy"}
Gallery.ItemDetails[258214] = { professionText = "Pandaria Alchemy (60)",  recipeName = "Pandaren Alchemist's Kit", source = "Alchemy"}
-- Profession: Draenor Alchemy (80)
Gallery.ItemDetails[244318] = { professionText = "Draenor Alchemy (80)",  recipeName = "Wine Barrel", source = "Alchemy"}
Gallery.ItemDetails[257044] = { professionText = "Draenor Alchemy (80)",  recipeName = "Orcish Felblood Cauldron", source = "Alchemy"}
-- Profession: Legion Alchemy (80)
Gallery.ItemDetails[256680] = { professionText = "Legion Alchemy (80)",  recipeName = "Arcan'dor Cutting Fountain", source = "Alchemy"}
Gallery.ItemDetails[257045] = { professionText = "Legion Alchemy (80)",  recipeName = "Starry Scrying Pool", source = "Alchemy"}
-- Profession: Battle for Azeroth Alchemy (140)
Gallery.ItemDetails[257046] = { professionText = "Battle for Azeroth Alchemy (140)",  recipeName = "Boralus Bottle Lamp", source = "Alchemy"}
Gallery.ItemDetails[257047] = { professionText = "Battle for Azeroth Alchemy (140)",  recipeName = "Zandalari Bottle Shipment", source = "Alchemy"}
-- Profession: Shadowlands Alchemy (140)
Gallery.ItemDetails[257050] = { professionText = "Shadowlands Alchemy (140)",  recipeName = "Veil-Secured Animacone", source = "Alchemy"}
Gallery.ItemDetails[257051] = { professionText = "Shadowlands Alchemy (140)",  recipeName = "Sintallow Candles", source = "Alchemy"}
Gallery.ItemDetails[284552] = { professionText = "Shadowlands Alchemy (140)", recipeName = "Venthyr Alchemy Rack", source = "Alchemy"}

-- Profession: Dragon Isles Alchemy (80)
Gallery.ItemDetails[248111] = { professionText = "Dragon Isles Alchemy (80)",  recipeName = "Verdant Valdrakken Vase", source = "Alchemy"}
Gallery.ItemDetails[257052] = { professionText = "Dragon Isles Alchemy (80)",  recipeName = "Dragon's Elixir Bottle", source = "Alchemy"}
-- Profession: Khaz Algar Alchemy (80)
Gallery.ItemDetails[252758] = { professionText = "Khaz Algar Alchemy (80)",  recipeName = "Boulder Springs Hot Tub", source = "Alchemy"}
Gallery.ItemDetails[257102] = { professionText = "Khaz Algar Alchemy (80)",  recipeName = "Nerubian Alchemist's Retort", source = "Alchemy"}
-- Profession: Midnight Alchemy (10)
Gallery.ItemDetails[253506] = { professionText = "Midnight Alchemy (10)",  recipeName = "Rootbound Vat", source = "Alchemy"}
Gallery.ItemDetails[256356] = { professionText = "Midnight Alchemy (10)",  recipeName = "Sunsmoke Censer", source = "Alchemy"}
Gallery.ItemDetails[257420] = { professionText = "Midnight Alchemy (10)",  recipeName = "Silvermoon Spire Fountain", source = "Alchemy"}
Gallery.ItemDetails[262354] = { professionText = "Midnight Alchemy (10)",  recipeName = "Riftstone", source = "Alchemy"}
Gallery.ItemDetails[262355] = { professionText = "Midnight Alchemy (10)",  recipeName = "Entropic Illuminant", source = "Alchemy"}
Gallery.ItemDetails[262356] = { professionText = "Midnight Alchemy (10)",  recipeName = "Haranir Preserving Agents", source = "Alchemy"}
Gallery.ItemDetails[279359] = { professionText = "Midnight Alchemy (50)",  recipeName = "Ersatz Venom Splatter", source = "Alchemy"}
end

do --Leatherworking 33, source = "Leatherworking"
-- Profession: Classic Leatherworking (240)
Gallery.ItemDetails[242948] = { professionText = "Classic Leatherworking (240)",  recipeName = "Loch Modan Bearskin Rug", source = "Leatherworking"}
Gallery.ItemDetails[257725] = { professionText = "Classic Leatherworking (240)",  recipeName = "Camp Narache Rug", source = "Leatherworking"}
-- Profession: Outland Leatherworking (60)
Gallery.ItemDetails[258190] = { professionText = "Outland Leatherworking (60)",  recipeName = "Outland Mag'har Banner", source = "Leatherworking"}
Gallery.ItemDetails[258191] = { professionText = "Outland Leatherworking (60)",  recipeName = "Arakkoa Decoy Scarecrow", source = "Leatherworking"}
-- Profession: Northrend Leatherworking (60)
Gallery.ItemDetails[257693] = { professionText = "Northrend Leatherworking (60)",  recipeName = "Snowfall Tribe Scare-Totem", source = "Leatherworking"}
Gallery.ItemDetails[258205] = { professionText = "Northrend Leatherworking (60)",  recipeName = "Wolvar Postbag", source = "Leatherworking"}
-- Profession: Cataclysm Leatherworking (60)
Gallery.ItemDetails[257806] = { professionText = "Cataclysm Leatherworking (60)",  recipeName = "Scaled Twilight Mosaic", source = "Leatherworking"}
Gallery.ItemDetails[264677] = { professionText = "Cataclysm Leatherworking (60)",  recipeName = "Rolled Scarab Rug", source = "Leatherworking"}
Gallery.ItemDetails[264712] = { professionText = "Cataclysm Leatherworking (60)",  recipeName = "Gilnean Spare Saddle", source = "Leatherworking"}
-- Profession: Pandaria Leatherworking (60)
Gallery.ItemDetails[247767] = { professionText = "Pandaria Leatherworking (60)",  recipeName = "Wise Pandaren's Bed", source = "Leatherworking"}
Gallery.ItemDetails[247856] = { professionText = "Pandaria Leatherworking (60)",  recipeName = "Serenity Peak Tent", source = "Leatherworking"}
-- Profession: Draenor Leatherworking (80)
Gallery.ItemDetails[244323] = { professionText = "Draenor Leatherworking (80)",  recipeName = "Orcish Sleeping Cot", source = "Leatherworking"}
Gallery.ItemDetails[245432] = { professionText = "Draenor Leatherworking (80)",  recipeName = "Blackrock Bunkbed", source = "Leatherworking"}
-- Profession: Legion Leatherworking (80)
Gallery.ItemDetails[245406] = { professionText = "Legion Leatherworking (80)",  recipeName = "Tauren Leather Fence", source = "Leatherworking"}
Gallery.ItemDetails[245407] = { professionText = "Legion Leatherworking (80)",  recipeName = "Tauren Fencepost", source = "Leatherworking"}
Gallery.ItemDetails[257400] = { professionText = "Legion Leatherworking (80)",  recipeName = "Highmountain Tanner's Frame", source = "Leatherworking"}
-- Profession: Battle for Azeroth Leatherworking (140)
Gallery.ItemDetails[245412] = { professionText = "Battle for Azeroth Leatherworking (140)",  recipeName = "Zandalari Ritual Drum", source = "Leatherworking"}
Gallery.ItemDetails[258558] = { professionText = "Battle for Azeroth Leatherworking (140)",  recipeName = "Sandfury Diplomat's Banner", source = "Leatherworking"}
-- Profession: Shadowlands Leatherworking (80)
Gallery.ItemDetails[258238] = { professionText = "Shadowlands Leatherworking (80)",  recipeName = "Maldraxxian Crate", source = "Leatherworking"}
Gallery.ItemDetails[258248] = { professionText = "Shadowlands Leatherworking (80)",  recipeName = "Margrave's Stitched Leather Rug", source = "Leatherworking"}
-- Profession: Dragon Isles Leatherworking (80)
Gallery.ItemDetails[248114] = { professionText = "Dragon Isles Leatherworking (80)",  recipeName = "Draconic Nesting Bed", source = "Leatherworking"}
Gallery.ItemDetails[248657] = { professionText = "Dragon Isles Leatherworking (80)",  recipeName = "Valdrakken Market Tent", source = "Leatherworking"}
Gallery.ItemDetails[284242] = { professionText = "Dragon Isles Leatherworking (50)", recipeName = "Beloved Ottuuuuuuk Plushie", source = "Leatherworking"}
Gallery.ItemDetails[284240] = { professionText = "Dragon Isles Leatherworking (50)", recipeName = "Beloved Ottuk Plushie", source = "Leatherworking"}
-- Profession: Khaz Algar Leatherworking (80)
Gallery.ItemDetails[239214] = { professionText = "Khaz Algar Leatherworking (80)",  recipeName = "Well-Lit Incontinental Couch", source = "Leatherworking"}
Gallery.ItemDetails[243327] = { professionText = "Khaz Algar Leatherworking (80)",  recipeName = "Zhevra-Stripe Rug", source = "Leatherworking"}
-- Profession: Midnight Leatherworking (50)
Gallery.ItemDetails[243090] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Sturdy Haranir Chair", source = "Leatherworking"}
Gallery.ItemDetails[262600] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Stitched Haranir Rug", source = "Leatherworking"}
Gallery.ItemDetails[264244] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Plush Haranir Leather Pillow", source = "Leatherworking"}
Gallery.ItemDetails[265791] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Haranir Canopy Bed", source = "Leatherworking"}
-- Profession: Midnight Leatherworking (80)
Gallery.ItemDetails[253457] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Leather-Bound Haranir Wall Shelf", source = "Leatherworking"}
Gallery.ItemDetails[262449] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Embossed Sin'dorei Fur Rug", source = "Leatherworking"}
Gallery.ItemDetails[262589] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Simple Haranir Table", source = "Leatherworking"}
Gallery.ItemDetails[266170] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Flat Snakeskin Canopy", source = "Leatherworking"}
Gallery.ItemDetails[279346] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Stretched Snakeskin Rack", source = "Leatherworking"}
Gallery.ItemDetails[279348] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Mounted Moby", source = "Leatherworking"}
end

do --Tailoring 37, source = "Tailoring"
-- Profession: Classic Tailoring (240)
Gallery.ItemDetails[243336] = { professionText = "Classic Tailoring (240)",  recipeName = "Elder Rise Rug", source = "Tailoring"}
Gallery.ItemDetails[246685] = { professionText = "Classic Tailoring (240)",  recipeName = "Dwarven District Banner", source = "Tailoring"}
-- Profession: Outland Tailoring (60)
Gallery.ItemDetails[258195] = { professionText = "Outland Tailoring (60)",  recipeName = "Draenei Weaver's Loom", source = "Tailoring"}
Gallery.ItemDetails[258202] = { professionText = "Outland Tailoring (60)",  recipeName = "Grand Drape of the Exiles", source = "Tailoring"}
-- Profession: Northrend Tailoring (60)
Gallery.ItemDetails[258206] = { professionText = "Northrend Tailoring (60)",  recipeName = "Gilded Dalaran Banner", source = "Tailoring"}
Gallery.ItemDetails[258298] = { professionText = "Northrend Tailoring (60)",  recipeName = "Kirin Tor Skyline Banner", source = "Tailoring"}
-- Profession: Cataclysm Tailoring (60)
Gallery.ItemDetails[245618] = { professionText = "Cataclysm Tailoring (60)",  recipeName = "Surwich Expedition Tent", source = "Tailoring"}
Gallery.ItemDetails[257402] = { professionText = "Cataclysm Tailoring (60)",  recipeName = "\"Unity of Thorns\" Tapestry", source = "Tailoring"}
-- Profession: Pandaria Tailoring (60)
Gallery.ItemDetails[247738] = { professionText = "Pandaria Tailoring (60)",  recipeName = "Pandaren Meander Rug", source = "Tailoring"}
Gallery.ItemDetails[258302] = { professionText = "Pandaria Tailoring (60)",  recipeName = "Pandaren Fishing Net", source = "Tailoring"}
-- Profession: Draenor Tailoring (80)
Gallery.ItemDetails[245421] = { professionText = "Draenor Tailoring (80)",  recipeName = "Karabor Bed", source = "Tailoring"}
Gallery.ItemDetails[251546] = { professionText = "Draenor Tailoring (80)",  recipeName = "Argussian Circular Rug", source = "Tailoring"}
Gallery.ItemDetails[258303] = { professionText = "Draenor Tailoring (80)",  recipeName = "Beloved Elekk Plushie", source = "Tailoring"}
-- Profession: Legion Tailoring (80)
Gallery.ItemDetails[247920] = { professionText = "Legion Tailoring (80)",  recipeName = "Circular Shal'dorei Rug", source = "Tailoring"}
Gallery.ItemDetails[248010] = { professionText = "Legion Tailoring (80)",  recipeName = "Shal'dorei Open-Air Tent", source = "Tailoring"}
Gallery.ItemDetails[258557] = { professionText = "Legion Tailoring (80)",  recipeName = "Beloved Raptor Plushie", source = "Tailoring"}
-- Profession: Battle for Azeroth Tailoring (140)
Gallery.ItemDetails[243101] = { professionText = "Battle for Azeroth Tailoring (140)",  recipeName = "Red Dazar'alor Rug", source = "Tailoring"}
Gallery.ItemDetails[245418] = { professionText = "Battle for Azeroth Tailoring (140)",  recipeName = "Zanchuli Tapestry", source = "Tailoring"}
-- Profession: Shadowlands Tailoring (80)
Gallery.ItemDetails[258561] = { professionText = "Shadowlands Tailoring (80)",  recipeName = "Kyrian Aspirant's Rolled Cushion", source = "Tailoring"}
Gallery.ItemDetails[264678] = { professionText = "Shadowlands Tailoring (80)",  recipeName = "Aspirant's Ringed Banner", source = "Tailoring"}
Gallery.ItemDetails[264713] = { professionText = "Shadowlands Tailoring (80)",  recipeName = "Heart of the Forest Banner", source = "Tailoring"}
-- Profession: Dragon Isles Tailoring (80)
Gallery.ItemDetails[248121] = { professionText = "Dragon Isles Tailoring (80)",  recipeName = "Draconic Circular Rug", source = "Tailoring"}
Gallery.ItemDetails[257053] = { professionText = "Dragon Isles Tailoring (80)",  recipeName = "Tapestry of the Five Flights", source = "Tailoring"}
-- Profession: Khaz Algar Tailoring (80)
Gallery.ItemDetails[245305] = { professionText = "Khaz Algar Tailoring (80)",  recipeName = "Undermine Bean Bag Chair", source = "Tailoring"}
Gallery.ItemDetails[252755] = { professionText = "Khaz Algar Tailoring (80)",  recipeName = "Dornogal Framed Rug", source = "Tailoring"}
-- Profession: Midnight Tailoring (50)
Gallery.ItemDetails[262352] = { professionText = "Midnight Tailoring (50)",  recipeName = "Lush Telogrus Carpet", source = "Tailoring"}
Gallery.ItemDetails[262591] = { professionText = "Midnight Tailoring (50)",  recipeName = "Luxurious Silvermoon Lounge Cushion", source = "Tailoring"}
Gallery.ItemDetails[262592] = { professionText = "Midnight Tailoring (50)",  recipeName = "Plush Silvermoon Bed", source = "Tailoring"}
Gallery.ItemDetails[262593] = { professionText = "Midnight Tailoring (50)",  recipeName = "Chic Silvermoon Pillow", source = "Tailoring"}
Gallery.ItemDetails[262599] = { professionText = "Midnight Tailoring (50)",  recipeName = "Silvermoon Curtains", source = "Tailoring"}
Gallery.ItemDetails[262611] = { professionText = "Midnight Tailoring (50)",  recipeName = "Voidstrider Saddlebag", source = "Tailoring"}
Gallery.ItemDetails[279350] = { professionText = "Midnight Tailoring (50)",  recipeName = "Twilight's Blade Bedroll", source = "Tailoring"}
Gallery.ItemDetails[279353] = { professionText = "Midnight Tailoring (50)",  recipeName = "Tortollan Slingsack", source = "Tailoring"}
end

do--Tailoring , source = "Tailoring"
Gallery.ItemDetails[282158] = { professionText = "Legion Tailoring (85)", recipeName = "Decorative Lightweave Bolt", source = "Tailoring"}
Gallery.ItemDetails[283299] = { professionText = "Battle for Azeroth Tailoring (140)", recipeName = "Nomad's Round Cushion", source = "Tailoring"}
Gallery.ItemDetails[284244] = { professionText = "Dragon Isles Tailoring (50)", recipeName = "Lillistrasza's Lucky Duck Plushie", source = "Tailoring"}
Gallery.ItemDetails[284246] = { professionText = "Classic Tailoring (150)", recipeName = "Beloved Plush Doll", source = "Tailoring"}
Gallery.ItemDetails[284238] = { professionText = "Draenor Tailoring", recipeName = "Beloved Murloc Plushie", source = "Tailoring"}
Gallery.ItemDetails[282184] = { professionText = "Midnight Tailoring (50)", recipeName = "Spidery Witch Hat", source = "Tailoring"}
end
end

-------------------------------------------------
-- Drops, Treasures, Bosses, Events
-------------------------------------------------
--103 dropName  9 treasureName = 112

do --Drops Stuff

do --Midnight Delves 12
	Gallery.ItemDetails[251967] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[263036] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[263042] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[263233] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[264258] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[264329] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[264330] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[264342] = { dropName = "Midnight Delves" }
	Gallery.ItemDetails[267009] = { dropName = "Midnight Delves" }

	Gallery.ItemDetails[267080] = { dropName = "The Coiled Isle Delves" }
	Gallery.ItemDetails[248963] = { dropName = "The Coiled Isle Delves" }
	Gallery.ItemDetails[275855] = { dropName = "The Coiled Isle Delves" } 

Gallery.ItemDetails[244350] = { dropName = "Labyrinth of Kindo'jan" }
Gallery.ItemDetails[252044] = { dropName = "Labyrinth of Kindo'jan" }
Gallery.ItemDetails[264484] = { dropName = "Labyrinth of Kindo'jan" }
Gallery.ItemDetails[263321] = { dropName = "Labyrinth of Kindo'jan" }
	Gallery.ItemDetails[284359] = { dropName = "Labyrinth of Kindo'jan" }
Gallery.ItemDetails[264256] = { dropName = "Labyrinth of Kindo'jan" }
end

	Gallery.ItemDetails[251329] = { dropName = "Shadowmoon Valley Missive", note = "Requires Missive: Assault on Socrethar's Rise" }


do --Darkshore Rares
	Gallery.ItemDetails[241066] = { dropName = "Darkshore Rares" }
	Gallery.ItemDetails[245462] = { dropName = "Darkshore Rares" }
	Gallery.ItemDetails[245627] = { dropName = "Darkshore Rares" }
	Gallery.ItemDetails[246110] = { dropName = "Darkshore Rares" }
end

do --Boss Raids 30
	Gallery.ItemDetails[264187] = { dropName = "Belo'ren" }
	Gallery.ItemDetails[264246] = { dropName = "Chimaerus" }
	Gallery.ItemDetails[265950] = { dropName = "Chimaerus" }
	Gallery.ItemDetails[266886] = { dropName = "Chimaerus" }
	Gallery.ItemDetails[267645] = { dropName = "Chimaerus" }
	Gallery.ItemDetails[265951] = { dropName = "Crown of the Cosmos" }
	Gallery.ItemDetails[266887] = { dropName = "Crown of the Cosmos" }
	Gallery.ItemDetails[268049] = { dropName = "Crown of the Cosmos" }
	Gallery.ItemDetails[269269] = { dropName = "Crown of the Cosmos" }
	Gallery.ItemDetails[264494] = { dropName = "Fallen-King Salhadaar" }
	Gallery.ItemDetails[253242] = { dropName = "Garrosh Hellscream" }
	Gallery.ItemDetails[262957] = { dropName = "General Amias Bellamy" }
	Gallery.ItemDetails[264497] = { dropName = "Imperator Averzian" }
	Gallery.ItemDetails[264492] = { dropName = "Midnight Falls" }
	Gallery.ItemDetails[265949] = { dropName = "Midnight Falls" }
	Gallery.ItemDetails[266885] = { dropName = "Midnight Falls" }
	Gallery.ItemDetails[267646] = { dropName = "Midnight Falls" }
	Gallery.ItemDetails[247235] = { dropName = "Rotmire" }
	Gallery.ItemDetails[256682] = { dropName = "Spellblade Aluriel" }
	Gallery.ItemDetails[264491] = { dropName = "Vaelgor" }
	Gallery.ItemDetails[279112] = { dropName = "Nymrissa Wavecaller" }
	Gallery.ItemDetails[264498] = { dropName = "Vorasius" }
	Gallery.ItemDetails[267008] = { dropName = "Zaxasj the Speaker" }
	Gallery.ItemDetails[281213] = { dropName = "Kith'ix" } -- Kith'ix's Seal
	Gallery.ItemDetails[272361] = { dropName = "Vashnik the Malignant" } --done
	Gallery.ItemDetails[279115] = { dropName = "Nek'zali the Soulcoiler" } --done
	Gallery.ItemDetails[279118] = { dropName = "The Lost Explorers" } --done
	Gallery.ItemDetails[264716] = { dropName = "Entombed Sentinels " } --done
	Gallery.ItemDetails[279122] = { dropName = "The Twin Fangs" } --done
	Gallery.ItemDetails[279131] = { dropName = "The Bargained Crown" } --done
	Gallery.ItemDetails[244343] = { dropName = "Sszorak" } --done
	Gallery.ItemDetails[279500] = { dropName = "Ula'tek" } --done
	Gallery.ItemDetails[279125] = { dropName = "Ula'tek" } --done
	Gallery.ItemDetails[279129] = { dropName = "Ula'tek" } --done
	Gallery.ItemDetails[279127] = { dropName = "Ula'tek" } --done
end

do --Dungeon Bosses 32
	Gallery.ItemDetails[284194] = { dropName = "Yalnu" } -- The Everbloom
	Gallery.ItemDetails[264336] = { dropName = "Charonus" }
	Gallery.ItemDetails[278245] = { dropName = "Dazar, The First King" }
	Gallery.ItemDetails[247913] = { dropName = "Advisor Melandrus" }
	Gallery.ItemDetails[245451] = { dropName = "Dargrul" }
	Gallery.ItemDetails[248332] = { dropName = "Vanessa Vancleef" }
	Gallery.ItemDetails[263230] = { dropName = "Degentrius" }
	Gallery.ItemDetails[260359] = { dropName = "Echo of Doragosa" }
	Gallery.ItemDetails[246429] = { dropName = "Emperor Dagran Thaurissan" }
	Gallery.ItemDetails[245560] = { dropName = "Goldie Baronbottom" }
	Gallery.ItemDetails[246421] = { dropName = "Harlan Sweete" }
	Gallery.ItemDetails[258744] = { dropName = "High Sage Viryx" }
	Gallery.ItemDetails[255672] = { dropName = "King Mechagon" }
	Gallery.ItemDetails[256428] = { dropName = "Kyrakka and Erkhart Stormvein"}
	Gallery.ItemDetails[263238] = { dropName = "Lithiel Cinderfury" }
	Gallery.ItemDetails[244655] = { dropName = "Lord Godfrey" }
	Gallery.ItemDetails[264338] = { dropName = "Lothraxion" }
	Gallery.ItemDetails[241044] = { dropName = "L'ura" }
	Gallery.ItemDetails[264332] = { dropName = "Nalorakk" }
	Gallery.ItemDetails[245938] = { dropName = "Prioress Murrpray" }
	Gallery.ItemDetails[264717] = { dropName = "Rak'tul" }
	Gallery.ItemDetails[256683] = { dropName = "Restless Heart" }
	Gallery.ItemDetails[267007] = { dropName = "Scourgelord Tyrannus" }
	Gallery.ItemDetails[246846] = { dropName = "Sha of Doubt" }
	Gallery.ItemDetails[238857] = { dropName = "Shade of Xavius" }
	Gallery.ItemDetails[245434] = { dropName = "Skulloc" }
	Gallery.ItemDetails[251331] = {dropName = "Teron'gor" }
	Gallery.ItemDetails[258268] = { dropName = "The Darkness" }
	Gallery.ItemDetails[246865] = { dropName = "Viz'aduum the Watcher" }
	Gallery.ItemDetails[245681] = { dropName = "Vol'zith the Whisperer" }
	Gallery.ItemDetails[256354] = { dropName = "Warlord Sargha" }
	Gallery.ItemDetails[245435] = { dropName = "Warlord Zaela" }
	Gallery.ItemDetails[253451] = { dropName = "Ziekket" }
	Gallery.ItemDetails[278982] = { dropName = "Avatar of Sethraliss" }
	Gallery.ItemDetails[279211] = { dropName = "Zul'jan's Strongbox" } --done
end

do-- Drops
	Gallery.ItemDetails[257724] = { dropName = "Highmountain Paragon Chest" }
	Gallery.ItemDetails[245294] = { dropName = "Distinguished Actor's Chest" }
	Gallery.ItemDetails[264343] = { dropName = "Stormarion Assault" }	
	Gallery.ItemDetails[246481] = { dropName = "Mechagon Dailies", note = "Self-Assembling Homeware Kit" }
	Gallery.ItemDetails[246599] = { dropName = "Mechagon Dailies", note = "Self-Assembling Homeware Kit" }
	Gallery.ItemDetails[246600] = { dropName = "Mechagon Dailies", note = "Self-Assembling Homeware Kit" }
	Gallery.ItemDetails[246602] = { dropName = "Mechagon Dailies", note = "Self-Assembling Homeware Kit" }
	Gallery.ItemDetails[245320] = { dropName = "Undermine", note = "Requires Shipping and Handling Job Streak"}
	Gallery.ItemDetails[257928] = { dropName = "Mechagon", note = "Strange Recycling Requisition"}
	Gallery.ItemDetails[278374] = { dropName = "Ral'kala" } 
	Gallery.ItemDetails[278378] = { dropName = "Ral'kala" }
	Gallery.ItemDetails[263874] = { dropName = "Ral'kala" }
	Gallery.ItemDetails[278154] = { dropName = "Ral'kala" }
end 

do-- Treasures
Gallery.ItemDetails[245449] = {  sourceAction = "Withered Army Training", treasureName = "Glimmering Treasure Chest" }
Gallery.ItemDetails[251912] = { sourceAction = "Stone Vat", treasureName = "Stone Vat" }
Gallery.ItemDetails[262467] = { sourceAction = "Stellar Stash", treasureName = "Stellar Stash" }
Gallery.ItemDetails[264482] = { sourceAction = "Malignant Chest", treasureName = "Malignant Chest" }
Gallery.ItemDetails[245315] = { sourceAction = "Scraps Heaps", treasureName = "Uncovered Strongbox", note = "Chance to drop in any of the Scrap Heap Events"}
Gallery.ItemDetails[248934] = { dropName = "Frederick the Fabulous"}

Gallery.ItemDetails[263211] = { sourceAction = "Gift of the Phoenix", treasureName = "Gift of the Phoenix" }
Gallery.ItemDetails[245282] = { sourceAction = "Incomplete Book of Sonnets", treasureName = "Incomplete Book of Sonnets" }
Gallery.ItemDetails[246416] = { sourceAction = "Reliquary's Lost Paint Supplies", treasureName = "Reliquary's Lost Paint Supplies" }
Gallery.ItemDetails[243106] = { sourceAction = "Triple-Locked Safebox", treasureName = "Triple-Locked Safebox" }
end

do--Unknown sources
Gallery.ItemDetails[262608] = { dropName = "Stormarion Assault" }
Gallery.ItemDetails[264483] = { dropName = "Stormarion Assault" }

end
-- ------------------------------------------------------------
-- 12.1.7 Drops
-- ------------------------------------------------------------
Gallery.ItemDetails[284605] = { dropName = "Cordana Felsong" } -- Wardens' Pool of Judgment
Gallery.ItemDetails[285096] = { dropName = "Keristraza" } -- Azure Mage Hunter's Rune Circle
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Sources/GalleryVendorDetails.lua
-- ------------------------------------------------------------
(function(...)
-- ============================================================
-- Decor Vendor Gallery
-- Data/GalleryVendorDetails.lua
-- Gallery-only vendor purchase details
-- ============================================================
-- ============================================================
-- Shared Vendor Details
-- itemID -> vendorID -> price/location/requirement details
-- ============================================================
local addonName, DVD = ...

-- Compatibility alias:
-- This lets all Gallery.VendorDetails[itemID] lines keep working.
local Gallery = DVD

Gallery.VendorDetails = Gallery.VendorDetails or {}


do--Telemancer Astrandis
Gallery.VendorDetails[244349] = { [242399] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[264486] = { [242399] = { price = { currencyID = 3316, amount = 300 }, displayZone = "Silvermoon City" }} 
Gallery.VendorDetails[284357] = { [242399] = { price = { currencyID = 3316, amount = 600 }, displayZone = "Silvermoon City" }}  

Gallery.VendorDetails[263994] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[263995] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[263996] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[264007] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[264008] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[264170] = { [242399] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[264175] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265033] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[267207] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272360] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265386] = { [242399] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
end

do--Naleidea Rivergleam
Gallery.VendorDetails[244346] = { [242398] = { price = { currencyID = 2803, amount = 150 }, displayZone = "Silvermoon City" }}   
Gallery.VendorDetails[252043] = { [242398] = { price = { currencyID = 2803, amount = 150 }, displayZone = "Silvermoon City" }}  
Gallery.VendorDetails[264485] = { [242398] = { price = { currencyID = 2803, amount = 500 }, displayZone = "Silvermoon City" }}   
Gallery.VendorDetails[264719] = { [242398] = { price = { currencyID = 2803, amount = 150 }, displayZone = "Silvermoon City" }}   
Gallery.VendorDetails[284353] = { [242398] = { price = { currencyID = 2803, amount = 500 }, displayZone = "Silvermoon City" }}   
Gallery.VendorDetails[284355] = { [242398] = { price = { currencyID = 2803, amount = 150 }, displayZone = "Silvermoon City" }}    
Gallery.VendorDetails[284362] = { [242398] = { price = { currencyID = 2803, amount = 1000 }, displayZone = "Silvermoon City" }}    
Gallery.VendorDetails[244348] = { [242398] = { price = { currencyID = 2803, amount = 150 }, displayZone = "Silvermoon City" }}   

Gallery.VendorDetails[246779] = { [242398] = { price = { currencyID = 2803, amount = 500 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[250770] = { [242398] = { price = { currencyID = 2803, amount = 500 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[275853] = { [242398] = { price = { currencyID = 2803, amount = 500 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[275857] = { [242398] = { price = { currencyID = 2803, amount = 500 }, displayZone = "Silvermoon City" }}
end

do--Rasil Fireborne
Gallery.VendorDetails[284264] = { [112716] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Dalaran" }}  
 end
 
do--Halloween items
Gallery.VendorDetails[282086] = { 
[271604] = { priceText = "250" , displayZone = "Founders Point" },
[271366] = { priceText = "250" , displayZone = "Razorwind Shores" },} -- W (Buckled Witch Hat) 
Gallery.VendorDetails[282081] = { 
[271604] = { priceText = "500" , displayZone = "Founders Point" },
[271366] = { priceText = "500" , displayZone = "Razorwind Shores" }, } -- W (Candlelit Smiling Jack-o'-Lantern) "
Gallery.VendorDetails[282098] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, } -- W (Elaborate Heartsbane Doom Catcher)
Gallery.VendorDetails[282072] = {
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, } -- W (Enchanted Hallow's End Candle) 
Gallery.VendorDetails[282090] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, } -- W (Eternally Powered Glowskull) 
Gallery.VendorDetails[282075] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, } -- W (Heartsbane Candle) 
Gallery.VendorDetails[282051] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, } -- W (Simple Hallow's End Candle) 
Gallery.VendorDetails[282077] = { 
[271604] = { priceText = "500" , displayZone = "Founders Point" },
[271366] = { priceText = "500" , displayZone = "Razorwind Shores" }, } -- W (Spooky Scarecrow) 
Gallery.VendorDetails[282083] = { 
[271604] = { priceText = "500" , displayZone = "Founders Point" },
[271366] = { priceText = "500" , displayZone = "Razorwind Shores" }, } -- W (Unlit Smiling Jack-o'-Lantern) 
Gallery.VendorDetails[282092] = { 
[271604] = { priceText = "500" , displayZone = "Founders Point" },
[271366] = { priceText = "500" , displayZone = "Razorwind Shores" }, } -- W (Heartsbane Ritual Markings) 
Gallery.VendorDetails[282095] = { 
[271604] = { priceText = "500" , displayZone = "Founders Point" },
[271366] = { priceText = "500" , displayZone = "Razorwind Shores" },} -- W (Ominous Heartsbane Banner) 

Gallery.VendorDetails[282100] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, 
}
--World Vendors
Gallery.VendorDetails[282192] = { 
[273402] = { price = { currencyID = 33226, amount = 20 }},
[273403] = { price = { currencyID = 33226, amount = 20 }},
[273472] = { price = { currencyID = 33226, amount = 20 }},
[273470] = { price = { currencyID = 33226, amount = 20 }},} -- W (Candlelit Shrieking Jack-o'-Lantern) 
Gallery.VendorDetails[282194] = { 
[273402] = { price = { currencyID = 33226, amount = 20 }},
[273403] = { price = { currencyID = 33226, amount = 20 }},
[273472] = { price = { currencyID = 33226, amount = 20 }},
[273470] = { price = { currencyID = 33226, amount = 20 }},} -- W (Candlelit Ogre Jack-o'-Lantern) 
Gallery.VendorDetails[282196] = { 
[273402] = { price = { currencyID = 33226, amount = 20 }},
[273403] = { price = { currencyID = 33226, amount = 20 }},
[273472] = { price = { currencyID = 33226, amount = 20 }},
[273470] = { price = { currencyID = 33226, amount = 20 }},} -- W (Filled Candy Bucket) 
Gallery.VendorDetails[282198] = { 
[273402] = { price = { currencyID = 33226, amount = 20 }},
[273403] = { price = { currencyID = 33226, amount = 20 }},
[273472] = { price = { currencyID = 33226, amount = 20 }},
[273470] = { price = { currencyID = 33226, amount = 20 }},} -- W (Unlit Shrieking Jack-o'-Lantern) 
Gallery.VendorDetails[282200] = { 
[273402] = { price = { currencyID = 33226, amount = 20 }},
[273403] = { price = { currencyID = 33226, amount = 20 }},
[273472] = { price = { currencyID = 33226, amount = 20 }},
[273470] = { price = { currencyID = 33226, amount = 20 }},} -- W (Unlit Ogre Jack-o'-Lantern) 
Gallery.VendorDetails[282202] = { 
[273402] = { price = { currencyID = 33226, amount = 15 }},
[273403] = { price = { currencyID = 33226, amount = 15 }},
[273472] = { price = { currencyID = 33226, amount = 15 }},
[273470] = { price = { currencyID = 33226, amount = 15 }},} -- W (Elaborate Heartsbane Ritual Markings) 
Gallery.VendorDetails[282204] = { 
[273402] = { price = { currencyID = 33226, amount = 25 }},
[273403] = { price = { currencyID = 33226, amount = 25 }},
[273472] = { price = { currencyID = 33226, amount = 25 }},
[273470] = { price = { currencyID = 33226, amount = 25 }},} -- W (Ominous Heartsbane Shrine) 
Gallery.VendorDetails[282206] = { 
[273402] = { price = { currencyID = 33226, amount = 15 }},
[273403] = { price = { currencyID = 33226, amount = 15 }},
[273472] = { price = { currencyID = 33226, amount = 15 }},
[273470] = { price = { currencyID = 33226, amount = 15 }},} -- W (Heartsbane Stone Circle) 
Gallery.VendorDetails[282208] = { 
[273402] = { price = { currencyID = 33226, amount = 25 }},
[273403] = { price = { currencyID = 33226, amount = 25 }},
[273472] = { price = { currencyID = 33226, amount = 25 }},
[273470] = { price = { currencyID = 33226, amount = 25 }},} -- W (Heartsbane Banner) 
Gallery.VendorDetails[282213] = { 
[273402] = { price = { currencyID = 33226, amount = 25 }},
[273403] = { price = { currencyID = 33226, amount = 25 }},
[273472] = { price = { currencyID = 33226, amount = 25 }},
[ 273470] = { price = { currencyID = 33226, amount = 25 }},} -- W (Looming Heartsbane Effigy) 

Gallery.VendorDetails[282289] = { 
[273403] = { price = { currencyID = 33226, amount = 20 }},
[273402] = { price = { currencyID = 33226, amount = 20 }},} -- W (Horrific Head of the Horseman) 



--Year around Housing Holiday
Gallery.VendorDetails[248101] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, 
--[272042] = { priceText = "100" , displayZone = "Durotar" },
--[272030] = { priceText = "100" , displayZone = "Dun Morogh" },
}
Gallery.VendorDetails[280335] = { 
[271604] = { priceText = "100" , displayZone = "Founders Point" },
[271366] = { priceText = "100" , displayZone = "Razorwind Shores" }, 
--[272042] = { priceText = "100" , displayZone = "Durotar" },
--[272030] = { priceText = "100" , displayZone = "Dun Morogh" },
}
end
-- live
Gallery.VendorDetails[256330] = { [1247] = { priceText = "800 ", displayZone = "Dun Morogh" }}
Gallery.VendorDetails[246422] = { [1465] = { priceText = "300 ", displayZone = "Loch Modan" }}
Gallery.VendorDetails[257412] = { [2140] = { priceText = "150 ", displayZone = "Silverpine Forest" }}
Gallery.VendorDetails[257405] = { [3178] = { priceText = "200 ", displayZone = "Wetlands" }}
Gallery.VendorDetails[258220] = { [25206] = { priceText = "75 ", displayZone = "Borean Tundra" }}
Gallery.VendorDetails[248622] = { [27391] = { priceText = "500 ", displayZone = "Grizzly Hills" }}
Gallery.VendorDetails[248807] = { [28038] = { priceText = "500 ", displayZone = "Sholazar Basin" }}
Gallery.VendorDetails[244777] = { [44337] = { priceText = "1100 ", displayZone = "Blasted Lands" }}
Gallery.VendorDetails[256903] = { [48258] = { priceText = "75 ", displayZone = "Felwood" }}
Gallery.VendorDetails[243335] = { [50483] = { priceText = "200 ", displayZone = "Mulgore" }}
Gallery.VendorDetails[264349] = { [59698] = { priceText = "1000 ", displayZone = "Kun-Lai Summit" }}
Gallery.VendorDetails[257349] = { [81133] = { price = { currencyID = 824, amount = 300 }, displayZone = "Shadowmoon Valley" }}



do --Master Smith Burninate
Gallery.VendorDetails[245333] = { [14624] = { priceText = "150 ", displayZone = "Searing Gorge" }}
Gallery.VendorDetails[246409] = { [14624] = { priceText = "700 ", displayZone = "Searing Gorge" }}
end

do --Provisioner Vredigar
Gallery.VendorDetails[256049] = { [16528] = { priceText = "5000 ", displayZone = "Ghostlands", requirement = { type = "reputation", faction = "Tranquillien", rank = "Exalted" } }}
Gallery.VendorDetails[257419] = { [16528] = { priceText = "5000 ", displayZone = "Ghostlands", requirement = { type = "reputation", faction = "Tranquillien", rank = "Exalted" } }}
end

do --Wilkinson
Gallery.VendorDetails[245624] = { [44114] = { priceText = "150 ", displayZone = "Duskwood" }}
Gallery.VendorDetails[256905] = { [44114] = { priceText = "175 ", displayZone = "Duskwood" }}
end

do --Captain Lancy Revshon
Gallery.VendorDetails[248333] = { [49877] = { priceText = "100 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Honored" } }}
Gallery.VendorDetails[248336] = { [49877] = { priceText = "300 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248617] = { [49877] = { priceText = "150 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Revered" } }}
Gallery.VendorDetails[248618] = { [49877] = { priceText = "200 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248619] = { [49877] = { priceText = "250 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Exalted" } }}
Gallery.VendorDetails[248620] = { [49877] = { priceText = "150 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Revered" } }}
Gallery.VendorDetails[248621] = { [49877] = { priceText = "300 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248662] = { [49877] = { priceText = "500 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248665] = { [49877] = { priceText = "250 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Exalted" } }}
Gallery.VendorDetails[248794] = { [49877] = { priceText = "50 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Friendly" } }}
Gallery.VendorDetails[248795] = { [49877] = { priceText = "75 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Friendly" } }}
Gallery.VendorDetails[248797] = { [49877] = { priceText = "50 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248798] = { [49877] = { priceText = "200 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248801] = { [49877] = { priceText = "100 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248938] = { [49877] = { priceText = "150 ", displayZone = "Stormwind City" }}
Gallery.VendorDetails[248939] = { [49877] = { priceText = "100 ", displayZone = "Stormwind City", requirement = { type = "reputation", faction = "Stormwind", rank = "Honored" } }}
Gallery.VendorDetails[256673] = { [49877] = { priceText = "1000 ", displayZone = "Stormwind City" }}
end

do --Captain Donald Adams
Gallery.VendorDetails[245504] = { [50304] = { priceText = "150 ", displayZone = "Tirisfal Glades" }}
Gallery.VendorDetails[245505] = { [50304] = { priceText = "100 ", displayZone = "Tirisfal Glades" }}
end

do-- Lord Candren and Ripley Kiefer
Gallery.VendorDetails[245518] = {
[50307] = { priceText = "150 ", displayZone = " Gilneas" },
[252520] = { priceText = "150 ", displayZone = "Teldrassil" },
}
Gallery.VendorDetails[245603] = {
[50307] = { priceText = "350 ", displayZone = "Gilneas", requirement = { type = "reputation", faction = "Gilneas", rank = "Revered" } },
[252520] = { priceText = "350 ", displayZone = "Teldrassil", requirement = { type = "reputation", faction = "Gilneas", rank = "Revered" } },
}
Gallery.VendorDetails[245605] = {
[50307] = { priceText = "300 ", displayZone = "Gilneas", requirement = { type = "reputation", faction = "Gilneas", rank = "Honored" } },
[252520] = { priceText = "300 ", displayZone = "Teldrassil", requirement = { type = "reputation", faction = "Gilneas", rank = "Honored" } },
}
Gallery.VendorDetails[245620] = {
[50307] = { priceText = "450 ", displayZone = " Gilneas" },
[252520] = { priceText = "450 ", displayZone = "Teldrassil" },
}
end

do-- Captain Stonehelm and Dedric Sleetshaper
Gallery.VendorDetails[246426] = {
[50309] = { priceText = "600 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Honored" } },
[253235] = { priceText = "600 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Honored" } },
}
Gallery.VendorDetails[246490] = {
[50309] = { priceText = "250 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Friendly" } },
[253235] = { priceText = "250 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Friendly" } },
}
Gallery.VendorDetails[246491] = {
[50309] = { priceText = "150 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Friendly" } },
[253235] = { priceText = "150 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Friendly" } },
}
Gallery.VendorDetails[252010] = {
[50309] = { priceText = "450 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Honored" } },
[253235] = { priceText = "450 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Honored" } },
}
Gallery.VendorDetails[256333] = {
[50309] = { priceText = "1000 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Revered" } },
[253235] = { priceText = "1000 ", displayZone = "Dun Morogh", requirement = { type = "reputation", faction = "Ironforge", rank = "Revered" } },
}
end

do --San Redscale
Gallery.VendorDetails[247730] = { [58414] = { priceText = "1000 ", displayZone = "The Jade Forest", requirement = { type = "reputation", faction = "Order of the Cloud Serpent", rank = "Revered" } }}
Gallery.VendorDetails[247732] = { [58414] = { priceText = "500 ", displayZone = "The Jade Forest", requirement = { type = "reputation", faction = "Order of the Cloud Serpent", rank = "Honored" } }}
end

do--gina mudclaw
Gallery.VendorDetails[245508] = { [58706] = { priceText = "1000 ", displayZone = "Valley of the Four Winds", requirement = { type = "reputation", faction = "Tina Mudclaw", rank = "Friendly" } }}
Gallery.VendorDetails[247670] = { [58706] = { priceText = "1000 ", displayZone = "Valley of the Four Winds", requirement = { type = "reputation", faction = "Ella", rank = "Friendly" } }}
Gallery.VendorDetails[247734] = { [58706] = { priceText = "800 ", displayZone = "Valley of the Four Winds", requirement = { type = "reputation", faction = "Farmer Fung", rank = "Friendly" } }}
Gallery.VendorDetails[247737] = { [58706] = { priceText = "300 ", displayZone = "Valley of the Four Winds", requirement = { type = "reputation", faction = "Jogu the Drunk", rank = "Friendly" } }}
Gallery.VendorDetails[248663] = { [58706] = { priceText = "300 ", displayZone = "Valley of the Four Winds" }}
end

do--lali
Gallery.VendorDetails[245332] = { [62088] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms" }}
Gallery.VendorDetails[257351] = { [62088] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms" }}
Gallery.VendorDetails[257354] = { [62088] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms" }}
Gallery.VendorDetails[257355] = { [62088] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms" }}
Gallery.VendorDetails[271971] = { [62088] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms" }}
end

do --Sage Lotusbloom and Sage Whiteheart
Gallery.VendorDetails[247729] = {
[64001] = { priceText = "300 ", displayZone = "Vale of Eternal Blossoms" },
[64032] = { priceText = "300 ", displayZone = "Vale of Eternal Blossoms " },
}
Gallery.VendorDetails[264362] = {
[64001] = { priceText = "500 ", displayZone = "Vale of Eternal Blossoms " },
[64032] = { priceText = "500 ", displayZone = "Vale of Eternal Blossoms " },
}
end

do--tan shin
Gallery.VendorDetails[245512] = { [64605] = { priceText = "300 ", displayZone = "Vale of Eternal Blossoms ", requirement = { type = "reputation", faction = "The Lorewalkers", rank = "Friendly" } }}
Gallery.VendorDetails[247662] = { [64605] = { priceText = "500 ", displayZone = "Vale of Eternal Blossoms ", requirement = { type = "reputation", faction = "The Lorewalkers", rank = "Honored" } }}
Gallery.VendorDetails[247663] = { [64605] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms ", requirement = { type = "reputation", faction = "The Lorewalkers", rank = "Revered" } }}
Gallery.VendorDetails[247855] = { [64605] = { priceText = "300 ", displayZone = "Vale of Eternal Blossoms ", requirement = { type = "reputation", faction = "The Lorewalkers", rank = "Honored" } }}
Gallery.VendorDetails[247858] = { [64605] = { priceText = "2000 ", displayZone = "Vale of Eternal Blossoms " }}
Gallery.VendorDetails[258147] = { [64605] = { priceText = "1000 ", displayZone = "Vale of Eternal Blossoms ", requirement = { type = "reputation", faction = "The Lorewalkers", rank = "Revered" } }}
Gallery.VendorDetails[244324] = { [76872] = { price = { currencyID = 824, amount = 150 }, displayZone = "Frostwall" }}
end

do--seargent crowler
Gallery.VendorDetails[245275] = { [78564] = { price = { currencyID = 824, amount = 100 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248334] = { [78564] = { price = { currencyID = 824, amount = 300 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248335] = { [78564] = { price = { currencyID = 824, amount = 100 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248660] = { [78564] = { price = { currencyID = 824, amount = 300 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248661] = { [78564] = { price = { currencyID = 824, amount = 300 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248799] = { [78564] = { price = { currencyID = 824, amount = 100 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248800] = { [78564] = { price = { currencyID = 824, amount = 1500 }, displayZone = "Lunarfall" }}
Gallery.VendorDetails[248810] = { [78564] = { price = { currencyID = 824, amount = 100 }, displayZone = "Lunarfall" }}
end

do--seargent grimjaw
Gallery.VendorDetails[244315] = { [79774] = { price = { currencyID = 824, amount = 1500 }, displayZone = "Frostwall" }}
Gallery.VendorDetails[244316] = { [79774] = { price = { currencyID = 824, amount = 300 }, displayZone = "Frostwall" }}
Gallery.VendorDetails[244320] = { [79774] = { price = { currencyID = 824, amount = 100 }, displayZone = "Frostwall" }}
Gallery.VendorDetails[244653] = { [79774] = { price = { currencyID = 824, amount = 300 }, displayZone = "Frostwall" }}
Gallery.VendorDetails[245438] = { [79774] = { price = { currencyID = 824, amount = 500 }, displayZone = "Frostwall" }}
Gallery.VendorDetails[245443] = { [79774] = { price = { currencyID = 824, amount = 300 }, displayZone = "Frostwall" }}
end

do--Vindicator Nuurem
Gallery.VendorDetails[285179] = { [85932] = { price = { currencyID = 824, amount = 350 }, displayZone = "Stormshield" }} 
Gallery.VendorDetails[245423] = { [85932] = { price = { currencyID = 824, amount = 250 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Friendly" } }}
Gallery.VendorDetails[251476] = { [85932] = { price = { currencyID = 824, amount = 1000 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Revered" } }}
Gallery.VendorDetails[251479] = { [85932] = { price = { currencyID = 824, amount = 1500 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Exalted" } }}
Gallery.VendorDetails[251481] = { [85932] = { price = { currencyID = 824, amount = 500 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Honored" } }}
Gallery.VendorDetails[251483] = { [85932] = { price = { currencyID = 824, amount = 250 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Friendly" } }}
Gallery.VendorDetails[251484] = { [85932] = { price = { currencyID = 824, amount = 1000 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Revered" } }}
Gallery.VendorDetails[251493] = { [85932] = { price = { currencyID = 824, amount = 500 }, displayZone = "Stormshield", requirement = { type = "reputation", faction = "Council of Exarchs", rank = "Honored" } }}
Gallery.VendorDetails[251551] = { [85932] = { price = { currencyID = 824, amount = 1500 }, displayZone = "Stormshield", requirement = { type == "reputation", faction == "Council of Exarchs", rank == "Exalted" } }} 
end

do --Trader Caerel
Gallery.VendorDetails[245425] = { [85950] = { price = { currencyID = 823, amount = 500 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251330] = { [85950] = { price = { currencyID = 823, amount = 300 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251477] = { [85950] = { price = { currencyID = 824, amount = 1000 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251478] = { [85950] = { price = { currencyID = 823, amount = 1000 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251548] = { [85950] = { price = { currencyID = 823, amount = 500 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251549] = { [85950] = { price = { currencyID = 824, amount = 2000 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251640] = { [85950] = { price = { currencyID = 823, amount = 1000 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251653] = { [85950] = { price = { currencyID = 824, amount = 1000 }, displayZone = "Stormshield" }}
Gallery.VendorDetails[251654] = { [85950] = { price = { currencyID = 823, amount = 2000 }, displayZone = "Stormshield" }}
end


Gallery.VendorDetails[258743] = {
[86037] = { priceText = "10 ", displayZone = "Warspear", requirement = { type = "reputation", faction = "Arakkoa Outcasts", rank = "Honored" } },
[85946] = { priceText = "10 ", displayZone = "Stormshield", requirement = { type = "reputation", faction = "Arakkoa Outcasts", rank = "Honored" } },
}
Gallery.VendorDetails[258746] = {
[86037] = { priceText = "10 ", displayZone = "Warspear", requirement = { type = "reputation", faction = "Arakkoa Outcasts", rank = "Revered" } },
[85946] = { priceText = "10 ", displayZone = "Stormshield", requirement = { type = "reputation", faction = "Arakkoa Outcasts", rank = "Revered" } },
}
Gallery.VendorDetails[258747] = {
[86037] = { priceText = "10 ", displayZone = "Warspear", requirement = { type = "reputation", faction = "Arakkoa Outcasts", rank = "Friendly" } },
[85946] = { priceText = "10 ", displayZone = "Stormshield", requirement = { type = "reputation", faction = "Arakkoa Outcasts", rank = "Friendly" } },
}

Gallery.VendorDetails[258740] = { [87775] = { priceText = "10 ", displayZone = "Spires of Arak" }}
Gallery.VendorDetails[258741] = { [87775] = { price = { currencyID = 823, amount = 800 }, displayZone = "Spires of Arak" }}
Gallery.VendorDetails[258745] = { [87775] = { price = { currencyID = 823, amount = 1500 }, displayZone = "Spires of Arak" }}
Gallery.VendorDetails[258748] = { [87775] = { price = { currencyID = 823, amount = 2000 }, displayZone = "Spires of Arak" }}
Gallery.VendorDetails[258749] = { [87775] = { price = { currencyID = 823, amount = 1200 }, displayZone = "Spires of Arak" }}
Gallery.VendorDetails[246864] = { [89939] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Azsuna" }}

Gallery.VendorDetails[250112] = { [93550] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Acherus: The Ebon Hold" }}
Gallery.VendorDetails[250113] = { [93550] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Acherus: The Ebon Hold" }}
Gallery.VendorDetails[250114] = { [93550] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Acherus: The Ebon Hold" }}
Gallery.VendorDetails[250115] = { [93550] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Acherus: The Ebon Hold" }}
Gallery.VendorDetails[250123] = { [93550] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Acherus: The Ebon Hold" }}
Gallery.VendorDetails[250124] = { [93550] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Acherus: The Ebon Hold" }}
Gallery.VendorDetails[260584] = { [93550] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Acherus: The Ebon Hold" }}

Gallery.VendorDetails[247912] = { [93971] = { price = { currencyID = 1155, amount = 250 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247919] = { [93971] = { price = { currencyID = 1155, amount = 150 }, displayZone = "Suramar" }}

Gallery.VendorDetails[250230] = { [100196] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Eastern Plaguelands" }}
Gallery.VendorDetails[250231] = { [100196] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Eastern Plaguelands" }}
Gallery.VendorDetails[250232] = { [100196] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Eastern Plaguelands" }}
Gallery.VendorDetails[250233] = { [100196] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Eastern Plaguelands" }}
Gallery.VendorDetails[250234] = { [100196] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Eastern Plaguelands" }}
Gallery.VendorDetails[250235] = { [100196] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Eastern Plaguelands" }}
Gallery.VendorDetails[250236] = { [100196] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Eastern Plaguelands" }}

Gallery.VendorDetails[245549] = { [103693] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Trueshot Lodge" }}
Gallery.VendorDetails[248011] = { [103693] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Trueshot Lodge" }}
Gallery.VendorDetails[250110] = { [103693] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Trueshot Lodge" }}
Gallery.VendorDetails[250125] = { [103693] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Trueshot Lodge" }}
Gallery.VendorDetails[250126] = { [103693] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Trueshot Lodge" }}
Gallery.VendorDetails[250127] = { [103693] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Trueshot Lodge" }}
Gallery.VendorDetails[250128] = { [103693] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Trueshot Lodge" }}

Gallery.VendorDetails[250307] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 6000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250402] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 12000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250403] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 18000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250404] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250405] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250406] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 18000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250407] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250622] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250689] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 6000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250690] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[250693] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 18000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[251778] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 18000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[251779] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 18000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[252753] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[256677] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 3000 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[256678] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 1500 } }, displayZone = " Dalaran Sewers" } }
Gallery.VendorDetails[258299] = { [105333] = { price = { { currencyID = 1508, amount = 50 }, { currencyID = 1220, amount = 12000 } }, displayZone = " Dalaran Sewers" } }

Gallery.VendorDetails[250783] = { [105986] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Dalaran" }}
Gallery.VendorDetails[250784] = { [105986] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Dalaran" }}
Gallery.VendorDetails[250785] = { [105986] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Dalaran" }}
Gallery.VendorDetails[250786] = { [105986] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Dalaran" }}
Gallery.VendorDetails[250787] = { [105986] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Dalaran" }}
Gallery.VendorDetails[250788] = { [105986] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Dalaran" }}
Gallery.VendorDetails[260776] = { [105986] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Dalaran" }}

Gallery.VendorDetails[243290] = { [106902] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Exalted" } }}
Gallery.VendorDetails[243359] = { [106902] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Revered" } }}
Gallery.VendorDetails[245270] = { [106902] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Revered" } }}
Gallery.VendorDetails[245450] = { [106902] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Exalted" } }}
Gallery.VendorDetails[245452] = { [106902] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Honored" } }}
Gallery.VendorDetails[245454] = { [106902] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Friendly" } }}
Gallery.VendorDetails[245458] = { [106902] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Friendly" } }}
Gallery.VendorDetails[248985] = { [106902] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Highmountain", requirement = { type = "reputation", faction = "Highmountain Tribe", rank = "Honored" } }}

Gallery.VendorDetails[245405] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[245409] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[245453] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[245456] = { [108017] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[245457] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[245460] = { [108017] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[245461] = { [108017] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[256913] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[257397] = { [108017] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[257721] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[257723] = { [108017] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[260698] = { [108017] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[257401] = { [108017] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[257722] = { [108017] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[264477] = { [108017] = { priceText = "450 ", displayZone = "Highmountain" }}
Gallery.VendorDetails[258219] = { [108537] = { priceText = "25 ", displayZone = "Highmountain" }}
Gallery.VendorDetails[258221] = { [108537] = { price = { currencyID = 1220, amount = 450 }, displayZone = "Highmountain" }}
Gallery.VendorDetails[258223] = { [108537] = { priceText = "50 ", displayZone = "Highmountain" }}
Gallery.VendorDetails[245258] = { [109306] = { price = { currencyID = 1220, amount = 800 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245698] = { [109306] = { price = { currencyID = 1220, amount = 150 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245699] = { [109306] = { price = { currencyID = 1220, amount = 75 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[250914] = { [112318] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[250915] = { [112318] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[250916] = { [112318] = { price = { currencyID = 1220, amount = 500 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[250918] = { [112318] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[251014] = { [112318] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[251015] = { [112318] = { price = { currencyID = 1220, amount = 500 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[257403] = { [112318] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "The Maelstrom" }}
Gallery.VendorDetails[245550] = { [112323] = { price = { currencyID = 1220, amount = 500 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[246216] = { [112323] = { price = { currencyID = 1220, amount = 500 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[250111] = { [112323] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[250133] = { [112323] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[250134] = { [112323] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[251013] = { [112323] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[260581] = { [112323] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "The Dreamgrove" }}
Gallery.VendorDetails[248935] = { [112338] = { price = { currencyID = 1220, amount = 500 }, displayZone = "The Wandering Isle" }}
Gallery.VendorDetails[248936] = { [112338] = { price = { currencyID = 1220, amount = 500 }, displayZone = "The Wandering Isle" }}
Gallery.VendorDetails[248942] = { [112338] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "The Wandering Isle" }}
Gallery.VendorDetails[248958] = { [112338] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "The Wandering Isle" }}
Gallery.VendorDetails[256679] = { [112338] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "The Wandering Isle" }}
Gallery.VendorDetails[262619] = { [112338] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "The Wandering Isle" }}
Gallery.VendorDetails[249458] = { [112392] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[249460] = { [112392] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[249461] = { [112392] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[249464] = { [112392] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[249466] = { [112392] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[249551] = { [112392] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[257396] = { [112392] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Skyhold" }}
Gallery.VendorDetails[250302] = { [112401] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[250303] = { [112401] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[250304] = { [112401] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[250789] = { [112401] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[250790] = { [112401] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[250791] = { [112401] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[250792] = { [112401] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[251636] = { [112401] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Netherlight Temple" }}
Gallery.VendorDetails[249457] = { [112407] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[249459] = { [112407] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[249462] = { [112407] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[249463] = { [112407] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[249518] = { [112407] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[249690] = { [112407] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[256675] = { [112407] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Mardum, the Shattered Abyss" }}
Gallery.VendorDetails[248940] = { [112434] = { price = { currencyID = 1220, amount = 5000 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[248943] = { [112434] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[248959] = { [112434] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[248960] = { [112434] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[249004] = { [112434] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[256907] = { [112434] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[264242] = { [112434] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Dreadscar Rift" }}
Gallery.VendorDetails[245429] = { [112440] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[250130] = { [112440] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[250131] = { [112440] = { price = { currencyID = 1220, amount = 1500 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[250132] = { [112440] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[250239] = { [112440] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[250306] = { [112440] = { price = { currencyID = 1220, amount = 2500 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[256674] = { [112440] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Hall of the Guardian" }}
Gallery.VendorDetails[238863] = { [112634] = { price = { currencyID = 1220, amount = 300 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245260] = { [112634] = { price = { currencyID = 1220, amount = 400 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[246851] = { [112716] = { priceText = "15000 ", displayZone = "Dalaran" }}
Gallery.VendorDetails[244536] = { [115736] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Exalted" } }}
Gallery.VendorDetails[246850] = { [115736] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Exalted" } }}
Gallery.VendorDetails[247844] = { [115736] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Honored" } }}
Gallery.VendorDetails[247845] = { [115736] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Honored" } }}
Gallery.VendorDetails[247847] = { [115736] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Revered" } }}
Gallery.VendorDetails[247910] = { [115736] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Friendly" } }}
Gallery.VendorDetails[247921] = { [115736] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Friendly" } }}
Gallery.VendorDetails[247924] = { [115736] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Revered" } }}
Gallery.VendorDetails[256331] = { [115805] = { priceText = "450 ", displayZone = "Burning Steppes" }}
Gallery.VendorDetails[245422] = { [127151] = { priceText = "800 ", displayZone = "the vindicaar" }}
Gallery.VendorDetails[251480] = { [127151] = { priceText = "300 ", displayZone = "the vindicaar " }}
Gallery.VendorDetails[245413] = { [135459] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Nazmir", requirement = { type = "reputation", faction = "Talanji's Expedition", rank = "Honored" } }}
Gallery.VendorDetails[245488] = { [135459] = { price = { currencyID = 1560, amount = 500 }, displayZone = "Nazmir" }}
Gallery.VendorDetails[245495] = { [135459] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Nazmir", requirement = { type = "reputation", faction = "Talanji's Expedition", rank = "Revered" } }}
Gallery.VendorDetails[245500] = { [135459] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Nazmir", requirement = { type = "reputation", faction = "Talanji's Expedition", rank = "Revered" } }}
Gallery.VendorDetails[257394] = { [135459] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Nazmir" }}
Gallery.VendorDetails[246222] = { [135808] = { price = { currencyID = 1560, amount = 75 }, displayZone = "Tiragarde Sound", requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = "Honored" } }}
Gallery.VendorDetails[252036] = { [135808] = { price = { currencyID = 1560, amount = 500 }, displayZone = "Tiragarde Sound", requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = "Revered" } }}
Gallery.VendorDetails[252387] = { [135808] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Tiragarde Sound", requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = "Friendly" } }}
Gallery.VendorDetails[252388] = { [135808] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Tiragarde Sound", requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = "Friendly" } }}
Gallery.VendorDetails[252402] = { [135808] = { price = { currencyID = 1560, amount = 450 }, displayZone = "Tiragarde Sound", requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = "Revered" } }}
Gallery.VendorDetails[245291] = { [144129] = { priceText = "2500 ", displayZone = "Blackrock Depths" }}
Gallery.VendorDetails[245482] = { [148923] = { price = { currencyID = 1710, amount = 250 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[241067] = { [148924] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245464] = { [148924] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245471] = { [148924] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245472] = { [148924] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245474] = { [148924] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245476] = { [148924] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245477] = { [148924] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}

Gallery.VendorDetails[246479] = { [150716] = { price = { { itemID = 166846, amount = 100 } }, displayZone = "Mechagon" }}
Gallery.VendorDetails[246480] = { [150716] = { price = { { itemID = 168327, amount = 5 }, { itemID = 168832, amount = 5 }, { money = 10000000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Exalted" } }}
Gallery.VendorDetails[246483] = { [150716] = { price = { { itemID = 166970, amount = 2 }, { itemID = 168327, amount = 1 }, { money = 5000000 } }, displayZone = "Mechagon" }}
Gallery.VendorDetails[246484] = { [150716] = { price = { { itemID = 166970, amount = 1 }, { money = 1000000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Friendly" } } }
Gallery.VendorDetails[246497] = { [150716] = { price = { { itemID = 166970, amount = 1 }, { money = 1000000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Friendly" } } }
Gallery.VendorDetails[246498] = { [150716] = { price = { { itemID = 166970, amount = 1 }, { money = 1000000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Honored" } } }
Gallery.VendorDetails[246499] = { [150716] = { price = { { itemID = 166970, amount = 2 }, { money = 1500000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Revered" } } }
Gallery.VendorDetails[246501] = { [150716] = { price = { { itemID = 168832, amount = 2 }, { money = 2000000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Exalted" } } }
Gallery.VendorDetails[246503] = { [150716] = { price = { { itemID = 169610, amount = 2 }, { money = 1000000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Honored" } } }
Gallery.VendorDetails[246598] = { [150716] = { price = { { itemID = 169610, amount = 1 } }, displayZone = "Mechagon" } }
Gallery.VendorDetails[246603] = { [150716] = { price = { { itemID = 166846, amount = 50 } }, displayZone = "Mechagon" } }
Gallery.VendorDetails[246605] = { [150716] = { price = { { itemID = 168327, amount = 2 }, { money = 1500000 } }, displayZone = "Mechagon", requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = "Revered" } } }
Gallery.VendorDetails[246701] = { [150716] = { price = { { itemID = 169610, amount = 2 }, { money = 2000000 } }, displayZone = "Mechagon" } }
Gallery.VendorDetails[246703] = { [150716] = { price = { { itemID = 169610, amount = 3 }, { money = 3000000 } }, displayZone = "Mechagon" } }
Gallery.VendorDetails[247667] = { [152194] = { price = { currencyID = 1803, amount = 100000 }, displayZone = "Chamber of Heart" } }
Gallery.VendorDetails[247668] = { [152194] = { price = { currencyID = 1803, amount = 100000 }, displayZone = "Chamber of Heart" } }
Gallery.VendorDetails[248125] = { [162804] = { price = { currencyID = 1767, amount = 10000 }, displayZone = "The Maw" } }
Gallery.VendorDetails[245501] = { [174710] = { price = { currencyID = 1813, amount = 1500 }, displayZone = "Revendreth" } }
Gallery.VendorDetails[276083] = { [255495] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Silvermoon City" } }
Gallery.VendorDetails[271158] = { [255495] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Silvermoon City", requirement = { type = "renown", faction = "Ritual Sites", rank = 7 } }}
Gallery.VendorDetails[273135] = { [255495] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Silvermoon City", requirement = { type = "renown", faction = "Ritual Sites", rank = 3 } }}
Gallery.VendorDetails[273142] = { [255495] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Silvermoon City", requirement = { type = "renown", faction = "Ritual Sites", rank = 3 } }}
Gallery.VendorDetails[273147] = { [255495] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Silvermoon City", requirement = { type = "renown", faction = "Ritual Sites", rank = 3 } }}
Gallery.VendorDetails[273157] = { [255495] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Silvermoon City", requirement = { type = "renown", faction = "Ritual Sites", rank = 3 } }}
Gallery.VendorDetails[273159] = { [255495] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City", requirement = { type = "renown", faction = "Ritual Sites", rank = 3 } }}


Gallery.VendorDetails[238975] = {
[189226] = { price = { currencyID = 2003, amount = 750 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 24" } },
[188265] = { price = { currencyID = 2003, amount = 750 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 24" } },
}
Gallery.VendorDetails[245283] = {
[189226] = { price = { currencyID = 2003, amount = 400 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 16" } },
[188265] = { price = { currencyID = 2003, amount = 400 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 16" } },
}
Gallery.VendorDetails[245285] = {
[189226] = { price = { currencyID = 2003, amount = 100 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 16" } },
[188265] = { price = { currencyID = 2003, amount = 100 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 16" } },
}
Gallery.VendorDetails[245286] = {
[189226] = { price = { currencyID = 2003, amount = 250 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 10" } },
[188265] = { price = { currencyID = 2003, amount = 250 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 10" } },
}
Gallery.VendorDetails[245287] = {
[189226] = { price = { currencyID = 2003, amount = 250 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 10" } },
[188265] = { price = { currencyID = 2003, amount = 250 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 10" } },
}
Gallery.VendorDetails[245288] = {
[189226] = { price = { currencyID = 2003, amount = 250 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 10" } },
[188265] = { price = { currencyID = 2003, amount = 250 }, displayZone = "The Waking Shores", requirement = { type = "reputation", faction = "Dragonscale Expedition", rank = "Renown 10" } },
}
Gallery.VendorDetails[246863] = { [191025] = { price = { currencyID = 2003, amount = 500 }, displayZone = "The Waking Shores" }}
Gallery.VendorDetails[276321] = { [265581] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Val or Naigtal" }}	
Gallery.VendorDetails[276318] = { [265581] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Val or Naigtal" }}	
Gallery.VendorDetails[276316] = { [265581] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Val or Naigtal" }}	
Gallery.VendorDetails[267211] = { [265581] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Val or Naigtal" }}	
Gallery.VendorDetails[276429] = { [265581] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Val or Naigtal" }}	
Gallery.VendorDetails[276432] = { [265581] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Val or Naigtal" }}			
Gallery.VendorDetails[250912] = { [193659] = { price = { currencyID = 2003, amount = 600 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[249545] = { [196637] = { priceText = "250 ", displayZone = "Valdrakken" }}
Gallery.VendorDetails[249547] = { [196637] = { priceText = "250 ", displayZone = "Valdrakken" }}
Gallery.VendorDetails[249548] = { [196637] = { priceText = "250 ", displayZone = "Valdrakken" }}
Gallery.VendorDetails[249549] = { [196637] = { price = { currencyID = 2003, amount = 200 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[249824] = { [196637] = { priceText = "250 ", displayZone = "Valdrakken" }}
Gallery.VendorDetails[248124] = { [199605] = { price = { currencyID = 2003, amount = 7500 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[248117] = { [209192] = { price = { currencyID = 2657, amount = 7000 }, displayZone = "The Azure Span / Thaldraszus" }}
Gallery.VendorDetails[248105] = { [209220] = { price = { currencyID = 2003, amount = 150 }, displayZone = "Thaldraszus" }}
Gallery.VendorDetails[255673] = { [210608] = { price = { { itemID = 207026, amount = 500 } }, displayZone = "The Dragon Isles", sourceAction = "Dreamsurge Event", note = "Possible Locations:\n\n• The Waking Shores\n• Ohn'ahran Plains\n• The Azure Span\n• Thaldraszus\n\n|cffFFD700Right-click to pin locations on the map|r" }}


Gallery.VendorDetails[245515] = {
[211065] = { priceText = "75 ", displayZone = "Ruins of Gilneas" },
[216888] = { priceText = "75 ", displayZone = "Ruins of Gilneas" },
}
Gallery.VendorDetails[245516] = {
[211065] = { priceText = "75 ", displayZone = "Ruins of Gilneas" },
[216888] = { priceText = "75 ", displayZone = "Ruins of Gilneas" },
}
Gallery.VendorDetails[245520] = {
[211065] = { priceText = "150 ", displayZone = "Ruins of Gilneas" },
[216888] = { priceText = "150 ", displayZone = "Ruins of Gilneas" },
}
Gallery.VendorDetails[245604] = {
[211065] = { priceText = "100 ", displayZone = "Ruins of Gilneas" },
[216888] = { priceText = "100 ", displayZone = "Ruins of Gilneas" },
}
Gallery.VendorDetails[245617] = {
[211065] = { priceText = "100 ", displayZone = "Ruins of Gilneas" },
[216888] = { priceText = "100 ", displayZone = "Ruins of Gilneas" },
}
Gallery.VendorDetails[258301] = {
[211065] = { priceText = "125 ", displayZone = "Ruins of Gilneas" },
[216888] = { priceText = "125 ", displayZone = "Ruins of Gilneas" },
}
Gallery.VendorDetails[245655] = { 
[252312] = {  price = { currencyID = 2003, amount = 10 }, displayZone = " Dornogal" },
[216285] = { price = { currencyID = 2003, amount = 10 }, displayZone = "Amirdrassil" },
} 
Gallery.VendorDetails[246091] = { [216284] = { price = { currencyID = 2003, amount = 500 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[248759] = { [216284] = { price = { currencyID = 2003, amount = 250 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[245625] = { [216285] = { price = { currencyID = 2003, amount = 350 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[245704] = { [216285] = { price = { currencyID = 2003, amount = 250 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[246089] = { [216285] = { price = { currencyID = 2003, amount = 350 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[246100] = { [216285] = { price = { currencyID = 2003, amount = 500 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[248401] = { [216285] = { price = { currencyID = 2003, amount = 500 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[251022] = { [216285] = { price = { currencyID = 2003, amount = 300 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[257352] = { [216286] = { price = { currencyID = 2003, amount = 300 }, displayZone = "Amirdrassil" }}
Gallery.VendorDetails[260583] = { [217642] = { price = { currencyID = 2815, amount = 500 }, displayZone = "Hallowfall" }}
Gallery.VendorDetails[246866] = { [218202] = { price = { currencyID = 3056, amount = 1500 }, displayZone = "City of Threads" }}
Gallery.VendorDetails[247750] = {
[219217] = { price = { currencyID = 1792, amount = 2500 }, displayZone = "Dornogal" },
[254603] = { price = { currencyID = 1792, amount = 2500 }, displayZone = "Stormwind City" },
}
Gallery.VendorDetails[253170] = {
[219217] = { price = { currencyID = 1792, amount = 750 }, displayZone = "Dornogal" },
[254603] = { price = { currencyID = 1792, amount = 750 }, displayZone = "Stormwind City" },
}
Gallery.VendorDetails[246867] = { [219318] = { price = { currencyID = 2815, amount = 750 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[253162] = {
[221390] = { price = { currencyID = 2815, amount = 600 }, displayZone = "The Ringing Deeps" },
[252887] = { price = { currencyID = 2815, amount = 600 }, displayZone = "The Ringing Deeps" },
}
--Auditor Balwurz
Gallery.VendorDetails[245295] = { [223728] = { price = { currencyID = 2815, amount = 250 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[245296] = { [223728] = { price = { currencyID = 2815, amount = 250 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[245297] = { [223728] = { price = { currencyID = 2815, amount = 250 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[245561] = { [223728] = { price = { currencyID = 2815, amount = 200 }, displayZone = "Dornogal" }}

Gallery.VendorDetails[246707] = { [226205] = { price = { { itemID = 225557, amount = 100 } }, displayZone = "Isle of Dorn" } }
Gallery.VendorDetails[245309] = { [226994] = { price = { { itemID = 227673, amount = 15 } }, displayZone = "Undermine" } }
--Cartels of Undermine
Gallery.VendorDetails[245307] = { [231396] = { price = { currencyID = 2815, amount = 800 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Darkfuse Solutions", rank = "Honored" } }}
Gallery.VendorDetails[256327] = { [231396] = { price = { currencyID = 2815, amount = 450 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Darkfuse Solutions", rank = "Friendly" } }}
Gallery.VendorDetails[248758] = { [231405] = { price = { currencyID = 2815, amount = 900 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Blackwater Cartel", rank = "Revered" } }}
Gallery.VendorDetails[255642] = { [231405] = { price = { currencyID = 2815, amount = 475 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Blackwater Cartel", rank = "Honored" } }}
Gallery.VendorDetails[245313] = { [231406] = { price = { currencyID = 2815, amount = 450 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Bilgewater Cartel", rank = "Honored" } }}
Gallery.VendorDetails[255674] = { [231406] = { price = { currencyID = 2815, amount = 450 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Bilgewater Cartel", rank = "Honored" } }}
Gallery.VendorDetails[245311] = { [231407] = { price = { currencyID = 2815, amount = 600 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Venture Company", rank = "Honored" } }}
Gallery.VendorDetails[255647] = { [231407] = { price = { currencyID = 2815, amount = 650 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Venture Company", rank = "Revered" } }}
Gallery.VendorDetails[245321] = { [231408] = { price = { currencyID = 2815, amount = 400 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Steamwheedle Cartel", rank = "Friendly" } }}
Gallery.VendorDetails[255641] = { [231408] = { price = { currencyID = 2815, amount = 500 }, displayZone = "The Cartels of Undermine", requirement = { type = "reputation", faction = "Steamwheedle Cartel", rank = "Honored" } }}

Gallery.VendorDetails[247751] = { [235252] = { price = { currencyID = 2815, amount = 2000 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258306] = { [235252] = { price = { currencyID = 2815, amount = 1000 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258320] = { [235252] = { price = { currencyID = 2815, amount = 1000 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258666] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258667] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258668] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258669] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258766] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258767] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258835] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258836] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[258885] = { [235252] = { price = { currencyID = 2815, amount = 800 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[260582] = { [235314] = { price = { currencyID = 2815, amount = 500 }, displayZone = "K'aresh" }}
Gallery.VendorDetails[239213] = { [235621] = { priceText = "1000 ", displayZone = "Liberation of Undermine" }}
Gallery.VendorDetails[245302] = { [235621] = { priceText = "7777 ", displayZone = "Liberation of Undermine" }}
Gallery.VendorDetails[256328] = { [239333] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Undermine" }}
Gallery.VendorDetails[256924] = { [240279] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[256926] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[256927] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[256933] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[256934] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[258290] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[258549] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[260202] = { [240279] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[260514] = { [240279] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[260515] = { [240279] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[260516] = { [240279] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[263318] = { [240279] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[263320] = { [240279] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264333] = { [240279] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264350] = { [240279] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[246402] = { [240407] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[246408] = { [240407] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[246959] = { [240407] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Harandar" }}
Gallery.VendorDetails[249768] = { [240407] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[251980] = { [240407] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263019] = { [240407] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263039] = { [240407] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263194] = { [240407] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263195] = { [240407] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264267] = { [240407] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264268] = { [240407] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264269] = { [240407] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[245290] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[245941] = { [240838] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[245985] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[249559] = { [240838] = { price = { currencyID = 3316, amount = 2500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[256040] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[257421] = { [240838] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[257422] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263205] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263206] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263223] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263228] = { [240838] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263229] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263232] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263234] = { [240838] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[264264] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[264265] = { [240838] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}

Gallery.VendorDetails[245293] = { [240852] = { price = { currencyID = 2815, amount = 1200 }, displayZone = "Hallowfall" }}

Gallery.VendorDetails[263224] = { [242723] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263225] = { [242723] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}

Gallery.VendorDetails[263212] = { [242724] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263216] = { [242724] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}

Gallery.VendorDetails[263203] = { [242725] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[246692] = { [242726] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[250772] = { [242726] = { price = { currencyID = 3379, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[252390] = { [246721] = { price = { currencyID = 1560, amount = 750 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252391] = { [246721] = { price = { currencyID = 1560, amount = 1000 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252393] = { [246721] = { price = { currencyID = 1560, amount = 800 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252404] = { [246721] = { price = { currencyID = 1560, amount = 600 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[258765] = { [246721] = { price = { currencyID = 1560, amount = 175 }, displayZone = "Tiragarde Sound" }}
--Void Researcher Anomander
Gallery.VendorDetails[248964] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262462] = { [248328] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262463] = { [248328] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262466] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262473] = { [248328] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262607] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262609] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[263499] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264337] = { [248328] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264339] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264341] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264344] = { [248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264351] = { [248328] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264509] = { [248328] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[267209] = {
[248328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" },
[259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" },
}
Gallery.VendorDetails[254400] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254401] = { [248525] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254402] = { [248525] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254403] = { [248525] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254404] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254405] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254406] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254407] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254408] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254409] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254410] = { [248525] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254411] = { [248525] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254412] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254413] = { [248525] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254415] = { [248525] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254416] = { [248525] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[254766] = { [248525] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[244654] = { [248594] = { price = { currencyID = 1155, amount = 100 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Friendly" } }}
Gallery.VendorDetails[244676] = { [248594] = { price = { currencyID = 1155, amount = 200 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Honored" } }}
Gallery.VendorDetails[244677] = { [248594] = { price = { currencyID = 1155, amount = 300 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Revered" } }}
Gallery.VendorDetails[244678] = { [248594] = { price = { currencyID = 1155, amount = 100 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Friendly" } }}
Gallery.VendorDetails[246001] = { [248594] = { price = { currencyID = 1155, amount = 200 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Honored" } }}
Gallery.VendorDetails[246002] = { [248594] = { price = { currencyID = 1155, amount = 300 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Revered" } }}
Gallery.VendorDetails[262453] = {
[253596] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores"},
[248854] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Founder's Point"},
}
Gallery.VendorDetails[246686] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[246741] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[246838] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[248402] = { [249684] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[248403] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[248405] = { [249684] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[248406] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[248407] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[251472] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[251473] = { [249684] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[251474] = { [249684] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[251475] = { [249684] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[252039] = { [249684] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[252040] = { [249684] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[252041] = { [249684] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250627] = { [250820] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250694] = { [250820] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250695] = { [250820] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250696] = { [250820] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250697] = { [250820] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250698] = { [250820] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250699] = { [250820] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250700] = { [250820] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250701] = { [250820] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250702] = { [250820] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250703] = { [250820] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[250704] = { [250820] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[245284] = { [250982] = { price = { currencyID = 2815, amount = 3000 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[245330] = { [250982] = { price = { currencyID = 2815, amount = 3000 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[251997] = { [250982] = { price = { currencyID = 2815, amount = 5000 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[257418] = { [251091] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[263038] = { [251259] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264243] = { [251259] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264245] = { [251259] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Harandar" }}
Gallery.VendorDetails[243312] = { [251911] = { price = { currencyID = 2815, amount = 700 }, displayZone = "Undermine" }}
Gallery.VendorDetails[243321] = { [251911] = { price = { currencyID = 2815, amount = 800 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245303] = { [251911] = { price = { currencyID = 2815, amount = 800 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245306] = { [251911] = { price = { currencyID = 2815, amount = 900 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245308] = { [251911] = { price = { currencyID = 2815, amount = 750 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245310] = { [251911] = { price = { currencyID = 2815, amount = 800 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245314] = { [251911] = { price = { currencyID = 2815, amount = 650 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245318] = { [251911] = { price = { currencyID = 2815, amount = 450 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245319] = { [251911] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245324] = { [251911] = { price = { currencyID = 2815, amount = 1500 }, displayZone = "Undermine" }}
Gallery.VendorDetails[245325] = { [251911] = { price = { currencyID = 2815, amount = 1000 }, displayZone = "Undermine" }}
Gallery.VendorDetails[260700] = { [251911] = { price = { currencyID = 2815, amount = 300 }, displayZone = "Undermine" }}
Gallery.VendorDetails[239606] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[241062] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245463] = { [251921] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245465] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245466] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245467] = { [251921] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245469] = { [251921] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245470] = { [251921] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245473] = { [251921] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245475] = { [251921] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245478] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "The Honorbound", rank = "Honored" } }}
Gallery.VendorDetails[245479] = { [251921] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "The Honorbound", rank = "Revered" } }}
Gallery.VendorDetails[245480] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "The Honorbound", rank = "Honored" } }}
Gallery.VendorDetails[245481] = { [251921] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "The Honorbound", rank = "Revered" } }}
Gallery.VendorDetails[245483] = { [251921] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245411] = { [252043] = { priceText = "2000 ", displayZone = "Dalaran" }}
Gallery.VendorDetails[253251] = { [252043] = { priceText = "200 ", displayZone = "Dalaran" }}


Gallery.VendorDetails[256168] = { [252312] = { price = { currencyID = 2003, amount = 10 }, displayZone = " Dornogal" }} --Draconic Sconce
Gallery.VendorDetails[247908] = { [252312] = { price = { { priceText = "30" }, { currencyID = 1220, amount = 50 } }, displayZone = "Dornogal" }}--Nightborne Lantern
Gallery.VendorDetails[253168] = { 
[252312] = { priceText = "20 ", displayZone = "Dornogal" },
[50488] = { priceText = "20 ", displayZone = "Orgrimmar" },
	}--Earthen Storage Crate
Gallery.VendorDetails[245259] = { [252312] = { priceText = "50 ", displayZone = "Dornogal" }} --Small Val'sharah Bookcase
Gallery.VendorDetails[246487] = { [252312] = { priceText = "75 ", displayZone = "Dornogal" }} --Gnomish Tesla Coil
Gallery.VendorDetails[246601] = { [252312] = { price = { { itemID = 166846, amount = 10 } }, displayZone = "Dornogal" }} --Bolt Chair
Gallery.VendorDetails[247915] = { [252312] = { priceText = "100 ", displayZone = "Dornogal" }} --Square Suramar Table
Gallery.VendorDetails[248116] = { [252312] = { priceText = "75 ", displayZone = "Dornogal" }} --Valdrakken Chandelier
Gallery.VendorDetails[248934] = { [252312] = { priceText = "1500 ", displayZone = "Dornogal" }} --Golden Cloud Serpent Treasure Chest
Gallery.VendorDetails[253173] = { [252312] = { priceText = "20 ", displayZone = "Dornogal" }} --Meadery Storage Barrel

Gallery.VendorDetails[245984] = { [252313] = { price = { currencyID = 1560, amount = 350 }, displayZone = "Stormsong Valley" }}
Gallery.VendorDetails[252394] = { [252313] = { price = { currencyID = 1560, amount = 550 }, displayZone = "Stormsong Valley", requirement = { type = "reputation", faction = "Storm's Wake", rank = "Revered" } }}
Gallery.VendorDetails[252395] = { [252313] = { price = { currencyID = 1560, amount = 450 }, displayZone = "Stormsong Valley" }}
Gallery.VendorDetails[252396] = { [252313] = { price = { currencyID = 1560, amount = 125 }, displayZone = "Stormsong Valley", requirement = { type = "reputation", faction = "Storm's Wake", rank = "Friendly" } }}
Gallery.VendorDetails[252398] = { [252313] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Stormsong Valley", requirement = { type = "reputation", faction = "Storm's Wake", rank = "Honored" } }}
Gallery.VendorDetails[252652] = { [252313] = { price = { currencyID = 1560, amount = 800 }, displayZone = "Stormsong Valley", requirement = { type = "reputation", faction = "Storm's Wake", rank = "Revered" } }}
Gallery.VendorDetails[252655] = { [252313] = { price = { currencyID = 1560, amount = 175 }, displayZone = "Stormsong Valley" }}
Gallery.VendorDetails[252392] = { [252316] = { price = { currencyID = 1560, amount = 250 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252405] = { [252316] = { price = { currencyID = 1560, amount = 250 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[243113] = { [252326] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "Zandalari Empire", rank = "Honored" } }}
Gallery.VendorDetails[243130] = { [252326] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "Zandalari Empire", rank = "Honored" } }}
Gallery.VendorDetails[244325] = { [252326] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[244326] = { [252326] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245263] = { [252326] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245417] = { [252326] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245485] = { [252326] = { price = { currencyID = 1560, amount = 1000 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245486] = { [252326] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245487] = { [252326] = { price = { currencyID = 1560, amount = 500 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245489] = { [252326] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245490] = { [252326] = { price = { currencyID = 1560, amount = 600 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245491] = { [252326] = { price = { currencyID = 1560, amount = 600 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245493] = { [252326] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245494] = { [252326] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245497] = { [252326] = { price = { currencyID = 1560, amount = 500 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[245521] = { [252326] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "Zandalari Empire", rank = "Friendly" } }}
Gallery.VendorDetails[245522] = { [252326] = { price = { currencyID = 1560, amount = 1200 }, displayZone = "Zuldazar" }}
Gallery.VendorDetails[256919] = { [252326] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "Zandalari Empire", rank = "Revered" } }}
Gallery.VendorDetails[257399] = { [252326] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Zuldazar", requirement = { type = "reputation", faction = "Zandalari Empire", rank = "Revered" } }}
Gallery.VendorDetails[245271] = { [252345] = { price = { currencyID = 1560, amount = 800 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252386] = { [252345] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252400] = { [252345] = { price = { currencyID = 1560, amount = 500 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252403] = { [252345] = { price = { currencyID = 1560, amount = 550 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252406] = { [252345] = { price = { currencyID = 1560, amount = 375 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252653] = { [252345] = { price = { currencyID = 1560, amount = 650 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252654] = { [252345] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[252754] = { [252345] = { price = { currencyID = 1560, amount = 800 }, displayZone = "Tiragarde Sound" }}
Gallery.VendorDetails[245615] = { [252498] = { price = { currencyID = 1220, amount = 350 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245616] = { [252498] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[262664] = { [252605] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[262665] = { [252605] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[262666] = { [252605] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[262667] = { [252605] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[262884] = { [252605] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[262907] = { [252605] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263043] = { [252605] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263044] = { [252605] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263045] = { [252605] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263046] = { [252605] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263047] = { [252605] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263048] = { [252605] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
--Morta Gage	
Gallery.VendorDetails[253174] = { [252873] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253175] = { [252873] = { price = { currencyID = 3316, amount = 2500 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253176] = { [252873] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253177] = { [252873] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253178] = { [252873] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253179] = { [252873] = { price = { currencyID = 3316, amount = 2500 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253542] = { [252873] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253543] = { [252873] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253544] = { [252873] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253598] = { [252873] = { price = { currencyID = 3316, amount = 8000 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[253700] = { [252873] = { price = { currencyID = 3316, amount = 2500 }, displayZone = "Arcantina" }}
Gallery.VendorDetails[278038] = { [252873] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Arcantina" }}
--Gallery.VendorDetails[278044] = { [252873] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Arcantina"}}  Removed currently
Gallery.VendorDetails[278694] = { [252873] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Arcantina"}}
Gallery.VendorDetails[269316] = { [252873] = { priceText = "10", displayZone = "Arcantina" }}
--Chert		
Gallery.VendorDetails[253020] = { [252887] = { price = { currencyID = 2815, amount = 500 }, displayZone = "The Ringing Deeps" }}
Gallery.VendorDetails[253040] = { [252887] = { price = { currencyID = 2815, amount = 650 }, displayZone = "The Ringing Deeps" }}
Gallery.VendorDetails[253172] = { [252887] = { price = { currencyID = 2815, amount = 850 }, displayZone = "The Ringing Deeps" }}
Gallery.VendorDetails[253021] = { [252901] = { price = { currencyID = 2815, amount = 400 }, displayZone = "Isle of Dorn" }}
Gallery.VendorDetails[253035] = { [252901] = { price = { currencyID = 2815, amount = 300 }, displayZone = "Isle of Dorn" }}
Gallery.VendorDetails[253166] = { [252901] = { price = { currencyID = 2815, amount = 1100 }, displayZone = "Isle of Dorn" }}
--Garnett
Gallery.VendorDetails[253163] = { [252910] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[252757] = { [252910] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[253038] = { [252910] = { price = { currencyID = 2815, amount = 250 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[253037] = { [252910] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[253034] = { [252910] = { price = { currencyID = 2815, amount = 250 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[252756] = { [252910] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[253023] = { [252910] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Dornogal" }}
Gallery.VendorDetails[268727] = { [252910] = { price = { currencyID = 2815, amount = 350 }, displayZone = "Dornogal" }}

Gallery.VendorDetails[253602] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253603] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253604] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253605] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253607] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253608] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253614] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253615] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253616] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253617] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253618] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253619] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253620] = { [252915] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
--256828 (Dennia Silvertongue 62) 261231 (Tuuran 54) 261262 (Gabbi 54)
Gallery.VendorDetails[285216] = { 
[261231] = { priceText = "1000 ", displayZone = "Stormwind" },
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[281107] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[276873] = { 
[261231] = { priceText = "1000 ", displayZone = "Stormwind" },
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[268339] = { 
[261231] = { priceText = "2000 ", displayZone = "Stormwind" },
[256828] = { priceText = "2000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "2000 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[268337] = { 
[261231] = { priceText = "5000 ", displayZone = "Stormwind" },
[256828] = { priceText = "5000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "5000 ", displayZone = "Orgrimmar" },
	}	
Gallery.VendorDetails[268340] = { 
[261231] = { priceText = "5000 ", displayZone = "Stormwind" },
[256828] = { priceText = "5000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "5000 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[268722] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[268338] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}	
Gallery.VendorDetails[280556] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[280554] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}	

Gallery.VendorDetails[274731] = { 
[261231] = { priceText = "5000 ", displayZone = "Stormwind" },
[256828] = { priceText = "5000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "5000 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[274734] = { 
[261231] = { priceText = "5000 ", displayZone = "Stormwind" },
[256828] = { priceText = "5000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "5000 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[274736] = { 
[261231] = { priceText = "5000 ", displayZone = "Stormwind" },
[256828] = { priceText = "5000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "5000 ", displayZone = "Orgrimmar" },
	}
--collabs
Gallery.VendorDetails[264396] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[264397] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[264281] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[264282] = {
[256828] = { priceText = "750 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "750 ", displayZone = "Stormwind City" },
[261262] = { priceText = "750 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[264283] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[264278] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[263383] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[264279] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
	}
Gallery.VendorDetails[264280] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
	}	
--[[
--roofus items
Gallery.VendorDetails[259046] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[259093] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[259044] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[259045] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[259094] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[264275] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[264276] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
Gallery.VendorDetails[264277] = {
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1000 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar"  },
}
]]
Gallery.VendorDetails[244668] = { [256828] = { priceText = "15000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[245939] = { [256828] = { priceText = "15000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[246414] = { [256828] = { priceText = "15000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[248809] = { [256828] = { priceText = "15000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[252666] = { [256828] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[252667] = { [256828] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[252668] = { [256828] = { priceText = "5000 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[252669] = { [256828] = { priceText = "5000 ", displayZone = "Silvermoon City" }}	
Gallery.VendorDetails[256764] = { 
[261231] = { priceText = "500 ", displayZone = "Stormwind" },
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259070] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259069] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259068] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259067] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259066] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259065] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259064] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259063] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259062] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259061] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259060] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259059] = { 
[261231] = { priceText = "250 ", displayZone = "Stormwind" },
[256828] = { priceText = "250 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "250 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259058] = { 
[261231] = { priceText = "1000 ", displayZone = "Stormwind" },
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259057] = { 
[261231] = { priceText = "1000 ", displayZone = "Stormwind" },
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259056] = { 
[261231] = { priceText = "1000 ", displayZone = "Stormwind" },
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar" },
}
Gallery.VendorDetails[259055] = { 
[261231] = { priceText = "1000 ", displayZone = "Stormwind" },
[256828] = { priceText = "1000 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "1000 ", displayZone = "Orgrimmar" },
}
	
--grrgles
Gallery.VendorDetails[263294] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}	
Gallery.VendorDetails[263298] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}
Gallery.VendorDetails[263299] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}
Gallery.VendorDetails[263301] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}
Gallery.VendorDetails[265389] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}
Gallery.VendorDetails[263303] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}
Gallery.VendorDetails[265394] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },
}
Gallery.VendorDetails[265545] = {
[256828] = { priceText = "500 ", displayZone = "Silvermoon City" },
[261262] = { priceText = "500 ", displayZone = "Orgrimmar" },
[261231] = { priceText = "500 ", displayZone = "Stormwind City" },		
}
Gallery.VendorDetails[260785] = {
[256828] = { priceText = "1500 ", displayZone = "Silvermoon City" },
[261231] = { priceText = "1500 ", displayZone = "Stormwind City" },
[261262] = { priceText = "1500 ", displayZone = "Orgrimmar"  },
}

Gallery.VendorDetails[244656] = { [252916] = { priceText = "150 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253522] = { [252917] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253523] = { [252917] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253524] = { [252917] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253525] = { [252917] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253526] = { [252917] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253599] = { [252917] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253600] = { [252917] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253601] = { [252917] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[253606] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253609] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253610] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253611] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253612] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253613] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253704] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253705] = { [252916] = { priceText = "1500 ", displayZone = "Silvermoon City" }}
Gallery.VendorDetails[254235] = { [252917] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[245448] = { [252969] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Suramar", requirement = { type = "reputation", faction = "The Nightfallen", rank = "Exalted" } }}
Gallery.VendorDetails[245558] = { [252969] = { price = { currencyID = 1220, amount = 225 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247842] = { [252969] = { price = { currencyID = 1220, amount = 600 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247843] = { [252969] = { price = { currencyID = 1220, amount = 1200 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247911] = { [252969] = { price = { currencyID = 1220, amount = 100 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247914] = { [252969] = { price = { currencyID = 1220, amount = 400 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247917] = { [252969] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Suramar" }}
Gallery.VendorDetails[248009] = { [252969] = { price = { currencyID = 1220, amount = 175 }, displayZone = "Suramar" }}
Gallery.VendorDetails[246706] = { [253067] = { price = { currencyID = 2003, amount = 100 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[247223] = { [253067] = { price = { currencyID = 2003, amount = 175 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[248103] = {
[253067] = { price = { currencyID = 2003, amount = 300 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 14" } },
[193015] = { price = { currencyID = 2003, amount = 300 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 14" } },
}
Gallery.VendorDetails[248104] = { [253067] = { price = { currencyID = 2003, amount = 150 }, displayZone = "Valdrakken" } }
Gallery.VendorDetails[248112] = {
[253067] = { price = { currencyID = 2003, amount = 400 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 6" } },
[193015] = { price = { currencyID = 2003, amount = 400 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 6" } },
}
Gallery.VendorDetails[248651] = { [253067] = { price = { currencyID = 2003, amount = 600 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[248652] = {
[253067] = { price = { currencyID = 2003, amount = 250 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 20" } },
[193015] = { price = { currencyID = 2003, amount = 250 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 20" } },
}
Gallery.VendorDetails[248653] = { [253067] = { price = { currencyID = 2003, amount = 50 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[248655] = { [253067] = { price = { currencyID = 2003, amount = 200 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[256169] = {
[253067] = { price = { currencyID = 2003, amount = 500 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 3" } },
[193015] = { price = { currencyID = 2003, amount = 500 }, displayZone = "Valdrakken", requirement = { type = "reputation", faction = "Valdrakken Accord", rank = "Renown 3" } },
}
Gallery.VendorDetails[256429] = { [253067] = { price = { currencyID = 2003, amount = 200 }, displayZone = "Valdrakken" }}
Gallery.VendorDetails[248656] = { [253086] = { price = { currencyID = 2118, amount = 1500 }, displayZone = "The Forbidden Reach" }}
Gallery.VendorDetails[246108] = {
[253227] = { priceText = "2000 ", displayZone = "Twilight Highlands", requirement = { type = "reputation", faction = "Wildhammer Clan", rank = "Honored" } },
[49386] = { priceText = "2000 ", displayZone = "Twilight Highlands", requirement = { type = "reputation", faction = "Wildhammer Clan", rank = "Honored" } },
}
Gallery.VendorDetails[246425] = {
[253227] = { priceText = "400 ", displayZone = "Twilight Highlands", requirement = { type = "reputation", faction = "Wildhammer Clan", rank = "Friendly" } },
[49386] = { priceText = "400 ", displayZone = "Twilight Highlands", requirement = { type = "reputation", faction = "Wildhammer Clan", rank = "Friendly" } },
}
Gallery.VendorDetails[246427] = { [253227] = { priceText = "1000 ", displayZone = "Twilight Highlands" }}
Gallery.VendorDetails[246428] = { [253227] = { priceText = "1500 ", displayZone = "Twilight Highlands" }}
Gallery.VendorDetails[246411] = { [253232] = { priceText = "700 ", displayZone = "Dun Morogh" }}
Gallery.VendorDetails[246412] = { [253232] = { priceText = "450 ", displayZone = "Dun Morogh" }}
Gallery.VendorDetails[245426] = { [253235] = { priceText = "700 ", displayZone = "Dun Morogh" }}
Gallery.VendorDetails[245427] = { [253235] = { priceText = "1200 ", displayZone = "Dun Morogh" }}
Gallery.VendorDetails[256425] = { [253235] = { priceText = "350 ", displayZone = "Dun Morogh" }}
Gallery.VendorDetails[238859] = {
[253387] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Exalted" } },
[106901] = { price = { currencyID = 1220, amount = 2000 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Exalted" } },
}
Gallery.VendorDetails[251494] = {
[253387] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Friendly" } },
[106901] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Friendly" } },
}	
Gallery.VendorDetails[238860] = { [253387] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[238861] = {
[253387] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Honored" } },
[106901] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Honored" } },
}
Gallery.VendorDetails[245261] = {
[253387] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Revered" } },
[106901] = { price = { currencyID = 1220, amount = 1000 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Revered" } },
}
Gallery.VendorDetails[245697] = { [253387] = { price = { currencyID = 1220, amount = 950 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245700] = { [253387] = { price = { currencyID = 1220, amount = 250 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245702] = { [253387] = { price = { currencyID = 1220, amount = 450 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245703] = { [253387] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[245739] = { [253387] = { price = { currencyID = 1220, amount = 600 }, displayZone = "Val'sharah" }}
Gallery.VendorDetails[264168] = {
[253387] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Honored" } },
[106901] = { price = { currencyID = 1220, amount = 750 }, displayZone = "Val'sharah", requirement = { type = "reputation", faction = "Dreamweavers", rank = "Honored" } },
}
Gallery.VendorDetails[245701] = { [253434] = { price = { currencyID = 1220, amount = 175 }, displayZone = "Suramar" }}
Gallery.VendorDetails[247740] = { [254603] = { price = { currencyID = 1792, amount = 2000 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247741] = { [254603] = { price = { currencyID = 1792, amount = 1000 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247744] = { [254603] = { price = { currencyID = 1792, amount = 1000 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247746] = { [254603] = { price = { currencyID = 1792, amount = 800 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247756] = { [254603] = { price = { currencyID = 1792, amount = 1000 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247757] = { [254603] = { price = { currencyID = 1792, amount = 600 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247758] = { [254603] = { price = { currencyID = 1792, amount = 1200 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247761] = { [254603] = { price = { currencyID = 1792, amount = 400 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247762] = { [254603] = { price = { currencyID = 1792, amount = 300 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247763] = { [254603] = { itemID = 137642, amount = 5, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247765] = { [254603] = { itemID = 137642, amount = 5, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247766] = { [254603] = { itemID = 137642, amount = 5, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247768] = { [254603] = { itemID = 137642, amount = 5, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247769] = { [254603] = { itemID = 137642, amount = 5, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247770] = { [254603] = { itemID = 137642, amount = 2, displayZone = "Stormwind City" }}
Gallery.VendorDetails[256896] = { [254603] = { price = { currencyID = 1792, amount = 450 }, displayZone = "Stormwind City" }}
Gallery.VendorDetails[247727] = { [254606] = { price = { currencyID = 1792, amount = 5000 }, displayZone = "Orgrimmar" }}
Gallery.VendorDetails[247745] = { [254606] = { price = { currencyID = 1792, amount = 1000 }, displayZone = "Orgrimmar" }}
Gallery.VendorDetails[247747] = { [254606] = { price = { currencyID = 1792, amount = 800 }, displayZone = "Orgrimmar" }}
Gallery.VendorDetails[247759] = { [254606] = { price = { currencyID = 1792, amount = 600 }, displayZone = "Orgrimmar" }}
Gallery.VendorDetails[247760] = { [254606] = { price = { currencyID = 1792, amount = 1200 }, displayZone = "Orgrimmar" }}
--sawtusk
Gallery.VendorDetails[253469] = { [254944] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[255648] = { [254944] = { price = { currencyID = 3316, amount = 2500 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[256925] = { [254944] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[256928] = { [254944] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264255] = { [254944] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264257] = { [254944] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264334] = { [254944] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264335] = { [254944] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264479] = { [254944] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264480] = { [254944] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264481] = { [254944] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264715] = { [254944] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[278691] = { [254944] = { price = {currencyID = 3316, amount = 250}, displayZone = "Zul'Aman"}}

Gallery.VendorDetails[264173] = {
[255095] = { priceText = "5 ", displayZone = "Zul'Aman" },
[255095] = { priceText = "5 ", displayZone = "Silvermoon City" },
}
Gallery.VendorDetails[257393] = { [255101] = { price = { currencyID = 1155, amount = 50 }, displayZone = "Suramar" }}
Gallery.VendorDetails[257598] = { [255101] = { price = { currencyID = 1155, amount = 125 }, displayZone = "Suramar" }}
Gallery.VendorDetails[245535] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[246407] = { [255114] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[246415] = { [255114] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[246416] = { [255114] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar " }}
Gallery.VendorDetails[247234] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[252045] = { [255114] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Harandar" }}
Gallery.VendorDetails[253443] = { [255114] = { price = { currencyID = 3316, amount = 1 }, displayZone = "Harandar" }}
Gallery.VendorDetails[253467] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[254319] = { [255114] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Harandar" }}
Gallery.VendorDetails[254878] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[262614] = { [255114] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[262906] = { [255114] = { price = { currencyID = 3316, amount = 1 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263020] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263037] = { [255114] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263041] = { [255114] = { price = { currencyID = 3316, amount = 1 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263196] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[263315] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264178] = { [255114] = { price = { currencyID = 3316, amount = 1 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264259] = { [255114] = { price = { currencyID = 3316, amount = 2 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264262] = { [255114] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Harandar" }}
Gallery.VendorDetails[264266] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[265792] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[266259] = { [255114] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Harandar" }}
Gallery.VendorDetails[235994] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[241617] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[241618] = {
[255216] = { priceText = "10 ", displayZone = "Founder's Point" },
[255298] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[241620] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[241621] = {
[255216] = { priceText = "25 ", displayZone = "Founder's Point" },
[255298] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[241622] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[243242] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[243243] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[243495] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244781] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245575] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245576] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245578] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245579] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245581] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245582] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245583] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245649] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246249] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246250] = {
[255216] = { priceText = "125 ", displayZone = "Founder's Point" },
[255298] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246251] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246252] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246253] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246254] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246255] = {
[255216] = { priceText = "125 ", displayZone = "Founder's Point" },
[255298] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246256] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246257] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246258] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246431] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246691] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246711] = {
[255216] = { priceText = "10 ", displayZone = "Founder's Point" },
[255298] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246961] = {
[255216] = { priceText = "10 ", displayZone = "Founder's Point" },
[255298] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[247501] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248760] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[249558] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251981] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251982] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253180] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253181] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253441] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253479] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253490] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253493] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[255650] = {
[255216] = { priceText = "25 ", displayZone = "Founder's Point" },
[255298] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257690] = {
[255216] = { priceText = "100 ", displayZone = "Founder's Point" },
[255298] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[264169] = {
[255216] = { priceText = "25 ", displayZone = "Founder's Point" },
[255298] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[264352] = {
[255216] = { priceText = "125 ", displayZone = "Founder's Point" },
[255298] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[264353] = {
[255216] = { priceText = "125 ", displayZone = "Founder's Point" },
[255298] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[265653] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[265654] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[267075] = {
[255216] = { priceText = "75 ", displayZone = "Founder's Point" },
[255298] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[243337] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[243338] = {
[255216] = { priceText = "50 ", displayZone = "Founder's Point" },
[255298] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[241623] = {
[255218] = { priceText = "10 ", displayZone = "Founder's Point" },
[255299] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[243088] = {
[255218] = { priceText = "100 ", displayZone = "Founder's Point" },
[255299] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244118] = {
[255218] = { priceText = "100 ", displayZone = "Founder's Point" },
[255299] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244169] = {
[255218] = { priceText = "100 ", displayZone = "Founder's Point" },
[255299] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244780] = {
[255218] = { priceText = "100 ", displayZone = "Founder's Point" },
[255299] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244782] = {
[255218] = { priceText = "50 ", displayZone = "Founder's Point" },
[255299] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[247502] = {
[255218] = { priceText = "150 ", displayZone = "Founder's Point" },
[255299] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248658] = {
[255218] = { priceText = "25 ", displayZone = "Founder's Point" },
[255299] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253437] = {
[255218] = { priceText = "75 ", displayZone = "Founder's Point" },
[255299] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253439] = {
[255218] = { priceText = "75 ", displayZone = "Founder's Point" },
[255299] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253495] = {
[255218] = { priceText = "125 ", displayZone = "Founder's Point" },
[255299] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257691] = {
[255218] = { priceText = "10 ", displayZone = "Founder's Point" },
[255299] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257692] = {
[255218] = { priceText = "100 ", displayZone = "Founder's Point" },
[255299] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[267202] = {
[255218] = { priceText = "125 ", displayZone = "Founder's Point" },
[255299] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[236653] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[236654] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[236655] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[236666] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[236667] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244533] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244534] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244661] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244662] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244663] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245264] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245265] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245266] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245398] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245532] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245545] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245555] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245680] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246036] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246037] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246038] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246223] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246224] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246225] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246259] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246260] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246261] = {
[255222] = { priceText = "125 ", displayZone = "Founder's Point" },
[255278] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246262] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246263] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246587] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246607] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246608] = {
[255222] = { priceText = "125 ", displayZone = "Founder's Point" },
[255278] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246609] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246610] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246613] = {
[255222] = { priceText = "125 ", displayZone = "Founder's Point" },
[255278] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246614] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246687] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246869] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246879] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[247221] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248246] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[250093] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[250094] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[250691] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[250692] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[250913] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[250920] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251639] = {
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251973] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251974] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251975] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251976] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[252657] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254316] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254395] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254396] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254397] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254398] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254399] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254560] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254678] = {
[255222] = { priceText = "10 ", displayZone = "Founder's Point" },
[255278] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[255706] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[255707] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[256050] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[256329] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257389] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[258148] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[258664] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[258665] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259464] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259465] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259466] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259467] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259468] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259469] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[259470] = {
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[265924] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[265925] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[265926] = {
[255222] = { priceText = "50 ", displayZone = "Founder's Point" },
[255278] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[267088] = {
[255222] = { priceText = "25 ", displayZone = "Founder's Point" },
[255278] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244532] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[244535] = {
[255228] = { priceText = "150 ", displayZone = "Founder's Point" },
[255297] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245533] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245546] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246217] = {
[255228] = { priceText = "75 ", displayZone = "Founder's Point" },
[255297] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246218] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246220] = {
[255228] = { priceText = "125 ", displayZone = "Founder's Point" },
[255297] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246241] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246611] = {
[255228] = { priceText = "125 ", displayZone = "Founder's Point" },
[255297] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246612] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246615] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246616] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246868] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246880] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246881] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246882] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246883] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[246884] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[249550] = {
[255228] = { priceText = "150 ", displayZone = "Founder's Point" },
[255297] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251011] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251012] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251545] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251637] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[251638] = {
[255228] = { priceText = "150 ", displayZone = "Founder's Point" },
[255297] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[252008] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[253019] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[254893] = {
[255228] = { priceText = "150 ", displayZone = "Founder's Point" },
[255297] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[255708] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[255709] = {
[255228] = { priceText = "125 ", displayZone = "Founder's Point" },
[255297] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[256357] = {
[255228] = { priceText = "75 ", displayZone = "Founder's Point" },
[255297] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257099] = {
[255228] = { priceText = "100 ", displayZone = "Founder's Point" },
[255297] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[258300] = {
[255228] = { priceText = "125 ", displayZone = "Founder's Point" },
[255297] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[258307] = {
[255228] = { priceText = "125 ", displayZone = "Founder's Point" },
[255297] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[258663] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[260486] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[260487] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[260488] = {
[255228] = { priceText = "75 ", displayZone = "Founder's Point" },
[255297] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[263031] = {
[255228] = { priceText = "25 ", displayZone = "Founder's Point" },
[255297] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[263032] = {
[255228] = { priceText = "150 ", displayZone = "Founder's Point" },
[255297] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[263581] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[263582] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[263583] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[263584] = {
[255228] = { priceText = "150 ", displayZone = "Founder's Point" },
[255297] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[267083] = {
[255228] = { priceText = "50 ", displayZone = "Founder's Point" },
[255297] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[267616] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[268026] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[268027] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[268028] = {
[255228] = { priceText = "10 ", displayZone = "Founder's Point" },
[255297] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248625] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248626] = {
[255230] = { priceText = "75 ", displayZone = "Founder's Point" },
[255301] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248627] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248628] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248629] = {
[255230] = { priceText = "25 ", displayZone = "Founder's Point" },
[255301] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248630] = {
[255230] = { priceText = "25 ", displayZone = "Founder's Point" },
[255301] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248631] = {
[255230] = { priceText = "100 ", displayZone = "Founder's Point" },
[255301] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248632] = {
[255230] = { priceText = "75 ", displayZone = "Founder's Point" },
[255301] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248633] = {
[255230] = { priceText = "50 ", displayZone = "Founder's Point" },
[255301] = { priceText = "50 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248634] = {
[255230] = { priceText = "125 ", displayZone = "Founder's Point" },
[255301] = { priceText = "125 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248636] = {
[255230] = { priceText = "75 ", displayZone = "Founder's Point" },
[255301] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248637] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248638] = {
[255230] = { priceText = "25 ", displayZone = "Founder's Point" },
[255301] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[248650] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257359] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257388] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257390] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[257392] = {
[255230] = { priceText = "10 ", displayZone = "Founder's Point" },
[255301] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[260701] = {
[255230] = { priceText = "25 ", displayZone = "Founder's Point" },
[255301] = { priceText = "25 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[260702] = {
[255230] = { priceText = "75 ", displayZone = "Founder's Point" },
[255301] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[266234] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[266235] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[266236] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[266237] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[266238] = {
[255230] = { priceText = "150 ", displayZone = "Founder's Point" },
[255301] = { priceText = "150 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245298] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245299] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245300] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245301] = {
[255319] = { priceText = "75 ", displayZone = "Razorwind Shores", hideInGallery = true },
[255221] = { priceText = "75 ", displayZone = "Founder's Point" },
[255230] = { priceText = "75 ", displayZone = "Founder's Point", hideInGallery = true },
[255301] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245327] = {
[255319] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245328] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245329] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245369] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245371] = {
[255319] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245658] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245659] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245660] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245661] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248635] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248639] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248640] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248641] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248642] = {
[255319] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248643] = {
[255319] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248644] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248645] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248646] = {
[255319] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248647] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248648] = {
[255319] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248649] = {
[255319] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248802] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248803] = {
[255319] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248811] = {
[255319] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[255644] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[255646] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258658] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258659] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266239] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266240] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266241] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266242] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266243] = {
[255319] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255221] = { priceText = "150 ", displayZone = "Founder's Point" },
}




Gallery.VendorDetails[264003] = { [256026] = { priceText = "5 ", displayZone = "Silvermoon City" }}


Gallery.VendorDetails[258262] = { [256783] = { price = { currencyID = 2815, amount = 350 }, displayZone = "The Ringing Deeps" }}
Gallery.VendorDetails[258264] = { [256783] = { price = { currencyID = 2815, amount = 200 }, displayZone = "The Ringing Deeps" }}
Gallery.VendorDetails[258265] = { [256783] = { price = { currencyID = 2815, amount = 1000 }, displayZone = "The Ringing Deeps" }}
Gallery.VendorDetails[258267] = { [256783] = { price = { currencyID = 2815, amount = 750 }, displayZone = "The Ringing Deeps" }}

Gallery.VendorDetails[258222] = { [256826] = { priceText = "100 ", displayZone = "Suramar" }}

Gallery.VendorDetails[258742] = { [256946] = { priceText = "50 ", displayZone = "Talador" }}



do--Thraxadar
Gallery.VendorDetails[247785] = { [258328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Masters' Perch", requirement = { type = "reputation", faction = "Slayer's Duellum", rank = "Revered" } }}
Gallery.VendorDetails[264253] = { [258328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Masters' Perch", requirement = { type = "reputation", faction = "Slayer's Duellum", rank = "Friendly" } }}
Gallery.VendorDetails[264345] = { [258328] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Masters' Perch", requirement = { type = "reputation", faction = "Slayer's Duellum", rank = "Honored" } }}
end

do--Hawli
Gallery.VendorDetails[264172] = { [258540] = { priceText = "5 ", displayZone = "Harandar" }}
end

do--Sathren Azuredawn
Gallery.VendorDetails[243106] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[244538] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[244783] = { [259864] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[245282] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[245992] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[246458] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[251909] = { [259864] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[251911] = { [259864] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[251912] = { [259864] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[251914] = { [259864] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[253485] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[253488] = { [259864] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[254773] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[257367] = { [259864] = { price = { currencyID = 3316, amount = 750 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[262610] = { [259864] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263211] = { [259864] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[263231] = { [259864] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[264248] = { [259864] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[264660] = { [259864] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[265106] = { [259864] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
Gallery.VendorDetails[265631] = { [259864] = { price = { currencyID = 3316, amount = 500 }, displayZone = "Eversong Woods" }}
end

do--Solelo
Gallery.VendorDetails[239177] = {
[256071] = { priceText = "2000 ", displayZone = "Stormwind City" },
[256119] = { priceText = "2000 ", displayZone = "Stormwind City" },
}
Gallery.VendorDetails[239179] = {
[256071] = { priceText = "2000 ", displayZone = "Stormwind City" },
[256119] = { priceText = "2000 ", displayZone = "Stormwind City" },
}
Gallery.VendorDetails[246845] = {
[256071] = { priceText = "2000 ", displayZone = "Stormwind City" },
[256119] = { priceText = "2000 ", displayZone = "Stormwind City" },
}
Gallery.VendorDetails[246847] = {
[256071] = { priceText = "2000 ", displayZone = "Stormwind City" },
[256119] = { priceText = "2000 ", displayZone = "Stormwind City" },
}
Gallery.VendorDetails[246848] = {
[256071] = { priceText = "2000 ", displayZone = "Stormwind City" },
[256119] = { priceText = "2000 ", displayZone = "Stormwind City" },
}
Gallery.VendorDetails[246860] = {
[256071] = { priceText = "2000 ", displayZone = "Stormwind City" },
[256119] = { priceText = "2000 ", displayZone = "Stormwind City" },
}
end

do--depthdiver
Gallery.VendorDetails[258535] = { [260180] = { price = { currencyID = 3373, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[258536] = { [260180] = { price = { currencyID = 3373, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[258537] = { [260180] = { price = { currencyID = 3373, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[258538] = { [260180] = { price = { currencyID = 3373, amount = 750 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264251] = { [260180] = { price = { currencyID = 3373, amount = 1000 }, displayZone = "Zul'Aman" }}
Gallery.VendorDetails[264252] = { [260180] = { price = { currencyID = 3373, amount = 1000 }, displayZone = "Zul'Aman" }}
end

do--Void Researcher Aemely
Gallery.VendorDetails[262351] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262472] = { [259922] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[262606] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[263240] = { [259922] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264340] = { [259922] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264493] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264508] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264656] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264657] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[264659] = { [259922] = { price = { currencyID = 3316, amount = 150 }, displayZone = "Voidstorm" }}
Gallery.VendorDetails[267082] = { [259922] = { price = { currencyID = 3316, amount = 250 }, displayZone = "Voidstorm" }}
end

do--random vendors

Gallery.VendorDetails[244321] = {
[86683] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86776] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86777] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86778] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86779] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
}

Gallery.VendorDetails[244322] = {
[86683] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86776] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86777] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86778] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86779] = {
price = { currencyID = 824, amount = 100 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
}

Gallery.VendorDetails[245444] = {
[86683] = {
price = { currencyID = 824, amount = 250 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86776] = {
price = { currencyID = 824, amount = 250 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86777] = {
price = { currencyID = 824, amount = 250 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86778] = {
price = { currencyID = 824, amount = 250 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86779] = {
price = { currencyID = 824, amount = 250 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
}

Gallery.VendorDetails[245445] = {
[86683] = {
price = { currencyID = 824, amount = 150 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86776] = {
price = { currencyID = 824, amount = 150 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86777] = {
price = { currencyID = 824, amount = 150 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86778] = {
price = { currencyID = 824, amount = 150 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
[86779] = {
price = { currencyID = 824, amount = 150 },
combineKey = "frostwall_rotating_garrison_vendor",
combineLabel = "Frostwall rotating garrison vendor",
combineZone = "Frostwall",
},
}

Gallery.VendorDetails[246424] = { [13217] = { priceText = "1|Hitem:137642 " }}
Gallery.VendorDetails[248337] = {
[255221] = { priceText = "50 " },
[255230] = { priceText = "50 ", hideInGallery = true },
[255301] = { priceText = "50 " },
}
Gallery.VendorDetails[248338] = {
[255221] = { priceText = "50 " },
[255230] = { priceText = "50 ", hideInGallery = true },
[255301] = { priceText = "50 " },
}
Gallery.VendorDetails[248339] = {
[255221] = { priceText = "50 " },
[255230] = { priceText = "50 ", hideInGallery = true },
[255301] = { priceText = "50 " },
}
Gallery.VendorDetails[248796] = {
[45417] = { priceText = "3000 ", hideInGallery = true  },
[142115] = { priceText = "3000 " },
}
Gallery.VendorDetails[248808] = { [2483] = { priceText = "450 ", displayZone = "Northern Stranglethorn" }}
Gallery.VendorDetails[255840] = {
[68363] = { priceText = "8000 ", displayZone = "Deeprun Tram" },
[68364] = { priceText = "8000 ", displayZone = "Brawl'gar Arena" },
}
Gallery.VendorDetails[256923] = { [241928] = { price = { currencyID = 3377, amount = 800 } }}
Gallery.VendorDetails[259071] = {
[68363] = { priceText = "4000 ", displayZone = "Deeprun Tram" },
[68364] = { priceText = "4000 ", displayZone = "Brawl'gar Arena" },
}
Gallery.VendorDetails[263026] = {
[68363] = { priceText = "500 ", displayZone = "Deeprun Tram" },
[68364] = { priceText = "500 ", displayZone = "Brawl'gar Arena" },
}
Gallery.VendorDetails[263997] = { [243359] = { priceText = "5 " }}
Gallery.VendorDetails[263998] = { [241451] = { priceText = "5 " }}
Gallery.VendorDetails[263999] = { [257914] = { priceText = "5 " }}
Gallery.VendorDetails[264000] = { [243350] = { priceText = "5 " }}
Gallery.VendorDetails[264001] = { [241453] = { priceText = "5 " }}
Gallery.VendorDetails[264002] = { [258507] = { priceText = "5 " }}
Gallery.VendorDetails[264004] = { [243555] = { priceText = "5 " }}
Gallery.VendorDetails[264005] = { [258480] = { priceText = "5 " }}
Gallery.VendorDetails[264006] = { [255098] = { priceText = "5 " }}
Gallery.VendorDetails[264174] = { [243353] = { priceText = "5 " }}
Gallery.VendorDetails[264249] = { [241928] = { price = { currencyID = 3377, amount = 1600 } }}
Gallery.VendorDetails[264254] = { [241928] = { price = { currencyID = 3377, amount = 800 } }}
end

do-- Construct Ali'a
Gallery.VendorDetails[278369] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278372] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278376] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278380] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[250868] = { [258181] = { price = { currencyID = 3392, amount = 350 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[250870] = { [258181] = { price = { currencyID = 3392, amount = 200 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[253449] = { [258181] = { price = { currencyID = 3392, amount = 200 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278123] = { [258181] = { price = { currencyID = 3392, amount = 100 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278126] = { [258181] = { price = { currencyID = 3392, amount = 100 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278130] = { [258181] = { price = { currencyID = 3392, amount = 100 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278134] = { [258181] = { price = { currencyID = 3392, amount = 100 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278145] = { [258181] = { price = { currencyID = 3392, amount = 200 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278148] = { [258181] = { price = { currencyID = 3392, amount = 100 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[278151] = { [258181] = { price = { currencyID = 3392, amount = 350 }, displayZone = "Silvermoon City" }}
end

do--Construct Ali'a
Gallery.VendorDetails[265681] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265682] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265683] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265684] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265685] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265686] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265687] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265688] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265689] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265690] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265691] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265692] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265694] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265797] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265796] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265795] = { [258181] = { price = { currencyID = 3392, amount = 600 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265696] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265697] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265698] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265699] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265700] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265701] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265702] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265703] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265704] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265705] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265706] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265707] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265708] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265794] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265798] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[265799] = { [258181] = { price = { currencyID = 3392, amount = 400 }, displayZone = "Silvermoon City" }}
end

do--Disguised Decor Vendor
Gallery.VendorDetails[268457] = { [264056] = { price = { currencyID = 3316, amount = 50 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[269613] = { [264056] = { price = { currencyID = 3316, amount = 30 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[269614] = { [264056] = { price = { currencyID = 3316, amount = 15 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[269636] = { [264056] = { price = { currencyID = 3316, amount = 15 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[269641] = { [264056] = { price = { currencyID = 3316, amount = 50 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[271162] = { [264056] = { price = { currencyID = 3316, amount = 120 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272441] = { [264056] = { price = { currencyID = 3316, amount = 10 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272442] = { [264056] = { price = { currencyID = 3316, amount = 20 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272443] = { [264056] = { price = { currencyID = 3316, amount = 20 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272444] = { [264056] = { price = { currencyID = 3316, amount = 10 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272445] = { [264056] = { price = { currencyID = 3316, amount = 10 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[272446] = { [264056] = { price = { currencyID = 3316, amount = 10 }, displayZone = "Silvermoon City" }}
end

------------------------------------------------------------
---Coiled Isle Vendors
------------------------------------------------------------
do-- Firetender Zab'ni (The Coiled Isle) 58.6, 45.9

Gallery.VendorDetails[263873] = { [270399] = { price = {currencyID = 3316, amount = 500}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[271851] = { [270399] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[279285] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[279292] = { [270399] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[280218] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[279452] = { [270399] = { price = {currencyID = 3316, amount = 500}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[279508] = { [270399] = { price = {currencyID = 3316, amount = 500}, displayZone = "The Coiled Isle" }}	
Gallery.VendorDetails[271176] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[271609] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[248962] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[271175] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[281580] = { [270399] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[281582] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[244345] = { [270399] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle" }}
end

do -- Second Mate Sluggs
Gallery.VendorDetails[277921] = { [257598] = { price = { currencyID = 3316, amount = 500 }, displayZone = "The Coiled Isle", requirement = { type = "reputation", faction = "Captain Tokka", rank = "Exalted" } } }
Gallery.VendorDetails[277923] = { [257598] = { price = { currencyID = 3316, amount = 150 }, displayZone = "The Coiled Isle", requirement = { type = "reputation", faction = "Captain Tokka", rank = "Friendly" } } }
Gallery.VendorDetails[277925] = { [257598] = { price = { currencyID = 3316, amount = 250 }, displayZone = "The Coiled Isle", requirement = { type = "reputation", faction = "Captain Tokka", rank = "Revered" } } }
Gallery.VendorDetails[277927] = { [257598] = { price = { currencyID = 3316, amount = 250 }, displayZone = "The Coiled Isle", requirement = { type = "reputation", faction = "Captain Tokka", rank = "Friendly" } } }
Gallery.VendorDetails[277929] = { [257598] = { price = { currencyID = 3316, amount = 500 }, displayZone = "The Coiled Isle", requirement = { type = "reputation", faction = "Captain Tokka", rank = "Revered" } } }
Gallery.VendorDetails[277931] = { [257598] = { price = { currencyID = 3316, amount = 250 }, displayZone = "The Coiled Isle", requirement = { type = "reputation", faction = "Captain Tokka", rank = "Honored" } } }
end

do-- Jan'sari the Watchful (The Coiled Isle)
Gallery.VendorDetails[271177] = { [268228] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 18 } }}
Gallery.VendorDetails[269778] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 7 } }}
Gallery.VendorDetails[269779] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 7 } }}
Gallery.VendorDetails[276457] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 15 } }}
Gallery.VendorDetails[276459] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 15 } }}
Gallery.VendorDetails[264271] = { [268228] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 15 } }}
Gallery.VendorDetails[267377] = { [268228] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 18 } }}
Gallery.VendorDetails[264331] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 3 } }}
Gallery.VendorDetails[263316] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 3 } }}
Gallery.VendorDetails[277323] = { [268228] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 18 } }}
Gallery.VendorDetails[249765] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 3 } }}
Gallery.VendorDetails[277271] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 11 } }}
Gallery.VendorDetails[277273] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 11 } }}
Gallery.VendorDetails[277275] = { [268228] = { price = {currencyID = 3316, amount = 150}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 11 } }}
Gallery.VendorDetails[277280] = { [268228] = { price = {currencyID = 3316, amount = 250}, displayZone = "The Coiled Isle", requirement = { type = "renown", faction = "Zul'jarra's Forces", rank = 7 } }}
end

do--Er'Inye
Gallery.VendorDetails[279919] = { [272751] = { price = {currencyID = 3448, amount = 1500}, displayZone = "The Coiled Isle"  }}
Gallery.VendorDetails[279922] = { [272751] = { price = {currencyID = 3448, amount = 2500}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[266169] = { [272751] = { price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[253455] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle"  }}
Gallery.VendorDetails[253473] = { [272751] = { price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle"  }}
Gallery.VendorDetails[271850] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle"  }}
Gallery.VendorDetails[267378] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle"   }}
Gallery.VendorDetails[279917] = { [272751] = { price = {currencyID = 3448, amount = 1500}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[275578] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle"  }}
Gallery.VendorDetails[275628] = { [272751] = {price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle"  }}
Gallery.VendorDetails[272362] = { [272751] = { price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[269637] = { [272751] = { price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[271358] = { [272751] = { price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[271604] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle"   }}
Gallery.VendorDetails[281573] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[281620] = { [272751] = { price = {currencyID = 3448, amount = 1500}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[280764] = { [272751] = { price = {currencyID = 3448, amount = 750}, displayZone = "The Coiled Isle" }}
Gallery.VendorDetails[281577] = { [272751] = { price = {currencyID = 3448, amount = 500}, displayZone = "The Coiled Isle" }}
end


-----------------------------------------------------------
---Housing Vendors
------------------------------------------------------------
do--Trevor and Yen
Gallery.VendorDetails[266244] = {
[255221] = { priceText = "75 " },
[255230] = { priceText = "75 ", hideInGallery = true },
[255301] = { priceText = "75 " },
}
Gallery.VendorDetails[266245] = {
[255221] = { priceText = "75 " },
[255230] = { priceText = "75 ", hideInGallery = true },
[255301] = { priceText = "75 " },
}
Gallery.VendorDetails[266443] = {
[255221] = { priceText = "50 " },
[255230] = { priceText = "50 ", hideInGallery = true },
[255301] = { priceText = "50 " },
}
Gallery.VendorDetails[266444] = {
[255221] = { priceText = "75 " },
[255230] = { priceText = "75 ", hideInGallery = true },
[255301] = { priceText = "75 " },
}
end

do--Harlowe Marl
Gallery.VendorDetails[264915] = { [257897] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264916] = { [257897] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264917] = { [257897] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264918] = { [257897] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264919] = { [257897] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264920] = { [257897] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264921] = { [257897] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264922] = { [257897] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264923] = { [257897] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264924] = { [257897] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[264925] = { [257897] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[265032] = { [257897] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[265541] = { [257897] = { price = { currencyID = 3363, amount = 1 }, displayZone = "Razorwind Shores or Founder's Point" }}
end

do--Klasa
Gallery.VendorDetails[245400] = {
[256750] = { priceText = "10 ", displayZone = "Founder's Point" },
[240465] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245401] = {
[256750] = { priceText = "10 ", displayZone = "Founder's Point" },
[240465] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245402] = {
[256750] = { priceText = "10 ", displayZone = "Founder's Point" },
[240465] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245403] = {
[256750] = { priceText = "10 ", displayZone = "Founder's Point" },
[240465] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245404] = {
[256750] = { priceText = "10 ", displayZone = "Founder's Point" },
[240465] = { priceText = "10 ", displayZone = "Razorwind Shores" },
}

end

do-- high tides ren	
Gallery.VendorDetails[235633] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[235675] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[235677] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[236675] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[236676] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[236677] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[236678] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[239075] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[242255] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244530] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244531] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244664] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244665] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244666] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244778] = {
[255325] = { priceText = "50", displayZone = "Razorwind Shores" },
[255222] = { priceText = "50", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245267] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245268] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245334] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245335] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245336] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245352] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245353] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245354] = {
[255325] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245355] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245356] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245358] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245370] = {
[255325] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245375] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245376] = {
[255325] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245383] = {
[255325] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245384] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245392] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245393] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245394] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
[255222] = { priceText = "100 ", displayZone = "Founder's Point" },
[255278] = { priceText = "100 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245395] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
[255222] = { priceText = "75 ", displayZone = "Founder's Point" },
[255278] = { priceText = "75 ", displayZone = "Razorwind Shores" },
}
Gallery.VendorDetails[245547] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245548] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245556] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246101] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246103] = {
[255325] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246106] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
[255326] = { priceText = "10 ", displayZone = "Razorwind Shores", hideInGallery = true },
[255213] = { priceText = "10 ", displayZone = "Founder's Point", hideInGallery = true },
}
Gallery.VendorDetails[246243] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246245] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246246] = {
[255325] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246247] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246248] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246502] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246934] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246935] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[250092] = {
[255325] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252037] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252038] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252417] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252659] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[253589] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[253592] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[253593] = {
[255325] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258570] = {
[255325] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258670] = {
[255325] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[262962] = {
[255325] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266233] = {
[255325] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266249] = {
[255325] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[266250] = {
[255325] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[268029] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[268030] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[272359] = {
[255325] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255203] = { priceText = "50 ", displayZone = "Founder's Point" },
}
end	

do--len
Gallery.VendorDetails[235523] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[242951] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[243334] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[244667] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245357] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245359] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245360] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245365] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245366] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245367] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245368] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245372] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245374] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245377] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245378] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245379] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245380] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245382] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245385] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245386] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245551] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245656] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245657] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[245662] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246102] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246104] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246105] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246107] = {
[255326] = { priceText = "125 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "125 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246109] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246219] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246588] = {
[255326] = { priceText = "150 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "150 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246742] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246803] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246870] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246871] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246872] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246874] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246875] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246876] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[246877] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[248400] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[249822] = {
[255326] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[249823] = {
[255326] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[250095] = {
[255326] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[250249] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[250250] = {
[255326] = { priceText = "10 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "10 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[250251] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[250252] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252004] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252005] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252006] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252007] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252407] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252408] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252409] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252410] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252412] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252414] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[252416] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[253018] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[253590] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[253707] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258565] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258566] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258818] = {
[255326] = { priceText = "75 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "75 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[258819] = {
[255326] = { priceText = "25 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "25 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[263025] = {
[255326] = { priceText = "100 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "100 ", displayZone = "Founder's Point" },
}
Gallery.VendorDetails[267084] = {
[255326] = { priceText = "50 ", displayZone = "Razorwind Shores" },
[255213] = { priceText = "50 ", displayZone = "Founder's Point" },
}
end

do--cousin Shortkaf
Gallery.VendorDetails[248404] = { [249741] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
end

do-- Unquestionably Griftah
Gallery.VendorDetails[276312] = { [267870] = {  price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263875] = { [267870] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[244344] = { [267870] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
end

do-- Agratha|Perry
Gallery.VendorDetails[277121] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[277142] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[277144] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[277149] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[277160] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[277163] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[277138] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
Gallery.VendorDetails[263880] = {
[267794] = { priceText = "50 ", displayZone = "Razorwind" },
[267795] = { priceText = "50 ", displayZone = "Founders" },
}
--[[Gallery.VendorDetails[276246] = {
[267794] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind" },
[267795] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founders" },
}]]
Gallery.VendorDetails[276230] = {
[267794] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind" },
[267795] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founders" },
}
end

do--Devin Slatesmith and Merki
Gallery.VendorDetails[280142] = {
[257332] = { priceText = "25 ", displayZone = "Founders Point" },
[257257] = { priceText = "25 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280144] = {
[257332] = { priceText = "100 ", displayZone = "Founders Point" },
[257257] = { priceText = "100 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280146] = {
[257332] = { priceText = "25 ", displayZone = "Founders Point" },
[257257] = { priceText = "25 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280148] = {
[257332] = { priceText = "100 ", displayZone = "Founders Point" },
[257257] = { priceText = "100 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280150] = {
[257332] = { priceText = "50 ", displayZone = "Founders Point" },
[257257] = { priceText = "50 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280152] = {
[257332] = { priceText = "25 ", displayZone = "Founders Point" },
[257257] = { priceText = "25 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280154] = {
[257332] = { priceText = "25 ", displayZone = "Founders Point" },
[257257] = { priceText = "25 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280156] = {
[257332] = { priceText = "50 ", displayZone = "Founders Point" },
[257257] = { priceText = "50 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280158] = {
[257332] = { priceText = "25 ", displayZone = "Founders Point" },
[257257] = { priceText = "25 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280164] = {
[257332] = { priceText = "75 ", displayZone = "Founders Point" },
[257257] = { priceText = "75 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280160] = {
[257332] = { priceText = "100 ", displayZone = "Founders Point" },
[257257] = { priceText = "100 ", displayZone = "Razorwind" },
}
Gallery.VendorDetails[280162] = {
[257332] = { priceText = "75 ", displayZone = "Founders Point" },
[257257] = { priceText = "75 ", displayZone = "Razorwind" },
}
end

do--Throska
Gallery.VendorDetails[279455] = { [257168] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[279458] = { [257168] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[247776] = { [257168] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
end

do-- Griftah|
Gallery.VendorDetails[263708] = { [260485] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274518] = { [260485] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274505] = { [260485] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274521] = { [260485] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274523] = { [260485] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274525] = { [260485] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274527] = { [260485] = { price = { currencyID = 3363, amount = 2 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[274529] = { [260485] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274531] = { [260485] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274533] = { [260485] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274535] = { [260485] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274537] = { [260485] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[274539] = { [260485] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[263317] = { [260485] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[255649] = { [260485] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
end

do-- Taifa|
Gallery.VendorDetails[280215] = { [268106] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280873] = { [268106] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280221] = { [268106] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280225] = { [268106] = { price = { currencyID = 3363, amount = 25 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280227] = { [268106] = { price = { currencyID = 3363, amount = 25 }, displayZone = "Razorwind Shores or Founder's Point"  }}
Gallery.VendorDetails[280230] = { [268106] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280232] = { [268106] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280234] = { [268106] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280236] = { [268106] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280238] = { [268106] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280240] = { [268106] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280242] = { [268106] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280244] = { [268106] = { price = { currencyID = 3363, amount = 5 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280846] = { [268106] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }} -- Beguiling Memories of the Sea
Gallery.VendorDetails[280223] = { [268106] = { price = { currencyID = 3363, amount = 25 }, displayZone = "Razorwind Shores or Founder's Point"  }}
end

do-- Timicky|
Gallery.VendorDetails[280246] = { [271173] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280513] = { [271173] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280249] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280251] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280253] = { [271173] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280255] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280257] = { [271173] = { price = { currencyID = 3363, amount = 15 }, displayZone = "Razorwind Shores or Founder's Point"  }}
Gallery.VendorDetails[280259] = { [271173] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280261] = { [271173] = { price = { currencyID = 3363, amount = 25 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280263] = { [271173] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280265] = { [271173] = { price = { currencyID = 3363, amount = 25 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280267] = { [271173] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores or Founder's Point" }}
Gallery.VendorDetails[280269] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280271] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280273] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point"}}
Gallery.VendorDetails[280275] = { [271173] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores or Founder's Point" }}
end

do--denightshade
Gallery.VendorDetails[280625] = {
    [257303] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280627] = {
    [257303] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280637] = {
    [257303] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores"},
	[257321] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Founder's Point"},
}
Gallery.VendorDetails[280639] = {
    [257303] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280642] = {
    [257303] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280644] = {
    [257303] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280646] = {
    [257303] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280633] = {
    [257303] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 10 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280650] = {
    [257303] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores"},
	[257321] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Founder's Point"},
}
Gallery.VendorDetails[280654] = {
    [257303] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[282347] = {
    [257303] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280635] = {
    [257303] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280631] = {
    [257303] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280629] = {
    [257303] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Razorwind Shores" },
	[257321] = { price = { currencyID = 3363, amount = 20 }, displayZone = "Founder's Point" },
}
Gallery.VendorDetails[280652] = {
    [257303] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Razorwind Shores"},
	[257321] = { price = { currencyID = 3363, amount = 30 }, displayZone = "Founder's Point"},
}
end
------------------------------------------------------------
---PTR
------------------------------------------------------------
do--Mumples
Gallery.VendorDetails[282661] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282663] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282665] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282667] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282669] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282671] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282673] = { [274062] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282675] = { [274062] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282677] = { [274062] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282679] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282681] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282683] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282685] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282687] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282689] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282691] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282693] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282695] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
Gallery.VendorDetails[282697] = { [274062] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }}
end

do--Acquirer Ta'gosh
Gallery.VendorDetails[284216] = { [169524] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Oribos" }}  
end

do--Captain Lancy Revshon and  Sergeant De Vries 
Gallery.VendorDetails[284223] = { 
[49877] = { priceText = "250 ", displayZone = "Stormwind City" },
[955] = { priceText = "250 ", displayZone = "Elwynn Forest" },
}
end

do--Samia Inkling
Gallery.VendorDetails[284579] = { [188623] = { price = { currencyID = 2003, amount = 500 }, displayZone = "The Waking Shores" }}
 end
 
 do--Victor Esquivas
Gallery.VendorDetails[284384] = { [143244] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Tiragarde Sound" }}
end

do--Adjutant Vortus
Gallery.VendorDetails[281682] = { [127518] = { price = { currencyID = 1220, amount = 300 }, displayZone = "Argus" }} -- Adjuta (Shielded Lightforged Pylon) 
Gallery.VendorDetails[282024] = { [127518] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Adjuta (Decorative Lightforged Holo-Screen) 
Gallery.VendorDetails[282113] = { [127518] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Adjuta (Lightforged Holo-Tower) 
Gallery.VendorDetails[282115] = { [127518] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Adjuta (Lightforged Holo-Barricade) 
Gallery.VendorDetails[282117] = { [127518] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Adjuta (Lightforged Holo-Parapet) 
Gallery.VendorDetails[282119] = { [127518] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Adjuta (Lightforged Holo-Shield) 
Gallery.VendorDetails[282136] = { [127518] = { price = { currencyID = 1220, amount = 150 }, displayZone = "Argus" }} -- Adjuta (Raw Argunite Supply) 
Gallery.VendorDetails[282138] = { [127518] = { price = { currencyID = 1220, amount = 150 }, displayZone = "Argus" }} -- Adjuta (Carved Argunite Supply) 
Gallery.VendorDetails[282148] = { [127518] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Argus" }} -- Adjuta (Replica Crown of the Triumvirate) 
Gallery.VendorDetails[282150] = { [127518] = { price = { currencyID = 1220, amount = 150 }, displayZone = "Argus" }} -- Adjuta (Golden Argunite Crystal) 
Gallery.VendorDetails[282152] = { [127518] = { price = { currencyID = 1220, amount = 150 }, displayZone = "Argus" }} -- Adjuta (Celadon Argunite Crystal) 
Gallery.VendorDetails[282154] = { [127518] = { price = { currencyID = 1220, amount = 150 }, displayZone = "Argus" }} -- Adjuta (Amethyst Argunite Crystal)
Gallery.VendorDetails[282162] = { [127518] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Argus" }} -- Adjuta (Ceremonial Lightforged Standard) 
end

do--Vindicator Jaelaana
Gallery.VendorDetails[282111] = { [127120] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Argus" }} -- Vi (Hanging Lightforged Standard) 
Gallery.VendorDetails[282122] = { [127120] = { price = { currencyID = 1220, amount = 500 }, displayZone = "Argus" }} -- Vi (Gilded Stonework Altar) 
Gallery.VendorDetails[282128] = { [127120] = { price = { currencyID = 1220, amount = 250 }, displayZone = "Argus" }} -- Vi (Argunite Sconce) 
Gallery.VendorDetails[282130] = { [127120] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Vi (Standing Argunite Lamp) 
Gallery.VendorDetails[282134] = { [127120] = { price = { currencyID = 1220, amount = 300 }, displayZone = "Argus" }} -- Vi (Argunite Crystal Storage) 
Gallery.VendorDetails[282142] = { [127120] = { price = { currencyID = 1220, amount = 250 }, displayZone = "Argus" }} -- Vi (Gleaming Lightforged Grindstone) 
Gallery.VendorDetails[282146] = { [127120] = { price = { currencyID = 1220, amount = 300 }, displayZone = "Argus" }} -- Vi (Lightforged Control Console) 
Gallery.VendorDetails[282156] = { [127120] = { price = { currencyID = 1220, amount = 200 }, displayZone = "Argus" }} -- Vi (Reinforced Empyrium Tile) 
end

do--Estella Archtender
Gallery.VendorDetails[280050] = { [266188] = { price = { currencyID = 3316, amount = 1500 }, displayZone = "Silvermoon City" }}  
Gallery.VendorDetails[275865] = { [266188] = { price = { currencyID = 3316, amount = 600 }, displayZone = "Silvermoon City" }} 
Gallery.VendorDetails[275873] = { [266188] = { price = { currencyID = 3316, amount = 300 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[275879] = { [266188] = { price = { currencyID = 3316, amount = 300 }, displayZone = "Silvermoon City" }} 
Gallery.VendorDetails[275867] = { [266188] = { price = { currencyID = 3316, amount = 300 }, displayZone = "Silvermoon City" }}
Gallery.VendorDetails[275871] = { [266188] = { price = { currencyID = 3316, amount = 600 }, displayZone = "Silvermoon City" }}  
Gallery.VendorDetails[275869] = { [266188] = { price = { currencyID = 3316, amount = 300 }, displayZone = "Silvermoon City" }} 
end

do--Fenwir
Gallery.VendorDetails[284482] = { [274690] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Drustvar" }} -- F (Scarlet Drustvar Oak) 
Gallery.VendorDetails[284484] = { [274690] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Drustvar" }} -- F (Scarlet Drustvar Thornwood) 
Gallery.VendorDetails[284466] = { [274690] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Drustvar" }} -- F (Drustvar Glowcap Cluster) 
Gallery.VendorDetails[284462] = { [274690] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Drustvar" }} -- F (Arching Crimson Ivy) 
Gallery.VendorDetails[284474] = { [274690] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Drustvar" }} -- F (Snowbound Highroad Pine) 
Gallery.VendorDetails[284476] = { [274690] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Drustvar" }} -- F (Lush Drustvar Witchfern)
Gallery.VendorDetails[284478] = { [274690] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Drustvar" }} -- F (Withered Crimson Oak) 
Gallery.VendorDetails[284480] = { [274690] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Drustvar" }} -- F (Tall Crimson Oak) 
Gallery.VendorDetails[284486] = { [274690] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Drustvar" }} -- F (Short Drustvar Oak Stump) 
Gallery.VendorDetails[284488] = { [274690] = { price = { currencyID = 1560, amount = 10 }, displayZone = "Drustvar" }} -- F (Drustvar Leaf Patch) 
Gallery.VendorDetails[284490] = { [274690] = { price = { currencyID = 1560, amount = 10 }, displayZone = "Drustvar" }} -- F (Drustvar Leaf Clump) 
Gallery.VendorDetails[284468] = { [274690] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Drustvar" }} -- F (Short Crimson Oak Stump) 
Gallery.VendorDetails[284464] = { [274690] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Drustvar" }} -- F (Twisted Crimson Root) 
Gallery.VendorDetails[284470] = { [274690] = { price = { currencyID = 1560, amount = 75 }, displayZone = "Drustvar" }} -- F (Withered Barrow-weed) 
Gallery.VendorDetails[284472] = { [274690] = { price = { currencyID = 1560, amount = 10 }, displayZone = "Drustvar" }} -- F (Drustvar Shelfcap)
end

do--Hoarder Jena 
Gallery.VendorDetails[283277] = { [135804] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Vol'dun" }} -- H (Wooden Vulpera Caravan) 
Gallery.VendorDetails[283279] = { [135804] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- H (Damaged Nomad's Makeshift Barricade) 
Gallery.VendorDetails[283289] = { [135804] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- H (Nomad's Steel Lantern) 
Gallery.VendorDetails[283297] = { [135804] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- H (Vulpera Postbox) 
Gallery.VendorDetails[283317] = { [135804] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- H (Reinforced Nomad's Makeshift Barricade) 
Gallery.VendorDetails[283319] = { [135804] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- H (Vacant Buzzard Roost) 
Gallery.VendorDetails[283323] = { [135804] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- H (Nomad's Wooden Lamppost)
Gallery.VendorDetails[283365] = { [135804] = { price = { currencyID = 1560, amount = 150 }, displayZone = "Vol'dun" }} -- H (Caravan Smith's Anvil) 
Gallery.VendorDetails[283305] = { [135804] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- H (Fortified Nomad's Makeshift Barricade) 
end

do--Jeni
Gallery.VendorDetails[283269] = { [143325] = { price = { currencyID = 1560, amount = 300 }, displayZone = "Vol'dun" }} -- J (Vulpera War Banner) 
Gallery.VendorDetails[283287] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Warped Water Gourd) 
Gallery.VendorDetails[283293] = { [143325] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Vol'dun" }} -- J (Nomad's Serving Sundries) 
Gallery.VendorDetails[283295] = { [143325] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Vol'dun" }} -- J (Long Red Vulpera Cushion) 
Gallery.VendorDetails[283307] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Mortar and Pestle) 
Gallery.VendorDetails[283309] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Covered Serving Bowl) 
Gallery.VendorDetails[283311] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Serving Bowl) 
Gallery.VendorDetails[283313] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone == "Vol'dun" }} -- J (Nomad's Stone Pitcher) 
Gallery.VendorDetails[283315] = { [143325] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Vol'dun" }} -- J (Nomad's Bowl Set) 
Gallery.VendorDetails[283325] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Worn Water Gourd) 
Gallery.VendorDetails[283327] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Water Gourd) 
Gallery.VendorDetails[283329] = { [143325] = { price = { currencyID = 1560, amount = 200 }, displayZone = "Vol'dun" }} -- J (Nomad's Wooden Table) 
Gallery.VendorDetails[283331] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Nomad's Stone Urn) 
Gallery.VendorDetails[283333] = { [143325] = { price = { currencyID = 1560, amount = 100 }, displayZone = "Vol'dun" }} -- J (Nomad's Refreshment Set) 
Gallery.VendorDetails[283335] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Blue Vulpera Cushion) 
Gallery.VendorDetails[283337] = { [143325] = { price = { currencyID = 1560, amount = 50 }, displayZone = "Vol'dun" }} -- J (Black Vulpera Cushion) 
Gallery.VendorDetails[283343] = { [143325] = { price = { currencyID = 1560, amount = 400 }, displayZone = "Vol'dun" }} -- J (Ornate Vulpera Caravan) 
end

do--Mistress Mihaela
Gallery.VendorDetails[284558] = { [156822] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Revendreth" }} 
Gallery.VendorDetails[284560] = { [156822] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Revendreth" }} 
Gallery.VendorDetails[284562] = { [156822] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Revendreth" }} 
Gallery.VendorDetails[284570] = { [156822] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Revendreth" }}
  end
  
 do--Verayn
Gallery.VendorDetails[284554] = { [274686] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Revendreth" }} -- V (Confessor's Anima Jar) 
Gallery.VendorDetails[284556] = { [274686] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Revendreth" }} -- V (Sinfall Arched Bookcase) 
Gallery.VendorDetails[284564] = { [274686] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Revendreth" }} -- V (Venthyr Fence) 
Gallery.VendorDetails[284566] = { [274686] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Revendreth" }} -- V (Venthyr Fencepost) 
Gallery.VendorDetails[284568] = { [274686] ={ price= { currencyID= 1813, amount= 300 }, displayZone= "Revendreth" }} -- V (Sinfall Dining Table)
end

do--Aithlyn
Gallery.VendorDetails[283271] = { [158556] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Aithly (Blooming Celestial Dreamleaf) 
Gallery.VendorDetails[283275] = { [158556] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Aithly (Small Shimmering Moonvine)
Gallery.VendorDetails[283283] = { [158556] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Aithly (Fae Moonbough Cocoon) 
Gallery.VendorDetails[283345] = { [158556] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Aithly (Hanging Wildseed) 
Gallery.VendorDetails[283370] = { [158556] = { price = { currencyID = 1813, amount = 650 }, displayZone = "Ardenweald" }} -- Aithly (Fae Moonbough Gate) 
Gallery.VendorDetails[283376] = { [158556] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Aithly (Leaning Wildgrove Tree) 
Gallery.VendorDetails[283265] = { [158556] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Aithly (Fae Lantern Blossom) 
end

do--Lunelle Ardenweld
Gallery.VendorDetails[281670] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Anima-Infused Dreamcatcher) 
Gallery.VendorDetails[283262] = { [175419] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Lu (Restored Night Fae Sigil) 
Gallery.VendorDetails[283267] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Celestial Grovebush) 
Gallery.VendorDetails[283273] = { [175419] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Ardenweald" }} -- Lu (Fae Moonbough Table) 
Gallery.VendorDetails[283281] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Wildgrove Leaf Pile) 
Gallery.VendorDetails[283285] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Lush Wildgrove Fern) 
Gallery.VendorDetails[283339] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Starseed Sapling) 
Gallery.VendorDetails[283341] = { [175419] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Lu (Dormant Wildseed) 
Gallery.VendorDetails[282327] = { [175419] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Lu (Fae Animashroom)
Gallery.VendorDetails[283381] = { [175419] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Lu (Lush Celestial Moonbough) 
Gallery.VendorDetails[283383] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Leaning Celestial Orchid) 
Gallery.VendorDetails[283385] = { [175419] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Ardenweald" }} -- Lu (Fae Animashroom Circle) 
Gallery.VendorDetails[282714] = { [175419] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Ardenweald" }} -- Lu (Fae Anima Wall Lantern) 
Gallery.VendorDetails[283379] = { [175419] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Ardenweald" }} -- Lu (Hanging Wildgrove Ivy) 
end

do--Nalcorn Talsen
Gallery.VendorDetails[284498] = { [173003] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Maldraxxus" }} -- Nalc (Maldraxxi Anima Crystal) 
Gallery.VendorDetails[284506] = { [173003] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Maldraxxus" }} -- Nalc (Suspended Lich Scroll) 
end

do--Collector Xorik 
Gallery.VendorDetails[284492] = { [274682] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Maldraxxus" }} -- C (Open Bonewood Barrel) 
Gallery.VendorDetails[284494] = { [274682] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Maldraxxus" }} -- C (Ossified Maldraxxi Spike) 
Gallery.VendorDetails[284496] = { [274682] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Maldraxxus" }} -- C (Highback Bonewood Chair) 
Gallery.VendorDetails[284500] = { [274682] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Maldraxxus" }} -- C (Maldraxxi Shielding Lattice) 
Gallery.VendorDetails[284502] = { [274682] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Maldraxxus" }} -- C (Maldraxxi Horned Beast Skull) 
end

do--Curator IIlaris
Gallery.VendorDetails[284508] = { [274668] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Lush Elysian Lotus) 
Gallery.VendorDetails[284510] = { [274668] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Elysian Heart-Lotus) 
Gallery.VendorDetails[284512] = { [274668] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Verdant Elysian Crownblossom) 
Gallery.VendorDetails[284514] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Sparse Elysian Pondweed) 
Gallery.VendorDetails[284516] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Windswept Elysian Skyplume) 
Gallery.VendorDetails[284518] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Windswept Elysian Shrub) 
Gallery.VendorDetails[284520] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Hanging Elysian Skyvy) 
Gallery.VendorDetails[284522] = { [274668] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Lush Elysian Bellflower Bush) 
Gallery.VendorDetails[284460] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone == "Bastion" }} --  (Kyrian Waymarker Plaque)
Gallery.VendorDetails[284540] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Narrow Kyrian Drapes) 
Gallery.VendorDetails[284542] = { [274668] = { price = { currencyID = 1813, amount = 300 }, displayZone = "Bastion" }} --  (Kyrian Steward Effigy)
Gallery.VendorDetails[284524] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Elysian Bulbflower) 
Gallery.VendorDetails[284526] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Lush Elysian Lily) 
Gallery.VendorDetails[284528] = { [274668] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Windswept Elysian Willow)
Gallery.VendorDetails[284530] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Winged Elysian Spiralbloom) 
Gallery.VendorDetails[284532] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Radiant Elysian Water Lily) 
Gallery.VendorDetails[284534] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Windswept Elysian Grass) 
Gallery.VendorDetails[284536] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Elysian Skyfrond) 
Gallery.VendorDetails[284544] = { [274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Kyrian Waymarker) 
Gallery.VendorDetails[284546] = { [274668] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Runic Kyrian Reliquary) 
end

do--Adjutant Nikos
Gallery.VendorDetails[284538] = { [160470] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }} --  (Anima-Powered Kyrian Oven) 
Gallery.VendorDetails[284550] = { [160470] = { price = { currencyID = 1813, amount = 500 }, displayZone = "Bastion" }} --  (Ornate Kyrian Glass Platform)
end

do--Curator IIlaris and Adjutant Nikos
Gallery.VendorDetails[284548] = { 
[160470] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" },
[274668] = { price = { currencyID = 1813, amount = 200 }, displayZone = "Bastion" }, 
}
end

do--Botanist Gril'ka
Gallery.VendorDetails[284106] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Nagrand Clover Cluster) 
Gallery.VendorDetails[284108] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Nagrand Wild Wheat) 
Gallery.VendorDetails[284110] = { [274291] = { price = { { priceText = "400" }, { currencyID = 824, amount = 400 } }, displayZone = "Nagrand" } } -- B (Young Sentinel Tree) 
Gallery.VendorDetails[284112] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Highmaul Sentinel Tree) 
Gallery.VendorDetails[284118] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Spiritwood Oak Stump) 
Gallery.VendorDetails[284120] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Sentinel Tree Root) 
Gallery.VendorDetails[284122] = { [274291] = { price = { { priceText = "400" }, { currencyID = 824, amount = 400 } }, displayZone = "Nagrand" } } -- B (Stonecrag Sentinel Tree) 
Gallery.VendorDetails[284126] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Aborius Pod Plant) 
Gallery.VendorDetails[284128] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Gordawg Mossy Rock) 
Gallery.VendorDetails[284130] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Nagrand Heart Ivy) 
Gallery.VendorDetails[284132] = { [274291] = { price = { { priceText = "400" }, { currencyID = 824, amount = 400 } }, displayZone = "Nagrand" } } -- B (Skysong Sentinel Tree) 
Gallery.VendorDetails[284134] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Incineratus Grass Patch) 
Gallery.VendorDetails[284116] = { [274291] = { price = { { priceText = "400" }, { currencyID = 824, amount = 400 } }, displayZone = "Nagrand" } } -- B (Mature Spiritwood Oak) 
Gallery.VendorDetails[284114] = { [274291] = { price = { { priceText = "400" }, { currencyID = 824, amount = 400 } }, displayZone = "Nagrand" } } -- B (Wandering Sentinel Tree) 
Gallery.VendorDetails[284124] = { [274291] = { price = { { priceText = "200" }, { currencyID = 824, amount = 200 } }, displayZone = "Nagrand" } } -- B (Kalandrios Lily)
end

do--Botanist Taania  
Gallery.VendorDetails[283220] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Small Shadowmoon Shadebrush) 
Gallery.VendorDetails[283222] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Overgrown Valuun Shrub) 
Gallery.VendorDetails[283224] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Verdant Mire Scale-Leaf) 
Gallery.VendorDetails[283226] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Mature Star Lily) 
Gallery.VendorDetails[283228] = { [274250] = { price = { currencyID = 824, amount = 400 }, displayZone = "Shadowmoon Valley" }} -- B (Embaari Beech Tree) 
Gallery.VendorDetails[283230] = { [274250] = { price = { currencyID = 824, amount = 400 }, displayZone = "Shadowmoon Valley" }} -- B (Pale Shadowmoon Willow) 
Gallery.VendorDetails[283232] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Huddled Nightmarsh Blossom) 
Gallery.VendorDetails[283234] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Curved Karabor Hedge) 
Gallery.VendorDetails[283236] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Elaborate Karabor Hedge) 
Gallery.VendorDetails[283238] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Karabor Hedge) 
Gallery.VendorDetails[283240] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Shadow Lily Bloom) 
Gallery.VendorDetails[283242] = { [274250] = { price = { currencyID = 824, amount = 200 }, displayZone = "Shadowmoon Valley" }} -- B (Gloomshade Glowpod) 
Gallery.VendorDetails[283244] = { [274250] = { price = { currencyID = 824, amount = 400 }, displayZone = "Shadowmoon Valley" }} -- B (Karabor Beech Tree) 
Gallery.VendorDetails[283246] = { [274250] = { price = { currencyID = 824, amount = 400 }, displayZone = "Shadowmoon Valley" }} -- B (Verdant Shadowmoon Willow) 
Gallery.VendorDetails[283248] = { [274250] = { price = { currencyID = 824, amount = 400 }, displayZone = "Shadowmoon Valley" }} -- B (Lunarfall Beech Tree)
end
 
  
  
  
  
  
end)(...);
