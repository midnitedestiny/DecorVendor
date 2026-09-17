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
    print("|cffff4040DecorVendor ProfessionRows:|r constants are missing.")
    return
end

local Sizing = C.ProfessionRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor ProfessionRows:|r ProfessionRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor ProfessionRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end


-- ============================================================
-- 🛡️ SHARED PROFESSION ACCORDION HEADER
-- ============================================================
function DVD.CreateProfessionHeader(parent, profession, y, completed, total)
    local professionName =
        type(profession) == "table" and profession.name
        or type(profession) == "string" and profession
        or "Unknown Profession"

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "professions",
        key = "prof_" .. professionName,
        title = professionName,
        completed = completed,
        total = total,
        progressLabel = "learned",
        defaultCollapsed = true,
        spacing = Sizing.HeaderSpacing,
		useLegacyToggle = true,
    })

    return collapsed, newY
end

-- ✅ Standing standalone preview engine function
function DVD.UpdateProfessionPreview(profItem)
    if not profItem then
        return
    end

    DVD.contentArea._isVendorPreview = false

    if DVD.vendorPopup then DVD.vendorPopup:Hide() end
    if DVD.vendorNotes then DVD.vendorNotes:Hide() end
    if DVD.bossNotes then DVD.bossNotes:Hide() end
    if DVD.questNotes then DVD.questNotes:Hide() end
    if DVD.achievementPanel then DVD.achievementPanel:Hide() end
    if DVD.achievementWowheadWrapper then DVD.achievementWowheadWrapper:Hide() end
    if DVD.questWowheadWrapper then DVD.questWowheadWrapper:Hide() end

    local itemName = "Preview"

    if profItem.id then
        local item = Item:CreateFromItemID(profItem.id)

        item:ContinueOnItemLoad(function()
            itemName = item:GetItemName() or "Preview"

            if DVD.modelTitle then
                DVD.modelTitle:SetText(itemName)
                DVD.modelTitle:SetTextColor(1, 1, 1)
            end
        end)
    end

    if profItem.model3D or profItem.decorID then
        if DVD.ShowPreviewModel then
            DVD.ShowPreviewModel(profItem.model3D, itemName, profItem)
        end
    else
        if DVD.SetPreviewWatermarkVisible then
            DVD.SetPreviewWatermarkVisible(true)
        end
    end

    if not DVD.profNotes then
        DVD.profNotes = CreateFrame("Frame", nil, DVD.itemContainer)
        DVD.profNotes:SetPoint("BOTTOMLEFT", DVD.itemContainer, "BOTTOMLEFT", Sizing.NotesHorizontalInset, Sizing.NotesBottomOffset)
        DVD.profNotes:SetPoint("BOTTOMRIGHT", DVD.itemContainer, "BOTTOMRIGHT", -Sizing.NotesHorizontalInset, Sizing.NotesBottomOffset)
        DVD.profNotes:SetHeight(Sizing.NotesHeight)

        DVD.profNotes.bg = DVD.profNotes:CreateTexture(nil, "BACKGROUND")
        DVD.profNotes.bg:SetAllPoints()
        DVD.profNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

        DVD.profNotes.text = DVD.profNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.profNotes.text:SetPoint("TOPLEFT", DVD.profNotes, "TOPLEFT", Sizing.NotesTextHorizontalInset, -Sizing.NotesTextTopInset)
        DVD.profNotes.text:SetPoint("BOTTOMRIGHT", DVD.profNotes, "BOTTOMRIGHT", -Sizing.NotesTextHorizontalInset, Sizing.NotesTextBottomInset)
        DVD.profNotes.text:SetFont(STANDARD_TEXT_FONT, Sizing.NotesTextFontSize, "")
        DVD.profNotes.text:SetJustifyH("LEFT")
        DVD.profNotes.text:SetJustifyV("TOP")
    end

    local profInfo = ""

    if profItem.skill then
        profInfo = profInfo .. "|cffFFD200Profession:|r " .. profItem.skill .. "\n"
    end

    if profItem.skillNeeded then
        profInfo = profInfo .. "|cff00fbffSkill Required:|r " .. profItem.skillNeeded
    end

    if profItem.note and profItem.note ~= "" then
        profInfo = profInfo .. "\n|cff00ff00Note:|r " .. profItem.note
    end

    if profInfo ~= "" then
        DVD.profNotes.text:SetText(profInfo)
        DVD.profNotes:Show()
    else
        DVD.profNotes:Hide()
    end
