-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems_12_1.lua
-- Patch 12.1 ActiveItems
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}

do -- 🏪 VENDOR NPC: 16528 (Provisioner Vredigar)
DVD.ActiveItems[256049] = { decorID = 10950, model3D = 6050850, requirement = { type = "reputation", faction = "Tranquillien", rank = 5 }, soldBy = {16528}, source = "vendor" } -- Sin'dorei Sleeper
DVD.ActiveItems[257419] = { decorID = 11500, model3D = 6033615, requirement = { type = "reputation", faction = "Tranquillien", rank = 5 }, soldBy = {16528}, source = "vendor" } -- Sin'dorei Crafter's Forge
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

do -- 🏪 VENDOR NPC: 50307 (Lord Candren) 252520 (Ripley Kiefer)
DVD.ActiveItems[245518] = { decorID = 858, model3D = 305584, soldBy = {50307, 252520}, source = "quest", noxp = true } -- Worgen's Chicken Coop
DVD.ActiveItems[245603] = { decorID = 1794, model3D = 6930895, requirement = { type = "reputation", faction = "Gilneas", rank =  4}, soldBy = {50307, 252520}, source = "vendor"}-- Gilnean Noble's Trellis
DVD.ActiveItems[245605] = { decorID = 1796, model3D = 6930898, requirement = { type = "reputation", faction = "Gilneas", rank = 3 }, soldBy = {50307, 252520}, source = "vendor"}-- Gilnean Stone Wall
DVD.ActiveItems[245620] = { decorID = 1829, model3D = 321660, soldBy = {50307, 252520}, source = "quest", noxp = true } -- Little Wolf's Loo
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

do -- 🏪 VENDOR NPC: 64605 (Tan Shin Tiao)
DVD.ActiveItems[245512] = { decorID = 1172, model3D = 555960, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 2}, soldBy = {64605}, source = "vendor"}-- Pandaren Cradle Stool
DVD.ActiveItems[247662] = { decorID = 3832, model3D = 535966, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 3}, soldBy = {64605}, source = "vendor"} -- Pandaren Scholar's Lectern
DVD.ActiveItems[247663] = { decorID = 3833, model3D = 536629, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 4}, soldBy = {64605}, source = "vendor"}-- Pandaren Scholar's Bookcase
DVD.ActiveItems[247855] = { decorID = 3993, model3D = 520092, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 3}, soldBy = {64605}, source = "vendor"}-- Pandaren Lacquered Crate
DVD.ActiveItems[247858] = { decorID = 3995, model3D = 531955, soldBy = {64605}, source = "quest", noxp = true } -- Shaohao Ceremonial Bell
DVD.ActiveItems[258147] = { decorID = 11873, model3D = 6854355, requirement = { type = "reputation", faction = "The Lorewalkers", rank = 4}, soldBy = {64605}, source = "vendor"}-- Empty Lorewalker's Bookcase
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

do -- 🏪 VENDOR NPC: 189226 (Cataloger Jakes) 188265 (Rae'ana)
DVD.ActiveItems[238975] = { decorID = 720, model3D = 4496829, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 24 }, soldBy = {189226, 188265}, source = "vendor", noxp = true } -- Reliquary Telescope
DVD.ActiveItems[245283] = { decorID = 1177, model3D = 4239021, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 16 }, soldBy = {189226, 188265}, source = "vendor", noxp = true } -- Blood Elven Candelabra
DVD.ActiveItems[245285] = { decorID = 716, model3D = 4239016, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 16 }, soldBy = {189226, 188265}, source = "vendor"}-- Reliquary Storage Crate
DVD.ActiveItems[245286] = { decorID = 1181, model3D = 4239026, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 10 }, soldBy = {189226, 188265}, source = "vendor"}-- Rectangular Sin'dorei Rug
DVD.ActiveItems[245287] = { decorID = 717, model3D = 4239027, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 10 }, soldBy = {189226, 188265}, source = "vendor"}-- Long Sin'dorei Rug
DVD.ActiveItems[245288] = { decorID = 718, model3D = 4239028, requirement = { type = "renown", faction = "Dragonscale Expedition", level = 10 }, soldBy = {189226, 188265}, source = "vendor"}-- Circular Sin'dorei Rug
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

