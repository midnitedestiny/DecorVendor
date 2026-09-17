-- ============================================================
-- Decor Vendor Data
-- Expansions/ActiveItems_Housing.lua
--minInterface = 120007
-- ============================================================
-- Total Compiled Items: 2121


local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}

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
DVD.ActiveItems[274731] = { decorID = 23706, model3D = 7845475, soldBy = { 256828, 261231, 261262}, source = "achievement", noxp = true } -- Prized Orb of Azeroth
DVD.ActiveItems[274734] = { decorID = 24193, model3D = 7845476, soldBy = { 256828, 261231, 261262}, source = "achievement", noxp = true } -- Framed Horde Pride
DVD.ActiveItems[274736] = { decorID = 24194, model3D = 7845477, soldBy = { 256828, 261231, 261262}, source = "achievement", noxp = true } -- Framed Alliance Pride

DVD.ActiveItems[260785] = { decorID = 14467, model3D = 7476464, soldBy = {256828, 261231, 261262}, source = "achievement", noxp = true } -- Miniature Replica Dark Portal
DVD.ActiveItems[263298] = { decorID = 15148, model3D = 7493566, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}-- Cuddly Alliance Blue Grrgle
DVD.ActiveItems[263299] = { decorID = 15149, model3D = 7493568, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}-- Cuddly Horde Red Grrgle
DVD.ActiveItems[263301] = { decorID = 15151, model3D = 7493973, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}-- Cuddly Green Grrgle
DVD.ActiveItems[265394] = { decorID = 16818, model3D = 7531449, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}-- Cuddly Pearl Grrgle
DVD.ActiveItems[265545] = { decorID = 16965, model3D = 7525444, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}-- Cuddly Void Grrgle	
DVD.ActiveItems[265389] = { decorID = 16813, model3D = 7525412, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}-- Cuddly Cotton Candy Grrgle
DVD.ActiveItems[263303] = { decorID = 15153, model3D = 7493975, noxp = true, soldBy = {256828, 261231, 261262}, sources = {"vendor", "promo"}}  -- Cuddly Blue Grrgle

end

