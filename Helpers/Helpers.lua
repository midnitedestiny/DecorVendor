--[[
============================================================
Decor Vendor Addon — Shared UI and Logic Helpers
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]
local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Helpers:|r constants are missing.")
    return
end

local Sizing = C.ListFrameSizing

if not Sizing then
    print("|cffff4040DecorVendor Helpers:|r ListFrameSizing is missing.")
    return
end

-------------------------------------------------
-- Label Color Helper
-------------------------------------------------
function DVD.ColorizeLabel(label, colorTable, key)
    label = tostring(label or "Unknown")
    key = key or label

    local hex =
        colorTable and
        (colorTable[key] or colorTable[string.lower(tostring(key))] or colorTable.unknown or colorTable.Unknown) or
        "888888"

    return "|cff" .. tostring(hex) .. label .. "|r"
end

local function ScaleFontString(fontString, multiplier)
    if not fontString or not fontString.GetFont or not fontString.SetFont then
        return
    end

    local fontPath, fontSize, fontFlags = fontString:GetFont()

    if not fontPath or not fontSize then
        return
    end

    -- Remember the original size so repeated refreshes do not
    -- keep multiplying the already-scaled font.
    fontString.DVDBaseFontSize = fontString.DVDBaseFontSize or fontSize

    fontString:SetFont(fontPath, fontString.DVDBaseFontSize * multiplier, fontFlags)
end

local function ScaleFrameFontsRecursive(frame, multiplier, visited)
    if not frame then
        return
    end

    visited = visited or {}

    if visited[frame] then
        return
    end

    visited[frame] = true

    -------------------------------------------------
    -- FontStrings directly attached to this frame
    -------------------------------------------------
    if frame.GetRegions then
        local regions = {frame:GetRegions()}

        for _, region in ipairs(regions) do
            if region and region.GetObjectType and region:GetObjectType() == "FontString" then
                ScaleFontString(region, multiplier)
            end
        end
    end

    -------------------------------------------------
    -- Button/EditBox primary font string
    -------------------------------------------------
    if frame.GetFontString then
        local fontString = frame:GetFontString()

        if fontString then
            ScaleFontString(fontString, multiplier)
        end
    end

    -------------------------------------------------
    -- Recurse through child frames
    -------------------------------------------------
    if frame.GetChildren then
        local children = {frame:GetChildren()}

        for _, child in ipairs(children) do
            ScaleFrameFontsRecursive(child, multiplier, visited)
        end
    end
end

function DVD.ApplyAddonTextScale()
    local multiplier = tonumber(vendorSettings and vendorSettings.textScale) or 1.25

    -- Main Decor Vendor frame
    if DVD.frame then
        ScaleFrameFontsRecursive(DVD.frame, multiplier)
    end

    -- Gallery frame, if currently created
    if DVD.Gallery and DVD.Gallery.frame then
        ScaleFrameFontsRecursive(DVD.Gallery.frame, multiplier)
    end

    if _G.DecorVendorGalleryFrame and (not DVD.Gallery or DVD.Gallery.frame ~= _G.DecorVendorGalleryFrame) then
        ScaleFrameFontsRecursive(_G.DecorVendorGalleryFrame, multiplier)
    end
end
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

    if DVD.RequestUpdate then
        DVD.RequestUpdate()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    elseif type(BuildVendorUI) == "function" then
        BuildVendorUI()
    end
end

function DVD.HasAnySelection(tbl)
    if type(tbl) ~= "table" then
        return false
    end

    for _, value in pairs(tbl) do
        if value then
            return true
        end
    end

    return false
end

function DVD.GetHeaderWidth()
    local frame = DVD.frame or _G.DV_MainFrame

    if not frame then
        return Sizing.FallbackHeaderWidth or 560
    end

    local horizontalPadding = tonumber(Sizing.HeaderHorizontalPadding) or 40

    local frameWidth = tonumber(frame:GetWidth()) or Sizing.FallbackHeaderWidth or 560

    -- Professions use the wider content area without
    -- the normal sidebar deduction.
    if DVD.currentTab == "professions" then
        return math.max(1, frameWidth - horizontalPadding)
    end

    local sidebarWidth = 0

    if frame.sidebar and frame.sidebar.GetWidth then
        sidebarWidth = tonumber(frame.sidebar:GetWidth()) or 0
    elseif DVD.sidebar and DVD.sidebar.GetWidth then
        sidebarWidth = tonumber(DVD.sidebar:GetWidth()) or 0
    end

    return math.max(1, frameWidth - sidebarWidth - horizontalPadding)
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
    if type(self.ActiveItems) ~= "table" or itemID == nil then
        return nil
    end

    local numericItemID = tonumber(itemID)

    return self.ActiveItems[itemID] or (numericItemID and self.ActiveItems[numericItemID]) or
        self.ActiveItems[tostring(itemID)]
end

function DVD.IsItemCollected(itemID)
    local numericItemID = tonumber(itemID)

    itemID = numericItemID or itemID

    if itemID == nil then
        return false
    end

    local activeItems = DVD.ActiveItems or {}

    local itemData = activeItems[itemID] or activeItems[tostring(itemID)]

    local noxp = itemData and itemData.noxp == true

    -------------------------------------------------
    -- Saved-variable tables
    -------------------------------------------------

    vendorSettings = vendorSettings or {}

    vendorSettings.completedDrop = vendorSettings.completedDrop or {}

    vendorSettings.completedDropNoXP = vendorSettings.completedDropNoXP or {}

    DVD.collectionCache = DVD.collectionCache or {}

    -------------------------------------------------
    -- Persistent completion cache
    -------------------------------------------------

    if noxp then
        if vendorSettings.completedDropNoXP[itemID] then
            return true
        end
    else
        if vendorSettings.completedDrop[itemID] then
            return true
        end
    end

    -------------------------------------------------
    -- Runtime collection cache
    -------------------------------------------------

    if DVD.collectionCache[itemID] ~= nil then
        return DVD.collectionCache[itemID]
    end

    local decorID = itemData and tonumber(itemData.decorID)

    if not decorID then
        DVD.collectionCache[itemID] = false
        return false
    end

    -------------------------------------------------
    -- Housing Catalog lookup
    -------------------------------------------------

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        -- Do not cache this temporary API-unavailable state.
        return false
    end

    local entryType = Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1

    local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, entryType, decorID, true)

    if not ok or type(info) ~= "table" then
        -- Catalog information may still be loading.
        -- Caching false here would prevent a later refresh.
        return false
    end

    -------------------------------------------------
    -- Collection rules
    -------------------------------------------------

    local isCollected = false

    if noxp then
        local stored = tonumber(info.quantity or info.totalNumStored or info.numStored) or 0

        local redeemable = tonumber(info.remainingRedeemable or info.numRedeemable) or 0

        local placed = tonumber(info.numPlaced or info.totalNumPlaced) or 0

        isCollected = stored > 0 or redeemable > 0 or placed > 0
    else
        isCollected = tonumber(info.firstAcquisitionBonus) == 0
    end

    -------------------------------------------------
    -- Save result
    -------------------------------------------------

    if isCollected then
        if noxp then
            vendorSettings.completedDropNoXP[itemID] = true
        else
            vendorSettings.completedDrop[itemID] = true
        end
    end

    DVD.collectionCache[itemID] = isCollected

    return isCollected
