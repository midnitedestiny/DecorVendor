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

local C = DVD.CONSTANTS or DVD.C
local scrollChild = DVD.scrollChild
local HasAnySelection = DVD.HasAnySelection

if not C then
    print("|cffff4040DecorVendor ListBuilders:|r constants are missing.")
    return
end

if not scrollChild then
    print("|cffff4040DecorVendor ListBuilders:|r DVD.scrollChild is missing. Make sure UI\\ListFrame.lua loads first.")
    return
end

if not HasAnySelection then
    print("|cffff4040DecorVendor ListBuilders:|r DVD.HasAnySelection is missing. Make sure Helpers.lua loads before UI\\ListBuilders.lua.")
    return
end

-------------------------------------------------
-- Client Availability Helpers
-------------------------------------------------

local function IsDataAvailable(data)
    if not data then
        return true
    end

    if DVD.IsDataAvailableForClient then
        return DVD.IsDataAvailableForClient(data)
    end

    return true
end

local function IsItemAvailable(itemID)
    if not itemID then
        return true
    end

    if DVD.IsItemAvailableForClient then
        return DVD.IsItemAvailableForClient(itemID)
    end

    return true
end

local function IsLinkedItemAvailable(data)
    if not data then
        return true
    end

    local itemID =
        data.itemID
        or data.rewardItemID
        or data.decorItemID
        or data.id

    if itemID then
        return IsItemAvailable(itemID)
    end

    return IsDataAvailable(data)
end
-------------------------------------------------
-- Search Helpers
-------------------------------------------------

local function GetSearchQuery()
    if not DVD.searchQuery or DVD.searchQuery == "" then
        return nil
    end

    return string.lower(tostring(DVD.searchQuery))
end

local function TextMatchesSearch(text, query)
    if not query or query == "" then
        return true
    end

    if text == nil then
        return false
    end

    return string.find(string.lower(tostring(text)), query, 1, true) ~= nil
end

local function GetItemNameSafe(itemID)
    if not itemID then
        return nil
    end

    local itemName

    if C_Item and C_Item.GetItemNameByID then
        itemName = C_Item.GetItemNameByID(itemID)
    end

    if not itemName and GetItemInfo then
        itemName = GetItemInfo(itemID)
    end

    return itemName
end

local function ItemMatchesSearch(itemID, query)
    if not itemID or not query then
        return false
    end

    if not IsItemAvailable(itemID) then
        return false
    end

    if TextMatchesSearch(itemID, query) then
        return true
    end

    local itemName = GetItemNameSafe(itemID)

    if itemName and TextMatchesSearch(itemName, query) then
        return true
    end

    local data =
        (DVD.ActiveItems and DVD.ActiveItems[itemID])
        or (DVD.decorItem and DVD.decorItem[itemID])

    if data and IsDataAvailable(data) then
        return
            TextMatchesSearch(data.name, query)
            or TextMatchesSearch(data.title, query)
            or TextMatchesSearch(data.questName, query)
            or TextMatchesSearch(data.bossName, query)
            or TextMatchesSearch(data.bossevent, query)
            or TextMatchesSearch(data.zone, query)
            or TextMatchesSearch(data.expansion, query)
            or TextMatchesSearch(data.category, query)
            or TextMatchesSearch(data.profession, query)
            or TextMatchesSearch(data.source, query)
            or TextMatchesSearch(data.sourceType, query)
            or TextMatchesSearch(data.note, query)
    end

    return false
end

local function ProfessionMatchesSearch(profession, item, query)
    if not query then
        return true
    end

    item = item or {}

    return
        TextMatchesSearch(profession and profession.name, query)
        or TextMatchesSearch(item.name, query)
        or TextMatchesSearch(item.title, query)
        or TextMatchesSearch(item.category, query)
        or TextMatchesSearch(item.skill, query)
        or TextMatchesSearch(item.expansion, query)
        or TextMatchesSearch(item.note, query)
        or TextMatchesSearch(item.id, query)
        or ItemMatchesSearch(item.id, query)
