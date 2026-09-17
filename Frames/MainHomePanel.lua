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
    panel:SetBackdropBorderColor(0.42, 0.26, 0.70, 1)
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
    header:SetBackdropBorderColor(0.35, 0.25, 0.65, 1)

    local title = header:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("LEFT", header, "LEFT", Sizing.HeaderTextInset, 0)
    title:SetText("|cffffd100Decor Vendor|r")

    local subtitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("RIGHT", header, "RIGHT", -Sizing.HeaderRightReserve, 0)
    subtitle:SetText("Choose a section to explore decor sources, tracking, and previews.")

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

for _, section in ipairs(MAIN_SECTIONS) do
    cards[#cards + 1] = {
        key = section.id,
        title = section.text,
        color = section.homeColor,
        desc = section.homeDescription,
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
        card:SetBackdropBorderColor(0.30, 0.22, 0.55, 1)

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
            self:SetBackdropBorderColor(0.30, 0.22, 0.55, 1)
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
                    card.countText:SetText(npcCount .. " NPCs  |  " .. decorCount .. " decor")
                else
                    -- Standard processing for all other cards
                    local count = CountHomeDecor(info.key)
                    card.countText:SetText(tostring(count) .. " decor")
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
footerLine1:SetText("|cffffd100Tip:|r |cfff5ebd1Choose a section above. Use the Home button to return here anytime or switch using the bottom tabs.|r")
footerLine1:SetJustifyH("CENTER")

local footerLine2 = panel:CreateFontString(nil, "OVERLAY")
footerLine2:SetFont(STANDARD_TEXT_FONT, Sizing.FooterLine2FontSize, "OUTLINE")
footerLine2:SetPoint("TOP", footerLine1, "BOTTOM", 0, -Sizing.FooterLine2Gap)
footerLine2:SetText("|cffde9b6bNote: The first load of  Gallery can take  roughly 1 minute to update|r")
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