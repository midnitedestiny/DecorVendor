-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems.lua
-- Combined ActiveItems database
--minInterface = 120007
-- ============================================================
-- Total Compiled Items: 2121


local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}


do -- 🏪 VENDOR NPC: 1247 (Innkeeper Belm)
DVD.ActiveItems[256330] = { decorID = 11130, model3D = 7385421, soldBy = {1247}, source = "vendor" } -- Kharanos Stone Bed
end

do -- 🏪 VENDOR NPC: 1465 (Drac Roughcut)
DVD.ActiveItems[246422] = { decorID = 2239, model3D = 197430, soldBy = {1465}, source = "quest", noxp = true } -- Thelsamar Hanging Lantern
end

do -- 🏪 VENDOR NPC: 2140 (Edwin Harly)
DVD.ActiveItems[257412] = { decorID = 11498, model3D = 304495, soldBy = {2140}, source = "quest", noxp = true } -- Stoppered Gilnean Barrel
end

do -- 🏪 VENDOR NPC: 2483 (Jacquilina Dramet)
DVD.ActiveItems[248808] = { decorID = 4841, model3D = 6924248, soldBy = {2483}, source = "achievement", noxp = true } -- Nesingwary Mounted Elk Head
end

do -- 🏪 VENDOR NPC: 3178 (Stuart Fleming)
DVD.ActiveItems[257405] = { decorID = 11495, model3D = 306198, soldBy = {3178}, source = "vendor" } -- Baradin Bay Fishing Rack
end

do -- 🏪 VENDOR NPC: 13217 (Thanthaldis Snowgleam)
DVD.ActiveItems[246424] = { decorID = 2241, model3D = 197557, soldBy = {13217}, source = "vendor" } -- Square Stormpike Table
end

do -- 🏪 VENDOR NPC: 14624 (Master Smith Burninate)
DVD.ActiveItems[245333] = { decorID = 1315, model3D = 6877809, soldBy = {14624}, source = "quest", noxp = true } -- Shadowforge Wooden Box
DVD.ActiveItems[246409] = { decorID = 2226, model3D = 197155, soldBy = {14624}, source = "quest", noxp = true } -- Shadowforge Grinding Wheel
end

do -- 🏪 VENDOR NPC: 16528 (Provisioner Vredigar)
DVD.ActiveItems[256049] = { decorID = 10950, model3D = 6050850, requirement = { type = "reputation", faction = "Tranquillien", rank = 5 }, soldBy = {16528}, source = "vendor" } -- Sin'dorei Sleeper
DVD.ActiveItems[257419] = { decorID = 11500, model3D = 6033615, requirement = { type = "reputation", faction = "Tranquillien", rank = 5 }, soldBy = {16528}, source = "vendor" } -- Sin'dorei Crafter's Forge
end

do -- 🏪 VENDOR NPC: 23995 (Axle)
DVD.ActiveItems[244852] = { decorID = 1674, model3D = 6927099, soldBy = {23995}, source = "achievement", noxp = true } -- Head of the Broodmother
end

do -- 🏪 VENDOR NPC: 25206 (Ahlurglgr)
DVD.ActiveItems[258220] = { decorID = 11906, model3D = 1091581, soldBy = {25206}, source = "quest", noxp = true } -- Murloc Driftwood Hut
end

do -- 🏪 VENDOR NPC: 27391 (Woodsman Drake)
DVD.ActiveItems[248622] = { decorID = 4448, model3D = 1048173, soldBy = {27391}, source = "quest", noxp = true } -- Wooden Outhouse
end

do -- 🏪 VENDOR NPC: 28038 (Purser Boulian)
DVD.ActiveItems[248807] = { decorID = 4839, model3D = 6924247, soldBy = {28038}, source = "achievement", noxp = true } -- Nesingwary Mounted Shoveltusk Head
end

do -- 🏪 VENDOR NPC: 44114 (Wilkinson)
DVD.ActiveItems[245624] = { decorID = 1833, model3D = 464019, soldBy = {44114}, source = "quest", noxp = true } -- Waning Wood Fence
DVD.ActiveItems[256905] = { decorID = 11305, model3D = 322634, soldBy = {44114}, source = "quest", noxp = true } -- Small Gilnean Table
end

do -- 🏪 VENDOR NPC: 44337 (Maurice Essman)
DVD.ActiveItems[244777] = { decorID = 1481, model3D = 304416, soldBy = {44337}, source = "quest", noxp = true } -- Surwich Peddler's Wagon
end

do -- 🏪 VENDOR NPC: 45417 (Fiona) 142115 (Fiona)
DVD.ActiveItems[248796] = { decorID = 4813, model3D = 660974, soldBy = {45417, 142115}, source = "achievement", noxp = true } -- Goldshire Food Cart
end

do -- 🏪 VENDOR NPC: 48258 (Willard Harrington)
DVD.ActiveItems[256903] = { decorID = 11301, model3D = 304626, soldBy = {48258}, source = "quest", noxp = true } -- Gilnean Banded Crate

end

do -- 🏪 VENDOR NPC: 49877 (Captain Lancy Revshon)
DVD.ActiveItems[248333] = { decorID = 4402, model3D = 936473, requirement = { type = "reputation", faction = "Stormwind", rank = 3 }, soldBy = {49877}, source = "vendor", noxp = true } -- Stormwind Large Wooden Table
DVD.ActiveItems[248619] = { decorID = 4445, model3D = 1004948, requirement = { type = "reputation", faction = "Stormwind", rank = 5 }, soldBy = {49877}, source = "vendor", noxp = true } -- Stormwind Gazebo
DVD.ActiveItems[248620] = { decorID = 4446, model3D = 1004961, requirement = { type = "reputation", faction = "Stormwind", rank = 4 }, soldBy = {49877}, source = "vendor", noxp = true } -- Stormwind Trellis and Basin
DVD.ActiveItems[248617] = { decorID = 4443, model3D = 929381, requirement = { type = "reputation", faction = "Stormwind", rank = 4 }, soldBy = {49877}, source = "vendor", noxp = true } -- Stormwind Keg Stand
DVD.ActiveItems[248665] = { decorID = 4490, model3D = 1028015, requirement = { type = "reputation", faction = "Stormwind", rank = 5 }, soldBy = {49877}, source = "vendor", noxp = true } -- Stormwind Peddler's Cart
DVD.ActiveItems[248794] = { decorID = 4811, model3D = 194903, requirement = { type = "reputation", faction = "Stormwind", rank = 2 }, soldBy = {49877}, source = "vendor", noxp = true } -- Elwynn Fence
DVD.ActiveItems[248795] = { decorID = 4812, model3D = 194909, requirement = { type = "reputation", faction = "Stormwind", rank = 2 }, soldBy = {49877}, source = "vendor", noxp = true } -- Elwynn Fencepost
DVD.ActiveItems[248939] = { decorID = 5116, model3D = 960215, requirement = { type = "reputation", faction = "Stormwind", rank = 3 }, soldBy = {49877}, source = "vendor", noxp = true } -- Stormwind Lamppost
DVD.ActiveItems[248336] = { decorID = 4405, model3D = 953804, soldBy = {49877}, source = "quest", noxp = true } -- Stormwind Wooden Table
DVD.ActiveItems[248618] = { decorID = 4444, model3D = 949210, soldBy = {49877}, source = "quest", noxp = true } -- Westfall Woven Basket
DVD.ActiveItems[248621] = { decorID = 4447, model3D = 1004965, soldBy = {49877}, source = "quest", noxp = true } -- Stormwind Arched Trellis
DVD.ActiveItems[248662] = { decorID = 4487, model3D = 950140, soldBy = {49877}, source = "quest", noxp = true } -- Jewelcrafter's Tent
DVD.ActiveItems[248797] = { decorID = 4814, model3D = 936393, soldBy = {49877}, source = "quest", noxp = true } -- City Wanderer's Candleholder
DVD.ActiveItems[248798] = { decorID = 4815, model3D = 950755, soldBy = {49877}, source = "quest", noxp = true } -- Northshire Barrel
DVD.ActiveItems[248801] = { decorID = 4819, model3D = 4618938, soldBy = {49877}, source = "quest", noxp = true } -- Stormwind Weapon Rack
DVD.ActiveItems[248938] = { decorID = 5115, model3D = 960094, soldBy = {49877}, source = "quest", noxp = true } -- Hooded Iron Lantern
DVD.ActiveItems[256673] = { decorID = 11274, model3D = 953668, soldBy = {49877}, source = "quest", noxp = true } -- Stormwind Forge
end

do -- 🏪 VENDOR NPC: 50304 (Captain Donald Adams)
DVD.ActiveItems[245504] = { decorID = 923, model3D = 397900, soldBy = {50304}, source = "quest", noxp = true } -- Lordaeron Fence
DVD.ActiveItems[245505] = { decorID = 924, model3D = 397901, soldBy = {50304}, source = "vendor", noxp = true } -- Lordaeron Fencepost
end

do -- 🏪 VENDOR NPC: 50307 (Lord Candren) 252520 (Ripley Kiefer)
DVD.ActiveItems[245518] = { decorID = 858, model3D = 305584, soldBy = {50307, 252520}, source = "quest", noxp = true } -- Worgen's Chicken Coop
DVD.ActiveItems[245603] = { decorID = 1794, model3D = 6930895, requirement = { type = "reputation", faction = "Gilneas", rank =  4}, soldBy = {50307, 252520}, source = "vendor"}-- Gilnean Noble's Trellis
DVD.ActiveItems[245605] = { decorID = 1796, model3D = 6930898, requirement = { type = "reputation", faction = "Gilneas", rank = 3 }, soldBy = {50307, 252520}, source = "vendor"}-- Gilnean Stone Wall
DVD.ActiveItems[245620] = { decorID = 1829, model3D = 321660, soldBy = {50307, 252520}, source = "quest", noxp = true } -- Little Wolf's Loo
end

do -- 🏪 VENDOR NPC: 50483 (Brave Tuho)
DVD.ActiveItems[243335] = { decorID = 1281, model3D = 6711674, soldBy = {50483}, source = "quest", noxp = true } -- Tauren Bluff Rug

end

do -- 🏪 VENDOR NPC: 58414 (San Redscale)
DVD.ActiveItems[247730] = { decorID = 3870, model3D = 524268, requirement = { type = "reputation", faction = "Order of the Cloud Serpent", rank = 4 }, soldBy = {58414}, source = "vendor"} -- Red Crane Kite
DVD.ActiveItems[247732] = { decorID = 3872, model3D = 526372, requirement = { type = "reputation", faction = "Order of the Cloud Serpent", rank = 3 }, soldBy = {58414}, source = "vendor"} -- Lucky Hanging Lantern
end

do -- 🏪 VENDOR NPC: 58706 (Gina Mudclaw)
DVD.ActiveItems[245508] = { decorID = 1201, model3D = 528075, requirement = { type = "friendship", faction = "Tina Mudclaw", rank = 5 }, soldBy = {58706}, source = "vendor"}-- Pandaren Cooking Table
DVD.ActiveItems[247670] = { decorID = 3840, model3D = 6854357, requirement = { type = "friendship", faction = "Ella", rank = 5 }, soldBy = {58706}, source = "vendor"}-- Pandaren Pantry
DVD.ActiveItems[247734] = { decorID = 3874, model3D = 527720, requirement = { type = "friendship", faction = "Farmer Fung", rank = 5 }, soldBy = {58706}, source = "vendor"}-- Paw'don Well
DVD.ActiveItems[247737] = { decorID = 3877, model3D = 531170, requirement = { type = "friendship", faction = "Jogu the Drunk", rank = 5 }, soldBy = {58706}, source = "vendor"}-- Stormstout Brew Keg
DVD.ActiveItems[248663] = { decorID = 4488, model3D = 955690, soldBy = {58706}, source = "quest", noxp = true } -- Wooden Doghouse
end

do -- 🏪 VENDOR NPC: 59698 (Brother Furtrim)
DVD.ActiveItems[264349] = { decorID = 15595, model3D = 7508746, soldBy = {59698}, source = "quest", noxp = true } -- Kun-Lai Lacquered Rickshaw
end

do -- 🏪 VENDOR NPC: 62088 (Lali the Assistant)
DVD.ActiveItems[245332] = { decorID = 767, model3D = 6717972, soldBy = {62088}, source = "achievement", noxp = true } -- Tome of Silvermoon Intrigue
DVD.ActiveItems[257351] = { decorID = 11453, model3D = 1354768, soldBy = {62088}, source = "achievement", noxp = true } -- Tale of the Penultimate Lich King
DVD.ActiveItems[257354] = { decorID = 11456, model3D = 5916218, soldBy = {62088}, source = "achievement", noxp = true } -- Scroll of K'aresh's Fall
DVD.ActiveItems[257355] = { decorID = 11457, model3D = 5916220, soldBy = {62088}, source = "achievement", noxp = true } -- Tome of the Survivor
DVD.ActiveItems[271971] = { decorID = 21857, model3D = 8123480, soldBy = {62088}, source = "achievement", noxp = true } -- Tome of Kings
end

do -- 🏪 VENDOR NPC: 64001 (Sage Lotusbloom Horde) 64032 (Sage Whiteheart Alliance)
DVD.ActiveItems[247729] = { decorID = 3869, model3D = 519135, soldBy = {64001, 64032}, source = "quest", noxp = true } -- Pandaren Stone Lamppost
DVD.ActiveItems[264362] = { decorID = 15605, model3D = 576300, soldBy = {64001, 64032}, source = "quest", noxp = true } -- Golden Pandaren Privacy Screen
end

do -- 🏪 VENDOR NPC: 64605 (Tan Shin Tiao)
DVD.ActiveItems[245512] = { decorID = 1172, model3D = 555960, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 2}, soldBy = {64605}, source = "vendor"}-- Pandaren Cradle Stool
DVD.ActiveItems[247662] = { decorID = 3832, model3D = 535966, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 3}, soldBy = {64605}, source = "vendor"} -- Pandaren Scholar's Lectern
DVD.ActiveItems[247663] = { decorID = 3833, model3D = 536629, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 4}, soldBy = {64605}, source = "vendor"}-- Pandaren Scholar's Bookcase
DVD.ActiveItems[247855] = { decorID = 3993, model3D = 520092, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 3}, soldBy = {64605}, source = "vendor"}-- Pandaren Lacquered Crate
DVD.ActiveItems[247858] = { decorID = 3995, model3D = 531955, soldBy = {64605}, source = "quest", noxp = true } -- Shaohao Ceremonial Bell
DVD.ActiveItems[258147] = { decorID = 11873, model3D = 6854355, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 4}, soldBy = {64605}, source = "vendor"}-- Empty Lorewalker's Bookcase
end

do -- 🏪 VENDOR NPC: 68363 (Quackenbush) 68364 (Paul North)
DVD.ActiveItems[255840] = { decorID = 10913, model3D = 7377919, soldBy = {68363, 68364}, source = "vendor" } -- Champion Brawler's Gloves
DVD.ActiveItems[259071] = { decorID = 12263, model3D = 7434011, soldBy = {68363, 68364}, source = "vendor" } -- Brawler's Guild Punching Bag
DVD.ActiveItems[263026] = { decorID = 14815, model3D = 378577, soldBy = {68363, 68364}, source = "vendor", noxp = true } -- Brawler's Barricade
end

do -- 🏪 VENDOR NPC: 76872 (Supplymaster Eri)
DVD.ActiveItems[244324] = { decorID = 1416, model3D = 1021574, soldBy = {76872}, source = "vendor" } -- Peon's Work Bucket
end

do -- 🏪 VENDOR NPC: 78564 (Sergeant Crowler Alliance)
DVD.ActiveItems[245275] = { decorID = 126, model3D = 936441, soldBy = {78564}, source = "vendor", noxp = true } -- Rolled Scroll
DVD.ActiveItems[248334] = { decorID = 4403, model3D = 7571145, soldBy = {78564}, source = "quest", noxp = true } -- Stormwind Wooden Bench
DVD.ActiveItems[248335] = { decorID = 4404, model3D = 953802, soldBy = {78564}, source = "quest", noxp = true } -- Stormwind Wooden Stool
DVD.ActiveItems[248660] = { decorID = 4485, model3D = 943720, soldBy = {78564}, source = "quest", noxp = true } -- Stormwind Workbench
DVD.ActiveItems[248661] = { decorID = 4486, model3D = 949629, soldBy = {78564}, source = "quest", noxp = true } -- Northshire Scribe's Desk
DVD.ActiveItems[248799] = { decorID = 4816, model3D = 950767, soldBy = {78564}, source = "quest", noxp = true } -- Wooden Storage Crate
DVD.ActiveItems[248800] = { decorID = 4818, model3D = 969975, soldBy = {78564}, source = "quest", noxp = true } -- Architect's Drafting Table
DVD.ActiveItems[248810] = { decorID = 4844, model3D = 7151868, soldBy = {78564}, source = "quest", noxp = true } -- Rough Wooden Chair
end

do -- 🏪 VENDOR NPC: 79774 (Sergeant Grimjaw Horde)
DVD.ActiveItems[244315] = { decorID = 1407, model3D = 979433, soldBy = {79774}, source = "quest", noxp = true } -- Orcish Warlord's Planning Table
DVD.ActiveItems[244316] = { decorID = 1408, model3D = 984690, soldBy = {79774}, source = "vendor" } -- Warsong Workbench
DVD.ActiveItems[244320] = { decorID = 1412, model3D = 996200, soldBy = {79774}, source = "quest", noxp = true } -- Youngling's Courser Toys
DVD.ActiveItems[244653] = { decorID = 1443, model3D = 974442, soldBy = {79774}, source = "vendor" } -- Orcish Scribe's Drafting Table
DVD.ActiveItems[245438] = { decorID = 1318, model3D = 971699, soldBy = {79774}, source = "quest" } -- Frostwolf Bookcase
DVD.ActiveItems[245443] = { decorID = 1353, model3D = 971720, soldBy = {79774}, source = "vendor" } -- Frostwolf Round Table
end

do -- 🏪 VENDOR NPC: 79812 (Moz'def)
DVD.ActiveItems[245437] = { decorID = 1326, model3D = 1005516, soldBy = {79812}, source = "vendor" } -- Orc-Forged Weaponry
DVD.ActiveItems[245442] = { decorID = 1352, model3D = 971718, soldBy = {79812}, source = "vendor" } -- Warsong Footrest
end

do -- 🏪 VENDOR NPC: 81133 (Artificer Kallaes)
DVD.ActiveItems[257349] = { decorID = 11451, model3D = 903885, soldBy = {81133}, source = "vendor", noxp = true } -- Naaru Crystal Icon
end

do -- 🏪 VENDOR NPC: 85427 (Maaria)
DVD.ActiveItems[245424] = { decorID = 931, model3D = 1062118, soldBy = {85427}, source = "vendor", noxp = true } -- Draenic Storage Chest
DVD.ActiveItems[251544] = { decorID = 8235, model3D = 875051, soldBy = {85427}, source = "vendor", noxp = true } -- Telredor Recliner
end

do -- 🏪 VENDOR NPC: 85932 (Vindicator Nuurem)
DVD.ActiveItems[245423] = { decorID = 927, model3D = 904942, soldBy = {85932}, source = "vendor" } -- Spherical Draenic Topiary
DVD.ActiveItems[251476] = { decorID = 8185, model3D = 874768, soldBy = {85932}, source = "vendor" } -- Embroidered Embaari Tent
DVD.ActiveItems[251479] = { decorID = 8188, model3D = 894509, soldBy = {85932}, source = "vendor" } -- Shadowmoon Greenhouse
DVD.ActiveItems[251481] = { decorID = 8190, model3D = 918042, soldBy = {85932}, source = "vendor" } -- Elodor Armory Rack
DVD.ActiveItems[251483] = { decorID = 8192, model3D = 942495, soldBy = {85932}, source = "vendor" } -- Draenethyst Lantern
DVD.ActiveItems[251484] = { decorID = 8193, model3D = 944222, soldBy = {85932}, source = "vendor", noxp = true } -- "Dawning Hope" Mosaic
DVD.ActiveItems[251493] = { decorID = 8194, model3D = 874865, soldBy = {85932}, source = "vendor" } -- Small Karabor Fountain
DVD.ActiveItems[251551] = { decorID = 8242, model3D = 6438667, soldBy = {85932}, source = "vendor" } -- Grand Draenethyst Lamp
end

do -- 🏪 VENDOR NPC: 85946 (Shadow-Sage Brakoss Alliance) 86037 (Ravenspeaker Skeega Horde)
DVD.ActiveItems[258743] = { decorID = 12203, model3D = 968980, soldBy = {85946, 86037}, source = "vendor", noxp = true } -- Arakkoan Alchemy Tools
DVD.ActiveItems[258746] = { decorID = 12206, model3D = 7277024, soldBy = {85946, 86037}, source = "vendor" } -- High Arakkoan Alchemist's Shelf
DVD.ActiveItems[258747] = { decorID = 12207, model3D = 7277025, soldBy = {85946, 86037}, source = "vendor" } -- High Arakkoan Shelf

end

do -- 🏪 VENDOR NPC: 85950 (Trader Caerel)
DVD.ActiveItems[245425] = { decorID = 928, model3D = 917996, soldBy = {85950}, source = "quest", noxp = true } -- Hanging Draenethyst Light
DVD.ActiveItems[251330] = { decorID = 8177, model3D = 916603, soldBy = {85950}, source = "vendor", noxp = true } -- Draenic Fencepost
DVD.ActiveItems[251477] = { decorID = 8186, model3D = 875146, soldBy = {85950}, source = "quest", noxp = true } -- Draenic Wooden Table
DVD.ActiveItems[251478] = { decorID = 8187, model3D = 875150, soldBy = {85950}, source = "quest", noxp = true } -- Square Draenic Table
DVD.ActiveItems[251548] = { decorID = 8239, model3D = 916279, soldBy = {85950}, source = "quest", noxp = true } -- Draenic Fence
DVD.ActiveItems[251549] = { decorID = 8240, model3D = 944218, soldBy = {85950}, source = "quest", noxp = true } -- Emblem of the Naaru's Blessing
DVD.ActiveItems[251640] = { decorID = 8772, model3D = 942422, soldBy = {85950}, source = "quest", noxp = true } -- Draenic Forge
DVD.ActiveItems[251653] = { decorID = 8785, model3D = 7273283, soldBy = {85950}, source = "quest", noxp = true } -- Draenethyst Lamppost
DVD.ActiveItems[251654] = { decorID = 8786, model3D = 7273284, soldBy = {85950}, source = "quest", noxp = true } -- Large Karabor Fountain
end

do -- 🏪 VENDOR NPC: 86779 (Krixel Pinchwhistle)
DVD.ActiveItems[244321] = { decorID = 1413, model3D = 996210, soldBy = {86779}, source = "vendor" } -- Orcish Lumberjack's Stool
DVD.ActiveItems[244322] = { decorID = 1414, model3D = 996214, soldBy = {86779}, source = "vendor" } -- Frostwolf Banded Stool
DVD.ActiveItems[245444] = { decorID = 1354, model3D = 996155, soldBy = {86779}, source = "vendor" } -- Orcish Communal Stove
DVD.ActiveItems[245445] = { decorID = 1355, model3D = 996162, soldBy = {86779}, source = "vendor" } -- Frostwolf Axe-Dart Board
end

do -- 🏪 VENDOR NPC: 87015 (Kil'rip)
DVD.ActiveItems[245431] = { decorID = 1317, model3D = 879812, soldBy = {87015}, source = "vendor" } -- Draenor Cookpot
DVD.ActiveItems[245433] = { decorID = 1322, model3D = 1005490, soldBy = {87015}, source = "vendor" } -- Blackrock Strongbox
end

do -- 🏪 VENDOR NPC: 87775 (Ruuan the Seer)
DVD.ActiveItems[258740] = { decorID = 12200, model3D = 965917, soldBy = {87775}, source = "achievement" } -- Glorious Pendant of Rukhmar
DVD.ActiveItems[258741] = { decorID = 12201, model3D = 968336, soldBy = {87775}, source = "quest", noxp = true } -- Writings of Reshad the Outcast
DVD.ActiveItems[258745] = { decorID = 12205, model3D = 7277023, soldBy = {87775}, source = "quest", noxp = true } -- High Arakkoan Library Shelf
DVD.ActiveItems[258748] = { decorID = 12208, model3D = 7277026, soldBy = {87775}, source = "quest", noxp = true } -- "Rising Glory of Rukhmar" Statue
DVD.ActiveItems[258749] = { decorID = 12209, model3D = 1113349, soldBy = {87775}, source = "quest", noxp = true } -- Uncorrupted Eye of Terokk
end

do -- 🏪 VENDOR NPC: 88126 (Maybell Maclure-Stonefield)
DVD.ActiveItems[253527] = { decorID = 9424, model3D = 936454, soldBy = {88126}, source = "quest", noxp = true } -- Goldshire Wardrobe
end

do -- 🏪 VENDOR NPC: 88220 (Peter Alliance) 87312 (Vora Strongarm Horde)
DVD.ActiveItems[239162] = { decorID = 751, model3D = 1002891, soldBy = {88220, 87312}, source = "vendor", noxp = true } -- Wooden Mug
end

do -- 🏪 VENDOR NPC: 89939 (Berazus)
DVD.ActiveItems[246864] = { decorID = 2530, model3D = 4298560, soldBy = {89939}, source = "quest", noxp = true } -- Tome of the Lost Dragon
end

do -- 🏪 VENDOR NPC: 93971 (Leyweaver Inondra)
DVD.ActiveItems[247912] = { decorID = 4026, model3D = 1361706, soldBy = {93971}, source = "vendor" } -- Large Traditional Shal'dorei Rug
DVD.ActiveItems[247919] = { decorID = 4033, model3D = 1378306, soldBy = {93971}, source = "vendor" } -- Traditional Shal'dorei Rug
end

do -- 🏪 VENDOR NPC: 100196 (Eadric the Pure)
DVD.ActiveItems[250230] = { decorID = 7571, model3D = 1247929, soldBy = {100196}, source = "achievement", noxp = true } -- Replica Altar of Ancient Kings
DVD.ActiveItems[250231] = { decorID = 7572, model3D = 1267028, soldBy = {100196}, source = "vendor" } -- Silver Hand Banner
DVD.ActiveItems[250232] = { decorID = 7573, model3D = 1267032, soldBy = {100196}, source = "vendor" } -- Sanctum of Light Hallway Rug
DVD.ActiveItems[250233] = { decorID = 7574, model3D = 1267045, soldBy = {100196}, source = "achievement" } -- Replica Libram of Ancient Kings
DVD.ActiveItems[250234] = { decorID = 7575, model3D = 1267052, soldBy = {100196}, source = "achievement", noxp = true } -- Sanctum of Light Candelabra
DVD.ActiveItems[250235] = { decorID = 7576, model3D = 1267056, soldBy = {100196}, source = "vendor" } -- Silver Hand Tribute to the Fallen
DVD.ActiveItems[250236] = { decorID = 7577, model3D = 1270418, soldBy = {100196}, source = "achievement" } -- Silver Hand Weapon Rack
end

do -- 🏪 VENDOR NPC: 103693 (Outfitter Reynolds)
DVD.ActiveItems[245549] = { decorID = 1740, model3D = 6905474, soldBy = {103693}, source = "vendor" } -- Trueshot Lodge Fireplace
DVD.ActiveItems[248011] = { decorID = 4042, model3D = 1315073, soldBy = {103693}, source = "achievement", noxp = true } -- Trueshot Skeletal Dragon Head
DVD.ActiveItems[250110] = { decorID = 5877, model3D = 1313898, soldBy = {103693}, source = "vendor" } -- Trueshot Lodge Weapon Rack
DVD.ActiveItems[250125] = { decorID = 5890, model3D = 1276980, soldBy = {103693}, source = "achievement", noxp = true } -- Replica Altar of the Eternal Hunt
DVD.ActiveItems[250126] = { decorID = 5891, model3D = 7233609, soldBy = {103693}, source = "achievement" } -- Unseen Path Archer's Gallery
DVD.ActiveItems[250127] = { decorID = 5892, model3D = 7233610, soldBy = {103693}, source = "achievement", noxp = true } -- Replica Tales of the Hunt
DVD.ActiveItems[250128] = { decorID = 5893, model3D = 7233612, soldBy = {103693}, source = "vendor" } -- Banner of the Unseen Path
end

do -- 🏪 VENDOR NPC: 105333 (Val'zuun) Legion Remix 
DVD.ActiveItems[250307] = { decorID = 7610, model3D = 7150661, soldBy = {105333}, source = "achievement", noxp = true } -- Tome of the Corrupt
DVD.ActiveItems[250402] = { decorID = 7620, model3D = 1102771, soldBy = {105333}, source = "achievement", noxp = true } -- Vrykul Lord's Throne
DVD.ActiveItems[250403] = { decorID = 7621, model3D = 1310272, soldBy = {105333}, source = "achievement", noxp = true } -- Legion's Holo-Communicator
DVD.ActiveItems[250404] = { decorID = 7622, model3D = 7216246, soldBy = {105333}, source = "achievement" } -- Hanging Felsteel Chain
DVD.ActiveItems[250405] = { decorID = 7623, model3D = 7216248, soldBy = {105333}, source = "achievement", noxp = true } -- Legion's Fel Torch
DVD.ActiveItems[250406] = { decorID = 7624, model3D = 7216249, soldBy = {105333}, source = "achievement", noxp = true } -- Corruption Pit
DVD.ActiveItems[250407] = { decorID = 7625, model3D = 7240009, soldBy = {105333}, source = "achievement", noxp = true } -- Legion's Fel Brazier
DVD.ActiveItems[250622] = { decorID = 7658, model3D = 7240011, soldBy = {105333}, source = "achievement" } -- Vertical Felsteel Chain
DVD.ActiveItems[250689] = { decorID = 7686, model3D = 1308148, soldBy = {105333}, source = "achievement", noxp = true } -- Legion Torture Rack
DVD.ActiveItems[250690] = { decorID = 7687, model3D = 1338587, soldBy = {105333}, source = "achievement", noxp = true } -- Eredar Lord's Fel Torch
DVD.ActiveItems[250693] = { decorID = 7690, model3D = 7150660, soldBy = {105333}, source = "achievement", noxp = true } -- Altar of the Corrupted Flames
DVD.ActiveItems[251778] = { decorID = 8810, model3D = 1119129, soldBy = {105333}, source = "achievement", noxp = true } -- Sentinel's Moonwing Gaze
DVD.ActiveItems[251779] = { decorID = 8811, model3D = 7216247, soldBy = {105333}, source = "achievement" } -- Fel Fountain
DVD.ActiveItems[252753] = { decorID = 9165, model3D = 1349995, soldBy = {105333}, source = "achievement", noxp = true } -- Demonic Storage Chest
DVD.ActiveItems[256677] = { decorID = 11278, model3D = 1307161, soldBy = {105333}, source = "achievement", noxp = true } -- Large Legion Candle
DVD.ActiveItems[256678] = { decorID = 11279, model3D = 1307162, soldBy = {105333}, source = "achievement", noxp = true } -- Small Legion Candle
DVD.ActiveItems[258299] = { decorID = 11942, model3D = 7240010, soldBy = {105333}, source = "achievement", noxp = true } -- Hanging Felsteel Cage
end

do -- 🏪 VENDOR NPC: 106902 (Ransa Greyfeather)
DVD.ActiveItems[243290] = { decorID = 1252, model3D = 6872427, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 5 }, soldBy = {106902}, source = "vendor"}-- Tauren Waterwheel
DVD.ActiveItems[243359] = { decorID = 1292, model3D = 1305135, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 4 }, soldBy = {106902}, source = "vendor"}-- Tauren Windmill
DVD.ActiveItems[245270] = { decorID = 1703, model3D = 6892736, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 4 }, soldBy = {106902}, source = "vendor"}-- Thunder Totem Kiln
DVD.ActiveItems[245450] = { decorID = 1297, model3D = 1861620, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 5 }, soldBy = {106902}, source = "vendor"}-- Highmountain Totem
DVD.ActiveItems[245452] = { decorID = 1231, model3D = 1255423, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 3 }, soldBy = {106902}, source = "vendor"}-- Stonebull Canoe
DVD.ActiveItems[245454] = { decorID = 1293, model3D = 1318477, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 2 }, soldBy = {106902}, source = "vendor"}-- Small Highmountain Drum
DVD.ActiveItems[245458] = { decorID = 1295, model3D = 1327167, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 2 }, soldBy = {106902}, source = "vendor"}-- Riverbend Jar
DVD.ActiveItems[248985] = { decorID = 5136, model3D = 7194087, requirement = { type = "reputation", faction = "Highmountain Tribe", rank = 3 }, soldBy = {106902}, source = "vendor"}-- Tauren Hanging Brazier	
end

do -- 🏪 VENDOR NPC: 108017 (Torv Dubstomp)
DVD.ActiveItems[245405] = { decorID = 1251, model3D = 6711671, soldBy = {108017}, source = "quest", noxp = true } -- Large Highmountain Drum
DVD.ActiveItems[245409] = { decorID = 1309, model3D = 6877680, soldBy = {108017}, source = "quest", noxp = true } -- Dried Whitewash Corn
DVD.ActiveItems[245453] = { decorID = 1235, model3D = 1322950, soldBy = {108017}, source = "quest", noxp = true } -- Whitewash River Basket
DVD.ActiveItems[245456] = { decorID = 1287, model3D = 1253406, soldBy = {108017}, source = "quest", noxp = true } -- Warbrave's Brazier
DVD.ActiveItems[245457] = { decorID = 1294, model3D = 1323065, soldBy = {108017}, source = "quest", noxp = true } -- Riverbend Netting
DVD.ActiveItems[245460] = { decorID = 1307, model3D = 1402222, soldBy = {108017}, source = "achievement", noxp = true } -- Skyhorn Storage Chest
DVD.ActiveItems[245461] = { decorID = 1291, model3D = 1305130, soldBy = {108017}, source = "quest", noxp = true } -- Tauren Vertical Windmill
DVD.ActiveItems[256913] = { decorID = 11315, model3D = 1319084, soldBy = {108017}, source = "achievement", noxp = true } -- Tauren Jeweler's Roller
DVD.ActiveItems[257397] = { decorID = 11487, model3D = 1345313, soldBy = {108017}, source = "quest", noxp = true } -- Tauren Storyteller's Frame
DVD.ActiveItems[257401] = { decorID = 11491, model3D = 1255331, soldBy = {108017}, source = "quest", noxp = true } -- Skyhorn Banner
DVD.ActiveItems[257721] = { decorID = 11751, model3D = 1255415, soldBy = {108017}, source = "achievement", noxp = true } -- Skyhorn Arrow Kite
DVD.ActiveItems[257722] = { decorID = 11752, model3D = 1255418, soldBy = {108017}, source = "quest", noxp = true } -- Hanging Arrow Kite
DVD.ActiveItems[257723] = { decorID = 11753, model3D = 1255422, soldBy = {108017}, source = "quest", noxp = true } -- Skyhorn Eagle Kite
DVD.ActiveItems[260698] = { decorID = 14379, model3D = 1255019, soldBy = {108017}, source = "quest", noxp = true } -- Kobold Trassure Pile
DVD.ActiveItems[264477] = { decorID = 15741, model3D = 1253823, soldBy = {108017}, source = "quest", noxp = true } -- Thunder Totem Mailbox
end