end

local function QuestMatchesSearch(group, quest, query)
    if not query then
        return true
    end

    quest = quest or {}

    return
        TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(quest.questName, query)
        or TextMatchesSearch(quest.name, query)
        or TextMatchesSearch(quest.title, query)
        or TextMatchesSearch(quest.zone, query)
        or TextMatchesSearch(quest.faction, query)
        or TextMatchesSearch(quest.category, query)
        or TextMatchesSearch(quest.expansion, query)
        or TextMatchesSearch(quest.note, query)
        or TextMatchesSearch(quest.id, query)
        or ItemMatchesSearch(quest.itemID, query)
        or ItemMatchesSearch(quest.rewardItemID, query)
        or ItemMatchesSearch(quest.decorItemID, query)
end

local function AchievementMatchesSearch(group, achieve, query)
    if not query then
        return true
    end

    achieve = achieve or {}

    return
        TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(achieve.name, query)
        or TextMatchesSearch(achieve.title, query)
        or TextMatchesSearch(achieve.category, query)
        or TextMatchesSearch(achieve.faction, query)
        or TextMatchesSearch(achieve.expansion, query)
        or TextMatchesSearch(achieve.note, query)
        or TextMatchesSearch(achieve.id, query)
        or ItemMatchesSearch(achieve.itemID, query)
        or ItemMatchesSearch(achieve.rewardItemID, query)
        or ItemMatchesSearch(achieve.decorItemID, query)
end

local function BossDropMatchesSearch(group, boss, query)
    if not query then
        return true
    end

    boss = boss or {}

    return
        TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(group and group.expansion, query)
        or TextMatchesSearch(boss.name, query)
        or TextMatchesSearch(boss.title, query)
        or TextMatchesSearch(boss.zone, query)
        or TextMatchesSearch(boss.category, query)
        or TextMatchesSearch(boss.expansion, query)
        or TextMatchesSearch(boss.bossName, query)
        or TextMatchesSearch(boss.bossevent, query)
        or TextMatchesSearch(boss.bossencounter, query)
        or TextMatchesSearch(boss.note, query)
        or TextMatchesSearch(boss.id, query)
        or ItemMatchesSearch(boss.id, query)
        or ItemMatchesSearch(boss.itemID, query)
end

local function VendorMatchesSearch(group, vendor, query)
    if not query then
        return true
    end

    vendor = vendor or {}

    if TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(group and group.expansion, query)
        or TextMatchesSearch(vendor.title, query)
        or TextMatchesSearch(vendor.name, query)
        or TextMatchesSearch(vendor.zone, query)
        or TextMatchesSearch(vendor.faction, query)
        or TextMatchesSearch(vendor.category, query)
        or TextMatchesSearch(vendor.expansion, query)
        or TextMatchesSearch(vendor.note, query)
        or TextMatchesSearch(vendor.id, query)
    then
        return true
    end

    local vendorData =
        DVD.vendorGoodies
        and DVD.vendorGoodies[vendor.id]

    local goodies =
        vendorData
        and (vendorData.items or vendorData)

    if goodies then
        for _, itemID in ipairs(goodies) do
            if ItemMatchesSearch(itemID, query) then
                return true
            end
        end
    end

    return false
end

-------------------------------------------------
-- Professions
-------------------------------------------------

