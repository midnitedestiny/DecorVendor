-- ============================================================
-- Decor 125 Data
-- Expansions/ActiveItems.lua
-- Combined ActiveItems database
--minInterface = 120100
--  , soldBy = {}
-- ============================================================
-- Total Compiled Items: 2121


local addonName, DVD = ...
-- Only execute this file if we are on the PTR / expansion build (e.g., Patch 12.x+)
local _, _, _, tocVersion = GetBuildInfo()
if not tocVersion or tocVersion < 120105 then
    return
end
DVD.ActiveItems = DVD.ActiveItems or {}
-------------------------------------------------
-- Reputation VENDORS
-------------------------------------------------
do--	🏪 VENDOR NPC: 85932 Vindicator Nuurem Council of Exarchs QuarterMaster
DVD.ActiveItems[285179] = { decorID = 30255, model3D = 8344060, soldBy = {85932}, source = "125" } -- Ritual Embaari Arch
end

do--	🏪 VENDOR NPC: 156822 Mistress Mihaela Court of Harvesters Quartermaster
DVD.ActiveItems[284562] = { decorID = 28343, model3D = 3257686, soldBy = {156822}, source = "125" } -- Nathrian Window
DVD.ActiveItems[284570] = { decorID = 28341, model3D = 3257685, soldBy = {156822}, source = "125" } -- Small Darkhaven Window
DVD.ActiveItems[284558] = { decorID = 28531, model3D = 2981871, soldBy = {156822}, source = "125" } -- Sinner's Gibbet
DVD.ActiveItems[284560] = { decorID = 28532, model3D = 2981872, soldBy = {156822}, source = "125" } -- Revendreth Sinner's Prison
end

do--	🏪 VENDOR NPC: 158556 Aithlyn Wild Hunt Quartermaster 
DVD.ActiveItems[283265] = { decorID = 28547, model3D = 3038709, soldBy = {158556}, source = "125" } -- Fae Lantern Blossom
DVD.ActiveItems[283376] = { decorID = 28538, model3D = 3025782, soldBy = {158556}, source = "125" } -- Leaning Wildgrove Tree
DVD.ActiveItems[283345] = { decorID = 28539, model3D = 3033637, soldBy = {158556}, source = "125" } -- Hanging Wildseed
DVD.ActiveItems[283271] = { decorID = 28634, model3D = 3095233, soldBy = {158556}, source = "125" } -- Blooming Celestial Dreamleaf
DVD.ActiveItems[283275] = { decorID = 28565, model3D = 3113681, soldBy = {158556}, source = "125" } -- Small Shimmering Moonvine
DVD.ActiveItems[283283] = { decorID = 28570, model3D = 3204231, soldBy = {158556}, source = "125" } -- Fae Moonbough Cocoon
DVD.ActiveItems[283370] = { decorID = 28543, model3D = 3036150, soldBy = {158556}, source = "125" } -- Fae Moonbough Gate

end

do--	🏪 VENDOR NPC: 160470 Adjutant Nikos Ascended quartermaster
DVD.ActiveItems[284538] = { decorID = 28579, model3D = 3862269, soldBy = {160470}, source = "125" } -- Anima-Powered Kyrian Oven
DVD.ActiveItems[284550] = { decorID = 28578, model3D = 3755695, soldBy = {160470}, source = "125" } -- Ornate Kyrian Glass Platform
end

do--	🏪 VENDOR NPC: 173003 Nalcorn Talsen Undying Army quartermaster
DVD.ActiveItems[284498] = { decorID = 28559, model3D = 3058263, soldBy = {173003}, source = "125" } -- Maldraxxi Anima Crystal
DVD.ActiveItems[284506] = { decorID = 28546, model3D = 3036652, soldBy = {173003}, source = "125" } -- Suspended Lich Scroll
end

do--	🏪 VENDOR NPC: 266188 Estella Archtender Aquir Research Enclave Faction , requirement = { type = "renown", faction = "The Singularity", level = 5 }
DVD.ActiveItems[275873] = { decorID = 25305, model3D = 3026077, soldBy = {266188}, source = "125" } -- Dormant Brood Egg
DVD.ActiveItems[275869] = { decorID = 25303, model3D = 3022829, soldBy = {266188}, source = "125" } -- Nourished Brood Eggs
DVD.ActiveItems[275879] = { decorID = 25306, model3D = 3028253, soldBy = {266188}, source = "125" } -- Dormant Brood Egg Cluster
DVD.ActiveItems[275867] = { decorID = 25302, model3D = 3022828, soldBy = {266188}, source = "125" } -- Nourished Brood Egg Cluster
DVD.ActiveItems[275871] = { decorID = 25304, model3D = 3026076, soldBy = {266188}, source = "125" } -- Dormant Clutch of Brood Eggs
DVD.ActiveItems[275865] = { decorID = 25301, model3D = 3022827, soldBy = {266188}, source = "125" } -- Nourished Clutch of Brood Eggs

end

do -- 	🏪 VENDOR NPC: 49877 (Captain Lancy Revshon) and 955 Sergeant De Vries 
DVD.ActiveItems[284223] = { decorID = 27217, model3D = 189908, soldBy = {49877, 955}, source = "125" } -- "Pride of Stormwind" Statue

end

