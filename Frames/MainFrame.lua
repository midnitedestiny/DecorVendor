-- [[
-- ============================================================
-- Decor Vendor Addon - Main Frame
-- © 2026 MidniteDestiny. All Rights Reserved.
-- ============================================================
-- ]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
if not C then
    print("|cffff4040Decor Vendor MainFrame:|r constants are missing.")
    return
end

local COLORS = C.COLORS or {}
local Sizing = C.MainFrameSizing
local BottomSizing = C.BottomTabsSizing
local PreviewSizing = C.PreviewPanelSizing
local CORE_TABS = C.MAIN_SECTIONS or {}

if not Sizing or not BottomSizing or not PreviewSizing then
    print("|cffff4040Decor Vendor MainFrame:|r Sizing constants are missing.")
    return
end

local function Color(name, fallback)
    return COLORS[name] or fallback
end

local function ApplyColor(texture, color)
    texture:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
end

--------------------------------------------------------------------------------
-- SECTION 1: BACKDROPS & STYLING CONSTANTS
--------------------------------------------------------------------------------
local TAB_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

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

--------------------------------------------------------------------------------
-- SECTION 2: MAIN FRAME SHELL CREATION
--------------------------------------------------------------------------------
local frame = CreateFrame("Frame", "DV_MainFrame", UIParent, "BackdropTemplate")
DVD.frame = frame

frame:SetSize(Sizing.Width, Sizing.Height)
frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 100, -100)
frame:SetFrameStrata("HIGH")
frame:SetFrameLevel(100)
frame:SetBackdrop(MAIN_BACKDROP)
frame:SetBackdropColor(0.015, 0.025, 0.05, 0.96)        -- Deep midnight blue background
frame:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.95)   -- Vibrant steel/ice blue border
frame:SetMovable(true)
frame:SetResizable(false)
frame:EnableMouse(true)
frame:Hide()

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

--------------------------------------------------------------------------------
-- SECTION 3: HEADER & NAVIGATION CONTROLS
--------------------------------------------------------------------------------
local function CreateHeaderIconButton(parent, texturePath, tooltipTitle, tooltipText, onClick)
    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(Sizing.InfoButtonWidth, Sizing.InfoButtonHeight)
    btn:SetBackdrop(BUTTON_BACKDROP)
    btn:SetBackdropColor(0.08, 0.055, 0.13, 0.85)

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

function DVD:BuildMainFrameHeader()
    local titleBar = CreateFrame("Frame", "DV_TitleBar", frame, "BackdropTemplate")
    frame.titleBar = titleBar

    titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -8)
    titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)
    titleBar:SetHeight(Sizing.HeaderHeight)
    titleBar:SetBackdrop(PANEL_BACKDROP)
	titleBar:SetBackdropColor(0.015, 0.025, 0.05, 0.96)        -- Deep midnight blue background
	titleBar:SetBackdropBorderColor(0, 0, 0, 0)   -- Vibrant steel/ice blue border

    local titleBg = titleBar:CreateTexture("DV_TitleBG", "BACKGROUND")
    titleBg:SetAllPoints(titleBar)
    ApplyColor(titleBg, {0.075, 0.04, 0.12, 0.9})
    frame.titleBg = titleBg

    local infoIcon = CreateHeaderIconButton(
        titleBar,
        "Interface\\BUTTONS\\UI-GuildButton-OfficerNote-Up",
        "Decor Vendor Notice",
        format(C.VERSION_TEXT or "Current Version: %s", C.VERSION or "Unknown"),
        nil
    )
    infoIcon:SetPoint("LEFT", titleBar, "LEFT", 12, 0)

    local settingsBtn = CreateFrame("Button", nil, titleBar, "UIPanelButtonTemplate")
    settingsBtn:SetSize(Sizing.SettingsButtonWidth, Sizing.SettingsButtonHeight)
    settingsBtn:SetPoint("LEFT", infoIcon, "RIGHT", 8, 0)
    settingsBtn:SetText("Settings")
    settingsBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("Open Settings", 1, 0.82, 0)
        GameTooltip:Show()
    end)
    settingsBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    settingsBtn:SetScript("OnClick", function()
        if Settings and DVD.optionsCategory then
            Settings.OpenToCategory(DVD.optionsCategory:GetID())
        end
    end)
    
    local homeBtn = CreateFrame("Button", nil, titleBar, "UIPanelButtonTemplate")
    homeBtn:SetSize(Sizing.HomeButtonWidth, Sizing.HomeButtonHeight)
    homeBtn:SetPoint("LEFT", settingsBtn, "RIGHT", 8, 0)
    homeBtn:SetText("Home")
    homeBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("Open Home", 1, 0.82, 0)
        GameTooltip:AddLine("Return to the Decor Vendor section menu.", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)
    homeBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    homeBtn:SetScript("OnClick", function()
        if DVD.ShowMainHomePanel then DVD.ShowMainHomePanel() end
    end)

    local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("CENTER", titleBar, "CENTER", -20, 5)
    title:SetWidth(420)
    title:SetJustifyH("CENTER")
    title:SetText("The Original Decor Vendors")
    title:SetTextColor(unpack(Color("TITLE", {0.88, 0.68, 1, 1})))

    local closeBtn = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
    closeBtn:SetPoint("RIGHT", titleBar, "RIGHT", -4, 0)
    closeBtn:SetScript("OnClick", function() frame:Hide() end)

    local resetBtn = CreateFrame("Button", "DV_ResetProgressBtn", titleBar, "UIPanelButtonTemplate")
    resetBtn:SetSize(Sizing.ResetButtonWidth, Sizing.ResetButtonHeight)
    resetBtn:SetPoint("RIGHT", closeBtn, "LEFT", -6, 0)
    resetBtn:SetText("Reset Vendors")
    resetBtn:SetScript("OnClick", function()
        StaticPopupDialogs["DV_RESET_VENDORS"] = {
            text = "Reset all vendor progress?\nThis cannot be undone.",
            button1 = "Reset",
            button2 = "Cancel",
            OnAccept = function()
                if ResetAllVendors then ResetAllVendors() end
                if BuildVendorUI then BuildVendorUI()
                elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3
        }
        StaticPopup_Show("DV_RESET_VENDORS")
    end)

local searchBox = CreateFrame("EditBox", "DV_SearchBox", titleBar, "SearchBoxTemplate")
    searchBox:SetSize(Sizing.SearchBoxWidth, Sizing.SearchBoxHeight)
    searchBox:SetPoint("RIGHT", resetBtn, "LEFT", -10, 0)
    searchBox:SetScale(1)
    searchBox:SetAutoFocus(false)

    -- Style typed text
    searchBox:SetFontObject("GameFontHighlightSmall")
    searchBox:SetTextColor(1, 1, 1, 1)

    -- Style placeholder text
    if searchBox.Instructions then
        searchBox.Instructions:SetText("Search vendors or decor...")
        searchBox.Instructions:SetTextColor(0.5, 0.6, 0.75, 0.8)
    end

    -- Hide Blizzard's default textures
    if searchBox.Left then searchBox.Left:Hide() end
    if searchBox.Middle then searchBox.Middle:Hide() end
    if searchBox.Right then searchBox.Right:Hide() end

    -- Custom background
    local customBg = searchBox:CreateTexture(nil, "BACKGROUND")
    customBg:SetAllPoints(searchBox)
    customBg:SetColorTexture(0.01, 0.018, 0.035, 0.9)

    -- Custom border
    local customBorder = CreateFrame("Frame", nil, searchBox, "BackdropTemplate")
    customBorder:SetAllPoints(searchBox)
    customBorder:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = 1,
    })
    customBorder:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.8)

    -- FIX: Push the typing area slightly to the right so it doesn't overlap the magnifying glass icon
    searchBox:SetTextInsets(22, 18, 0, 0)

    -- FIX: Shift the search icon slightly to the right so it isn't glued to the absolute left edge border
    if searchBox.searchIcon then
        searchBox.searchIcon:ClearAllPoints()
        searchBox.searchIcon:SetPoint("LEFT", searchBox, "LEFT", 6, 0)
    end

    searchBox:SetScript("OnTextChanged", function(self)
        SearchBoxTemplate_OnTextChanged(self)
        local text = self:GetText()
        DVD.searchQuery = text ~= "" and string.lower(text) or nil
        if BuildVendorUI then BuildVendorUI()
        elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
    end)
