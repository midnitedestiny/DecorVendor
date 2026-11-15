-- ============================================================
-- Decor Vendor: MainUI.lua
-- Consolidated file. Each section below is one original file,
-- preserved verbatim and wrapped in its own function scope:
-- (function(...) ... end)(...). That gives the section exactly
-- the behavior it had as a separate file - its local variables
-- stay private, and a top-level return or guard clause exits
-- only that section. Sections run in the original .toc order.
-- ============================================================

-- ------------------------------------------------------------
-- SECTION: Frames/MainHomePanel.lua
-- ------------------------------------------------------------
(function(...)
-- ============================================================
-- Decor Vendor
-- UI/MainHomePanel.lua
-- Main dashboard/home screen for the normal addon frame
-- ============================================================

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor MainHomePanel:|r constants are missing.")
    return
end

local Sizing = C.MainHomePanelSizing
local MAIN_SECTIONS = C.MAIN_SECTIONS

if not Sizing then
    print("|cffff4040DecorVendor MainHomePanel:|r MainHomePanelSizing is missing.")
    return
end

if not MAIN_SECTIONS then
    print("|cffff4040DecorVendor MainHomePanel:|r MAIN_SECTIONS is missing.")
    return
end

local CARD_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
}

function DVD:CreateMainHomePanel(parent)
if DVD.standaloneHomePanel then
        return DVD.standaloneHomePanel
    end

    -- Parent it to UIParent directly so it can exist independently when the main frame is hidden!
    local panel = CreateFrame("Frame", "DVD_StandaloneHomePanel", UIParent, "BackdropTemplate")
    panel:SetSize(1000, 450) -- Or whatever dimensions match your compact layout
    panel:SetPoint("CENTER", UIParent, "CENTER", 0, 50)
    panel:SetFrameStrata("HIGH")
    panel:SetFrameLevel(100)
    panel:SetBackdrop(CARD_BACKDROP)
    panel:SetBackdropColor(0.02, 0.018, 0.035, 1)
    panel:SetBackdropBorderColor(0.25, 0.52, 0.88, 1)
	panel:SetMovable(true)
	panel:SetResizable(false)
	panel:EnableMouse(true)
	panel:RegisterForDrag("LeftButton")

	panel:SetScript("OnDragStart", function(self)
    self:StartMoving()
	end)

	panel:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
	end)

	DVD.standaloneHomePanel = panel
	tinsert(UISpecialFrames, "DVD_StandaloneHomePanel")

    -------------------------------------------------
    -- Header
    -------------------------------------------------

    local header = CreateFrame("Frame", nil, panel, "BackdropTemplate")
    header:SetHeight(Sizing.HeaderHeight)
    header:SetPoint("TOPLEFT", panel, "TOPLEFT", Sizing.HeaderInset, -Sizing.HeaderInset)
    header:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -Sizing.HeaderInset, -Sizing.HeaderInset)
    header:SetBackdrop(CARD_BACKDROP)
    header:SetBackdropColor(0.09, 0.08, 0.14, 0.95)
    header:SetBackdropBorderColor(0.25, 0.52, 0.88, 1)

    local title = header:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("LEFT", header, "LEFT", Sizing.HeaderTextInset, 0)
	title:SetText("|cffffd100" .. DVD.L["ADDON_TITLE"] .. "|r")

    local subtitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("RIGHT", header, "RIGHT", -Sizing.HeaderRightReserve, 0)
    subtitle:SetText(DVD.L["HOME_SUBTITLE"])

    local closeBtn = CreateFrame("Button", nil, header, "UIPanelCloseButton")
    closeBtn:SetPoint("RIGHT", header, "RIGHT", -4, 0)
    closeBtn:SetScript("OnClick", function() panel:Hide() end)
    -------------------------------------------------
    -- Open section helper (FIXED FOR STATISTICS)
    -------------------------------------------------
    local function OpenSection(sectionKey)
        -- 🚀 THE VISIBILITY OVERRIDE:
        panel:Hide()

        if sectionKey == "gallery" then
            if DVD.OpenGalleryAddon then
                DVD.OpenGalleryAddon()
            else
                print("|cffff5555Decor Vendor:|r Gallery loader is missing.")
            end
            return
        end

        if DVD.OpenMainSection then
            DVD.OpenMainSection(sectionKey, true)
            return
        end

        if DVD.tabButtons and DVD.tabButtons[sectionKey] then
            DVD.tabButtons[sectionKey]:Click()
            return
        end

        if DVD.bottomTabs then
            for _, tab in ipairs(DVD.bottomTabs) do
                if tab.id == sectionKey then
                    tab:Click()
                    return
                end
            end
        end

        print("|cffff5555Decor Vendor:|r No section handler found for " .. tostring(sectionKey))
    end

    -------------------------------------------------
    -- Home card section counts
    -------------------------------------------------

    local function NormalizeHomeSource(rawSource)
        if not rawSource then
            return nil
        end

        local source = string.lower(tostring(rawSource))
        source = source:gsub("%s+", "")
        source = source:gsub("%-", "")

        if source == "vendor" or source == "vendors" then
            return "vendor"
        end

        if source == "quest" or source == "quests" then
            return "quest"
        end

        if source == "achievement"
            or source == "achievements"
            or source == "achieve"
            or source == "ach"
        then
            return "achievement"
        end

        if source == "profession"
            or source == "professions"
            or source == "crafted"
            or source == "crafting"
            or source == "recipe"
        then
            return "profession"
        end

        if source == "drop"
            or source == "drops"
            or source == "boss"
            or source == "bossdrop"
            or source == "bossdrops"
            or source == "treasure"
            or source == "treasures"
            or source == "event"
            or source == "rare"
            or source == "rares"
        then
            return "drop"
        end

        return source
    end

    local function SourceMatches(itemData, ...)
        if type(itemData) ~= "table" then
            return false
        end

        local wanted = {}

        for i = 1, select("#", ...) do
            wanted[select(i, ...)] = true
        end

        local function Test(rawSource)
            local source = NormalizeHomeSource(rawSource)
            return source and wanted[source]
        end

        if Test(itemData.source) or Test(itemData.sourceType) then
            return true
        end

        if type(itemData.sources) == "table" then
            for _, rawSource in ipairs(itemData.sources) do
                if Test(rawSource) then
                    return true
                end
            end

            for rawSource, enabled in pairs(itemData.sources) do
                if enabled == true and Test(rawSource) then
                    return true
                end
            end
        end

        return false
    end

    local function GetItemDetails(DVD, itemID)
        if not DVD or type(DVD.ItemDetails) ~= "table" then
            return nil
        end

        return DVD.ItemDetails[itemID] or DVD.ItemDetails[tostring(itemID)]
    end

    local function GetVendorDetails(DVD, itemID)
        if not DVD or type(DVD.VendorDetails) ~= "table" then
            return nil
        end

        return DVD.VendorDetails[itemID] or DVD.VendorDetails[tostring(itemID)]
    end

    local function HasAnyField(tbl, ...)
        if type(tbl) ~= "table" then
            return false
        end

        for i = 1, select("#", ...) do
            local key = select(i, ...)

            if tbl[key] ~= nil then
                return true
            end
        end

        return false
    end

    local function ShouldCountHomeItem(DVD, itemData)
        if type(DVD) == "table" and type(DVD.IsDataAvailableForClient) == "function" then
            return DVD.IsDataAvailableForClient(itemData)
        end

        if type(itemData) == "table" then
            if itemData.hiddenOnLive == true or itemData.unreleased == true then
                return false
            end
        end

        return true
    end

    local function CountVendorNPCs()
        local npcs = DVD.npcs

        if type(npcs) ~= "table" then
            return 0
        end

        local count = 0

        for vendorID, vendorData in pairs(npcs) do
            if type(vendorID) == "number" and type(vendorData) == "table" then
                count = count + 1
            end
        end

        return count
    end

    local function CountHomeDecor(sectionKey)
        local activeItems = DVD.ActiveItems

        if type(activeItems) ~= "table" then
            return 0
        end

        local count = 0

        for itemID, itemData in pairs(activeItems) do
            if type(itemID) == "number"
                and type(itemData) == "table"
                and ShouldCountHomeItem(DVD, itemData)
            then
                local itemDetails = GetItemDetails(DVD, itemID) or {}
                local vendorDetails = GetVendorDetails(DVD, itemID)

                if type(itemDetails) ~= "table" then
                    itemDetails = {}
                end

                local matched = false

                if sectionKey == "vendors" then
                    matched =
                        SourceMatches(itemData, "vendor")
                        or itemData.soldBy ~= nil
                        or itemData.vendorID ~= nil
                        or type(vendorDetails) == "table"

                elseif sectionKey == "professions" then
                    matched =
                        SourceMatches(itemData, "profession")
                        or HasAnyField(itemData, "profession", "professionID", "professionName", "recipeID", "recipeName")
                        or HasAnyField(itemDetails, "profession", "professionID", "professionName", "professionText", "recipeID", "recipeName")

                elseif sectionKey == "quests" then
                    matched =
                        SourceMatches(itemData, "quest")
                        or HasAnyField(itemData, "questID", "questId", "questIDs", "questIds", "questName", "unlockQuestID", "unlockQuestName")
                        or HasAnyField(itemDetails, "questID", "questId", "questIDs", "questIds", "questName", "unlockQuestID", "unlockQuestName")

                elseif sectionKey == "achievements" then
                    matched =
                        SourceMatches(itemData, "achievement")
                        or HasAnyField(itemData, "achievementID", "achievementId", "achievementName")
                        or HasAnyField(itemDetails, "achievementID", "achievementId", "achievementName")

                elseif sectionKey == "bossdrops" then
                    matched =
                        SourceMatches(itemData, "drop")
                        or HasAnyField(itemData, "bossevent", "bossencounter", "bossName", "encounterID", "rareEvent", "eventName", "dropName", "treasureName")
                        or HasAnyField(itemDetails, "bossevent", "bossencounter", "bossName", "encounterID", "rareEvent", "eventName", "dropName", "treasureName")
						
				elseif sectionKey == "shop" then
                    matched =
                        SourceMatches(itemData, "shop", "store", "soon", "charity")
                        or itemData.shop ~= nil		
                end

                if matched then
                    count = count + 1
                end
            end
        end

        return count
    end

    -------------------------------------------------
    -- Cards (EXPANDED FOR DASHBOARD TRACKER)
    -------------------------------------------------
