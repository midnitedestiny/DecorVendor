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
    print("|cffff4040DecorVendor QuestRows:|r constants are missing.")
    return
end

-- Create a session anchor string to pass down parent header category names
local currentGroupName = "World Quest"

-- ============================================================
-- 🛡️ COMPATIBILITY GHOST HEADER (RECAPTURES LOCATION GROUPS)
-- ============================================================
function DVD.CreateQuestHeader(parent, questGroup, y, completed, total)
    if type(questGroup) == "table" and questGroup.name then
        currentGroupName = questGroup.name
    elseif type(questGroup) == "string" then
        currentGroupName = questGroup
    else
        currentGroupName = "World Quest"
    end

    local collapseKey = "quest_" .. currentGroupName
    DVD.collapsedHeaders = DVD.collapsedHeaders or {}
    if DVD.collapsedHeaders[collapseKey] == nil then
        DVD.collapsedHeaders[collapseKey] = false
    end

    return false, y
end

-- ============================================================
-- 🛠️ PREMIUM MIDNIGHT WIDE CARD QUEST ROW LAYOUT
-- ============================================================
function DVD.CreateQuestLine(parent, quest, y)
    local id = quest.id
    local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

    if isCompleted and vendorSettings and vendorSettings.hideCompletedThings and not vendorSettings.markCompletedThings then
        return y
    end

    local liveTitle = DVD.questTitleCache[id] or C_QuestLog.GetTitleForQuestID(id)
    local name
    local loading = false

    if liveTitle and liveTitle ~= "" then
        name = liveTitle
        DVD.questTitleCache[id] = liveTitle
    else
        name = quest.questName or "|cff888888Quest title unavailable|r"
        loading = not quest.questName
    end

    -- 🌟 1. Main Row Card Container Button
    local rowHeight = 44
    local line = CreateFrame("Button", nil, parent, "BackdropTemplate")
    line:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, y)
    line:SetPoint("RIGHT", parent, "RIGHT", -12, 0)
    line:SetHeight(rowHeight)
    line:RegisterForClicks("AnyUp")

    -- 🌟 2. Custom Midnight Premium Theme Backdrop
    line:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        tileSize = 0,
        edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })

    -- 🚀 DETERMINING VISUAL MARK COMPLETED BACKDROP OVERRIDES
    local shouldMark = isCompleted and vendorSettings and vendorSettings.markCompletedThings
    if shouldMark then
        -- Muted, desaturated dark grey-purple state matching your completed achievements cards
        line:SetBackdropColor(0.06, 0.05, 0.08, 0.50)       
        line:SetBackdropBorderColor(0.15, 0.12, 0.20, 0.3) 
    else
        -- Vibrant premium purple theme active state
        line:SetBackdropColor(0.12, 0.08, 0.18, 0.85)       
        line:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6) 
    end

    -- 🌟 3. LEFT EDGE: Split Color Indicator Status Bars
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

    if isCompleted then
        topIndicator:SetVertexColor(0.2, 1.0, 0.5, 1) 
    else
        topIndicator:SetVertexColor(1.0, 0.2, 0.2, 1) 
    end

    local collected = quest.itemID and DVD.IsItemCollected and DVD.IsItemCollected(quest.itemID) or false
    if collected then
        bottomIndicator:SetVertexColor(0.2, 1.0, 0.5, 1)
    else
        bottomIndicator:SetVertexColor(0.4, 0.4, 0.4, 1) 
    end

    -- 🌟 4. True Reward Decor Icon Canvas Layout
    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("LEFT", line, "LEFT", 12, 0)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    
    local rewardTexture = "Interface\\Icons\\INV_Misc_Bag_10"
    if quest.itemID then
        rewardTexture = C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(quest.itemID) or GetItemIcon(quest.itemID) or rewardTexture
    end
    icon:SetTexture(rewardTexture)

    -- 🚀 Desaturate/Grey-out the asset reward icon when marked completed
    if shouldMark then
        icon:SetDesaturated(true)
        icon:SetAlpha(0.4)
    else
        icon:SetDesaturated(false)
        icon:SetAlpha(1.0)
    end

    -- Quality Rim Border Inset Box Frame
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

    -- 🌟 5. LEFT SIDE TEXTS: Primary Label Name Frame
    local nameText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetFont(STANDARD_TEXT_FONT, 11, "")
    nameText:SetPoint("LEFT", icon, "RIGHT", 12, 4)
    nameText:SetWidth(180)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(name)

    -- Left Secondary Subtext: Reward status summary
    local subText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subText:SetFont(STANDARD_TEXT_FONT, 11, "")
    subText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -2)
    subText:SetWidth(180)
    subText:SetJustifyH("LEFT")
    subText:SetText(collected and "|cff30d580Collected & Owned|r" or "|cffaaaaaaReward Uncollected|r")

    -- 🌟 6. RIGHT SIDE TEXTS: Zone Location Info
    local zoneText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    zoneText:SetFont(STANDARD_TEXT_FONT, 12, "")
    zoneText:SetPoint("TOPRIGHT", line, "TOPRIGHT", -16, -6) 
    zoneText:SetJustifyH("RIGHT")
    zoneText:SetText(quest.zone or quest.location or currentGroupName)

    -- 🌟 7. RIGHT SIDE TEXTS: Faction Details
    local factionText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    factionText:SetFont(STANDARD_TEXT_FONT, 10, "")
    factionText:SetPoint("TOPRIGHT", zoneText, "BOTTOMRIGHT", 0, -2)
    factionText:SetJustifyH("RIGHT")

    local fLower = string.lower(tostring(quest.faction or "neutral"))
    if fLower == "alliance" then
        factionText:SetText("|cff00fbffAlliance Quest|r")
    elseif fLower == "horde" then
        factionText:SetText("|cffff4040Horde Quest|r")
    else
        factionText:SetText("|cffaaaaaaNeutral Quest|r")
    end

    -- ============================================================
    -- 🎨 INTEGRATED FACTION COLORING AND MARK-COMPLETED LOGIC ENGINE
    -- ============================================================
    if shouldMark then
        -- 👻 GREYED OUT STATE: Matches your completed achievements exactly
        nameText:SetTextColor(0.62, 0.62, 0.62)
        nameText:SetAlpha(0.7)
        subText:SetTextColor(0.45, 0.45, 0.45)
        zoneText:SetTextColor(0.50, 0.45, 0.35)
        factionText:SetAlpha(0.35)
    else
        -- 🔮 FACTION COLOR LOGIC FALLBACK RESTORATION
        if quest.faction and _G.C and _G.C.COLORS then
            local f = string.lower(quest.faction)
            local color = (f == "alliance" and _G.C.COLORS.ALLIANCE) or  
                          (f == "horde" and _G.C.COLORS.HORDE) or  
                          (f == "neutral" and _G.C.COLORS.NEUTRAL)
            nameText:SetTextColor(unpack(color or {0.92, 0.90, 0.96}))
        else
            nameText:SetTextColor(0.92, 0.90, 0.96)
        end
        
        nameText:SetAlpha(1)
        subText:SetTextColor(0.70, 0.68, 0.78)
        zoneText:SetTextColor(0.85, 0.75, 0.45)
        factionText:SetAlpha(1.0)
    end

    -- Async listeners
    if loading then
        QuestEventListener:AddCallback(id, function()
            local newName = C_QuestLog.GetTitleForQuestID(id)
            if newName and nameText and nameText:IsVisible() then
                nameText:SetText(newName)
                DVD.questTitleCache[id] = newName
            end
        end)
    end

    -- ============================================================
    -- 🖼️ SAFE PREVIEW ENGINE
    -- ============================================================
    local function UpdateQuestPreview(q)
        if not q then return end
        DVD.contentArea._isVendorPreview = false

        if DVD.modelTitle then
            local liveName = DVD.questTitleCache[q.id] or q.questName or "Quest Reward"
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
            DVD.questWowheadWrapper:SetHeight(28)

            DVD.questWowheadBox = CreateFrame("EditBox", nil, DVD.questWowheadWrapper, "InputBoxTemplate")
            DVD.questWowheadBox:SetAutoFocus(false)
            DVD.questWowheadBox:SetHeight(22)
            DVD.questWowheadBox:SetPoint("LEFT", DVD.questWowheadWrapper, "LEFT", 28, 0)
            DVD.questWowheadBox:SetPoint("RIGHT", DVD.questWowheadWrapper, "RIGHT", -8, 0)
            
            DVD.questWowheadWrapper.icon = DVD.questWowheadWrapper:CreateTexture(nil, "ARTWORK")
            DVD.questWowheadWrapper.icon:SetSize(18, 18)
            DVD.questWowheadWrapper.icon:SetPoint("LEFT", DVD.questWowheadWrapper, "LEFT", 6, 0)
            DVD.questWowheadWrapper.icon:SetTexture("Interface\\Icons\\INV_Misc_Spyglass_03")

            DVD.questWowheadBox:SetScript("OnMouseUp", function(self) self:HighlightText() end)
        end

        DVD.questWowheadWrapper:ClearAllPoints()
        DVD.questWowheadWrapper:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -6)
        DVD.questWowheadWrapper:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -6)
        DVD.questWowheadBox:SetText("https://www.wowhead.com/quest=" .. q.id)
        
        local previewData = {
            id = q.itemID,
            model3D = q.model3D,
            decorID = q.decorID,
            questID = q.id 
        }

        if DVD.UpdateProfessionPreview then
            DVD.UpdateProfessionPreview(previewData)
        end

        DVD.questWowheadWrapper:Show()

        if not DVD.questNotes then
            DVD.questNotes = CreateFrame("Frame", nil, DVD.itemContainer)
            DVD.questNotes.bg = DVD.questNotes:CreateTexture(nil, "BACKGROUND")
            DVD.questNotes.bg:SetAllPoints()
            DVD.questNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)
            DVD.questNotes.text = DVD.questNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            DVD.questNotes.text:SetPoint("TOPLEFT", 10, -10)
            DVD.questNotes.text:SetJustifyH("LEFT")
            DVD.questNotes.text:SetWordWrap(true)
            DVD.questNotes.text:SetFont(STANDARD_TEXT_FONT, 12, "")
        end

        DVD.questNotes:ClearAllPoints()
        DVD.questNotes:SetPoint("TOPLEFT", DVD.questWowheadWrapper, "BOTTOMLEFT", 0, -6)
        DVD.questNotes:SetPoint("TOPRIGHT", DVD.questWowheadWrapper, "BOTTOMRIGHT", 0, -6)

        if q.note then
            DVD.questNotes.text:SetText("• " .. q.note)
            local width = DVD.itemContainer:GetWidth() - 20
            DVD.questNotes.text:SetWidth(width - 20)
            DVD.questNotes:SetHeight(DVD.questNotes.text:GetStringHeight() + 20)
            DVD.questNotes:Show()
        else
            DVD.questNotes:Hide()
        end
    end

    -- Interactive Click Actions
    line:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if DVD.MarkPreviewContentShown then DVD.MarkPreviewContentShown() end
            UpdateQuestPreview(quest)
        end
    end)

    -- Mouse Hover Highlighting Changes
    line:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.18, 0.14, 0.26, 0.95)
        self:SetBackdropBorderColor(0.00, 0.80, 1.00, 0.8) 

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetHyperlink("quest:" .. id)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00<Left Click>|r View Decor Item Rewards", 1, 1, 1)
        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function(self)
        -- Revert seamlessly back to designated visual indicators on mouse leave
        if shouldMark then
            self:SetBackdropColor(0.06, 0.05, 0.08, 0.50)
            self:SetBackdropBorderColor(0.15, 0.12, 0.20, 0.3)
        else
            self:SetBackdropColor(0.12, 0.08, 0.18, 0.85)
            self:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6)
        end
        GameTooltip:Hide()
    end)

    table.insert(DVD.activeWidgets, line)
    return y - (rowHeight + 5)
end