do--	🏪 VENDOR NPC: 127120 Vindicator Jaelaana Army of Light Emissary
DVD.ActiveItems[282156] = { decorID = 28445, model3D = 1687905, soldBy = {127120}, source = "125" } -- Reinforced Empyrium Tile
DVD.ActiveItems[282130] = { decorID = 28432, model3D = 1608754, soldBy = {127120}, source = "125" } -- Standing Argunite Lamp
DVD.ActiveItems[282128] = { decorID = 28431, model3D = 1608447, soldBy = {127120}, source = "125" } -- Argunite Sconce
DVD.ActiveItems[282142] = { decorID = 28438, model3D = 1616780, soldBy = {127120}, source = "125" } -- Gleaming Lightforged Grindstone
DVD.ActiveItems[282134] = { decorID = 28434, model3D = 1616776, soldBy = {127120}, source = "125" } -- Argunite Crystal Storage
DVD.ActiveItems[282146] = { decorID = 28440, model3D = 1684201, soldBy = {127120}, source = "125" } -- Lightforged Control Console
DVD.ActiveItems[282122] = { decorID = 28428, model3D = 1608202, soldBy = {127120}, source = "125" } -- Gilded Stonework Altar
DVD.ActiveItems[282111] = { decorID = 27824, model3D = 1608204, soldBy = {127120}, source = "125" } -- Hanging Lightforged Standard
end

do--	🏪 VENDOR NPC: 135804 Hoarder Jena  Voldunai Emissary
DVD.ActiveItems[283365] = { decorID = 27255, model3D = 893038, soldBy = {135804}, source = "125" } -- Caravan Smith's Anvil
DVD.ActiveItems[283289] = { decorID = 28471, model3D = 1674747, soldBy = {135804}, source = "125" } -- Nomad's Steel Lantern
DVD.ActiveItems[283323] = { decorID = 28466, model3D = 1674742, soldBy = {135804}, source = "125" } -- Nomad's Wooden Lamppost
DVD.ActiveItems[283317] = { decorID = 28481, model3D = 1675015, soldBy = {135804}, source = "125" } -- Reinforced Nomad's Makeshift Barricade
DVD.ActiveItems[283305] = { decorID = 28465, model3D = 1674725, soldBy = {135804}, source = "125" } -- Fortified Nomad's Makeshift Barricade
DVD.ActiveItems[283279] = { decorID = 28464, model3D = 1674724, soldBy = {135804}, source = "125" } -- Damaged Nomad's Makeshift Barricade
DVD.ActiveItems[283297] = { decorID = 28508, model3D = 2012204, soldBy = {135804}, source = "125" } -- Vulpera Postbox
DVD.ActiveItems[283319] = { decorID = 28498, model3D = 1859160, soldBy = {135804}, source = "125" } -- Vacant Buzzard Roost
DVD.ActiveItems[283277] = { decorID = 28463, model3D = 1674720, soldBy = {135804}, source = "125" } -- Wooden Vulpera Caravan
end

do--	🏪 VENDOR NPC: 188623 Samia Inkling  Sabellian Quartermaster
DVD.ActiveItems[284579] = { decorID = 28111, model3D = 3920792, soldBy = {188623}, source = "125" } -- Obsidian Lava Pool
end
-------------------------------------------------
-- VENDORS
-------------------------------------------------
do--	🏪 VENDOR NPC: 274668 Curator IIlaris Bastion 
DVD.ActiveItems[284460] = { decorID = 27617, model3D = 7967425, soldBy = {274668}, source = "125" } -- Kyrian Waymarker Plaque
DVD.ActiveItems[284544] = { decorID = 28536, model3D = 3006764, soldBy = {274668}, source = "125" } -- Kyrian Waymarker
DVD.ActiveItems[284540] = { decorID = 28564, model3D = 3113679, soldBy = {274668}, source = "125" } -- Narrow Kyrian Drapes
DVD.ActiveItems[284542] = { decorID = 28571, model3D = 3220602, soldBy = {274668}, source = "125" } -- Kyrian Steward Effigy
DVD.ActiveItems[284532] = { decorID = 28553, model3D = 3046665, soldBy = {274668}, source = "125" } -- Radiant Elysian Water Lily
DVD.ActiveItems[284530] = { decorID = 28554, model3D = 3051188, soldBy = {274668}, source = "125" } -- Winged Elysian Spiralbloom
DVD.ActiveItems[284508] = { decorID = 28527, model3D = 2966063, soldBy = {274668}, source = "125" } -- Lush Elysian Lotus
DVD.ActiveItems[284524] = { decorID = 28529, model3D = 2976102, soldBy = {274668}, source = "125" } -- Elysian Bulbflower
DVD.ActiveItems[284520] = { decorID = 28560, model3D = 3059912, soldBy = {274668}, source = "125" } -- Hanging Elysian Skyvy
DVD.ActiveItems[284522] = { decorID = 28561, model3D = 3059918, soldBy = {274668}, source = "125" } -- Lush Elysian Bellflower Bush
DVD.ActiveItems[284518] = { decorID = 28528, model3D = 2976098, soldBy = {274668}, source = "125" } -- Windswept Elysian Shrub
DVD.ActiveItems[284516] = { decorID = 28526, model3D = 2962132, soldBy = {274668}, source = "125" } -- Windswept Elysian Skyplume
DVD.ActiveItems[284536] = { decorID = 28522, model3D = 2845730, soldBy = {274668}, source = "125" } -- Elysian Skyfrond
DVD.ActiveItems[284514] = { decorID = 28520, model3D = 2736110, soldBy = {274668}, source = "125" } -- Sparse Elysian Pondweed
DVD.ActiveItems[284534] = { decorID = 28516, model3D = 2575497, soldBy = {274668}, source = "125" } -- Windswept Elysian Grass
DVD.ActiveItems[284512] = { decorID = 28519, model3D = 2736104, soldBy = {274668}, source = "125" } -- Verdant Elysian Crownblossom
DVD.ActiveItems[284510] = { decorID = 28573, model3D = 3230280, soldBy = {274668}, source = "125" } -- Elysian Heart-Lotus
DVD.ActiveItems[284528] = { decorID = 28521, model3D = 2835147, soldBy = {274668}, source = "125" } -- Windswept Elysian Willow
DVD.ActiveItems[284526] = { decorID = 28523, model3D = 2921865, soldBy = {274668}, source = "125" } -- Lush Elysian Lily
end

