-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems_12_1.lua
-- Patch 12.1 ActiveItems
--minInterface = 120007
-- , unreleased = true
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}

-- DVD.ActiveItems[246960] = { decorID = 2589, model3D = 6225717, cam = {x=0.00, z=0.36, y=2.00, zf=2.4}, soldBy = {240407}, source = "vendor"} possibly removed



do -- 🏪 VENDOR NPC: 242398 (Naleidea Rivergleam)
DVD.ActiveItems[275857] = { decorID = 24765, model3D = 5947874, soldBy = {242398}, sources = {"vendor", "121"}, unreleased = true} -- Zul'Aman Creeping Pangoroot
DVD.ActiveItems[275853] = { decorID = 25296, model3D = 6684643, soldBy = {242398}, sources = {"vendor", "121"}, unreleased = true} -- Zul'Aman Burning Pinecone
end

do -- 🏪 VENDOR NPC: 242399 (Telemancer Astrandis Delivers Journey)
DVD.ActiveItems[265033] = { decorID = 16316, model3D = 6163862, soldBy = {242399}, sources = {"vendor", "121"}, unreleased = true} -- Zul'Aman Brazier Post
DVD.ActiveItems[265386] = { decorID = 16808, model3D = 6153836, soldBy = {242399}, sources = {"vendor", "121"}, unreleased = true} -- Zul'Aman Amani Awning
DVD.ActiveItems[267207] = { decorID = 18798, model3D = 6195758, soldBy = {242399}, sources = {"vendor", "121"}, unreleased = true} -- Amani Territorial Totem
DVD.ActiveItems[272360] = { decorID = 21951, model3D = 7277153, soldBy = {242399}, sources = {"vendor", "121"}, unreleased = true} -- Ula'tek Ritual Stone
end

do -- 🏪 VENDOR NPC: 249741 (Cousin Shortkaf) Endeavor
DVD.ActiveItems[248404] = { decorID = 4426, model3D = 1305116, soldBy = {249741}, sources = {"vendor", "121" }, unreleased = true} -- Stack of Kafa Mugs
end

do -- 🏪 VENDOR NPC: 252873 (Morta Gage)
DVD.ActiveItems[278038] = { decorID = 26202, model3D = 5658299, soldBy = {252873}, sources = {"quest", "121"}, unreleased = true} -- Arathor Toy Sword
DVD.ActiveItems[278044] = { decorID = 26201, model3D = 5503816, soldBy = {252873}, sources = {"quest", "121"}, unreleased = true} -- Hanging Candles
DVD.ActiveItems[278694] = { decorID = 26651, model3D = 526368, soldBy = {252873}, sources = {"quest", "121"}, unreleased = true} -- Stormstout Hanging Lantern
end

do -- 🏪 VENDOR NPC: 253596 (The Last Architect Horde) 248854 (The Last Architect Alliance)

end

do -- 🏪 VENDOR NPC: 254944 (Tajaka Sawtusk)
DVD.ActiveItems[278691] = { decorID = 26203, model3D = 5975164, soldBy = {254944}, sources = {"quest", "121"}, unreleased = true} -- Twilight Brazier
end

do -- 🏪 VENDOR NPC: 255216 (Balen Starfinder) 255298 (Jehzar Starfall)
DVD.ActiveItems[243337] = { decorID = 1283, model3D = 6872663, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true, unreleased = true} -- Bound-Left Silvermoon Drapes
DVD.ActiveItems[243338] = { decorID = 1284, model3D = 6872664, soldBy = {255216, 255298}, sources = {"vendor", "121"}, noxp = true, unreleased = true} -- Bound-Right Silvermoon Drapes
end

do -- 🏪 VENDOR NPC: 257168 (Throska) Endeavor
DVD.ActiveItems[247776] = { decorID = 3913, model3D = 193949, soldBy = {257168}, sources = {"vendor", "121"}, unreleased = true } -- Glowing Zangarshroom Cup
DVD.ActiveItems[279458] = { decorID = 26477, model3D = 192399, soldBy = {257168}, sources = {"vendor", "121"}, unreleased = true } -- Draenei Rock Goblet
DVD.ActiveItems[279455] = { decorID = 26491, model3D = 3851908, soldBy = {257168}, sources = {"vendor", "121"}, unreleased = true } -- K'areshi Tea Cup
end