local cards = {}

-- Localization (v4): section titles and descriptions come from DVD.L,
-- not from Constants. Constants still holds the English fallback.
local SECTION_L_KEYS = {
    vendors = { title = "VENDORS", desc = "HOME_DESC_VENDORS" },
    professions = { title = "PROFESSIONS", desc = "HOME_DESC_PROFESSIONS" },
    quests = { title = "QUESTS", desc = "HOME_DESC_QUESTS" },
    achievements = { title = "ACHIEVEMENTS", desc = "HOME_DESC_ACHIEVEMENTS" },
    bossdrops = { title = "DROPS", desc = "HOME_DESC_DROPS" },
    gallery = { title = "GALLERY_BROWSER", desc = "HOME_DESC_GALLERY" },
}
for _, section in ipairs(MAIN_SECTIONS) do
    local lk = SECTION_L_KEYS[section.id]
    cards[#cards + 1] = {
        key = section.id,
        title = (lk and DVD.L[lk.title]) or section.text,
        color = section.homeColor,
        desc = (lk and DVD.L[lk.desc]) or section.homeDescription,
        showCount = section.showHomeCount,
    }
end


local cardWidth = Sizing.CardWidth
local cardHeight = Sizing.CardHeight
local gapX = Sizing.GapX
local gapY = Sizing.GapY
local startY = Sizing.CardsStartY

    local cardFrames = {}

    for i, info in ipairs(cards) do
        local card = CreateFrame("Button", nil, panel, "BackdropTemplate")
        card:SetSize(cardWidth, cardHeight)
        table.insert(cardFrames, card)
        card:SetBackdrop(CARD_BACKDROP)
        card:SetBackdropColor(0.10, 0.10, 0.16, 0.94)
        card:SetBackdropBorderColor(0.30, 0.30, 0.30, 1)

        local strip = card:CreateTexture(nil, "ARTWORK")
        strip:SetHeight(Sizing.CardStripHeight)
        strip:SetPoint("TOPLEFT", card, "TOPLEFT", 0, 0)
        strip:SetPoint("TOPRIGHT", card, "TOPRIGHT", 0, 0)
        strip:SetColorTexture(info.color[1], info.color[2], info.color[3], 1)

        local cardTitle = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        cardTitle:SetPoint("TOPLEFT", card, "TOPLEFT", Sizing.CardTitleLeftInset, -Sizing.CardTitleTopInset)
        cardTitle:SetText(info.title)
        cardTitle:SetTextColor(info.color[1], info.color[2], info.color[3], 1)
        
        card.info = info

        if info.showCount then
            local countText = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            countText:SetPoint("TOPRIGHT", card, "TOPRIGHT", -Sizing.CountRightInset, -Sizing.CountTopInset)
            countText:SetTextColor(info.color[1], info.color[2], info.color[3], 1)
            countText:SetText("")
            card.countText = countText
        end

        local desc = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        desc:SetPoint("TOPLEFT", cardTitle, "BOTTOMLEFT", 0, -Sizing.DescriptionTopGap)
        desc:SetPoint("RIGHT", card, "RIGHT", -Sizing.DescriptionRightInset, 0)
        desc:SetJustifyH("LEFT")
        desc:SetJustifyV("TOP")
        desc:SetText(info.desc)

        card:SetScript("OnEnter", function(self)
            self:SetBackdropBorderColor(info.color[1], info.color[2], info.color[3], 1)
        end)

        card:SetScript("OnLeave", function(self)
            self:SetBackdropBorderColor(0.30, 0.30, 0.30, 1)
        end)

        card:SetScript("OnClick", function()
            OpenSection(info.key)
        end)
    end

local function RefreshHomeCardCounts()
        for _, card in ipairs(cardFrames) do
            local info = card.info

            if info and info.showCount and card.countText then
                if info.key == "vendors" then
                    -- 🚀 Fetch BOTH counts specifically for the vendors card
                    local npcCount = CountVendorNPCs()
                    local decorCount = CountHomeDecor("vendors")
                    
                    -- Format them nicely side-by-side
                    card.countText:SetText(npcCount .. " " .. DVD.L["NPCS"] .. "  |  " .. decorCount .. " " .. DVD.L["DECOR"])
                else
                    -- Standard processing for all other cards
                    local count = CountHomeDecor(info.key)
                    card.countText:SetText(tostring(count) .. " " .. DVD.L["DECOR"])
                end
            end
        end
    end

    panel.RefreshCounts = RefreshHomeCardCounts

panel:HookScript("OnShow", function()
    RefreshHomeCardCounts()

    if C_Timer and C_Timer.After then
        C_Timer.After(Sizing.CountRefreshDelay, function()
            if panel and panel:IsShown() then
                RefreshHomeCardCounts()
                if panel.ResizeToContent then
                    panel.ResizeToContent()
                end
            end
        end)
    end
end)

    RefreshHomeCardCounts()
    
    local function LayoutHomeCards()
       local columns = Sizing.Columns
        local panelWidth = panel:GetWidth()

        if not panelWidth or panelWidth <= 0 then
            return
        end

        local totalCardsWidth = (cardWidth * columns) + (gapX * (columns - 1))
        local startX = math.floor((panelWidth - totalCardsWidth) / 2)

        if startX < Sizing.MinimumStartX  then
            startX = Sizing.MinimumStartX 
        end

        for i, card in ipairs(cardFrames) do
            local col = (i - 1) % columns
            local row = math.floor((i - 1) / columns)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                panel,
                "TOPLEFT",
                startX + (cardWidth + gapX) * col,
                startY - (cardHeight + gapY) * row
            )
        end
    end

    panel:HookScript("OnSizeChanged", LayoutHomeCards)
    C_Timer.After(0, LayoutHomeCards)

-------------------------------------------------
-- Footer
-------------------------------------------------
local footerLine1 = panel:CreateFontString(nil, "OVERLAY")
footerLine1:SetFont(STANDARD_TEXT_FONT, Sizing.FooterLine1FontSize, "OUTLINE")
footerLine1:SetPoint("LEFT", panel, "LEFT", 0, 0) -- x-position fixed below, y set by ResizeHomePanelToContent
footerLine1:SetPoint("RIGHT", panel, "RIGHT", 0, 0)
footerLine1:SetText("|cffffd100" .. DVD.L["TIP"] .. ":|r |cfff5ebd1" .. DVD.L["HOME_TIP"] .. "|r")
footerLine1:SetJustifyH("CENTER")

local footerLine2 = panel:CreateFontString(nil, "OVERLAY")
footerLine2:SetFont(STANDARD_TEXT_FONT, Sizing.FooterLine2FontSize, "OUTLINE")
footerLine2:SetPoint("TOP", footerLine1, "BOTTOM", 0, -Sizing.FooterLine2Gap)
footerLine2:SetText("|cffde9b6b" .. DVD.L["GALLERY_FIRST_LOAD_NOTE"] .. "|r")
footerLine2:SetJustifyH("CENTER")

