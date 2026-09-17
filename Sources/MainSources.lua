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
	
}

do--Classic Vendors
DVD.npcs[1247] = { zone = "Kharanos", model3D = 3434, title = "Innkeeper Belm", expansion = "Classic", zoneGroup = "Dun Morogh", faction = "alliance", x=54.4, y=50.8, mapID = 27, note = "Gnome or Dwarf", category = "race" }
DVD.npcs[68364] = { zone = "Brawl'gar Arena", model3D = 46757, title = "Paul North", expansion = "Classic", zoneGroup = "Brawl'gar Arena", faction = "horde", x=52, y=27.8, mapID = 503 }
DVD.npcs[48258] = { zone = "Talonbranch Glade", model3D = 36183, title = "Willard Harrington", expansion = "Classic", zoneGroup = "Felwood", faction = "alliance", x=61.6, y=25.8, mapID = 77 }
DVD.npcs[13217] = { zone = "Pvp Vendor", model3D = 13319, title = "Thanthaldis Snowgleam", expansion = "Classic", zoneGroup = "Hillsbrad Foothill", faction = "neutral", x=44.8, y=46.4, mapID = 25 }
DVD.npcs[44337] = { zone = "Surwich", model3D = 33806, title = "Maurice Essman", expansion = "Classic", zoneGroup = "Blasted Lands", faction = "alliance", x=45.8, y=88.6, mapID = 17 }
DVD.npcs[115805] = { zone = "Chiselgrip", model3D = 73953, title = "Hoddruc Bladebender", expansion = "Classic", zoneGroup = "Burning Steppes", faction = "neutral", x=46.8, y=44.6, mapID = 36 }
DVD.npcs[68363] = { zone = "Bizmo's Brawlpub", model3D = 46755, title = "Quackenbush", expansion = "Classic", zoneGroup = "Bizmo's Brawlpub", faction = "alliance", x=51, y=30, mapID = 499 }
DVD.npcs[44114] = { zone = "Raven Hill", model3D = 33678, title = "Wilkinson", expansion = "Classic", zoneGroup = "Duskwood", faction = "alliance", x=20.27, y=58.35, mapID = 47 }
DVD.npcs[23995] = { zone = "Mudsprocket", model3D = 31082, title = "Axle", expansion = "Classic", zoneGroup = "Dustwallow Marsh", faction = "neutral", x=41.9, y=73.9, mapID = 70 }
DVD.npcs[45417] = { zone = "Lights Hope Chapel", model3D = 34450, title = "Fiona", expansion = "Classic", zoneGroup = "Eastern PlagueLands", faction = "neutral", x=73.8, y=52.2, mapID = 23 }
DVD.npcs[1465] = { zone = "Thelsamar", model3D = 1820, title = "Drac Roughcut", expansion = "Classic", zoneGroup = "Loch Modan", faction = "alliance", x=35.6, y=49, mapID = 48 }
DVD.npcs[254606] = { zone = "Hall of Legends", model3D = 138276, title = "Joruh", expansion = "Classic", zoneGroup = "Orgrimmar", faction = "horde", x=38.8, y=71.93, mapID = 85 }
DVD.npcs[50488] = { zone = "Orgrimmar", model3D = 37020, title = "Stone Guard Nargol", expansion = "Classic", zoneGroup = "Orgrimmar", faction = "horde", x=50.2, y=58.4, mapID = 85 }
DVD.npcs[256119] = { zone = "The Drag", model3D = 139508, title = "Lonalo", expansion = "Classic", zoneGroup = "Orgrimmar", faction = "horde", x=58.4, y=50.6, mapID = 85 }
DVD.npcs[261262] = { zone = "Near Trading Post", model3D = 34566, title = "Gabbi", expansion = "Classic", zoneGroup = "Orgrimmar", faction = "horde", x=48.4, y=81, mapID = 85, category = "Promo", note = "Most items listed must have been bought from in game store before seeing them"  }
DVD.npcs[14624] = { zone = "Thorium Point", model3D = 14652, title = "Master Smith Burninate", expansion = "Classic", zoneGroup = "Searing Gorge", faction = "neutral", x=38.6, y=28.7, mapID = 32 }
DVD.npcs[2140] = { zone = "The Sepulcher", model3D = 3542, title = "Edwin Harly", expansion = "Classic", zoneGroup = "Silverpine Forest", faction = "horde", x=44.06, y=39.68, mapID = 21 }
DVD.npcs[252520] = { zone = "Rut'theran Village", model3D = 137447, title = "Ripley Kiefer", expansion = "Classic", zoneGroup = "Teldrassil", faction = "alliance", x=55.2, y=89.3, mapID = 47, note = "she is a few feet from the portal to  Darnassus", category = "reputation" }
DVD.npcs[49877] = { zone = "Trade District", model3D = 36758, title = "Captain Lancy Revshon", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=67.79, y=73.05, mapID = 84, category = "reputation" }
DVD.npcs[256071] = { zone = "Mage Quarter", model3D = 139467, title = "Solelo", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=49, y=80, mapID = 84 }
DVD.npcs[254603] = { zone = "Old Town", model3D = 138274, title = "Riica", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=77.8, y=65.8, mapID = 84 }
DVD.npcs[261231] = { zone = "Near Trading Post", model3D = 17507, title = "Tuuran", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=48.6, y=68.8, mapID = 84, category = "Promo", note = "Most items listed must have been bought from in game store before seeing them"  }
DVD.npcs[2483] = { zone = "Nesingwary Expedition", model3D = 4394, title = "Jacquilina Dramet", expansion = "Classic", zoneGroup = "Stranglethorn Vale", faction = "neutral", x=43.8, y=23.2, mapID = 50 }
DVD.npcs[50483] = { zone = "Thunder Bluff", model3D = 37022, title = "Brave Tuho", expansion = "Classic", zoneGroup = "Thunder Bluff", faction = "horde", x=46.2, y=50.6, mapID = 88, note = "Regular Tauren Only", category = "race" }
DVD.npcs[50304] = { zone = "PRE-DESTRUCTION", model3D = 37023, title = "Captain Donald Adams", expansion = "Classic", zoneGroup = "Undercity", faction = "horde", x=63.2, y=49, mapID = 90 }
DVD.npcs[3178] = { zone = "Menethil Harbor", model3D = 3468, title = "Stuart Fleming", expansion = "Classic", zoneGroup = "Wetlands", faction = "alliance", x=6.27, y=57.45, mapID = 56 }
DVD.npcs[253235] = { zone = "The Commons", model3D = 137770, title = "Dedric Sleetshaper", expansion = "Classic", zoneGroup = "Ironforge", faction = "alliance", x=24.72, y=43.93, mapID = 87, category = "reputation" }
DVD.npcs[50309] = { zone = "Ironforge", model3D = 37017, title = "Captain Stonehelm", expansion = "Classic", zoneGroup = "Ironforge", faction = "alliance", x=55.6, y=48.2, mapID = 87, category = "reputation" }
DVD.npcs[253232] = { zone = "The Library", model3D = 137768, title = "Inge Brightview", expansion = "Classic", zoneGroup = "Ironforge", faction = "alliance", x=75.8, y=9.4, mapID = 87 }
end

-- The Burning Crusade
DVD.npcs[16528] = { zone = "Tranquillien - Pre Midnight", model3D = 16242, title = "Provisioner Vredigar", expansion = "The Burning Crusade", zoneGroup = "Ghostlands", faction = "horde", x=47.6, y=32.4, mapID = 95, note = "Use the portal in Eastern Plaguelands at 53.9, 8.8 to go to Pre Midnight", category = "reputation" }

do--Wrath of the Lich King
DVD.npcs[28038] = { zone = "Nesingwary Base Camp", model3D = 25056, title = "Purser Boulian", expansion = "Wrath of the Lich King", zoneGroup = "Scholazar Basin", faction = "neutral", x=26.8, y=59.2, mapID = 119 }
DVD.npcs[27391] = { zone = "Amberpine Lodge", model3D = 24604, title = "Woodsman Drake", expansion = "Wrath of the Lich King", zoneGroup = "Grizzly Hills", faction = "alliance", x=32.4, y=59.8, mapID = 116 }
DVD.npcs[25206] = { zone = "Winterfin Retreat", model3D = 4920, title = "Ahlurglgr", expansion = "Wrath of the Lich King", zoneGroup = "Borean Tundra", faction = "neutral", x=43.03, y=13.78, mapID = 114 }
end

do--Cataclysm
DVD.npcs[211065] = { zone = "Stormglen Village", model3D = 30289, title = "Marie Allen", expansion = "Cataclysm", zoneGroup = "Gilneas Post Takeover", faction = "alliance", x=60.4, y=92.4, mapID = 217 }
DVD.npcs[50307] = { zone = "Gilneas City", model3D = 37015, title = "Lord Candren", expansion = "Cataclysm", zoneGroup = "Gilneas Post Takeover", faction = "alliance", x=56.94, y=55.91, mapID = 217, category = "reputation" }
DVD.npcs[216888] = { zone = "Gilneas City", model3D = 30289, title = "Samantha Buckley", expansion = "Cataclysm", zoneGroup = "Gilneas Post Takeover", faction = "alliance", x=65.2, y=47.2, mapID = 217 }
DVD.npcs[253227] = { zone = "Thundermar", model3D = 137766, title = "Breana Bitterbrand", expansion = "Cataclysm", zoneGroup = "Twilight Highlands", faction = "neutral", x=49.6, y=29.6, mapID = 241, note = "Friendly to horde but be careful of hostile npcs nearby", category = "reputation" }
DVD.npcs[49386] = { zone = "Thundermar", model3D = 36453, title = "Craw MacGraw", expansion = "Cataclysm", zoneGroup = "Twilight Highlands", faction = "alliance", x=48.6, y=30.6, mapID = 241, category = "reputation" }
end

do--Mists of Pandaria
DVD.npcs[58414] = { zone = "Arboretum", model3D = 40146, title = "San Redscale", expansion = "Mists of Pandaria", zoneGroup = "Jade Forest", faction = "neutral", x=56.8, y=44.4, mapID = 371, category = "reputation" }
DVD.npcs[59698] = { zone = "One Keg", model3D = 45821, title = "Brother Furtrim", expansion = "Mists of Pandaria", zoneGroup = "Kun-Lai Summit", faction = "neutral", x=57.24, y=60.96, mapID = 379 }
DVD.npcs[58706] = { zone = "Halfhill", model3D = 41769, title = "Gina Mudclaw", expansion = "Mists of Pandaria", zoneGroup = "Valley of the Four Winds", faction = "neutral", x=53.2, y=51.8, mapID = 376, category = "friendship" }
DVD.npcs[64001] = { zone = "Shrine of 2 Moons", model3D = 43420, title = "Sage Lotusbloom", expansion = "Mists of Pandaria", zoneGroup = "Vale of Eternal Blossoms - Shrine of 2 Moons", faction = "horde", x=62.8, y=23.2, mapID = 390 }
DVD.npcs[64032] = { zone = "Shrine of 7 Stars", model3D = 44182, title = "Sage Whiteheart", expansion = "Mists of Pandaria", zoneGroup = "Vale of Eternal Blossoms - Shrine of 7 Stars", faction = "alliance", x=85.2, y=61.6, mapID = 1530 }
DVD.npcs[64605] = { zone = "Seat of Knowledge", model3D = 44814, title = "Tan Shin Tiao", expansion = "Mists of Pandaria", zoneGroup = "Vale of Eternal Blossoms", faction = "neutral", x=82.23, y=29.33, mapID = 390, category = "reputation" }
DVD.npcs[62088] = { zone = "Seat of Knowledge", model3D = 42350, title = "Lali the Assistant", expansion = "Mists of Pandaria", zoneGroup = "Vale of Eternal Blossoms", faction = "neutral", x=82.8, y=30.8, mapID = 390 }
end