end

--------------------------------------------------------------------------------
-- SECTION 4: SIDEBAR & CONTENT AREA
--------------------------------------------------------------------------------
function DVD:BuildMainFrameSidebar()
    local sidebarWidth = Sizing.SidebarWidth
    local bottomBarHeight = Sizing.BottomBarHeight

    local sidebar = CreateFrame("Frame", "DV_Sidebar", frame, "BackdropTemplate")
    frame.sidebar = sidebar
    DVD.sidebar = sidebar
    frame.sidebarFilters = sidebar
    DVD.sidebarFilters = sidebar
    sidebar.filtersContainer = sidebar

    sidebar:SetWidth(sidebarWidth)
    sidebar:SetPoint("TOPLEFT", frame.titleBar, "BOTTOMLEFT", 0, -1)
    sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 8, bottomBarHeight + 16)
    sidebar:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
    sidebar:SetBackdropColor(0.015, 0.025, 0.05, 0.96) -- Deep midnight blue background

    if sidebar.SetClipsChildren then
        sidebar:SetClipsChildren(true)
    end
end

function DVD:CreateContentArea()
    local content = CreateFrame("Frame", "DV_content", frame, "BackdropTemplate")
    content:SetPoint("TOPLEFT", frame.sidebar, "TOPRIGHT", 8, 0)
    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, Sizing.BottomBarHeight + 16)
    content:SetFrameLevel(frame:GetFrameLevel())
    content:SetBackdrop(PANEL_BACKDROP)
    content:SetBackdropColor(0.015, 0.025, 0.05, 0.96) -- Deep midnight blue background
    
    -- Hide the default outer border box completely by setting alpha to 0
    content:SetBackdropBorderColor(0, 0, 0, 0)

    self.contentArea = content

    local contentBg = content:CreateTexture(nil, "BACKGROUND")
    contentBg:SetPoint("TOPLEFT", content, "TOPLEFT", 3, -3)
    contentBg:SetPoint("BOTTOMRIGHT", content, "BOTTOMRIGHT", -3, 3)
    contentBg:SetColorTexture(unpack(Color("CONTENT_BG", { 0.02, 0.017, 0.03, 0.75 })))

    -- Create a custom standalone border line only on the LEFT side
    local leftBorder = content:CreateTexture(nil, "ARTWORK")
    leftBorder:SetWidth(2) -- 1 pixel thin line (or change to 2 if you want it thicker)
    leftBorder:SetPoint("TOPLEFT", content, "TOPLEFT", 0, 0)
    leftBorder:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", 0, 0)
    leftBorder:SetColorTexture(0.25, 0.52, 0.88, 0.95) -- Same steel/ice blue color
    content.leftBorder = leftBorder
	
end

--------------------------------------------------------------------------------
-- SECTION 5: FOOTER, BOTTOM TABS & PREVIEW SIZING
--------------------------------------------------------------------------------
function DVD.UpdatePreviewSize()
    if not DVD.modelContainer then
        return
    end

    local previewHeight = BottomSizing.PreviewHeights[DVD.currentTab] or BottomSizing.DefaultPreviewHeight
    DVD.modelContainer:SetHeight(previewHeight)

    if DVD.modelDivider then
        DVD.modelDivider:ClearAllPoints()
        DVD.modelDivider:SetPoint("TOPLEFT", DVD.modelContainer, "BOTTOMLEFT", PreviewSizing.DividerHorizontalInset, -PreviewSizing.DividerTopGap)
        DVD.modelDivider:SetPoint("TOPRIGHT", DVD.modelContainer, "BOTTOMRIGHT", -PreviewSizing.DividerHorizontalInset, -PreviewSizing.DividerTopGap)
    end

    if DVD.itemContainer and DVD.modelDivider and DVD.previewPanel then
        DVD.itemContainer:ClearAllPoints()
        DVD.itemContainer:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", -PreviewSizing.ItemContainerDividerOverlap, -PreviewSizing.ItemContainerTopGap)
        DVD.itemContainer:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", PreviewSizing.ItemContainerDividerOverlap, -PreviewSizing.ItemContainerTopGap)
        DVD.itemContainer:SetPoint("BOTTOMRIGHT", DVD.previewPanel, "BOTTOMRIGHT", -PreviewSizing.ItemContainerOuterInset, PreviewSizing.ItemContainerOuterInset)
    end
end

function DVD:BuildFooter()
    local bottomTabs = {}
    DVD.bottomTabs = bottomTabs
    DVD.tabButtons = DVD.tabButtons or {}

    local tabBar = CreateFrame("Frame", "DV_BottomTabBar", frame, "BackdropTemplate")
    DVD.tabBar = tabBar
    frame.footer = tabBar

    tabBar:SetHeight(Sizing.BottomBarHeight)
    tabBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", BottomSizing.BarInset, BottomSizing.BarInset)
    tabBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -BottomSizing.BarInset, BottomSizing.BarInset)

    tabBar:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 8,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    tabBar:SetBackdropColor(0.025, 0.018, 0.045, 0.90)
    tabBar:SetBackdropBorderColor(0, 0, 0, 0)

    local function SetTabVisual(tab, active)
        if active then
            tab:SetBackdropColor(0.11, 0.075, 0.18, 0.98)
            tab:SetBackdropBorderColor(0, 0, 0, 0)
            tab.bg:SetColorTexture(0.12, 0.07, 0.20, 0.95)
            tab.accent:SetColorTexture(0.25, 0.52, 0.88, 0.95)
            tab.text:SetTextColor(1, 0.86, 0.34, 1)
            tab.icon:SetVertexColor(1, 0.86, 0.34, 1)
        else
            tab:SetBackdropColor(0.045, 0.032, 0.075, 0.90)
            tab:SetBackdropBorderColor(0, 0, 0, 0)
            tab.bg:SetColorTexture(0.035, 0.025, 0.060, 0.88)
            tab.accent:SetColorTexture(0.25, 0.52, 0.88, 0.95)
            tab.text:SetTextColor(0.88, 0.84, 0.95, 1)
            tab.icon:SetVertexColor(0.78, 0.68, 0.95, 1)
        end
    end

    local function RefreshTabVisuals()
        for _, tab in ipairs(bottomTabs) do
            SetTabVisual(tab, tab.id == DVD.currentTab)
        end
    end
    DVD.RefreshTabVisuals = RefreshTabVisuals

    local startX = BottomSizing.StartX

    for i, tabData in ipairs(CORE_TABS) do
        local tab = CreateFrame("Button", "DV_MainTab" .. i, tabBar, "BackdropTemplate")
        tab:SetSize(tabData.width or BottomSizing.DefaultTabWidth, BottomSizing.TabHeight)
        tab:SetBackdrop(TAB_BACKDROP)

        if i == 1 then
            tab:SetPoint("LEFT", tabBar, "LEFT", startX, 0)
        else
            tab:SetPoint("LEFT", bottomTabs[i - 1], "RIGHT", BottomSizing.TabGap, 0)
        end

        tab.id = tabData.id

        local bg = tab:CreateTexture(nil, "BACKGROUND")
        bg:SetPoint("TOPLEFT", tab, "TOPLEFT", BottomSizing.TabBackgroundInset, -BottomSizing.TabBackgroundInset)
        bg:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", -BottomSizing.TabBackgroundInset, BottomSizing.TabBackgroundInset)
        bg:SetTexture("Interface\\Buttons\\WHITE8x8")
        tab.bg = bg

        local accent = tab:CreateTexture(nil, "ARTWORK")
        accent:SetPoint("TOPLEFT", tab, "TOPLEFT", BottomSizing.TabAccentHorizontalInset, -BottomSizing.TabAccentTopInset)
        accent:SetPoint("TOPRIGHT", tab, "TOPRIGHT", -BottomSizing.TabAccentHorizontalInset, -BottomSizing.TabAccentTopInset)
        accent:SetHeight(BottomSizing.TabAccentHeight)
        tab.accent = accent

        local icon = tab:CreateTexture(nil, "ARTWORK")
        icon:SetSize(BottomSizing.IconSize, BottomSizing.IconSize)
        icon:SetPoint("LEFT", tab, "LEFT", BottomSizing.IconLeftInset, 0)
        icon:SetTexture(tabData.icon)
        tab.icon = icon

        local text = tab:CreateFontString(nil, "OVERLAY")
        text:SetFont(STANDARD_TEXT_FONT, BottomSizing.TextFontSize, "OUTLINE")
        text:SetPoint("LEFT", icon, "RIGHT", BottomSizing.TextGap, 0)
        text:SetPoint("RIGHT", tab, "RIGHT", -BottomSizing.TextRightInset, 0)
        text:SetJustifyH("CENTER")
        text:SetText(tabData.text)
        tab.text = text

        local hover = tab:CreateTexture(nil, "HIGHLIGHT")
        hover:SetAllPoints(tab)
        hover:SetTexture("Interface\\Buttons\\WHITE8x8")
        hover:SetColorTexture(1, 0.82, 0.2, 0.16)

        tab:SetScript("OnEnter", function(self)
            if self.id ~= DVD.currentTab then
                self:SetBackdropBorderColor(0.75, 0.55, 1, 0.95)
                self.text:SetTextColor(1, 1, 1, 1)
            end
        end)

        tab:SetScript("OnLeave", function()
            RefreshTabVisuals()
        end)

        tab:SetScript("OnClick", function()
            if DVD.currentTab == tabData.id then
                return
            end

            if DVD.OpenMainSection then
                DVD.OpenMainSection(tabData.id, false)
            end

            PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
        end)

        bottomTabs[i] = tab
        DVD.tabButtons[tabData.id] = tab
    end

    RefreshTabVisuals()
    tabBar:Hide()
