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
    print("|cffff4040DecorVendor BossDropRows:|r constants are missing.")
    return
end

local Sizing = C.BossDropRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor BossDropRows:|r BossDropRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor BossDropRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end

local function IsLoaded(addon)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addon)
    end
    if IsAddOnLoaded then
        return IsAddOnLoaded(addon)
    end
    return false
end

-- Prefixed with 'local' to protect global namespace safety
local hasTomTom = IsLoaded("TomTom")
local hasWaypointUI = IsLoaded("WaypointUI")

-- Expose to our unified addon scope so other files can check them natively
DVD.hasTomTom = hasTomTom
DVD.hasWaypointUI = hasWaypointUI

local RareEvents = C.RARE_EVENTS or {}
local SourceActions = C.SOURCE_ACTIONS or {}

-- ============================================================
-- 🛡️ SHARED BOSS DROP ACCORDION HEADER
-- ============================================================
function DVD.CreateBossDropHeader(parent, group, collected, total, y)
    local groupName =
        type(group) == "table" and group.name
        or type(group) == "string" and group
        or "Unknown Drops"

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "bossdrops",
        key = "boss_" .. groupName,
        title = groupName,
        completed = collected,
        total = total,
        progressLabel = "collected",
        defaultCollapsed = true,
        spacing = Sizing.HeaderSpacing,
		useLegacyToggle = true,
    })

    return collapsed, newY
end

-- ============================================================
-- 🖼️ SAFE PREVIEW INSPECTOR ENGINE
-- ============================================================
function DVD.UpdateBossPreview(itemData)
    if not itemData then return end

    local ms = DVD.modelScene
    local actor = DVD.previewActor
    local texture = DVD.texture

    if not ms or not actor then return end

    DVD.contentArea._isVendorPreview = false

    -- Title
    local itemObj = Item:CreateFromItemID(itemData.id)
    itemObj:ContinueOnItemLoad(function()
        if DVD.modelTitle then
            DVD.modelTitle:SetText(itemObj:GetItemName() or "Preview")
            DVD.modelTitle:SetTextColor(1, 1, 1)
        end
    end)

    -- Model Loading
    if itemData.model3D then
        if texture then texture:Hide() end
        ms:Show()

        DVD.ShowModel(ms, itemData.model3D)

        C_Timer.After(0.01, function()
            local camera = ms:GetActiveCamera()
            if not camera then return end

            local cam = DVD.DecorCameraOverrides and DVD.DecorCameraOverrides[itemData.model3D]

            if camera.TargetActor then
                camera:TargetActor(actor, true)
            end

            if camera.SetPitch then
                camera:SetPitch(0.2)
            end

            if cam and cam.zoom and camera.SetZoomDistance then
                camera:SetZoomDistance(cam.zoom)
            end
        end)
    else
        ms:Hide()
    end

    -- Boss Drop Notes Wrapper
    if not DVD.bossNotes then
        DVD.bossNotes = CreateFrame("Frame", nil, DVD.itemContainer)
        DVD.bossNotes:SetFrameLevel((DVD.itemContainer:GetFrameLevel() or 1) + Sizing.NotesFrameLevelOffset)

        DVD.bossNotes.bg = DVD.bossNotes:CreateTexture(nil, "BACKGROUND")
        DVD.bossNotes.bg:SetAllPoints()
        DVD.bossNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

        DVD.bossNotes.text = DVD.bossNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.bossNotes.text:SetPoint("TOPLEFT", DVD.bossNotes, "TOPLEFT", Sizing.NotesTextHorizontalInset, -Sizing.NotesTextVerticalInset)
        DVD.bossNotes.text:SetPoint("BOTTOMRIGHT", DVD.bossNotes, "BOTTOMRIGHT", -Sizing.NotesTextHorizontalInset, Sizing.NotesTextVerticalInset)
        DVD.bossNotes.text:SetJustifyH("LEFT")
        DVD.bossNotes.text:SetJustifyV("TOP")
        DVD.bossNotes.text:SetWordWrap(true)
        DVD.bossNotes.text:SetNonSpaceWrap(false)
        DVD.bossNotes.text:SetFont(STANDARD_TEXT_FONT, Sizing.NotesTextFontSize, "")
    end

    local lines = {}

    if itemData.bossencounter then
        local encounterName = EJ_GetEncounterInfo(itemData.bossencounter)
        table.insert(lines, "|cffFFD200Boss:|r " .. (encounterName or "Unknown Boss"))
    end

    if itemData.instance or itemData.bossevent then
        local loc = itemData.instance or itemData.bossevent
        table.insert(lines, "|cff00fbffEvent:|r " .. tostring(loc))
    end

    if itemData.zone then
        table.insert(lines, "|cff00fbffLocation:|r " .. tostring(itemData.zone))
    end

    if itemData.note and itemData.note ~= "" then
        table.insert(lines, "|cff00ff00Note:|r " .. tostring(itemData.note))
    end

    if #lines == 0 then
        DVD.bossNotes:Hide()
        return
    end

    local fullBossInfo = table.concat(lines, "\n")

    local plainText = fullBossInfo
        :gsub("|c%x%x%x%x%x%x%x%x", "")
        :gsub("|r", "")
        :gsub("|T.-|t", "")

    local estimatedLines = 0
    local charsPerLine = Sizing.NotesCharactersPerLine

    for line in string.gmatch(plainText .. "\n", "(.-)\n") do
        if line == "" then
            estimatedLines = estimatedLines + 1
        else
            estimatedLines = estimatedLines + math.max(1, math.ceil(string.len(line) / charsPerLine))
        end
    end

    local noteHeight = math.max(Sizing.NotesMinimumHeight, estimatedLines * Sizing.NotesEstimatedLineHeight + Sizing.NotesVerticalPadding)
    noteHeight = math.min(noteHeight, Sizing.NotesMaximumHeight)

    DVD.bossNotes:ClearAllPoints()
    DVD.bossNotes:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -Sizing.NotesTopGap)
    DVD.bossNotes:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -Sizing.NotesTopGap)
    DVD.bossNotes:SetHeight(noteHeight)

    DVD.bossNotes.text:SetText(fullBossInfo)
    DVD.bossNotes:Show()