-------------------------------------------------
-- Resize the panel to hug its actual content
-- (recalculates every time, so adding a Favorites
-- card later just works without touching this code)
-------------------------------------------------
local function ResizeHomePanelToContent()
    local columns = Sizing.Columns
    local rows = math.max(1, math.ceil(#cardFrames / columns))

    -- Bottom edge of the last card row, in panel-local y (negative = downward)
    local cardsBottomY =
        startY
        - (rows * cardHeight)
        - ((rows - 1) * gapY)

    footerLine1:ClearAllPoints()
    footerLine1:SetPoint("TOP", panel, "TOP", 0, cardsBottomY - Sizing.FooterAboveGap)
    footerLine1:SetPoint("LEFT", panel, "LEFT", 0, 0)
    footerLine1:SetPoint("RIGHT", panel, "RIGHT", 0, 0)

    local footer1Height = footerLine1:GetStringHeight() or 14
    local footer2Height = footerLine2:GetStringHeight() or 12

    local footerBottomY =
        cardsBottomY
        - Sizing.FooterAboveGap
        - footer1Height
        - Sizing.FooterLine2Gap
        - footer2Height

    local totalHeight = (-footerBottomY) + Sizing.FooterBottomPadding

    panel:SetHeight(totalHeight)
end

panel.ResizeToContent = ResizeHomePanelToContent
C_Timer.After(0, ResizeHomePanelToContent)

end

--[[function DVD.ShowMainHomePanel()
    local frame = DVD.frame

    if not frame then
        return
    end

    if not frame.homePanel and DVD.CreateMainHomePanel then
        DVD:CreateMainHomePanel(frame)
    end

    if DVD.sidebar then
        DVD.sidebar:Hide()
    end

    if frame.homeHint then
        frame.homeHint:Hide()
    end

    if frame.titleBar then
        frame.titleBar:Hide()
    end
	
    if DVD.contentArea then
        DVD.contentArea:Hide()
    end

    if DVD.tabBar then
        DVD.tabBar:Hide()
    end

    if _G.DV_SearchBox then
        _G.DV_SearchBox:Hide()
    end

    if _G.DV_ResetProgressBtn then
        _G.DV_ResetProgressBtn:Hide()
    end

    if frame.homePanel then
        frame.homePanel:Show()
        frame.homePanel:SetFrameLevel((frame:GetFrameLevel() or 100) + 200)

        if frame.homePanel.RefreshCounts then
            frame.homePanel:RefreshCounts()
        end
    end
end

]]

function DVD.ShowMainHomePanel()
    -- 🚀 HIDE THE ENTIRE MAIN FRAME COMPLETELY
    if DVD.frame then
        DVD.frame:Hide()
    end

    -- Ensure the standalone home panel is created and shown
    if not DVD.standaloneHomePanel and DVD.CreateMainHomePanel then
        DVD:CreateMainHomePanel(UIParent)
    end

    if DVD.standaloneHomePanel then
        DVD.standaloneHomePanel:Show()
        if DVD.standaloneHomePanel.RefreshCounts then
            DVD.standaloneHomePanel:RefreshCounts()
        end
    end
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Frames/MainFrame.lua
-- ------------------------------------------------------------
(function(...)
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
    hover:SetColorTexture(0.25, 0.52, 0.88, 0.18)

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
        self:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.85)
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
    settingsBtn:SetText(DVD.L["SETTINGS"])
    settingsBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine(DVD.L["OPEN_SETTINGS_TOOLTIP"], 1, 0.82, 0)
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
    homeBtn:SetText(DVD.L["HOME"])
    homeBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine(DVD.L["OPEN_HOME_TOOLTIP"], 1, 0.82, 0)
        GameTooltip:AddLine(DVD.L["RETURN_HOME_TOOLTIP"], 0.8, 0.8, 0.8, true)
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
    title:SetText(DVD.L["MAIN_TITLE"])
    title:SetTextColor(unpack(Color("TITLE", {1, 0.82, 0, 1})))

    local closeBtn = CreateFrame("Button", nil, titleBar, "UIPanelCloseButton")
    closeBtn:SetPoint("RIGHT", titleBar, "RIGHT", -4, 0)
    closeBtn:SetScript("OnClick", function() frame:Hide() end)

    local resetBtn = CreateFrame("Button", "DV_ResetProgressBtn", titleBar, "UIPanelButtonTemplate")
    resetBtn:SetSize(Sizing.ResetButtonWidth, Sizing.ResetButtonHeight)
    resetBtn:SetPoint("RIGHT", closeBtn, "LEFT", -6, 0)
    resetBtn:SetText(DVD.L["RESET_VENDORS"])
    resetBtn:SetScript("OnClick", function()
        StaticPopupDialogs["DV_RESET_VENDORS"] = {
            text = DVD.L["RESET_CONFIRM"],
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
        searchBox.Instructions:SetText(DVD.L["SEARCH_PLACEHOLDER"])
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
            tab.text:SetTextColor(0.92, 0.92, 0.92, 1)
            tab.icon:SetVertexColor(0.85, 0.85, 0.85, 1)
        end
    end

    local function RefreshTabVisuals()
        for _, tab in ipairs(bottomTabs) do
            SetTabVisual(tab, tab.id == DVD.currentTab)
        end
    end
    DVD.RefreshTabVisuals = RefreshTabVisuals

    local startX = BottomSizing.StartX

    -- Localization (v4): bottom tab labels come from DVD.L (same table as the home cards above).
    local TAB_L_KEYS = {
        vendors = "VENDORS", professions = "PROFESSIONS", quests = "QUESTS",
        achievements = "ACHIEVEMENTS", bossdrops = "DROPS", gallery = "GALLERY_BROWSER",
    }
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
        text:SetText((TAB_L_KEYS[tabData.id] and DVD.L[TAB_L_KEYS[tabData.id]]) or tabData.text)
        tab.text = text

        local hover = tab:CreateTexture(nil, "HIGHLIGHT")
        hover:SetAllPoints(tab)
        hover:SetTexture("Interface\\Buttons\\WHITE8x8")
        hover:SetColorTexture(1, 0.82, 0.2, 0.16)

        tab:SetScript("OnEnter", function(self)
            if self.id ~= DVD.currentTab then
                self:SetBackdropBorderColor(1, 0.82, 0, 0.95)
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
        DVD.modelTitle:SetText(DVD.L["SELECT_AN_ITEM"])
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
	if vendorSettings.previewDecorOnClick == nil then vendorSettings.previewDecorOnClick = true end


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
        self:AddLine("|cffffffff" .. DVD.L["ADDON_TITLE"] .. "|r")
        self:AddLine("|cff00ff00" .. DVD.L["LEFT_CLICK"] .. "|r " .. DVD.L["TOGGLE_WINDOW"])
        self:AddLine("|cff00ff00" .. DVD.L["RIGHT_CLICK"] .. "|r " .. DVD.L["SETTINGS"])
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
    print("|cff88ff88" .. DVD.L["ADDON_TITLE"] .. ":|r " .. DVD.L["VENDOR_PROGRESS_RESET"])
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

-- 1. Check world event status first
    local vendorEventID = vendor.worldEventID
    local vendorEventName = vendor.eventName
    if vendorEventID or vendorEventName then
        local active = DVD.IsWorldEventActive(vendorEventID, vendorEventName)
        if active == false then return nil, "inactive" end
        if active == nil then return nil, "loading" end
    end

    -- 2. Determine player faction and select correct coordinates
    local playerFaction = UnitFactionGroup and UnitFactionGroup("player")
    playerFaction = playerFaction and playerFaction:lower() or "neutral"

    local factionData = (playerFaction == "alliance" and vendor.alliance) or (playerFaction == "horde" and vendor.horde) or vendor

    local fixedMapID = tonumber(factionData.mapID or factionData.uiMapID or factionData.uiMapId)
    local fixedX = tonumber(factionData.x or factionData.coordX)
    local fixedY = tonumber(factionData.y or factionData.coordY)

    if fixedMapID and fixedX and fixedY then
        return {
            mapID = fixedMapID,
            x = fixedX,
            y = fixedY,
            title = vendor.title or vendor.name or "Decor Vendor",
            zone = factionData.zone or vendor.zone,
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

    local isWorldEvent = action.availability == "worldevent"
        or action.worldEventID ~= nil
        or action.eventName ~= nil

    if isWorldEvent then
        local activeEvent = DVD.IsWorldEventActive(action.worldEventID, action.eventName)

        if activeEvent == false then return nil, "inactive" end
        if activeEvent == nil then
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
	"CALENDAR_UPDATE_EVENT_LIST",
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
    if C_Calendar and C_Calendar.GetDate and C_Calendar.SetAbsMonth then
        local _, month, _, year = C_Calendar.GetDate()
        if month and year then
            pcall(C_Calendar.SetAbsMonth, month, year)
        end
    end
    ScheduleRefresh(1.00, true)
    elseif eventName == "NEIGHBORHOOD_INITIATIVE_UPDATED" then
        ScheduleRefresh(0.10, false)
	elseif eventName == "CALENDAR_UPDATE_EVENT_LIST" then
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
                            itemID = (C_Item and C_Item.GetItemInfoInstant and C_Item.GetItemInfoInstant(itemLink)) or (GetItemInfo and GetItemInfo(itemLink))
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
end)(...);

-- ------------------------------------------------------------
-- SECTION: UI/PreviewPanel.lua
-- ------------------------------------------------------------
(function(...)
-- [[
-- ============================================================
-- Decor Vendor Addon - Preview Panel & Popups
-- © 2026 MidniteDestiny. All Rights Reserved.
-- ============================================================
-- ]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor PreviewPanel:|r constants are missing.")
    return
end

local Sizing = C.PreviewPanelSizing
local ReagentsSizing = C.ReagentsPopupSizing or {}
local VendorPopupSizing = C.VendorPopupSizing or {}

if not Sizing then
    print("|cffff4040DecorVendor PreviewPanel:|r PreviewPanelSizing is missing.")
    return
end

local DEFAULT_SCENE_ID = C.DEFAULT_SCENE_ID
local CAMERA_IMMEDIATE = C.CAMERA and C.CAMERA.TRANSITION_IMMEDIATE
local CAMERA_DISCARD = C.CAMERA and C.CAMERA.MODIFICATION_DISCARD
local GOLD = (C.COLORS and C.COLORS.GOLD) or { 1, 0.82, 0, 1 }
local COLLECTED_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\collected"

if not DVD.contentArea then
    print("|cffff4040DecorVendor PreviewPanel:|r DVD.contentArea is missing. Make sure MainFrame loads first.")
    return
end

local PANEL_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
}


--------------------------------------------------------------------------------
-- SECTION 1: MAIN PREVIEW PANEL & MODEL VIEWER
--------------------------------------------------------------------------------
local previewPanel = CreateFrame("Frame", "DV_PreviewPanel", DVD.contentArea, "BackdropTemplate")
DVD.previewPanel = previewPanel

previewPanel:SetWidth(Sizing.Width)
previewPanel:SetPoint("TOPRIGHT", DVD.contentArea, "TOPRIGHT", -Sizing.PanelInset, -Sizing.PanelInset)
previewPanel:SetPoint("BOTTOMRIGHT", DVD.contentArea, "BOTTOMRIGHT", -Sizing.PanelInset, Sizing.PanelInset)

previewPanel:SetBackdrop(PANEL_BACKDROP)
previewPanel:SetBackdropColor(0.018, 0.014, 0.032, 0.92)
previewPanel:SetBackdropBorderColor(0, 0, 0, 0)

local previewBg = previewPanel:CreateTexture(nil, "BACKGROUND")
previewBg:SetPoint("TOPLEFT", previewPanel, "TOPLEFT", 3, -3)
previewBg:SetPoint("BOTTOMRIGHT", previewPanel, "BOTTOMRIGHT", -3, 3)
previewBg:SetColorTexture(0.01, 0.008, 0.018, 0.86)

local modelBox = CreateFrame("Frame", "DV_ModelBox", previewPanel, "BackdropTemplate")
DVD.modelContainer = modelBox
DVD.modelBox = modelBox

modelBox:SetPoint("TOPLEFT", previewPanel, "TOPLEFT", Sizing.ModelBoxInset, -Sizing.ModelBoxInset)
modelBox:SetPoint("TOPRIGHT", previewPanel, "TOPRIGHT", -Sizing.ModelBoxInset, -Sizing.ModelBoxInset)
modelBox:SetHeight(Sizing.ModelViewerHeight)

modelBox:SetBackdrop(PANEL_BACKDROP)
modelBox:SetBackdropColor(0.01, 0.01, 0.018, 0.35)
modelBox:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.95) -- steel blue color

modelBox.modelBg = modelBox:CreateTexture(nil, "BACKGROUND")
modelBox.modelBg:SetAllPoints()
modelBox.modelBg:SetAtlas("catalog-list-preview-bg")

local modelScene = CreateFrame("ModelScene", "DV_ModelScene", modelBox, "PanningModelSceneMixinTemplate")
DVD.modelScene = modelScene

modelScene:SetPoint("TOPLEFT", modelBox, "TOPLEFT", Sizing.ModelSceneInset, -Sizing.ModelSceneInset)
modelScene:SetPoint("BOTTOMRIGHT", modelBox, "BOTTOMRIGHT", -Sizing.ModelSceneInset, Sizing.ModelSceneInset)
modelScene:EnableMouse(true)
modelScene:EnableMouseWheel(true)
modelScene:Show()

pcall(function()
    modelScene:TransitionToModelSceneID(DEFAULT_SCENE_ID, CAMERA_IMMEDIATE, CAMERA_DISCARD, true)
end)

local actor = modelScene:CreateActor()
DVD.previewActor = actor
if actor then
    if actor.SetTag then actor:SetTag("decor") end
    if actor.SetPreferModelCollisionBounds then actor:SetPreferModelCollisionBounds(true) end
end

-- Mouse Drag Rotate
local dragLastX, dragLastY = nil, nil
modelScene:HookScript("OnMouseDown", function(_, button)
    if button == "LeftButton" then dragLastX, dragLastY = GetCursorPosition() end
end)
modelScene:HookScript("OnMouseUp", function(_, button)
    if button == "LeftButton" then dragLastX, dragLastY = nil, nil end
end)
modelScene:HookScript("OnUpdate", function(self)
    if not dragLastX or not dragLastY then return end
    local x, y = GetCursorPosition()
    local dx = (x - dragLastX) * 0.02
    local dy = (y - dragLastY) * 0.02
    dragLastX, dragLastY = x, y

    local a = DVD.previewActor or self:GetActorByTag("decor") or self:GetActorByTag("item")
    if a then
        if a.SetYaw then a:SetYaw((a:GetYaw() or 0) + dx) end
        if a.SetPitch then a:SetPitch((a:GetPitch() or 0) - dy) end
    end
end)

DVD.modelControls = CreateFrame("Frame", nil, modelBox, "ModelSceneControlFrameTemplate")
DVD.modelControls:SetPoint("BOTTOM", modelBox.modelBg, "BOTTOM", 0, Sizing.ModelControlsBottomOffset)
DVD.modelControls:SetModelScene(modelScene)
DVD.modelControls:Hide()

modelBox.corbelLeft = modelBox:CreateTexture(nil, "OVERLAY")
modelBox.corbelLeft:SetAtlas("catalog-corbel-bottom-left")
modelBox.corbelLeft:SetSize(Sizing.CorbelWidth, Sizing.CorbelHeight)
modelBox.corbelLeft:SetPoint("BOTTOMLEFT", modelBox, "BOTTOMLEFT", 0, 0)

modelBox.corbelRight = modelBox:CreateTexture(nil, "OVERLAY")
modelBox.corbelRight:SetAtlas("catalog-corbel-bottom-right")
modelBox.corbelRight:SetSize(Sizing.CorbelWidth, Sizing.CorbelHeight)
modelBox.corbelRight:SetPoint("BOTTOMRIGHT", modelBox, "BOTTOMRIGHT", 0, 0)

DVD.previewWatermarkFrame = CreateFrame("Frame", nil, modelBox)
DVD.previewWatermarkFrame:SetPoint("TOPLEFT", modelBox.modelBg, "TOPLEFT", 0, 0)
DVD.previewWatermarkFrame:SetPoint("BOTTOMRIGHT", modelBox.modelBg, "BOTTOMRIGHT", 0, 0)
DVD.previewWatermarkFrame:SetFrameLevel(modelBox:GetFrameLevel() + 5)

DVD.previewWatermark = DVD.previewWatermarkFrame:CreateTexture(nil, "ARTWORK")
DVD.previewWatermark:SetSize(Sizing.WatermarkSize, Sizing.WatermarkSize)
DVD.previewWatermark:SetPoint("CENTER", DVD.previewWatermarkFrame, "CENTER", 0, 0)
DVD.previewWatermark:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga")
DVD.previewWatermark:SetAlpha(Sizing.WatermarkAlpha)

function DVD.SetPreviewWatermarkVisible(show)
    if DVD.previewWatermarkFrame then DVD.previewWatermarkFrame:SetShown(show) end
    if DVD.modelControls then DVD.modelControls:SetShown(not show) end
end

DVD.previewWatermarkText = DVD.previewWatermarkFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
DVD.previewWatermarkText:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
DVD.previewWatermarkText:SetPoint("CENTER", DVD.previewWatermarkFrame, "CENTER", 0, -40)
DVD.previewWatermarkText:SetJustifyH("CENTER")
DVD.previewWatermarkText:SetTextColor(1, 0.25, 0.25)
DVD.previewWatermarkText:SetText("")

local dividerFrame = CreateFrame("Frame", "Dv_DividerLine", previewPanel)
dividerFrame:SetHeight(Sizing.DividerHeight)
dividerFrame:SetPoint("TOPLEFT", modelBox, "BOTTOMLEFT", Sizing.DividerHorizontalInset, -Sizing.DividerTopGap)
dividerFrame:SetPoint("TOPRIGHT", modelBox, "BOTTOMRIGHT", -Sizing.DividerHorizontalInset, -Sizing.DividerTopGap)
dividerFrame:SetFrameLevel(previewPanel:GetFrameLevel() + 10)

local dividerTex = dividerFrame:CreateTexture("DV_DividerTexture", "OVERLAY")
dividerTex:SetAllPoints()
dividerTex:SetColorTexture(0.86, 0.31, 0.09, 1)
DVD.modelDivider = dividerFrame

local itemContainer = CreateFrame("Frame", "DV_ItemContainer", previewPanel, "BackdropTemplate")
DVD.itemContainer = itemContainer
itemContainer:SetPoint("TOPLEFT", dividerFrame, "BOTTOMLEFT", -Sizing.ItemContainerDividerOverlap, -Sizing.ItemContainerTopGap)
itemContainer:SetPoint("TOPRIGHT", dividerFrame, "BOTTOMRIGHT", Sizing.ItemContainerDividerOverlap, -Sizing.ItemContainerTopGap)
itemContainer:SetPoint("BOTTOMRIGHT", previewPanel, "BOTTOMRIGHT", -Sizing.ItemContainerOuterInset, Sizing.ItemContainerOuterInset)
itemContainer:SetBackdrop(PANEL_BACKDROP)
itemContainer:SetBackdropColor(0.015, 0.012, 0.026, 0.75)
itemContainer:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.95)

DVD.modelTitle = itemContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
DVD.modelTitle:SetFont(STANDARD_TEXT_FONT, Sizing.TitleFontSize, "OUTLINE")
DVD.modelTitle:SetJustifyH("CENTER")
DVD.modelTitle:SetDrawLayer("OVERLAY", 7)
DVD.modelTitle:SetPoint("TOPLEFT", itemContainer, "TOPLEFT", Sizing.TitleHorizontalInset, -Sizing.TitleTopOffset)
DVD.modelTitle:SetPoint("TOPRIGHT", itemContainer, "TOPRIGHT", -Sizing.TitleHorizontalInset, -Sizing.TitleTopOffset)
DVD.modelTitle:SetText("|cffaaaaaa" .. DVD.L["NO_DECOR_SELECTED"] .. "|r")
DVD.modelTitle:Show()


--------------------------------------------------------------------------------
-- SECTION 2: REAGENTS POPUP PANEL
--------------------------------------------------------------------------------
if not tContains(UISpecialFrames, "DV_ReagentsPopup") then
    tinsert(UISpecialFrames, "DV_ReagentsPopup")
end

local REAGENT_PANEL_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

DVD.reagentsPopup = CreateFrame("Frame", "DV_ReagentsPopup", DVD.itemContainer, "BackdropTemplate")
local rpopup = DVD.reagentsPopup
rpopup:ClearAllPoints()
rpopup:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", ReagentsSizing.HorizontalInset or 8, -(ReagentsSizing.TopOffset or 8))
rpopup:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -(ReagentsSizing.HorizontalInset or 8), -(ReagentsSizing.TopOffset or 8))
rpopup:SetHeight(ReagentsSizing.DefaultHeight or 100)
rpopup:SetFrameLevel(DVD.itemContainer:GetFrameLevel() + (ReagentsSizing.FrameLevelOffset or 5))
rpopup:SetBackdrop(nil)
rpopup:Hide()

rpopup.header = rpopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
rpopup.header:SetPoint("TOP", rpopup, "TOP", 0, 0)
rpopup.header:SetFont(STANDARD_TEXT_FONT, ReagentsSizing.HeaderFontSize or 12, "OUTLINE")
rpopup.header:SetTextColor(GOLD[1], GOLD[2], GOLD[3], GOLD[4] or 1)
rpopup.header:SetText(DVD.L["REAGENTS_NEEDED"])

rpopup.recipeFrame = CreateFrame("Button", nil, rpopup, "BackdropTemplate")
rpopup.recipeFrame:SetSize(ReagentsSizing.RecipeWidth or 200, ReagentsSizing.RecipeHeight or 24)
rpopup.recipeFrame:SetPoint("TOP", rpopup.header, "BOTTOM", 0, -(ReagentsSizing.RecipeTopGap or 4))
rpopup.recipeFrame:SetBackdrop(REAGENT_PANEL_BACKDROP)
rpopup.recipeFrame:SetBackdropColor(0.035, 0.025, 0.055, 0.78)
rpopup.recipeFrame:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.75)
rpopup.recipeFrame:RegisterForClicks("AnyUp")
rpopup.recipeFrame:Hide()

rpopup.recipeIcon = rpopup.recipeFrame:CreateTexture(nil, "ARTWORK")
rpopup.recipeIcon:SetSize(ReagentsSizing.RecipeIconSize or 18, ReagentsSizing.RecipeIconSize or 18)
rpopup.recipeIcon:SetPoint("LEFT", rpopup.recipeFrame, "LEFT", ReagentsSizing.RecipeIconLeftInset or 4, 0)
rpopup.recipeIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

rpopup.recipeText = rpopup.recipeFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
rpopup.recipeText:SetPoint("LEFT", rpopup.recipeIcon, "RIGHT", ReagentsSizing.RecipeTextGap or 6, 0)
rpopup.recipeText:SetPoint("RIGHT", rpopup.recipeFrame, "RIGHT", -(ReagentsSizing.RecipeTextRightInset or 4), 0)
rpopup.recipeText:SetJustifyH("LEFT")
rpopup.recipeText:SetFont(STANDARD_TEXT_FONT, ReagentsSizing.RecipeTextFontSize or 10, "OUTLINE")
rpopup.recipeText:SetTextColor(0.9, 0.9, 0.9, 1)
rpopup.recipeText:SetText(DVD.L["RECIPE"])

rpopup.recipeFrame:SetScript("OnEnter", function(self)
    if self.recipeID then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink("item:" .. tostring(self.recipeID))
        GameTooltip:Show()
    end
    self:SetBackdropBorderColor(1, 0.82, 0, 1)
end)

rpopup.recipeFrame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.75)
end)