end
--------------------------------------------------------------------------------
-- SECTION 6: INITIALIZATION & STATE/ROUTING HELPERS
--------------------------------------------------------------------------------
DVD:BuildMainFrameHeader()
DVD:BuildMainFrameSidebar()
DVD:CreateContentArea()
DVD:BuildFooter()

if DVD.CreateMainHomePanel then
    DVD:CreateMainHomePanel(frame)
end

function DVD.UpdatePreviewSize()
    if not DVD.modelContainer then return end

    local previewHeight = BottomSizing.PreviewHeights[DVD.currentTab] or BottomSizing.DefaultPreviewHeight
    DVD.modelContainer:SetHeight(previewHeight)

    if DVD.modelDivider then
        DVD.modelDivider:ClearAllPoints()
        DVD.modelDivider:SetPoint("TOPLEFT", DVD.modelContainer, "BOTTOMLEFT", PreviewSizing.DividerHorizontalInset, -PreviewSizing.DividerTopGap)
        DVD.modelDivider:SetPoint("TOPRIGHT", DVD.modelContainer, "BOTTOMRIGHT", -PreviewSizing.DividerHorizontalInset, -PreviewSizing.DividerTopGap)
    end

    if DVD.itemContainer and DVD.modelDivider and DVD.previewPanel then
        DVD.itemContainer:ClearAllPoints()
        DVD.itemContainer:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", -PreviewSizing.ItemContainerDividerOverlap, -PreviewSizing.ItemContainerTopGap)
        DVD.itemContainer:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", PreviewSizing.ItemContainerDividerOverlap, -PreviewSizing.ItemContainerTopGap)
        DVD.itemContainer:SetPoint("BOTTOMRIGHT", DVD.previewPanel, "BOTTOMRIGHT", -PreviewSizing.ItemContainerOuterInset, PreviewSizing.ItemContainerOuterInset)
    end
end

function UpdateSidebarForTab()
    if DVD.reagentsPopup then DVD.reagentsPopup:Hide() end
    if DVD.vendorPopup then DVD.vendorPopup:Hide() end
    if DVD.achievementWowheadWrapper then DVD.achievementWowheadWrapper:Hide() end
    if DVD.questWowheadWrapper then DVD.questWowheadWrapper:Hide() end
    if DVD.questNotes then DVD.questNotes:Hide() end
    if DVD.bossNotes then DVD.bossNotes:Hide() end
    if DVD.profNotes then DVD.profNotes:Hide() end
    if DVD.vendorNotes then DVD.vendorNotes:Hide() end    
    if DVD.achievementPanel then DVD.achievementPanel:Hide() end
    if DVD.vendorWaypointBtn then DVD.vendorWaypointBtn:Hide() end
    if DVD.vendorPrevBtn then DVD.vendorPrevBtn:Hide() end
    if DVD.vendorNextBtn then DVD.vendorNextBtn:Hide() end
    if DVD.vendorPageText then DVD.vendorPageText:Hide() end
    if DVD.pagingFrame then DVD.pagingFrame:Hide() end
    if DVD.achievementOpenButton then DVD.achievementOpenButton:Hide() end
    
    if DVD.itemContainer and not DVD.itemContainer.questHooked then
        DVD.itemContainer:HookScript("OnHide", function()
            if DVD.questInfoPanel then DVD.questInfoPanel:Hide() end
            if DVD.questNotes then DVD.questNotes:Hide() end
            if DVD.questWowheadWrapper then DVD.questWowheadWrapper:Hide() end
        end)
        DVD.itemContainer.questHooked = true
    end
 
    if DVD.modelScene then
        DVD.modelScene:Hide()
        local actor = DVD.previewActor
        if actor and actor.ClearModel then actor:ClearModel() end
        if DVD.modelScene.sceneID then
            DVD.modelScene:TransitionToModelSceneID(
                DVD.modelScene.sceneID,
                Enum.ModelSceneCameraTransitionType.Immediate,
                Enum.ModelSceneCameraModificationType.Discard,
                true
            )
        end
    end

    if DVD.texture then
        DVD.texture:SetTexture(nil)
        DVD.texture:Hide()
    end

    if DVD.ShowPreviewEmptyState then
        DVD.ShowPreviewEmptyState(true)
    else
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        if DVD.modelScene then DVD.modelScene:Show() end
    end

    if DVD.modelTitle and DVD.itemContainer then
        DVD.modelTitle:ClearAllPoints()
        DVD.modelTitle:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", PreviewSizing.TitleHorizontalInset, -BottomSizing.ResetTitleTopOffset)
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -PreviewSizing.TitleHorizontalInset, -BottomSizing.ResetTitleTopOffset)
        DVD.modelTitle:SetText("Select an item")
        DVD.modelTitle:SetTextColor(1, 0.82, 0.2)
        DVD.modelTitle:Show()
    end
    
    if DVD.modelDivider then DVD.modelDivider:Show() end

    if DVD.sidebar then DVD.sidebar:Show() end    
    if DVD.ResetSidebarFilters then DVD.ResetSidebarFilters() end

    if DVD.sidebarFilters then
        DVD.sidebarFilters:Hide()
        DVD.sidebarFilters:Show()
    end

    if DVD.currentTab == "vendors" and DVD.BuildVendorFilters then
        DVD.BuildVendorFilters()
    elseif DVD.currentTab == "quests" and DVD.BuildQuestFilters then
        DVD.BuildQuestFilters()
    elseif DVD.currentTab == "achievements" and DVD.BuildAchievementFilters then
        DVD.BuildAchievementFilters()
    elseif DVD.currentTab == "professions" and DVD.BuildProfessionFilters then
        DVD.BuildProfessionFilters()
    elseif DVD.currentTab == "bossdrops" and DVD.BuildBossDropFilters then
        DVD.BuildBossDropFilters()
    elseif DVD.currentTab == "shop" and DVD.BuildShopFilters then
        DVD.BuildShopFilters()
    end
    
    if cardPool then
        for _, card in ipairs(cardPool) do
            if card and card.Hide then card:Hide() end
        end
    end    
end