do -- 🏪 VENDOR NPC: 108537 (Crafty Palu)
DVD.ActiveItems[258219] = { decorID = 11905, model3D = 1091544, soldBy = {108537}, source = "vendor" } -- Driftwood Barrel
DVD.ActiveItems[258221] = { decorID = 11907, model3D = 1091587, soldBy = {108537}, source = "quest", noxp = true } -- Driftwood Junk Pile
DVD.ActiveItems[258223] = { decorID = 11909, model3D = 1095305, soldBy = {108537}, source = "achievement", noxp = true } -- Murloc's Wind Chimes
end

do -- 🏪 VENDOR NPC: 109306 (Myria Glenbrook)
DVD.ActiveItems[245258] = { decorID = 1692, model3D = 1096759, soldBy = {109306}, source = "quest", noxp = true } -- Val'sharah Bookcase
DVD.ActiveItems[245698] = { decorID = 1882, model3D = 1096764, soldBy = {109306}, source = "quest", noxp = true } -- Kaldorei Stone Fence
DVD.ActiveItems[245699] = { decorID = 1883, model3D = 1096766, soldBy = {109306}, source = "vendor", noxp = true } -- Kaldorei Stone Fencepost
end

do -- 🏪 VENDOR NPC: 112318 (Flamesmith Lanying) 105986 (Kelsey Steelspark)
DVD.ActiveItems[250914] = { decorID = 7837, model3D = 1279203, soldBy = {112318}, source = "achievement" } -- Elemental Altar of the Maelstrom
DVD.ActiveItems[250915] = { decorID = 7838, model3D = 1323611, soldBy = {112318}, source = "achievement" } -- Replica Words of Wind and Earth
DVD.ActiveItems[250916] = { decorID = 7839, model3D = 1328745, soldBy = {112318}, source = "vendor" } -- Pedestal of the Maelstrom's Wisdom
DVD.ActiveItems[250918] = { decorID = 7841, model3D = 1396607, soldBy = {112318}, source = "vendor" } -- Maelstrom Banner
DVD.ActiveItems[251014] = { decorID = 7874, model3D = 7262794, soldBy = {112318}, source = "achievement" } -- Earthen Ring Scouting Map
DVD.ActiveItems[251015] = { decorID = 7875, model3D = 7262795, soldBy = {112318}, source = "vendor" } -- Maelstrom Chimes
DVD.ActiveItems[257403] = { decorID = 11493, model3D = 366699, soldBy = {112318, 105986}, source = "achievement", noxp = true } -- Maelstrom Lava Lamp
DVD.ActiveItems[260776] = { decorID = 14461, model3D = 1345395, soldBy = {105986}, source = "achievement", noxp = true } -- Uncrowned Market Stall
DVD.ActiveItems[250783] = { decorID = 7815, model3D = 1305341, soldBy = {105986}, source = "vendor" } -- Uncrowned Apothecary's Cabinet
DVD.ActiveItems[250784] = { decorID = 7816, model3D = 1305343, soldBy = {105986}, source = "vendor" } -- Uncrowned Apothecary's Supplies
DVD.ActiveItems[250785] = { decorID = 7817, model3D = 1305536, soldBy = {105986}, source = "vendor" } -- Uncrowned Banner
DVD.ActiveItems[250786] = { decorID = 7818, model3D = 1305549, soldBy = {105986}, source = "achievement" } -- Uncrowned Planning Table
DVD.ActiveItems[250787] = { decorID = 7819, model3D = 1337146, soldBy = {105986}, source = "achievement" } -- Replica Crucible of the Uncrowned
DVD.ActiveItems[250788] = { decorID = 7820, model3D = 1338498, soldBy = {105986}, source = "achievement", noxp = true } -- Stolen Copy of the Blood Ledger
end

do -- 🏪 VENDOR NPC: 112323 (Amurra Thistledew)
DVD.ActiveItems[245550] = { decorID = 1741, model3D = 7515605, soldBy = {112323}, source = "vendor" } -- Runed Dreamweaver Moonstone
DVD.ActiveItems[246216] = { decorID = 2086, model3D = 1108749, soldBy = {112323}, source = "vendor" } -- Sprouting Lamppost
DVD.ActiveItems[250111] = { decorID = 5878, model3D = 1324674, soldBy = {112323}, source = "achievement", noxp = true } -- Replica Tome of the Ancients
DVD.ActiveItems[250133] = { decorID = 5897, model3D = 7233614, soldBy = {112323}, source = "vendor" } -- Dreamweaver Banner
DVD.ActiveItems[250134] = { decorID = 5898, model3D = 7233615, soldBy = {112323}, source = "achievement", noxp = true } -- Seed of Ages Cutting
DVD.ActiveItems[251013] = { decorID = 7873, model3D = 7233616, soldBy = {112323}, source = "achievement" } -- Cenarion Arch
DVD.ActiveItems[260581] = { decorID = 14358, model3D = 1108732, soldBy = {112323}, source = "achievement", noxp = true } -- Brazier of Elune
end

do -- 🏪 VENDOR NPC: 112338 (Caydori Brightstar)
DVD.ActiveItems[248935] = { decorID = 5112, model3D = 520067, soldBy = {112338}, source = "vendor" } -- Five Dawns Weapon Rack
DVD.ActiveItems[248936] = { decorID = 5113, model3D = 529275, soldBy = {112338}, source = "vendor" } -- Five Dawns Shrine of the Smoking Fish
DVD.ActiveItems[248942] = { decorID = 5119, model3D = 1323662, soldBy = {112338}, source = "achievement" } -- Five Dawns Planning Table
DVD.ActiveItems[248958] = { decorID = 5126, model3D = 6877675, soldBy = {112338}, source = "achievement" } -- Monastery Gong
DVD.ActiveItems[256679] = { decorID = 11280, model3D = 1324675, soldBy = {112338}, source = "achievement" } -- Replica Chronicle of Ages
DVD.ActiveItems[262619] = { decorID = 14644, model3D = 7483166, soldBy = {112338}, source = "achievement" } -- Replica Forge of the Roaring Mountain
DVD.ActiveItems[267372] = { decorID = 18897, model3D = 6877676, soldBy = {112338}, source = "vendor", noxp = true } -- Banner of Five Dawns
end

do -- 🏪 VENDOR NPC: 112392 (Quartermaster Durnolf)
DVD.ActiveItems[249458] = { decorID = 5526, model3D = 1300920, soldBy = {112392}, source = "achievement" } -- Replica Forge of Odyn
DVD.ActiveItems[249460] = { decorID = 5528, model3D = 1332984, soldBy = {112392}, source = "vendor" } -- Skyhold Brazier
DVD.ActiveItems[249461] = { decorID = 5529, model3D = 1450335, soldBy = {112392}, source = "achievement" } -- Skyhold War Table
DVD.ActiveItems[249464] = { decorID = 5532, model3D = 7155603, soldBy = {112392}, source = "vendor" } -- Valarjar Banner
DVD.ActiveItems[249466] = { decorID = 5534, model3D = 7155606, soldBy = {112392}, source = "achievement", noxp = true } -- Valarjar Shield Wall
DVD.ActiveItems[249551] = { decorID = 5562, model3D = 7209759, soldBy = {112392}, source = "vendor" } -- Skyhold Spear Rack
DVD.ActiveItems[257396] = { decorID = 11486, model3D = 1325991, soldBy = {112392}, source = "achievement", noxp = true } -- Replica Saga of the Valarjar
end

do -- 🏪 VENDOR NPC: 112401 (Meridelle Lightspark)
DVD.ActiveItems[250302] = { decorID = 7606, model3D = 1321771, soldBy = {112401}, source = "vendor" } -- Netherlight Conclave Voidwell
DVD.ActiveItems[250303] = { decorID = 7607, model3D = 1321796, soldBy = {112401}, source = "vendor" } -- Conclave Pedestal
DVD.ActiveItems[250304] = { decorID = 7608, model3D = 1323033, soldBy = {112401}, source = "vendor" } -- Netherlight Lightwell
DVD.ActiveItems[250789] = { decorID = 7821, model3D = 7240005, soldBy = {112401}, source = "vendor" } -- Netherlight Conclave Banner
DVD.ActiveItems[250790] = { decorID = 7822, model3D = 7240006, soldBy = {112401}, source = "achievement", noxp = true } -- Replica Altar of Light and Shadow
DVD.ActiveItems[250791] = { decorID = 7823, model3D = 7240007, soldBy = {112401}, source = "achievement" } -- Replica Word of the Conclave
DVD.ActiveItems[250792] = { decorID = 7824, model3D = 7240008, soldBy = {112401}, source = "achievement" } -- Scroll of the Conclave
DVD.ActiveItems[251636] = { decorID = 8768, model3D = 1339273, soldBy = {112401}, source = "achievement" } -- Netherlight Command Map
end

do -- 🏪 VENDOR NPC: 112407 (Falara Nightsong) 93550 (Quartermaster Ozorg)
DVD.ActiveItems[249457] = { decorID = 5525, model3D = 1260635, soldBy = {112407}, source = "achievement", noxp = true } -- Replica Cursed Forge of the Nathrezim
DVD.ActiveItems[249459] = { decorID = 5527, model3D = 1301086, soldBy = {112407}, source = "achievement", noxp = true } -- Illidari Glaiverest
DVD.ActiveItems[249462] = { decorID = 5530, model3D = 6892652, soldBy = {112407}, source = "vendor" } -- Illidari Banner
DVD.ActiveItems[249463] = { decorID = 5531, model3D = 6892653, soldBy = {112407}, source = "vendor" } -- Illidari Skull Sentinel
DVD.ActiveItems[249518] = { decorID = 5555, model3D = 1321783, soldBy = {112407}, source = "achievement" } -- Fel Hammer Scouting Map
DVD.ActiveItems[249690] = { decorID = 5575, model3D = 6892689, soldBy = {112407, 93550}, source = "achievement", noxp = true } -- Replica Tome of Fel Secrets
DVD.ActiveItems[250112] = { decorID = 5879, model3D = 1338446, soldBy = {93550}, source = "achievement" } -- Ebon Blade Planning Map
DVD.ActiveItems[250113] = { decorID = 5880, model3D = 1354764, soldBy = {93550}, source = "vendor", noxp = true } -- Ebon Blade Tome
DVD.ActiveItems[250114] = { decorID = 5881, model3D = 1355133, soldBy = {93550}, source = "vendor", noxp = true } -- Acherus Worktable
DVD.ActiveItems[250115] = { decorID = 5882, model3D = 1355367, soldBy = {93550}, source = "achievement", noxp = true } -- Ebon Blade Weapon Rack
DVD.ActiveItems[250123] = { decorID = 5888, model3D = 6892693, soldBy = {93550}, source = "achievement", noxp = true } -- Replica Acherus Soul Forge
DVD.ActiveItems[250124] = { decorID = 5889, model3D = 6892710, soldBy = {93550}, source = "vendor", noxp = true } -- Ebon Blade Banner
DVD.ActiveItems[256675] = { decorID = 11276, model3D = 1101719, soldBy = {112407}, source = "vendor" } -- Illidari Tent
DVD.ActiveItems[260584] = { decorID = 14361, model3D = 7474233, soldBy = {93550}, source = "achievement", noxp = true } -- Replica Libram of the Dead
end

do -- 🏪 VENDOR NPC: 112434 (Gigi Gigavoid)
DVD.ActiveItems[248940] = { decorID = 5117, model3D = 1277582, soldBy = {112434}, source = "achievement", noxp = true } -- Replica Felblood Altar
DVD.ActiveItems[248943] = { decorID = 5120, model3D = 1394859, soldBy = {112434}, source = "vendor" } -- Black Harvest Banner
DVD.ActiveItems[248959] = { decorID = 5127, model3D = 6877677, soldBy = {112434}, source = "vendor" } -- Dreadscar Bookcase
DVD.ActiveItems[248960] = { decorID = 5128, model3D = 6877678, soldBy = {112434}, source = "achievement", noxp = true } -- Dreadscar Dais
DVD.ActiveItems[249004] = { decorID = 5292, model3D = 6877679, soldBy = {112434}, source = "vendor" } -- Black Harvest Orrery
DVD.ActiveItems[256907] = { decorID = 11307, model3D = 1125315, soldBy = {112434}, source = "achievement", noxp = true } -- Replica Tome of Blighted Implements
DVD.ActiveItems[264242] = { decorID = 15477, model3D = 7506478, soldBy = {112434}, source = "achievement" } -- Dreadscar Battle Planning Map
end

do -- 🏪 VENDOR NPC: 112440 (Jackson Watkins)
DVD.ActiveItems[245429] = { decorID = 750, model3D = 964976, soldBy = {112440}, source = "achievement", noxp = true } -- Tirisgarde Book Tempest
DVD.ActiveItems[250130] = { decorID = 5894, model3D = 965876, soldBy = {112440}, source = "vendor" } -- Tirisgarde Candle
DVD.ActiveItems[250131] = { decorID = 5895, model3D = 1315074, soldBy = {112440}, source = "achievement" } -- Tirisgarde War Map
DVD.ActiveItems[250132] = { decorID = 5896, model3D = 1315103, soldBy = {112440}, source = "vendor" } -- Tirisgarde Brazier
DVD.ActiveItems[250239] = { decorID = 7579, model3D = 7233625, soldBy = {112440}, source = "vendor" } -- Tirisgarde Banner
DVD.ActiveItems[250306] = { decorID = 7609, model3D = 1311397, soldBy = {112440}, source = "achievement", noxp = true } -- Conjured Altar of the Guardian
DVD.ActiveItems[256674] = { decorID = 11275, model3D = 965217, soldBy = {112440}, source = "achievement", noxp = true } -- Conjured Archive of the Tirisgarde
end

do -- 🏪 VENDOR NPC: 112634 (Hilseth Travelstride)
DVD.ActiveItems[238863] = { decorID = 679, model3D = 1240416, soldBy = {112634}, source = "vendor" } -- Kaldorei Desk
DVD.ActiveItems[245260] = { decorID = 1694, model3D = 1240419, soldBy = {112634}, source = "vendor" } -- Kaldorei Chef's Table
end

do -- 🏪 VENDOR NPC: 112716 (Rasil Fireborne)
DVD.ActiveItems[246851] = { decorID = 2517, model3D = 1453482, soldBy = {112716}, source = "vendor", noxp = true } -- "Raising Your Eyes" Painting
end

do -- 🏪 VENDOR NPC: 115736 (First Arcanist Thalyssra)
DVD.ActiveItems[244536] = { decorID = 1440, model3D = 6905475, requirement = { type = "reputation", faction = "The Nightfallen", rank = 5 }, soldBy = {115736}, source = "vendor", noxp = true } -- Nightborne Fireplace
DVD.ActiveItems[246850] = { decorID = 2516, model3D = 1399651, requirement = { type = "reputation", faction = "The Nightfallen", rank = 5 }, soldBy = {115736}, source = "vendor", noxp = true } -- "Fruit of the Arcan'dor" Painting
DVD.ActiveItems[247844] = { decorID = 3983, model3D = 1366196, requirement = { type = "reputation", faction = "The Nightfallen", rank = 3 }, soldBy = {115736}, source = "vendor", noxp = true } -- Suramar Library
DVD.ActiveItems[247845] = { decorID = 3984, model3D = 1369308, requirement = { type = "reputation", faction = "The Nightfallen", rank = 4 }, soldBy = {115736}, source = "vendor"}-- Nightborne Bench
DVD.ActiveItems[247847] = { decorID = 3985, model3D = 1393424, requirement = { type = "reputation", faction = "The Nightfallen", rank = 4 }, soldBy = {115736}, source = "vendor"}-- Arcwine Counter
DVD.ActiveItems[247910] = { decorID = 4024, model3D = 1360655, requirement = { type = "reputation", faction = "The Nightfallen", rank = 2 }, soldBy = {115736}, source = "vendor"}-- Suramar Sconce
DVD.ActiveItems[247921] = { decorID = 4035, model3D = 1389475, requirement = { type = "reputation", faction = "The Nightfallen", rank = 2 }, soldBy = {115736}, source = "vendor"}-- Nightborne Wall Shelf
DVD.ActiveItems[247924] = { decorID = 4038, model3D = 1410429, requirement = { type = "reputation", faction = "The Nightfallen", rank = 4 }, soldBy = {115736}, source = "vendor", noxp = true } -- Suramar Street Light
end

do -- 🏪 VENDOR NPC: 115805 (Hoddruc Bladebender)
DVD.ActiveItems[256331] = { decorID = 11131, model3D = 7385423, soldBy = {115805}, source = "quest", noxp = true } -- Shadowforge Lamppost
end

do -- 🏪 VENDOR NPC: 127151 (Toraan the Revered)
DVD.ActiveItems[245422] = { decorID = 930, model3D = 979926, soldBy = {127151}, source = "quest", note = "Use Teleporter Pad in Legion Dalaran to get to the ship", noxp = true } -- Draenic Bookcase
DVD.ActiveItems[251480] = { decorID = 8189, model3D = 902396, soldBy = {127151}, source = "quest", note = "Use Teleporter Pad in Legion Dalaran to get to the ship", noxp = true } -- Draenic Wooden Wall Shelf
end

do -- 🏪 VENDOR NPC: 135459 (Provisioner Lija)
DVD.ActiveItems[245488] = { decorID = 1170, model3D = 1590851, soldBy = {135459}, source = "quest", noxp = true } -- Zandalari Rickshaw
DVD.ActiveItems[245413] = { decorID = 1199, model3D = 6653374, requirement = { type = "reputation", faction = "Talanji's Expedition", rank = 3 }, soldBy = {135459}, source = "vendor"}-- Zandalari Sconce
DVD.ActiveItems[245495] = { decorID = 1178, model3D = 1590834, requirement = { type = "reputation", faction = "Talanji's Expedition", rank = 4 }, soldBy = {135459}, source = "vendor"}-- Dazar'alor Market Tent
DVD.ActiveItems[245500] = { decorID = 1218, model3D = 1629654, requirement = { type = "reputation", faction = "Talanji's Expedition", rank = 4 }, soldBy = {135459}, source = "vendor"}-- Red Dazar'alor Tent
DVD.ActiveItems[257394] = { decorID = 11484, model3D = 668858, requirement = { type = "reputation", faction = "Talanji's Expedition", rank = 3 }, soldBy = {135459}, source = "vendor"} -- Zandalari War Torch 
end

do -- 🏪 VENDOR NPC: 135808 (Provisioner Fray)
DVD.ActiveItems[246222] = { decorID = 2091, model3D = 2026170, requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = 3 }, soldBy = {135808}, source = "vendor"}-- Boralus String Lights
DVD.ActiveItems[252036] = { decorID = 8984, model3D = 1901195, requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = 4 }, soldBy = {135808}, source = "vendor"}-- Tidesage's Bookcase
DVD.ActiveItems[252387] = { decorID = 9036, model3D = 1602432, requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = 2 }, soldBy = {135808}, source = "vendor"}-- Boralus Fence
DVD.ActiveItems[252388] = { decorID = 9037, model3D = 1602433, requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = 2 }, soldBy = {135808}, source = "vendor"}-- Boralus Fencepost
DVD.ActiveItems[252402] = { decorID = 9051, model3D = 1852952, requirement = { type = "reputation", faction = "Proudmoore Admiralty", rank = 4 }, soldBy = {135808}, source = "vendor"}-- Tidesage's Double Bookshelves
end

do -- 🏪 VENDOR NPC: 144129 (Plugger Spazzring)
DVD.ActiveItems[245291] = { decorID = 1120, model3D = 4993909, soldBy = {144129}, source = "vendor" } -- Replica Dark Iron Mole Machine
end

do -- 🏪 VENDOR NPC: 148923 (Captain Zen'taga)
DVD.ActiveItems[245482] = { decorID = 943, model3D = 2579334, soldBy = {148923}, source = "vendor" } -- Undercity Spiked Chest
end

do -- 🏪 VENDOR NPC: 148924 (Provisioner Mukra)
DVD.ActiveItems[241067] = { decorID = 949, model3D = 6431409, soldBy = {148924}, source = "vendor" } -- Large Forsaken Spiked Brazier
DVD.ActiveItems[245464] = { decorID = 839, model3D = 2351845, soldBy = {148924}, source = "vendor" } -- Inert Blight Canister
DVD.ActiveItems[245471] = { decorID = 939, model3D = 2493893, soldBy = {148924}, source = "vendor" } -- Blightfire Lantern
DVD.ActiveItems[245472] = { decorID = 940, model3D = 2493894, soldBy = {148924}, source = "vendor" } -- Blightfire Hanging Lantern
DVD.ActiveItems[245474] = { decorID = 932, model3D = 2341258, soldBy = {148924}, source = "vendor" } -- Forsaken War Planning Table
DVD.ActiveItems[245476] = { decorID = 937, model3D = 2481224, soldBy = {148924}, source = "achievement", noxp = true } -- Large Forsaken War Tent
DVD.ActiveItems[245477] = { decorID = 938, model3D = 2481225, soldBy = {148924}, source = "vendor" } -- Small Forsaken War Tent
end

do -- 🏪 VENDOR NPC: 150716 (Stolen Royal Vendorbot)
DVD.ActiveItems[246479] = { decorID = 2322, model3D = 999909, soldBy = {150716}, source = "achievement" } -- Gnomish T.O.O.L.B.O.X.
DVD.ActiveItems[246483] = { decorID = 2326, model3D = 2745098, soldBy = {150716}, source = "achievement", noxp = true } -- Redundant Reclamation Rig
DVD.ActiveItems[246484] = { decorID = 2327, model3D = 2765475, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 2 }, soldBy = {150716}, source = "vendor"}-- Mechagon Hanging Floodlight
DVD.ActiveItems[246497] = { decorID = 2337, model3D = 2316618, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 2 }, soldBy = {150716}, source = "vendor"}-- Small Emergency Warning Lamp
DVD.ActiveItems[246498] = { decorID = 2338, model3D = 2316619, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 3 }, soldBy = {150716}, source = "vendor"}-- Emergency Warning Lamp
DVD.ActiveItems[246499] = { decorID = 2339, model3D = 2765473, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 4 }, soldBy = {150716}, source = "vendor"}-- Mechagon Eyelight Lamp
DVD.ActiveItems[246501] = { decorID = 2341, model3D = 2929686, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 5 }, soldBy = {150716}, source = "vendor"}-- Gnomish Safety Flamethrower
DVD.ActiveItems[246503] = { decorID = 2343, model3D = 6699746, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 3 }, soldBy = {150716}, source = "vendor"}-- Large H.O.M.E. Cog
DVD.ActiveItems[246605] = { decorID = 2437, model3D = 2907352, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 4 }, soldBy = {150716}, source = "vendor"}-- Mecha-Storage Mecha-Chest
DVD.ActiveItems[246480] = { decorID = 2323, model3D = 1089040, requirement = { type = "reputation", faction = "Rustbolt Resistance", rank = 5 }, soldBy = {150716}, source = "vendor"}-- Automated Gnomeregan Guardian
DVD.ActiveItems[246598] = { decorID = 2430, model3D = 1842466, soldBy = {150716}, source = "achievement" } -- Screw-Sealed Stembarrel
DVD.ActiveItems[246603] = { decorID = 2435, model3D = 2068146, soldBy = {150716}, source = "achievement", noxp = true } -- Gnomish Cog Stack
DVD.ActiveItems[246701] = { decorID = 2466, model3D = 1842929, soldBy = {150716}, source = "quest", noxp = true } -- Gnomish Sprocket Table
DVD.ActiveItems[246703] = { decorID = 2467, model3D = 1842930, soldBy = {150716}, source = "quest", noxp = true } -- Double-Sprocket Table
end

do -- 🏪 VENDOR NPC: 152194 (MOTHER)
DVD.ActiveItems[247667] = { decorID = 3837, model3D = 1934697, soldBy = {152194}, source = "achievement" } -- MOTHER's Titanic Brazier
DVD.ActiveItems[247668] = { decorID = 3838, model3D = 3074885, soldBy = {152194}, source = "achievement" } -- N'Zoth's Captured Eye
end

do -- 🏪 VENDOR NPC: 162804 (Ve'nari)
DVD.ActiveItems[248125] = { decorID = 4181, model3D = 7134869, soldBy = {162804}, source = "achievement", noxp = true } -- Portal to Damnation
end

do -- 🏪 VENDOR NPC: 174710 (Chachi the Artiste)
DVD.ActiveItems[245501] = { decorID = 756, model3D = 3533100, soldBy = {174710}, source = "vendor" } -- Venthyr Tome of Unforgiven Sins
end

do -- 🏪 VENDOR NPC: 189226 (Cataloger Jakes) 188265 (Rae'ana)
DVD.ActiveItems[238975] = { decorID = 720, model3D = 4496829, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 24 }, soldBy = {189226, 188265}, source = "vendor", noxp = true } -- Reliquary Telescope
DVD.ActiveItems[245283] = { decorID = 1177, model3D = 4239021, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 16 }, soldBy = {189226, 188265}, source = "vendor", noxp = true } -- Blood Elven Candelabra
DVD.ActiveItems[245285] = { decorID = 716, model3D = 4239016, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 16 }, soldBy = {189226, 188265}, source = "vendor"}-- Reliquary Storage Crate
DVD.ActiveItems[245286] = { decorID = 1181, model3D = 4239026, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 10 }, soldBy = {189226, 188265}, source = "vendor"}-- Rectangular Sin'dorei Rug
DVD.ActiveItems[245287] = { decorID = 717, model3D = 4239027, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 10 }, soldBy = {189226, 188265}, source = "vendor"}-- Long Sin'dorei Rug
DVD.ActiveItems[245288] = { decorID = 718, model3D = 4239028, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 10 }, soldBy = {189226, 188265}, source = "vendor"}-- Circular Sin'dorei Rug
end

do -- 🏪 VENDOR NPC: 191025 (Lifecaller Tzadrak)
DVD.ActiveItems[246863] = { decorID = 2529, model3D = 4298559, soldBy = {191025}, source = "quest", noxp = true } -- Open Tome of the Dragon's Dedication
end

do -- 🏪 VENDOR NPC: 193659 (Provisioner Thom)
DVD.ActiveItems[250912] = { decorID = 7835, model3D = 6892651, soldBy = {193659}, source = "quest", noxp = true } -- Draconic Crafter's Forge
end

do -- 🏪 VENDOR NPC: 196637 (Tethalash)
DVD.ActiveItems[249545] = { decorID = 5556, model3D = 4215255, soldBy = {196637}, source = "vendor" } -- Preserver's Censer
DVD.ActiveItems[249547] = { decorID = 5558, model3D = 4248068, soldBy = {196637}, source = "vendor" } -- Evoker's Elegant Rug
DVD.ActiveItems[249548] = { decorID = 5559, model3D = 4317329, soldBy = {196637}, source = "vendor" } -- Augmenter's Opal Banner
DVD.ActiveItems[249549] = { decorID = 5560, model3D = 4528488, soldBy = {196637}, source = "quest" } -- Draconic Crafter's Table
DVD.ActiveItems[249824] = { decorID = 5689, model3D = 7209758, soldBy = {196637}, source = "vendor" } -- Devastator's Brazier
end

do -- 🏪 VENDOR NPC: 199605 (Evantkis)
DVD.ActiveItems[248124] = { decorID = 4180, model3D = 7134811, soldBy = {199605}, source = "achievement", noxp = true } -- The Great Hoard
end

do -- 🏪 VENDOR NPC: 209192 (Provisioner Aristta)
DVD.ActiveItems[248117] = { decorID = 4173, model3D = 4298566, soldBy = {209192}, source = "vendor" } -- Studious Dracthyr's Tomes
end

do -- 🏪 VENDOR NPC: 209220 (Ironus Coldsteel)
DVD.ActiveItems[248105] = { decorID = 4161, model3D = 3886996, soldBy = {209220}, source = "achievement", noxp = true } -- Valdrakken Sconce
end

do -- 🏪 VENDOR NPC: 210608 (Celestine of the Harvest)
DVD.ActiveItems[255673] = { decorID = 10888, model3D = 4756268, soldBy = {210608}, source = "vendor" } -- Moonclasp Satchel
end

