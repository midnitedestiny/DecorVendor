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
DVD.npcs[261262] = { zone = "Near Trading Post", model3D = 34566, title = "Gabbi", expansion = "Classic", zoneGroup = "Orgrimmar", faction = "horde", x=48.4, y=81, mapID = 85, category = "Promo" }
DVD.npcs[14624] = { zone = "Thorium Point", model3D = 14652, title = "Master Smith Burninate", expansion = "Classic", zoneGroup = "Searing Gorge", faction = "neutral", x=38.6, y=28.7, mapID = 32 }
DVD.npcs[2140] = { zone = "The Sepulcher", model3D = 3542, title = "Edwin Harly", expansion = "Classic", zoneGroup = "Silverpine Forest", faction = "horde", x=44.06, y=39.68, mapID = 21 }
DVD.npcs[252520] = { zone = "Rut'theran Village", model3D = 137447, title = "Ripley Kiefer", expansion = "Classic", zoneGroup = "Teldrassil", faction = "alliance", x=55.2, y=89.3, mapID = 47, note = "she is a few feet from the portal to  Darnassus", category = "reputation" }
DVD.npcs[49877] = { zone = "Stormwind", model3D = 36758, title = "Captain Lancy Revshon", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=67.79, y=73.05, mapID = 84, category = "reputation" }
DVD.npcs[256071] = { zone = "Mage Quarter", model3D = 139467, title = "Solelo", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=49, y=80, mapID = 84 }
DVD.npcs[254603] = { zone = "Old Town", model3D = 138274, title = "Riica", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=77.8, y=65.8, mapID = 84 }
DVD.npcs[261231] = { zone = "Near Trading Post", model3D = 17507, title = "Tuuran", expansion = "Classic", zoneGroup = "Stormwind", faction = "alliance", x=48.6, y=68.8, mapID = 84, category = "Promo" }
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
DVD.npcs[144129] = { zone = "Grim Guzzler Non Instanced Version", model3D = 8652, title = "Plugger Spazzring", expansion = "Battle for Azeroth", zoneGroup = "Blackrock Mountain", faction = "neutral", x=49.77, y=32.22, mapID = 1186, note = "Dark Iron Dwarf", category = "race" }
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
--DVD.npcs[267795] = { zone = "Founders Point", model3D = 145169, title = "Perry Winkles", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=53.8, y=41.6, mapID = 2352, category = "neighborhood" }
DVD.npcs[248854] = { zone = "Founders Point", model3D = 136070, title = "The Last Architect", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.7, y=37.5, mapID = 2352, category = "neighborhood" }
--DVD.npcs[257332] = { zone = "Founders Point", model3D = 140031, title = "Devin Slatesmith", expansion = "Midnight", zoneGroup = "Founders Point", faction = "alliance", x=52.1, y=38.5, mapID = 2352, category = "neighborhood" }
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
--DVD.npcs[267794] = { zone = "Razorwind Shores", model3D = 145168, title = "Agratha", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.6, y=54.5, mapID = 2351, category = "neighborhood" }
DVD.npcs[253596] = { zone = "Razorwind Shores", model3D = 136070, title = "The Last Architect", expansion = "Midnight", zoneGroup = "Razorwind Shores", faction = "horde", x=53.8, y=57.4, mapID = 2351, category = "neighborhood" }
end

