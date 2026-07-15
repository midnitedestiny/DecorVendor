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

if not C then
    print("|cffff4040DecorVendor ProfessionRows:|r constants are missing.")
    return
end

-- ============================================================
-- 🛡️ COMPATIBILITY GHOST HEADER (PERFECTLY STABLE FEED)
-- ============================================================
function DVD.CreateProfessionHeader(parent, profession, y, completed, total)
    local key = "prof_" .. profession.name
    DVD.collapsedHeaders = DVD.collapsedHeaders or {}
    if DVD.collapsedHeaders[key] == nil then
        DVD.collapsedHeaders[key] = false
    end
    return false, y
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
        DVD.profNotes:SetPoint("BOTTOMLEFT", DVD.itemContainer, "BOTTOMLEFT", 10, 18)
        DVD.profNotes:SetPoint("BOTTOMRIGHT", DVD.itemContainer, "BOTTOMRIGHT", -10, 18)
        DVD.profNotes:SetHeight(44)

        DVD.profNotes.bg = DVD.profNotes:CreateTexture(nil, "BACKGROUND")
        DVD.profNotes.bg:SetAllPoints()
        DVD.profNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

        DVD.profNotes.text = DVD.profNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.profNotes.text:SetPoint("TOPLEFT", DVD.profNotes, "TOPLEFT", 10, -8)
        DVD.profNotes.text:SetPoint("BOTTOMRIGHT", DVD.profNotes, "BOTTOMRIGHT", -10, 8)
        DVD.profNotes.text:SetFont(STANDARD_TEXT_FONT, 12, "")
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

