--[[
============================================================
Decor Vendor Addon — Filters Module
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...



DVD.filters = DVD.filters or {}
DVD.collapsedFilters = DVD.collapsedFilters or {}
DVD.collapsedFilterSections = DVD.collapsedFilterSections or {}

-- Establish local aliases mapping straight to the database tables
local masterActiveItems = DVD and DVD.ActiveItems or DVD.ActiveItems or {}
local masterNpcs = DVD and DVD.npcs or DVD.npcs or {}

-------------------------------------------------
-- Filter Defaults (Normalized to avoid table drops)
-------------------------------------------------

DVD.filters.vendors = DVD.filters.vendors or {
    expansions = {},
    factions = {},
    recipes = {},
    categories = {
        none = false,
        reputation = false,
        renown = false,
        subfaction = false,
        friendship = false,
        recipe = false,
        race = false,
        neighborhood = false,
        Promo = false,
    },
}

DVD.filters.quests = DVD.filters.quests or {
    expansions = {},
    categories = {},
    factions = {},
}

DVD.filters.bossdrops = DVD.filters.bossdrops or {
    expansions = {},
    categories = {},
}

DVD.filters.professions = DVD.filters.professions or {
    professions = {},
    expansions = {},
}

DVD.filters.achievements = DVD.filters.achievements or {
    groups = {},
    factions = {},
}

DVD.filters.requirements = DVD.filters.requirements or {
    types = {},
    showLocked = true,
    showUnlocked = true,
}

-------------------------------------------------
-- Shared Helpers
-------------------------------------------------

local function GetCatalogSizing()
    local C = DVD.C or {}
    return C.CatalogSizing or {}
end

local function GetSidebarWidth()
    local CatSizing = GetCatalogSizing()
    return CatSizing.SidebarWidth or 200
end

local function RefreshFromSidebar()
    DVD.filtersJustChanged = true

    if DVD.scrollFrame then
        DVD.scrollFrame:SetVerticalScroll(0)
    end

    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end
end

local function ClearFrameChildren(frame)
    if not frame then return end
    for _, child in ipairs({ frame:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
end

local function AnySelected(tbl)
    if not tbl then return false end
    for _, selected in pairs(tbl) do
        if selected then return true end
    end
    return false
end

local function SortedKeys(tbl)
    local keys = {}
    for key in pairs(tbl or {}) do
        table.insert(keys, key)
    end
    table.sort(keys)
    return keys
end

local function OrderedFactionList(seen)
    local order = { "alliance", "horde", "neutral" }
    local result = {}

    for _, faction in ipairs(order) do
        if seen[faction] then table.insert(result, faction) end
    end

    for _, faction in ipairs(SortedKeys(seen)) do
        if faction ~= "alliance" and faction ~= "horde" and faction ~= "neutral" then
            table.insert(result, faction)
        end
    end

    return result
end

local function GetFactionColor(faction)
    faction = faction and string.lower(faction)
    if faction == "alliance" then return { 0.35, 0.65, 1.0, 1 }
    elseif faction == "horde" then return { 1.0, 0.25, 0.25, 1 }
    elseif faction == "neutral" then return { 0.20, 1.0, 0.35, 1 }
    end
    return nil
end

local function FormatFactionLabel(faction)
    faction = tostring(faction or "")
    local labels = { alliance = "Alliance", horde = "Horde", neutral = "Neutral" }
    return labels[string.lower(faction)] or faction:gsub("^%l", string.upper)
end

local function ColorLabel(label, colorTable, key)
    if DVD.ColorizeLabel then return DVD.ColorizeLabel(label, colorTable, key) end
    return tostring(label or "Unknown")
end

local function ColorizeExpansionName(expansionName)
    expansionName = expansionName or "Unknown"
    local hex = DVD.ExpansionColors and (DVD.ExpansionColors[expansionName] or DVD.ExpansionColors.Unknown) or "888888"
    return "|cff" .. hex .. tostring(expansionName) .. "|r"
end

-------------------------------------------------
-- Compatibility Requirements Matcher
-------------------------------------------------

function DVD.ItemPassesRequirements(itemID)
    local data = masterActiveItems[itemID] or (DVD.decorItem and DVD.decorItem[itemID])
    if not data then return true end

    local tab = DVD.currentTab or "vendors"
    local filters = DVD.filters and DVD.filters[tab]
    if not filters then return true end

    local expansions = filters.expansions
    -- Normalize fallback to handle faction key naming mismatches cleanly
    local factions = filters.factions or filters.faction

    if expansions and AnySelected(expansions) and data.expansion then
        if not expansions[data.expansion] then return false end
    end

    if factions and AnySelected(factions) and data.faction then
        if not factions[string.lower(data.faction)] then return false end
    end

    return true
end

-------------------------------------------------
-- Sidebar Container Reset
-------------------------------------------------

function DVD.ResetSidebarFilters()
    local sidebar = DVD.sidebar
    if not sidebar then return end

    local sidebarWidth = GetSidebarWidth()

    DVD.sidebarFilters = DVD.sidebarFilters or sidebar.filtersContainer or sidebar.filterContent
    if not DVD.sidebarFilters then
        DVD.sidebarFilters = CreateFrame("Frame", "DV_SidebarFilters", sidebar)
        sidebar.filterContent = DVD.sidebarFilters
        sidebar.filtersContainer = DVD.sidebarFilters
    end

    ClearFrameChildren(DVD.sidebarFilters)

    DVD.sidebarFilters:ClearAllPoints()
    DVD.sidebarFilters:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 8, -8)
    DVD.sidebarFilters:SetPoint("TOPRIGHT", sidebar, "TOPRIGHT", -6, -8)
    DVD.sidebarFilters:SetPoint("BOTTOMRIGHT", sidebar, "BOTTOMRIGHT", -6, 12)
    DVD.sidebarFilters:SetWidth(sidebarWidth - 14)

    if DVD.sidebarFilters.SetClipsChildren then
        DVD.sidebarFilters:SetClipsChildren(true)
    end
    DVD.sidebarFilters:Show()
end

-------------------------------------------------
-- Gallery-style Sidebar Widgets
-------------------------------------------------

local function IsSectionCollapsed(sectionKey, defaultCollapsed)
    if DVD.collapsedFilterSections[sectionKey] == nil then
        DVD.collapsedFilterSections[sectionKey] = defaultCollapsed == true
    end
    return DVD.collapsedFilterSections[sectionKey]
end

local function CreateSectionHeader(parent, sectionKey, title, yOffset, defaultCollapsed)
    local collapsed = IsSectionCollapsed(sectionKey, defaultCollapsed)

    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, yOffset)
    header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -2, yOffset)
    header:SetHeight(20)

    header.bg = header:CreateTexture(nil, "BACKGROUND")
    header.bg:SetAllPoints()
    header.bg:SetColorTexture(0, 0, 0, 0)

    header.text = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.text:SetPoint("LEFT", header, "LEFT", 0, 0)
    header.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    header.text:SetText("|cffffd100" .. title .. "|r")

    header.arrow = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.arrow:SetPoint("RIGHT", header, "RIGHT", -2, 0)
    header.arrow:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    header.arrow:SetText(collapsed and "|cffffd100+|r" or "|cffffd100-|r")

    header.line = header:CreateTexture(nil, "ARTWORK")
    header.line:SetColorTexture(1, 0.82, 0, 0.45)
    header.line:SetHeight(1)
    header.line:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 0, -2)
    header.line:SetPoint("BOTTOMRIGHT", header, "BOTTOMRIGHT", 0, -2)

    header:SetScript("OnEnter", function(self)
        self.bg:SetColorTexture(1, 0.82, 0, 0.08)
        self.text:SetText("|cffffffff" .. title .. "|r")
    end)

    header:SetScript("OnLeave", function(self)
        self.bg:SetColorTexture(0, 0, 0, 0)
        self.text:SetText("|cffffd100" .. title .. "|r")
    end)

    header:SetScript("OnClick", function()
        DVD.collapsedFilterSections[sectionKey] = not DVD.collapsedFilterSections[sectionKey]
        if DVD.BuildCurrentSidebarFilters then DVD.BuildCurrentSidebarFilters() end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)

    return yOffset - 26, collapsed
