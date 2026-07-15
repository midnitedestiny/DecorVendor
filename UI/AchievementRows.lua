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
    print("|cffff4040DecorVendor AchievementRows:|r constants are missing.")
    return
end

-- ============================================================
-- 🛡️ AUTHENTIC ACCORDION HEADER (KEPT EXACTLY INTACT)
-- ============================================================
function DVD.CreateAchievementHeader(parent, achievement, y, completed, total)
    completed = tonumber(completed) or 0
    total     = tonumber(total) or 0

    local headerName
    if type(achievement) == "string" then
        headerName = achievement
    elseif type(achievement) == "table" and achievement.name then
        headerName = achievement.name
    else
        headerName = "Unknown Category"
    end

    local collapseKey = "ach_" .. headerName

    if DVD.collapsedHeaders[collapseKey] == nil then
        DVD.collapsedHeaders[collapseKey] = true
    end

    local collapsed = DVD.collapsedHeaders[collapseKey]

    if DVD.filtersJustChanged then
        local groupSel = DVD.filters.achievements.groups

        if not groupSel[headerName] then
            DVD.collapsedHeaders[collapseKey] = true
            collapsed = true
        end
    end

    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, y)
    header:SetPoint("RIGHT", parent, "RIGHT", -6, 0)
    header:SetHeight(C.VENDOR_HEADER_HEIGHT)

    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL",
        CreateColor(0.15, 0.10, 0.25, 0.9),
        CreateColor(0.05, 0.05, 0.15, 0.9)
    )

    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 13)
    header.icon:SetPoint("LEFT", 10, 0)
    header.icon:SetText(collapsed and "+" or "-")

    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 12,"OUTLINE")
    header.text:SetPoint("LEFT", 20, 0)
    header.text:SetText(string.format(headerName or "Unknown", completed, total))

    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 12,"OUTLINE")
    header.progress:SetPoint("RIGHT", -8, 0)
    header.progress:SetText(string.format("%d/%d completed", completed, total))

    local color
    if total > 0 and completed == total then
        color = CreateColor(0.2, 1, 0.2, 1)
    elseif completed >= total / 2 then
        color = CreateColor(1, 0.82, 0, 1)
    else
        color = CreateColor(0.9, 0.9, 0.9, 1)
    end
    header.progress:SetTextColor(color:GetRGBA())

    header:SetScript("OnClick", function()
        DVD.ToggleAccordionHeader("achievements", collapseKey)
    end)

    table.insert(DVD.activeWidgets, header)
    return collapsed, y - 26
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
    DVD.modelTitle:ClearAllPoints()
    DVD.modelTitle:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", 0, -6)
    DVD.modelTitle:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", 0, -6)

    DVD.modelTitle:SetText(achievement.title or "Achievement Preview")
    DVD.modelTitle:SetTextColor(1, 1, 1)
    DVD.modelTitle:Show()

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
        wrapper:SetHeight(28)

        wrapper.icon = wrapper:CreateTexture(nil, "ARTWORK")
        wrapper.icon:SetSize(18, 18)
        wrapper.icon:SetPoint("LEFT", 6, 0)
        wrapper.icon:SetTexture("Interface\\Icons\\Achievement_Quests_Completed_08")

        DVD.achievementWowheadBox = CreateFrame("EditBox", nil, wrapper, "InputBoxTemplate")
        local box = DVD.achievementWowheadBox
        box:SetAutoFocus(false)
        box:SetHeight(22)
        box:SetPoint("LEFT", wrapper.icon, "RIGHT", 6, 0)
        box:SetPoint("RIGHT", wrapper, "RIGHT", -8, 0)
        box:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    end

    DVD.achievementWowheadWrapper:ClearAllPoints()
    DVD.achievementWowheadWrapper:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -6)
    DVD.achievementWowheadWrapper:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -6)
    DVD.achievementWowheadBox:SetText("https://www.wowhead.com/achievement=" .. achievement.id)
    DVD.achievementWowheadWrapper:Show()
end