do -- 🏪 VENDOR NPC: 240279 (Magovu)
DVD.ActiveItems[256924] = { decorID = 11324, model3D = 6125166, requirement = { type = "renown", faction = "Amani Tribe", level = 15 }, soldBy = {240279}, source = "vendor"}-- Hash'ey Heartbroth Cauldron
DVD.ActiveItems[256926] = { decorID = 11326, model3D = 6125778, requirement = { type = "renown", faction = "Amani Tribe", level = 15 }, soldBy = {240279}, source = "vendor"}-- Empty Amani Cauldron
DVD.ActiveItems[256927] = { decorID = 11327, model3D = 6212420, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor", noxp = true }-- Carved Idol of Nalorakk, Loa of War
DVD.ActiveItems[256933] = { decorID = 11333, model3D = 6866518, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor", noxp = true }-- Carved Idol of Jan'alai, Loa of Fire
DVD.ActiveItems[256934] = { decorID = 11334, model3D = 6994813, requirement = { type = "renown", faction = "Amani Tribe", level = 15 }, soldBy = {240279}, source = "vendor"}-- Boiling Amani Cauldron
DVD.ActiveItems[258290] = { decorID = 11936, model3D = 6212418, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor", noxp = true }-- Carved Idol of Halazzi, Loa of the Hunt
DVD.ActiveItems[258549] = { decorID = 12154, model3D = 6654785, requirement = { type = "renown", faction = "Amani Tribe", level = 11 }, soldBy = {240279}, source = "vendor", noxp = true }-- Burning Amani Pinecone
DVD.ActiveItems[260202] = { decorID = 14204, model3D = 6866516, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"}-- Visage of Akil'zon, Loa of Victory
DVD.ActiveItems[260514] = { decorID = 14350, model3D = 6866514, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"}-- Visage of Nalorakk, Loa of War
DVD.ActiveItems[260515] = { decorID = 14351, model3D = 6866515, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"} -- Visage of Halazzi, Loa of the Hunt
DVD.ActiveItems[260516] = { decorID = 14352, model3D = 6866517, requirement = { type = "renown", faction = "Amani Tribe", level = 18 }, soldBy = {240279}, source = "vendor"} -- Visage of Jan'alai, Loa of Fire
DVD.ActiveItems[263318] = { decorID = 15158, model3D = 6075565, requirement = { type = "renown", faction = "Amani Tribe", level = 3 }, soldBy = {240279}, source = "vendor"} -- Simple Amani Basket
DVD.ActiveItems[263320] = { decorID = 15160, model3D = 6075567, requirement = { type = "renown", faction = "Amani Tribe", level = 3 }, soldBy = {240279}, source = "vendor"} -- Rope-Bound Amani Basket
DVD.ActiveItems[264333] = { decorID = 15571, model3D = 6153813, requirement = { type = "renown", faction = "Amani Tribe", level = 11 }, soldBy = {240279}, source = "vendor", noxp = true }-- Amani Incense Burner
DVD.ActiveItems[264350] = { decorID = 15596, model3D = 6212419, requirement = { type = "renown", faction = "Amani Tribe", level = 7 }, soldBy = {240279}, source = "vendor", noxp = true }-- Carved Idol of Akil'zon, Loa of Victory
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

do -- 🏪 VENDOR NPC: 252313 (Caspian)
DVD.ActiveItems[245984] = { decorID = 1900, model3D = 6988296, soldBy = {252313}, source = "quest", noxp = true } -- Sagehold Window
DVD.ActiveItems[252395] = { decorID = 9044, model3D = 1709395, soldBy = {252313}, source = "quest", noxp = true } -- Brennadam Coop
DVD.ActiveItems[252394] = { decorID = 9043, model3D = 1602487, requirement = { type = "reputation", faction = "Storm's Wake", rank = 4 }, soldBy = {252313}, source = "vendor"}-- Bowhull Bookcase
DVD.ActiveItems[252396] = { decorID = 9045, model3D = 1711709, requirement = { type = "reputation", faction = "Storm's Wake", rank = 2 }, soldBy = {252313}, source = "vendor"}-- Admiralty's Copper Lantern
DVD.ActiveItems[252398] = { decorID = 9047, model3D = 1800789, requirement = { type = "reputation", faction = "Storm's Wake", rank = 3 }, soldBy = {252313}, source = "vendor"}-- Stormsong Water Pump
DVD.ActiveItems[252652] = { decorID = 9139, model3D = 1801975, requirement = { type = "reputation", faction = "Storm's Wake", rank = 4 }, soldBy = {252313}, source = "vendor"}-- Copper Stormsong Well
DVD.ActiveItems[252655] = { decorID = 9142, model3D = 7301013, soldBy = {252313}, source = "quest", noxp = true } -- Copper Tidesage's Sconce
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

do -- 🏪 VENDOR NPC: 253227 (Breana Bitterbrand) 49386 (Craw MacGraw)
DVD.ActiveItems[246108] = { decorID = 1998, model3D = 6436349, requirement = { type = "reputation", faction = "Wildhammer Clan", rank = 3 }, soldBy = {253227, 49386}, source = "vendor"}-- Embellished Dwarven Tome
DVD.ActiveItems[246425] = { decorID = 2242, model3D = 197563, requirement = { type = "reputation", faction = "Wildhammer Clan", rank = 2 }, soldBy = {253227, 49386}, source = "vendor"}-- Round Dwarven Table
DVD.ActiveItems[246427] = { decorID = 2244, model3D = 391448, soldBy = {253227}, source = "quest", noxp = true } -- Dilapidated Wildhammer Well
DVD.ActiveItems[246428] = { decorID = 2245, model3D = 392127, soldBy = {253227}, source = "quest", noxp = true } -- Overgrown Wildhammer Fountain
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

do -- 🏪 VENDOR NPC: 255495 (Rae'ana)
DVD.ActiveItems[273159] = {decorID = 22143, model3D = 7761091, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Void Elf Scribe's Desk
DVD.ActiveItems[273135] = {decorID = 22181, model3D = 7761099, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Void Elf Floating Desk
DVD.ActiveItems[273142] = {decorID = 22182, model3D = 7815448, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"}-- Runic Parchment
DVD.ActiveItems[273157] = {decorID = 22183, model3D = 7815449, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Voidflame Candle
DVD.ActiveItems[273147] = {decorID = 22388, model3D = 7761093, requirement = { type = "renown", faction = "Ritual Sites", level = 3 }, soldBy = {255495}, source = "vendor"} -- Void Inkwell
DVD.ActiveItems[271158] = {decorID = 21598, model3D = 5975183, requirement = { type = "renown", faction = "Ritual Sites", level = 7 }, soldBy = {255495}, source = "vendor"} -- Dark Obelisk
DVD.ActiveItems[276083] = { decorID = 25307, model3D = 7940395, soldBy = {255495}, source = "achievement" } -- Sunstrider Omnium Simulacrum
end

do -- 🏪 VENDOR NPC: 258328 (Thraxadar)
DVD.ActiveItems[247785] = { decorID = 3922, model3D = 6210877, requirement = { type = "reputation", faction = "Slayer's Duellum", rank = 4 }, soldBy = {258328}, source = "vendor"}-- Galactic Void-Scarred Banner
DVD.ActiveItems[264253] = { decorID = 15488, model3D = 6210879, requirement = { type = "reputation", faction = "Slayer's Duellum", rank = 2 }, soldBy = {258328}, source = "vendor"}-- Galactic Void-Scarred Barricade
DVD.ActiveItems[264345] = { decorID = 15585, model3D = 7141590, requirement = { type = "reputation", faction = "Slayer's Duellum", rank = 3 }, soldBy = {258328}, source = "vendor"}-- Galactic Commander's Orb
end

------------------------------Patch 12. 1----------------------------------------------------------------------------------

do -- 🏪 VENDOR NPC: 257598 (Second Mate Sluggs)
DVD.ActiveItems[277921] = { decorID = 25297, model3D = 1659545, requirement = { type = "reputation", faction = "Captain Tokka", rank = 5 }, soldBy = {257598}, source =  "vendor"} -- Traditional Tortollan Tent
DVD.ActiveItems[277923] = { decorID = 25299, model3D = 1661562, requirement = { type = "reputation", faction = "Captain Tokka", rank = 2 }, soldBy = {257598}, source =  "vendor"} -- Aged Tortollan Scroll Case
DVD.ActiveItems[277925] = { decorID = 25300, model3D = 1661570, requirement = { type = "reputation", faction = "Captain Tokka", rank = 4 }, soldBy = {257598}, source =  "vendor"} -- Blue Tortollan Signpost
DVD.ActiveItems[277927] = { decorID = 25336, model3D = 328308, requirement = { type = "reputation", faction = "Captain Tokka", rank = 2 }, soldBy = {257598}, source =  "vendor"} -- Yellowed Kelp Pile
DVD.ActiveItems[277929] = { decorID = 26196, model3D = 575405, requirement = { type = "reputation", faction = "Captain Tokka", rank = 4 }, soldBy = {257598}, source =  "vendor"} -- Rustic Fishing Rack
DVD.ActiveItems[277931] = { decorID = 26197, model3D = 1316187, requirement = { type = "reputation", faction = "Captain Tokka", rank = 3 }, soldBy = {257598}, source =  "vendor"} -- Hanging Yellowed Kelp
end

do -- 🏪 VENDOR NPC: 268228 (Jan'sari the Watchful)
DVD.ActiveItems[249765] = { decorID = 5648, model3D = 6212425, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 3 }, source =  "vendor"} -- Amani Supply Sack
DVD.ActiveItems[263316] = { decorID = 15156, model3D = 6075563, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 3 }, source =  "vendor"} -- Amani Storage Crate
DVD.ActiveItems[264331] = { decorID = 15569, model3D = 6075581, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 3 }, source =  "vendor"} -- Amani Wayfarer's Torch
DVD.ActiveItems[269778] = { decorID = 21324, model3D = 7277204, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 7 }, source =  "vendor"} -- Stitched Blisterfang Bag
DVD.ActiveItems[269779] = { decorID = 21325, model3D = 7277205, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 7 }, source =  "vendor"} -- Fanged Scaleskin Pouch
DVD.ActiveItems[277280] = { decorID = 26097, model3D = 7277196, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 7 }, source =  "vendor"} -- Vilescar Weapon Rack
DVD.ActiveItems[277271] = { decorID = 23874, model3D = 7277200, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 11 }, source =  "vendor"} -- Wrapped Scaleskin Urn
DVD.ActiveItems[277273] = { decorID = 23875, model3D = 7277201, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 11 }, source =  "vendor"} -- Cracked Vilescar Urn
DVD.ActiveItems[277275] = { decorID = 23876, model3D = 7277202, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 11 }, source =  "vendor"} -- Charmed Blisterfang Urn
DVD.ActiveItems[276457] = { decorID = 25294, model3D = 6356232, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 15 }, source =  "vendor"} -- Amani Worship Candle
DVD.ActiveItems[276459] = { decorID = 25295, model3D = 6356233, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 15 }, source =  "vendor"} -- Amani Ritual Candles
DVD.ActiveItems[264271] = { decorID = 15506, model3D = 7211478, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 15 }, source =  "vendor"} -- Amani Ritual Totem
DVD.ActiveItems[277323] = { decorID = 23873, model3D = 7277163, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 18 }, source =  "vendor"} -- sealed Serpentine Reliquary
DVD.ActiveItems[271177] = { decorID = 21617, model3D = 7277164, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 18 }, source =  "vendor"} -- Opened Serpentine Reliquary
DVD.ActiveItems[267377] = { decorID = 18900, model3D = 7277152, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 18 }, source =  "vendor"} -- Ula'tek Ritual Monolith
end