end

local function CreateSidebarCheckbox(parent, yOffset, labelText, checked, onClick, color)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check:SetSize(20, 20)
    check:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, yOffset + 4)
    check:SetChecked(checked and true or false)

    if check.Text then check.Text:SetText("") end
    if check.text then check.text:SetText("") end

    check.label = check:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    check.label:SetPoint("LEFT", check, "RIGHT", 2, 0)
    check.label:SetWidth(GetSidebarWidth() - 42)
    check.label:SetJustifyH("LEFT")
    check.label:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
    check.label:SetText(labelText)

    if color then check.label:SetTextColor(color[1], color[2], color[3], color[4] or 1)
    else check.label:SetTextColor(0.84, 0.84, 0.84, 1) end

    check:SetScript("OnClick", function(self)
        if onClick then onClick(self:GetChecked() and true or false) end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)

    return yOffset - 18, check
end

local function AddSection(parent, contextKey, sectionKey, title, yOffset, options, selectedTable, defaultCollapsed)
    local fullKey = contextKey .. "." .. sectionKey
    local collapsed
    yOffset, collapsed = CreateSectionHeader(parent, fullKey, title, yOffset, defaultCollapsed)

    if collapsed then return yOffset - 4 end
    selectedTable = selectedTable or {}

    for _, option in ipairs(options or {}) do
        local key = option.key
        local checked = selectedTable[key] == true

        yOffset = CreateSidebarCheckbox(parent, yOffset, option.label or tostring(key), checked, function(isChecked)
            selectedTable[key] = isChecked and true or false
            RefreshFromSidebar()
        end, option.color)
    end

    return yOffset - 8