function BuildProfessionList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    local catSel = DVD.filters.professions.professions
    local hasCategoryFilter = HasAnySelection(catSel)

    local expSel = DVD.filters.professions.expansions
    local hasExpFilter = HasAnySelection(expSel)

    local y = -6
    local hasContent = false

    local professions = DVD.professions or {}

    table.sort(professions, function(a, b)
        return (a.name or "") < (b.name or "")
    end)

    for _, profession in ipairs(professions) do
        if IsDataAvailable(profession) then
            local visible = {}
            local completedCount = 0
            local totalCount = 0

            for _, item in ipairs(profession.items or {}) do
                local include = true

                -- Hide unreleased/future profession rows.
                if include and not IsDataAvailable(item) then
                    include = false
                end

                -- Hide rows whose linked ActiveItems entry is unreleased/future.
                if include and item.id and not IsItemAvailable(item.id) then
                    include = false
                end

                -- Expansion filter
                if include and hasExpFilter then
                    if not item.expansion or not expSel[item.expansion] then
                        include = false
                    end
                end

                -- Profession/category filter
                if include and hasCategoryFilter then
                    local cat = item.category or profession.name

                    if not catSel[cat] then
                        include = false
                    end
                end

                -- Search filter
                if include and query and not ProfessionMatchesSearch(profession, item, query) then
                    include = false
                end

                if include then
                    totalCount = totalCount + 1

                    local learned = false

                    if item.spell then
                        learned = IsSpellKnown(item.spell) or IsPlayerSpell(item.spell)
                    end

                    local collected = false

                    if item.id and DVD.IsItemCollected then
                        collected = DVD.IsItemCollected(item.id)
                    end

                    if learned or collected then
                        completedCount = completedCount + 1
                    end

                    item.__learned = learned
                    item.__collected = collected

                    table.insert(visible, item)
                end
            end

            if #visible > 0 then
                hasContent = true

                local collapsed, newY =
                    DVD.CreateProfessionHeader(scrollChild, profession, y, completedCount, totalCount)

                y = newY

                if not collapsed then
                    for _, item in ipairs(visible) do
                        y = DVD.CreateProfessionLine(scrollChild, item, y)
                    end

                    y = y - 10
                end
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText(query and "No profession items match your search." or "No profession data available.")
        msg:SetTextColor(0.7, 0.7, 0.7)

        table.insert(DVD.activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 40)
end

-------------------------------------------------
-- Quests
-------------------------------------------------