end

-------------------------------------------------
-- Modernized Progression Completion Checking
-------------------------------------------------

function DVD.IsQuestEffectivelyCompleted(quest)
    if not quest then
        return false
    end

    -- ITEM COLLECTION (ACCOUNT-WIDE) - Check this first so uncollected items keep the quest visible
    if quest.itemID then
        if type(quest.itemID) == "table" then
            local allCollected = true
            for _, itemID in ipairs(quest.itemID) do
                if not (DVD.IsItemCollected and DVD.IsItemCollected(itemID)) then
                    allCollected = false
                    break
                end
            end
            -- Only consider it completed if EVERY item in the table is collected
            if allCollected then 
                return true 
            else
                return false
            end
        elseif type(quest.itemID) == "number" then
            if DVD.IsItemCollected and DVD.IsItemCollected(quest.itemID) then
                return true
            else
                return false
            end
        end
    end

    -- QUEST COMPLETION (ACCOUNT-WIDE Modern API Safeguard) - Used only for quests without specific item IDs
    local questID = tonumber(quest.id)

    if questID then
        if
            C_QuestLog and C_QuestLog.IsQuestFlaggedCompletedOnAccount and
                C_QuestLog.IsQuestFlaggedCompletedOnAccount(questID)
         then
            return true
        end

        if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(questID) then
            return true
        end
    end

    return false
