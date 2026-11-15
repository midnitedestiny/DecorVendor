-- ============================================================
-- Decor 127 Data
-- Expansions/ActiveItems.lua
-- Combined ActiveItems database
--minInterface = 120100
--  , soldBy = {}
--, sources = {127,}
-- ============================================================
-- Total Compiled Items: 2121


local addonName, DVD = ...
-- Only execute this file if we are on the PTR / expansion build (e.g., Patch 12.x+)
local _, _, _, tocVersion = GetBuildInfo()
if not tocVersion or tocVersion < 120107 then
    return
end
DVD.ActiveItems = DVD.ActiveItems or {}


do -- Vendor Kskeiton 191954
DVD.ActiveItems[284594] = { decorID = 27615, model3D = 4335918, soldBy = {191954}, source = "quest"} -- Windyfin Screaming Totem

end

do -- 🏪 VENDOR NPC: 96483 Jepetto Joybuzz
DVD.ActiveItems[284860] = { decorID = 27823, model3D = 1360973, soldBy = {96483}, source = "vendor", noxp = true} -- Dalaran Grand Chandelier
end

do -- 🏪 VENDOR NPC: 255216 (Balen Starfinder) 255298 (Jehzar Starfall 51)
DVD.ActiveItems[287524] = { decorID = 31514, model3D = 8477262, soldBy = {255216, 255298}, source = "vendor"} -- Elegant Tied-Left Curtain
end

do -- 🏪 VENDOR NPC: 62088 (Lali the Assistant)
DVD.ActiveItems[283475] = { decorID = 28582, model3D = 4288162, soldBy = {62088}, source = "vendor"} -- A Brief History of the Titans
DVD.ActiveItems[283453] = { decorID = 28496, model3D = 1852972, soldBy = {62088}, source = "vendor"} -- Tome of the Sea
DVD.ActiveItems[281626] = { decorID = 28340, model3D = 985168, soldBy = {62088}, source = "vendor"} -- Tale of the First Warchief
DVD.ActiveItems[283463] = { decorID = 28339, model3D = 983860, soldBy = {62088}, source = "vendor"} -- Origin of the Silver Hand

end

do -- 🏪 VENDOR NPC: 115736 (First Arcanist Thalyssra)
DVD.ActiveItems[284638] = { decorID = 28631, model3D = 1309257, soldBy = {115736}, source = "vendor"} -- Levitating Suramar Candlelight Lantern
DVD.ActiveItems[284642] = { decorID = 28453, model3D = 1360712, soldBy = {115736}, source = "vendor"} -- Suramar Banquet Platter
DVD.ActiveItems[284640] = { decorID = 27607, model3D = 1321539, soldBy = {115736}, source = "vendor"} -- Suramar Arclight Planter

end

do -- 🏪 VENDOR NPC: 188623 Samia Inkling and 188625 Lorena Belle
DVD.ActiveItems[284614] = { decorID = 28585, model3D = 4620932, soldBy = {188623, 188625}, source = "vendor"} -- Onyx Experimenter's Mortar and Pestle

end

do -- 🏪 VENDOR NPC: 257332 (Devin Slatesmith) 257257 (Merki)
DVD.ActiveItems[287521] = { decorID = 29278, model3D = 8211524, soldBy = {257332, 257257}, source = "vendor"} -- Counterspiral Wooden Stairs

end

do -- 🏪 VENDOR NPC: 252313  Caspian
DVD.ActiveItems[284654] = { decorID = 27825, model3D = 1953311, soldBy = {252313}, source = "vendor"} -- Stormsong Kraken Sconce

end

do-- 🏪 VENDOR NPC 188265 Rae'ana
DVD.ActiveItems[284620] = { decorID = 28583, model3D = 4391087, soldBy = {188265}, source = "vendor"} -- Explorer's League Inspection Lens
DVD.ActiveItems[284624] = { decorID = 28581, model3D = 4198215, soldBy = {188265}, source = "vendor"} -- Explorer's League Canteen
DVD.ActiveItems[284618] = { decorID = 28580, model3D = 4198206, soldBy = {188265}, source = "vendor"} -- Explorer's League Globe
DVD.ActiveItems[284616] = { decorID = 27685, model3D = 4252800, soldBy = {188265}, source = "vendor"} -- Explorer's League Supply Crates
DVD.ActiveItems[284622] = { decorID = 28584, model3D = 4392564, soldBy = {188265}, source = "vendor"} -- Explorer's League Coiled Rope
end