do--Warlords of Draenor 
DVD.npcs[79812] = { zone = "Barracks", model3D = 56555, title = "Moz'def", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[76872] = { zone = "Horde Garrison", model3D = 53501, title = "Supplymaster Eri", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[79774] = { zone = "Horde Garrison Tier 3", model3D = 56527, title = "Sergeant Grimjaw", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[87015] = { zone = "Trading Post Level 2", model3D = 56923, title = "Kil'rip", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[87312] = { zone = "Horde Garrison", model3D = 27957, title = "Vora Strongarm", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86776] = { zone = "Trading Post", model3D = 56923, title = "Ribchewer", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86779] = { zone = "Trading Post", model3D = 56410, title = "Krixel Pinchwhistle", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86777] = { zone = "Trading Post", model3D = 53501, title = "Elder Surehide", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86778] = { zone = "Trading Post", model3D = 55043, title = "Pyxni Pennypocket", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[86683] = { zone = "Trading Post", model3D = 4087, title = "Tai'tasi ", expansion = "Warlords of Draenor", zoneGroup = "Frostwall", faction = "horde", x=0, y=0, mapID = 590, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[78564] = { zone = "Alliance Garrison Tier 3", model3D = 61187, title = "Sergeant Crowler", expansion = "Warlords of Draenor", zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[85427] = { zone = "Trading Post Tier 3", model3D = 61418, title = "Maaria", expansion = "Warlords of Draenor", zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[88220] = { zone = "Alliance Garrison", model3D = 60816, title = "Peter", expansion = "Warlords of Draenor", zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (building-dependent location)" }
DVD.npcs[88126] = { zone = "Alliance Garrison", model3D = 3323, title = "Maybell Maclure-Stonefield", expansion = "Warlords of Draenor", zoneGroup = "Lunarfall", faction = "alliance", x=0, y=0, mapID = 582, note = "Inside your Garrison (Barn-dependent location)" }
DVD.npcs[81133] = { zone = "Embaari Village", model3D = 56229, title = "Artificer Kallaes", expansion = "Warlords of Draenor", zoneGroup = "Shadowmoon Valley", faction = "alliance", x=46.2, y=39.3, mapID = 539 }
DVD.npcs[87775] = { zone = "Veil Terokk", model3D = 61065, title = "Ruuan the Seer", expansion = "Warlords of Draenor", zoneGroup = "Spires of Arak", faction = "neutral", x=46.6, y=45, mapID = 542 }
DVD.npcs[85950] = { zone = "Stormshield", model3D = 59234, title = "Trader Caerel", expansion = "Warlords of Draenor", zoneGroup = "Ashran", faction = "alliance", x=41.4, y=59.8, mapID = 622 }
DVD.npcs[85932] = { zone = "The Town Hall", model3D = 59224, title = "Vindicator Nuurem", expansion = "Warlords of Draenor", zoneGroup = "Ashran", faction = "alliance", x=46.4, y=76.6, mapID = 622 }
DVD.npcs[85946] = { zone = "The Town Hall", model3D = 59471, title = "Shadow-Sage Brakoss", expansion = "Warlords of Draenor", zoneGroup = "Ashran", faction = "alliance", x=46.49, y=75.03, mapID = 622 }
DVD.npcs[86037] = { zone = "Warspear Hold", model3D = 61112, title = "Ravenspeaker Skeega", expansion = "Warlords of Draenor", zoneGroup = "Ashran", faction = "horde", x=53.3, y=59.96, mapID = 624 }
DVD.npcs[256946] = { zone = "Terokkar Refuge", model3D = 139888, title = "Duskcaller Erthix", expansion = "Warlords of Draenor", zoneGroup = "Talador", faction = "neutral", x=70.4, y=57.6, mapID = 535 }
end

do--Legion 
DVD.npcs[127151] = { zone = "The Vindicaar", model3D = 79278, title = "Toraan the Revered", expansion = "Legion", zoneGroup = "Argus", faction = "neutral", x=68.22, y=56.91, mapID = 831 }
DVD.npcs[89939] = { zone = "Leyhollow Cave", model3D = 28080, title = "Berazus", expansion = "Legion", zoneGroup = "Azsuna", faction = "neutral", x=47.8, y=23.6, mapID = 630 }
DVD.npcs[112716] = { zone = "Photonic Playground", model3D = 56737, title = "Rasil Fireborne", expansion = "Legion", zoneGroup = "Dalaran", faction = "neutral", x=43.4, y=49.4, mapID = 627 }
DVD.npcs[252043] = { zone = "Sunreaver Sanctuary", model3D = 137328, title = "Halenthos Brightstride", expansion = "Legion", zoneGroup = "Dalaran", faction = "horde", x=67.46, y=33.89, mapID = 627 }
DVD.npcs[105333] = { zone = "The Underbelly", model3D = 69095, title = "Val'zuun", expansion = "Legion", zoneGroup = "Dalaran", faction = "neutral", x=67.36, y=63.22, mapID = 628 }
DVD.npcs[106902] = { zone = "Thunder Totem", model3D = 72888, title = "Ransa Greyfeather", expansion = "Legion", zoneGroup = "Highmountain", faction = "neutral", x=38.06, y=46.05, mapID = 750, category = "reputation" }
DVD.npcs[108017] = { zone = "Thunder Totem - Bottom Half", model3D = 70380, title = "Torv Dubstomp", expansion = "Legion", zoneGroup = "Highmountain", faction = "neutral", x=54.8, y=78.08, mapID = 652 }
DVD.npcs[108537] = { zone = "Shipwreck Cove", model3D = 70605, title = "Crafty Palu", expansion = "Legion", zoneGroup = "Highmountain", faction = "neutral", x=41.62, y=10.44, mapID = 650 }
DVD.npcs[115736] = { zone = "Shal'Aran", model3D = 67345, title = "First Arcanist Thalyssra", expansion = "Legion", zoneGroup = "Suramar", faction = "neutral", x=36.49, y=45.83, mapID = 680, category = "reputation" }
DVD.npcs[93971] = { zone = "The Grand Promenade", model3D = 70030, title = "Leyweaver Inondra", expansion = "Legion", zoneGroup = "Suramar", faction = "neutral", x=40.32, y=69.73, mapID = 680 }
DVD.npcs[252969] = { zone = "Concourse of Destiny", model3D = 137688, title = "Jocenna", expansion = "Legion", zoneGroup = "Suramar", faction = "neutral", x=49.63, y=62.83, mapID = 680 }
DVD.npcs[255101] = { zone = "Shimmershade Garden", model3D = 138645, title = "Mynde", expansion = "Legion", zoneGroup = "Suramar", faction = "neutral", x=45.58, y=69.15, mapID = 680 }
DVD.npcs[253434] = { zone = "Irongrove Retreat", model3D = 137851, title = "Sileas Duskvine", expansion = "Legion", zoneGroup = "Suramar", faction = "neutral", x=79.92, y=73.89, mapID = 641 }
DVD.npcs[248594] = { zone = "suramar", model3D = 73413, title = "Sundries Merchant", expansion = "Legion", zoneGroup = "Suramar", faction = "neutral", x=50.9, y=77.78, mapID = 680, category = "reputation" }
DVD.npcs[253387] = { zone = "Lorlathil", model3D = 137846, title = "Selfira Ambergrove", expansion = "Legion", zoneGroup = "Val'sharah", faction = "neutral", x=54.26, y=72.36, mapID = 641, category = "reputation" }
DVD.npcs[106901] = { zone = "Lorlathil", model3D = 74537, title = "Sylvia Hartshorn", expansion = "Legion", zoneGroup = "Val'sharah", faction = "neutral", x=54.7, y=73.25, mapID = 641, category = "reputation" }
DVD.npcs[252498] = { zone = "Bradenbrook", model3D = 137440, title = "Corbin Branbell", expansion = "Legion", zoneGroup = "Val'sharah", faction = "neutral", x=42.09, y=59.38, mapID = 641 }
DVD.npcs[112634] = { zone = "Field of Dreamers (patrols)", model3D = 72149, title = "Hilseth Travelstride", expansion = "Legion", zoneGroup = "Val'sharah", faction = "neutral", x=57.14, y=71.91, mapID = 641 }
DVD.npcs[109306] = { zone = "Lightsong", model3D = 70971, title = "Myria Glenbrook", expansion = "Legion", zoneGroup = "Val'sharah", faction = "neutral", x=60.2, y=84.86, mapID = 641 }
DVD.npcs[256826] = { zone = "Val'sharah", model3D = 139842, title = "Mrgrgrl", expansion = "Legion", zoneGroup = "Val'sharah", faction = "neutral", x=68.72, y=95.1, mapID = 641 }
DVD.npcs[112407] = { zone = "Demon Hunter", model3D = 61734, title = "Falara Nightsong", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=61, y=56.73, mapID = 720 }
DVD.npcs[100196] = { zone = "Paladin", model3D = 28836, title = "Eadric the Pure", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=75.64, y=49.09, mapID = 23 }
DVD.npcs[103693] = { zone = "Hunter", model3D = 68326, title = "Outfitter Reynolds", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=44.56, y=48.88, mapID = 739 }
DVD.npcs[112323] = { zone = "Druid", model3D = 72032, title = "Amurra Thistledew", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=40.02, y=17.72, mapID = 747 }
DVD.npcs[105986] = { zone = "Rogue", model3D = 31159, title = "Kelsey Steelspark", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=26.92, y=36.83, mapID = 626 }
DVD.npcs[112338] = { zone = "Monk", model3D = 72042, title = "Caydori Brightstar", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=50.4, y=59, mapID = 709 }
DVD.npcs[93550] = { zone = "Death Knight", model3D = 15958, title = "Quartermaster Ozorg", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=43.9, y=37.17, mapID = 647 }
DVD.npcs[112434] = { zone = "Warlock", model3D = 72070, title = "Gigi Gigavoid", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=58.76, y=32.69, mapID = 717 }
DVD.npcs[112440] = { zone = "Mage", model3D = 72075, title = "Jackson Watkins", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=44.75, y=57.87, mapID = 735 }
DVD.npcs[112318] = { zone = "Shaman", model3D = 72029, title = "Flamesmith Lanying", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=30.32, y=60.69, mapID = 726 }
DVD.npcs[112392] = { zone = "Warrior", model3D = 72055, title = "Quartermaster Durnolf", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=55.49, y=25.91, mapID = 695 }
DVD.npcs[112401] = { zone = "Priest", model3D = 72056, title = "Meridelle Lightspark", expansion = "Legion", zoneGroup = "Class Halls", faction = "neutral", x=38.62, y=23.77, mapID = 702 }
end

do--Battle for Azeroth 
DVD.npcs[152194] = { zone = "Chamber of Heart", model3D = 91066, title = "MOTHER", expansion = "Battle for Azeroth", zoneGroup = "Silithus", faction = "neutral", x=48.3, y=72.1, mapID = 1473 }
DVD.npcs[252313] = { zone = "Brennadom", model3D = 137393, title = "Caspian", expansion = "Battle for Azeroth", zoneGroup = "Stormsong Valley", faction = "alliance", x=59.6, y=69.6, mapID = 942, category = "reputation" }
DVD.npcs[150716] = { zone = "Mechagon", model3D = 92583, title = "Stolen Royal Vendorbot", expansion = "Battle for Azeroth", zoneGroup = "Mechagon", faction = "neutral", x=73.7, y=36.91, mapID = 1462, category = "reputation" }
DVD.npcs[135808] = { zone = "Harbormaster's Office", model3D = 84415, title = "Provisioner Fray", expansion = "Battle for Azeroth", zoneGroup = "Tiragarde Sound", faction = "alliance", x=67.6, y=21.8, mapID = 1161, category = "reputation" }
DVD.npcs[252345] = { zone = "Tradewinds Market", model3D = 137409, title = "Pearl Barlow", expansion = "Battle for Azeroth", zoneGroup = "Tiragarde Sound", faction = "alliance", x=70.74, y=15.66, mapID = 1161 }
DVD.npcs[142115] = { zone = "Boralus Harbor", model3D = 34450, title = "Fiona", expansion = "Battle for Azeroth", zoneGroup = "Tiragarde Sound", faction = "alliance", x=67.6, y=40.8, mapID = 1161 }
DVD.npcs[246721] = { zone = "Hook Point", model3D = 130151, title = "Janey Forrest", expansion = "Battle for Azeroth", zoneGroup = "Tiragarde Sound", faction = "alliance", x=56.29, y=45.82, mapID = 1161 }
DVD.npcs[252316] = { zone = "Norwington Estate", model3D = 137394, title = "Delphine", expansion = "Battle for Azeroth", zoneGroup = "Tiragarde Sound", faction = "neutral", x=53.4, y=31.2, mapID = 895 }
DVD.npcs[135459] = { zone = "Zu'jan Ruins", model3D = 84261, title = "Provisioner Lija", expansion = "Battle for Azeroth", zoneGroup = "Nazmir", faction = "horde", x=39.11, y=79.47, mapID = 863, category = "reputation" }
DVD.npcs[148924] = { zone = "Port of Zandalar", model3D = 90164, title = "Provisioner Mukra", expansion = "Battle for Azeroth", zoneGroup = "Zuldazar", faction = "horde", x=51.22, y=95.08, mapID = 1165 }
DVD.npcs[148923] = { zone = "Port of Zandalar", model3D = 90162, title = "Captain Zen'taga", expansion = "Battle for Azeroth", zoneGroup = "Zuldazar", faction = "horde", x=44.6, y=94.4, mapID = 1165 }
DVD.npcs[251921] = { zone = "Zuldazar Docks", model3D = 137265, title = "Arcanist Peroleth", expansion = "Battle for Azeroth", zoneGroup = "Zuldazar", faction = "horde", x=58, y=62.6, mapID = 862, category = "reputation" }
DVD.npcs[252326] = { zone = "Zuldazar - The Great Seal", model3D = 137395, title = "T'lama", expansion = "Battle for Azeroth", zoneGroup = "Zuldazar", faction = "horde", x=36.94, y=59.17, mapID = 1164, category = "reputation" }
DVD.npcs[144129] = { zone = "Grim Guzzler", model3D = 8652, title = "Plugger Spazzring", expansion = "Battle for Azeroth", zoneGroup = "Blackrock Mountain", faction = "neutral", x=49.77, y=32.22, mapID = 1186, note = "Dark Iron Dwarf : Non Instanced Grim Guzzler", category = "race" }
end

do--Shadowlands 
DVD.npcs[174710] = { zone = "Sinfall", model3D = 99162, title = "Chachi the Artiste", expansion = "Shadowlands", zoneGroup = "Revendreth", faction = "neutral", x=54, y=24.8, mapID = 1699, note = "Venthyr Only", category = "Covenants" }
DVD.npcs[162804] = { zone = "Ve'nari's Refuge", model3D = 95004, title = "Ve'nari", expansion = "Shadowlands", zoneGroup = "The Maw", faction = "neutral", x=46.8, y=41.6, mapID = 1543 }
end

do--Dragonflight 
DVD.npcs[253086] = { zone = "Morqut Village", model3D = 137722, title = "Jolinth", expansion = "Dragonflight", zoneGroup = "The Forbidden Reach", faction = "neutral", x=35.2, y=57, mapID = 2151 }
DVD.npcs[193015] = { zone = "The Seat of Aspects - Lower", model3D = 108045, title = "Unatos", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=58.2, y=35.6, mapID = 2112, category = "renown" }
DVD.npcs[253067] = { zone = "The Parting Glass", model3D = 137718, title = "Silvrath", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=71.53, y=49.62, mapID = 2112, category = "renown" }
DVD.npcs[199605] = { zone = "Valdrakken Treasury Hoard", model3D = 110855, title = "Evantkis", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=58.4, y=57.4, mapID = 2112 }
DVD.npcs[193659] = { zone = "The Obsidian Enclave", model3D = 108249, title = "Provisioner Thom", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=36.8, y=50.6, mapID = 2112 }
DVD.npcs[209192] = { zone = "Azerothian Archives", model3D = 113800, title = "Provisioner Aristta", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=61.4, y=31.4, mapID = 2025 }
DVD.npcs[209220] = { zone = "Eon's Fringe", model3D = 112638, title = "Ironus Coldsteel", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=52.2, y=80.8, mapID = 2025 }
DVD.npcs[196637] = { zone = "Valdrakken", model3D = 109197, title = "Tethalash", expansion = "Dragonflight", zoneGroup = "Thaldraszus", faction = "neutral", x=25.52, y=33.65, mapID = 2112, note = "Dracthyr", category = "race" }
DVD.npcs[189226] = { zone = "Dragonscale Basecamp", model3D = 106843, title = "Cataloger Jakes", expansion = "Dragonflight", zoneGroup = "The Waking Shores", faction = "neutral", x=47, y=82.6, mapID = 2022, category = "renown" }
DVD.npcs[188265] = { zone = "Dragonscale Basecamp", model3D = 106418, title = "Rae'ana", expansion = "Dragonflight", zoneGroup = "The Waking Shores", faction = "neutral", x=47.8, y=82.2, mapID = 2022, category = "renown" }
DVD.npcs[191025] = { zone = "Ruby Lifeshrine", model3D = 102721, title = "Lifecaller Tzadrak", expansion = "Dragonflight", zoneGroup = "The Waking Shores", faction = "neutral", x=62, y=73.8, mapID = 2022 }
DVD.npcs[210608] = { zone = "Dreamsurge Location", model3D = 33840, title = "Celestine of the Harvest", expansion = "Dragonflight", zoneGroup = "Dragonflight Dreamsurge", faction = "neutral", sourceAction = "Dreamsurge Event", openmapID = 1978, pinSourceAction = true, noteY = -220, note = "Possible Locations:\n\n• The Waking Shores\n• Ohn'ahran Plains\n• The Azure Span\n• Thaldraszus"}
DVD.npcs[216286] = { zone = "Bel'ameth", model3D = 113048, title = "Moon Priestess Lasara", expansion = "Dragonflight", zoneGroup = "Amirdrassil", faction = "alliance", x=46.6, y=70.6, mapID = 2239 }
DVD.npcs[216284] = { zone = "Bel'ameth", model3D = 113507, title = "Mythrin'dir", expansion = "Dragonflight", zoneGroup = "Amirdrassil", faction = "alliance", x=54, y=60.8, mapID = 2239 }
DVD.npcs[216285] = { zone = "Bel'ameth", model3D = 113508, title = "Ellandrieth", expansion = "Dragonflight", zoneGroup = "Amirdrassil", faction = "alliance", x=48.4, y=53.6, mapID = 2239 }
end

do--The War Within 
DVD.npcs[223728] = { zone = "Dornogal - Foundation Hall", model3D = 120830, title = "Auditor Balwurz", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=39.2, y=24.4, mapID = 2339 }
DVD.npcs[219318] = { zone = "Dornogal - The Forgegrounds", model3D = 117779, title = "Jorid", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=57, y=60.6, mapID = 2339 }
DVD.npcs[252910] = { zone = "Dornogal - The Forgegrounds", model3D = 137662, title = "Garnett", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=54.68, y=57.24, mapID = 2339 }
DVD.npcs[252312] = { zone = "Dornogal", model3D = 137392, title = "Second Chair Pawdo", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=52.84, y=68, mapID = 2339 }
DVD.npcs[219217] = { zone = "Dornogal", model3D = 120603, title = "Velerd", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=55.2, y=76.4, mapID = 2339 }
DVD.npcs[252901] = { zone = "Freywold Village", model3D = 137660, title = "Cinnabar", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=42, y=73, mapID = 2248 }
DVD.npcs[226205] = { zone = "Isle of Dorn", model3D = 120579, title = "Cendvin", expansion = "The War Within", zoneGroup = "Isle of Dorn", faction = "neutral", x=74.4, y=45.2, mapID = 2248 }
DVD.npcs[221390] = { zone = "Gundargaz", model3D = 118619, title = "Waxmonger Squick", expansion = "The War Within", zoneGroup = "The Ringing Deeps", faction = "neutral", x=43.2, y=32.8, mapID = 2214 }
DVD.npcs[252887] = { zone = "Gundargaz", model3D = 137648, title = "Chert", expansion = "The War Within", zoneGroup = "The Ringing Deeps", faction = "neutral", x=43.4, y=33, mapID = 2214 }
DVD.npcs[256783] = { zone = "Gundargaz", model3D = 139804, title = "Gabbun", expansion = "The War Within", zoneGroup = "The Ringing Deeps", faction = "neutral", x=43.32, y=33.03, mapID = 2214 }
DVD.npcs[217642] = { zone = "Mereldar", model3D = 118635, title = "Nalina Ironsong", expansion = "The War Within", zoneGroup = "Hallowfall", faction = "neutral", x=42.8, y=55.83, mapID = 2215 }
DVD.npcs[240852] = { zone = "Hallowfall", model3D = 128126, title = "Lars Bronsmaelt", expansion = "The War Within", zoneGroup = "Hallowfall", faction = "neutral", x=28.28, y=56.18, mapID = 2215, category = "renown" }
DVD.npcs[251911] = { zone = "The Incontinental Hotel", model3D = 137264, title = "Stacks Topskimmer", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=43.19, y=50.47, mapID = 2346 }
DVD.npcs[231409] = { zone = "The Incontinental Hotel", model3D = 126125, title = "Smaks Topskimmer", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=43.8, y=50.8, mapID = 2346 }
DVD.npcs[231406] = { zone = "The Scrapshop", model3D = 126189, title = "Rocco Razzboom", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=39.16, y=22.2, mapID = 2346, category = "reputation" }
DVD.npcs[231405] = { zone = "Port Authority", model3D = 126190, title = "Boatswain Hardee", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=63.43, y=16.8, mapID = 2346, category = "reputation" }
DVD.npcs[231408] = { zone = "The Vatworks", model3D = 126191, title = "Lab Assistant Laszly", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=27.18, y=72.54, mapID = 2346, category = "reputation" }
DVD.npcs[231407] = { zone = "Venture Plaza", model3D = 125885, title = "Shredz the Scrapper", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=53.34, y=72.69, mapID = 2346, category = "reputation" }
DVD.npcs[231396] = { zone = "Hovel Hill", model3D = 125504, title = "Sitch Lowdown", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=30.78, y=38.93, mapID = 2346, category = "reputation" }
DVD.npcs[226994] = { zone = "Undermine", model3D = 127681, title = "Blair Bass", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=34, y=70.8, mapID = 2346 }
DVD.npcs[239333] = { zone = "Undermine", model3D = 127373, title = "Street Food Vendor", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=26.2, y=42.8, mapID = 2346 }
DVD.npcs[235621] = { zone = "Liberation of Undermine", model3D = 127136, title = "Ando the Gat", expansion = "The War Within", zoneGroup = "Undermine", faction = "neutral", x=43.29, y=51.89, mapID = 2406 }
DVD.npcs[235314] = { zone = "Tazavesh, the Veiled Market", model3D = 130299, title = "Ta'sam", expansion = "The War Within", zoneGroup = "K'aresh", faction = "neutral", x=43.2, y=34.8, mapID = 2472 }
DVD.npcs[235252] = { zone = "Tazavesh, the Veiled Market", model3D = 124755, title = "Om'sirik", expansion = "The War Within", zoneGroup = "K'aresh", faction = "neutral", x=40.33, y=29.36, mapID = 2472 }
DVD.npcs[218202] = { zone = "City of Threads", model3D = 114528, title = "Thripps", expansion = "The War Within", zoneGroup = "Azj-Kahet", faction = "neutral", x=50, y=31.6, mapID = 2213 }
end

do--Founders Point
DVD.npcs[255228] = { zone = "Founders Point", model3D = 138698, title = "\"Len\" Splinthoof", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=62.4, y=80, mapID = 2352, category = "neighborhood" }
DVD.npcs[255222] = { zone = "Founders Point", model3D = 138691, title = "\"High Tides\" Ren", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=62.4, y=80.2, mapID = 2352, category = "neighborhood" }
DVD.npcs[255230] = { zone = "Founders Point", model3D = 138699, title = "\"Yen\" Malone", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=62.23, y=80.3, mapID = 2352, category = "neighborhood" }
DVD.npcs[255203] = { zone = "Founders Point", model3D = 138684, title = "Xiao Dan", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=51.95, y=38.31, mapID = 2352, category = "neighborhood" }
DVD.npcs[255221] = { zone = "Founders Point", model3D = 138690, title = "Trevor Grenner", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=53.47, y=40.93, mapID = 2352, category = "neighborhood" }
DVD.npcs[256750] = { zone = "Founders Point", model3D = 139782, title = "Klasa", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=58.3, y=61.68, mapID = 2352, category = "neighborhood" }
DVD.npcs[255213] = { zone = "Founders Point", model3D = 138687, title = "Faarden the Builder", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52, y=38.4, mapID = 2352, category = "neighborhood" }
DVD.npcs[255216] = { zone = "Founders Point", model3D = 138688, title = "Balen Starfinder", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.2, y=38, mapID = 2352, category = "neighborhood" }
DVD.npcs[255218] = { zone = "Founders Point", model3D = 138689, title = "Argan Hammerfist", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.2, y=37.8, mapID = 2352, category = "neighborhood" }
DVD.npcs[248854] = { zone = "Founders Point", model3D = 136070, title = "The Last Architect", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.7, y=37.5, mapID = 2352, category = "neighborhood", note = "Rank 10 house to do weekly Curated Gift quest" }
DVD.npcs[257321] = { zone = "Founders Point", model3D = 140026, title = "Fel'orei Moonstrider", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.0, y=38.6, mapID = 2352, category = "neighborhood"}
DVD.npcs[267795] = { zone = "Founders Point", model3D = 145169, title = "Perry Winkles", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=53.8, y=41.6, mapID = 2352, category = "neighborhood" }
DVD.npcs[257332] = { zone = "Founders Point", model3D = 140031, title = "Devin Slatesmith", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.1, y=38.5, mapID = 2352, category = "neighborhood" }
end

do--razorwind shores
DVD.npcs[255325] = { zone = "Razorwind Shores", model3D = 138691, title = "\"High Tides\" Ren", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=39.9, y=72.78, mapID = 2351, category = "neighborhood" }
DVD.npcs[255319] = { zone = "Razorwind Shores", model3D = 138699, title = "\"Yen\" Malone", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=40.3, y=73, mapID = 2351, category = "neighborhood" }
DVD.npcs[255326] = { zone = "Razorwind Shores", model3D = 138698, title = "\"Len\" Splinthoof", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=39.91, y=73.3, mapID = 2351, category = "neighborhood" }
DVD.npcs[255297] = { zone = "Razorwind Shores", model3D = 138751, title = "Shon'ja", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=54.13, y=59.05, mapID = 2351, category = "neighborhood" }
DVD.npcs[240465] = { zone = "Razorwind Shores", model3D = 127583, title = "Lonomia", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=68.29, y=75.5, mapID = 2351, category = "neighborhood" }
DVD.npcs[255301] = { zone = "Razorwind Shores", model3D = 138755, title = "Botanist Boh'an", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.7, y=57.6, mapID = 2351, category = "neighborhood" }
DVD.npcs[255278] = { zone = "Razorwind Shores", model3D = 138741, title = "Gronthul", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=54.12, y=59.11, mapID = 2351, category = "neighborhood" }
DVD.npcs[255298] = { zone = "Razorwind Shores", model3D = 138752, title = "Jehzar Starfall", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.56, y=58.49, mapID = 2351, category = "neighborhood" }
DVD.npcs[255299] = { zone = "Razorwind Shores", model3D = 138753, title = "Lefton Farrer", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.4, y=58.4, mapID = 2351, category = "neighborhood" }
DVD.npcs[253596] = { zone = "Razorwind Shores", model3D = 136070, title = "The Last Architect", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.8, y=57.4, mapID = 2351, category = "neighborhood", note = "Rank 10 house to do weekly Curated Gift quest" }
DVD.npcs[257303] = { zone = "Razorwind Shores", model3D = 140016, title = "Den Nightshade", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=39.5, y=70.3, mapID = 2351, category = "neighborhood" }
DVD.npcs[267794] = { zone = "Razorwind Shores", model3D = 145168, title = "Agratha", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.6, y=54.5, mapID = 2351, category = "neighborhood" }
DVD.npcs[257257] = { zone = "Razorwind Shores", model3D = 140000, title = "Merki", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=54.1, y=58.9, mapID = 2351, category = "neighborhood" }
end

do--Housing Holiday Vendors
DVD.npcs[271372] = { zone = "Razorwind Shores", model3D = 24983, title = "Fizz Alechux", expansion = "Midnight", zoneGroup = "Razorwind Shores Holday Vendors", faction = "horde", x=52.4, y=54.3, mapID = 2351, category = "neighborhood", note = "Special Holiday Vendor" }
DVD.npcs[271366] = { zone = "Razorwind Shores", model3D = 146645, title = "Jolli Maxiboom", expansion = "Midnight", zoneGroup = "Razorwind Shores Holday Vendors", faction = "horde", x=52.4, y=54.3, mapID = 2351, category = "neighborhood", note = "Holiday Vendor" }
DVD.npcs[271604] = { zone = "Founders Point", model3D = 129552, title = "Holly Twinklebright", expansion = "Midnight", zoneGroup = "Founders Point Holday Vendors", faction = "alliance", x=54.4, y=32.7, mapID = 2352, category = "neighborhood", note = "Holiday Vendor " }
DVD.npcs[271603] = { zone = "Founders Point", model3D = 128230, title = "Kay Stouthammer", expansion = "Midnight", zoneGroup = "Founders Point Holday Vendors", faction = "alliance", x=54.4, y=32.7, mapID = 2352, category = "neighborhood", note = "Special Holiday Vendor"}
end

do--Housing Endeauver Vendors
DVD.npcs[252917] = { zone = "It Depends", model3D = 137667, title = "Hesta Forlath", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Hesta Forlath", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[257897] = { zone = "It Depends", model3D = 106374, title = "Harlowe Marl", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Harlowe Marl", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[252605] = { zone = "It Depends", model3D = 140447, title = "Aeeshna", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Aeeshna", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[249684] = { zone = "It Depends", model3D = 40842, title = "Brother Dovetail", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Brother Dovetail", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[250820] = { zone = "It Depends", model3D = 136498, title = "Hordranin", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Hordranin", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[248525] = { zone = "It Depends", model3D = 92584, title = "Pascal-K1N6", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Pascal-K1N6", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[268106] = { zone = "It Depends", model3D = 87552, title = "Taifa", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Taifa", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[257168] = { zone = "It Depends", model3D = 139949, title = "Throska", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Throska", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[260485] = { zone = "It Depends", model3D = 82235, title = "Griftah", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Griftah", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[267870] = { zone = "It Depends", model3D = 145184, title = "Unquestionably Griftah", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Unquestionably Griftah", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[265551] = { zone = "It Depends", model3D = 109681, title = "Roshai Lightstep", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Roshai Lightstep", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[249741] = { zone = "It Depends", model3D = 43184, title = "Cousin Shortkaf", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Cousin Shortkaf", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
DVD.npcs[271173] = { zone = "It Depends", model3D = 118388, title = "Timicky", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, sourceAction = "Timicky", note = "Neighborhood Endeavor vendor. Waypoint shows if it is active currently", category = "neighborhood" }
end

do--Midnight
DVD.npcs[252915] = { zone = "The Bazaar", model3D = 137524, title = "Corlen Hordralin", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=44.16, y=62.72, mapID = 2393 }
DVD.npcs[252916] = { zone = "The Bazaar", model3D = 137667, title = "Hesta Forlath", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=44.16, y=62.72, mapID = 2393 }
DVD.npcs[242398] = { zone = "The Bazaar", model3D = 105169, title = "Naleidea Rivergleam", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=52.67, y=77.96, mapID = 2393 }
DVD.npcs[256828] = { zone = "Murder Row", model3D = 139843, title = "Dennia Silvertongue", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=51.16, y=56.47, mapID = 2393, category = "Promo", note = "Most items listed must have been bought from in game store before seeing them" }
DVD.npcs[258181] = { zone = "Astalor's Sanctum", model3D = 140647, title = "Construct Ali'a", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=55.81, y=66.04, mapID = 2393 }
DVD.npcs[242399] = { zone = "The Bazaar", model3D = 107574, title = "Telemancer Astrandis", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=52.44, y=78.87, mapID = 2393 }
DVD.npcs[250982] = { zone = "Murder Row", model3D = 136657, title = "Dethelin", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=52.5, y=47.3, mapID = 2393 }
DVD.npcs[251091] = { zone = "Murder Row", model3D = 136777, title = "Nael Silvertongue", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=50.7, y=56.2, mapID = 2393, note = "do Flowers for Amalthea to see item" }
DVD.npcs[264056] = { zone = "Falconwing Square", model3D = 143986, title = "Decor Duel Vendor", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=31.6, y=76.7, mapID = 2393 }
DVD.npcs[255495] = { zone = "Falconwing Square", model3D = 106418, title = "Rae'ana", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=47.6, y=50.6, mapID = 2393, category = "renown" }
DVD.npcs[243359] = { zone = "The Bazaar", model3D = 138953, title = "Melaris", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=47, y=51.8, mapID = 2393, profession="alchemy" }
DVD.npcs[241451] = { zone = "The Bazaar", model3D = 138907, title = "Eriden", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=43.6, y=51.6, mapID = 2393, profession="blacksmithing" }
DVD.npcs[257914] = { zone = "The Bazaar", model3D = 140527, title = "Quelis", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=56.4, y=69.8, mapID = 2393, profession="cooking" }
DVD.npcs[243350] = { zone = "The Bazaar", model3D = 138944, title = "Lyna", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=47.8, y=53.6, mapID = 2393, profession="enchanting" }
DVD.npcs[241453] = { zone = "The Bazaar", model3D = 138909, title = "Yatheon", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=43.6, y=53.8, mapID = 2393, profession="engineering" }
DVD.npcs[256026] = { zone = "The Bazaar", model3D = 139450, title = "Irodalmin", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=48.2, y=51.6, mapID = 2393, profession="herbalism" }
DVD.npcs[243555] = { zone = "The Bazaar", model3D = 138961, title = "Lelorian", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=46.4, y=51.2, mapID = 2393, profession="inscriptionist" }
DVD.npcs[243353] = { zone = "The Bazaar", model3D = 138947, title = "Deynna", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=48.2, y=54.2, mapID = 2393, profession="tailoring" }

DVD.npcs[255114] = { zone = "Underground Den", model3D = 138651, title = "Maku", expansion = "Midnight", zoneGroup = "Harandar", faction = "neutral", x=62.5, y=34.4, mapID = 2576 }
DVD.npcs[240407] = { zone = "The Den", model3D = 137949, title = "Naynar", expansion = "Midnight", zoneGroup = "Harandar", faction = "neutral", x=51, y=50.7, mapID = 2413 }
DVD.npcs[251259] = { zone = "The Den", model3D = 136942, title = "Mothkeeper Wew'tam", expansion = "Midnight", zoneGroup = "Harandar", faction = "neutral", x=49.3, y=54.4, mapID = 2413 }
DVD.npcs[258507] = { zone = "The Den", model3D = 140811, title = "Mowaia", expansion = "Midnight", zoneGroup = "Harandar", faction = "neutral", x=52.2, y=54, mapID = 2413, profession="fishing" }
DVD.npcs[258540] = { zone = "Underground Den", model3D = 140815, title = "Hawli", expansion = "Midnight", zoneGroup = "Harandar", faction = "neutral", x=59.3, y=33.1, mapID = 2576, profession="mining" }
DVD.npcs[258480] = { zone = "Underground Den", model3D = 140800, title = "Amwa'ana", expansion = "Midnight", zoneGroup = "Harandar", faction = "neutral", x=57.3, y=32.6, mapID = 2576, profession="jewelcrafter" }

DVD.npcs[252873] = { zone = "Arcantina", model3D = 130151, title = "Morta Gage", expansion = "Midnight", zoneGroup = "Arcantina", faction = "neutral", x=42, y=50, mapID = 2541, note = "portal to get to her is in the Main inn" }

DVD.npcs[258328] = { zone = "Masters Perch", model3D = 140891, title = "Thraxadar", expansion = "Midnight", zoneGroup = "Voidstorm", faction = "neutral", x=39.4, y=81, mapID = 2444, category = "reputation" }
DVD.npcs[259922] = { zone = "The Howling Ridge", model3D = 142075, title = "Void Researcher Aemely", expansion = "Midnight", zoneGroup = "Voidstorm", faction = "neutral", x=52.6, y=72.8, mapID = 2405 }
DVD.npcs[248328] = { zone = "The Howling Ridge", model3D = 139916, title = "Void Researcher Anomander", expansion = "Midnight", zoneGroup = "Voidstorm", faction = "neutral", x=52.6, y=72.9, mapID = 2405, category = "renown" }
DVD.npcs[265581] = { zone = "Val or Naigtal", model3D = 109934, title = "Zuronar", expansion = "Midnight", zoneGroup = "Voidstorm", faction = "neutral", variableLocation=true, note = " Location may rotate between Val and Naigtal." }

DVD.npcs[240838] = { zone = "FairBreeze Village", model3D = 137812, title = "Caeris Fairdawn", expansion = "Midnight", zoneGroup = "Eversong Woods", faction = "neutral", x=43.47, y=47.44, mapID = 2395, category = "renown" }
DVD.npcs[259864] = { zone = "FairBreeze Village", model3D = 141933, title = "Sathren Azuredawn", expansion = "Midnight", zoneGroup = "Eversong Woods", faction = "neutral", x=43.2, y=47.5, mapID = 2395 }

DVD.npcs[242726] = { zone = "FairBreeze Village", model3D = 137811, title = "Neriv", expansion = "Midnight", zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.49, y=47.64, mapID = 2395, category = "subfaction" }
DVD.npcs[242724] = { zone = "FairBreeze Village", model3D = 137806, title = "Ranger Allorn", expansion = "Midnight", zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.46, y=47.55, mapID = 2395, category = "subfaction" }
DVD.npcs[242725] = { zone = "FairBreeze Village", model3D = 137809, title = "Armorer Goldcrest", expansion = "Midnight", zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.53, y=47.5, mapID = 2395, category = "subfaction" }
DVD.npcs[242723] = { zone = "FairBreeze Village", model3D = 137808, title = "Apprentice Diell", expansion = "Midnight", zoneGroup = "Silvermoon Court Vendors", faction = "neutral", x=43.53, y=47.5, mapID = 2395, category = "subfaction" }

DVD.npcs[240279] = { zone = "Amani'Zar Village", model3D = 141039, title = "Magovu", expansion = "Midnight", zoneGroup = "Zul'Aman", faction = "neutral", x=46, y=65.9, mapID = 2437, category = "renown" }
DVD.npcs[254944] = { zone = "Amani'Zar Village", model3D = 141092, title = "Tajaka Sawtusk", expansion = "Midnight", zoneGroup = "Zul'Aman", faction = "neutral", x=46, y=66.1, mapID = 2437 }
DVD.npcs[241928] = { zone = "Zul'Aman", model3D = 140057, title = "Chel the Chip", expansion = "Midnight", zoneGroup = "Zul'Aman", faction = "neutral", x=31.6, y=26.3, mapID = 2437, note = "He is located in each zone by all abundance entrances this is the main one though" }
DVD.npcs[260180] = { zone = "Zul'Aman Depths", model3D = 142239, title = "Depthdiver Tu'nakit", expansion = "Midnight", zoneGroup = "Zul'Aman", faction = "neutral", x=68.3, y=20.2, mapID = 2437 }
DVD.npcs[255098] = { zone = "Amani'Zar Village", model3D = 141051, title = "Jan'zel", expansion = "Midnight", zoneGroup = "Zul'Aman", faction = "neutral", x=45.2, y=69.8, mapID = 2437, profession="leatherworking" }
DVD.npcs[255095] = { zone = "Amani'Zar Village", model3D = 141050, title = "Kuvahn", expansion = "Midnight", zoneGroup = "Zul'Aman", faction = "neutral", x=45.2, y=69.6, mapID = 2437, profession="skinning" }

DVD.npcs[270399] = { zone = "Tokka's Landing", model3D = 130738, title = "Firetender Zab'ni", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=58.6, y=45.9, mapID = 2512 }
DVD.npcs[268228] = { zone = "Tokka's Landing", model3D = 141051, title = "Jan'sari the Watchful", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=58.6, y=45.9, mapID = 2512, category = "renown" }
DVD.npcs[257598] = { zone = "Tokka's Folly", model3D = 87552, title = "Second Mate Sluggs", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=51.6, y=49.8, mapID = 2512, category = "reputation" }
DVD.npcs[272751] = { zone = "Amani Foothold", model3D = 64062, title = "Skull of Er'inye", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=51.2, y=62.4, mapID = 2509 }
end

-------------------------------------------------
-- BOSS DROPS
-------------------------------------------------
DVD.bossdrops = DVD.bossdrops or {}
DVD.DecorCameraOverrides = DVD.DecorCameraOverrides or {}

DVD.DecorCameraOverrides = {
[197168] = { zoom = -32.0 }, --Dark Iron Chandelier
[4732009] = {zoom = -32.0}, --Hanging Dawn Flower
}

DVD.bossdrops = {
    {
    name = "Darkshore Rares",
	expansion = "Battle for Azeroth",
    items = {	  
	  { id = 241066, category = "rare",  name = "Forsaken Spiked Brazier", zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6431408, mapID = 62, note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
      { id = 245462, category = "rare",  name = "Banshee Queen's Banner",  zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 2530077,  mapID = 62,  note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
      { id = 245627, category = "rare",  name = "Elven Temple Brazier",  zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6938369, mapID = 62,  note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
      { id = 246110, category = "rare",  name = "Filigree Moon Sconce",  zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6980565,  mapID = 62,  note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
    {
    name = "Midnight Delves",
	expansion = "Midnight",
    items = {
      { id = 264330, category = "delve",  name = "Amani Hanging Brazier", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6075573, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 267009, category = "delve",  name = "Amani Training Dummy", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6212435, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 264258, category = "delve",  name = "Blossoming Forge", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6225683, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 264342, category = "delve",  name = "Cosmic Void Cache", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 7136759, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r"},
      { id = 251967, category = "delve",  name = "Fungarian Banner", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6225689, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 263036, category = "delve",  name = "Hanging Dawnflower", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 4732009, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 263042, category = "delve",  name = "Rootlight Lamppost", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6252874, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 263233, category = "delve",  name = "Sin'dorei Spinning Library", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6050885, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
	  { id = 264329, category = "delve",  name = "Amani Dining Table", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6075571, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
   {
    name = "The Venomous Abyss",
	expansion = "Midnight",
    items = {
      { id = 272361, category = "raid",  name = "Venomous Pyre", zone = "The Venomous Abyss", bossencounter = 2882, model3D = 7277208, mapID = 2608, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279500, category = "raid",  name = "Rage of the Shackled Mural", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 8117703, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279125, category = "raid",  name = "The Venomous Abyss Aureate Trophy", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 7930280, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279129, category = "raid",  name = "The Venomous Abyss Gleaming Trophy", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 7930281, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279127, category = "raid",  name = "The Venomous Abyss Argent Trophyl", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 7930282, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279118, category = "raid",  name = "Lost Explorers Mailbox", zone = "The Venomous Abyss", bossencounter = 2894, model3D = 1992950, mapID = 2609, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279115, category = "raid",  name = "Soulcoiler's Ritual Candle", zone = "The Venomous Abyss", bossencounter = 2888, model3D = 7515872, mapID = 2606, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279122, category = "raid",  name = "Venom-Fanged Font", zone = "The Venomous Abyss", bossencounter = 2887, model3D = 7277192, mapID = 2607, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279131, category = "raid",  name = "Pillar of the Coiled Isle", zone = "The Venomous Abyss", bossencounter = 2883, model3D = 7277190, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 244343, category = "raid",  name = "Vessel of the Howling Ossuary", zone = "The Venomous Abyss", bossencounter = 2871, model3D = 6870560, mapID = 2609, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 264716, category = "raid",  name = "Hexed Tomb Brazier", zone = "The Venomous Abyss", bossencounter = 2874, model3D = 6153828, mapID = 2608, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
   {
    name = "The Tidebound Grotto",
	expansion = "Midnight",
    items = {
      { id = 279112, category = "raid",  name = "Clumped Asteroidea", zone = "The Tidebound Grotto", bossencounter = 2849, model3D = 2433564, mapID = 2632, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
    {
    name = "Altar of Fangs",
	expansion = "Midnight",
    items = {
      { id = 279211, category = "dungeon",  name = "Pillar of the Fanged Altar", zone = "Altar of Fangs", bossencounter = 2880, model3D = 7277191, mapID = 2590, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "The Coiled Isle Delves",
	expansion = "Midnight",
    items = {
    { id = 267080, category = "delve",  name = "Amani Blueflame Chandelier", zone = "\n• Ring of Glory\n• Gnarldor ", bossevent = "The Coiled Isle Delves", model3D = 6153830, mapID = 2512, note = "|cffFFD700Right-click to pin locations on the map|r" },
	{ id = 275855, category = "delve",  name = "Zul'Aman Swamp Palm Sprout", zone = "\n• Ring of Glory\n• Gnarldor ", bossevent = "The Coiled Isle Delves", model3D = 5869189, mapID = 2512, note = "|cffFFD700Right-click to pin locations on the map|r" },
	{ id = 248963, category = "delve",  name = "Spirit-Touched Amani Mask", zone = "\n• Ring of Glory\n• Gnarldor ", bossevent = "The Coiled Isle Delves", model3D = 6163854, mapID = 2512, note = "|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
    {
    name = "The Arcanostorage Sphere",
	expansion = "Midnight",
    items = {
    { id = 253397, category = "decor",  name = "Revered Deepstone Table", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6654743, note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" },
	{ id = 245539, category = "decor",  name = "Elegant Enchanted Vanity", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6930643,  note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" },
	{ id = 253481, category = "decor",  name = "Masterful Sin'dorei Gravestone", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6036347,  note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" },
	{ id = 249923, category = "decor",  name = "Sin'dorei Golden Welcome", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 7216049, note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" },
	{ id = 254561, category = "decor",  name = "Ogre Champion's Prized Skull", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6654718,  note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" },
	{ id = 246958, category = "decor",  name = "Mastercrafted Fungal Row Planter", zone = "\n• Razorwind\n• Founders ", bossevent = "Weekly House Item", model3D = 6225703,  note = "Contained in:\n• The Arcanostorage Sphere\n\n|cffFFD700Requires a level 10 house to do the weekly quest|r" },
    }
  }, 
 {
    name = "Eastern Kingdoms",
	expansion = "Classic",
    items = {
      { id = 248332, category = "dungeon",  name = "Stormwind Footlocker", zone = "The Deadmines, Westfall", bossencounter = 95, model3D = 936398, mapID = 292, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 244655, category = "dungeon",  name = "Gilnean Circular Rug", zone = "Shadowfang Keep, Silverpine Forest", bossencounter = 100, model3D = 1379266, mapID = 315, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 246429, category = "dungeon",  name = "Dark Iron Chandelier", zone = "Blackrock Depths, Burning Steppes", bossencounter = 387, model3D = 197168, mapID = 243, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245435, category = "dungeon",  name = "Horde Battle Emblem", zone = "Upper Blackrock Spire, Burning Steppes", bossencounter = 1234, model3D = 1005505, mapID = 618, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },     
    }
  },
  {
    name = "Windrunner Spire",
	expansion = "Midnight",
    items = {
      { id = 256683, category = "dungeon",  name = "Silvermoon Training Dummy", zone = "Winderunner Spire, Eversong Woods", bossencounter = 2658, model3D = 6190527, mapID = 2499, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Magisters Terrace",
	expansion = "Midnight",
    items = {
      { id = 263230, category = "dungeon",  name = "Magister's Bookshelf", zone = "Magisters' Terrace, Isle of Quel'Danas", bossencounter = 2662, model3D = 6050875, mapID = 2520, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Murder Row",
	expansion = "Midnight",
    items = {
      { id = 263238, category = "dungeon",  name = "Illicit Long Table", zone = "Murder Row, Silvermoon City", bossencounter = 2682, model3D = 7296096, mapID = 2434, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 246857, category = "decor",  name = "Shu'halo Perspective Painting", zone = "Murder Row, Silvermoon City", bossevent = "Cravitz Lorent", model3D = 1600035, mapID = 2433, note = "13 of Sargle's Fortunes."},
    }
  },
  {
    name = "VoidSpire",
	expansion = "Midnight",
    items = {
      { id = 264497, category = "raid",  name = "Imperator's Torment Crystal", zone = "The Voidspire, Voidstorm", bossencounter = 2733, model3D = 7136760, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 264498, category = "raid",  name = "Voltaic Trigore Egg", zone = "The Voidspire, Voidstorm", bossencounter = 2734, model3D = 7302402, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 264491, category = "raid",  name = "Voidbound Holding Cell", zone = "The Voidspire, Voidstorm", bossencounter = 2735, model3D = 6210896, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 264494, category = "raid",  name = "Banded Domanaar Storage Crate", zone = "The Voidspire, Voidstorm", bossencounter = 2736, model3D = 6391990, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 262957, category = "raid",  name = "Tattered Vanguard Banner", zone = "The Voidspire, Voidstorm", bossencounter = 2737, model3D = 7115753, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      --{ id = 264500, zone = "", bossencounter = 2738, model3D = 7370900, mapID = 2530 },
      { id = 265951, category = "raid",  name = " Vanquisher's Aureate Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7550713, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 266887, category = "raid",  name = " Vanquisher's Gleaming Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7556294, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 268049, category = "raid",  name = " Vanquisher's Argent Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7633283, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 269269, category = "raid",  name = "Devouring Ritual Spire", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 6224355, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "March on Quel'Danas",
	expansion = "Midnight",
    items = {
      { id = 264187, category = "raid",  name = "Blessed Phoenix Egg", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2739, model3D = 7317243, mapID = 2533, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 264492, category = "raid",  name = "Chaotic Void Maw", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 6224353, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    --{ id = 265949, category = "raid",  name = " Vanquisher's Aureate Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7550710, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    -- { id = 266885, category = "raid",  name = "Vanquisher's Gleaming Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7556292, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 267646, category = "raid",  name = "Vanquisher's Argent Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7633282, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "The Blinding  Vale",
	expansion = "Midnight",
    items = {
      { id = 253451, category = "dungeon",  name = "Veilroot Fountain", zone = "The Binding Vale, Harandar", bossencounter = 2772, model3D = 6839738, mapID = 2500, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, 
    }
  },
    {
    name = "Sporefall",
	expansion = "Midnight",
    items = {
      { id = 247235, category = "raid",  name = "Luminous Rotshroom", zone = "Sporefall, Harandar", bossencounter = 2711, model3D = 6225707, mapID = 2427, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, 
    }
  },
  {
    name = "Den of Nalorakk",
	expansion = "Midnight",
    items = {
      { id = 264332, category = "dungeon",  name = "Amani Ritual Altar", zone = "Den of Nalorakk, Zul'Aman", bossencounter = 2778, model3D = 6153808, mapID = 2513, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "The Dreamrift",
	expansion = "Midnight",
    items = {
      { id = 264246, category = "raid",  name = "Eerie Iridescent Riftshroom", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 5746809, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      --{ id = 265950, category = "raid",  name = " Vanquisher's Aureate Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7550712, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      --{ id = 266886, category = "raid",  name = " Vanquisher's Gleaming Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7556293, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 267645, category = "raid",  name = " Vanquisher's Argent Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7633281, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Maisara Caverns",
	expansion = "Midnight",
    items = {
      { id = 264717, category = "dungeon",  name = "Amani Warding Hex", zone = "Maisara Caverns, Zul'aman", bossencounter = 2812, model3D = 6195760, mapID = 2501, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  }, 
    }
  },
    {
    name = "Voidstorm",
	expansion = "Midnight",
    items = {
	  { id = 262608, source = "drop", category = "daily",  name = "Void Elf Stool", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 6701001, mapID = 2405, note = "|cffFFD700Right-click to pin locations on the map|r" },
	  { id = 264343, source = "drop", category = "daily",  name = "Cosmic Void Gravitational Orb", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 7136761, mapID = 2405, note = "|cffFFD700Right-click to pin locations on the map|r" },
	  { id = 264483, source = "drop", category = "daily",  name = "Cosmic Void Campfire", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 6701007, mapID = 2405, note = "|cffFFD700Right-click to pin locations on the map|r" },	  
    }
  },
  {
    name = "Nexus-Point Xenas",
	expansion = "Midnight",
    items = {
      { id = 264338, category = "dungeon",  name = "Domanaar Control Console", zone = "Nexus-Point Xenas, Voidstorm", bossencounter = 2815, model3D = 6210900, mapID = 2556, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, 
    }
  },
    {
    name = "Voidscar Arena",
	expansion = "Midnight",
    items = {
      { id = 264336, category = "dungeon",  name = "Voidlight Brazier", zone = "Voidscar Arena, Voidstorm", bossencounter = 2793, model3D = 6210883, mapID = 2573, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, 
    }
  },
  {
    name = "Northrend",
	expansion = "Wrath of the Lich King",
    items = {
      { id = 267007, category = "dungeon",  name = "Eye of Acherus", zone = "Pit of Saron, IceCrown", bossencounter = 610, model3D = 328250, mapID = 184, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 258145, category = "daily",  name = "Cheese for Glowergold", zone = "Dalaran, Northrend", bossevent = "Cooking Daily", model3D = 6051297, mapID = 125, note = "This is a daily Cooking quest on both horde and alliance side"},

    }
  },
  {
    name = "Pandaria",
	expansion = "Mists of Pandaria",
    items = {
      { id = 246846, category = "dungeon",  name = "Tome of Pandaren Wisdom", zone = "Temple of the Jade Serpant, Jade Forest", bossencounter = 335, model3D = 534950, mapID = 429, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 253242, category = "raid",  name = "Horde Warlord's Throne", zone = "Siege of Orgrimmar, Vale of Eternal Blossoms", bossencounter = 869, model3D = 6905426, mapID = 567, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, 
	  { id = 248934, source = "treasure", category = "decor",  name = "Golden Cloud Serpent Treasure Chest", zone = "Jade Forest", bossevent = "Frederick the Fabulous", model3D = 629723, mapID = 371, note = "|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
  {
    name = "Draenor",
	expansion = "Warlords of Draenor",
    items = {
      { id = 251329, category = "daily", zone = "Shadowmoon Valley, Draenor", bossevent = "Shadowmoon Valley Missive", model3D = 878999, mapID = 539, faction = "alliance", note = "Requires Missive: Assault on Socrethar's Rise" },
	  { id = 241043, category = "daily", zone = "Shadowmoon Valley, Draenor", bossevent = "Shadowmoon Valley Missive", model3D = 875378, mapID = 539, faction = "alliance", note = "Missive: Assault on Shattrath Harbor"},
      { id = 251547, category = "daily", zone = "Shadowmoon Valley, Draenor", bossevent = "Shadowmoon Valley Missive", model3D = 915354, mapID = 539, faction = "alliance", note = "Missive: Assault on the Heart of Shattrath"},
      { id = 251331, category = "dungeon",  name = "Draenic Ottoman", zone = "Auchindoun, Talador", bossencounter = 1225, model3D = 1025872, mapID = 593, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245434, category = "dungeon",  name = "Orgrimmar Sconce", zone = "Iron Docks, Gorgrond", bossencounter = 1238, model3D = 1005503, mapID = 595, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 258744, category = "dungeon",  name = "Skyreach Circular Table", zone = "Skyreach, Spires of Arak", bossencounter = 968, model3D = 971695, mapID = 602, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Broken Isles",
	expansion = "Legion",
    items = {
      { id = 257724, category = "renown",  name = "Bloodtotem Banner", zone = "Highmountain", bossevent = "Highmountain Paragon Chest", model3D = 1313472, mapID = 750, note = "|cffFFD700Right-click to pin locations on the map|r"  },
	  { id = 245449, source = "treasure", category = "daily",  name = "Ancient Elven Highback Chair", zone = "Suramar", bossevent = "Withered Army Training", model3D = 1096835, mapID = 680, note = "|cffFFD700Right-click to pin locations on the map|r"  },
      { id = 238857, category = "dungeon",  name = "Moon-Blessed Storage Crate", zone = "Darkheart Thicket, Val'sharah", bossencounter = 1657, model3D = 1096755, mapID = 733, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245451, category = "dungeon",  name = "Thunder Totem Brazier", zone = "Neltharions Lair, Highmountain", bossencounter = 1687, model3D = 1313217, mapID = 731, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 247913, category = "dungeon",  name = "Ornate Suramar Table", zone = "Court of Stars, Suramar", bossencounter = 1720, model3D = 1361708, mapID = 763, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 256682, category = "raid",  name = "Magistrix's Garden Fountain", zone = "Nighthold, Suramar", bossencounter = 1751, model3D = 1405830, mapID = 766, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 241044, category = "dungeon",  name = "Argussian Crate", zone = "Seat of Triumvirate, Argus", bossencounter = 1982, model3D = 877007, mapID = 903, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 246865, category = "dungeon",  name = "Tome of Reliquary Insights", zone = "Karazhan, Deadwind Pass", bossencounter = 1838, model3D = 4335906, mapID = 822, expansion = "Legion", note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Kul Tiras",
	expansion = "Battle for Azeroth",
    items = {
      { id = 257928, category = "daily",  name = "Gnomeregan Recyli-Kiln", zone = "Mechagon Island", bossevent = "Junkwatt Depot Recycling", model3D = 2929684, mapID = 1462, note = "Strange Recycling Requisition" },
      { id = 246481, source = "drop", category = "daily",  name = "Retired Industrial Gnomegrabber", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1624683, mapID = 1462, note = "Self-Assembling Homeware Kit" },
      { id = 246599, source = "drop", category = "daily",  name = "Self-Sealing Stembarrel", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1842467, mapID = 1462, note = "Self-Assembling Homeware Kit" },
      { id = 246602, source = "drop", category = "daily",  name = "Small H.O.M.E. Cog", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 2067166, mapID = 1462, note = "Self-Assembling Homeware Kit" },
      { id = 246600, source = "drop", category = "daily",  name = "Small Mechanical Crate", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1842492, mapID = 1462, note = "Self-Assembling Homeware Kit" },
      { id = 246421, category = "dungeon",  name = "Stolen Ironforge Seat", zone = "Freehold, Tiragarde Sound", bossencounter = 2095, model3D = 197304, mapID = 936, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245681, category = "dungeon",  name = "Tidesage's Fireplace", zone = "Shrine of the Storm, Stormsong Valley", bossencounter = 2156, model3D = 6980179, mapID = 1040, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 267008, category = "raid",  name = "Crucible Votive Rack", zone = "Crucible of  Storms, Stormsong Valley", bossencounter = 2328, model3D = 1959305, mapID = 1345, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 255672, category = "dungeon",  name = "Gnomish Tesla Tower", zone = "Mechagon", bossencounter = 2331, model3D = 2745099, mapID = 1497, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
    {
    name = "Zandalar",
	expansion = "Battle for Azeroth",
    items = {
      { id = 278245, category = "dungeon",  name = "Royal Attendant's Coffin", zone = "Kings' Rest", bossencounter = 2172, model3D = 1981805, mapID = 1004, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 278982, category = "dungeon",  name = "Hatchery of Hissing Eggs", zone = "Temple of Sethraliss", bossencounter = 2145, model3D = 1660581, mapID = 1043, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Dragon Isles",
	expansion = "Dragonflight",
    items = {
      { id = 256354, category = "dungeon",  name = "Qalashi Goulash", zone = "Neltharus, Waking Shores", bossencounter = 2501, model3D = 4420033, mapID = 2080, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  },
      { id = 256428, category = "dungeon",  name = "Valdrakken Hanging Lamp", zone = "Ruby Life Pools, Waking Shores", bossencounter = 2503, model3D = 3883458, mapID = 2094, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  },
      { id = 260359, category = "dungeon",  name = "Valdrakken Bookcase", zone = "Algeth'ar Academy, Thaldraszus", bossencounter = 2514, model3D = 6431406, mapID = 2099, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  },
    }
  },
  {
    name = "Khaz Algar",
	expansion = "The War Within",
    items = {
      { id = 245294, category = "event", source = "drop", name = "Distinguished Actor's Chest" , zone = "Isle of Dorn", bossevent = "Theater Troupe", model3D = 5647269, mapID = 2248, note = "|cffFFD700Right-click to pin locations on the map|r"  },
      { id = 245320, category = "event", source = "drop", zone = "Undermine", bossevent = "Shipping and Handling Jobs", model3D = 5689822, mapID = 2346, note = "Requires Shipping and Handling Job Streak"   },
	  { id = 245315, category = "event", source = "treasure", zone = "Undermine", bossevent = "Scraps Heaps", model3D = 5788649, mapID = 2346, note = "Requires Scraps Heaps"   },
      { id = 245938, category = "dungeon",  name = "Overgrown Arathi Trellis", zone = "Priory of the Sacred Flame, Hallowfall", bossencounter = 2573, model3D = 5360239, mapID = 2309, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245560, category = "dungeon",  name = "Meadery Ochre Window", zone = "Cinderbrew Meadery, Isle of Dorn", bossencounter = 2589, model3D = 6924252, mapID = 2335, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 258268, category = "dungeon",  name = "Waxmaster's Candle Rack", zone = "DarkFlame Cleft, Ringing Deeps", bossencounter = 2561, model3D = 5503818, mapID = 2303, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
}

-------------------------------------------------
-- ACHIEVEMENTS
-------------------------------------------------
DVD.achievements = DVD.achievements or {}
--215
DVD.achievements = {
  {
    name = "Quests", --22
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
    }
  },
  {
    name = "Exploration", --24
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
    name = "Feats of Strength",--4
    achievements = {
      --[[Events]]{ id = 62387, type = "achievement", itemID = 260785, model3D = 7476464, title = "Mini Dark Portal", faction = "neutral" }, 
      --[[Events]]{ id = 63685, type = "achievement", itemID = 281107, model3D = 8198437, title = "Blizzcon Doormat", faction = "neutral" }, 	  
	  --[[PROMO]]{ id = 63343, type = "achievement", itemID = 274731, model3D = 7845475, title = "Prized Orb of Azeroth", faction = "neutral" },
	  --[[PROMO]]{ id = 63343, type = "achievement", itemID = 274734, model3D = 7845476, title = "Framed Horde Pride", faction = "neutral" },
	  --[[PROMO]]{ id = 63343, type = "achievement", itemID = 274736, model3D = 7845477, title = "Framed Alliance Pride", faction = "neutral" },
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

-------------------------------------------------
-- PROFESSIONS
-------------------------------------------------
DVD.professions = DVD.professions or {}

DVD.professions = {
  {
    name = "Junkyard Tinkering",
    items = {
      { id = 246596, category = "Junkyard Tinkering", expansion = "Battle for Azeroth", model3D= 1841734, spell = 1243780, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 166846, amount = 100}} },
      { id = 246595, category = "Junkyard Tinkering", expansion = "Battle for Azeroth", model3D= 1841733, spell = 1243783, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 166846, amount = 150}} },
      { id = 246485, category = "Junkyard Tinkering", expansion = "Battle for Azeroth", model3D= 2851774, spell = 1243803, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 3}, {id = 166970, amount = 9}} },
      { id = 246606, category = "Junkyard Tinkering", expansion = "Battle for Azeroth", model3D= 2967733, spell = 1243801, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 2}, {id = 166970, amount = 3}, {id = 168832, amount = 1}} },
      { id = 246482, category = "Junkyard Tinkering", expansion = "Battle for Azeroth", model3D= 1841735, spell = 1243788, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 1}, {id = 166970, amount = 1}} },
      { id = 246597, category = "Junkyard Tinkering", expansion = "Battle for Azeroth", model3D= 1842225, spell = 1243793, skill = "Junkyard Tinkering", skillNeeded = 1, reagents = {{id = 169610, amount = 2}} },
    }
  },
  {
    name = "Alchemy", --33
    items = {
{ id = 262355, category = "Alchemy", expansion = "Midnight", model3D = 6701005, spell = 1233132, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236952, amount = 2}, {id = 256963, amount = 12}, {id = 241281, amount = 4}, {id = 241283, amount = 1}} }, -- Entropic Illuminant
{ id = 253506, category = "Alchemy", expansion = "Midnight", model3D = 6865595, spell = 1233133, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236950, amount = 6}, {id = 256963, amount = 16}, {id = 241281, amount = 4}, {id = 241283, amount = 4}} }, -- Rootbound Vat
{ id = 256356, category = "Alchemy", expansion = "Midnight", model3D = 6024532, spell = 1233135, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236949, amount = 1}, {id = 256963, amount = 6}, {id = 241281, amount = 4}} }, -- Sunsmoke Censer
{ id = 262354, category = "Alchemy", expansion = "Midnight", model3D = 6700987, spell = 1233136, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236952, amount = 2}, {id = 256963, amount = 4}, {id = 241281, amount = 4}} }, -- Riftstone
{ id = 262356, category = "Alchemy", expansion = "Midnight", model3D = 6796712, spell = 1233137, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236950, amount = 1}, {id = 256963, amount = 4}, {id = 241281, amount = 4}} }, -- Haranir Preserving Agents
{ id = 257420, category = "Alchemy", expansion = "Midnight", model3D = 6023421, spell = 1233138, skill = "Midnight Alchemy", skillNeeded = 10, reagents = {{id = 236951, amount = 6}, {id = 236950, amount = 6}, {id = 256963, amount = 20}, {id = 241281, amount = 4}, {id = 241283, amount = 4}} }, -- Silvermoon Spire Fountain
{ id = 252758, category = "Alchemy", expansion = "The War Within", model3D = 5389585, spell = 1259673, skill = "Khaz Algar Alchemy", skillNeeded = 80, reagents = {{id = 248012, amount = 34}, {id = 221758, amount = 4}, {id = 226205, amount = 12}, {id = 213610, amount = 6}, {id = 212563, amount = 1}} }, -- Boulder Springs Hot Tub
{ id = 244318, category = "Alchemy", expansion = "Warlords of Draenor", model3D = 987248, spell = 1260985, skill = "Warlords of Draenor Alchemy", skillNeeded = 80, reagents = {{id = 251766, amount = 16}, {id = 113262, amount = 6}, {id = 117454, amount = 6}, {id = 108996, amount = 10}} }, -- Wine Barrel
{ id = 257043, category = "Alchemy", expansion = "Mists of Pandaria", model3D = 528627, spell = 1261233, skill = "Mists of Pandaria Alchemy", skillNeeded = 60, reagents = {{id = 251763, amount = 6}, {id = 72096, amount = 6}, {id = 72237, amount = 8}, {id = 76061, amount = 2}} }, -- Pandaren Alchemist's Retort
{ id = 245517, category = "Alchemy", expansion = "Cataclysm", model3D = 304249, spell = 1261255, skill = "Cataclysm Alchemy", skillNeeded = 60, reagents = {{id = 251764, amount = 30}, {id = 54849, amount = 16}, {id = 52326, amount = 40}, {id = 56850, amount = 6}, {id = 69237, amount = 1}} }, -- Gilnean Cauldron
{ id = 257041, category = "Alchemy", expansion = "Classic", model3D = 243479, spell = 1261495, skill = "Classic Alchemy", skillNeeded = 240, reagents = {{id = 245586, amount = 10}, {id = 20520, amount = 2}, {id = 2325, amount = 2}, {id = 3371, amount = 1}} }, -- Stoppered Black Potion
{ id = 257102, category = "Alchemy", expansion = "The War Within", model3D = 5201694, spell = 1261878, skill = "Khaz Algar Alchemy", skillNeeded = 80, reagents = {{id = 248012, amount = 8}, {id = 221763, amount = 2}, {id = 211806, amount = 1}, {id = 212245, amount = 3}} }, -- Nerubian Alchemist's Retort
{ id = 257052, category = "Alchemy", expansion = "Dragonflight", model3D = 4240488, spell = 1261882, skill = "Dragonflight Alchemy", skillNeeded = 80, reagents = {{id = 251773, amount = 7}, {id = 194874, amount = 1}, {id = 191474, amount = 1}, {id = 191384, amount = 3}} }, -- Dragon's Elixir Bottle
{ id = 248111, category = "Alchemy", expansion = "Dragonflight", model3D = 4204641, spell = 1261885, skill = "Dragonflight Alchemy", skillNeeded = 80, reagents = {{id = 251773, amount = 28}, {id = 190316, amount = 4}, {id = 191496, amount = 6}, {id = 190312, amount = 3}, {id = 192883, amount = 6}} }, -- Verdant Valdrakken Vase
{ id = 257050, category = "Alchemy", expansion = "Shadowlands", model3D = 3158888, spell = 1261958, skill = "Shadowlands Alchemy", skillNeeded = 140, reagents = {{id = 251772, amount = 12}, {id = 171292, amount = 3}, {id = 177061, amount = 2}, {id = 173170, amount = 2}} }, -- Veil-Secured Animacone
{ id = 257051, category = "Alchemy", expansion = "Shadowlands", model3D = 3184576, spell = 1261972, skill = "Shadowlands Alchemy", skillNeeded = 140, reagents = {{id = 251772, amount = 9}, {id = 171289, amount = 4}, {id = 183953, amount = 6}, {id = 173202, amount = 2}} }, -- Sintallow Candles
{ id = 257046, category = "Alchemy", expansion = "Battle for Azeroth", model3D = 2026782, spell = 1262005, skill = "Battle for Azeroth Alchemy", skillNeeded = 140, reagents = {{id = 251768, amount = 5}, {id = 3371, amount = 1}, {id = 152511, amount = 8}, {id = 152576, amount = 4}} }, -- Boralus Bottle Lamp
{ id = 257044, category = "Alchemy", expansion = "Warlords of Draenor", model3D = 984595, spell = 1262011, skill = "Warlords of Draenor Alchemy", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 127759, amount = 15}, {id = 109119, amount = 10}, {id = 108996, amount = 20}} }, -- Orcish Felblood Cauldron
{ id = 257047, category = "Alchemy", expansion = "Battle for Azeroth", model3D = 2026876, spell = 1262151, skill = "Battle for Azeroth Alchemy", skillNeeded = 140, reagents = {{id = 251768, amount = 12}, {id = 3371, amount = 3}, {id = 152510, amount = 3}} }, -- Zandalari Bottle Shipment
{ id = 257045, category = "Alchemy", expansion = "Legion", model3D = 1309272, spell = 1262152, skill = "Legion Alchemy", skillNeeded = 80, reagents = {{id = 251767, amount = 18}, {id = 124440, amount = 12}, {id = 124105, amount = 2}, {id = 127835, amount = 5}} }, -- Starry Scrying Pool
{ id = 256680, category = "Alchemy", expansion = "Legion", model3D = 1363069, spell = 1262154, skill = "Legion Alchemy", skillNeeded = 80, reagents = {{id = 251767, amount = 50}, {id = 124461, amount = 25}, {id = 124106, amount = 5}, {id = 127835, amount = 15}, {id = 127838, amount = 20}} }, -- Arcan'dor Cutting Fountain
{ id = 257100, category = "Alchemy", expansion = "Classic", model3D = 7658442, spell = 1262829, skill = "Classic Alchemy", skillNeeded = 240, reagents = {{id = 245586, amount = 40}, {id = 12808, amount = 16}, {id = 12360, amount = 12}, {id = 13468, amount = 8}, {id = 3371, amount = 6}} }, -- Apothecary's Worktable
{ id = 258214, category = "Alchemy", expansion = "Mists of Pandaria", model3D = 528655, spell = 1263548, skill = "Mists of Pandaria Alchemy", skillNeeded = 60, reagents = {{id = 251763, amount = 16}, {id = 72234, amount = 12}, {id = 76098, amount = 5}, {id = 72238, amount = 3}, {id = 3371, amount = 1}} }, -- Pandaren Alchemist's Kit
{ id = 258212, category = "Alchemy", expansion = "Wrath of the Lich King", model3D = 243528, spell = 1263558, skill = "Wrath of the Lich King Alchemy", skillNeeded = 60, reagents = {{id = 251762, amount = 20}, {id = 36905, amount = 10}, {id = 35627, amount = 4}, {id = 36908, amount = 3}, {id = 3371, amount = 1}} }, -- San'layn Blood Orb
{ id = 258213, category = "Alchemy", expansion = "Wrath of the Lich King", model3D = 243545, spell = 1263559, skill = "Wrath of the Lich King Alchemy", skillNeeded = 60, reagents = {{id = 251762, amount = 40}, {id = 40077, amount = 5}, {id = 33447, amount = 10}, {id = 36908, amount = 5}, {id = 35625, amount = 2}, {id = 43102, amount = 1}} }, -- Icecrown Plague Canister
{ id = 257694, category = "Alchemy", expansion = "Cataclysm", model3D = 304700, spell = 1269506, skill = "Cataclysm Alchemy", skillNeeded = 60, reagents = {{id = 251764, amount = 10}, {id = 52329, amount = 5}, {id = 52988, amount = 5}, {id = 52985, amount = 3}, {id = 3371, amount = 1}} }, -- Gilnean Green Potion
{ id = 264705, category = "Alchemy", expansion = "The Burning Crusade", model3D = 191966, spell = 1272712, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 6}, {id = 34440, amount = 5}, {id = 23449, amount = 4}, {id = 3371, amount = 1}} }, -- Glazed Sin'dorei Vial
{ id = 264709, category = "Alchemy", expansion = "The Burning Crusade", model3D = 198443, spell = 1272715, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 8}, {id = 3820, amount = 10}, {id = 21840, amount = 4}} }, -- Stranglekelp Sack
{ id = 264706, category = "Alchemy", expansion = "The Burning Crusade", model3D = 192707, spell = 1272723, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 16}, {id = 22861, amount = 4}, {id = 23573, amount = 3}, {id = 21884, amount = 4}} }, -- Shadow Council Torch
{ id = 264900, category = "Alchemy", expansion = "The Burning Crusade", model3D = 191826, spell = 1273064, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 10}, {id = 22789, amount = 5}, {id = 22785, amount = 3}, {id = 3371, amount = 1}} }, -- Arakkoan Alchemist's Bottle
{ id = 264899, category = "Alchemy", expansion = "The Burning Crusade", model3D = 191825, spell = 1273070, skill = "The Burning Crusade Alchemy", skillNeeded = 60, reagents = {{id = 242691, amount = 15}, {id = 22794, amount = 2}, {id = 22793, amount = 7}, {id = 22791, amount = 6}, {id = 3371, amount = 1}} }, -- Arakkoan Alchemist's Concoction
{ id = 279359, category = "Alchemy", expansion = "Midnight", model3D = 7880108, spell = 1296429, skill = "Midnight Alchemy", skillNeeded = 50, reagents = {{id = 274777, amount = 6}, {id = 236950, amount = 6}, {id = 256963, amount = 6}, {id = 241281, amount = 4}} }, -- Ersatz Venom Splatter	  
{ id = 284552, category = "Alchemy", expansion = "Shadowlands", model3D = 3154975, spell = 1316323, skill = "Shadowlands Alchemy", skillNeeded = 140, reagents = {{id = 251772, amount = 5}, {id = 171292, amount = 5}, {id = 171289, amount = 5}, {id = 3371, amount = 2}} }, -- Venthyr Alchemy Rack
    }
  },
  {
    name = "Blacksmithing", -- 30 3 missing
    items = {
{ id = 245312, category = "Blacksmithing", expansion = "The War Within", model3D = 5689818, spell = 1259675, skill = "Khaz Algar Blacksmithing", skillNeeded = 80, reagents = {{id = 248012, amount = 15}, {id = 221853, amount = 4}, {id = 222417, amount = 5}} }, -- Rusting Bolted Bench
{ id = 245323, category = "Blacksmithing", expansion = "The War Within", model3D = 5788112, spell = 1259681, skill = "Khaz Algar Blacksmithing", skillNeeded = 80, reagents = {{id = 248012, amount = 30}, {id = 222523, amount = 1}, {id = 222420, amount = 1}, {id = 222417, amount = 5}, {id = 221856, amount = 1}} }, -- Shredderwheel Storage Chest
{ id = 252397, category = "Blacksmithing", expansion = "Battle for Azeroth", model3D = 1733921, spell = 1260691, skill = "Battle for Azeroth Blacksmithing", skillNeeded = 140, reagents = {{id = 251768, amount = 18}, {id = 152579, amount = 20}, {id = 154898, amount = 15}} }, -- Brennadam Grinder
{ id = 252399, category = "Blacksmithing", expansion = "Battle for Azeroth", model3D = 1852119, spell = 1260692, skill = "Battle for Azeroth Blacksmithing", skillNeeded = 140, reagents = {{id = 251768, amount = 20}, {id = 152579, amount = 25}, {id = 160298, amount = 10}} }, -- Stormsong Stove
{ id = 247922, category = "Blacksmithing", expansion = "Legion", model3D = 1408526, spell = 1260693, skill = "Legion Blacksmithing", skillNeeded = 80, reagents = {{id = 251767, amount = 15}, {id = 124461, amount = 10}, {id = 124441, amount = 1}} }, -- Suramar Fence
{ id = 247909, category = "Blacksmithing", expansion = "Legion", model3D = 1360361, spell = 1260695, skill = "Legion Blacksmithing", skillNeeded = 80, reagents = {{id = 251767, amount = 10}, {id = 124461, amount = 5}, {id = 124441, amount = 1}} }, -- Suramar Fencepost
{ id = 245408, category = "Blacksmithing", expansion = "Legion", model3D = 6877807, spell = 1260698, skill = "Legion Blacksmithing", skillNeeded = 80, reagents = {{id = 251767, amount = 35}, {id = 124461, amount = 20}, {id = 133588, amount = 3}, {id = 124109, amount = 5}, {id = 133591, amount = 3}, {id = 133589, amount = 3}} }, -- Tauren Soup Pot
{ id = 245600, category = "Blacksmithing", expansion = "Warlords of Draenor", model3D = 6905311, spell = 1260987, skill = "Warlords of Draenor Blacksmithing", skillNeeded = 80, reagents = {{id = 251766, amount = 45}, {id = 109119, amount = 50}, {id = 113261, amount = 25}, {id = 120945, amount = 5}, {id = 109118, amount = 25}} }, -- Frostwall Forge
{ id = 245436, category = "Blacksmithing", expansion = "Warlords of Draenor", model3D = 1005512, spell = 1260988, skill = "Warlords of Draenor Blacksmithing", skillNeeded = 80, reagents = {{id = 251766, amount = 40}, {id = 109118, amount = 30}, {id = 110609, amount = 15}, {id = 118472, amount = 5}} }, -- Blackrock Weapon Rack
{ id = 247752, category = "Blacksmithing", expansion = "Mists of Pandaria", model3D = 6431405, spell = 1261234, skill = "Mists of Pandaria Blacksmithing", skillNeeded = 60, reagents = {{id = 251763, amount = 40}, {id = 72095, amount = 35}, {id = 76061, amount = 6}} }, -- Pandaren Fireplace
{ id = 247661, category = "Blacksmithing", expansion = "Mists of Pandaria", model3D = 520142, spell = 1261235, skill = "Mists of Pandaria Blacksmithing", skillNeeded = 60, reagents = {{id = 251763, amount = 25}, {id = 72104, amount = 3}, {id = 80433, amount = 4}, {id = 3857, amount = 5}} }, -- Pandaren Signal Brazier
{ id = 257042, category = "Blacksmithing", expansion = "Cataclysm", model3D = 304141, spell = 1261256, skill = "Cataclysm Blacksmithing", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 52186, amount = 12}, {id = 52327, amount = 6}} }, -- Gilnean Pitchfork
{ id = 257040, category = "Blacksmithing", expansion = "Wrath of the Lich King", model3D = 242964, spell = 1261327, skill = "Wrath of the Lich King Blacksmithing", skillNeeded = 60, reagents = {{id = 251762, amount = 40}, {id = 37663, amount = 8}, {id = 45087, amount = 6}, {id = 35624, amount = 4}} }, -- Dalaran Runic Anvil
{ id = 257035, category = "Blacksmithing", expansion = "The Burning Crusade", model3D = 192356, spell = 1261347, skill = "The Burning Crusade Blacksmithing", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23449, amount = 8}, {id = 22452, amount = 4}, {id = 21845, amount = 2}} }, -- Bronze Banner of the Exiled
{ id = 257039, category = "Blacksmithing", expansion = "The Burning Crusade", model3D = 538413, spell = 1261359, skill = "The Burning Crusade Blacksmithing", skillNeeded = 60, reagents = {{id = 242691, amount = 50}, {id = 23573, amount = 8}, {id = 23449, amount = 10}, {id = 21884, amount = 10}, {id = 25868, amount = 2}} }, -- Draenei Crystal Forge
{ id = 257036, category = "Blacksmithing", expansion = "The Burning Crusade", model3D = 192362, spell = 1261383, skill = "The Burning Crusade Blacksmithing", skillNeeded = 60, reagents = {{id = 242691, amount = 25}, {id = 23573, amount = 4}, {id = 23449, amount = 6}, {id = 22452, amount = 4}} }, -- Draenei Smith's Anvil
{ id = 246111, category = "Blacksmithing", expansion = "Classic", model3D = 6995868, spell = 1261497, skill = "Classic Blacksmithing", skillNeeded = 240, reagents = {{id = 245586, amount = 10}, {id = 11371, amount = 12}, {id = 17011, amount = 4}, {id = 14344, amount = 2}} }, -- Shadowforge Sconce
{ id = 246489, category = "Blacksmithing", expansion = "Classic", model3D = 7014377, spell = 1261499, skill = "Classic Blacksmithing", skillNeeded = 240, reagents = {{id = 245586, amount = 20}, {id = 11371, amount = 20}, {id = 12360, amount = 8}, {id = 12810, amount = 4}} }, -- Steel Ironforge Emblem
{ id = 256430, category = "Blacksmithing", expansion = "Dragonflight", model3D = 4695276, spell = 1261892, skill = "Dragonflight Blacksmithing", skillNeeded = 80, reagents = {{id = 251773, amount = 46}, {id = 204634, amount = 1}, {id = 193922, amount = 4}, {id = 190312, amount = 9}, {id = 191363, amount = 5}} }, -- Valdrakken Hanging Cauldron
{ id = 256427, category = "Blacksmithing", expansion = "Dragonflight", model3D = 3883456, spell = 1261896, skill = "Dragonflight Blacksmithing", skillNeeded = 80, reagents = {{id = 251773, amount = 42}, {id = 189541, amount = 12}, {id = 192849, amount = 1}, {id = 192843, amount = 1}, {id = 192846, amount = 1}, {id = 192837, amount = 1}, {id = 192840, amount = 1}} }, -- Wingrest Signal Brazier
{ id = 257049, category = "Blacksmithing", expansion = "Shadowlands", model3D = 3153975, spell = 1261980, skill = "Shadowlands Blacksmithing", skillNeeded = 80, reagents = {{id = 251772, amount = 8}, {id = 171832, amount = 3}, {id = 171828, amount = 5}, {id = 173109, amount = 1}, {id = 173171, amount = 1}} }, -- Bejeweled Venthyr Chalice
{ id = 257048, category = "Blacksmithing", expansion = "Shadowlands", model3D = 3022762, spell = 1261982, skill = "Shadowlands Blacksmithing", skillNeeded = 80, reagents = {{id = 251772, amount = 45}, {id = 172437, amount = 15}, {id = 171828, amount = 20}, {id = 173060, amount = 20}, {id = 173173, amount = 5}} }, -- Aspirant's Meditation Pool
{ id = 257409, category = "Blacksmithing", expansion = "Cataclysm", model3D = 311627, spell = 1262308, skill = "Cataclysm Blacksmithing", skillNeeded = 60, reagents = {{id = 251764, amount = 35}, {id = 54849, amount = 20}, {id = 52193, amount = 8}, {id = 52078, amount = 4}} }, -- Standing Smoke Lamp
{ id = 264710, category = "Blacksmithing", expansion = "Wrath of the Lich King", model3D = 243135, spell = 1272614, skill = "Wrath of the Lich King Blacksmithing", skillNeeded = 60, reagents = {{id = 251762, amount = 8}, {id = 37663, amount = 4}, {id = 36860, amount = 3}} }, -- Dalaran Sun Sconce
{ id = 264676, category = "Blacksmithing", expansion = "Wrath of the Lich King", model3D = 243143, spell = 1272662, skill = "Wrath of the Lich King Blacksmithing", skillNeeded = 60, reagents = {{id = 251762, amount = 30}, {id = 37663, amount = 6}, {id = 45087, amount = 4}, {id = 35622, amount = 2}} }, -- Dalaran Sewer Gate
{ id = 262451, category = "Blacksmithing", expansion = "Midnight", model3D = 6033614, spell = 1276108, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, -- Gilded Silvermoon Anvil
{ id = 262456, category = "Blacksmithing", expansion = "Midnight", model3D = 6209622, spell = 1276109, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 238197, amount = 12}, {id = 238202, amount = 3}, {id = 238204, amount = 3}, {id = 247725, amount = 1}} }, -- Ornamental Silvermoon Hanger
{ id = 262457, category = "Blacksmithing", expansion = "Midnight", model3D = 6209623, spell = 1276110, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 238197, amount = 12}, {id = 238202, amount = 3}, {id = 238204, amount = 3}, {id = 247725, amount = 1}} }, -- Gilded Silvermoon Hanger
{ id = 262460, category = "Blacksmithing", expansion = "Midnight", model3D = 6700980, spell = 1276111, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, -- Ren'dorei Anvil
{ id = 262452, category = "Blacksmithing", expansion = "Midnight", model3D = 6033619, spell = 1276112, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 238197, amount = 8}, {id = 238202, amount = 2}, {id = 238204, amount = 2}, {id = 247725, amount = 1}} }, -- Masterwork Crafting Hammer
{ id = 263709, category = "Blacksmithing", expansion = "Midnight", model3D = 6125155, spell = 1296495, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 16}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, -- Amani Forgemaster's Workbench
{ id = 275305, category = "Blacksmithing", expansion = "Midnight", model3D = 6212428, spell = 1296496, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 238197, amount = 8}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, -- Amani Forgemaster's Decorative Spear
{ id = 279329, category = "Blacksmithing", expansion = "Midnight", model3D = 6212431, spell = 1296497, skill = "Midnight Blacksmithing", skillNeeded = 50, reagents = {{id = 256963, amount = 16}, {id = 238197, amount = 18}, {id = 238202, amount = 5}, {id = 238204, amount = 5}, {id = 247725, amount = 1}} }, -- Amani Forgemaster's Rack 

{ id = 282124, category = "Blacksmithing", expansion = "Legion", model3D = 1608421, spell = 1313521, skill = "Legion Blacksmithing", skillNeeded = 85, reagents = {{id = 251767, amount = 12}, {id = 124461, amount = 3}, {id = 151564, amount = 50}} }, -- Gleaming Lightforge
{ id = 283260, category = "Blacksmithing", expansion = "Shadowlands", model3D = 3429594, spell = 1315292, skill = "Shadowlands Blacksmithing", skillNeeded = 85, reagents = {{id = 171833, amount = 6}, {id = 180733, amount = 3}, {id = 171831, amount = 20}, {id = 251772, amount = 8}} }, -- Anima-Powered Anvil
{ id = 283303, category = "Blacksmithing", expansion = "Kul Tiran", model3D = 2013143, spell = 1315468, skill = "Kul Tiran Blacksmithing", skillNeeded = 140, reagents = {{id = 251768, amount = 5}, {id = 152579, amount = 5}, {id = 152512, amount = 10}, {id = 180733, amount = 5}} }, -- Nomad's Steel Forge
    }
  },
  {
    name = "Cooking",
    items = {
      { id = 247220, category = "Cooking", expansion = "Mists of Pandaria", model3D= 643880, spell = 1266563, skill = "Mists of Pandaria Cooking", skillNeeded = 60, reagents = {{id = 251763, amount = 18}, {id = 74662, amount = 1}, {id = 74853, amount = 1}, {id = 74839, amount = 10}, {id = 74845, amount = 10}, {id = 74843, amount = 50}, {id = 259894, amount = 10}} },
      { id = 245428, category = "Cooking", expansion = "Warlords of Draenor", model3D= 960868, spell = 1266560, skill = "Warlords of Draenor Cooking", skillNeeded = 80, recipe = 260556, reagents = {{id = 251766, amount = 8}, {id = 109119, amount = 10}, {id = 111449, amount = 5}, {id = 115352, amount = 5}, {id = 259894, amount = 5}} },
      { id = 245484, category = "Cooking", expansion = "Battle for Azeroth", model3D= 1852909, spell = 1260337, skill = "Battle for Azeroth Cooking", skillNeeded = 140, reagents = {{id = 251768, amount = 8}, {id = 152579, amount = 4}, {id = 154886, amount = 5}, {id = 160711, amount = 2}, {id = 259894, amount = 5}} },
      { id = 246705, category = "Cooking", expansion = "Shadowlands", model3D= 3870812, spell = 1260334, skill = "Shadowlands Cooking", skillNeeded = 60, reagents = {{id = 251772, amount = 8}, {id = 171829, amount = 4}, {id = 172049, amount = 5}, {id = 172055, amount = 6}, {id = 259894, amount = 5}} },
      { id = 247225, category = "Cooking", expansion = "Dragonflight", model3D= 7109346, spell = 1260333, skill = "Dragonflight Cooking", skillNeeded = 80, reagents = {{id = 251773, amount = 25}, {id = 197745, amount = 2}, {id = 197774, amount = 3}, {id = 197776, amount = 4}, {id = 259894, amount = 15}, {id = 190312, amount = 4}} },
      { id = 247222, category = "Cooking", expansion = "Dragonflight", model3D= 7109343, spell = 1266555, skill = "Dragonflight Cooking", skillNeeded = 80, reagents = {{id = 251773, amount = 28}, {id = 197764, amount = 5}, {id = 197788, amount = 4}, {id = 259894, amount = 15}, {id = 189143, amount = 10}} },
      { id = 247224, category = "Cooking", expansion = "Dragonflight", model3D= 7109345, spell = 1260331, skill = "Dragonflight Cooking", skillNeeded = 80, reagents = {{id = 251773, amount = 22}, {id = 200953, amount = 5}, {id = 197756, amount = 6}, {id = 259894, amount = 15}, {id = 190312, amount = 4}} },
      { id = 239170, category = "Cooking", expansion = "The War Within", model3D= 5203802, spell = 1245993, skill = "Khaz Algar Cooking", skillNeeded = 80, recipe = 248013, reagents = {{id = 248012, amount = 15}, {id = 212508, amount = 2}, {id = 222737, amount = 25}, {id = 259894, amount = 10}, {id = 210930, amount = 15}, {id = 210933, amount = 5}, {id = 210936, amount = 5}} },
      { id = 246708, category = "Cooking", expansion = "The War Within", model3D= 5203791, spell = 1245995, skill = "Khaz Algar Cooking", skillNeeded = 80, reagents = {{id = 248012, amount = 10}, {id = 222739, amount = 10}, {id = 259894, amount = 10}, {id = 210930, amount = 10}, {id = 210936, amount = 5}} },
      { id = 246709, category = "Cooking", expansion = "The War Within", model3D= 5203794, spell = 1245994, skill = "Khaz Algar Cooking", skillNeeded = 80, reagents = {{id = 248012, amount = 5}, {id = 222737, amount = 10}, {id = 259894, amount = 5}, {id = 210930, amount = 8}} },
      { id = 245326, category = "Cooking", expansion = "The War Within", model3D= 5650143, spell = 1266541, skill = "Khaz Algar Cooking", skillNeeded = 80, reagents = {{id = 248012, amount = 25}, {id = 221754, amount = 4}, {id = 223971, amount = 1}, {id = 222705, amount = 2}, {id = 222731, amount = 2}, {id = 259894, amount = 15}} },
    }
  },
  {
    name = "Enchanting", --34 plus 3 missing
    items = {
{ id = 262458, category = "Enchanting", expansion = "Midnight", model3D = 6427291, spell = 1246902, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 243060, amount = 10}, {id = 256963, amount = 6}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 238204, amount = 6}} }, -- Animated Sin'dorei Pick
{ id = 262468, category = "Enchanting", expansion = "Midnight", model3D = 6861008, spell = 1246903, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 236952, amount = 10}, {id = 245881, amount = 20}, {id = 256963, amount = 8}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 242788, amount = 5}} }, -- Ren'dorei Postal Repository
{ id = 262450, category = "Enchanting", expansion = "Midnight", model3D = 6024551, spell = 1246904, skill = "Midnight Enchanting", skillNeeded = 80, reagents = {{id = 251665, amount = 50}, {id = 256963, amount = 12}, {id = 243599, amount = 30}, {id = 243602, amount = 5}, {id = 243605, amount = 5}} }, -- Ensorcelled Broom
{ id = 262455, category = "Enchanting", expansion = "Midnight", model3D = 6033624, spell = 1246905, skill = "Midnight Enchanting", skillNeeded = 80, reagents = {{id = 236951, amount = 10}, {id = 245882, amount = 10}, {id = 256963, amount = 6}, {id = 243599, amount = 30}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 242788, amount = 5}} }, -- Font of Gleaming Water
{ id = 262459, category = "Enchanting", expansion = "Midnight", model3D = 6427292, spell = 1246906, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 243060, amount = 10}, {id = 256963, amount = 6}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 238204, amount = 6}} }, -- Animated Sin'dorei Hammer
{ id = 262470, category = "Enchanting", expansion = "Midnight", model3D = 7009238, spell = 1246907, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 236949, amount = 10}, {id = 245881, amount = 20}, {id = 256963, amount = 10}, {id = 243599, amount = 20}, {id = 243602, amount = 10}, {id = 243605, amount = 3}} }, -- Spellbound Tome of Thalassian Magics
{ id = 262590, category = "Enchanting", expansion = "Midnight", model3D = 4928309, spell = 1246908, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 236950, amount = 10}, {id = 256963, amount = 16}, {id = 243602, amount = 15}, {id = 243605, amount = 5}, {id = 236774, amount = 10}} }, -- Rootflame Campfire
{ id = 246693, category = "Enchanting", expansion = "Midnight", model3D = 7033362, spell = 1246909, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 243602, amount = 10}, {id = 243605, amount = 5}, {id = 242787, amount = 5}} }, -- Self-Pouring Thalassian Sunwine
{ id = 253171, category = "Enchanting", expansion = "The War Within", model3D = 7262810, spell = 1259690, skill = "Khaz Algar Enchanting", skillNeeded = 80, reagents = {{id = 248012, amount = 40}, {id = 221754, amount = 6}, {id = 213610, amount = 5}, {id = 219952, amount = 8}, {id = 221859, amount = 6}} }, -- Replica Awakening Machine Stasis Pod
{ id = 253039, category = "Enchanting", expansion = "The War Within", model3D = 5149702, spell = 1259715, skill = "Khaz Algar Enchanting", skillNeeded = 80, reagents = {{id = 248012, amount = 10}, {id = 219949, amount = 4}, {id = 222417, amount = 2}, {id = 224108, amount = 2}} }, -- Dornogal Hanging Sconce
{ id = 247923, category = "Enchanting", expansion = "Legion", model3D = 1408528, spell = 1260700, skill = "Legion Enchanting", skillNeeded = 80, reagents = {{id = 251767, amount = 34}, {id = 124442, amount = 16}, {id = 124461, amount = 10}, {id = 124124, amount = 2}} }, -- Suramar Containment Cell
{ id = 245601, category = "Enchanting", expansion = "Warlords of Draenor", model3D = 6905328, spell = 1260990, skill = "Warlords of Draenor Enchanting", skillNeeded = 80, reagents = {{id = 251766, amount = 30}, {id = 113588, amount = 12}, {id = 113261, amount = 8}, {id = 113263, amount = 4}} }, -- Ancestral Signal Brazier
{ id = 251655, category = "Enchanting", expansion = "Warlords of Draenor", model3D = 7280505, spell = 1261008, skill = "Warlords of Draenor Enchanting", skillNeeded = 80, reagents = {{id = 251766, amount = 10}, {id = 111245, amount = 6}, {id = 109118, amount = 5}, {id = 111557, amount = 5}} }, -- Draenethyst String Lights
{ id = 257037, category = "Enchanting", expansion = "The Burning Crusade", model3D = 192427, spell = 1261331, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 22449, amount = 4}, {id = 22446, amount = 4}, {id = 22445, amount = 12}} }, -- Draenei Holo-Dais
{ id = 257038, category = "Enchanting", expansion = "The Burning Crusade", model3D = 192433, spell = 1261340, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 22449, amount = 4}, {id = 22446, amount = 4}, {id = 22445, amount = 12}} }, -- Draenei Holo-Path
{ id = 253250, category = "Enchanting", expansion = "Classic", model3D = 195048, spell = 1261501, skill = "Classic Enchanting", skillNeeded = 240, reagents = {{id = 245586, amount = 20}, {id = 16203, amount = 12}, {id = 12365, amount = 12}, {id = 17010, amount = 5}} }, -- Tirisfal Hollow Campfire
{ id = 256171, category = "Enchanting", expansion = "Dragonflight", model3D = 4326554, spell = 1261919, skill = "Dragonflight Enchanting", skillNeeded = 80, reagents = {{id = 251773, amount = 16}, {id = 193922, amount = 2}, {id = 190327, amount = 1}, {id = 194784, amount = 4}, {id = 194124, amount = 6}} }, -- Five Flights' Grimoire
{ id = 256170, category = "Enchanting", expansion = "Dragonflight", model3D = 4216958, spell = 1261933, skill = "Dragonflight Enchanting", skillNeeded = 80, reagents = {{id = 251773, amount = 50}, {id = 256171, amount = 1}, {id = 200113, amount = 5}, {id = 194784, amount = 9}, {id = 190312, amount = 10}} }, -- Draconic Scribe's Basin
{ id = 257098, category = "Enchanting", expansion = "Shadowlands", model3D = 3641039, spell = 1261998, skill = "Shadowlands Enchanting", skillNeeded = 90, reagents = {{id = 251772, amount = 6}, {id = 172230, amount = 4}, {id = 171832, amount = 3}} }, -- Venthyr Anima Bottle
{ id = 256681, category = "Enchanting", expansion = "Legion", model3D = 1363079, spell = 1262238, skill = "Legion Enchanting", skillNeeded = 80, reagents = {{id = 251767, amount = 48}, {id = 124461, amount = 25}, {id = 124441, amount = 25}, {id = 127835, amount = 10}, {id = 124124, amount = 3}} }, -- Nightspire Fountain
{ id = 257097, category = "Enchanting", expansion = "Mists of Pandaria", model3D = 591464, spell = 1262302, skill = "Mists of Pandaria Enchanting", skillNeeded = 60, reagents = {{id = 251763, amount = 30}, {id = 74248, amount = 15}, {id = 94289, amount = 4}, {id = 3857, amount = 5}} }, -- Intense Mogu Brazier
{ id = 257096, category = "Enchanting", expansion = "Mists of Pandaria", model3D = 522294, spell = 1262306, skill = "Mists of Pandaria Enchanting", skillNeeded = 60, reagents = {{id = 251763, amount = 8}, {id = 74247, amount = 9}, {id = 72988, amount = 4}, {id = 76061, amount = 2}} }, -- Pandaren Table Lamp
{ id = 257095, category = "Enchanting", expansion = "Cataclysm", model3D = 317822, spell = 1262318, skill = "Cataclysm Enchanting", skillNeeded = 60, reagents = {{id = 251764, amount = 20}, {id = 52722, amount = 8}, {id = 52328, amount = 20}, {id = 53039, amount = 2}, {id = 69237, amount = 1}} }, -- Twilight Fire Canister
{ id = 257404, category = "Enchanting", expansion = "Cataclysm", model3D = 304698, spell = 1262331, skill = "Cataclysm Enchanting", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 3371, amount = 1}, {id = 52555, amount = 6}, {id = 52325, amount = 3}} }, -- Pyrewood Glass Bottle
{ id = 257094, category = "Enchanting", expansion = "Wrath of the Lich King", model3D = 243044, spell = 1262824, skill = "Wrath of the Lich King Enchanting", skillNeeded = 60, reagents = {{id = 251762, amount = 12}, {id = 34057, amount = 2}, {id = 34055, amount = 6}, {id = 34054, amount = 8}} }, -- Mark of the Mages' Eye
{ id = 257101, category = "Enchanting", expansion = "Wrath of the Lich King", model3D = 242720, spell = 1262825, skill = "Wrath of the Lich King Enchanting", skillNeeded = 60, reagents = {{id = 251762, amount = 20}, {id = 34057, amount = 3}, {id = 34055, amount = 3}, {id = 41163, amount = 4}, {id = 41510, amount = 6}} }, -- Stampwhistle's Postal Portal
{ id = 257093, category = "Enchanting", expansion = "The Burning Crusade", model3D = 538417, spell = 1262828, skill = "The Burning Crusade Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 40}, {id = 22450, amount = 6}, {id = 22449, amount = 6}, {id = 22446, amount = 8}, {id = 22445, amount = 20}} }, -- Aldor Stellar Console
{ id = 258237, category = "Enchanting", expansion = "Shadowlands", model3D = 3036110, spell = 1263238, skill = "Shadowlands Enchanting", skillNeeded = 90, reagents = {{id = 251772, amount = 30}, {id = 172232, amount = 8}, {id = 172230, amount = 15}, {id = 177061, amount = 6}} }, -- Ardenweald Lamppost
{ id = 258559, category = "Enchanting", expansion = "Battle for Azeroth", model3D = 2057302, spell = 1263870, skill = "Battle for Azeroth Enchanting", skillNeeded = 140, reagents = {{id = 251768, amount = 35}, {id = 168185, amount = 30}, {id = 152877, amount = 2}, {id = 152875, amount = 15}, {id = 158186, amount = 10}} }, -- Tidesage's Totem
{ id = 258560, category = "Enchanting", expansion = "Battle for Azeroth", model3D = 2438950, spell = 1263877, skill = "Battle for Azeroth Enchanting", skillNeeded = 140, reagents = {{id = 251768, amount = 6}, {id = 152876, amount = 4}, {id = 152541, amount = 2}, {id = 154165, amount = 1}} }, -- Drust Enchanter's Rod
{ id = 263027, category = "Enchanting", expansion = "Classic", model3D = 203845, spell = 1270459, skill = "Classic Enchanting", skillNeeded = 240, reagents = {{id = 245586, amount = 30}, {id = 12808, amount = 16}, {id = 14344, amount = 12}, {id = 16203, amount = 8}, {id = 20520, amount = 8}} }, -- Darkmaster's Mystical Brazier
{ id = 268038, category = "Enchanting", expansion = "Midnight", model3D = 7009238, spell = 1281342, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 30}, {id = 236949, amount = 20}, {id = 245881, amount = 50}, {id = 243599, amount = 50}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 245805, amount = 2}} }, -- Endless Codex of Blooming Light
{ id = 268039, category = "Enchanting", expansion = "Midnight", model3D = 7009238, spell = 1281348, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 30}, {id = 236951, amount = 20}, {id = 245881, amount = 50}, {id = 243599, amount = 50}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 245805, amount = 2}} }, -- Endless Codex of Nature's Grace
{ id = 268041, category = "Enchanting", expansion = "Midnight", model3D = 7009238, spell = 1281349, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 30}, {id = 236952, amount = 20}, {id = 245881, amount = 50}, {id = 243599, amount = 50}, {id = 243602, amount = 10}, {id = 243605, amount = 3}, {id = 245801, amount = 2}} }, -- Endless Codex of the Voidtouched
{ id = 279332, category = "Enchanting", expansion = "Midnight", model3D = 6195676, spell = 1296498, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 274781, amount = 8}, {id = 243599, amount = 12}, {id = 243602, amount = 6}} }, -- Keen Hex Mask
{ id = 279362, category = "Enchanting", expansion = "Midnight", model3D = 6163852, spell = 1296499, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 274777, amount = 6}, {id = 243599, amount = 12}, {id = 243602, amount = 6}} }, -- Furious Tiki Mask
{ id = 279335, category = "Enchanting", expansion = "Midnight", model3D = 7143556, spell = 1296500, skill = "Midnight Enchanting", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 274781, amount = 6}, {id = 238383, amount = 1}, {id = 243599, amount = 25}} }, -- Enchanted Voidwell Fish

{ id = 265331, category = "Enchanting", expansion = "Outland", model3D = 192430, spell = 1313520, skill = "Outland Enchanting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 22449, amount = 4}, {id = 22446, amount = 4}, {id = 22445, amount = 12}} }, -- Draenei Holo-Junction
{ id = 282140, category = "Enchanting", expansion = "Legion", model3D = 1616779, spell = 1313525, skill = "Legion Enchanting", skillNeeded = 85, reagents = {{id = 251767, amount = 8}, {id = 124461, amount = 2}, {id = 151568, amount = 3}, {id = 151564, amount = 40}} }, -- Shimmering Lightforged Canister
    }
  },
  {
    name = "Engineering", --37
    items = {
{ id = 262618, category = "Engineering", expansion = "Midnight", model3D = 7119312, spell = 1248610, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 10}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 4}, {id = 247725, amount = 1}} }, -- Ren'dorei Void Projector
{ id = 263049, category = "Engineering", expansion = "Midnight", model3D = 6210884, spell = 1248611, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 6}, {id = 247725, amount = 1}} }, -- Ren'dorei Lightpost
{ id = 246460, category = "Engineering", expansion = "Midnight", model3D = 6427295, spell = 1248612, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 5}, {id = 247725, amount = 1}} }, -- Ambient Aethercharged Crystal
{ id = 262465, category = "Engineering", expansion = "Midnight", model3D = 6700990, spell = 1248613, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 16}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 10}, {id = 247725, amount = 1}} }, -- Ren'dorei Stargazer
{ id = 262789, category = "Engineering", expansion = "Midnight", model3D = 5661242, spell = 1248614, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 8}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 2}, {id = 247725, amount = 1}} }, -- Small Telogrus Lamp
{ id = 262617, category = "Engineering", expansion = "Midnight", model3D = 6980931, spell = 1248615, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 10}, {id = 247725, amount = 1}} }, -- Ren'dorei Crafting Framework
{ id = 262602, category = "Engineering", expansion = "Midnight", model3D = 6404236, spell = 1248616, skill = "Midnight Engineering", skillNeeded = 0, reagents = {{id = 256963, amount = 14}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 6}, {id = 247725, amount = 1}} }, -- Ren'dorei Warp Orb
{ id = 248113, category = "Engineering", expansion = "Dragonflight", model3D = 4222966, spell = 1259404, skill = "Dragonflight Engineering", skillNeeded = 80, reagents = {{id = 251773, amount = 25}, {id = 192876, amount = 2}, {id = 198183, amount = 4}, {id = 198198, amount = 4}, {id = 198186, amount = 4}} }, -- Thaldraszus Telescope
{ id = 246066, category = "Engineering", expansion = "The War Within", model3D = 6914980, spell = 1259724, skill = "Khaz Algar Engineering", skillNeeded = 80, reagents = {{id = 248012, amount = 12}, {id = 213399, amount = 6}, {id = 221856, amount = 6}, {id = 221865, amount = 1}} }, -- Schmancy Goblin String Lights
{ id = 253252, category = "Engineering", expansion = "The War Within", model3D = 5464693, spell = 1259778, skill = "Khaz Algar Engineering", skillNeeded = 80, reagents = {{id = 248012, amount = 42}, {id = 221756, amount = 1}, {id = 212498, amount = 1}, {id = 221859, amount = 6}, {id = 221868, amount = 10}, {id = 221853, amount = 18}, {id = 222417, amount = 15}} }, -- Replica Rumbling Wastes Drill Pod
{ id = 246604, category = "Engineering", expansion = "Battle for Azeroth", model3D = 2816738, spell = 1260349, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 42}, {id = 152579, amount = 30}, {id = 152512, amount = 35}, {id = 163569, amount = 20}, {id = 166970, amount = 5}} }, -- Deactivated Atomic Recalibrator 
{ id = 246486, category = "Engineering", expansion = "Battle for Azeroth", model3D = 6699744, spell = 1260352, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 45}, {id = 163569, amount = 18}, {id = 160502, amount = 15}, {id = 152579, amount = 10}, {id = 152512, amount = 20}, {id = 166970, amount = 1}} }, -- Gnomish Tesla Mega-Coil
{ id = 246500, category = "Engineering", expansion = "Battle for Azeroth", model3D = 2765483, spell = 1260425, skill = "Battle for Azeroth Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 16}, {id = 163569, amount = 6}, {id = 152579, amount = 8}, {id = 152512, amount = 8}, {id = 154123, amount = 1}} }, -- Mechagon Miniature Artificial Sun
{ id = 251482, category = "Engineering", expansion = "Warlords of Draenor", model3D = 928023, spell = 1261025, skill = "Warlords of Draenor Engineering", skillNeeded = 80, reagents = {{id = 251766, amount = 20}, {id = 109118, amount = 20}, {id = 113588, amount = 3}, {id = 113264, amount = 12}} }, -- Draenei Stargazer's Telescope
{ id = 244314, category = "Engineering", expansion = "Warlords of Draenor", model3D = 979341, spell = 1261027, skill = "Warlords of Draenor Engineering", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 109119, amount = 15}, {id = 109118, amount = 10}, {id = 114931, amount = 5}, {id = 39354, amount = 2}} }, -- Frostwall Architect's Table
{ id = 247733, category = "Engineering", expansion = "Mists of Pandaria", model3D = 526861, spell = 1261236, skill = "Mists of Pandaria Engineering", skillNeeded = 60, reagents = {{id = 251763, amount = 30}, {id = 72095, amount = 20}, {id = 77467, amount = 12}, {id = 76061, amount = 8}, {id = 3857, amount = 10}} }, -- Halfhill Cookpot
{ id = 245602, category = "Engineering", expansion = "Cataclysm", model3D = 6930893, spell = 1261258, skill = "Cataclysm Engineering", skillNeeded = 60, reagents = {{id = 251764, amount = 40}, {id = 53039, amount = 4}, {id = 60224, amount = 8}, {id = 53010, amount = 6}} }, -- Gilnean Problem Solver
{ id = 246700, category = "Engineering", expansion = "Classic", model3D = 197653, spell = 1261504, skill = "Classic Engineering", skillNeeded = 240, reagents = {{id = 245586, amount = 25}, {id = 16000, amount = 4}, {id = 16006, amount = 4}, {id = 7078, amount = 4}, {id = 14048, amount = 8}} }, -- Gnomish Steam-Powered Bed
{ id = 246410, category = "Engineering", expansion = "Classic", model3D = 197212, spell = 1261509, skill = "Classic Engineering", skillNeeded = 240, reagents = {{id = 245586, amount = 40}, {id = 11371, amount = 12}, {id = 16006, amount = 8}, {id = 7076, amount = 8}, {id = 15994, amount = 6}} }, -- Dark Iron Table Saw
{ id = 257689, category = "Engineering", expansion = "Cataclysm", model3D = 305999, spell = 1262340, skill = "Cataclysm Engineering", skillNeeded = 60, reagents = {{id = 251764, amount = 50}, {id = 54849, amount = 15}, {id = 60224, amount = 6}, {id = 52976, amount = 12}, {id = 67749, amount = 5}} }, -- Small Gilnean Windmill
{ id = 258253, category = "Engineering", expansion = "Dragonflight", model3D = 4420607, spell = 1263237, skill = "Dragonflight Engineering", skillNeeded = 80, reagents = {{id = 251773, amount = 50}, {id = 190324, amount = 4}, {id = 198487, amount = 20}, {id = 201406, amount = 2}, {id = 198183, amount = 8}, {id = 198192, amount = 7}, {id = 198198, amount = 9}} }, -- Titanic Tyrhold Fountain
{ id = 258240, category = "Engineering", expansion = "Shadowlands", model3D = 3154869, spell = 1263239, skill = "Shadowlands Engineering", skillNeeded = 80, reagents = {{id = 251772, amount = 18}, {id = 171829, amount = 6}, {id = 173110, amount = 2}, {id = 172935, amount = 4}, {id = 173173, amount = 2}} }, -- Kyrian Anima Barrel
{ id = 258252, category = "Engineering", expansion = "Shadowlands", model3D = 4005944, spell = 1263240, skill = "Shadowlands Engineering", skillNeeded = 80, reagents = {{id = 251772, amount = 42}, {id = 171441, amount = 1}, {id = 172934, amount = 8}, {id = 171428, amount = 15}, {id = 172936, amount = 6}, {id = 172935, amount = 4}} }, -- Cartel Xy Capture Crate
{ id = 258226, category = "Engineering", expansion = "Legion", model3D = 1355598, spell = 1263319, skill = "Legion Engineering", skillNeeded = 80, reagents = {{id = 251767, amount = 22}, {id = 132514, amount = 1}, {id = 124461, amount = 15}} }, -- Dalaran Auto-Hammer
{ id = 258225, category = "Engineering", expansion = "Legion", model3D = 1355533, spell = 1263338, skill = "Legion Engineering", skillNeeded = 80, reagents = {{id = 251767, amount = 28}, {id = 124461, amount = 20}, {id = 136637, amount = 15}, {id = 136633, amount = 10}, {id = 130183, amount = 3}} }, -- Failed Failure Detection Pylon
{ id = 258216, category = "Engineering", expansion = "Mists of Pandaria", model3D = 666489, spell = 1263551, skill = "Mists of Pandaria Engineering", skillNeeded = 60, reagents = {{id = 251763, amount = 50}, {id = 72095, amount = 40}, {id = 77468, amount = 30}, {id = 77467, amount = 16}, {id = 87872, amount = 4}} }, -- Reconstructed Mogu Lightning Drill
{ id = 258194, category = "Engineering", expansion = "The Burning Crusade", model3D = 192446, spell = 1263643, skill = "The Burning Crusade Engineering", skillNeeded = 60, reagents = {{id = 242691, amount = 50}, {id = 32423, amount = 50}, {id = 23783, amount = 12}, {id = 23786, amount = 4}, {id = 23785, amount = 3}} }, -- Tempest Keep Cryo-Pod
{ id = 258193, category = "Engineering", expansion = "The Burning Crusade", model3D = 192441, spell = 1263654, skill = "The Burning Crusade Engineering", skillNeeded = 60, reagents = {{id = 242691, amount = 25}, {id = 23787, amount = 6}, {id = 23786, amount = 2}} }, -- Draenei Holo-Projector Pedestal
{ id = 258196, category = "Engineering", expansion = "The Burning Crusade", model3D = 192461, spell = 1263663, skill = "The Burning Crusade Engineering", skillNeeded = 60, reagents = {{id = 242691, amount = 15}, {id = 23783, amount = 6}, {id = 23782, amount = 4}} }, -- Draenei Transmitter
{ id = 264711, category = "Engineering", expansion = "Wrath of the Lich King", model3D = 244205, spell = 1272676, skill = "Wrath of the Lich King Engineering", skillNeeded = 60, reagents = {{id = 251762, amount = 46}, {id = 41163, amount = 20}, {id = 39683, amount = 8}, {id = 39682, amount = 4}, {id = 39681, amount = 2}} }, -- Joybuzz's Joyful Wall of Trains
{ id = 264708, category = "Engineering", expansion = "Wrath of the Lich King", model3D = 197708, spell = 1272688, skill = "Wrath of the Lich King Engineering", skillNeeded = 60, reagents = {{id = 251762, amount = 28}, {id = 44501, amount = 2}, {id = 39681, amount = 12}, {id = 39682, amount = 4}} }, -- Home Defense Gadget
{ id = 264707, category = "Engineering", expansion = "Wrath of the Lich King", model3D = 197671, spell = 1272707, skill = "Wrath of the Lich King Engineering", skillNeeded = 60, reagents = {{id = 251762, amount = 20}, {id = 41163, amount = 20}, {id = 39681, amount = 2}} }, -- Resizable All-Purpose Gear
{ id = 279337, category = "Engineering", expansion = "Midnight", model3D = 6715093, spell = 1296501, skill = "Midnight Engineering", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 3}, {id = 243576, amount = 3}, {id = 247725, amount = 1}} }, -- Coiled Amani Hookshot
{ id = 279339, category = "Engineering", expansion = "Midnight", model3D = 1852970, spell = 1296502, skill = "Midnight Engineering", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 5}, {id = 243576, amount = 5}, {id = 247725, amount = 1}} }, -- Proudmoore Ship-in-a-Bottle
{ id = 279341, category = "Engineering", expansion = "Midnight", model3D = 1668078, spell = 1296503, skill = "Midnight Engineering", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 243581, amount = 5}, {id = 243578, amount = 5}, {id = 243574, amount = 10}, {id = 243576, amount = 5}, {id = 247725, amount = 1}} }, -- Aetherlume Field Lamp		