function DVD.OpenMainSection(tabID, force)
    if not tabID then return false end
    
    if DVD.standaloneHomePanel then DVD.standaloneHomePanel:Hide() end
    if DVD.frame then DVD.frame:Show() end
    
    if DVD.frame and DVD.frame.homePanel then
        DVD.frame.homePanel:Hide()
    end

    if tabID == "gallery" or tabID == "browser" then
        if DVD.OpenGalleryAddon then
            DVD.OpenGalleryAddon()
        else
            print("|cffff5555Decor Vendor:|r Gallery loader (DVD.OpenGalleryAddon) is missing.")
        end
        DVD.currentTab = tabID
        if DVD.RefreshTabVisuals then DVD.RefreshTabVisuals() end
        return true
    end    

    if DVD.sidebar then DVD.sidebar:Show() end
    if DVD.contentArea then DVD.contentArea:Show() end
    if DVD.tabBar then DVD.tabBar:Show() end
    if DVD.frame and DVD.frame.footer then DVD.frame.footer:Show() end

    if _G.DV_SearchBox then _G.DV_SearchBox:Show() end
    if _G.DV_ResetProgressBtn then _G.DV_ResetProgressBtn:Show() end

    if not force and DVD.currentTab == tabID then return true end

    DVD.currentTab = tabID

    if DVD.RefreshTabVisuals then DVD.RefreshTabVisuals() end
    if DVD.UpdatePreviewSize then DVD.UpdatePreviewSize() end    
    if UpdateSidebarForTab then UpdateSidebarForTab() end

    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end

    return true
end

--------------------------------------------------------------------------------
-- SECTION 7: STARTUP, EVENT HANDLERS & MINIMAP REGISTRATION
--------------------------------------------------------------------------------
local LibDBIcon = LibStub("LibDBIcon-1.0", true)

DVD.vendorSessionCache = DVD.vendorSessionCache or {}
local vendorSessionCache = DVD.vendorSessionCache

if not frame then
    print("|cffff4040DecorVendor Startup:|r DVD.frame is missing. Make sure MainFrame loads first.")
    return
end

-- Vendor Discovery Tracking
local vendorTrackingFrame = CreateFrame("Frame")
vendorTrackingFrame:RegisterEvent("MERCHANT_SHOW")
vendorTrackingFrame:SetScript("OnEvent", function()
    if not DVD.npcs then return end

    local guid = UnitGUID("target")
    if not guid or issecretvalue(guid) then return end

    local npcID = select(6, strsplit("-", guid))
    npcID = tonumber(npcID)
    if not npcID then return end

    local vendor = DVD.npcs[npcID]
    if type(vendor) ~= "table" then return end

    vendor.id = vendor.id or npcID
    vendorSettings.visited = vendorSettings.visited or {}

    if not vendorSettings.visited[npcID] then
        vendorSettings.visited[npcID] = true

        if vendorSettings.hideCompletedThings or vendorSettings.markFoundVendors then
            if BuildVendorUI then
                BuildVendorUI()
            elseif DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            end
        end
    end
end)

-- Open Main UI
function DVD.OpenMainUI()
    if C_HousingCatalog and C_HousingCatalog.RequestHousingMarketInfoRefresh then
        DVD.waitingForMarketData = true
        C_HousingCatalog.RequestHousingMarketInfoRefresh()
    end

    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end

    local mainFrame = DVD.frame or frame
    if mainFrame then
        mainFrame:Show()
    end

    if DVD.ShowMainHomePanel then
        DVD.ShowMainHomePanel()
    end
end

-- Defaults Initialization
local function InitDefaults()
    vendorSettings = vendorSettings or {}

    vendorSettings.completedDrop = vendorSettings.completedDrop or {}
    vendorSettings.completedDropNoXP = vendorSettings.completedDropNoXP or {}
    vendorSettings.visited = vendorSettings.visited or {}
    vendorSettings.completedAchievs = vendorSettings.completedAchievs or {}

    if vendorSettings.showWaypointButton == nil then vendorSettings.showWaypointButton = false end
    if vendorSettings.showMinimapButton == nil then vendorSettings.showMinimapButton = true end
    if vendorSettings.closeOnEsc == nil then vendorSettings.closeOnEsc = true end
    if vendorSettings.scale == nil then vendorSettings.scale = .90 end
    if vendorSettings.hideCompletedThings == nil then vendorSettings.hideCompletedThings = false end
    if vendorSettings.markCompletedThings == nil then vendorSettings.markCompletedThings = false end
    if vendorSettings.showMerchantCheckmarks == nil then vendorSettings.showMerchantCheckmarks = true end
    if vendorSettings.showVendorCheckmarks == nil then vendorSettings.showVendorCheckmarks = true end
    if vendorSettings.hideCollectedBossDrops == nil then vendorSettings.hideCollectedBossDrops = false end

    vendorSettings.openAchievementFrame = vendorSettings.openAchievementFrame ~= false
    if vendorSettings.useCustomFont == nil then vendorSettings.useCustomFont = true end

    dbDV = dbDV or {}
    dbDV.minimap = dbDV.minimap or {}
    dbDV.minimap.hide = not vendorSettings.showMinimapButton

    DVD.currentTab = DVD.currentTab or "vendors"
end

-- Minimap / LDB
local function RegisterMinimapButton()
    if not LibDBIcon then return end

    local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
    if not ldb then return end

    local dataobj = ldb:NewDataObject("DecorVendor", {
        type = "launcher",
        icon = "Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga",
        label = "DecorVendor",
        text = "DecorVendor",
        name = "DecorVendor",
        OnClick = function(_, button)
            if button == "LeftButton" then
                local homeShown = DVD.standaloneHomePanel and DVD.standaloneHomePanel:IsShown()
                local frameShown = frame and frame:IsShown()

                if homeShown then
                    DVD.standaloneHomePanel:Hide()
                elseif frameShown then
                    frame:Hide()
                else
                    if DVD.OpenMainUI then
                        DVD.OpenMainUI()
                    else
                        if BuildVendorUI then BuildVendorUI()
                        elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
                        if frame then frame:Show() end
                    end
                end
            elseif button == "RightButton" then
                if DVD.standaloneHomePanel and DVD.standaloneHomePanel:IsShown() then
                    DVD.standaloneHomePanel:Hide()
                end
                if frame and frame:IsShown() then
                    frame:Hide()
                end
                if Settings and DVD.optionsCategory then
                    Settings.OpenToCategory(DVD.optionsCategory:GetID())
                end
            end
        end
    })

    function dataobj:OnTooltipShow()
        self:AddLine("|cffffffffDecor Vendor|r")
        self:AddLine("|cff00ff00<Left Click>|r Toggle window")
        self:AddLine("|cff00ff00<Right Click>|r Settings")
    end

    LibDBIcon:Register("DecorVendor", dataobj, dbDV.minimap)

    if vendorSettings.showMinimapButton then
        LibDBIcon:Show("DecorVendor")
    else
        LibDBIcon:Hide("DecorVendor")
    end
end

-- Delayed Collection / Stats Refresh
function DVD.RefreshCollectionStatsAfterDelay(reason)
    wipe(vendorSessionCache)

    DVD.collectionCache = {}
    DVD.vendorStatusCache = {}
    DVD.vendorMissingCache = {}
    DVD.statsCache = {}
    DVD.galleryStatsCache = {}
    DVD.decorIdToItemId = {}

    for itemID, data in pairs(DVD.ActiveItems or {}) do
        if data.decorID then
            DVD.decorIdToItemId[data.decorID] = itemID
        end
    end

    if BuildVendorUI then BuildVendorUI()
    elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end

    if DVD.RefreshStatsPanel then DVD.RefreshStatsPanel() end
    if DVD.UpdateStatsPanel then DVD.UpdateStatsPanel() end

    if DVD.Gallery then
        if DVD.Gallery.ClearCatalogInfoCache then DVD.Gallery.ClearCatalogInfoCache() end
        if DVD.Gallery.RefreshStats then DVD.Gallery.RefreshStats() end
        if DVD.Gallery.RefreshGrid then DVD.Gallery.RefreshGrid() end
    end
end

function DVD.ScheduleDelayedCollectionRefreshes(reason)
    if DVD.collectionRefreshTimersScheduled then return end
    DVD.collectionRefreshTimersScheduled = true

    local delays = { 2, 10, 30, 120, 300, 600 }
    for _, delay in ipairs(delays) do
        C_Timer.After(delay, function()
            if DVD.RefreshCollectionStatsAfterDelay then
                DVD.RefreshCollectionStatsAfterDelay((reason or "login") .. " +" .. tostring(delay) .. "s")
            end
        end)
    end