do -- 🏪 VENDOR NPC: 231405 Boatswain Hardee
DVD.ActiveItems[284630] = { decorID = 28115, model3D = 5933745, soldBy = {231405}, source = "vendor"} -- Goblins & Grummles Dice Set
DVD.ActiveItems[284632] = { decorID = 28114, model3D = 5933744, soldBy = {231405}, source = "vendor"} -- Goblins & Grummles Four-Sided Die
end

do-- 🏪 VENDOR NPC 231408 Lab Assistant Laszly
DVD.ActiveItems[284626] = { decorID = 28112, model3D = 5933740, soldBy = {231408}, source = "vendor"} -- Gathering Goblins Game Spread
DVD.ActiveItems[284628] = { decorID = 28113, model3D = 5933741, soldBy = {231408}, source = "vendor"} -- Gathering Goblins Game Deck
end

do -- Vendor Ayada the White 77354
DVD.ActiveItems[284602] = { decorID = 28449, model3D = 943020, soldBy = {77354}, source = "vendor"} -- Ayada's Candillusions
DVD.ActiveItems[285174] = { decorID = 28630, model3D = 942921, soldBy = {77354}, source = "vendor"} -- Ayada's Enchanted Worktable

end

do -- Vendor Torm Swindel 255943 and Zin'Jin 255949
DVD.ActiveItems[288021] = { decorID = 30932, model3D = 8270249, soldBy = {255943, 255949}, source = "vendor"} -- Admiralty Theater Curtains
DVD.ActiveItems[288023] = { decorID = 31439, model3D = 8270248, soldBy = {255943, 255949}, source = "vendor"} -- Glorious Theater Curtains
DVD.ActiveItems[288025] = { decorID = 31435, model3D = 8270241, soldBy = {255943, 255949}, source = "vendor"} -- Regal Theater Curtains
DVD.ActiveItems[288027] = { decorID = 30929, model3D = 8270240, soldBy = {255943, 255949}, source = "vendor"} -- Improvised Theater Curtains
DVD.ActiveItems[288029] = { decorID = 30930, model3D = 8270243, soldBy = {255943, 255949}, source = "vendor"} -- Light Theater Curtains
DVD.ActiveItems[288031] = { decorID = 31436, model3D = 8270242, soldBy = {255943, 255949}, source = "vendor"} -- Student's Theater Curtains
DVD.ActiveItems[288033] = { decorID = 31511, model3D = 8270245, soldBy = {255943, 255949}, source = "vendor"} -- Traditional Theater Curtains
DVD.ActiveItems[288035] = { decorID = 30931, model3D = 8270244, soldBy = {255943, 255949}, source = "vendor"} -- Striped Theater Curtains
DVD.ActiveItems[288037] = { decorID = 31438, model3D = 8270247, soldBy = {255943, 255949}, source = "vendor"} -- Ruined Theater Curtains
DVD.ActiveItems[288039] = { decorID = 31437, model3D = 8270246, soldBy = {255943, 255949}, source = "vendor"} -- Tattered Theater Curtains
end

do -- 🏪 VENDOR NPC: 50382 Brundall Chiselgut and 50375 Kuldar Steelstooth
DVD.ActiveItems[285091] = { decorID = 28628, model3D = 305633, soldBy = {50382, 50375 }, source = "quest"} -- Twilight Citadel Lamppost

end

do-- 🏪 VENDOR NPC: Skysea Wanderer 98059