function BuildQuestList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    selectedQuests = selectedQuests or {}

    local expSel = DVD.filters.quests.expansions
    local facSel = DVD.filters.quests.factions
    local catSel = DVD.filters.quests.categories

    local hasCategoryFilter = HasAnySelection(catSel)
    local hasFactionFilter = HasAnySelection(facSel)
    local hasExpansionFilter = HasAnySelection(expSel)

    local y = -6
    local hasContent = false

    local questGroups = {}

    for _, g in ipairs(DVD.quests or {}) do
        if IsDataAvailable(g) then
            table.insert(questGroups, g)
        end
    end

    table.sort(questGroups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(questGroups) do
        local visible = {}

        for _, quest in ipairs(group.quests or {}) do
            if quest then
                local include = true
                local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

                -- Hide unreleased/future quest rows.
                if include and not IsDataAvailable(quest) then
                    include = false
                end

                -- Hide rows whose linked reward/decor item is unreleased/future.
                if include and quest.itemID and not IsItemAvailable(quest.itemID) then
                    include = false
                end

                if include and quest.rewardItemID and not IsItemAvailable(quest.rewardItemID) then
                    include = false
                end

                if include and quest.decorItemID and not IsItemAvailable(quest.decorItemID) then
                    include = false
                end

                -- Expansion filter
                if include and hasExpansionFilter then
                    if not quest.expansion or not expSel[quest.expansion] then
                        include = false
                    end
                end

                -- Hide completed
                if include
                    and isCompleted
                    and vendorSettings.hideCompletedThings
                    and not vendorSettings.markCompletedThings
                then
                    include = false
                end

                -- Faction filter
                if include and hasFactionFilter then
                    local f = quest.faction and string.lower(quest.faction)

                    if f and not facSel[f] then
                        include = false
                    end
                end

                -- Category filter
                if include and hasCategoryFilter then
                    local cat = quest.category or group.name

                    if not catSel[cat] then
                        include = false
                    end
                end

                -- Search filter
                if include and query and not QuestMatchesSearch(group, quest, query) then
                    include = false
                end

                if include then
                    table.insert(visible, quest)
                end
            end
        end

        if #visible > 0 then
            hasContent = true

            local total, completed = 0, 0

            for _, quest in ipairs(visible) do
                total = total + 1

                if DVD.IsQuestEffectivelyCompleted(quest) then
                    completed = completed + 1
                end
            end

            local collapsed, newY =
                DVD.CreateQuestHeader(scrollChild, group, y, completed, total)

            y = newY

            if not collapsed then
                for _, quest in ipairs(visible) do
                    y = DVD.CreateQuestLine(scrollChild, quest, y)
                end

                y = y - 10
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText(query and "No quests match your search." or "No quest data available.")
        msg:SetTextColor(0.7, 0.7, 0.7)

        table.insert(DVD.activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

-------------------------------------------------
-- Achievements
-------------------------------------------------

function BuildAchievementList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    local groupSel = DVD.filters.achievements.groups
    local facSel = DVD.filters.achievements.factions

    local hasGroupFilter = HasAnySelection(groupSel)
    local hasFactionFilter = HasAnySelection(facSel)

    local y = -6
    local hasContent = false

    local achieveGroups = {}

    for _, g in ipairs(DVD.achievements or {}) do
        if IsDataAvailable(g) then
            achieveGroups[#achieveGroups + 1] = g
        end
    end

    table.sort(achieveGroups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(achieveGroups) do
        if hasGroupFilter and not groupSel[group.name] then
            -- skip this group
        else
            local visible = {}

            for _, achieve in ipairs(group.achievements or {}) do
                local include = true

                -- Hide unreleased/future achievement rows.
                if include and not IsDataAvailable(achieve) then
                    include = false
                end

                -- Hide rows whose linked reward/decor item is unreleased/future.
                if include and achieve.itemID and not IsItemAvailable(achieve.itemID) then
                    include = false
                end

                if include and achieve.rewardItemID and not IsItemAvailable(achieve.rewardItemID) then
                    include = false
                end

                if include and achieve.decorItemID and not IsItemAvailable(achieve.decorItemID) then
                    include = false
                end

                local completed = false

                if include and DVD.IsAchievementComplete then
                    completed = DVD.IsAchievementComplete(achieve.id)
                end

                if include
                    and completed
                    and vendorSettings.hideCompletedThings
                    and not vendorSettings.markCompletedThings
                then
                    include = false
                end

                achieve.__isCompleted = completed

                if include and hasFactionFilter then
                    local f = achieve.faction and string.lower(achieve.faction)

                    if not facSel[f] then
                        include = false
                    end
                end

                -- Search filter
                if include and query and not AchievementMatchesSearch(group, achieve, query) then
                    include = false
                end

                if include then
                    table.insert(visible, achieve)
                end
            end

            if #visible > 0 then
                hasContent = true

                local total, completed = 0, 0

                for _, achieve in ipairs(visible) do
                    total = total + 1

                    if DVD.IsAchievementComplete and DVD.IsAchievementComplete(achieve.id) then
                        completed = completed + 1
                    end
                end

                local collapsed, newY =
                    DVD.CreateAchievementHeader(
                        scrollChild,
                        group.name,
                        y,
                        completed,
                        total
                    )

                y = newY

                if not collapsed then
                    for _, achieve in ipairs(visible) do
                        y = DVD.CreateAchievementLine(scrollChild, achieve, y)
                    end

                    y = y - 10
                end
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText(query and "No achievements match your search." or "No achievement data available.")
        msg:SetTextColor(0.7, 0.7, 0.7)

        table.insert(DVD.activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

-------------------------------------------------
-- Boss Drops
-------------------------------------------------

function BuildBossDropList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    local y = -6
    local hasContent = false

    local expSel = DVD.filters.bossdrops.expansions
    local catSel = DVD.filters.bossdrops.categories

    local hasExpansionFilter = HasAnySelection(expSel)
    local hasCategoryFilter = HasAnySelection(catSel)

    local groups = {}

    for _, g in ipairs(DVD.bossdrops or {}) do
        if IsDataAvailable(g) then
            groups[#groups + 1] = g
        end
    end

    table.sort(groups, function(a, b)
        return (a.name or "") < (b.name or "")
    end)

    for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter
            or DVD.filters.bossdrops.expansions[group.expansion]

        if passesExpansion then
            local visible = {}
            local total = 0
            local collected = 0

            for _, boss in ipairs(group.items or {}) do
                local include = true

                -- Hide unreleased/future boss drop rows.
                if include and not IsDataAvailable(boss) then
                    include = false
                end

                -- Boss drop boss.id is usually the itemID in your data.
                if include and boss.id and not IsItemAvailable(boss.id) then
                    include = false
                end

                if include and boss.itemID and not IsItemAvailable(boss.itemID) then
                    include = false
                end

                local isCollected = false

                if include and DVD.IsItemCollected then
                    isCollected = DVD.IsItemCollected(boss.id)
                end

                -- Category filter
                if include and hasCategoryFilter then
                    local cat = boss.category or group.name

                    if not catSel[cat] then
                        include = false
                    end
                end

                -- Hide collected
                if include and vendorSettings.hideCollectedBossDrops and isCollected then
                    include = false
                end

                -- Search filter
                if include and query and not BossDropMatchesSearch(group, boss, query) then
                    include = false
                end

                if include then
                    total = total + 1

                    if isCollected then
                        collected = collected + 1
                    end

                    table.insert(visible, boss)
                end
            end

            if #visible > 0 then
                hasContent = true

                local collapsed, newY =
                    DVD.CreateBossDropHeader(scrollChild, group, collected, total, y)

                y = newY

                if not collapsed then
                    for _, boss in ipairs(visible) do
                        y = DVD.CreateBossDropLine(scrollChild, boss, y)
                    end

                    y = y - 10
                end
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText(query and "No boss drops match your search." or "No boss drop data available.")
        msg:SetTextColor(0.7, 0.7, 0.7)

        table.insert(DVD.activeWidgets, msg)
    end

    scrollChild:SetHeight(math.max(800, math.abs(y) + 40))
end

-------------------------------------------------
-- Vendors
-------------------------------------------------

--[[function BuildVendorList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    local y = 0
    local hasContent = false

    local expSel = DVD.filters.vendors.expansions
    local facSel = DVD.filters.vendors.factions
    local catSel = DVD.filters.vendors.categories

    local hasExpansionFilter = HasAnySelection(expSel)
    local hasFactionFilter = HasAnySelection(facSel)
    local hasCategoryFilter = HasAnySelection(catSel)

    local groups = {}

    for _, group in ipairs(DVD.npcs or {}) do
        if IsDataAvailable(group) then
            groups[#groups + 1] = group
        end
    end

    table.sort(groups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter
            or expSel[group.expansion]

        if passesExpansion then
            local visibleVendors = {}

            for _, vendor in ipairs(group.vendors or {}) do
                local includeVendor = true

                -- Hide unreleased/future vendor rows.
                if includeVendor and not IsDataAvailable(vendor) then
                    includeVendor = false
                end

                -- Faction filter
                local passesFaction =
                    not hasFactionFilter
                    or facSel[vendor.faction]

                if includeVendor and not passesFaction then
                    includeVendor = false
                end

                -- Category / requirement filter
                if includeVendor and hasCategoryFilter then
                    local cat = vendor.category

                    if cat and cat ~= "" then
                        cat = string.lower(cat)
                    else
                        cat = "none"
                    end

                    local matches = false

                    for selectedCategory, enabled in pairs(catSel) do
                        if enabled then
                            selectedCategory = string.lower(selectedCategory)

                            if selectedCategory == cat then
                                matches = true
                                break
                            end
                        end
                    end

                    if not matches then
                        includeVendor = false
                    end
                end

-- Search filter
                if includeVendor and query and not VendorMatchesSearch(group, vendor, query) then
                    includeVendor = false
                end

                -- 🚀 THE DYNAMIC PROFESSION FILTER TRICK:
                -- If a vendor is hard-linked to a specific profession, we scan the player's 
                -- current profile. If they don't match, we drop them from the visible listing!
                if includeVendor and vendor.profession then
                    local playerHasProfession = false
                    
                    -- Query the WoW API for the character's active professions
                    local prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions()
                    local activeProfIndices = { prof1, prof2 } -- We check primary professions only

                    for _, index in pairs(activeProfIndices) do
                        if index then
                            local name, _, _, _, _, _, _, _, _, _ = GetProfessionInfo(index)
                            if name and string.lower(name) == string.lower(vendor.profession) then
                                playerHasProfession = true
                                break
                            end
                        end
                    end

                    -- If the player doesn't know this craft right now, hide the merchant card!
                    if not playerHasProfession then
                        includeVendor = false
                    end
                end

                -- Found status
                if includeVendor then
                    local isFound = false

                    if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                        local playerFaction = UnitFactionGroup("player")
                        playerFaction = playerFaction and playerFaction:lower()

                        if vendor.faction == playerFaction or vendor.faction == "neutral" then
                            isFound = true
                        end
                    end

                    vendor.__isFound = isFound

                    -- 🚀 THE HIDE FOUND FILTER INTEGRATION:
                    -- If the player checked "Hide Found Vendors" in options, and this vendor is visited,
                    -- exclude it entirely right here from the active collection pipeline.
                    if vendorSettings and vendorSettings.hideFoundVendors and isFound then
                        includeVendor = false
                    end
                end

                if includeVendor then
                    table.insert(visibleVendors, vendor)
                end
            end

            if #visibleVendors > 0 then
                hasContent = true

                table.sort(visibleVendors, function(a, b)
                    return (a.title or ""):lower() < (b.title or ""):lower()
                end)

                local total, completed = 0, 0

                -- Count only available vendors so unreleased rows do not affect progress.
                for _, vendor in ipairs(group.vendors or {}) do
                    if IsDataAvailable(vendor) then
                        total = total + 1

                        if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                            completed = completed + 1
                        end
                    end
                end

                local _, collapsed, newY =
                    DVD.CreateVendorHeader(scrollChild, group, y, completed, total)

                y = newY

                if not collapsed then
                    for _, vendor in ipairs(visibleVendors) do
                        y = DVD.CreateVendorLine(scrollChild, vendor, y)
                    end

                    y = y - 10
                end
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText(query and "No vendors match your search." or "No vendors match these filters.")
        msg:SetTextColor(0.7, 0.7, 0.7)

        table.insert(DVD.activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end
]]

function BuildVendorList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    local y = 0
    local hasContent = false

    local expSel = DVD.filters.vendors.expansions
    local facSel = DVD.filters.vendors.factions
    local catSel = DVD.filters.vendors.categories

    local hasExpansionFilter = HasAnySelection(expSel)
    local hasFactionFilter = HasAnySelection(facSel)
    local hasCategoryFilter = HasAnySelection(catSel)

    -- ========================================================
    -- 🚀 STEP 1: DYNAMIC DICTIONARY RE-GROUPER
    -- Maps your clean flat database lines out by zoneGroup!
    -- ========================================================
    local groupMap = {}
    local groups = {}

    for npcID, vendor in pairs(DVD.npcs or {}) do
        if IsDataAvailable(vendor) then
            -- Set vendor.id from the primary number key so item popup clicks work!
            vendor.id = npcID 

            local gKey = vendor.zoneGroup or "Unknown Location"
            if not groupMap[gKey] then
                groupMap[gKey] = {
                    zoneGroup = gKey, -- 🌟 Explicitly sets zoneGroup
                    expansion = vendor.expansion or "Classic", 
                    vendors = {}
                }
                table.insert(groups, groupMap[gKey])
            end
            table.insert(groupMap[gKey].vendors, vendor)
        end
    end

    -- Alphabetize headers by zoneGroup
    table.sort(groups, function(a, b)
        return (a.zoneGroup or ""):lower() < (b.zoneGroup or ""):lower()
    end)

    -- ========================================================
    -- STEP 2: LOOP AND FILTER THE VISIBLE ROWS
    -- ========================================================
    for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter
            or expSel[group.expansion]

        if passesExpansion then
            local visibleVendors = {}

            for _, vendor in ipairs(group.vendors or {}) do
                local includeVendor = true

                -- Hide unreleased/future vendor rows.
                if includeVendor and not IsDataAvailable(vendor) then
                    includeVendor = false
                end

                -- Faction filter
                local passesFaction =
                    not hasFactionFilter
                    or facSel[vendor.faction]

                if includeVendor and not passesFaction then
                    includeVendor = false
                end

                -- Category / requirement filter
                if includeVendor and hasCategoryFilter then
                    local cat = vendor.category

                    if cat and cat ~= "" then
                        cat = string.lower(cat)
                    end

                    local matches = false

                    for selectedCategory, enabled in pairs(catSel) do
                        if enabled then
                            selectedCategory = string.lower(selectedCategory)

                            if selectedCategory == cat then
                                matches = true
                                break
                            end
                        end
                    end

                    if not matches then
                        includeVendor = false
                    end
                end

                -- Search filter
                if includeVendor and query and not VendorMatchesSearch(group, vendor, query) then
                    includeVendor = false
                end

                -- Dynamic Profession Check
                if includeVendor and vendor.profession then
                    local playerHasProfession = false
                    
                    local prof1, prof2 = GetProfessions()
                    local activeProfIndices = { prof1, prof2 }

                    for _, index in pairs(activeProfIndices) do
                        if index then
                            local name = GetProfessionInfo(index)
                            if name and string.lower(name) == string.lower(vendor.profession) then
                                playerHasProfession = true
                                break
                            end
                        end
                    end

                    if not playerHasProfession then
                        includeVendor = false
                    end
                end

                -- Found status
                if includeVendor then
                    local isFound = false

                    if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                        local playerFaction = UnitFactionGroup("player")
                        playerFaction = playerFaction and playerFaction:lower()

                        if vendor.faction == playerFaction or vendor.faction == "neutral" then
                            isFound = true
                        end
                    end

                    vendor.__isFound = isFound

                    -- Hide Found filter
                    if vendorSettings and vendorSettings.hideFoundVendors and isFound then
                        includeVendor = false
                    end
                end

                if includeVendor then
                    table.insert(visibleVendors, vendor)
                end
            end

            if #visibleVendors > 0 then
                hasContent = true

                table.sort(visibleVendors, function(a, b)
                    return (a.title or ""):lower() < (b.title or ""):lower()
                end)

                -- Calculate total progress milestones
                local total, completed = 0, 0
                for _, vendor in ipairs(group.vendors or {}) do
                    total = total + 1
                    if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                        completed = completed + 1
                    end
                end

                local _, collapsed, newY =
                    DVD.CreateVendorHeader(scrollChild, group, y, completed, total)

                y = newY

                if not collapsed then
                    for _, vendor in ipairs(visibleVendors) do
                        y = DVD.CreateVendorLine(scrollChild, vendor, y)
                    end

                    y = y - 10
                end
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText(query and "No vendors match your search." or "No vendors match these filters.")
        msg:SetTextColor(0.7, 0.7, 0.7)

        table.insert(DVD.activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end



-------------------------------------------------
-- Main UI Router
-------------------------------------------------

function DVD.BuildVendorUI()
    if not DVD.catalogReady then
        return
    end

    if DVD.currentTab == "vendors" then
        BuildVendorList()

    elseif DVD.currentTab == "professions" then
        BuildProfessionList()

    elseif DVD.currentTab == "quests" then
        BuildQuestList()

    elseif DVD.currentTab == "achievements" then
        BuildAchievementList()

    elseif DVD.currentTab == "bossdrops" then
        BuildBossDropList()
    end

    DVD.filtersJustChanged = false
end

-- Compatibility wrapper.
-- Older DecorVendor code still calls BuildVendorUI() directly.
function BuildVendorUI()
    return DVD.BuildVendorUI()
end