do--	🏪 VENDOR NPC: 274668 Curator IIlaris and 160470 Adjutant Nikos
DVD.ActiveItems[284548] = { decorID = 28354, model3D = 3566528, soldBy = {274668, 160470}, source = "125" } -- Ceremonial Kyrian Standard
end

do--	🏪 VENDOR NPC: 112716 (Rasil Fireborne)
DVD.ActiveItems[284264] = { decorID = 22399, model3D = 1470706, soldBy = {112716}, source = "125" } -- "Gnoma Lisa" Painting

end

do--	🏪 VENDOR NPC: 242399 Telemancer Astrandis
DVD.ActiveItems[244349] = { decorID = 1432, model3D = 6904852, soldBy = {242399}, source = "125" } -- Ruined Amani Ritual Urn
DVD.ActiveItems[264486] = { decorID = 15750, model3D = 6797444, soldBy = {242399}, source = "125" } -- Brown Amani Tapestry
DVD.ActiveItems[284357] = { decorID = 27458, model3D = 7498516, soldBy = {242399}, source = "125" } -- Ancient Amani Mural
end

do--	🏪 VENDOR NPC: 242398 Naleidea Rivergleam
DVD.ActiveItems[284353] = { decorID = 29117, model3D = 6125170, soldBy = {242398}, source = "125" } -- Amani Open Fire Grill
DVD.ActiveItems[252043] = { decorID = 8991, model3D = 6212458, soldBy = {242398}, source = "125" } -- Amani Horn Beaker
DVD.ActiveItems[264485] = { decorID = 15749, model3D = 6797443, soldBy = {242398}, source = "125" } -- Green Amani Tapestry
DVD.ActiveItems[284355] = { decorID = 26385, model3D = 7515871, soldBy = {242398}, source = "125" } -- Amani Hex Candle
DVD.ActiveItems[284362] = { decorID = 23552, model3D = 7815515, soldBy = {242398}, source = "125" } -- Tusked Amani Canoe
DVD.ActiveItems[264719] = { decorID = 16096, model3D = 6195765, soldBy = {242398}, source = "125" } -- Worn Amani Oar
DVD.ActiveItems[244346] = { decorID = 1429, model3D = 6870563, soldBy = {242398}, source = "125" } -- Broken Amani Ritual Urn
DVD.ActiveItems[244348] = { decorID = 1431, model3D = 6904850, soldBy = {242398}, source = "125" } -- Cracked Amani Funerary Urn
end

do--	🏪 VENDOR NPC: 274690 Fenwir 
DVD.ActiveItems[284488] = { decorID = 28497, model3D = 1858291, soldBy = {274690}, source = "125" } -- Drustvar Leaf Patch
DVD.ActiveItems[284490] = { decorID = 28458, model3D = 1630453, soldBy = {274690}, source = "125" } -- Drustvar Leaf Clump
DVD.ActiveItems[284472] = { decorID = 28493, model3D = 1794799, soldBy = {274690}, source = "125" } -- Drustvar Shelfcap
DVD.ActiveItems[284470] = { decorID = 28485, model3D = 1693617, soldBy = {274690}, source = "125" } -- Withered Barrow-weed
DVD.ActiveItems[284462] = { decorID = 28499, model3D = 1863166, soldBy = {274690}, source = "125" } -- Arching Crimson Ivy
DVD.ActiveItems[284464] = { decorID = 28490, model3D = 1728708, soldBy = {274690}, source = "125" } -- Twisted Crimson Root
DVD.ActiveItems[284466] = { decorID = 28489, model3D = 1728706, soldBy = {274690}, source = "125" } -- Drustvar Glowcap Cluster
DVD.ActiveItems[284468] = { decorID = 28491, model3D = 1780106, soldBy = {274690}, source = "125" } -- Short Crimson Oak Stump
DVD.ActiveItems[284486] = { decorID = 28492, model3D = 1780604, soldBy = {274690}, source = "125" } -- Short Drustvar Oak Stump
DVD.ActiveItems[284474] = { decorID = 28494, model3D = 1795057, soldBy = {274690}, source = "125" } -- Snowbound Highroad Pine
DVD.ActiveItems[284476] = { decorID = 28487, model3D = 1720389, soldBy = {274690}, source = "125" } -- Lush Drustvar Witchfern
DVD.ActiveItems[284478] = { decorID = 28456, model3D = 1616781, soldBy = {274690}, source = "125" } -- Withered Crimson Oak
DVD.ActiveItems[284480] = { decorID = 28694, model3D = 1622532, soldBy = {274690}, source = "125" } -- Tall Crimson Oak
DVD.ActiveItems[284482] = { decorID = 28488, model3D = 1723796, soldBy = {274690}, source = "125" } -- Scarlet Drustvar Oak
DVD.ActiveItems[284484] = { decorID = 28486, model3D = 1699071, soldBy = {274690}, source = "125" } -- Scarlet Drustvar Thornwood
end