rpopup.recipeFrame:SetScript("OnClick", function(self)
    if self.recipeID and DVD.ShowWowheadLinkPopup then
        DVD.ShowWowheadLinkPopup(self.recipeID, "item")
    end
end)

DVD.reagentIconCache = DVD.reagentIconCache or {}

local function GetReagentIconFrame(i)
    local f = DVD.reagentIconCache[i]
    if f then
        f:Show()
        return f
    end

    f = CreateFrame("Frame", nil, rpopup, "BackdropTemplate")
    f:SetSize(ReagentsSizing.TileWidth or 36, ReagentsSizing.TileHeight or 36)
    f:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = ReagentsSizing.TileBorderEdgeSize or 1,
    })
    f:SetBackdropBorderColor(0.42, 0.42, 0.42, 1)
    f:SetClipsChildren(true)

    local btn = CreateFrame("Button", nil, f)
    btn:SetAllPoints()
    btn:RegisterForClicks("AnyUp")
    f.btn = btn

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", f, "TOPLEFT", ReagentsSizing.TileIconInset or 2, -(ReagentsSizing.TileIconInset or 2))
    icon:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -(ReagentsSizing.TileIconInset or 2), ReagentsSizing.TileIconBottomReserve or 10)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    f.icon = icon

    local countBg = f:CreateTexture(nil, "BACKGROUND")
    countBg:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 0, 0)
    countBg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
    countBg:SetHeight(ReagentsSizing.CountBarHeight or 12)
    countBg:SetColorTexture(0, 0, 0, 0.95)

    local countText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countText:SetPoint("BOTTOM", f, "BOTTOM", 0, ReagentsSizing.CountTextBottomOffset or 2)
    countText:SetFont(STANDARD_TEXT_FONT, ReagentsSizing.CountTextFontSize or 9, "OUTLINE")
    countText:SetTextColor(1, 1, 1, 1)
    f.countText = countText

    btn:SetScript("OnEnter", function(self)
        SetCursor("CAST_CURSOR")
        f:SetBackdropBorderColor(1, 0.82, 0, 1)
        if self.itemID then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. tostring(self.itemID))
            GameTooltip:Show()
        end
    end)

    btn:SetScript("OnLeave", function()
        ResetCursor()
        f:SetBackdropBorderColor(0.42, 0.42, 0.42, 1)
        GameTooltip:Hide()
    end)

    btn:SetScript("OnClick", function(self)
        if self.itemID and DVD.ShowWowheadLinkPopup then
            DVD.ShowWowheadLinkPopup(self.itemID, "item")
        end
    end)

    DVD.reagentIconCache[i] = f
    return f
