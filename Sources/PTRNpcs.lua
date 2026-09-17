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

-- Only load these definitions if the client version is Patch 12.0 or higher (PTR/Midnight)
local _, _, _, tocVersion = GetBuildInfo()
if not tocVersion or tocVersion < 120105 then
    return
end

DVD.npcs = DVD.npcs or {}

do--1ptr
DVD.npcs[274668] = { zone = "Hero's Rest", model3D = 98927, title = "Curator IIlaris", expansion = "Shadowlands", zoneGroup = "Bastion", faction = "neutral", x=52.4, y=47.2, mapID = 1533 }
DVD.npcs[160470] = { zone = "Hero's Rest", model3D = 92191, title = "Adjutant Nikos", expansion = "Shadowlands", zoneGroup = "Bastion", faction = "neutral", x=52.3, y=47.1, mapID = 1533 }
DVD.npcs[175419] = { zone = "Heart of Forest", model3D = 99621, title = "Lunelle", expansion = "Shadowlands", zoneGroup = "Ardenweald", faction = "alliance", x=61.0, y=37.8, mapID = 1701, note = "NightFae Only", category = "Covenants" }
DVD.npcs[158556] = { zone = "Heart of Forest", model3D = 99153, title = "Aithlyn", expansion = "Shadowlands", zoneGroup = "Ardenweald", faction = "alliance", x=48.5, y=50.5, mapID = 1565, note = "NightFae Only", category = "Covenants" }
DVD.npcs[173003] = { zone = "Theater of Pain", model3D = 96135, title = "Nalcorn Talsen", expansion = "Shadowlands", zoneGroup = "Maldraxxus", faction = "neutral", x=50.7, y=53.4, mapID = 1536 }
DVD.npcs[274682] = { zone = "Theater of Pain", model3D = 96189, title = "Collector Xorik", expansion = "Shadowlands", zoneGroup = "Maldraxxus", faction = "neutral", x=50.7, y=53.4, mapID = 1536 }
DVD.npcs[274686] = { zone = "Darkhaven", model3D = 93046, title = "Verayn", expansion = "Shadowlands", zoneGroup = "Revendreth", faction = "neutral", x=61.9, y=63.7, mapID = 1525 }
DVD.npcs[156822] = { zone = "Darkhaven", model3D = 92783, title = "Mistress Mihaela", expansion = "Shadowlands", zoneGroup = "Revendreth", faction = "neutral", x=61.4, y=63.8, mapID = 1525 }
DVD.npcs[274062] = { zone = "Halls of Atonement", model3D = 147654, title = "Mumples", expansion = "Shadowlands", zoneGroup = "Revendreth", faction = "neutral", x=73.1, y=52.6, mapID = 1525 }
DVD.npcs[169524] = { zone = "Hall of Curiosities", model3D = 93585, title = "Acquirer Ta'gosh", expansion = "Shadowlands", zoneGroup = "Oribos", faction = "neutral", x=61.7, y=71.7, mapID = 1670 }
DVD.npcs[955] = { zone = "Westbook Garrison", model3D = 3338, title = "Sergeant De Vries", expansion = "Classic", zoneGroup = "Elwynn Forest", faction = "alliance", x=24.1, y=73.2, mapID = 37 }
DVD.npcs[127518] = { zone = "The Vindicaar", model3D = 79483, title = "Adjutant Vortus", expansion = "Legion", zoneGroup = "Argus", faction = "neutral", x=33.3, y=65.9, mapID = 831 }
DVD.npcs[127120] = { zone = "The Vindicaar", model3D = 79263, title = "Vindicator Jaelaana", expansion = "Legion", zoneGroup = "Argus", faction = "neutral", x=43.3, y=72.8, mapID = 831 }
DVD.npcs[274690] = { zone = "Aroms Stand", model3D = 80766, title = "Fenwir", expansion = "Battle for Azeroth", zoneGroup = "Drustvar", faction = "alliance", x=37.8, y=49.0, mapID = 896 }
DVD.npcs[143244] = { zone = "Boralus", model3D = 87780, title = "Victor Esquivas", expansion = "Battle for Azeroth", zoneGroup = "Tiragarde Sound", faction = "alliance", x=73.9, y=12.8, mapID = 1161, note = "He patrols around start in Snug Harbor Inn and target him" }
DVD.npcs[274250] = { zone = "Elodor ", model3D = 147697, title = "Botanist Taania", expansion = "Warlords of Draenor", zoneGroup = "Shadowmoon Valley", faction = "alliance", x=58.05, y=26.63, mapID = 539 }
DVD.npcs[274291] = { zone = "Wor'var", model3D = 147698, title = "Botanist Gril'ka", expansion = "Warlords of Draenor", zoneGroup = "Nagrand", faction = "horde", x=82.10 , y=44.77, mapID = 550 }
DVD.npcs[143325] = { zone = "Vulpera Highway", model3D = 87765, title = "Jeni", expansion = "Warlords of Draenor", zoneGroup = "Vol'dun", faction = "horde", x=56.4, y=50.4, mapID = 864 }
DVD.npcs[135804] = { zone = "Vulpera Highway", model3D = 84414, title = "Hoarder Jena", expansion = "Warlords of Draenor", zoneGroup = "Vol'dun", faction = "horde", x=56.6, y=49.8, mapID = 864 }
DVD.npcs[85932] = { zone = "Stormshield", model3D = 59224, title = "Vindicator Nuurem", expansion = "Warlords of Draenor", zoneGroup = "Ashran", faction = "alliance", x=46.2, y=76.5, mapID = 622 }
DVD.npcs[266188] = { zone = "Silvermoon City", model3D = 144735, title = "Estella Archtender", expansion = "Midnight", zoneGroup = "Silvermoon City", faction = "neutral", x=39.3, y=80.2, mapID = 2393, note = "Her location is where the event is located at in Silvermoon" }
DVD.npcs[188623] = { zone = "Obsidian Throne", model3D = 106468, title = "Samia Inkling", expansion = "Dragonflight", zoneGroup = "The Waking Shores", faction = "neutral", x=24.7, y=56.8, mapID = 2022 }
end

