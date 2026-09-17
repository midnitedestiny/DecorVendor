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
local Gallery = DVD.Gallery
if not C then
    print("|cffff4040DecorVendor QuestRows:|r constants are missing.")
    return
end

local Sizing = C.QuestRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor QuestRows:|r QuestRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor QuestRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end

local COLORS = C.COLORS or {}

-- Create a session anchor string to pass down parent header category names
local currentGroupName = "World Quest"

-- ============================================================
-- 🛡️ SHARED QUEST ACCORDION HEADER
-- ============================================================
function DVD.CreateQuestHeader(parent, questGroup, y, completed, total)
    if type(questGroup) == "table" and questGroup.name then
        currentGroupName = questGroup.name
    elseif type(questGroup) == "string" then
        currentGroupName = questGroup
    else
        currentGroupName = "World Quest"
    end

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "quests",
        key = "quest_" .. currentGroupName,
        title = currentGroupName,
        completed = completed,
        total = total,
        progressLabel = "completed",
        defaultCollapsed = true,
        spacing = Sizing.HeaderSpacing,
		useLegacyToggle = true,
    })

    return collapsed, newY
end

-------------------------------------------------
-- Quest Grid — own sizing, own pool
-------------------------------------------------

local QUEST_CARD_SIZE            = 104
local QUEST_CARD_FRAME_LEVEL_OFF = 2
local QUEST_ICON_INSET           = 10
local QUEST_ICON_CROP_MIN        = 0.08
local QUEST_ICON_CROP_MAX        = 0.92
local QUEST_BADGE_SIZE           = 22
local QUEST_BADGE_INSET          = 6

local QUEST_GRID_PADDING         = 18
local QUEST_CARD_GAP_X           = 12
local QUEST_CARD_GAP_Y           = 12
local QUEST_PREFERRED_COLS       = 6
local QUEST_NARROW_COLS          = 3
local QUEST_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local FACTION_ALLIANCE = { 0.00, 0.60, 1.00 }
local FACTION_HORDE    = { 1.00, 0.20, 0.20 }
local FACTION_NEUTRAL  = { 0.40, 0.90, 0.40 }

local questCardPool = {}
local questCardCounter = 0

