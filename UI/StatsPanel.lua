--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...
local C = DVD.CONSTANTS or DVD.C

if DVD.StatsPanel then
    DVD.StatsPanel:Hide()
    DVD.StatsPanel = nil
end

DVD.StatsPanel = CreateFrame("Frame", "DecorVendorStatsPanel", DVD.frame or UIParent, "BackdropTemplate")
DVD.StatsPanel:SetPoint("TOPLEFT", DVD.frame, "TOPLEFT", 18, -46)
DVD.StatsPanel:SetPoint("BOTTOMRIGHT", DVD.frame, "BOTTOMRIGHT", -18, 52)
DVD.StatsPanel:SetFrameLevel((DVD.frame:GetFrameLevel() or 0) + 250)
DVD.StatsPanel:Hide()

DVD.StatsPanel:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
})
DVD.StatsPanel:SetBackdropColor(0.04, 0.03, 0.08, 1)
DVD.StatsPanel:SetBackdropBorderColor(0.35, 0.25, 0.65, 0.8)

-- ============================================================
-- 📊 DATA COMPUTATION ENGINE (ALIGNED WITH SYSTEM FILTERS)
-- ============================================================
local function ComputeRealTimeStats()
    local stats = {
        total = 0, collected = 0, missing = 0,
        byCategory = {
            ["vendor"]      = { total = 0, collected = 0, label = "Vendors", color = "|cff30d580" },
            ["profession"]  = { total = 0, collected = 0, label = "Professions", color = "|cffbfa0ff" },
            ["quest"]       = { total = 0, collected = 0, label = "Quests", color = "|cffffd100" },
            ["achievement"] = { total = 0, collected = 0, label = "Achievements", color = "|cff00fbff" },
            ["drop"]        = { total = 0, collected = 0, label = "Drops", color = "|cffff6b6b" },
            ["promo"]       = { total = 0, collected = 0, label = "Promo", color = "|cffffee55" },
            ["shop"]        = { total = 0, collected = 0, label = "Shop", color = "|cffff4040" }
        },
        byExpansion = {
            ["Classic"]                 = { total = 0, collected = 0 },
            ["Mists of Pandaria"]       = { total = 0, collected = 0 },
            ["Warlords of Draenor"]     = { total = 0, collected = 0 },
            ["Legion"]                  = { total = 0, collected = 0 },
            ["Battle for Azeroth"]      = { total = 0, collected = 0 },
            ["Shadowlands"]             = { total = 0, collected = 0 },
            ["Dragonflight"]            = { total = 0, collected = 0 },
            ["The War Within"]          = { total = 0, collected = 0 },
            ["Midnight"]                = { total = 0, collected = 0 }
        }
    }

    local activeItems = DVD.ActiveItems
    if not activeItems then return stats end

    -- Safe initial compile of your achievement list keys map
    local achievementMap = {}
    if DVD.achievements then
        for _, group in ipairs(DVD.achievements) do
            for _, item in ipairs(group.achievements or group.items or {}) do
                if item.itemID then achievementMap[item.itemID] = true end
            end
        end
    end

    if activeItems then
        for itemID, itemData in pairs(activeItems) do
            if type(itemID) == "number" and type(itemData) == "table" then
                stats.total = stats.total + 1

                local rawSource = tostring(itemData.source or "vendor"):lower()
                
                -- Check for plural promo variations inside arrays
                local hasPromoTag = false
                if itemData.sources and type(itemData.sources) == "table" then
                    for _, srcVal in ipairs(itemData.sources) do
                        if tostring(srcVal):lower() == "promo" then hasPromoTag = true end
                    end
                end

                -- Force fallback sorting routes matching your filter priorities
                local finalCat = "vendor"

                -- 🚀 THE INTERCEPT ROUTER FIX:
                -- Check your custom achievement checklist first before generic source strings can override them!
                if achievementMap[itemID] then
                    finalCat = "achievement"
                elseif rawSource == "shop" then
                    finalCat = "shop"
                elseif hasPromoTag or rawSource == "promo" or itemData.promotionType then
                    finalCat = "promo"
                elseif itemData.spell or itemData.reagents or rawSource == "profession" then
                    finalCat = "profession"
                elseif rawSource == "quest" then
                    finalCat = "quest"
                elseif rawSource == "boss" or rawSource == "treasure" or rawSource == "rare" or rawSource == "drop" then
                    finalCat = "drop"
                end

                stats.byCategory[finalCat].total = stats.byCategory[finalCat].total + 1

                -- Process active expansion tracking pools
                local exp = itemData.expansion or "Classic"
                if stats.byExpansion[exp] then
                    stats.byExpansion[exp].total = stats.byExpansion[exp].total + 1
                end

                -- Verify live operational character metrics lookups
                local isCollected = false
                if DVD.IsItemCollected then
                    isCollected = DVD.IsItemCollected(itemID)
                elseif vendorSettings and vendorSettings.visited then
                    isCollected = vendorSettings.visited[itemID] or false
                end

                if isCollected then
                    stats.collected = stats.collected + 1
                    stats.byCategory[finalCat].collected = stats.byCategory[finalCat].collected + 1
                    if stats.byExpansion[exp] then
                        stats.byExpansion[exp].collected = stats.byExpansion[exp].collected + 1
                    end
                else
                    stats.missing = stats.missing + 1
                end
            end
        end
    end

    return stats