{ id = 282144, category = "Engineering", expansion = "Legion", model3D = 1660051, spell = 1313527, skill = "Legion Engineering", skillNeeded = 85, reagents = {{id = 251767, amount = 9}, {id = 124461, amount = 5}, {id = 151564, amount = 20}, {id = 151568, amount = 1}} }, -- Lightforged Recall Beacon
{ id = 283291, category = "Engineering", expansion = "Kul Tiran", model3D = 1674748, spell = 1315426, skill = "Kul Tiran Engineering", skillNeeded = 140, reagents = {{id = 251768, amount = 5}, {id = 163569, amount = 10}, {id = 152512, amount = 8}, {id = 152579, amount = 8}} }, -- Nomad's Campfire Grill
    }
  },
  {
    name = "Inscription", --82
    items = {
{ id = 262612, category = "Inscription", expansion = "Midnight", model3D = 6701016, spell = 1248619, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 245764, amount = 4}, {id = 245766, amount = 4}, {id = 247725, amount = 1}} }, -- Sturdy Ren'dorei Cask
{ id = 262790, category = "Inscription", expansion = "Midnight", model3D = 5915398, spell = 1248620, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 10}, {id = 245764, amount = 4}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- Restful Bronze Bench
{ id = 262464, category = "Inscription", expansion = "Midnight", model3D = 6700989, spell = 1248621, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 10}, {id = 245764, amount = 2}, {id = 245766, amount = 4}, {id = 247725, amount = 1}} }, -- Floating Void-Touched Tome
{ id = 262594, category = "Inscription", expansion = "Midnight", model3D = 6050872, spell = 1248622, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 12}, {id = 245764, amount = 4}, {id = 245766, amount = 6}, {id = 247725, amount = 1}} }, -- Homely Sin'dorei Shelf
{ id = 262616, category = "Inscription", expansion = "Midnight", model3D = 6935640, spell = 1248623, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 4}, {id = 245764, amount = 3}, {id = 245766, amount = 1}, {id = 247725, amount = 1}} }, -- Lively Songwriter's Quill
{ id = 262598, category = "Inscription", expansion = "Midnight", model3D = 6103388, spell = 1248624, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 4}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- Opened Sin'dorei Scroll
{ id = 262597, category = "Inscription", expansion = "Midnight", model3D = 6074149, spell = 1248625, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- Gilded Eversong Book
{ id = 262615, category = "Inscription", expansion = "Midnight", model3D = 6935637, spell = 1248626, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 4}, {id = 245764, amount = 1}, {id = 245766, amount = 1}, {id = 247725, amount = 1}} }, -- Sin'dorei Phoenix Quill
{ id = 262595, category = "Inscription", expansion = "Midnight", model3D = 6050877, spell = 1248627, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 245764, amount = 2}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- Homely Wall Shelves
{ id = 262601, category = "Inscription", expansion = "Midnight", model3D = 6326918, spell = 1248628, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 245764, amount = 3}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- Wild Hanging Scroll
{ id = 253508, category = "Inscription", expansion = "Midnight", model3D = 6330347, spell = 1248630, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 245764, amount = 2}, {id = 245766, amount = 4}, {id = 247725, amount = 1}} }, -- Harandar Signpost
{ id = 263034, category = "Inscription", expansion = "Midnight", model3D = 7476200, spell = 1248631, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 24}, {id = 245764, amount = 10}, {id = 245766, amount = 8}, {id = 247725, amount = 1}} }, -- Magnificent Towering Bookcase
{ id = 248118, category = "Inscription", expansion = "Dragonflight", model3D = 4317323, spell = 1259422, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 15}, {id = 194784, amount = 15}, {id = 194751, amount = 3}, {id = 194856, amount = 5}, {id = 194850, amount = 4}} }, -- Literature of the Blue Dragonflight
{ id = 248120, category = "Inscription", expansion = "Dragonflight", model3D = 4317325, spell = 1259429, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 16}, {id = 194784, amount = 16}, {id = 194751, amount = 7}, {id = 194856, amount = 5}} }, -- Literature of the Red Dragonflight
{ id = 248119, category = "Inscription", expansion = "Dragonflight", model3D = 4317324, spell = 1259433, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 16}, {id = 194784, amount = 16}, {id = 194850, amount = 6}, {id = 194856, amount = 3}, {id = 194751, amount = 2}} }, -- Literature of the Green Dragonflight
{ id = 248106, category = "Inscription", expansion = "Dragonflight", model3D = 3917374, spell = 1259441, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 10}, {id = 194850, amount = 3}, {id = 190395, amount = 8}} }, -- Valdrakken Banded Barrel
{ id = 248107, category = "Inscription", expansion = "Dragonflight", model3D = 3917382, spell = 1259451, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 10}, {id = 194751, amount = 4}, {id = 190395, amount = 8}} }, -- Valdrakken Storage Crate
{ id = 248108, category = "Inscription", expansion = "Dragonflight", model3D = 3917383, spell = 1259461, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 14}, {id = 194751, amount = 6}, {id = 190395, amount = 10}} }, -- Long Valdrakken Storage Crate
{ id = 253167, category = "Inscription", expansion = "The War Within", model3D = 4906204, spell = 1259784, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 18}, {id = 222417, amount = 2}, {id = 222609, amount = 2}} }, -- Forgeground Market Bins
{ id = 253022, category = "Inscription", expansion = "The War Within", model3D = 4902723, spell = 1259796, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 50}, {id = 226204, amount = 30}, {id = 212508, amount = 2}, {id = 222615, amount = 9}, {id = 222555, amount = 4}} }, -- Dornogal Bookcase
{ id = 253169, category = "Inscription", expansion = "The War Within", model3D = 5128194, spell = 1259805, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 26}, {id = 222523, amount = 1}, {id = 222609, amount = 3}, {id = 222417, amount = 5}, {id = 212664, amount = 2}} }, -- Meadery Storage Chest
{ id = 253036, category = "Inscription", expansion = "The War Within", model3D = 4896176, spell = 1259818, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 35}, {id = 221754, amount = 3}, {id = 222558, amount = 3}, {id = 222555, amount = 6}} }, -- Freywold Table
{ id = 253164, category = "Inscription", expansion = "The War Within", model3D = 4896178, spell = 1260005, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 15}, {id = 222417, amount = 1}, {id = 222609, amount = 2}} }, -- Algari Fence
{ id = 253165, category = "Inscription", expansion = "The War Within", model3D = 4896180, spell = 1260044, skill = "Khaz Algar Inscription", skillNeeded = 80, reagents = {{id = 248012, amount = 10}, {id = 222417, amount = 1}, {id = 222609, amount = 1}} }, -- Algari Fencepost
{ id = 245416, category = "Inscription", expansion = "Battle for Azeroth", model3D = 6877805, spell = 1260508, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 10}, {id = 152512, amount = 6}, {id = 158188, amount = 4}} }, -- Zuldazar Fencepost
{ id = 245415, category = "Inscription", expansion = "Battle for Azeroth", model3D = 6877806, spell = 1260564, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 15}, {id = 152512, amount = 18}, {id = 158188, amount = 8}} }, -- Zuldazar Fence
{ id = 245499, category = "Inscription", expansion = "Battle for Azeroth", model3D = 1597475, spell = 1260577, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 35}, {id = 158187, amount = 20}, {id = 152512, amount = 24}} }, -- Gilded Zandalari Table
{ id = 252035, category = "Inscription", expansion = "Battle for Azeroth", model3D = 1602488, spell = 1260583, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 6}, {id = 160711, amount = 5}, {id = 152576, amount = 10}} }, -- Boralus Barrel
{ id = 252389, category = "Inscription", expansion = "Battle for Azeroth", model3D = 1602479, spell = 1260593, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 8}, {id = 158187, amount = 5}, {id = 160711, amount = 5}} }, -- Proudmoore Shipping Crate
{ id = 252401, category = "Inscription", expansion = "Battle for Azeroth", model3D = 1852949, spell = 1260596, skill = "Battle for Azeroth Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 8}, {id = 152576, amount = 8}, {id = 152512, amount = 8}, {id = 160711, amount = 1}} }, -- Boralus Bookshelf
{ id = 245459, category = "Inscription", expansion = "Legion", model3D = 1402225, spell = 1260704, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 15}, {id = 129032, amount = 10}, {id = 129034, amount = 15}, {id = 124437, amount = 8}} }, -- Tauren Storage Chest
{ id = 247916, category = "Inscription", expansion = "Legion", model3D = 1361711, spell = 1260711, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 35}, {id = 129032, amount = 25}, {id = 127004, amount = 6}, {id = 124461, amount = 15}} }, -- Covered Square Suramar Table
{ id = 247918, category = "Inscription", expansion = "Legion", model3D = 1368700, spell = 1260719, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 28}, {id = 129034, amount = 20}, {id = 129032, amount = 10}, {id = 124461, amount = 5}, {id = 127004, amount = 3}, {id = 129100, amount = 5}} }, -- Nightborne Jeweler's Table
{ id = 247925, category = "Inscription", expansion = "Legion", model3D = 1445014, spell = 1260730, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 20}, {id = 129034, amount = 20}, {id = 124461, amount = 12}} }, -- Suramar Storage Crate
{ id = 245396, category = "Inscription", expansion = "Legion", model3D = 6749303, spell = 1260737, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 30}, {id = 129034, amount = 25}, {id = 127004, amount = 6}, {id = 124461, amount = 15}, {id = 129032, amount = 10}} }, -- Suramar Dresser
{ id = 245534, category = "Inscription", expansion = "Warlords of Draenor", model3D = 6711645, spell = 1261032, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 109119, amount = 20}, {id = 118472, amount = 10}, {id = 113261, amount = 6}} }, -- Frostwall Elevated Brazier
{ id = 244319, category = "Inscription", expansion = "Warlords of Draenor", model3D = 987255, spell = 1261045, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 8}, {id = 109118, amount = 12}, {id = 114931, amount = 10}, {id = 113263, amount = 6}} }, -- Wooden Shipping Crate
{ id = 244317, category = "Inscription", expansion = "Warlords of Draenor", model3D = 986851, spell = 1261066, skill = "Warlords of Draenor Inscription", skillNeeded = 0, reagents = {{id = 251766, amount = 6}, {id = 109118, amount = 8}, {id = 114931, amount = 6}, {id = 113263, amount = 4}} }, -- Orcish Banded Barrel
{ id = 247731, category = "Inscription", expansion = "Mists of Pandaria", model3D = 525038, spell = 1261237, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 15}, {id = 79255, amount = 5}, {id = 82441, amount = 2}} }, -- Hanging Paper Lanterns
{ id = 245514, category = "Inscription", expansion = "Mists of Pandaria", model3D = 538827, spell = 1261238, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 25}, {id = 79254, amount = 6}, {id = 76061, amount = 4}, {id = 87872, amount = 5}} }, -- Pandaren Wooden Table
{ id = 245513, category = "Inscription", expansion = "Mists of Pandaria", model3D = 538547, spell = 1261239, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 20}, {id = 79254, amount = 6}, {id = 76061, amount = 4}} }, -- Square Pandaren Table
{ id = 247735, category = "Inscription", expansion = "Mists of Pandaria", model3D = 7508792, spell = 1261240, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 20}, {id = 79254, amount = 6}, {id = 87872, amount = 5}} }, -- Lucky Traveler's Bench
{ id = 247669, category = "Inscription", expansion = "Mists of Pandaria", model3D = 6854354, spell = 1261241, skill = "Mists of Pandaria Inscription", skillNeeded = 60, reagents = {{id = 251763, amount = 45}, {id = 79255, amount = 20}, {id = 76061, amount = 8}, {id = 72104, amount = 4}, {id = 39354, amount = 18}} }, -- Lorewalker's Bookcase
{ id = 245621, category = "Inscription", expansion = "Cataclysm", model3D = 322293, spell = 1261259, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 25}, {id = 61981, amount = 8}, {id = 52327, amount = 6}, {id = 56850, amount = 4}} }, -- Gilnean Wooden Table
{ id = 245623, category = "Inscription", expansion = "Cataclysm", model3D = 322635, spell = 1261278, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 25}, {id = 61981, amount = 8}, {id = 52328, amount = 6}, {id = 56850, amount = 4}} }, -- Gilnean Rocking Chair
{ id = 245622, category = "Inscription", expansion = "Cataclysm", model3D = 322355, spell = 1261288, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 10}, {id = 61978, amount = 4}, {id = 52186, amount = 2}} }, -- Gilnean Wall Shelf
{ id = 245503, category = "Inscription", expansion = "Classic", model3D = 189416, spell = 1261549, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 15}, {id = 12808, amount = 4}, {id = 7076, amount = 4}, {id = 43123, amount = 2}} }, -- Brill Coffin Lid
{ id = 245502, category = "Inscription", expansion = "Classic", model3D = 189415, spell = 1261572, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 25}, {id = 12808, amount = 8}, {id = 7076, amount = 8}, {id = 43123, amount = 5}} }, -- Brill Coffin
{ id = 246420, category = "Inscription", expansion = "Classic", model3D = 197288, spell = 1261587, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 50}, {id = 10308, amount = 50}, {id = 12365, amount = 24}, {id = 12359, amount = 12}} }, -- Kharanos Bookcase
{ id = 246423, category = "Inscription", expansion = "Classic", model3D = 197555, spell = 1261644, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 45}, {id = 6037, amount = 12}, {id = 43119, amount = 8}, {id = 12810, amount = 8}, {id = 20963, amount = 4}} }, -- Wooden Ironforge Table
{ id = 258244, category = "Inscription", expansion = "Shadowlands", model3D = 3246827, spell = 1263241, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 24}, {id = 173204, amount = 8}, {id = 171828, amount = 8}, {id = 173059, amount = 8}} }, -- Broker's Hex Table
{ id = 258250, category = "Inscription", expansion = "Shadowlands", model3D = 3836261, spell = 1263243, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 35}, {id = 171829, amount = 10}, {id = 173059, amount = 16}, {id = 173110, amount = 1}} }, -- Cartel Ta Bookcase
{ id = 258245, category = "Inscription", expansion = "Shadowlands", model3D = 3507170, spell = 1263247, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 16}, {id = 173202, amount = 5}, {id = 177061, amount = 5}} }, -- Ardenweald Hanging Baskets
{ id = 258235, category = "Inscription", expansion = "Shadowlands", model3D = 3033118, spell = 1263272, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 28}, {id = 173059, amount = 15}, {id = 173110, amount = 2}} }, -- Aspiring Soul's Chair
{ id = 258247, category = "Inscription", expansion = "Shadowlands", model3D = 3607336, spell = 1263278, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 20}, {id = 171832, amount = 5}, {id = 173058, amount = 10}} }, -- Large Revendreth Storage Crate
{ id = 258239, category = "Inscription", expansion = "Shadowlands", model3D = 3036651, spell = 1263285, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 10}, {id = 175970, amount = 5}, {id = 173126, amount = 1}, {id = 172092, amount = 8}, {id = 175886, amount = 10}, {id = 173172, amount = 2}} }, -- Tome of Maldraxxian Rituals
{ id = 258242, category = "Inscription", expansion = "Shadowlands", model3D = 3158874, spell = 1263293, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 50}, {id = 175970, amount = 25}, {id = 172230, amount = 15}, {id = 173170, amount = 8}, {id = 173202, amount = 4}, {id = 177061, amount = 4}} }, -- Hollow Night Fae Shrine
{ id = 258224, category = "Inscription", expansion = "Legion", model3D = 1319120, spell = 1263344, skill = "Legion Inscription", skillNeeded = 80, reagents = {{id = 251767, amount = 22}, {id = 129032, amount = 15}, {id = 151565, amount = 10}, {id = 136693, amount = 1}} }, -- Dalaran Display Shelves
{ id = 258203, category = "Inscription", expansion = "Wrath of the Lich King", model3D = 194464, spell = 1263562, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 18}, {id = 37663, amount = 4}, {id = 43127, amount = 10}} }, -- Silver Dalaran Bench
{ id = 258210, category = "Inscription", expansion = "Wrath of the Lich King", model3D = 243054, spell = 1263564, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 10}, {id = 41163, amount = 6}, {id = 43126, amount = 5}, {id = 39354, amount = 10}} }, -- Dalaran Street Sign
{ id = 258207, category = "Inscription", expansion = "Wrath of the Lich King", model3D = 242995, spell = 1263570, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 45}, {id = 37663, amount = 12}, {id = 43127, amount = 6}, {id = 43126, amount = 6}, {id = 36931, amount = 4}} }, -- Dalaran Scholar's Bookcase
{ id = 258209, category = "Inscription", expansion = "Wrath of the Lich King", model3D = 243030, spell = 1263574, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 6}, {id = 36931, amount = 2}, {id = 43127, amount = 3}} }, -- Kirin Tor Crate
{ id = 258204, category = "Inscription", expansion = "Wrath of the Lich King", model3D = 194471, spell = 1263575, skill = "Wrath of the Lich King Inscription", skillNeeded = 60, reagents = {{id = 251762, amount = 12}, {id = 36916, amount = 6}, {id = 43126, amount = 3}} }, -- Dalaran Post
{ id = 258199, category = "Inscription", expansion = "The Burning Crusade", model3D = 193332, spell = 1263810, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 25}, {id = 33458, amount = 50}, {id = 43124, amount = 10}, {id = 22452, amount = 4}} }, -- Aldor Bookcase
{ id = 258198, category = "Inscription", expansion = "The Burning Crusade", model3D = 192515, spell = 1263811, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23793, amount = 3}, {id = 23449, amount = 2}} }, -- Gilded Draenei Round Table
{ id = 258215, category = "Inscription", expansion = "The Burning Crusade", model3D = 538411, spell = 1263812, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23793, amount = 3}, {id = 22457, amount = 2}} }, -- Halaa Bench
{ id = 258197, category = "Inscription", expansion = "The Burning Crusade", model3D = 192468, spell = 1263813, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 12}, {id = 22446, amount = 4}, {id = 43125, amount = 3}, {id = 39354, amount = 1}} }, -- Crystal Signpost
{ id = 258192, category = "Inscription", expansion = "The Burning Crusade", model3D = 191859, spell = 1263814, skill = "The Burning Crusade Inscription", skillNeeded = 60, reagents = {{id = 242691, amount = 10}, {id = 43124, amount = 3}, {id = 21886, amount = 2}} }, -- Talon King's Totem
{ id = 258289, category = "Inscription", expansion = "Classic", model3D = 200451, spell = 1269495, skill = "Classic Inscription", skillNeeded = 240, reagents = {{id = 245586, amount = 30}, {id = 7076, amount = 8}, {id = 43121, amount = 6}} }, -- Thunder Bluff Totem
{ id = 244313, category = "Inscription", expansion = "Warlords of Draenor", model3D = 969529, spell = 1269500, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 15}, {id = 109119, amount = 15}, {id = 113263, amount = 8}, {id = 111557, amount = 10}} }, -- Orcish Fence
{ id = 245441, category = "Inscription", expansion = "Warlords of Draenor", model3D = 969535, spell = 1269501, skill = "Warlords of Draenor Inscription", skillNeeded = 80, reagents = {{id = 251766, amount = 10}, {id = 109119, amount = 10}, {id = 113263, amount = 4}} }, -- Orcish Fencepost
{ id = 257696, category = "Inscription", expansion = "Cataclysm", model3D = 305396, spell = 1269534, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 61978, amount = 8}, {id = 54849, amount = 3}, {id = 39354, amount = 1}} }, -- Gilnean Map
{ id = 257695, category = "Inscription", expansion = "Cataclysm", model3D = 305385, spell = 1269540, skill = "Cataclysm Inscription", skillNeeded = 60, reagents = {{id = 251764, amount = 35}, {id = 52186, amount = 12}, {id = 61978, amount = 10}, {id = 55053, amount = 1}} }, -- Gilnean Postbox
{ id = 264679, category = "Inscription", expansion = "Dragonflight", model3D = 4286997, spell = 1272572, skill = "Dragonflight Inscription", skillNeeded = 80, reagents = {{id = 251773, amount = 18}, {id = 192872, amount = 2}, {id = 194862, amount = 2}, {id = 190312, amount = 2}} }, -- Valdrakken Wall Shelf
{ id = 280752, category = "Inscription", expansion = "Midnight", model3D = 7498518, spell = 1296505, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- "Cursed Gaze of Ula'tek" Mural
{ id = 280757, category = "Inscription", expansion = "Midnight", model3D = 6212409, spell = 1296506, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 245764, amount = 1}, {id = 245766, amount = 2}, {id = 247725, amount = 1}} }, -- Chiseled Amani Tablet
{ id = 282132, category = "Inscription", expansion = "Legion", model3D = 1616728, spell = 1313522, skill = "Legion Inscription", skillNeeded = 85, reagents = {{id = 251767, amount = 20}, {id = 123918, amount = 10}, {id = 151565, amount = 15}, {id = 151567, amount = 5}} }, -- Eredath Artisan's Workbench
{ id = 283301, category = "Inscription", expansion = "Shadowlands", model3D = 3448138, spell = 1315335, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 4}, {id = 173059, amount = 5}, {id = 175886, amount = 10}, {id = 173204, amount = 3}} }, -- Fae Moonbough Scroll
{ id = 282190, category = "Inscription", expansion = "Midnight", model3D = 5019423, spell = 1315433, skill = "Midnight Inscription", skillNeeded = 50, reagents = {{id = 256963, amount = 10}, {id = 33226, amount = 15}, {id = 253043, amount = 5}, {id = 245882, amount = 20}} }, -- Apple Bobbing Bucket
{ id = 283321, category = "Inscription", expansion = "Kul Tiran", model3D = 1624534, spell = 1315465, skill = "Kul Tiran Inscription", skillNeeded = 140, reagents = {{id = 251768, amount = 4}, {id = 158189, amount = 10}, {id = 39354, amount = 25}, {id = 152576, amount = 3}} }, -- Closed Vulpera Scroll
{ id = 284504, category = "Inscription", expansion = "Shadowlands", model3D = 3040291, spell = 1316306, skill = "Shadowlands Inscription", skillNeeded = 80, reagents = {{id = 251772, amount = 10}, {id = 168589, amount = 15}, {id = 173058, amount = 5}, {id = 180732, amount = 1}, {id = 171315, amount = 3}} }, -- Levitating Lich Library
    }
  },
  {
    name = "Jewelcrafting", --34
    items = {
{ id = 262461, category = "Jewelcrafting", expansion = "Midnight", model3D = 6700985, spell = 1246889, skill = "Midnight Jewelcrafting", skillNeeded = 80, reagents = {{id = 256963, amount = 12}, {id = 240974, amount = 1}, {id = 242620, amount = 5}, {id = 242788, amount = 15}, {id = 246447, amount = 1}} }, -- Tenebrous Ren'dorei Armillary
{ id = 262471, category = "Jewelcrafting", expansion = "Midnight", model3D = 7050760, spell = 1246891, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 251665, amount = 25}, {id = 256963, amount = 12}, {id = 240974, amount = 1}, {id = 242620, amount = 15}, {id = 246447, amount = 1}} }, -- Bejeweled Sin'dorei Lyre
{ id = 248965, category = "Jewelcrafting", expansion = "Midnight", model3D = 7152563, spell = 1246892, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 24}, {id = 242620, amount = 15}, {id = 242788, amount = 25}, {id = 246447, amount = 1}} }, -- Resplendent Highborne Statue
{ id = 262613, category = "Jewelcrafting", expansion = "Midnight", model3D = 6715097, spell = 1246893, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 18}, {id = 240974, amount = 1}, {id = 242620, amount = 5}, {id = 242788, amount = 25}, {id = 246447, amount = 1}} }, -- Replica Haranir Mural
{ id = 262454, category = "Jewelcrafting", expansion = "Midnight", model3D = 6033623, spell = 1246894, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 8}, {id = 242620, amount = 8}, {id = 242787, amount = 50}, {id = 246447, amount = 1}} }, -- Shining Sin'dorei Hourglass
{ id = 262469, category = "Jewelcrafting", expansion = "Midnight", model3D = 6929052, spell = 1246895, skill = "Midnight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251665, amount = 25}, {id = 256963, amount = 18}, {id = 242620, amount = 20}, {id = 242788, amount = 20}, {id = 246447, amount = 1}} }, -- Brilliant Phoenix Harp
{ id = 248654, category = "Jewelcrafting", expansion = "Dragonflight", model3D = 7141934, spell = 1259369, skill = "Dragonflight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251773, amount = 26}, {id = 190312, amount = 6}, {id = 192883, amount = 10}, {id = 192869, amount = 1}} }, -- Valdrakken Gilded Throne
{ id = 248109, category = "Jewelcrafting", expansion = "Dragonflight", model3D = 3952852, spell = 1259384, skill = "Dragonflight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251773, amount = 15}, {id = 192872, amount = 2}, {id = 192883, amount = 4}, {id = 190395, amount = 18}} }, -- Valdrakken Fence
{ id = 248110, category = "Jewelcrafting", expansion = "Dragonflight", model3D = 3952853, spell = 1259386, skill = "Dragonflight Jewelcrafting", skillNeeded = 80, reagents = {{id = 251773, amount = 10}, {id = 192883, amount = 4}, {id = 190395, amount = 8}} }, -- Valdrakken Fencepost
{ id = 245559, category = "Jewelcrafting", expansion = "The War Within", model3D = 6924251, spell = 1260096, skill = "Khaz Algar Jewelcrafting", skillNeeded = 80, reagents = {{id = 248012, amount = 16}, {id = 212498, amount = 4}, {id = 221754, amount = 1}, {id = 213756, amount = 5}} }, -- Octagonal Ochre Window
{ id = 253253, category = "Jewelcrafting", expansion = "The War Within", model3D = 5636650, spell = 1260172, skill = "Khaz Algar Jewelcrafting", skillNeeded = 80, reagents = {{id = 248012, amount = 25}, {id = 212498, amount = 7}, {id = 213759, amount = 1}, {id = 222417, amount = 2}, {id = 213219, amount = 14}} }, -- Gundargaz Candelabra
{ id = 245414, category = "Jewelcrafting", expansion = "Battle for Azeroth", model3D = 6653375, spell = 1260492, skill = "Battle for Azeroth Jewelcrafting", skillNeeded = 140, reagents = {{id = 251768, amount = 40}, {id = 152512, amount = 30}, {id = 154123, amount = 3}, {id = 152513, amount = 5}} }, -- Zandalari Skullfire Lamp
{ id = 245496, category = "Jewelcrafting", expansion = "Battle for Azeroth", model3D = 1929218, spell = 1260501, skill = "Battle for Azeroth Jewelcrafting", skillNeeded = 140, reagents = {{id = 251768, amount = 20}, {id = 154120, amount = 2}, {id = 158187, amount = 6}, {id = 152513, amount = 10}} }, -- Small Mask of Bwonsamdi, Loa of Graves
{ id = 245557, category = "Jewelcrafting", expansion = "Legion", model3D = 6924249, spell = 1260757, skill = "Legion Jewelcrafting", skillNeeded = 80, reagents = {{id = 251767, amount = 25}, {id = 127004, amount = 3}, {id = 124461, amount = 10}, {id = 129100, amount = 20}} }, -- Shaded Suramar Window
{ id = 251495, category = "Jewelcrafting", expansion = "Warlords of Draenor", model3D = 7273285, spell = 1261071, skill = "Warlords of Draenor Jewelcrafting", skillNeeded = 80, reagents = {{id = 251766, amount = 25}, {id = 109118, amount = 20}, {id = 113262, amount = 12}, {id = 115811, amount = 1}} }, -- Draenic Basin
{ id = 251550, category = "Jewelcrafting", expansion = "Warlords of Draenor", model3D = 6436480, spell = 1261075, skill = "Warlords of Draenor Jewelcrafting", skillNeeded = 80, reagents = {{id = 251766, amount = 8}, {id = 109118, amount = 10}, {id = 111557, amount = 4}, {id = 113261, amount = 2}, {id = 115805, amount = 1}} }, -- Draenethyst Sconce
{ id = 247736, category = "Jewelcrafting", expansion = "Mists of Pandaria", model3D = 530128, spell = 1261242, skill = "Mists of Pandaria Jewelcrafting", skillNeeded = 60, reagents = {{id = 251763, amount = 50}, {id = 83092, amount = 1}, {id = 72095, amount = 30}, {id = 76061, amount = 6}, {id = 76734, amount = 2}} }, -- Jade Temple Dragon Fountain
{ id = 245509, category = "Jewelcrafting", expansion = "Mists of Pandaria", model3D = 518523, spell = 1261243, skill = "Mists of Pandaria Jewelcrafting", skillNeeded = 60, reagents = {{id = 251763, amount = 15}, {id = 72096, amount = 10}, {id = 76061, amount = 2}} }, -- Pandaren Stone Wall
{ id = 247728, category = "Jewelcrafting", expansion = "Mists of Pandaria", model3D = 519133, spell = 1261244, skill = "Mists of Pandaria Jewelcrafting", skillNeeded = 60, reagents = {{id = 251763, amount = 10}, {id = 72096, amount = 6}, {id = 76061, amount = 2}} }, -- Pandaren Stone Post
{ id = 249143, category = "Jewelcrafting", expansion = "Cataclysm", model3D = 7130714, spell = 1261305, skill = "Cataclysm Jewelcrafting", skillNeeded = 60, reagents = {{id = 251764, amount = 12}, {id = 54849, amount = 10}, {id = 52193, amount = 4}, {id = 53010, amount = 4}, {id = 52078, amount = 2}} }, -- Smoke Sconce
{ id = 246488, category = "Jewelcrafting", expansion = "Classic", model3D = 7014376, spell = 1261659, skill = "Classic Jewelcrafting", skillNeeded = 240, reagents = {{id = 245586, amount = 30}, {id = 6037, amount = 12}, {id = 20963, amount = 8}, {id = 12799, amount = 8}} }, -- Ironforge Chandelier
{ id = 246413, category = "Jewelcrafting", expansion = "Classic", model3D = 379433, spell = 1261667, skill = "Classic Jewelcrafting", skillNeeded = 240, reagents = {{id = 245586, amount = 40}, {id = 11371, amount = 16}, {id = 7910, amount = 20}, {id = 17011, amount = 6}} }, -- Blackrock Lamppost
{ id = 257406, category = "Jewelcrafting", expansion = "Cataclysm", model3D = 311599, spell = 1262357, skill = "Cataclysm Jewelcrafting", skillNeeded = 60, reagents = {{id = 251764, amount = 8}, {id = 54849, amount = 6}, {id = 52193, amount = 4}, {id = 52078, amount = 2}} }, -- Smoke Lamp
{ id = 258227, category = "Jewelcrafting", expansion = "Legion", model3D = 1396746, spell = 1263351, skill = "Legion Jewelcrafting", skillNeeded = 80, reagents = {{id = 251767, amount = 12}, {id = 130176, amount = 4}, {id = 151718, amount = 2}, {id = 130181, amount = 2}, {id = 151720, amount = 1}, {id = 130182, amount = 1}, {id = 127004, amount = 1}} }, -- Suramar Jeweler's Assortment
{ id = 258211, category = "Jewelcrafting", expansion = "Wrath of the Lich King", model3D = 243189, spell = 1263577, skill = "Wrath of the Lich King Jewelcrafting", skillNeeded = 60, reagents = {{id = 251762, amount = 22}, {id = 36916, amount = 8}, {id = 42225, amount = 4}} }, -- Kirin Tor Glass Table
{ id = 258208, category = "Jewelcrafting", expansion = "Wrath of the Lich King", model3D = 243016, spell = 1263605, skill = "Wrath of the Lich King Jewelcrafting", skillNeeded = 60, reagents = {{id = 251762, amount = 8}, {id = 36916, amount = 6}, {id = 41266, amount = 4}} }, -- Kirin Tor Sun Chandelier
{ id = 258201, category = "Jewelcrafting", expansion = "The Burning Crusade", model3D = 193371, spell = 1263815, skill = "The Burning Crusade Jewelcrafting", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 31079, amount = 6}, {id = 32230, amount = 2}} }, -- Shattrath Lamppost
{ id = 258200, category = "Jewelcrafting", expansion = "The Burning Crusade", model3D = 193369, spell = 1263817, skill = "The Burning Crusade Jewelcrafting", skillNeeded = 60, reagents = {{id = 242691, amount = 10}, {id = 31079, amount = 3}, {id = 23441, amount = 3}} }, -- Shattrath Sconce
{ id = 262347, category = "Jewelcrafting", expansion = "The Burning Crusade", model3D = 538415, spell = 1269496, skill = "The Burning Crusade Jewelcrafting", skillNeeded = 60, reagents = {{id = 242691, amount = 15}, {id = 23573, amount = 4}, {id = 25867, amount = 2}} }, -- Draenei Crystal Chandelier
{ id = 262663, category = "Jewelcrafting", expansion = "Shadowlands", model3D = 2991599, spell = 1269502, skill = "Shadowlands Jewelcrafting", skillNeeded = 80, reagents = {{id = 251772, amount = 18}, {id = 171829, amount = 6}, {id = 173173, amount = 4}, {id = 172230, amount = 4}} }, -- Kyrian Floating Lamp
{ id = 260699, category = "Jewelcrafting", expansion = "Shadowlands", model3D = 3038200, spell = 1269504, skill = "Shadowlands Jewelcrafting", skillNeeded = 80, reagents = {{id = 251772, amount = 30}, {id = 171828, amount = 25}, {id = 173172, amount = 8}, {id = 172232, amount = 2}} }, -- Maldraxxian Runic Tablet
{ id = 279356, category = "Jewelcrafting", expansion = "Midnight", model3D = 2438984, spell = 1297679, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 242607, amount = 4}, {id = 242620, amount = 6}, {id = 242788, amount = 8}, {id = 246447, amount = 1}} }, -- Opalescent Amani Peridot
{ id = 279343, category = "Jewelcrafting", expansion = "Midnight", model3D = 2438985, spell = 1297680, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 242554, amount = 4}, {id = 242620, amount = 6}, {id = 242788, amount = 8}, {id = 246447, amount = 1}} }, -- Piercing Amani Lapis
{ id = 280762, category = "Jewelcrafting", expansion = "Midnight", model3D = 2438987, spell = 1297681, skill = "Midnight Jewelcrafting", skillNeeded = 50, reagents = {{id = 256963, amount = 6}, {id = 242553, amount = 4}, {id = 242620, amount = 6}, {id = 242788, amount = 8}, {id = 246447, amount = 1}} }, -- Roaring Amani Garnet	  	  
    }
  },
  {
    name = "Leatherworking", --36
    items = {
{ id = 262449, category = "Leatherworking", expansion = "Midnight", model3D = 6005302, spell = 1246937, skill = "Midnight Leatherworking", skillNeeded = 80, reagents = {{id = 251665, amount = 20}, {id = 238525, amount = 5}, {id = 256963, amount = 8}, {id = 244631, amount = 2}, {id = 246447, amount = 1}} }, -- Embossed Sin'dorei Fur Rug
{ id = 253457, category = "Leatherworking", expansion = "Midnight", model3D = 6856605, spell = 1246938, skill = "Midnight Leatherworking", skillNeeded = 80, reagents = {{id = 238525, amount = 5}, {id = 238528, amount = 1}, {id = 238523, amount = 5}, {id = 256963, amount = 8}, {id = 246447, amount = 1}} }, -- Leather-Bound Haranir Wall Shelf
{ id = 265791, category = "Leatherworking", expansion = "Midnight", model3D = 4899958, spell = 1246939, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 238529, amount = 2}, {id = 238530, amount = 1}, {id = 236950, amount = 20}, {id = 251665, amount = 20}, {id = 238522, amount = 5}, {id = 256963, amount = 22}, {id = 246447, amount = 1}} }, -- Haranir Canopy Bed
{ id = 262589, category = "Leatherworking", expansion = "Midnight", model3D = 5163362, spell = 1246940, skill = "Midnight Leatherworking", skillNeeded = 80, reagents = {{id = 238530, amount = 1}, {id = 236950, amount = 20}, {id = 238525, amount = 5}, {id = 256963, amount = 8}, {id = 244631, amount = 2}, {id = 246447, amount = 1}} }, -- Simple Haranir Table
{ id = 262600, category = "Leatherworking", expansion = "Midnight", model3D = 6310375, spell = 1246941, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 10}, {id = 238525, amount = 5}, {id = 256963, amount = 8}, {id = 246447, amount = 1}, {id = 238518, amount = 4}} }, -- Stitched Haranir Rug
{ id = 243090, category = "Leatherworking", expansion = "Midnight", model3D = 6854359, spell = 1246942, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 238528, amount = 1}, {id = 251665, amount = 2}, {id = 238525, amount = 2}, {id = 256963, amount = 6}, {id = 246447, amount = 1}} }, -- Sturdy Haranir Chair
{ id = 264244, category = "Leatherworking", expansion = "Midnight", model3D = 5161738, spell = 1246943, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 10}, {id = 238525, amount = 5}, {id = 256963, amount = 4}, {id = 246447, amount = 1}, {id = 238518, amount = 4}} }, -- Plush Haranir Leather Pillow
{ id = 248114, category = "Leatherworking", expansion = "Dragonflight", model3D = 4237314, spell = 1259195, skill = "Dragonflight Leatherworking", skillNeeded = 80, reagents = {{id = 251773, amount = 45}, {id = 192869, amount = 5}, {id = 193229, amount = 2}, {id = 190312, amount = 10}, {id = 193216, amount = 10}} }, -- Draconic Nesting Bed
{ id = 248657, category = "Leatherworking", expansion = "Dragonflight", model3D = 7141938, spell = 1259233, skill = "Dragonflight Leatherworking", skillNeeded = 80, reagents = {{id = 251773, amount = 40}, {id = 193922, amount = 6}, {id = 193208, amount = 60}, {id = 190312, amount = 7}} }, -- Valdrakken Market Tent
{ id = 243327, category = "Leatherworking", expansion = "The War Within", model3D = 5793046, spell = 1260328, skill = "Khaz Algar Leatherworking", skillNeeded = 80, reagents = {{id = 248012, amount = 30}, {id = 224764, amount = 10}, {id = 219889, amount = 2}, {id = 212670, amount = 1}} }, -- Zhevra-Stripe Rug
{ id = 245412, category = "Leatherworking", expansion = "Battle for Azeroth", model3D = 6653373, spell = 1260485, skill = "Battle for Azeroth Leatherworking", skillNeeded = 140, reagents = {{id = 251768, amount = 40}, {id = 154722, amount = 30}, {id = 152513, amount = 5}, {id = 154164, amount = 12}} }, -- Zandalari Ritual Drum
{ id = 245406, category = "Leatherworking", expansion = "Legion", model3D = 6711672, spell = 1260762, skill = "Legion Leatherworking", skillNeeded = 80, reagents = {{id = 251767, amount = 20}, {id = 124113, amount = 20}, {id = 124438, amount = 5}} }, -- Tauren Leather Fence
{ id = 245407, category = "Leatherworking", expansion = "Legion", model3D = 6711673, spell = 1260765, skill = "Legion Leatherworking", skillNeeded = 80, reagents = {{id = 251767, amount = 15}, {id = 124113, amount = 10}, {id = 124438, amount = 5}} }, -- Tauren Fencepost
{ id = 245432, category = "Leatherworking", expansion = "Warlords of Draenor", model3D = 1005469, spell = 1261081, skill = "Warlords of Draenor Leatherworking", skillNeeded = 80, reagents = {{id = 251766, amount = 40}, {id = 110609, amount = 45}, {id = 109119, amount = 20}, {id = 111557, amount = 15}, {id = 120945, amount = 5}} }, -- Blackrock Bunkbed
{ id = 244323, category = "Leatherworking", expansion = "Warlords of Draenor", model3D = 1013304, spell = 1261122, skill = "Warlords of Draenor Leatherworking", skillNeeded = 80, reagents = {{id = 251766, amount = 22}, {id = 110609, amount = 30}, {id = 109119, amount = 15}} }, -- Orcish Sleeping Cot
{ id = 247856, category = "Leatherworking", expansion = "Mists of Pandaria", model3D = 531405, spell = 1261245, skill = "Mists of Pandaria Leatherworking", skillNeeded = 60, reagents = {{id = 251763, amount = 40}, {id = 72163, amount = 8}, {id = 79255, amount = 5}, {id = 76061, amount = 5}} }, -- Serenity Peak Tent
{ id = 247767, category = "Leatherworking", expansion = "Mists of Pandaria", model3D = 579248, spell = 1261248, skill = "Mists of Pandaria Leatherworking", skillNeeded = 60, reagents = {{id = 251763, amount = 30}, {id = 72163, amount = 6}, {id = 79254, amount = 5}, {id = 76061, amount = 3}} }, -- Wise Pandaren's Bed
{ id = 242948, category = "Leatherworking", expansion = "Classic", model3D = 4871092, spell = 1261672, skill = "Classic Leatherworking", skillNeeded = 240, reagents = {{id = 245586, amount = 15}, {id = 8170, amount = 12}, {id = 15407, amount = 2}, {id = 14341, amount = 2}} }, -- Loch Modan Bearskin Rug
{ id = 257400, category = "Leatherworking", expansion = "Legion", model3D = 1253405, spell = 1262273, skill = "Legion Leatherworking", skillNeeded = 80, reagents = {{id = 251767, amount = 34}, {id = 124113, amount = 25}, {id = 124116, amount = 5}, {id = 124438, amount = 10}} }, -- Highmountain Tanner's Frame
{ id = 258248, category = "Leatherworking", expansion = "Shadowlands", model3D = 3619351, spell = 1263308, skill = "Shadowlands Leatherworking", skillNeeded = 80, reagents = {{id = 251772, amount = 30}, {id = 172089, amount = 14}, {id = 172094, amount = 3}, {id = 177062, amount = 5}} }, -- Margrave's Stitched Leather Rug
{ id = 258238, category = "Leatherworking", expansion = "Shadowlands", model3D = 3036549, spell = 1263313, skill = "Shadowlands Leatherworking", skillNeeded = 80, reagents = {{id = 251772, amount = 18}, {id = 171830, amount = 6}, {id = 172089, amount = 12}, {id = 172092, amount = 12}} }, -- Maldraxxian Crate
{ id = 258205, category = "Leatherworking", expansion = "Wrath of the Lich King", model3D = 200015, spell = 1263613, skill = "Wrath of the Lich King Leatherworking", skillNeeded = 60, reagents = {{id = 251762, amount = 18}, {id = 38425, amount = 14}, {id = 35623, amount = 4}, {id = 35624, amount = 2}} }, -- Wolvar Postbag
{ id = 257725, category = "Leatherworking", expansion = "Classic", model3D = 6711676, spell = 1263633, skill = "Classic Leatherworking", skillNeeded = 240, reagents = {{id = 245586, amount = 18}, {id = 15417, amount = 8}, {id = 2604, amount = 2}, {id = 4342, amount = 2}, {id = 14341, amount = 2}} }, -- Camp Narache Rug
{ id = 258191, category = "Leatherworking", expansion = "The Burning Crusade", model3D = 191839, spell = 1263818, skill = "The Burning Crusade Leatherworking", skillNeeded = 60, reagents = {{id = 242691, amount = 20}, {id = 23793, amount = 6}, {id = 29539, amount = 4}, {id = 14341, amount = 3}} }, -- Arakkoa Decoy Scarecrow
{ id = 258190, category = "Leatherworking", expansion = "The Burning Crusade", model3D = 191781, spell = 1263819, skill = "The Burning Crusade Leatherworking", skillNeeded = 60, reagents = {{id = 242691, amount = 12}, {id = 25708, amount = 8}, {id = 22452, amount = 2}, {id = 21886, amount = 2}} }, -- The Burning Crusade Mag'har Banner
{ id = 258558, category = "Leatherworking", expansion = "Battle for Azeroth", model3D = 1830320, spell = 1263859, skill = "Battle for Azeroth Leatherworking", skillNeeded = 140, reagents = {{id = 251768, amount = 22}, {id = 152541, amount = 20}, {id = 152579, amount = 15}, {id = 160059, amount = 4}} }, -- Sandfury Diplomat's Banner
{ id = 257693, category = "Leatherworking", expansion = "Wrath of the Lich King", model3D = 195749, spell = 1269499, skill = "Wrath of the Lich King Leatherworking", skillNeeded = 60, reagents = {{id = 251762, amount = 12}, {id = 38425, amount = 8}, {id = 35627, amount = 6}, {id = 44128, amount = 2}} }, -- Snowfall Tribe Scare-Totem
{ id = 257806, category = "Leatherworking", expansion = "Cataclysm", model3D = 360034, spell = 1269550, skill = "Cataclysm Leatherworking", skillNeeded = 60, reagents = {{id = 251764, amount = 40}, {id = 52979, amount = 20}, {id = 54849, amount = 15}, {id = 56516, amount = 10}, {id = 52190, amount = 1}} }, -- Scaled Twilight Mosaic
{ id = 239214, category = "Leatherworking", expansion = "The War Within", model3D = 5929346, spell = 1270836, skill = "Khaz Algar Leatherworking", skillNeeded = 80, reagents = {{id = 248012, amount = 38}, {id = 224764, amount = 10}, {id = 219880, amount = 6}, {id = 212664, amount = 4}, {id = 221853, amount = 9}} }, -- Well-Lit Incontinental Couch
{ id = 264712, category = "Leatherworking", expansion = "Cataclysm", model3D = 306120, spell = 1272580, skill = "Cataclysm Leatherworking", skillNeeded = 60, reagents = {{id = 251764, amount = 12}, {id = 52980, amount = 4}, {id = 54849, amount = 4}, {id = 38426, amount = 8}} }, -- Gilnean Spare Saddle
{ id = 264677, category = "Leatherworking", expansion = "Cataclysm", model3D = 424389, spell = 1272588, skill = "Cataclysm Leatherworking", skillNeeded = 60, reagents = {{id = 251764, amount = 14}, {id = 56516, amount = 10}, {id = 38426, amount = 8}, {id = 52327, amount = 4}} }, -- Rolled Scarab Rug
{ id = 266170, category = "Leatherworking", expansion = "Midnight", model3D = 7277141, spell = 1296509, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 20}, {id = 256963, amount = 16}, {id = 274777, amount = 8}, {id = 244631, amount = 8}, {id = 246447, amount = 1}} }, -- Flat Snakeskin Canopy
{ id = 279346, category = "Leatherworking", expansion = "Midnight", model3D = 6125163, spell = 1296510, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 251665, amount = 20}, {id = 238525, amount = 5}, {id = 256963, amount = 24}, {id = 244631, amount = 2}, {id = 246447, amount = 1}} }, -- Stretched Snakeskin Rack
{ id = 279348, category = "Leatherworking", expansion = "Midnight", model3D = 1097621, spell = 1296511, skill = "Midnight Leatherworking", skillNeeded = 50, reagents = {{id = 274589, amount = 1}, {id = 256963, amount = 8}, {id = 244631, amount = 6}, {id = 246447, amount = 1}} }, -- Mounted Moby	 