do -- 🏪 VENDOR NPC: 256828 (Dennia Silvertongue) 261231 (Tuuran) 261262 (Gabbi) Diablo 4 Preorder
DVD.ActiveItems[256764] = { decorID = 11287, model3D = 7324189, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary's Horadric Cube
DVD.ActiveItems[259055] = { decorID = 12247, model3D = 7388891, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Hatred's Wolfpelt Rug
DVD.ActiveItems[259056] = { decorID = 12248, model3D = 7388893, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Prime Evil's Chest
DVD.ActiveItems[259057] = { decorID = 12249, model3D = 7388894, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary's Chess Match
DVD.ActiveItems[259058] = { decorID = 12250, model3D = 7388920, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary's Chess Board
DVD.ActiveItems[259059] = { decorID = 12251, model3D = 7433392, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Dark Bishop
DVD.ActiveItems[259060] = { decorID = 12252, model3D = 7433393, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Dark Rook
DVD.ActiveItems[259061] = { decorID = 12253, model3D = 7433395, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Dark Queen
DVD.ActiveItems[259062] = { decorID = 12254, model3D = 7433396, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Dark Pawn
DVD.ActiveItems[259063] = { decorID = 12255, model3D = 7433397, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Dark Knight
DVD.ActiveItems[259064] = { decorID = 12256, model3D = 7433398, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Dark King
DVD.ActiveItems[259065] = { decorID = 12257, model3D = 7433399, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Light Bishop
DVD.ActiveItems[259066] = { decorID = 12258, model3D = 7433400, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Light Rook
DVD.ActiveItems[259067] = { decorID = 12259, model3D = 7433401, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Light Queen
DVD.ActiveItems[259068] = { decorID = 12260, model3D = 7433402, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Light Pawn
DVD.ActiveItems[259069] = { decorID = 12261, model3D = 7433403, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Light Knight
DVD.ActiveItems[259070] = { decorID = 12262, model3D = 7433404, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true } -- Sanctuary Chess Light King
end

do -- 🏪 VENDOR NPC: 250982 (Dethelin) Pre Midnight Event Vendor
DVD.ActiveItems[245284] = { decorID = 714, model3D = 4235683, soldBy = {250982}, source = "vendor", noxp = true } -- Silvermoon Wooden Chair
DVD.ActiveItems[245330] = { decorID = 1236, model3D = 6431404, soldBy = {250982}, source = "vendor", noxp = true } -- Enchanted Blood Elven Candelabra
DVD.ActiveItems[251997] = { decorID = 1227, model3D = 6025947, soldBy = {250982}, source = "vendor", noxp = true } -- Sin'dorei Winged Chaise
end

do-- 🏪 VENDOR NPC: 256828 (Dennia Silvertongue) 261231 (Tuuran) 261262 (Gabbi) Roofuse Charity
DVD.ActiveItems[259046] = { decorID = 12246, model3D = 7413969, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Bed
DVD.ActiveItems[259093] = { decorID = 12264, model3D = 7414328, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Dog House Frame
DVD.ActiveItems[259044] = { decorID = 12244, model3D = 7410979, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Water Dish
DVD.ActiveItems[259045] = { decorID = 12245, model3D = 7410980, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Bed and Blanket
DVD.ActiveItems[259094] = { decorID = 12265, model3D = 7414331, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Dog House Elwynn Roof
DVD.ActiveItems[264275] = { decorID = 15547, model3D = 7414329, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Dog House Durotar Roof
DVD.ActiveItems[264276] = { decorID = 15548, model3D = 7414330, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Dog House Eversong Roof
DVD.ActiveItems[264277] = { decorID = 15549, model3D = 7414332, soldBy = {256828, 261231, 261262}, source = "pastcharity", noxp = true } -- Paw Pal Dog House Shadowglen Roof
end

do-- 🏪 VENDOR NPC: 256828 (Dennia Silvertongue) Midnight Pre Purchase
DVD.ActiveItems[244668] = { decorID = 1458, model3D = 6905005, soldBy = {256828}, source = "vendor",  noxp = true } -- Light-Infused Fountain
DVD.ActiveItems[245939] = { decorID = 1894, model3D = 6905006, soldBy = {256828}, source = "vendor",  noxp = true } -- Void-Corrupted Fountain
DVD.ActiveItems[246414] = { decorID = 2231, model3D = 7011540, soldBy = {256828}, source = "vendor",  noxp = true } -- Light-Infused Rotunda
DVD.ActiveItems[248809] = { decorID = 4843, model3D = 7011541, soldBy = {256828}, source = "vendor",  noxp = true } -- Void-Corrupted Rotunda
DVD.ActiveItems[252666] = { decorID = 9149, model3D = 7301966, soldBy = {256828}, source = "vendor",  noxp = true } -- "The High Exarch" Painting
DVD.ActiveItems[252667] = { decorID = 9150, model3D = 7301967, soldBy = {256828}, source = "vendor",  noxp = true } -- "The Ranger of the Void" Painting
DVD.ActiveItems[252668] = { decorID = 9151, model3D = 7301968, soldBy = {256828}, source = "vendor",  noxp = true } -- "The Harbinger" Painting
DVD.ActiveItems[252669] = { decorID = 9152, model3D = 7301965, soldBy = {256828}, source = "vendor",  noxp = true } -- "The Redeemer" Painting
end

do-- 🏪 VENDOR NPC: 256828 (Dennia Silvertongue) 261231 (Tuuran) 261262 (Gabbi) Blizzcon 2026
DVD.ActiveItems[276873] = { decorID = 25936, model3D = 7958104, soldBy = {256828, 261231, 261262}, source = "vendor",  noxp = true }--Perch of the Dawnfire Phoenix,
DVD.ActiveItems[281107] = { decorID = 28350, model3D = 8198437, soldBy = {256828, 261231, 261262}, source = "achievement",  noxp = true } -- BlizzCon Doormat
end

do--🏪 VENDOR NPC: 256828 (Dennia Silvertongue) 261231 (Tuuran) 261262 (Gabbi) Warcraft Forever Collection
DVD.ActiveItems[268339] = { decorID = 19690, model3D = 7643999, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Epic Collection" } -- Shen'dorei Standard
DVD.ActiveItems[268340] = { decorID = 19691, model3D = 7644000, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Epic Collection" } -- Zephras Drapery 
DVD.ActiveItems[268722] = { decorID = 20166, model3D = 7644001, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Epic Collection" } -- Handmade Shen'dorei Pillow
DVD.ActiveItems[268338] = { decorID = 19689, model3D = 7643998, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Epic Collection" } -- Windshaper's Chimes 
DVD.ActiveItems[268337] = { decorID = 19688, model3D = 7643997, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Epic Collection" } -- Windwell 

DVD.ActiveItems[280554] = { decorID = 27076, model3D = 8033790, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Collection Only" } -- Boardcraft Forsaken Figurine 
DVD.ActiveItems[280556] = { decorID = 27077, model3D = 8033791, soldBy = {256828, 261231, 261262}, source = "forever",  noxp = true, note = "Part of the Forever Collection Only" } -- Boardcraft Human Figurine 
end

do -- colorful egg 3	
	DVD.ActiveItems[250794] = { decorID = 7826, model3D = 7096213, noxp = true,  source = "shop"} --"Colorful Shroomic Egg"
	DVD.ActiveItems[250795] = { decorID = 7827, model3D = 7096214, noxp = true,  source = "shop"} --"Colorful Dotted Egg"
	DVD.ActiveItems[250796] = { decorID = 7828, model3D = 7096215, noxp = true,  source = "shop"} --"Colorful Striped Egg"	
end

do --doormats 2	
	DVD.ActiveItems[260727] = { decorID = 14432, model3D = 7476387, noxp = true, source = "shop"} -- "Alliance Doormat", 					
	DVD.ActiveItems[260728] = { decorID = 14433, model3D = 7476388, noxp = true, source = "shop"} -- "Horde Doormat", 
end

do --plusgies 2	
	DVD.ActiveItems[263052] = { decorID = 14838, model3D = 7484415, noxp = true, source = "shop"} -- "Beloved Lion Plushie", 				
	DVD.ActiveItems[263053] = { decorID = 14839, model3D = 7484418, noxp = true, source = "shop"} -- "Beloved Wolf Plushie", 
end

do --lush 13
	DVD.ActiveItems[250793] = { decorID = 7825, model3D = 7096208, noxp = true,  source = "lushshop"} --"Lush Garden Trellis"
	DVD.ActiveItems[252419] = { decorID = 9065, model3D = 7096209, noxp = true,  source = "lushshop"} --"Lush Garden Fungal Basin"
	DVD.ActiveItems[258294] = { decorID = 11940, model3D = 7096211, noxp = true,  source = "lushshop"} --"Lush Garden Gnome-Like Statue"
	DVD.ActiveItems[258567] = { decorID = 12171, model3D = 7096212, noxp = true,  source = "lushshop"} --"Lush Garden Fungal Chair"
	DVD.ActiveItems[253546] = { decorID = 9443, model3D = 7096210, noxp = true,  source = "lushshop"} --"Lush Garden Butterfly Sconce"
	DVD.ActiveItems[258888] = { decorID = 12223, model3D = 7096216, noxp = true, source = "lushshop"} -- "Lush Garden Fungal Fountain", 		
	DVD.ActiveItems[264692] = { decorID = 16039, model3D = 7297702, noxp = true, source = "lushshop"} -- "Lush Garden Window", 					
	DVD.ActiveItems[266070] = { decorID = 17749, model3D = 7448147, noxp = true,  source = "lushshop"} --"Lush Garden Fungal Table",
	DVD.ActiveItems[266162] = { decorID = 17792, model3D = 7297701, noxp = true,  source = "lushshop"} --"Lush Garden Hedge",
	DVD.ActiveItems[266163] = { decorID = 17793, model3D = 7297703, noxp = true,  source = "lushshop"} --"Lush Garden Fungal Planter",
	DVD.ActiveItems[266164] = { decorID = 17794, model3D = 7297705, noxp = true,  source = "lushshop"} --"Lush Garden Fungal Picnic",	
	DVD.ActiveItems[267203] = { decorID = 18794, model3D = 7297700, noxp = true,  source = "lushshop"} --"Lush Garden Stable",
	DVD.ActiveItems[268550] = { decorID = 19848, model3D = 7297706, noxp = true,  source = "lushshop"} --"Lush Garden Rug",	
end

do --spring blossom	18
	DVD.ActiveItems[250797] = { decorID = 7829, model3D = 7096217, noxp = true,  source = "blossomshop"} --"Spring Blossom Ceiling Light"
	DVD.ActiveItems[250798] = { decorID = 7830, model3D = 7096220, noxp = true,  source = "blossomshop"} --"Spring Blossom Shelf"	
	DVD.ActiveItems[253547] = { decorID = 9444, model3D = 7096227, noxp = true,  source = "blossomshop"} --"Spring Blossom Wreath"
	DVD.ActiveItems[254417] = { decorID = 10356, model3D = 7096218, noxp = true,  source = "blossomshop"} --"Spring Blossom Hanging Chair"
	DVD.ActiveItems[258568] = { decorID = 12172, model3D = 7096219, noxp = true, source = "blossomshop"} -- "Spring Blossom Window", 				
	DVD.ActiveItems[258569] = { decorID = 12173, model3D = 7096221, noxp = true, source = "blossomshop"} -- "Spring Blossom Gazebo", 	
	DVD.ActiveItems[263290] = { decorID = 15140, model3D = 7469298, noxp = true, source = "blossomshop"} -- "Spring Blossom Tree", 				
	DVD.ActiveItems[263291] = { decorID = 15141, model3D = 7469299, noxp = true, source = "blossomshop"} -- "Spring Blossom Tree Pond", 	
	DVD.ActiveItems[265555] = { decorID = 16974, model3D = 7297709, noxp = true, source = "blossomshop"} -- "Spring Blossom Stepping Stone", 		
	DVD.ActiveItems[265556] = { decorID = 16975, model3D = 7297711, noxp = true, source = "blossomshop"} -- "Spring Blossom Privacy Screen", 		
	DVD.ActiveItems[265557] = { decorID = 16976, model3D = 7484800, noxp = true, source = "blossomshop"} -- "Spring Blossom Stepping Stone Duo",	
	DVD.ActiveItems[265558] = { decorID = 16977, model3D = 7484801, noxp = true, source = "blossomshop"} -- "Spring Blossom Stepping Stone Trio", 	
	DVD.ActiveItems[265559] = { decorID = 16978, model3D = 7484802, noxp = true, source = "blossomshop"} --"Spring Blossom Stepping Stone Collection"
	DVD.ActiveItems[266068] = { decorID = 17747, model3D = 7297712, noxp = true,  source = "blossomshop"} --"Spring Blossom Tea Set",
	DVD.ActiveItems[266069] = { decorID = 17748, model3D = 7448146, noxp = true,  source = "blossomshop"} --"Spring Blossom Table",
	DVD.ActiveItems[266165] = { decorID = 17795, model3D = 7297708, noxp = true,  source = "blossomshop"} --"Spring Blossom Lantern",
	DVD.ActiveItems[266166] = { decorID = 17796, model3D = 7297710, noxp = true,  source = "blossomshop"} --"Spring Blossom Tranquility Garden",
	DVD.ActiveItems[266167] = { decorID = 17797, model3D = 7484798, noxp = true,  source = "blossomshop"} --"Spring Blossom Pond",
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

