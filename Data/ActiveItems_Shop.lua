-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems_12_1.lua
-- Patch 12.1 ActiveItems
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}

do --shop
	DVD.ActiveItems[250793] = { decorID = 7825, model3D = 7096208, noxp = true,  source = "shop"} --"Lush Garden Trellis"
	DVD.ActiveItems[252419] = { decorID = 9065, model3D = 7096209, noxp = true,  source = "shop"} --"Lush Garden Fungal Basin"
	DVD.ActiveItems[258294] = { decorID = 11940, model3D = 7096211, noxp = true,  source = "shop"} --"Lush Garden Gnome-Like Statue"
	DVD.ActiveItems[258567] = { decorID = 12171, model3D = 7096212, noxp = true,  source = "shop"} --"Lush Garden Fungal Chair"
	DVD.ActiveItems[253546] = { decorID = 9443, model3D = 7096210, noxp = true,  source = "shop"} --"Lush Garden Butterfly Sconce"
	DVD.ActiveItems[258888] = { decorID = 12223, model3D = 7096216, noxp = true, source = "shop"} -- "Lush Garden Fungal Fountain", 		
	DVD.ActiveItems[264692] = { decorID = 16039, model3D = 7297702, noxp = true, source = "shop"} -- "Lush Garden Window", 					
	DVD.ActiveItems[266070] = { decorID = 17749, model3D = 7448147, noxp = true,  source = "shop"} --"Lush Garden Fungal Table",
	DVD.ActiveItems[266162] = { decorID = 17792, model3D = 7297701, noxp = true,  source = "shop"} --"Lush Garden Hedge",
	DVD.ActiveItems[266163] = { decorID = 17793, model3D = 7297703, noxp = true,  source = "shop"} --"Lush Garden Fungal Planter",
	DVD.ActiveItems[266164] = { decorID = 17794, model3D = 7297705, noxp = true,  source = "shop"} --"Lush Garden Fungal Picnic",	
	DVD.ActiveItems[267203] = { decorID = 18794, model3D = 7297700, noxp = true,  source = "shop"} --"Lush Garden Stable",
	DVD.ActiveItems[268550] = { decorID = 19848, model3D = 7297706, noxp = true,  source = "shop"} --"Lush Garden Rug",	
	DVD.ActiveItems[250794] = { decorID = 7826, model3D = 7096213, noxp = true,  source = "shop"} --"Colorful Shroomic Egg"
	DVD.ActiveItems[250795] = { decorID = 7827, model3D = 7096214, noxp = true,  source = "shop"} --"Colorful Dotted Egg"
	DVD.ActiveItems[250796] = { decorID = 7828, model3D = 7096215, noxp = true,  source = "shop"} --"Colorful Striped Egg"	
	DVD.ActiveItems[260727] = { decorID = 14432, model3D = 7476387, noxp = true, source = "shop"} -- "Alliance Doormat", 					
	DVD.ActiveItems[260728] = { decorID = 14433, model3D = 7476388, noxp = true, source = "shop"} -- "Horde Doormat", 	
	DVD.ActiveItems[263052] = { decorID = 14838, model3D = 7484415, noxp = true, source = "shop"} -- "Beloved Lion Plushie", 				
	DVD.ActiveItems[263053] = { decorID = 14839, model3D = 7484418, noxp = true, source = "shop"} -- "Beloved Wolf Plushie", 
	DVD.ActiveItems[250797] = { decorID = 7829, model3D = 7096217, noxp = true,  source = "shop"} --"Spring Blossom Ceiling Light"
	DVD.ActiveItems[250798] = { decorID = 7830, model3D = 7096220, noxp = true,  source = "shop"} --"Spring Blossom Shelf"	
	DVD.ActiveItems[253547] = { decorID = 9444, model3D = 7096227, noxp = true,  source = "shop"} --"Spring Blossom Wreath"
	DVD.ActiveItems[254417] = { decorID = 10356, model3D = 7096218, noxp = true,  source = "shop"} --"Spring Blossom Hanging Chair"
	DVD.ActiveItems[258568] = { decorID = 12172, model3D = 7096219, noxp = true, source = "shop"} -- "Spring Blossom Window", 				
	DVD.ActiveItems[258569] = { decorID = 12173, model3D = 7096221, noxp = true, source = "shop"} -- "Spring Blossom Gazebo", 	
	DVD.ActiveItems[263290] = { decorID = 15140, model3D = 7469298, noxp = true, source = "shop"} -- "Spring Blossom Tree", 				
	DVD.ActiveItems[263291] = { decorID = 15141, model3D = 7469299, noxp = true, source = "shop"} -- "Spring Blossom Tree Pond", 	
	DVD.ActiveItems[265555] = { decorID = 16974, model3D = 7297709, noxp = true, source = "shop"} -- "Spring Blossom Stepping Stone", 		
	DVD.ActiveItems[265556] = { decorID = 16975, model3D = 7297711, noxp = true, source = "shop"} -- "Spring Blossom Privacy Screen", 		
	DVD.ActiveItems[265557] = { decorID = 16976, model3D = 7484800, noxp = true, source = "shop"} -- "Spring Blossom Stepping Stone Duo",	
	DVD.ActiveItems[265558] = { decorID = 16977, model3D = 7484801, noxp = true, source = "shop"} -- "Spring Blossom Stepping Stone Trio", 	
	DVD.ActiveItems[265559] = { decorID = 16978, model3D = 7484802, noxp = true, source = "shop"} --"Spring Blossom Stepping Stone Collection"
	DVD.ActiveItems[266068] = { decorID = 17747, model3D = 7297712, noxp = true,  source = "shop"} --"Spring Blossom Tea Set",
	DVD.ActiveItems[266069] = { decorID = 17748, model3D = 7448146, noxp = true,  source = "shop"} --"Spring Blossom Table",
	DVD.ActiveItems[266165] = { decorID = 17795, model3D = 7297708, noxp = true,  source = "shop"} --"Spring Blossom Lantern",
	DVD.ActiveItems[266166] = { decorID = 17796, model3D = 7297710, noxp = true,  source = "shop"} --"Spring Blossom Tranquility Garden",
	DVD.ActiveItems[266167] = { decorID = 17797, model3D = 7484798, noxp = true,  source = "shop"} --"Spring Blossom Pond",
