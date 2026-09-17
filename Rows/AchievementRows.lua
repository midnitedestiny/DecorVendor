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
local Gallery = DVD.Gallery

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor AchievementRows:|r constants are missing.")
    return
end

local Sizing = C.AchievementRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor AchievementRows:|r AchievementRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor AchievementRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end

local COLORS = C.COLORS or {}

-- ============================================================
-- 🛡️ SHARED ACHIEVEMENT ACCORDION HEADER
-- ============================================================
function DVD.CreateAchievementHeader(parent, achievement, y, completed, total)
    local headerName

    if type(achievement) == "string" then
        headerName = achievement
    elseif type(achievement) == "table" and achievement.name then
        headerName = achievement.name
    else
        headerName = "Unknown Category"
    end

    local collapseKey = "ach_" .. headerName
    local forceCollapsed

    if DVD.filtersJustChanged then
        local groupSel =
            DVD.filters
            and DVD.filters.achievements
            and DVD.filters.achievements.groups
            or {}

        if not groupSel[headerName] then
            forceCollapsed = true
        end
    end

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "achievements",
        key = collapseKey,
        title = headerName,
        completed = completed,
        total = total,
        progressLabel = "completed",
        defaultCollapsed = true,
        forceCollapsed = forceCollapsed,
        spacing = Sizing.HeaderSpacing,
        useLegacyToggle = true,
    })

    return collapsed, newY
end

-- ============================================================
-- 🖼️ SAFE PREVIEW INSPECTOR ENGINE
-- ============================================================
function DVD.UpdateAchievementPreview(achievement)
    if not achievement then return end
    local ms = DVD.modelScene
    local actor = DVD.previewActor
    local texture = DVD.texture
    if not ms or not actor then return end
    DVD.contentArea._isVendorPreview = false
    -- Title alignment tweaks

    if achievement.itemID then
        local item = Item:CreateFromItemID(achievement.itemID)
        item:ContinueOnItemLoad(function()
            if DVD.modelTitle then
                DVD.modelTitle:SetText(item:GetItemName() or achievement.title or "Achievement Preview")
                DVD.modelTitle:SetTextColor(1, 1, 1)
                DVD.modelTitle:Show()
            end
        end)
    end
    -- 3D Model Scenario loading
    if achievement.model3D then
        if texture then texture:Hide() end
        ms:Show()
        ms._cameraLocked = nil
        DVD.ShowModel(ms, achievement.model3D)
        if not ms._cameraLocked then
            ms._cameraLocked = true
            C_Timer.After(0.05, function()
                local camera = ms:GetActiveCamera()
                if not camera then return end
                if camera.SetTarget then camera:SetTarget(0, 0, 0) end
                if camera.SetZoomDistance then camera:SetZoomDistance(4.5) end
                if camera.SetPitch then camera:SetPitch(0.1) end
            end)
        end
    elseif achievement.texture then
        ms:Hide()
        if texture then
            texture:SetTexture(achievement.texture)
            texture:Show()
        end
    else
        ms:Hide()
        if texture then texture:Hide() end
    end
    -- Wowhead string frame initializing safely
    if not DVD.achievementWowheadWrapper then
        DVD.achievementWowheadWrapper = CreateFrame("Frame", nil, DVD.itemContainer, "BackdropTemplate")
        local wrapper = DVD.achievementWowheadWrapper
        wrapper:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 }
        })
        wrapper:SetBackdropColor(0.08, 0.08, 0.12, 0.95)
        wrapper:SetBackdropBorderColor(0.6, 0.4, 1, 1)
        wrapper:SetHeight(Sizing.WowheadWrapperHeight)
        wrapper.icon = wrapper:CreateTexture(nil, "ARTWORK")
        wrapper.icon:SetSize(Sizing.WowheadIconSize, Sizing.WowheadIconSize)
        wrapper.icon:SetPoint("LEFT", Sizing.WowheadIconLeftInset, 0)
        wrapper.icon:SetTexture("Interface\\Icons\\Achievement_Quests_Completed_08")
        DVD.achievementWowheadBox = CreateFrame("EditBox", nil, wrapper, "InputBoxTemplate")
        local box = DVD.achievementWowheadBox
        box:SetAutoFocus(false)
        box:SetHeight(Sizing.WowheadBoxHeight)
        box:SetPoint("LEFT", wrapper.icon, "RIGHT", Sizing.WowheadBoxGap, 0)
        box:SetPoint("RIGHT", wrapper, "RIGHT", -Sizing.WowheadBoxRightInset, 0)
        box:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    end
    DVD.achievementWowheadWrapper:ClearAllPoints()
    DVD.achievementWowheadWrapper:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -Sizing.WowheadWrapperGap)
    DVD.achievementWowheadWrapper:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -Sizing.WowheadWrapperGap)
    DVD.achievementWowheadBox:SetText("https://www.wowhead.com/achievement=" .. achievement.id)
    DVD.achievementWowheadWrapper:Show()

    -- Safely hide the old button if it was previously created
    if DVD.achievementOpenButton then
        DVD.achievementOpenButton:Hide()
    end