end

local function SafeRegisterEvent(frame, eventName)
    if frame and eventName then
        pcall(frame.RegisterEvent, frame, eventName)
    end
end

-- Main Event Dispatcher
local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_ENTERING_WORLD")
init:RegisterEvent("MERCHANT_SHOW")
init:RegisterEvent("HOUSING_MARKET_AVAILABILITY_UPDATED")
init:RegisterEvent("ACHIEVEMENT_EARNED")
init:RegisterEvent("QUEST_TURNED_IN")
init:RegisterEvent("HOUSE_DECOR_ADDED_TO_CHEST")

SafeRegisterEvent(init, "HOUSING_STORAGE_UPDATED")
SafeRegisterEvent(init, "HOUSING_STORAGE_ENTRY_UPDATED")

init:SetScript("OnEvent", function(self, event, loadedAddon, ...)
    if event == "ADDON_LOADED" and loadedAddon == addonName then
        InitDefaults()

        if UpdateEscBehavior then UpdateEscBehavior() end
        if DVD.BuildProfessionLookup then DVD.BuildProfessionLookup() end

        RegisterMinimapButton()

        vendorSettings.scale = vendorSettings.scale or .90
        frame:SetScale(vendorSettings.scale)

        if CreateOptionsPanel then CreateOptionsPanel()
        elseif DVD.CreateOptionsPanel then DVD.CreateOptionsPanel() end

        if UpdateSidebarForTab then UpdateSidebarForTab() end
        return
    end

    if event == "PLAYER_ENTERING_WORLD" then
        DVD.catalogReady = false
        DVD.collectionRefreshTimersScheduled = nil

        if DVD.ScheduleDelayedCollectionRefreshes then
            DVD.ScheduleDelayedCollectionRefreshes("PLAYER_ENTERING_WORLD")
        end

        C_Timer.After(1, function()
            DVD.catalogReady = true
            DVD.decorIdToItemId = {}

            for itemID, data in pairs(DVD.ActiveItems or {}) do
                if data.decorID then
                    DVD.decorIdToItemId[data.decorID] = itemID
                end
            end

            wipe(vendorSessionCache)
            DVD.collectionCache = {}

            if BuildVendorUI then BuildVendorUI()
            elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end

            if HookMerchantFrame then HookMerchantFrame()
            elseif DVD.HookMerchantFrame then DVD.HookMerchantFrame() end
            
            if DVD.PreloadGalleryAddon then DVD.PreloadGalleryAddon() end
        end)
        return
    end

    if event == "MERCHANT_SHOW" then
        DVD.waitingForMarketData = true
        if C_HousingCatalog and C_HousingCatalog.RequestHousingMarketInfoRefresh then
            C_HousingCatalog.RequestHousingMarketInfoRefresh()
        end
        return
    end

    if event == "HOUSING_MARKET_AVAILABILITY_UPDATED" then
        if DVD.waitingForMarketData then
            DVD.waitingForMarketData = false
            DVD.catalogReady = true
            wipe(vendorSessionCache)
            DVD.collectionCache = {}

            if BuildVendorUI then BuildVendorUI()
            elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end
        return
    end

    if event == "HOUSING_STORAGE_UPDATED" or event == "HOUSING_STORAGE_ENTRY_UPDATED" then
        C_Timer.After(1, function()
            if DVD.RefreshCollectionStatsAfterDelay then
                DVD.RefreshCollectionStatsAfterDelay(event)
            end
        end)
        return
    end

    if event == "ACHIEVEMENT_EARNED" or event == "QUEST_TURNED_IN" then
        C_Timer.After(0.5, function()
            if BuildVendorUI then BuildVendorUI()
            elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end)
        return
    end

    if event == "HOUSE_DECOR_ADDED_TO_CHEST" then
        if not DVD.catalogReady then return end

        local decorID = ...
        local itemID = DVD.decorIdToItemId and DVD.decorIdToItemId[decorID]
        if not itemID then return end

        local itemData = DVD.ActiveItems and DVD.ActiveItems[itemID]
        local noxp = itemData and itemData.noxp

        if noxp then
            vendorSettings.completedDropNoXP[itemID] = true
        else
            vendorSettings.completedDrop[itemID] = true
        end

        wipe(vendorSessionCache)

        if BuildVendorUI then BuildVendorUI()
        elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
    end
end)

--------------------------------------------------------------------------------
-- SECTION 8: RUNTIME HELPERS, CACHING & LOOKUPS
--------------------------------------------------------------------------------
DVD.decorThumbCache = DVD.decorThumbCache or {}
DVD.itemNameCache = DVD.itemNameCache or {}
DVD.vendorSessionCache = DVD.vendorSessionCache or {}
DVD.activeWidgets = DVD.activeWidgets or {}

local decorThumbCache = DVD.decorThumbCache
local itemNameCache = DVD.itemNameCache
local vendorSessionCache = DVD.vendorSessionCache
local refreshTimer = nil

-------------------------------------------------
-- Active Item Lookup Compiler
-------------------------------------------------
function DVD:BuildActiveItemLookups()
    self.vendorGoodies = {}
    self.decorToItem = {}
    self.itemToNPC = {}

    local function AddVendorItem(npcID, itemID)
        npcID = tonumber(npcID)
        if not npcID then return end

        self.vendorGoodies[npcID] = self.vendorGoodies[npcID] or { items = {} }
        table.insert(self.vendorGoodies[npcID].items, itemID)
        self.itemToNPC[itemID] = npcID
    end

    for itemID, data in pairs(self.ActiveItems or {}) do
        if type(data) == "table" then
            local isAvailable = true

            if self.IsDataAvailableForClient then
                isAvailable = self.IsDataAvailableForClient(data)
            end

            if isAvailable then
                if data.decorID then
                    self.decorToItem[data.decorID] = itemID
                end

                local soldBy = data.soldBy or data.vendorID

                if type(soldBy) == "table" then
                    for key, value in pairs(soldBy) do
                        local npcID
                        if type(value) == "number" or type(value) == "string" then
                            npcID = value
                        elseif value == true then
                            npcID = key
                        end
                        AddVendorItem(npcID, itemID)
                    end
                else
                    AddVendorItem(soldBy, itemID)
                end
            end
        end
    end
end

-------------------------------------------------
-- Refresh / Cache Helpers
-------------------------------------------------
function DVD.RequestUpdate()
    if refreshTimer then
        refreshTimer:Cancel()
    end

    refreshTimer = C_Timer.NewTimer(0.2, function()
        refreshTimer = nil
        local frame = DVD.frame or DV_MainFrame

        if frame and frame:IsShown() then
            if DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            elseif type(BuildVendorUI) == "function" then
                BuildVendorUI()
            end
        end
    end)
end

function RequestUpdate()
    return DVD.RequestUpdate()
end

-------------------------------------------------
-- Neighborhood Endeavor Refresh
-------------------------------------------------
local neighborhoodInitiativeFrame = CreateFrame("Frame")
neighborhoodInitiativeFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
neighborhoodInitiativeFrame:RegisterEvent("NEIGHBORHOOD_INITIATIVE_UPDATED")

neighborhoodInitiativeFrame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_ENTERING_WORLD" then
        if C_NeighborhoodInitiative and C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo then
            pcall(C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo)
        end

        C_Timer.After(0.75, function()
            if DVD.RequestUpdate then
                DVD.RequestUpdate()
            end
        end)
        return
    end

    if event == "NEIGHBORHOOD_INITIATIVE_UPDATED" then
        if DVD.RequestUpdate then
            DVD.RequestUpdate()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end
end)

function DVD.IsCatalogUsable()
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return false
    end
    local test = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, 1, true)
    return test ~= nil
end

function IsCatalogUsable()
    return DVD.IsCatalogUsable()
end

function DVD.GetCachedItemName(itemID)
    if not itemID then
        return "Unknown Item", false
    end

    if itemNameCache[itemID] then
        return itemNameCache[itemID], false
    end

    local item = Item:CreateFromItemID(itemID)
    if not item:IsItemEmpty() then
        item:ContinueOnItemLoad(function()
            itemNameCache[itemID] = item:GetItemName()
            DVD.RequestUpdate()
        end)
    end

    return "Loading...", true