end	

do--12.1 Shop
DVD.ActiveItems[264721] = { decorID = 16098, model3D = 7509678, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Curio Display
DVD.ActiveItems[264722] = { decorID = 16099, model3D = 7509679, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Inkmaster's Desk
DVD.ActiveItems[264723] = { decorID = 16100, model3D = 7509682, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Tree of Fortune
DVD.ActiveItems[264724] = { decorID = 16101, model3D = 7509685, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Golden Carp Lantern
DVD.ActiveItems[264725] = { decorID = 16102, model3D = 7509686, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Imperial Lion
DVD.ActiveItems[266071] = { decorID = 17750, model3D = 7509681, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Wooden Chair
DVD.ActiveItems[272353] = { decorID = 21945, model3D = 7509684, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Verdant Basin
DVD.ActiveItems[272354] = { decorID = 21946, model3D = 7804756, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Auspicious Stone Lion
DVD.ActiveItems[253254] = { decorID = 9270, model3D = 7319687, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Cradle
DVD.ActiveItems[253290] = { decorID = 9274, model3D = 7319688, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Ornate Vanity
DVD.ActiveItems[253244] = { decorID = 9265, model3D = 7319685, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Aquarium
DVD.ActiveItems[253257] = { decorID = 9273, model3D = 7319692, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Privacy Screen
DVD.ActiveItems[253296] = { decorID = 9280, model3D = 7319697, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Tea Set
DVD.ActiveItems[253255] = { decorID = 9271, model3D = 7319690, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Wide Pillow Roll
DVD.ActiveItems[253256] = { decorID = 9272, model3D = 7319691, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Pillow Roll
DVD.ActiveItems[253291] = { decorID = 9275, model3D = 7319689, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Compact
DVD.ActiveItems[253292] = { decorID = 9276, model3D = 7319693, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Bamboo Canister
DVD.ActiveItems[253293] = { decorID = 9277, model3D = 7319694, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Tea Tray
DVD.ActiveItems[253294] = { decorID = 9278, model3D = 7319695, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Teacup
DVD.ActiveItems[253295] = { decorID = 9279, model3D = 7319696, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Teapot
DVD.ActiveItems[253297] = { decorID = 9281, model3D = 7319698, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Lunar Celebrant's Vase with Maple Branch
DVD.ActiveItems[272358] = { decorID = 21949, model3D = 7793022, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Firefly Jar
DVD.ActiveItems[274767] = { decorID = 23175, model3D = 7789434, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Lounge Chair
DVD.ActiveItems[274784] = { decorID = 22144, model3D = 7789431, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Tiki Frondtree
DVD.ActiveItems[274786] = { decorID = 23883, model3D = 7789429, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Waterfall Basin
DVD.ActiveItems[274788] = { decorID = 24196, model3D = 7874166, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Depths Porthole
DVD.ActiveItems[274897] = { decorID = 22398, model3D = 7789439, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Charcoal Grill
DVD.ActiveItems[274899] = { decorID = 22397, model3D = 7789428, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Tiki Market Stand
DVD.ActiveItems[274901] = { decorID = 22895, model3D = 7831531, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Cushioned Chair
DVD.ActiveItems[274903] = { decorID = 23868, model3D = 7789432, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Hanging Lantern
DVD.ActiveItems[274905] = { decorID = 23869, model3D = 7789438, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Straw Umbrella
DVD.ActiveItems[274907] = { decorID = 23870, model3D = 7789440, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Painted Surfboard
DVD.ActiveItems[274909] = { decorID = 24630, model3D = 7808631, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Murloc Tiki Totem
DVD.ActiveItems[274988] = { decorID = 24753, model3D = 7789427, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Tiki Gazebo
DVD.ActiveItems[274991] = { decorID = 24755, model3D = 7789436, noxp = true, unreleased = true, sources = {"121", "shop" }} -- Seaside Fire Pit
end

do--broken assets
    DVD.ActiveItems[236675] = { decorID = 527, model3D = 6426475, noxp = true, soldBy = {255325, 255203}, source = "vendor", skip3DPreview = true }
    DVD.ActiveItems[245392] = { decorID = 533, model3D = 6431819, noxp = true, soldBy = {255325, 255203}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236676] = { decorID = 528, model3D = 6426478, noxp = true, soldBy = {255325, 255203}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236677] = { decorID = 529, model3D = 6426477, noxp = true, soldBy = {255325, 255203}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236678] = { decorID = 530, model3D = 6426476, noxp = true, soldBy = {255325, 255203}, source = "vendor", skip3DPreview = true}		
    DVD.ActiveItems[245393] = { decorID = 534, model3D = 6431822, noxp = true, soldBy = {255278, 255222, 255325, 255203}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245394] = { decorID = 535, model3D = 6431820, noxp = true, soldBy = {255278, 255222, 255325, 255203}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245395] = { decorID = 536, model3D = 6431823, noxp = true, soldBy = {255278, 255222, 255325, 255203}, source = "vendor", skip3DPreview = true}		
    DVD.ActiveItems[236653] = { decorID = 522, model3D = 6426640, noxp = true, soldBy = {255278, 255222}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236654] = { decorID = 523, model3D = 6426638, noxp = true, soldBy = {255278, 255222}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236655] = { decorID = 524, model3D = 6426639, noxp = true, soldBy = {255278, 255222}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236666] = { decorID = 525, model3D = 6429362, noxp = true, soldBy = {255278, 255222}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[236667] = { decorID = 526, model3D = 6429361, noxp = true, soldBy = {255278, 255222}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245575] = { decorID = 1770, model3D = 6892458, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245576] = { decorID = 1771, model3D = 6892456, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245578] = { decorID = 1772, model3D = 6892457, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245579] = { decorID = 1773, model3D = 6892459, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245581] = { decorID = 1774, model3D = 6892371, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245582] = { decorID = 1775, model3D = 6892374, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245583] = { decorID = 1776, model3D = 6892373, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
    DVD.ActiveItems[245649] = { decorID = 1844, model3D = 6892372, noxp = true, soldBy = {255216, 255298}, source = "vendor", skip3DPreview = true}
end

do--source unknown
DVD.ActiveItems[277155] = { decorID = 25104, model3D = 242967, noxp = true, source = "121", unreleased = true} --Breanni's Menagerie Aquarium
DVD.ActiveItems[259354] = { decorID = 12300, model3D = 7454104, noxp = true,  source = "121", unreleased = true } -- "Brown Paper Sack", 
DVD.ActiveItems[264384] = { decorID = 15654, model3D = 7464615, noxp = true,  source = "121", unreleased = true } -- "Zapmaster Viewer 3000", 
DVD.ActiveItems[263883] = { decorID = 15293, model3D = 7501269, noxp = true,  source = "121", unreleased = true } -- "Small Sturdy Wooden Trellis", 
end

--[[ Unknown
DVD.ActiveItems[280625] = { decorID = 25765, model3D = 7967692, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_BarnQuilt01.M2
DVD.ActiveItems[280627] = { decorID = 25895, model3D = 7967693, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_FloralBasket01.M2
DVD.ActiveItems[280639] = { decorID = 25896, model3D = 7967696, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_Rug01.M2
DVD.ActiveItems[280629] = { decorID = 26703, model3D = 7967690, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_RockingChair01.M2
DVD.ActiveItems[280631] = { decorID = 26704, model3D = 7967695, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_AppleJuicer01.M2
DVD.ActiveItems[280642] = { decorID = 26705, model3D = 7967699, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_Pumpkins01.M2
DVD.ActiveItems[280644] = { decorID = 26706, model3D = 7967700, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_Corn01.M2
DVD.ActiveItems[280646] = { decorID = 26707, model3D = 7967701, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_Vines01.M2
DVD.ActiveItems[280650] = { decorID = 26708, model3D = 7967702, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_Shed01.M2
DVD.ActiveItems[280633] = { decorID = 26875, model3D = 7967691, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_HangingLight01.M2
DVD.ActiveItems[280652] = { decorID = 26876, model3D = 7967698, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_PicnicTable01.M2
DVD.ActiveItems[280654] = { decorID = 26877, model3D = 8035585, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_Pastel_Window01_Day.M2
DVD.ActiveItems[280635] = { decorID = 26940, model3D = 8117693, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_SaddleStand01.M2
DVD.ActiveItems[280637] = { decorID = 27045, model3D = 7967689, soldBy = {0}, source = "vendor", noxp = true } -- [DNT] [AUTOGEN] 12PH_Shop_Fall_PSL_Tractor01.M2

]]