end

function DVD.ShowReagentsPopup(itemData)
    if not DVD.reagentsPopup then return end
    local rpopup = DVD.reagentsPopup

    if not itemData or not itemData.reagents or #itemData.reagents == 0 then
        rpopup:Hide()
        return
    end

    for _, f in pairs(DVD.reagentIconCache or {}) do
        f:Hide()
    end

    local hasRecipe = itemData.recipe and itemData.recipe > 0
    local startY = ReagentsSizing.NoRecipeStartY or -20

    rpopup.recipeFrame:Hide()
    rpopup.recipeFrame.recipeID = nil

    if hasRecipe then
        rpopup.recipeFrame.recipeID = itemData.recipe
        rpopup.recipeIcon:SetTexture(GetItemIcon(itemData.recipe) or "Interface\\Icons\\INV_Scroll_03")
        rpopup.recipeText:SetText(DVD.L["RECIPE"])

        local itemObj = Item:CreateFromItemID(itemData.recipe)
        itemObj:ContinueOnItemLoad(function()
            if rpopup.recipeText then
                local recipeName = itemObj:GetItemName() or "Recipe"
                local maxChars = ReagentsSizing.RecipeNameMaxCharacters or 25
                if #recipeName > maxChars then
                    recipeName = recipeName:sub(1, maxChars - 1) .. "..."
                end
                rpopup.recipeText:SetText(recipeName)
            end
        end)

        rpopup.recipeFrame:Show()
        startY = ReagentsSizing.WithRecipeStartY or -45
    end

    local tileW = ReagentsSizing.TileWidth or 36
    local tileH = ReagentsSizing.TileHeight or 36
    local gap = ReagentsSizing.TileGap or 4
    local availableWidth = math.max(1, rpopup:GetWidth() or ReagentsSizing.FallbackWidth or 250)

    local iconsPerRow = math.floor((availableWidth + gap) / (tileW + gap))
    iconsPerRow = math.max(1, math.min(ReagentsSizing.MaxColumns or 5, iconsPerRow))

    for i, reagent in ipairs(itemData.reagents) do
        local f = GetReagentIconFrame(i)
        f:ClearAllPoints()

        local row = math.floor((i - 1) / iconsPerRow)
        local col = (i - 1) % iconsPerRow

        local iconsThisRow = math.min(#itemData.reagents - (row * iconsPerRow), iconsPerRow)
        local thisRowWidth = (iconsThisRow * tileW) + ((iconsThisRow - 1) * gap)
        local thisStartX = math.floor((availableWidth - thisRowWidth) / 2)

        f:SetPoint("TOPLEFT", rpopup, "TOPLEFT", thisStartX + col * (tileW + gap), startY - row * (tileH + gap))
        f.btn.itemID = reagent.id
        local icon = (C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(reagent.id)) or "Interface\\Icons\\INV_Misc_QuestionMark"
		f.icon:SetTexture(icon)
        f.countText:SetText(reagent.amount or 1)
        f:Show()
    end

    local rows = math.ceil(#itemData.reagents / iconsPerRow)
    local height = math.abs(startY) + (rows * (tileH + gap)) + (ReagentsSizing.BottomPadding or 10)

    rpopup:SetHeight(height)
    rpopup:Show()
end


--------------------------------------------------------------------------------
-- SECTION 3: VENDOR POPUP PANEL
--------------------------------------------------------------------------------
local ICON_SIZE = VendorPopupSizing.IconSize or 36
local ICON_GAP = VendorPopupSizing.IconGap or 6
local ICONS_PER_PAGE = VendorPopupSizing.IconsPerPage or 12

vendorFilteredItems = vendorFilteredItems or {}
currentVendorPage = currentVendorPage or 1

if not tContains(UISpecialFrames, "DV_VendorPopup") then
    tinsert(UISpecialFrames, "DV_VendorPopup")
end

DVD.vendorPopup = CreateFrame("Frame", "DV_VendorPopup", DVD.itemContainer, "BackdropTemplate")
local vendorPopup = DVD.vendorPopup

vendorPopup:ClearAllPoints()
vendorPopup:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", VendorPopupSizing.HorizontalInset or 8, -(VendorPopupSizing.TopOffset or 25))
vendorPopup:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -(VendorPopupSizing.HorizontalInset or 8), -(VendorPopupSizing.TopOffset or 25))
vendorPopup:SetPoint("BOTTOMRIGHT", DVD.itemContainer, "BOTTOMRIGHT", -(VendorPopupSizing.HorizontalInset or 8), VendorPopupSizing.BottomInset or 8)
vendorPopup:EnableMouseWheel(true)
vendorPopup:Hide()

DVD.popupIconCache = DVD.popupIconCache or {}
local popupIconCache = DVD.popupIconCache

local vendorZoneText = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
vendorZoneText:ClearAllPoints()
vendorZoneText:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", 0, 0)
vendorZoneText:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", -(VendorPopupSizing.ZoneRightReserve or 20), 0)
vendorZoneText:SetHeight(VendorPopupSizing.ZoneHeight or 16)
vendorZoneText:SetJustifyH("LEFT")
vendorZoneText:SetFont(STANDARD_TEXT_FONT, VendorPopupSizing.ZoneFontSize or 11, "OUTLINE")
vendorZoneText:SetTextColor(0.85, 0.85, 0.85, 1)
vendorZoneText:SetText("")
DVD.vendorZoneText = vendorZoneText

vendorPopup.content = CreateFrame("Frame", nil, vendorPopup)
vendorPopup.content:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", 0, -(VendorPopupSizing.ContentTopOffset or 20))
vendorPopup.content:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", 0, -(VendorPopupSizing.ContentTopOffset or 20))
vendorPopup.content:SetPoint("BOTTOM", vendorPopup, "BOTTOM", 0, VendorPopupSizing.ContentBottomOffset or 30)

DVD.pagingFrame = CreateFrame("Frame", nil, vendorPopup, "BackdropTemplate")
local pagingFrame = DVD.pagingFrame

pagingFrame:SetSize(VendorPopupSizing.PagingWidth or 120, VendorPopupSizing.PagingHeight or 24)
pagingFrame:SetPoint("BOTTOM", vendorPopup, "BOTTOM", 0, VendorPopupSizing.PagingBottomOffset or 4)
pagingFrame:SetFrameLevel(vendorPopup:GetFrameLevel() + 20)
pagingFrame:Hide()

pagingFrame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
})
pagingFrame:SetBackdropColor(0.035, 0.025, 0.055, 0.82)
pagingFrame:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.75)