end

function GetCachedItemName(itemID)
    return DVD.GetCachedItemName(itemID)
end

function DVD.GetDecorThumbnail(itemID)
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end
    if decorThumbCache[itemID] then
        return decorThumbCache[itemID]
    end

    local decorData = DVD.ActiveItems and DVD.ActiveItems[itemID]
    if not decorData or not decorData.decorID then
        return nil
    end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorData.decorID, true)
    if info and info.iconTexture then
        decorThumbCache[itemID] = info.iconTexture
        return info.iconTexture
    end

    return nil
end

function GetDecorThumbnail(itemID)
    return DVD.GetDecorThumbnail(itemID)
end

-------------------------------------------------
-- Decor / Ownership Helpers
-------------------------------------------------
function DVD.GetDecorIconByItemID(itemID)
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end
    local decorData = DVD.ActiveItems and DVD.ActiveItems[itemID]
    if not decorData or not decorData.decorID then
        return nil
    end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorData.decorID, true)
    return info and info.iconTexture
end

function DVD.IsDecorOwned(itemID)
    if not DVD.catalogReady or not itemID then
        return false
    end

    local data = DVD.ActiveItems and DVD.ActiveItems[itemID]
    if not data or not data.decorID then
        return false
    end

    if C_HousingCatalog and C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(
            Enum.HousingCatalogEntryType.Decor,
            data.decorID,
            true
        )

        if type(info) == "table" then
            local owned = (tonumber(info.numPlaced) or 0) +
                          (tonumber(info.numStored) or 0) +
                          (tonumber(info.ownedCount) or 0) +
                          (tonumber(info.quantity) or 0)
            return owned > 0
        end
    end

    return false
end

function DVD.GetVendorStatus(vendorID)
    if not DVD.catalogReady then
        return false, 0
    end

    if vendorSessionCache[vendorID] then
        return vendorSessionCache[vendorID].isComplete, vendorSessionCache[vendorID].missingCount
    end

    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]
    local items = vendorData and (vendorData.items or vendorData)

    if not items then
        return false, 0
    end

    local missingCount = 0
    local relevantCount = 0

    for _, itemID in ipairs(items) do
        local decor = DVD.ActiveItems and DVD.ActiveItems[itemID]
        if decor and decor.decorID then
            relevantCount = relevantCount + 1
            if not DVD.IsDecorOwned(itemID) then
                missingCount = missingCount + 1
            end
        end
    end

    local isComplete = relevantCount > 0 and missingCount == 0

    vendorSessionCache[vendorID] = {
        isComplete = isComplete,
        missingCount = missingCount,
    }

    return isComplete, missingCount
end

function GetVendorStatus(vendorID)
    return DVD.GetVendorStatus(vendorID)
end

-------------------------------------------------
-- Vendor / Faction Helpers
-------------------------------------------------
function DVD.GetVendorInfo(vendorID)
    vendorID = tonumber(vendorID)
    if not vendorID or type(DVD.npcs) ~= "table" then
        return nil
    end

    local vendor = DVD.npcs[vendorID] or DVD.npcs[tostring(vendorID)]
    if type(vendor) ~= "table" then
        return nil
    end

    vendor.id = vendor.id or vendorID
    return vendor
end

function DVD.GetFactionColor(faction)
    faction = string.lower(tostring(faction or "neutral"))
    local factionsTable = C.LabelColors and C.LabelColors.Factions or {}
    local hex = factionsTable[faction] or "B2CCEC"
    
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    
    return r, g, b, 1
end

function ResetAllVendors()
    vendorSettings.visited = {}
    print("|cff88ff88DecorVendor:|r Vendor progress reset.")
end

function DVD.ClearWidgets()
    for _, w in ipairs(DVD.activeWidgets or {}) do
        if w and w.Hide then
            w:Hide()
        end
    end
    wipe(DVD.activeWidgets)
end

function DVD.GetPlayerRenownLevel(factionID)
    local data = C_MajorFactions.GetMajorFactionData(factionID)
    if data then
        return data.renownLevel or 0
    end
    return 0
end

function DVD.GetSubfactionTier(factionID)
    local data = C_MajorFactions.GetMajorFactionData(factionID)
    if data then
        return data.renownLevel or 0
    end
    return 0
end

function DVD.GetVendorRequirementType(vendorID)
    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]
    local items = vendorData and (vendorData.items or vendorData)

    if not items then
        return "none"
    end

    local foundType = nil

    for _, itemID in ipairs(items) do
        local itemData = DVD.ActiveItems and DVD.ActiveItems[itemID]
        if itemData then
            local req = itemData.requirement or itemData.requires
            if req and req.type then
                local t = string.lower(req.type)
                if t == "subfaction" then
                    return "subfaction"
                end
                foundType = t
            end
        end
    end

    return foundType or "none"
end

-------------------------------------------------
-- Links
-------------------------------------------------
function DVD:GetWowheadLink(id, rewardType)
    if rewardType == "quest" then
        return "https://www.wowhead.com/quest=" .. tostring(id)
    elseif rewardType == "item" then
        return "https://www.wowhead.com/item=" .. tostring(id)
    else
        return "https://www.wowhead.com/achievement=" .. tostring(id)
    end
end

function DVD.ShowWowheadBox(parent, wowheadBox, id, rewardType)
    if not wowheadBox or not id then return end

    local url = DVD:GetWowheadLink(id, rewardType)
    if DVD.activeWowheadBox and DVD.activeWowheadBox ~= wowheadBox then
        DVD.activeWowheadBox:Hide()
    end

    wowheadBox:SetText(url)
    wowheadBox:Show()
    wowheadBox:SetFocus()
    wowheadBox:HighlightText()

    DVD.activeWowheadBox = wowheadBox
end

function ShowWowheadBox(parent, wowheadBox, id, rewardType)
    return DVD.ShowWowheadBox(parent, wowheadBox, id, rewardType)
end

--------------------------------------------------------------------------------
-- SECTION 9: NEIGHBORHOOD ENDEAVORS & WAYPOINT RESOLUTION
--------------------------------------------------------------------------------
DVD.NeighborhoodEndeavors = DVD.NeighborhoodEndeavors or {}
local Neighborhood = DVD.NeighborhoodEndeavors

local state = Neighborhood.state or {}
Neighborhood.state = state

state.isInNeighborhood = state.isInNeighborhood or false
state.mapByGUID = state.mapByGUID or {}

-------------------------------------------------
-- Saved Neighborhood Map Storage
-------------------------------------------------
local function GetMapByGUIDStore()
    if type(_G.DecorVendorNeighborhoodDB) ~= "table" then
        _G.DecorVendorNeighborhoodDB = {}
    end

    _G.DecorVendorNeighborhoodDB.mapByGUID =
        _G.DecorVendorNeighborhoodDB.mapByGUID or {}

    state.mapByGUID = _G.DecorVendorNeighborhoodDB.mapByGUID
    return state.mapByGUID
end

local refreshTimer

-------------------------------------------------
-- Basic Helpers
-------------------------------------------------
local function SafeCall(func, ...)
    if type(func) ~= "function" then return nil end
    local ok, result = pcall(func, ...)
    if ok then return result end
    return nil
end

local function SameGUID(a, b)
    return a ~= nil and b ~= nil and tostring(a) == tostring(b)
end

local function NormalizeText(value)
    value = string.lower(tostring(value or ""))
    value = value:gsub("’", "'")
    value = value:gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " ")
    return value
end

local function NormalizeEndeavorTitle(value)
    value = string.lower(tostring(value or ""))
    return value:gsub("[%s%p]+", "")
end

local function NormalizeFaction(value)
    if value == nil or value == "" then return nil end
    value = string.lower(tostring(value))

    if value == "alliance" then return "alliance" end
    if value == "horde" then return "horde" end
    if value == "neutral" or value == "both" or value == "any" then
        return "neutral"
    end

    return value
end

-------------------------------------------------
-- Map Helpers
-------------------------------------------------
local function GetLocationMapID(location, action)
    if type(location) ~= "table" then return nil end

    return tonumber(
        location.mapID
        or location.uiMapID
        or location.uiMapId
        or (action and action.mapID)
        or (action and action.openMapID)
    )
