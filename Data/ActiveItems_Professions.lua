-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems_12_1.lua
-- Patch 12.1 ActiveItems
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}


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


-----------------------------------------Patch 12.1-------------------------------------

do -- 📦 Professions
DVD.ActiveItems[279356] = { decorID = 26488, model3D = 2438984, source = "profession"} -- Opalescent Amani Peridot
DVD.ActiveItems[279343] = { decorID = 26489, model3D = 2438985, source = "profession"} -- Piercing Amani Lapis
DVD.ActiveItems[280762] = { decorID = 26490, model3D = 2438987, source = "profession"} -- Roaring Amani Garnet
DVD.ActiveItems[280752] = { decorID = 26384, model3D = 7498518, source = "profession"} -- "Cursed Gaze of Ula'tek" Mural
DVD.ActiveItems[280757] = { decorID = 26380, model3D = 6212409, source = "profession"} -- Chiseled Amani Tablet
DVD.ActiveItems[279341] = { decorID = 26372, model3D = 1668078, source = "profession"} -- Aetherlume Field Lamp
DVD.ActiveItems[279337] = { decorID = 26383, model3D = 6715093, source = "profession"} -- Coiled Amani Hookshot
DVD.ActiveItems[279339] = { decorID = 26485, model3D = 1852970, source = "profession"} -- Proudmoore Ship-in-a-Bottle
DVD.ActiveItems[279359] = { decorID = 26391, model3D = 7880108, source = "profession"} -- Ersatz Venom Splatter
DVD.ActiveItems[266170] = { decorID = 17800, model3D = 7277141, source = "profession"} -- Flat Snakeskin Canopy
DVD.ActiveItems[279346] = { decorID = 26378, model3D = 6125163, source = "profession"} -- Stretched Snakeskin Rack
DVD.ActiveItems[279348] = { decorID = 26363, model3D = 1097621, source = "profession"} -- Mounted Moby
DVD.ActiveItems[279329] = { decorID = 26382, model3D = 6212431, source = "profession"} -- Amani Forgemaster's Rack
DVD.ActiveItems[275305] = { decorID = 26381, model3D = 6212428, source = "profession"} -- Amani Forgemaster's Decorative Spear
DVD.ActiveItems[263709] = { decorID = 15266, model3D = 6125155, source = "profession"} -- Amani Forgemaster's Workbench
DVD.ActiveItems[279335] = { decorID = 26496, model3D = 7143556, source = "profession"} -- Enchanted Voidwell Fish
DVD.ActiveItems[279362] = { decorID = 5129, model3D = 6163852, source = "profession"} -- Furious Tiki Mask
DVD.ActiveItems[279332] = {decorID = 26379, model3D = 6195676, source = "profession"} -- Keen Hex Mask	
DVD.ActiveItems[279353] = { decorID = 26366, model3D = 1661560, source = "profession"} -- Tortollan Slingsack
DVD.ActiveItems[279350] = { decorID = 26495, model3D = 5975145, source = "profession"} -- Twilight's Blade Bedroll
end



























