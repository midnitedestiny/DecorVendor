-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems_12_1.lua
-- Patch 12.1 ActiveItems
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}

do -- 🏪 VENDOR NPC: 259864 (Sathren Azuredawn) Treasures
DVD.ActiveItems[243106] = { decorID = 1173, model3D = 4381789, bossevent = "Triple-Locked Safebox", sourceAction = "Triple-Locked Safebox", soldBy = {259864}, source = "treasure", mapID = 2395}-- Gemmed Eversong Lantern	
DVD.ActiveItems[245282] = { decorID = 1195, model3D = 4478904, bossevent = "Incomplete Book of Sonnets", sourceAction = "Incomplete Book of Sonnets", soldBy = {259864}, source = "treasure", mapID = 2393}-- Silvermoon Library Bookcase
DVD.ActiveItems[251912] = { decorID = 8875, model3D = 6051298, bossevent = "Stone Vat", sourceAction = "Stone Vat", soldBy = {259864}, source = "treasure", mapID = 2395}-- Goldenmist Grapes
DVD.ActiveItems[263211] = { decorID = 14977, model3D = 6025940, bossevent = "Gift of the Phoenix", sourceAction = "Gift of the Phoenix", soldBy = {259864}, source = "treasure", mapID = 2395} -- Gilded Eversong Cup
end

do --Treasures no  vendors
DVD.ActiveItems[245449] = {decorID = 674, model3D = 1096835, bossevent = "Withered Army Training", sourceAction = "Withered Army Training", mapID = 680, expansion = "Legion", zone = "Broken Isles", source = "treasure"}-- Ancient Elven Highback Chair
DVD.ActiveItems[245315] = { decorID = 1272, model3D = 5788649, bossevent = "Scraps Heaps", sourceAction = "Scraps Heaps", mapID = 2346, source = "treasure"} --"Trashfire Barrel"
DVD.ActiveItems[262467] = { decorID = 14597, model3D = 6700999, bossevent = "Stellar Stash", sourceAction = "Stellar Stash", mapID = 2444, source = "treasure"} -- "Void Elf Round Table"
DVD.ActiveItems[264482] = { decorID = 15746, model3D = 6701004, bossevent = "Malignant Chest", sourceAction = "Malignant Chest", mapID = 2405, source = "treasure"} -- "Void Elf Torch"
end

do --Drops
DVD.ActiveItems[246481] = { decorID = 2324, model3D = 1624683, bossevent = "Mechagon", mapID = 1462, expansion = "Battle for Azeroth", zone = "Kul Tiras", source = "drop"}-- Retired Industrial Gnomegrabber
DVD.ActiveItems[246599] = { decorID = 2431, model3D = 1842467, bossevent = "Mechagon", mapID = 1462, expansion = "Battle for Azeroth", zone = "Kul Tiras", source = "drop"}-- Self-Sealing Stembarrel
DVD.ActiveItems[246600] = { decorID = 2432, model3D = 1842492, bossevent = "Mechagon", mapID = 1462, expansion = "Battle for Azeroth", zone = "Kul Tiras", source = "drop"}-- Small Mechanical Crate
DVD.ActiveItems[246602] = { decorID = 2434, model3D = 2067166, bossevent = "Mechagon", mapID = 1462, expansion = "Battle for Azeroth", zone = "Kul Tiras", source = "drop"}-- Small H.O.M.E. Cog
DVD.ActiveItems[245294] = { decorID = 764, model3D = 5647269, bossevent = "Theater Troupe", mapID = 2248, expansion = "The War Within", source = "drop"}-- Councilward's Jeweled Goblet
DVD.ActiveItems[245320] = { decorID = 1261, model3D = 5689822, bossevent = "Undermine", mapID = 2346, expansion = "The War Within", zone = "Khaz Algar", source = "drop"}-- Very Reliable Undermine Lamppost	
DVD.ActiveItems[257724] = { decorID = 11754, model3D = 1313472, bossevent = "Highmountain Paragon Chest", mapID = 750, expansion = "Legion", zone = "Broken Isles", source = "drop"}-- Bloodtotem Banner
DVD.ActiveItems[257928] = { decorID = 11814, model3D = 2929684, bossevent = "Mechagon", mapID = 1462, expansion = "Battle for Azeroth", zone = "Kul Tiras", source = "drop", noxp = true } -- Gnomeregan Recyli-Kiln
DVD.ActiveItems[262608] = { decorID = 14633, model3D = 6701001, bossevent = "Stormarion Assault", mapID = 2405, source = "drop" } -- "Void Elf Stool"
DVD.ActiveItems[264483] = { decorID = 15747, model3D = 6701007, bossevent = "Stormarion Assault", mapID = 2405, source = "drop"} -- "Cosmic Void Campfire"
DVD.ActiveItems[264343] = { decorID = 15583, model3D = 7136761, bossevent = "Stormarion Assault", mapID = 2405, source = "drop"} -- Cosmic Void Gravitational Orb