end

-- ============================================================
-- 🎨 GRAPHICS MATRIX CARD BUILDER
-- ============================================================
local function CreateMetricCard(parent, titleText, width, height, anchorX, anchorY)
    local card = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    card:SetSize(width, height)
    card:SetPoint("TOPLEFT", parent, "TOPLEFT", anchorX, anchorY)
    card:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    })
    card:SetBackdropColor(0.09, 0.08, 0.14, 0.85)
    card:SetBackdropBorderColor(0.20, 0.16, 0.32, 0.6)

    card.title = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    card.title:SetFont(STANDARD_TEXT_FONT, 11, "")
    card.title:SetPoint("TOPLEFT", card, "TOPLEFT", 12, -10)
    card.title:SetTextColor(0.65, 0.60, 0.75)
    card.title:SetText(titleText)

    return card
end

-- ============================================================
-- 🛠️ ASSEMBLE DASHBOARD GRID
-- ============================================================

-- Card 1: Top Left Global Summary Card
local globalCard = CreateMetricCard(DVD.StatsPanel, "TOTAL ADDON COMPLETION", 300, 110, 20, -20)
local grandValue = globalCard:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
grandValue:SetFont(STANDARD_TEXT_FONT, 28, "OUTLINE")
grandValue:SetPoint("TOPLEFT", globalCard, "TOPLEFT", 16, -34)
grandValue:SetTextColor(1, 0.82, 0)

local progressSubtext = globalCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
progressSubtext:SetPoint("TOPLEFT", grandValue, "BOTTOMLEFT", 0, -4)
progressSubtext:SetTextColor(0.5, 0.8, 0.5)

-- Card 2: Top Right Categorical Breakdown Row Grid
local breakdownCard = CreateMetricCard(DVD.StatsPanel, "COLLECTIONS BY CATEGORY", 605, 110, 335, -20)
local categoryFontstrings = {}

local layoutIndex = 0
local sortedKeys = { "vendor", "profession", "quest", "achievement", "drop", "promo", "shop" }

for _, catKey in ipairs(sortedKeys) do
    local container = CreateFrame("Frame", nil, breakdownCard, "BackdropTemplate")
    container:SetSize(78, 64)
    container:SetPoint("TOPLEFT", breakdownCard, "TOPLEFT", 14 + (layoutIndex * 83), -34)
    container:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="Interface\\Buttons\\WHITE8X8", edgeSize=1})
    container:SetBackdropColor(0.06, 0.05, 0.10, 0.6)
    container:SetBackdropBorderColor(0.18, 0.15, 0.28, 0.4)

    local lbl = container:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lbl:SetFont(STANDARD_TEXT_FONT, 9, "")
    lbl:SetPoint("TOP", container, "TOP", 0, -8)
    lbl:SetTextColor(0.6, 0.55, 0.68)

    local val = container:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    val:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    val:SetPoint("BOTTOM", container, "BOTTOM", 0, 10)
    
    categoryFontstrings[catKey] = { val = val, lbl = lbl }
    layoutIndex = layoutIndex + 1
