local addonName, dv = ...

dv.quests = { 
{ 
 name = "Amirdrassil", -- 1 note
		expansion = "Dragonflight",
		quests =	{
        { id = 78864, questName = "The Returning", type = "quest", rewardDecor = 251022, model3D = 4756256, title = "Bel'ameth Traveler's Pack", faction = "neutral"},
		{ id = 77283, questName = "A Multi-Front Battle", type = "quest", rewardDecor = 257352, model3D = 4690349, title = "Large Brazier of Elune", faction = "neutral", note = "possibly emerald dream side" },
		}
    },
{    
	    name = "Arcantina",
		expansion = "Midnight",
		quests = {
        { id = 92322, questName = "Timear Foresees a Proof of Demise!", type = "quest", rewardDecor = 253176, model3D = 774267, title = "Ancient Zandalari Ritual Scroll", faction = "neutral"}, --9250    		
		{ id = 92321, questName = "A Frostbitten Tally", type = "quest", rewardDecor = 253598, model3D = 194802, title = "Banner of the Ebon Blade", faction = "neutral"},--9475
		{ id = 92327, questName = "A Generational Moment", type = "quest", rewardDecor = 253174, model3D = 305201, title = "Dried Gilnean Roses", faction = "neutral"},--9248
		{ id = 92323, questName = "Where the Fire Once Burned", type = "quest", rewardDecor = 253175, model3D = 651497, title = "Hyjal Climbing Vine", faction = "neutral"},--9249
		{ id = 92320, questName = "Still Behind Enemy Portals", type = "quest", rewardDecor = 253178, model3D = 1383910, title = "Inactive Filigree Moon Lamp", faction = "neutral"},--9252
		{ id = 92326, questName = "The Fragrance of the Dunes", type = "quest", rewardDecor = 253179, model3D = 1611709, title = "Ornamental Proudmoore Anchor", faction = "neutral"},--9253
		{ id = 92324, questName = "Uncrowned's Cold Case", type = "quest", rewardDecor = 253177, model3D = 1327768, title = "Pylon Fragment", faction = "neutral"},--9251
		{ id = 92319, questName = "A Favor to Axe", type = "quest", rewardDecor = 253542, model3D = 874421, title = "Scarred Orcish Spear", faction = "neutral"},--9439
		{ id = 92325, questName = "Hellscream's Heritage", type = "quest", rewardDecor = 253544, model3D = 985164, title = "Weathered History of the Warchiefs", faction = "neutral"}, --9441
		}
    },	
{ 
 name = "Argus", 
		expansion = "Legion",
		quests =	{
        { id = 47691, questName = "A Non-Prophet Organization", type = "quest", rewardDecor = 245422, model3D = 979926, title = "Draenic Bookcase", faction = "neutral" },
        { id = 44004, questName = "Bringer of the Light", type = "quest", rewardDecor = 251480, model3D = 902396, title = "Draenic Wooden Wall Shelf", faction = "neutral"},
		}
    },
{ 
 name = "Azsuna", 
		expansion = "Legion",
		quests =	{
        { id = 41143, questName = "Mglrgrs Of Our Grmlgrlr", type = "quest", rewardDecor = 258222, model3D = 1091599, title = "Shellscale Standard", faction = "neutral"},
        { id = 37470, questName = "The Head of the Snake", type = "quest", rewardDecor = 246864, model3D = 4298560, title = "Tome of the Lost Dragon", faction = "neutral"},
		}
    },
{ 
 name = "Blackrock Depths", -- 1 note
		expansion = "Classic",
		quests =	{
		{ id = 7604, questName = "A Binding Contract", type = "quest", rewardDecor = 256673, model3D = 953668, title = "Stormwind Forge", faction = "neutral", note = "purchase a sulfuron ingot" },
		}
    },
{ 
 name = "Blasted Lands", -- 2 notes
		expansion = "Cataclysm",
		quests =	{
		{ id = 25720, questName = "The Downfall of Marl Wormthorn", type = "quest", rewardDecor = 244777, model3D = 304416, title = "Surwich Peddler's Wagon", faction = "alliance", note = "actual reward quest" },	
		{ id = 26184, questName = "Wormthorn's Dream", type = "quest", rewardDecor = 244777,  vendorDisplayID = 32798, title = "Mayor Charlton Connisport", faction = "alliance", note = "Starts quest chain to buy item" },
		}
    },	
{ 
 name = "Borean Tundra", -- 2 notes
		expansion = "Wrath of the Lich King",
		quests =	{
	  { id = 11559, questName = "Winterfin Commerce", type = "quest", rewardDecor = 258220,  vendorDisplayID = 4920, title = "Ahlurglgr", faction = "neutral", note = "unlocks vendor to buy item" },
	  { id = 11566, questName = "Surrender... Not!", type = "quest", rewardDecor = 258220, model3D = 1091581, title = "Murloc Driftwood Hut", faction = "neutral", note = "actual reward quest" },
		}
    },
{ 
 name = "Burning Steppes", 
		expansion = "Classic",
		quests =	{
        { id = 28183, questName = "Return to Keeshan", type = "quest", rewardDecor = 256331, model3D = 7385423, title = "Shadowforge Lamppost", faction = "alliance" },
		}
    },
{ 
 name = "Dalaran", -- 1 note
		expansion = "Midnight",
		quests =	{
        { id = 92322, questName = "Timear Foresees a Proof of Demise!", type = "quest", rewardDecor = 253176, model3D = 774267, title = "Ancient Zandalari Ritual Scroll", faction = "neutral"}, --9250
        { id = 13103, questName = "Cheese for Glowergold", type = "quest", rewardDecor = 258145, model3D = 6051297, title = "Eversong Party Platter", faction = "neutral", note = "cooking daily" },
		}
    },
{ 
 name = "Dornogal",  -- 1 note
		expansion = "The War Within",
		quests =	{
        { id = 92580, questName = "Spare A Chair", type = "quest", rewardDecor = 246487, model3D = 6699745, title = "Gnomish Tesla Coil", faction = "neutral"  },
        { id = 92572, questName = "Furniture Favor", type = "quest", rewardDecor = 253173, model3D = 7262874, title = "Meadery Storage Barrel", faction = "neutral"  },
        { id = 92577, questName = "Dreamy Inspiration", type = "quest", rewardDecor = 245259, model3D = 1096761, title = "Small Val'sharah Bookcase", faction = "neutral" },
        { id = 92581, questName = "Last Light", type = "quest", vendorDisplayID = 95785, title = "Frederick the Fabulous", faction = "neutral", note = "unlocks secret vendor to loot item"},
        { id = 92578, questName = "Draconic Decor", type = "quest", rewardDecor = 248116, model3D = 4290181, title = "Valdrakken Chandelier", faction = "neutral"   },
		{ id = 79530, questName = "Bad Business", type = "quest", rewardDecor = 252756, model3D = 5335168, title = "Stonelight Countertop", faction = "neutral"  },
		}
    },
{ 
 name = "Drustvar", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 51985, questName = "Return to Zuldazar", type = "quest", rewardDecor = 245475, model3D = 2445708, title = "Forsaken Long Table", faction = "horde" },
		}
    },
{ 
 name = "Duskwood", 
		expansion = "Classic",
		quests =	{
        { id = 26754, questName = "Morbent's Bane", type = "quest", rewardDecor = 256905, model3D = 322634, title = "Small Gilnean Table", faction = "alliance"},
        { id = 26760, questName = "Cry For The Moon", type = "quest", rewardDecor = 245624, model3D = 464019, title = "Waning Wood Fence", faction = "alliance"},
		}
    },
{ 
 name = "Elwynn Forest", 
		expansion = "Classic",
		quests =	{
        { id = 114, questName = "The Escape", type = "quest", rewardDecor = 253527, model3D = 936454, title = "Goldshire Wardrobe", faction = "alliance"},
        { id = 60, questName = "Kobold Candles", type = "quest", rewardDecor = 248938, model3D = 960094, title = "Hooded Iron Lantern", faction = "alliance" },
		}
    },
{ 
 name = "Eversong Woods", 
		expansion = "Midnight",
		quests =	{
		{ id = 90493, questName = "The Heart of Tranquillien", type = "quest", rewardDecor = 253485, model3D = 6036095, title = "Sin'dorei Honor Stone", faction = "neutral"},--1159
		{ id = 90907, questName = "The First to Know", type = "quest", rewardDecor = 244783, model3D = 6856603, title = "Majestic Lightwood Table", faction = "neutral"},--1489
		{ id = 86741, questName = "Lightbloom Looming", type = "quest", rewardDecor = 245992, model3D = 6985813, title = "Ornate Silvermoon Candelabra", faction = "neutral"},--1908
		{ id = 92025, questName = "Flowers for Amalthea", type = "quest", rewardDecor = 257418, model3D = 6210870, title = "Ornate Sin'dorei Sconce", faction = "neutral"},--11499
		}
    },
{ 
 name = "Felwood", 
		expansion = "Classic",
		quests =	{
        { id = 28337, questName = "The Shredders of Irontree", type = "quest", rewardDecor = 256903, model3D = 304626, title = "Gilnean Banded Crate", faction = "alliance"},--11301
		}
    },
{ 
 name = "Frostwall", 
		expansion = "Warlord of Draenor",
		quests =	{
        { id = 33527, questName = "Last Steps", type = "quest", rewardDecor = 245438, model3D = 971699, title = "Frostwolf Bookcase", faction = "horde" },
        { id = 36614, questName = "My Very Own Fortress", type = "quest", rewardDecor = 244315, model3D = 979433, title = "Orcish Warlord's Planning Table", faction = "horde" },
        { id = 33470, questName = "Pool of Visions", type = "quest", rewardDecor = 244320, model3D = 996200, title = "Youngling's Courser Toys", faction = "horde"},
		}
    },
{ 
 name = "Grizzly Hills", 
		expansion = "Wrath of the Lich King",
		quests =	{
        { id = 12227, questName = "Doing Your Duty", type = "quest", rewardDecor = 248622, model3D = 1048173, title = "Wooden Outhouse", faction = "alliance" },
		}
    },
{ 
 name = "Harandar", 
		expansion = "Midnight",
		quests =	{
		{ id = 86851, questName = "The Foundation of Aln", type = "quest", rewardDecor = 266259, model3D = 6310381, title = "Altar of the Shul'ka", faction = "neutral" },--17886
		{ id = 88994, questName = "The Cauldron of Echoes", type = "quest", rewardDecor = 263315, model3D = 5163359, title = "Bubbling Haranir Cauldron", faction = "neutral" },--15155
		{ id = 86861, questName = "Herding Manifestations", type = "quest", rewardDecor = 252045, model3D = 6225718, title = "Fungal Pergola", faction = "neutral" },--8993
		{ id = 88997, questName = "Russula's Outreach", type = "quest", rewardDecor = 262906, model3D = 6310371, title = "Harandar Anvil", faction = "neutral" },--14799
		{ id = 91589, questName = "Root Dash Delivery", type = "quest", rewardDecor = 264178, model3D = 6326888, title = "Harandar Charcuterie Board", faction = "neutral" },--15463
		{ id = 88995, questName = "Aln'hara's Bloom", type = "quest", rewardDecor = 263196, model3D = 6252873, title = "Harandar Glowvine Lantern", faction = "neutral" },--14968
		{ id = 86956, questName = "The Traveling Flowers", type = "quest", rewardDecor = 262614, model3D = 6796710, title = "Harandar Runestone", faction = "neutral" },--14639
		{ id = 88996, questName = "The Echoless Flame", type = "quest", rewardDecor = 264262, model3D = 6252870, title = "Haranir Whistling Arrow", faction = "neutral" },--15497
		--{ id = 12227, questName = "Root of the World", type = "quest", rewardDecor = 263041, model3D = 6252867, title = "Replica Root of the World", faction = "neutral" },--14827
		--{ id = 12227, questName = "Sky's Hope", type = "quest", rewardDecor = 253443, model3D = 6796713, title = "Replica Sky's Hope", faction = "neutral" },--1080
		{ id = 88993, questName = "Wey'nan's Ward", type = "quest", rewardDecor = 263037, model3D = 4732015, title = "Replica Wey'nan's Ward", faction = "neutral" },--14823
		{ id = 86866, questName = "Can We Heal This?", type = "quest", rewardDecor = 254319, model3D = 6225721, title = "Root-Woven Door", faction = "neutral" },--10327
		{ id = 86891, questName = "A Last Resort", type = "quest", rewardDecor = 254878, model3D = 6225720, title = "Root-Woven Window", faction = "neutral" },--10778
		{ id = 86911, questName = "Echoes and Memories", type = "quest", rewardDecor = 246415, model3D = 6326881, title = "Ruddy Haranir Pigment Bowl", faction = "neutral" },--2232
		{ id = 86896, questName = "Light Finds a Way", type = "quest", rewardDecor = 247234, model3D = 6225702, title = "Rustic Harandar Planter", faction = "neutral" },--2605
		{ id = 86867, questName = "Into the Lightbloom", type = "quest", rewardDecor = 253467, model3D = 6055100, title = "Rutaani Sporepod", faction = "neutral" },--1147
		{ id = 86857, questName = "Descent into the Rift", type = "quest", rewardDecor = 246407, model3D = 6326912, title = "Stoppered Spring Water Gourd", faction = "neutral" },--2224
		{ id = 86973, questName = "Halting Harm in Har'mara", type = "quest", rewardDecor = 245535, model3D = 6310382, title = "Sturdy Haranir Handcart", faction = "neutral" },--1726
		{ id = 90834, questName = "From this Point Forward", type = "quest", rewardDecor = 263020, model3D = 4732018, title = "Ward of the Shul'ka", faction = "neutral" },--14809
		}
    },	
{ 
 name = "Highmountain", 
		expansion = "Legion",
		quests =	{
        { id = 40230, questName = "Oh, the Clawdacity!", type = "quest", rewardDecor = 258221, model3D = 1091587, title = "Driftwood Junk Pile", faction = "neutral" },
        { id = 39487, questName = "Crystal Fury", type = "quest", rewardDecor = 264477, model3D = 1253823, title = "Thunder Totem Mailbox", faction = "neutral" },--15741
        { id = 39496, questName = "The Flow of the River", type = "quest", rewardDecor = 245409, model3D = 6877680, title = "Dried Whitewash Corn", faction = "neutral" },        
        { id = 39426, questName = "Blood Debt", type = "quest", rewardDecor = 257722, model3D = 1255418, title = "Hanging Arrow Kite", faction = "neutral"  },
        { id = 39387, questName = "The Skies of Highmountain", type = "quest", rewardDecor = 257401, model3D = 1255331, title = "Skyhorn Banner", faction = "neutral" },
        { id = 39305, questName = "Empty Nest", type = "quest", rewardDecor = 257723, model3D = 1255422, title = "Skyhorn Eagle Kite", faction = "neutral" },	
        { id = 39992, questName = "Huln's War - The Nathrezim", type = "quest", rewardDecor = 257397, model3D = 1345313, title = "Tauren Storyteller's Frame", faction = "neutral"  },
        { id = 39780, questName = "The Underking", type = "quest", rewardDecor = 245461, model3D = 1305130, title = "Tauren Vertical Windmill", faction = "neutral"  },
        { id = 39614, questName = "Fish Out of Water", type = "quest", rewardDecor = 245457, model3D = 1323065, title = "Riverbend Netting", faction = "neutral" },
        { id = 42590, questName = "Moozy's Reunion", type = "quest", rewardDecor = 245453, model3D = 1322950, title = "Whitewash River Basket", faction = "neutral" },
        { id = 42622, questName = "Ceremonial Drums", type = "quest", rewardDecor = 245405, model3D = 6711671, title = "Large Highmountain Drum", faction = "neutral" },
        { id = 39579, questName = "The Backdoor", type = "quest", rewardDecor = 245456, model3D = 1253406, title = "Warbrave's Brazier", faction = "neutral"  },
        { id = 39772, questName = "Can't Hold a Candle To You", type = "quest", rewardDecor = 260698, model3D = 1255019, title = "Kobold Trassure Pile", faction = "neutral" },		
		}
    },
{ 
 name = "Isle of Dorn", 
		expansion = "The War Within",
		quests =	{
        { id = 79565, questName = "Janky Candles", type = "quest", rewardDecor = 258267, model3D = 5169960, title = "Candle-Festooned Wooden Awning", faction = "neutral"},
        { id = 82895, questName = "The Weight of Duty", type = "quest", rewardDecor = 253034, model3D = 4860713, title = "Fallside Lantern", faction = "neutral"}, 
        { id = 78999, questName = "Heart of a Hero", type = "quest", rewardDecor = 253021, model3D = 4896177, title = "Freywold Bench", faction = "neutral" },
        { id = 78759, questName = "To Wake a Giant", type = "quest", rewardDecor = 253166, model3D = 4906199, title = "Freywold Fountain", faction = "neutral" },
        { id = 79703, questName = "Hope, An Anomaly", type = "quest", rewardDecor = 253035, model3D = 4896174, title = "Freywold Seat", faction = "neutral"  }, 		
		}
    },
{ 
 name = "Kun-Lai Summit", 
		expansion = "Mists of Pandaria",
		quests =	{
        { id = 30612, questName = "The Leader Hozen", type = "quest", rewardDecor = 264349, model3D = 7508746, title = "Kun-Lai Lacquered Rickshaw", faction = "neutral"},
        { id = 32816, questName = "Path of the Last Emperor", type = "quest", rewardDecor = 247858, model3D = 531955, title = "Shaohao Ceremonial Bell", faction = "neutral"},
		}
    },
{ 
 name = "Loch Modan", 
		expansion = "Classic",
		quests =	{
        { id = 26868, questName = "Axis of Awful", type = "quest", rewardDecor = 246422, model3D = 197430, title = "Thelsamar Hanging Lantern", faction = "alliance"},
		}
    },
{ 
 name = "Lunarfall",
		expansion = "Warlords of Draenor",
		quests =	{
        { id = 36615, questName = "My Very Own Castle", type = "quest", rewardDecor = 248800, model3D = 969975, title = "Architect's Drafting Table", faction = "alliance"},
        { id = 36592, questName = "Bigger is Better", type = "quest", rewardDecor = 248661, model3D = 949629,  title = "Northshire Scribe's Desk", faction = "alliance"},
        { id = 35176, questName = "Keeping it Together", type = "quest", rewardDecor = 248810, model3D = 7151868, title = "Rough Wooden Chair", faction = "alliance"},
        { id = 36404, questName = "Clearing the Garden", type = "quest", rewardDecor = 248334, model3D = 7571145, title = "Stormwind Wooden Bench", faction = "alliance"},
        { id = 34192, questName = "Things Are Not Goren Our Way", type = "quest", rewardDecor = 248660, model3D = 943720,  title = "Stormwind Workbench", faction = "alliance" },
        { id = 34586, questName = "Establish Your Garrison", type = "quest", rewardDecor = 248799, model3D = 950767,  title = "Wooden Storage Crate", faction = "alliance"},		
        { id = 36202, questName = "Anglin' In Our Garrison", type = "quest", rewardDecor = 248335, model3D = 953802, title = "Stormwind Wooden Stool", faction = "alliance"},        		
		}
    },
{ 
 name = "Mechagon", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 55736, questName = "Welcome to the Resistance", type = "quest", rewardDecor = 246703, model3D = 1842930, title = "Double-Sprocket Table", faction = "neutral"},
		}
    },
{ 
 name = "Nagrand", 
		expansion = "Warlords of Draenor",
		quests =	{
        { id = 35396, questName = "The Dark Heart of Oshu'gun", type = "quest", rewardDecor = 245425, model3D = 917996, title = "Hanging Draenethyst Light", faction = "alliance"},
		}
    },
{ 
 name = "Nazmir", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 50808, questName = "Halting the Empire's Fall", type = "quest", rewardDecor = 245491, model3D = 1661034, title = "Bwonsamdi's Golden Gong", faction = "horde" },
        { id = 47188, questName = "The Aid of the Loa", type = "quest", rewardDecor = 245488, model3D = 1590851, title = "Zandalari Rickshaw", faction = "horde" },
        { id = 47250, questName = "We'll Meet Again", type = "quest", rewardDecor = 245489, model3D = 1597479, title = "Zuldazar Stool", faction = "horde"},
		}
    },
{ 
 name = "Northshire", 
		expansion = "Classic",
		quests =	{
        { id = 54, questName = "Report to Goldshire", type = "quest", rewardDecor = 248798, model3D = 950755, title = "Northshire Barrel", faction = "alliance"},
        { id = 26390, questName = "Ending the Invasion!", type = "quest", rewardDecor = 248621, model3D = 1004965, title = "Stormwind Arched Trellis", faction = "alliance"},
		}
    },
{ 
 name = "Race Locked",  -- 1 note
		expansion = "Race Locked",
		quests =	{
        { id = 53720, questName = "Allegiance of Kul Tiras", type = "quest", rewardDecor = 252403, model3D = 1852975, title = "Admiral's Bed", faction = "alliance", note = "Kul Tiran Only"},
		{ id = 53566, questName = "Dark Iron Dwarves", type = "quest", rewardDecor = 245427, model3D = 1019061, title = "Dark Iron Expedition Tent", faction = "alliance", note = "Dark Iron Dwarf Only" },
		{id = 76213, questName = "Honor of the Goddess", type = "quest", rewardDecor = 248401, model3D = 4756262, title = "Ornamental Kaldorei Glaive", faction = "alliance", note = "Night Elf Only"},
		{ id = 26397, questName = "Walk With The Earth Mother", questName = "Walk With The Earth Mother", type = "quest", rewardDecor = 243335, model3D = 6711674, title = "Tauren Bluff Rug", faction = "horde", note = "Regular Tauren Only" },
		{ id = 72515, questName = "Augmenting a Dragon", type = "quest", rewardDecor = 249549, model3D = 4528488, title = "Draconic Crafter's Table", faction = "neutral", note = "Evoker Only" },
		{ id = 24675, questName = "Last Meal", type = "quest", rewardDecor = 245518, model3D = 305584, title = "Worgen's Chicken Coop", faction = "alliance", note = "worgen locked"},
		}
    },	
{ 
 name = "Ruins of Gilneas", 
		expansion = "Cataclysm",
		quests =	{
        { id = 14402, questName = "Ready to Go", type = "quest", rewardDecor = 245620, model3D = 321660, title = "Little Wolf's Loo", faction = "alliance" },
		}
    },
{ 
 name = "Searing Gorge", 
		expansion = "Classic",
		quests =	{
        { id = 28064, questName = "Welcome to the Brotherhood", type = "quest", rewardDecor = 246409, model3D = 197155, title = "Shadowforge Grinding Wheel", faction = "neutral"},
        { id = 28035, questName = "The Mountain-Lord's Support", type = "quest", rewardDecor = 245333, model3D = 6877809, title = "Shadowforge Wooden Box", faction = "neutral" },
		}
    },
{ 
 name = "Shadowmoon Valley", 
		expansion = "Warlords of Draenor",
		quests =	{
        { id = 34792, questName = "The Traitor's True Name", type = "quest", rewardDecor = 251548, model3D = 916279,  title = "Draenic Fence", faction = "alliance"},
        { id = 36169, questName = "The Trial of Champions", type = "quest", rewardDecor = 251477, model3D = 875146, title = "Draenic Wooden Table", faction = "alliance" },
        { id = 33256, questName = "The Defense of Karabor", type = "quest", rewardDecor = 251654, model3D = 7273284, title = "Large Karabor Fountain", faction = "alliance" },
		{ id = 37322, questName = "The Prophet's Final Message", type = "quest", rewardDecor = 251549, model3D = 944218, title = "Emblem of the Naaru's Blessing", faction = "alliance"},
		{ id = 35196, questName = "Forging Ahead", type = "quest", rewardDecor = 251478, model3D = 875150, title = "Square Draenic Table", faction = "alliance" },
		{ id = 36685, questName = "Assault on the Heart of Shattrath", type = "quest", rewardDecor = 251547, model3D = 915354, title = "Draenei Farmer's Trellis", faction = "alliance"},
        { id = 38201, questName = "Missive: Assault on Shattrath Harbor", type = "quest", rewardDecor = 241043, model3D = 875378, title = "Elodor Barrel", faction = "alliance"},
		}
    },
{ 
 name = "Silverpine Forest", 
		expansion = "Classic",
		quests =	{
        { id = 27098, questName = "Lordaeron", type = "quest", rewardDecor = 245504, model3D = 397900, title = "Lordaeron Fence", faction = "horde"},
        { id = 27550, questName = "Pyrewood's Fall", type = "quest", rewardDecor = 257412, model3D = 304495, title = "Stoppered Gilnean Barrel", faction = "horde"},
		}
    },
{ 
 name = "Silvermoon City", 
		expansion = "Midnight",
		quests =	{
        { id = 86735, questName = "Paved in Ash", type = "quest", rewardDecor = 263231, model3D = 6050876, title = "Silvermoon Curio Shelves", faction = "neutral" },--15062
		}
    },	
{ 
 name = "Spires of Arak", 
		expansion = "Warlords of Draenor",
		quests =	{
        { id = 35704, questName = "When All Is Aligned", type = "quest", rewardDecor = 258745, model3D = 7277023, title = "High Arakkoan Library Shelf", faction = "neutral"},
        { id = 35273, questName = "Hot Seat", type = "quest", rewardDecor = 258748, model3D = 7277026, title = "\"Rising Glory of Rukhmar\" Statue", faction = "neutral" },
        { id = 35896, questName = "The Avatar of Terokk", type = "quest", rewardDecor = 258749, model3D = 1113349, title = "Uncorrupted Eye of Terokk", faction = "neutral"  },
        { id = 35671, questName = "A Gathering of Shadows", type = "quest", rewardDecor = 258741, model3D = 968336, title = "Writings of Reshad the Outcast", faction = "neutral"},
		}
    },
{ 
 name = "Stormheim ", 
		expansion = "Legion",
		quests =	{
        { id = 38882, questName = "A New Life for Undeath", type = "quest", rewardDecor = 245411, model3D = 6431407, title = "Dark Ship's Lantern", faction = "horde"},
        { id = 39801, questName = "The Splintered Fleet", type = "quest", rewardDecor = 253251, model3D = 1598111, title = "Blightfire Candle", faction = "horde"},--durataur		
		}
    },	
{ 
 name = "Stormsong Valley", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 51401, questName = "Carry On", type = "quest", rewardDecor = 252395, model3D = 1709395, title = "Brennadam Coop", faction = "alliance"},
        { id = 50611, questName = "Storm's Vengeance", type = "quest", rewardDecor = 252655, model3D = 7301013, title = "Copper Tidesage's Sconce", faction = "alliance" },
        { id = 52122, questName = "To Be Forsaken", type = "quest", rewardDecor = 245469, model3D = 2353882, title = "Lordaeron Lantern", faction = "horde" },
        { id = 51986, questName = "Return to Zuldazar", type = "quest", rewardDecor = 245473, model3D = 2341256, title = "Forsaken Studded Table", faction = "horde" },
        { id = 50783, questName = "The Abyssal Council", type = "quest", rewardDecor = 245984, model3D = 6988296, title = "Sagehold Window", faction = "alliance"},		
		}
    },
{ 
 name = "Stormwind City",  
		expansion = "Classic",
		quests =	{
        { id = 543, questName = "The Perenolde Tiara", type = "quest", rewardDecor = 248662, model3D = 950140, title = "Jewelcrafter's Tent", faction = "alliance" },
        { id = 59583, questName = "Welcome to Stormwind", type = "quest", rewardDecor = 248336, model3D = 953804, title = "Stormwind Wooden Table", faction = "alliance"},        		
		}
    },
{ 
 name = "Suramar", 
		expansion = "Legion",
		quests =	{
        { id = 44052, questName = "And They Will Tremble", type = "quest", rewardDecor = 247914, model3D = 1361709, title = "Covered Ornate Suramar Table", faction = "neutral" }, 
        { id = 41915, questName = "The Master's Legacy", type = "quest", rewardDecor = 247917, model3D = 1361714, title = "Covered Small Suramar Table", faction = "neutral" },  
        { id = 44955, questName = "Visitor in Shal'Aran", type = "quest", rewardDecor = 245558, model3D = 6924250, title = "Elaborate Suramar Window", faction = "neutral" },
        { id = 40321, questName = "Feathersong's Redemption", type = "quest", rewardDecor = 245701, model3D = 1096883, title = "Elven Round Table", faction = "neutral" },		
        { id = 42489, questName = "Thalyssra's Drawers", type = "quest", rewardDecor = 248009, model3D = 1309274, title = "Suramar Window", faction = "neutral" },
        { id = 44756, questName = "Sign of the Dusk Lily", type = "quest", rewardDecor = 247842, model3D = 1352412, title = "Nightborne Merchant's Stall", faction = "neutral" },
        { id = 43318, questName = "Ly'leth's Champion", type = "quest", rewardDecor = 247911, model3D = 1361686, title = "Shal'dorei Seat", faction = "neutral" },		
		}
    },
{ 
 name = "Talador", 
		expansion = "Warlords of Draenor",
		quests =	{
        { id = 35685, questName = "Socrethar's Demise", type = "quest", rewardDecor = 251653, model3D = 7273283, title = "Draenethyst Lamppost", faction = "alliance"},
        { id = 34099, questName = "The Battle for Shattrath", type = "quest", rewardDecor = 251640, model3D = 942422, title = "Draenic Forge", faction = "alliance"},
        { id = 33582, questName = "Kura's Vengeance", type = "quest", rewardDecor = 258742, model3D = 968424, title = "Scroll of the Adherent", faction = "neutral"},
		}
    },
{ 
 name = "Thaldraszus", 
		expansion = "Dragonflight",
		quests =	{
        { id = 72935, questName = "Archives Return", type = "quest", rewardDecor = 248651, model3D = 7141928, title = "Draconic Memorial Stone", faction = "neutral" },
        { id = 70745, questName = "Enforced Relaxation", type = "quest", rewardDecor = 256429, model3D = 3952854, title = "Valdrakken Lamppost", faction = "neutral" },
		}
    },
{ 
 name = "The Azure Span", 
		expansion = "Dragonflight",
		quests =	{
        { id = 76597, questName = "On New Wings", type = "quest", rewardDecor = 250912, model3D = 6892651, title = "Draconic Crafter's Forge", faction = "neutral" },
        { id = 67047, questName = "Warm Away These Shivers", type = "quest", rewardDecor = 246706, model3D = 4201172, title = "Elegant Dracthyr's Tea Cup", faction = "neutral" },
        { id = 71097, questName = "A Helping Claw", type = "quest", rewardDecor = 248653, model3D = 7141933, title = "Valdrakken Stone Stool", faction = "neutral"  },
		}
    },
{ 
 name = "The Great Sea", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 52978, questName = "With Prince in Tow", type = "quest", rewardDecor = 245470, model3D = 2470997, title = "Lordaeron Hanging Lantern", faction = "horde"},
		}
    },
{ 
 name = "The Jade Forest", 
		expansion = "Mists of Pandaria",
		quests =	{
        { id = 30000, questName = "The Jade Serpent", type = "quest", rewardDecor = 264362, model3D = 576300, title = "Golden Pandaren Privacy Screen", faction = "neutral" },
		{ id = 31230, questName = "Welcome to Dawn's Blossom", type = "quest", rewardDecor = 247729, model3D = 519135, title = "Pandaren Stone Lamppost", faction = "neutral" },
		}
    },
{ 
 name = "The Ringing Deeps", 
		expansion = "The War Within",
		quests =	{
		{ id = 82144, questName = "On the Road", type = "quest", rewardDecor = 253040, model3D = 5248936, title = "Coreway Sentinel Lamppost", faction = "neutral" },
        { id = 83160, questName = "Cinderbrew Reserve", type = "quest", rewardDecor = 253172, model3D = 7262833, title = "Gundargaz Grand Keg", faction = "neutral" },
        { id = 78642, questName = "New Candle, New Hope", type = "quest", rewardDecor = 258264, model3D = 5169939, title = "Kobold Candle Trio", faction = "neutral" },
        { id = 79510, questName = "The Wickless Candle", type = "quest", rewardDecor = 258262, model3D = 5169937, title = "Kobold Digger's Chair", faction = "neutral"},
        { id = 80516, questName = "Bump off the Boss", type = "quest", rewardDecor = 258265, model3D = 5169958, title = "Kobold Wagon", faction = "neutral"},
		{ id = 78761, questName = "Into the Machine", type = "quest", rewardDecor = 253020, model3D = 4860701, title = "Earthen Etched Throne", faction = "neutral" },
		}
    },
{ 
 name = "The Waking Shores", 
		expansion = "Dragonflight",
		quests =	{
        { id = 67063, questName = "10,000 Years of Roasting", type = "quest", rewardDecor = 247223, model3D = 7109344, title = "Roast Riverbeast Platter", faction = "neutral" },
		{ id = 66001, questName = "A Last Hope", type = "quest", rewardDecor = 246863, model3D = 4298559, title = "Open Tome of the Dragon's Dedication", faction = "neutral" },
		}
    },
{ 
 name = "Tiragarde Sound", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 55045, questName = "My Brother's Keeper", type = "quest", rewardDecor = 252754, model3D = 1887706, title = "Seaworthy Boralus Bell", faction = "alliance" },
        { id = 53887, questName = "War Marches On", type = "quest", rewardDecor = 252400, model3D = 1852941, title = "Tiragarde Emblem", faction = "alliance"},
        { id = 51984, questName = "Return to Zuldazar", type = "quest", rewardDecor = 245465, model3D = 2341259, title = "Tirisfal Wooden Chair", faction = "horde" },
        { id = 47489, questName = "Stow and Go", type = "quest", rewardDecor = 252406, model3D = 2023436, title = "Green Boralus Market Tent", faction = "alliance"},		
        { id = 48089, questName = "Mountain Sounds", type = "quest", rewardDecor = 252392, model3D = 1602483, title = "Admiral's Chandelier", faction = "alliance"},
        { id = 50972, questName = "Proudmoore's Parley", type = "quest", rewardDecor = 252386, model3D = 1602427, title = "Admiralty's Upholstered Chair", faction = "alliance"},		
		}
    },
{ 
 name = "Twilight Highlands", 
		expansion = "Cataclysm",
		quests =	{
        { id = 28244, questName = "Eye Spy", type = "quest", rewardDecor = 246427, model3D = 391448, title = "Dilapidated Wildhammer Well", faction = "alliance"},
        { id = 28655, questName = "Wild, Wild, Wildhammer Wedding", type = "quest", rewardDecor = 246428, model3D = 392127, title = "Overgrown Wildhammer Fountain", faction = "alliance"},
		}
    },
{ 
 name = "Undermine", 
		expansion = "The War Within",
		quests =	{
        { id = 87297, questName = "Cashing the Check", type = "quest", rewardDecor = 243321, model3D = 5700691, title = "Cartel Head's Schmancy Desk", faction = "neutral"},
		{ id = 86408, questName = "My Hole in the Wall", type = "quest", rewardDecor = 245306, model3D = 5793099, title = "Cozy Four-Pipe Bed", faction = "neutral"},
        { id = 85711, questName = "Unsolicited Feedback", type = "quest", rewardDecor = 245325, model3D = 5689844, title = "Undermine Market Stall", faction = "neutral" },		
        { id = 87008, questName = "Ad-Hoc Wedding Planner", type = "quest", rewardDecor = 245308, model3D = 5793083, title = "\"Elegant\" Lawn Flamingo", faction = "neutral" },
        { id = 84675, questName = "Showdown in the Attic", type = "quest", rewardDecor = 260700, model3D = 5689810, title = "Gob-chanical Trash Heap", faction = "neutral" },
        { id = 83176, questName = "Just a Hunch", type = "quest", rewardDecor = 245310, model3D = 5793102, title = "Reinforced Goblin Umbrella", faction = "neutral"},
        { id = 85780, questName = "Right Where We Want Him", type = "quest", rewardDecor = 245303, model3D = 5900860, title = "Rocket-Unpowered Rocket", faction = "neutral" },		
		}
    },
{ 
 name = "Valdrakken", 
		expansion = "Dragonflight",
		quests =	{
        { id = 70880, questName = "To Cook With Finery", type = "quest", rewardDecor = 248655, model3D = 7141935, title = "Elegant Dracthyr's Tea Set", faction = "neutral" },
		}
    },
{ 
 name = "Valley of the Four Winds", 
		expansion = "Mists of Pandaria",
		quests =	{
        { id = 30526, questName = "Lost and Lonely", type = "quest", rewardDecor = 248663, model3D = 955690, title = "Wooden Doghouse", faction = "neutral" },
		}
    },
{ 
 name = "Val'sharah", 
		expansion = "Legion",
		quests =	{
        { id = 40890, questName = "The Tears of Elune", type = "quest", rewardDecor = 245739, model3D = 1096777, title = "Crescent Moon Lamppost", faction = "neutral"  }, 
        { id = 38663, questName = "The Die is Cast", type = "quest", rewardDecor = 245700, model3D = 7508794, title = "Kaldorei Cushioned Seat", faction = "neutral"  },
        { id = 40573, questName = "The Nightmare Lord", type = "quest", rewardDecor = 245698, model3D = 1096764, title = "Kaldorei Stone Fence", faction = "neutral" },
        { id = 38147, questName = "Entangled Dreams", type = "quest", rewardDecor = 245702, model3D = 1128060, title = "Kaldorei Wall Shelf", faction = "neutral" }, 	
        { id = 42751, questName = "Moon Reaver", type = "quest", rewardDecor = 245258, model3D = 1096759, title = "Val'sharah Bookcase", faction = "neutral" },  
        { id = 39117, questName = "Shriek No More", type = "quest", rewardDecor = 245615, model3D = 6930894, title = "Bradensbrook Smoke Lantern", faction = "neutral" },
        { id = 46107, questName = "Source of the Corruption", type = "quest", rewardDecor = 245616, model3D = 6930897, title = "Bradensbrook Thorned Well", faction = "neutral" },			
		}
    },
{ 
 name = "Voidstorm", 
		expansion = "Midnight",
		quests =	{
		--{ id = 86513, questName = "Face the Tide", type = "quest", rewardDecor = 262351, model3D = 6700982, title = "Ornate Cosmic Rug", faction = "neutral" },--14554
		{ id = 88706, questName = "Nothing Stands Forever", type = "quest", rewardDecor = 264660, model3D = 6701018, title = "Ren'dorei Spired Tent", faction = "neutral" },--15895
		{ id = 86521, questName = "Nexus-Point Xenas: Eclipse", type = "quest", rewardDecor = 262606, model3D = 6700978, title = "Smoldering Energy Forge", faction = "neutral" },--14631
		{ id = 88700, questName = "Two Tons of Metal and Holy Fire", type = "quest", rewardDecor = 262610, model3D = 6701008, title = "Swirling Ritual Pedestal", faction = "alliance" },--14635
		}
    },
{ 
 name = "Vol'dun", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 47874, questName = "Clearing the Fog", type = "quest", rewardDecor = 245417, model3D = 6877803, title = "Akunda the Tapestry", faction = "horde"},
		{ id = 48554, questName = "The Source of the Problem", type = "quest", rewardDecor = 245263, model3D = 1707340, title = "Zocalo Drinks", faction = "horde" },
		}
    },
{ 
 name = "Westfall", 
		expansion = "Classic",
		quests =	{
        { id = 26229, questName = "\"I TAKE Candle!\"", type = "quest", rewardDecor = 248797, model3D = 936393, title = "City Wanderer's Candleholder", faction = "alliance" },
        { id = 26297, questName = "The Dawning of a New Day", type = "quest", rewardDecor = 248801, model3D = 4618938, title = "Stormwind Weapon Rack", faction = "alliance" },
        { id = 26270, questName = "You Have Our Thanks", type = "quest", rewardDecor = 248618, model3D = 949210, title = "Westfall Woven Basket", faction = "alliance"},
		}
    },
{ 
 name = "Zul'Aman", 
		expansion = "Midnight",
		quests =	{
		{ id = 91087, questName = "Reports Returned", type = "quest", rewardDecor = 256928, model3D = 6212436, title = "Banner of the Amani Tribe", faction = "neutral" },--11328
		{ id = 86681, questName = "Den of Nalorakk: A Taste of Vengeance", type = "quest", rewardDecor = 264479, model3D = 6212406, title = "Skyweave Amani Tapestry", faction = "neutral" },--15743, 15744, 15745
		{ id = 86660, questName = "Rescue from the Shadows", type = "quest", rewardDecor = 253469, model3D = 6195750, title = "Ritual-Cursed Sarcophagus", faction = "neutral" },--1148
		{ id = 86693, questName = "De Legend of de Hash'ey", type = "quest", rewardDecor = 255648, model3D = 6195754, title = "Zul'Aman Ancestral Fountain", faction = "neutral" },--10858
		{ id = 86663, questName = "Embers to a Flame", type = "quest", rewardDecor = 16092, model3D = 6075575, title = "Zul'Aman Flame Cradle", faction = "neutral" },--16092
		}
    },	
{ 
 name = "Zuldazar", 
		expansion = "Battle for Azeroth",
		quests =	{
        { id = 46931, questName = "Speaker of the Horde", type = "quest", rewardDecor = 239606, model3D = 2620663, title = "Forsaken Round Rug", faction = "horde" },
        { id = 54992, questName = "To Mechagon!", type = "quest", rewardDecor = 246701, model3D = 1842929, title = "Gnomish Sprocket Table", faction = "horde" },
        { id = 50963, questName = "Of Dark Deeds and Dark Days", type = "quest", rewardDecor = 245485, model3D = 2098556, title = "Golden Zandalari Bed", faction = "horde"},
        { id = 47432, questName = "The Bargain is Struck", type = "quest", rewardDecor = 245486, model3D = 1597478, title = "Tired Troll's Bench", faction = "horde"},
		{ id = 51601, questName ="The Bridgeport Ride", type = "quest", rewardDecor = 245466, model3D = 2341260, title = "Forsaken Spiked Chair", faction = "horde" },
        { id = 47741, questName = "To Sacrifice a Loa", type = "quest", rewardDecor = 245493, model3D = 1888157, title = "Idol of Rezan, Loa of Kings", faction = "horde" },	
		}
    },
}





