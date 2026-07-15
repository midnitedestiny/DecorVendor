--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]
local addonName, DVD = ...

DVD.quests = DVD.quests or {}

DVD.quests = { 
{ 
 name = "Amirdrassil",
		quests =	{
        { id = 78864, questName = "The Returning", type = "quest", itemID = 251022, model3D = 4756256, title = "Bel'ameth Traveler's Pack", expansion = "Dragonflight", faction = "neutral"},
		{ id = 77283, questName = "A Multi-Front Battle", type = "quest", itemID = 257352, model3D = 4690349, title = "Large Brazier of Elune", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{    
	    name = "Arcantina",
		quests = {
        { id = 92322, questName = "Timear Foresees a Proof of Demise!", type = "quest", itemID = 253176, model3D = 774267, title = "Ancient Zandalari Ritual Scroll", expansion = "Midnight", faction = "neutral"}, --9250    		
		{ id = 92321, questName = "A Frostbitten Tally", type = "quest", itemID = 253598, model3D = 194802, title = "Banner of the Ebon Blade", expansion = "Midnight", faction = "neutral"},--9475
		{ id = 92327, questName = "A Generational Moment", type = "quest", itemID = 253174, model3D = 305201, title = "Dried Gilnean Roses", expansion = "Midnight", faction = "neutral"},--9248
		{ id = 92323, questName = "Where the Fire Once Burned", type = "quest", itemID = 253175, model3D = 651497, title = "Hyjal Climbing Vine", expansion = "Midnight", faction = "neutral"},--9249
		{ id = 92320, questName = "Still Behind Enemy Portals", type = "quest", itemID = 253178, model3D = 1383910, title = "Inactive Filigree Moon Lamp", expansion = "Midnight", faction = "neutral"},--9252
		{ id = 92326, questName = "The Fragrance of the Dunes", type = "quest", itemID = 253179, model3D = 1611709, title = "Ornamental Proudmoore Anchor", expansion = "Midnight", faction = "neutral"},--9253
		{ id = 92324, questName = "Uncrowned's Cold Case", type = "quest", itemID = 253177, model3D = 1327768, title = "Pylon Fragment", expansion = "Midnight", faction = "neutral"},--9251
		{ id = 92319, questName = "A Favor to Axe", type = "quest", itemID = 253542, model3D = 874421, title = "Scarred Orcish Spear", expansion = "Midnight", faction = "neutral"},--9439
		{ id = 92325, questName = "Hellscream's Heritage", type = "quest", itemID = 253544, model3D = 985164, title = "Weathered History of the Warchiefs", expansion = "Midnight", faction = "neutral"}, --9441
		{ id = 95780, questName = "Hope for the Orphans", type = "quest", itemID = 278038, model3D = 5658299, title = "Arathor Toy Sword", expansion = "Midnight", faction = "neutral"},
		{ id = 95781, questName = "No Wax Like Home", type = "quest", itemID = 278044, model3D = 5503816, title = "Hanging Candles", expansion = "Midnight", faction = "neutral"},
		{ id = 95779, questName = "Moments in a Mug", type = "quest", itemID = 278694, model3D = 526368, title = "Stormstout Hanging Lantern", expansion = "Midnight", faction = "neutral"},
		}
    },	
{ 
 name = "Argus", 
		quests = {
        { id = 47691, questName = "A Non-Prophet Organization", type = "quest", itemID = 245422, model3D = 979926, title = "Draenic Bookcase", expansion = "Legion", faction = "neutral" },
        { id = 44004, questName = "Bringer of the Light", type = "quest", itemID = 251480, model3D = 902396, title = "Draenic Wooden Wall Shelf", expansion = "Legion", faction = "neutral"},
		}
    },
{	
 name = "Azj-Kahet",
		quests = {
        { id = 82141, questName = "To Kill a Queen", type = "quest", itemID = 260583, model3D = 4892782, title = "Arathi Bartender's Shelves", expansion = "The War Within", faction = "neutral" },
		}
    },	
{ 
 name = "Azsuna", 
		quests =	{
        { id = 41143, questName = "Mglrgrs Of Our Grmlgrlr", type = "quest", itemID = 258222, model3D = 1091599, title = "Shellscale Standard", expansion = "Legion", faction = "neutral"},
        { id = 37470, questName = "The Head of the Snake", type = "quest", itemID = 246864, model3D = 4298560, title = "Tome of the Lost Dragon", expansion = "Legion", faction = "neutral"},
		}
    },
{ 
 name = "Blackrock Depths", 
		quests =	{
		{ id = 7604, questName = "A Binding Contract", type = "quest", itemID = 256673, model3D = 953668, title = "Stormwind Forge", expansion = "Classic", faction = "neutral", note = "purchase a sulfuron ingot" },
		}
    },
{ 
 name = "Blasted Lands", -- 2 notes
		quests =	{
		{ id = 25720, questName = "The Downfall of Marl Wormthorn", type = "quest", itemID = 244777, model3D = 304416, title = "Surwich Peddler's Wagon", expansion = "Cataclysm", faction = "alliance", note = "Quest chain to start it  is  with Mayor Charlton Connisport" },	
		--{ id = 26184, questName = "Wormthorn's Dream", type = "quest", itemID = 244777,  vendorDisplayID = 32798, title = "Mayor Charlton Connisport", expansion = "Cataclysm", faction = "alliance", note = "Starts quest chain to buy item" },
		}
    },	
{ 
 name = "Borean Tundra", -- 2 notes
		quests =	{
	  --{ id = 11559, questName = "Winterfin Commerce", type = "quest", itemID = 258220,  vendorDisplayID = 4920, title = "Ahlurglgr", expansion = "Wrath of the Lich King", faction = "neutral", note = "unlocks vendor to buy item" },
	  { id = 11566, questName = "Surrender... Not!", type = "quest", itemID = 258220, model3D = 1091581, title = "Murloc Driftwood Hut", expansion = "Wrath of the Lich King", faction = "neutral", note = "Unlocks after doing Winterfin Commerce" },
		}
    },
{ 
 name = "Burning Steppes", 
		quests =	{
        { id = 28183, questName = "Return to Keeshan", type = "quest", itemID = 256331, model3D = 7385423, title = "Shadowforge Lamppost", expansion = "Cataclysm", faction = "alliance" },
		}
    },
{ 
 name = "Dornogal",  -- 1 note
		quests =	{
        { id = 92580, questName = "Spare A Chair", type = "quest", itemID = 246487, model3D = 6699745, title = "Gnomish Tesla Coil", expansion = "The War Within", faction = "neutral"  },
        { id = 92572, questName = "Furniture Favor", type = "quest", itemID = 253173, model3D = 7262874, title = "Meadery Storage Barrel", expansion = "The War Within", faction = "neutral"  },
        { id = 92577, questName = "Dreamy Inspiration", type = "quest", itemID = 245259, model3D = 1096761, title = "Small Val'sharah Bookcase", expansion = "The War Within", faction = "neutral" },
        { id = 92581, questName = "Last Light", type = "quest", itemID = 247915, model3D = 1361710, title = "Square Suramar Table", expansion = "The War Within", faction = "neutral"},
        { id = 92578, questName = "Draconic Decor", type = "quest", itemID = 248116, model3D = 4290181, title = "Valdrakken Chandelier", expansion = "The War Within", faction = "neutral"   },
		{ id = 79530, questName = "Bad Business", type = "quest", itemID = 252756, model3D = 5335168, title = "Stonelight Countertop", expansion = "The War Within", faction = "neutral"  },
		}
    },
{ 
 name = "Drustvar", 
		quests =	{
        { id = 51985, questName = "Return to Zuldazar", type = "quest", itemID = 245475, model3D = 2445708, title = "Forsaken Long Table", expansion = "Battle for Azeroth", faction = "horde" },
		}
    },
{ 
 name = "Duskwood", 
		quests =	{
        { id = 26754, questName = "Morbent's Bane", type = "quest", itemID = 256905, model3D = 322634, title = "Small Gilnean Table", expansion = "Cataclysm", faction = "alliance"},
        { id = 26760, questName = "Cry For The Moon", type = "quest", itemID = 245624, model3D = 464019, title = "Waning Wood Fence", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Elwynn Forest", 
		quests =	{
        { id = 114, questName = "The Escape", type = "quest", itemID = 253527, model3D = 936454, title = "Goldshire Wardrobe", expansion = "Classic", faction = "alliance"},
        { id = 60, questName = "Kobold Candles", type = "quest", itemID = 248938, model3D = 960094, title = "Hooded Iron Lantern", expansion = "Classic", faction = "alliance" },
		{ id = 54, questName = "Report to Goldshire", type = "quest", itemID = 248798, model3D = 950755, title = "Northshire Barrel", expansion = "Classic", faction = "alliance"},
		}
    },
{ 
 name = "Eversong Woods", 
		quests =	{
		{ id = 90493, questName = "The Heart of Tranquillien", type = "quest", itemID = 253485, model3D = 6036095, title = "Sin'dorei Honor Stone", expansion = "Midnight", faction = "neutral"},--1159
		{ id = 90907, questName = "The First to Know", type = "quest", itemID = 244783, model3D = 6856603, title = "Majestic Lightwood Table", expansion = "Midnight", faction = "neutral"},--1489
		{ id = 86741, questName = "Lightbloom Looming", type = "quest", itemID = 245992, model3D = 6985813, title = "Ornate Silvermoon Candelabra", expansion = "Midnight", faction = "neutral"},--1908
		{ id = 92025, questName = "Flowers for Amalthea", type = "quest", itemID = 257418, model3D = 6210870, title = "Ornate Sin'dorei Sconce", expansion = "Midnight", faction = "neutral"},
		}
    },
{ 
 name = "Felwood", 
		quests =	{
        { id = 28337, questName = "The Shredders of Irontree", type = "quest", itemID = 256903, model3D = 304626, title = "Gilnean Banded Crate", expansion = "Cataclysm", faction = "alliance"},--11301		
		}
    },
{ 
 name = "Frostwall", 
		quests =	{
        { id = 33527, questName = "Last Steps", type = "quest", itemID = 245438, model3D = 971699, title = "Frostwolf Bookcase", expansion = "Warlords of Draenor", faction = "horde" },
        { id = 36614, questName = "My Very Own Fortress", type = "quest", itemID = 244315, model3D = 979433, title = "Orcish Warlords's Planning Table", expansion = "Warlords of Draenor", faction = "horde" },
        { id = 33470, questName = "Pool of Visions", type = "quest", itemID = 244320, model3D = 996200, title = "Youngling's Courser Toys", expansion = "Warlords of Draenor", faction = "horde"},
		}
    },
{ 
 name = "Gilneas", 
		quests =	{
		{ id = 24675, category = "race", questName = "Last Meal", type = "quest", itemID = 245518, model3D = 305584, title = "Worgen's Chicken Coop", expansion = "Cataclysm", faction = "alliance", note = "worgen locked"},
		{ id = 14402, category = "race", questName = "Ready to Go", type = "quest", itemID = 245620, model3D = 321660, title = "Little Wolf's Loo", expansion = "Cataclysm", faction = "alliance", note = "worgen locked" },        
		}
    },	
{ 
 name = "Grizzly Hills", 
		quests =	{
        { id = 12227, questName = "Doing Your Duty", type = "quest", itemID = 248622, model3D = 1048173, title = "Wooden Outhouse", expansion = "Wrath of the Lich King", faction = "alliance" },
		}
    },
{ 
 name = "Harandar", 
		quests =	{
		{ id = 86851, questName = "The Foundation of Aln", type = "quest", itemID = 266259, model3D = 6310381, title = "Altar of the Shul'ka", expansion = "Midnight", faction = "neutral" },--17886
		{ id = 88994, questName = "The Cauldron of Echoes", type = "quest", itemID = 263315, model3D = 5163359, title = "Bubbling Haranir Cauldron", expansion = "Midnight", faction = "neutral" },--15155
		{ id = 86861, questName = "Herding Manifestations", type = "quest", itemID = 252045, model3D = 6225718, title = "Fungal Pergola", expansion = "Midnight", faction = "neutral" },--8993
		{ id = 88997, questName = "Russula's Outreach", type = "quest", itemID = 262906, model3D = 6310371, title = "Harandar Anvil", expansion = "Midnight", faction = "neutral" },--14799
		{ id = 91589, questName = "Root Dash Delivery", type = "quest", itemID = 264178, model3D = 6326888, title = "Harandar Charcuterie Board", expansion = "Midnight", faction = "neutral" },--15463
		{ id = 88995, questName = "Aln'hara's Bloom", type = "quest", itemID = 263196, model3D = 6252873, title = "Harandar Glowvine Lantern", expansion = "Midnight", faction = "neutral" },--14968
		{ id = 86956, questName = "The Traveling Flowers", type = "quest", itemID = 262614, model3D = 6796710, title = "Harandar Runestone", expansion = "Midnight", faction = "neutral" },--14639
		{ id = 88996, questName = "The Echoless Flame", type = "quest", itemID = 264262, model3D = 6252870, title = "Haranir Whistling Arrow", expansion = "Midnight", faction = "neutral" },--15497
		{ id = 12227, questName = "Root of the World", type = "quest", itemID = 263041, model3D = 6252867, title = "Replica Root of the World", expansion = "Midnight", faction = "neutral" },--14827
		{ id = 12227, questName = "Sky's Hope", type = "quest", itemID = 253443, model3D = 6796713, title = "Replica Sky's Hope", expansion = "Midnight", faction = "neutral" },--1080
		{ id = 88993, questName = "Wey'nan's Ward", type = "quest", itemID = 263037, model3D = 4732015, title = "Replica Wey'nan's Ward", expansion = "Midnight", faction = "neutral" },--14823
		{ id = 86866, questName = "Can We Heal This?", type = "quest", itemID = 254319, model3D = 6225721, title = "Root-Woven Door", expansion = "Midnight", faction = "neutral" },--10327
		{ id = 86891, questName = "A Last Resort", type = "quest", itemID = 254878, model3D = 6225720, title = "Root-Woven Window", expansion = "Midnight", faction = "neutral" },--10778
		{ id = 86911, questName = "Echoes and Memories", type = "quest", itemID = 246415, model3D = 6326881, title = "Ruddy Haranir Pigment Bowl", expansion = "Midnight", faction = "neutral" },--2232
		{ id = 86896, questName = "Light Finds a Way", type = "quest", itemID = 247234, model3D = 6225702, title = "Rustic Harandar Planter", expansion = "Midnight", faction = "neutral" },--2605
		{ id = 86867, questName = "Into the Lightbloom", type = "quest", itemID = 253467, model3D = 6055100, title = "Rutaani Sporepod", expansion = "Midnight", faction = "neutral" },--1147
		{ id = 86857, questName = "Descent into the Rift", type = "quest", itemID = 246407, model3D = 6326912, title = "Stoppered Spring Water Gourd", expansion = "Midnight", faction = "neutral" },--2224
		{ id = 86973, questName = "Halting Harm in Har'mara", type = "quest", itemID = 245535, model3D = 6310382, title = "Sturdy Haranir Handcart", expansion = "Midnight", faction = "neutral" },--1726
		{ id = 90834, questName = "From this Point Forward", type = "quest", itemID = 263020, model3D = 4732018, title = "Ward of the Shul'ka", expansion = "Midnight", faction = "neutral" },--14809
		}
    },	
{ 
 name = "Highmountain", 
		quests =	{
        { id = 40230, questName = "Oh, the Clawdacity!", type = "quest", itemID = 258221, model3D = 1091587, title = "Driftwood Junk Pile", expansion = "Legion", faction = "neutral" },
        { id = 39487, questName = "Crystal Fury", type = "quest", itemID = 264477, model3D = 1253823, title = "Thunder Totem Mailbox", expansion = "Legion", faction = "neutral" },--15741
        { id = 39496, questName = "The Flow of the River", type = "quest", itemID = 245409, model3D = 6877680, title = "Dried Whitewash Corn", expansion = "Legion", faction = "neutral" },        
        { id = 39426, questName = "Blood Debt", type = "quest", itemID = 257722, model3D = 1255418, title = "Hanging Arrow Kite", expansion = "Legion", faction = "neutral"  },
        { id = 39387, questName = "The Skies of Highmountain", type = "quest", itemID = 257401, model3D = 1255331, title = "Skyhorn Banner", expansion = "Legion", faction = "neutral" },
        { id = 39305, questName = "Empty Nest", type = "quest", itemID = 257723, model3D = 1255422, title = "Skyhorn Eagle Kite", expansion = "Legion", faction = "neutral" },	
        { id = 39992, questName = "Huln's War - The Nathrezim", type = "quest", itemID = 257397, model3D = 1345313, title = "Tauren Storyteller's Frame", expansion = "Legion", faction = "neutral"  },
        { id = 39780, questName = "The Underking", type = "quest", itemID = 245461, model3D = 1305130, title = "Tauren Vertical Windmill", expansion = "Legion", faction = "neutral"  },
        { id = 39614, questName = "Fish Out of Water", type = "quest", itemID = 245457, model3D = 1323065, title = "Riverbend Netting", expansion = "Legion", faction = "neutral" },
        { id = 42590, questName = "Moozy's Reunion", type = "quest", itemID = 245453, model3D = 1322950, title = "Whitewash River Basket", expansion = "Legion", faction = "neutral" },
        { id = 42622, questName = "Ceremonial Drums", type = "quest", itemID = 245405, model3D = 6711671, title = "Large Highmountain Drum", expansion = "Legion", faction = "neutral" },
        { id = 39579, questName = "The Backdoor", type = "quest", itemID = 245456, model3D = 1253406, title = "Warbrave's Brazier", expansion = "Legion", faction = "neutral"  },
        { id = 39772, questName = "Can't Hold a Candle To You", type = "quest", itemID = 260698, model3D = 1255019, title = "Kobold Trassure Pile", expansion = "Legion", faction = "neutral" },		
		}
    },
{ 
 name = "Isle of Dorn", 
		quests =	{
        { id = 79565, questName = "Janky Candles", type = "quest", itemID = 258267, model3D = 5169960, title = "Candle-Festooned Wooden Awning", expansion = "The War Within", faction = "neutral"},
        { id = 82895, questName = "The Weight of Duty", type = "quest", itemID = 253034, model3D = 4860713, title = "Fallside Lantern", expansion = "The War Within", faction = "neutral"}, 
        { id = 78999, questName = "Heart of a Hero", type = "quest", itemID = 253021, model3D = 4896177, title = "Freywold Bench", expansion = "The War Within", faction = "neutral" },
        { id = 78759, questName = "To Wake a Giant", type = "quest", itemID = 253166, model3D = 4906199, title = "Freywold Fountain", expansion = "The War Within", faction = "neutral" },
        { id = 79703, questName = "Hope, An Anomaly", type = "quest", itemID = 253035, model3D = 4896174, title = "Freywold Seat", expansion = "The War Within", faction = "neutral"  }, 		
		}
    },
{ 
 name = "Kun-Lai Summit", 
		quests =	{
        { id = 30612, questName = "The Leader Hozen", type = "quest", itemID = 264349, model3D = 7508746, title = "Kun-Lai Lacquered Rickshaw", expansion = "Mists of Pandaria", faction = "neutral"},
        { id = 32816, questName = "Path of the Last Emperor", type = "quest", itemID = 247858, model3D = 531955, title = "Shaohao Ceremonial Bell", expansion = "Mists of Pandaria", faction = "neutral"},
		}
    },
{ 
 name = "Loch Modan", 
		quests =	{
        { id = 26868, questName = "Axis of Awful", type = "quest", itemID = 246422, model3D = 197430, title = "Thelsamar Hanging Lantern", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Lunarfall",
		quests =	{
        { id = 36615, questName = "My Very Own Castle", type = "quest", itemID = 248800, model3D = 969975, title = "Architect's Drafting Table", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 36592, questName = "Bigger is Better", type = "quest", itemID = 248661, model3D = 949629,  title = "Northshire Scribe's Desk", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 35176, questName = "Keeping it Together", type = "quest", itemID = 248810, model3D = 7151868, title = "Rough Wooden Chair", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 36404, questName = "Clearing the Garden", type = "quest", itemID = 248334, model3D = 7571145, title = "Stormwind Wooden Bench", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 34192, questName = "Things Are Not Goren Our Way", type = "quest", itemID = 248660, model3D = 943720,  title = "Stormwind Workbench", expansion = "Warlords of Draenor", faction = "alliance" },
        { id = 34586, questName = "Establish Your Garrison", type = "quest", itemID = 248799, model3D = 950767,  title = "Wooden Storage Crate", expansion = "Warlords of Draenor", faction = "alliance"},		
        { id = 36202, questName = "Anglin' In Our Garrison", type = "quest", itemID = 248335, model3D = 953802, title = "Stormwind Wooden Stool", expansion = "Warlords of Draenor", faction = "alliance"},        		
		}
    },
{ 
 name = "Mechagon", 
		quests =	{
        { id = 55736, questName = "Welcome to the Resistance", type = "quest", itemID = 246703, model3D = 1842930, title = "Double-Sprocket Table", expansion = "Battle for Azeroth", faction = "neutral"},
		}
    },
{ 
 name = "Nagrand", 
		quests =	{
        { id = 35396, questName = "The Dark Heart of Oshu'gun", type = "quest", itemID = 245425, model3D = 917996, title = "Hanging Draenethyst Light", expansion = "Warlords of Draenor", faction = "alliance"},
		}
    },
{ 
 name = "Nazmir", 
		quests =	{
        { id = 50808, questName = "Halting the Empire's Fall", type = "quest", itemID = 245491, model3D = 1661034, title = "Bwonsamdi's Golden Gong", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47188, questName = "The Aid of the Loa", type = "quest", itemID = 245488, model3D = 1590851, title = "Zandalari Rickshaw", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47250, questName = "We'll Meet Again", type = "quest", itemID = 245489, model3D = 1597479, title = "Zuldazar Stool", expansion = "Battle for Azeroth", faction = "horde"},
		}
    },
{ 
 name = "Northshire", 
		quests =	{        
        { id = 26390, questName = "Ending the Invasion!", type = "quest", itemID = 248621, model3D = 1004965, title = "Stormwind Arched Trellis", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Orgrimmar", 
		quests =	{        
		{ id = 26397, category = "race", questName = "Walk With The Earth Mother", type = "quest", itemID = 243335, model3D = 6711674, title = "Tauren Bluff Rug", expansion = "Cataclysm", faction = "horde", note = "Regular Tauren Only" },
		}
    },		
{ 
 name = "Searing Gorge", 
		quests =	{
        { id = 28064, questName = "Welcome to the Brotherhood", type = "quest", itemID = 246409, model3D = 197155, title = "Shadowforge Grinding Wheel", expansion = "Cataclysm", faction = "neutral"},
        { id = 28035, questName = "The Mountain-Lord's Support", type = "quest", itemID = 245333, model3D = 6877809, title = "Shadowforge Wooden Box", expansion = "Cataclysm", faction = "neutral" },
		}
    },
{ 
 name = "Shadowmoon Valley", 
		quests =	{
        { id = 34792, questName = "The Traitor's True Name", type = "quest", itemID = 251548, model3D = 916279,  title = "Draenic Fence", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 36169, questName = "The Trial of Champions", type = "quest", itemID = 251477, model3D = 875146, title = "Draenic Wooden Table", expansion = "Warlords of Draenor", faction = "alliance" },
        { id = 33256, questName = "The Defense of Karabor", type = "quest", itemID = 251654, model3D = 7273284, title = "Large Karabor Fountain", expansion = "Warlords of Draenor", faction = "alliance" },
		{ id = 37322, questName = "The Prophet's Final Message", type = "quest", itemID = 251549, model3D = 944218, title = "Emblem of the Naaru's Blessing", expansion = "Warlords of Draenor", faction = "alliance"},
		{ id = 35196, questName = "Forging Ahead", type = "quest", itemID = 251478, model3D = 875150, title = "Square Draenic Table", expansion = "Warlords of Draenor", faction = "alliance" },
		{ id = 36685, questName = "Assault on the Heart of Shattrath", type = "quest", itemID = 251547, model3D = 915354, title = "Draenei Farmer's Trellis", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 38201, questName = "Missive: Assault on Shattrath Harbor", type = "quest", itemID = 241043, model3D = 875378, title = "Elodor Barrel", expansion = "Warlords of Draenor", faction = "alliance"},
		}
    },
{ 
 name = "Silverpine Forest", 
		quests =	{
        { id = 27098, questName = "Lordaeron", type = "quest", itemID = 245504, model3D = 397900, title = "Lordaeron Fence", expansion = "Cataclysm", faction = "horde"},
        { id = 27550, questName = "Pyrewood's Fall", type = "quest", itemID = 257412, model3D = 304495, title = "Stoppered Gilnean Barrel", expansion = "Cataclysm", faction = "horde"},
		}
    },
{ 
 name = "Silvermoon City", 
		quests =	{
        { id = 86735, questName = "Paved in Ash", type = "quest", itemID = 263231, model3D = 6050876, title = "Silvermoon Curio Shelves", expansion = "Midnight", faction = "neutral" },
		}
    },	
{ 
 name = "Spires of Arak", 
		quests =	{
        { id = 35704, questName = "When All Is Aligned", type = "quest", itemID = 258745, model3D = 7277023, title = "High Arakkoan Library Shelf", expansion = "Warlords of Draenor", faction = "neutral"},
        { id = 35273, questName = "Hot Seat", type = "quest", itemID = 258748, model3D = 7277026, title = "\"Rising Glory of Rukhmar\" Statue", expansion = "Warlords of Draenor", faction = "neutral" },
        { id = 35896, questName = "The Avatar of Terokk", type = "quest", itemID = 258749, model3D = 1113349, title = "Uncorrupted Eye of Terokk", expansion = "Warlords of Draenor", faction = "neutral"  },
        { id = 35671, questName = "A Gathering of Shadows", type = "quest", itemID = 258741, model3D = 968336, title = "Writings of Reshad the Outcast", expansion = "Warlords of Draenor", faction = "neutral"},
		}
    },
{ 
 name = "Stormheim ", 
		quests =	{
        { id = 38882, questName = "A New Life for Undeath", type = "quest", itemID = 245411, model3D = 6431407, title = "Dark Ship's Lantern", expansion = "Legion", faction = "horde"},
        { id = 39801, questName = "The Splintered Fleet", type = "quest", itemID = 253251, model3D = 1598111, title = "Blightfire Candle", expansion = "Legion", faction = "horde"},--durataur		
		}
    },	
{ 
 name = "Stormsong Valley", 
		quests =	{
        { id = 51401, questName = "Carry On", type = "quest", itemID = 252395, model3D = 1709395, title = "Brennadam Coop", expansion = "Battle for Azeroth", faction = "alliance"},
        { id = 50611, questName = "Storm's Vengeance", type = "quest", itemID = 252655, model3D = 7301013, title = "Copper Tidesage's Sconce", expansion = "Battle for Azeroth", faction = "alliance" },
        { id = 52122, questName = "To Be Forsaken", type = "quest", itemID = 245469, model3D = 2353882, title = "Lordaeron Lantern", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 51986, questName = "Return to Zuldazar", type = "quest", itemID = 245473, model3D = 2341256, title = "Forsaken Studded Table", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 50783, questName = "The Abyssal Council", type = "quest", itemID = 245984, model3D = 6988296, title = "Sagehold Window", expansion = "Battle for Azeroth", faction = "alliance"},		
		}
    },
{ 
 name = "Stormwind City",  
		quests =	{
        { id = 543, questName = "The Perenolde Tiara", type = "quest", itemID = 248662, model3D = 950140, title = "Jewelcrafter's Tent", expansion = "Classic", faction = "alliance" },
        { id = 59583, questName = "Welcome to Stormwind", type = "quest", itemID = 248336, model3D = 953804, title = "Stormwind Wooden Table", expansion = "Shadowlands", faction = "alliance"},   
		{ id = 76213, category = "race", questName = "Honor of the Goddess", type = "quest", itemID = 248401, model3D = 4756262, title = "Ornamental Kaldorei Glaive", expansion = "Dragonflight", faction = "alliance", note = "Night Elf Only"},
		{ id = 53720, category = "race", questName = "Allegiance of Kul Tiras", type = "quest", itemID = 252403, model3D = 1852975, title = "Admiral's Bed", expansion = "Battle for Azeroth", faction = "alliance", note = "Kul Tiran Only"},
		{ id = 53566, category = "race", questName = "Dark Iron Dwarves", type = "quest", itemID = 245427, model3D = 1019061, title = "Dark Iron Expedition Tent", expansion = "Battle for Azeroth", faction = "alliance", note = "Dark Iron Dwarf Only" },
		}
    },
{ 
 name = "Suramar", 
		quests =	{
        { id = 44052, questName = "And They Will Tremble", type = "quest", itemID = 247914, model3D = 1361709, title = "Covered Ornate Suramar Table", expansion = "Legion", faction = "neutral" }, 
        { id = 41915, questName = "The Master's Legacy", type = "quest", itemID = 247917, model3D = 1361714, title = "Covered Small Suramar Table", expansion = "Legion", faction = "neutral", expansion = "Battle for Azeroth" },  
        { id = 44955, questName = "Visitor in Shal'Aran", type = "quest", itemID = 245558, model3D = 6924250, title = "Elaborate Suramar Window", expansion = "Legion", faction = "neutral" },
        { id = 40321, questName = "Feathersong's Redemption", type = "quest", itemID = 245701, model3D = 1096883, title = "Elven Round Table", expansion = "Legion", faction = "neutral" },		
        { id = 42489, questName = "Thalyssra's Drawers", type = "quest", itemID = 248009, model3D = 1309274, title = "Suramar Window", expansion = "Legion", faction = "neutral", expansion = "Battle for Azeroth"  },
        { id = 44756, questName = "Sign of the Dusk Lily", type = "quest", itemID = 247842, model3D = 1352412, title = "Nightborne Merchant's Stall", expansion = "Legion", faction = "neutral" },
        { id = 43318, questName = "Ly'leth's Champion", type = "quest", itemID = 247911, model3D = 1361686, title = "Shal'dorei Seat", expansion = "Legion", faction = "neutral" },		
		}
    },
{ 
 name = "Talador", 
		quests =	{
        { id = 35685, questName = "Socrethar's Demise", type = "quest", itemID = 251653, model3D = 7273283, title = "Draenethyst Lamppost", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 34099, questName = "The Battle for Shattrath", type = "quest", itemID = 251640, model3D = 942422, title = "Draenic Forge", expansion = "Warlords of Draenor", faction = "alliance"},
        { id = 33582, questName = "Kura's Vengeance", type = "quest", itemID = 258742, model3D = 968424, title = "Scroll of the Adherent", expansion = "Warlords of Draenor", faction = "neutral"},
		}
    },
{ 
 name = "Thaldraszus", 
		quests =	{
        { id = 72935, questName = "Archives Return", type = "quest", itemID = 248651, model3D = 7141928, title = "Draconic Memorial Stone", expansion = "Dragonflight", faction = "neutral" },
        { id = 70745, questName = "Enforced Relaxation", type = "quest", itemID = 256429, model3D = 3952854, title = "Valdrakken Lamppost", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{ 
 name = "The Azure Span", 
		quests =	{
        { id = 76597, questName = "On New Wings", type = "quest", itemID = 250912, model3D = 6892651, title = "Draconic Crafter's Forge", expansion = "Dragonflight", faction = "neutral" },
        { id = 67047, questName = "Warm Away These Shivers", type = "quest", itemID = 246706, model3D = 4201172, title = "Elegant Dracthyr's Tea Cup", expansion = "Dragonflight", faction = "neutral" },
        { id = 71097, questName = "A Helping Claw", type = "quest", itemID = 248653, model3D = 7141933, title = "Valdrakken Stone Stool", expansion = "Dragonflight", faction = "neutral"  },
		}
    },
{ 
 name = "The Coiled Isle", 
		quests =	{
        { id = 95564, questName = "The Serpent's Tail", type = "quest", itemID = 271851, model3D = 7277199, title = "Oozing Vilescar Barricade", expansion = "Midnight", faction = "neutral" },
		{ id = 96457, questName = "Nothing Must Remain", type = "quest", itemID = 271609, model3D = 7277186, title = "Destroyed Clutch of Ula'tek", expansion = "Midnight", faction = "neutral" },
		{ id = 93339, questName = "Trinket Trading", type = "quest", itemID = 271176, model3D = 7277162, title = "Feathered Ula'tek Talisman", expansion = "Midnight", faction = "neutral" },
		{ id = 92933, questName = "Haunted Shore", type = "quest", itemID = 279285, model3D = 1675098, title = "Lost Tortollan Scroll", expansion = "Midnight", faction = "neutral" },
		{ id = 93420, questName = "Lor'themar's Judgement", type = "quest", itemID = 279292, model3D = 5933618, title = "Zul'Aman Pine Tree", expansion = "Midnight", faction = "neutral" },
		{ id = 92930, questName = "Written by the Victors", type = "quest", itemID = 279452, model3D = 7498517, title = "Forgotten Amani Mural", expansion = "Midnight", faction = "neutral" },
		{ id = 93418, questName = "The Venomous Abyss", type = "quest", itemID = 279508, model3D = 8117702, title = "The Hunger Awakens Mural", expansion = "Midnight", faction = "neutral" },
		{ id = 96099, questName = "La'una's Fate", type = "quest", itemID = 280218, model3D = 1661561, title = "Tortollan Scholar Satchel", expansion = "Midnight", faction = "neutral" },
		}
    },	
{ 
 name = "The Forbidden Reach", 
		quests =	{
        { id = 72515, category = "race", questName = "Augmenting a Dragon", type = "quest", itemID = 249549, model3D = 4528488, title = "Draconic Crafter's Table", expansion = "Dragonflight", faction = "neutral", note = "Evoker Only" },
		}
    },
{ 
 name = "The Great Sea", 
		quests =	{
        { id = 52978, questName = "With Prince in Tow", type = "quest", itemID = 245470, model3D = 2470997, title = "Lordaeron Hanging Lantern", expansion = "Battle for Azeroth", faction = "horde"},
		}
    },
{ 
 name = "The Jade Forest", 
		quests =	{
        { id = 30000, questName = "The Jade Serpent", type = "quest", itemID = 264362, model3D = 576300, title = "Golden Pandaren Privacy Screen", expansion = "Mists of Pandaria", faction = "neutral" },
		{ id = 31230, questName = "Welcome to Dawn's Blossom", type = "quest", itemID = 247729, model3D = 519135, title = "Pandaren Stone Lamppost", expansion = "Mists of Pandaria", faction = "neutral" },
		}
    },
{ 
 name = "The Ringing Deeps", 
		quests =	{
		{ id = 82144, questName = "On the Road", type = "quest", itemID = 253040, model3D = 5248936, title = "Coreway Sentinel Lamppost", expansion = "The War Within", faction = "neutral" },
        { id = 83160, questName = "Cinderbrew Reserve", type = "quest", itemID = 253172, model3D = 7262833, title = "Gundargaz Grand Keg", expansion = "The War Within", faction = "neutral" },
        { id = 78642, questName = "New Candle, New Hope", type = "quest", itemID = 258264, model3D = 5169939, title = "Kobold Candle Trio", expansion = "The War Within", faction = "neutral" },
        { id = 79510, questName = "The Wickless Candle", type = "quest", itemID = 258262, model3D = 5169937, title = "Kobold Digger's Chair", expansion = "The War Within", faction = "neutral"},
        { id = 80516, questName = "Bump off the Boss", type = "quest", itemID = 258265, model3D = 5169958, title = "Kobold Wagon", expansion = "The War Within", faction = "neutral"},
		{ id = 78761, questName = "Into the Machine", type = "quest", itemID = 253020, model3D = 4860701, title = "Earthen Etched Throne", expansion = "The War Within", faction = "neutral" },
		}
    },
{ 
 name = "The Waking Shores", 
		quests =	{
        { id = 67063, questName = "10,000 Years of Roasting", type = "quest", itemID = 247223, model3D = 7109344, title = "Roast Riverbeast Platter", expansion = "Dragonflight", faction = "neutral" },
		{ id = 66001, questName = "A Last Hope", type = "quest", itemID = 246863, model3D = 4298559, title = "Open Tome of the Dragon's Dedication", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{ 
 name = "Tiragarde Sound", 
		quests =	{
        { id = 55045, questName = "My Brother's Keeper", type = "quest", itemID = 252754, model3D = 1887706, title = "Seaworthy Boralus Bell", expansion = "Battle for Azeroth", faction = "alliance" },
        { id = 53887, questName = "War Marches On", type = "quest", itemID = 252400, model3D = 1852941, title = "Tiragarde Emblem", expansion = "Battle for Azeroth", faction = "alliance"},
        { id = 51984, questName = "Return to Zuldazar", type = "quest", itemID = 245465, model3D = 2341259, title = "Tirisfal Wooden Chair", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47489, questName = "Stow and Go", type = "quest", itemID = 252406, model3D = 2023436, title = "Green Boralus Market Tent", expansion = "Battle for Azeroth", faction = "alliance"},		
        { id = 48089, questName = "Mountain Sounds", type = "quest", itemID = 252392, model3D = 1602483, title = "Admiral's Chandelier", expansion = "Battle for Azeroth", faction = "alliance"},
        { id = 50972, questName = "Proudmoore's Parley", type = "quest", itemID = 252386, model3D = 1602427, title = "Admiralty's Upholstered Chair", expansion = "Battle for Azeroth", faction = "alliance"},		
		}
    },
{ 
 name = "Twilight Highlands", 
		quests =	{
        { id = 28244, questName = "Eye Spy", type = "quest", itemID = 246427, model3D = 391448, title = "Dilapidated Wildhammer Well", expansion = "Cataclysm", faction = "alliance"},
        { id = 28655, questName = "Wild, Wild, Wildhammer Wedding", type = "quest", itemID = 246428, model3D = 392127, title = "Overgrown Wildhammer Fountain", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Undermine", 
		quests =	{
        { id = 87297, questName = "Cashing the Check", type = "quest", itemID = 243321, model3D = 5700691, title = "Cartel Head's Schmancy Desk", expansion = "The War Within", faction = "neutral"},
		{ id = 86408, questName = "My Hole in the Wall", type = "quest", itemID = 245306, model3D = 5793099, title = "Cozy Four-Pipe Bed", expansion = "The War Within", faction = "neutral"},
        { id = 85711, questName = "Unsolicited Feedback", type = "quest", itemID = 245325, model3D = 5689844, title = "Undermine Market Stall", expansion = "The War Within", faction = "neutral" },		
        { id = 87008, questName = "Ad-Hoc Wedding Planner", type = "quest", itemID = 245308, model3D = 5793083, title = "\"Elegant\" Lawn Flamingo", expansion = "The War Within", faction = "neutral" },
        { id = 84675, questName = "Showdown in the Attic", type = "quest", itemID = 260700, model3D = 5689810, title = "Gob-chanical Trash Heap", expansion = "The War Within", faction = "neutral" },
        { id = 83176, questName = "Just a Hunch", type = "quest", itemID = 245310, model3D = 5793102, title = "Reinforced Goblin Umbrella", expansion = "The War Within", faction = "neutral"},
        { id = 85780, questName = "Right Where We Want Him", type = "quest", itemID = 245303, model3D = 5900860, title = "Rocket-Unpowered Rocket", expansion = "The War Within", faction = "neutral" },		
		}
    },
{ 
 name = "Valdrakken", 
		quests =	{
        { id = 70880, questName = "To Cook With Finery", type = "quest", itemID = 248655, model3D = 7141935, title = "Elegant Dracthyr's Tea Set", expansion = "Dragonflight", faction = "neutral" },
		}
    },
{ 
 name = "Valley of the Four Winds", 
		quests =	{
        { id = 30526, questName = "Lost and Lonely", type = "quest", itemID = 248663, model3D = 955690, title = "Wooden Doghouse", expansion = "Legion", faction = "neutral" },
		}
    },
{ 
 name = "Val'sharah", 
		quests =	{
        { id = 40890, questName = "The Tears of Elune", type = "quest", itemID = 245739, model3D = 1096777, title = "Crescent Moon Lamppost", expansion = "Legion", faction = "neutral"  }, 
        { id = 38663, questName = "The Die is Cast", type = "quest", itemID = 245700, model3D = 7508794, title = "Kaldorei Cushioned Seat", expansion = "Legion", faction = "neutral"  },
        { id = 40573, questName = "The Nightmare Lord", type = "quest", itemID = 245698, model3D = 1096764, title = "Kaldorei Stone Fence", expansion = "Legion", faction = "neutral" },
        { id = 38147, questName = "Entangled Dreams", type = "quest", itemID = 245702, model3D = 1128060, title = "Kaldorei Wall Shelf", expansion = "Legion", faction = "neutral" }, 	
        { id = 42751, questName = "Moon Reaver", type = "quest", itemID = 245258, model3D = 1096759, title = "Val'sharah Bookcase", expansion = "Legion", faction = "neutral" },  
        { id = 39117, questName = "Shriek No More", type = "quest", itemID = 245615, model3D = 6930894, title = "Bradensbrook Smoke Lantern", expansion = "Legion", faction = "neutral" },
        { id = 46107, category = "spec", questName = "Source of the Corruption", type = "quest", itemID = 245616, model3D = 6930897, title = "Bradensbrook Thorned Well", expansion = "Legion", faction = "neutral", note = "Healing Artificat Quest so any healing spec" },					
		}
    },
{ 
 name = "Voidstorm", 
		quests =	{
		{ id = 86513, questName = "Face the Tide", type = "quest", itemID = 262351, model3D = 6700982, title = "Ornate Cosmic Rug", expansion = "Midnight", faction = "neutral" },
		{ id = 86541, questName = "Just In Case...", type = "quest", itemID = 267209, model3D = 6701003, title = "Open Void Elf Bedroll", expansion = "Midnight", faction = "neutral" },		
		{ id = 88706, questName = "Nothing Stands Forever", type = "quest", itemID = 264660, model3D = 6701018, title = "Ren'dorei Spired Tent", expansion = "Midnight", faction = "neutral" },--15895
		{ id = 86521, questName = "Nexus-Point Xenas: Eclipse", type = "quest", itemID = 262606, model3D = 6700978, title = "Smoldering Energy Forge", expansion = "Midnight", faction = "neutral" },--14631
		{ id = 88700, questName = "Two Tons of Metal and Holy Fire", type = "quest", itemID = 262610, model3D = 6701008, title = "Swirling Ritual Pedestal", expansion = "Midnight", faction = "alliance" },
		}
    },
{ 
 name = "Vol'dun", 
		quests =	{
        { id = 47874, questName = "Clearing the Fog", type = "quest", itemID = 245417, model3D = 6877803, title = "Akunda the Tapestry", expansion = "Battle for Azeroth", faction = "horde"},
		{ id = 48554, questName = "The Source of the Problem", type = "quest", itemID = 245263, model3D = 1707340, title = "Zocalo Drinks", expansion = "Battle for Azeroth", faction = "horde" },
		}
    },
{ 
 name = "Westfall", 
		quests =	{
        { id = 26229, questName = "\"I TAKE Candle!\"", type = "quest", itemID = 248797, model3D = 936393, title = "City Wanderer's Candleholder", expansion = "Cataclysm", faction = "alliance" },
        { id = 26297, questName = "The Dawning of a New Day", type = "quest", itemID = 248801, model3D = 4618938, title = "Stormwind Weapon Rack", expansion = "Cataclysm", faction = "alliance" },
        { id = 26270, questName = "You Have Our Thanks", type = "quest", itemID = 248618, model3D = 949210, title = "Westfall Woven Basket", expansion = "Cataclysm", faction = "alliance"},
		}
    },
{ 
 name = "Zul'Aman", 
		quests =	{
		{ id = 91087, questName = "Reports Returned", type = "quest", itemID = 256928, model3D = 6212436, title = "Banner of the Amani Tribe", expansion = "Midnight", faction = "neutral" },
		{ id = 86681, questName = "Den of Nalorakk: A Taste of Vengeance", type = "quest", itemID = 264479, model3D = 6212406, title = "Skyweave Amani Tapestry", expansion = "Midnight", faction = "neutral" },
		{ id = 86660, questName = "Rescue from the Shadows", type = "quest", itemID = 253469, model3D = 6195750, title = "Ritual-Cursed Sarcophagus", expansion = "Midnight", faction = "neutral" },
		{ id = 86693, questName = "De Legend of de Hash'ey", type = "quest", itemID = 255648, model3D = 6195754, title = "Zul'Aman Ancestral Fountain", expansion = "Midnight", faction = "neutral" },
		{ id = 86663, questName = "Embers to a Flame", type = "quest", itemID = 16092, model3D = 6075575, title = "Zul'Aman Flame Cradle", expansion = "Midnight", faction = "neutral" },
		{ id = 94531, questName = "Like Mother, Like Son", type = "quest", itemID = 278691, model3D = 5975164, title = "Twilight Brazier", expansion = "Midnight", faction = "neutral" },
		}
    },	
{ 
 name = "Zuldazar", 
		quests =	{
        { id = 46931, questName = "Speaker of the Horde", type = "quest", itemID = 239606, model3D = 2620663, title = "Forsaken Round Rug", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 54992, questName = "To Mechagon!", type = "quest", itemID = 246701, model3D = 1842929, title = "Gnomish Sprocket Table", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 50963, questName = "Of Dark Deeds and Dark Days", type = "quest", itemID = 245485, model3D = 2098556, title = "Golden Zandalari Bed", expansion = "Battle for Azeroth", faction = "horde"},
        { id = 47432, questName = "The Bargain is Struck", type = "quest", itemID = 245486, model3D = 1597478, title = "Tired Troll's Bench", expansion = "Battle for Azeroth", faction = "horde"},
		{ id = 51601, questName ="The Bridgeport Ride", type = "quest", itemID = 245466, model3D = 2341260, title = "Forsaken Spiked Chair", expansion = "Battle for Azeroth", faction = "horde" },
        { id = 47741, questName = "To Sacrifice a Loa", type = "quest", itemID = 245493, model3D = 1888157, title = "Idol of Rezan, Loa of Kings", expansion = "Battle for Azeroth", faction = "horde" },	
		}
    },
}