DVD.achievements = DVD.achievements or {}

DVD.achievements = {
  {
    name = "Quests", --22
    achievements = {
	  --[[Shadowlands]]{ id = 14164, type = "achievement", itemID = 283262, model3D = 3229538, title = "Restored Night Fae Sigil", faction = "neutral"  }
    }
  },
  {
    name = "World Events",--1
    achievements = {
  --[[Hallow's End]]{ id = 10365, type = "achievement", itemID = 282287, model3D = 1246563, title = "Scarecrow Pepe", faction = "neutral" },
    }
  }, 
}

DVD.quests = DVD.quests or {}

DVD.quests = { 
{    
	    name = "Arcantina",
		quests = {
		{ id = 95781, questName = "No Wax Like Home", type = "quest", itemID = 278044, model3D = 5503816, title = "Hanging Candles", expansion = "Midnight", faction = "neutral", note = "Currently bugged awaiting a hotfix"}, 
		}
    },	
{ 
 name = "Silvermoon City", 
		quests =	{
		{ id = 95533, questName = "The Aqir Swarm", type = "quest", itemID = 280050, model3D = 8123341, title = "Aqir Hunter's Trophy", expansion = "Midnight", faction = "neutral" },
		}
    },	
{ 
 name = "Zul'Aman", 
		quests =	{
	    { id = 95200, questName = "An Offering For Halazzi", type = "quest", itemID = 279067, model3D = 6935592, title = "Symbol of Halazzi", expansion = "Midnight", faction = "neutral" },
	    { id = 95203, questName = "The Ties That Bind", type = "quest", itemID = 264718, model3D = 6195764, title = "Amani Fishing Canoe", expansion = "Midnight", faction = "neutral" },
		}
    },	
}

DVD.bossdrops = DVD.bossdrops or {}

DVD.bossdrops = {
  {
    name = "Draenor",
	expansion = "Warlords of Draenor",
    items = {
	  { id = 284194, category = "dungeon",  name = "Everbloom Forest Floor", zone = "The Everbloom, Gorgrond", bossencounter = 1756, model3D = 1033500, mapID = 621, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
    }
  },
    {
    name = "The Unbinding of Kith'ix",
	expansion = "Midnight",
    items = {
      { id = 281213, category = "raid",  name = "Kith'ix's Seal", zone = "The Unbinding of Kith'ix", bossencounter = 3513, model3D = 7949197, mapID = 2669, note = "|cffFFD700Right-click to open the Dungeon Journal map|r" },
}
 },
}