end

-------------------------------------------------
-- Option Builders
-------------------------------------------------

-- 🌟 LOCALIZED MASTER BUILDER (Guards against global scope crashes)
local function GetExpansionOptionsFromSeen(seen)
    local options = {}
    for _, expansion in ipairs(DVD.EXPANSION_ORDER or {}) do
        if seen[expansion] then
            table.insert(options, { key = expansion, label = ColorizeExpansionName(expansion) })
        end
    end
    for _, expansion in ipairs(SortedKeys(seen)) do
        local alreadyAdded = false
        for _, option in ipairs(options) do
            if option.key == expansion then alreadyAdded = true; break end
        end
        if not alreadyAdded then
            table.insert(options, { key = expansion, label = ColorizeExpansionName(expansion) })
        end
    end
    return options
end

local function GetExpansionOptionsFromGroups(groups)
    local seen = {}
    for _, group in ipairs(groups or {}) do
        if group.expansion then seen[group.expansion] = true end
    end
    return GetExpansionOptionsFromSeen(seen)
end

local function GetQuestExpansionOptions()
    local seen = {}
    for _, group in ipairs(DVD.quests or {}) do
        for _, quest in ipairs(group.quests or {}) do
            if quest.expansion then seen[quest.expansion] = true end
        end
    end
    return GetExpansionOptionsFromSeen(seen)
end

-- 🌟 FIXED FLAT VENDORS MAPPER: Reads directly from master data engine rows!
local function GetExpansionOptionsFromFlatVendors()
    local seen = {}
    for _, vendor in pairs(masterNpcs) do
        if type(vendor) == "table" and vendor.expansion then
            seen[vendor.expansion] = true
        end
    end
    return GetExpansionOptionsFromSeen(seen)
end

local function GetProfessionExpansionOptions()
    local seen = {}
    for _, group in ipairs(DVD.professions or {}) do
        for _, item in ipairs(group.items or {}) do
            if item.expansion then seen[item.expansion] = true end
        end
    end
    return GetExpansionOptionsFromSeen(seen)
end

local function GetProfessionCategoryOptions()
    local seen = {}
    for _, group in ipairs(DVD.professions or {}) do
        for _, item in ipairs(group.items or {}) do
            if item.category then seen[item.category] = true end
        end
    end

    local options = {}
    local used = {}

    for _, professionName in ipairs(DVD.Profession_Order or {}) do
        if seen[professionName] then
            table.insert(options, {
                key = professionName,
                label = ColorLabel(professionName, DVD.LabelColors and DVD.LabelColors.Professions, professionName),
            })
            used[professionName] = true
        end
    end

    for _, professionName in ipairs(SortedKeys(seen)) do
        if not used[professionName] then
            table.insert(options, {
                key = professionName,
                label = ColorLabel(professionName, DVD.LabelColors and DVD.LabelColors.Professions, professionName),
            })
        end
    end
    return options
end

local function GetQuestFactionOptions()
    local seen = {}
    for _, group in ipairs(DVD.quests or {}) do
        for _, quest in ipairs(group.quests or {}) do
            if quest.faction then seen[string.lower(quest.faction)] = true end
        end
    end

    local options = {}
    for _, faction in ipairs(OrderedFactionList(seen)) do
        table.insert(options, {
            key = faction,
            label = FormatFactionLabel(faction),
            color = GetFactionColor(faction),
        })
    end
    return options
end

local function GetAchievementFactionOptions()
    local seen = {}
    for _, group in ipairs(DVD.achievements or {}) do
        for _, achievement in ipairs(group.achievements or {}) do
            if achievement.faction then seen[string.lower(achievement.faction)] = true end
        end
    end

    local options = {}
    for _, faction in ipairs(OrderedFactionList(seen)) do
        table.insert(options, {
            key = faction,
            label = FormatFactionLabel(faction),
            color = GetFactionColor(faction),
        })
    end
    return options
end

local function GetAchievementGroupOptions()
    local options = {}
    for _, group in ipairs(DVD.achievements or {}) do
        if group.name then
            table.insert(options, {
                key = group.name,
                label = ColorLabel(group.name, DVD.LabelColors and DVD.LabelColors.AchievementCategories, group.name),
            })
        end
    end
    return options
end

-------------------------------------------------
-- Sidebar UI Layout Builders
-------------------------------------------------