{ id = 284240, category = "Leatherworking", expansion = "Dragonflight", model3D = 5350798, spell = 1315719, skill = "Dragonflight Leatherworking", skillNeeded = 50, reagents = {{id = 251773, amount = 6}, {id = 193208, amount = 20}, {id = 192095, amount = 5}, {id = 193216, amount = 2}} }, -- Beloved Ottuk Plushie
{ id = 284242, category = "Leatherworking", expansion = "Dragonflight", model3D = 5350799, spell = 1315728, skill = "Dragonflight Leatherworking", skillNeeded = 50, reagents = {{id = 251773, amount = 8}, {id = 193208, amount = 30}, {id = 192095, amount = 7}, {id = 193216, amount = 3}} }, -- Beloved Ottuuuuuuk Plushie 
    }
  },
  {
    name = "Tailoring", --31 plus 2 missing
    items = {
{ id = 262599, category = "Tailoring", expansion = "Midnight", model3D = 6209625, spell = 1229000, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 6}, {id = 239702, amount = 4}} }, -- Silvermoon Curtains
{ id = 262352, category = "Tailoring", expansion = "Midnight", model3D = 6700983, spell = 1229001, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239201, amount = 4}, {id = 239198, amount = 4}} }, -- Lush Telogrus Carpet
{ id = 262591, category = "Tailoring", expansion = "Midnight", model3D = 6050843, spell = 1229002, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 6}, {id = 239201, amount = 4}} }, -- Luxurious Silvermoon Lounge Cushion
{ id = 262592, category = "Tailoring", expansion = "Midnight", model3D = 6050852, spell = 1229003, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 22}, {id = 239201, amount = 8}, {id = 239198, amount = 8}} }, -- Plush Silvermoon Bed
{ id = 262593, category = "Tailoring", expansion = "Midnight", model3D = 6050855, spell = 1246919, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 4}, {id = 239198, amount = 4}} }, -- Chic Silvermoon Pillow
{ id = 262611, category = "Tailoring", expansion = "Midnight", model3D = 6701013, spell = 1246929, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239702, amount = 4}} }, -- Voidstrider Saddlebag
{ id = 248121, category = "Tailoring", expansion = "Dragonflight", model3D = 4497614, spell = 1259247, skill = "Dragonflight Tailoring", skillNeeded = 80, reagents = {{id = 251773, amount = 35}, {id = 193926, amount = 20}, {id = 190395, amount = 16}, {id = 192095, amount = 12}, {id = 194751, amount = 5}} }, -- Draconic Circular Rug
{ id = 252755, category = "Tailoring", expansion = "The War Within", model3D = 4902728, spell = 1260215, skill = "Khaz Algar Tailoring", skillNeeded = 80, reagents = {{id = 248012, amount = 30}, {id = 224764, amount = 12}, {id = 222615, amount = 4}, {id = 224824, amount = 6}} }, -- Dornogal Framed Rug
{ id = 245305, category = "Tailoring", expansion = "The War Within", model3D = 5793097, spell = 1260326, skill = "Khaz Algar Tailoring", skillNeeded = 80, reagents = {{id = 248012, amount = 20}, {id = 224764, amount = 20}, {id = 222804, amount = 6}, {id = 224828, amount = 2}} }, -- Undermine Bean Bag Chair
{ id = 243101, category = "Tailoring", expansion = "Battle for Azeroth", model3D = 1590845, spell = 1260458, skill = "Battle for Azeroth Tailoring", skillNeeded = 140, reagents = {{id = 251768, amount = 30}, {id = 152576, amount = 30}, {id = 159959, amount = 12}, {id = 158188, amount = 5}} }, -- Red Dazar'alor Rug
{ id = 245418, category = "Tailoring", expansion = "Battle for Azeroth", model3D = 6877804, spell = 1260475, skill = "Battle for Azeroth Tailoring", skillNeeded = 140, reagents = {{id = 251768, amount = 35}, {id = 158378, amount = 16}, {id = 152513, amount = 2}, {id = 159959, amount = 20}} }, -- Zanchuli Tapestry
{ id = 248010, category = "Tailoring", expansion = "Legion", model3D = 1373509, spell = 1260769, skill = "Legion Tailoring", skillNeeded = 80, reagents = {{id = 251767, amount = 40}, {id = 127004, amount = 20}, {id = 124461, amount = 12}, {id = 127037, amount = 12}} }, -- Shal'dorei Open-Air Tent
{ id = 247920, category = "Tailoring", expansion = "Legion", model3D = 1378307, spell = 1260774, skill = "Legion Tailoring", skillNeeded = 80, reagents = {{id = 251767, amount = 30}, {id = 124437, amount = 40}, {id = 129032, amount = 15}, {id = 127037, amount = 8}} }, -- Circular Shal'dorei Rug
{ id = 251546, category = "Tailoring", expansion = "Warlords of Draenor", model3D = 902328, spell = 1261231, skill = "Warlords of Draenor Tailoring", skillNeeded = 80, reagents = {{id = 251766, amount = 30}, {id = 111557, amount = 40}, {id = 114931, amount = 15}, {id = 109118, amount = 10}, {id = 120945, amount = 5}} }, -- Argussian Circular Rug
{ id = 245421, category = "Tailoring", expansion = "Warlords of Draenor", model3D = 979920, spell = 1261232, skill = "Warlords of Draenor Tailoring", skillNeeded = 80, reagents = {{id = 251766, amount = 35}, {id = 111557, amount = 50}, {id = 114931, amount = 12}} }, -- Karabor Bed
{ id = 247738, category = "Tailoring", expansion = "Mists of Pandaria", model3D = 575033, spell = 1261250, skill = "Mists of Pandaria Tailoring", skillNeeded = 60, reagents = {{id = 251763, amount = 25}, {id = 82441, amount = 15}, {id = 82444, amount = 2}} }, -- Pandaren Meander Rug
{ id = 245618, category = "Tailoring", expansion = "Cataclysm", model3D = 305226, spell = 1261317, skill = "Cataclysm Tailoring", skillNeeded = 60, reagents = {{id = 251764, amount = 35}, {id = 53643, amount = 20}, {id = 54849, amount = 6}, {id = 54450, amount = 4}} }, -- Surwich Expedition Tent
{ id = 243336, category = "Tailoring", expansion = "Classic", model3D = 6711675, spell = 1261688, skill = "Classic Tailoring", skillNeeded = 240, reagents = {{id = 245586, amount = 18}, {id = 14048, amount = 12}, {id = 2604, amount = 4}, {id = 14341, amount = 2}} }, -- Elder Rise Rug
{ id = 246685, category = "Tailoring", expansion = "Classic", model3D = 197968, spell = 1261695, skill = "Classic Tailoring", skillNeeded = 240, reagents = {{id = 245586, amount = 25}, {id = 14342, amount = 12}, {id = 4341, amount = 20}, {id = 14341, amount = 4}, {id = 13926, amount = 2}} }, -- Dwarven District Banner
{ id = 257053, category = "Tailoring", expansion = "Dragonflight", model3D = 4495939, spell = 1261940, skill = "Dragonflight Tailoring", skillNeeded = 80, reagents = {{id = 251773, amount = 28}, {id = 192872, amount = 3}, {id = 193938, amount = 1}, {id = 193935, amount = 1}, {id = 190395, amount = 3}, {id = 194011, amount = 2}} }, -- Tapestry of the Five Flights
{ id = 257402, category = "Tailoring", expansion = "Cataclysm", model3D = 314545, spell = 1262370, skill = "Cataclysm Tailoring", skillNeeded = 60, reagents = {{id = 251764, amount = 26}, {id = 54440, amount = 2}, {id = 54849, amount = 2}, {id = 38426, amount = 8}, {id = 61981, amount = 6}} }, -- "Unity of Thorns" Tapestry
{ id = 258303, category = "Tailoring", expansion = "Warlords of Draenor", model3D = 903883, spell = 1263360, skill = "Warlords of Draenor Tailoring", skillNeeded = 80, reagents = {{id = 251766, amount = 8}, {id = 111557, amount = 16}, {id = 114931, amount = 5}, {id = 113588, amount = 2}} }, -- Beloved Elekk Plushie
{ id = 258302, category = "Tailoring", expansion = "Mists of Pandaria", model3D = 577662, spell = 1263553, skill = "Mists of Pandaria Tailoring", skillNeeded = 60, reagents = {{id = 251763, amount = 8}, {id = 82441, amount = 5}, {id = 74866, amount = 10}} }, -- Pandaren Fishing Net
{ id = 258206, category = "Tailoring", expansion = "Wrath of the Lich King", model3D = 242983, spell = 1263620, skill = "Wrath of the Lich King Tailoring", skillNeeded = 60, reagents = {{id = 251762, amount = 10}, {id = 41595, amount = 8}, {id = 6260, amount = 2}, {id = 2604, amount = 2}, {id = 36925, amount = 1}} }, -- Gilded Dalaran Banner
{ id = 258298, category = "Tailoring", expansion = "Wrath of the Lich King", model3D = 242974, spell = 1263627, skill = "Wrath of the Lich King Tailoring", skillNeeded = 60, reagents = {{id = 251762, amount = 40}, {id = 41595, amount = 8}, {id = 41594, amount = 8}, {id = 2604, amount = 4}, {id = 6260, amount = 4}} }, -- Kirin Tor Skyline Banner
{ id = 258202, category = "Tailoring", expansion = "The Burning Crusade", model3D = 193745, spell = 1263669, skill = "The Burning Crusade Tailoring", skillNeeded = 60, reagents = {{id = 242691, amount = 18}, {id = 21842, amount = 4}, {id = 22457, amount = 3}, {id = 14341, amount = 3}} }, -- Grand Drape of the Exiles
{ id = 258195, category = "Tailoring", expansion = "The Burning Crusade", model3D = 192460, spell = 1263692, skill = "The Burning Crusade Tailoring", skillNeeded = 60, reagents = {{id = 242691, amount = 35}, {id = 24271, amount = 4}, {id = 21845, amount = 4}, {id = 24272, amount = 4}} }, -- Draenei Weaver's Loom
{ id = 258561, category = "Tailoring", expansion = "Shadowlands", model3D = 3051055, spell = 1263853, skill = "Shadowlands Tailoring", skillNeeded = 80, reagents = {{id = 251772, amount = 14}, {id = 173202, amount = 12}, {id = 177062, amount = 5}} }, -- Kyrian Aspirant's Rolled Cushion
{ id = 258557, category = "Tailoring", expansion = "Legion", model3D = 1282676, spell = 1263858, skill = "Legion Tailoring", skillNeeded = 80, reagents = {{id = 251767, amount = 8}, {id = 124437, amount = 15}, {id = 129032, amount = 5}, {id = 130175, amount = 2}, {id = 127037, amount = 2}} }, -- Beloved Raptor Plushie
{ id = 264713, category = "Tailoring", expansion = "Shadowlands", model3D = 3564033, spell = 1272575, skill = "Shadowlands Tailoring", skillNeeded = 80, reagents = {{id = 251772, amount = 45}, {id = 172439, amount = 20}, {id = 177062, amount = 10}, {id = 177061, amount = 2}, {id = 173170, amount = 6}} }, -- Heart of the Forest Banner
{ id = 264678, category = "Tailoring", expansion = "Shadowlands", model3D = 2992361, spell = 1272578, skill = "Shadowlands Tailoring", skillNeeded = 80, reagents = {{id = 251772, amount = 16}, {id = 171828, amount = 12}, {id = 173202, amount = 25}, {id = 177062, amount = 5}, {id = 173173, amount = 1}} }, -- Aspirant's Ringed Banner
{ id = 279350, category = "Tailoring", expansion = "Midnight", model3D = 5975145, spell = 1296512, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239702, amount = 8}} }, -- Twilight's Blade Bedroll
{ id = 279353, category = "Tailoring", expansion = "Midnight", model3D = 1661560, spell = 1296514, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 3}, {id = 256963, amount = 8}, {id = 239702, amount = 4}} }, -- Tortollan Slingsack	