end

-------------------------------------------------
-- Boss Drop Grid — own sizing, own pool
-------------------------------------------------

local BOSS_CARD_SIZE            = 104
local BOSS_CARD_FRAME_LEVEL_OFF = 2
local BOSS_ICON_INSET           = 10
local BOSS_ICON_CROP_MIN        = 0.08
local BOSS_ICON_CROP_MAX        = 0.92
local BOSS_BADGE_SIZE           = 22
local BOSS_BADGE_INSET          = 6

local BOSS_GRID_PADDING         = 18
local BOSS_CARD_GAP_X           = 12
local BOSS_CARD_GAP_Y           = 12
local BOSS_PREFERRED_COLS       = 6
local BOSS_NARROW_COLS          = 3
local BOSS_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local bossCardPool = {}
local bossCardCounter = 0

-------------------------------------------------
-- Boss drop card (mirrors quest/vendor/profession cards)
-------------------------------------------------
local function CreateBossDropCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(BOSS_CARD_SIZE, BOSS_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + BOSS_CARD_FRAME_LEVEL_OFF)

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
    -- Item icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", BOSS_ICON_INSET, -BOSS_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -BOSS_ICON_INSET, BOSS_ICON_INSET)
    icon:SetTexCoord(BOSS_ICON_CROP_MIN, BOSS_ICON_CROP_MAX, BOSS_ICON_CROP_MIN, BOSS_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Armband_01")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(BOSS_BADGE_SIZE, BOSS_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -BOSS_BADGE_INSET, -BOSS_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local itemData = self.itemData
        if not itemData or not itemData.id then return end

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:SetHyperlink("item:" .. itemData.id)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00<Right Click>|r Set Map Waypoint Pins", 1, 1, 1)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    bossCardPool[idx] = card
    return card
end

local function GetOrCreateBossDropCard(parent, idx)
    return bossCardPool[idx] or CreateBossDropCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with boss drop data
-------------------------------------------------
local function PopulateBossDropCard(card, itemData)
    card.itemData = itemData

    local id = itemData.id
    local isCollected = DVD.IsItemCollected(id)

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    card.collected:SetShown(isCollected and true or false)

    -------------------------------------------------
    -- Icon via DVD.Gallery.GetItemIcon (Housing Catalog first)
    -------------------------------------------------
    local activeData = id and DVD.ActiveItems and DVD.ActiveItems[id]

    local icon =
        itemData.icon
        or (
            DVD.Gallery
            and DVD.Gallery.GetItemIcon
            and id
            and DVD.Gallery.GetItemIcon(id, activeData)
        )

    if itemData.iconType == "atlas"
    and icon
    and card.icon.SetAtlas then
        card.icon:SetAtlas(icon)
    else
        card.icon:SetTexture(
            icon
            or "Interface\\Icons\\INV_Misc_Armband_01"
        )
    end

    -------------------------------------------------
    -- Click Actions (unchanged waypoint/preview logic, self -> card)
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            DVD.UpdateBossPreview(itemData)

        elseif button == "RightButton" then
            if InCombatLockdown and InCombatLockdown() then
                return
            end

            local actionKey =
                itemData.sourceAction
                or itemData.bossevent
                or itemData.rareEvent
                or itemData.eventName
                or itemData.dropName

            local rares =
                actionKey
                and RareEvents[actionKey]

            if rares and #rares > 0 then
                if TomTom and TomTom.AddWaypoint then
                    for _, rare in ipairs(rares) do
                        local mapID = tonumber(rare.mapID or itemData.mapID)
                        local x = tonumber(rare.x)
                        local y = tonumber(rare.y)

                        if mapID and x and y then
                            local nx = x > 1 and x / 100 or x
                            local ny = y > 1 and y / 100 or y

                            local title =
                                rare.title
                                or rare.name
                                or itemData.bossevent
                                or itemData.name
                                or "Decor Location"

                            if rare.zone then
                                title = tostring(title) .. " - " .. tostring(rare.zone)
                            end

                            TomTom:AddWaypoint(
                                mapID,
                                nx,
                                ny,
                                {
                                    title = title,
                                    persistent = false,
                                    minimap = true,
                                    world = true,
                                }
                            )
                        end
                    end
                else
                    -- Blizzard can only supertrack one waypoint, so use the first valid one.
                    for _, rare in ipairs(rares) do
                        local mapID = tonumber(rare.mapID or itemData.mapID)
                        local x = tonumber(rare.x)
                        local y = tonumber(rare.y)

                        if mapID and x and y and C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                            local nx = x > 1 and x / 100 or x
                            local ny = y > 1 and y / 100 or y

                            local waypoint

                            if UiMapPoint.CreateFromCoordinates then
                                waypoint = UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                            elseif UiMapPoint.CreateFromVector2D and CreateVector2D then
                                waypoint = UiMapPoint.CreateFromVector2D(mapID, CreateVector2D(nx, ny))
                            end

                            if waypoint then
                                C_Map.SetUserWaypoint(waypoint)

                                if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                                    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                                end

                                break
                            end
                        end
                    end
                end

                local action =
                    actionKey
                    and SourceActions[actionKey]

                local first = rares[1]

                local openMapID =
                    tonumber(action and (action.openMapID or action.parentMapID or action.mapID))
                    or tonumber(itemData.openMapID)
                    or tonumber(first and first.mapID)
                    or tonumber(itemData.mapID)

                if openMapID and C_Map and C_Map.OpenWorldMap then
                    C_Map.OpenWorldMap(openMapID)
                end

                return
            end

            if itemData.mapID and C_Map and C_Map.OpenWorldMap then
                C_Map.OpenWorldMap(itemData.mapID)
            end
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetBossDropGridCards()
    for _, card in ipairs(bossCardPool) do
        card:Hide()
    end
    bossCardCounter = 0
end

-------------------------------------------------
-- Lays out boss drops as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildBossDropGridSection(parentContainer, items, startY)
    items = items or {}

    local width = parentContainer:GetWidth() or 0
    local columns = BOSS_PREFERRED_COLS
    local gapX = BOSS_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (BOSS_GRID_PADDING * 2)
        local neededWidth = (columns * BOSS_CARD_SIZE) + ((columns - 1) * BOSS_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = BOSS_NARROW_COLS
        end
    end

    local col, row = 0, 0
    for _, itemData in ipairs(items) do
        bossCardCounter = bossCardCounter + 1
        local card = GetOrCreateBossDropCard(parentContainer, bossCardCounter)

        card:ClearAllPoints()
        card:SetPoint(
            "TOPLEFT",
            parentContainer,
            "TOPLEFT",
            BOSS_GRID_PADDING + col * (BOSS_CARD_SIZE + gapX),
            startY - (row * (BOSS_CARD_SIZE + BOSS_CARD_GAP_Y))
        )
        card:Show()
        table.insert(DVD.activeWidgets, card)

        PopulateBossDropCard(card, itemData)

        col = col + 1
        if col >= columns then
            col = 0
            row = row + 1
        end
    end

    local rows = math.ceil(#items / columns)
    local sectionHeight = rows * (BOSS_CARD_SIZE + BOSS_CARD_GAP_Y)

    return startY - sectionHeight
end