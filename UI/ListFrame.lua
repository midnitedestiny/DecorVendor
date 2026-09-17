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
local Sizing = C.ListFrameSizing
local PreviewSizing = C.PreviewPanelSizing
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

if not C then
    print("|cffff4040DecorVendor ListFrame:|r constants are missing.")
    return
end

if not Sizing then
    print("|cffff4040DecorVendor ListFrame:|r ListFrameSizing is missing.")
    return
end

if not PreviewSizing then
    print("|cffff4040DecorVendor ListFrame:|r PreviewPanelSizing is missing.")
    return
end

if not DVD.contentArea then
    print("|cffff4040DecorVendor ListFrame:|r DVD.contentArea is missing. Make sure UI\\MainFrame.lua loads first.")
    return
end

-------------------------------------------------
-- List Panel
-------------------------------------------------

local listPanel = CreateFrame("Frame", "DV_ListPanel", DVD.contentArea, "BackdropTemplate")
DVD.listPanel = listPanel

listPanel:SetPoint("TOPLEFT", DVD.contentArea, "TOPLEFT", Sizing.PanelInset, -Sizing.PanelInset)
listPanel:SetPoint("BOTTOMLEFT", DVD.contentArea, "BOTTOMLEFT", Sizing.PanelInset, Sizing.PanelInset)

if DVD.previewPanel then
    listPanel:SetPoint("RIGHT", DVD.previewPanel, "LEFT", -Sizing.PreviewGap, 0)
else 
local previewReserve = PreviewSizing.Width + Sizing.PreviewGap + Sizing.PanelInset
    listPanel:SetPoint("RIGHT", DVD.contentArea, "RIGHT", -previewReserve, 0)
end

listPanel:SetBackdrop(LIST_BACKDROP)
listPanel:SetBackdropColor(0.035, 0.025, 0.06, 0.92)
listPanel:SetBackdropBorderColor(0, 0, 0, 0)

local listBg = listPanel:CreateTexture(nil, "BACKGROUND")
listBg:SetPoint("TOPLEFT", listPanel, "TOPLEFT", Sizing.BackgroundInset, -Sizing.BackgroundInset)
listBg:SetPoint("BOTTOMRIGHT", listPanel, "BOTTOMRIGHT", -Sizing.BackgroundInset, Sizing.BackgroundInset)
listBg:SetColorTexture(0.025, 0.018, 0.045, 0.86)

-------------------------------------------------
-- Scroll Frame
-------------------------------------------------

local scrollFrame = CreateFrame("ScrollFrame", "DV_ScrollFrame", listPanel, "ScrollFrameTemplate")
DVD.scrollFrame = scrollFrame

scrollFrame:SetPoint("TOPLEFT", listPanel, "TOPLEFT", Sizing.ScrollInset, -Sizing.ScrollInset)
scrollFrame:SetPoint("BOTTOMRIGHT", listPanel, "BOTTOMRIGHT", -Sizing.ScrollInset, Sizing.ScrollInset)

if scrollFrame.ScrollBar then
    scrollFrame.ScrollBar:Hide()
end

local scrollChild = CreateFrame("Frame", "DV_ScrollChild", scrollFrame)
DVD.scrollChild = scrollChild

scrollFrame:SetScrollChild(scrollChild)

local function UpdateScrollChildWidth()
    local width = scrollFrame:GetWidth()

    if not width or width <= 1 then
        local panelWidth =
            DVD.listPanel
            and DVD.listPanel:GetWidth()

        if panelWidth and panelWidth > 1 then
            width =
                panelWidth
                - Sizing.ScrollWidthPadding
        else
            width = Sizing.FallbackScrollChildWidth
        end
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
    local step = Sizing.MouseWheelStep

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