DVD.ActiveItems[263874] = { decorID = 15284, model3D = 6153816, source = "drop"} -- Emerald-Encrusted Amani Ritual Skull
DVD.ActiveItems[278154] = { decorID = 25337, model3D = 2025842, source = "drop"} -- Hooked Net Trap
DVD.ActiveItems[278374] = { decorID = 22147, model3D = 7808628, source = "drop"} -- Preyhunter's Fanged Bust
DVD.ActiveItems[278378] = { decorID = 24890, model3D = 7808625, source = "drop"} -- Preyhunter's Scaled Bust
end

do --Midnight Delves
DVD.ActiveItems[251967] = { decorID = 8889, model3D = 6225689, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Fungarian Banner
DVD.ActiveItems[263036] = { decorID = 14822, model3D = 4732009, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Hanging Dawnflower
DVD.ActiveItems[263042] = { decorID = 14828, model3D = 6252874, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Rootlight Lamppost
DVD.ActiveItems[263233] = { decorID = 15064, model3D = 6050885, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Sin'dorei Spinning Library
DVD.ActiveItems[264258] = { decorID = 15493, model3D = 6225683, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Blossoming Forge
DVD.ActiveItems[264330] = { decorID = 15568, model3D = 6075573, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Amani Hanging Brazier
DVD.ActiveItems[264342] = { decorID = 15582, model3D = 7136759, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Cosmic Void Cache
DVD.ActiveItems[267009] = { decorID = 18485, model3D = 6212435, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"}-- Amani Training Dummy
DVD.ActiveItems[264329] = { decorID = 15567, model3D = 6075571, bossevent = "Midnight Delves", mapID = 2537, expansion = "Midnight", zone = "Delves", source = "drop"} -- Amani Dining Table
end

do -- 📦 Coiled Isle Delves
DVD.ActiveItems[267080] = { decorID = 18615, model3D = 6153830, bossevent = "The Coiled Isle Delves", mapID = 2512, expansion = "Midnight", zone = "Delves", source =  "drop"} -- Amani Blueflame Chandelier
DVD.ActiveItems[275855] = { decorID = 24889, model3D = 5869189, bossevent = "The Coiled Isle Delves", mapID = 2512, expansion = "Midnight", zone = "Delves", source =  "drop"} -- Zul'Aman Swamp Palm Sprout
DVD.ActiveItems[248963] = { decorID = 5131, model3D = 6163854, bossevent = "The Coiled Isle Delves", mapID = 2512, expansion = "Midnight", zone = "Delves", source =  "drop"} -- Spirit-Touched Amani Mask
end

do --Darkshore Rares
DVD.ActiveItems[241066] = { decorID = 948, model3D = 6431408, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",  source = "drop"}-- Forsaken Spiked Brazier
DVD.ActiveItems[245462] = { decorID = 840, model3D = 2530077, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",   source = "drop"}-- Banshee Queen's Banner
DVD.ActiveItems[245627] = { decorID = 1836, model3D = 6938369, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",  source = "drop"} -- Elven Temple Brazier
DVD.ActiveItems[246110] = { decorID = 2000, model3D = 6980565, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",  source = "drop"}	-- Filigree Moon Sconce
end

do --Boss Raids
DVD.ActiveItems[247235] = { decorID = 2606, model3D = 6225707,  bossencounter = 2711, mapID = 2427, expansion = "Midnight", zone = "Sporefall", source = "boss"}-- Luminous Rotshroom	
DVD.ActiveItems[253242] = { decorID = 9263, model3D = 6905426, bossencounter = 869, mapID = 567, expansion = "Mists of Pandaria", zone = "Siege of Orgrimmar", source = "boss"}-- Horde Warlord's Throne
DVD.ActiveItems[256682] = { decorID = 11283, model3D = 1405830, bossencounter = 1751, mapID = 766, expansion = "Legion", zone = "Nighthold", source = "boss"}-- Magistrix's Garden Fountain
DVD.ActiveItems[262957] = { decorID = 14806, model3D = 7115753, bossencounter = 2737, mapID = 2529, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Tattered Vanguard Banner
DVD.ActiveItems[264187] = { decorID = 15467, model3D = 7317243, bossencounter = 2739, mapID = 2533, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- Blessed Phoenix Egg
DVD.ActiveItems[264246] = { decorID = 15481, model3D = 5746809, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Eerie Iridescent Riftshroom
DVD.ActiveItems[264491] = { decorID = 15755, model3D = 6210896, bossencounter = 2735, mapID = 2529, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidbound Holding Cell
DVD.ActiveItems[264492] = { decorID = 15756, model3D = 7960828, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- Chaotic Void Maw
DVD.ActiveItems[264494] = { decorID = 15758, model3D = 6391990, bossencounter = 2736, mapID = 2529, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Banded Domanaar Storage Crate
DVD.ActiveItems[264497] = { decorID = 15761, model3D = 7136760, bossencounter = 2733, mapID = 2529, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Imperator's Torment Crystal
DVD.ActiveItems[264498] = { decorID = 15762, model3D = 7302402, bossencounter = 2734, mapID = 2529, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voltaic Trigore Egg
DVD.ActiveItems[267645] = { decorID = 19197, model3D = 7633281, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Dreamrift Vanquisher's Argent Trophy
DVD.ActiveItems[266886] = { decorID = 18397, model3D = 7556293, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Dreamrift Vanquisher's Gleaming Trophy
DVD.ActiveItems[265950] = { decorID = 17629, model3D = 7550712, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Dreamrift Vanquisher's Aureate Trophy
DVD.ActiveItems[268049] = { decorID = 19252, model3D = 7633283, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidspire Vanquisher's Argent Trophy	
DVD.ActiveItems[266887] = { decorID = 18398, model3D = 7556294, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidspire Vanquisher's Gleaming Trophy
DVD.ActiveItems[265951] = { decorID = 17630, model3D = 7550713, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidspire Vanquisher's Aureate Trophy
DVD.ActiveItems[267646] = { decorID = 19198, model3D = 7633282, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- March on Quel'Danas Vanquisher's Argent Trophy
DVD.ActiveItems[266885] = { decorID = 18396, model3D = 7556292, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- March on Quel'Danas Vanquisher's Gleaming Trophy
DVD.ActiveItems[265949] = { decorID = 17628, model3D = 7550710, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- March on Quel'Danas Vanquisher's Aureate Trophy
DVD.ActiveItems[267008] = { decorID = 18484, model3D = 1959305, bossencounter = 2328, mapID = 1345, expansion = "Battle for Azeroth", zone = "Crucible of Storms", source = "boss"}-- Crucible Votive Rack
DVD.ActiveItems[269269] = { decorID = 20632, model3D = 6224355, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Devouring Ritual Spire

DVD.ActiveItems[279112] = { decorID = 26487, model3D = 2433564, bossencounter = 2849, mapID = 2632, expansion = "Midnight", zone = "The Tidebound Grotto", source =  "boss"} -- Clumped Asteroidea
DVD.ActiveItems[272361] = { decorID = 21952, model3D = 7277208,  bossencounter = 2882, mapID = 2608, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Venomous Pyre
DVD.ActiveItems[279500] = { decorID = 27043, model3D = 8117703,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- "Rage of the Shackled" Mural 
DVD.ActiveItems[279118] = { decorID = 26374, model3D = 1992950,  bossencounter = 2894, mapID = 2609, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Lost Explorers Mailbox 		
DVD.ActiveItems[279115] = { decorID = 26205, model3D = 7515872,  bossencounter = 2888, mapID = 2606, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Soulcoiler's Ritual Candle	
DVD.ActiveItems[279122] = { decorID = 25813, model3D = 7277192,  bossencounter = 2887, mapID = 2607, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Venom-Fanged Font 			 
DVD.ActiveItems[279131] = { decorID = 25812, model3D = 7277190,  bossencounter = 2883, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Pillar of the Coiled Isle 	 
DVD.ActiveItems[244343] = { decorID = 1426, model3D = 6870560,  bossencounter = 2871, mapID = 2609, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Vessel of the Howling Ossuary 
DVD.ActiveItems[264716] = { decorID = 16093, model3D = 6153828,  bossencounter = 2874, mapID = 2608, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- Hexed Tomb Brazier  
DVD.ActiveItems[279125] = { decorID = 25131, model3D = 7930280,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss"} -- The Venomous Abyss Aureate Trophy
DVD.ActiveItems[279129] = { decorID = 25132, model3D = 7930281,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss" } -- The Venomous Abyss Gleaming Trophy
DVD.ActiveItems[279127] = { decorID = 25133, model3D = 7930282,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", source =  "boss" } -- The Venomous Abyss Argent Trophy
end

do --Dungeon Bosses
DVD.ActiveItems[264336] = { decorID = 15574, model3D = 6210883, bossencounter = 2793, mapID = 2573, expansion = "Midnight", zone = "Voidscar Arena", source = "boss"}-- Voidlight Brazier
DVD.ActiveItems[238857] = { decorID = 673, model3D = 1096755, bossencounter = 1657, mapID = 733, expansion = "Legion", zone = "Darkheart Thicket", source = "boss"}-- Moon-Blessed Storage Crate
DVD.ActiveItems[241044] = { decorID = 926, model3D = 877007, bossencounter = 1982, mapID = 903, expansion = "Legion", zone = "Seat of Triumvirate, Argus", source = "boss"}-- Argussian Crate
DVD.ActiveItems[244655] = { decorID = 1445, model3D = 1379266, bossencounter = 100, mapID = 315, expansion = "Classic", zone = "Shadowfang Keep", source = "boss"}-- Gilnean Circular Rug
DVD.ActiveItems[245434] = { decorID = 1323, model3D = 1005503, bossencounter = 1238, mapID = 595, expansion = "Warlords of Draenor", zone = "Iron Docks", source = "boss"}-- Orgrimmar Sconce
DVD.ActiveItems[245435] = { decorID = 1324, model3D = 1005505, bossencounter = 1234, mapID = 618, expansion = "Classic", zone = "Upper Blackrock Spire", source = "boss"}-- Horde Battle Emblem
DVD.ActiveItems[245451] = { decorID = 1232, model3D = 1313217, bossencounter = 1687, mapID = 731, expansion = "Legion", zone = "Neltharions Lair", source = "boss"}-- Thunder Totem Brazier
DVD.ActiveItems[245560] = { decorID = 1749, model3D = 6924252, bossencounter = 2589, mapID = 2335, expansion = "The War Within", zone = "Cinderbrew Meadery", source = "boss"}-- Meadery Ochre Window
DVD.ActiveItems[245681] = { decorID = 1880, model3D = 6980179, bossencounter = 2156, mapID = 1040, expansion = "Battle for Azeroth", zone = "Shrine of the Storm", source = "boss"}-- Tidesage's Fireplace
DVD.ActiveItems[245938] = { decorID = 1893, model3D = 5360239, bossencounter = 2573, mapID = 2309, expansion = "The War Within", zone = "Priory of the Sacred Flame", source = "boss"}-- Overgrown Arathi Trellis
DVD.ActiveItems[246421] = { decorID = 2238, model3D = 197304,  bossencounter = 2095, mapID = 936, expansion = "Battle for Azeroth", zone = "Freehold", source = "boss"}-- Stolen Ironforge Seat
DVD.ActiveItems[246429] = { decorID = 2246, model3D = 197168, bossencounter = 387, mapID = 243, expansion = "Classic", zone = "Blackrock Depths", source = "boss"}-- Dark Iron Chandelier
DVD.ActiveItems[246846] = { decorID = 2512, model3D = 534950, bossencounter = 335, mapID = 429, expansion = "Mists of Pandaria", zone = "Temple of the Jade Serpant", source = "boss"}-- Tome of Pandaren Wisdom   
DVD.ActiveItems[246865] = { decorID = 2531, model3D = 4335906, bossencounter = 1838, mapID = 822, expansion = "Classic", zone = "Karazhan (Legion Version)", source = "boss"}-- Tome of Reliquary Insights
DVD.ActiveItems[247913] = { decorID = 4027, model3D = 1361708, bossencounter = 1720, mapID = 763, expansion = "Legion", zone = "Court of Stars", source = "boss"}-- Ornate Suramar Table
DVD.ActiveItems[248332] = { decorID = 4401, model3D = 936398, bossencounter = 95, mapID = 292, expansion = "Classic", zone = "The Deadmines", source = "boss"}-- Stormwind Footlocker
DVD.ActiveItems[251331] = { decorID = 8178, model3D = 1025872, bossencounter = 1225, mapID = 593, expansion = "Warlords of Draenor", zone = "Auchindoun", source = "boss"}-- Draenic Ottoman
DVD.ActiveItems[253451] = { decorID = 1137, model3D = 6839738, bossencounter = 2772, mapID = 2500, expansion = "Midnight", zone = "The Blinding  Vale", source = "boss"}-- Veilroot Fountain
DVD.ActiveItems[255672] = { decorID = 10887, model3D = 2745099, bossencounter = 2331, mapID = 1497, expansion = "Battle for Azeroth", zone = "Mechagon", source = "boss"}-- Gnomish Tesla Tower
DVD.ActiveItems[256354] = { decorID = 11137, model3D = 4420033, bossencounter = 2501, mapID = 2080, expansion = "Dragonflight", zone = "Neltharus", source = "boss"}-- Qalashi Goulash
DVD.ActiveItems[256428] = { decorID = 11163, model3D = 3883458,  bossencounter = 2503, mapID = 2094, expansion = "Dragonflight", zone = "Ruby Life Pools", source = "boss"}-- Valdrakken Hanging Lamp
DVD.ActiveItems[256683] = { decorID = 11284, model3D = 6190527, bossencounter = 2658, mapID = 2499, expansion = "Midnight", zone = "Windrunner Spire", source = "boss"}-- Silvermoon Training Dummy
DVD.ActiveItems[258268] = { decorID = 11934, model3D = 5503818, bossencounter = 2561, mapID = 2303, expansion = "The War Within", zone = "DarkFlame Cleft", source = "boss"}-- Waxmaster's Candle Rack
DVD.ActiveItems[258744] = { decorID = 12204, model3D = 971695, bossencounter = 968, mapID = 602, expansion = "Warlords of Draenor", zone = "Skyreach", source = "boss"}-- Skyreach Circular Table
DVD.ActiveItems[260359] = { decorID = 14330, model3D = 6431406, bossencounter = 2514, mapID = 2099, expansion = "Dragonflight", zone = "Algeth'ar Academy", source = "boss"}-- Valdrakken Bookcase
DVD.ActiveItems[263230] = { decorID = 15061, model3D = 6050875, bossencounter = 2662, mapID = 2520, expansion = "Midnight", zone = "Magisters Terrace", source = "boss"}-- Magister's Bookshelf
DVD.ActiveItems[263238] = { decorID = 15069, model3D = 7296096, bossencounter = 2682, mapID = 2434, expansion = "Midnight", zone = "Murder Row", source = "boss"}-- Illicit Long Table
DVD.ActiveItems[264332] = { decorID = 15570, model3D = 6153808, bossencounter = 2778, mapID = 2513, expansion = "Midnight", zone = "Den of Nalorakk", source = "boss"}-- Amani Ritual Altar
DVD.ActiveItems[264338] = { decorID = 15576, model3D = 6210900, bossencounter = 2815, mapID = 2556, expansion = "Midnight", zone = "Nexus-Point Xenas", source = "boss"}-- Domanaar Control Console
DVD.ActiveItems[264717] = { decorID = 16094, model3D = 6195760, bossencounter = 2812, mapID = 2501, expansion = "Midnight", zone = "Maisara Caverns", source = "boss"}-- Amani Warding Hex
DVD.ActiveItems[267007] = { decorID = 18483, model3D = 328250,  bossencounter = 610, mapID = 184, expansion = "Wrath of the Lich King", zone = "Pit of Saron", source = "boss"}-- Eye of Acherus

DVD.ActiveItems[278245] = { decorID = 26208, model3D = 1981805, bossencounter = 2172, mapID = 1004, expansion = "Battle for Azeroth", zone = "Kings' Rest", source =  "boss"} -- Royal Attendant's Coffin
DVD.ActiveItems[278982] = { decorID = 26198, model3D = 1660581, bossencounter = 2145, mapID = 1043, expansion = "Battle for Azeroth", zone = "Temple of Sethraliss", source =  "boss"} -- Hatchery of Hissing Eggs
DVD.ActiveItems[279211] = { decorID = 25293, model3D = 7277191, bossencounter = 2880, mapID = 2590, expansion = "Midnight", zone = "Altar of Fangs", source =  "boss"} -- Pillar of the Fanged Altar
end



























