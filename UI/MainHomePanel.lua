-- ============================================================
-- Decor Vendor
-- UI/MainHomePanel.lua
-- Main dashboard/home screen for the normal addon frame
-- ============================================================

local addonName, DVD = ...

local CARD_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
}

function DVD:CreateMainHomePanel(parent)
    if parent.homePanel then
        return parent.homePanel
    end

    local panel = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    panel:SetPoint("TOPLEFT", parent, "TOPLEFT", 18, -46)
    panel:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -18, 52)
    panel:SetFrameLevel(parent:GetFrameLevel() + 80)
    panel:SetBackdrop(CARD_BACKDROP)
    panel:SetBackdropColor(0.02, 0.018, 0.035, 1)
    panel:SetBackdropBorderColor(0.42, 0.26, 0.70, 1)

    parent.homePanel = panel

    -------------------------------------------------
    -- Header
    -------------------------------------------------

    local header = CreateFrame("Frame", nil, panel, "BackdropTemplate")
    header:SetHeight(58)
    header:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    header:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -10, -10)
    header:SetBackdrop(CARD_BACKDROP)
    header:SetBackdropColor(0.09, 0.08, 0.14, 0.95)
    header:SetBackdropBorderColor(0.35, 0.25, 0.65, 1)

    local title = header:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("LEFT", header, "LEFT", 18, 0)
    title:SetText("|cffffd100Decor Vendor|r")

    local subtitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("RIGHT", header, "RIGHT", -18, 0)
    subtitle:SetText("Choose a section to explore decor sources, tracking, and previews.")

    -------------------------------------------------
    -- Open section helper (FIXED FOR STATISTICS)
    -------------------------------------------------
    local function OpenSection(sectionKey)
        -- 🚀 THE VISIBILITY OVERRIDE:
        if sectionKey == "statistics" then
            if DVD.StatsPanel then
                panel:Hide() -- Hides the landing grid tiles completely!
                if DVD.sidebar then DVD.sidebar:Hide() end -- Ensure sidebar doesn't bleed through
                DVD.StatsPanel:Show() -- Triggers our progress tracking engine to load
            else
                print("|cffff5555Decor Vendor:|r StatsPanel loader is missing. Ensure StatsPanel.lua is registered.")
            end
            return
        end

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
    local cards = {
        {
            key = "vendors",
            title = "Vendors",
            color = {0.35, 0.75, 1.00},
            desc = "Browse original decor vendors, waypoint support, and vendor locations.",
            showCount = true,
        },
        {
            key = "professions",
            title = "Professions",
            color = {0.55, 1.00, 0.70},
            desc = "View crafted decor, recipes, materials, and profession requirements.",
            showCount = true,
        },
        {
            key = "quests",
            title = "Quests",
            color = {1.00, 0.82, 0.10},
            desc = "Track decor earned from quests and quest-related unlocks.",
            showCount = true,
        },
        {
            key = "achievements",
            title = "Achievements",
            color = {0.75, 0.45, 1.00},
            desc = "Find decor tied to achievements and collection progress.",
            showCount = true,
        },
        {
            key = "bossdrops",
            title = "Boss Drops",
            color = {1.00, 0.45, 0.45},
            desc = "Browse decor from bosses, rares, treasures, events, and drops.",
            showCount = true,
        },
        {
            key = "gallery",
            title = "Gallery Browser",
            color = {1.00, 0.35, 0.85},
            desc = "Preview decor in 3D, compare sources, and browse the full collection.",
        },
        {
            key = "statistics",
            title = "Collection Statistics",
            color = {0.20, 1.00, 0.50},
            desc = "Review your progress milestones, account completion metrics, and graphs.",
        },
    }

    local cardWidth = 300
    local cardHeight = 112
    local gapX = 14
    local gapY = 18
    local startY = -110

    local cardFrames = {}

    for i, info in ipairs(cards) do
        local card = CreateFrame("Button", nil, panel, "BackdropTemplate")
        card:SetSize(cardWidth, cardHeight)
        table.insert(cardFrames, card)
        card:SetBackdrop(CARD_BACKDROP)
        card:SetBackdropColor(0.10, 0.10, 0.16, 0.94)
        card:SetBackdropBorderColor(0.30, 0.22, 0.55, 1)

        local strip = card:CreateTexture(nil, "ARTWORK")
        strip:SetHeight(3)
        strip:SetPoint("TOPLEFT", card, "TOPLEFT", 0, 0)
        strip:SetPoint("TOPRIGHT", card, "TOPRIGHT", 0, 0)
        strip:SetColorTexture(info.color[1], info.color[2], info.color[3], 1)

        local cardTitle = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        cardTitle:SetPoint("TOPLEFT", card, "TOPLEFT", 12, -14)
        cardTitle:SetText(info.title)
        cardTitle:SetTextColor(info.color[1], info.color[2], info.color[3], 1)
        
        card.info = info

        if info.showCount then
            local countText = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            countText:SetPoint("TOPRIGHT", card, "TOPRIGHT", -12, -14)
            countText:SetTextColor(info.color[1], info.color[2], info.color[3], 1)
            countText:SetText("")
            card.countText = countText
        end

        local desc = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        desc:SetPoint("TOPLEFT", cardTitle, "BOTTOMLEFT", 0, -8)
        desc:SetPoint("RIGHT", card, "RIGHT", -12, 0)
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
                local count
                local label

                if info.key == "vendors" then
                    count = CountVendorNPCs()
                    label = "NPCs"
                else
                    count = CountHomeDecor(info.key)
                    label = "decor"
                end
                card.countText:SetText(tostring(count) .. " " .. label)
            end
        end
    end

    panel.RefreshCounts = RefreshHomeCardCounts

    panel:HookScript("OnShow", function()
        RefreshHomeCardCounts()

        if C_Timer and C_Timer.After then
            C_Timer.After(0.25, function()
                if panel and panel:IsShown() then
                    RefreshHomeCardCounts()
                end
            end)
        end
    end)

    RefreshHomeCardCounts()
    
    local function LayoutHomeCards()
        local columns = 3
        local panelWidth = panel:GetWidth()

        if not panelWidth or panelWidth <= 0 then
            return
        end

        local totalCardsWidth = (cardWidth * columns) + (gapX * (columns - 1))
        local startX = math.floor((panelWidth - totalCardsWidth) / 2)

        if startX < 10 then
            startX = 10
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
    footerLine1:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    footerLine1:SetPoint("BOTTOM", panel, "BOTTOM", 0, 46)
    footerLine1:SetText("|cffffd100Tip:|r |cfff5ebd1Choose a section above. Use the Home button to return here anytime.|r")
    footerLine1:SetJustifyH("CENTER")

    local footerLine2 = panel:CreateFontString(nil, "OVERLAY")
    footerLine2:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE") 
    footerLine2:SetPoint("TOP", footerLine1, "BOTTOM", 0, -4)
    footerLine2:SetText("|cffde9b6bNote: Stats Panel and first load of  Gallery can take  roughly 1 minute to update|r")
    footerLine2:SetJustifyH("CENTER")

    local footerLine3 = panel:CreateFontString(nil, "OVERLAY")
    footerLine3:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
    footerLine3:SetPoint("TOP", footerLine2, "BOTTOM", 0, -4)
    footerLine3:SetText("|cffff4040Currently adding Patch 12.1 decor|r")
    footerLine3:SetJustifyH("CENTER")
end

function DVD.ShowMainHomePanel()
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

    if DVD.contentArea then
        DVD.contentArea:Hide()
    end

    if DVD.StatsPanel then
        DVD.StatsPanel:Hide()
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
        frame.homePanel:SetFrameLevel(frame:GetFrameLevel() + 200)

        if frame.homePanel.RefreshCounts then
            frame.homePanel:RefreshCounts()
        end
    end
end