function DVD.BuildVendorFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.vendors
    local y = -4

    y = AddSection(parent, "vendors", "expansions", "Expansions", y, GetExpansionOptionsFromFlatVendors(), filters.expansions, false)
    y = AddSection(parent, "vendors", "faction", "Faction", y, {
        {key = "alliance", label = "Alliance", color = GetFactionColor("alliance")},
        {key = "horde", label = "Horde", color = GetFactionColor("horde")},
        {key = "neutral", label = "Neutral", color = GetFactionColor("neutral")}
    }, filters.factions, false)

    y = AddSection(parent, "vendors", "requirements", "Unlocks", y, {
        {key = "none", label = "No Requirement"},
        {key = "reputation", label = "Reputation"},
        {key = "renown", label = "Renown"},
        {key = "subfaction", label = "Subfaction"},
        {key = "friendship", label = "Friendship"},
        {key = "race", label = "Race Locked"},
        {key = "neighborhood", label = "Neighborhood / Housing"},
        {key = "Promo", label = "Promo"}
    }, filters.categories, false)

    parent:SetHeight(math.abs(y) + 20)
end

function DVD.BuildQuestFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.quests
    local y = -4

    y = AddSection(parent, "quests", "expansions", "Expansions", y, GetQuestExpansionOptions(), filters.expansions, false)
    y = AddSection(parent, "quests", "faction", "Faction", y, GetQuestFactionOptions(), filters.factions, false)
    y = AddSection(parent, "quests", "categories", "Unlocks", y, {
        { key = "race", label = "Race Locked" },
        { key = "spec", label = "Spec Locked" },
    }, filters.categories, false)

    parent:SetHeight(math.abs(y) + 20)
end

function DVD.BuildProfessionFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.professions
    local y = -4

    y = AddSection(parent, "professions", "expansions", "Expansions", y, GetProfessionExpansionOptions(), filters.expansions, false)
    y = AddSection(parent, "professions", "professions", "Professions", y, GetProfessionCategoryOptions(), filters.professions, false)

    parent:SetHeight(math.abs(y) + 20)
end

function DVD.BuildAchievementFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.achievements
    local y = -4

    y = AddSection(parent, "achievements", "categories", "Categories", y, GetAchievementGroupOptions(), filters.groups, false)
    y = AddSection(parent, "achievements", "faction", "Faction", y, GetAchievementFactionOptions(), filters.factions, false)

    parent:SetHeight(math.abs(y) + 20)
end

function DVD.BuildBossDropFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.bossdrops
    local y = -4

    y = AddSection(parent, "bossdrops", "expansions", "Expansions", y, GetExpansionOptionsFromGroups(DVD.bossdrops), filters.expansions, false)
    y = AddSection(parent, "bossdrops", "categories", "Categories", y, {
        { key = "rare", label = ColorLabel("Rares", DVD.LabelColors and DVD.LabelColors.BossCategories, "rare") },
        { key = "dungeon", label = ColorLabel("Dungeons", DVD.LabelColors and DVD.LabelColors.BossCategories, "dungeon") },
        { key = "delve", label = ColorLabel("Delves", DVD.LabelColors and DVD.LabelColors.BossCategories, "delve") },
        { key = "renown", label = ColorLabel("Renown", DVD.LabelColors and DVD.LabelColors.BossCategories, "renown") },
        { key = "event", label = ColorLabel("Events", DVD.LabelColors and DVD.LabelColors.BossCategories, "event") },
        { key = "raid", label = ColorLabel("Raids", DVD.LabelColors and DVD.LabelColors.BossCategories, "raid") },
        { key = "daily", label = ColorLabel("Dailies", DVD.LabelColors and DVD.LabelColors.BossCategories, "daily") },
        { key = "decor", label = ColorLabel("Decor Specialties", DVD.LabelColors and DVD.LabelColors.BossCategories, "decor") },
    }, filters.categories, false)

    parent:SetHeight(math.abs(y) + 20)
end

-------------------------------------------------
-- Current Tab Router
-------------------------------------------------

function DVD.BuildCurrentSidebarFilters()
    if DVD.currentTab == "vendors" and DVD.BuildVendorFilters then
        DVD.BuildVendorFilters()
    elseif DVD.currentTab == "professions" and DVD.BuildProfessionFilters then
        DVD.BuildProfessionFilters()
    elseif DVD.currentTab == "quests" and DVD.BuildQuestFilters then
        DVD.BuildQuestFilters()
    elseif DVD.currentTab == "achievements" and DVD.BuildAchievementFilters then
        DVD.BuildAchievementFilters()
    elseif DVD.currentTab == "bossdrops" and DVD.BuildBossDropFilters then
        DVD.BuildBossDropFilters()
    end
end