do -- 🏪 VENDOR NPC: 257332 (Devin Slatesmith) 257257 (Merki)
DVD.ActiveItems[280142] = { decorID = 23553, model3D = 7834745, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Small Wooden Floor Tile
DVD.ActiveItems[280144] = { decorID = 23554, model3D = 7834746, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Large Wooden Floor Tile
DVD.ActiveItems[280146] = { decorID = 23555, model3D = 7834747, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Small Triangular Wooden Tile
DVD.ActiveItems[280148] = { decorID = 23556, model3D = 7834748, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Large Triangular Wooden Tile
DVD.ActiveItems[280150] = { decorID = 23557, model3D = 7834749, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Tall Round Wooden Column
DVD.ActiveItems[280152] = { decorID = 23558, model3D = 7834750, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Short Round Wooden Column
DVD.ActiveItems[280154] = { decorID = 23559, model3D = 7834751, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Short Square Wooden Column
DVD.ActiveItems[280156] = { decorID = 23560, model3D = 7834752, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Tall Square Wooden Column
DVD.ActiveItems[280158] = { decorID = 23707, model3D = 7834753, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Small Wooden Wall Tile
DVD.ActiveItems[280160] = { decorID = 23708, model3D = 7834754, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Large Wooden Wall Tile
DVD.ActiveItems[280162] = { decorID = 23709, model3D = 7834756, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Wide Wooden Staircase
DVD.ActiveItems[280164] = { decorID = 23710, model3D = 7834757, soldBy = {257332, 257257}, sources = {"vendor", "121"}, noxp = true, unreleased = true } -- Spiral Wooden Stairs
end

do -- 🏪 VENDOR NPC: 257598 (Second Mate Sluggs)
DVD.ActiveItems[277921] = { decorID = 25297, model3D = 1659545, requirement = { type = "reputation", faction = "Captain Tokka", rank = 5 }, soldBy = {257598}, sources = {"vendor", "121"}, unreleased = true} -- Traditional Tortollan Tent
DVD.ActiveItems[277923] = { decorID = 25299, model3D = 1661562, requirement = { type = "reputation", faction = "Captain Tokka", rank = 2 }, soldBy = {257598}, sources = {"vendor", "121"}, unreleased = true} -- Aged Tortollan Scroll Case
DVD.ActiveItems[277925] = { decorID = 25300, model3D = 1661570, requirement = { type = "reputation", faction = "Captain Tokka", rank = 4 }, soldBy = {257598}, sources = {"vendor", "121"}, unreleased = true} -- Blue Tortollan Signpost
DVD.ActiveItems[277927] = { decorID = 25336, model3D = 328308, requirement = { type = "reputation", faction = "Captain Tokka", rank = 2 }, soldBy = {257598}, sources = {"vendor", "121"}, unreleased = true} -- Yellowed Kelp Pile
DVD.ActiveItems[277929] = { decorID = 26196, model3D = 575405, requirement = { type = "reputation", faction = "Captain Tokka", rank = 4 }, soldBy = {257598}, sources = {"vendor", "121"}, unreleased = true} -- Rustic Fishing Rack
DVD.ActiveItems[277931] = { decorID = 26197, model3D = 1316187, requirement = { type = "reputation", faction = "Captain Tokka", rank = 3 }, soldBy = {257598}, sources = {"vendor", "121"}, unreleased = true} -- Hanging Yellowed Kelp
end

do -- 🏪 VENDOR NPC: 258181 (Construct Ali'a)
DVD.ActiveItems[278369] = { decorID = 22145, model3D = 7808626, soldBy = {258181}, sources = {"121", "achievement"}, unreleased = true} -- Preyhunter's Scaled Effigy
DVD.ActiveItems[278372] = { decorID = 22146, model3D = 7808627, soldBy = {258181}, sources = {"121", "achievement"}, unreleased = true} -- Preyhunter's Fanged Effigy
DVD.ActiveItems[278376] = { decorID = 22148, model3D = 7808630, soldBy = {258181}, sources = {"121", "achievement"}, unreleased = true} -- Preyhunter's Terror Effigy
DVD.ActiveItems[278380] = { decorID = 24891, model3D = 7808629, soldBy = {258181}, sources = {"121", "achievement"}, unreleased = true} -- Preyhunter's Terror Bust
DVD.ActiveItems[250868] = { decorID = 7832, model3D = 7259016,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 10 }, sources = {"121", "vendor"}, unreleased = true} -- Crimson Crystal Column
DVD.ActiveItems[250870] = { decorID = 7834, model3D = 7259018,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 5 }, sources = {"121", "vendor"}, unreleased = true} -- Crimson Crystal Fragment
DVD.ActiveItems[253449] = { decorID = 1136, model3D = 6212401,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 5 }, sources = {"121", "vendor"}, unreleased = true} -- Bound Silvermoon Drapes
DVD.ActiveItems[278123] = { decorID = 25286, model3D = 6005280,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 1 }, sources = {"121", "vendor"}, unreleased = true} -- Sturdy Silvermoon Crate Lid
DVD.ActiveItems[278126] = { decorID = 25289, model3D = 6050864,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 2 }, sources = {"121", "vendor"}, unreleased = true} -- Mysterious Sin'dorei Candlestick
DVD.ActiveItems[278130] = { decorID = 25274, model3D = 4496833,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 3 }, sources = {"121", "vendor"}, unreleased = true} -- Gilded Silvermoon Compass
DVD.ActiveItems[278134] = { decorID = 25284, model3D = 6005278,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 4 }, sources = {"121", "vendor"}, unreleased = true} -- Sturdy Silvermoon Crate
DVD.ActiveItems[278145] = { decorID = 25288, model3D = 6026040,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 6 }, sources = {"121", "vendor"}, unreleased = true} -- Stonecarved Sin'dorei Jar
DVD.ActiveItems[278148] = { decorID = 25287, model3D = 6009493,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 7 }, sources = {"121", "vendor"}, unreleased = true} -- Adorned Sin'dorei Satchel
DVD.ActiveItems[278151] = { decorID = 25279, model3D = 6005299,  soldBy = {258181}, requirement = { type = "renown", faction = "Prey", level = 9 }, sources = {"121", "vendor"}, unreleased = true} -- Hanging Blood Knights Shield
end

do -- 🏪 VENDOR NPC: 260485 (Griftah) Endeavor
DVD.ActiveItems[255649] = { decorID = 10859, model3D = 6195755, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Amani Water Well
DVD.ActiveItems[263317] = { decorID = 15157, model3D = 6075564, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Amani Wicker Crate
DVD.ActiveItems[263708] = { decorID = 15265, model3D = 6075562, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Amani Anvil
DVD.ActiveItems[274518] = { decorID = 22916, model3D = 6155553, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Amani Decorative Plinth
DVD.ActiveItems[274521] = { decorID = 22917, model3D = 6195759, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Amani Road Marker
DVD.ActiveItems[274523] = { decorID = 22918, model3D = 6212403, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Woven Forest Troll Rug
DVD.ActiveItems[274525] = { decorID = 22919, model3D = 6212411, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Steamy Romance Tablet
DVD.ActiveItems[274527] = { decorID = 22920, model3D = 6225023, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Amani Building Peg
DVD.ActiveItems[274529] = { decorID = 22921, model3D = 6225620, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Forest Troll Fence
DVD.ActiveItems[274531] = { decorID = 22922, model3D = 6225624, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Forest Troll Fencepost
DVD.ActiveItems[274533] = { decorID = 22924, model3D = 7345745, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Witch Doctor's Punch Bowl
DVD.ActiveItems[274535] = { decorID = 22925, model3D = 7833324, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Shrine of Nalorakk, Loa of War
DVD.ActiveItems[274537] = { decorID = 22926, model3D = 7833325, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Shrine of Jan'alai, Loa of Fire
DVD.ActiveItems[274505] = { decorID = 22927, model3D = 7833326, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Shrine of Akil'zon, Loa of Victory
DVD.ActiveItems[274539] = { decorID = 23188, model3D = 7833327, soldBy = {260485}, sources = {"vendor", "121"}, unreleased = true } -- Shrine of Halazzi, Loa of the Hunt
end

do -- 🏪 VENDOR NPC: 262880 (Er'inye)
DVD.ActiveItems[275628] = { decorID = 23871, model3D = 7277158, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} -- Cauldron of Ula'tek
DVD.ActiveItems[269637] = { decorID = 21102, model3D = 7277157, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Serpent-Caller Spike
DVD.ActiveItems[266169] = { decorID = 17799, model3D = 7277140, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Soulcoiler Canopy
DVD.ActiveItems[279919] = { decorID = 24519, model3D = 1835148, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Soulcoiler Jaw
DVD.ActiveItems[275578] = { decorID = 23881, model3D = 7354106, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Soulcoiler Sconce
DVD.ActiveItems[279917] = { decorID = 24512, model3D = 1834576, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Soulcoiler Skull
DVD.ActiveItems[253455] = { decorID = 1140, model3D = 6195752, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Unearthed Sarcophagus Lid
DVD.ActiveItems[253473] = { decorID = 1150, model3D = 6195751, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Unearthed Sarcophagus Base
DVD.ActiveItems[272362] = { decorID = 21953, model3D = 7355771, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Venombound Ropes
DVD.ActiveItems[271850] = { decorID = 21832, model3D = 7277150, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Venomous Tendril
DVD.ActiveItems[267378] = { decorID = 18901, model3D = 7277160, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} --Venom Scholar's Focus
DVD.ActiveItems[279922] = { decorID = 25292, model3D = 7277155, soldBy = {262880}, sources = {"achievement", "121"}, unreleased = true} --Altar of Corrosion
DVD.ActiveItems[271358] = { decorID = 21653, model3D = 7277182, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} -- Clutch of Ula'tek
DVD.ActiveItems[271604] = { decorID = 21720, model3D = 7277175, soldBy = {262880}, sources = {"vendor", "121"}, unreleased = true} -- Egg of Ula'tek
end

do -- 🏪 VENDOR NPC: 265551 (Roshai Lightstep) Endeavor
DVD.ActiveItems[276650] = { decorID = 23176, model3D = 4182508, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Maruukai Barricade
DVD.ActiveItems[276626] = { decorID = 23177, model3D = 4182509, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Wide Maruukai Barricade
DVD.ActiveItems[276669] = { decorID = 23178, model3D = 4207254, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Maruukai Storage Basket
DVD.ActiveItems[276671] = { decorID = 23179, model3D = 4207255, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Open Maruukai Storage Basket
DVD.ActiveItems[276656] = { decorID = 23180, model3D = 4282525, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Maruukai Wooden Table
DVD.ActiveItems[276658] = { decorID = 23181, model3D = 4286993, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Maruukai Feast Table
DVD.ActiveItems[276663] = { decorID = 23182, model3D = 4291399, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Bakar's Napping Rug
DVD.ActiveItems[276665] = { decorID = 23183, model3D = 4291400, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Ornate Khanam's Rug
DVD.ActiveItems[276667] = { decorID = 23184, model3D = 4298411, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Large Ornate Khanam's Rug
DVD.ActiveItems[276661] = { decorID = 23185, model3D = 4324622, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Maruukai Chef's Stove
DVD.ActiveItems[276652] = { decorID = 23186, model3D = 4479330, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Tapered Maruukai Barricade
DVD.ActiveItems[276654] = { decorID = 23548, model3D = 969722, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Bakar's Favorite Ball
DVD.ActiveItems[276677] = { decorID = 23549, model3D = 969746, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Pet Food and Water Tray
DVD.ActiveItems[276673] = { decorID = 23550, model3D = 4288081, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Bakar's Snack
DVD.ActiveItems[276675] = { decorID = 23551, model3D = 4288082, soldBy = {265551}, sources = {"vendor", "121"}, unreleased = true } -- Bakar's Dinner
end

do -- 🏪 VENDOR NPC: 267794 (Agratha) 267995 (Perry Winkles)
DVD.ActiveItems[277163] = { decorID = 25122, model3D = 6023432, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Loyal Companion's Plinth
DVD.ActiveItems[277121] = { decorID = 25121, model3D = 5199469, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Cozy Bird Nest
DVD.ActiveItems[277160] = { decorID = 25106, model3D = 6080227, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Cozy Lightbloom Lilypad
DVD.ActiveItems[277149] = { decorID = 25103, model3D = 876116, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Crude Pet Cage
DVD.ActiveItems[277144] = { decorID = 25102, model3D = 1021562, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Crossroads Pet Cage
DVD.ActiveItems[277142] = { decorID = 25101, model3D = 970227, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Westfall Pet Cage
DVD.ActiveItems[277138] = { decorID = 25105, model3D = 6323400, noxp = true, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Silvermoon Dragonhawk Incubator
DVD.ActiveItems[276230] = { decorID = 25546, model3D = 7959391, soldBy = {267794, 267795}, sources = {"vendor", "121"}, unreleased = true} -- Pepe
end

do -- 🏪 VENDOR NPC: 267870 (Unquestionably Griftah) Endeavor
DVD.ActiveItems[276312] = { decorID = 25128, model3D = 7914427, soldBy = {267870}, sources = {"vendor", "121"}, unreleased = true} -- Griftah's Torch of Rotation
DVD.ActiveItems[244344] = { decorID = 1427, model3D = 6870561, soldBy = {267870}, sources = {"vendor", "121"}, unreleased = true} -- Griftah's Mystical Polter-Urn
DVD.ActiveItems[263875] = { decorID = 15285, model3D = 6153817, soldBy = {267870}, sources = {"vendor", "121"}, unreleased = true} -- Griftah's Resizing Hex-Skull
end

do -- 🏪 VENDOR NPC: 268106 (Taifa) Endeavor
DVD.ActiveItems[280215] = { decorID = 26871, model3D = 1659640, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Tortollan Tarp Tent
DVD.ActiveItems[280225] = { decorID = 26564, model3D = 1663983, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Mason's Tortollan Display Rack
DVD.ActiveItems[280221] = { decorID = 26482, model3D = 1662185, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Sealeather Sack
DVD.ActiveItems[280236] = { decorID = 26478, model3D = 307788, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Ancient Memories of the Sea
DVD.ActiveItems[280227] = { decorID = 26389, model3D = 1663982, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Apothecary's Tortollan Display Rack
DVD.ActiveItems[280232] = { decorID = 26387, model3D = 1661568, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Sea Glass Lamp Post
DVD.ActiveItems[280238] = { decorID = 26386, model3D = 1661558, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Half-Shell Hot Pot
DVD.ActiveItems[280242] = { decorID = 26373, model3D = 1706189, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Tortollan Traveler's Chest
DVD.ActiveItems[280234] = { decorID = 26371, model3D = 1667789, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Sea Glass Bauble
DVD.ActiveItems[280230] = { decorID = 26370, model3D = 1663980, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Empty Tortollan Display Rack
DVD.ActiveItems[280240] = { decorID = 26365, model3D = 1659639, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Compact Cookfire
DVD.ActiveItems[280244] = { decorID = 26364, model3D = 1634604, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Tortollan Traveler's Tincture
DVD.ActiveItems[280873] = { decorID = 26367, model3D = 1661563, soldBy = {268106}, sources = {"vendor", "121"}, unreleased = true} -- Protected Tortollan Scroll Case
end

do -- 🏪 VENDOR NPC: 268228 (Jan'sari the Watchful)
DVD.ActiveItems[249765] = { decorID = 5648, model3D = 6212425, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 3 }, sources = {"121","vendor"}, unreleased = true} -- Amani Supply Sack
DVD.ActiveItems[263316] = { decorID = 15156, model3D = 6075563, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 3 }, sources = {"121","vendor"}, unreleased = true} -- Amani Storage Crate
DVD.ActiveItems[264331] = { decorID = 15569, model3D = 6075581, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 3 }, sources = {"121","vendor"}, unreleased = true} -- Amani Wayfarer's Torch
DVD.ActiveItems[269778] = { decorID = 21324, model3D = 7277204, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 7 }, sources = {"121","vendor"}, unreleased = true} -- Stitched Blisterfang Bag
DVD.ActiveItems[269779] = { decorID = 21325, model3D = 7277205, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 7 }, sources = {"121","vendor"}, unreleased = true} -- Fanged Scaleskin Pouch
DVD.ActiveItems[277280] = { decorID = 26097, model3D = 7277196, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 7 }, sources = {"121","vendor"}, unreleased = true} -- Vilescar Weapon Rack
DVD.ActiveItems[277271] = { decorID = 23874, model3D = 7277200, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 11 }, sources = {"121","vendor"}, unreleased = true} -- Wrapped Scaleskin Urn
DVD.ActiveItems[277273] = { decorID = 23875, model3D = 7277201, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 11 }, sources = {"121","vendor"}, unreleased = true} -- Cracked Vilescar Urn
DVD.ActiveItems[277275] = { decorID = 23876, model3D = 7277202, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 11 }, sources = {"121","vendor"}, unreleased = true} -- Charmed Blisterfang Urn
DVD.ActiveItems[276457] = { decorID = 25294, model3D = 6356232, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 15 }, sources = {"121","vendor"}, unreleased = true} -- Amani Worship Candle
DVD.ActiveItems[276459] = { decorID = 25295, model3D = 6356233, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 15 }, sources = {"121","vendor"}, unreleased = true} -- Amani Ritual Candles
DVD.ActiveItems[264271] = { decorID = 15506, model3D = 7211478, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 15 }, sources = {"121","vendor"}, unreleased = true} -- Amani Ritual Totem
DVD.ActiveItems[277323] = { decorID = 23873, model3D = 7277163, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 18 }, sources = {"121","vendor"}, unreleased = true} -- sealed Serpentine Reliquary
DVD.ActiveItems[271177] = { decorID = 21617, model3D = 7277164, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 18 }, sources = {"121","vendor"}, unreleased = true} -- Opened Serpentine Reliquary
DVD.ActiveItems[267377] = { decorID = 18900, model3D = 7277152, soldBy = {268228}, requirement = { type = "renown", faction = "Zul'jarra's Forces", level = 18 }, sources = {"121","vendor"}, unreleased = true} -- Ula'tek Ritual Monolith
end

do -- 🏪 VENDOR NPC: 270399 (Firetender Zab'ni)
DVD.ActiveItems[263873] = { decorID = 15283, model3D = 6075561, soldBy = {270399}, sources = {"121", "achievement"}, unreleased = true} -- Amani Forge
DVD.ActiveItems[271851] = { decorID = 21833, model3D = 7277199, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Oozing Vilescar Barricade
DVD.ActiveItems[279452] = { decorID = 27041, model3D = 7498517, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Forgotten Amani Mural
DVD.ActiveItems[279285] = { decorID = 26484, model3D = 1675098, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Lost Tortollan Scroll
DVD.ActiveItems[279292] = { decorID = 26377, model3D = 5933618, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Zul'Aman Pine Tree
DVD.ActiveItems[279508] = { decorID = 27042, model3D = 8117702, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- "The Hunger Awakens" Mural
DVD.ActiveItems[280218] = { decorID = 26481, model3D = 1661561, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Tortollan Scholar Satchel
DVD.ActiveItems[271176] = { decorID = 21616, model3D = 7277162, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Feathered Ula'tek Talisman
DVD.ActiveItems[271609] = { decorID = 21725, model3D = 7277186, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Destroyed Clutch of Ula'tek
DVD.ActiveItems[248962] = { decorID = 5130, model3D = 6163853, soldBy = {270399}, sources = {"quest", "121"}, unreleased = true} -- Mysterious Voodoo Mask
end

do -- 🏪 VENDOR NPC: 271173 (Timicky) Endeavor
DVD.ActiveItems[280269] = { decorID = 26938, model3D = 5348713, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Cozy Kobold Crate
DVD.ActiveItems[280265] = { decorID = 26789, model3D = 5794799, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Hot Kobold Treasure
DVD.ActiveItems[280267] = { decorID = 26788, model3D = 5341079, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Bold Kobold Kabin
DVD.ActiveItems[280261] = { decorID = 26786, model3D = 5169946, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Large Threedium Warrens Candle
DVD.ActiveItems[280263] = { decorID = 26787, model3D = 5169950, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Candle Cage
DVD.ActiveItems[280255] = { decorID = 26618, model3D = 5169941, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Small Warrens Candle
DVD.ActiveItems[280257] = { decorID = 26621, model3D = 5169940, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Medium Warrens Candle
DVD.ActiveItems[280259] = { decorID = 26785, model3D = 5169943, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Large Warrens Candle
DVD.ActiveItems[280251] = { decorID = 26619, model3D = 5350458, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Kobold Sit-Thing
DVD.ActiveItems[280253] = { decorID = 26617, model3D = 5169938, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Highlighting High Light
DVD.ActiveItems[280249] = { decorID = 26614, model3D = 5355798, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Kobold Dig-Thing
DVD.ActiveItems[280246] = { decorID = 26613, model3D = 5347569, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Warrens Candlecooker
DVD.ActiveItems[280271] = { decorID = 26937, model3D = 5345654, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Longwick Rope
DVD.ActiveItems[280273] = { decorID = 26936, model3D = 5345653, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Droopy Longwick Rope
DVD.ActiveItems[280275] = { decorID = 26939, model3D = 5350460, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Hanging Longwick Rope
DVD.ActiveItems[280513] = { decorID = 27167, model3D = 8118955, soldBy = {271173}, sources = {"vendor", "121"}, unreleased = true} -- Color-Curious Candle
end

do -- 🏪 VENDOR NPC: 271604 Holly Twinklebright alliance and 271366 Jolli Maxiboom horde
DVD.ActiveItems[248101] = { decorID = 4157, model3D = 2918351, soldBy = {271604, 271366}, source = "121", unreleased = true  } -- Traditional Brewfest Stein
DVD.ActiveItems[280335] = { decorID = 25675, model3D = 2958730, soldBy = {271604, 271366}, source = "121", unreleased = true  } -- Brewfest Crate
end

do -- 🏪 VENDOR NPC: 271372 Fizz Alechux horde and 271603 Kay Stouthammer alliance
DVD.ActiveItems[280337] = { decorID = 25666, model3D = 2918357, soldBy = {271372, 271603}, source = "121", unreleased = true  } -- Traditional Brewfest Banner
DVD.ActiveItems[280339] = { decorID = 25672, model3D = 2918364, soldBy = {271372, 271603}, source = "121", unreleased = true  } -- Brewfest Fence
DVD.ActiveItems[280341] = { decorID = 25673, model3D = 2918369, soldBy = {271372, 271603}, source = "121", unreleased = true  } -- Brewfest Fencepost
DVD.ActiveItems[280343] = { decorID = 25674, model3D = 2918622, soldBy = {271372, 271603}, source = "121", unreleased = true  } -- Hanging Brewfest Wreath
end

do -- 📦 Professions
DVD.ActiveItems[279356] = { decorID = 26488, model3D = 2438984, source = "121", unreleased = true} -- Opalescent Amani Peridot
DVD.ActiveItems[279343] = { decorID = 26489, model3D = 2438985, source = "121", unreleased = true} -- Piercing Amani Lapis
DVD.ActiveItems[280762] = { decorID = 26490, model3D = 2438987, source = "121", unreleased = true} -- Roaring Amani Garnet
DVD.ActiveItems[280752] = { decorID = 26384, model3D = 7498518, source = "121", unreleased = true} -- "Cursed Gaze of Ula'tek" Mural
DVD.ActiveItems[280757] = { decorID = 26380, model3D = 6212409, source = "121", unreleased = true} -- Chiseled Amani Tablet
DVD.ActiveItems[279341] = { decorID = 26372, model3D = 1668078, source = "121", unreleased = true} -- Aetherlume Field Lamp
DVD.ActiveItems[279337] = { decorID = 26383, model3D = 6715093, source = "121", unreleased = true} -- Coiled Amani Hookshot
DVD.ActiveItems[279339] = { decorID = 26485, model3D = 1852970, source = "121", unreleased = true} -- Proudmoore Ship-in-a-Bottle
DVD.ActiveItems[279359] = { decorID = 26391, model3D = 7880108, source = "121", unreleased = true} -- Ersatz Venom Splatter
DVD.ActiveItems[266170] = { decorID = 17800, model3D = 7277141, source = "121", unreleased = true} -- Flat Snakeskin Canopy
DVD.ActiveItems[279346] = { decorID = 26378, model3D = 6125163, source = "121", unreleased = true} -- Stretched Snakeskin Rack
DVD.ActiveItems[279348] = { decorID = 26363, model3D = 1097621, source = "121", unreleased = true} -- Mounted Moby
DVD.ActiveItems[279329] = { decorID = 26382, model3D = 6212431, source = "121", unreleased = true} -- Amani Forgemaster's Rack
DVD.ActiveItems[275305] = { decorID = 26381, model3D = 6212428, source = "121", unreleased = true} -- Amani Forgemaster's Decorative Spear
DVD.ActiveItems[263709] = { decorID = 15266, model3D = 6125155, source = "121", unreleased = true} -- Amani Forgemaster's Workbench
DVD.ActiveItems[279335] = { decorID = 26496, model3D = 7143556, source = "121", unreleased = true} -- Enchanted Voidwell Fish
DVD.ActiveItems[279362] = { decorID = 5129, model3D = 6163852, source = "121", unreleased = true} -- Furious Tiki Mask
DVD.ActiveItems[279332] = {decorID = 26379, model3D = 6195676, source = "121", unreleased = true} -- Keen Hex Mask	
DVD.ActiveItems[279353] = { decorID = 26366, model3D = 1661560, source = "121", unreleased = true} -- Tortollan Slingsack
DVD.ActiveItems[279350] = { decorID = 26495, model3D = 5975145, source = "121", unreleased = true} -- Twilight's Blade Bedroll
end

do -- 📦 Midnight Deliver
DVD.ActiveItems[267080] = { decorID = 18615, model3D = 6153830, bossevent = "Midnight Delves", mapID = 2512, expansion = "Midnight", zone = "Delves", sources = {"drop", "121"}, unreleased = true} -- Amani Blueflame Chandelier
DVD.ActiveItems[275855] = { decorID = 24889, model3D = 5869189, bossevent = "Midnight Delves", mapID = 2512, expansion = "Midnight", zone = "Delves", sources = {"drop", "121"}, unreleased = true} -- Zul'Aman Swamp Palm Sprout
DVD.ActiveItems[248963] = { decorID = 5131, model3D = 6163854, bossevent = "Midnight Delves", mapID = 2512, expansion = "Midnight", zone = "Delves", sources = {"drop", "121"}, unreleased = true} -- Spirit-Touched Amani Mask
end

do -- 📦 Prey Boss Drops
DVD.ActiveItems[263874] = { decorID = 15284, model3D = 6153816, source = "121", unreleased = true} -- Emerald-Encrusted Amani Ritual Skull
DVD.ActiveItems[278154] = { decorID = 25337, model3D = 2025842, source = "121", unreleased = true} -- Hooked Net Trap
DVD.ActiveItems[278374] = { decorID = 22147, model3D = 7808628, source = "121", unreleased = true} -- Preyhunter's Fanged Bust
DVD.ActiveItems[278378] = { decorID = 24890, model3D = 7808625, source = "121", unreleased = true} -- Preyhunter's Scaled Bust
end

do -- 📦 Cursed Keepsake Quests
DVD.ActiveItems[244347] = { decorID = 1430, model3D = 6904849, soldBy = {262726}, source = "121", unreleased = true } -- Purified Troll Urn
DVD.ActiveItems[245991] = { decorID = 1907, model3D = 6985812, soldBy = {262726}, source = "121", unreleased = true } -- Purified Sin'dorei Candle
DVD.ActiveItems[245993] = { decorID = 1909, model3D = 6985814, soldBy = {262726}, source = "121", unreleased = true } -- Purified Floating Lantern
DVD.ActiveItems[252042] = { decorID = 8990, model3D = 6212457, soldBy = {262726}, source = "121", unreleased = true } -- Purified Troll Pitcher
DVD.ActiveItems[253396] = { decorID = 9289, model3D = 6654738, soldBy = {262726}, source = "121", unreleased = true } -- Purified Crude Axe
DVD.ActiveItems[253703] = { decorID = 9627, model3D = 6654736, soldBy = {262726}, source = "121", unreleased = true } -- Purified Crude Hammer
DVD.ActiveItems[255652] = { decorID = 10862, model3D = 6654716, soldBy = {262726}, source = "121", unreleased = true } -- Purified Troll Loop
DVD.ActiveItems[255712] = { decorID = 10896, model3D = 6654760, soldBy = {262726}, source = "121", unreleased = true } -- Purified Ancient Urn
DVD.ActiveItems[256361] = { decorID = 11140, model3D = 6654720, soldBy = {262726}, source = "121", unreleased = true } -- Purified Troll Pendant
DVD.ActiveItems[263876] = { decorID = 15286, model3D = 7338169, soldBy = {262726}, source = "121", unreleased = true } -- Purified Folk Mirror
DVD.ActiveItems[256684] = { decorID = 11285, model3D = 6654719, soldBy = {262726}, source = "121", unreleased = true } -- Purified Troll Amulet
DVD.ActiveItems[267205] = { decorID = 18796, model3D = 7345175, soldBy = {262726}, source = "121", unreleased = true } -- Purified Folk Candle
DVD.ActiveItems[267355] = { decorID = 18880, model3D = 7554177, soldBy = {262726}, source = "121", unreleased = true } -- Purified Elven Mirror
DVD.ActiveItems[267435] = { decorID = 18960, model3D = 7554186, soldBy = {262726}, source = "121", unreleased = true } -- Purified Kaldorei Candle
DVD.ActiveItems[268943] = { decorID = 20332, model3D = 7554195, soldBy = {262726}, source = "121", unreleased = true } -- Purified Elven Glowlamp
DVD.ActiveItems[272129] = { decorID = 21873, model3D = 1324327, soldBy = {262726}, source = "121", unreleased = true } -- Purified Tauren Pot
DVD.ActiveItems[272142] = { decorID = 21886, model3D = 5203782, soldBy = {262726}, source = "121", unreleased = true } -- Purified Earthen Pot
DVD.ActiveItems[278696] = { decorID = 26492, model3D = 4495230, soldBy = {262726}, source = "121", unreleased = true } -- Purified Dracthyr Stein
DVD.ActiveItems[278701] = { decorID = 26494, model3D = 5793093, soldBy = {262726}, source = "121", unreleased = true } -- Purified Goblin Cup
DVD.ActiveItems[258540] = { decorID = 12145, model3D = 6654715, soldBy = {262726}, source = "121", unreleased = true } -- Purified Troll Ring
end

do -- 📦 Raids
DVD.ActiveItems[269269] = { decorID = 20632, model3D = 6224355, bossencounter = 2738, mapID = 2530, expansion = "Midnight", zone = "The VoidSpire", source = "boss"}-- Devouring Ritual Spire
DVD.ActiveItems[279112] = { decorID = 26487, model3D = 2433564, bossencounter = 2849, mapID = 2632, expansion = "Midnight", zone = "The Tidebound Grotto", sources = {"boss", "121"}, unreleased = true} -- Clumped Asteroidea
DVD.ActiveItems[272361] = { decorID = 21952, model3D = 7277208,  bossencounter = 2882, mapID = 2608, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Venomous Pyre
DVD.ActiveItems[279500] = { decorID = 27043, model3D = 8117703,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- "Rage of the Shackled" Mural 
DVD.ActiveItems[279118] = { decorID = 26374, model3D = 1992950,  bossencounter = 2894, mapID = 2609, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Lost Explorers Mailbox 		
DVD.ActiveItems[279115] = { decorID = 26205, model3D = 7515872,  bossencounter = 2888, mapID = 2606, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Soulcoiler's Ritual Candle	
DVD.ActiveItems[279122] = { decorID = 25813, model3D = 7277192,  bossencounter = 2887, mapID = 2607, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Venom-Fanged Font 			 
DVD.ActiveItems[279131] = { decorID = 25812, model3D = 7277190,  bossencounter = 2883, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Pillar of the Coiled Isle 	 
DVD.ActiveItems[244343] = { decorID = 1426, model3D = 6870560,  bossencounter = 2871, mapID = 2609, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Vessel of the Howling Ossuary 
DVD.ActiveItems[264716] = { decorID = 16093, model3D = 6153828,  bossencounter = 2874, mapID = 2608, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- Hexed Tomb Brazier  
DVD.ActiveItems[279125] = { decorID = 25131, model3D = 7930280,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true} -- The Venomous Abyss Aureate Trophy
DVD.ActiveItems[279129] = { decorID = 25132, model3D = 7930281,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true } -- The Venomous Abyss Gleaming Trophy
DVD.ActiveItems[279127] = { decorID = 25133, model3D = 7930282,  bossencounter = 2895, mapID = 2610, expansion = "Midnight", zone = "The Venomous Abyss", sources = {"boss", "121"}, unreleased = true } -- The Venomous Abyss Argent Trophy
end

do -- 📦 Dungeons
DVD.ActiveItems[278245] = { decorID = 26208, model3D = 1981805, bossencounter = 2172, mapID = 1004, expansion = "Battle for Azeroth", zone = "Kings' Rest", sources = {"boss", "121"}, unreleased = true} -- Royal Attendant's Coffin
DVD.ActiveItems[278982] = { decorID = 26198, model3D = 1660581, bossencounter = 2145, mapID = 1043, expansion = "Battle for Azeroth", zone = "Temple of Sethraliss", sources = {"boss", "121"}, unreleased = true} -- Hatchery of Hissing Eggs
DVD.ActiveItems[279211] = { decorID = 25293, model3D = 7277191, bossencounter = 2880, mapID = 2590, expansion = "Midnight", zone = "Altar of Fangs", sources = {"boss", "121"}, unreleased = true} -- Pillar of the Fanged Altar
end

do -- 📦 Auspicious Items
DVD.ActiveItems[264721] = { decorID = 16098, model3D = 7509678, source = "vendor", unreleased = true , noxp = true } -- Auspicious Curio Display
DVD.ActiveItems[264722] = { decorID = 16099, model3D = 7509679, source = "vendor", unreleased = true , noxp = true } -- Auspicious Inkmaster's Desk
DVD.ActiveItems[264723] = { decorID = 16100, model3D = 7509682, source = "vendor", unreleased = true , noxp = true } -- Auspicious Tree of Fortune
DVD.ActiveItems[264724] = { decorID = 16101, model3D = 7509685, source = "vendor", unreleased = true , noxp = true } -- Auspicious Golden Carp Lantern
DVD.ActiveItems[264725] = { decorID = 16102, model3D = 7509686, source = "vendor", unreleased = true , noxp = true } -- Auspicious Imperial Lion
DVD.ActiveItems[266071] = { decorID = 17750, model3D = 7509681, source = "vendor", unreleased = true , noxp = true } -- Auspicious Wooden Chair
DVD.ActiveItems[269604] = { decorID = 21060, model3D = 7509680, source = "vendor", unreleased = true , noxp = true } -- Auspicious Picnic Basket
DVD.ActiveItems[269605] = { decorID = 21061, model3D = 7509683, source = "vendor", unreleased = true , noxp = true } -- Auspicious Meal Case
DVD.ActiveItems[272353] = { decorID = 21945, model3D = 7509684, source = "vendor", unreleased = true , noxp = true } -- Auspicious Verdant Basin
DVD.ActiveItems[272354] = { decorID = 21946, model3D = 7804756, source = "vendor", unreleased = true , noxp = true } -- Auspicious Stone Lion
end

do -- 📦 Cuddly Grrgles
DVD.ActiveItems[263239] = { decorID = 15070, model3D = 7493554, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Tan Grrgle
DVD.ActiveItems[263241] = { decorID = 15072, model3D = 7493558, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Seafoam Grrgle
DVD.ActiveItems[263242] = { decorID = 15073, model3D = 7493559, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Saffron Grrgle
DVD.ActiveItems[263243] = { decorID = 15074, model3D = 7493567, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Sage Grrgle
DVD.ActiveItems[263292] = { decorID = 15142, model3D = 7493555, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Lavender Grrgle
DVD.ActiveItems[263293] = { decorID = 15143, model3D = 7493556, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Pink Grrgle
DVD.ActiveItems[263294] = { decorID = 15144, model3D = 7493557, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Gold-Colored Grrgle
DVD.ActiveItems[263295] = { decorID = 15145, model3D = 7493560, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Lime Grrgle
DVD.ActiveItems[263296] = { decorID = 15146, model3D = 7493561, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Orange Grrgle
DVD.ActiveItems[263297] = { decorID = 15147, model3D = 7493565, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Cerulean Grrgle
DVD.ActiveItems[263300] = { decorID = 15150, model3D = 7493569, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Purple Grrgle
DVD.ActiveItems[263302] = { decorID = 15152, model3D = 7493974, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Red Grrgle
DVD.ActiveItems[263303] = { decorID = 15153, model3D = 7493975, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Blue Grrgle
DVD.ActiveItems[264680] = { decorID = 16027, model3D = 7516114, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Seagreen Grrgle
DVD.ActiveItems[264681] = { decorID = 16028, model3D = 7516115, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Brown Grrgle
DVD.ActiveItems[264682] = { decorID = 16029, model3D = 7516116, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Flaxen Grrgle
DVD.ActiveItems[264683] = { decorID = 16030, model3D = 7516130, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Sanguine Grrgle
DVD.ActiveItems[264684] = { decorID = 16031, model3D = 7516131, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Gumball Grrgle
DVD.ActiveItems[264685] = { decorID = 16032, model3D = 7516132, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Violet Grrgle
DVD.ActiveItems[264686] = { decorID = 16033, model3D = 7516133, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Olive Grrgle
DVD.ActiveItems[264687] = { decorID = 16034, model3D = 7516147, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Plum Grrgle
DVD.ActiveItems[264688] = { decorID = 16035, model3D = 7516148, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Tangerine Grrgle
DVD.ActiveItems[264689] = { decorID = 16036, model3D = 7516149, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Sapphire Grrgle
DVD.ActiveItems[264690] = { decorID = 16037, model3D = 7516150, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Clover Grrgle
DVD.ActiveItems[264691] = { decorID = 16038, model3D = 7516151, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Peach Grrgle
DVD.ActiveItems[265387] = { decorID = 16811, model3D = 7525410, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Tomato Grrgle
DVD.ActiveItems[265388] = { decorID = 16812, model3D = 7525411, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Lemon Grrgle
DVD.ActiveItems[265390] = { decorID = 16814, model3D = 7525413, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Mint Grrgle
DVD.ActiveItems[265391] = { decorID = 16815, model3D = 7525414, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Magenta Grrgle
DVD.ActiveItems[265392] = { decorID = 16816, model3D = 7525415, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Sunset Grrgle
DVD.ActiveItems[265393] = { decorID = 16817, model3D = 7525416, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Mauve Grrgle
DVD.ActiveItems[265395] = { decorID = 16819, model3D = 7525418, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Charcoal Grrgle
DVD.ActiveItems[265396] = { decorID = 16820, model3D = 7525419, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Onyx Grrgle
DVD.ActiveItems[265397] = { decorID = 16821, model3D = 7525420, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Bright Grrgle
DVD.ActiveItems[265398] = { decorID = 16822, model3D = 7531400, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Juniper Grrgle
DVD.ActiveItems[265544] = { decorID = 16964, model3D = 7525443, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Basil Grrgle
DVD.ActiveItems[265546] = { decorID = 16966, model3D = 7525445, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Fel Grrgle
DVD.ActiveItems[265547] = { decorID = 16967, model3D = 7525446, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Spectral Grrgle
DVD.ActiveItems[265548] = { decorID = 16968, model3D = 7525447, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Emerald Grrgle
DVD.ActiveItems[265549] = { decorID = 16969, model3D = 7525483, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Metallic Grrgle
DVD.ActiveItems[265550] = { decorID = 16970, model3D = 7525484, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Verdant Grrgle
DVD.ActiveItems[265551] = { decorID = 16971, model3D = 7525485, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Cobalt Grrgle
DVD.ActiveItems[265552] = { decorID = 16972, model3D = 7525486, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Teal Grrgle
DVD.ActiveItems[265553] = { decorID = 16973, model3D = 7525487, soldBy = {0}, source = "vendor", noxp = true, unreleased = true } -- Cuddly Ochre Grrgle
end

do -- 📦 Unknown Sources
DVD.ActiveItems[253481] = { decorID = 1154, model3D = 6036347, source = "121", unreleased = true } -- Masterful Sin'dorei Gravestone
DVD.ActiveItems[245539] = { decorID = 1730, model3D = 6930643, source = "121", unreleased = true } -- Elegant Enchanted Vanity
DVD.ActiveItems[246958] = { decorID = 2587, model3D = 6225703, source = "121", unreleased = true } -- Mastercrafted Fungal Row Planter
DVD.ActiveItems[249923] = { decorID = 5796, model3D = 7216049, source = "121", unreleased = true } -- Sin'dorei Golden Welcome
DVD.ActiveItems[253397] = { decorID = 9290, model3D = 6654743, source = "121", unreleased = true } -- Revered Deepstone Table
DVD.ActiveItems[254561] = { decorID = 10368, model3D = 6654718, source = "121", unreleased = true } -- Ogre Champion's Prized Skull
DVD.ActiveItems[263880] = { decorID = 15290, model3D = 7349991, source = "121", noxp = true, unreleased = true } -- Cherished Pet's Rug
DVD.ActiveItems[280223] = { decorID = 26483, model3D = 1663984, source = "121", unreleased = true } -- Collector's Tortollan Display Rack
DVD.ActiveItems[280523] = { decorID = 26878, model3D = 8117126, source = "vendor", noxp = true, unreleased = true } -- Tuskarr Fire Pit
DVD.ActiveItems[280525] = { decorID = 26879, model3D = 8117127, source = "vendor", noxp = true, unreleased = true} -- Tuskarr Hanging Grill
DVD.ActiveItems[280527] = { decorID = 27046, model3D = 8117128, source = "vendor", noxp = true, unreleased = true } -- Tuskarr Fishing Gear Rack
end