DVD.vendorPrevBtn = CreateFrame("Button", nil, pagingFrame)
DVD.vendorPrevBtn:SetSize(VendorPopupSizing.PagingButtonSize or 20, VendorPopupSizing.PagingButtonSize or 20)
DVD.vendorPrevBtn:SetPoint("LEFT", pagingFrame, "LEFT", VendorPopupSizing.PagingButtonInset or 4, 0)
DVD.vendorPrevBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
DVD.vendorPrevBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
DVD.vendorPrevBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")

DVD.vendorNextBtn = CreateFrame("Button", nil, pagingFrame)
DVD.vendorNextBtn:SetSize(VendorPopupSizing.PagingButtonSize or 20, VendorPopupSizing.PagingButtonSize or 20)
DVD.vendorNextBtn:SetPoint("RIGHT", pagingFrame, "RIGHT", -(VendorPopupSizing.PagingButtonInset or 4), 0)
DVD.vendorNextBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
DVD.vendorNextBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
DVD.vendorNextBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")

DVD.vendorPageText = pagingFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
DVD.vendorPageText:SetPoint("LEFT", DVD.vendorPrevBtn, "RIGHT", VendorPopupSizing.PagingTextGap or 4, 0)
DVD.vendorPageText:SetPoint("RIGHT", DVD.vendorNextBtn, "LEFT", -(VendorPopupSizing.PagingTextGap or 4), 0)
DVD.vendorPageText:SetJustifyH("CENTER")
DVD.vendorPageText:SetFont(STANDARD_TEXT_FONT, VendorPopupSizing.PagingTextFontSize or 10, "OUTLINE")
DVD.vendorPageText:SetText(string.format(DVD.L["PAGE"], 1))

local UpdateVendorPopup

DVD.vendorPrevBtn:SetScript("OnClick", function()
    if currentVendorPage > 1 then
        currentVendorPage = currentVendorPage - 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    end
end)

