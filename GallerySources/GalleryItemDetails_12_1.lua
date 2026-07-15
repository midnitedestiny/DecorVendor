-- ============================================================
-- Decor Vendor Gallery
-- Data/GalleryItemDetails_12_1.lua
-- Patch 12.1 item details
-- ============================================================

local addonName, DVD = ...

DVD.ItemDetails = DVD.ItemDetails or {}

-- Compatibility alias:
local Gallery = DVD

Gallery.ItemDetails = Gallery.ItemDetails or {}

-- ============================================================
-- Patch 12.1 Item Details
-- Uses ITEM ID as the table key, not decorID.
-- ============================================================

do --12.1 arcantina quests
Gallery.ItemDetails[278038] = {questID = 95780, questName = "Hope for the Orphans" } 
Gallery.ItemDetails[278044] = {questID = 95781, questName = "No Wax Like Home" } 
Gallery.ItemDetails[278694] = {questID = 95779, questName = "Moments in a Mug" } 
end

do --12.1 coiled isle quests
Gallery.ItemDetails[271851] = {questID = 95564, questName = "The Serpent's Tail" }
Gallery.ItemDetails[271609] = {questID = 96457, questName = "Nothing Must Remain" }
Gallery.ItemDetails[271176] = {questID = 93339, questName = "Trinket Trading" }
Gallery.ItemDetails[279285] = {questID = 92933, questName = "Haunted Shore" }
Gallery.ItemDetails[279292] = {questID = 93420, questName = "Lor'themar's Judgement" }
Gallery.ItemDetails[279452] = {questID = 92930, questName = "Written by the Victors" }
Gallery.ItemDetails[279508] = {questID = 93418, questName = "The Venomous Abyss" }
Gallery.ItemDetails[280218] = {questID = 96099, questName = "La'una's Fate" }
end

do --12.1 zul'aman quests
Gallery.ItemDetails[278691] = {questID = 94531, questName = "Like Mother, Like Son" }
end

do --cirsed keepsake vendor
Gallery.ItemDetails[255652] = { questName = "Cursed Keepsake"} -- Purified Troll Loop
Gallery.ItemDetails[256684] = { questName = "Cursed Keepsake"} -- Purified Troll Amulet
Gallery.ItemDetails[253396] = { questName = "Cursed Keepsake"} -- Purified Crude Axe
Gallery.ItemDetails[255712] = { questName = "Cursed Keepsake"} -- Purified Ancient Urn
Gallery.ItemDetails[267205] = { questName = "Cursed Keepsake"} -- Purified Folk Candle
Gallery.ItemDetails[258540] = { questName = "Cursed Keepsake"} -- Purified Troll Ring
Gallery.ItemDetails[245993] = { questName = "Cursed Keepsake"} -- Purified Floating Lantern
Gallery.ItemDetails[253703] = { questName = "Cursed Keepsake"} -- Purified Crude Hammer
Gallery.ItemDetails[245991] = { questName = "Cursed Keepsake"} -- Purified Sindorei Candle
Gallery.ItemDetails[267355] = { questName = "Cursed Keepsake"} -- Purified Elven Mirror
Gallery.ItemDetails[268943] = { questName = "Cursed Keepsake"} -- Purified Elven Glowlamp
Gallery.ItemDetails[267435] = { questName = "Cursed Keepsake"} -- Purified Kaldorei Candle
Gallery.ItemDetails[278696] = { questName = "Cursed Keepsake"} -- Purified Dracthyr Stein
Gallery.ItemDetails[278701] = { questName = "Cursed Keepsake"} -- Purified Goblin Cup
Gallery.ItemDetails[263876] = { questName = "Cursed Keepsake"} -- Purified Folk Mirror
Gallery.ItemDetails[256361] = { questName = "Cursed Keepsake"} -- Purified Troll Pendant
Gallery.ItemDetails[244347] = { questName = "Cursed Keepsake"} -- Purified Troll Urn
Gallery.ItemDetails[272129] = { questName = "Cursed Keepsake"} -- Purified Tauren Pot
Gallery.ItemDetails[252042] = { questName = "Cursed Keepsake"} -- Purified Troll Pitcher
Gallery.ItemDetails[272142] = { questName = "Cursed Keepsake"} -- Purified Earthen Pot
end

do --12.1 achievements
Gallery.ItemDetails[278369] = { achievementID = 63451, achievementName = "Scales for Days", achievementCategory = "Prey" }
Gallery.ItemDetails[278372] = { achievementID = 63452, achievementName = "Fangs for the Memories", achievementCategory = "Prey" }
Gallery.ItemDetails[278376] = { achievementID = 63454, achievementName = "Nine, Ten, Never Sleep Again", achievementCategory = "Prey" }
Gallery.ItemDetails[278380] = { achievementID = 63453, achievementName = "One, Two, Ral'kala's Coming for You", achievementCategory = "Prey" }
Gallery.ItemDetails[263873] = { achievementID = 63358, achievementName = "Coiled to Strike", achievementCategory = "Midnight" }
Gallery.ItemDetails[248962] = { achievementID = 63432, achievementName = "Mysterious Mix Master", achievementCategory = "Midnight" }
Gallery.ItemDetails[279922] = { achievementID = 63636, achievementName = "Fully Corroded", achievementCategory = "Midnight" }
end

do--12.1 vendor
Gallery.ItemDetails[276230] = { note = "Found on the Neighborhood Board if you have the transdimensional whistle toy" }
end

do-- 12.1 drops
--Gallery.ItemDetails[267080] = { dropName = "Midnight Delves" }
--Gallery.ItemDetails[248963] = { dropName = "Midnight Delves" }
--Gallery.ItemDetails[275855] = { dropName = "Midnight Delves" } 
Gallery.ItemDetails[272361] = { dropName = "Vashnik the Malignant" } --done
Gallery.ItemDetails[278374] = { dropName = "Ral'kala" } -- prey  enemy
Gallery.ItemDetails[278378] = { dropName = "Ral'kala" }-- prey  enemy
Gallery.ItemDetails[279115] = { dropName = "Nek'zali the Soulcoiler" } --done
Gallery.ItemDetails[279118] = { dropName = "The Lost Explorers" } --done
Gallery.ItemDetails[279122] = { dropName = "The Twin Fangs" } --done
Gallery.ItemDetails[279131] = { dropName = "The Bargained Crown" } --done
Gallery.ItemDetails[279211] = { dropName = "Zul'jan's Strongbox" } --done
Gallery.ItemDetails[279500] = { dropName = "Ula'tek" } --done
end