do--	🏪 VENDOR NPC: 127518 Adjutant Vortus argus
DVD.ActiveItems[282136] = { decorID = 28435, model3D = 1616777, soldBy = {127518}, source = "125" } -- Raw Argunite Supply
DVD.ActiveItems[282138] = { decorID = 28436, model3D = 1616778, soldBy = {127518}, source = "125" } -- Carved Argunite Supply
DVD.ActiveItems[282150] = { decorID = 28442, model3D = 1687823, soldBy = {127518}, source = "125" } -- Golden Argunite Crystal
DVD.ActiveItems[282152] = { decorID = 28443, model3D = 1687829, soldBy = {127518}, source = "125" } -- Celadon Argunite Crystal
DVD.ActiveItems[282154] = { decorID = 28444, model3D = 1687835, soldBy = {127518}, source = "125" } -- Amethyst Argunite Crystal
DVD.ActiveItems[282024] = { decorID = 28427, model3D = 1607322, soldBy = {127518}, source = "125" } -- Decorative Lightforged Holo-Screen
DVD.ActiveItems[282119] = { decorID = 28109, model3D = 1607368, soldBy = {127518}, source = "125" } -- Lightforged Holo-Shield
DVD.ActiveItems[282113] = { decorID = 28106, model3D = 1607336, soldBy = {127518}, source = "125" } -- Lightforged Holo-Tower
DVD.ActiveItems[282115] = { decorID = 28107, model3D = 1607345, soldBy = {127518}, source = "125" } -- Lightforged Holo-Barricade
DVD.ActiveItems[282117] = { decorID = 28108, model3D = 1607367, soldBy = {127518}, source = "125" } -- Lightforged Holo-Parapet
DVD.ActiveItems[282148] = { decorID = 28441, model3D = 1686555, soldBy = {127518}, source = "125" } -- Replica Crown of the Triumvirate
end

do--	🏪 VENDOR NPC: 175419 Lunelle Ardenweld
DVD.ActiveItems[283281] = { decorID = 28567, model3D = 3158899, soldBy = {175419}, source = "125" } -- Wildgrove Leaf Pile
DVD.ActiveItems[281670] = { decorID = 28542, model3D = 3036126, soldBy = {175419}, source = "125" } -- Anima-Infused Dreamcatcher
DVD.ActiveItems[283383] = { decorID = 28557, model3D = 3053190, soldBy = {175419}, source = "125" } -- Leaning Celestial Orchid
DVD.ActiveItems[283267] = { decorID = 28555, model3D = 3053180, soldBy = {175419}, source = "125" } -- Celestial Grovebush
DVD.ActiveItems[283379] = { decorID = 28551, model3D = 3045013, soldBy = {175419}, source = "125" } -- Hanging Wildgrove Ivy
DVD.ActiveItems[283339] = { decorID = 27614, model3D = 3486891, soldBy = {175419}, source = "125" } -- Starseed Sapling
DVD.ActiveItems[282714] = { decorID = 28540, model3D = 3036098, soldBy = {175419}, source = "125" } -- Fae Anima Wall Lantern
DVD.ActiveItems[283273] = { decorID = 28541, model3D = 3036113, soldBy = {175419}, source = "125" } -- Fae Moonbough Table
DVD.ActiveItems[283381] = { decorID = 28556, model3D = 3053186, soldBy = {175419}, source = "125" } -- Lush Celestial Moonbough
DVD.ActiveItems[282327] = { decorID = 28577, model3D = 3543723, soldBy = {175419}, source = "125" } -- Fae Animashroom
DVD.ActiveItems[283385] = { decorID = 28562, model3D = 3067212, soldBy = {175419}, source = "125" } -- Fae Animashroom Circle
DVD.ActiveItems[283341] = { decorID = 28537, model3D = 3024728, soldBy = {175419}, source = "125" } -- Dormant Wildseed
DVD.ActiveItems[283285] = { decorID = 28550, model3D = 3045006, soldBy = {175419}, source = "125" } -- Lush Wildgrove Fern
end

do--	🏪 VENDOR NPC: 274686 Verayn
DVD.ActiveItems[284554] = { decorID = 28568, model3D = 3187916, soldBy = {274686}, source = "125" } -- Confessor's Anima Jar
DVD.ActiveItems[284566] = { decorID = 28535, model3D = 2991928, soldBy = {274686}, source = "125" } -- Venthyr Fencepost
DVD.ActiveItems[284564] = { decorID = 28534, model3D = 2991927, soldBy = {274686}, source = "125" } -- Venthyr Fence
DVD.ActiveItems[284568] = { decorID = 27684, model3D = 3051536, soldBy = {274686}, source = "125" } -- Sinfall Dining Table
DVD.ActiveItems[284556] = { decorID = 28576, model3D = 3529582, soldBy = {274686}, source = "125" } -- Sinfall Arched Bookcase

end