end

-------------------------------------------------
-- Profession Grid — Gallery-style icon cards, own sizing
-------------------------------------------------

local CAT_CARD_SIZE            = 104
local CAT_CARD_FRAME_LEVEL_OFF = 2
local CAT_ICON_INSET           = 10
local CAT_ICON_CROP_MIN        = 0.08
local CAT_ICON_CROP_MAX        = 0.92
local CAT_BADGE_SIZE           = 22
local CAT_BADGE_INSET          = 6

local CAT_GRID_PADDING         = 18
local CAT_CARD_GAP_X           = 2   -- horizontal spacing between columns
local CAT_CARD_GAP_Y           = 12  -- vertical spacing between rows
local CAT_PREFERRED_COLS       = 6
local CAT_NARROW_COLS          = 3
local CAT_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local STATE_COLLECTED = { 0.20, 1.00, 0.50 }
local STATE_LEARNED   = { 1.00, 0.60, 0.10 }
local STATE_LOCKED    = { 1.00, 0.20, 0.20 }

local cardPool = {}

-------------------------------------------------
-- Profession card (mirrors Gallery.CreateCard)
-------------------------------------------------
local function CreateProfessionCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(CAT_CARD_SIZE, CAT_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + CAT_CARD_FRAME_LEVEL_OFF)

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
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", CAT_ICON_INSET, -CAT_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -CAT_ICON_INSET, CAT_ICON_INSET)
    icon:SetTexCoord(CAT_ICON_CROP_MIN, CAT_ICON_CROP_MAX, CAT_ICON_CROP_MIN, CAT_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(CAT_BADGE_SIZE, CAT_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -CAT_BADGE_INSET, -CAT_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    -------------------------------------------------
    -- State dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(10, 10)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.stateDot = dot

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()
        SetCursor("INSPECT_CURSOR")

        local profItem = self.profItem
        if not profItem then return end

        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()

        local itemName =
            (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(profItem.id))
            or GetItemInfo(profItem.id)

        GameTooltip:AddLine(itemName or ("Item ID: " .. tostring(profItem.id)), 1, 1, 1)
        GameTooltip:AddLine(" ")

        if self.state == "collected" then
            GameTooltip:AddLine("|cff00ff00Owned Decor|r")
        elseif self.state == "learned" then
            GameTooltip:AddLine("|cffff9900Recipe Learned|r")
        else
            GameTooltip:AddLine("|cffaaaaaaNot Learned|r")
        end

        GameTooltip:AddLine("|cff00ff00<Left Click>|r View Decor & Reagents", 1, 1, 1)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        ResetCursor()
        GameTooltip:Hide()
    end)

    cardPool[idx] = card
    return card
end

local function GetOrCreateCard(parent, idx)
    return cardPool[idx] or CreateProfessionCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with a profItem's data
-------------------------------------------------
local function PopulateProfessionCard(card, profItem)
    card.profItem = profItem

    -------------------------------------------------
    -- Resolve state
    -------------------------------------------------
    local learned = profItem.__learned
    if learned == nil then
        learned = profItem.spell and (IsSpellKnown(profItem.spell) or IsPlayerSpell(profItem.spell)) or false
    end

    local collected = profItem.__collected
    if collected == nil then
        collected = (profItem.id and DVD.IsItemCollected) and DVD.IsItemCollected(profItem.id) or false
    end

    local state, tint
    if collected then
        state, tint = "collected", STATE_COLLECTED
    elseif learned then
        state, tint = "learned", STATE_LEARNED
    else
        state, tint = "locked", STATE_LOCKED
    end
    card.state = state

    card.stateDot:SetColorTexture(tint[1], tint[2], tint[3])
    card.collected:SetShown(collected)

    -------------------------------------------------
    -- Icon — Housing Catalog first, same as Gallery cards.
    -- itemData covers both shapes: profItem.data.decorID (Gallery-style
    -- nested items) or profItem.decorID directly on the entry itself.
    -------------------------------------------------
-------------------------------------------------
-- Icon via Gallery.GetItemIcon (Housing Catalog first, same as Gallery cards)
-------------------------------------------------
local activeData = DVD.ActiveItems and DVD.ActiveItems[profItem.id]

local icon =
    profItem.icon
    or (
        Gallery.GetItemIcon
        and Gallery.GetItemIcon(
            profItem.id,
            activeData
        )
    )

if profItem.iconType == "atlas"
and icon
and card.icon.SetAtlas then
    card.icon:SetAtlas(icon)
else
    card.icon:SetTexture(
        icon
        or "Interface\\Icons\\INV_Misc_QuestionMark"
    )
end

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self)
        if DVD.UpdateProfessionPreview then
            DVD.UpdateProfessionPreview(profItem)
        end
        if DVD.ShowReagentsPopup then
            DVD.ShowReagentsPopup(profItem)
        end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)