DVD.vendorNextBtn:SetScript("OnClick", function()
    local totalPages = math.max(1, math.ceil(#vendorFilteredItems / ICONS_PER_PAGE))
    if currentVendorPage < totalPages then
        currentVendorPage = currentVendorPage + 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    end
end)

vendorPopup:SetScript("OnMouseWheel", function(_, delta)
    local totalPages = math.max(1, math.ceil(#vendorFilteredItems / ICONS_PER_PAGE))
    if delta > 0 and currentVendorPage > 1 then
        currentVendorPage = currentVendorPage - 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    elseif delta < 0 and currentVendorPage < totalPages then
        currentVendorPage = currentVendorPage + 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    end
end)

local function GetPopupIconFrame(index)
    local container = popupIconCache[index]
    if container then
        container:Show()
        return container
    end

    container = CreateFrame("Frame", nil, vendorPopup.content)
    container:SetSize(ICON_SIZE, ICON_SIZE + (VendorPopupSizing.IconContainerExtraHeight or 4))

    local borderFrame = CreateFrame("Frame", nil, container, "BackdropTemplate")
    borderFrame:SetSize(ICON_SIZE, ICON_SIZE)
    borderFrame:SetPoint("TOP", container, "TOP", 0, 0)
    borderFrame:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = VendorPopupSizing.IconBorderEdgeSize or 1,
    })
    borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    borderFrame:SetClipsChildren(true)
    container.borderFrame = borderFrame

    local btn = CreateFrame("Button", nil, borderFrame)
    btn:SetAllPoints(borderFrame)
    btn:RegisterForClicks("AnyUp")
    container.btn = btn

    local glow = btn:CreateTexture(nil, "BACKGROUND")
    glow:SetPoint("TOPLEFT", -2, 2)
    glow:SetPoint("BOTTOMRIGHT", 2, -2)
    glow:SetColorTexture(0, 0, 0, 0.5)
    container.glow = glow

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", VendorPopupSizing.IconInset or 2, -(VendorPopupSizing.IconInset or 2))
    icon:SetPoint("BOTTOMRIGHT", -(VendorPopupSizing.IconInset or 2), VendorPopupSizing.IconInset or 2)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    container.icon = icon

    local checkFrame = CreateFrame("Frame", nil, container)
    checkFrame:SetSize(VendorPopupSizing.CheckSize or 16, VendorPopupSizing.CheckSize or 16)
    checkFrame:SetPoint("BOTTOM", borderFrame, "BOTTOM", 0, VendorPopupSizing.CheckOffsetY or 2)
    checkFrame:SetFrameLevel(borderFrame:GetFrameLevel() + 10)
    checkFrame:Hide()

    local checkTex = checkFrame:CreateTexture(nil, "ARTWORK")
    checkTex:SetAllPoints()
    checkTex:SetTexture(COLLECTED_ICON_TEXTURE)
    container.checkFrame = checkFrame

    btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    btn:GetHighlightTexture():SetBlendMode("ADD")
    btn:GetHighlightTexture():SetAllPoints(icon)

    popupIconCache[index] = container
    return container
end

function PopupButton_OnEnter(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    SetCursor("INSPECT_CURSOR")
    if self.isCollected then
        borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
        glow:SetColorTexture(1, 1, 1, 0.1)
    else
        borderFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
        glow:SetColorTexture(1, 0.82, 0, 0.2)
    end

    if self.itemID then
        local itemData = DVD.ActiveItems and (DVD.ActiveItems[self.itemID] or DVD.ActiveItems[tostring(self.itemID)])
        local itemName = nil
        if DVD.Gallery and DVD.Gallery.GetItemName then
            itemName = DVD.Gallery.GetItemName(self.itemID, itemData)
        end
        if not itemName or itemName == "" then
            itemName = (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(self.itemID)) or (GetItemInfo and GetItemInfo(self.itemID))
        end
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(itemName or (DVD.L["ITEM_ID"] .. tostring(self.itemID)), 0, 1, 0)
        GameTooltip:AddLine(self.isCollected and DVD.L["COLLECTED"] or DVD.L["NOT_COLLECTED"], self.isCollected and 0.2 or 1, self.isCollected and 1 or 0.82, 0.2)
        GameTooltip:AddLine(" ")
        -- Only promise a preview when the setting is on.
        -- ~= false means: on by default, even if the
        -- saved setting is missing for any reason.
        if not vendorSettings or vendorSettings.previewDecorOnClick ~= false then
            GameTooltip:AddLine(DVD.L["LEFT_CLICK_PREVIEW"], 0.65, 0.85, 1)
        end
        GameTooltip:Show()
    end
end

function PopupButton_OnLeave(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    ResetCursor()
    borderFrame:SetBackdropBorderColor(self.isCollected and 1 or 0.4, self.isCollected and 1 or 0.4, self.isCollected and 1 or 0.4, 1)
    glow:SetColorTexture(0, 0, 0, 0.5)
    GameTooltip:Hide()
end

function PopupButton_OnClick(self, button)
    if not self.itemID then return end
    if button == "LeftButton" then
        local itemData = DVD.ActiveItems and (DVD.ActiveItems[self.itemID] or DVD.ActiveItems[tostring(self.itemID)])
        local modelID = itemData and (itemData.model3D or itemData.asset)
        -- Toggle gate: only preview when the setting is
        -- on (or missing, which also means on).
        local previewOn = not vendorSettings or vendorSettings.previewDecorOnClick ~= false
        if previewOn and itemData and modelID and modelID ~= 0 and DVD.ShowPreviewModel then
            local itemName = nil
            if DVD.Gallery and DVD.Gallery.GetItemName then
                itemName = DVD.Gallery.GetItemName(self.itemID, itemData)
            end
            local ok, shown = pcall(DVD.ShowPreviewModel, modelID, itemName, itemData)
            if ok and shown then
                if DVD.modelTitle then DVD.modelTitle:SetText(itemName or DVD.L["PREVIEW"]) end
                -- Preserve the vendor waypoint button:
                -- it belongs to the vendor, not the decor.
                if DVD.vendorWaypointBtn and DVD.selectedVendor and DVD.ResolveVendorWaypoint then
                    local loc = DVD.ResolveVendorWaypoint(DVD.selectedVendor)
                    if loc then
                        DVD.vendorWaypointBtn:Show()
                        if DVD.vendorWaypointBtn.Raise then DVD.vendorWaypointBtn:Raise() end
                    end
                    -- Nib: loc is nil (noWaypoint, no map),
                    -- so the button correctly stays hidden.
                end
                return
            end
            -- ShowPreviewModel failed / bad model: do not
            -- change the pane, fall through to DressUp.
        end
        DressUpItemLink("item:" .. tostring(self.itemID))
    end
end

--[[local function SetupPopupButton(container, itemID)
    local btn = container.btn
    local borderFrame = container.borderFrame

    container.itemID = itemID
    btn.itemID = itemID
    btn.isCollected = (DVD.catalogReady and DVD.IsItemCollected and DVD.IsItemCollected(itemID)) or false

    borderFrame:SetBackdropBorderColor(btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, 1)
    if btn.isCollected and vendorSettings.showVendorCheckmarks then
        container.checkFrame:Show()
    else
        container.checkFrame:Hide()
    end

    container.icon:SetTexture(GetItemIcon(itemID) or "Interface\\Icons\\INV_Misc_QuestionMark")
    btn:SetScript("OnEnter", PopupButton_OnEnter)
    btn:SetScript("OnLeave", PopupButton_OnLeave)
    btn:SetScript("OnClick", PopupButton_OnClick)
    container:Show()
end]]

local function GetSafeItemIcon(itemID)
    itemID = tonumber(itemID)
    if not itemID then return "Interface\\Icons\\INV_Misc_QuestionMark" end

    local function IsRealIcon(icon)
        return icon and icon ~= 134400 and icon ~= "Interface\\Icons\\INV_Misc_QuestionMark"
    end

    if C_Item and C_Item.GetItemIconByID then
        local icon = C_Item.GetItemIconByID(itemID)
        if IsRealIcon(icon) then return icon end
    end

    if DVD.Gallery and DVD.Gallery.GetItemIcon then
        local itemData = DVD.ActiveItems and (DVD.ActiveItems[itemID] or DVD.ActiveItems[tostring(itemID)])
        local icon = DVD.Gallery.GetItemIcon(itemID, itemData)
        if IsRealIcon(icon) then return icon end
    end

    return "Interface\\Icons\\INV_Misc_QuestionMark"
end


local function SetupPopupButton(container, itemID)
    local btn = container.btn
    local borderFrame = container.borderFrame

    container.itemID = itemID
    btn.itemID = itemID
    btn.isCollected = (DVD.catalogReady and DVD.IsItemCollected and DVD.IsItemCollected(itemID)) or false

    borderFrame:SetBackdropBorderColor(btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, 1)
    if btn.isCollected and vendorSettings.showVendorCheckmarks then
        container.checkFrame:Show()
    else
        container.checkFrame:Hide()
    end

    container.icon:SetTexture(GetSafeItemIcon(itemID))
    btn:SetScript("OnEnter", PopupButton_OnEnter)
    btn:SetScript("OnLeave", PopupButton_OnLeave)
    btn:SetScript("OnClick", PopupButton_OnClick)
    container:Show()
end

local function GetIconsPerRow()
    local width = vendorPopup.content:GetWidth()
    if not width or width <= 1 then
        width = (vendorPopup:GetWidth() or VendorPopupSizing.FallbackPopupWidth or 300) - ((VendorPopupSizing.HorizontalInset or 8) * 2)
    end
    local iconsPerRow = math.floor((width + ICON_GAP) / (ICON_SIZE + ICON_GAP))
    return math.max(1, math.min(VendorPopupSizing.MaxColumns or 6, iconsPerRow))
end

local function LayoutPopupItems(items)
    local totalItems = #items
    local columns = GetIconsPerRow()
    if totalItems <= 0 then return end

    for i, itemID in ipairs(items) do
        local container = GetPopupIconFrame(i)
        container:ClearAllPoints()

        local row = math.floor((i - 1) / columns)
        local col = (i - 1) % columns
        local iconsThisRow = math.min(totalItems - (row * columns), columns)
        local rowWidth = (iconsThisRow * ICON_SIZE) + ((iconsThisRow - 1) * ICON_GAP)

        local x = math.floor(((vendorPopup.content:GetWidth() or VendorPopupSizing.FallbackContentWidth or 280) - rowWidth) / 2)
        local y = -row * (ICON_SIZE + ICON_GAP + (VendorPopupSizing.GridRowExtraGap or 4))

        container:SetPoint("TOPLEFT", vendorPopup.content, "TOPLEFT", x + col * (ICON_SIZE + ICON_GAP), y)
        SetupPopupButton(container, itemID)
    end
end

UpdateVendorPopup = function()
    for _, iconFrame in pairs(popupIconCache) do
        iconFrame:Hide()
    end

    local totalItems = #vendorFilteredItems
    local totalPages = math.max(1, math.ceil(totalItems / ICONS_PER_PAGE))
    if currentVendorPage > totalPages then currentVendorPage = totalPages end

    local itemsToShow = {}
    local startIndex = (currentVendorPage - 1) * ICONS_PER_PAGE + 1
    local endIndex = math.min(startIndex + ICONS_PER_PAGE - 1, totalItems)

    for i = startIndex, endIndex do
        table.insert(itemsToShow, vendorFilteredItems[i])
    end

    LayoutPopupItems(itemsToShow)

    if DVD.currentTab == "vendors" and totalPages > 1 then
        pagingFrame:Show()
        DVD.vendorPrevBtn:Show()
        DVD.vendorNextBtn:Show()
        DVD.vendorPageText:Show()
        DVD.vendorPageText:SetText(string.format("%d / %d", currentVendorPage, totalPages))
        DVD.vendorPrevBtn:SetEnabled(currentVendorPage > 1)
        DVD.vendorNextBtn:SetEnabled(currentVendorPage < totalPages)
    else
        pagingFrame:Hide()
        DVD.vendorPrevBtn:Hide()
        DVD.vendorNextBtn:Hide()
        DVD.vendorPageText:Hide()
    end
end

local function GetVendorInfoCompat(vendorID)
    vendorID = tonumber(vendorID)
    if not vendorID then return nil end
    if DVD.GetVendorInfo then
        local vendor = DVD.GetVendorInfo(vendorID)
        if vendor then
            vendor.id = vendor.id or vendorID
            return vendor
        end
    end
    local vendor = DVD.npcs and DVD.npcs[vendorID]
    if type(vendor) == "table" then
        vendor.id = vendor.id or vendorID
        return vendor
    end
    return nil
end

local function AddVendorItemIDsFromActiveItems(vendorID, addedItems, seenItems)
    vendorID = tonumber(vendorID)
    if not vendorID then return end
    for itemID, data in pairs(DVD.ActiveItems or {}) do
        if type(data) == "table" and type(data.soldBy) == "table" then
            if data.unreleased ~= true then
                for _, soldByID in ipairs(data.soldBy) do
                    if tonumber(soldByID) == vendorID then
                        if not seenItems[itemID] then
                            seenItems[itemID] = true
                            table.insert(addedItems, itemID)
                        end
                        break
                    end
                end
            end
        end
    end
end

local function LayoutVendorPreviewTitle(hasWaypointButton)
    if not DVD.modelTitle or not DVD.itemContainer then return end
    DVD.modelTitle:ClearAllPoints()
    DVD.modelTitle:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", VendorPopupSizing.PreviewTitleInset or 10, -(VendorPopupSizing.PreviewTitleInset or 10))

    if hasWaypointButton and DVD.vendorWaypointBtn then
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.vendorWaypointBtn, "TOPLEFT", -(VendorPopupSizing.PreviewTitleWaypointGap or 8), 0)
    else
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -(VendorPopupSizing.PreviewTitleInset or 10), -(VendorPopupSizing.PreviewTitleInset or 10))
    end
    DVD.modelTitle:SetHeight(VendorPopupSizing.PreviewTitleHeight or 24)
    DVD.modelTitle:SetJustifyH("CENTER")
end

local function GetVendorWaypointData(vendor)
    if DVD.ResolveVendorWaypoint then
        return DVD.ResolveVendorWaypoint(vendor)
    end
    return nil, "missing"
end

function DVD.ShowVendorPopup(vendorID, vendorName)
    if not vendorID then return end
    vendorID = tonumber(vendorID) or vendorID

    local vendor = GetVendorInfoCompat(vendorID)
    if not vendor then return end

    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]
    currentPopupVendorID = vendorID
    currentPopupNpcName = vendorName or currentPopupNpcName
    DVD.selectedVendor = vendor

    local addedItems = {}
    local seenItems = {}

    if vendorData and type(vendorData.items) == "table" then
        for _, itemID in ipairs(vendorData.items) do
            if type(itemID) == "number" and not seenItems[itemID] then
                local itemRecord = DVD.ActiveItems and DVD.ActiveItems[itemID]
                if not itemRecord or itemRecord.unreleased ~= true then
                    seenItems[itemID] = true
                    table.insert(addedItems, itemID)
                end
            end
        end
    elseif type(vendorData) == "table" then
        for _, itemID in ipairs(vendorData) do
            if type(itemID) == "number" and not seenItems[itemID] then
                local itemRecord = DVD.ActiveItems and DVD.ActiveItems[itemID]
                if not itemRecord or itemRecord.unreleased ~= true then
                    seenItems[itemID] = true
                    table.insert(addedItems, itemID)
                end
            end
        end
    end

    AddVendorItemIDsFromActiveItems(vendorID, addedItems, seenItems)
    table.sort(addedItems)

    vendorFilteredItems = addedItems
    currentVendorPage = 1

if DVD.vendorZoneText then
    DVD.vendorZoneText:SetText("")
    DVD.vendorZoneText:Hide()
end


    if not DVD.vendorWaypointBtn and DVD.itemContainer then
        DVD.vendorWaypointBtn = CreateFrame("Button", nil, DVD.itemContainer, "UIPanelButtonTemplate")
        DVD.vendorWaypointBtn:SetSize(76, 20)
        DVD.vendorWaypointBtn:SetText(DVD.L["WAYPOINT"])
    end

    local waypointBtn = DVD.vendorWaypointBtn
    if waypointBtn then
        waypointBtn:ClearAllPoints()
        waypointBtn:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -10, -10)

        local location = GetVendorWaypointData(vendor)
        local shouldShowWaypoint = vendorSettings and vendorSettings.showWaypointButton and location ~= nil

        if shouldShowWaypoint then
            waypointBtn:Show()
            waypointBtn:SetScript("OnClick", function()
                local loc = GetVendorWaypointData(vendor)
                if not loc then return end
                local mapID, x, y = tonumber(loc.mapID), tonumber(loc.x), tonumber(loc.y)
                if not mapID or not x or not y then return end

                local nx = x > 1 and x / 100 or x
                local ny = y > 1 and y / 100 or y
                local title = tostring(loc.title or vendor.title or vendor.name or "Decor Vendor")

                if TomTom and TomTom.AddWaypoint then
                    TomTom:AddWaypoint(mapID, nx, ny, { title = title, persistent = false, minimap = true, world = true })
                elseif C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                    local mapPoint = UiMapPoint.CreateFromCoordinates and UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                    if mapPoint then
                        C_Map.SetUserWaypoint(mapPoint)
                        if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                        end
                        if C_Map.OpenWorldMap then C_Map.OpenWorldMap(mapID) end
                    end
                end
            end)
        else
            waypointBtn:Hide()
            waypointBtn:SetScript("OnClick", nil)
        end

        LayoutVendorPreviewTitle(waypointBtn:IsShown())
    end

    UpdateVendorPopup()
    vendorPopup:Show()

    if C_HousingCatalog and C_HousingCatalog.RequestHousingMarketInfoRefresh then
        C_HousingCatalog.RequestHousingMarketInfoRefresh()
    end

    C_Timer.After(0.1, function()
        if vendorPopup:IsShown() then
            UpdateVendorPopup()
        end
    end)