do--	🏪 VENDOR NPC: 274062 Mumples 
DVD.ActiveItems[282681] = { decorID = 28525, model3D = 2958037, soldBy = {274062}, source = "125" } -- Brightburned Nathrian Clawbush
DVD.ActiveItems[282683] = { decorID = 28530, model3D = 2976104, soldBy = {274062}, source = "125" } -- Brightburned Nathrian Root
DVD.ActiveItems[282689] = { decorID = 28353, model3D = 3076363, soldBy = {274062}, source = "125" } -- Endmire Anima Blossom
DVD.ActiveItems[282687] = { decorID = 28558, model3D = 3057974, soldBy = {274062}, source = "125" } -- Endmire Sinsticker Bush
DVD.ActiveItems[282695] = { decorID = 27613, model3D = 2564960, soldBy = {274062}, source = "125" } -- Large Nathrian Bladebush
DVD.ActiveItems[282665] = { decorID = 28511, model3D = 2529727, soldBy = {274062}, source = "125" } -- Large Nathrian Briar Root
DVD.ActiveItems[282663] = { decorID = 28510, model3D = 2529716, soldBy = {274062}, source = "125" } -- Nathrian Forked Briar
DVD.ActiveItems[282691] = { decorID = 28517, model3D = 2576856, soldBy = {274062}, source = "125" } -- Nathrian Fungal Rotcap
DVD.ActiveItems[282669] = { decorID = 28513, model3D = 2563803, soldBy = {274062}, source = "125" } -- Nathrian Leafy Briar
DVD.ActiveItems[282661] = { decorID = 27612, model3D = 2529715, soldBy = {274062}, source = "125" } -- Nathrian Reaching Briar
DVD.ActiveItems[282697] = { decorID = 28524, model3D = 2932047, soldBy = {274062}, source = "125" } -- Nathrian Rubyroot Growth
DVD.ActiveItems[282679] = { decorID = 28514, model3D = 2565491, soldBy = {274062}, source = "125" } -- Nathrian Sinstain Bush
DVD.ActiveItems[282685] = { decorID = 28515, model3D = 2565498, soldBy = {274062}, source = "125" } -- Nathrian Sinstain Ivy Cluster
DVD.ActiveItems[282671] = { decorID = 28533, model3D = 2991609, soldBy = {274062}, source = "125" } -- Nathrian Thicket Hedge
DVD.ActiveItems[282693] = { decorID = 28552, model3D = 3045415, soldBy = {274062}, source = "125" } -- Pale Nathrian Rose
DVD.ActiveItems[282667] = { decorID = 28512, model3D = 2529729, soldBy = {274062}, source = "125" } -- Small Nathrian Briar Root
DVD.ActiveItems[282673] = { decorID = 28518, model3D = 2615788, soldBy = {274062}, source = "125" } -- Lonely Banewood Pine
DVD.ActiveItems[282677] = { decorID = 28509, model3D = 2490914, soldBy = {274062}, source = "125" } -- Nathrian Sinstain Oak
DVD.ActiveItems[282675] = { decorID = 28563, model3D = 3067304, soldBy = {274062}, source = "125" } -- Spherical Nathrian Topiary
end

do--	🏪 VENDOR NPC: 169524 Acquirer Ta'gosh
DVD.ActiveItems[284216] = { decorID = 28110, model3D = 3674847, soldBy = {169524}, source = "125" } -- Mysterious Imported Piranha
end

do--	🏪 VENDOR NPC: 274250 Botanist Taania 
DVD.ActiveItems[283234] = { decorID = 28319, model3D = 897156, soldBy = {274250}, source = "125" } -- Curved Karabor Hedge
DVD.ActiveItems[283236] = { decorID = 28320, model3D = 897158, soldBy = {274250}, source = "125" } -- Elaborate Karabor Hedge
DVD.ActiveItems[283242] = { decorID = 28323, model3D = 902336, soldBy = {274250}, source = "125" } -- Gloomshade Glowpod
DVD.ActiveItems[283232] = { decorID = 28318, model3D = 894516, soldBy = {274250}, source = "125" } -- Huddled Nightmarsh Blossom
DVD.ActiveItems[283238] = { decorID = 28321, model3D = 897160, soldBy = {274250}, source = "125" } -- Karabor Hedge
DVD.ActiveItems[283226] = { decorID = 27606, model3D = 893968, soldBy = {274250}, source = "125" } -- Mature Star Lily
DVD.ActiveItems[283222] = { decorID = 25324, model3D = 894399, soldBy = {274250}, source = "125" } -- Overgrown Valuun Shrub
DVD.ActiveItems[283240] = { decorID = 28322, model3D = 900281, soldBy = {274250}, source = "125" } -- Shadow Lily Bloom
DVD.ActiveItems[283220] = { decorID = 25323, model3D = 798115, soldBy = {274250}, source = "125" } -- Small Shadowmoon Shadebrush
DVD.ActiveItems[283224] = { decorID = 25325, model3D = 897834, soldBy = {274250}, source = "125" } -- Verdant Mire Scale-Leaf
DVD.ActiveItems[283228] = { decorID = 27683, model3D = 877186, soldBy = {274250}, source = "125" } -- Embaari Beech Tree
DVD.ActiveItems[283230] = { decorID = 28317, model3D = 797885, soldBy = {274250}, source = "125" } -- Pale Shadowmoon Willow
DVD.ActiveItems[283246] = { decorID = 28325, model3D = 925255, soldBy = {274250}, source = "125" } -- Verdant Shadowmoon Willow
DVD.ActiveItems[283248] = { decorID = 28629, model3D = 877196, soldBy = {274250}, source = "125" } -- Lunarfall Beech Tree
DVD.ActiveItems[283244] = { decorID = 28324, model3D = 903764, soldBy = {274250}, source = "125" } -- Karabor Beech Tree
end