do -- 🏪 VENDOR NPC: 216284 (Mythrin'dir)
DVD.ActiveItems[246091] = { decorID = 1989, model3D = 4871267, soldBy = {216284}, source = "vendor", noxp = true } -- Bel'ameth Crafter's Tent
DVD.ActiveItems[248759] = { decorID = 4561, model3D = 7152354, soldBy = {216284}, source = "vendor", noxp = true } -- Amirdrassil Stool
end

do -- 🏪 VENDOR NPC: 216285 (Ellandrieth)
DVD.ActiveItems[245625] = { decorID = 1834, model3D = 4690348, soldBy = {216285}, source = "vendor" } -- Bel'ameth Bench
DVD.ActiveItems[245704] = { decorID = 1888, model3D = 4690345, soldBy = {216285}, source = "vendor" } -- Bel'ameth Barrel
DVD.ActiveItems[246089] = { decorID = 1987, model3D = 4690346, soldBy = {216285}, source = "vendor" } -- Bel'ameth Wooden Table
DVD.ActiveItems[246100] = { decorID = 1990, model3D = 4196083, soldBy = {216285}, source = "vendor" } -- Small Bel'ameth Tent
DVD.ActiveItems[248401] = { decorID = 4423, model3D = 7146887, soldBy = {216285}, source = "quest", noxp = true } -- Ornamental Kaldorei Glaive
DVD.ActiveItems[251022] = { decorID = 7896, model3D = 4756256, soldBy = {216285}, source = "quest", noxp = true } -- Bel'ameth Traveler's Pack
end

do -- 🏪 VENDOR NPC: 216286 (Moon Priestess Lasara)
DVD.ActiveItems[257352] = { decorID = 11454, model3D = 4690349, soldBy = {216286}, source = "quest", noxp = true } -- Large Brazier of Elune
end

do -- 🏪 VENDOR NPC: 216888 (Samantha Buckley) 211065 (Marie Allen)
DVD.ActiveItems[245515] = { decorID = 860, model3D = 322817, soldBy = {216888, 211065}, source = "vendor" } -- Gilnean Wooden Bed
DVD.ActiveItems[245516] = { decorID = 859, model3D = 7508748, soldBy = {216888, 211065}, source = "vendor" } -- Gilnean Bench
DVD.ActiveItems[245520] = { decorID = 857, model3D = 304638, soldBy = {216888, 211065}, source = "achievement", noxp = true } -- Gilnean Celebration Keg
DVD.ActiveItems[245604] = { decorID = 1795, model3D = 6930896, soldBy = {216888, 211065}, source = "vendor" } -- Arched Rose Trellis
DVD.ActiveItems[245617] = { decorID = 1826, model3D = 304631, soldBy = {216888, 211065}, source = "vendor" } -- Gilnean Stocks
DVD.ActiveItems[258301] = { decorID = 11944, model3D = 305756, soldBy = {216888, 211065}, source = "vendor" } -- Gilnean Washing Line
end

do -- 🏪 VENDOR NPC: 217642 (Nalina Ironsong)
DVD.ActiveItems[260583] = { decorID = 14360, model3D = 4892782, soldBy = {217642}, source = "quest", noxp = true } -- Arathi Bartender's Shelves
end

do -- 🏪 VENDOR NPC: 218202 (Thripps)
DVD.ActiveItems[246866] = { decorID = 2532, model3D = 5007024, soldBy = {218202}, source = "achievement", noxp = true } -- Kaheti Scribe's Records
end

do -- 🏪 VENDOR NPC: 219318 (Jorid)
DVD.ActiveItems[246867] = { decorID = 2533, model3D = 5464689, soldBy = {219318}, source = "achievement", noxp = true } -- Tome of Earthen Directives
end

do -- 🏪 VENDOR NPC: 223728 (Auditor Balwurz)
DVD.ActiveItems[245295] = { decorID = 760, model3D = 5346791, soldBy = {223728}, source = "vendor", noxp = true } -- Literature of Dornogal
DVD.ActiveItems[245296] = { decorID = 761, model3D = 5346792, soldBy = {223728}, source = "vendor", noxp = true } -- Literature of Taelloch
DVD.ActiveItems[245297] = { decorID = 762, model3D = 5346796, soldBy = {223728}, source = "vendor", noxp = true } -- Literature of Gundargaz
DVD.ActiveItems[245561] = { decorID = 1750, model3D = 6924253, soldBy = {223728}, source = "vendor", noxp = true } -- Ornate Ochre Window
end

do -- 🏪 VENDOR NPC: 226205 (Cendvin)
DVD.ActiveItems[246707] = { decorID = 2470, model3D = 5203781, soldBy = {226205}, source = "vendor" } -- Decorative Cinder Honeypot
end

do -- 🏪 VENDOR NPC: 226994 (Blair Bass)
DVD.ActiveItems[245309] = { decorID = 1277, model3D = 5793104, soldBy = {226994}, source = "vendor" } -- Rusty Patchwork Tub
end

do -- 🏪 VENDOR NPC: 231396 (Sitch Lowdown)
DVD.ActiveItems[245307] = { decorID = 1268, model3D = 5721326, requirement = { type = "reputation", faction = "Darkfuse Solutions", rank = 3 }, soldBy = {231396}, source = "vendor"}-- Undermine Bookcase
DVD.ActiveItems[256327] = { decorID = 11127, model3D = 5689833, requirement = { type = "reputation", faction = "Darkfuse Solutions", rank = 2 }, soldBy = {231396}, source = "vendor", noxp = true } -- Open Rust-Plated Storage Crate
end

do -- 🏪 VENDOR NPC: 231405 (Boatswain Hardee)
DVD.ActiveItems[248758] = { decorID = 4560, model3D = 7152353, requirement = { type = "reputation", faction = "Blackwater Cartel", rank = 4 }, soldBy = {231405}, source = "vendor"}-- Relaxing Goblin Beach Chair with Cup Gripper
DVD.ActiveItems[255642] = { decorID = 10853, model3D = 6008895, requirement = { type = "reputation", faction = "Blackwater Cartel", rank = 3 }, soldBy = {231405}, source = "vendor"} -- Undermine Alleyway Sconce
end

do -- 🏪 VENDOR NPC: 231406 (Rocco Razzboom)
DVD.ActiveItems[245313] = { decorID = 1259, model3D = 5689816, requirement = { type = "reputation", faction = "Bilgewater Cartel", rank = 3 }, soldBy = {231406}, source = "vendor", noxp = true } -- Spring-Powered Undermine Chair
DVD.ActiveItems[255674] = { decorID = 10889, model3D = 5929384, requirement = { type = "reputation", faction = "Bilgewater Cartel", rank = 3 }, soldBy = {231406}, source = "vendor", noxp = true } -- Incontinental Table Lamp
end

do -- 🏪 VENDOR NPC: 231407 (Shredz the Scrapper)
DVD.ActiveItems[245311] = { decorID = 1269, model3D = 5721328, requirement = { type = "reputation", faction = "Venture Company", rank = 3 }, soldBy = {231407}, source = "vendor"}-- Undermine Wall Shelf
DVD.ActiveItems[255647] = { decorID = 10857, model3D = 6892785, requirement = { type = "reputation", faction = "Venture Company", rank = 4}, soldBy = {231407}, source = "vendor"} -- Spring-Powered Pointer
end

do -- 🏪 VENDOR NPC: 231408 (Lab Assistant Laszly)
DVD.ActiveItems[245321] = { decorID = 1265, model3D = 5689835, requirement = { type = "reputation", faction = "Steamwheedle Cartel", rank = 2 }, soldBy = {231408}, source = "vendor"}-- Rust-Plated Storage Barrel
DVD.ActiveItems[255641] = { decorID = 10852, model3D = 5657266, requirement = { type = "reputation", faction = "Steamwheedle Cartel", rank = 3 }, soldBy = {231408}, source = "vendor"}-- Undermine Mechanic's Hanging Lamp
end

do -- 🏪 VENDOR NPC: 235252 (Om'sirik)
DVD.ActiveItems[247751] = { decorID = 3891, model3D = 6009484, soldBy = {235252}, source = "vendor", noxp = true } -- Deactivated K'areshi Warp Cannon
DVD.ActiveItems[258306] = { decorID = 11948, model3D = 6118548, soldBy = {235252}, source = "vendor" } -- K'areshi Warp Platform
DVD.ActiveItems[258320] = { decorID = 11952, model3D = 7280689, soldBy = {235252}, source = "vendor", noxp = true } -- K'areshi Protectorate Portal
DVD.ActiveItems[258666] = { decorID = 12195, model3D = 7280639, soldBy = {235252}, source = "vendor" } -- Ethereal Pipe Segment
DVD.ActiveItems[258667] = { decorID = 12196, model3D = 7280677, soldBy = {235252}, source = "vendor" } -- Angled Ethereal Pipe Segment
DVD.ActiveItems[258668] = { decorID = 12197, model3D = 7280685, soldBy = {235252}, source = "vendor" } -- Long Ethereal Pipe Segment
DVD.ActiveItems[258669] = { decorID = 12198, model3D = 7280687, soldBy = {235252}, source = "vendor" } -- Corner Ethereal Pipe Segment
DVD.ActiveItems[258766] = { decorID = 12211, model3D = 7280678, soldBy = {235252}, source = "vendor" } -- Exposed Corner Ethereal Pipe Segment
DVD.ActiveItems[258767] = { decorID = 12212, model3D = 7280680, soldBy = {235252}, source = "vendor" } -- Exposed Long Ethereal Pipe Segment
DVD.ActiveItems[258835] = { decorID = 12217, model3D = 7280634, soldBy = {235252}, source = "vendor" } -- Exposed Intersecting Ethereal Pipe Segment
DVD.ActiveItems[258836] = { decorID = 12218, model3D = 7280686, soldBy = {235252}, source = "vendor" } -- Reinforced Corner Ethereal Pipe Segment
DVD.ActiveItems[258885] = { decorID = 12220, model3D = 7280676, soldBy = {235252}, source = "vendor" } -- Exposed Angled Ethereal Pipe Segment
end

do -- 🏪 VENDOR NPC: 235314 (Ta'sam)
DVD.ActiveItems[260582] = { decorID = 14359, model3D = 3565798, soldBy = {235314}, source = "vendor", noxp = true } -- Cartel Collector's Cage
end

do -- 🏪 VENDOR NPC: 235621 (Ando the Gat)
DVD.ActiveItems[239213] = { decorID = 828, model3D = 5929345, soldBy = {235621}, source = "vendor" } -- Well-Lit Incontinental Loveseat
DVD.ActiveItems[245302] = { decorID = 1121, model3D = 5933736, soldBy = {235621}, source = "achievement" } -- Gallagio L.U.C.K. Spinner
end

do -- 🏪 VENDOR NPC: 236861 (Cravitz Lorent Murder Row Dungeon)
DVD.ActiveItems[246857] = { decorID = 2523, model3D = 1600035, soldBy = {236861}, source = "vendor", noxp = true } -- "Shu'halo Perspective" Painting
end

do -- 🏪 VENDOR NPC: 239333 (Street Food Vendor)
DVD.ActiveItems[256328] = { decorID = 11128, model3D = 5793085, soldBy = {239333}, source = "vendor", noxp = true } -- Leftover Undermine Takeout
end

do -- 🏪 VENDOR NPC: 240279 (Magovu)
DVD.ActiveItems[256924] = { decorID = 11324, model3D = 6125166, requirement = { type = "renown", faction = "Amani Tribe", level = 15 }, soldBy = {240279}, source = "vendor"}-- Hash'ey Heartbroth Cauldron
DVD.ActiveItems[256926] = { decorID = 11326, model3D = 6125778, requirement = { type = "renown", faction = "Amani Tribe", level = 15 }, soldBy = {240279}, source = "vendor"}-- Empty Amani Cauldron
DVD.ActiveItems[256927] = { decorID = 11327, model3D = 6212420, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor"}-- Carved Idol of Nalorakk, Loa of War
DVD.ActiveItems[256933] = { decorID = 11333, model3D = 6866518, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor"}-- Carved Idol of Jan'alai, Loa of Fire
DVD.ActiveItems[256934] = { decorID = 11334, model3D = 6994813, requirement = { type = "renown", faction = "Amani Tribe", level = 15 }, soldBy = {240279}, source = "vendor"}-- Boiling Amani Cauldron
DVD.ActiveItems[258290] = { decorID = 11936, model3D = 6212418, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor"}-- Carved Idol of Halazzi, Loa of the Hunt
DVD.ActiveItems[258549] = { decorID = 12154, model3D = 6654785, requirement = { type = "renown", faction = "Amani Tribe", level = 11 }, soldBy = {240279}, source = "vendor"}-- Burning Amani Pinecone
DVD.ActiveItems[260202] = { decorID = 14204, model3D = 6866516, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"}-- Visage of Akil'zon, Loa of Victory
DVD.ActiveItems[260514] = { decorID = 14350, model3D = 6866514, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"}-- Visage of Nalorakk, Loa of War
DVD.ActiveItems[260515] = { decorID = 14351, model3D = 6866515, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"} -- Visage of Halazzi, Loa of the Hunt
DVD.ActiveItems[260516] = { decorID = 14352, model3D = 6866517, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"} -- Visage of Jan'alai, Loa of Fire
DVD.ActiveItems[263318] = { decorID = 15158, model3D = 6075565, requirement = { type = "renown", faction = "Amani Tribe", level = 3 }, soldBy = {240279}, source = "vendor"} -- Simple Amani Basket
DVD.ActiveItems[263320] = { decorID = 15160, model3D = 6075567, requirement = { type = "renown", faction = "Amani Tribe", level = 3 }, soldBy = {240279}, source = "vendor"} -- Rope-Bound Amani Basket
DVD.ActiveItems[264333] = { decorID = 15571, model3D = 6153813, requirement = { type = "renown", faction = "Amani Tribe", level = 11 }, soldBy = {240279}, source = "vendor"}-- Amani Incense Burner
DVD.ActiveItems[264350] = { decorID = 15596, model3D = 6212419, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor"}-- Carved Idol of Akil'zon, Loa of Victory
end

do -- 🏪 VENDOR NPC: 240407 (Naynar)
DVD.ActiveItems[246402] = { decorID = 2219, model3D = 6326907, soldBy = {240407}, source = "vendor" } -- Hollowed Harandar Gourds
DVD.ActiveItems[246408] = { decorID = 2225, model3D = 6326916, soldBy = {240407}, source = "vendor" } -- Haranir Herb Rack
DVD.ActiveItems[246959] = { decorID = 2588, model3D = 6225716, soldBy = {240407}, source = "vendor" } -- Sealed Fungal Jar
DVD.ActiveItems[249768] = { decorID = 5651, model3D = 6225714, soldBy = {240407}, source = "vendor" } -- Fungarian Barrel
DVD.ActiveItems[251980] = { decorID = 8916, model3D = 6225715, soldBy = {240407}, source = "vendor" } -- Fungarian Sack
DVD.ActiveItems[263019] = { decorID = 14808, model3D = 4732017, soldBy = {240407}, source = "vendor" } -- Haranir Pennant
DVD.ActiveItems[263039] = { decorID = 14825, model3D = 4905308, soldBy = {240407}, source = "vendor" } -- Harandar Flowering Lamp
DVD.ActiveItems[263194] = { decorID = 14965, model3D = 4927951, soldBy = {240407}, source = "vendor" } -- Harandar Glowvine Sconce
DVD.ActiveItems[263195] = { decorID = 14967, model3D = 5264290, soldBy = {240407}, source = "vendor" } -- Harandar Glowvine Lamppost
DVD.ActiveItems[264267] = { decorID = 15502, model3D = 6780543, soldBy = {240407}, source = "vendor" } -- Rutaani Birdfeeder
DVD.ActiveItems[264268] = { decorID = 15503, model3D = 6780544, soldBy = {240407}, source = "vendor" } -- Rutaani Birdbath
DVD.ActiveItems[264269] = { decorID = 15504, model3D = 6780545, soldBy = {240407}, source = "vendor" } -- Rutaani Bird Perch
end

do -- 🏪 VENDOR NPC: 240838 (Caeris Fairdawn)
DVD.ActiveItems[245290] = { decorID = 1198, model3D = 4235680, requirement = { type = "renown", faction = "Silvermoon Court", level = 7 }, soldBy = {240838}, source = "vendor"}-- Long Silvermoon Table
DVD.ActiveItems[245941] = { decorID = 1896, model3D = 6075053, requirement = { type = "renown", faction = "Silvermoon Court", level = 18 }, soldBy = {240838}, source = "vendor"}-- Silvermoon Sanctum Focus
DVD.ActiveItems[245985] = { decorID = 1901, model3D = 6005281, requirement = { type = "renown", faction = "Silvermoon Court", level = 15 }, soldBy = {240838}, source = "vendor"}-- Floating Azure Lantern
DVD.ActiveItems[249559] = { decorID = 5564, model3D = 6684012, requirement = { type = "renown", faction = "Silvermoon Court", level = 18 }, soldBy = {240838}, source = "vendor"}-- Reverent Sin'dorei Statue
DVD.ActiveItems[256040] = { decorID = 10944, model3D = 6005270, requirement = { type = "renown", faction = "Silvermoon Court", level = 7 }, soldBy = {240838}, source = "vendor"}-- Silvermoon Gemmed Chair
DVD.ActiveItems[257421] = { decorID = 11502, model3D = 6023435, requirement = { type = "renown", faction = "Silvermoon Court", level = 15 }, soldBy = {240838}, source = "vendor"}-- Bejeweled Silvermoon Chandelier
DVD.ActiveItems[257422] = { decorID = 11503, model3D = 6005271, requirement = { type = "renown", faction = "Silvermoon Court", level = 7 }, soldBy = {240838}, source = "vendor"}-- Gilded Sunfury Chair
DVD.ActiveItems[263205] = { decorID = 14971, model3D = 6024549, requirement = { type = "renown", faction = "Silvermoon Court", level = 3 }, soldBy = {240838}, source = "vendor"}-- Crimson Silvermoon Runner
DVD.ActiveItems[263206] = { decorID = 14972, model3D = 6024550, requirement = { type = "renown", faction = "Silvermoon Court", level = 3 }, soldBy = {240838}, source = "vendor"}-- Plum Eversong Rug
DVD.ActiveItems[263223] = { decorID = 14985, model3D = 6209639, requirement = { type = "renown", faction = "Silvermoon Court", level = 3 }, soldBy = {240838}, source = "vendor"}-- Gilded Sky-Blue Drapery
DVD.ActiveItems[263228] = { decorID = 15059, model3D = 6005266, requirement = { type = "renown", faction = "Silvermoon Court", level = 7 }, soldBy = {240838}, source = "vendor"}-- Grand Lightwood Table
DVD.ActiveItems[263229] = { decorID = 15060, model3D = 6005268, requirement = { type = "renown", faction = "Silvermoon Court", level = 7 }, soldBy = {240838}, source = "vendor"}-- Ornate Lightwood Table
DVD.ActiveItems[263232] = { decorID = 15063, model3D = 6050883, requirement = { type = "renown", faction = "Silvermoon Court", level = 11 }, soldBy = {240838}, source = "vendor"}-- Floating Spire Shelf
DVD.ActiveItems[263234] = { decorID = 15065, model3D = 6050886, requirement = { type = "renown", faction = "Silvermoon Court", level = 11 }, soldBy = {240838}, source = "vendor"}-- Turning Silvermoon Archives
DVD.ActiveItems[264264] = { decorID = 15499, model3D = 6388933, requirement = { type = "renown", faction = "Silvermoon Court", level = 15 }, soldBy = {240838}, source = "vendor"}-- Gilded Vigil Post
DVD.ActiveItems[264265] = { decorID = 15500, model3D = 6402434, requirement = { type = "renown", faction = "Silvermoon Court", level = 15 }, soldBy = {240838}, source = "vendor"}-- Sanctified Flame Lantern	
end

do -- 🏪 VENDOR NPC: 240852 (Lars Bronsmaelt)
DVD.ActiveItems[245293] = { decorID = 763, model3D = 5533958, requirement = { type = "renown", faction = "Flame's Radiance", level = 8 }, soldBy = {240852}, source = "vendor"}-- Collection of Arathi Scripture
end

do -- 🏪 VENDOR NPC: 241451 (Eriden)
DVD.ActiveItems[263998] = { decorID = 15403, model3D = 6049335, soldBy = {241451}, source = "achievement" } -- Midnight Blacksmith's Shop Sign
end

do -- 🏪 VENDOR NPC: 241453 (Yatheon)
DVD.ActiveItems[264001] = { decorID = 15406, model3D = 6049339, soldBy = {241453}, source = "achievement" } -- Midnight Engineer's Shop Sign
end

do -- 🏪 VENDOR NPC: 241928 (Chel the Chip)
DVD.ActiveItems[256923] = { decorID = 11323, model3D = 6125162, soldBy = {241928}, source = "vendor" } -- Amani Crafter's Tool Rack
DVD.ActiveItems[264249] = { decorID = 15484, model3D = 6075572, soldBy = {241928}, source = "vendor" } -- Woodblock Stool
DVD.ActiveItems[264254] = { decorID = 15489, model3D = 6212413, soldBy = {241928}, source = "vendor" } -- Three-Tier Zul'Aman Shelf
DVD.ActiveItems[264655] = { decorID = 15851, model3D = 6706733, soldBy = {241928}, source = "vendor" } -- Amani Slate Bench
end

do -- 🏪 VENDOR NPC: 242398 (Naleidea Rivergleam)
DVD.ActiveItems[246779] = { decorID = 2503, model3D = 7079626, soldBy = {242398}, source = "vendor", noxp = true } -- Hanging Mana Brazier
DVD.ActiveItems[250770] = { decorID = 7780, model3D = 6190522, soldBy = {242398}, source = "vendor", noxp = true } -- Silvermoon Privacy Screen
end

do -- 🏪 VENDOR NPC: 242399 (Telemancer Astrandis Delivers Journey)
DVD.ActiveItems[263994] = { decorID = 15399, model3D = 5838194, soldBy = {242399}, source = "vendor"} -- Fungal Chest
DVD.ActiveItems[263995] = { decorID = 15400, model3D = 5869301, soldBy = {242399}, source = "vendor"} -- Delver's Bountiful Coffer
DVD.ActiveItems[263996] = { decorID = 15401, model3D = 5975175, soldBy = {242399}, source = "vendor"} -- Twilight Tabernacle
DVD.ActiveItems[264007] = { decorID = 15412, model3D = 6210898, soldBy = {242399}, source = "vendor"} -- Corewarden's Spoils
DVD.ActiveItems[264008] = { decorID = 15413, model3D = 6730919, soldBy = {242399}, source = "vendor"} -- Root-Wrapped Reliquary
DVD.ActiveItems[264170] = { decorID = 15455, model3D = 1349621, soldBy = {242399}, source = "vendor"} -- Ancient Kaldorei Coffer
DVD.ActiveItems[264175] = { decorID = 15460, model3D = 6195763, soldBy = {242399}, source = "vendor"} -- Amani Strongbox
end

do -- 🏪 VENDOR NPC: 242723 (Apprentice Diell)
DVD.ActiveItems[263224] = { decorID = 14995, model3D = 6998409, requirement = { type = "subfaction", faction = "Magisters", tier = 5 }, soldBy = {242723}, source = "vendor"}-- Gentle Floating Planter
DVD.ActiveItems[263225] = { decorID = 15013, model3D = 7237277, requirement = { type = "subfaction", faction = "Magisters", tier = 3 }, soldBy = {242723}, source = "vendor"}-- Sunlit Glass Mirror
end

do -- 🏪 VENDOR NPC: 242724 (Ranger Allorn)
DVD.ActiveItems[263212] = { decorID = 14978, model3D = 6050842, requirement = { type = "subfaction", faction = "Farstriders", tier = 3 }, soldBy = {242724}, source = "vendor"} -- Farstrider's Comfy Cushion
DVD.ActiveItems[263216] = { decorID = 14979, model3D = 6050856, requirement = { type = "subfaction", faction = "Farstriders", tier = 5 }, soldBy = {242724}, source = "vendor"} -- Gilded Lightwood Wardrobe
end

do -- 🏪 VENDOR NPC: 242725 (Armorer Goldcrest)
DVD.ActiveItems[263203] = { decorID = 14970, model3D = 6005301, requirement = { type = "subfaction", faction = "Blood Knights", tier = 3 }, soldBy = {242725}, source = "vendor"}-- Rack of Silvermoon Arms
end

do -- 🏪 VENDOR NPC: 242726 (Neriv)
DVD.ActiveItems[246692] = { decorID = 2459, model3D = 7033299, requirement = { type = "subfaction", faction = "Shades of the Row", tier = 5 }, soldBy = {242726}, source = "vendor"}-- Murder Row Wine Decanter
DVD.ActiveItems[250772] = { decorID = 7782, model3D = 6197997, requirement = { type = "subfaction", faction = "Shades of the Row", tier = 3 }, soldBy = {242726}, source = "vendor"} -- Crimson Lightwood Privacy Screen	
end

do -- 🏪 VENDOR NPC: 243350 (Lyna)
DVD.ActiveItems[264000] = { decorID = 15405, model3D = 6049337, soldBy = {243350}, source = "achievement" } -- Midnight Enchanter's Shop Sign
end

do -- 🏪 VENDOR NPC: 243353 (Deynna)
DVD.ActiveItems[264174] = { decorID = 15459, model3D = 6049357, soldBy = {243353}, source = "achievement" } -- Midnight Tailor's Shop Sign
end

do -- 🏪 VENDOR NPC: 243359 (Melaris)
DVD.ActiveItems[263997] = { decorID = 15402, model3D = 6049331, soldBy = {243359}, source = "achievement" } -- Midnight Alchemist's Shop Sign
end

do -- 🏪 VENDOR NPC: 243555 (Lelorian)
DVD.ActiveItems[264004] = { decorID = 15409, model3D = 6049345, soldBy = {243555}, source = "achievement" } -- Midnight Scribe's Shop Sign
end

do -- 🏪 VENDOR NPC: 246721 (Janey Forrest)
DVD.ActiveItems[252390] = { decorID = 9039, model3D = 1602481, soldBy = {246721}, source = "vendor" } -- Small Hull'n'Home Table
DVD.ActiveItems[252391] = { decorID = 9040, model3D = 1602482, soldBy = {246721}, source = "vendor" } -- Large Hull'n'Home Table
DVD.ActiveItems[252393] = { decorID = 9042, model3D = 1602484, soldBy = {246721}, source = "vendor" } -- Hull'n'Home Dresser
DVD.ActiveItems[252404] = { decorID = 9053, model3D = 1907403, soldBy = {246721}, source = "vendor" } -- Hull'n'Home Chair
DVD.ActiveItems[258765] = { decorID = 12210, model3D = 1668010, soldBy = {246721}, source = "vendor" } -- Hull'n'Home Window
end

do -- 🏪 VENDOR NPC: 248328 (Void Researcher Anomander)
DVD.ActiveItems[248964] = { decorID = 5132, model3D = 6885568, requirement = { type = "renown", faction = "The Singularity", level =  3 }, soldBy = {248328}, source = "vendor"} -- Cosmic Void Table
DVD.ActiveItems[262462] = { decorID = 14592, model3D = 6700986, requirement = { type = "renown", faction = "The Singularity", level = 8 }, soldBy = {248328}, source = "vendor"} -- Dark Void Inkwell
DVD.ActiveItems[262463] = { decorID = 14593, model3D = 6700988, requirement = { type = "renown", faction = "The Singularity", level = 12 }, soldBy = {248328}, source = "vendor"} --Cosmic Void Ashwell
DVD.ActiveItems[262466] = { decorID = 14596, model3D = 6700998, requirement = { type = "renown", faction = "The Singularity", level = 8 }, soldBy = {248328}, source = "vendor"}-- Void Elf Table
DVD.ActiveItems[262473] = { decorID = 14603, model3D = 7412673, requirement = { type = "renown", faction = "The Singularity", level = 5 }, soldBy = {248328}, source = "vendor"}-- Cosmic Chalice
DVD.ActiveItems[262607] = { decorID = 14632, model3D = 6701000, requirement = { type = "renown", faction = "The Singularity", level = 3 }, soldBy = {248328}, source = "vendor"}-- Void Elf Throne
DVD.ActiveItems[262609] = { decorID = 14634, model3D = 6701006, requirement = { type = "renown", faction = "The Singularity", level = 12 }, soldBy = {248328}, source = "vendor"}-- Void Elf Floating Lantern
DVD.ActiveItems[263499] = { decorID = 15260, model3D = 6701009, requirement = { type = "renown", faction = "The Singularity", level = 5 }, soldBy = {248328}, source = "vendor"}-- Sturdy Void Elf Trunk
DVD.ActiveItems[264337] = { decorID = 15575, model3D = 6210899, requirement = { type = "renown", faction = "The Singularity", level = 18 }, soldBy = {248328}, source = "vendor"}-- Cosmic Void Training Dummy
DVD.ActiveItems[264339] = { decorID = 15578, model3D = 6224354, requirement = { type = "renown", faction = "The Singularity", level = 18 }, soldBy = {248328}, source = "vendor"}-- Cosmic Void Summoning Crystal
DVD.ActiveItems[264341] = { decorID = 15581, model3D = 6391991, requirement = { type = "renown", faction = "The Singularity", level = 18 }, soldBy = {248328}, source = "vendor"}-- Cosmic Void Crate
DVD.ActiveItems[264344] = { decorID = 15584, model3D = 7141588, requirement = { type = "renown", faction = "The Singularity", level = 8 }, soldBy = {248328}, source = "vendor"}-- Cosmic Void Orb
DVD.ActiveItems[264351] = { decorID = 15597, model3D = 6700981, requirement = { type = "renown", faction = "The Singularity", level = 12 }, soldBy = {248328}, source = "vendor"} -- Ornate Cosmic Banner
DVD.ActiveItems[264509] = { decorID = 15769, model3D = 6701015, requirement = { type = "renown", faction = "The Singularity", level = 5 }, soldBy = {248328}, source = "vendor"}-- Void Elf Barrel
end

do -- 🏪 VENDOR NPC: 248525 (Pascal-K1N6)
DVD.ActiveItems[254400] = { decorID = 10339, model3D = 2261833, soldBy = {248525}, source = "vendor", noxp = true } -- Triple-Tested Steam Valve
DVD.ActiveItems[254401] = { decorID = 10340, model3D = 2439478, soldBy = {248525}, source = "vendor", noxp = true } -- Mad Science Blueprints
DVD.ActiveItems[254402] = { decorID = 10341, model3D = 2439523, soldBy = {248525}, source = "vendor", noxp = true } -- Safety Electrical Cabling
DVD.ActiveItems[254403] = { decorID = 10342, model3D = 2628252, soldBy = {248525}, source = "vendor", noxp = true } -- Mechagon Control Console
DVD.ActiveItems[254404] = { decorID = 10343, model3D = 2745101, soldBy = {248525}, source = "vendor", noxp = true } -- Sticky Lever
DVD.ActiveItems[254405] = { decorID = 10344, model3D = 2745103, soldBy = {248525}, source = "vendor", noxp = true } -- Dual-Action Turbo Pro Lever
DVD.ActiveItems[254406] = { decorID = 10345, model3D = 2745104, soldBy = {248525}, source = "vendor", noxp = true } -- Mechanical Gauge
DVD.ActiveItems[254407] = { decorID = 10346, model3D = 2745105, soldBy = {248525}, source = "vendor", noxp = true } -- Dual Mechanical Gauge
DVD.ActiveItems[254408] = { decorID = 10347, model3D = 2745106, soldBy = {248525}, source = "vendor", noxp = true } -- Lively Pistons
DVD.ActiveItems[254409] = { decorID = 10348, model3D = 2764153, soldBy = {248525}, source = "vendor", noxp = true } -- Sturdy Drive Belt
DVD.ActiveItems[254410] = { decorID = 10349, model3D = 2765485, soldBy = {248525}, source = "vendor", noxp = true } -- Blue-Glo Lantern
DVD.ActiveItems[254411] = { decorID = 10350, model3D = 2766212, soldBy = {248525}, source = "vendor", noxp = true } -- Z-205 Mechanical Device
DVD.ActiveItems[254412] = { decorID = 10351, model3D = 2816646, soldBy = {248525}, source = "vendor", noxp = true } -- Well-Oiled Machine Cog
DVD.ActiveItems[254413] = { decorID = 10352, model3D = 2903633, soldBy = {248525}, source = "vendor", noxp = true } -- Jury-Rigged Electrical Couple
DVD.ActiveItems[254415] = { decorID = 10354, model3D = 2932044, soldBy = {248525}, source = "vendor", noxp = true } -- Miniature Charging Station
DVD.ActiveItems[254416] = { decorID = 10355, model3D = 3279745, soldBy = {248525}, source = "vendor", noxp = true } -- Galvanic Storage and Maintenance Device
DVD.ActiveItems[254766] = { decorID = 10537, model3D = 2958572, soldBy = {248525}, source = "vendor", noxp = true } -- Ineffective Mechanical Privacy Screen
end

do -- 🏪 VENDOR NPC: 248594 (Sundries Merchant)
DVD.ActiveItems[244654] = { decorID = 1444, model3D = 1361687, requirement = { type = "reputation", faction = "The Nightfallen", rank = 2 }, soldBy = {248594}, source = "vendor"}-- Small Purple Suramar Seat Cushion
DVD.ActiveItems[244676] = { decorID = 1464, model3D = 1361698, requirement = { type = "reputation", faction = "The Nightfallen", rank = 3 }, soldBy = {248594}, source = "vendor"}-- Teal Suramar Seat Cushion
DVD.ActiveItems[244677] = { decorID = 1465, model3D = 1361699, requirement = { type = "reputation", faction = "The Nightfallen", rank = 4 }, soldBy = {248594}, source = "vendor"} -- Purple Suramar Seat Cushion
DVD.ActiveItems[244678] = { decorID = 1466, model3D = 1390429, requirement = { type = "reputation", faction = "The Nightfallen", rank = 2 }, soldBy = {248594}, source = "vendor"}-- Small Red Suramar Seat Cushion
DVD.ActiveItems[246001] = { decorID = 1919, model3D = 1390430, requirement = { type = "reputation", faction = "The Nightfallen", rank = 3 }, soldBy = {248594}, source = "vendor"}-- Orange Suramar Seat Cushion
DVD.ActiveItems[246002] = { decorID = 1920, model3D = 1390431, requirement = { type = "reputation", faction = "The Nightfallen", rank = 4 }, soldBy = {248594}, source = "vendor"}-- Red Suramar Seat Cushion
end

do -- 🏪 VENDOR NPC: 249684 (Brother Dovetail)
DVD.ActiveItems[246686] = { decorID = 2453, model3D = 579120, soldBy = {249684}, source = "vendor", noxp = true } -- Grummle Sleeping Bag
DVD.ActiveItems[246741] = { decorID = 2495, model3D = 579122, soldBy = {249684}, source = "vendor", noxp = true } -- Grummle Bedroll
DVD.ActiveItems[246838] = { decorID = 2510, model3D = 1305131, soldBy = {249684}, source = "vendor", noxp = true } -- Kafa Press
DVD.ActiveItems[248402] = { decorID = 4424, model3D = 532503, soldBy = {249684}, source = "vendor", noxp = true } -- Grummle Kafa Refinery
DVD.ActiveItems[248403] = { decorID = 4425, model3D = 577606, soldBy = {249684}, source = "vendor", noxp = true } -- Grummle Tent
DVD.ActiveItems[248405] = { decorID = 4427, model3D = 1305118, soldBy = {249684}, source = "vendor", noxp = true } -- Kafa Creamer
DVD.ActiveItems[248406] = { decorID = 4428, model3D = 1305132, soldBy = {249684}, source = "vendor", noxp = true } -- Legerdemain Lounge Sign Board
DVD.ActiveItems[248407] = { decorID = 4429, model3D = 1400889, soldBy = {249684}, source = "vendor", noxp = true } -- Dalaran Kafa Table
DVD.ActiveItems[251472] = { decorID = 8179, model3D = 523264, soldBy = {249684}, source = "vendor", noxp = true } -- Pandaren Wooden Cart
DVD.ActiveItems[251473] = { decorID = 8180, model3D = 970083, soldBy = {249684}, source = "vendor", noxp = true } -- Commander's Kafa Mug
DVD.ActiveItems[251474] = { decorID = 8181, model3D = 1305117, soldBy = {249684}, source = "vendor", noxp = true } -- Ceramic Kafa Mug
DVD.ActiveItems[251475] = { decorID = 8182, model3D = 1305134, soldBy = {249684}, source = "vendor", noxp = true } -- Dalaran Kafa Grinder
DVD.ActiveItems[252039] = { decorID = 8987, model3D = 1305114, soldBy = {249684}, source = "vendor", noxp = true } -- Open Sack of Roasted Kafa
DVD.ActiveItems[252040] = { decorID = 8988, model3D = 1305115, soldBy = {249684}, source = "vendor", noxp = true } -- Sealed Sack of Roasted Kafa
DVD.ActiveItems[252041] = { decorID = 8989, model3D = 1305133, soldBy = {249684}, source = "vendor", noxp = true } -- Dalaran Espresso Machine
end

do -- 🏪 VENDOR NPC: 250820 (Hordranin 12)
DVD.ActiveItems[250627] = { decorID = 7668, model3D = 4254398, soldBy = {250820}, source = "vendor", noxp = true } -- Forbidden Fork
DVD.ActiveItems[250694] = { decorID = 7691, model3D = 4095168, soldBy = {250820}, source = "vendor" } -- Draconic Metalshaper's Anvil
DVD.ActiveItems[250695] = { decorID = 7692, model3D = 4095171, soldBy = {250820}, source = "vendor" } -- Replica Grathardormu's Hammer
DVD.ActiveItems[250696] = { decorID = 7693, model3D = 4186848, soldBy = {250820}, source = "vendor", noxp = true } -- Green Thumb's Watering Can
DVD.ActiveItems[250697] = { decorID = 7694, model3D = 4420697, soldBy = {250820}, source = "vendor" } -- Draconic Auctioneer's Lectern
DVD.ActiveItems[250698] = { decorID = 7695, model3D = 4495212, soldBy = {250820}, source = "vendor", noxp = true } -- Obsidian Warder Pennant
DVD.ActiveItems[250699] = { decorID = 7696, model3D = 4495213, soldBy = {250820}, source = "vendor", noxp = true } -- Dark Talon Pennant
DVD.ActiveItems[250700] = { decorID = 7697, model3D = 4500571, soldBy = {250820}, source = "vendor", noxp = true } -- Roasted Ram Leg
DVD.ActiveItems[250701] = { decorID = 7698, model3D = 4543421, soldBy = {250820}, source = "vendor", noxp = true } -- Draconic Trader's Cart
DVD.ActiveItems[250702] = { decorID = 7699, model3D = 4551438, soldBy = {250820}, source = "vendor", noxp = true } -- Artisan's Measuring Scales
DVD.ActiveItems[250703] = { decorID = 7700, model3D = 4563732, soldBy = {250820}, source = "vendor", noxp = true } -- War Creche Teaching Crystal
DVD.ActiveItems[250704] = { decorID = 7701, model3D = 4572369, soldBy = {250820}, source = "vendor" } -- Ancient Weyrn Device
end

do -- 🏪 VENDOR NPC: 250982 (Dethelin) Pre Midnight Event Vendor
DVD.ActiveItems[245284] = { decorID = 714, model3D = 4235683, soldBy = {250982}, source = "vendor", noxp = true } -- Silvermoon Wooden Chair
DVD.ActiveItems[245330] = { decorID = 1236, model3D = 6431404, soldBy = {250982}, source = "vendor", noxp = true } -- Enchanted Blood Elven Candelabra
DVD.ActiveItems[251997] = { decorID = 1227, model3D = 6025947, soldBy = {250982}, source = "vendor", noxp = true } -- Sin'dorei Winged Chaise
end

do -- 🏪 VENDOR NPC: 251091 (Nael Silvertongue)
DVD.ActiveItems[257418] = { decorID = 11499, model3D = 6210870, soldBy = {251091}, source = "quest"} -- Ornate Sin'dorei Sconce
end

do -- 🏪 VENDOR NPC: 251259 (Mothkeeper Wew'tam)
DVD.ActiveItems[263038] = { decorID = 14824, model3D = 4899957, soldBy = {251259}, source = "quest"} -- Haranir Reclined Bed
DVD.ActiveItems[264243] = { decorID = 15478, model3D = 5161737, soldBy = {251259}, source = "quest"} -- Firm Haranir Pillow
DVD.ActiveItems[264245] = { decorID = 15480, model3D = 5161741, soldBy = {251259}, source = "quest"} -- Warm Haranir Blanket
end

do -- 🏪 VENDOR NPC: 251911 (Stacks Topskimmer) 231409 (Smaks Topskimmer)
DVD.ActiveItems[243312] = { decorID = 1258, model3D = 5689815, soldBy = {231409, 251911}, source = "vendor" } -- Undermine Rectangular Table
DVD.ActiveItems[245314] = { decorID = 1257, model3D = 5689813, soldBy = {231409, 251911}, source = "vendor" } -- Undermine Round Table
DVD.ActiveItems[245318] = { decorID = 1263, model3D = 5689825, soldBy = {231409, 251911}, source = "vendor" } -- Undermine Fence
DVD.ActiveItems[245319] = { decorID = 1262, model3D = 5689824, soldBy = {231409, 251911}, source = "vendor" } -- Undermine Fencepost
DVD.ActiveItems[243321] = { decorID = 1267, model3D = 5700691, soldBy = {251911}, source = "quest", noxp = true } -- Cartel Head's Schmancy Desk
DVD.ActiveItems[245303] = { decorID = 827, model3D = 5900860, soldBy = {251911}, source = "quest", noxp = true } -- Rocket-Unpowered Rocket
DVD.ActiveItems[245306] = { decorID = 825, model3D = 5793099, soldBy = {251911}, source = "quest", noxp = true } -- Cozy Four-Pipe Bed
DVD.ActiveItems[245308] = { decorID = 1274, model3D = 5793083, soldBy = {251911}, source = "quest", noxp = true } -- "Elegant" Lawn Flamingo
DVD.ActiveItems[245310] = { decorID = 1276, model3D = 5793102, soldBy = {251911}, source = "quest", noxp = true } -- Reinforced Goblin Umbrella
DVD.ActiveItems[245324] = { decorID = 1271, model3D = 5788117, soldBy = {251911}, source = "achievement", noxp = true } -- Rocket-Powered Fountain
DVD.ActiveItems[245325] = { decorID = 1266, model3D = 5689844, soldBy = {251911}, source = "quest", noxp = true } -- Undermine Market Stall
DVD.ActiveItems[257353] = { decorID = 11455, model3D = 5160932, soldBy = {251911}, source = "achievement", noxp = true } -- Drained Dark Heart of Galakrond
DVD.ActiveItems[260700] = { decorID = 14381, model3D = 5689810, soldBy = {251911}, source = "quest", noxp = true } -- Gob-chanical Trash Heap
end

do -- 🏪 VENDOR NPC: 251921 (Arcanist Peroleth)
DVD.ActiveItems[239606] = { decorID = 865, model3D = 2620663, soldBy = {251921}, source = "quest", noxp = true } -- Forsaken Round Rug
DVD.ActiveItems[241062] = { decorID = 944, model3D = 2620664, soldBy = {251921}, source = "achievement", noxp = true } -- Lordaeron Rectangular Rug
DVD.ActiveItems[245463] = { decorID = 838, model3D = 2341255, soldBy = {251921}, source = "achievement", noxp = true } -- Lordaeron Banded Barrel
DVD.ActiveItems[245465] = { decorID = 863, model3D = 2341259, soldBy = {251921}, source = "quest", noxp = true } -- Tirisfal Wooden Chair
DVD.ActiveItems[245466] = { decorID = 864, model3D = 2341260, soldBy = {251921}, source = "quest", noxp = true } -- Forsaken Spiked Chair
DVD.ActiveItems[245467] = { decorID = 837, model3D = 2341251, soldBy = {251921}, source = "achievement", noxp = true } -- Lordaeron Banded Crate
DVD.ActiveItems[245469] = { decorID = 934, model3D = 2353882, soldBy = {251921}, source = "quest", noxp = true } -- Lordaeron Lantern
DVD.ActiveItems[245470] = { decorID = 936, model3D = 2470997, soldBy = {251921}, source = "quest", noxp = true } -- Lordaeron Hanging Lantern
DVD.ActiveItems[245473] = { decorID = 862, model3D = 2341256, soldBy = {251921}, source = "quest", noxp = true } -- Forsaken Studded Table
DVD.ActiveItems[245475] = { decorID = 935, model3D = 2445708, soldBy = {251921}, source = "quest", noxp = true } -- Forsaken Long Table
DVD.ActiveItems[245483] = { decorID = 933, model3D = 2351848, soldBy = {251921}, source = "achievement", noxp = true } -- Lordaeron Spiked Weapon Rack
DVD.ActiveItems[245478] = { decorID = 941, model3D = 2503603, requirement = { type = "reputation", faction = "The Honorbound", rank = 3 }, soldBy = {251921}, source = "vendor"}-- Lordaeron Sconce
DVD.ActiveItems[245479] = { decorID = 942, model3D = 2510482, requirement = { type = "reputation", faction = "The Honorbound", rank = 4 }, soldBy = {251921}, source = "vendor"}-- Blightfire Sconce
DVD.ActiveItems[245480] = { decorID = 945, model3D = 2622608, requirement = { type = "reputation", faction = "The Honorbound", rank = 3 }, soldBy = {251921}, source = "vendor"}-- Lordaeron Torch
DVD.ActiveItems[245481] = { decorID = 946, model3D = 2622609, requirement = { type = "reputation", faction = "The Honorbound", rank = 4 }, soldBy = {251921}, source = "vendor"}-- Blightfire Torch
end

do -- 🏪 VENDOR NPC: 252043 (Halenthos Brightstride)
DVD.ActiveItems[245411] = { decorID = 947, model3D = 6431407, soldBy = {252043}, source = "quest", noxp = true } -- Dark Ship's Lantern
DVD.ActiveItems[253251] = { decorID = 9267, model3D = 1598111, soldBy = {252043}, source = "quest", noxp = true } -- Blightfire Candle
end

do -- 🏪 VENDOR NPC: 252312 (Second Chair Pawdo)
DVD.ActiveItems[245259] = { decorID = 1693, model3D = 1096761, soldBy = {252312}, source = "quest", noxp = true } -- Small Val'sharah Bookcase
DVD.ActiveItems[245655] = { decorID = 1861, model3D = 1114215, soldBy = {252312, 216285}, source = "vendor", noxp = true } -- Filigree Moon Lamp
DVD.ActiveItems[246487] = { decorID = 2330, model3D = 6699745, soldBy = {252312}, source = "quest", noxp = true } -- Gnomish Tesla Coil
DVD.ActiveItems[246601] = { decorID = 2433, model3D = 1842737, soldBy = {252312}, source = "vendor", noxp = true } -- Bolt Chair
DVD.ActiveItems[247908] = { decorID = 4022, model3D = 1309258, soldBy = {252312}, source = "vendor", noxp = true } -- Nightborne Lantern
DVD.ActiveItems[247915] = { decorID = 4029, model3D = 1361710, soldBy = {252312}, source = "quest", noxp = true } -- Square Suramar Table
DVD.ActiveItems[248116] = { decorID = 4172, model3D = 4290181, soldBy = {252312}, source = "quest", noxp = true } -- Valdrakken Chandelier
DVD.ActiveItems[248934] = { decorID = 5111, model3D = 629723, soldBy = {252312}, source = "treasure", noxp = true } -- Golden Cloud Serpent Treasure Chest
DVD.ActiveItems[253168] = { decorID = 9242, model3D = 5015161, soldBy = {252312}, source = "vendor", noxp = true } -- Earthen Storage Crate
DVD.ActiveItems[253173] = { decorID = 9247, model3D = 7262874, soldBy = {252312}, source = "quest", noxp = true } -- Meadery Storage Barrel
DVD.ActiveItems[256168] = { decorID = 10962, model3D = 4075131, soldBy = {252312}, source = "vendor", noxp = true } -- Draconic Sconce
end

do -- 🏪 VENDOR NPC: 252313 (Caspian)
DVD.ActiveItems[245984] = { decorID = 1900, model3D = 6988296, soldBy = {252313}, source = "quest", noxp = true } -- Sagehold Window
DVD.ActiveItems[252395] = { decorID = 9044, model3D = 1709395, soldBy = {252313}, source = "quest", noxp = true } -- Brennadam Coop
DVD.ActiveItems[252394] = { decorID = 9043, model3D = 1602487, requirement = { type = "reputation", faction = "Storm's Wake", rank = 4 }, soldBy = {252313}, source = "vendor"}-- Bowhull Bookcase
DVD.ActiveItems[252396] = { decorID = 9045, model3D = 1711709, requirement = { type = "reputation", faction = "Storm's Wake", rank = 2 }, soldBy = {252313}, source = "vendor"}-- Admiralty's Copper Lantern
DVD.ActiveItems[252398] = { decorID = 9047, model3D = 1800789, requirement = { type = "reputation", faction = "Storm's Wake", rank = 3 }, soldBy = {252313}, source = "vendor"}-- Stormsong Water Pump
DVD.ActiveItems[252652] = { decorID = 9139, model3D = 1801975, requirement = { type = "reputation", faction = "Storm's Wake", rank = 4 }, soldBy = {252313}, source = "vendor"}-- Copper Stormsong Well
DVD.ActiveItems[252655] = { decorID = 9142, model3D = 7301013, soldBy = {252313}, source = "quest", noxp = true } -- Copper Tidesage's Sconce
end

do -- 🏪 VENDOR NPC: 252316 (Delphine)
DVD.ActiveItems[252392] = { decorID = 9041, model3D = 1602483, soldBy = {252316}, source = "quest", noxp = true } -- Admiral's Chandelier
DVD.ActiveItems[252405] = { decorID = 9054, model3D = 1939942, soldBy = {252316}, source = "vendor" } -- Admiral's Low-Hanging Chandelier
end

do -- 🏪 VENDOR NPC: 252326 (T'lama)
DVD.ActiveItems[244325] = { decorID = 1417, model3D = 6877808, soldBy = {252326}, source = "achievement", noxp = true } -- Zuldazar Cook's Griddle
DVD.ActiveItems[244326] = { decorID = 1418, model3D = 6877810, soldBy = {252326}, source = "achievement", noxp = true } -- Zandalari Wall Shelf
DVD.ActiveItems[245263] = { decorID = 1697, model3D = 1707340, soldBy = {252326}, source = "quest", noxp = true } -- Zocalo Drinks
DVD.ActiveItems[245417] = { decorID = 1310, model3D = 6877803, soldBy = {252326}, source = "quest", noxp = true } -- Akunda the Tapestry
DVD.ActiveItems[245485] = { decorID = 1205, model3D = 2098556, soldBy = {252326}, source = "quest", noxp = true } -- Golden Zandalari Bed
DVD.ActiveItems[245486] = { decorID = 1193, model3D = 1597478, soldBy = {252326}, source = "quest", noxp = true } -- Tired Troll's Bench
DVD.ActiveItems[245487] = { decorID = 1175, model3D = 1597477, soldBy = {252326}, source = "achievement", noxp = true } -- Bookcase of Gonk
DVD.ActiveItems[245489] = { decorID = 1192, model3D = 1597479, soldBy = {252326}, source = "quest", noxp = true } -- Zuldazar Stool
DVD.ActiveItems[245490] = { decorID = 1191, model3D = 1696757, soldBy = {252326}, source = "achievement", noxp = true } -- Dazar'alor Forge
DVD.ActiveItems[245491] = { decorID = 1179, model3D = 1661034, soldBy = {252326}, source = "quest", noxp = true } -- Bwonsamdi's Golden Gong
DVD.ActiveItems[245493] = { decorID = 1196, model3D = 1888157, soldBy = {252326}, source = "quest", noxp = true } -- Idol of Rezan, Loa of Kings
DVD.ActiveItems[245494] = { decorID = 1185, model3D = 1922339, soldBy = {252326}, source = "achievement", noxp = true } -- Idol of Pa'ku, Master of Winds
DVD.ActiveItems[245497] = { decorID = 1188, model3D = 2432865, soldBy = {252326}, source = "achievement", noxp = true } -- Golden Loa's Altar
DVD.ActiveItems[245522] = { decorID = 1183, model3D = 7555186, soldBy = {252326}, source = "achievement", noxp = true } -- Grand Mask of Bwonsamdi, Loa of Graves
DVD.ActiveItems[256919] = { decorID = 11319, model3D = 668856, requirement = { type = "reputation", faction = "Zandalari Empire", rank = 4}, soldBy = {252326}, source = "vendor"}-- Zandalari War Chandelier
DVD.ActiveItems[257399] = { decorID = 11489, model3D = 668854, requirement = { type = "reputation", faction = "Zandalari Empire", rank = 4 }, soldBy = {252326}, source = "vendor"}-- Zandalari War Brazier	
DVD.ActiveItems[245521] = { decorID = 1189, model3D = 792633, requirement = { type = "reputation", faction = "Zandalari Empire", rank = 2 }, soldBy = {252326}, source = "vendor"}-- Stone Zandalari Lamp
DVD.ActiveItems[243113] = { decorID = 1180, model3D = 1590846, requirement = { type = "reputation", faction = "Zandalari Empire", rank = 3 }, soldBy = {252326}, source = "vendor"}-- Blue Dazar'alor Rug
DVD.ActiveItems[243130] = { decorID = 1197, model3D = 1597757, requirement = { type = "reputation", faction = "Zandalari Empire", rank = 3 }, soldBy = {252326}, source = "vendor"}-- Zandalari Weapon Rack
end

do -- 🏪 VENDOR NPC: 252345 (Pearl Barlow)
DVD.ActiveItems[245271] = { decorID = 1704, model3D = 6905476, soldBy = {252345}, source = "achievement", noxp = true } -- Old Salt's Fireplace
DVD.ActiveItems[252386] = { decorID = 9035, model3D = 1602427, soldBy = {252345}, source = "quest", noxp = true } -- Admiralty's Upholstered Chair
DVD.ActiveItems[252400] = { decorID = 9049, model3D = 1852941, soldBy = {252345}, source = "quest", noxp = true } -- Tiragarde Emblem
DVD.ActiveItems[252403] = { decorID = 9052, model3D = 1852975, soldBy = {252345}, source = "quest", noxp = true } -- Admiral's Bed
DVD.ActiveItems[252406] = { decorID = 9055, model3D = 2023436, soldBy = {252345}, source = "quest", noxp = true } -- Green Boralus Market Tent
DVD.ActiveItems[252653] = { decorID = 9140, model3D = 7301003, soldBy = {252345}, source = "achievement", noxp = true } -- Tiragarde Treasure Chest
DVD.ActiveItems[252654] = { decorID = 9141, model3D = 7301012, soldBy = {252345}, source = "achievement", noxp = true } -- Proudmoore Green Drape
DVD.ActiveItems[252754] = { decorID = 9166, model3D = 1887706, soldBy = {252345}, source = "quest", noxp = true } -- Seaworthy Boralus Bell

end

do -- 🏪 VENDOR NPC: 252498 (Corbin Branbell)
DVD.ActiveItems[245615] = { decorID = 1801, model3D = 6930894, soldBy = {252498}, source = "quest", noxp = true } -- Bradensbrook Smoke Lantern
DVD.ActiveItems[245616] = { decorID = 1802, model3D = 6930897, soldBy = {252498}, source = "quest", noxp = true } -- Bradensbrook Thorned Well
end

do -- 🏪 VENDOR NPC: 252605 (Aeeshna)
DVD.ActiveItems[262664] = { decorID = 14677, model3D = 5916219, soldBy = {252605}, source = "vendor", noxp = true } -- Complete Guide to K'areshi Wrappings, Vol. 11
DVD.ActiveItems[262665] = { decorID = 14678, model3D = 6380241, soldBy = {252605}, source = "vendor", noxp = true } -- K'areshi Holo-Crystal Projector
DVD.ActiveItems[262666] = { decorID = 14679, model3D = 6380243, soldBy = {252605}, source = "vendor", noxp = true } -- K'areshi Incense Burner
DVD.ActiveItems[262667] = { decorID = 14680, model3D = 6380244, soldBy = {252605}, source = "vendor", noxp = true } -- Oath Scale
DVD.ActiveItems[262884] = { decorID = 14793, model3D = 5916223, soldBy = {252605}, source = "vendor", noxp = true } -- Consortium Glowpost
DVD.ActiveItems[262907] = { decorID = 14800, model3D = 6323399, soldBy = {252605}, source = "vendor", noxp = true } -- Tazaveshi Hookah
DVD.ActiveItems[263043] = { decorID = 14829, model3D = 192556, soldBy = {252605}, source = "vendor", noxp = true } -- Consortium Energy Barrel
DVD.ActiveItems[263044] = { decorID = 14830, model3D = 192557, soldBy = {252605}, source = "vendor", noxp = true } -- Empty Consortium Energy Barrel
DVD.ActiveItems[263045] = { decorID = 14831, model3D = 192562, soldBy = {252605}, source = "vendor", noxp = true } -- Consortium Energy Collector
DVD.ActiveItems[263046] = { decorID = 14832, model3D = 192563, soldBy = {252605}, source = "vendor", noxp = true } -- Consortium Energy Crate
DVD.ActiveItems[263047] = { decorID = 14833, model3D = 192564, soldBy = {252605}, source = "vendor", noxp = true } -- Empty Consortium Energy Crate
DVD.ActiveItems[263048] = { decorID = 14834, model3D = 192576, soldBy = {252605}, source = "vendor", noxp = true } -- Consortium Energy Banner
end

do -- 🏪 VENDOR NPC: 252873 (Morta Gage)
DVD.ActiveItems[253174] = { decorID = 9248, model3D = 305201, soldBy = {252873}, source = "quest" } -- Dried Gilnean Roses
DVD.ActiveItems[253175] = { decorID = 9249, model3D = 651497, soldBy = {252873}, source = "quest" } -- Hyjal Climbing Vine
DVD.ActiveItems[253176] = { decorID = 9250, model3D = 774267, soldBy = {252873}, source = "quest" } -- Ancient Zandalari Ritual Scroll
DVD.ActiveItems[253177] = { decorID = 9251, model3D = 1327768, soldBy = {252873}, source = "quest" } -- Pylon Fragment
DVD.ActiveItems[253178] = { decorID = 9252, model3D = 1383910, soldBy = {252873}, source = "quest" } -- Inactive Filigree Moon Lamp
DVD.ActiveItems[253179] = { decorID = 9253, model3D = 1611709, soldBy = {252873}, source = "quest" } -- Ornamental Proudmoore Anchor
DVD.ActiveItems[253542] = { decorID = 9439, model3D = 874421, soldBy = {252873}, source = "quest" } -- Scarred Orcish Spear
DVD.ActiveItems[253543] = { decorID = 9440, model3D = 902697, soldBy = {252873}, source = "quest" } -- Clefthoof Hide Rug
DVD.ActiveItems[253544] = { decorID = 9441, model3D = 985164, soldBy = {252873}, source = "quest" } -- Weathered History of the Warchiefs
DVD.ActiveItems[253598] = { decorID = 9475, model3D = 194802, soldBy = {252873}, source = "quest" } -- Banner of the Ebon Blade
DVD.ActiveItems[253700] = { decorID = 9624, model3D = 1674723, soldBy = {252873}, source = "quest" } -- Sandy Vulpera Banner
DVD.ActiveItems[269316] = { decorID = 20679, model3D = 7696290, soldBy = {252873}, source = "vendor"} -- Bartender Bob's "No Weapons Allowed" Rack
end

do -- 🏪 VENDOR NPC: 252887 (Chert) 221390 (Waxmonger Squick)
DVD.ActiveItems[253020] = { decorID = 9178, model3D = 4860701, soldBy = {252887}, source = "quest", noxp = true } -- Earthen Etched Throne
DVD.ActiveItems[253040] = { decorID = 9188, model3D = 5248936, soldBy = {252887}, source = "quest", noxp = true } -- Coreway Sentinel Lamppost
DVD.ActiveItems[253162] = { decorID = 9236, model3D = 4860710, soldBy = {221390, 252887}, source = "vendor", noxp = true } -- Earthen Chain Wall Shelf
DVD.ActiveItems[253172] = { decorID = 9246, model3D = 7262833, soldBy = {252887}, source = "quest", noxp = true } -- Gundargaz Grand Keg
end

do -- 🏪 VENDOR NPC: 252901 (Cinnabar)
DVD.ActiveItems[253021] = { decorID = 9179, model3D = 4896177, soldBy = {252901}, source = "quest", noxp = true } -- Freywold Bench
DVD.ActiveItems[253035] = { decorID = 9183, model3D = 4896174, soldBy = {252901}, source = "quest", noxp = true } -- Freywold Seat
DVD.ActiveItems[253166] = { decorID = 9240, model3D = 4906199, soldBy = {252901}, source = "quest", noxp = true } -- Freywold Fountain
end

do -- 🏪 VENDOR NPC: 252910 (Garnett)
DVD.ActiveItems[252756] = { decorID = 9168, model3D = 5335168, soldBy = {252910}, source = "quest", noxp = true } -- Stonelight Countertop
DVD.ActiveItems[252757] = { decorID = 9169, model3D = 5389584, soldBy = {252910}, source = "achievement", noxp = true } -- Boulder Springs Recliner
DVD.ActiveItems[253023] = { decorID = 9181, model3D = 4904552, soldBy = {252910}, source = "achievement", noxp = true } -- Rambleshire Resting Platform
DVD.ActiveItems[253034] = { decorID = 9182, model3D = 4860713, soldBy = {252910}, source = "quest", noxp = true } -- Fallside Lantern
DVD.ActiveItems[253037] = { decorID = 9185, model3D = 4906427, soldBy = {252910}, source = "achievement", noxp = true } -- Dornogal Brazier
DVD.ActiveItems[253038] = { decorID = 9186, model3D = 5140152, soldBy = {252910}, source = "vendor", noxp = true } -- Dornogal Hanging Lantern
DVD.ActiveItems[253163] = { decorID = 9237, model3D = 4896167, soldBy = {252910}, source = "achievement", noxp = true } -- Fallside Storage Tent
end

do -- 🏪 VENDOR NPC: 252915 (Corlen Hordralin)
DVD.ActiveItems[253602] = { decorID = 9479, model3D = 6033625, soldBy = {252915}, source = "achievement" } -- "Silvermoon in Summer" Painting
DVD.ActiveItems[253603] = { decorID = 9480, model3D = 6033626, soldBy = {252915}, source = "achievement" } -- "The Last Day of the Semester" Painting
DVD.ActiveItems[253604] = { decorID = 9481, model3D = 6033627, soldBy = {252915}, source = "achievement" } -- "A Bridge Over Calm Waters" Painting
DVD.ActiveItems[253605] = { decorID = 9482, model3D = 6880011, soldBy = {252915}, source = "achievement" } -- "Family Portrait" Painting
DVD.ActiveItems[253607] = { decorID = 9484, model3D = 6929059, soldBy = {252915}, source = "achievement" } -- "Eversong in Bloom" Painting
DVD.ActiveItems[253608] = { decorID = 9485, model3D = 6929060, soldBy = {252915}, source = "achievement" } -- "Nature's Strength" Painting
DVD.ActiveItems[253614] = { decorID = 9491, model3D = 7241253, soldBy = {252915}, source = "achievement" } -- "Brunch and a Book" Painting
DVD.ActiveItems[253615] = { decorID = 9492, model3D = 7241254, soldBy = {252915}, source = "achievement" } -- "Autumnal Eversong" Painting
DVD.ActiveItems[253616] = { decorID = 9493, model3D = 7241255, soldBy = {252915}, source = "achievement" } -- "Isolation" Painting
DVD.ActiveItems[253617] = { decorID = 9494, model3D = 7241256, soldBy = {252915}, source = "achievement" } -- "Reclamation" Painting
DVD.ActiveItems[253618] = { decorID = 9495, model3D = 7241257, soldBy = {252915}, source = "achievement" } -- "The Light Blooms" Painting
DVD.ActiveItems[253619] = { decorID = 9496, model3D = 7241258, soldBy = {252915}, source = "achievement"} -- "The Fallen Protectors" Painting
DVD.ActiveItems[253620] = { decorID = 9497, model3D = 7241259, soldBy = {252915}, source = "achievement" } -- "River's Protectors" Painting
end

do -- 🏪 VENDOR NPC: 252916 (Hesta Forlath)
DVD.ActiveItems[244656] = { decorID = 1446, model3D = 4239029, soldBy = {252916}, source = "achievement", noxp = true } -- Silvermoon Painter's Cushion
DVD.ActiveItems[253606] = { decorID = 9483, model3D = 6929057, soldBy = {252916}, source = "vendor", noxp = true } -- "Brunch and a Book" Unframed Painting
DVD.ActiveItems[253609] = { decorID = 9486, model3D = 7241244, soldBy = {252916}, source = "vendor", noxp = true } -- "River's Protectors" Unframed Painting
DVD.ActiveItems[253610] = { decorID = 9487, model3D = 7241245, soldBy = {252916}, source = "vendor", noxp = true } -- "Isolation" Unframed Painting
DVD.ActiveItems[253611] = { decorID = 9488, model3D = 7241247, soldBy = {252916}, source = "vendor", noxp = true } -- "The Fallen Protectors" Unframed Painting
DVD.ActiveItems[253612] = { decorID = 9489, model3D = 7241248, soldBy = {252916}, source = "vendor", noxp = true } -- "Autumnal Eversong" Unframed Painting
DVD.ActiveItems[253613] = { decorID = 9490, model3D = 7241249, soldBy = {252916}, source = "vendor", noxp = true } -- "Reclamation" Unframed Painting
DVD.ActiveItems[253704] = { decorID = 9628, model3D = 6929058, soldBy = {252916}, source = "vendor", noxp = true } -- Fresh Canvas
DVD.ActiveItems[253705] = { decorID = 9629, model3D = 7241246, soldBy = {252916}, source = "vendor", noxp = true } -- "The Light Blooms" Unframed Painting
end

do -- 🏪 VENDOR NPC: 252917 (Hesta Forlath)
DVD.ActiveItems[253522] = { decorID = 9419, model3D = 6017293, soldBy = {252917}, source = "vendor", noxp = true } -- Thalassian Chest
DVD.ActiveItems[253523] = { decorID = 9420, model3D = 6024530, soldBy = {252917}, source = "vendor", noxp = true } -- Astalor's Hookah
DVD.ActiveItems[253524] = { decorID = 9421, model3D = 6025946, soldBy = {252917}, source = "vendor", noxp = true } -- 590 Quel'Lithien Red Display Bottle
DVD.ActiveItems[253525] = { decorID = 9422, model3D = 6935638, soldBy = {252917}, source = "vendor", noxp = true } -- Thalassian Academy Dictation Device
DVD.ActiveItems[253526] = { decorID = 9423, model3D = 6998416, soldBy = {252917}, source = "vendor", noxp = true } -- Sin'dorei Wine Display
DVD.ActiveItems[253599] = { decorID = 9476, model3D = 6017291, soldBy = {252917}, source = "vendor", noxp = true } -- Artisanal Display Tent
DVD.ActiveItems[253600] = { decorID = 9477, model3D = 6025942, soldBy = {252917}, source = "vendor", noxp = true } -- Eversong Crystal Glass
DVD.ActiveItems[253601] = { decorID = 9478, model3D = 6025944, soldBy = {252917}, source = "vendor", noxp = true } -- 590 Quel'Lithien Red
DVD.ActiveItems[254235] = { decorID = 10273, model3D = 7338840, soldBy = {252917}, source = "vendor", noxp = true } -- Sin'dorei Artisan's Easel
end

do -- 🏪 VENDOR NPC: 252969 (Jocenna)
DVD.ActiveItems[245448] = { decorID = 752, model3D = 1399648, soldBy = {252969}, source = "achievement", noxp = true } -- "Night on the Jeweled Estate" Painting
DVD.ActiveItems[245558] = { decorID = 1747, model3D = 6924250, soldBy = {252969}, source = "quest", noxp = true } -- Elaborate Suramar Window
DVD.ActiveItems[247842] = { decorID = 3981, model3D = 1352412, soldBy = {252969}, source = "quest", noxp = true } -- Nightborne Merchant's Stall
DVD.ActiveItems[247843] = { decorID = 3982, model3D = 1361683, soldBy = {252969}, source = "achievement", noxp = true } -- Deluxe Suramar Sleeper
DVD.ActiveItems[247911] = { decorID = 4025, model3D = 1361686, soldBy = {252969}, source = "quest", noxp = true } -- Shal'dorei Seat
DVD.ActiveItems[247914] = { decorID = 4028, model3D = 1361709, soldBy = {252969}, source = "quest", noxp = true } -- Covered Ornate Suramar Table
DVD.ActiveItems[247917] = { decorID = 4031, model3D = 1361714, soldBy = {252969}, source = "quest", noxp = true } -- Covered Small Suramar Table
DVD.ActiveItems[248009] = { decorID = 4040, model3D = 1309274, soldBy = {252969}, source = "quest", noxp = true } -- Suramar Window
end

do -- 🏪 VENDOR NPC: 253067 (Silvrath) 193015 (Unatos)
DVD.ActiveItems[246706] = { decorID = 2469, model3D = 4201172, soldBy = {253067}, source = "quest", noxp = true } -- Elegant Dracthyr's Tea Cup
DVD.ActiveItems[247223] = { decorID = 2594, model3D = 7109344, soldBy = {253067}, source = "quest", noxp = true } -- Roast Riverbeast Platter
DVD.ActiveItems[256169] = { decorID = 10963, model3D = 4195090, requirement = { type = "renown", faction = "Valdrakken Accord", level = 3 }, soldBy = {193015, 253067}, source = "vendor"}-- Valdrakken Oven
DVD.ActiveItems[248112] = { decorID = 4168, model3D = 4204643, requirement = { type = "renown", faction = "Valdrakken Accord", level = 6 }, soldBy = {193015, 253067}, source = "vendor"} -- Valdrakken Garden Fountain
DVD.ActiveItems[248103] = { decorID = 4159, model3D = 3883454, requirement = { type = "renown", faction = "Valdrakken Accord", level = 14 }, soldBy = {193015, 253067}, source = "vendor"}-- Draconic Stone Table
DVD.ActiveItems[248652] = { decorID = 4478, model3D = 7141931, requirement = { type = "renown", faction = "Valdrakken Accord", level = 20 }, soldBy = {193015, 253067}, source = "vendor"}-- Dragon's Grand Mirror
DVD.ActiveItems[248104] = { decorID = 4160, model3D = 3883455, soldBy = {253067}, source = "achievement" } -- Pentagonal Stone Table
DVD.ActiveItems[248651] = { decorID = 4477, model3D = 7141928, soldBy = {253067}, source = "quest", noxp = true } -- Draconic Memorial Stone
DVD.ActiveItems[248653] = { decorID = 4479, model3D = 7141933, soldBy = {253067}, source = "quest", noxp = true } -- Valdrakken Stone Stool
DVD.ActiveItems[248655] = { decorID = 4481, model3D = 7141935, soldBy = {253067}, source = "quest", noxp = true } -- Elegant Dracthyr's Tea Set
DVD.ActiveItems[256429] = { decorID = 11164, model3D = 3952854, soldBy = {253067}, source = "quest", noxp = true } -- Valdrakken Lamppost
end

do -- 🏪 VENDOR NPC: 253086 (Jolinth)
DVD.ActiveItems[248656] = { decorID = 4482, model3D = 7141936, soldBy = {253086}, source = "achievement", noxp = true } -- Dragon's Hoard Chest
end

do -- 🏪 VENDOR NPC: 253227 (Breana Bitterbrand) 49386 (Craw MacGraw)
DVD.ActiveItems[246108] = { decorID = 1998, model3D = 6436349, requirement = { type = "reputation", faction = "Wildhammer Clan", rank = 3 }, soldBy = {253227, 49386}, source = "vendor"}-- Embellished Dwarven Tome
DVD.ActiveItems[246425] = { decorID = 2242, model3D = 197563, requirement = { type = "reputation", faction = "Wildhammer Clan", rank = 2 }, soldBy = {253227, 49386}, source = "vendor"}-- Round Dwarven Table
DVD.ActiveItems[246427] = { decorID = 2244, model3D = 391448, soldBy = {253227}, source = "quest", noxp = true } -- Dilapidated Wildhammer Well
DVD.ActiveItems[246428] = { decorID = 2245, model3D = 392127, soldBy = {253227}, source = "quest", noxp = true } -- Overgrown Wildhammer Fountain
end

do -- 🏪 VENDOR NPC: 253232 (Inge Brightview)
DVD.ActiveItems[246411] = { decorID = 2228, model3D = 197281, soldBy = {253232}, source = "vendor", noxp = true } -- Ironforge Bookcase
DVD.ActiveItems[246412] = { decorID = 2229, model3D = 197282, soldBy = {253232}, source = "vendor", noxp = true } -- Small Ironforge Bookcase
end

do -- 🏪 VENDOR NPC: 253235 (Dedric Sleetshaper) 50309 (Captain Stonehelm)
DVD.ActiveItems[245426] = { decorID = 1216, model3D = 1018949, soldBy = {253235}, source = "achievement" } -- Dark Iron Brazier
DVD.ActiveItems[245427] = { decorID = 1118, model3D = 1019061, soldBy = {253235}, source = "quest", noxp = true } -- Dark Iron Expedition Tent
DVD.ActiveItems[246426] = { decorID = 2243, model3D = 197568, requirement = { type = "reputation", faction = "Ironforge", rank = 3 }, soldBy = {253235, 50309}, source = "vendor"}-- Ornate Ironforge Table
DVD.ActiveItems[246490] = { decorID = 2333, model3D = 7014379, requirement = { type = "reputation", faction = "Ironforge", rank = 2 }, soldBy = {253235, 50309}, source = "vendor", noxp = true } -- Ironforge Fencepost
DVD.ActiveItems[246491] = { decorID = 2334, model3D = 7014380, requirement = { type = "reputation", faction = "Ironforge", rank = 2 }, soldBy = {253235, 50309}, source = "vendor", noxp = true } -- Ironforge Fence
DVD.ActiveItems[252010] = { decorID = 8982, model3D = 7296322, requirement = { type = "reputation", faction = "Ironforge", rank = 3 }, soldBy = {253235, 50309}, source = "vendor"}-- Ornate Ironforge Bench
DVD.ActiveItems[256333] = { decorID = 11133, model3D = 7385424, requirement = { type = "reputation", faction = "Ironforge", rank = 4 }, soldBy = {253235, 50309}, source = "vendor"} -- Ornate Dwarven Wardrobe
DVD.ActiveItems[256425] = { decorID = 11160, model3D = 7385422, soldBy = {253235}, source = "achievement", noxp = true } -- Shadowforge Stone Chair
end

do -- 🏪 VENDOR NPC: 253387 (Selfira Ambergrove) 106901 (Sylvia Hartshorn)
DVD.ActiveItems[238859] = { decorID = 675, model3D = 1108747, requirement = { type = "reputation", faction = "Dreamweavers", rank = 5 }, soldBy = {253387, 106901}, source = "vendor"}-- Cenarion Privacy Screen
DVD.ActiveItems[238860] = { decorID = 676, model3D = 1108751, soldBy = {253387}, source = "vendor" } -- Deluxe Val'sharah Bed
DVD.ActiveItems[238861] = { decorID = 677, model3D = 1108813, requirement = { type = "reputation", faction = "Dreamweavers", rank = 3 }, soldBy = {253387, 106901}, source = "vendor"}-- Cenarion Rectangular Rug
DVD.ActiveItems[245261] = { decorID = 1695, model3D = 1244321, requirement = { type = "reputation", faction = "Dreamweavers", rank = 4 }, soldBy = {253387, 106901}, source = "vendor"}-- Kaldorei Washbasin
DVD.ActiveItems[245697] = { decorID = 1881, model3D = 1108752, soldBy = {253387}, source = "achievement", noxp = true } -- Shala'nir Feather Bed
DVD.ActiveItems[245700] = { decorID = 1884, model3D = 7508794, soldBy = {253387}, source = "quest", noxp = true } -- Kaldorei Cushioned Seat
DVD.ActiveItems[245702] = { decorID = 1886, model3D = 1128060, soldBy = {253387}, source = "quest", noxp = true } -- Kaldorei Wall Shelf
DVD.ActiveItems[245703] = { decorID = 1887, model3D = 1349622, soldBy = {253387}, source = "achievement", noxp = true } -- Kaldorei Treasure Trove
DVD.ActiveItems[245739] = { decorID = 1889, model3D = 1096777, soldBy = {253387}, source = "quest", noxp = true } -- Crescent Moon Lamppost
DVD.ActiveItems[251494] = { decorID = 8195, model3D = 1096752, requirement = { type = "reputation", faction = "Dreamweavers", rank = 2 }, soldBy = {253387, 106901}, source = "vendor"}-- Moon-Blessed Barrel
DVD.ActiveItems[264168] = { decorID = 15453, model3D = 7504767, requirement = { type = "reputation", faction = "Dreamweavers", rank = 3 }, soldBy = {253387, 106901}, source = "vendor"} -- Cenarion Round Rug	
end

do -- 🏪 VENDOR NPC: 253434 (Sileas Duskvine)
DVD.ActiveItems[245701] = { decorID = 1885, model3D = 1096883, soldBy = {253434}, source = "quest", noxp = true } -- Elven Round Table
end

do -- 🏪 VENDOR NPC: 253596 (The Last Architect Horde) 248854 (The Last Architect Alliance)
DVD.ActiveItems[262453] = { decorID = 14583, model3D = 6033622, soldBy = {253596, 248854}, source = "vendor", noxp = true } -- Hearthlight Armillary
end

do -- 🏪 VENDOR NPC: 254606 (Joruh) 254603 (Riica) 219217 (Velerd)
DVD.ActiveItems[247727] = { decorID = 3867, model3D = 414219, soldBy = {254606}, source = "achievement" } -- Iron Dragonmaw Gate
DVD.ActiveItems[247740] = { decorID = 3880, model3D = 603539, soldBy = {254603, 254606}, source = "vendor" } -- Kotmogu Pedestal
DVD.ActiveItems[247741] = { decorID = 3881, model3D = 604187, soldBy = {254603, 254606}, source = "achievement" } -- Kotmogu Orb of Power
DVD.ActiveItems[247744] = { decorID = 3884, model3D = 2353834, soldBy = {254603}, source = "achievement" } -- Alliance Dueling Flag
DVD.ActiveItems[247745] = { decorID = 3885, model3D = 2353835, soldBy = {254606}, source = "achievement", noxp = true } -- Horde Dueling Flag
DVD.ActiveItems[247746] = { decorID = 3886, model3D = 2490318, soldBy = {254603}, source = "achievement" } -- Silverwing Sentinels Flag
DVD.ActiveItems[247747] = { decorID = 3887, model3D = 2490319, soldBy = {254606}, source = "achievement" } -- Warsong Outriders Flag
DVD.ActiveItems[247750] = { decorID = 3890, model3D = 5770750, soldBy = {254603, 254606, 219217}, source = "achievement" } -- Deephaul Crystal
DVD.ActiveItems[247756] = { decorID = 3893, model3D = 199687, soldBy = {254603, 254606}, source = "achievement", noxp = true } -- Challenger's Dueling Flag
DVD.ActiveItems[247757] = { decorID = 3894, model3D = 200268, soldBy = {254603}, source = "achievement" } -- Alliance Battlefield Banner
DVD.ActiveItems[247758] = { decorID = 3895, model3D = 200273, soldBy = {254603}, source = "achievement" } -- Fortified Alliance Banner
DVD.ActiveItems[247759] = { decorID = 3896, model3D = 200276, soldBy = {254606}, source = "achievement" } -- Horde Battlefield Banner
DVD.ActiveItems[247760] = { decorID = 3897, model3D = 200281, soldBy = {254606}, source = "achievement" } -- Fortified Horde Banner
DVD.ActiveItems[247761] = { decorID = 3898, model3D = 200283, soldBy = {254603, 254606}, source = "achievement", noxp = true } -- Uncontested Battlefield Banner
DVD.ActiveItems[247762] = { decorID = 3899, model3D = 200301, soldBy = {254603, 254606}, source = "achievement" } -- Netherstorm Battlefield Flag
DVD.ActiveItems[247763] = { decorID = 3900, model3D = 200305, soldBy = {254603, 254606}, source = "achievement" } -- Berserker's Empowerment
DVD.ActiveItems[247765] = { decorID = 3902, model3D = 200308, soldBy = {254603, 254606}, source = "achievement" } -- Healer's Empowerment
DVD.ActiveItems[247766] = { decorID = 3903, model3D = 200309, soldBy = {254603, 254606}, source = "achievement" } -- Runner's Empowerment
DVD.ActiveItems[247768] = { decorID = 3905, model3D = 660744, soldBy = {254603, 254606}, source = "achievement" } -- Guardian's Empowerment
DVD.ActiveItems[247769] = { decorID = 3906, model3D = 1586378, soldBy = {254603, 254606}, source = "achievement" } -- Chaotic Empowerment
DVD.ActiveItems[247770] = { decorID = 3907, model3D = 1588459, soldBy = {254603, 254606}, source = "achievement" } -- Mysterious Empowerment
DVD.ActiveItems[253170] = { decorID = 9244, model3D = 5278833, soldBy = {254603, 254606, 219217}, source = "achievement" } -- Earthen Contender's Target
DVD.ActiveItems[256896] = { decorID = 11296, model3D = 304027, soldBy = {254603, 254606}, source = "achievement", noxp = true } -- Smoke Lamppost
end

do -- 🏪 VENDOR NPC: 254944 (Tajaka Sawtusk)
DVD.ActiveItems[253469] = { decorID = 1148, model3D = 6195750, soldBy = {254944}, source = "quest"} -- Ritual-Cursed Sarcophagus
DVD.ActiveItems[255648] = { decorID = 10858, model3D = 6195754, soldBy = {254944}, source = "quest"} -- Zul'Aman Ancestral Fountain
DVD.ActiveItems[256925] = { decorID = 11325, model3D = 6125173, soldBy = {254944}, source = "achievement"} -- Amani Spearhunter's Spit
DVD.ActiveItems[256928] = { decorID = 11328, model3D = 6212436, soldBy = {254944}, source = "quest"} -- Banner of the Amani Tribe
DVD.ActiveItems[264255] = { decorID = 15490, model3D = 6212416, soldBy = {254944}, source = "quest"} -- Amani Trophy Frame
DVD.ActiveItems[264257] = { decorID = 15492, model3D = 6212430, soldBy = {254944}, source = "quest"} -- Zul'Aman Armament Rest
DVD.ActiveItems[264334] = { decorID = 15572, model3D = 6153822, soldBy = {254944}, source = "quest"} -- Amani War Drum
DVD.ActiveItems[264335] = { decorID = 15573, model3D = 6163851, soldBy = {254944}, source = "achievement"} -- Colossal Amani Stone Visage
DVD.ActiveItems[264479] = { decorID = 15743, model3D = 6212406, soldBy = {254944}, source = "quest"} -- Skyweave Amani Tapestry
DVD.ActiveItems[264480] = { decorID = 15744, model3D = 6212407, soldBy = {254944}, source = "quest"} -- Greenvine Amani Tapestry
DVD.ActiveItems[264481] = { decorID = 15745, model3D = 6212408, soldBy = {254944}, source = "quest"} -- Earthhide Amani Tapestry
DVD.ActiveItems[264715] = { decorID = 16092, model3D = 6075575, soldBy = {254944}, source = "quest"} -- Zul'Aman Flame Cradle
end

do -- 🏪 VENDOR NPC: 255095 (Kuvahn)
DVD.ActiveItems[264173] = { decorID = 15458, model3D = 6049356, soldBy = {255095}, source = "achievement"} -- Midnight Skinner's Shop Sign
end

do -- 🏪 VENDOR NPC: 255098 (Jan'zel)
DVD.ActiveItems[264006] = { decorID = 15411, model3D = 6049354, soldBy = {255098}, source = "achievement" } -- Midnight Leatherworker's Shop Sign
end

do -- 🏪 VENDOR NPC: 255101 (Mynde)
DVD.ActiveItems[257393] = { decorID = 11483, model3D = 1318183, soldBy = {255101}, source = "vendor"} -- Suramar Stepping Stone
DVD.ActiveItems[257598] = { decorID = 11708, model3D = 7414263, soldBy = {255101}, source = "vendor" } -- Suramar Stepping Stone Set
end

do -- 🏪 VENDOR NPC: 255114 (Maku)
DVD.ActiveItems[245535] = { decorID = 1726, model3D = 6310382, soldBy = {255114}, source = "quest", noxp = true } -- Sturdy Haranir Handcart
DVD.ActiveItems[246407] = { decorID = 2224, model3D = 6326912, soldBy = {255114}, source = "quest", noxp = true } -- Stoppered Spring Water Gourd
DVD.ActiveItems[246415] = { decorID = 2232, model3D = 6326881, soldBy = {255114}, source = "quest", noxp = true } -- Ruddy Haranir Pigment Bowl
DVD.ActiveItems[246416] = { decorID = 2233, model3D = 6326882, soldBy = {255114}, source = "vendor", noxp = true } -- Waterlogged Haranir Pigment Bowl
DVD.ActiveItems[247234] = { decorID = 2605, model3D = 6225702, soldBy = {255114}, source = "quest", noxp = true } -- Rustic Harandar Planter
DVD.ActiveItems[252045] = { decorID = 8993, model3D = 6225718, soldBy = {255114}, source = "quest", noxp = true } -- Fungal Pergola
DVD.ActiveItems[253443] = { decorID = 1080, model3D = 6796713, soldBy = {255114}, source = "quest", noxp = true } -- Replica Sky's Hope
DVD.ActiveItems[253467] = { decorID = 1147, model3D = 6055100, soldBy = {255114}, source = "quest", noxp = true } -- Rutaani Sporepod
DVD.ActiveItems[254319] = { decorID = 10327, model3D = 6225721, soldBy = {255114}, source = "quest", noxp = true } -- Root-Woven Door
DVD.ActiveItems[254878] = { decorID = 10778, model3D = 6225720, soldBy = {255114}, source = "quest", noxp = true } -- Root-Woven Window
DVD.ActiveItems[262614] = { decorID = 14639, model3D = 6796710, soldBy = {255114}, source = "quest", noxp = true } -- Harandar Runestone
DVD.ActiveItems[262906] = { decorID = 14799, model3D = 6310371, soldBy = {255114}, source = "quest", noxp = true } -- Harandar Anvil
DVD.ActiveItems[263020] = { decorID = 14809, model3D = 4732018, soldBy = {255114}, source = "quest", noxp = true } -- Ward of the Shul'ka
DVD.ActiveItems[263037] = { decorID = 14823, model3D = 4732015, soldBy = {255114}, source = "quest", noxp = true } -- Replica Wey'nan's Ward
DVD.ActiveItems[263041] = { decorID = 14827, model3D = 6252867, soldBy = {255114}, source = "quest", noxp = true } -- Replica Root of the World
DVD.ActiveItems[263196] = { decorID = 14968, model3D = 6252873, soldBy = {255114}, source = "quest", noxp = true } -- Harandar Glowvine Lantern
DVD.ActiveItems[263315] = { decorID = 15155, model3D = 5163359, soldBy = {255114}, source = "quest", noxp = true } -- Bubbling Haranir Cauldron
DVD.ActiveItems[264178] = { decorID = 15463, model3D = 6326888, soldBy = {255114}, source = "quest", noxp = true } -- Harandar Charcuterie Board
DVD.ActiveItems[264259] = { decorID = 15494, model3D = 6252866, soldBy = {255114}, source = "achievement", noxp = true } -- On'ohia's Call
DVD.ActiveItems[264262] = { decorID = 15497, model3D = 6252870, soldBy = {255114}, source = "quest", noxp = true } -- Haranir Whistling Arrow
DVD.ActiveItems[264266] = { decorID = 15501, model3D = 6718307, soldBy = {255114}, source = "achievement", noxp = true } -- Lightbloom Moss Mound
DVD.ActiveItems[265792] = { decorID = 17516, model3D = 6851751, soldBy = {255114}, source = "achievement", noxp = true } -- Fungarian Vine Fence
DVD.ActiveItems[266259] = { decorID = 17886, model3D = 6310381, soldBy = {255114}, source = "quest", noxp = true } -- Altar of the Shul'ka
end

do -- 🏪 VENDOR NPC: 255216 (Balen Starfinder) 255298 (Jehzar Starfall 51)
DVD.ActiveItems[246250] = { decorID = 2105, model3D = 7000939, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Silvermoon Large Platform
DVD.ActiveItems[243495] = { decorID = 1329, model3D = 6435020, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Padded Divan
DVD.ActiveItems[241618] = { decorID = 985, model3D = 6435018, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Padded Footstool
DVD.ActiveItems[246255] = { decorID = 2110, model3D = 7000944, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Bel'ameth Large Platform
DVD.ActiveItems[241620] = { decorID = 987, model3D = 6435025, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Wooden Dresser
DVD.ActiveItems[241621] = { decorID = 988, model3D = 6435026, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Small Elegant End Table
DVD.ActiveItems[241622] = { decorID = 989, model3D = 6435030, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Ornate Weapon Rack
DVD.ActiveItems[243242] = { decorID = 1245, model3D = 6435032, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Circular Elven Floor Rug
DVD.ActiveItems[243243] = { decorID = 1246, model3D = 6435033, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Rectangular Elven Floor Rug
DVD.ActiveItems[235994] = { decorID = 80, model3D = 6033663, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Ornate Stonework Fireplace
DVD.ActiveItems[241617] = { decorID = 984, model3D = 6435017, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Padded Chair
DVD.ActiveItems[244781] = { decorID = 1487, model3D = 6435039, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Wall Drape
DVD.ActiveItems[246249] = { decorID = 2104, model3D = 7000938, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Silvermoon Beam Platform
DVD.ActiveItems[246251] = { decorID = 2106, model3D = 7000940, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Silvermoon Small Platform
DVD.ActiveItems[246252] = { decorID = 2107, model3D = 7000941, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Silvermoon Angled Platform
DVD.ActiveItems[246253] = { decorID = 2108, model3D = 7000942, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Silvermoon Round Platform
DVD.ActiveItems[246254] = { decorID = 2109, model3D = 7000943, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Bel'ameth Beam Platform
DVD.ActiveItems[246256] = { decorID = 2111, model3D = 7000945, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Bel'ameth Small Platform
DVD.ActiveItems[246257] = { decorID = 2112, model3D = 7000946, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Bel'ameth Angled Platform
DVD.ActiveItems[246258] = { decorID = 2113, model3D = 7000947, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Bel'ameth Round Platform
DVD.ActiveItems[246431] = { decorID = 2254, model3D = 6435038, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Tied Curtain
DVD.ActiveItems[246691] = { decorID = 2458, model3D = 6435040, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Grand Elven Wall Curtain
DVD.ActiveItems[246711] = { decorID = 2474, model3D = 6435034, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Pillow Roll
DVD.ActiveItems[246961] = { decorID = 2590, model3D = 6435035, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Seat Cushion
DVD.ActiveItems[247501] = { decorID = 3826, model3D = 6435840, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Carved Door
DVD.ActiveItems[248760] = { decorID = 4562, model3D = 6435029, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Lovely Elven Shelf
DVD.ActiveItems[249558] = { decorID = 5563, model3D = 6435031, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elven Standing Mirror
DVD.ActiveItems[251981] = { decorID = 8917, model3D = 6435837, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Elven Chandelier
DVD.ActiveItems[251982] = { decorID = 8918, model3D = 6435839, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Gilded Silvermoon Candelabra
DVD.ActiveItems[253180] = { decorID = 9254, model3D = 6435015, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Elven Canopy Bed
DVD.ActiveItems[253181] = { decorID = 9255, model3D = 6435027, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Gemmed Elven Chest
DVD.ActiveItems[253441] = { decorID = 994, model3D = 6783465, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Grand Elven Bookcase
DVD.ActiveItems[253479] = { decorID = 1153, model3D = 6435016, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Small Elegant Padded Chair
DVD.ActiveItems[253490] = { decorID = 1162, model3D = 6435024, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Elven Desk
DVD.ActiveItems[253493] = { decorID = 1163, model3D = 6435028, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Carved Elven Bookcase
DVD.ActiveItems[255650] = { decorID = 10860, model3D = 6435838, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Table Lamp
DVD.ActiveItems[257690] = { decorID = 11719, model3D = 6435021, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Padded Chaise
DVD.ActiveItems[264169] = { decorID = 15454, model3D = 7506135, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Homestone Doormat
DVD.ActiveItems[264352] = { decorID = 15598, model3D = 7506479, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Elven Bathtub
DVD.ActiveItems[264353] = { decorID = 15599, model3D = 7506480, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Empty Elegant Elven Bathtub
DVD.ActiveItems[265653] = { decorID = 17358, model3D = 7506481, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Storage Table
DVD.ActiveItems[265654] = { decorID = 17359, model3D = 7506482, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Elegant Elven Washbasin
DVD.ActiveItems[267075] = { decorID = 18614, model3D = 7506483, soldBy = {255216, 255298}, source = "vendor", noxp = true } -- Ornate Elven Stove
DVD.ActiveItems[245575] = { decorID = 1770, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Bel'ameth Interior Wall
DVD.ActiveItems[245576] = { decorID = 1771, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Bel'ameth Round Interior Pillar
DVD.ActiveItems[245578] = { decorID = 1772, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Bel'ameth Interior Doorway
DVD.ActiveItems[245579] = { decorID = 1773, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Bel'ameth Interior Narrow Wall
DVD.ActiveItems[245581] = { decorID = 1774, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Silvermoon Round Interior Pillar
DVD.ActiveItems[245582] = { decorID = 1775, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Silvermoon Interior Narrow Wall
DVD.ActiveItems[245583] = { decorID = 1776, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Silvermoon Interior Wall
DVD.ActiveItems[245649] = { decorID = 1844, model3D = 1337, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true } -- Silvermoon Interior Doorway
end

do -- 🏪 VENDOR NPC: 255221 (Trevor Grenner Alliance) 255319 ("Yen" Malone Horde)
DVD.ActiveItems[248337] = { decorID = 4406, model3D = 7142957, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Round-Top Boulder
DVD.ActiveItems[248338] = { decorID = 4407, model3D = 7142958, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Flat Boulder
DVD.ActiveItems[248339] = { decorID = 4408, model3D = 7142959, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Hilltop Boulder
DVD.ActiveItems[266244] = { decorID = 17873, model3D = 7553110, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Granite Cobblestone Path Corner
DVD.ActiveItems[266245] = { decorID = 17874, model3D = 7553111, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Granite Cobblestone Path Arc
DVD.ActiveItems[266443] = { decorID = 17918, model3D = 7557398, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Granite Cobblestone Long Path
DVD.ActiveItems[266444] = { decorID = 17919, model3D = 7557399, soldBy = {255301, 255221, 255230}, source = "vendor", noxp = true } -- Granite Cobblestone Path
DVD.ActiveItems[245327] = { decorID = 772, model3D = 6717275, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Creeping Corner Ivy
DVD.ActiveItems[245328] = { decorID = 773, model3D = 6254055, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Small Boxwood Bush
DVD.ActiveItems[245329] = { decorID = 771, model3D = 6242990, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Small Poppy Cluster
DVD.ActiveItems[245369] = { decorID = 520, model3D = 6383338, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Gift of Gilneas
DVD.ActiveItems[245371] = { decorID = 521, model3D = 6383339, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Charming Laurel Tree
DVD.ActiveItems[245658] = { decorID = 1864, model3D = 6795024, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Cobblestone Round
DVD.ActiveItems[245659] = { decorID = 1865, model3D = 6795025, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Cobblestone
DVD.ActiveItems[245660] = { decorID = 1866, model3D = 6795026, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Cobblestone Pair
DVD.ActiveItems[245661] = { decorID = 1867, model3D = 6795027, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Cobblestone Cluster
DVD.ActiveItems[248635] = { decorID = 4461, model3D = 6382414, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Whitebrush
DVD.ActiveItems[248639] = { decorID = 4465, model3D = 6717236, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Gloomrose
DVD.ActiveItems[248640] = { decorID = 4466, model3D = 6717239, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Duskberry Bush
DVD.ActiveItems[248641] = { decorID = 4467, model3D = 6717242, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Duskwood Shadebrush
DVD.ActiveItems[248642] = { decorID = 4468, model3D = 6717278, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Creeping Lattice Ivy
DVD.ActiveItems[248643] = { decorID = 4469, model3D = 6717284, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Duskwood Sycamore Shrub
DVD.ActiveItems[248644] = { decorID = 4470, model3D = 6736324, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Spiritbloom Flower
DVD.ActiveItems[248645] = { decorID = 4471, model3D = 6799055, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Pink Gilnean Rose
DVD.ActiveItems[248646] = { decorID = 4472, model3D = 6799058, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Silvermoon Sunrise Bush
DVD.ActiveItems[248647] = { decorID = 4473, model3D = 6799070, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Founder's Point Blooming Grass Patch
DVD.ActiveItems[248648] = { decorID = 4474, model3D = 6799089, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Autumn Leaf Pile
DVD.ActiveItems[248649] = { decorID = 4475, model3D = 6799093, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Young Chestnut Tree
DVD.ActiveItems[248802] = { decorID = 4822, model3D = 6225391, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Grass Patch
DVD.ActiveItems[248803] = { decorID = 4823, model3D = 6225392, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Grass Spread
DVD.ActiveItems[248811] = { decorID = 4845, model3D = 7154457, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Small Grass Patch
DVD.ActiveItems[255644] = { decorID = 10855, model3D = 6656155, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Apple Tree
DVD.ActiveItems[255646] = { decorID = 10856, model3D = 6656156, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Founder's Point Apple Tree
DVD.ActiveItems[258658] = { decorID = 12189, model3D = 6799102, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Elwynn Autumn Apple Tree
DVD.ActiveItems[258659] = { decorID = 12190, model3D = 6799103, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Founder's Point Autumn Apple Tree
DVD.ActiveItems[266239] = { decorID = 17868, model3D = 7552289, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Outer Banks Large Garden Cluster
DVD.ActiveItems[266240] = { decorID = 17869, model3D = 7552290, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Founder's Point Large Garden Cluster
DVD.ActiveItems[266241] = { decorID = 17870, model3D = 7552291, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Brumewood Hollow Large Garden Cluster
DVD.ActiveItems[266242] = { decorID = 17871, model3D = 7552292, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Gilded Oaks Large Garden Cluster
DVD.ActiveItems[266243] = { decorID = 17872, model3D = 7552293, soldBy = {255319, 255221}, source = "vendor", noxp = true } -- Stoneveil Ridge Large Garden Cluster
DVD.ActiveItems[245298] = { decorID = 582, model3D = 4684656, soldBy = {255221, 255319}, source = "vendor", noxp = true } -- Wild Violet Bellflowers
DVD.ActiveItems[245299] = { decorID = 584, model3D = 4684657, soldBy = {255221, 255319}, source = "vendor", noxp = true } -- Reaching Violet Bellflowers
DVD.ActiveItems[245300] = { decorID = 586, model3D = 4684658, soldBy = {255221, 255319}, source = "vendor", noxp = true } -- Arched Violet Bellflowers
end

do -- 🏪 VENDOR NPC: 255278 (Gronthul 83) 255222 ("High Tides" Ren Alliance 84)
DVD.ActiveItems[244533] = { decorID = 1437, model3D = 6379085, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Iron Chain Chandelier
DVD.ActiveItems[244534] = { decorID = 1438, model3D = 6379088, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Iron-Reinforced Door
DVD.ActiveItems[244661] = { decorID = 1451, model3D = 6379081, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tied-Left Leather Curtains
DVD.ActiveItems[244662] = { decorID = 1452, model3D = 6379082, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Closed Leather Curtains
DVD.ActiveItems[244663] = { decorID = 1453, model3D = 6379083, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Leather Valance
DVD.ActiveItems[245264] = { decorID = 1698, model3D = 6379077, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Round Stitched Cushion
DVD.ActiveItems[245265] = { decorID = 1699, model3D = 6379078, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Stitched Pillow Roll
DVD.ActiveItems[245266] = { decorID = 1700, model3D = 6379084, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Iron-Studded Wooden Window
DVD.ActiveItems[245398] = { decorID = 81, model3D = 6033664, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tusked Fireplace
DVD.ActiveItems[245532] = { decorID = 1723, model3D = 6379057, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Chair
DVD.ActiveItems[245545] = { decorID = 1736, model3D = 6379068, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Nightstand
DVD.ActiveItems[245555] = { decorID = 1744, model3D = 6379056, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Tusked Bed
DVD.ActiveItems[245680] = { decorID = 1879, model3D = 6379065, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Bureaucrat's Desk
DVD.ActiveItems[246036] = { decorID = 1977, model3D = 6379058, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- High-Backed Orgrimmar Chair
DVD.ActiveItems[246037] = { decorID = 1978, model3D = 6379073, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Iron-Reinforced Wooden Rack
DVD.ActiveItems[246038] = { decorID = 1979, model3D = 6389812, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Stitched Leather Rug
DVD.ActiveItems[246223] = { decorID = 2092, model3D = 6379061, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Cozy Hide-Covered Bench
DVD.ActiveItems[246224] = { decorID = 2093, model3D = 6379070, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Large Orgrimmar Bookcase
DVD.ActiveItems[246225] = { decorID = 2094, model3D = 6389811, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Small Leather Rug
DVD.ActiveItems[246259] = { decorID = 2114, model3D = 7000948, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Beam Platform
DVD.ActiveItems[246260] = { decorID = 2115, model3D = 7000949, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Round Platform
DVD.ActiveItems[246261] = { decorID = 2116, model3D = 7000950, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Large Platform
DVD.ActiveItems[246262] = { decorID = 2117, model3D = 7000951, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Small Platform
DVD.ActiveItems[246263] = { decorID = 2118, model3D = 7000952, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Angled Platform
DVD.ActiveItems[246587] = { decorID = 2384, model3D = 6379071, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Short Orgrimmar Bookcase
DVD.ActiveItems[246607] = { decorID = 2439, model3D = 6379063, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Durable Hex Table
DVD.ActiveItems[246608] = { decorID = 2440, model3D = 6379064, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Long Leather-Clad Table
DVD.ActiveItems[246609] = { decorID = 2441, model3D = 6379067, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Open Dresser
DVD.ActiveItems[246610] = { decorID = 2442, model3D = 6379074, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Razorwind Standing Mirror
DVD.ActiveItems[246613] = { decorID = 2445, model3D = 6435865, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Long Durable Table
DVD.ActiveItems[246614] = { decorID = 2446, model3D = 7009610, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Razorwind Bar Table
DVD.ActiveItems[246687] = { decorID = 2454, model3D = 6379086, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tusked Candleholder
DVD.ActiveItems[246869] = { decorID = 2535, model3D = 6379090, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Razorwind Wall Mirror
DVD.ActiveItems[246879] = { decorID = 2545, model3D = 7048161, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tusked Hanging Sconce
DVD.ActiveItems[247221] = { decorID = 2592, model3D = 6379089, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Small Orgrimmar Chair
DVD.ActiveItems[248246] = { decorID = 4386, model3D = 7080290, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Razorwind Storage Table
DVD.ActiveItems[250093] = { decorID = 5853, model3D = 7080314, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tusked Weapon Rack
DVD.ActiveItems[250094] = { decorID = 5854, model3D = 7134790, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Empty Orgrimmar Bathtub
DVD.ActiveItems[250913] = { decorID = 7836, model3D = 7080308, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Small Razorwind Bar Table
DVD.ActiveItems[250920] = { decorID = 7842, model3D = 7048159, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Horned Hanging Sconce
DVD.ActiveItems[251639] = { decorID = 8771, model3D = 7053550, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Hide-Covered Bench
DVD.ActiveItems[251973] = { decorID = 8907, model3D = 6379072, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Hide-Covered Wall Shelf
DVD.ActiveItems[251974] = { decorID = 8910, model3D = 7048164, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tusked Chandelier
DVD.ActiveItems[251975] = { decorID = 8911, model3D = 7048166, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tusked Sconce
DVD.ActiveItems[251976] = { decorID = 8912, model3D = 7080303, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Wolf Pelt Rug
DVD.ActiveItems[252657] = { decorID = 9143, model3D = 7312624, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Tied-Right Leather Curtains
DVD.ActiveItems[254316] = { decorID = 10324, model3D = 7080287, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Small Orgrimmar Tusked Bed
DVD.ActiveItems[254560] = { decorID = 10367, model3D = 7135879, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Small Razorwind Square Table
DVD.ActiveItems[256050] = { decorID = 10952, model3D = 7302332, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Razorwind Shores Front Door
DVD.ActiveItems[257389] = { decorID = 11480, model3D = 7080315, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Iron-Reinforced Wooden Window
DVD.ActiveItems[258148] = { decorID = 11874, model3D = 7080286, soldBy = {255278, 255222}, source = "vendor", noxp = true } -- Orgrimmar Bathtub
DVD.ActiveItems[267088] = { decorID = 18620, model3D = 7048170, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Iron Candlelight Lantern
DVD.ActiveItems[250691] = { decorID = 7688, model3D = 6794470, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Tusked Leather Tapestry
DVD.ActiveItems[250692] = { decorID = 7689, model3D = 6794471, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Banner Pelt
DVD.ActiveItems[254395] = { decorID = 10334, model3D = 6938191, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Smith's Hammer
DVD.ActiveItems[254396] = { decorID = 10335, model3D = 6938192, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Miner's Pickaxe
DVD.ActiveItems[254397] = { decorID = 10336, model3D = 6938193, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Woodworker's Hand Saw
DVD.ActiveItems[254398] = { decorID = 10337, model3D = 6938194, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Crafter's Chisel
DVD.ActiveItems[254399] = { decorID = 10338, model3D = 6938195, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Peon's Shovel
DVD.ActiveItems[254678] = { decorID = 10381, model3D = 6938190, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Logger's Axe
DVD.ActiveItems[255706] = { decorID = 10890, model3D = 6938171, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Iron Chandelier
DVD.ActiveItems[255707] = { decorID = 10891, model3D = 7375399, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Low-Hanging Razorwind Iron Chandelier
DVD.ActiveItems[256329] = { decorID = 11129, model3D = 6938187, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Standing Tusk
DVD.ActiveItems[258664] = { decorID = 12193, model3D = 6938200, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Tusk-Adorned Stitched Rug
DVD.ActiveItems[258665] = { decorID = 12194, model3D = 6938201, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Small Stitched Rug
DVD.ActiveItems[259464] = { decorID = 12453, model3D = 6938189, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Rolled Razorwind Leathers
DVD.ActiveItems[259465] = { decorID = 12454, model3D = 6938202, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Low-Hanging Razorwind Ropes
DVD.ActiveItems[259466] = { decorID = 12455, model3D = 6938203, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Knotted Hanging Razorwind Ropes
DVD.ActiveItems[259467] = { decorID = 12456, model3D = 6938204, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Tusked Hanging Razorwind Ropes
DVD.ActiveItems[259468] = { decorID = 12457, model3D = 6938205, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Plain Hanging Razorwind Ropes
DVD.ActiveItems[259469] = { decorID = 12458, model3D = 6938206, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Adorned Hanging Razorwind Ropes
DVD.ActiveItems[259470] = { decorID = 12459, model3D = 6938207, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Lightly Adorned Hanging Razorwind Ropes
DVD.ActiveItems[265924] = { decorID = 17609, model3D = 7550546, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- High-Mounted Razorwind Bowl Chandelier
DVD.ActiveItems[265925] = { decorID = 17610, model3D = 7550547, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Razorwind Bowl Chandelier
DVD.ActiveItems[265926] = { decorID = 17611, model3D = 7550548, soldBy = {255222, 255278}, source = "vendor", noxp = true } -- Low-Hanging Razorwind Bowl Chandelier
DVD.ActiveItems[236653] = { decorID = 522, model3D = 1337, soldBy = {255278, 255222}, sources = {"vendor", "121"}, noxp = true } -- Orgrimmar Interior Narrow Wall
DVD.ActiveItems[236654] = { decorID = 523, model3D = 1337, soldBy = {255278, 255222}, sources = {"vendor", "121"}, noxp = true } -- Orgrimmar Interior Doorway
DVD.ActiveItems[236655] = { decorID = 524, model3D = 1337, soldBy = {255278, 255222}, sources = {"vendor", "121"}, noxp = true } -- Orgrimmar Interior Wall
DVD.ActiveItems[236666] = { decorID = 525, model3D = 1337, soldBy = {255278, 255222}, sources = {"vendor", "121"}, noxp = true } -- Orgrimmar Round Interior Pillar
DVD.ActiveItems[236667] = { decorID = 526, model3D = 1337, soldBy = {255278, 255222}, sources = {"vendor", "121"}, noxp = true } -- Orgrimmar Square Interior Pillar
DVD.ActiveItems[245393] = { decorID = 534, model3D = 1337, soldBy = {255278, 255222, 255325, 255203}, source = "vendor", noxp = true } -- Plain Interior Wall
DVD.ActiveItems[245394] = { decorID = 535, model3D = 1337, soldBy = {255278, 255222, 255325, 255203}, source = "vendor", noxp = true } -- Plain Interior Doorway
DVD.ActiveItems[245395] = { decorID = 536, model3D = 1337, soldBy = {255278, 255222, 255325, 255203}, source = "vendor", noxp = true } -- Plain Interior Narrow Wall
end

do -- 🏪 VENDOR NPC: 255297 (Shon'ja) 255228 (Len Splinthoof Alliance)
DVD.ActiveItems[244532] = { decorID = 1436, model3D = 6379059, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Rugged Stool
DVD.ActiveItems[244535] = { decorID = 1439, model3D = 6435780, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Tusked Gazebo
DVD.ActiveItems[245533] = { decorID = 1724, model3D = 6379087, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Rugged Brazier
DVD.ActiveItems[245546] = { decorID = 1737, model3D = 6379069, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Durable Wooden Chest
DVD.ActiveItems[246217] = { decorID = 2087, model3D = 6379060, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Short Orgrimmar Bench
DVD.ActiveItems[246218] = { decorID = 2088, model3D = 6379079, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Iron-Reinforced Crate
DVD.ActiveItems[246220] = { decorID = 2090, model3D = 6435783, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Leather-Banded Wooden Bench
DVD.ActiveItems[246241] = { decorID = 2098, model3D = 6379080, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Spiky Banded Barrel
DVD.ActiveItems[246611] = { decorID = 2443, model3D = 6435782, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Fountain
DVD.ActiveItems[246612] = { decorID = 2444, model3D = 6435784, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Logger's Picnic Table
DVD.ActiveItems[246615] = { decorID = 2447, model3D = 7009611, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Open Spiky Banded Barrel
DVD.ActiveItems[246616] = { decorID = 2448, model3D = 7009612, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Open Iron-Reinforced Crate
DVD.ActiveItems[246868] = { decorID = 2534, model3D = 6379062, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Wide Hide-Covered Bench
DVD.ActiveItems[246880] = { decorID = 2546, model3D = 7080284, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Horned Banded Barrel
DVD.ActiveItems[246881] = { decorID = 2547, model3D = 7080285, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Open Horned Banded Barrel
DVD.ActiveItems[246882] = { decorID = 2548, model3D = 7080288, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Long Orgrimmar Bench
DVD.ActiveItems[246883] = { decorID = 2549, model3D = 7080295, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Crude Banded Crate
DVD.ActiveItems[246884] = { decorID = 2550, model3D = 7080296, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Open Crude Banded Crate
DVD.ActiveItems[249550] = { decorID = 5561, model3D = 7109341, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Wind Rider Roost
DVD.ActiveItems[251545] = { decorID = 8236, model3D = 7048168, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Cooking Grill
DVD.ActiveItems[251637] = { decorID = 8769, model3D = 6435773, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Tusked Weapon Stand
DVD.ActiveItems[251638] = { decorID = 8770, model3D = 7009609, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Jagged Orgrimmar Trellis
DVD.ActiveItems[254893] = { decorID = 10791, model3D = 7080298, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Large Razorwind Gazebo
DVD.ActiveItems[255708] = { decorID = 10892, model3D = 7080310, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Small Jagged Orgrimmar Trellis
DVD.ActiveItems[256357] = { decorID = 11139, model3D = 7080292, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Porch Chair
DVD.ActiveItems[257099] = { decorID = 11437, model3D = 7080313, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Covered Well
DVD.ActiveItems[267083] = { decorID = 18618, model3D = 7080289, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Campfire Grill
DVD.ActiveItems[263031] = { decorID = 14817, model3D = 6938188, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Twisted Rope Coil
DVD.ActiveItems[251012] = { decorID = 7872, model3D = 6938182, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Painted Wood Scrap Pile
DVD.ActiveItems[251011] = { decorID = 7871, model3D = 6938181, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Painted Wood Scraps
DVD.ActiveItems[263582] = { decorID = 15262, model3D = 6938186, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Roofer's Shingle Pile
DVD.ActiveItems[263581] = { decorID = 15261, model3D = 6938185, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Roofer's Shingle
DVD.ActiveItems[253019] = { decorID = 9177, model3D = 6794472, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Banded Planter
DVD.ActiveItems[252008] = { decorID = 8978, model3D = 6794474, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Wheelbarrow
DVD.ActiveItems[258663] = { decorID = 12192, model3D = 6938173, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind River Paddle
DVD.ActiveItems[255709] = { decorID = 10893, model3D = 6938172, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Shores Canoe
DVD.ActiveItems[258300] = { decorID = 11943, model3D = 7266541, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Sparse Razorwind Fisher's Rack
DVD.ActiveItems[258307] = { decorID = 11949, model3D = 6938178, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Fisher's Rack
DVD.ActiveItems[263032] = { decorID = 14818, model3D = 6938208, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Fishing Net
DVD.ActiveItems[263584] = { decorID = 15264, model3D = 6938217, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Construction Crane
DVD.ActiveItems[260488] = { decorID = 14348, model3D = 6938198, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Small Razorwind Farmer's Hay Pile
DVD.ActiveItems[260487] = { decorID = 14347, model3D = 6938197, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Razorwind Farmer's Hay Pile
DVD.ActiveItems[260486] = { decorID = 14346, model3D = 6938196, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Large Razorwind Farmer's Hay Pile
DVD.ActiveItems[263583] = { decorID = 15263, model3D = 6938199, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Tiny Clump of Hay
DVD.ActiveItems[267616] = { decorID = 19159, model3D = 7583302, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Loose Wisps of Hay
DVD.ActiveItems[268028] = { decorID = 19217, model3D = 7583305, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Trampled Wisps of Hay
DVD.ActiveItems[268027] = { decorID = 19216, model3D = 7583304, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Windblown Wisps of Hay
DVD.ActiveItems[268026] = { decorID = 19215, model3D = 7583303, soldBy = {255297, 255228}, source = "vendor", noxp = true } -- Scattered Wisps of Hay
end

do -- 🏪 VENDOR NPC: 255299 (Lefton Farrer 14) 255218 (Argan Hammerfist)
DVD.ActiveItems[241623] = { decorID = 990, model3D = 6435037, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elegant Elven Barrel
DVD.ActiveItems[243088] = { decorID = 1155, model3D = 6435831, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Standing Ornate Weapon Rack
DVD.ActiveItems[244118] = { decorID = 1350, model3D = 6435836, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Rectangular Elegant Table
DVD.ActiveItems[244169] = { decorID = 1356, model3D = 6435023, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elegant Almond Table
DVD.ActiveItems[244780] = { decorID = 1486, model3D = 6435022, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Circular Elven Table
DVD.ActiveItems[244782] = { decorID = 1488, model3D = 6435041, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elven Floral Window
DVD.ActiveItems[247502] = { decorID = 3827, model3D = 6855760, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elven Woodvine Trellis
DVD.ActiveItems[248658] = { decorID = 4484, model3D = 6435036, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elven Wood Crate
DVD.ActiveItems[253437] = { decorID = 986, model3D = 6435019, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elegant Covered Bench
DVD.ActiveItems[253439] = { decorID = 991, model3D = 6711382, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elegant Carved Bench
DVD.ActiveItems[253495] = { decorID = 1165, model3D = 6435835, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Grand Elven Bench
DVD.ActiveItems[257691] = { decorID = 11720, model3D = 6712073, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Open Elegant Elven Barrel
DVD.ActiveItems[257692] = { decorID = 11721, model3D = 7412674, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elegant Curved Table
DVD.ActiveItems[267202] = { decorID = 18793, model3D = 7552514, soldBy = {255299, 255218}, source = "vendor", noxp = true } -- Elegant Elven Water Well
end

do -- 🏪 VENDOR NPC: 255301 (Botanist Boh'an 32) 255230 ("Yen" Malone)
DVD.ActiveItems[248625] = { decorID = 4451, model3D = 5917522, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Succulent Palm
DVD.ActiveItems[248626] = { decorID = 4452, model3D = 5930373, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Fighting Cactus
DVD.ActiveItems[248627] = { decorID = 4453, model3D = 5975189, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Tumbleweed
DVD.ActiveItems[248628] = { decorID = 4454, model3D = 6009471, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Palm Tree
DVD.ActiveItems[248629] = { decorID = 4455, model3D = 6043927, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Nagrand Blueberry Bush
DVD.ActiveItems[248630] = { decorID = 4456, model3D = 6043931, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Barrens Hosta Bush
DVD.ActiveItems[248631] = { decorID = 4457, model3D = 6043949, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Azsharan Firespear Tree
DVD.ActiveItems[248632] = { decorID = 4458, model3D = 6067030, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Hardy Razorwind Grass Patch
DVD.ActiveItems[248633] = { decorID = 4459, model3D = 6135282, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Flowering Durotar Cactus
DVD.ActiveItems[248634] = { decorID = 4460, model3D = 6363040, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Acacia Tree
DVD.ActiveItems[248636] = { decorID = 4462, model3D = 6695766, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Gobtree
DVD.ActiveItems[248637] = { decorID = 4463, model3D = 6711665, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Sunset Aster Flowers
DVD.ActiveItems[248638] = { decorID = 4464, model3D = 6711668, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Pink Razorwind Paintbrush
DVD.ActiveItems[248650] = { decorID = 4476, model3D = 6933428, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Razorwind Flamebrush
DVD.ActiveItems[257359] = { decorID = 11461, model3D = 7291386, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Slate Cobblestone Pair
DVD.ActiveItems[257388] = { decorID = 11479, model3D = 7291384, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Slate Cobblestone
DVD.ActiveItems[257390] = { decorID = 11481, model3D = 7296327, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Slate Cobblestone Path
DVD.ActiveItems[257392] = { decorID = 11482, model3D = 7291385, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Slate Cobblestone Trio
DVD.ActiveItems[260701] = { decorID = 14382, model3D = 6024875, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Red Razorwind Paintbrush
DVD.ActiveItems[260702] = { decorID = 14383, model3D = 6067033, soldBy = {255301, 255230}, source = "vendor", noxp = true } -- Dry Razorwind Grass Patch
DVD.ActiveItems[266234] = { decorID = 17863, model3D = 7552284, soldBy = {255230, 255301}, source = "vendor", noxp = true } -- Saltfang Shoals Large Garden Cluster
DVD.ActiveItems[266235] = { decorID = 17864, model3D = 7552285, soldBy = {255230, 255301}, source = "vendor", noxp = true } -- Razorwind Cactus Large Garden Cluster
DVD.ActiveItems[266236] = { decorID = 17865, model3D = 7552286, soldBy = {255230, 255301}, source = "vendor", noxp = true } -- Razorwind Blooms Large Garden Cluster
DVD.ActiveItems[266237] = { decorID = 17866, model3D = 7552287, soldBy = {255230, 255301}, source = "vendor", noxp = true } -- Runetotem's Bounty Large Garden Cluster
DVD.ActiveItems[266238] = { decorID = 17867, model3D = 7552288, soldBy = {255230, 255301}, source = "vendor", noxp = true } -- Cragthorn Highlands Large Garden Cluster
end

do -- 🏪 VENDOR NPC: 255325 ("High Tides" Ren Horde) 255203 (Xiao Dan)
DVD.ActiveItems[235633] = { decorID = 498, model3D = 6375820, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Circular Woolen Rug
DVD.ActiveItems[239075] = { decorID = 726, model3D = 6712076, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Wrought Iron Chandelier
DVD.ActiveItems[242255] = { decorID = 1044, model3D = 6390440, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Stormwind Hall Rug
DVD.ActiveItems[244530] = { decorID = 1434, model3D = 6390438, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wall Rack
DVD.ActiveItems[244531] = { decorID = 1435, model3D = 6390441, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Fireplace
DVD.ActiveItems[244664] = { decorID = 1454, model3D = 6390445, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Tied-Open Folk Curtains
DVD.ActiveItems[244665] = { decorID = 1455, model3D = 6390446, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Closed Folk Curtains
DVD.ActiveItems[244666] = { decorID = 1456, model3D = 6390447, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Durable Folk Valance
DVD.ActiveItems[245267] = { decorID = 1701, model3D = 6390442, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Charming Seat Cushion
DVD.ActiveItems[245268] = { decorID = 1702, model3D = 6435011, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Checkered Charming Seat Cushion
DVD.ActiveItems[245334] = { decorID = 1123, model3D = 6390444, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Wicker Basket
DVD.ActiveItems[245335] = { decorID = 1244, model3D = 6712067, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Empty Wicker Basket
DVD.ActiveItems[245352] = { decorID = 483, model3D = 6324626, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Coffin
DVD.ActiveItems[245353] = { decorID = 484, model3D = 6324627, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Open Wooden Coffin
DVD.ActiveItems[245354] = { decorID = 478, model3D = 6319980, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Wooden Coffin Lid
DVD.ActiveItems[245355] = { decorID = 378, model3D = 6008934, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Interior Door
DVD.ActiveItems[245356] = { decorID = 389, model3D = 6008945, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Goldshire Window
DVD.ActiveItems[245358] = { decorID = 379, model3D = 6008935, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Small Fruit Platter
DVD.ActiveItems[245383] = { decorID = 388, model3D = 6008944, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- "Sunrise Canyon" Painting
DVD.ActiveItems[245384] = { decorID = 374, model3D = 6008929, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Shelf
DVD.ActiveItems[245547] = { decorID = 1738, model3D = 6390431, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Wide Charming Couch
DVD.ActiveItems[245548] = { decorID = 1739, model3D = 6390435, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Iron-Reinforced Cupboard
DVD.ActiveItems[245556] = { decorID = 1745, model3D = 6390439, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Iron-Reinforced Standing Mirror
DVD.ActiveItems[246101] = { decorID = 1991, model3D = 6390428, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Small Wooden Stool
DVD.ActiveItems[246243] = { decorID = 2099, model3D = 7000933, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Stormwind Beam Platform
DVD.ActiveItems[246245] = { decorID = 2100, model3D = 7000934, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Stormwind Round Platform
DVD.ActiveItems[246246] = { decorID = 2101, model3D = 7000935, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Stormwind Large Platform
DVD.ActiveItems[246247] = { decorID = 2102, model3D = 7000936, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Stormwind Small Platform
DVD.ActiveItems[246248] = { decorID = 2103, model3D = 7000937, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Stormwind Angled Platform
DVD.ActiveItems[246502] = { decorID = 2342, model3D = 6390430, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Charming Couch
DVD.ActiveItems[252417] = { decorID = 9064, model3D = 7291553, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Plush Cushioned Chair
DVD.ActiveItems[252659] = { decorID = 9144, model3D = 7302333, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Founder's Point Front Door
DVD.ActiveItems[253589] = { decorID = 9471, model3D = 7151263, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Short Wooden Cabinet
DVD.ActiveItems[253592] = { decorID = 9473, model3D = 7151265, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Washbasin
DVD.ActiveItems[253593] = { decorID = 9474, model3D = 7151266, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Bathtub
DVD.ActiveItems[258670] = { decorID = 12199, model3D = 7387380, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Empty Wooden Bathtub
DVD.ActiveItems[235675] = { decorID = 377, model3D = 6008933, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Three-Candle Wrought Iron Chandelier
DVD.ActiveItems[235677] = { decorID = 383, model3D = 6008939, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Wrought Iron Floor Lamp
DVD.ActiveItems[245375] = { decorID = 373, model3D = 6008928, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Bookcase
DVD.ActiveItems[245376] = { decorID = 390, model3D = 6046867, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Tall Sturdy Wooden Bookcase
DVD.ActiveItems[246103] = { decorID = 1993, model3D = 6390436, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Small Wooden Nightstand
DVD.ActiveItems[245336] = { decorID = 495, model3D = 6373411, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Sturdy Wooden Bed
DVD.ActiveItems[245370] = { decorID = 1083, model3D = 6840500, soldBy = {255325, 255203}, source = "vendor", noxp = true } -- Secretive Bookcase Wall
DVD.ActiveItems[244778] = { decorID = 1482, model3D = 1591071, soldBy = {255222, 255325}, source = "vendor", noxp = true } -- Sethraliss Priest's Pillow
DVD.ActiveItems[246934] = { decorID = 2578, model3D = 6794411, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Small Covered Wooden Table
DVD.ActiveItems[246935] = { decorID = 2579, model3D = 6794413, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Small Sturdy Wooden Table
DVD.ActiveItems[250092] = { decorID = 5851, model3D = 6794418, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Small Wooden Footstool
DVD.ActiveItems[252037] = { decorID = 8985, model3D = 6794412, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Covered Wooden Desk
DVD.ActiveItems[252038] = { decorID = 8986, model3D = 6794414, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Sturdy Wooden Desk
DVD.ActiveItems[258570] = { decorID = 12174, model3D = 7338171, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Refined Wooden Bed
DVD.ActiveItems[262962] = { decorID = 14807, model3D = 7338173, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Carved Wooden Chair
DVD.ActiveItems[266233] = { decorID = 17862, model3D = 7205469, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Short Hanging Tavern Lantern
DVD.ActiveItems[266249] = { decorID = 17879, model3D = 7205470, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Hanging Tavern Lantern
DVD.ActiveItems[266250] = { decorID = 17880, model3D = 7205471, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Long Hanging Tavern Lantern
DVD.ActiveItems[268029] = { decorID = 19218, model3D = 7583306, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Mounted Founder's Point Lantern
DVD.ActiveItems[268030] = { decorID = 19219, model3D = 7583307, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Mounted Tavern Lantern
DVD.ActiveItems[272359] = { decorID = 21950, model3D = 7798088, soldBy = {255203, 255325}, source = "vendor", noxp = true } -- Square Woolen Rug
DVD.ActiveItems[246106] = { decorID = 1996, model3D = 6390548, soldBy = {255326, 255325, 255203, 255213}, source = "vendor", noxp = true } -- Wooden Chamberstick
DVD.ActiveItems[236675] = { decorID = 527, model3D = 1337, soldBy = {255325, 255203}, sources = {"vendor", "121"}, noxp = true } -- Stormwind Interior Pillar
DVD.ActiveItems[236676] = { decorID = 528, model3D = 1337, soldBy = {255325, 255203}, sources = {"vendor", "121"}, noxp = true } -- Stormwind Interior Narrow Wall
DVD.ActiveItems[236677] = { decorID = 529, model3D = 1337, soldBy = {255325, 255203}, sources = {"vendor", "121"}, noxp = true } -- Stormwind Interior Wall
DVD.ActiveItems[236678] = { decorID = 530, model3D = 1337, soldBy = {255325, 255203}, sources = {"vendor", "121"}, noxp = true } -- Stormwind Interior Doorway
DVD.ActiveItems[245392] = { decorID = 533, model3D = 1337, soldBy = {255325, 255203}, sources = {"vendor", "121"}, noxp = true } -- Sturdy Wooden Interior Pillar
end

do -- 🏪 VENDOR NPC: 255326 ("Len" Splinthoof) 255213 (Faarden the Builder)
DVD.ActiveItems[235523] = { decorID = 494, model3D = 6372825, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Wooden Chair
DVD.ActiveItems[242951] = { decorID = 1122, model3D = 6390429, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Wooden Bench
DVD.ActiveItems[243334] = { decorID = 1280, model3D = 6390437, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Reinforced Wooden Chest
DVD.ActiveItems[244667] = { decorID = 1457, model3D = 6390452, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Restful Wooden Bench
DVD.ActiveItems[245357] = { decorID = 482, model3D = 6324625, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Gryphon Roost
DVD.ActiveItems[245359] = { decorID = 488, model3D = 6324637, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Large Stonework Fountain
DVD.ActiveItems[245360] = { decorID = 487, model3D = 6324635, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Small Stonework Fountain
DVD.ActiveItems[245365] = { decorID = 479, model3D = 6324619, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Empty Stormwind Market Stand
DVD.ActiveItems[245366] = { decorID = 480, model3D = 6324620, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Stormwind Bean Seller's Stand
DVD.ActiveItems[245367] = { decorID = 770, model3D = 6324621, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Stormwind Produce Seller's Stand
DVD.ActiveItems[245368] = { decorID = 481, model3D = 6324622, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Stormwind Spice Merchant's Stand
DVD.ActiveItems[245372] = { decorID = 496, model3D = 6373543, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Covered Wooden Table
DVD.ActiveItems[245374] = { decorID = 497, model3D = 6373544, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Wooden Table
DVD.ActiveItems[245377] = { decorID = 485, model3D = 6324628, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Open-Air Sturdy Tent
DVD.ActiveItems[245378] = { decorID = 486, model3D = 6324629, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Sheltering Tent
DVD.ActiveItems[245379] = { decorID = 489, model3D = 6324639, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Roofed Wagon
DVD.ActiveItems[245380] = { decorID = 490, model3D = 6324640, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Open Wagon
DVD.ActiveItems[245382] = { decorID = 491, model3D = 6324641, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Covered Wagon
DVD.ActiveItems[245385] = { decorID = 492, model3D = 6324642, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Well-Built Well
DVD.ActiveItems[245386] = { decorID = 493, model3D = 6324643, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Wooden Wheelbarrow
DVD.ActiveItems[245551] = { decorID = 1742, model3D = 6390433, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Worker's Wooden Desk
DVD.ActiveItems[245656] = { decorID = 1862, model3D = 6390449, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Wooden Gazebo
DVD.ActiveItems[245657] = { decorID = 1863, model3D = 6390451, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Stonework Fountain
DVD.ActiveItems[245662] = { decorID = 1878, model3D = 6390434, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Carved Wooden Bar Table
DVD.ActiveItems[246102] = { decorID = 1992, model3D = 6390432, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Large Covered Wooden Table
DVD.ActiveItems[246104] = { decorID = 1994, model3D = 6390443, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Carved Wooden Crate
DVD.ActiveItems[246105] = { decorID = 1995, model3D = 6390448, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Weapon Rack
DVD.ActiveItems[246107] = { decorID = 1997, model3D = 6435012, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Large Sturdy Wooden Table
DVD.ActiveItems[246109] = { decorID = 1999, model3D = 6712066, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Open Carved Wooden Crate
DVD.ActiveItems[246219] = { decorID = 2089, model3D = 6390453, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Weather-Treated Wooden Table
DVD.ActiveItems[246588] = { decorID = 2385, model3D = 6996568, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Wooden Trellis
DVD.ActiveItems[246742] = { decorID = 2496, model3D = 6390427, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Tall Sturdy Wooden Chair
DVD.ActiveItems[253590] = { decorID = 9472, model3D = 7151264, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Coal-Fired Stovetop
DVD.ActiveItems[263025] = { decorID = 14814, model3D = 7487232, soldBy = {255326, 255213}, source = "vendor", noxp = true } -- Sturdy Wine Press
DVD.ActiveItems[246803] = { decorID = 2506, model3D = 6794415, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Arched Wooden Bench
DVD.ActiveItems[246870] = { decorID = 2536, model3D = 6794407, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Farmer's Water Trough
DVD.ActiveItems[246872] = { decorID = 2538, model3D = 6794416, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Carved Stone Bench
DVD.ActiveItems[246874] = { decorID = 2540, model3D = 6794419, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Sturdy Brazier
DVD.ActiveItems[246875] = { decorID = 2541, model3D = 6794422, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Street Light
DVD.ActiveItems[246876] = { decorID = 2542, model3D = 6794423, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Lamppost
DVD.ActiveItems[246877] = { decorID = 2543, model3D = 6918564, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Sturdy Feeding Trough
DVD.ActiveItems[248400] = { decorID = 4422, model3D = 6794424, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Signpost
DVD.ActiveItems[249822] = { decorID = 5687, model3D = 6794425, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Street Sign
DVD.ActiveItems[249823] = { decorID = 5688, model3D = 7139687, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Navigation Sign
DVD.ActiveItems[250095] = { decorID = 5855, model3D = 7139667, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Runed Stone Placard
DVD.ActiveItems[250249] = { decorID = 7582, model3D = 7233300, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Gravestone
DVD.ActiveItems[250250] = { decorID = 7583, model3D = 7233301, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Small Founder's Point Gravestone
DVD.ActiveItems[250251] = { decorID = 7584, model3D = 7233302, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Tall Founder's Point Gravestone
DVD.ActiveItems[250252] = { decorID = 7585, model3D = 7233303, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Large Founder's Point Gravestone
DVD.ActiveItems[252004] = { decorID = 8974, model3D = 6794409, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Wooden Planter Pot
DVD.ActiveItems[252005] = { decorID = 8975, model3D = 6794410, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Wooden Planter Row
DVD.ActiveItems[252006] = { decorID = 8976, model3D = 6794426, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Fence
DVD.ActiveItems[252007] = { decorID = 8977, model3D = 6794427, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Long Founder's Point Fence
DVD.ActiveItems[252407] = { decorID = 9056, model3D = 6794420, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Framed Torch
DVD.ActiveItems[252408] = { decorID = 9057, model3D = 6794428, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Long Old Founder's Point Fence
DVD.ActiveItems[252409] = { decorID = 9058, model3D = 6794429, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Old Founder's Point Fence
DVD.ActiveItems[252410] = { decorID = 9059, model3D = 6794430, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Fencepost
DVD.ActiveItems[252412] = { decorID = 9060, model3D = 6794431, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Old Founder's Point Fencepost
DVD.ActiveItems[252414] = { decorID = 9062, model3D = 6933770, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Broken Founder's Point Fence
DVD.ActiveItems[252416] = { decorID = 9063, model3D = 6933771, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Old Broken Founder's Point Fence
DVD.ActiveItems[253018] = { decorID = 9176, model3D = 6794421, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Standing Torch
DVD.ActiveItems[253707] = { decorID = 9630, model3D = 7338178, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Open Sturdy Wooden Crate
DVD.ActiveItems[258565] = { decorID = 12169, model3D = 6930900, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Reinforced Wooden Barrel
DVD.ActiveItems[258566] = { decorID = 12170, model3D = 6930901, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Empty Reinforced Wooden Barrel
DVD.ActiveItems[258818] = { decorID = 12214, model3D = 7338174, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Padded Wooden Bench
DVD.ActiveItems[258819] = { decorID = 12215, model3D = 7338177, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Sturdy Wooden Crate
DVD.ActiveItems[246871] = { decorID = 2537, model3D = 6794408, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Hay-Filled Sturdy Feeding Trough
DVD.ActiveItems[267084] = { decorID = 18619, model3D = 7550626, soldBy = {255213, 255326}, source = "vendor", noxp = true } -- Founder's Point Hay Bale
end

do -- 🏪 VENDOR NPC: 255495 (Rae'ana)
DVD.ActiveItems[273159] = {decorID = 22143, model3D = 7761091, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Void Elf Scribe's Desk
DVD.ActiveItems[273135] = {decorID = 22181, model3D = 7761099, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Void Elf Floating Desk
DVD.ActiveItems[273142] = {decorID = 22182, model3D = 7815448, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"}-- Runic Parchment
DVD.ActiveItems[273157] = {decorID = 22183, model3D = 7815449, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Voidflame Candle
DVD.ActiveItems[273147] = {decorID = 22388, model3D = 7761093, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Void Inkwell
DVD.ActiveItems[271158] = {decorID = 21598, model3D = 5975183, requirement = { type = "renown", faction = "Ritual Sites", level = 7 }, soldBy = {255495}, source = "vendor"} -- Dark Obelisk
DVD.ActiveItems[276083] = { decorID = 25307, model3D = 7940395, soldBy = {255495}, source = "achievement" } -- Sunstrider Omnium Simulacrum
end

do -- 🏪 VENDOR NPC: 256026 (Irodalmin)
DVD.ActiveItems[264003] = { decorID = 15408, model3D = 6049344, soldBy = {256026}, source = "achievement", noxp = true } -- Midnight Herbalist's Shop Sign
end

do -- 🏪 VENDOR NPC: 256071 (Solelo) 256119 (Lonalo)
DVD.ActiveItems[239177] = { decorID = 766, model3D = 6717970, soldBy = {256071, 256119}, source = "vendor", noxp = true } -- Open Tome of Twilight Nihilism
DVD.ActiveItems[239179] = { decorID = 768, model3D = 6717974, soldBy = {256071, 256119}, source = "vendor" } -- Tome of Twilight Nihilism
DVD.ActiveItems[246845] = { decorID = 2511, model3D = 375548, soldBy = {256071, 256119}, source = "vendor" } -- Tome of Shadowforge Cunning
DVD.ActiveItems[246847] = { decorID = 2513, model3D = 916183, soldBy = {256071, 256119}, source = "vendor", noxp = true } -- Tome of Draenei Faith
DVD.ActiveItems[246848] = { decorID = 2514, model3D = 948845, soldBy = {256071, 256119}, source = "vendor" } -- Scribe's Working Notes
DVD.ActiveItems[246860] = { decorID = 2526, model3D = 2499912, soldBy = {256071, 256119}, source = "vendor" } -- Tome of Forsaken Resilience
end

do -- 🏪 VENDOR NPC: 256750 (Klasa 5) 240465 (Lonomia 5)
DVD.ActiveItems[245400] = { decorID = 721, model3D = 6709919, soldBy = {256750, 240465}, source = "vendor", noxp = true } -- Ceiling Cobweb
DVD.ActiveItems[245401] = { decorID = 722, model3D = 6709920, soldBy = {256750, 240465}, source = "vendor", noxp = true } -- Tented Cobweb
DVD.ActiveItems[245402] = { decorID = 723, model3D = 6709924, soldBy = {256750, 240465}, source = "vendor", noxp = true } -- Small Dangling Cobweb
DVD.ActiveItems[245403] = { decorID = 724, model3D = 6709925, soldBy = {256750, 240465}, source = "vendor", noxp = true } -- Large Dangling Cobweb
DVD.ActiveItems[245404] = { decorID = 725, model3D = 6709926, soldBy = {256750, 240465}, source = "vendor", noxp = true } -- Pillar Cobweb
end

do -- 🏪 VENDOR NPC: 256783 (Gabbun)
DVD.ActiveItems[258262] = { decorID = 11930, model3D = 5169937, soldBy = {256783}, source = "quest", noxp = true } -- Kobold Digger's Chair
DVD.ActiveItems[258264] = { decorID = 11931, model3D = 5169939, soldBy = {256783}, source = "quest", noxp = true } -- Kobold Candle Trio
DVD.ActiveItems[258265] = { decorID = 11932, model3D = 5169958, soldBy = {256783}, source = "quest", noxp = true } -- Kobold Wagon
DVD.ActiveItems[258267] = { decorID = 11933, model3D = 5169960, soldBy = {256783}, source = "quest", noxp = true } -- Candle-Festooned Wooden Awning
end

do -- 🏪 VENDOR NPC: 256826 (Mrgrgrl)
DVD.ActiveItems[258222] = { decorID = 11908, model3D = 1091599, soldBy = {256826}, source = "quest", noxp = true } -- Shellscale Standard
end

do-- 🏪 VENDOR NPC: 256828 (Dennia Silvertongue)
DVD.ActiveItems[244668] = { decorID = 1458, model3D = 6905005, soldBy = {256828}, source = "vendor", noxp = true } -- Light-Infused Fountain
DVD.ActiveItems[245939] = { decorID = 1894, model3D = 6905006, soldBy = {256828}, source = "vendor", noxp = true } -- Void-Corrupted Fountain
DVD.ActiveItems[246414] = { decorID = 2231, model3D = 7011540, soldBy = {256828}, source = "vendor", noxp = true } -- Light-Infused Rotunda
DVD.ActiveItems[248809] = { decorID = 4843, model3D = 7011541, soldBy = {256828}, source = "vendor", noxp = true } -- Void-Corrupted Rotunda
DVD.ActiveItems[252666] = { decorID = 9149, model3D = 7301966, soldBy = {256828}, source = "vendor", noxp = true } -- "The High Exarch" Painting
DVD.ActiveItems[252667] = { decorID = 9150, model3D = 7301967, soldBy = {256828}, source = "vendor", noxp = true } -- "The Ranger of the Void" Painting
DVD.ActiveItems[252668] = { decorID = 9151, model3D = 7301968, soldBy = {256828}, source = "vendor", noxp = true } -- "The Harbinger" Painting
DVD.ActiveItems[252669] = { decorID = 9152, model3D = 7301965, soldBy = {256828}, source = "vendor", noxp = true } -- "The Redeemer" Painting
DVD.ActiveItems[259046] = { decorID = 12246, model3D = 7413969, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Bed
DVD.ActiveItems[259093] = { decorID = 12264, model3D = 7414328, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Dog House Frame
DVD.ActiveItems[259044] = { decorID = 12244, model3D = 7410979, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Water Dish
DVD.ActiveItems[259045] = { decorID = 12245, model3D = 7410980, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Bed and Blanket
DVD.ActiveItems[259094] = { decorID = 12265, model3D = 7414331, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Dog House Elwynn Roof
DVD.ActiveItems[264275] = { decorID = 15547, model3D = 7414329, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Dog House Durotar Roof
DVD.ActiveItems[264276] = { decorID = 15548, model3D = 7414330, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Dog House Eversong Roof
DVD.ActiveItems[264277] = { decorID = 15549, model3D = 7414332, soldBy = {256828}, source = "vendor", noxp = true } -- Paw Pal Dog House Shadowglen Roof
end

do -- 🏪 VENDOR NPC: 256828 (Dennia Silvertongue) 261231 (Tuuran) 261262 (Gabbi)
DVD.ActiveItems[264281] = { decorID = 15553, model3D = 7497316, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Pinterest Collab" } -- Preserved Gift of Gilneas
DVD.ActiveItems[264282] = { decorID = 15554, model3D = 7501256, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Pinterest Collab" } -- Bluebird's Golden Cage
DVD.ActiveItems[264283] = { decorID = 15555, model3D = 7501257, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Pinterest Collab" } -- Backboard and Hoop Playset
DVD.ActiveItems[264396] = { decorID = 15668, model3D = 7476057, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Zillow Collab" } -- Naturally Elegant Doormat
DVD.ActiveItems[264397] = { decorID = 15669, model3D = 7476058, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Zillow Collab" } -- Simply Adorned Vase and Flowers
DVD.ActiveItems[263383] = { decorID = 15229, model3D = 7483958, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Fanta Collab" } -- Corked Bottle of Liquid Mystery
DVD.ActiveItems[264279] = { decorID = 15551, model3D = 7493773, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Fanta Collab" } -- Tall Corked Bottle of Liquid Mystery
DVD.ActiveItems[264280] = { decorID = 15552, model3D = 7493774, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Fanta Collab" } -- Short Corked Bottle of Liquid Mystery
DVD.ActiveItems[264278] = { decorID = 15550, model3D = 7483941, soldBy = {256828, 261231, 261262}, source = "collab", noxp = true, note = "Fanta Collab" } -- Sturdy Portable Ice Chest
DVD.ActiveItems[256764] = { decorID = 11287, model3D = 7324189, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary's Horadric Cube
DVD.ActiveItems[259055] = { decorID = 12247, model3D = 7388891, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Hatred's Wolfpelt Rug
DVD.ActiveItems[259056] = { decorID = 12248, model3D = 7388893, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Prime Evil's Chest
DVD.ActiveItems[259057] = { decorID = 12249, model3D = 7388894, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary's Chess Match
DVD.ActiveItems[259058] = { decorID = 12250, model3D = 7388920, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary's Chess Board
DVD.ActiveItems[259059] = { decorID = 12251, model3D = 7433392, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Dark Bishop
DVD.ActiveItems[259060] = { decorID = 12252, model3D = 7433393, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Dark Rook
DVD.ActiveItems[259061] = { decorID = 12253, model3D = 7433395, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Dark Queen
DVD.ActiveItems[259062] = { decorID = 12254, model3D = 7433396, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Dark Pawn
DVD.ActiveItems[259063] = { decorID = 12255, model3D = 7433397, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Dark Knight
DVD.ActiveItems[259064] = { decorID = 12256, model3D = 7433398, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Dark King
DVD.ActiveItems[259065] = { decorID = 12257, model3D = 7433399, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Light Bishop
DVD.ActiveItems[259066] = { decorID = 12258, model3D = 7433400, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Light Rook
DVD.ActiveItems[259067] = { decorID = 12259, model3D = 7433401, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Light Queen
DVD.ActiveItems[259068] = { decorID = 12260, model3D = 7433402, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Light Pawn
DVD.ActiveItems[259069] = { decorID = 12261, model3D = 7433403, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Light Knight
DVD.ActiveItems[259070] = { decorID = 12262, model3D = 7433404, soldBy = {256828, 261231, 261262}, source = "vendor", noxp = true } -- Sanctuary Chess Light King
DVD.ActiveItems[260785] = { decorID = 14467, model3D = 7476464, soldBy = {256828, 261231, 261262}, source = "achievement", noxp = true } -- Miniature Replica Dark Portal
DVD.ActiveItems[263298] = { decorID = 15148, model3D = 7493566, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}, promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "March 2026 Drop"}-- Cuddly Alliance Blue Grrgle
DVD.ActiveItems[263299] = { decorID = 15149, model3D = 7493568, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}, promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "March 2026 Drop"}-- Cuddly Horde Red Grrgle
DVD.ActiveItems[263301] = { decorID = 15151, model3D = 7493973, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}, promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "Jan 2026 Drop"}-- Cuddly Green Grrgle
DVD.ActiveItems[265394] = { decorID = 16818, model3D = 7531449, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}, promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "May 2026 Drop"}-- Cuddly Pearl Grrgle
DVD.ActiveItems[265545] = { decorID = 16965, model3D = 7525444, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}, promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "April 2026 Drop"}-- Cuddly Void Grrgle	
DVD.ActiveItems[265389] = { decorID = 16813, model3D = 7525412, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}, promotionType = "Twitch Drop", promotionStatus = "PREVIOUS", promotionName = "June 2026 Drop"}-- Cuddly Cotton Candy Grrgle
end

do -- 🏪 VENDOR NPC: 256946 (Duskcaller Erthix)
DVD.ActiveItems[258742] = { decorID = 12202, model3D = 968424, soldBy = {256946}, source = "quest", noxp = true } -- Scroll of the Adherent
end

do -- 🏪 VENDOR NPC: 257897 (Harlowe Marl)
DVD.ActiveItems[264915] = { decorID = 16227, model3D = 4689406, soldBy = {257897}, source = "vendor", noxp = true } -- Decorated Underground Table
DVD.ActiveItems[264916] = { decorID = 16228, model3D = 4689410, soldBy = {257897}, source = "vendor", noxp = true } -- Loamm Bartering Stall
DVD.ActiveItems[264917] = { decorID = 16229, model3D = 4884000, soldBy = {257897}, source = "vendor", noxp = true } -- Ceramic Loamm Bowl
DVD.ActiveItems[264918] = { decorID = 16230, model3D = 4907678, soldBy = {257897}, source = "vendor", noxp = true } -- Zaralek Candles
DVD.ActiveItems[264919] = { decorID = 16231, model3D = 4913563, soldBy = {257897}, source = "vendor", noxp = true } -- Loamm Archway
DVD.ActiveItems[264920] = { decorID = 16232, model3D = 5001189, soldBy = {257897}, source = "vendor", noxp = true } -- Gooey Niffen Jar
DVD.ActiveItems[264921] = { decorID = 16233, model3D = 5002668, soldBy = {257897}, source = "vendor", noxp = true } -- Zaralek Snail Cart
DVD.ActiveItems[264922] = { decorID = 16234, model3D = 5002711, soldBy = {257897}, source = "vendor", noxp = true } -- Strong Sniffin' Incense
DVD.ActiveItems[264923] = { decorID = 16235, model3D = 5051824, soldBy = {257897}, source = "vendor", noxp = true } -- Underdecorated Underground Table
DVD.ActiveItems[264924] = { decorID = 16236, model3D = 5096997, soldBy = {257897}, source = "vendor", noxp = true } -- Loamm Wheelpot
DVD.ActiveItems[264925] = { decorID = 16237, model3D = 5151238, soldBy = {257897}, source = "vendor", noxp = true } -- Kilnmaster's Bucket
DVD.ActiveItems[265032] = { decorID = 16315, model3D = 4884004, soldBy = {257897}, source = "vendor", noxp = true } -- Hearty Niffen Grub
DVD.ActiveItems[265541] = { decorID = 16962, model3D = 605596, soldBy = {257897}, source = "vendor", noxp = true } -- Loammy Soil
end

do -- 🏪 VENDOR NPC: 257914 (Quelis)
DVD.ActiveItems[263999] = { decorID = 15404, model3D = 6049336, soldBy = {257914}, source = "achievement" } -- Midnight Cook's Shop Sign
end

do -- 🏪 VENDOR NPC: 258181 (Construct Ali'a)
DVD.ActiveItems[265681] = { decorID = 17439, model3D = 7430522, soldBy = {258181}, source = "achievement" } -- Preyseeker's Magister Effigy
DVD.ActiveItems[265682] = { decorID = 17440, model3D = 7430523, soldBy = {258181}, source = "achievement" } -- Preyseeker's Tinker Effigy
DVD.ActiveItems[265683] = { decorID = 17441, model3D = 7430525, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Ethereal Effigy
DVD.ActiveItems[265684] = { decorID = 17442, model3D = 7430526, soldBy = {258181}, source = "achievement" } -- Preyseeker's Breaker Effigy
DVD.ActiveItems[265685] = { decorID = 17443, model3D = 7430527, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Amani Effigy
DVD.ActiveItems[265686] = { decorID = 17444, model3D = 7430529, soldBy = {258181}, source = "achievement" } -- Preyseeker's Rutaani Effigy
DVD.ActiveItems[265687] = { decorID = 17446, model3D = 7430530, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Vindicator Effigy
DVD.ActiveItems[265688] = { decorID = 17447, model3D = 7430531, soldBy = {258181}, source = "achievement" } -- Preyseeker's Consul Effigy
DVD.ActiveItems[265689] = { decorID = 17449, model3D = 7430532, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Executor Effigy
DVD.ActiveItems[265690] = { decorID = 17450, model3D = 7430533, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Knight-Errant Effigy
DVD.ActiveItems[265691] = { decorID = 17452, model3D = 7430534, soldBy = {258181}, source = "achievement" } -- Preyseeker's Wretched Effigy
DVD.ActiveItems[265692] = { decorID = 17453, model3D = 7430535, soldBy = {258181}, source = "achievement" } -- Preyseeker's Thornspeaker Effigy
DVD.ActiveItems[265694] = { decorID = 17454, model3D = 7430536, soldBy = {258181}, source = "achievement" } -- Preyseeker's Twilight Effigy
DVD.ActiveItems[265696] = { decorID = 17455, model3D = 7450031, soldBy = {258181}, source = "achievement" } -- Preyseeker's Magister Bust
DVD.ActiveItems[265697] = { decorID = 17456, model3D = 7450032, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Tinker Bust
DVD.ActiveItems[265698] = { decorID = 17457, model3D = 7450034, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Ethereal Bust
DVD.ActiveItems[265699] = { decorID = 17458, model3D = 7450035, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Breaker Bust
DVD.ActiveItems[265700] = { decorID = 17459, model3D = 7450036, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Amani Bust
DVD.ActiveItems[265701] = { decorID = 17460, model3D = 7450038, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Rutaani Bust
DVD.ActiveItems[265702] = { decorID = 17462, model3D = 7450039, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Vindicator Bust
DVD.ActiveItems[265703] = { decorID = 17464, model3D = 7450040, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Consul Bust
DVD.ActiveItems[265704] = { decorID = 17465, model3D = 7450041, soldBy = {258181}, source = "achievement" } -- Preyseeker's Executor Bust
DVD.ActiveItems[265705] = { decorID = 17467, model3D = 7450042, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Knight-Errant Bust
DVD.ActiveItems[265706] = { decorID = 17469, model3D = 7450043, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Wretched Bust
DVD.ActiveItems[265707] = { decorID = 17472, model3D = 7450044, soldBy = {258181}, source = "achievement" } -- Preyseeker's Thornspeaker Bust
DVD.ActiveItems[265708] = { decorID = 17474, model3D = 7450045, soldBy = {258181}, source = "achievement" } -- Preyseeker's Twilight Bust
DVD.ActiveItems[265794] = { decorID = 17518, model3D = 7302391, soldBy = {258181}, source = "vendor" } -- Preyseeker's Plinth
DVD.ActiveItems[265795] = { decorID = 17519, model3D = 7302392, soldBy = {258181}, source = "vendor" } -- Preyseeker's Ornate Plinth
DVD.ActiveItems[265796] = { decorID = 17520, model3D = 7430524, soldBy = {258181}, source = "achievement" } -- Preyseeker's Ren'dorei Effigy
DVD.ActiveItems[265797] = { decorID = 17521, model3D = 7430528, soldBy = {258181}, source = "achievement" } -- Preyseeker's Farstrider Effigy
DVD.ActiveItems[265798] = { decorID = 17522, model3D = 7450033, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Ren'dorei Bust
DVD.ActiveItems[265799] = { decorID = 17523, model3D = 7450037, soldBy = {258181}, source = "achievement", noxp = true } -- Preyseeker's Farstrider Bust
end

do -- 🏪 VENDOR NPC: 258328 (Thraxadar)
DVD.ActiveItems[247785] = { decorID = 3922, model3D = 6210877, requirement = { type = "reputation", faction = "Slayer's Duellum", rank = 4 }, soldBy = {258328}, source = "vendor"}-- Galactic Void-Scarred Banner
DVD.ActiveItems[264253] = { decorID = 15488, model3D = 6210879, requirement = { type = "reputation", faction = "Slayer's Duellum", rank = 2 }, soldBy = {258328}, source = "vendor"}-- Galactic Void-Scarred Barricade
DVD.ActiveItems[264345] = { decorID = 15585, model3D = 7141590, requirement = { type = "reputation", faction = "Slayer's Duellum", rank = 3 }, soldBy = {258328}, source = "vendor"}-- Galactic Commander's Orb
end

do -- 🏪 VENDOR NPC: 258480 (Amwa'ana)
DVD.ActiveItems[264005] = { decorID = 15410, model3D = 6049346, soldBy = {258480}, source = "achievement" } -- Midnight Jewelcrafter's Shop Sign
end

do -- 🏪 VENDOR NPC: 258507 (Mowaia)
DVD.ActiveItems[264002] = { decorID = 15407, model3D = 6049340, soldBy = {258507}, source = "achievement" } -- Midnight Fisher's Shop Sign
end

do -- 🏪 VENDOR NPC: 258540 (Hawli)
DVD.ActiveItems[264172] = { decorID = 15457, model3D = 6049355, soldBy = {258540}, source = "achievement", noxp = true } -- Midnight Miner's Shop Sign
end

do -- 🏪 VENDOR NPC: 259864 (Sathren Azuredawn)
DVD.ActiveItems[244538] = { decorID = 1442, model3D = 6367922, soldBy = {259864}, source = "vendor", noxp = true } -- Silvermoon Sundial
DVD.ActiveItems[244783] = { decorID = 1489, model3D = 6856603, soldBy = {259864}, source = "quest", noxp = true } -- Majestic Lightwood Table
DVD.ActiveItems[245992] = { decorID = 1908, model3D = 6985813, soldBy = {259864}, source = "quest", noxp = true } -- Ornate Silvermoon Candelabra
DVD.ActiveItems[251909] = { decorID = 8872, model3D = 6050866, soldBy = {259864}, source = "achievement", noxp = true } -- Eversong Feast Platter
DVD.ActiveItems[251911] = { decorID = 8874, model3D = 6051296, soldBy = {259864}, source = "vendor" } -- Eversong Dessert Platter
DVD.ActiveItems[251914] = { decorID = 8877, model3D = 6051300, soldBy = {259864}, source = "vendor", noxp = true } -- Sumptuous Berry Pie
DVD.ActiveItems[253485] = { decorID = 1159, model3D = 6036095, soldBy = {259864}, source = "quest", noxp = true } -- Sin'dorei Honor Stone
DVD.ActiveItems[253488] = { decorID = 1160, model3D = 6036096, soldBy = {259864}, source = "vendor" } -- Diamond Honor Stone
DVD.ActiveItems[246458] = { decorID = 2299, model3D = 6427293, soldBy = {259864}, source = "vendor", noxp = true } -- Grand Aethercharged Crystal
DVD.ActiveItems[254773] = { decorID = 10542, model3D = 7241260, soldBy = {259864}, source = "achievement", noxp = true } -- "Eversong Lantern" Painting
DVD.ActiveItems[257367] = { decorID = 11470, model3D = 7338839, soldBy = {259864}, source = "achievement", noxp = true } -- Silvermoon Energy Focus
DVD.ActiveItems[262610] = { decorID = 14635, model3D = 6701008, soldBy = {259864}, source = "quest", noxp = true } -- Swirling Ritual Pedestal
DVD.ActiveItems[263231] = { decorID = 15062, model3D = 6050876, soldBy = {259864}, source = "quest", noxp = true } -- Silvermoon Curio Shelves
DVD.ActiveItems[264248] = { decorID = 15483, model3D = 6026041, soldBy = {259864}, source = "vendor", noxp = true } -- Sin'dorei Storage Jar
DVD.ActiveItems[264660] = { decorID = 15895, model3D = 6701018, soldBy = {259864}, source = "quest", noxp = true } -- Ren'dorei Spired Tent
DVD.ActiveItems[265106] = { decorID = 16691, model3D = 6684020, soldBy = {259864}, source = "vendor", noxp = true } -- Farstriders' Pride Statue
DVD.ActiveItems[265631] = { decorID = 17294, model3D = 6684021, soldBy = {259864}, source = "vendor", noxp = true } -- Farstriders' Glory Statue
end

do -- 🏪 VENDOR NPC: 259864 (Sathren Azuredawn) Treasures
DVD.ActiveItems[243106] = { decorID = 1173, model3D = 4381789, bossevent = "Triple-Locked Safebox", sourceAction = "Triple-Locked Safebox", soldBy = {259864}, source = "treasure", mapID = 2395}-- Gemmed Eversong Lantern	
DVD.ActiveItems[245282] = { decorID = 1195, model3D = 4478904, bossevent = "Incomplete Book of Sonnets", sourceAction = "Incomplete Book of Sonnets", soldBy = {259864}, source = "treasure", mapID = 2393}-- Silvermoon Library Bookcase
DVD.ActiveItems[251912] = { decorID = 8875, model3D = 6051298, bossevent = "Stone Vat", sourceAction = "Stone Vat", soldBy = {259864}, source = "treasure", mapID = 2395}-- Goldenmist Grapes
DVD.ActiveItems[263211] = { decorID = 14977, model3D = 6025940, bossevent = "Gift of the Phoenix", sourceAction = "Gift of the Phoenix", soldBy = {259864}, source = "treasure", mapID = 2395} -- Gilded Eversong Cup
end

do -- 🏪 VENDOR NPC: 259922 (Void Researcher Aemely)
DVD.ActiveItems[264493] = { decorID = 15757, model3D = 6391989, soldBy = {259922}, source = "achievement", noxp = true } -- Opened Domanaar Storage Crate
DVD.ActiveItems[264508] = { decorID = 15768, model3D = 6700991, soldBy = {259922}, source = "vendor", noxp = true } -- Sturdy Void Elf Barricade
DVD.ActiveItems[264656] = { decorID = 15890, model3D = 6700992, soldBy = {259922}, source = "achievement", noxp = true } -- Void Elf Weapon Rack
DVD.ActiveItems[264657] = { decorID = 15891, model3D = 6701010, soldBy = {259922}, source = "vendor", noxp = true } -- Open Sturdy Void Elf Trunk
DVD.ActiveItems[264659] = { decorID = 15894, model3D = 6701014, soldBy = {259922}, source = "vendor", noxp = true } -- Cosmic Traveler's Satchel
DVD.ActiveItems[267082] = { decorID = 18617, model3D = 6885569, soldBy = {259922}, source = "vendor", noxp = true } -- Ornate Cosmic Table
DVD.ActiveItems[267209] = { decorID = 18800, model3D = 6701003, soldBy = {259922}, source = "quest", noxp = true } -- Open Void Elf Bedroll
DVD.ActiveItems[262351] = { decorID = 14554, model3D = 6700982, soldBy = {259922}, source = "quest", noxp = true } -- Ornate Cosmic Rug
DVD.ActiveItems[262472] = { decorID = 14602, model3D = 7412672, soldBy = {259922}, source = "vendor", noxp = true } -- Cosmic Kettle
DVD.ActiveItems[262606] = { decorID = 14631, model3D = 6700978, soldBy = {259922}, source = "quest", noxp = true } -- Smoldering Energy Forge
DVD.ActiveItems[263240] = { decorID = 15071, model3D = 6701011, soldBy = {259922}, source = "vendor", noxp = true } -- Sturdy Void Elf Crate
DVD.ActiveItems[264340] = { decorID = 15579, model3D = 6391988, soldBy = {259922}, source = "vendor", noxp = true } -- Cosmic Barrel
end

do -- 🏪 VENDOR NPC: 260180 (Depthdiver Tu'nakit)
DVD.ActiveItems[258535] = { decorID = 12140, model3D = 6212443, soldBy = {260180}, source = "vendor" } -- Simple Bone-Tied Charm
DVD.ActiveItems[258536] = { decorID = 12141, model3D = 6212444, soldBy = {260180}, source = "vendor" } -- Windmark Tribal Charm
DVD.ActiveItems[258537] = { decorID = 12142, model3D = 6212445, soldBy = {260180}, source = "vendor" } -- Amani Dreamer's Charm
DVD.ActiveItems[258538] = { decorID = 12143, model3D = 6212446, soldBy = {260180}, source = "vendor" } -- Barebone Rope Charm
DVD.ActiveItems[264251] = { decorID = 15486, model3D = 6125172, soldBy = {260180}, source = "vendor" } -- Depthdiver's Cooking Spit
DVD.ActiveItems[264252] = { decorID = 15487, model3D = 6195748, soldBy = {260180}, source = "vendor" } -- Zul'Aman Forest Hammock
end

do -- 🏪 VENDOR NPC: 264056 (Disguised Decor Duel Vendor)
DVD.ActiveItems[268457] = { decorID = 19763, model3D = 7649379, soldBy = {264056}, source = "vendor" } -- Sin'dorei Tiffin-Style Lamp
DVD.ActiveItems[269613] = { decorID = 21079, model3D = 7705433, soldBy = {264056}, source = "vendor" } -- Sin'dorei Covered Cookpot
DVD.ActiveItems[269614] = { decorID = 21080, model3D = 7707246, soldBy = {264056}, source = "vendor" } -- Sin'dorei Open Cookpot
DVD.ActiveItems[269636] = { decorID = 21101, model3D = 7707245, soldBy = {264056}, source = "vendor" } -- Sin'dorei Cookpot Lid
DVD.ActiveItems[269641] = { decorID = 21106, model3D = 7705434, soldBy = {264056}, source = "vendor" } -- Sin'dorei Display Case
DVD.ActiveItems[271162] = { decorID = 21602, model3D = 7736337, soldBy = {264056}, source = "vendor" } -- Sin'dorei Garden Swing
DVD.ActiveItems[272441] = { decorID = 22006, model3D = 943646, soldBy = {264056}, source = "vendor" } -- Small Lumber Pile
DVD.ActiveItems[272442] = { decorID = 22007, model3D = 943678, soldBy = {264056}, source = "vendor" } -- Empty Wooden Toolbox
DVD.ActiveItems[272443] = { decorID = 22008, model3D = 1387976, soldBy = {264056}, source = "vendor" } -- Suramar Arcfruit Bowl
DVD.ActiveItems[272444] = { decorID = 22009, model3D = 5281476, soldBy = {264056}, source = "vendor" } -- Small Decorative Dornogal Opal
DVD.ActiveItems[272445] = { decorID = 22010, model3D = 5281479, soldBy = {264056}, source = "vendor" } -- Decorative Dornogal Opal
DVD.ActiveItems[272446] = { decorID = 22011, model3D = 5281480, soldBy = {264056}, source = "vendor" } -- Large Decorative Dornogal Opal
end

do -- 🏪 VENDOR NPC: 265581 (Zuronar)
DVD.ActiveItems[276321] = { decorID = 25564, model3D = 7115733, soldBy = {265581}, source = "achievement"} -- Luminant Defender's Golden Barricade
DVD.ActiveItems[276318] = { decorID = 25565, model3D = 7115754, soldBy = {265581}, source = "achievement"} -- Luminant Soldier's War Banner
DVD.ActiveItems[276316] = { decorID = 25566, model3D = 7320163, soldBy = {265581}, source = "achievement" } -- Lightveil's Transport Pad
DVD.ActiveItems[267211] = { decorID = 18802, model3D = 7319865, soldBy = {265581}, source = "achievement"} -- Luminant Scout's Golden Fence
DVD.ActiveItems[276429] = { decorID = 25665, model3D = 1662222, soldBy = {265581}, source = "achievement" } -- Grand Artificer's Lightforged Console
DVD.ActiveItems[276432] = { decorID = 25664, model3D = 1590817, soldBy = {265581}, source = "achievement" } -- De-Powered Lightforged Siegebreaker
end

do -- 🏪 VENDOR NPC: 267859 (Richmond) Fifa related
DVD.ActiveItems[274731] = { decorID = 23706, model3D = 7845475, soldBy = {267859}, source = "achievement", noxp = true } -- Prized Orb of Azeroth
DVD.ActiveItems[274734] = { decorID = 24193, model3D = 7845476, soldBy = {267859}, source = "achievement", noxp = true } -- Framed Horde Pride
DVD.ActiveItems[274736] = { decorID = 24194, model3D = 7845477, soldBy = {267859}, source = "achievement", noxp = true } -- Framed Alliance Pride
end

do -- 📦 UNMAPPED / NEW LOOSE PTR ITEMS
end

do --Treasures no  vendors
DVD.ActiveItems[245449] = {decorID = 674, model3D = 1096835, bossevent = "Withered Army Training", sourceAction = "Withered Army Training", mapID = 680, expansion = "Legion", zone = "Broken Isles", source = "treasure"}-- Ancient Elven Highback Chair
DVD.ActiveItems[245315] = { decorID = 1272, model3D = 5788649, bossevent = "Scraps Heaps", sourceAction = "Scraps Heaps", mapID = 2346, source = "treasure"} --"Trashfire Barrel"
DVD.ActiveItems[262467] = { decorID = 14597, model3D = 6700999, bossevent = "Stellar Stash", sourceAction = "Stellar Stash", mapID = 2444, source = "treasure"} -- "Void Elf Round Table"
DVD.ActiveItems[264482] = { decorID = 15746, model3D = 6701004, bossevent = "Malignant Chest", sourceAction = "Malignant Chest", mapID = 2405, source = "treasure"} -- "Void Elf Torch"
end

do --Daily Quest/quest
DVD.ActiveItems[241043] = { decorID = 925, model3D = 875378, bossevent = "Shadowmoon Valley Missive", mapID = 539, expansion = "Warlords of Draenor", zone = "Draenor", source = "quest"}-- Elodor Barrel
DVD.ActiveItems[251329] = { decorID = 8176, model3D = 878999, bossevent = "Shadowmoon Valley Missive", mapID = 539, expansion = "Warlords of Draenor", zone = "Draenor", source = "quest"} -- Shadowmoon Open-Air Shed
DVD.ActiveItems[251547] = { decorID = 8238, model3D = 915354, bossevent = "Shadowmoon Valley Missive", mapID = 539, expansion = "Warlords of Draenor", zone = "Draenor", source = "quest"}-- Draenei Farmer's Trellis	
DVD.ActiveItems[258145] = { decorID = 11872, model3D = 6051297, bossevent = "Cooking Daily", mapID = 125, expansion = "Wrath of the Loch King", zone = "Northrend", source = "quest"}-- Eversong Party Platter
end

do --Delve Drops
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

do --Darkshore Rares
DVD.ActiveItems[241066] = { decorID = 948, model3D = 6431408, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",  source = "drop"}-- Forsaken Spiked Brazier
DVD.ActiveItems[245462] = { decorID = 840, model3D = 2530077, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",   source = "drop"}-- Banshee Queen's Banner
DVD.ActiveItems[245627] = { decorID = 1836, model3D = 6938369, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",  source = "drop"} -- Elven Temple Brazier
DVD.ActiveItems[246110] = { decorID = 2000, model3D = 6980565, bossevent = "Darkshore Rares", mapID = 62, expansion = "Battle for Azeroth", zone = "Darkshore Rares",  source = "drop"}	-- Filigree Moon Sconce
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
DVD.ActiveItems[265949] = { decorID = 17628, model3D = 7550710, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- March on Quel'Danas Vanquisher's Aureate Trophy
DVD.ActiveItems[265950] = { decorID = 17629, model3D = 7550712, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Dreamrift Vanquisher's Aureate Trophy
DVD.ActiveItems[265951] = { decorID = 17630, model3D = 7550713, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidspire Vanquisher's Aureate Trophy
DVD.ActiveItems[266885] = { decorID = 18396, model3D = 7556292, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- March on Quel'Danas Vanquisher's Gleaming Trophy
DVD.ActiveItems[266886] = { decorID = 18397, model3D = 7556293, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Dreamrift Vanquisher's Gleaming Trophy
DVD.ActiveItems[266887] = { decorID = 18398, model3D = 7556294, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidspire Vanquisher's Gleaming Trophy
DVD.ActiveItems[267645] = { decorID = 19197, model3D = 7633281, bossencounter = 2795, mapID = 2532, expansion = "Midnight", zone = "The Dreamrift", source = "boss"}-- Dreamrift Vanquisher's Argent Trophy
DVD.ActiveItems[267646] = { decorID = 19198, model3D = 7633282, bossencounter = 2740, mapID = 2534, expansion = "Midnight", zone = "March on Quel'Danas", source = "boss"}-- March on Quel'Danas Vanquisher's Argent Trophy
DVD.ActiveItems[268049] = { decorID = 19252, model3D = 7633283, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Voidspire Vanquisher's Argent Trophy	
DVD.ActiveItems[267008] = { decorID = 18484, model3D = 1959305, bossencounter = 2328, mapID = 1345, expansion = "Battle for Azeroth", zone = "Crucible of Storms", source = "boss"}-- Crucible Votive Rack
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
end

do --Professions
DVD.ActiveItems[246596] = { decorID = 2428, model3D = 1841734, source = "profession" } -- Gnomish Fence
DVD.ActiveItems[246595] = { decorID = 2427, model3D = 1841733, source = "profession" } -- Gnomish Fencepost
DVD.ActiveItems[246485] = { decorID = 2328, model3D = 2851774, source = "profession" } -- Mechagnome Sustenance Distributor
DVD.ActiveItems[246606] = { decorID = 2438, model3D = 2967733, source = "profession" } -- Mechagon Armory Rack
DVD.ActiveItems[246482] = { decorID = 2325, model3D = 1841735, source = "profession" } -- Mechanical Gnomish Lamppost
DVD.ActiveItems[246597] = { decorID = 2429, model3D = 1842225, source = "profession" } -- Perpetual Motion Crate
DVD.ActiveItems[257100] = { decorID = 11438, model3D = 7658442, source = "profession" } -- Apothecary's Worktable
DVD.ActiveItems[257041] = { decorID = 11376, model3D = 243479, source = "profession" } -- Stoppered Black Potion
DVD.ActiveItems[264709] = { decorID = 16086, model3D = 198443, source = "profession" } -- Stranglekelp Sack
DVD.ActiveItems[264706] = { decorID = 16083, model3D = 192707, source = "profession" } -- Shadow Council Torch
DVD.ActiveItems[239214] = { decorID = 829, model3D = 5929346, source = "profession" } -- Well-Lit Incontinental Couch
DVD.ActiveItems[239170] = { decorID = 759, model3D = 5203802, source = "profession" } -- Dornic Mine and Cheese Platter
DVD.ActiveItems[242948] = { decorID = 1119, model3D = 4871092, source = "profession" } -- Loch Modan Bearskin Rug
DVD.ActiveItems[243090] = { decorID = 1157, model3D = 6854359, source = "profession" } -- Sturdy Haranir Chair
DVD.ActiveItems[243101] = { decorID = 1168, model3D = 1590845, source = "profession" } -- Red Dazar'alor Rug
DVD.ActiveItems[243327] = { decorID = 1273, model3D = 5793046, source = "profession" } -- Zhevra-Stripe Rug
DVD.ActiveItems[243336] = { decorID = 1282, model3D = 6711675, source = "profession" } -- Elder Rise Rug
DVD.ActiveItems[244313] = { decorID = 1405, model3D = 969529, source = "profession" } -- Orcish Fence
DVD.ActiveItems[244314] = { decorID = 1406, model3D = 979341, source = "profession" } -- Frostwall Architect's Table
DVD.ActiveItems[244317] = { decorID = 1409, model3D = 986851, source = "profession" } -- Orcish Banded Barrel
DVD.ActiveItems[244318] = { decorID = 1410, model3D = 987248, source = "profession" } -- Wine Barrel
DVD.ActiveItems[244319] = { decorID = 1411, model3D = 987255, source = "profession" } -- Wooden Shipping Crate
DVD.ActiveItems[244323] = { decorID = 1415, model3D = 1013304, source = "profession" } -- Orcish Sleeping Cot
DVD.ActiveItems[245305] = { decorID = 1275, model3D = 5793097, source = "profession"} -- Undermine Bean Bag Chair
DVD.ActiveItems[245312] = { decorID = 1260, model3D = 5689818, source = "profession" } -- Rusting Bolted Bench
DVD.ActiveItems[245323] = { decorID = 1270, model3D = 5788112, source = "profession" } -- Shredderwheel Storage Chest
DVD.ActiveItems[245326] = { decorID = 765, model3D = 5650143, source = "profession" } -- Kaheti Predator's Assortment
DVD.ActiveItems[245396] = { decorID = 1219, model3D = 6749303, source = "profession" } -- Suramar Dresser
DVD.ActiveItems[245406] = { decorID = 1242, model3D = 6711672, source = "profession" } -- Tauren Leather Fence
DVD.ActiveItems[245407] = { decorID = 1243, model3D = 6711673, source = "profession" } -- Tauren Fencepost
DVD.ActiveItems[245408] = { decorID = 1314, model3D = 6877807, source = "profession" } -- Tauren Soup Pot
DVD.ActiveItems[245412] = { decorID = 1241, model3D = 6653373, source = "profession" } -- Zandalari Ritual Drum
DVD.ActiveItems[245414] = { decorID = 1200, model3D = 6653375, source = "profession" } -- Zandalari Skullfire Lamp
DVD.ActiveItems[245415] = { decorID = 1313, model3D = 6877806, source = "profession" } -- Zuldazar Fence
DVD.ActiveItems[245416] = { decorID = 1312, model3D = 6877805, source = "profession" } -- Zuldazar Fencepost
DVD.ActiveItems[245418] = { decorID = 1311, model3D = 6877804, source = "profession" } -- Zanchuli Tapestry
DVD.ActiveItems[245421] = { decorID = 929, model3D = 979920, source = "profession" } -- Karabor Bed
DVD.ActiveItems[245428] = { decorID = 749, model3D = 960868, source = "profession" } -- Hungry Human's Platter
DVD.ActiveItems[245432] = { decorID = 1321, model3D = 1005469, source = "profession" } -- Blackrock Bunkbed
DVD.ActiveItems[245436] = { decorID = 1325, model3D = 1005512, source = "profession" } -- Blackrock Weapon Rack
DVD.ActiveItems[245441] = { decorID = 1351, model3D = 969535, source = "profession" } -- Orcish Fencepost
DVD.ActiveItems[245459] = { decorID = 1308, model3D = 1402225, source = "profession" } -- Tauren Storage Chest
DVD.ActiveItems[245484] = { decorID = 755, model3D = 1852909, source = "profession" } -- Boralus-Style Lobster Platter
DVD.ActiveItems[245496] = { decorID = 1161, model3D = 1929218, source = "profession" } -- Small Mask of Bwonsamdi, Loa of Graves
DVD.ActiveItems[245499] = { decorID = 1217, model3D = 1597475, source = "profession" } -- Gilded Zandalari Table
DVD.ActiveItems[245502] = { decorID = 854, model3D = 189415, source = "profession" } -- Brill Coffin
DVD.ActiveItems[245503] = { decorID = 922, model3D = 189416, source = "profession" } -- Brill Coffin Lid
DVD.ActiveItems[245509] = { decorID = 1194, model3D = 518523, source = "profession" } -- Pandaren Stone Wall
DVD.ActiveItems[245513] = { decorID = 1169, model3D = 538547, source = "profession" } -- Square Pandaren Table
DVD.ActiveItems[245514] = { decorID = 1187, model3D = 538827, source = "profession" } -- Pandaren Wooden Table
DVD.ActiveItems[245517] = { decorID = 855, model3D = 304249, source = "profession" } -- Gilnean Cauldron
DVD.ActiveItems[245534] = { decorID = 1725, model3D = 6711645, source = "profession" } -- Frostwall Elevated Brazier
DVD.ActiveItems[245557] = { decorID = 1746, model3D = 6924249, source = "profession" } -- Shaded Suramar Window
DVD.ActiveItems[245559] = { decorID = 1748, model3D = 6924251, source = "profession" } -- Octagonal Ochre Window
DVD.ActiveItems[245600] = { decorID = 1791, model3D = 6905311, source = "profession" } -- Frostwall Forge
DVD.ActiveItems[245601] = { decorID = 1792, model3D = 6905328, source = "profession" } -- Ancestral Signal Brazier
DVD.ActiveItems[245602] = { decorID = 1793, model3D = 6930893, source = "profession" } -- Gilnean Problem Solver
DVD.ActiveItems[245618] = { decorID = 1827, model3D = 305226, source = "profession" } -- Surwich Expedition Tent
DVD.ActiveItems[245621] = { decorID = 1830, model3D = 322293, source = "profession" } -- Gilnean Wooden Table
DVD.ActiveItems[245622] = { decorID = 1831, model3D = 322355, source = "profession" } -- Gilnean Wall Shelf
DVD.ActiveItems[245623] = { decorID = 1832, model3D = 322635, source = "profession" } -- Gilnean Rocking Chair
DVD.ActiveItems[246066] = { decorID = 1984, model3D = 6914980, source = "profession" } -- Schmancy Goblin String Lights
DVD.ActiveItems[246111] = { decorID = 2001, model3D = 6995868, source = "profession" } -- Shadowforge Sconce
DVD.ActiveItems[246410] = { decorID = 2227, model3D = 197212, source = "profession" } -- Dark Iron Table Saw
DVD.ActiveItems[246413] = { decorID = 2230, model3D = 379433, source = "profession" } -- Blackrock Lamppost
DVD.ActiveItems[246420] = { decorID = 2237, model3D = 197288, source = "profession" } -- Kharanos Bookcase
DVD.ActiveItems[246423] = { decorID = 2240, model3D = 197555, source = "profession" } -- Wooden Ironforge Table
DVD.ActiveItems[246460] = { decorID = 2301, model3D = 6427295, source = "profession" } -- Ambient Aethercharged Crystal
DVD.ActiveItems[246486] = { decorID = 2329, model3D = 6699744, source = "profession" } -- Gnomish Tesla Mega-Coil
DVD.ActiveItems[246488] = { decorID = 2331, model3D = 7014376, source = "profession" } -- Ironforge Chandelier
DVD.ActiveItems[246489] = { decorID = 2332, model3D = 7014377, source = "profession" } -- Steel Ironforge Emblem
DVD.ActiveItems[246500] = { decorID = 2340, model3D = 2765483, source = "profession" } -- Mechagon Miniature Artificial Sun
DVD.ActiveItems[246604] = { decorID = 2436, model3D = 2816738, source = "profession" } -- Deactivated Atomic Recalibrator
DVD.ActiveItems[246685] = { decorID = 2452, model3D = 197968, source = "profession" } -- Dwarven District Banner
DVD.ActiveItems[246700] = { decorID = 2465, model3D = 197653, source = "profession" } -- Gnomish Steam-Powered Bed
DVD.ActiveItems[246705] = { decorID = 2468, model3D = 3870812, source = "profession" } -- Caramel Mint Noodle Dish
DVD.ActiveItems[246708] = { decorID = 2471, model3D = 5203791, source = "profession" } -- Dornic Sliced Mineloaf
DVD.ActiveItems[246709] = { decorID = 2472, model3D = 5203794, source = "profession" } -- Earthen Hospitality Cheese-Like Brick
DVD.ActiveItems[247220] = { decorID = 2591, model3D = 643880, source = "profession" } -- Mushan Dumpling Stack
DVD.ActiveItems[247222] = { decorID = 2593, model3D = 7109343, source = "profession" } -- Drake Kebab Platter
DVD.ActiveItems[247224] = { decorID = 2595, model3D = 7109345, source = "profession" } -- Valdrakken Blossomfruit Platter
DVD.ActiveItems[247225] = { decorID = 2596, model3D = 7109346, source = "profession" } -- Bruffalon Rib Platter
DVD.ActiveItems[247661] = { decorID = 3831, model3D = 520142, source = "profession" } -- Pandaren Signal Brazier
DVD.ActiveItems[247669] = { decorID = 3839, model3D = 6854354, source = "profession" } -- Lorewalker's Bookcase
DVD.ActiveItems[247728] = { decorID = 3868, model3D = 519133, source = "profession" } -- Pandaren Stone Post
DVD.ActiveItems[247731] = { decorID = 3871, model3D = 525038, source = "profession" } -- Hanging Paper Lanterns
DVD.ActiveItems[247733] = { decorID = 3873, model3D = 526861, source = "profession" } -- Halfhill Cookpot
DVD.ActiveItems[247735] = { decorID = 3875, model3D = 7508792, source = "profession" } -- Lucky Traveler's Bench
DVD.ActiveItems[247736] = { decorID = 3876, model3D = 530128, source = "profession" } -- Jade Temple Dragon Fountain
DVD.ActiveItems[247738] = { decorID = 3878, model3D = 575033, source = "profession" } -- Pandaren Meander Rug
DVD.ActiveItems[247752] = { decorID = 3892, model3D = 6431405, source = "profession" } -- Pandaren Fireplace
DVD.ActiveItems[247767] = { decorID = 3904, model3D = 579248, source = "profession" } -- Wise Pandaren's Bed
DVD.ActiveItems[247856] = { decorID = 3994, model3D = 531405, source = "profession" } -- Serenity Peak Tent
DVD.ActiveItems[247909] = { decorID = 4023, model3D = 1360361, source = "profession" } -- Suramar Fencepost
DVD.ActiveItems[247916] = { decorID = 4030, model3D = 1361711, source = "profession" } -- Covered Square Suramar Table
DVD.ActiveItems[247918] = { decorID = 4032, model3D = 1368700, source = "profession" } -- Nightborne Jeweler's Table
DVD.ActiveItems[247920] = { decorID = 4034, model3D = 1378307, source = "profession" } -- Circular Shal'dorei Rug
DVD.ActiveItems[247922] = { decorID = 4036, model3D = 1408526, source = "profession" } -- Suramar Fence
DVD.ActiveItems[247923] = { decorID = 4037, model3D = 1408528, source = "profession" } -- Suramar Containment Cell
DVD.ActiveItems[247925] = { decorID = 4039, model3D = 1445014, source = "profession" } -- Suramar Storage Crate
DVD.ActiveItems[248010] = { decorID = 4041, model3D = 1373509, source = "profession" } -- Shal'dorei Open-Air Tent
DVD.ActiveItems[248106] = { decorID = 4162, model3D = 3917374, source = "profession" } -- Valdrakken Banded Barrel
DVD.ActiveItems[248107] = { decorID = 4163, model3D = 3917382, source = "profession" } -- Valdrakken Storage Crate
DVD.ActiveItems[248108] = { decorID = 4164, model3D = 3917383, source = "profession" } -- Long Valdrakken Storage Crate
DVD.ActiveItems[248109] = { decorID = 4165, model3D = 3952852, source = "profession" } -- Valdrakken Fence
DVD.ActiveItems[248110] = { decorID = 4166, model3D = 3952853, source = "profession" } -- Valdrakken Fencepost
DVD.ActiveItems[248111] = { decorID = 4167, model3D = 4204641, source = "profession" } -- Verdant Valdrakken Vase
DVD.ActiveItems[248113] = { decorID = 4169, model3D = 4222966, source = "profession" } -- Thaldraszus Telescope
DVD.ActiveItems[248114] = { decorID = 4170, model3D = 4237314, source = "profession" } -- Draconic Nesting Bed
DVD.ActiveItems[248118] = { decorID = 4174, model3D = 4317323, source = "profession" } -- Literature of the Blue Dragonflight
DVD.ActiveItems[248119] = { decorID = 4175, model3D = 4317324, source = "profession" } -- Literature of the Green Dragonflight
DVD.ActiveItems[248120] = { decorID = 4176, model3D = 4317325, source = "profession" } -- Literature of the Red Dragonflight
DVD.ActiveItems[248121] = { decorID = 4177, model3D = 4497614, source = "profession" } -- Draconic Circular Rug
DVD.ActiveItems[248654] = { decorID = 4480, model3D = 7141934, source = "profession" } -- Valdrakken Gilded Throne
DVD.ActiveItems[248657] = { decorID = 4483, model3D = 7141938, source = "profession" } -- Valdrakken Market Tent
DVD.ActiveItems[248965] = { decorID = 5133, model3D = 7152563, source = "profession" } -- Resplendent Highborne Statue
DVD.ActiveItems[249143] = { decorID = 5342, model3D = 7130714, source = "profession" } -- Smoke Sconce
DVD.ActiveItems[251482] = { decorID = 8191, model3D = 928023, source = "profession" } -- Draenei Stargazer's Telescope
DVD.ActiveItems[251495] = { decorID = 8196, model3D = 7273285, source = "profession" } -- Draenic Basin
DVD.ActiveItems[251546] = { decorID = 8237, model3D = 902328, source = "profession" } -- Argussian Circular Rug
DVD.ActiveItems[251550] = { decorID = 8241, model3D = 6436480, source = "profession" } -- Draenethyst Sconce
DVD.ActiveItems[251655] = { decorID = 8787, model3D = 7280505, source = "profession" } -- Draenethyst String Lights
DVD.ActiveItems[252035] = { decorID = 8983, model3D = 1602488, source = "profession" } -- Boralus Barrel
DVD.ActiveItems[252389] = { decorID = 9038, model3D = 1602479, source = "profession" } -- Proudmoore Shipping Crate
DVD.ActiveItems[252397] = { decorID = 9046, model3D = 1733921, source = "profession" } -- Brennadam Grinder
DVD.ActiveItems[252399] = { decorID = 9048, model3D = 1852119, source = "profession"} -- Stormsong Stove
DVD.ActiveItems[252401] = { decorID = 9050, model3D = 1852949, source = "profession" } -- Boralus Bookshelf
DVD.ActiveItems[252755] = { decorID = 9167, model3D = 4902728, source = "profession" } -- Dornogal Framed Rug
DVD.ActiveItems[252758] = { decorID = 9170, model3D = 5389585, source = "profession" } -- Boulder Springs Hot Tub
DVD.ActiveItems[253022] = { decorID = 9180, model3D = 4902723, source = "profession" } -- Dornogal Bookcase
DVD.ActiveItems[253036] = { decorID = 9184, model3D = 4896176, source = "profession" } -- Freywold Table
DVD.ActiveItems[253039] = { decorID = 9187, model3D = 5149702, source = "profession" } -- Dornogal Hanging Sconce
DVD.ActiveItems[253164] = { decorID = 9238, model3D = 4896178, source = "profession" } -- Algari Fence
DVD.ActiveItems[253165] = { decorID = 9239, model3D = 4896180, source = "profession" } -- Algari Fencepost
DVD.ActiveItems[253167] = { decorID = 9241, model3D = 4906204, source = "profession" } -- Forgeground Market Bins
DVD.ActiveItems[253169] = { decorID = 9243, model3D = 5128194, source = "profession" } -- Meadery Storage Chest
DVD.ActiveItems[253171] = { decorID = 9245, model3D = 7262810, source = "profession" } -- Replica Awakening Machine Stasis Pod
DVD.ActiveItems[253250] = { decorID = 9266, model3D = 195048, source = "profession"} -- Tirisfal Hollow Campfire
DVD.ActiveItems[253252] = { decorID = 9268, model3D = 5464693, source = "profession" } -- Replica Rumbling Wastes Drill Pod
DVD.ActiveItems[253253] = { decorID = 9269, model3D = 5636650, source = "profession" } -- Gundargaz Candelabra
DVD.ActiveItems[253457] = { decorID = 1142, model3D = 6856605, source = "profession" } -- Leather-Bound Haranir Wall Shelf
DVD.ActiveItems[253506] = { decorID = 1247, model3D = 6865595, source = "profession" } -- Rootbound Vat
DVD.ActiveItems[253508] = { decorID = 1328, model3D = 6330347, source = "profession" } -- Harandar Signpost
DVD.ActiveItems[256170] = { decorID = 10964, model3D = 4216958, source = "profession" } -- Draconic Scribe's Basin
DVD.ActiveItems[256171] = { decorID = 10965, model3D = 4326554, source = "profession" } -- Five Flights' Grimoire
DVD.ActiveItems[256356] = { decorID = 11138, model3D = 6024532, source = "profession" } -- Sunsmoke Censer
DVD.ActiveItems[256427] = { decorID = 11162, model3D = 3883456, source = "profession" } -- Wingrest Signal Brazier
DVD.ActiveItems[256430] = { decorID = 11165, model3D = 4695276, source = "profession" } -- Valdrakken Hanging Cauldron
DVD.ActiveItems[256680] = { decorID = 11281, model3D = 1363069, source = "profession" } -- Arcan'dor Cutting Fountain
DVD.ActiveItems[256681] = { decorID = 11282, model3D = 1363079, source = "profession" } -- Nightspire Fountain
DVD.ActiveItems[257035] = { decorID = 11370, model3D = 192356, source = "profession" } -- Bronze Banner of the Exiled
DVD.ActiveItems[257036] = { decorID = 11371, model3D = 192362, source = "profession" } -- Draenei Smith's Anvil
DVD.ActiveItems[257037] = { decorID = 11372, model3D = 192427, source = "profession" } -- Draenei Holo-Dais
DVD.ActiveItems[257038] = { decorID = 11373, model3D = 192433, source = "profession" } -- Draenei Holo-Path
DVD.ActiveItems[257039] = { decorID = 11374, model3D = 538413, source = "profession" } -- Draenei Crystal Forge
DVD.ActiveItems[257040] = { decorID = 11375, model3D = 242964, source = "profession" } -- Dalaran Runic Anvil
DVD.ActiveItems[257042] = { decorID = 11377, model3D = 304141, source = "profession" } -- Gilnean Pitchfork
DVD.ActiveItems[257043] = { decorID = 11378, model3D = 528627, source = "profession" } -- Pandaren Alchemist's Retort
DVD.ActiveItems[257044] = { decorID = 11379, model3D = 984595, source = "profession" } -- Orcish Felblood Cauldron
DVD.ActiveItems[257045] = { decorID = 11380, model3D = 1309272, source = "profession" } -- Starry Scrying Pool
DVD.ActiveItems[257046] = { decorID = 11381, model3D = 2026782, source = "profession" } -- Boralus Bottle Lamp
DVD.ActiveItems[257047] = { decorID = 11382, model3D = 2026876, source = "profession"} -- Zandalari Bottle Shipment
DVD.ActiveItems[257048] = { decorID = 11383, model3D = 3022762, source = "profession" } -- Aspirant's Meditation Pool
DVD.ActiveItems[257049] = { decorID = 11384, model3D = 3153975, source = "profession"} -- Bejeweled Venthyr Chalice
DVD.ActiveItems[257050] = { decorID = 11385, model3D = 3158888, source = "profession" } -- Veil-Secured Animacone
DVD.ActiveItems[257051] = { decorID = 11386, model3D = 3184576, source = "profession" } -- Sintallow Candles
DVD.ActiveItems[257052] = { decorID = 11387, model3D = 4240488, source = "profession" } -- Dragon's Elixir Bottle
DVD.ActiveItems[257053] = { decorID = 11388, model3D = 4495939, source = "profession" } -- Tapestry of the Five Flights
DVD.ActiveItems[257093] = { decorID = 11431, model3D = 538417, source = "profession" } -- Aldor Stellar Console
DVD.ActiveItems[257094] = { decorID = 11432, model3D = 243044, source = "profession" } -- Mark of the Mages' Eye
DVD.ActiveItems[257095] = { decorID = 11433, model3D = 317822, source = "profession" } -- Twilight Fire Canister
DVD.ActiveItems[257096] = { decorID = 11434, model3D = 522294, source = "profession" } -- Pandaren Table Lamp
DVD.ActiveItems[257097] = { decorID = 11435, model3D = 591464, source = "profession" } -- Intense Mogu Brazier
DVD.ActiveItems[257098] = { decorID = 11436, model3D = 3641039, source = "profession" } -- Venthyr Anima Bottle
DVD.ActiveItems[257101] = { decorID = 11439, model3D = 242720, source = "profession" } -- Stampwhistle's Postal Portal
DVD.ActiveItems[257102] = { decorID = 11440, model3D = 5201694, source = "profession" } -- Nerubian Alchemist's Retort
DVD.ActiveItems[257400] = { decorID = 11490, model3D = 1253405, source = "profession" } -- Highmountain Tanner's Frame
DVD.ActiveItems[257402] = { decorID = 11492, model3D = 314545, source = "profession" } -- "Unity of Thorns" Tapestry
DVD.ActiveItems[257404] = { decorID = 11494, model3D = 304698, source = "profession" } -- Pyrewood Glass Bottle
DVD.ActiveItems[257406] = { decorID = 11496, model3D = 311599, source = "profession" } -- Smoke Lamp
DVD.ActiveItems[257409] = { decorID = 11497, model3D = 311627, source = "profession" } -- Standing Smoke Lamp
DVD.ActiveItems[257420] = { decorID = 11501, model3D = 6023421, source = "profession" } -- Silvermoon Spire Fountain
DVD.ActiveItems[257689] = { decorID = 11718, model3D = 305999, source = "profession" } -- Small Gilnean Windmill
DVD.ActiveItems[257693] = { decorID = 11722, model3D = 195749, source = "profession" } -- Snowfall Tribe Scare-Totem
DVD.ActiveItems[257694] = { decorID = 11723, model3D = 304700, source = "profession" } -- Gilnean Green Potion
DVD.ActiveItems[257695] = { decorID = 11724, model3D = 305385, source = "profession" } -- Gilnean Postbox
DVD.ActiveItems[257696] = { decorID = 11725, model3D = 305396, source = "profession"} -- Gilnean Map
DVD.ActiveItems[257725] = { decorID = 11755, model3D = 6711676, source = "profession" } -- Camp Narache Rug
DVD.ActiveItems[257806] = { decorID = 11779, model3D = 360034, source = "profession" } -- Scaled Twilight Mosaic
DVD.ActiveItems[258190] = { decorID = 11878, model3D = 191781, source = "profession" } -- Outland Mag'har Banner
DVD.ActiveItems[258191] = { decorID = 11879, model3D = 191839, source = "profession" } -- Arakkoa Decoy Scarecrow
DVD.ActiveItems[258192] = { decorID = 11880, model3D = 191859, source = "profession" } -- Talon King's Totem
DVD.ActiveItems[258193] = { decorID = 11881, model3D = 192441, source = "profession" } -- Draenei Holo-Projector Pedestal
DVD.ActiveItems[258194] = { decorID = 11882, model3D = 192446, source = "profession" } -- Tempest Keep Cryo-Pod
DVD.ActiveItems[258195] = { decorID = 11883, model3D = 192460, source = "profession" } -- Draenei Weaver's Loom
DVD.ActiveItems[258196] = { decorID = 11884, model3D = 192461, source = "profession" } -- Draenei Transmitter
DVD.ActiveItems[258197] = { decorID = 11885, model3D = 192468, source = "profession" } -- Crystal Signpost
DVD.ActiveItems[258198] = { decorID = 11886, model3D = 192515, source = "profession" } -- Gilded Draenei Round Table
DVD.ActiveItems[258199] = { decorID = 11887, model3D = 193332, source = "profession" } -- Aldor Bookcase
DVD.ActiveItems[258200] = { decorID = 11888, model3D = 193369, source = "profession" } -- Shattrath Sconce
DVD.ActiveItems[258201] = { decorID = 11889, model3D = 193371, source = "profession" } -- Shattrath Lamppost
DVD.ActiveItems[258202] = { decorID = 11890, model3D = 193745, source = "profession" } -- Grand Drape of the Exiles
DVD.ActiveItems[258203] = { decorID = 11891, model3D = 194464, source = "profession" } -- Silver Dalaran Bench
DVD.ActiveItems[258204] = { decorID = 11892, model3D = 194471, source = "profession" } -- Dalaran Post
DVD.ActiveItems[258205] = { decorID = 11893, model3D = 200015, source = "profession" } -- Wolvar Postbag
DVD.ActiveItems[258206] = { decorID = 11894, model3D = 242983, source = "profession" } -- Gilded Dalaran Banner
DVD.ActiveItems[258207] = { decorID = 11895, model3D = 242995, source = "profession" } -- Dalaran Scholar's Bookcase
DVD.ActiveItems[258208] = { decorID = 11896, model3D = 243016, source = "profession" } -- Kirin Tor Sun Chandelier
DVD.ActiveItems[258209] = { decorID = 11897, model3D = 243030, source = "profession" } -- Kirin Tor Crate
DVD.ActiveItems[258210] = { decorID = 11898, model3D = 243054, source = "profession" } -- Dalaran Street Sign
DVD.ActiveItems[258211] = { decorID = 11899, model3D = 243189, source = "profession" } -- Kirin Tor Glass Table
DVD.ActiveItems[258212] = { decorID = 11900, model3D = 243528, source = "profession" } -- San'layn Blood Orb
DVD.ActiveItems[258213] = { decorID = 11901, model3D = 243545, source = "profession" } -- Icecrown Plague Canister
DVD.ActiveItems[258214] = { decorID = 11902, model3D = 528655, source = "profession" } -- Pandaren Alchemist's Kit
DVD.ActiveItems[258215] = { decorID = 11903, model3D = 538411, source = "profession" } -- Halaa Bench
DVD.ActiveItems[258216] = { decorID = 11904, model3D = 666489, source = "profession" } -- Reconstructed Mogu Lightning Drill
DVD.ActiveItems[258224] = { decorID = 11910, model3D = 1319120, source = "profession" } -- Dalaran Display Shelves
DVD.ActiveItems[258225] = { decorID = 11911, model3D = 1355533, source = "profession" } -- Failed Failure Detection Pylon
DVD.ActiveItems[258226] = { decorID = 11912, model3D = 1355598, source = "profession" } -- Dalaran Auto-Hammer
DVD.ActiveItems[258227] = { decorID = 11913, model3D = 1396746, source = "profession" } -- Suramar Jeweler's Assortment
DVD.ActiveItems[258235] = { decorID = 11917, model3D = 3033118, source = "profession" } -- Aspiring Soul's Chair
DVD.ActiveItems[258237] = { decorID = 11918, model3D = 3036110, source = "profession" } -- Ardenweald Lamppost
DVD.ActiveItems[258238] = { decorID = 11919, model3D = 3036549, source = "profession" } -- Maldraxxian Crate
DVD.ActiveItems[258239] = { decorID = 11920, model3D = 3036651, source = "profession" } -- Tome of Maldraxxian Rituals
DVD.ActiveItems[258240] = { decorID = 11921, model3D = 3154869, source = "profession" } -- Kyrian Anima Barrel
DVD.ActiveItems[258242] = { decorID = 11922, model3D = 3158874, source = "profession" } -- Hollow Night Fae Shrine
DVD.ActiveItems[258244] = { decorID = 11923, model3D = 3246827, source = "profession" } -- Broker's Hex Table
DVD.ActiveItems[258245] = { decorID = 11924, model3D = 3507170, source = "profession" } -- Ardenweald Hanging Baskets
DVD.ActiveItems[258247] = { decorID = 11925, model3D = 3607336, source = "profession" } -- Large Revendreth Storage Crate
DVD.ActiveItems[258248] = { decorID = 11926, model3D = 3619351, source = "profession" } -- Margrave's Stitched Leather Rug
DVD.ActiveItems[258250] = { decorID = 11927, model3D = 3836261, source = "profession" } -- Cartel Ta Bookcase
DVD.ActiveItems[258252] = { decorID = 11928, model3D = 4005944, source = "profession" } -- Cartel Xy Capture Crate
DVD.ActiveItems[258253] = { decorID = 11929, model3D = 4420607, source = "profession" } -- Titanic Tyrhold Fountain
DVD.ActiveItems[258289] = { decorID = 11935, model3D = 200451, source = "profession" } -- Thunder Bluff Totem
DVD.ActiveItems[258298] = { decorID = 11941, model3D = 242974, source = "profession" } -- Kirin Tor Skyline Banner
DVD.ActiveItems[258302] = { decorID = 11945, model3D = 577662, source = "profession" } -- Pandaren Fishing Net
DVD.ActiveItems[258303] = { decorID = 11946, model3D = 903883, source = "profession"} -- Beloved Elekk Plushie
DVD.ActiveItems[258557] = { decorID = 12161, model3D = 1282676, source = "profession"} -- Beloved Raptor Plushie
DVD.ActiveItems[258558] = { decorID = 12162, model3D = 1830320, source = "profession" } -- Sandfury Diplomat's Banner
DVD.ActiveItems[258559] = { decorID = 12163, model3D = 2057302, source = "profession" } -- Tidesage's Totem
DVD.ActiveItems[258560] = { decorID = 12164, model3D = 2438950, source = "profession" } -- Drust Enchanter's Rod
DVD.ActiveItems[258561] = { decorID = 12165, model3D = 3051055, source = "profession" } -- Kyrian Aspirant's Rolled Cushion
DVD.ActiveItems[260699] = { decorID = 14380, model3D = 3038200, source = "profession" } -- Maldraxxian Runic Tablet
DVD.ActiveItems[262347] = { decorID = 14553, model3D = 538415, source = "profession" } -- Draenei Crystal Chandelier
DVD.ActiveItems[262352] = { decorID = 14555, model3D = 6700983, source = "profession" } -- Lush Telogrus Carpet
DVD.ActiveItems[262354] = { decorID = 14557, model3D = 6700987, source = "profession" } -- Riftstone
DVD.ActiveItems[262355] = { decorID = 14558, model3D = 6701005, source = "profession" } -- Entropic Illuminant
DVD.ActiveItems[262356] = { decorID = 14559, model3D = 6796712, source = "profession" } -- Haranir Preserving Agents
DVD.ActiveItems[262449] = { decorID = 14579, model3D = 6005302, source = "profession" } -- Embossed Sin'dorei Fur Rug
DVD.ActiveItems[262450] = { decorID = 14580, model3D = 6024551, source = "profession" } -- Ensorcelled Broom
DVD.ActiveItems[262451] = { decorID = 14581, model3D = 6033614, source = "profession" } -- Gilded Silvermoon Anvil
DVD.ActiveItems[262452] = { decorID = 14582, model3D = 6033619, source = "profession" } -- Masterwork Crafting Hammer
DVD.ActiveItems[262454] = { decorID = 14584, model3D = 6033623, source = "profession" } -- Shining Sin'dorei Hourglass
DVD.ActiveItems[262455] = { decorID = 14585, model3D = 6033624, source = "profession" } -- Font of Gleaming Water
DVD.ActiveItems[262456] = { decorID = 14586, model3D = 6209622, source = "profession" } -- Ornamental Silvermoon Hanger
DVD.ActiveItems[262457] = { decorID = 14587, model3D = 6209623, source = "profession" } -- Gilded Silvermoon Hanger
DVD.ActiveItems[262460] = { decorID = 14590, model3D = 6700980, source = "profession" } -- Ren'dorei Anvil
DVD.ActiveItems[262461] = { decorID = 14591, model3D = 6700985, source = "profession" } -- Tenebrous Ren'dorei Armillary
DVD.ActiveItems[262464] = { decorID = 14594, model3D = 6700989, source = "profession" } -- Floating Void-Touched Tome
DVD.ActiveItems[262465] = { decorID = 14595, model3D = 6700990, source = "profession" } -- Ren'dorei Stargazer
DVD.ActiveItems[262468] = { decorID = 14598, model3D = 6861008, source = "profession" } -- Ren'dorei Postal Repository
DVD.ActiveItems[262469] = { decorID = 14599, model3D = 6929052, source = "profession" } -- Brilliant Phoenix Harp
DVD.ActiveItems[262471] = { decorID = 14601, model3D = 7050760, source = "profession" } -- Bejeweled Sin'dorei Lyre
DVD.ActiveItems[262589] = { decorID = 14615, model3D = 5163362, source = "profession" } -- Simple Haranir Table
DVD.ActiveItems[262590] = { decorID = 14616, model3D = 4928309, source = "profession" } -- Rootflame Campfire
DVD.ActiveItems[262591] = { decorID = 14617, model3D = 6050843, source = "profession" } -- Luxurious Silvermoon Lounge Cushion
DVD.ActiveItems[262592] = { decorID = 14618, model3D = 6050852, source = "profession" } -- Plush Silvermoon Bed
DVD.ActiveItems[262593] = { decorID = 14619, model3D = 6050855, source = "profession" } -- Chic Silvermoon Pillow
DVD.ActiveItems[262594] = { decorID = 14620, model3D = 6050872, source = "profession" } -- Homely Sin'dorei Shelf
DVD.ActiveItems[262595] = { decorID = 14621, model3D = 6050877, source = "profession" } -- Homely Wall Shelves
DVD.ActiveItems[262597] = { decorID = 14622, model3D = 6074149, source = "profession" } -- Gilded Eversong Book
DVD.ActiveItems[262598] = { decorID = 14623, model3D = 6103388, source = "profession" } -- Opened Sin'dorei Scroll
DVD.ActiveItems[262599] = { decorID = 14624, model3D = 6209625, source = "profession" } -- Silvermoon Curtains
DVD.ActiveItems[262600] = { decorID = 14625, model3D = 6310375, source = "profession" } -- Stitched Haranir Rug
DVD.ActiveItems[262601] = { decorID = 14626, model3D = 6326918, source = "profession" } -- Wild Hanging Scroll
DVD.ActiveItems[262602] = { decorID = 14627, model3D = 6404236, source = "profession" } -- Ren'dorei Warp Orb
DVD.ActiveItems[262611] = { decorID = 14636, model3D = 6701013, source = "profession" } -- Voidstrider Saddlebag
DVD.ActiveItems[262612] = { decorID = 14637, model3D = 6701016, source = "profession" } -- Sturdy Ren'dorei Cask
DVD.ActiveItems[262613] = { decorID = 14638, model3D = 6715097, source = "profession" } -- Replica Haranir Mural
DVD.ActiveItems[262615] = { decorID = 14640, model3D = 6935637, source = "profession" } -- Sin'dorei Phoenix Quill
DVD.ActiveItems[262616] = { decorID = 14641, model3D = 6935640, source = "profession"} -- Lively Songwriter's Quill
DVD.ActiveItems[262617] = { decorID = 14642, model3D = 6980931, source = "profession" } -- Ren'dorei Crafting Framework
DVD.ActiveItems[262618] = { decorID = 14643, model3D = 7119312, source = "profession" } -- Ren'dorei Void Projector
DVD.ActiveItems[262663] = { decorID = 14676, model3D = 2991599, source = "profession" } -- Kyrian Floating Lamp
DVD.ActiveItems[262789] = { decorID = 14730, model3D = 5661242, source = "profession" } -- Small Telogrus Lamp
DVD.ActiveItems[262790] = { decorID = 14731, model3D = 5915398, source = "profession" } -- Restful Bronze Bench
DVD.ActiveItems[263027] = { decorID = 14816, model3D = 203845, source = "profession" } -- Darkmaster's Mystical Brazier
DVD.ActiveItems[263034] = { decorID = 14820, model3D = 7476200, source = "profession" } -- Magnificent Towering Bookcase
DVD.ActiveItems[263049] = { decorID = 14835, model3D = 6210884, source = "profession" } -- Ren'dorei Lightpost
DVD.ActiveItems[264244] = { decorID = 15479, model3D = 5161738, source = "profession" } -- Plush Haranir Leather Pillow
DVD.ActiveItems[264676] = { decorID = 16012, model3D = 243143, source = "profession" } -- Dalaran Sewer Gate
DVD.ActiveItems[264677] = { decorID = 16013, model3D = 424389, source = "profession" } -- Rolled Scarab Rug
DVD.ActiveItems[264678] = { decorID = 16014, model3D = 2992361, source = "profession" } -- Aspirant's Ringed Banner
DVD.ActiveItems[264679] = { decorID = 16015, model3D = 4286997, source = "profession" } -- Valdrakken Wall Shelf
DVD.ActiveItems[264707] = { decorID = 16084, model3D = 197671, source = "profession" } -- Resizable All-Purpose Gear
DVD.ActiveItems[264708] = { decorID = 16085, model3D = 197708, source = "profession" } -- Home Defense Gadget
DVD.ActiveItems[264710] = { decorID = 16087, model3D = 243135, source = "profession" } -- Dalaran Sun Sconce
DVD.ActiveItems[264711] = { decorID = 16088, model3D = 244205, source = "profession" } -- Joybuzz's Joyful Wall of Trains
DVD.ActiveItems[264712] = { decorID = 16089, model3D = 306120, source = "profession" } -- Gilnean Spare Saddle
DVD.ActiveItems[264713] = { decorID = 16090, model3D = 3564033, source = "profession" } -- Heart of the Forest Banner
DVD.ActiveItems[264899] = { decorID = 16219, model3D = 191825, source = "profession" } -- Arakkoan Alchemist's Concoction
DVD.ActiveItems[264900] = { decorID = 16220, model3D = 191826, source = "profession" } -- Arakkoan Alchemist's Bottle
DVD.ActiveItems[265791] = { decorID = 17515, model3D = 4899958, source = "profession" } -- Haranir Canopy Bed
DVD.ActiveItems[246693] = { decorID = 2460, model3D = 7033362, source = "profession" } -- Self-Pouring Thalassian Sunwine
DVD.ActiveItems[262458] = { decorID = 14588, model3D = 6427291, source = "profession" } -- Animated Sin'dorei Pick
DVD.ActiveItems[262459] = { decorID = 14589, model3D = 6427292, source = "profession" } -- Animated Sin'dorei Hammer
DVD.ActiveItems[262470] = { decorID = 14600, model3D = 7009238, source = "profession" } -- Spellbound Tome of Thalassian Magics
DVD.ActiveItems[264705] = { decorID = 16082, model3D = 191966, source = "profession" } -- Glazed Sin'dorei Vial
DVD.ActiveItems[268038] = { decorID = 19229, model3D = 7009238, source = "profession" } -- Endless Codex of Blooming Light
DVD.ActiveItems[268039] = { decorID = 19231, model3D = 7009238, source = "profession" } -- Endless Codex of Nature's Grace
DVD.ActiveItems[268041] = { decorID = 19234, model3D = 7009238, source = "profession" } -- Endless Codex of the Voidtouched
end