-- ============================================================
-- 🏆 PREMIUM MIDNIGHT WIDE CARD ACHIEVEMENT ROW LAYOUT
-- ============================================================
function DVD.CreateAchievementLine(parent, achievement, y)
    local id = achievement.id
    local isCompleted = DVD.IsAchievementComplete(id)
    
    if isCompleted and vendorSettings and vendorSettings.hideCompletedThings and not vendorSettings.markCompletedThings then
        return y
    end

    local name = select(2, GetAchievementInfo(id)) or "Unknown Achievement"

    -- 🌟 1. Main Row Card Container Button
    local rowHeight = 44
    local line = CreateFrame("Button", nil, parent, "BackdropTemplate")
    line:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, y)
    line:SetPoint("RIGHT", parent, "RIGHT", -12, 0)
    line:SetHeight(rowHeight)
    line:RegisterForClicks("AnyUp")

    -- 🌟 2. Custom Premium Midnight Backdrop 
    line:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        tileSize = 0,
        edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
    line:SetBackdropColor(0.12, 0.08, 0.18, 0.85)       
    line:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6) 

    -- 🌟 3. LEFT EDGE: Split Color Status Strip Indicators
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

    local collected = achievement.itemID and DVD.IsItemCollected and DVD.IsItemCollected(achievement.itemID) or false
    if collected then
        bottomIndicator:SetVertexColor(0.2, 1.0, 0.5, 1)
    else
        bottomIndicator:SetVertexColor(0.4, 0.4, 0.4, 1) 
    end

    -- 🌟 4. True Reward Decor Icon Artwork Loader
    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("LEFT", line, "LEFT", 12, 0)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    
    local rewardTexture = "Interface\\Icons\\INV_Misc_Gift_01"
    if achievement.itemID then
        rewardTexture = C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(achievement.itemID) or GetItemIcon(achievement.itemID) or rewardTexture
    elseif id then
        rewardTexture = select(10, GetAchievementInfo(id)) or rewardTexture
    end
    icon:SetTexture(rewardTexture)

    -- Quality Rim Inset Frame Border
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

    -- 🌟 5. LEFT SIDE TEXTS: Main Achievement Title Name
    local nameText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetFont(STANDARD_TEXT_FONT, 13, "")
    nameText:SetPoint("LEFT", icon, "RIGHT", 12, 4)
    nameText:SetWidth(185)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(name)

    -- Left Subtext: Summary state description
    local subText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subText:SetFont(STANDARD_TEXT_FONT, 11, "")
    subText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -2)
    subText:SetWidth(185)
    subText:SetJustifyH("LEFT")
    subText:SetTextColor(0.70, 0.68, 0.78)
    subText:SetText(isCompleted and "|cff30d580Achievement Earned|r" or "|cffff4040Locked / Incomplete|r")

    if isCompleted and vendorSettings and vendorSettings.markCompletedThings then
        nameText:SetTextColor(0.62, 0.62, 0.62)
        nameText:SetAlpha(0.7)
    else
        if achievement.faction then
            local f = string.lower(achievement.faction)
            local color = (f == "alliance" and C.COLORS.ALLIANCE) or  
                          (f == "horde" and C.COLORS.HORDE) or  
                          (f == "neutral" and C.COLORS.NEUTRAL)
            nameText:SetTextColor(unpack(color or {0.92, 0.90, 0.96}))
        else
            nameText:SetTextColor(0.92, 0.90, 0.96)
        end
        nameText:SetAlpha(1)
    end

    -- 🌟 6. RIGHT SIDE TEXTS: Sourced Category Sizing
    local pointsText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    pointsText:SetFont(STANDARD_TEXT_FONT, 12, "")
    pointsText:SetPoint("TOPRIGHT", line, "TOPRIGHT", -16, -6) 
    pointsText:SetJustifyH("RIGHT")
    pointsText:SetTextColor(0.85, 0.75, 0.45) 
    
    local points = select(3, GetAchievementInfo(id)) or 10
    pointsText:SetText(tostring(points) .. " Points")

    -- 🌟 7. RIGHT SIDE TEXTS: Faction Requirements
    local factionText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    factionText:SetFont(STANDARD_TEXT_FONT, 10, "")
    factionText:SetPoint("TOPRIGHT", pointsText, "BOTTOMRIGHT", 0, -2)
    factionText:SetJustifyH("RIGHT")

    local fLower = string.lower(tostring(achievement.faction or "neutral"))
    if fLower == "alliance" then
        factionText:SetText("|cff00fbffAlliance Only|r")
    elseif fLower == "horde" then
        factionText:SetText("|cffff4040Horde Only|r")
    else
        factionText:SetText("|cffaaaaaaNeutral Achievement|r")
    end

    -- Click Executions
    line:SetScript("OnClick", function(_, button)
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

    -- Mouse Interaction Scripts
    line:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.18, 0.14, 0.26, 0.95)
        self:SetBackdropBorderColor(0.00, 0.80, 1.00, 0.8) 

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00<Left Click>|r Track Achievement Progress", 1, 1, 1)
        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.12, 0.08, 0.18, 0.85)
        self:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6)
        GameTooltip:Hide()
    end)

    table.insert(DVD.activeWidgets, line)
    return y - (rowHeight + 5)
end