{ id = 282158, category = "Tailoring", expansion = "Legion", model3D = 1695047, spell = 1313524, skill = "Legion Tailoring", skillNeeded = 85, reagents = {{id = 251767, amount = 6}, {id = 151567, amount = 35}, {id = 127037, amount = 10}} }, -- Decorative Lightweave Bolt
{ id = 282184, category = "Tailoring", expansion = "Midnight", model3D = 5019429, spell = 1315440, skill = "Midnight Tailoring", skillNeeded = 50, reagents = {{id = 251665, amount = 6}, {id = 256963, amount = 6}, {id = 33226, amount = 20}, {id = 252990, amount = 5}, {id = 239198, amount = 2}} }, -- Spidery Witch Hat
{ id = 283299, category = "Tailoring", expansion = "Kul Tiran", model3D = 1591070, spell = 1315445, skill = "Kul Tiran Tailoring", skillNeeded = 140, reagents = {{id = 251768, amount = 4}, {id = 159959, amount = 10}, {id = 158378, amount = 5}, {id = 168663, amount = 3}} }, -- Nomad's Round Cushion
{ id = 284244, category = "Tailoring", expansion = "Dragon Isles", model3D = 4551444, spell = 1315691, skill = "Dragon Isles Tailoring", skillNeeded = 50, reagents = {{id = 251773, amount = 5}, {id = 193053, amount = 20}, {id = 284249, amount = 2}, {id = 193929, amount = 2}, {id = 192095, amount = 5}} }, -- Lillistrasza's Lucky Duck Plushie
{ id = 284246, category = "Tailoring", expansion = "Classic", model3D = 8096059, spell = 1315757, skill = "Classic Tailoring", skillNeeded = 150, reagents = {{id = 245586, amount = 4}, {id = 14048, amount = 3}, {id = 4339, amount = 3}, {id = 4305, amount = 3}, {id = 14342, amount = 1}, {id = 14341, amount = 2}} }, -- Beloved Plush Doll	
{ id = 284238, category = "Tailoring", expansion = "Draenor", model3D = 969758, spell = 1315766, skill = "Draenor Tailoring", skillNeeded = 0, reagents = {{id = 251766, amount = 6}, {id = 111557, amount = 8}, {id = 114931, amount = 3}, {id = 113588, amount = 1}} }, -- Beloved Murloc Plushie
    },
  },
}