DVD.ActiveItems[284652] = { decorID = 25361, model3D = 1352718, soldBy = {98059 }, source = "quest"} -- Dreamgrove Statue of Regrowth
DVD.ActiveItems[284650] = { decorID = 25402, model3D = 1109130, soldBy = {98059}, source = "quest"} -- Dreamgrove Statue of Balance
DVD.ActiveItems[284646] = { decorID = 28451, model3D = 1257796, soldBy = {98059 }, source = "quest"} -- Dreamgrove Statue of Tenacity
DVD.ActiveItems[284648] = { decorID = 25360, model3D = 1257783, soldBy = {98059}, source = "quest"} -- Dreamgrove Statue of Ferocity

end

do -- 🏪 VENDOR NPC: 59908  Jaluu the Generous 
DVD.ActiveItems[285166] = { decorID = 27682, model3D = 534555, requirement = { type = "reputation", faction = "The Golden Lotus", rank = 4 }, soldBy = {59908}, source = "vendor"} -- Zen Fountain of Pandaria

end

do -- 🏪 VENDOR NPC: 76198 Mokarg
DVD.ActiveItems[285067] = { decorID = 28342, model3D = 8353283, soldBy = {76198}, source = "vendor"} -- Shadowmoon Clan Felfire Rune
DVD.ActiveItems[285069] = { decorID = 27218, model3D = 8353282, soldBy = {76198}, source = "vendor"} -- Shadowmoon Clan Dark Star Rune
end

do -- 🏪 VENDOR NPC: 231406 (Rocco Razzboom)
DVD.ActiveItems[284636] = { decorID = 27616, model3D = 5689859, soldBy = {231406}, source = "vendor"} -- Illuminated Undermine Shield Sign

end

do -- 🏪 VENDOR NPC: 231407 (Shredz the Scrapper)
DVD.ActiveItems[284634] = { decorID = 28586, model3D = 6047547, soldBy = {231407}, source = "vendor"} -- Empty Cartel Supply Bin

end

do-- 🏪 VENDOR NPC 276134 Ayan'wu
DVD.ActiveItems[286381] = { decorID = 28505, model3D = 1958554, soldBy = {276134}, source = "vendor"} -- Grasping Zuldazar Rootvine
DVD.ActiveItems[286375] = { decorID = 28504, model3D = 1958440, soldBy = {276134}, source = "vendor"} -- Zuldazar Ambush Vine
DVD.ActiveItems[286369] = { decorID = 28503, model3D = 1953318, soldBy = {276134}, source = "vendor"} -- Zuldazar Trapper Plant
DVD.ActiveItems[286379] = { decorID = 28502, model3D = 1940536, soldBy = {276134}, source = "vendor"} -- Spiraling Zuldazar Rootvine
DVD.ActiveItems[286367] = { decorID = 28501, model3D = 1936556, soldBy = {276134}, source = "vendor"} -- Zuldazar Pitcher Plant
DVD.ActiveItems[286394] = { decorID = 28500, model3D = 1882336, soldBy = {276134}, source = "vendor"} -- Zuldazar Thorncrown Tree
DVD.ActiveItems[286373] = { decorID = 28462, model3D = 1664093, soldBy = {276134}, source = "vendor"} -- Zuldazar Bursting Blossom
DVD.ActiveItems[286377] = { decorID = 28461, model3D = 1658262, soldBy = {276134}, source = "vendor"} -- Zuldazar Banner Ivy
DVD.ActiveItems[286388] = { decorID = 28460, model3D = 1634846, soldBy = {276134}, source = "vendor"} -- Flowering Zuldazar Palm
DVD.ActiveItems[286396] = { decorID = 28455, model3D = 1538750, soldBy = {276134}, source = "vendor"} -- Zuldazar Groundbloom Assortment
DVD.ActiveItems[286392] = { decorID = 27611, model3D = 1675101, soldBy = {276134}, source = "vendor"} -- Zuldazar Crestbloom
DVD.ActiveItems[269528] = { decorID = 20880, model3D = 1659531, soldBy = {276134}, source = "vendor"} -- Growing Zuldazar Palm
DVD.ActiveItems[269527] = { decorID = 20879, model3D = 1625446, soldBy = {276134}, source = "vendor"} -- Mature Zuldazar Palm
DVD.ActiveItems[269526] = { decorID = 20878, model3D = 1625347, soldBy = {276134}, source = "vendor"} -- Zuldazar Palm Sprout
DVD.ActiveItems[286390] = { decorID = 28459, model3D = 1632975, soldBy = {276134}, source = "vendor"} -- Palm of Pa'ku
DVD.ActiveItems[286383] = { decorID = 28507, model3D = 1984416, soldBy = {276134}, source = "vendor"} -- Zanchuli Wall Moss
DVD.ActiveItems[286371] = { decorID = 28506, model3D = 1979964, soldBy = {276134}, source = "vendor"} -- Loa-Blessed Fan Palm