do--Housing Special
DVD.npcs[252917] = { zone = "It Depends", model3D = 137667, title = "Hesta Forlath", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
DVD.npcs[257897] = { zone = "It Depends", model3D = 106374, title = "Harlowe Marl", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
DVD.npcs[252605] = { zone = "It Depends", model3D = 140447, title = "Aeeshna", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
DVD.npcs[249684] = { zone = "It Depends", model3D = 40842, title = "Brother Dovetail", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
DVD.npcs[250820] = { zone = "It Depends", model3D = 136498, title = "Hordranin", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
DVD.npcs[248525] = { zone = "It Depends", model3D = 92584, title = "Pascal-K1N6", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[268106] = { zone = "It Depends", model3D = 87552, title = "Taifa", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[257168] = { zone = "It Depends", model3D = 139949, title = "Throska", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[260485] = { zone = "It Depends", model3D = 82235, title = "Griftah", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[267870] = { zone = "It Depends", model3D = 145184, title = "Unquestionably Griftah", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[265551] = { zone = "It Depends", model3D = 109681, title = "Roshai Lightstep", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[249741] = { zone = "It Depends", model3D = 43184, title = "Cousin Shortkaf", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[271173] = { zone = "It Depends", model3D = 118388, title = "Timicky", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Neighborhood Endeavor vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
--DVD.npcs[262726] = { zone = "It Depends", model3D = nil, title = "Cursed Keepsake", expansion = "Midnight", zoneGroup = "Housing Endeavor Vendors", faction = "neutral", variableLocation=true, note = "Cursed Keepsake vendor. Location may rotate between Founder's Point and Razorwind Shores.", category = "neighborhood" }
end

do--Midnight
DVD.npcs[252915] = { zone = "The Bazaar", model3D = 137524, title = "Corlen Hordralin", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=44.16, y=62.72, mapID = 2393 }
DVD.npcs[252916] = { zone = "The Bazaar", model3D = 137667, title = "Hesta Forlath", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=44.16, y=62.72, mapID = 2393 }
DVD.npcs[242398] = { zone = "The Bazaar", model3D = 105169, title = "Naleidea Rivergleam", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=52.67, y=77.96, mapID = 2393 }
DVD.npcs[256828] = { zone = "Murder Row", model3D = 139843, title = "Dennia Silvertongue", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=51.16, y=56.47, mapID = 2393, category = "Promo" }
DVD.npcs[258181] = { zone = "Astalor's Sanctum", model3D = 140647, title = "Construct Ali'a", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=55.81, y=66.04, mapID = 2393 }
DVD.npcs[242399] = { zone = "The Bazaar", model3D = 107574, title = "Telemancer Astrandis", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=52.44, y=78.87, mapID = 2393 }
DVD.npcs[250982] = { zone = "Murder Row", model3D = 136657, title = "Dethelin", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=52.5, y=47.3, mapID = 2393 }
DVD.npcs[251091] = { zone = "Murder Row", model3D = 136777, title = "Nael Silvertongue", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=50.7, y=56.2, mapID = 2393, note = "do Flowers for Amalthea to see item" }
DVD.npcs[264056] = { zone = "Falconwing Square", model3D = 143986, title = "Disguised Decor Duel Vendor", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=31.6, y=76.7, mapID = 2393 }
DVD.npcs[255495] = { zone = "Falconwing Square", model3D = 106418, title = "Rae'ana", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=47.6, y=50.6, mapID = 2393, category = "renown" }
DVD.npcs[243359] = { zone = "The Bazaar", model3D = 138953, title = "Melaris", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=47, y=51.8, mapID = 2393, profession="alchemy" }
DVD.npcs[241451] = { zone = "The Bazaar", model3D = 138907, title = "Eriden", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=43.6, y=51.6, mapID = 2393, profession="blacksmithing" }
DVD.npcs[257914] = { zone = "The Bazaar", model3D = 140527, title = "Quelis", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=56.4, y=69.8, mapID = 2393, profession="cooking" }
DVD.npcs[243350] = { zone = "The Bazaar", model3D = 138944, title = "Lyna", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=47.8, y=53.6, mapID = 2393, profession="enchanting" }
DVD.npcs[241453] = { zone = "The Bazaar", model3D = 138909, title = "Yatheon", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=43.6, y=53.8, mapID = 2393, profession="engineering" }
DVD.npcs[256026] = { zone = "The Bazaar", model3D = 139450, title = "Irodalmin", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=48.2, y=51.6, mapID = 2393, profession="herbalism" }
DVD.npcs[243555] = { zone = "The Bazaar", model3D = 138961, title = "Lelorian", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=46.4, y=51.2, mapID = 2393, profession="inscriptionist" }
DVD.npcs[243353] = { zone = "The Bazaar", model3D = 138947, title = "Deynna", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=48.2, y=54.2, mapID = 2393, profession="tailoring" }
DVD.npcs[267859] = { zone = "Thalassian University", model3D = 145218, title = "Richmond", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=39.4, y=59.4, mapID = 2393, category = "Promo" }
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
--DVD.npcs[270399] = { zone = "Tokka's Landing", model3D = 130738, title = "Firetender Zab'ni", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=58.6, y=45.9, mapID = 2512 }
--DVD.npcs[268228] = { zone = "Tokka's Landing", model3D = 141051, title = "Jan'sari the Watchful", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=58.6, y=45.9, mapID = 2512, category = "renown" }
--DVD.npcs[257598] = { zone = "Tokka's Folly", model3D = 87552, title = "Second Mate Sluggs", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=51.6, y=49.8, mapID = 2512, category = "reputation" }
--DVD.npcs[262880] = { zone = "Vaults of Atal'Utek", model3D = 143501, title = "Er'inye", expansion = "Midnight", zoneGroup = "The Coiled Isle", faction = "neutral", x=51.1, y=62.7, mapID = 2509 }
end