do -- 🏪 VENDOR NPC: 258181 (Construct Ali'a)
DVD.ActiveItems[278369] = { decorID = 22145, model3D = 7808626, soldBy = {258181}, source =  "vendor"} -- Preyhunter's Scaled Effigy
DVD.ActiveItems[278372] = { decorID = 22146, model3D = 7808627, soldBy = {258181}, source =  "vendor"} -- Preyhunter's Fanged Effigy
DVD.ActiveItems[278376] = { decorID = 22148, model3D = 7808630, soldBy = {258181}, source =  "vendor"} -- Preyhunter's Terror Effigy
DVD.ActiveItems[278380] = { decorID = 24891, model3D = 7808629, soldBy = {258181}, source =  "vendor"} -- Preyhunter's Terror Bust
DVD.ActiveItems[250868] = { decorID = 7832, model3D = 7259016,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 10 }, source =  "vendor"} -- Crimson Crystal Column
DVD.ActiveItems[250870] = { decorID = 7834, model3D = 7259018,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 5 }, source =  "vendor"} -- Crimson Crystal Fragment
DVD.ActiveItems[253449] = { decorID = 1136, model3D = 6212401,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 5 }, source =  "vendor"} -- Bound Silvermoon Drapes
DVD.ActiveItems[278123] = { decorID = 25286, model3D = 6005280,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 1 }, source =  "vendor"} -- Sturdy Silvermoon Crate Lid
DVD.ActiveItems[278126] = { decorID = 25289, model3D = 6050864,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 2 }, source =  "vendor"} -- Mysterious Sin'dorei Candlestick
DVD.ActiveItems[278130] = { decorID = 25274, model3D = 4496833,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 3 }, source =  "vendor"} -- Gilded Silvermoon Compass
DVD.ActiveItems[278134] = { decorID = 25284, model3D = 6005278,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 4 }, source =  "vendor"} -- Sturdy Silvermoon Crate
DVD.ActiveItems[278145] = { decorID = 25288, model3D = 6026040,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 6 }, source =  "vendor"} -- Stonecarved Sin'dorei Jar
DVD.ActiveItems[278148] = { decorID = 25287, model3D = 6009493,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 7 }, source =  "vendor"} -- Adorned Sin'dorei Satchel
DVD.ActiveItems[278151] = { decorID = 25279, model3D = 6005299,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 9 }, source =  "vendor"} -- Hanging Blood Knights Shield
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