end

-------------------------------------------------
-- Achievement Grid — own sizing, own pool
-------------------------------------------------

local ACH_CARD_SIZE            = 104
local ACH_CARD_FRAME_LEVEL_OFF = 2
local ACH_ICON_INSET           = 10
local ACH_ICON_CROP_MIN        = 0.08
local ACH_ICON_CROP_MAX        = 0.92
local ACH_BADGE_SIZE           = 22
local ACH_BADGE_INSET          = 6

local ACH_GRID_PADDING         = 18
local ACH_CARD_GAP_X           = 12
local ACH_CARD_GAP_Y           = 12
local ACH_PREFERRED_COLS       = 6
local ACH_NARROW_COLS          = 3
local ACH_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local FACTION_ALLIANCE = { 0.00, 0.98, 1.00 } -- matches |cff00fbff
local FACTION_HORDE    = { 1.00, 0.25, 0.25 } -- matches |cffff4040
local FACTION_NEUTRAL  = { 0.40, 0.90, 0.40 }

local STATE_COMPLETED = { 0.20, 1.00, 0.50 }
local STATE_LOCKED    = { 1.00, 0.20, 0.20 }

local achievementCardPool = {}
local achievementCardCounter = 0

-------------------------------------------------
-- Achievement card
-------------------------------------------------
local function CreateAchievementCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(ACH_CARD_SIZE, ACH_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + ACH_CARD_FRAME_LEVEL_OFF)

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
    -- Icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", ACH_ICON_INSET, -ACH_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -ACH_ICON_INSET, ACH_ICON_INSET)
    icon:SetTexCoord(ACH_ICON_CROP_MIN, ACH_ICON_CROP_MAX, ACH_ICON_CROP_MIN, ACH_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Gift_01")
    card.icon = icon

    -------------------------------------------------
    -- Completed badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(ACH_BADGE_SIZE, ACH_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -ACH_BADGE_INSET, -ACH_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.completedBadge = badge

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(10, 10)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.factionDot = dot

    -------------------------------------------------
    -- Points label (bottom-right corner)
    -------------------------------------------------
    local pointsText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    pointsText:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -6, 6)
    pointsText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
    pointsText:SetTextColor(1, 0.82, 0)
    card.pointsText = pointsText

    card:RegisterForClicks("LeftButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local achievement = self.achievement
        if not achievement then return end

        local id = achievement.id
        local name = self.achName or "Unknown Achievement"

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(name, 1, 1, 1)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00<Left Click>|r Open Achievement Frame", 1, 1, 1)
		GameTooltip:AddLine("Make sure Click Options is enabled")
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    achievementCardPool[idx] = card
    return card
end

local function GetOrCreateAchievementCard(parent, idx)
    return achievementCardPool[idx] or CreateAchievementCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with achievement data
-------------------------------------------------
local function PopulateAchievementCard(card, achievement)
    card.achievement = achievement

    local id = achievement.id
    local isCompleted = DVD.IsAchievementComplete(id)
    local name = select(2, GetAchievementInfo(id)) or "Unknown Achievement"
    card.achName = name

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local fLower = string.lower(tostring(achievement.faction or "neutral"))
    local tint = FACTION_NEUTRAL
    if fLower == "alliance" then
        tint = FACTION_ALLIANCE
    elseif fLower == "horde" then
        tint = FACTION_HORDE
    end
    card.factionDot:SetColorTexture(tint[1], tint[2], tint[3])

    -------------------------------------------------
    -- Completed badge
    -------------------------------------------------
    card.completedBadge:SetShown(isCompleted)

    -------------------------------------------------
    -- Icon
    -------------------------------------------------
    local rewardTexture = "Interface\\Icons\\INV_Misc_Gift_01"

    if achievement.itemID then
        local activeData = DVD.ActiveItems and DVD.ActiveItems[achievement.itemID]
        rewardTexture =
            (Gallery.GetItemIcon and Gallery.GetItemIcon(achievement.itemID, activeData))
            or (C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(achievement.itemID))
            or GetItemIcon(achievement.itemID)
            or rewardTexture
    elseif id then
        rewardTexture = select(10, GetAchievementInfo(id)) or rewardTexture
    end

    card.icon:SetTexture(rewardTexture)

    if isCompleted and vendorSettings and vendorSettings.markCompletedThings then
        card.icon:SetDesaturated(true)
        card.icon:SetAlpha(0.40)
    else
        card.icon:SetDesaturated(false)
        card.icon:SetAlpha(1)
    end

    -------------------------------------------------
    -- Points label
    -------------------------------------------------
    local points = select(3, GetAchievementInfo(id)) or 10
    card.pointsText:SetText(tostring(points))

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            DVD.UpdateAchievementPreview(achievement)

            if vendorSettings and vendorSettings.openAchievementFrame then
                if not AchievementFrame or not AchievementFrame:IsShown() then
                    AchievementFrame_LoadUI()
                    AchievementFrame_ToggleAchievementFrame()
                end
                AchievementFrame_SelectAchievement(id)
            end

            if DVD.achievementWowheadBox then
                DVD.achievementWowheadBox:HighlightText()
            end
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetAchievementGridCards()
    for _, card in ipairs(achievementCardPool) do
        card:Hide()
    end
    achievementCardCounter = 0
end

-------------------------------------------------
-- Lays out achievements as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildAchievementGridSection(parentContainer, achievements, startY)
    achievements = achievements or {}

    local width = parentContainer:GetWidth() or 0
    local columns = ACH_PREFERRED_COLS
    local gapX = ACH_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (ACH_GRID_PADDING * 2)
        local neededWidth = (columns * ACH_CARD_SIZE) + ((columns - 1) * ACH_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = ACH_NARROW_COLS
        end
    end

    local col, row = 0, 0
    local shown = 0

    for _, achievement in ipairs(achievements) do
        local isCompleted = DVD.IsAchievementComplete(achievement.id)

        local skip =
            isCompleted
            and vendorSettings
            and vendorSettings.hideCompletedThings
            and not vendorSettings.markCompletedThings

        if not skip then
            shown = shown + 1
            achievementCardCounter = achievementCardCounter + 1
            local card = GetOrCreateAchievementCard(parentContainer, achievementCardCounter)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                parentContainer,
                "TOPLEFT",
                ACH_GRID_PADDING + col * (ACH_CARD_SIZE + gapX),
                startY - (row * (ACH_CARD_SIZE + ACH_CARD_GAP_Y))
            )
            card:Show()
            table.insert(DVD.activeWidgets, card)

            PopulateAchievementCard(card, achievement)

            col = col + 1
            if col >= columns then
                col = 0
                row = row + 1
            end
        end
    end

    local rows = math.ceil(shown / columns)
    local sectionHeight = rows * (ACH_CARD_SIZE + ACH_CARD_GAP_Y)

    return startY - sectionHeight
end
