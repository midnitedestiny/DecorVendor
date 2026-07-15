--[[
============================================================
Decor Vendor Addon — Shared UI and Logic Helpers
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]
local addonName, DVD = ...

-------------------------------------------------
-- 🌟 ROUTER CONNECT: Grab Data Engine Master Table
-------------------------------------------------
--local masterNpcs = DVD and DVD.npcs or {}

-------------------------------------------------
-- Accordion Header Helper
-- Opens one header and collapses the others in the same tab.
-------------------------------------------------

function DVD.ToggleAccordionHeader(tab, openKey)
    DVD.collapsedHeaders = DVD.collapsedHeaders or {}

    local wasOpen = DVD.collapsedHeaders[openKey] == false

    -- Collapse all headers for the current tab first safely.
    if tab == "vendors" then
        for _, vendor in pairs(DVD.npcs or {}) do
            if type(vendor) == "table" then
                local key = vendor.zoneGroup or vendor.zone or vendor.title
                if key then
                    DVD.collapsedHeaders[key] = true
                end
            end
        end

    elseif tab == "professions" then
        for _, profession in ipairs(DVD.professions or {}) do
            if profession.name then
                DVD.collapsedHeaders["prof_" .. profession.name] = true
            end
        end

    elseif tab == "quests" then
        for _, group in ipairs(DVD.quests or {}) do
            if group.name then
                DVD.collapsedHeaders["quest_" .. group.name] = true
            end
        end

    elseif tab == "achievements" then
        for _, group in ipairs(DVD.achievements or {}) do
            if group.name then
                DVD.collapsedHeaders["ach_" .. group.name] = true
            end
        end

    elseif tab == "bossdrops" then
        for _, group in ipairs(DVD.bossdrops or {}) do
            if group.name then
                DVD.collapsedHeaders["boss_" .. group.name] = true
            end
        end
    end

    -- If it was already open, leave everything collapsed. Otherwise, open this one.
    if not wasOpen then
        DVD.collapsedHeaders[openKey] = false
    end

    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end
end

function DVD.HasAnySelection(tbl)
    if not tbl then return false end
    for _, v in pairs(tbl) do
        if v then return true end
    end
    return false
end

function DVD.GetHeaderWidth()
    local frame = DVD.frame or _G.DV_MainFrame
    if not frame then return 560 end

    if DVD.currentTab == "professions" then
        return frame:GetWidth() - 40
    end

    local sidebarWidth = 0
    if frame.sidebar then
        sidebarWidth = frame.sidebar:GetWidth()
    elseif DVD.sidebar then
        sidebarWidth = DVD.sidebar:GetWidth()
    end

    return frame:GetWidth() - sidebarWidth - 40
end

function DVD.BuildProfessionLookup()
    DVD.itemToProfession = {}
    for _, profession in ipairs(DVD.professions or {}) do
        for _, recipe in ipairs(profession.items or {}) do
            DVD.itemToProfession[recipe.id] = profession.name
        end
    end
end

function DVD:GetItemData(itemID)
    return self.ActiveItems[itemID]
end

function DVD.IsItemCollected(itemID)
    local itemData = DVD.ActiveItems[itemID]
    local noxp = itemData and itemData.noxp

    -- Correct cache usage
    if noxp then
        if vendorSettings.completedDropNoXP[itemID] then return true end
    else
        if vendorSettings.completedDrop[itemID] then return true end
    end

    if DVD.collectionCache[itemID] ~= nil then
        return DVD.collectionCache[itemID]
    end

    local decorID = itemData and itemData.decorID
    if not decorID then
        DVD.collectionCache[itemID] = false
        return false
    end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorID, true)
    local isCollected = false

    if info then
        if noxp then
            -- ONLY these rules for NOXP
            if info.quantity > 0 or info.remainingRedeemable > 0 or info.numPlaced > 0 then
                isCollected = true
            end
        else
            -- ONLY this rule for normal items
            if info.firstAcquisitionBonus == 0 then
                isCollected = true
            end
        end
    end

    if isCollected then
        if noxp then
            vendorSettings.completedDropNoXP[itemID] = true
        else
            vendorSettings.completedDrop[itemID] = true
        end

        DVD.collectionCache[itemID] = true
        return true
    end

    DVD.collectionCache[itemID] = false
    return false
end


-------------------------------------------------
-- Modernized Progression Completion Checking
-------------------------------------------------

function DVD.IsQuestEffectivelyCompleted(quest)
    if not quest then return false end

    -- QUEST COMPLETION (ACCOUNT-WIDE Modern API Safeguard)
    if type(quest.id) == "number" then
        if C_QuestLog.IsQuestFlaggedCompletedOnAccount then
            if C_QuestLog.IsQuestFlaggedCompletedOnAccount(quest.id) then return true end
        elseif C_QuestLog.IsQuestFlaggedCompleted then
            if C_QuestLog.IsQuestFlaggedCompleted(quest.id) then return true end
        end
    end

    -- ITEM COLLECTION (ACCOUNT-WIDE)
    if quest.itemID then
        if type(quest.itemID) == "table" then
            for _, itemID in ipairs(quest.itemID) do
                if DVD.IsItemCollected and DVD.IsItemCollected(itemID) then return true end
            end
        elseif type(quest.itemID) == "number" then
            if DVD.IsItemCollected and DVD.IsItemCollected(quest.itemID) then return true end
        end
    end

    return false
end


-------------------------------------------------
-- Modernized Profession and Achievement Parsers
-------------------------------------------------

function DVD.CountProfessionItems(profession)
    local total = 0
    local completed = 0

    for _, item in ipairs(profession.items or {}) do
        total = total + 1

        local learned = false
        if item.spell then
            -- Modern retail API checks fallback compatibility loop
            if C_Spell and C_Spell.IsSpellKnown then
                learned = C_Spell.IsSpellKnown(item.spell)
            else
                learned = IsSpellKnown(item.spell) or IsPlayerSpell(item.spell)
            end
        end

        local collected = false
        if item.id and DVD.IsItemCollected then
            collected = DVD.IsItemCollected(item.id)
        end

        if learned or collected then
            completed = completed + 1
        end
    end

    return completed, total
end

function DVD.IsAchievementComplete(achievementID)
    if not achievementID then return false end

    if vendorSettings.completedAchievs[achievementID] then
        return true
    end

    -- Modern retail API checking mapping
    local getAchInfo = (C_Achievement and C_Achievement.GetAchievementInfo) or GetAchievementInfo
    local success, _, _, _, completed = pcall(getAchInfo, achievementID)
    
    if success and completed then
        vendorSettings.completedAchievs[achievementID] = true
    end

    return (success and completed) or false
end

 --[[function DVD.IsAchievementComplete(achievementID)
    if not achievementID then return false end

    if vendorSettings.completedAchievs[achievementID] then
        return true
    end

    local _, _, _, completed = GetAchievementInfo(achievementID)
    if completed then
        vendorSettings.completedAchievs[achievementID] = true
    end

    return completed or false
end]]

-- ============================================================
-- Tab scroll frames helper
-- ============================================================
function DVD.CreateTabScrollFrame(tabFrame)
    local scroll = CreateFrame("ScrollFrame", nil, tabFrame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 0, -26)
    scroll:SetPoint("BOTTOMRIGHT", -20, 0)

    local child = CreateFrame("Frame", nil, scroll)
    child:SetWidth(1)
    child:SetHeight(1)
    scroll:SetScrollChild(child)

    scroll:SetScript("OnSizeChanged", function(self, width)
        child:SetWidth(width)
    end)

    return scroll, child
end