end
-------------------------------------------------
-- Refresh (Draws Profession Headers + Grids)
-------------------------------------------------
local function RefreshProfessionGrid(parentContainer, professionsList)
    professionsList = professionsList or {}

    -- Hide all existing cards in pool first
    for _, card in ipairs(cardPool) do
        card:Hide()
    end

    local width = parentContainer:GetWidth() or 0
    local columns = CAT_PREFERRED_COLS
    local gapX = CAT_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (CAT_GRID_PADDING * 2)
        local neededWidth = (columns * CAT_CARD_SIZE) + ((columns - 1) * CAT_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = CAT_NARROW_COLS
        end
    end

    local currentY = -CAT_GRID_PADDING
    local cardGlobalIndex = 1

    -- Loop through each distinct profession section
    for _, profession in ipairs(professionsList) do
        local visibleItems = profession.items or {}

        if #visibleItems > 0 then
            -- 1. Draw your Profession Header using your original header function
            if DVD.CreateProfessionHeader then
                local collapsed, newY = DVD.CreateProfessionHeader(
                    parentContainer, 
                    profession, 
                    currentY, 
                    profession.__completedCount or 0, 
                    profession.__totalCount or #visibleItems
                )
                currentY = newY

                -- If the section isn't collapsed, draw its card grid
                if not collapsed then
                    local col, row = 0, 0
                    
                    for _, profItem in ipairs(visibleItems) do
                        local card = GetOrCreateCard(parentContainer, cardGlobalIndex)

                        card:ClearAllPoints()
                        card:SetPoint(
                            "TOPLEFT",
                            parentContainer,
                            "TOPLEFT",
                            CAT_GRID_PADDING + col * (CAT_CARD_SIZE + gapX),
                            currentY - (row * (CAT_CARD_SIZE + CAT_CARD_GAP_Y))
                        )
                        card:Show()
                        table.insert(DVD.activeWidgets, card)

                        PopulateProfessionCard(card, profItem)

                        cardGlobalIndex = cardGlobalIndex + 1
                        col = col + 1
                        if col >= columns then
                            col = 0
                            row = row + 1
                        end
                    end

                    -- Advance currentY downward past this grid's total rows
                    local rows = math.ceil(#visibleItems / columns)
                    currentY = currentY - (rows * (CAT_CARD_SIZE + CAT_CARD_GAP_Y)) - CAT_GRID_PADDING
                end
            end
        end
    end

    -- Update total content height for scrolling
    local contentHeight = math.max(math.abs(currentY) + CAT_GRID_PADDING, 100)
    parentContainer:SetHeight(contentHeight)

    return contentHeight
end
-------------------------------------------------
-- Entry point kept for ListBuilders.lua compatibility
-------------------------------------------------
function DVD.BuildProfessionGridUI(parentContainer, professionEntries)
    professionEntries = professionEntries or {}
    return RefreshProfessionGrid(parentContainer, professionEntries)
end