end

-------------------------------------------------
-- Timewalking VENDORS
-------------------------------------------------
do -- Vendor Auzin 98690
DVD.ActiveItems[287669] = { decorID = 31689, model3D = 251635, soldBy = {98690}, source = "vendor"} -- Argent Crusade Field Tent
DVD.ActiveItems[287656] = { decorID = 31692, model3D = 340025, soldBy = {98690}, source = "vendor"} -- Argent Crusade Command Tent
DVD.ActiveItems[287681] = { decorID = 31718, model3D = 8507488, soldBy = {98690}, source = "vendor"} -- Replica Stone Elder
DVD.ActiveItems[287667] = { decorID = 31686, model3D = 195314, soldBy = {98690}, source = "vendor"} -- Tuskarr Carved Anvil

end

do -- 🏪 VENDOR NPC:223884 Bobadormu
DVD.ActiveItems[287665] = { decorID = 31687, model3D = 197831, soldBy = {223884}, source = "vendor"} -- Scarlet Cathedral Altar
DVD.ActiveItems[287662] = { decorID = 31688, model3D = 197962, soldBy = {223884}, source = "vendor"} -- Scarlet Crusade Banner
DVD.ActiveItems[287649] = { decorID = 31690, model3D = 200947, soldBy = {223884}, source = "vendor"} -- Scarlet Crusade Cannon
DVD.ActiveItems[287652] = { decorID = 31691, model3D = 198639, soldBy = {223884}, source = "vendor"} -- Scarlet Crusader's Shield

end

do -- 🏪 VENDOR NPC:239840 Churbro
DVD.ActiveItems[287720] = { decorID = 31708, model3D = 8507456, soldBy = {239840}, source = "vendor"} -- Azsh'ari Treasure Chest
DVD.ActiveItems[287739] = { decorID = 31709, model3D = 8507457, soldBy = {239840}, source = "vendor"} -- Coralvine Nazjatari Lamppost
DVD.ActiveItems[287736] = { decorID = 31720, model3D = 8510527, soldBy = {239840}, source = "vendor"} -- Eternal Palace Library Pillar
DVD.ActiveItems[287734] = { decorID = 31700, model3D = 2531319, soldBy = {239840}, source = "vendor"} -- Eternal Palace Serving Platter

end

do-- 🏪 VENDOR NPC 255019 Xydan
DVD.ActiveItems[287724] = { decorID = 31706, model3D = 4094540, soldBy = {255019}, source = "vendor"} -- Decorative Bronze Dragon Egg
DVD.ActiveItems[287726] = { decorID = 31705, model3D = 4094539, soldBy = {255019}, source = "vendor"} -- Decorative Black Dragon Egg
DVD.ActiveItems[287728] = { decorID = 31704, model3D = 4094538, soldBy = {255019}, source = "vendor"} -- Decorative Green Dragon Egg
DVD.ActiveItems[287730] = { decorID = 31703, model3D = 4094537, soldBy = {255019}, source = "vendor"} -- Decorative Red Dragon Egg
DVD.ActiveItems[287732] = { decorID = 31702, model3D = 4094536, soldBy = {255019}, source = "vendor"} -- Decorative Blue Dragon Egg
DVD.ActiveItems[287722] = { decorID = 31707, model3D = 4094541, soldBy = {255019}, source = "vendor"} -- Valdrakken Dragon Egg Cradle
DVD.ActiveItems[287751] = { decorID = 31714, model3D = 8507462, soldBy = {255019}, source = "vendor"} -- Gardens of Unity Glass Arch
DVD.ActiveItems[287749] = { decorID = 31713, model3D = 8507461, soldBy = {255019}, source = "vendor"} -- Valdrakken Walkway Arch

