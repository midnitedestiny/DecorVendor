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
local COLORS = C.COLORS or {}

if not DVD.contentArea then
    print("|cffff4040DecorVendor ListFrame:|r DVD.contentArea is missing. Make sure UI\\MainFrame.lua loads first.")
    return
end

local function Color(name, fallback)
    return COLORS[name] or fallback
end

local LIST_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
}

-------------------------------------------------
-- List Panel
-------------------------------------------------

local listPanel = CreateFrame("Frame", "DV_ListPanel", DVD.contentArea, "BackdropTemplate")
DVD.listPanel = listPanel

listPanel:SetPoint("TOPLEFT", DVD.contentArea, "TOPLEFT", 4, -4)
listPanel:SetPoint("BOTTOMLEFT", DVD.contentArea, "BOTTOMLEFT", 4, 4)

if DVD.previewPanel then
    listPanel:SetPoint("RIGHT", DVD.previewPanel, "LEFT", -12, 0)
else
    listPanel:SetPoint("RIGHT", DVD.contentArea, "RIGHT", -346, 0)
end

listPanel:SetBackdrop(LIST_BACKDROP)
listPanel:SetBackdropColor(0.035, 0.025, 0.06, 0.92)
listPanel:SetBackdropBorderColor(0.38, 0.28, 0.56, 0.9)

local listBg = listPanel:CreateTexture(nil, "BACKGROUND")
listBg:SetPoint("TOPLEFT", listPanel, "TOPLEFT", 3, -3)
listBg:SetPoint("BOTTOMRIGHT", listPanel, "BOTTOMRIGHT", -3, 3)
listBg:SetColorTexture(0.025, 0.018, 0.045, 0.86)

local topAccent = listPanel:CreateTexture(nil, "ARTWORK")
topAccent:SetPoint("TOPLEFT", listPanel, "TOPLEFT", 8, -5)
topAccent:SetPoint("TOPRIGHT", listPanel, "TOPRIGHT", -8, -5)
topAccent:SetHeight(1)
topAccent:SetColorTexture(1, 0.78, 0.28, 0.40)

local bottomAccent = listPanel:CreateTexture(nil, "ARTWORK")
bottomAccent:SetPoint("BOTTOMLEFT", listPanel, "BOTTOMLEFT", 8, 5)
bottomAccent:SetPoint("BOTTOMRIGHT", listPanel, "BOTTOMRIGHT", -8, 5)
bottomAccent:SetHeight(1)
bottomAccent:SetColorTexture(0.55, 0.28, 0.95, 0.40)

-------------------------------------------------
-- Scroll Frame
-------------------------------------------------

local scrollFrame = CreateFrame("ScrollFrame", "DV_ScrollFrame", listPanel, "ScrollFrameTemplate")
DVD.scrollFrame = scrollFrame

scrollFrame:SetPoint("TOPLEFT", listPanel, "TOPLEFT", 8, -8)
scrollFrame:SetPoint("BOTTOMRIGHT", listPanel, "BOTTOMRIGHT", -8, 8)

if scrollFrame.ScrollBar then
    scrollFrame.ScrollBar:Hide()
end

local scrollChild = CreateFrame("Frame", "DV_ScrollChild", scrollFrame)
DVD.scrollChild = scrollChild

scrollFrame:SetScrollChild(scrollChild)

local function UpdateScrollChildWidth()
    local width = scrollFrame:GetWidth()

    if not width or width <= 1 then
        width = (DVD.listPanel and DVD.listPanel:GetWidth() - 20) or 340
    end

    scrollChild:SetWidth(width)
end

UpdateScrollChildWidth()

scrollFrame:SetScript("OnSizeChanged", function()
    UpdateScrollChildWidth()
end)

scrollChild:SetHeight(1)

scrollFrame:SetScript("OnMouseWheel", function(self, delta)
    local current = self:GetVerticalScroll()
    local maxScroll = self:GetVerticalScrollRange()
    local step = 45

    if delta < 0 then
        self:SetVerticalScroll(math.min(current + step, maxScroll))
    else
        self:SetVerticalScroll(math.max(current - step, 0))
    end
end)

-------------------------------------------------
-- Empty / loading overlay helper
-------------------------------------------------

local emptyText = listPanel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
DVD.listEmptyText = emptyText

emptyText:SetPoint("CENTER", listPanel, "CENTER", 0, 0)
emptyText:SetText("Select a category")
emptyText:SetTextColor(0.72, 0.62, 0.86, 0.8)
emptyText:Hide()