end


--------------------------------------------------------------------------------
-- SECTION 4: PREVIEW PANEL HELPER FUNCTIONS & CATALOG LOOKUPS
--------------------------------------------------------------------------------
function DVD.ShowPreviewEmptyState(resetContent)
    if resetContent then
        if DVD.vendorPopup then DVD.vendorPopup:Hide() end
        if DVD.reagentsPopup then DVD.reagentsPopup:Hide() end
        if DVD.vendorNotes then DVD.vendorNotes:Hide() end
        if DVD.bossNotes then DVD.bossNotes:Hide() end
        if DVD.profNotes then DVD.profNotes:Hide() end
        if DVD.questNotes then DVD.questNotes:Hide() end
    end

    if DVD.modelScene then DVD.modelScene:Show() end
    if DVD.previewActor and DVD.previewActor.ClearModel then DVD.previewActor:ClearModel() end
    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end

    if DVD.modelTitle then
        DVD.modelTitle:SetText("|cffaaaaaa" .. DVD.L["NO_DECOR_SELECTED"] .. "|r")
        DVD.modelTitle:Show()
    end
end

function DVD.HidePreviewEmptyState()
    DVD.MarkPreviewContentShown()
end

function DVD.ShowPreviewTexture(texture, title)
    if DVD.modelScene then DVD.modelScene:Hide() end
    if DVD.texture then
        DVD.texture:SetTexture(texture)
        DVD.texture:Show()
    end
    if DVD.modelTitle then DVD.modelTitle:SetText(title or DVD.L["PREVIEW"]) end
end

function DVD.HidePreview()
    if DVD.modelScene then DVD.modelScene:Show() end
    if DVD.texture then DVD.texture:Hide() end
    if DVD.profNotes then DVD.profNotes:Hide() end
    if DVD.bossNotes then DVD.bossNotes:Hide() end
    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
end

local function GetCatalogInfoForDecor(decorID)
    if not decorID or not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end
    local entryType = Enum and Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1
    local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, entryType, decorID, true)
    if ok and type(info) == "table" then return info end
    return nil
end

local function BuildModelToItemLookup()
    DVD._modelToItemLookup = DVD._modelToItemLookup or {}
    if next(DVD._modelToItemLookup) then return end

    for itemID, itemData in pairs(DVD.ActiveItems or {}) do
        local model = itemData.model3D or itemData.asset
        if model then
            DVD._modelToItemLookup[model] = { itemID = itemID, data = itemData }
        end
    end
end

local function GetItemDataFromModel(modelFileID)
    BuildModelToItemLookup()
    local match = DVD._modelToItemLookup and DVD._modelToItemLookup[modelFileID]
    if match then return match.itemID, match.data end
    return nil, nil
end

function DVD.MarkPreviewContentShown()
    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(false) end
    if DVD.modelScene then DVD.modelScene:Show() end
    if DVD.modelTitle then DVD.modelTitle:Show() end
end

function DVD.ShowPreviewModel(modelFileID, title, itemData)
    if not modelFileID and not itemData then return false end
    itemData = itemData or {}

    -- NEW, from Gallery: never try a skipped model.
    if itemData.skip3DPreview then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    if not itemData.decorID and modelFileID then
        local _, foundData = GetItemDataFromModel(modelFileID)
        if foundData then itemData = foundData end
        -- Re-check after the lookup, in case the
        -- found record is the skipped one.
        if itemData.skip3DPreview then
            if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
            return false
        end
    end

    local catalogInfo = GetCatalogInfoForDecor(itemData.decorID)
    local asset = (catalogInfo and catalogInfo.asset) or itemData.asset or itemData.model3D or modelFileID
    local sceneID = (catalogInfo and catalogInfo.uiModelSceneID) or itemData.uiModelSceneID or DEFAULT_SCENE_ID

    if not asset or asset == 0 then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    DVD.MarkPreviewContentShown()
    if DVD.texture then DVD.texture:Hide() end
    if DVD.modelScene then DVD.modelScene:Show() end

    local ok, shown = pcall(function()
        return DVD.ShowModel(DVD.modelScene, nil, nil, sceneID) -- handled inside ShowModel
    end)

    if not ok then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        if DVD.modelScene then DVD.modelScene:Hide() end
        return false
    end

    -- Explicitly call ShowModel with the correct parameters
    return DVD.ShowModel(DVD.modelScene, asset, nil, sceneID)
end

function DVD.ShowPreviewCreature(displayID, title)
    if not displayID then return false end
    DVD.MarkPreviewContentShown()
    if DVD.texture then DVD.texture:Hide() end

    local shown = DVD.ShowModel(DVD.modelScene, nil, displayID, DEFAULT_SCENE_ID)
    if DVD.modelTitle then DVD.modelTitle:SetText(title or DVD.L["PREVIEW"]) end
    return shown
end

function DVD.ShowModel(scene, modelID, displayID, sceneID)
    if not scene then return false end
	
	
    scene:Show()

    if scene.ClearScene then scene:ClearScene() end
    pcall(function()
        scene:TransitionToModelSceneID(sceneID or DEFAULT_SCENE_ID, CAMERA_IMMEDIATE, CAMERA_DISCARD, true)
    end)

    local actor = scene:GetActorByTag("decor") or scene:GetActorByTag("item")
    if not actor and scene.CreateActor then
        actor = scene:CreateActor()
        if actor and actor.SetTag then actor:SetTag("decor") end
    end

    if not actor then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    DVD.previewActor = actor
    if actor.SetPreferModelCollisionBounds then actor:SetPreferModelCollisionBounds(true) end

    if displayID then
        actor:SetModelByCreatureDisplayID(displayID)
    elseif modelID then
        actor:SetModelByFileID(modelID)
    else
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    if actor.SetYaw then actor:SetYaw(0) end
    if actor.SetPitch then actor:SetPitch(0) end

    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(false) end
    if DVD.modelControls then DVD.modelControls:Show() end

    return true
end

-- Initialize Empty State & Update Sizing
DVD.ShowPreviewEmptyState(true)

C_Timer.After(0, function()
    if DVD.frame and not DVD._previewResetOnShow then
        DVD.frame:HookScript("OnShow", function()
            C_Timer.After(0, function()
                if DVD.ShowPreviewEmptyState then DVD.ShowPreviewEmptyState(true) end
            end)
        end)
        DVD._previewResetOnShow = true
    end

    if DVD.UpdatePreviewSize then
        DVD.UpdatePreviewSize()
    end
end)
end)(...);

-- ------------------------------------------------------------
-- SECTION: UI/ListFrame.lua
-- ------------------------------------------------------------
(function(...)
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
emptyText:SetText(DVD.L["SELECT_A_CATEGORY"])
emptyText:SetTextColor(0.75, 0.75, 0.75, 0.8)
emptyText:Hide()
end)(...);