end

do-- 🏪 VENDOR NPC 98685 Cupri
DVD.ActiveItems[287674] = { decorID = 31715, model3D = 8507463, soldBy = {98685}, source = "vendor"} -- Romulo and Julianne Backdrop
DVD.ActiveItems[287676] = { decorID = 31716, model3D = 8507464, soldBy = {98685}, source = "vendor"} -- Red Riding Hood Backdrop
DVD.ActiveItems[287679] = { decorID = 31717, model3D = 8507486, soldBy = {98685}, source = "vendor"} -- Dorothee's Journey Backdrop
DVD.ActiveItems[287672] = { decorID = 31685, model3D = 189994, soldBy = {98685}, source = "vendor"} -- Karazhan Library Stacks

end

do-- 🏪 VENDOR NPC 118828 Mistweaver Xia
DVD.ActiveItems[287705] = { decorID = 31697, model3D = 590820, soldBy = {118828}, source = "vendor"} -- Pearlfin Fisher's Font
DVD.ActiveItems[287711] = { decorID = 31719, model3D = 8507490, soldBy = {118828}, source = "vendor"} -- Pearlfin Bubble Lampvine
DVD.ActiveItems[287709] = { decorID = 31699, model3D = 631020, soldBy = {118828}, source = "vendor"} -- Jinyu Mail Post
DVD.ActiveItems[287707] = { decorID = 31698, model3D = 593929, soldBy = {118828}, source = "vendor"} -- Jinyu Lotus Fountain

end

do-- 🏪 VENDOR NPC 101759 Kiatke
DVD.ActiveItems[287688] = { decorID = 31696, model3D = 418703, soldBy = {101759}, source = "vendor"} -- Ammun'ari Ram Statue
DVD.ActiveItems[287690] = { decorID = 31695, model3D = 410783, soldBy = {101759}, source = "vendor"} -- Rajh'ari Falcon Statue
DVD.ActiveItems[287699] = { decorID = 31694, model3D = 406649, soldBy = {101759}, source = "vendor"} -- Anub'ari Jackal Statue
DVD.ActiveItems[287701] = { decorID = 31693, model3D = 394596, soldBy = {101759}, source = "vendor"} -- Ramkahen Pyramid Fountain

end

do-- 🏪 VENDOR NPC: 252687 Collector Ta'steld
DVD.ActiveItems[287747] = { decorID = 31712, model3D = 8507460, soldBy = {252687}, source = "vendor"} -- Anima-Infused Venthyr Lampost
DVD.ActiveItems[287745] = { decorID = 31711, model3D = 8507459, soldBy = {252687}, source = "vendor"} -- Runed Night Fae Font
DVD.ActiveItems[287743] = { decorID = 31710, model3D = 8507458, soldBy = {252687}, source = "vendor"} -- Maldraxxian Necrolord Arch
DVD.ActiveItems[287741] = { decorID = 31701, model3D = 3022967, soldBy = {252687}, source = "vendor"} -- Kyrian Aspirant's Training Dummy

end
-------------------------------------------------
-- Housing VENDORS
-------------------------------------------------
do -- 🏪 VENDOR NPC: 271604 Holly Twinklebright alliance and 271366 Jolli Maxiboom horde
DVD.ActiveItems[288014] = { decorID = 31620, model3D = 4913591, soldBy = {271604, 271366}, source = "winterveil"} -- Gilded Red Wrapped Gift
DVD.ActiveItems[288003] = { decorID = 31581, model3D = 4913593, soldBy = {271604, 271366}, source = "winterveil"} -- Large White Winter Veil Gift
DVD.ActiveItems[287995] = { decorID = 31353, model3D = 8473066, soldBy = {271604, 271366}, source = "winterveil"} -- Red Gift Bow
DVD.ActiveItems[288019] = { decorID = 31622, model3D = 4913594, soldBy = {271604, 271366}, source = "winterveil"} -- Small Green Wrapped Gift
DVD.ActiveItems[265636] = { decorID = 17298, model3D = 7538521, soldBy = {271604, 271366}, source = "winterveil"} -- Sparsely Decorated Winter Veil Pine Tree
DVD.ActiveItems[288005] = { decorID = 31582, model3D = 4913604, soldBy = {271604, 271366}, source = "winterveil"} -- Stitched Winter Veil Stocking
DVD.ActiveItems[287997] = { decorID = 31434, model3D = 4913598, soldBy = {271604, 271366}, source = "winterveil"} -- Strand of Winter Veil Lights
DVD.ActiveItems[288499] = { decorID = 31584, model3D = 5282325, soldBy = {271604, 271366}, source = "winterveil" } -- Festive Red Candle