end

local function MapIsOrChildOf(currentMapID, targetMapID)
    currentMapID = tonumber(currentMapID)
    targetMapID = tonumber(targetMapID)

    if not currentMapID or not targetMapID
    or not C_Map or not C_Map.GetMapInfo then
        return false
    end

    local checked = {}

    for _ = 1, 20 do
        if currentMapID == targetMapID then return true end
        if not currentMapID or currentMapID == 0 or checked[currentMapID] then
            break
        end

        checked[currentMapID] = true
        local info = C_Map.GetMapInfo(currentMapID)
        currentMapID = info and tonumber(info.parentMapID) or nil
    end

    return false
end

local function PlayerIsOnMapOrChild(targetMapID)
    if not C_Map or not C_Map.GetBestMapForUnit then return false end
    return MapIsOrChildOf(C_Map.GetBestMapForUnit("player"), targetMapID)
end

local function PlayerZoneMatches(location)
    if type(location) ~= "table" then return false end

    local wanted = NormalizeText(location.zone)
    if wanted == "" then return false end

    local zone = NormalizeText(GetZoneText and GetZoneText() or "")
    local subZone = NormalizeText(GetSubZoneText and GetSubZoneText() or "")

    if wanted == zone or wanted == subZone then return true end

    if C_Map and C_Map.GetBestMapForUnit and C_Map.GetMapInfo then
        local currentMapID = C_Map.GetBestMapForUnit("player")
        local info = currentMapID and C_Map.GetMapInfo(currentMapID)
        if wanted == NormalizeText(info and info.name or "") then
            return true
        end
    end

    return false
end

local function FindPhysicalNeighborhoodMapID()
    local sourceActions = C.SOURCE_ACTIONS or C.SourceActions or {}
    local checked = {}

    for _, action in pairs(sourceActions) do
        local isEndeavor = type(action) == "table" and (
            action.availability == "endeavor"
            or action.initiativeID ~= nil
            or action.endeavorID ~= nil
        )

        if isEndeavor and type(action.locations) == "table" then
            for _, location in ipairs(action.locations) do
                local mapID = GetLocationMapID(location, action)

                if mapID and not checked[mapID] then
                    checked[mapID] = true

                    if PlayerIsOnMapOrChild(mapID) or PlayerZoneMatches(location) then
                        return mapID
                    end
                end
            end
        end
    end

    return nil
end

-------------------------------------------------
-- State Refresh
-------------------------------------------------
local function IsInNeighborhood()
    if not C_Housing then return false end
    return SafeCall(C_Housing.IsOnNeighborhoodMap) == true
        or SafeCall(C_Housing.IsInsideHouseOrPlot) == true
end

local function RefreshPhysicalState()
    local mapByGUID = GetMapByGUIDStore()

    state.isInNeighborhood = IsInNeighborhood()
    state.physicalNeighborhoodGUID = C_Housing
        and SafeCall(C_Housing.GetCurrentNeighborhoodGUID)
        or nil
    state.physicalMapID = FindPhysicalNeighborhoodMapID()

    if state.physicalNeighborhoodGUID and state.physicalMapID then
        mapByGUID[tostring(state.physicalNeighborhoodGUID)] =
            state.physicalMapID
    end
end

local function RefreshInitiativeState()
    local mapByGUID = GetMapByGUIDStore()

    local info = C_NeighborhoodInitiative
        and SafeCall(C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo)
        or nil

    if type(info) ~= "table" or info.isLoaded ~= true then
        state.initiativeInfo = nil
        state.viewedNeighborhoodGUID = nil
        state.viewedNeighborhoodMapID = nil
        return nil
    end

    state.initiativeInfo = info
    state.viewedNeighborhoodGUID = info.neighborhoodGUID
    state.viewedNeighborhoodMapID = info.neighborhoodGUID
        and tonumber(mapByGUID[tostring(info.neighborhoodGUID)])
        or nil

    if not state.viewedNeighborhoodMapID
    and SameGUID(info.neighborhoodGUID, state.physicalNeighborhoodGUID) then
        state.viewedNeighborhoodMapID = tonumber(state.physicalMapID)

        if info.neighborhoodGUID and state.viewedNeighborhoodMapID then
            mapByGUID[tostring(info.neighborhoodGUID)] =
                state.viewedNeighborhoodMapID
        end
    end

    return info
end

local function RequestInitiativeInfo()
    if C_NeighborhoodInitiative
    and C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo then
        SafeCall(C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo)
    end
end

local function RefreshVendorUI()
    if DVD.RequestUpdate then
        DVD.RequestUpdate()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end
end

function Neighborhood.Refresh(requestInfo)
    RefreshPhysicalState()
    local info = RefreshInitiativeState()

    if state.isInNeighborhood and (requestInfo or not info) then
        RequestInitiativeInfo()
    end

    RefreshVendorUI()
end

local function ScheduleRefresh(delay, requestInfo)
    if refreshTimer then refreshTimer:Cancel() end

    refreshTimer = C_Timer.NewTimer(delay or 0.20, function()
        refreshTimer = nil
        Neighborhood.Refresh(requestInfo)
    end)
end

-------------------------------------------------
-- Public Endeavor Helpers
-------------------------------------------------
function DVD.GetCurrentNeighborhoodEndeavor()
    if type(state.initiativeInfo) == "table"
    and state.initiativeInfo.isLoaded == true then
        return state.initiativeInfo
    end

    return RefreshInitiativeState()
end

function DVD.IsSourceActionActive(action)
    if type(action) ~= "table" then return nil end

    local isEndeavor = action.availability == "endeavor"
        or action.initiativeID ~= nil
        or action.endeavorID ~= nil
        or action.initiativeTitle ~= nil

    if not isEndeavor then return true end

    local info = DVD.GetCurrentNeighborhoodEndeavor()
    if not info then return nil end

    local expectedID = tonumber(action.initiativeID or action.endeavorID)

    if expectedID then
        return expectedID == tonumber(info.initiativeID), info
    end

    if action.initiativeTitle then
        return NormalizeEndeavorTitle(action.initiativeTitle)
            == NormalizeEndeavorTitle(info.title), info
    end

    return nil, info
end

function DVD.GetViewedNeighborhoodMapID()
    return tonumber(state.viewedNeighborhoodMapID)
end

function DVD.GetPhysicalNeighborhoodMapID()
    return tonumber(state.physicalMapID)
end

