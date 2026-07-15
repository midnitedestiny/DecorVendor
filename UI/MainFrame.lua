-- [[
-- ============================================================
-- Decor Vendor Addon
-- © 2026 MidniteDestiny. All Rights Reserved.
-- ============================================================
-- 
-- This file is part of the Decor Vendor addon.
-- 
-- All code, structure, and design are the intellectual
-- property of MidniteDestiny unless otherwise stated.
-- 
-- You may NOT:
-- • Copy, reproduce, or redistribute this code
-- • Modify and redistribute this code
-- • Use this code in other addons or projects
-- 
-- without explicit permission from the author.
-- 
-- This addon is distributed for personal use only.
-- 
-- ============================================================
-- ]]

-- 🌟 SOLE UNIFIED NAMESPACE: Natively mapping onto DVD
local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local COLORS = C.COLORS or {}

local CatSizing = C.CatalogSizing or {}

local MIN_WIDTH = CatSizing.FrameWidth or C.MIN_FRAME_WIDTH or 1100
local MIN_HEIGHT = CatSizing.FrameHeight or C.MIN_FRAME_HEIGHT or 750

local DEFAULT_WIDTH = CatSizing.FrameWidth or C.DEFAULT_FRAME_WIDTH or 1100
local DEFAULT_HEIGHT = CatSizing.FrameHeight or C.DEFAULT_FRAME_HEIGHT or 750

local SIDEBAR_WIDTH = CatSizing.SidebarWidth or C.SIDEBAR_WIDTH or 200
local HEADER_HEIGHT = C.HEADER_HEIGHT or 58

local DETAIL_PANEL_WIDTH = CatSizing.DetailPanelWidth or 330
local BOTTOM_BAR_HEIGHT = CatSizing.BottomBarHeight or 44

local function Color(name, fallback)
    return COLORS[name] or fallback
end

local function ApplyColor(texture, color)
    texture:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
end

local MAIN_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 14,
    insets = { left = 3, right = 3, top = 3, bottom = 3 }
}

local PANEL_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
}

local BUTTON_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

-------------------------------------------------
-- Main Frame
-------------------------------------------------
local frame = CreateFrame("Frame", "DV_MainFrame", UIParent, "BackdropTemplate")
DVD.frame = frame

frame:SetSize(DEFAULT_WIDTH, DEFAULT_HEIGHT)
frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 100, -100)
frame:SetFrameStrata("HIGH")
frame:SetFrameLevel(100)
frame:SetBackdrop(MAIN_BACKDROP)
frame:SetBackdropColor(0.025, 0.018, 0.045, 0.96)
frame:SetBackdropBorderColor(0.55, 0.38, 0.78, 0.95)
frame:SetMovable(true)
frame:SetResizable(false)
frame:EnableMouse(true)
frame:Hide()

if frame.SetResizeBounds then
    frame:SetResizeBounds(MIN_WIDTH, MIN_HEIGHT, 1200, 850)
end

frame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)

frame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)

local shadow = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
shadow:SetPoint("TOPLEFT", frame, "TOPLEFT", -10, 10)
shadow:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 10, -10)
shadow:SetColorTexture(0, 0, 0, 0.45)

-------------------------------------------------
-- Small icon button helper
-------------------------------------------------
local function CreateHeaderIconButton(parent, texturePath, tooltipTitle, tooltipText, onClick)
    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(C.INFOSIZE_WIDTH or 24, C.INFOSIZE_HEIGHT or 24)
    btn:SetBackdrop(BUTTON_BACKDROP)
    btn:SetBackdropColor(0.08, 0.055, 0.13, 0.85)
    btn:SetBackdropBorderColor(0.52, 0.38, 0.72, 0.85)

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", btn, "TOPLEFT", 4, -4)
    icon:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", -4, 4)
    icon:SetTexture(texturePath)
    btn.icon = icon

    local hover = btn:CreateTexture(nil, "HIGHLIGHT")
    hover:SetAllPoints(btn)
    hover:SetColorTexture(0.75, 0.55, 1, 0.18)

    btn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(1, 0.82, 0.35, 1)

        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine(tooltipTitle, 1, 0.82, 0)

        if tooltipText then
            GameTooltip:AddLine(tooltipText, 0.82, 0.82, 0.82, true)
        end

        GameTooltip:Show()
    end)

    btn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.52, 0.38, 0.72, 0.85)
        GameTooltip:Hide()
    end)

    btn:SetScript("OnClick", onClick)

    return btn
end