--[[{
    name = "Founder's Point", 
		expansion = "The War Within",
		quests =	{
        { id = 92991, questName = "Decor Treasure Hunt", decorIds = {2109} },
        { id = 92992, questName = "Decor Treasure Hunt", decorIds = {1772} },
        { id = 92994, questName = "Decor Treasure Hunt", decorIds = {1770} },
        { id = 93009, questName = "Decor Treasure Hunt", decorIds = {2110} },
        { id = 92993, questName = "Decor Treasure Hunt", decorIds = {1771} },
        { id = 92990, questName = "Decor Treasure Hunt", decorIds = {2113} },
        { id = 92999, questName = "Decor Treasure Hunt", decorIds = {1878} },
        { id = 92971, questName = "Decor Treasure Hunt", decorIds = {1994} },
        { id = 92996, questName = "Decor Treasure Hunt", decorIds = {2342} },
        { id = 93004, questName = "Decor Treasure Hunt", decorIds = {1486} },
        { id = 92983, questName = "Decor Treasure Hunt", decorIds = {496} },
        { id = 93002, questName = "Decor Treasure Hunt", decorIds = {1162} },
        { id = 93003, questName = "Decor Treasure Hunt", decorIds = {11719} },
        { id = 93000, questName = "Decor Treasure Hunt", decorIds = {985} },
        { id = 92995, questName = "Decor Treasure Hunt", decorIds = {10860} },
        { id = 93001, questName = "Decor Treasure Hunt", decorIds = {1488} },
        { id = 93007, questName = "Decor Treasure Hunt", decorIds = {9255} },
        { id = 92963, questName = "Decor Treasure Hunt", decorIds = {389} },
        { id = 93005, questName = "Decor Treasure Hunt", decorIds = {994} },
        { id = 92977, questName = "Decor Treasure Hunt", decorIds = {1739} },
        { id = 92980, questName = "Decor Treasure Hunt", decorIds = {1745} },
        { id = 92998, questName = "Decor Treasure Hunt", decorIds = {1992} },
        { id = 92997, questName = "Decor Treasure Hunt", decorIds = {1997} },
        { id = 93008, questName = "Decor Treasure Hunt", decorIds = {80} },
        { id = 92978, questName = "Decor Treasure Hunt", decorIds = {1280} },
        { id = 92989, questName = "Decor Treasure Hunt", decorIds = {9471} },
        { id = 93006, questName = "Decor Treasure Hunt", decorIds = {1153} },
        { id = 92972, questName = "Decor Treasure Hunt", decorIds = {1993} },
        { id = 92973, questName = "Decor Treasure Hunt", decorIds = {1991} },
        { id = 92976, questName = "Decor Treasure Hunt", decorIds = {2099} },
        { id = 92967, questName = "Decor Treasure Hunt", decorIds = {530} },
        { id = 92966, questName = "Decor Treasure Hunt", decorIds = {528} },
        { id = 92968, questName = "Decor Treasure Hunt", decorIds = {529} },
        { id = 92974, questName = "Decor Treasure Hunt", decorIds = {2101} },
        { id = 92975, questName = "Decor Treasure Hunt", decorIds = {2100} },
        { id = 92982, questName = "Decor Treasure Hunt", decorIds = {1435} },
        { id = 92984, questName = "Decor Treasure Hunt", decorIds = {495} },
        { id = 92969, questName = "Decor Treasure Hunt", decorIds = {1122} },
        { id = 92437, questName = "Decor Treasure Hunt", decorIds = {373} },
        { id = 92965, questName = "Decor Treasure Hunt", decorIds = {494} },
        { id = 92962, questName = "Decor Treasure Hunt", decorIds = {378} },
        { id = 92961, questName = "Decor Treasure Hunt", decorIds = {374} },
        { id = 92964, questName = "Decor Treasure Hunt", decorIds = {390} },
        { id = 92970, questName = "Decor Treasure Hunt", decorIds = {2496} },
        { id = 92988, questName = "Decor Treasure Hunt", decorIds = {377} },
        { id = 92979, questName = "Decor Treasure Hunt", decorIds = {1123} },
        { id = 92981, questName = "Decor Treasure Hunt", decorIds = {1738} },
        { id = 92985, questName = "Decor Treasure Hunt", decorIds = {1996} },
        { id = 92986, questName = "Decor Treasure Hunt", decorIds = {726} },
        { id = 92987, questName = "Decor Treasure Hunt", decorIds = {383} },
		}
    },]]