end

do -- 🏪 VENDOR NPC: 277593 Burlee Jinglepocket (alliance) and 277592 Roz Copperpinch (horde)
DVD.ActiveItems[288042] = { decorID = 31623, model3D = 4913603, soldBy = {277593, 277592}, source = "winterveil"} -- Cany Cane Rope Pole
DVD.ActiveItems[288044] = { decorID = 31627, model3D = 5012240, soldBy = {277593, 277592}, source = "winterveil"} -- Cany Cane Rope Line
DVD.ActiveItems[288059] = { decorID = 31826, model3D = 8519364, soldBy = {277593, 277592}, source = "winterveil"} -- Purple and Gold Bow
DVD.ActiveItems[288057] = { decorID = 31825, model3D = 8519363, soldBy = {277593, 277592}, source = "winterveil"} -- Black and Gold Present
DVD.ActiveItems[288055] = { decorID = 31824, model3D = 8519362, soldBy = {277593, 277592}, source = "winterveil"} -- Black and Gold Present with Purple Bow
DVD.ActiveItems[288050] = { decorID = 31626, model3D = 5012063, soldBy = {277593, 277592}, source = "winterveil"} -- Winter Veil Wreath
DVD.ActiveItems[288048] = { decorID = 31625, model3D = 4919060, soldBy = {277593, 277592}, source = "winterveil"} -- Ornate Winter Sled
DVD.ActiveItems[288046] = { decorID = 31624, model3D = 4913605, soldBy = {277593, 277592}, source = "winterveil"} -- Green and White Striped Stocking
DVD.ActiveItems[288017] = { decorID = 31621, model3D = 4913592, soldBy = {277593, 277592}, source = "winterveil"} -- Red Winter Veil Present with White Bow
DVD.ActiveItems[288010] = { decorID = 31618, model3D = 4913589, soldBy = {277593, 277592}, source = "winterveil"} -- Green Winter Veil Present with Red Bow
DVD.ActiveItems[288012] = { decorID = 31619, model3D = 4913590, soldBy = {277593, 277592}, source = "winterveil"} -- Red Winter Veil Present with Green Bow
DVD.ActiveItems[288007] = { decorID = 31583, model3D = 5012235, soldBy = {277593, 277592}, source = "winterveil"} -- Small Candy Cane
DVD.ActiveItems[288063] = { decorID = 31580, model3D = 4904629, soldBy = {277593, 277592}, source = "winterveil"} -- Winter Veil Mistletoe
DVD.ActiveItems[288000] = { decorID = 31570, model3D = 4913599, soldBy = {277593, 277592}, source = "winterveil"} -- Long Strand of Winter Veil Lights
DVD.ActiveItems[265637] = { decorID = 17299, model3D = 7538522, soldBy = {277593, 277592}, source = "winterveil"} -- Star-Touched Winter Veil Pine Tree
DVD.ActiveItems[265635] = { decorID = 17297, model3D = 7538520, soldBy = {277593, 277592}, source = "winterveil"} -- Pristine Winter Veil Pine Tree

end

do -- 🏪 VENDOR NPC:  277026 T.J. Jinglepocket and 277030 Max Copperpinch

end 

do -- 🏪 VENDOR NPC: 252910 (Garnett)
DVD.ActiveItems[268727] = { decorID = 20171, model3D = 7660918, soldBy = {252910}, source = "achievement"} -- Boulder Springs Chaise
end