-------------------------------------------------
-- Quest card (mirrors CreateVendorCard / CreateProfessionCard)
-------------------------------------------------
local function CreateQuestCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(QUEST_CARD_SIZE, QUEST_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + QUEST_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Reward icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", QUEST_ICON_INSET, -QUEST_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -QUEST_ICON_INSET, QUEST_ICON_INSET)
    icon:SetTexCoord(QUEST_ICON_CROP_MIN, QUEST_ICON_CROP_MAX, QUEST_ICON_CROP_MIN, QUEST_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(QUEST_BADGE_SIZE, QUEST_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -QUEST_BADGE_INSET, -QUEST_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(10, 10)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.factionDot = dot

    card:RegisterForClicks("LeftButtonUp")

card:SetScript("OnEnter", function(self)
    self.hoverBg:Show()

    local quest = self.quest
    if not quest then return end

    local qID = type(quest.id) == "table" and quest.id[1] or quest.id

    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:ClearLines()
    GameTooltip:SetHyperlink("quest:" .. qID)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cff00ff00<Left Click>|r View Decor Item Rewards", 1, 1, 1)
    GameTooltip:Show()
end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    questCardPool[idx] = card
    return card
end

local function GetOrCreateQuestCard(parent, idx)
    return questCardPool[idx] or CreateQuestCard(parent, idx)
end


-------------------------------------------------
-- Preview updater (unchanged from row logic)
-------------------------------------------------
local function UpdateQuestPreview(quest)
    if not quest then return end
    DVD.contentArea._isVendorPreview = false
    
    if DVD.modelTitle then
        local liveName = (DVD.questTitleCache and DVD.questTitleCache[quest.id]) or quest.questName or "Quest Reward"
        DVD.modelTitle:SetText(liveName)
        DVD.modelTitle:SetTextColor(1, 1, 1)
    end
    
    if not DVD.questWowheadWrapper then
        DVD.questWowheadWrapper = CreateFrame("Frame", nil, DVD.itemContainer, "BackdropTemplate")
        DVD.questWowheadWrapper:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = {left = 3, right = 3, top = 3, bottom = 3}
        })
        DVD.questWowheadWrapper:SetBackdropColor(0.08, 0.08, 0.12, 0.95)
        DVD.questWowheadWrapper:SetBackdropBorderColor(1, 0.82, 0, 1)
        DVD.questWowheadWrapper:SetHeight(Sizing.WowheadWrapperHeight)
        
        DVD.questWowheadBox = CreateFrame("EditBox", nil, DVD.questWowheadWrapper, "InputBoxTemplate")
        DVD.questWowheadBox:SetAutoFocus(false)
        DVD.questWowheadBox:SetHeight(Sizing.WowheadBoxHeight)
        DVD.questWowheadBox:SetPoint("LEFT", DVD.questWowheadWrapper, "LEFT", Sizing.WowheadBoxGap, 0)
        DVD.questWowheadBox:SetPoint("RIGHT", DVD.questWowheadWrapper, "RIGHT", -Sizing.WowheadBoxRightInset, 0)
        
        DVD.questWowheadWrapper.icon = DVD.questWowheadWrapper:CreateTexture(nil, "ARTWORK")
        DVD.questWowheadWrapper.icon:SetSize(Sizing.WowheadIconSize, Sizing.WowheadIconSize)
        DVD.questWowheadWrapper.icon:SetPoint("LEFT", DVD.questWowheadWrapper, "LEFT", Sizing.WowheadIconLeftInset, 0)
        DVD.questWowheadWrapper.icon:SetTexture("Interface\\Icons\\INV_Misc_Spyglass_03")
        DVD.questWowheadBox:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    end
    
    DVD.questWowheadWrapper:ClearAllPoints()
    DVD.questWowheadWrapper:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -Sizing.WowheadWrapperGap)
    DVD.questWowheadWrapper:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -Sizing.WowheadWrapperGap)
    local qID = type(quest.id) == "table" and quest.id[1] or quest.id
	DVD.questWowheadBox:SetText("https://www.wowhead.com/quest=" .. qID)
    
    local previewData = {
        id = quest.itemID,
        model3D = quest.model3D,
        decorID = quest.decorID,
        questID = quest.id
    }
    
    if DVD.UpdateProfessionPreview then
        DVD.UpdateProfessionPreview(previewData)
    end
    DVD.questWowheadWrapper:Show()

-------------------------------------------------
    -- Quest Name & Notes Panel (All inside one block!)
    -------------------------------------------------
    if not DVD.questNotes then
        DVD.questNotes = CreateFrame("Frame", nil, DVD.itemContainer)
        DVD.questNotes.bg = DVD.questNotes:CreateTexture(nil, "BACKGROUND")
        DVD.questNotes.bg:SetAllPoints()
        DVD.questNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)
        DVD.questNotes.text = DVD.questNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.questNotes.text:SetPoint("TOPLEFT", Sizing.NotesTextLeftInset, -Sizing.NotesTextTopInset)
        DVD.questNotes.text:SetJustifyH("LEFT")
        DVD.questNotes.text:SetWordWrap(true)
        DVD.questNotes.text:SetFont(STANDARD_TEXT_FONT, Sizing.NotesTextFontSize, "")
    end
    
    DVD.questNotes:ClearAllPoints()
    DVD.questNotes:SetPoint("TOPLEFT", DVD.questWowheadWrapper, "BOTTOMLEFT", 0, -Sizing.NotesTopGap)
    DVD.questNotes:SetPoint("TOPRIGHT", DVD.questWowheadWrapper, "BOTTOMRIGHT", 0, -Sizing.NotesTopGap)
    
    -- Grab the Quest Name exactly like we did in the Gallery Browser
    local displayQuestName = (DVD.questTitleCache and DVD.questTitleCache[quest.id]) 
        or quest.questName 
        or (C_QuestLog.GetTitleForQuestID and C_QuestLog.GetTitleForQuestID(quest.id)) 
        or "Unknown Quest"

    local combinedText = "|cffffd100Quest:|r |cff80ff80" .. displayQuestName .. "|r"

    -- Append the note if one exists
    if quest.note then
        combinedText = combinedText .. "\n|cffffd100Note:|r " .. quest.note
    end
    
    DVD.questNotes.text:SetText(combinedText)
    
    local availableWidth = DVD.itemContainer:GetWidth() - Sizing.NotesAvailableWidthPadding
    DVD.questNotes.text:SetWidth(availableWidth - Sizing.NotesTextWidthPadding)
    DVD.questNotes:SetHeight(DVD.questNotes.text:GetStringHeight() + Sizing.NotesHeightPadding)
    
    DVD.questNotes:Show()