--[[{ 
 name = "Razorwind Shores", 
		expansion = "Thw War Within",
		quests =	{
        { id = 93147, questName = "Decor Treasure Hunt", decorIds = {1163} },
        { id = 93105, questName = "Decor Treasure Hunt", decorIds = {2549} },
        { id = 93084, questName = "Decor Treasure Hunt", decorIds = {1737} },
        { id = 93148, questName = "Decor Treasure Hunt", decorIds = {1356} },
        { id = 93151, questName = "Decor Treasure Hunt", decorIds = {11721} },
        { id = 93141, questName = "Decor Treasure Hunt", decorIds = {8917} },
        { id = 93143, questName = "Decor Treasure Hunt", decorIds = {984} },
        { id = 93149, questName = "Decor Treasure Hunt", decorIds = {1329} },
        { id = 93150, questName = "Decor Treasure Hunt", decorIds = {987} },
        { id = 93108, questName = "Decor Treasure Hunt", decorIds = {8907} },
        { id = 93091, questName = "Decor Treasure Hunt", decorIds = {1977} },
        { id = 93104, questName = "Decor Treasure Hunt", decorIds = {2546} },
        { id = 93102, questName = "Decor Treasure Hunt", decorIds = {7842} },
        { id = 93078, questName = "Decor Treasure Hunt", decorIds = {1437} },
        { id = 93098, questName = "Decor Treasure Hunt", decorIds = {2088} },
        { id = 93079, questName = "Decor Treasure Hunt", decorIds = {1438} },
        { id = 93080, questName = "Decor Treasure Hunt", decorIds = {1700} },
        { id = 93099, questName = "Decor Treasure Hunt", decorIds = {2093} },
        { id = 93133, questName = "Decor Treasure Hunt", decorIds = {2548} },
        { id = 93134, questName = "Decor Treasure Hunt", decorIds = {4562} },
        { id = 93142, questName = "Decor Treasure Hunt", decorIds = {11720} },
        { id = 93085, questName = "Decor Treasure Hunt", decorIds = {2114} },
        { id = 93109, questName = "Decor Treasure Hunt", decorIds = {1879} },
        { id = 93081, questName = "Decor Treasure Hunt", decorIds = {1723} },
        { id = 93073, questName = "Decor Treasure Hunt", decorIds = {523} },
        { id = 93074, questName = "Decor Treasure Hunt", decorIds = {524} },
        { id = 93088, questName = "Decor Treasure Hunt", decorIds = {2116} },
        { id = 93083, questName = "Decor Treasure Hunt", decorIds = {1736} },
        { id = 93075, questName = "Decor Treasure Hunt", decorIds = {525} },
        { id = 93087, questName = "Decor Treasure Hunt", decorIds = {2115} },
        { id = 93111, questName = "Decor Treasure Hunt", decorIds = {1744} },
        { id = 93115, questName = "Decor Treasure Hunt", decorIds = {2446} },
        { id = 93107, questName = "Decor Treasure Hunt", decorIds = {4386} },
        { id = 93132, questName = "Decor Treasure Hunt", decorIds = {2535} },
        { id = 93082, questName = "Decor Treasure Hunt", decorIds = {1724} },
        { id = 93077, questName = "Decor Treasure Hunt", decorIds = {1436} },
        { id = 93097, questName = "Decor Treasure Hunt", decorIds = {2087} },
        { id = 93100, questName = "Decor Treasure Hunt", decorIds = {2384} },
        { id = 93140, questName = "Decor Treasure Hunt", decorIds = {2104} },
        { id = 93137, questName = "Decor Treasure Hunt", decorIds = {1844} },
        { id = 93136, questName = "Decor Treasure Hunt", decorIds = {1776} },
        { id = 93138, questName = "Decor Treasure Hunt", decorIds = {2105} },
        { id = 93135, questName = "Decor Treasure Hunt", decorIds = {1774} },
        { id = 93139, questName = "Decor Treasure Hunt", decorIds = {2108} },
        { id = 93152, questName = "Decor Treasure Hunt", decorIds = {988} },
        { id = 93106, questName = "Decor Treasure Hunt", decorIds = {2592} },
        { id = 93103, questName = "Decor Treasure Hunt", decorIds = {2098} },
        { id = 93101, questName = "Decor Treasure Hunt", decorIds = {2454} },
        { id = 93110, questName = "Decor Treasure Hunt", decorIds = {81} },
        { id = 93131, questName = "Decor Treasure Hunt", decorIds = {2534} },
		}
    },]]