do--	🏪 VENDOR NPC: 274291 Botanist Gril'ka 
DVD.ActiveItems[284126] = { decorID = 28336, model3D = 970239, soldBy = {274291}, source = "125" } -- Aborius Pod Plant
DVD.ActiveItems[284128] = { decorID = 28337, model3D = 971014, soldBy = {274291}, source = "125" } -- Gordawg Mossy Rock
DVD.ActiveItems[284134] = { decorID = 28693, model3D = 1036822, soldBy = {274291}, source = "125" } -- Incineratus Grass Patch
DVD.ActiveItems[284124] = { decorID = 28335, model3D = 970236, soldBy = {274291}, source = "125" } -- Kalandrios Lily
DVD.ActiveItems[284106] = { decorID = 28326, model3D = 940783, soldBy = {274291}, source = "125" } -- Nagrand Clover Cluster
DVD.ActiveItems[284130] = { decorID = 28338, model3D = 971433, soldBy = {274291}, source = "125" } -- Nagrand Heart Ivy
DVD.ActiveItems[284108] = { decorID = 28327, model3D = 940795, soldBy = {274291}, source = "125" } -- Nagrand Wild Wheat
DVD.ActiveItems[284118] = { decorID = 28332, model3D = 969775, soldBy = {274291}, source = "125" } -- Spiritwood Oak Stump
DVD.ActiveItems[284120] = { decorID = 28333, model3D = 969875, soldBy = {274291}, source = "125" } -- Sentinel Tree Root
DVD.ActiveItems[284110] = { decorID = 28328, model3D = 948111, soldBy = {274291}, source = "125" } -- Young Sentinel Tree
DVD.ActiveItems[284112] = { decorID = 28329, model3D = 948113, soldBy = {274291}, source = "125" } -- Highmaul Sentinel Tree
DVD.ActiveItems[284116] = { decorID = 28331, model3D = 968135, soldBy = {274291}, source = "125" } -- Mature Spiritwood Oak
DVD.ActiveItems[284132] = { decorID = 28450, model3D = 948119, soldBy = {274291}, source = "125" } -- Skysong Sentinel Tree
DVD.ActiveItems[284122] = { decorID = 28334, model3D = 969881, soldBy = {274291}, source = "125" } -- Stonecrag Sentinel Tree
DVD.ActiveItems[284114] = { decorID = 28330, model3D = 948121, soldBy = {274291}, source = "125" } -- Wandering Sentinel Tree

end

do--	🏪 VENDOR NPC: 274682 Collector Xorik 
DVD.ActiveItems[284492] = { decorID = 28544, model3D = 3036559, soldBy = {274682}, source = "125" } -- Open Bonewood Barrel
DVD.ActiveItems[284494] = { decorID = 28367, model3D = 3222232, soldBy = {274682}, source = "125" } -- Ossified Maldraxxi Spike
DVD.ActiveItems[284496] = { decorID = 28545, model3D = 3036566, soldBy = {274682}, source = "125" } -- Highback Bonewood Chair
DVD.ActiveItems[284500] = { decorID = 28344, model3D = 3307174, soldBy = {274682}, source = "125" } -- Maldraxxi Shielding Lattice
DVD.ActiveItems[284502] = { decorID = 28548, model3D = 3040074, soldBy = {274682}, source = "125" } -- Maldraxxi Horned Beast Skull
end

do--	🏪 VENDOR NPC: 143244 Victor Esquivas 
DVD.ActiveItems[284384] = { decorID = 28495, model3D = 1852964, soldBy = {143244}, source = "125" } -- Boralus Swill Bottle
end