end
-------------------------------------------------
-- Populate one card with quest data
-------------------------------------------------
local function PopulateQuestCard(card, quest)
    card.quest = quest

    local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

    local shouldMark =
        isCompleted
        and vendorSettings
        and vendorSettings.markCompletedThings

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local fLower = string.lower(tostring(quest.faction or "neutral"))
    local tint = FACTION_NEUTRAL
    if fLower == "alliance" then
        tint = FACTION_ALLIANCE
    elseif fLower == "horde" then
        tint = FACTION_HORDE
    end
    card.factionDot:SetColorTexture(tint[1], tint[2], tint[3])

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local collected =
        quest.itemID
        and DVD.IsItemCollected
        and DVD.IsItemCollected(quest.itemID)
        or false
    card.collected:SetShown(collected)

    -------------------------------------------------
    -- Reward icon
    -------------------------------------------------
-------------------------------------------------
-- Reward icon via Gallery.GetItemIcon (Housing Catalog first, same as professions)
-------------------------------------------------
local activeData = quest.itemID and DVD.ActiveItems and DVD.ActiveItems[quest.itemID]

local icon =
    quest.icon
    or (
        Gallery.GetItemIcon
        and quest.itemID
        and Gallery.GetItemIcon(quest.itemID, activeData)
    )

if quest.iconType == "atlas"
and icon
and card.icon.SetAtlas then
    card.icon:SetAtlas(icon)
else
    card.icon:SetTexture(
        icon
        or "Interface\\Icons\\INV_Misc_Bag_10"
    )
end

if shouldMark then
    card.icon:SetDesaturated(true)
    card.icon:SetAlpha(0.40)
else
    card.icon:SetDesaturated(false)
    card.icon:SetAlpha(1)
end

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if DVD.MarkPreviewContentShown then DVD.MarkPreviewContentShown() end
            UpdateQuestPreview(quest)
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetQuestGridCards()
    for _, card in ipairs(questCardPool) do
        card:Hide()
    end
    questCardCounter = 0
end

-------------------------------------------------
-- Lays out quests as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildQuestGridSection(parentContainer, quests, startY)
    quests = quests or {}

    local width = parentContainer:GetWidth() or 0
    local columns = QUEST_PREFERRED_COLS
    local gapX = QUEST_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (QUEST_GRID_PADDING * 2)
        local neededWidth = (columns * QUEST_CARD_SIZE) + ((columns - 1) * QUEST_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = QUEST_NARROW_COLS
        end
    end

    local col, row = 0, 0
    local shown = 0

    for _, quest in ipairs(quests) do
        local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

        local skip =
            isCompleted
            and vendorSettings
            and vendorSettings.hideCompletedThings
            and not vendorSettings.markCompletedThings

        if not skip then
            shown = shown + 1
            questCardCounter = questCardCounter + 1
            local card = GetOrCreateQuestCard(parentContainer, questCardCounter)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                parentContainer,
                "TOPLEFT",
                QUEST_GRID_PADDING + col * (QUEST_CARD_SIZE + gapX),
                startY - (row * (QUEST_CARD_SIZE + QUEST_CARD_GAP_Y))
            )
            card:Show()
            table.insert(DVD.activeWidgets, card)

            PopulateQuestCard(card, quest)

            col = col + 1
            if col >= columns then
                col = 0
                row = row + 1
            end
        end
    end

    local rows = math.ceil(shown / columns)
    local sectionHeight = rows * (QUEST_CARD_SIZE + QUEST_CARD_GAP_Y)

    return startY - sectionHeight
end