-------------------------------------------------
-- Shared Vendor Waypoint Resolver
-------------------------------------------------
function DVD.ResolveVendorWaypoint(vendor)
    if type(vendor) ~= "table" then return nil, "missing" end

    local fixedMapID = tonumber(vendor.mapID or vendor.uiMapID or vendor.uiMapId)
    local fixedX = tonumber(vendor.x or vendor.coordX)
    local fixedY = tonumber(vendor.y or vendor.coordY)

    if fixedMapID and fixedX and fixedY then
        return {
            mapID = fixedMapID,
            x = fixedX,
            y = fixedY,
            title = vendor.title or vendor.name or "Decor Vendor",
            zone = vendor.zone,
            sourceType = "fixed",
        }, "fixed"
    end

    local actionKey = vendor.sourceAction or vendor.mapAction or vendor.locationAction
    if not actionKey or actionKey == "" then return nil, "missing" end

    local sourceActions = C.SOURCE_ACTIONS or C.SourceActions
    local action = sourceActions and sourceActions[actionKey]

    if type(action) ~= "table"
    or type(action.locations) ~= "table"
    or #action.locations == 0 then
        return nil, "missing"
    end

    local active, initiativeInfo = DVD.IsSourceActionActive(action)
    local isEndeavor = action.availability == "endeavor"
        or action.initiativeID ~= nil
        or action.endeavorID ~= nil

    if isEndeavor then
        if active == false then return nil, "inactive" end
        if active == nil then
            RequestInitiativeInfo()
            return nil, "loading"
        end
    end

    local viewedGUID = initiativeInfo and initiativeInfo.neighborhoodGUID
        or state.viewedNeighborhoodGUID
    local viewedMapID = tonumber(state.viewedNeighborhoodMapID)

    if not viewedMapID and viewedGUID then
        local mapByGUID = GetMapByGUIDStore()
        viewedMapID = tonumber(mapByGUID[tostring(viewedGUID)])
    end

    local playerFaction = UnitFactionGroup
        and NormalizeFaction(UnitFactionGroup("player"))
        or nil

    local viewedMatch
    local physicalMatch
    local factionMatch
    local neutralMatch
    local fallbackMatch
    local validCount = 0

    for _, location in ipairs(action.locations) do
        if type(location) == "table" then
            local mapID = GetLocationMapID(location, action)
            local x = tonumber(location.x or location.coordX)
            local y = tonumber(location.y or location.coordY)

            if mapID and x and y then
                validCount = validCount + 1

                local faction = NormalizeFaction(location.faction)
                local waypoint = {
                    mapID = mapID,
                    x = x,
                    y = y,
                    title = vendor.title or vendor.name or location.title
                        or action.label or actionKey,
                    zone = location.zone or action.zone or vendor.zone,
                    faction = faction,
                    sourceType = "action",
                    sourceAction = actionKey,
                }

                if viewedMapID and mapID == viewedMapID then
                    viewedMatch = viewedMatch or waypoint
                end

                if PlayerIsOnMapOrChild(mapID) or PlayerZoneMatches(location) then
                    physicalMatch = physicalMatch or waypoint
                end

                if faction and playerFaction and faction == playerFaction then
                    factionMatch = factionMatch or waypoint
                end

                if not faction or faction == "neutral" then
                    neutralMatch = neutralMatch or waypoint
                end

                fallbackMatch = fallbackMatch or waypoint
            end
        end
    end

    local viewingDifferentNeighborhood = viewedGUID
        and state.physicalNeighborhoodGUID
        and not SameGUID(viewedGUID, state.physicalNeighborhoodGUID)

    if viewingDifferentNeighborhood and not viewedMapID and validCount > 1 then
        return nil, "unknownNeighborhood"
    end

    local resolved = viewedMatch
        or physicalMatch
        or factionMatch
        or neutralMatch
        or fallbackMatch

    if not resolved then return nil, "missing" end
    return resolved, "action"
end

-------------------------------------------------
-- WoW Events Integration
-------------------------------------------------
local eventFrame = CreateFrame("Frame")

for _, eventName in ipairs({
    "ADDON_LOADED",
    "PLAYER_ENTERING_WORLD",
    "ZONE_CHANGED_NEW_AREA",
    "ZONE_CHANGED",
    "ZONE_CHANGED_INDOORS",
    "PLAYER_MAP_CHANGED",
    "HOUSE_PLOT_ENTERED",
    "HOUSE_PLOT_EXITED",
    "NEIGHBORHOOD_INITIATIVE_UPDATED",
}) do
    eventFrame:RegisterEvent(eventName)
end

eventFrame:SetScript("OnEvent", function(_, eventName, loadedAddonName)
    if eventName == "ADDON_LOADED" then
        if loadedAddonName ~= addonName then
            return
        end
        GetMapByGUIDStore()
        ScheduleRefresh(0.10, true)
    elseif eventName == "PLAYER_ENTERING_WORLD" then
        ScheduleRefresh(1.00, true)
    elseif eventName == "NEIGHBORHOOD_INITIATIVE_UPDATED" then
        ScheduleRefresh(0.10, false)
    else
        ScheduleRefresh(0.25, true)
    end
end)

--------------------------------------------------------------------------------
-- SECTION 10: DEFAULT MERCHANT FRAME OVERLAYS & CHECKMARKS
--------------------------------------------------------------------------------
local COLLECTED_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\collected"
local merchantHooked = false

function DVD.HideMerchantCheckmarks()
    for i = 1, MERCHANT_ITEMS_PER_PAGE do
        local button = _G["MerchantItem" .. i .. "ItemButton"]
        if button and button.dvCheckmark then
            button.dvCheckmark:Hide()
        end
    end
end

function HideMerchantCheckmarks()
    return DVD.HideMerchantCheckmarks()
end

function DVD.HookMerchantFrame()
    if merchantHooked then return end
    merchantHooked = true

    hooksecurefunc("MerchantFrame_Update", function()
        if not MerchantFrame or not MerchantFrame:IsShown() then
            DVD.HideMerchantCheckmarks()
            return
        end

        if not vendorSettings or not vendorSettings.showMerchantCheckmarks then
            DVD.HideMerchantCheckmarks()
            return
        end

        local numMerchantItems = GetMerchantNumItems()

        for i = 1, MERCHANT_ITEMS_PER_PAGE do
            local index = ((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i
            local button = _G["MerchantItem" .. i .. "ItemButton"]

            if button then
                if not button.dvCheckmark then
                    local check = button:CreateTexture(nil, "OVERLAY", nil, 7)
                    check:SetSize(18, 18)
                    check:SetPoint("BOTTOM", 0, -8)
                    check:SetTexture(COLLECTED_ICON_TEXTURE)
                    button.dvCheckmark = check
                end

                local checked = false

                if button:IsShown() and index <= numMerchantItems then
                    local itemID = GetMerchantItemID and GetMerchantItemID(index)
                    if not itemID then
                        local itemLink = GetMerchantItemLink(index)
                        if itemLink then
                            itemID = GetItemInfoInstant(itemLink)
                        end
                    end

                    if itemID and DVD.ActiveItems and DVD.ActiveItems[itemID] then
                        if DVD.IsItemCollected and DVD.IsItemCollected(itemID) then
                            checked = true
                        end
                    end
                end

                button.dvCheckmark:SetShown(checked)
            end
        end
    end)
end

function HookMerchantFrame()
    return DVD.HookMerchantFrame()
end

--------------------------------------------------------------------------------
-- SECTION 11: VENDOR NOTES PANEL (Forced Initialization & Debug)
--------------------------------------------------------------------------------
local NotesSizing = C.NotesPanelSizing or {}

function DVD.EnsureVendorNotes()
    if DVD.vendorNotes then return DVD.vendorNotes end
    if not DVD.itemContainer or not DVD.modelDivider then return nil end

    local notes = CreateFrame("Frame", "DV_VendorNotesPanel", DVD.itemContainer)
    notes.defaultY = NotesSizing.VendorDefaultY or -30

    notes:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", NotesSizing.HorizontalInset or 8, notes.defaultY)
    notes:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", -(NotesSizing.HorizontalInset or 8), notes.defaultY)
    notes:SetHeight(NotesSizing.Height or 60)
    notes:Hide()

    notes.bg = notes:CreateTexture(nil, "BACKGROUND")
    notes.bg:SetAllPoints()
    notes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.85)

    notes.text = notes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    notes.text:SetPoint("TOPLEFT", notes, "TOPLEFT", NotesSizing.TextHorizontalInset or 8, -(NotesSizing.TextTopInset or 8))
    notes.text:SetPoint("TOPRIGHT", notes, "TOPRIGHT", -(NotesSizing.TextHorizontalInset or 8), -(NotesSizing.TextTopInset or 8))
    notes.text:SetJustifyH("LEFT")
    notes.text:SetJustifyV("TOP")
    notes.text:SetWordWrap(true)
    notes.text:SetNonSpaceWrap(false)
    notes.text:SetFont(STANDARD_TEXT_FONT, NotesSizing.TextFontSize or 11, "")
    notes.text:SetTextColor(1, 1, 1, 1)

    DVD.vendorNotes = notes
    return notes
end

function DVD.PositionVendorNotes(vendor)
    local notes = DVD.EnsureVendorNotes()
    if not notes or not DVD.modelDivider then
        return
    end

    local y = notes.defaultY
    if vendor and vendor.noteY then
        y = vendor.noteY
    end

    notes:ClearAllPoints()
    notes:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", NotesSizing.HorizontalInset or 8, y)
    notes:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", -(NotesSizing.HorizontalInset or 8), y)

    -- If the vendor actually has a note, make sure it shows!
    if vendor and vendor.note then
        notes.text:SetText(vendor.note)
        notes:Show()
    else
        notes:Hide()
    end
end

-- Try creating it right away if containers exist
C_Timer.After(0.5, function()
    DVD.EnsureVendorNotes()
end)