-------------------------------------------------
-- Header
-------------------------------------------------
function DVD:BuildMainFrameHeader()
    local titleBar = CreateFrame("Frame", "DV_TitleBar", frame, "BackdropTemplate")
    frame.titleBar = titleBar

    titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)
    titleBar:SetHeight(HEADER_HEIGHT)
    titleBar:SetBackdrop(PANEL_BACKDROP)
    titleBar:SetBackdropColor(0.045, 0.028, 0.075, 0.96)
    titleBar:SetBackdropBorderColor(0.65, 0.45, 0.9, 0.9)

    local titleBg = titleBar:CreateTexture("DV_TitleBG", "BACKGROUND")
    titleBg:SetAllPoints(titleBar)
    ApplyColor(titleBg, {0.075, 0.04, 0.12, 0.9})
    frame.titleBg = titleBg

    local accentTop = titleBar:CreateTexture(nil, "ARTWORK")
    accentTop:SetPoint("TOPLEFT", titleBar, "TOPLEFT", 8, -2)
    accentTop:SetPoint("TOPRIGHT", titleBar, "TOPRIGHT", -8, -2)
    accentTop:SetHeight(1)
    accentTop:SetColorTexture(1, 0.78, 0.28, 0.55)

    local accentBottom = titleBar:CreateTexture(nil, "ARTWORK")
    accentBottom:SetPoint("BOTTOMLEFT", titleBar, "BOTTOMLEFT", 8, 2)
    accentBottom:SetPoint("BOTTOMRIGHT", titleBar, "BOTTOMRIGHT", -8, 2)
    accentBottom:SetHeight(1)
    accentBottom:SetColorTexture(0.55, 0.28, 0.95, 0.65)

    local infoIcon = CreateHeaderIconButton(
        titleBar,
        "Interface\\BUTTONS\\UI-GuildButton-OfficerNote-Up",
        "Decor Vendor Notice",
        format(C.VERSION_TEXT or "Current Version: %s", C.VERSION or "Unknown"),
        nil
    )
    infoIcon:SetPoint("LEFT", titleBar, "LEFT", 12, 0)

    local settingsBtn = CreateFrame("Button", nil, titleBar, "UIPanelButtonTemplate")
    settingsBtn:SetSize(86, 22)
    settingsBtn:SetPoint("LEFT", infoIcon, "RIGHT", 8, 0)
    settingsBtn:SetText("Settings")
    settingsBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("Open Settings", 1, 0.82, 0)
        GameTooltip:Show()
    end)

    settingsBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    settingsBtn:SetScript("OnClick", function()
        if Settings and DVD.optionsCategory then
            Settings.OpenToCategory(DVD.optionsCategory:GetID())
        end
    end)
    
    local homeBtn = CreateFrame("Button", nil, titleBar, "UIPanelButtonTemplate")
    homeBtn:SetSize(70, 22)
    homeBtn:SetPoint("LEFT", settingsBtn, "RIGHT", 8, 0)
    homeBtn:SetText("Home")

    homeBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("Open Home", 1, 0.82, 0)
        GameTooltip:AddLine("Return to the Decor Vendor section menu.", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)

    homeBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    homeBtn:SetScript("OnClick", function()
        if DVD.ShowMainHomePanel then
            DVD.ShowMainHomePanel()
        end
    end)

    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("CENTER", titleBar, "CENTER", -20, 5)
    title:SetWidth(420)
    title:SetJustifyH("CENTER")
    title:SetText("The Original Decor Vendors")
    title:SetTextColor(unpack(Color("TITLE", {0.88, 0.68, 1, 1})))

    local closeBtn = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
    closeBtn:SetPoint("RIGHT", titleBar, "RIGHT", -4, 0)
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)

    local resetBtn = CreateFrame("Button", "DV_ResetProgressBtn", titleBar, "UIPanelButtonTemplate")
    resetBtn:SetSize(C.RESETBTN_WIDTH or 110, C.RESETBTN_HEIGHT or 24)
    resetBtn:SetPoint("RIGHT", closeBtn, "LEFT", -6, 0)
    resetBtn:SetText("Reset Vendors")
    resetBtn:SetScript("OnClick", function()
        StaticPopupDialogs["DV_RESET_VENDORS"] = {
            text = "Reset all vendor progress?\nThis cannot be undone.",
            button1 = "Reset",
            button2 = "Cancel",
            OnAccept = function()
                if ResetAllVendors then
                    ResetAllVendors()
                end

                if BuildVendorUI then
                    BuildVendorUI()
                elseif DVD.BuildVendorUI then
                    DVD.BuildVendorUI()
                end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3
        }

        StaticPopup_Show("DV_RESET_VENDORS")
    end)

    local searchBox = CreateFrame("EditBox", "DV_SearchBox", titleBar, "SearchBoxTemplate")
    searchBox:SetSize(C.SEARCHBOX_WIDTH or 260, C.SEARCHBOX_HEIGHT or 22)
    searchBox:SetPoint("RIGHT", resetBtn, "LEFT", -10, 0)
    searchBox:SetScale(1)
    searchBox:SetAutoFocus(false)

    if searchBox.Instructions then
        searchBox.Instructions:SetText("Search vendors or decor...")
    end

    searchBox:SetScript("OnTextChanged", function(self)
        SearchBoxTemplate_OnTextChanged(self)

        local text = self:GetText()
        DVD.searchQuery = text ~= "" and string.lower(text) or nil

        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end)