end

--[[
function DVD.IsQuestEffectivelyCompleted(quest)
    if not quest then
        return false
    end

    -- ITEM COLLECTION (ACCOUNT-WIDE) - Check this first so uncollected items keep the quest visible
    if quest.itemID then
        if type(quest.itemID) == "table" then
            local allCollected = true
            for _, itemID in ipairs(quest.itemID) do
                if not (DVD.IsItemCollected and DVD.IsItemCollected(itemID)) then
                    allCollected = false
                    break
                end
            end
            -- Only consider it completed if EVERY item in the table is collected
            if allCollected then 
                return true 
            else
                return false
            end
        elseif type(quest.itemID) == "number" then
            if DVD.IsItemCollected and DVD.IsItemCollected(quest.itemID) then
                return true
            else
                return false
            end
        end
    end

    -- QUEST COMPLETION (ACCOUNT-WIDE Modern API Safeguard) - Handles single ID or table of IDs
    if quest.id then
        if type(quest.id) == "table" then
            for _, qID in ipairs(quest.id) do
                local qNum = tonumber(qID)
                if qNum then
                    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompletedOnAccount and C_QuestLog.IsQuestFlaggedCompletedOnAccount(qNum) then
                        return true
                    end
                    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(qNum) then
                        return true
                    end
                end
            end
        else
            local questID = tonumber(quest.id)
            if questID then
                if C_QuestLog and C_QuestLog.IsQuestFlaggedCompletedOnAccount and C_QuestLog.IsQuestFlaggedCompletedOnAccount(questID) then
                    return true
                end
                if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(questID) then
                    return true
                end
            end
        end
    end

    return false
end]]
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
    achievementID = tonumber(achievementID)

    if not achievementID then
        return false
    end

    vendorSettings = vendorSettings or {}

    vendorSettings.completedAchievs = vendorSettings.completedAchievs or {}

    if vendorSettings.completedAchievs[achievementID] then
        return true
    end

    local completed = false

    -------------------------------------------------
    -- Table-style achievement API
    -------------------------------------------------

    if C_AchievementInfo and C_AchievementInfo.GetAchievementInfo then
        local ok, info = pcall(C_AchievementInfo.GetAchievementInfo, achievementID)

        if ok and type(info) == "table" then
            completed = info.completed == true or info.wasEarnedByMe == true or (info.earnedBy and info.earnedBy ~= "")
        end
    end

    -------------------------------------------------
    -- Legacy multiple-return API
    -------------------------------------------------

    if not completed and GetAchievementInfo then
        local ok, _, _, _, isCompleted, _, _, _, _, _, _, _, _, wasEarnedByMe = pcall(GetAchievementInfo, achievementID)

        if ok then
            completed = isCompleted == true or wasEarnedByMe == true
        end
    end

    if completed then
        vendorSettings.completedAchievs[achievementID] = true
    end

    return completed
end

-- ============================================================
-- Tab scroll frames helper
-- ============================================================
function DVD.CreateTabScrollFrame(tabFrame)
    if not tabFrame then
        return nil, nil
    end

    local topOffset = tonumber(Sizing.TabScrollTopOffset) or 26

    local rightInset = tonumber(Sizing.TabScrollRightInset) or 20

    local initialSize = tonumber(Sizing.InitialScrollChildSize) or 1

    local scroll = CreateFrame("ScrollFrame", nil, tabFrame, "UIPanelScrollFrameTemplate")

    scroll:SetPoint("TOPLEFT", 0, -topOffset)

    scroll:SetPoint("BOTTOMRIGHT", -rightInset, 0)

    local child = CreateFrame("Frame", nil, scroll)

    child:SetSize(initialSize, initialSize)

    scroll:SetScrollChild(child)

    scroll:SetScript(
        "OnSizeChanged",
        function(_, width)
            child:SetWidth(math.max(initialSize, tonumber(width) or initialSize))
        end
    )

    return scroll, child
end