do--	🏪 VENDOR NPC: 143325 Jeni  
DVD.ActiveItems[283325] = { decorID = 28468, model3D = 1674744, soldBy = {143325}, source = "125" } -- Nomad's Worn Water Gourd
DVD.ActiveItems[283327] = { decorID = 28469, model3D = 1674745, soldBy = {143325}, source = "125" } -- Nomad's Water Gourd
DVD.ActiveItems[283287] = { decorID = 28467, model3D = 1674743, soldBy = {143325}, source = "125" } -- Nomad's Warped Water Gourd
DVD.ActiveItems[283307] = { decorID = 28473, model3D = 1674794, soldBy = {143325}, source = "125" } -- Nomad's Mortar and Pestle
DVD.ActiveItems[283309] = { decorID = 28474, model3D = 1674795, soldBy = {143325}, source = "125" } -- Nomad's Covered Serving Bowl
DVD.ActiveItems[283311] = { decorID = 28475, model3D = 1674796, soldBy = {143325}, source = "125" } -- Nomad's Serving Bowl
DVD.ActiveItems[283313] = { decorID = 28476, model3D = 1674797, soldBy = {143325}, source = "125" } -- Nomad's Stone Pitcher
DVD.ActiveItems[283331] = { decorID = 28477, model3D = 1674798, soldBy = {143325}, source = "125" } -- Nomad's Stone Urn
DVD.ActiveItems[283293] = { decorID = 28480, model3D = 1674801, soldBy = {143325}, source = "125" } -- Nomad's Serving Sundries
DVD.ActiveItems[283315] = { decorID = 28479, model3D = 1674800, soldBy = {143325}, source = "125" } -- Nomad's Bowl Set
DVD.ActiveItems[283333] = { decorID = 28478, model3D = 1674799, soldBy = {143325}, source = "125" } -- Nomad's Refreshment Set
DVD.ActiveItems[283337] = { decorID = 28483, model3D = 1675209, soldBy = {143325}, source = "125" } -- Black Vulpera Cushion
DVD.ActiveItems[283335] = { decorID = 28482, model3D = 1675208, soldBy = {143325}, source = "125" } -- Blue Vulpera Cushion
DVD.ActiveItems[283295] = { decorID = 28484, model3D = 1675210, soldBy = {143325}, source = "125" } -- Long Red Vulpera Cushion
DVD.ActiveItems[283329] = { decorID = 28470, model3D = 1674746, soldBy = {143325}, source = "125" } -- Nomad's Wooden Table
DVD.ActiveItems[283269] = { decorID = 27982, model3D = 3154166, soldBy = {143325}, source = "125" } -- Vulpera War Banner
DVD.ActiveItems[283343] = { decorID = 27610, model3D = 1674721, soldBy = {143325}, source = "125" } -- Ornate Vulpera Caravan
end

do--Raid Drops
DVD.ActiveItems[281213] = { decorID = 25474, model3D = 7949197, source = "125" } -- Kith'ix's Seal
end

do--Dungeon Drops
DVD.ActiveItems[284194] = { decorID = 25326, model3D = 1033500, source = "125" } -- Everbloom Forest Floor
end

do--delve drops
DVD.ActiveItems[244350] = { decorID = 1433, model3D = 6904854, source = "125" } -- Shattered Amani Ritual Urn
DVD.ActiveItems[252044] = { decorID = 8992, model3D = 6212459, source = "125" } -- Amani Horn Cup
DVD.ActiveItems[264484] = { decorID = 15748, model3D = 6797442, source = "125" } -- Blue Amani Tapestry
DVD.ActiveItems[263321] = { decorID = 15161, model3D = 6075569, source = "125" } -- Frayed Amani Offering Basket
DVD.ActiveItems[284359] = { decorID = 25129, model3D = 7914429, source = "125" } -- Corroded Amani Sconce
DVD.ActiveItems[264256] = { decorID = 15491, model3D = 6212417, source = "125" } -- Wall-Mounted Amani Animal Trophy
end

do--quests
DVD.ActiveItems[264718] = { decorID = 16095, model3D = 6195764, source = "125" } -- Amani Fishing Canoe
DVD.ActiveItems[279067] = { decorID = 25308, model3D = 6935592, source = "125" } -- Symbol of Halazzi, Loa of the Hunt
DVD.ActiveItems[280050] = { decorID = 27216, model3D = 8123341, soldBy = {266188}, source = "125" } -- Aqir Hunter's Trophy
end

do--Achievements
DVD.ActiveItems[282287] = { decorID = 26013, model3D = 1246563, source = "125" } -- Scarecrow Pepe
DVD.ActiveItems[283262] = { decorID = 28572, model3D = 3229538, soldBy = {175419}, source = "125" } -- Restored Night Fae Sigil
DVD.ActiveItems[282162] = { decorID = 28448, model3D = 1861600, soldBy = {127518}, source = "125" } -- Ceremonial Lightforged Standard
DVD.ActiveItems[284546] = { decorID = 28569, model3D = 3189119, soldBy = {274668}, source = "125" } -- Runic Kyrian Reliquary
DVD.ActiveItems[281682] = { decorID = 27608, model3D = 1573324, soldBy = {127518}, source = "125" } -- Shielded Lightforged Pylon

end

do--Halloween gold vendor items
DVD.ActiveItems[282086] = { decorID = 26020, model3D = 5358953, source = "125" } -- Buckled Witch Hat
DVD.ActiveItems[282083] = { decorID = 26051, model3D = 8015706, source = "125" } -- Unlit Smiling Jack-o'-Lantern
DVD.ActiveItems[282092] = { decorID = 26882, model3D = 1675689, source = "125" } -- Heartsbane Ritual Markings
DVD.ActiveItems[282095] = { decorID = 26886, model3D = 1698655, source = "125" } -- Ominous Heartsbane Banner
DVD.ActiveItems[282075] = { decorID = 26889, model3D = 1892549, source = "125" } -- Heartsbane Candle
DVD.ActiveItems[282098] = { decorID = 26887, model3D = 1711578, source = "125" } -- Elaborate Heartsbane Doom Catcher
DVD.ActiveItems[282077] = { decorID = 26019, model3D = 5019441, source = "125" } -- Spooky Scarecrow
DVD.ActiveItems[282090] = { decorID = 26018, model3D = 5019430, source = "125" } -- Eternally Powered Glowskull
DVD.ActiveItems[282081] = { decorID = 26010, model3D = 201088, source = "125" } -- Candlelit Smiling Jack-o'-Lantern
DVD.ActiveItems[282051] = { decorID = 26009, model3D = 199809, source = "125" } -- Simple Hallow's End Candle
DVD.ActiveItems[282100] = { decorID = 26888, model3D = 1711590, soldBy = {271604, 271366}, source = "125" } -- Heartsbane Doom Catcher
end