end

-- Card 3: Bottom Left - Expansion Progress Row List
local expCard = CreateMetricCard(DVD.StatsPanel, "EXPANSION COMPLETION PROGRESS", 440, 260, 20, -145)
local expFontstrings = {}

local expKeys = { 
    "Classic", "Mists of Pandaria", "Warlords of Draenor", "Legion", 
    "Battle for Azeroth", "Shadowlands", "Dragonflight", "The War Within", "Midnight" 
}

for i, expName in ipairs(expKeys) do
    local fs = expCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    fs:SetFont(STANDARD_TEXT_FONT, 11, "")
    fs:SetPoint("TOPLEFT", expCard, "TOPLEFT", 24, -14 - (i * 24))
    fs:SetJustifyH("LEFT")
    expFontstrings[expName] = fs
end

-- Card 4: Bottom Right - Account Profile Analytics Breakdown Panel
local analyticsCard = CreateMetricCard(DVD.StatsPanel, "ACCOUNT COLLECTION METRICS", 465, 260, 475, -145)
local analyticsText = analyticsCard:CreateFontString(nil, "OVERLAY", "GameFontNormal")
analyticsText:SetFont(STANDARD_TEXT_FONT, 13, "")
analyticsText:SetPoint("TOPLEFT", analyticsCard, "TOPLEFT", 24, -40)
analyticsText:SetJustifyH("LEFT")

-- ============================================================
-- 🔄 RUN-TIME DATA DISPATCH ENGINE
-- ============================================================
DVD.StatsPanel:SetScript("OnShow", function()
    local data = ComputeRealTimeStats()

    -- 1. Populate Core Summary Card
    local percent = data.total > 0 and (data.collected / data.total) * 100 or 0
    grandValue:SetText(string.format("%d / %d", data.collected, data.total))
    progressSubtext:SetText(string.format("Addon Completion: %d%% Finished", percent))

    -- 2. Populate Source Badges Grid Loop
    for catKey, targets in pairs(categoryFontstrings) do
        local catData = data.byCategory[catKey]
        if catData then
            targets.lbl:SetText(catData.label)
            local catPercent = catData.total > 0 and (catData.collected / catData.total) * 100 or 0
            targets.val:SetText(string.format("%s%d/%d|r\n|cffaaaaaa%d%%|r", catData.color, catData.collected, catData.total, catPercent))
        end
    end

    -- 3. Populate Expansion Progress Rows
    for expName, fs in pairs(expFontstrings) do
        local expData = data.byExpansion[expName]
        if expData then
            local expPercent = expData.total > 0 and (expData.collected / expData.total) * 100 or 0
            local statusColor = expPercent == 100 and "|cff30d580Complete|r" or "|cffffd100In Progress|r"
            fs:SetText(string.format("|cffffffff%s|r:  %d / %d  (|cffaaaaaa%d%%|r)  —  %s", expName, expData.collected, expData.total, expPercent, statusColor))
        end
    end

    -- 4. Clean Account Metrics Presentation
    local accountInfo = "|cffbfa0ffAddon Database Profile Summary:|r\n\n"
    accountInfo = accountInfo .. string.format("• Collected Decor Items:  |cff30d580%d|r\n\n", data.collected)
    accountInfo = accountInfo .. string.format("• Remaining Locked Decor:  |cffff4040%d|r\n\n", data.missing)
    accountInfo = accountInfo .. string.format("• Total Registered Items:  |cff00fbff%d|r\n\n", data.total)
    
    local milestoneText = "|cffffd100Bronze Completion|r"
    if percent >= 100 then milestoneText = "|cff30d580Flawless Diamond Complete!|r"
    elseif percent >= 75 then milestoneText = "|cff00fbffPlatinum Tier Champion|r"
    elseif percent >= 50 then milestoneText = "|cffffd100Gold Tier Collector|r"
    elseif percent >= 25 then milestoneText = "|cffbfa0ffSilver Tier Collector|r" end
    
    accountInfo = accountInfo .. "• Account Milestone: " .. milestoneText
    analyticsText:SetText(accountInfo)
end)