-------------------------------------------------
-- QUESTS
-------------------------------------------------
DVD.quests = DVD.quests or {}

DVD.quests = { 
{ 
 name = "Amirdrassil",
		quests =	{
        { id = 78864, questName = "The Returning", type = "quest", itemID = 251022, model3D = 4756256, title = "Bel'ameth Traveler's Pack", expansion = "Dragonflight", faction = "neutral"},
		{ id = 77283, questName = "A Multi-Front Battle", type = "quest", itemID = 257352, model3D = 4690349, title = "Large Brazier of Elune", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{    
	    name = "Arcantina",
		quests = {
        { id = 92322, questName = "Timear Foresees a Proof of Demise!", type = "quest", itemID = 253176, model3D = 774267, title = "Ancient Zandalari Ritual Scroll", expansion = "Midnight", faction = "neutral"}, --9250    		
		{ id = 92321, questName = "A Frostbitten Tally", type = "quest", itemID = 253598, model3D = 194802, title = "Banner of the Ebon Blade", expansion = "Midnight", faction = "neutral"},--9475
		{ id = 92327, questName = "A Generational Moment", type = "quest", itemID = 253174, model3D = 305201, title = "Dried Gilnean Roses", expansion = "Midnight", faction = "neutral"},
		{ id = 92327, questName = "A Generational Moment", type = "quest", itemID = 253543, model3D = 902697, title = "Clefthoof Hide Rug", expansion = "Midnight", faction = "neutral" },
		{ id = 92323, questName = "Where the Fire Once Burned", type = "quest", itemID = 253175, model3D = 651497, title = "Hyjal Climbing Vine", expansion = "Midnight", faction = "neutral"},--9249
		{ id = 92320, questName = "Still Behind Enemy Portals", type = "quest", itemID = 253178, model3D = 1383910, title = "Inactive Filigree Moon Lamp", expansion = "Midnight", faction = "neutral"},--9252
		{ id = 92326, questName = "The Fragrance of the Dunes", type = "quest", itemID = 253179, model3D = 1611709, title = "Ornamental Proudmoore Anchor", expansion = "Midnight", faction = "neutral"},--9253
		{ id = 92324, questName = "Uncrowned's Cold Case", type = "quest", itemID = 253177, model3D = 1327768, title = "Pylon Fragment", expansion = "Midnight", faction = "neutral"},--9251
		{ id = 92319, questName = "A Favor to Axe", type = "quest", itemID = 253542, model3D = 874421, title = "Scarred Orcish Spear", expansion = "Midnight", faction = "neutral"},--9439
		{ id = 92325, questName = "Hellscream's Heritage", type = "quest", itemID = 253544, model3D = 985164, title = "Weathered History of the Warchiefs", expansion = "Midnight", faction = "neutral"}, --9441
		{ id = 95780, questName = "Hope for the Orphans", type = "quest", itemID = 278038, model3D = 5658299, title = "Arathor Toy Sword", expansion = "Midnight", faction = "neutral"},
		{ id = 95779, questName = "Moments in a Mug", type = "quest", itemID = 278694, model3D = 526368, title = "Stormstout Hanging Lantern", expansion = "Midnight", faction = "neutral"},
		}
    },	
{ 
 name = "Argus", 
		quests = {
        { id = 47691, questName = "A Non-Prophet Organization", type = "quest", itemID = 245422, model3D = 979926, title = "Draenic Bookcase", expansion = "Legion", faction = "neutral" },
        { id = 44004, questName = "Bringer of the Light", type = "quest", itemID = 251480, model3D = 902396, title = "Draenic Wooden Wall Shelf", expansion = "Legion", faction = "neutral"},
		}
    },
{	
 name = "Azj-Kahet",
		quests = {
        { id = 82141, questName = "To Kill a Queen", type = "quest", itemID = 260583, model3D = 4892782, title = "Arathi Bartender's Shelves", expansion = "The War Within", faction = "neutral" },
		}
    },	
{ 
 name = "Azsuna", 
		quests =	{
        { id = 41143, questName = "Mglrgrs Of Our Grmlgrlr", type = "quest", itemID = 258222, model3D = 1091599, title = "Shellscale Standard", expansion = "Legion", faction = "neutral"},
        { id = 37470, questName = "The Head of the Snake", type = "quest", itemID = 246864, model3D = 4298560, title = "Tome of the Lost Dragon", expansion = "Legion", faction = "neutral"},
		}
    },
{ 
 name = "Blackrock Depths", 
		quests =	{
		{ id = 7604, questName = "A Binding Contract", type = "quest", itemID = 256673, model3D = 953668, title = "Stormwind Forge", expansion = "Classic", faction = "neutral", note = "purchase a sulfuron ingot" },
		}
    },
{ 
 name = "Blasted Lands", -- 2 notes
		quests =	{
		{ id = 25720, questName = "The Downfall of Marl Wormthorn", type = "quest", itemID = 244777, model3D = 304416, title = "Surwich Peddler's Wagon", expansion = "Cataclysm", faction = "alliance", note = "Quest chain to start it  is  with Mayor Charlton Connisport" },	
		}
    },	
{ 
 name = "Borean Tundra", -- 2 notes
		quests =	{
	  { id = 11566, questName = "Surrender... Not!", type = "quest", itemID = 258220, model3D = 1091581, title = "Murloc Driftwood Hut", expansion = "Wrath of the Lich King", faction = "neutral", note = "Unlocks after doing Winterfin Commerce" },
		}
    },
{ 
 name = "Burning Steppes", 
		quests =	{
        { id = 28183, questName = "Return to Keeshan", type = "quest", itemID = 256331, model3D = 7385423, title = "Shadowforge Lamppost", expansion = "Cataclysm", faction = "alliance" },
		}
    },
{ 
    name = "Dalaran(Northrend)", 
    quests = {
        { 
            id = { 13103, 13115 }, 
            questName = "Cheese for Glowergold", 
            type = "quest", 
            itemID = 258145, 
            model3D = 6051297, 
            title = "Eversong Party Platter", 
            expansion = "Wrath of the Lich King", 
            faction = "neutral", 
            note = "This is a rare daily Cooking quest" 
        },
    }
},
{ 
 name = "Dornogal",  -- 1 note
		quests =	{
        { id = 92580, questName = "Spare A Chair", type = "quest", itemID = 246487, model3D = 6699745, title = "Gnomish Tesla Coil", expansion = "The War Within", faction = "neutral"  },
        { id = 92572, questName = "Furniture Favor", type = "quest", itemID = 253173, model3D = 7262874, title = "Meadery Storage Barrel", expansion = "The War Within", faction = "neutral"  },
        { id = 92577, questName = "Dreamy Inspiration", type = "quest", itemID = 245259, model3D = 1096761, title = "Small Val'sharah Bookcase", expansion = "The War Within", faction = "neutral" },
        { id = 92581, questName = "Last Light", type = "quest", itemID = 247915, model3D = 1361710, title = "Square Suramar Table", expansion = "The War Within", faction = "neutral"},
        { id = 92578, questName = "Draconic Decor", type = "quest", itemID = 248116, model3D = 4290181, title = "Valdrakken Chandelier", expansion = "The War Within", faction = "neutral"   },
		{ id = 79530, questName = "Bad Business", type = "quest", itemID = 252756, model3D = 5335168, title = "Stonelight Countertop", expansion = "The War Within", faction = "neutral"  },
		}
    },
{ 
 name = "Drustvar", 
		quests =	{
        { id = 51985, questName = "Return to Zuldazar", type = "quest", itemID = 245475, model3D = 2445708, title = "Forsaken Long Table", expansion = "Battle for Azeroth", faction = "horde" },
		}
    },
{ 
 name = "Duskwood", 
		quests =	{
        { id = 26754, questName = "Morbent's Bane", type = "quest", itemID = 256905, model3D = 322634, title = "Small Gilnean Table", expansion = "Cataclysm", faction = "alliance"},
        { id = 26760, questName = "Cry For The Moon", type = "quest", itemID = 245624, model3D = 464019, title = "Waning Wood Fence", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Elwynn Forest", 
		quests =	{
        { id = 114, questName = "The Escape", type = "quest", itemID = 253527, model3D = 936454, title = "Goldshire Wardrobe", expansion = "Classic", faction = "alliance"},
        { id = 60, questName = "Kobold Candles", type = "quest", itemID = 248938, model3D = 960094, title = "Hooded Iron Lantern", expansion = "Classic", faction = "alliance" },
		{ id = 54, questName = "Report to Goldshire", type = "quest", itemID = 248798, model3D = 950755, title = "Northshire Barrel", expansion = "Classic", faction = "alliance"},
		}
    },
{ 
 name = "Eversong Woods", 
		quests =	{
		{ id = 90493, questName = "The Heart of Tranquillien", type = "quest", itemID = 253485, model3D = 6036095, title = "Sin'dorei Honor Stone", expansion = "Midnight", faction = "neutral"},--1159
		{ id = 90907, questName = "The First to Know", type = "quest", itemID = 244783, model3D = 6856603, title = "Majestic Lightwood Table", expansion = "Midnight", faction = "neutral"},--1489
		{ id = 86741, questName = "Lightbloom Looming", type = "quest", itemID = 245992, model3D = 6985813, title = "Ornate Silvermoon Candelabra", expansion = "Midnight", faction = "neutral"},--1908
		{ id = 92025, questName = "Flowers for Amalthea", type = "quest", itemID = 257418, model3D = 6210870, title = "Ornate Sin'dorei Sconce", expansion = "Midnight", faction = "neutral"},
		{ id = 86739, questName = "Fairbreeze Favors", type = "quest", itemID = 264248, model3D = 6026041, title = "Sin'dorei Storage Jar", expansion = "Midnight", faction = "neutral" },
		}
    },
{ 
 name = "Felwood", 
		quests =	{
        { id = 28337, questName = "The Shredders of Irontree", type = "quest", itemID = 256903, model3D = 304626, title = "Gilnean Banded Crate", expansion = "Cataclysm", faction = "alliance"},--11301		
		}
    },
{ 
 name = "Founder's Point", 
		quests =	{
    { id = 92984, questName = "Decor Treasure Hunt", type = "quest", itemID = 245336, model3D = 6373411, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92998, questName = "Decor Treasure Hunt", type = "quest", itemID = 246102, model3D = 6390432, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92970, questName = "Decor Treasure Hunt", type = "quest", itemID = 246742, model3D = 6390427, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },      
    { id = 93007, questName = "Decor Treasure Hunt", type = "quest", itemID = 253181, model3D = 6435027, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92983, questName = "Decor Treasure Hunt", type = "quest", itemID = 245372, model3D = 6373543, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92965, questName = "Decor Treasure Hunt", type = "quest", itemID = 235523, model3D = 6372825, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92985, questName = "Decor Treasure Hunt", type = "quest", itemID = 246106, model3D = 6390548, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92969, questName = "Decor Treasure Hunt", type = "quest", itemID = 242951, model3D = 6390429, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92997, questName = "Decor Treasure Hunt", type = "quest", itemID = 246107, model3D = 6435012, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92978, questName = "Decor Treasure Hunt", type = "quest", itemID = 243334, model3D = 6390437, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92437, questName = "Decor Treasure Hunt", type = "quest", itemID = 245375, model3D = 6008928, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92999, questName = "Decor Treasure Hunt", type = "quest", itemID = 245662, model3D = 6390434, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92964, questName = "Decor Treasure Hunt", type = "quest", itemID = 245376, model3D = 6046867, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93005, questName = "Decor Treasure Hunt", type = "quest", itemID = 253441, model3D = 6783465, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92967, questName = "Decor Treasure Hunt", type = "quest", itemID = 236678, model3D = 6426476, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92968, questName = "Decor Treasure Hunt", type = "quest", itemID = 236677, model3D = 6426477, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93000, questName = "Decor Treasure Hunt", type = "quest", itemID = 241618, model3D = 6435018, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92976, questName = "Decor Treasure Hunt", type = "quest", itemID = 246243, model3D = 7000933, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93006, questName = "Decor Treasure Hunt", type = "quest", itemID = 253479, model3D = 6435016, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92994, questName = "Decor Treasure Hunt", type = "quest", itemID = 245575, model3D = 6892458, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92961, questName = "Decor Treasure Hunt", type = "quest", itemID = 245384, model3D = 6008929, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92975, questName = "Decor Treasure Hunt", type = "quest", itemID = 246245, model3D = 7000934, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92993, questName = "Decor Treasure Hunt", type = "quest", itemID = 245576, model3D = 6892456, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93004, questName = "Decor Treasure Hunt", type = "quest", itemID = 244780, model3D = 6435022, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92986, questName = "Decor Treasure Hunt", type = "quest", itemID = 239075, model3D = 6712076, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92996, questName = "Decor Treasure Hunt", type = "quest", itemID = 246502, model3D = 6390430, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92992, questName = "Decor Treasure Hunt", type = "quest", itemID = 245578, model3D = 6892457, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92962, questName = "Decor Treasure Hunt", type = "quest", itemID = 245355, model3D = 6008934, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92981, questName = "Decor Treasure Hunt", type = "quest", itemID = 245547, model3D = 6390431, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92963, questName = "Decor Treasure Hunt", type = "quest", itemID = 245356, model3D = 6008945, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92977, questName = "Decor Treasure Hunt", type = "quest", itemID = 245548, model3D = 6390435, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92995, questName = "Decor Treasure Hunt", type = "quest", itemID = 255650, model3D = 6435838, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92966, questName = "Decor Treasure Hunt", type = "quest", itemID = 236676, model3D = 6426478, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92982, questName = "Decor Treasure Hunt", type = "quest", itemID = 244531, model3D = 6390441, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93008, questName = "Decor Treasure Hunt", type = "quest", itemID = 235994, model3D = 6033663, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92991, questName = "Decor Treasure Hunt", type = "quest", itemID = 246254, model3D = 7000943, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93002, questName = "Decor Treasure Hunt", type = "quest", itemID = 253490, model3D = 6435024, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92987, questName = "Decor Treasure Hunt", type = "quest", itemID = 235677, model3D = 6008939, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93009, questName = "Decor Treasure Hunt", type = "quest", itemID = 246255, model3D = 7000944, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92973, questName = "Decor Treasure Hunt", type = "quest", itemID = 246101, model3D = 6390428, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93003, questName = "Decor Treasure Hunt", type = "quest", itemID = 257690, model3D = 6435021, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92972, questName = "Decor Treasure Hunt", type = "quest", itemID = 246103, model3D = 6390436, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92974, questName = "Decor Treasure Hunt", type = "quest", itemID = 246246, model3D = 7000935, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92980, questName = "Decor Treasure Hunt", type = "quest", itemID = 245556, model3D = 6390439, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92988, questName = "Decor Treasure Hunt", type = "quest", itemID = 235675, model3D = 6008933, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92989, questName = "Decor Treasure Hunt", type = "quest", itemID = 253589, model3D = 7151263, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92971, questName = "Decor Treasure Hunt", type = "quest", itemID = 246104, model3D = 6390443, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92990, questName = "Decor Treasure Hunt", type = "quest", itemID = 246258, model3D = 7000947, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 92979, questName = "Decor Treasure Hunt", type = "quest", itemID = 245334, model3D = 6390444, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },
    { id = 93001, questName = "Decor Treasure Hunt", type = "quest", itemID = 244782, model3D = 6435041, title = "Unknown Title", expansion = "Midnight", faction = "alliance" },	
		}
    },	
{ 
 name = "Frostwall", 
		quests =	{
        { id = 36614, questName = "My Very Own Fortress", type = "quest", itemID = 244315, model3D = 979433, title = "Orcish Warlords's Planning Table", expansion = "Warlords of Draenor", faction = "horde" },
        { id = 33470, questName = "Pool of Visions", type = "quest", itemID = 244320, model3D = 996200, title = "Youngling's Courser Toys", expansion = "Warlords of Draenor", faction = "horde"},
		}
    },
{ 
 name = "Gilneas", 
		quests =	{
		{ id = 24675, category = "race", questName = "Last Meal", type = "quest", itemID = 245518, model3D = 305584, title = "Worgen's Chicken Coop", expansion = "Cataclysm", faction = "alliance", note = "worgen locked"},
		{ id = 14402, category = "race", questName = "Ready to Go", type = "quest", itemID = 245620, model3D = 321660, title = "Little Wolf's Loo", expansion = "Cataclysm", faction = "alliance", note = "worgen locked" },        
		}
    },	
{ 
 name = "Grizzly Hills", 
		quests =	{
        { id = 12227, questName = "Doing Your Duty", type = "quest", itemID = 248622, model3D = 1048173, title = "Wooden Outhouse", expansion = "Wrath of the Lich King", faction = "alliance" },
		}
    },
{ 
 name = "Harandar", 
		quests =	{
		{ id = 86851, questName = "The Foundation of Aln", type = "quest", itemID = 266259, model3D = 6310381, title = "Altar of the Shul'ka", expansion = "Midnight", faction = "neutral" },--17886
		{ id = 88994, questName = "The Cauldron of Echoes", type = "quest", itemID = 263315, model3D = 5163359, title = "Bubbling Haranir Cauldron", expansion = "Midnight", faction = "neutral" },--15155
		{ id = 86861, questName = "Herding Manifestations", type = "quest", itemID = 252045, model3D = 6225718, title = "Fungal Pergola", expansion = "Midnight", faction = "neutral" },--8993
		{ id = 88997, questName = "Russula's Outreach", type = "quest", itemID = 262906, model3D = 6310371, title = "Harandar Anvil", expansion = "Midnight", faction = "neutral" },--14799
		{ id = 91589, questName = "Root Dash Delivery", type = "quest", itemID = 264178, model3D = 6326888, title = "Harandar Charcuterie Board", expansion = "Midnight", faction = "neutral" },--15463
		{ id = 88995, questName = "Aln'hara's Bloom", type = "quest", itemID = 263196, model3D = 6252873, title = "Harandar Glowvine Lantern", expansion = "Midnight", faction = "neutral" },--14968
		{ id = 86956, questName = "The Traveling Flowers", type = "quest", itemID = 262614, model3D = 6796710, title = "Harandar Runestone", expansion = "Midnight", faction = "neutral" },--14639
		{ id = 88996, questName = "The Echoless Flame", type = "quest", itemID = 264262, model3D = 6252870, title = "Haranir Whistling Arrow", expansion = "Midnight", faction = "neutral" },--15497
		{ id = 88998, questName = "Root of the World", type = "quest", itemID = 263041, model3D = 6252867, title = "Replica Root of the World", expansion = "Midnight", faction = "neutral" },--14827
		{ id = 88999, questName = "Sky's Hope", type = "quest", itemID = 253443, model3D = 6796713, title = "Replica Sky's Hope", expansion = "Midnight", faction = "neutral" },--1080
		{ id = 88993, questName = "Wey'nan's Ward", type = "quest", itemID = 263037, model3D = 4732015, title = "Replica Wey'nan's Ward", expansion = "Midnight", faction = "neutral" },--14823
		{ id = 86866, questName = "Can We Heal This?", type = "quest", itemID = 254319, model3D = 6225721, title = "Root-Woven Door", expansion = "Midnight", faction = "neutral" },--10327
		{ id = 86891, questName = "A Last Resort", type = "quest", itemID = 254878, model3D = 6225720, title = "Root-Woven Window", expansion = "Midnight", faction = "neutral" },--10778
		{ id = 86911, questName = "Echoes and Memories", type = "quest", itemID = 246415, model3D = 6326881, title = "Ruddy Haranir Pigment Bowl", expansion = "Midnight", faction = "neutral" },--2232
		{ id = 86896, questName = "Light Finds a Way", type = "quest", itemID = 247234, model3D = 6225702, title = "Rustic Harandar Planter", expansion = "Midnight", faction = "neutral" },--2605
		{ id = 86867, questName = "Into the Lightbloom", type = "quest", itemID = 253467, model3D = 6055100, title = "Rutaani Sporepod", expansion = "Midnight", faction = "neutral" },--1147
		{ id = 86857, questName = "Descent into the Rift", type = "quest", itemID = 246407, model3D = 6326912, title = "Stoppered Spring Water Gourd", expansion = "Midnight", faction = "neutral" },--2224
		{ id = 86973, questName = "Halting Harm in Har'mara", type = "quest", itemID = 245535, model3D = 6310382, title = "Sturdy Haranir Handcart", expansion = "Midnight", faction = "neutral" },--1726
		{ id = 90834, questName = "From this Point Forward", type = "quest", itemID = 263020, model3D = 4732018, title = "Ward of the Shul'ka", expansion = "Midnight", faction = "neutral" },--14809
		}
    },	
{ 
 name = "Highmountain", 
		quests =	{
        { id = 40230, questName = "Oh, the Clawdacity!", type = "quest", itemID = 258221, model3D = 1091587, title = "Driftwood Junk Pile", expansion = "Legion", faction = "neutral" },
        { id = 39487, questName = "Crystal Fury", type = "quest", itemID = 264477, model3D = 1253823, title = "Thunder Totem Mailbox", expansion = "Legion", faction = "neutral" },--15741
        { id = 39496, questName = "The Flow of the River", type = "quest", itemID = 245409, model3D = 6877680, title = "Dried Whitewash Corn", expansion = "Legion", faction = "neutral" },        
        { id = 39426, questName = "Blood Debt", type = "quest", itemID = 257722, model3D = 1255418, title = "Hanging Arrow Kite", expansion = "Legion", faction = "neutral"  },
        { id = 39387, questName = "The Skies of Highmountain", type = "quest", itemID = 257401, model3D = 1255331, title = "Skyhorn Banner", expansion = "Legion", faction = "neutral" },
        { id = 39305, questName = "Empty Nest", type = "quest", itemID = 257723, model3D = 1255422, title = "Skyhorn Eagle Kite", expansion = "Legion", faction = "neutral" },	
        { id = 39992, questName = "Huln's War - The Nathrezim", type = "quest", itemID = 257397, model3D = 1345313, title = "Tauren Storyteller's Frame", expansion = "Legion", faction = "neutral"  },
        { id = 39780, questName = "The Underking", type = "quest", itemID = 245461, model3D = 1305130, title = "Tauren Vertical Windmill", expansion = "Legion", faction = "neutral"  },
        { id = 39614, questName = "Fish Out of Water", type = "quest", itemID = 245457, model3D = 1323065, title = "Riverbend Netting", expansion = "Legion", faction = "neutral" },
        { id = 42590, questName = "Moozy's Reunion", type = "quest", itemID = 245453, model3D = 1322950, title = "Whitewash River Basket", expansion = "Legion", faction = "neutral" },
        { id = 42622, questName = "Ceremonial Drums", type = "quest", itemID = 245405, model3D = 6711671, title = "Large Highmountain Drum", expansion = "Legion", faction = "neutral" },
        { id = 39579, questName = "The Backdoor", type = "quest", itemID = 245456, model3D = 1253406, title = "Warbrave's Brazier", expansion = "Legion", faction = "neutral"  },
        { id = 39772, questName = "Can't Hold a Candle To You", type = "quest", itemID = 260698, model3D = 1255019, title = "Kobold Trassure Pile", expansion = "Legion", faction = "neutral" },		
		}
    },
{ 
 name = "Isle of Dorn", 
		quests =	{
        { id = 79565, questName = "Janky Candles", type = "quest", itemID = 258267, model3D = 5169960, title = "Candle-Festooned Wooden Awning", expansion = "The War Within", faction = "neutral"},
        { id = 82895, questName = "The Weight of Duty", type = "quest", itemID = 253034, model3D = 4860713, title = "Fallside Lantern", expansion = "The War Within", faction = "neutral"}, 
        { id = 78999, questName = "Heart of a Hero", type = "quest", itemID = 253021, model3D = 4896177, title = "Freywold Bench", expansion = "The War Within", faction = "neutral" },
        { id = 78759, questName = "To Wake a Giant", type = "quest", itemID = 253166, model3D = 4906199, title = "Freywold Fountain", expansion = "The War Within", faction = "neutral" },
        { id = 79703, questName = "Hope, An Anomaly", type = "quest", itemID = 253035, model3D = 4896174, title = "Freywold Seat", expansion = "The War Within", faction = "neutral"  },
		{ id = 84996, questName = "Vereesa's Tale", type = "quest", itemID = 246851, model3D = 1453482, title = "Raising Your Eyes Painting", expansion = "The War Within", faction = "neutral"  },  		
		}
    },
{ 
 name = "Kun-Lai Summit", 
		quests =	{
        { id = 30612, questName = "The Leader Hozen", type = "quest", itemID = 264349, model3D = 7508746, title = "Kun-Lai Lacquered Rickshaw", expansion = "Mists of Pandaria", faction = "neutral"},
        { id = 32816, questName = "Path of the Last Emperor", type = "quest", itemID = 247858, model3D = 531955, title = "Shaohao Ceremonial Bell", expansion = "Mists of Pandaria", faction = "neutral"},
		}
    },
{ 
 name = "Loch Modan", 
		quests =	{
        { id = 26868, questName = "Axis of Awful", type = "quest", itemID = 246422, model3D = 197430, title = "Thelsamar Hanging Lantern", expansion = "Classic", faction = "alliance"},
		}
    },
{ 
 name = "Lunarfall",
		quests =	{
        { id = 36615, questName = "My Very Own Castle", type = "quest", itemID = 248800, model3D = 969975, title = "Architect's Drafting Table", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 36592, questName = "Bigger is Better", type = "quest", itemID = 248661, model3D = 949629,  title = "Northshire Scribe's Desk", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 35176, questName = "Keeping it Together", type = "quest", itemID = 248810, model3D = 7151868, title = "Rough Wooden Chair", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 36404, questName = "Clearing the Garden", type = "quest", itemID = 248334, model3D = 7571145, title = "Stormwind Wooden Bench", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 34192, questName = "Things Are Not Goren Our Way", type = "quest", itemID = 248660, model3D = 943720,  title = "Stormwind Workbench", expansion = "Warlords of Draenor", faction = "alliance" },
        { id = 34586, questName = "Establish Your Garrison", type = "quest", itemID = 248799, model3D = 950767,  title = "Wooden Storage Crate", expansion = "Warlords of Draenor", faction = "alliance"},		
        { id = 36202, questName = "Anglin' In Our Garrison", type = "quest", itemID = 248335, model3D = 953802, title = "Stormwind Wooden Stool", expansion = "Warlords of Draenor", faction = "alliance"},        		
		}
    },
{ 
 name = "Mechagon", 
		quests =	{
        { id = 55736, questName = "Welcome to the Resistance", type = "quest", itemID = 246703, model3D = 1842930, title = "Double-Sprocket Table", expansion = "Battle for Azeroth", faction = "neutral"},
		}
    },
{ 
 name = "Nagrand", 
		quests =	{
        { id = 35396, questName = "The Dark Heart of Oshu'gun", type = "quest", itemID = 245425, model3D = 917996, title = "Hanging Draenethyst Light", expansion = "Warlords of Draenor", faction = "alliance"},
		}
    },
{ 
 name = "Nazmir", 
		quests =	{
        { id = 50808, questName = "Halting the Empire's Fall", type = "quest", itemID = 245491, model3D = 1661034, title = "Bwonsamdi's Golden Gong", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47188, questName = "The Aid of the Loa", type = "quest", itemID = 245488, model3D = 1590851, title = "Zandalari Rickshaw", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47250, questName = "We'll Meet Again", type = "quest", itemID = 245489, model3D = 1597479, title = "Zuldazar Stool", expansion = "Battle for Azeroth", faction = "horde"},
		}
    },
{ 
 name = "Founders Point | Razorwind Shores", 
		quests =	{        
	{ id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 256684, model3D = 6654719, title = "Purified Troll Amulet", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 278701, model3D = 5793093, title = "Purified Goblin Cup", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 267355, model3D = 7554177, title = "Purified Elven Mirror", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 267435, model3D = 7554186, title = "Purified Kaldorei Candle", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 252042, model3D = 6212457, title = "Purified Troll Pitcher", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 263876, model3D = 7338169, title = "Purified Folk Mirror", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 253703, model3D = 6654736, title = "Purified Crude Hammer", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 255712, model3D = 6654760, title = "Purified Ancient Urn", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 245991, model3D = 6985812, title = "Purified Sin'dorei Candle", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 245993, model3D = 6985814, title = "Purified Floating Lantern", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 255652, model3D = 6654716, title = "Purified Troll Loop", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 267205, model3D = 7345175, title = "Purified Folk Candle", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 268943, model3D = 7554195, title = "Purified Elven Glowlamp", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 272129, model3D = 1324327, title = "Purified Tauren Pot", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 253396, model3D = 6654738, title = "Purified Crude Axe", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 272142, model3D = 5203782, title = "Purified Earthen Pot", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 256361, model3D = 6654720, title = "Purified Troll Pendant", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 258540, model3D = 6654715, title = "Purified Troll Ring", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 278696, model3D = 4495230, title = "Purified Dracthyr Stein", expansion = "Midnight", faction = "neutral" },
    { id = 98204, questName = "Cursed Keepsake", type = "quest", itemID = 244347, model3D = 6904849, title = "Purified Troll Urn", expansion = "Midnight", faction = "neutral" },
	{ id = 98406, questName = "A Curated Gift", type = "quest", itemID = 245539, model3D = 6930643, title = "Elegant Enchanted Vanity", expansion = "Midnight", faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 254561, model3D = 6654718, title = "Ogre Champion's Prized Skull", expansion = "Midnight", faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 246958, model3D = 6225703, title = "Mastercrafted Fungal Row Planter", expansion = "Midnight", faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 253397, model3D = 6654743, title = "Revered Deepstone Table", expansion = "Midnight", faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 249923, model3D = 7216049, title = "Sin'dorei Golden Welcome", expansion = "Midnight", faction = "neutral" },
    { id = 98406, questName = "A Curated Gift", type = "quest", itemID = 253481, model3D = 6036347, title = "Masterful Sin'dorei Gravestone", expansion = "Midnight", faction = "neutral" },
		}
    },		
{ 
 name = "Northshire", 
		quests =	{        
        { id = 26390, questName = "Ending the Invasion!", type = "quest", itemID = 248621, model3D = 1004965, title = "Stormwind Arched Trellis", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Thunder Bluff", 
		quests =	{        
		{ id = 26397, category = "race", questName = "Walk With The Earth Mother", type = "quest", itemID = 243335, model3D = 6711674, title = "Tauren Bluff Rug", expansion = "Classic", faction = "horde", note = "Regular Tauren Only" },
		}
    },	
{ 
 name = "Razorwind Shores", 
		quests =	{
    { id = 93080, questName = "Decor Treasure Hunt", type = "quest", itemID = 245266, model3D = 6379084, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93078, questName = "Decor Treasure Hunt", type = "quest", itemID = 244533, model3D = 6379085, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93137, questName = "Decor Treasure Hunt", type = "quest", itemID = 245649, model3D = 6892372, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93097, questName = "Decor Treasure Hunt", type = "quest", itemID = 246217, model3D = 6379060, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93079, questName = "Decor Treasure Hunt", type = "quest", itemID = 244534, model3D = 6379088, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93099, questName = "Decor Treasure Hunt", type = "quest", itemID = 246224, model3D = 6379070, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93111, questName = "Decor Treasure Hunt", type = "quest", itemID = 245555, model3D = 6379056, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93110, questName = "Decor Treasure Hunt", type = "quest", itemID = 245398, model3D = 6033664, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93085, questName = "Decor Treasure Hunt", type = "quest", itemID = 246259, model3D = 7000948, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93091, questName = "Decor Treasure Hunt", type = "quest", itemID = 246036, model3D = 6379058, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93083, questName = "Decor Treasure Hunt", type = "quest", itemID = 245545, model3D = 6379068, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93075, questName = "Decor Treasure Hunt", type = "quest", itemID = 236666, model3D = 6429362, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93147, questName = "Decor Treasure Hunt", type = "quest", itemID = 253493, model3D = 6435028, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93087, questName = "Decor Treasure Hunt", type = "quest", itemID = 246260, model3D = 7000949, title = "Unknown Title", expansion = "Midnight", faction = "horde" },	
    { id = 93088, questName = "Decor Treasure Hunt", type = "quest", itemID = 246261, model3D = 7000950, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93131, questName = "Decor Treasure Hunt", type = "quest", itemID = 246868, model3D = 6379062, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93132, questName = "Decor Treasure Hunt", type = "quest", itemID = 246869, model3D = 6379090, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93106, questName = "Decor Treasure Hunt", type = "quest", itemID = 247221, model3D = 6379089, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93081, questName = "Decor Treasure Hunt", type = "quest", itemID = 245532, model3D = 6379057, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93082, questName = "Decor Treasure Hunt", type = "quest", itemID = 245533, model3D = 6379087, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93102, questName = "Decor Treasure Hunt", type = "quest", itemID = 250920, model3D = 7048159, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93108, questName = "Decor Treasure Hunt", type = "quest", itemID = 251973, model3D = 6379072, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93149, questName = "Decor Treasure Hunt", type = "quest", itemID = 243495, model3D = 6435020, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93100, questName = "Decor Treasure Hunt", type = "quest", itemID = 246587, model3D = 6379071, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93107, questName = "Decor Treasure Hunt", type = "quest", itemID = 248246, model3D = 7080290, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93143, questName = "Decor Treasure Hunt", type = "quest", itemID = 241617, model3D = 6435017, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93148, questName = "Decor Treasure Hunt", type = "quest", itemID = 244169, model3D = 6435023, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93103, questName = "Decor Treasure Hunt", type = "quest", itemID = 246241, model3D = 6379080, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93134, questName = "Decor Treasure Hunt", type = "quest", itemID = 248760, model3D = 6435029, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93104, questName = "Decor Treasure Hunt", type = "quest", itemID = 246880, model3D = 7080284, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93152, questName = "Decor Treasure Hunt", type = "quest", itemID = 241621, model3D = 6435026, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93141, questName = "Decor Treasure Hunt", type = "quest", itemID = 251981, model3D = 6435837, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93105, questName = "Decor Treasure Hunt", type = "quest", itemID = 246883, model3D = 7080295, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93084, questName = "Decor Treasure Hunt", type = "quest", itemID = 245546, model3D = 6379069, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93142, questName = "Decor Treasure Hunt", type = "quest", itemID = 257691, model3D = 6712073, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93073, questName = "Decor Treasure Hunt", type = "quest", itemID = 236654, model3D = 6426638, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93140, questName = "Decor Treasure Hunt", type = "quest", itemID = 246249, model3D = 7000938, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93074, questName = "Decor Treasure Hunt", type = "quest", itemID = 236655, model3D = 6426639, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93098, questName = "Decor Treasure Hunt", type = "quest", itemID = 246218, model3D = 6379079, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93138, questName = "Decor Treasure Hunt", type = "quest", itemID = 246250, model3D = 7000939, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93135, questName = "Decor Treasure Hunt", type = "quest", itemID = 245581, model3D = 6892371, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93151, questName = "Decor Treasure Hunt", type = "quest", itemID = 257692, model3D = 7412674, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93136, questName = "Decor Treasure Hunt", type = "quest", itemID = 245583, model3D = 6892373, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93133, questName = "Decor Treasure Hunt", type = "quest", itemID = 246882, model3D = 7080288, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93101, questName = "Decor Treasure Hunt", type = "quest", itemID = 246687, model3D = 6379086, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93139, questName = "Decor Treasure Hunt", type = "quest", itemID = 246253, model3D = 7000942, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93077, questName = "Decor Treasure Hunt", type = "quest", itemID = 244532, model3D = 6379059, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93115, questName = "Decor Treasure Hunt", type = "quest", itemID = 246614, model3D = 7009610, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93150, questName = "Decor Treasure Hunt", type = "quest", itemID = 241620, model3D = 6435025, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
    { id = 93109, questName = "Decor Treasure Hunt", type = "quest", itemID = 245680, model3D = 6379065, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
		}
    },	
{ 
 name = "Searing Gorge", 
		quests =	{
        { id = 28064, questName = "Welcome to the Brotherhood", type = "quest", itemID = 246409, model3D = 197155, title = "Shadowforge Grinding Wheel", expansion = "Classic", faction = "neutral"},
        { id = 28035, questName = "The Mountain-Lord's Support", type = "quest", itemID = 245333, model3D = 6877809, title = "Shadowforge Wooden Box", expansion = "Cataclysm", faction = "neutral" },
		}
    },
{ 
 name = "Shadowmoon Valley", 
		quests =	{
        { id = 34792, questName = "The Traitor's True Name", type = "quest", itemID = 251548, model3D = 916279,  title = "Draenic Fence", expansion = "Warlords of Draenor", faction = "alliance"},
		{ id = 34792, questName = "The Traitor's True Name", type = "quest", itemID = 251330, model3D = 916603, title = "Draenic Fencepost", expansion = "Midnight", faction = "alliance" },
        { id = 36169, questName = "The Trial of Champions", type = "quest", itemID = 251477, model3D = 875146, title = "Draenic Wooden Table", expansion = "Warlords of Draenor", faction = "alliance" },
        { id = 33256, questName = "The Defense of Karabor", type = "quest", itemID = 251654, model3D = 7273284, title = "Large Karabor Fountain", expansion = "Warlords of Draenor", faction = "alliance" },
		{ id = 37322, questName = "The Prophet's Final Message", type = "quest", itemID = 251549, model3D = 944218, title = "Emblem of the Naaru's Blessing", expansion = "Warlords of Draenor", faction = "alliance"},
		{ id = 35196, questName = "Forging Ahead", type = "quest", itemID = 251478, model3D = 875150, title = "Square Draenic Table", expansion = "Warlords of Draenor", faction = "alliance" },
		{ id = 36685, questName = "Assault on the Heart of Shattrath", type = "quest", itemID = 251547, model3D = 915354, title = "Draenei Farmer's Trellis", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 38201, questName = "Missive: Assault on Shattrath Harbor", type = "quest", itemID = 241043, model3D = 875378, title = "Elodor Barrel", expansion = "Warlords of Draenor", faction = "alliance"},
		}
    },
{ 
 name = "Silverpine Forest", 
		quests =	{
        { id = 27098, questName = "Lordaeron", type = "quest", itemID = 245504, model3D = 397900, title = "Lordaeron Fence", expansion = "Classic", faction = "horde"},
		{ id = 27098, questName = "Lordaeron", type = "quest", itemID = 245505, model3D = 397901, title = "Lordaeron Fencepost", expansion = "Classic", faction = "horde"},
        { id = 27550, questName = "Pyrewood's Fall", type = "quest", itemID = 257412, model3D = 304495, title = "Stoppered Gilnean Barrel", expansion = "Cataclysm", faction = "horde"},
		}
    },
{ 
 name = "Silvermoon City", 
		quests =	{
        { id = 86735, questName = "Paved in Ash", type = "quest", itemID = 263231, model3D = 6050876, title = "Silvermoon Curio Shelves", expansion = "Midnight", faction = "neutral" },
	    { id = 90867, questName = "From Darkness, Light", type = "quest", itemID = 265631, model3D = 6684021, title = "Unknown Title", expansion = "Midnight", faction = "horde" },
        { id = 90867, questName = "From Darkness, Light", type = "quest", itemID = 265106, model3D = 6684020, title = "Unknown Title", expansion = "Midnight", faction = "horde" },	
		}
    },	
{ 
 name = "Spires of Arak", 
		quests =	{
        { id = 35704, questName = "When All Is Aligned", type = "quest", itemID = 258745, model3D = 7277023, title = "High Arakkoan Library Shelf", expansion = "Warlords of Draenor", faction = "neutral"},
        { id = 35273, questName = "Hot Seat", type = "quest", itemID = 258748, model3D = 7277026, title = "\"Rising Glory of Rukhmar\" Statue", expansion = "Warlords of Draenor", faction = "neutral" },
        { id = 35896, questName = "The Avatar of Terokk", type = "quest", itemID = 258749, model3D = 1113349, title = "Uncorrupted Eye of Terokk", expansion = "Warlords of Draenor", faction = "neutral"  },
        { id = 35671, questName = "A Gathering of Shadows", type = "quest", itemID = 258741, model3D = 968336, title = "Writings of Reshad the Outcast", expansion = "Warlords of Draenor", faction = "neutral"},
		}
    },
{ 
 name = "Stormheim ", 
		quests =	{
        { id = 38882, questName = "A New Life for Undeath", type = "quest", itemID = 245411, model3D = 6431407, title = "Dark Ship's Lantern", expansion = "Legion", faction = "horde"},
        { id = 39801, questName = "The Splintered Fleet", type = "quest", itemID = 253251, model3D = 1598111, title = "Blightfire Candle", expansion = "Legion", faction = "horde"},--durataur		
		}
    },	
{ 
 name = "Stormsong Valley", 
		quests =	{
        { id = 51401, questName = "Carry On", type = "quest", itemID = 252395, model3D = 1709395, title = "Brennadam Coop", expansion = "Battle for Azeroth", faction = "alliance"},
        { id = 50611, questName = "Storm's Vengeance", type = "quest", itemID = 252655, model3D = 7301013, title = "Copper Tidesage's Sconce", expansion = "Battle for Azeroth", faction = "alliance" },
        { id = 52122, questName = "To Be Forsaken", type = "quest", itemID = 245469, model3D = 2353882, title = "Lordaeron Lantern", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 51986, questName = "Return to Zuldazar", type = "quest", itemID = 245473, model3D = 2341256, title = "Forsaken Studded Table", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 50783, questName = "The Abyssal Council", type = "quest", itemID = 245984, model3D = 6988296, title = "Sagehold Window", expansion = "Battle for Azeroth", faction = "alliance"},		
		}
    },
{ 
 name = "Stormwind City",  
		quests =	{
        { id = 543, questName = "The Perenolde Tiara", type = "quest", itemID = 248662, model3D = 950140, title = "Jewelcrafter's Tent", expansion = "Classic", faction = "alliance" },
        { id = 59583, questName = "Welcome to Stormwind", type = "quest", itemID = 248336, model3D = 953804, title = "Stormwind Wooden Table", expansion = "Shadowlands", faction = "alliance"},   
		{ id = 76213, category = "race", questName = "Honor of the Goddess", type = "quest", itemID = 248401, model3D = 4756262, title = "Ornamental Kaldorei Glaive", expansion = "Dragonflight", faction = "alliance", note = "Night Elf Only"},
		{ id = 53566, category = "race", questName = "Dark Iron Dwarves", type = "quest", itemID = 245427, model3D = 1019061, title = "Dark Iron Expedition Tent", expansion = "Battle for Azeroth", faction = "alliance", note = "Dark Iron Dwarf Only" },
		}
    },
{ 
 name = "Suramar", 
		quests =	{
        { id = 44052, questName = "And They Will Tremble", type = "quest", itemID = 247914, model3D = 1361709, title = "Covered Ornate Suramar Table", expansion = "Legion", faction = "neutral" }, 
        { id = 41915, questName = "The Master's Legacy", type = "quest", itemID = 247917, model3D = 1361714, title = "Covered Small Suramar Table", expansion = "Legion", faction = "neutral", expansion = "Battle for Azeroth" },  
        { id = 44955, questName = "Visitor in Shal'Aran", type = "quest", itemID = 245558, model3D = 6924250, title = "Elaborate Suramar Window", expansion = "Legion", faction = "neutral" },
        { id = 40321, questName = "Feathersong's Redemption", type = "quest", itemID = 245701, model3D = 1096883, title = "Elven Round Table", expansion = "Legion", faction = "neutral" },		
        { id = 42489, questName = "Thalyssra's Drawers", type = "quest", itemID = 248009, model3D = 1309274, title = "Suramar Window", expansion = "Legion", faction = "neutral", expansion = "Battle for Azeroth"  },
        { id = 44756, questName = "Sign of the Dusk Lily", type = "quest", itemID = 247842, model3D = 1352412, title = "Nightborne Merchant's Stall", expansion = "Legion", faction = "neutral" },
        { id = 43318, questName = "Ly'leth's Champion", type = "quest", itemID = 247911, model3D = 1361686, title = "Shal'dorei Seat", expansion = "Legion", faction = "neutral" },		
		}
    },
{ 
 name = "Talador", 
		quests =	{
        { id = 35685, questName = "Socrethar's Demise", type = "quest", itemID = 251653, model3D = 7273283, title = "Draenethyst Lamppost", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 34099, questName = "The Battle for Shattrath", type = "quest", itemID = 251640, model3D = 942422, title = "Draenic Forge", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 33582, questName = "Kura's Vengeance", type = "quest", itemID = 258742, model3D = 968424, title = "Scroll of the Adherent", expansion = "Warlords of Draenor", faction = "neutral"},
		}
    },
{ 
 name = "Thaldraszus", 
		quests =	{
        { id = 72935, questName = "Archives Return", type = "quest", itemID = 248651, model3D = 7141928, title = "Draconic Memorial Stone", expansion = "Dragonflight", faction = "neutral" },
        { id = 70745, questName = "Enforced Relaxation", type = "quest", itemID = 256429, model3D = 3952854, title = "Valdrakken Lamppost", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{ 
 name = "The Azure Span", 
		quests =	{
        { id = 76597, questName = "On New Wings", type = "quest", itemID = 250912, model3D = 6892651, title = "Draconic Crafter's Forge", expansion = "Dragonflight", faction = "neutral" },
        { id = 67047, questName = "Warm Away These Shivers", type = "quest", itemID = 246706, model3D = 4201172, title = "Elegant Dracthyr's Tea Cup", expansion = "Dragonflight", faction = "neutral" },
        { id = 71097, questName = "A Helping Claw", type = "quest", itemID = 248653, model3D = 7141933, title = "Valdrakken Stone Stool", expansion = "Dragonflight", faction = "neutral"  },
		}
    },
{ 
 name = "The Coiled Isle", 
		quests =	{
        { id = 95564, questName = "The Serpent's Tail", type = "quest", itemID = 271851, model3D = 7277199, title = "Oozing Vilescar Barricade", expansion = "Midnight", faction = "neutral" },
		{ id = 96457, questName = "Nothing Must Remain", type = "quest", itemID = 271609, model3D = 7277186, title = "Destroyed Clutch of Ula'tek", expansion = "Midnight", faction = "neutral" },
		{ id = 93339, questName = "Trinket Trading", type = "quest", itemID = 271176, model3D = 7277162, title = "Feathered Ula'tek Talisman", expansion = "Midnight", faction = "neutral" },
		{ id = 92933, questName = "Haunted Shore", type = "quest", itemID = 279285, model3D = 1675098, title = "Lost Tortollan Scroll", expansion = "Midnight", faction = "neutral" },
		{ id = 93420, questName = "Lor'themar's Judgement", type = "quest", itemID = 279292, model3D = 5933618, title = "Zul'Aman Pine Tree", expansion = "Midnight", faction = "neutral" },
		{ id = 92930, questName = "Written by the Victors", type = "quest", itemID = 279452, model3D = 7498517, title = "Summoning of Ula'tek", expansion = "Midnight", faction = "neutral" },
		{ id = 93418, questName = "The Venomous Abyss", type = "quest", itemID = 279508, model3D = 8117702, title = "The Hunger Awakens Mural", expansion = "Midnight", faction = "neutral" },
		{ id = 96099, questName = "La'una's Fate", type = "quest", itemID = 280218, model3D = 1661561, title = "Tortollan Scholar Satchel", expansion = "Midnight", faction = "neutral" },
		}
    },	
{ 
 name = "The Forbidden Reach", 
		quests =	{
        { id = 72515, category = "race", questName = "Augmenting a Dragon", type = "quest", itemID = 249549, model3D = 4528488, title = "Draconic Crafter's Table", expansion = "Dragonflight", faction = "neutral", note = "Evoker Only" },
		}
    },
{ 
 name = "The Great Sea", 
		quests =	{
        { id = 52978, questName = "With Prince in Tow", type = "quest", itemID = 245470, model3D = 2470997, title = "Lordaeron Hanging Lantern", expansion = "Battle for Azeroth", faction = "horde"},
		}
    },
{ 
 name = "The Jade Forest", 
		quests =	{
        { id = 30000, questName = "The Jade Serpent", type = "quest", itemID = 264362, model3D = 576300, title = "Golden Pandaren Privacy Screen", expansion = "Mists of Pandaria", faction = "neutral" },
		{ id = 31230, questName = "Welcome to Dawn's Blossom", type = "quest", itemID = 247729, model3D = 519135, title = "Pandaren Stone Lamppost", expansion = "Mists of Pandaria", faction = "neutral" },
		}
    },
{ 
 name = "The Ringing Deeps", 
		quests =	{
		{ id = 82144, questName = "On the Road", type = "quest", itemID = 253040, model3D = 5248936, title = "Coreway Sentinel Lamppost", expansion = "The War Within", faction = "neutral" },
        { id = 83160, questName = "Cinderbrew Reserve", type = "quest", itemID = 253172, model3D = 7262833, title = "Gundargaz Grand Keg", expansion = "The War Within", faction = "neutral" },
        { id = 78642, questName = "New Candle, New Hope", type = "quest", itemID = 258264, model3D = 5169939, title = "Kobold Candle Trio", expansion = "The War Within", faction = "neutral" },
        { id = 79510, questName = "The Wickless Candle", type = "quest", itemID = 258262, model3D = 5169937, title = "Kobold Digger's Chair", expansion = "The War Within", faction = "neutral"},
        { id = 80516, questName = "Bump off the Boss", type = "quest", itemID = 258265, model3D = 5169958, title = "Kobold Wagon", expansion = "The War Within", faction = "neutral"},
		{ id = 78761, questName = "Into the Machine", type = "quest", itemID = 253020, model3D = 4860701, title = "Earthen Etched Throne", expansion = "The War Within", faction = "neutral" },
		}
    },
{ 
 name = "The Waking Shores", 
		quests =	{
        { id = 67063, questName = "10,000 Years of Roasting", type = "quest", itemID = 247223, model3D = 7109344, title = "Roast Riverbeast Platter", expansion = "Dragonflight", faction = "neutral" },
		{ id = 66001, questName = "A Last Hope", type = "quest", itemID = 246863, model3D = 4298559, title = "Open Tome of the Dragon's Dedication", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{ 
 name = "Tiragarde Sound", 
		quests =	{
        { id = 55045, questName = "My Brother's Keeper", type = "quest", itemID = 252754, model3D = 1887706, title = "Seaworthy Boralus Bell", expansion = "Battle for Azeroth", faction = "alliance" },
        { id = 53887, questName = "War Marches On", type = "quest", itemID = 252400, model3D = 1852941, title = "Tiragarde Emblem", expansion = "Battle for Azeroth", faction = "alliance"},
        { id = 51984, questName = "Return to Zuldazar", type = "quest", itemID = 245465, model3D = 2341259, title = "Tirisfal Wooden Chair", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47489, questName = "Stow and Go", type = "quest", itemID = 252406, model3D = 2023436, title = "Green Boralus Market Tent", expansion = "Battle for Azeroth", faction = "alliance"},		
        { id = 48089, questName = "Mountain Sounds", type = "quest", itemID = 252392, model3D = 1602483, title = "Admiral's Chandelier", expansion = "Battle for Azeroth", faction = "alliance"},
        { id = 50972, questName = "Proudmoore's Parley", type = "quest", itemID = 252386, model3D = 1602427, title = "Admiralty's Upholstered Chair", expansion = "Battle for Azeroth", faction = "alliance"},		
		{ id = 53720, questName = "Allegiance of Kul Tiras", type = "quest", itemID = 252403, model3D = 1852975, title = "Admiral's Bed", expansion = "Battle for Azeroth", faction = "alliance", note = "Unlocks Kul Tiran"},		
		}
    },
{ 
 name = "Twilight Highlands", 
		quests =	{
        { id = 28244, questName = "Eye Spy", type = "quest", itemID = 246427, model3D = 391448, title = "Dilapidated Wildhammer Well", expansion = "Cataclysm", faction = "alliance"},
        { id = 28655, questName = "Wild, Wild, Wildhammer Wedding", type = "quest", itemID = 246428, model3D = 392127, title = "Overgrown Wildhammer Fountain", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Undermine", 
		quests =	{
        { id = 87297, questName = "Cashing the Check", type = "quest", itemID = 243321, model3D = 5700691, title = "Cartel Head's Schmancy Desk", expansion = "The War Within", faction = "neutral"},
		{ id = 86408, questName = "My Hole in the Wall", type = "quest", itemID = 245306, model3D = 5793099, title = "Cozy Four-Pipe Bed", expansion = "The War Within", faction = "neutral"},
        { id = 85711, questName = "Unsolicited Feedback", type = "quest", itemID = 245325, model3D = 5689844, title = "Undermine Market Stall", expansion = "The War Within", faction = "neutral" },		
        { id = 87008, questName = "Ad-Hoc Wedding Planner", type = "quest", itemID = 245308, model3D = 5793083, title = "\"Elegant\" Lawn Flamingo", expansion = "The War Within", faction = "neutral" },
        { id = 84675, questName = "Showdown in the Attic", type = "quest", itemID = 260700, model3D = 5689810, title = "Gob-chanical Trash Heap", expansion = "The War Within", faction = "neutral" },
        { id = 83176, questName = "Just a Hunch", type = "quest", itemID = 245310, model3D = 5793102, title = "Reinforced Goblin Umbrella", expansion = "The War Within", faction = "neutral"},
        { id = 85780, questName = "Right Where We Want Him", type = "quest", itemID = 245303, model3D = 5900860, title = "Rocket-Unpowered Rocket", expansion = "The War Within", faction = "neutral" },		
		}
    },
{ 
 name = "Valdrakken", 
		quests =	{
        { id = 70880, questName = "To Cook With Finery", type = "quest", itemID = 248655, model3D = 7141935, title = "Elegant Dracthyr's Tea Set", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{ 
 name = "Valley of the Four Winds", 
		quests =	{
        { id = 30526, questName = "Lost and Lonely", type = "quest", itemID = 248663, model3D = 955690, title = "Wooden Doghouse", expansion = "Legion", faction = "neutral" },
		}
    },
{ 
 name = "Val'sharah", 
		quests =	{
        { id = 40890, questName = "The Tears of Elune", type = "quest", itemID = 245739, model3D = 1096777, title = "Crescent Moon Lamppost", expansion = "Legion", faction = "neutral"  }, 
        { id = 38663, questName = "The Die is Cast", type = "quest", itemID = 245700, model3D = 7508794, title = "Kaldorei Cushioned Seat", expansion = "Legion", faction = "neutral"  },
        { id = 40573, questName = "The Nightmare Lord", type = "quest", itemID = 245698, model3D = 1096764, title = "Kaldorei Stone Fence", expansion = "Legion", faction = "neutral" },
		{ id = 40573, questName = "The Nightmare Lord", type = "quest", itemID = 245699, model3D = 1096766, title = "Kaldorei Stone Fencepost", expansion = "Legion", faction = "neutral" },
        { id = 38147, questName = "Entangled Dreams", type = "quest", itemID = 245702, model3D = 1128060, title = "Kaldorei Wall Shelf", expansion = "Legion", faction = "neutral" }, 	
        { id = 42751, questName = "Moon Reaver", type = "quest", itemID = 245258, model3D = 1096759, title = "Val'sharah Bookcase", expansion = "Legion", faction = "neutral" },  
        { id = 39117, questName = "Shriek No More", type = "quest", itemID = 245615, model3D = 6930894, title = "Bradensbrook Smoke Lantern", expansion = "Legion", faction = "neutral" },
        { id = 46107, category = "spec", questName = "Source of the Corruption", type = "quest", itemID = 245616, model3D = 6930897, title = "Bradensbrook Thorned Well", expansion = "Legion", faction = "neutral", note = "Healing Artificat Quest so any healing spec" },					
		}
    },
{ 
 name = "Voidstorm", 
		quests =	{
		{ id = 86513, questName = "Face the Tide", type = "quest", itemID = 262351, model3D = 6700982, title = "Ornate Cosmic Rug", expansion = "Midnight", faction = "neutral" },
		{ id = 86541, questName = "Just In Case...", type = "quest", itemID = 267209, model3D = 6701003, title = "Open Void Elf Bedroll", expansion = "Midnight", faction = "neutral" },		
		{ id = 88706, questName = "Nothing Stands Forever", type = "quest", itemID = 264660, model3D = 6701018, title = "Ren'dorei Spired Tent", expansion = "Midnight", faction = "neutral" },--15895
		{ id = 86521, questName = "Nexus-Point Xenas: Eclipse", type = "quest", itemID = 262606, model3D = 6700978, title = "Smoldering Energy Forge", expansion = "Midnight", faction = "neutral" },--14631
		{ id = 88700, questName = "Two Tons of Metal and Holy Fire", type = "quest", itemID = 262610, model3D = 6701008, title = "Swirling Ritual Pedestal", expansion = "Midnight", faction = "alliance" },
	    { id = 86516, questName = "All Become Prey", type = "quest", itemID = 267082, model3D = 6885569, title = "Ornate Cosmic Table", expansion = "Midnight", faction = "neutral" },
	
		}
    },
{ 
 name = "Vol'dun", 
		quests =	{
        { id = 47874, questName = "Clearing the Fog", type = "quest", itemID = 245417, model3D = 6877803, title = "Akunda the Tapestry", expansion = "Battle for Azeroth", faction = "horde"},
		{ id = 48554, questName = "The Source of the Problem", type = "quest", itemID = 245263, model3D = 1707340, title = "Zocalo Drinks", expansion = "Battle for Azeroth", faction = "horde" },
		}
    },
{ 
 name = "Westfall", 
		quests =	{
        { id = 26229, questName = "\"I TAKE Candle!\"", type = "quest", itemID = 248797, model3D = 936393, title = "City Wanderer's Candleholder", expansion = "Cataclysm", faction = "alliance" },
        { id = 26297, questName = "The Dawning of a New Day", type = "quest", itemID = 248801, model3D = 4618938, title = "Stormwind Weapon Rack", expansion = "Cataclysm", faction = "alliance" },
        { id = 26270, questName = "You Have Our Thanks", type = "quest", itemID = 248618, model3D = 949210, title = "Westfall Woven Basket", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Zul'Aman", 
		quests =	{
		{ id = 91087, questName = "Reports Returned", type = "quest", itemID = 256928, model3D = 6212436, title = "Banner of the Amani Tribe", expansion = "Midnight", faction = "neutral" },
		{ id = 86681, questName = "Den of Nalorakk: A Taste of Vengeance", type = "quest", itemID = 264479, model3D = 6212406, title = "Skyweave Amani Tapestry", expansion = "Midnight", faction = "neutral" },
		{ id = 86681, questName = "Den of Nalorakk: A Taste of Vengeance", type = "quest", itemID = 264481, model3D = 6212408, title = "Unknown Title", expansion = "Midnight", faction = "neutral" },
	    { id = 86681, questName = "Den of Nalorakk: A Taste of Vengeance", type = "quest", itemID = 264480, model3D = 6212407, title = "Unknown Title", expansion = "Midnight", faction = "neutral" },
		{ id = 86660, questName = "Rescue from the Shadows", type = "quest", itemID = 253469, model3D = 6195750, title = "Ritual-Cursed Sarcophagus", expansion = "Midnight", faction = "neutral" },
		{ id = 86693, questName = "De Legend of de Hash'ey", type = "quest", itemID = 255648, model3D = 6195754, title = "Zul'Aman Ancestral Fountain", expansion = "Midnight", faction = "neutral" },
		{ id = 86663, questName = "Embers to a Flame", type = "quest", itemID = 264715, model3D = 6075575, title = "Zul'Aman Flame Cradle", expansion = "Midnight", faction = "neutral" },
		{ id = 94531, questName = "Like Mother, Like Son", type = "quest", itemID = 278691, model3D = 5975164, title = "Twilight Brazier", expansion = "Midnight", faction = "neutral" },
		}
    },	
{ 
 name = "Zuldazar", 
		quests =	{
        { id = 46931, questName = "Speaker of the Horde", type = "quest", itemID = 239606, model3D = 2620663, title = "Forsaken Round Rug", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 54992, questName = "To Mechagon!", type = "quest", itemID = 246701, model3D = 1842929, title = "Gnomish Sprocket Table", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 50963, questName = "Of Dark Deeds and Dark Days", type = "quest", itemID = 245485, model3D = 2098556, title = "Golden Zandalari Bed", expansion = "Battle for Azeroth", faction = "horde"},
        { id = 47432, questName = "The Bargain is Struck", type = "quest", itemID = 245486, model3D = 1597478, title = "Tired Troll's Bench", expansion = "Battle for Azeroth", faction = "horde"},
		{ id = 51601, questName ="The Bridgeport Ride", type = "quest", itemID = 245466, model3D = 2341260, title = "Forsaken Spiked Chair", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47741, questName = "To Sacrifice a Loa", type = "quest", itemID = 245493, model3D = 1888157, title = "Idol of Rezan, Loa of Kings", expansion = "Battle for Azeroth", faction = "horde" },	
		}
    },
}