do --Halloween Candy Vendor Items
DVD.ActiveItems[282289] = { decorID = 26054, model3D = 8018068, source = "125" } -- Horrific Head of the Horseman
DVD.ActiveItems[282200] = { decorID = 26053, model3D = 8015708, source = "125" } -- Unlit Ogre Jack-o'-Lantern
DVD.ActiveItems[282198] = { decorID = 26052, model3D = 8015707, source = "125" } -- Unlit Shrieking Jack-o'-Lantern
DVD.ActiveItems[282194] = { decorID = 26012, model3D = 201090, source = "125" } -- Candlelit Ogre Jack-o'-Lantern
DVD.ActiveItems[282192] = { decorID = 26011, model3D = 201089, source = "125" } -- Candlelit Shrieking Jack-o'-Lantern
DVD.ActiveItems[282072] = { decorID = 26050, model3D = 8015704, source = "125" } -- Enchanted Hallow's End Candle
DVD.ActiveItems[282206] = { decorID = 26883, model3D = 1681368, source = "125" } -- Heartsbane Stone Circle
DVD.ActiveItems[282202] = { decorID = 26881, model3D = 1675684, source = "125" } -- Elaborate Heartsbane Ritual Markings
DVD.ActiveItems[282208] = { decorID = 26884, model3D = 1695273, source = "125" } -- Heartsbane Banner
DVD.ActiveItems[282204] = { decorID = 26885, model3D = 1697823, source = "125" } -- Ominous Heartsbane Shrine
DVD.ActiveItems[282196] = { decorID = 26016, model3D = 5019424, source = "125" } -- Filled Candy Bucket
DVD.ActiveItems[282213] = { decorID = 26880, model3D = 1675557, source = "125" } -- Looming Heartsbane Effigy
end

do--Gather Argus?
DVD.ActiveItems[282164] = { decorID = 28632, model3D = 1616725, source = "125" } -- Eredath Worktable
end
-------------------------------------------------
-- Profession Decor
-------------------------------------------------
do--Alchemy
DVD.ActiveItems[284552] = { decorID = 28566, model3D = 3154975, source = "125" } -- Venthyr Alchemy Rack

end

do--Blacksmithing
DVD.ActiveItems[283303] = { decorID = 28633, model3D = 2013143, source = "125" } -- Nomad's Steel Forge
DVD.ActiveItems[282124] = { decorID = 28429, model3D = 1608421, source = "125" } -- Gleaming Lightforge
DVD.ActiveItems[283260] = { decorID = 28574, model3D = 3429594, source = "125" } -- Anima-Powered Anvil

end

do--Enchanting
DVD.ActiveItems[282140] = { decorID = 28437, model3D = 1616779, source = "125" } -- Shimmering Lightforged Canister
DVD.ActiveItems[265331] = { decorID = 16754, model3D = 192430, source = "125" } -- Draenei Holo-Junction Enchanting

end

do--Engineering
DVD.ActiveItems[283291] = { decorID = 28472, model3D = 1674748, source = "125" } -- Nomad's Campfire Grill
DVD.ActiveItems[282144] = { decorID = 28439, model3D = 1660051, source = "125" } -- Lightforged Recall Beacon

end

do--Inscription
DVD.ActiveItems[283321] = { decorID = 28457, model3D = 1624534, source = "125" } -- Closed Vulpera Scroll
DVD.ActiveItems[282190] = { decorID = 26015, model3D = 5019423, source = "125" } -- Apple Bobbing Bucket
DVD.ActiveItems[282132] = { decorID = 28433, model3D = 1616728, source = "125" } -- Eredath Artisan's Workbench
DVD.ActiveItems[283301] = { decorID = 28575, model3D = 3448138, source = "125" } -- Fae Moonbough Scroll
DVD.ActiveItems[284504] = { decorID = 28549, model3D = 3040291, source = "125" } -- Levitating Lich Library

end

do--Jewelcrafting still need
DVD.ActiveItems[282126] = { decorID = 28430, model3D = 1608443, source = "125" } -- Hanging Argunite Lamp

end

do--Leatherworking
DVD.ActiveItems[284240] = { decorID = 26709, model3D = 5350798, source = "125" } -- Beloved Ottuk Plushie
DVD.ActiveItems[284242] = { decorID = 26710, model3D = 5350799, source = "125" } -- Beloved Ottuuuuuuk Plushie

end

do--Tailoring
DVD.ActiveItems[283299] = { decorID = 27609, model3D = 1591070, source = "125" } -- Nomad's Round Cushion
DVD.ActiveItems[284246] = { decorID = 26711, model3D = 8096059, source = "125" } -- Beloved Plush Doll
DVD.ActiveItems[284238] = { decorID = 26479, model3D = 969758, source = "125" } -- Beloved Murloc Plushie
DVD.ActiveItems[284244] = { decorID = 27220, model3D = 4551444, source = "125" } -- Lillistrasza's Lucky Duck Plushie
DVD.ActiveItems[282184] = { decorID = 26017, model3D = 5019429, source = "125" } -- Spidery Witch Hat
DVD.ActiveItems[282158] = { decorID = 28446, model3D = 1695047, source = "125" } -- Decorative Lightweave Bolt

end