end

-------------------------------------------------
-- Sidebar
-------------------------------------------------
function DVD:BuildMainFrameSidebar()
    local CatSizing = C.CatalogSizing or {}
    local sidebarWidth = CatSizing.SidebarWidth or SIDEBAR_WIDTH or 200
    local bottomBarHeight = CatSizing.BottomBarHeight or BOTTOM_BAR_HEIGHT or 44
    local headerHeight = CatSizing.FilterBarHeight or HEADER_HEIGHT or 32

    local sidebar = CreateFrame("Frame", "DV_Sidebar", frame, "BackdropTemplate")
    frame.sidebar = sidebar
    DVD.sidebar = sidebar

    sidebar:SetWidth(sidebarWidth)
    sidebar:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -(headerHeight + 16))
    sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 8, bottomBarHeight + 8)

    sidebar:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8"
    })
    sidebar:SetBackdropColor(0.04, 0.04, 0.06, 0.96)

    local content = CreateFrame("Frame", "DV_SidebarFilters", sidebar)
    frame.sidebarFilters = content
    DVD.sidebarFilters = content

    content:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 8, -8)
    content:SetPoint("TOPRIGHT", sidebar, "TOPRIGHT", -6, -8)
    content:SetPoint("BOTTOMRIGHT", sidebar, "BOTTOMRIGHT", -6, 74)
    content:SetWidth(sidebarWidth - 14)

    if content.SetClipsChildren then
        content:SetClipsChildren(true)
    end

    sidebar.filterContent = content
    sidebar.filtersContainer = content
end

-------------------------------------------------
-- Content Area
-------------------------------------------------
function DVD:CreateContentArea()
    local content = CreateFrame("Frame", "DV_content", frame, "BackdropTemplate")
    content:SetPoint("TOPLEFT", frame.sidebar, "TOPRIGHT", 8, 0)
    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, BOTTOM_BAR_HEIGHT + 8)
    content:SetFrameLevel(frame:GetFrameLevel())
    content:SetBackdrop(PANEL_BACKDROP)
    content:SetBackdropColor(0.025, 0.018, 0.04, 0.88)
    content:SetBackdropBorderColor(0.32, 0.24, 0.46, 0.85)

    self.contentArea = content

    local contentBg = content:CreateTexture(nil, "BACKGROUND")
    contentBg:SetPoint("TOPLEFT", content, "TOPLEFT", 3, -3)
    contentBg:SetPoint("BOTTOMRIGHT", content, "BOTTOMRIGHT", -3, 3)
    contentBg:SetColorTexture(unpack(Color("CONTENT_BG", { 0.02, 0.017, 0.03, 0.75 })))

    local contentAccent = content:CreateTexture(nil, "ARTWORK")
    contentAccent:SetPoint("TOPLEFT", content, "TOPLEFT", 8, -6)
    contentAccent:SetPoint("TOPRIGHT", content, "TOPRIGHT", -8, -6)
    contentAccent:SetHeight(1)
    contentAccent:SetColorTexture(0.55, 0.28, 0.95, 0.45)
end

local homeHint = frame:CreateFontString(nil, "OVERLAY")
homeHint:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
homeHint:SetPoint("BOTTOM", frame, "BOTTOM", 0, 14)
homeHint:SetWidth(760)
homeHint:SetJustifyH("CENTER")
homeHint:SetText("|cffffd100Tip:|r Click |cffffd100Home|r to return to the section menu.")
homeHint:Hide()

frame.homeHint = homeHint

-------------------------------------------------
-- Build Shell
-------------------------------------------------
DVD:BuildMainFrameHeader()
DVD:BuildMainFrameSidebar()
DVD:CreateContentArea()

if DVD.CreateMainHomePanel then
    DVD:CreateMainHomePanel(frame)
end