do--drops
DVD.ActiveItems[285096] = { decorID = 28316, model3D = 8353887, expansion = "Wrath of the Lich King", zone = "The Nexus", source = "boss", category = "dungeon"} -- Azure Mage Hunter's Rune Circle
DVD.ActiveItems[284605] = { decorID = 27822, model3D = 1310776, expansion = "Legion", zone = "Vault of  Wardens", source = "boss", category = "dungeon"} -- Wardens' Pool of Judgment
end

do--Taloebound
DVD.ActiveItems[288740] = { decorID = 32490, model3D = 7832545, soldBy = { 248599 }, source = "talebound"} -- Storyteller's Looking Glass
DVD.ActiveItems[288733] = { decorID = 32489, model3D = 7832544, soldBy = { 248599 }, source = "talebound"} -- Storyteller's Cursed Looking Glass
DVD.ActiveItems[288747] = { decorID = 32492, model3D = 7832547, soldBy = { 248599 }, source = "talebound"} -- Sanguine Looking Glass
DVD.ActiveItems[288749] = { decorID = 32493, model3D = 7832548, soldBy = { 248599 }, source = "talebound"} -- Hexed Looking Glass
DVD.ActiveItems[288745] = { decorID = 32491, model3D = 7832546, soldBy = { 248599 }, source = "talebound"} -- Eldritch Looking Glass
DVD.ActiveItems[288751] = { decorID = 32494, model3D = 7832549, soldBy = { 248599 }, source = "talebound"} -- Fae Looking Glass
DVD.ActiveItems[287981] = { decorID = 32033, model3D = 1892554, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Waxlight
DVD.ActiveItems[287900] = { decorID = 31945, model3D = 8517621, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Hex Scar
DVD.ActiveItems[287902] = { decorID = 31944, model3D = 3160237, soldBy = { 248599 }, source = "talebound"} -- Drust-Carved Rune Marker
DVD.ActiveItems[287904] = { decorID = 31943, model3D = 3160234, soldBy = { 248599 }, source = "talebound"} -- Drust-Carved Rune Pillar
DVD.ActiveItems[287906] = { decorID = 31942, model3D = 2167540, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Wicker Effigy
DVD.ActiveItems[287908] = { decorID = 31941, model3D = 1950200, soldBy = { 248599 }, source = "talebound"} -- Tidesage's Left Copper Mascaron
DVD.ActiveItems[287910] = { decorID = 31940, model3D = 1950199, soldBy = { 248599 }, source = "talebound"} -- Tidesage's Right Copper Mascaron
DVD.ActiveItems[287862] = { decorID = 31939, model3D = 1931967, soldBy = { 248599 }, source = "talebound"} -- Sealight Sconce
DVD.ActiveItems[287913] = { decorID = 31938, model3D = 1780694, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Hex Markings
DVD.ActiveItems[287915] = { decorID = 31937, model3D = 1779187, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Hex Etchings
DVD.ActiveItems[287917] = { decorID = 31936, model3D = 1681402, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Runestone Ring
DVD.ActiveItems[287983] = { decorID = 31739, model3D = 1675537, soldBy = { 248599 }, source = "talebound"} -- Heartsbane Hex Catcher
DVD.ActiveItems[281596] = { decorID = 26872, model3D = 1931970, soldBy = { 248599 }, source = "talebound"} -- Ominous Ritual Wall Scroll
DVD.ActiveItems[272134] = { decorID = 21878, model3D = 3855976, soldBy = { 248599 }, source = "talebound"} -- Watchman's Iron Torch
DVD.ActiveItems[263884] = { decorID = 15294, model3D = 7135976, soldBy = { 248599 }, source = "talebound"} -- Quillgrave Talebound Shadowtome
DVD.ActiveItems[263885] = { decorID = 15295, model3D = 7135980, soldBy = { 248599 }, source = "talebound"} -- Quillgrave Arcanist's Alembic
DVD.ActiveItems[263886] = { decorID = 15296, model3D = 7135981, soldBy = { 248599 }, source = "talebound"} -- Quillgrave Scribe's Gemstation
DVD.ActiveItems[269638] = { decorID = 21103, model3D = 7135979, soldBy = { 248599 }, source = "talebound"} -- Quillgrave Outfitter's Loom
DVD.ActiveItems[263490] = { decorID = 15254, model3D = 7135978, soldBy = { 248599 }, source = "talebound"} -- Quillgrave Craftsman's Workmill
DVD.ActiveItems[269576] = { decorID = 20937, model3D = 7703540, soldBy = { 248599 }, source = "talebound"} -- Quillgrave Storyteller's Lectern



end

DVD.ActiveItems[288769] = { decorID = 31617, model3D = 3209343, source = "winterveil"} -- Greatfeather Pepe
-------------------------------------------------
-- Havent added sources yet
-------------------------------------------------
do--Professions
DVD.ActiveItems[284644] = { decorID = 27219, model3D = 1400993, sources =  "127", noxp = true, profession = "Legion Inscription"} -- Arcanist's Research Board

end

do--quests
DVD.ActiveItems[281399] = { decorID = 25272, model3D = 4323823, source = "quest"} -- Ancient Uldaman Tome
DVD.ActiveItems[281401] = { decorID = 26200, model3D = 4609992, source = "quest"} -- Broken Uldaman Statue

end

do--shop
DVD.ActiveItems[287122] = { decorID = 30792, model3D = 8298768, source = "shop"} -- Winter's Frost Large Icicle
DVD.ActiveItems[287112] = { decorID = 31105, model3D = 8298774, source = "shop"} -- Cozy Cabin String Lights
DVD.ActiveItems[287116] = { decorID = 30896, model3D = 8298764, source = "shop"} -- Winter's Frost Hot Tub
DVD.ActiveItems[287120] = { decorID = 30791, model3D = 8298767, source = "shop"} -- Winter's Frost Small Icicle
DVD.ActiveItems[287426] = { decorID = 31651, model3D = 8503354, source = "shop"} -- Cozy Cabin White String Lights
DVD.ActiveItems[287428] = { decorID = 31652, model3D = 8503357, source = "shop"} -- Cozy Cabin Blue String Lights
DVD.ActiveItems[287118] = { decorID = 31441, model3D = 8298765, source = "shop"} -- Winter's Frost Throne
DVD.ActiveItems[287124] = { decorID = 30793, model3D = 8298769, source = "shop"} -- Winter's Frost Icicle Chunk
DVD.ActiveItems[287126] = { decorID = 31442, model3D = 8298766, source = "shop"} -- Winter's Frost Snowman
DVD.ActiveItems[287128] = { decorID = 31512, model3D = 8298770, source = "shop"} -- Winter's Frost Snowy Tree
DVD.ActiveItems[287130] = { decorID = 31577, model3D = 8493704, source = "shop"} -- Cozy Cabin Day Window
DVD.ActiveItems[287132] = { decorID = 31578, model3D = 8493705, source = "shop"} -- Cozy Cabin Night Window
DVD.ActiveItems[287095] = { decorID = 31573, model3D = 8298776, source = "shop"} -- Cozy Cabin Bed
DVD.ActiveItems[287100] = { decorID = 31106, model3D = 8298777, source = "shop"} -- Cozy Cabin Stein
DVD.ActiveItems[287104] = { decorID = 31443, model3D = 8298771, source = "shop"} -- Cozy Cabin Fireplace
DVD.ActiveItems[287106] = { decorID = 31444, model3D = 8298772, source = "shop"} -- Cozy Cabin Pet Bed
DVD.ActiveItems[287108] = { decorID = 31572, model3D = 8298773, source = "shop"} -- Cozy Cabin Sofa
DVD.ActiveItems[287110] = { decorID = 30794, model3D = 8298775, source = "shop"} -- Cozy Cabin Stocking
DVD.ActiveItems[287114] = { decorID = 31571, model3D = 8298763, source = "shop"} -- Cozy Cabin Curtain


end

do -- 🏪 VENDOR NPC: Selemental
DVD.ActiveItems[284863] = { decorID = 28452, model3D = 1331241, soldBy = {}, source = "vendor"} -- Premium Parcel, Postage Paid

end


