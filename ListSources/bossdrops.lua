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

, zone = "", 
============================================================
]]
local addonName, DVD = ...

DVD.bossdrops = DVD.bossdrops or {}
DVD.DecorCameraOverrides = DVD.DecorCameraOverrides or {}

DVD.DecorCameraOverrides = {
[197168] = { zoom = -32.0 }, --Dark Iron Chandelier
[4732009] = {zoom = -32.0}, --Hanging Dawn Flower
}


DVD.bossdrops = {
    {
    name = "Darkshore Rares",
	expansion = "Battle for Azeroth",
    items = {	  
	  { id = 241066, category = "rare",  name = "Forsaken Spiked Brazier", zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6431408, mapID = 62, note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
      { id = 245462, category = "rare",  name = "Banshee Queen's Banner",  zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 2530077,  mapID = 62,  note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
      { id = 245627, category = "rare",  name = "Elven Temple Brazier",  zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6938369, mapID = 62,  note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
      { id = 246110, category = "rare",  name = "Filigree Moon Sconce",  zone = "Darkshore, Kalimdor", bossevent = "Daily Darkshore Rares", model3D = 6980565,  mapID = 62,  note = "Drops from:\n\n• Granokk\n• Stonebinder Ssra'vess\n• Shattershard\n• Scalefiend\n• Aman\n• Mrggr'marr\n• Glimmerspine\n• Madfeather\n\n|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
    {
    name = "Midnight Delves",
	expansion = "Midnight",
    items = {
      { id = 264330, category = "delve",  name = "Amani Hanging Brazier", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6075573, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 267009, category = "delve",  name = "Amani Training Dummy", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6212435, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 264258, category = "delve",  name = "Blossoming Forge", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6225683, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 264342, category = "delve",  name = "Cosmic Void Cache", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 7136759, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r"},
      { id = 251967, category = "delve",  name = "Fungarian Banner", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6225689, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 263036, category = "delve",  name = "Hanging Dawnflower", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 4732009, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 263042, category = "delve",  name = "Rootlight Lamppost", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6252874, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
      { id = 263233, category = "delve",  name = "Sin'dorei Spinning Library", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6050885, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
	  { id = 264329, category = "delve",  name = "Amani Dining Table", zone = "Quel’Thalas", bossevent = "Midnight Delves", model3D = 6075571, mapID = 2537, note = "|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
   {
    name = "The Venomous Abyss",
	expansion = "Midnight",
    items = {
      --{ id = 272361, category = "raid",  name = "Venomous Pyre", zone = "The Venomous Abyss", bossencounter = 2882, model3D = 7277208, mapID = 2608, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279500, category = "raid",  name = "Rage of the Shackled Mural", zone = "The Venomous Abyss", bossencounter = 2895, model3D = 8117703, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279118, category = "raid",  name = "Lost Explorers Mailbox", zone = "The Venomous Abyss", bossencounter = 2894, model3D = 1992950, mapID = 2609, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279115, category = "raid",  name = "Soulcoiler's Ritual Candle", zone = "The Venomous Abyss", bossencounter = 2888, model3D = 7515872, mapID = 2606, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279122, category = "raid",  name = "Venom-Fanged Font", zone = "The Venomous Abyss", bossencounter = 2887, model3D = 7277192, mapID = 2607, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 279131, category = "raid",  name = "Pillar of the Coiled Isle", zone = "The Venomous Abyss", bossencounter = 2883, model3D = 7277190, mapID = 2610, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 244343, category = "raid",  name = "Vessel of the Howling Ossuary", zone = "The Venomous Abyss", bossencounter = 2871, model3D = 6870560, mapID = 2609, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 264716, category = "raid",  name = "Hexed Tomb Brazier", zone = "The Venomous Abyss", bossencounter = 2874, model3D = 6153828, mapID = 2608, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
   {
    name = "The Tidebound Grotto",
	expansion = "Midnight",
    items = {
      { id = 279112, category = "raid",  name = "Clumped Asteroidea", zone = "The Tidebound Grotto", bossencounter = 2849, model3D = 2433564, mapID = 2632, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
    {
    name = "Altar of Fangs",
	expansion = "Midnight",
    items = {
      { id = 279211, category = "dungeon",  name = "Pillar of the Fanged Altar", zone = "Altar of Fangs", bossencounter = 2880, model3D = 7277191, mapID = 2590, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
 {
    name = "Eastern Kingdoms",
	expansion = "Classic",
    items = {
      { id = 248332, category = "dungeon",  name = "Stormwind Footlocker", zone = "The Deadmines, Westfall", bossencounter = 95, model3D = 936398, mapID = 292, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 244655, category = "dungeon",  name = "Gilnean Circular Rug", zone = "Shadowfang Keep, Silverpine Forest", bossencounter = 100, model3D = 1379266, mapID = 315, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 246429, category = "dungeon",  name = "Dark Iron Chandelier", zone = "Blackrock Mountain, Burning Steppes", bossencounter = 387, model3D = 197168, mapID = 243, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245435, category = "dungeon",  name = "Horde Battle Emblem", zone = "Blackrock Mountain, Burning Steppes", bossencounter = 1234, model3D = 1005505, mapID = 618, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 246865, category = "dungeon",  name = "Tome of Reliquary Insights", zone = "Karazhan, Deadwind Pass", bossencounter = 1838, model3D = 4335906, mapID = 822, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "Windrunner Spire",
	expansion = "Midnight",
    items = {
      { id = 256683, category = "dungeon",  name = "Silvermoon Training Dummy", zone = "Winderunner Spire, Eversong Woods", bossencounter = 2658, model3D = 6190527, mapID = 2499, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "Magisters Terrace",
	expansion = "Midnight",
    items = {
      { id = 263230, category = "dungeon",  name = "Magister's Bookshelf", zone = "Magisters' Terrace, Isle of Quel'Danas", bossencounter = 2662, model3D = 6050875, mapID = 2520, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "Murder Row",
	expansion = "Midnight",
    items = {
      { id = 263238, category = "dungeon",  name = "Illicit Long Table", zone = "Murder Row, Silvermoon City", bossencounter = 2682, model3D = 7296096, mapID = 2434, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
	  { id = 246857, category = "decor",  name = "Shu'halo Perspective Painting", zone = "Murder Row, Silvermoon City", bossevent = "Cravitz Lorent", model3D = 1600035, mapID = 2433, note = "13 of Sargle's Fortunes."},
    }
  },
  {
    name = "VoidSpire",
	expansion = "Midnight",
    items = {
      { id = 264497, category = "raid",  name = "Imperator's Torment Crystal", zone = "The Voidspire, Voidstorm", bossencounter = 2733, model3D = 7136760, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 264498, category = "raid",  name = "Voltaic Trigore Egg", zone = "The Voidspire, Voidstorm", bossencounter = 2734, model3D = 7302402, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 264491, category = "raid",  name = "Voidbound Holding Cell", zone = "The Voidspire, Voidstorm", bossencounter = 2735, model3D = 6210896, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 264494, category = "raid",  name = "Banded Domanaar Storage Crate", zone = "The Voidspire, Voidstorm", bossencounter = 2736, model3D = 6391990, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 262957, category = "raid",  name = "Tattered Vanguard Banner", zone = "The Voidspire, Voidstorm", bossencounter = 2737, model3D = 7115753, mapID = 2529, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      --{ id = 264500, zone = "", bossencounter = 2738, model3D = 7370900, mapID = 2530 },--good
      --{ id = 265951, category = "raid",  name = " Vanquisher's Aureate Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7550713, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      --{ id = 266887, category = "raid",  name = " Vanquisher's Gleaming Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7556294, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 268049, category = "raid",  name = " Vanquisher's Argent Trophy", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 7633283, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
	  { id = 269269, category = "raid",  name = "Devouring Ritual Spire", zone = "The Voidspire, Voidstorm", bossencounter = 2738, model3D = 6224355, mapID = 2530, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "March on Quel'Danas",
	expansion = "Midnight",
    items = {
      { id = 264187, category = "raid",  name = "Blessed Phoenix Egg", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2739, model3D = 7317243, mapID = 2533, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 264492, category = "raid",  name = "Chaotic Void Maw", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 6224353, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    --{ id = 265949, category = "raid",  name = " Vanquisher's Aureate Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7550710, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    -- { id = 266885, category = "raid",  name = "Vanquisher's Gleaming Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7556292, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 267646, category = "raid",  name = "Vanquisher's Argent Trophy", zone = "March on Quel'Danas, Isle of Quel'Danas", bossencounter = 2740, model3D = 7633282, mapID = 2534, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "The Blinding  Vale",
	expansion = "Midnight",
    items = {
      { id = 253451, category = "dungeon",  name = "Veilroot Fountain", zone = "The Binding Vale, Harandar", bossencounter = 2772, model3D = 6839738, mapID = 2500, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, --good
    }
  },
    {
    name = "Sporefall",
	expansion = "Midnight",
    items = {
      { id = 247235, category = "raid",  name = "Luminous Rotshroom", zone = "Sporefall, Harandar", bossencounter = 2711, model3D = 6225707, mapID = 2427, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, --good
    }
  },
  {
    name = "Den of Nalorakk",
	expansion = "Midnight",
    items = {
      { id = 264332, category = "dungeon",  name = "Amani Ritual Altar", zone = "Den of Nalorakk, Zul'Aman", bossencounter = 2778, model3D = 6153808, mapID = 2513, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "The Dreamrift",
	expansion = "Midnight",
    items = {
      { id = 264246, category = "raid",  name = "Eerie Iridescent Riftshroom", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 5746809, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      --{ id = 265950, category = "raid",  name = " Vanquisher's Aureate Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7550712, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      --{ id = 266886, category = "raid",  name = " Vanquisher's Gleaming Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7556293, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 267645, category = "raid",  name = " Vanquisher's Argent Trophy", zone = "The Dreamrift, Harandar", bossencounter = 2795, model3D = 7633281, mapID = 2532, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Maisara Caverns",
	expansion = "Midnight",
    items = {
      { id = 264717, category = "dungeon",  name = "Amani Warding Hex", zone = "Maisara Caverns, Zul'aman", bossencounter = 2812, model3D = 6195760, mapID = 2501, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  }, --good
    }
  },
  --[[{
    name = "The Coiled Isle Delves",
	expansion = "Midnight",
    items = {
    { id = 267080, category = "delve",  name = "Amani Blueflame Chandelier", zone = "\n• Ring of Glory\n• Gnarldor ", bossevent = "The Coiled Isle Delves", model3D = 6153830, mapID = 2512, note = "|cffFFD700Right-click to pin locations on the map|r" },
	{ id = 275855, category = "delve",  name = "Zul'Aman Swamp Palm Sprout", zone = "\n• Ring of Glory\n• Gnarldor ", bossevent = "The Coiled Isle Delves", model3D = 6153830, mapID = 2512, note = "|cffFFD700Right-click to pin locations on the map|r" },
	{ id = 248963, category = "delve",  name = "Spirit-Touched Amani Mask", zone = "\n• Ring of Glory\n• Gnarldor ", bossevent = "The Coiled Isle Delves", model3D = 6153830, mapID = 2512, note = "|cffFFD700Right-click to pin locations on the map|r" },
    }
  },]] 
    {
    name = "Voidstorm",
	expansion = "Midnight",
    items = {
	  { id = 262608, source = "drop", category = "daily",  name = "Void Elf Stool", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 6701001, mapID = 2405, note = "|cffFFD700Right-click to pin locations on the map|r" },
	  { id = 264343, source = "drop", category = "daily",  name = "Cosmic Void Gravitational Orb", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 7136761, mapID = 2405, note = "|cffFFD700Right-click to pin locations on the map|r" },
	  { id = 264483, source = "drop", category = "daily",  name = "Cosmic Void Campfire", zone = "Voidstorm", bossevent = "Stormarion Assault", model3D = 6701007, mapID = 2405, note = "|cffFFD700Right-click to pin locations on the map|r" },	  
    }
  },
  {
    name = "Nexus-Point Xenas",
	expansion = "Midnight",
    items = {
      { id = 264338, category = "dungeon",  name = "Domanaar Control Console", zone = "Nexus-Point Xenas, Voidstorm", bossencounter = 2815, model3D = 6210900, mapID = 2556, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, --good
    }
  },
    {
    name = "Voidscar Arena",
	expansion = "Midnight",
    items = {
      { id = 264336, category = "dungeon",  name = "Voidlight Brazier", zone = "Voidscar Arena, Voidstorm", bossencounter = 2793, model3D = 6210883, mapID = 2573, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, --good
    }
  },
  {
    name = "Northrend",
	expansion = "Wrath of the Lich King",
    items = {
      { id = 267007, category = "dungeon",  name = "Eye of Acherus", zone = "Pit of Saron, IceCrown", bossencounter = 610, model3D = 328250, mapID = 184, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
	  { id = 258145, category = "decor",  name = "Cheese for Glowergold", zone = "Dalaran, Northrend", bossevent = "Cooking Daily", model3D = 6051297, mapID = 125, note = "This is a daily Cooking quest on both horde and alliance side"},

    }
  },
  {
    name = "Pandaria",
	expansion = "Mists of Pandaria",
    items = {
      { id = 246846, category = "dungeon",  name = "Tome of Pandaren Wisdom", zone = "Temple of the Jade Serpant, Jade Forest", bossencounter = 335, model3D = 534950, mapID = 429, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 253242, category = "raid",  name = "Horde Warlord's Throne", zone = "Siege of Orgrimmar, Vale of Eternal Blossoms", bossencounter = 869, model3D = 6905426, mapID = 567, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" }, --good
	  { id = 248934, source = "treasure", category = "decor",  name = "Golden Cloud Serpent Treasure Chest", bossevent = "Frederick the Fabulous", model3D = 629723, mapID = 371, note = "|cffFFD700Right-click to pin locations on the map|r" },
    }
  },
  {
    name = "Draenor",
	expansion = "Warlords of Draenor",
    items = {
      { id = 251329, category = "daily", zone = "Shadowmoon Valley, Draenor", bossevent = "Shadowmoon Valley Missive", model3D = 878999, mapID = 539, faction = "alliance", note = "Requires Missive: Assault on Socrethar's Rise" },--good
	  { id = 241043, category = "daily", zone = "Shadowmoon Valley, Draenor", bossevent = "Shadowmoon Valley Missive", model3D = 875378, mapID = 539, faction = "alliance", note = "Missive: Assault on Shattrath Harbor"},
      { id = 251547, category = "daily", zone = "Shadowmoon Valley, Draenor", bossevent = "Shadowmoon Valley Missive", model3D = 915354, mapID = 539, faction = "alliance", note = "Missive: Assault on the Heart of Shattrath"},
      { id = 251331, category = "dungeon",  name = "Draenic Ottoman", zone = "Auchindoun, Talador", bossencounter = 1225, model3D = 1025872, mapID = 593, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 245434, category = "dungeon",  name = "Orgrimmar Sconce", zone = "Iron Docks, Gorgrond", bossencounter = 1238, model3D = 1005503, mapID = 595, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
	  { id = 258744, category = "dungeon",  name = "Skyreach Circular Table", zone = "Skyreach, Spires of Arak", bossencounter = 968, model3D = 971695, mapID = 602, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "Broken Isles",
	expansion = "Legion",
    items = {
      { id = 257724, category = "renown",  name = "Bloodtotem Banner", zone = "Highmountain", bossevent = "Highmountain Paragon Chest", model3D = 1313472, mapID = 750, note = "|cffFFD700Right-click to pin locations on the map|r"  },--good
	  { id = 245449, source = "treasure", category = "daily",  name = "Ancient Elven Highback Chair", zone = "Suramar", bossevent = "Withered Army Training", model3D = 1096835, mapID = 680, note = "|cffFFD700Right-click to pin locations on the map|r"  },
      { id = 238857, category = "dungeon",  name = "Moon-Blessed Storage Crate", zone = "Darkheart Thicket, Val'sharah", bossencounter = 1657, model3D = 1096755, mapID = 733, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 245451, category = "dungeon",  name = "Thunder Totem Brazier", zone = "Neltharions Lair, Highmountain", bossencounter = 1687, model3D = 1313217, mapID = 731, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 247913, category = "dungeon",  name = "Ornate Suramar Table", zone = "Court of Stars, Suramar", bossencounter = 1720, model3D = 1361708, mapID = 763, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 256682, category = "raid",  name = "Magistrix's Garden Fountain", zone = "Nighthold, Suramar", bossencounter = 1751, model3D = 1405830, mapID = 766, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 241044, category = "dungeon",  name = "Argussian Crate", zone = "Seat of Triumvirate, Argus", bossencounter = 1982, model3D = 877007, mapID = 903, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  },
  {
    name = "Kul Tiras",
	expansion = "Battle for Azeroth",
    items = {
      { id = 257928, category = "daily",  name = "Gnomeregan Recyli-Kiln", zone = "Mechagon Island", bossevent = "Junkwatt Depot Recycling", model3D = 2929684, mapID = 1462, note = "Strange Recycling Requisition" },
      { id = 246481, category = "daily",  name = "Retired Industrial Gnomegrabber", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1624683, mapID = 1462, note = "Self-Assembling Homeware Kit" },
      { id = 246599, category = "daily",  name = "Self-Sealing Stembarrel", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1842467, mapID = 1462, note = "Self-Assembling Homeware Kit" },--good
      { id = 246602, category = "daily",  name = "Small H.O.M.E. Cog", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 2067166, mapID = 1462, note = "Self-Assembling Homeware Kit" },--good
      { id = 246600, category = "daily",  name = "Small Mechanical Crate", zone = "Mechagon Island", bossevent = "Mechagon Dailies", model3D = 1842492, mapID = 1462, note = "Self-Assembling Homeware Kit" },--good
      { id = 246421, category = "dungeon",  name = "Stolen Ironforge Seat", zone = "Freehold, Tiragarde Sound", bossencounter = 2095, model3D = 197304, mapID = 936, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 245681, category = "dungeon",  name = "Tidesage's Fireplace", zone = "Shrine of the Storm, Stormsong Valley", bossencounter = 2156, model3D = 6980179, mapID = 1040, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
      { id = 267008, category = "raid",  name = "Crucible Votive Rack", zone = "Crucible of  Storms, Stormsong Valley", bossencounter = 2328, model3D = 1959305, mapID = 1345, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 255672, category = "dungeon",  name = "Gnomish Tesla Tower", zone = "Mechagon", bossencounter = 2331, model3D = 2745099, mapID = 1497, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
    {
    name = "Zandalar",
	expansion = "Battle for Azeroth",
    items = {
      { id = 278245, category = "dungeon",  name = "Royal Attendant's Coffin", zone = "Kings' Rest", bossencounter = 2172, model3D = 1981805, mapID = 1004, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
	  { id = 278982, category = "dungeon",  name = "Hatchery of Hissing Eggs", zone = "Temple of Sethraliss", bossencounter = 2145, model3D = 1660581, mapID = 1043, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
  {
    name = "Dragon Isles",
	expansion = "Dragonflight",
    items = {
      { id = 256354, category = "dungeon",  name = "Qalashi Goulash", zone = "Neltharus, Waking Shores", bossencounter = 2501, model3D = 4420033, mapID = 2080, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  },--good
      { id = 256428, category = "dungeon",  name = "Valdrakken Hanging Lamp", zone = "Ruby Life Pools, Waking Shores", bossencounter = 2503, model3D = 3883458, mapID = 2094, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  },--good
      { id = 260359, category = "dungeon",  name = "Valdrakken Bookcase", zone = "Algeth'ar Academy, Thaldraszus", bossencounter = 2514, model3D = 6431406, mapID = 2099, note = "|cffFFD700Right-click to open the Dungeon Journal map|r"  },--good
    }
  },
  {
    name = "Khaz Algar",
	expansion = "The War Within",
    items = {
      { id = 245294, category = "event", source = "drop", name = "Distinguished Actor's Chest" , zone = "Isle of Dorn", bossevent = "Theater Troupe", model3D = 5647269, mapID = 2248, note = "|cffFFD700Right-click to pin locations on the map|r"  },--good
      { id = 245320, category = "event", source = "drop", zone = "Undermine", bossevent = "Shipping and Handling Jobs", model3D = 5689822, mapID = 2346, note = "Requires Shipping and Handling Job Streak"   },--good
	  { id = 245315, category = "event", source = "drop", zone = "Undermine", bossevent = "Scraps Heaps", model3D = 5788649, mapID = 2346, note = "Requires Scraps Heaps"   },--good
      { id = 245938, category = "dungeon",  name = "Overgrown Arathi Trellis", zone = "Priory of the Sacred Flame, Hallowfall", bossencounter = 2573, model3D = 5360239, mapID = 2309, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
      { id = 245560, category = "dungeon",  name = "Meadery Ochre Window", zone = "Cinderbrew Meadery, Isle of Dorn", bossencounter = 2589, model3D = 6924252, mapID = 2335, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
	  { id = 258268, category = "dungeon",  name = "Waxmaster's Candle Rack", zone = "DarkFlame Cleft, Ringing Deeps", bossencounter = 2561, model3D = 5503818, mapID = 2303, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },--good
    }
  }
}