-- ============================================================
-- 🛠️ PREMIUM WIDE CARD ACTIVITY FEED ROW LAYOUT
-- ============================================================
function DVD.CreateProfessionLine(parent, profItem, y)
    local learned = profItem.__learned
    local collected = profItem.__collected

    if learned == nil then
        learned = profItem.spell and (IsSpellKnown(profItem.spell) or IsPlayerSpell(profItem.spell)) or false
    end

    if collected == nil then
        collected = (profItem.id and DVD.IsItemCollected) and DVD.IsItemCollected(profItem.id) or false
    end

    -- 🌟 1. Main Row Card Container Button
    local rowHeight = 44
    local line = CreateFrame("Button", nil, parent, "BackdropTemplate")
    line:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, y)
    line:SetPoint("RIGHT", parent, "RIGHT", -12, 0)
    line:SetHeight(rowHeight)
    line:RegisterForClicks("AnyUp")

    -- 🌟 2. Custom Sleek Midnight Backdrop
    line:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        tileSize = 0,
        edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
    line:SetBackdropColor(0.12, 0.08, 0.18, 0.85)       -- Deep purple midnight theme tint
    line:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6) -- Muted border edge accents

    -- Hover Highlight Scripts
    line:SetScript("OnEnter", function(self)
        SetCursor("INSPECT_CURSOR")
        self:SetBackdropColor(0.18, 0.14, 0.26, 0.95)
        self:SetBackdropBorderColor(0.00, 0.80, 1.00, 0.8) -- Sleek cyan focus ring highlight

        -- Tooltip Callouts
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        local itemName = C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(profItem.id) or GetItemInfo(profItem.id)
        GameTooltip:AddLine(itemName or ("Item ID: " .. tostring(profItem.id)), 1, 1, 1)
        GameTooltip:AddLine(" ")
        if collected then
            GameTooltip:AddLine("|cff00ff00Owned Decor|r")
        elseif learned then
            GameTooltip:AddLine("|cffff9900Recipe Learned|r")
        else
            GameTooltip:AddLine("|cffaaaaaaNot Learned|r")
        end
        GameTooltip:AddLine("|cff00ff00<Left Click>|r View Decor & Reagents", 1, 1, 1)
        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function(self)
        ResetCursor()
        self:SetBackdropColor(0.12, 0.08, 0.18, 0.85)
        self:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6)
        GameTooltip:Hide()
    end)

    -- 🌟 3. LEFT EDGE: Color Accent Indicator Bars (Top = State, Bottom = Sourced)
    local topIndicator = line:CreateTexture(nil, "OVERLAY")
    topIndicator:SetWidth(4)
    topIndicator:SetPoint("TOPLEFT", line, "TOPLEFT", 0, 0)
    topIndicator:SetPoint("BOTTOMLEFT", line, "LEFT", 0, 0)
    topIndicator:SetTexture("Interface\\Buttons\\WHITE8x8")

    local bottomIndicator = line:CreateTexture(nil, "OVERLAY")
    bottomIndicator:SetWidth(4)
    bottomIndicator:SetPoint("TOPLEFT", line, "LEFT", 0, 0)
    bottomIndicator:SetPoint("BOTTOMLEFT", line, "BOTTOMLEFT", 0, 0)
    bottomIndicator:SetTexture("Interface\\Buttons\\WHITE8x8")

    -- Assign color code values to the edge strips based on status values
    if collected then
        topIndicator:SetVertexColor(0.2, 1.0, 0.5, 1)    -- Bright emerald owned green
        bottomIndicator:SetVertexColor(0.2, 1.0, 0.5, 1)
    elseif learned then
        topIndicator:SetVertexColor(1.0, 0.6, 0.1, 1)    -- Learned recipe orange strip
        bottomIndicator:SetVertexColor(0.5, 0.5, 0.5, 1) -- Grey backdrop fallback
    else
        topIndicator:SetVertexColor(1.0, 0.2, 0.2, 1)    -- Missing recipe crimson alert red
        bottomIndicator:SetVertexColor(0.3, 0.3, 0.3, 1)
    end

    -- 🌟 4. Main Item Icon Texture Graphic
    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("LEFT", line, "LEFT", 12, 0)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")

    -- 🌟 5. Quality Glow Background Frame Rim Insets
    local iconBorder = CreateFrame("Frame", nil, line, "BackdropTemplate")
    iconBorder:SetSize(36, 36)
    iconBorder:SetPoint("CENTER", icon, "CENTER", 0, 0)
    local lineLevel = line:GetFrameLevel() or 1
    iconBorder:SetFrameLevel(math.max(0, lineLevel - 1))
    iconBorder:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    iconBorder:SetBackdropColor(0.05, 0.05, 0.05, 0.8)
    iconBorder:SetBackdropBorderColor(0.35, 0.30, 0.50, 0.6)

    -- 🌟 6. Main Typography Item Label Text String Frame
    local nameText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetFont(STANDARD_TEXT_FONT, 13, "")
    nameText:SetPoint("LEFT", icon, "RIGHT", 12, 4)
    nameText:SetWidth(180)
    nameText:SetJustifyH("LEFT")
    nameText:SetTextColor(0.92, 0.90, 0.96)
    nameText:SetText("Loading item data...")

    -- 🌟 7. Secondary Description Text Frame (Subtext sitting below name)
    local subText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subText:SetFont(STANDARD_TEXT_FONT, 11, "")
    subText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -2)
    subText:SetWidth(180)
    subText:SetJustifyH("LEFT")
    
    if collected then
        subText:SetText("|cff30d580Collected & Ready|r")
    elseif learned then
        subText:SetText("|cffff9900Recipe Learned|r")
    else
        subText:SetText("|cffaaaaaaRecipe Unknown|r")
    end

    -- 🌟 8. Far Right Status Notification String Callout
    local statusText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    statusText:SetPoint("RIGHT", line, "RIGHT", -16, 0)
    statusText:SetJustifyH("RIGHT")
    
    if collected then
        statusText:SetText("|cff30d580OWNED|r")
    elseif learned then
        statusText:SetText("|cffff9900CRAFTABLE|r")
    else
        statusText:SetText("|cffff4040LOCKED|r")
    end

    -- Call database handle update functions sequentially
    local itemObj = Item:CreateFromItemID(profItem.id)
    itemObj:ContinueOnItemLoad(function()
        if nameText then
            nameText:SetText(itemObj:GetItemName())
        end
        if icon then
            local texture = itemObj:GetItemIcon()
            if texture then icon:SetTexture(texture) end
        end
    end)

    -- Click Actions
    line:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            DVD.UpdateProfessionPreview(profItem)
            DVD.ShowReagentsPopup(profItem)
        end
    end)

    table.insert(DVD.activeWidgets, line)
    -- Shift the next item button downward by exactly 49px (44px row height + 5px cell padding spacing)
    return y - (rowHeight + 5)
end