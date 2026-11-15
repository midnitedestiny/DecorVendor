-- ============================================================
-- Decor Vendor: Utils.lua
-- Consolidated file. Each section below is one original file,
-- preserved verbatim and wrapped in its own function scope:
-- (function(...) ... end)(...). That gives the section exactly
-- the behavior it had as a separate file - its local variables
-- stay private, and a top-level return or guard clause exits
-- only that section. Sections run in the original .toc order.
-- ============================================================

-- ------------------------------------------------------------
-- SECTION: filters.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon — Filters Module
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local Gallery = DVD.Gallery
local Sizing = C.MainFiltersSizing
local MainFrameSizing = C.MainFrameSizing
local COLORS = C.COLORS or {}
local LabelColors = C.LabelColors or {}
local ExpansionColors = C.ExpansionColors or {}
local ExpansionOrder = C.EXPANSION_ORDER or {}
local ProfessionOrder = C.PROFESSION_ORDER or {}

if not C then
    print("|cffff4040DecorVendor Filters:|r constants are missing.")
    return
end

if not Sizing then
    print("|cffff4040DecorVendor Filters:|r MainFiltersSizing is missing.")
    return
end

if not MainFrameSizing then
    print("|cffff4040DecorVendor Filters:|r MainFrameSizing is missing.")
    return
end
local function AnySelected(tbl)
    if not tbl then return false end
    for _, selected in pairs(tbl) do
        if selected then return true end
    end
    return false
end

function DVD.GetExpansionName(exp)
    if type(exp) == "number" then
        return C.EXPANSION_NAMES[exp] or tostring(exp)
    elseif type(exp) == "string" then
        return exp
    end
    return "Unknown"
end

DVD.filters = DVD.filters or {}
DVD.collapsedFilters = DVD.collapsedFilters or {}
DVD.collapsedFilterSections = DVD.collapsedFilterSections or {}
-------------------------------------------------
-- Filter table normalization
-------------------------------------------------
local function EnsureTable(parent, key)
    local value = parent[key]

    if type(value) ~= "table" then
        value = {}
        parent[key] = value
    end

    return value
end

local function EnsureDefault(tbl, key, defaultValue)
    if tbl[key] == nil then
        tbl[key] = defaultValue
    end
end
-------------------------------------------------
-- Vendor filters
-------------------------------------------------
local vendorFilters =
EnsureTable(DVD.filters, "vendors")
local vendorExpansions = EnsureTable(vendorFilters, "expansions")
EnsureTable(vendorFilters, "factions")
EnsureTable(vendorFilters, "recipes")

-- If the user hasn't selected any expansions yet (or on first load), default to Midnight
if not AnySelected(vendorExpansions) then
    vendorExpansions["Midnight"] = true
end

local vendorCategories =
EnsureTable(vendorFilters, "categories")

for _, key in ipairs({
    "none",
    "reputation",
    "renown",
	"holiday",
    "subfaction",
    "friendship",
    "race",
    "neighborhood",
    "Promo",
	"timewalking",
}) do
    EnsureDefault(
        vendorCategories,
        key,
        false
    )
end
-------------------------------------------------
-- Quest filters
-------------------------------------------------
local questFilters =
EnsureTable(DVD.filters, "quests")
local questExpansions = EnsureTable(questFilters, "expansions")
EnsureTable(questFilters, "categories")
EnsureTable(questFilters, "factions")

-- If the user hasn't selected any expansions yet (or on first load), default to Midnight
if not AnySelected(questExpansions) then
    questExpansions["Midnight"] = true
end
-------------------------------------------------
-- Boss-drop filters
-------------------------------------------------
local bossDropFilters =
EnsureTable(DVD.filters, "bossdrops")
local bossExpansions = EnsureTable(bossDropFilters, "expansions")
EnsureTable(bossDropFilters, "categories")

-- If the user hasn't selected any expansions yet (or on first load), default to Midnight
if not AnySelected(bossExpansions) then
    bossExpansions["Midnight"] = true
end
-------------------------------------------------
-- Profession filters
-------------------------------------------------
local professionFilters =
EnsureTable(DVD.filters, "professions")
EnsureTable(professionFilters, "professions")
local professionExpansions = EnsureTable(professionFilters, "expansions")

-- If the user hasn't selected any expansions yet (or on first load), default to Midnight
if not AnySelected(professionExpansions) then
    professionExpansions["Midnight"] = true
end-------------------------------------------------
-- Achievement filters
-------------------------------------------------
local achievementFilters =
EnsureTable(DVD.filters, "achievements")
EnsureTable(achievementFilters, "groups")
EnsureTable(achievementFilters, "factions")
-------------------------------------------------
-- General requirement filters
-------------------------------------------------
local requirementFilters =
EnsureTable(DVD.filters, "requirements")
EnsureTable(requirementFilters, "types")

EnsureDefault(
    requirementFilters,
    "showLocked",
    true
)

EnsureDefault(
    requirementFilters,
    "showUnlocked",
    true
)
-------------------------------------------------
-- Filter Defaults (Normalized to avoid table drops)
-------------------------------------------------

DVD.filters.vendors = DVD.filters.vendors or {
    expansions = {
	["Midnight"] = true,
	},
    factions = {},
    recipes = {},
    categories = {
        none = false,
        reputation = false,
        renown = false,
		holiday = false,
        subfaction = false,
        friendship = false,
        race = false,
        neighborhood = false,
        Promo = false,
		timewalking = false,
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

DVD.filters.shop = DVD.filters.shop or {
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

local function GetSidebarWidth()
    return MainFrameSizing.SidebarWidth
end

local function RefreshFromSidebar()
    DVD.filtersJustChanged = true

    if DVD.scrollFrame then
        DVD.scrollFrame:SetVerticalScroll(0)
    end

if DVD.BuildVendorUI then
    DVD.BuildVendorUI()

elseif type(BuildVendorUI) == "function" then
    -- Temporary legacy fallback.
    BuildVendorUI()
end
end

local function ClearFrameChildren(frame)
    if not frame then return end
    for _, child in ipairs({ frame:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
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
    faction =
        string.lower(
            tostring(faction or "neutral")
        )

    if faction == "alliance" then
        return COLORS.ALLIANCE

    elseif faction == "horde" then
        return COLORS.HORDE

    elseif faction == "neutral" then
        return COLORS.NEUTRAL
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
    expansionName =
        expansionName
        or "Unknown"

    local hex =
        ExpansionColors[expansionName]
        or ExpansionColors.Unknown
        or "888888"

    return
        "|cff"
        .. tostring(hex)
        .. tostring(expansionName)
        .. "|r"
end

-------------------------------------------------
-- Compatibility Requirements Matcher
-------------------------------------------------

function DVD.ItemPassesRequirements(itemID)
local activeItems =
    DVD.ActiveItems
    or {}

local data =
    activeItems[itemID]
    or (
        DVD.decorItem
        and DVD.decorItem[itemID]
    )
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

    -- Ensure sidebarFilters exists
    DVD.sidebarFilters = DVD.sidebarFilters or sidebar.filtersContainer or sidebar.filterContent
    if not DVD.sidebarFilters then
        DVD.sidebarFilters = CreateFrame("Frame", "DV_SidebarFilters", sidebar)
        sidebar.filterContent = DVD.sidebarFilters
        sidebar.filtersContainer = DVD.sidebarFilters
    end

    ClearFrameChildren(DVD.sidebarFilters)

    -- 🛡️ SAFETY CHECK: Only anchor if it's a separate child frame, not the sidebar itself!
    if DVD.sidebarFilters ~= sidebar then
        DVD.sidebarFilters:ClearAllPoints()
        DVD.sidebarFilters:SetPoint(
            "TOPLEFT",
            sidebar,
            "TOPLEFT",
            Sizing.ContentTopInset,
            -Sizing.ContentTopInset
        )

        DVD.sidebarFilters:SetPoint(
            "TOPRIGHT",
            sidebar,
            "TOPRIGHT",
            -Sizing.ContentRightInset,
            -Sizing.ContentTopInset
        )

        DVD.sidebarFilters:SetPoint(
            "BOTTOMRIGHT",
            sidebar,
            "BOTTOMRIGHT",
            -Sizing.ContentRightInset,
            Sizing.ContentBottomInset
        )

        DVD.sidebarFilters:SetWidth(
            sidebarWidth
            - Sizing.ContentWidthPadding
        )

        if DVD.sidebarFilters.SetClipsChildren then
            DVD.sidebarFilters:SetClipsChildren(true)
        end
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
header:SetPoint(
    "TOPRIGHT",
    parent,
    "TOPRIGHT",
    -Sizing.SectionRightInset,
    yOffset
)

header:SetHeight(
    Sizing.SectionHeight
)

    header.bg = header:CreateTexture(nil, "BACKGROUND")
    header.bg:SetAllPoints()
    header.bg:SetColorTexture(0, 0, 0, 0)

    header.text = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header.text:SetPoint("LEFT", header, "LEFT", 0, 0)
header.text:SetFont(
    STANDARD_TEXT_FONT,
    Sizing.SectionFontSize,
    "OUTLINE"
)
    header.text:SetText("|cffffd100" .. title .. "|r")

    header.arrow = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
header.arrow:SetPoint(
    "RIGHT",
    header,
    "RIGHT",
    -Sizing.SectionArrowRightInset,
    0
)
header.arrow:SetFont(
    STANDARD_TEXT_FONT,
    Sizing.SectionFontSize,
    "OUTLINE"
)
    header.arrow:SetText(collapsed and "|cffffd100+|r" or "|cffffd100-|r")

    header.line = header:CreateTexture(nil, "ARTWORK")
    header.line:SetColorTexture(1, 0.82, 0, 0.45)
header.line:SetHeight(
    Sizing.SectionDividerHeight
)

header.line:SetPoint(
    "BOTTOMLEFT",
    header,
    "BOTTOMLEFT",
    0,
    -Sizing.SectionDividerBottomOffset
)

header.line:SetPoint(
    "BOTTOMRIGHT",
    header,
    "BOTTOMRIGHT",
    0,
    -Sizing.SectionDividerBottomOffset
)

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

    return yOffset - Sizing.SectionAdvance, collapsed
end

local function CreateSidebarCheckbox(parent, yOffset, labelText, checked, onClick, color)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check:SetSize(
        Sizing.CheckboxSize,
        Sizing.CheckboxSize
    )

    check:SetPoint(
        "TOPLEFT",
        parent,
        "TOPLEFT",
        0,
        yOffset
            + Sizing.CheckboxTopAdjustment
    )
    check:SetChecked(checked and true or false)

    -- Safely clear default textures without causing an argument error
    if check:GetNormalTexture() then check:GetNormalTexture():SetTexture("") end
    if check:GetPushedTexture() then check:GetPushedTexture():SetTexture("") end
    if check:GetHighlightTexture() then check:GetHighlightTexture():SetTexture("") end

    -- Drop in a clean custom backdrop box for the checkbox so it pops out
    if not check.customBg then
        local bg = CreateFrame("Frame", nil, check, "BackdropTemplate")
        bg:SetAllPoints(check)
bg:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
        })
        bg:SetBackdropColor(0, 0, 0, 0.3)             -- Semi-transparent dark tint (lets the background breathe)
        bg:SetBackdropBorderColor(0.25, 0.52, 0.88, 1) -- Crisp steel-blue border outline
        bg:SetFrameLevel(check:GetFrameLevel() - 1)
        check.customBg = bg
    end

    if check.Text then check.Text:SetText("") end
    if check.text then check.text:SetText("") end

    check.label = check:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    check.label:SetPoint(
        "LEFT",
        check,
        "RIGHT",
        Sizing.CheckboxLabelGap,
        0
    )

    check.label:SetWidth(
        GetSidebarWidth()
        - Sizing.CheckboxLabelWidthPadding
    )
    check.label:SetJustifyH("LEFT")
    check.label:SetFont(
        STANDARD_TEXT_FONT,
        Sizing.CheckboxLabelFontSize,
        "OUTLINE"
    )
    check.label:SetText(labelText)

    if color then check.label:SetTextColor(color[1], color[2], color[3], color[4] or 1)
    else check.label:SetTextColor(0.84, 0.84, 0.84, 1) end

    check:SetScript("OnClick", function(self)
        if onClick then onClick(self:GetChecked() and true or false) end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)

    return yOffset - Sizing.CheckboxAdvance, check
end

local function AddSection(parent, contextKey, sectionKey, title, yOffset, options, selectedTable, defaultCollapsed)
    local fullKey = contextKey .. "." .. sectionKey
    local collapsed
    yOffset, collapsed = CreateSectionHeader(parent, fullKey, title, yOffset, defaultCollapsed)

if collapsed then
    return yOffset
        - Sizing.CollapsedSectionGap
end
    selectedTable = selectedTable or {}

    for _, option in ipairs(options or {}) do
        local key = option.key
        local checked = selectedTable[key] == true

        yOffset = CreateSidebarCheckbox(parent, yOffset, option.label or tostring(key), checked, function(isChecked)
            selectedTable[key] = isChecked and true or false
            RefreshFromSidebar()
        end, option.color)
    end

return yOffset
    - Sizing.ExpandedSectionGap
end

-------------------------------------------------
-- Faction Builders
-------------------------------------------------
local function GetQuestFactionOptions()
    local counts = { alliance = 0, horde = 0, neutral = 0 }

    -- Safely loop through nested quest groups and tally the factions
    for _, group in ipairs(DVD.quests or {}) do
        if type(group.quests) == "table" then
            for _, quest in ipairs(group.quests) do
                if quest.faction then
                    local f = string.lower(quest.faction)
                    if counts[f] ~= nil then
                        counts[f] = counts[f] + 1
                    end
                end
            end
        end
    end

    local factionDefs = {
        { key = "alliance", label = "Alliance" },
        { key = "horde",    label = "Horde" },
        { key = "neutral",  label = "Neutral" },
    }

    local factionOptions = {}
    for _, def in ipairs(factionDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(factionOptions, {
            key = def.key,
            label = ColorLabel(rawLabel, LabelColors and LabelColors.Factions, def.key),
        })
    end

    return factionOptions
end

local function GetAchievementFactionOptions()
    local counts = { alliance = 0, horde = 0, neutral = 0 }

    -- Loop through achievement groups and tally the factions
    for _, group in ipairs(DVD.achievements or {}) do
        if type(group.achievements) == "table" then
            for _, achievement in ipairs(group.achievements) do
                if achievement.faction then
                    local f = string.lower(achievement.faction)
                    if counts[f] ~= nil then
                        counts[f] = counts[f] + 1
                    end
                end
            end
        end
    end

    local factionDefs = {
        { key = "alliance", label = "Alliance" },
        { key = "horde",    label = "Horde" },
        { key = "neutral",  label = "Neutral" },
    }

    local factionOptions = {}
    for _, def in ipairs(factionDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(factionOptions, {
            key = def.key,
            label = ColorLabel(rawLabel, LabelColors and LabelColors.Factions, def.key),
        })
    end

    return factionOptions
end

local function GetVendorFactionOptions()
    local counts = { alliance = 0, horde = 0, neutral = 0 }

    -- Dynamically tally vendor counts from DVD.npcs
    for _, npc in pairs(DVD.npcs or {}) do
        if npc.faction then
            local f = string.lower(npc.faction)
            if counts[f] ~= nil then
                counts[f] = counts[f] + 1
            end
        end
    end

    local factionDefs = {
        { key = "alliance", label = "Alliance" },
        { key = "horde",    label = "Horde" },
        { key = "neutral",  label = "Neutral" },
    }

    local factionOptions = {}
    for _, def in ipairs(factionDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(factionOptions, {
            key = def.key,
            label = ColorLabel(rawLabel, LabelColors and LabelColors.Factions, def.key),
        })
    end

    return factionOptions
end

-------------------------------------------------
-- Expansion Builders
-------------------------------------------------
local function GetExpansionOptionsFromCounts(counts)
    local options = {}
    
    -- Grab your expansion colors table safely
    local expansionColors = C.ExpansionColors or {}
    
    -- First, add expansions in the strict order defined by C.EXPANSION_ORDER
    for _, expansion in ipairs(C.EXPANSION_ORDER or {}) do
        if counts[expansion] and counts[expansion] > 0 then
            local count = counts[expansion]
            local rawLabel = string.format("%s (%d)", expansion, count)
            
            -- Colorize using the exact expansion name as the key in C.ExpansionColors
            local hexColor = expansionColors[expansion]
            local label = hexColor and string.format("|cff%s%s|r", hexColor, rawLabel) or rawLabel
            
            table.insert(options, { 
                key = expansion, 
                label = label 
            })
            counts[expansion] = nil -- Mark as processed
        end
    end
    
    -- Next, catch any remaining expansions not in C.EXPANSION_ORDER
    for expansion, count in pairs(counts) do
        if count > 0 then
            local rawLabel = string.format("%s (%d)", expansion, count)
            
            local hexColor = expansionColors[expansion]
            local label = hexColor and string.format("|cff%s%s|r", hexColor, rawLabel) or rawLabel
            
            table.insert(options, { 
                key = expansion, 
                label = label 
            })
        end
    end
    
    return options
end

-- 1. Vendors (Flat DVD.npcs table)
local function GetExpansionOptionsFromFlatVendors()
    local counts = {}
    for _, vendor in pairs(DVD.npcs or {}) do
        if type(vendor) == "table" and vendor.expansion then
            local exp = DVD.GetExpansionName(vendor.expansion) -- Normalized!
            counts[exp] = (counts[exp] or 0) + 1
        end
    end
    return GetExpansionOptionsFromCounts(counts)
end

-- 2. Quests (Nested groups structure)
local function GetQuestExpansionOptions()
    local counts = {}
    for _, group in ipairs(DVD.quests or {}) do
        if type(group.quests) == "table" then
            for _, quest in ipairs(group.quests) do
                if quest.expansion then
                    local exp = DVD.GetExpansionName(quest.expansion) -- Normalized!
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        end
    end
    return GetExpansionOptionsFromCounts(counts)
end

-- 3. Professions / Drops / Grouped items (Handles items nested inside group.items)
local function GetProfessionExpansionOptions()
    local counts = {}
    for _, group in ipairs(DVD.professions or {}) do
        if type(group.items) == "table" then
            for _, item in ipairs(group.items) do
                if item.expansion then
                    local exp = DVD.GetExpansionName(item.expansion) -- Normalized!
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        end
    end
    return GetExpansionOptionsFromCounts(counts)
end

-- 4. Achievements 
local function GetGroupExpansionOptions(groups)
    local counts = {}
    for _, group in ipairs(groups or {}) do
        if type(group.items) == "table" then
            for _, item in ipairs(group.items) do
                local rawExp = item.expansion or group.expansion
                if rawExp then
                    local exp = DVD.GetExpansionName(rawExp) -- Normalized!
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        elseif type(group.achievements) == "table" then
            for _, item in ipairs(group.achievements) do
                local rawExp = item.expansion or group.expansion
                if rawExp then
                    local exp = DVD.GetExpansionName(rawExp) -- Normalized!
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        elseif group.expansion then
            local exp = DVD.GetExpansionName(group.expansion) -- Normalized!
            counts[exp] = (counts[exp] or 0) + 1
        end
    end
    return GetExpansionOptionsFromCounts(counts)
end

-- 5. Bosses
local function GetBossExpansionOptions()
    local counts = {}
    for itemID, itemData in pairs(DVD.bossdrops or {}) do
        local rawExp = itemData.expansion
        if rawExp then
            local exp = DVD.GetExpansionName(rawExp) -- Normalized!
            counts[exp] = (counts[exp] or 0) + 1
        end
    end
    return GetExpansionOptionsFromCounts(counts)
end
-------------------------------------------------
-- Option Builders
-------------------------------------------------
local function GetProfessionCategoryOptions()
    -- 1. Count items per profession category accurately
    local counts = {}
    for _, group in ipairs(DVD.professions or {}) do
        local profName = group.name
        if profName then
            local count = 0
            for _, item in ipairs(group.items or {}) do
                count = count + 1
            end
            counts[profName] = count
        end
    end

    local seen = {}
    for _, group in ipairs(DVD.professions or {}) do
        if group.name then
            seen[group.name] = true
        end
        for _, item in ipairs(group.items or {}) do
            if item.category then 
                seen[item.category] = true 
            end
        end
    end

    local options = {}
    local used = {}

    for _, professionName in ipairs(ProfessionOrder) do
        if seen[professionName] then
            local count = counts[professionName] or 0
            local rawLabel = string.format("%s (%d)", professionName, count)
            
            table.insert(options, {
                key = professionName,
                label = ColorLabel(rawLabel, LabelColors and LabelColors.Professions, professionName),
            })
            used[professionName] = true
        end
    end

    for _, professionName in ipairs(SortedKeys(seen)) do
        if not used[professionName] then
            local count = counts[professionName] or 0
            local rawLabel = string.format("%s (%d)", professionName, count)

            table.insert(options, {
                key = professionName,
                label = ColorLabel(rawLabel, LabelColors and LabelColors.Professions, professionName),
            })
        end
    end
    return options
end

local function GetQuestCategoryOptions()
    -- Count quests per category across all quest groups
    local counts = {}

    for _, group in ipairs(DVD.quests or {}) do
        for _, quest in ipairs(group.quests or {}) do
            local cat = quest.category or group.name
            if cat then
                counts[cat] = (counts[cat] or 0) + 1
            end
        end
    end

    local categoryDefs = {
        { key = "race", label = "Race Locked" },
        { key = "spec", label = "Spec Locked" },
    }

    local options = {}
    for _, def in ipairs(categoryDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(options, {
            key = def.key,
			label = ColorLabel(rawLabel, LabelColors and LabelColors.QuestCategories, def.key),
        })
    end

    return options
end

local function GetAchievementGroupOptions()
    -- Count achievements per group
    local counts = {}

    for _, group in ipairs(DVD.achievements or {}) do
        local count = 0
        for _, achievement in ipairs(group.achievements or {}) do
            count = count + 1
        end
        if group.name then
            counts[group.name] = count
        end
    end

    local options = {}
    for _, group in ipairs(DVD.achievements or {}) do
        if group.name then
            local count = counts[group.name] or 0
            local rawLabel = string.format("%s (%d)", group.name, count)

            table.insert(options, {
                key = group.name,
                label = ColorLabel(rawLabel, LabelColors and LabelColors.AchievementCategories, group.name),
            })
        end
    end
    return options
end

local function GetBossDropCategoryOptions()
    local counts = {}

    for itemID, bossData in pairs(DVD.bossdrops or {}) do
        local activeData = itemID and DVD.ActiveItems and DVD.ActiveItems[itemID] or {}
        local groupName = bossData.group or "Other Boss Drops"
        
        -- Derive category key matching categoryDefs
        local cat = bossData.category or activeData.category
        if not cat then
            local text = string.lower((groupName or "") .. " " .. (bossData.bossevent or ""))
            if string.find(text, "daily") then cat = "daily"
            elseif string.find(text, "rare") then cat = "rare"
            elseif string.find(text, "delve") then cat = "delve"
            elseif string.find(text, "raid") then cat = "raid"
            elseif string.find(text, "dungeon") then cat = "dungeon"
            elseif string.find(text, "event") or string.find(text, "weekly") then cat = "event"
            elseif string.find(text, "treasure") or string.find(text, "chest") then cat = "treasure"
            else cat = "decor" end
        end
        
        cat = string.lower(cat)
        counts[cat] = (counts[cat] or 0) + 1
    end

    local categoryDefs = {
        { key = "daily",    label = "Dailies" },
        { key = "decor",    label = "Decor Specialties" },   
        { key = "delve",    label = "Delves" },
        { key = "dungeon",  label = "Dungeons" },
        { key = "event",    label = "Events" },
        { key = "raid",     label = "Raids" },
        { key = "rare",     label = "Rares" },
        { key = "treasure", label = "Treasure" },
    }

    local options = {}
    for _, def in ipairs(categoryDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(options, {
            key = def.key,
            label = ColorLabel(rawLabel, LabelColors and LabelColors.BossCategories, def.key),
        })
    end

    return options
end

local function GetVendorCategoryOptions()
    -- Count vendors per category across the flat npc table
    local counts = {}

    for _, vendor in pairs(DVD.npcs or {}) do
        if type(vendor) == "table" then
            local cat = vendor.category or "none"
            counts[cat] = (counts[cat] or 0) + 1
        end
    end

    local categoryDefs = {
        { key = "none",         label = "No Requirement" },
	
        { key = "friendship",   label = "Friendship" },
        { key = "neighborhood", label = "Neighborhood" },	
        { key = "Promo",        label = "Promo" },	
		{ key = "holiday",      label = "Holiday"},
        { key = "race",         label = "Race Locked" },
        { key = "renown",       label = "Renown" },
        { key = "reputation",   label = "Reputation" },
        { key = "subfaction",   label = "Subfaction" },
		{ key = "timewalking",   label = "Timewalking" },
    }

    local options = {}
    for _, def in ipairs(categoryDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(options, {
            key = def.key,
            label = ColorLabel(rawLabel, LabelColors and LabelColors.VendorCategories, def.key),
        })
    end

    return options
end

local function GetShopCategoryOptions()
    -- Count shop items per source across Gallery.ItemDetails
    local counts = {}

    for itemID, details in pairs(Gallery.ItemDetails or {}) do
        if type(itemID) == "number"
        and type(details) == "table"
        and (details.source == "shop" or details.source == "soon" or details.source == "charity")
        then
            counts[details.source] = (counts[details.source] or 0) + 1
        end
    end

    local categoryDefs = {
        { key = "shop",    label = "In-Game Shop" },
        { key = "charity", label = "Charity" },
		--{ key = "soon", label = "Coming Soon" },
    }

    local options = {}
    for _, def in ipairs(categoryDefs) do
        local count = counts[def.key] or 0
        local rawLabel = string.format("%s (%d)", def.label, count)

        table.insert(options, {
            key = def.key,
            label = ColorLabel(rawLabel, LabelColors and LabelColors.ShopCategories, def.key),
        })
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
    local y = Sizing.ContentStartY

    y = AddSection(parent, "vendors", "expansions", "Expansions", y, GetExpansionOptionsFromFlatVendors(), filters.expansions, false)
    y = AddSection(parent, "vendors", "requirements", "Unlocks", y, GetVendorCategoryOptions(), filters.categories, false)	
	y = AddSection(parent, "quests", "faction", "Faction", y, GetVendorFactionOptions(), filters.factions, false)

    parent:SetHeight(
    math.abs(y)
    + Sizing.ContentBottomPadding
)
end

function DVD.BuildQuestFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.quests
    local y = Sizing.ContentStartY

    y = AddSection(parent, "quests", "expansions", "Expansions", y, GetQuestExpansionOptions(), filters.expansions, false)
    y = AddSection(parent, "quests", "faction", "Faction", y, GetQuestFactionOptions(), filters.factions, false)
    y = AddSection(parent, "quests", "categories", "Unlocks", y, GetQuestCategoryOptions(), filters.categories, false)

   parent:SetHeight(
    math.abs(y)
    + Sizing.ContentBottomPadding
)
end

function DVD.BuildProfessionFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.professions
    local y = Sizing.ContentStartY

    y = AddSection(parent, "professions", "expansions", "Expansions", y, GetProfessionExpansionOptions(), filters.expansions, false)
    y = AddSection(parent, "professions", "professions", "Professions", y, GetProfessionCategoryOptions(), filters.professions, false)

    parent:SetHeight(
    math.abs(y)
    + Sizing.ContentBottomPadding
)
end

function DVD.BuildAchievementFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.achievements
    local y = Sizing.ContentStartY

    y = AddSection(parent, "achievements", "categories", "Categories", y, GetAchievementGroupOptions(), filters.groups, false)
    y = AddSection(parent, "achievements", "faction", "Faction", y, GetAchievementFactionOptions(), filters.factions, false)

    parent:SetHeight(
    math.abs(y)
    + Sizing.ContentBottomPadding
)
end

function DVD.BuildBossDropFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.bossdrops
    local y = Sizing.ContentStartY

    y = AddSection(parent, "bossdrops", "expansions", "Expansions", y, GetBossExpansionOptions(), filters.expansions, false)
    y = AddSection(parent, "bossdrops", "categories", "Categories", y, GetBossDropCategoryOptions(), filters.categories, false)

    parent:SetHeight(
    math.abs(y)
    + Sizing.ContentBottomPadding
)
end

function DVD.BuildShopFilters()
    DVD.ResetSidebarFilters()

    local parent = DVD.sidebarFilters
    local filters = DVD.filters.shop
    local y = Sizing.ContentStartY

    y = AddSection(parent, "shop", "categories", "Categories", y, GetShopCategoryOptions(), filters.categories, false)

    parent:SetHeight(
        math.abs(y)
        + Sizing.ContentBottomPadding
    )
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
    -- 🚀 Add the new Shop router here!
    elseif DVD.currentTab == "shop" and DVD.BuildShopFilters then
        DVD.BuildShopFilters()
    end
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Helpers/Helpers.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon — Shared UI and Logic Helpers
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]
local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Helpers:|r constants are missing.")
    return
end

local Sizing = C.ListFrameSizing

if not Sizing then
    print("|cffff4040DecorVendor Helpers:|r ListFrameSizing is missing.")
    return
end

-------------------------------------------------
-- Label Color Helper
-------------------------------------------------
function DVD.ColorizeLabel(label, colorTable, key)
    label = tostring(label or "Unknown")
    key = key or label

    local hex =
        colorTable and
        (colorTable[key] or colorTable[string.lower(tostring(key))] or colorTable.unknown or colorTable.Unknown) or
        "888888"

    return "|cff" .. tostring(hex) .. label .. "|r"
end

local function ScaleFontString(fontString, multiplier)
    if not fontString or not fontString.GetFont or not fontString.SetFont then
        return
    end

    local fontPath, fontSize, fontFlags = fontString:GetFont()

    if not fontPath or not fontSize then
        return
    end

    -- Remember the original size so repeated refreshes do not
    -- keep multiplying the already-scaled font.
    fontString.DVDBaseFontSize = fontString.DVDBaseFontSize or fontSize

    fontString:SetFont(fontPath, fontString.DVDBaseFontSize * multiplier, fontFlags)
end

local function ScaleFrameFontsRecursive(frame, multiplier, visited)
    if not frame then
        return
    end

    visited = visited or {}

    if visited[frame] then
        return
    end

    visited[frame] = true

    -------------------------------------------------
    -- FontStrings directly attached to this frame
    -------------------------------------------------
    if frame.GetRegions then
        local regions = {frame:GetRegions()}

        for _, region in ipairs(regions) do
            if region and region.GetObjectType and region:GetObjectType() == "FontString" then
                ScaleFontString(region, multiplier)
            end
        end
    end

    -------------------------------------------------
    -- Button/EditBox primary font string
    -------------------------------------------------
    if frame.GetFontString then
        local fontString = frame:GetFontString()

        if fontString then
            ScaleFontString(fontString, multiplier)
        end
    end

    -------------------------------------------------
    -- Recurse through child frames
    -------------------------------------------------
    if frame.GetChildren then
        local children = {frame:GetChildren()}

        for _, child in ipairs(children) do
            ScaleFrameFontsRecursive(child, multiplier, visited)
        end
    end
end

function DVD.ApplyAddonTextScale()
    local multiplier = tonumber(vendorSettings and vendorSettings.textScale) or 1.25

    -- Main Decor Vendor frame
    if DVD.frame then
        ScaleFrameFontsRecursive(DVD.frame, multiplier)
    end

    -- Gallery frame, if currently created
    if DVD.Gallery and DVD.Gallery.frame then
        ScaleFrameFontsRecursive(DVD.Gallery.frame, multiplier)
    end

    if _G.DecorVendorGalleryFrame and (not DVD.Gallery or DVD.Gallery.frame ~= _G.DecorVendorGalleryFrame) then
        ScaleFrameFontsRecursive(_G.DecorVendorGalleryFrame, multiplier)
    end
end
-------------------------------------------------
-- Accordion Header Helper
-- Opens one header and collapses the others in the same tab.
-------------------------------------------------

function DVD.ToggleAccordionHeader(tab, openKey)
    DVD.collapsedHeaders = DVD.collapsedHeaders or {}

    local wasOpen = DVD.collapsedHeaders[openKey] == false

    -- Collapse all headers for the current tab first safely.
    if tab == "vendors" then
        for _, vendor in pairs(DVD.npcs or {}) do
            if type(vendor) == "table" then
                local key = vendor.zoneGroup or vendor.zone or vendor.title
                if key then
                    DVD.collapsedHeaders[key] = true
                end
            end
        end
    elseif tab == "professions" then
        for _, profession in ipairs(DVD.professions or {}) do
            if profession.name then
                DVD.collapsedHeaders["prof_" .. profession.name] = true
            end
        end
    elseif tab == "quests" then
        for _, group in ipairs(DVD.quests or {}) do
            if group.name then
                DVD.collapsedHeaders["quest_" .. group.name] = true
            end
        end
    elseif tab == "achievements" then
        for _, group in ipairs(DVD.achievements or {}) do
            if group.name then
                DVD.collapsedHeaders["ach_" .. group.name] = true
            end
        end
    elseif tab == "bossdrops" then
        for _, group in ipairs(DVD.bossdrops or {}) do
            if group.name then
                DVD.collapsedHeaders["boss_" .. group.name] = true
            end
        end
    end

    -- If it was already open, leave everything collapsed. Otherwise, open this one.
    if not wasOpen then
        DVD.collapsedHeaders[openKey] = false
    end

    if DVD.RequestUpdate then
        DVD.RequestUpdate()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    elseif type(BuildVendorUI) == "function" then
        BuildVendorUI()
    end
end

function DVD.HasAnySelection(tbl)
    if type(tbl) ~= "table" then
        return false
    end

    for _, value in pairs(tbl) do
        if value then
            return true
        end
    end

    return false
end

function DVD.GetHeaderWidth()
    local frame = DVD.frame or _G.DV_MainFrame

    if not frame then
        return Sizing.FallbackHeaderWidth or 560
    end

    local horizontalPadding = tonumber(Sizing.HeaderHorizontalPadding) or 40

    local frameWidth = tonumber(frame:GetWidth()) or Sizing.FallbackHeaderWidth or 560

    -- Professions use the wider content area without
    -- the normal sidebar deduction.
    if DVD.currentTab == "professions" then
        return math.max(1, frameWidth - horizontalPadding)
    end

    local sidebarWidth = 0

    if frame.sidebar and frame.sidebar.GetWidth then
        sidebarWidth = tonumber(frame.sidebar:GetWidth()) or 0
    elseif DVD.sidebar and DVD.sidebar.GetWidth then
        sidebarWidth = tonumber(DVD.sidebar:GetWidth()) or 0
    end

    return math.max(1, frameWidth - sidebarWidth - horizontalPadding)
end

function DVD.BuildProfessionLookup()
    DVD.itemToProfession = {}
    for _, profession in ipairs(DVD.professions or {}) do
        for _, recipe in ipairs(profession.items or {}) do
            DVD.itemToProfession[recipe.id] = profession.name
        end
    end
end

function DVD:GetItemData(itemID)
    if type(self.ActiveItems) ~= "table" or itemID == nil then
        return nil
    end

    local numericItemID = tonumber(itemID)

    return self.ActiveItems[itemID] or (numericItemID and self.ActiveItems[numericItemID]) or
        self.ActiveItems[tostring(itemID)]
end

function DVD.IsItemCollected(itemID)
    local numericItemID = tonumber(itemID)

    itemID = numericItemID or itemID

    if itemID == nil then
        return false
    end

    local activeItems = DVD.ActiveItems or {}

    local itemData = activeItems[itemID] or activeItems[tostring(itemID)]

    local noxp = itemData and itemData.noxp == true

    -------------------------------------------------
    -- Saved-variable tables
    -------------------------------------------------

    vendorSettings = vendorSettings or {}

    vendorSettings.completedDrop = vendorSettings.completedDrop or {}

    vendorSettings.completedDropNoXP = vendorSettings.completedDropNoXP or {}

    DVD.collectionCache = DVD.collectionCache or {}

    -------------------------------------------------
    -- Persistent completion cache
    -------------------------------------------------

    if noxp then
        if vendorSettings.completedDropNoXP[itemID] then
            return true
        end
    else
        if vendorSettings.completedDrop[itemID] then
            return true
        end
    end

    -------------------------------------------------
    -- Runtime collection cache
    -------------------------------------------------

    if DVD.collectionCache[itemID] ~= nil then
        return DVD.collectionCache[itemID]
    end

    local decorID = itemData and tonumber(itemData.decorID)

    if not decorID then
        DVD.collectionCache[itemID] = false
        return false
    end

    -------------------------------------------------
    -- Housing Catalog lookup
    -------------------------------------------------

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        -- Do not cache this temporary API-unavailable state.
        return false
    end

    local entryType = Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1

    local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, entryType, decorID, true)

    if not ok or type(info) ~= "table" then
        -- Catalog information may still be loading.
        -- Caching false here would prevent a later refresh.
        return false
    end

    -------------------------------------------------
    -- Collection rules
    -------------------------------------------------

    local isCollected = false

    if noxp then
        local stored = tonumber(info.quantity or info.totalNumStored or info.numStored) or 0

        local redeemable = tonumber(info.remainingRedeemable or info.numRedeemable) or 0

        local placed = tonumber(info.numPlaced or info.totalNumPlaced) or 0

        isCollected = stored > 0 or redeemable > 0 or placed > 0
    else
        isCollected = tonumber(info.firstAcquisitionBonus) == 0
    end

    -------------------------------------------------
    -- Save result
    -------------------------------------------------

    if isCollected then
        if noxp then
            vendorSettings.completedDropNoXP[itemID] = true
        else
            vendorSettings.completedDrop[itemID] = true
        end
    end

    DVD.collectionCache[itemID] = isCollected

    return isCollected
end

-------------------------------------------------
-- Modernized Progression Completion Checking
-------------------------------------------------

function DVD.IsQuestEffectivelyCompleted(quest)
    if not quest then
        return false
    end

    -- ITEM COLLECTION (ACCOUNT-WIDE) - Check this first so uncollected items keep the quest visible
    if quest.itemID then
        if type(quest.itemID) == "table" then
            local allCollected = true
            for _, itemID in ipairs(quest.itemID) do
                if not (DVD.IsItemCollected and DVD.IsItemCollected(itemID)) then
                    allCollected = false
                    break
                end
            end
            -- Only consider it completed if EVERY item in the table is collected
            if allCollected then 
                return true 
            else
                return false
            end
        elseif type(quest.itemID) == "number" then
            if DVD.IsItemCollected and DVD.IsItemCollected(quest.itemID) then
                return true
            else
                return false
            end
        end
    end

    -- QUEST COMPLETION (ACCOUNT-WIDE Modern API Safeguard) - Used only for quests without specific item IDs
    local questID = tonumber(quest.id)

    if questID then
        if
            C_QuestLog and C_QuestLog.IsQuestFlaggedCompletedOnAccount and
                C_QuestLog.IsQuestFlaggedCompletedOnAccount(questID)
         then
            return true
        end

        if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(questID) then
            return true
        end
    end

    return false
end

--[[
function DVD.IsQuestEffectivelyCompleted(quest)
    if not quest then
        return false
    end

    -- ITEM COLLECTION (ACCOUNT-WIDE) - Check this first so uncollected items keep the quest visible
    if quest.itemID then
        if type(quest.itemID) == "table" then
            local allCollected = true
            for _, itemID in ipairs(quest.itemID) do
                if not (DVD.IsItemCollected and DVD.IsItemCollected(itemID)) then
                    allCollected = false
                    break
                end
            end
            -- Only consider it completed if EVERY item in the table is collected
            if allCollected then 
                return true 
            else
                return false
            end
        elseif type(quest.itemID) == "number" then
            if DVD.IsItemCollected and DVD.IsItemCollected(quest.itemID) then
                return true
            else
                return false
            end
        end
    end

    -- QUEST COMPLETION (ACCOUNT-WIDE Modern API Safeguard) - Handles single ID or table of IDs
    if quest.id then
        if type(quest.id) == "table" then
            for _, qID in ipairs(quest.id) do
                local qNum = tonumber(qID)
                if qNum then
                    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompletedOnAccount and C_QuestLog.IsQuestFlaggedCompletedOnAccount(qNum) then
                        return true
                    end
                    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(qNum) then
                        return true
                    end
                end
            end
        else
            local questID = tonumber(quest.id)
            if questID then
                if C_QuestLog and C_QuestLog.IsQuestFlaggedCompletedOnAccount and C_QuestLog.IsQuestFlaggedCompletedOnAccount(questID) then
                    return true
                end
                if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(questID) then
                    return true
                end
            end
        end
    end

    return false
end]]
-------------------------------------------------
-- Modernized Profession and Achievement Parsers
-------------------------------------------------

function DVD.CountProfessionItems(profession)
    local total = 0
    local completed = 0

    for _, item in ipairs(profession.items or {}) do
        total = total + 1

        local learned = false
        if item.spell then
            -- Modern retail API checks fallback compatibility loop
            if C_Spell and C_Spell.IsSpellKnown then
                learned = C_Spell.IsSpellKnown(item.spell)
            else
                learned = IsSpellKnown(item.spell) or IsPlayerSpell(item.spell)
            end
        end

        local collected = false
        if item.id and DVD.IsItemCollected then
            collected = DVD.IsItemCollected(item.id)
        end

        if learned or collected then
            completed = completed + 1
        end
    end

    return completed, total
end

function DVD.IsAchievementComplete(achievementID)
    achievementID = tonumber(achievementID)

    if not achievementID then
        return false
    end

    vendorSettings = vendorSettings or {}

    vendorSettings.completedAchievs = vendorSettings.completedAchievs or {}

    if vendorSettings.completedAchievs[achievementID] then
        return true
    end

    local completed = false

    -------------------------------------------------
    -- Table-style achievement API
    -------------------------------------------------

    if C_AchievementInfo and C_AchievementInfo.GetAchievementInfo then
        local ok, info = pcall(C_AchievementInfo.GetAchievementInfo, achievementID)

        if ok and type(info) == "table" then
            completed = info.completed == true or info.wasEarnedByMe == true or (info.earnedBy and info.earnedBy ~= "")
        end
    end

    -------------------------------------------------
    -- Legacy multiple-return API
    -------------------------------------------------

    if not completed and GetAchievementInfo then
        local ok, _, _, _, isCompleted, _, _, _, _, _, _, _, _, wasEarnedByMe = pcall(GetAchievementInfo, achievementID)

        if ok then
            completed = isCompleted == true or wasEarnedByMe == true
        end
    end

    if completed then
        vendorSettings.completedAchievs[achievementID] = true
    end

    return completed
end

-- ============================================================
-- Tab scroll frames helper
-- ============================================================
function DVD.CreateTabScrollFrame(tabFrame)
    if not tabFrame then
        return nil, nil
    end

    local topOffset = tonumber(Sizing.TabScrollTopOffset) or 26

    local rightInset = tonumber(Sizing.TabScrollRightInset) or 20

    local initialSize = tonumber(Sizing.InitialScrollChildSize) or 1

    local scroll = CreateFrame("ScrollFrame", nil, tabFrame, "UIPanelScrollFrameTemplate")

    scroll:SetPoint("TOPLEFT", 0, -topOffset)

    scroll:SetPoint("BOTTOMRIGHT", -rightInset, 0)

    local child = CreateFrame("Frame", nil, scroll)

    child:SetSize(initialSize, initialSize)

    scroll:SetScrollChild(child)

    scroll:SetScript(
        "OnSizeChanged",
        function(_, width)
            child:SetWidth(math.max(initialSize, tonumber(width) or initialSize))
        end
    )

    return scroll, child
end

end)(...);

-- ------------------------------------------------------------
-- SECTION: Core/Utilities.lua
-- ------------------------------------------------------------
(function(...)
-------------------------------------------------------------------------------
-- Decor Vendor Addon
-- Utilities.lua
-- Shared mathematical and data utilities
-------------------------------------------------------------------------------

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Utilities:|r constants are missing.")
    return
end

local SOURCE_PRIORITY = C.MAIN_SOURCE_PRIORITY

local SOURCE_LABELS = C.MAIN_SOURCE_LABELS

local SOURCE_ALIASES = C.MAIN_SOURCE_ALIASES

if not SOURCE_PRIORITY
or not SOURCE_LABELS
or not SOURCE_ALIASES then
    print("|cffff4040DecorVendor Utilities:|r main source constants are missing.")
    return
end

DVD.Utils = DVD.Utils or {}

local Utils = DVD.Utils

-- Temporary compatibility alias.
DVD.SourcePriority = DVD.SourcePriority or SOURCE_PRIORITY
-------------------------------------------------------------------------------
-- World Event Active Check Helper
-------------------------------------------------------------------------------

function DVD.IsWorldEventActive(eventID, eventName)

	if not C_Calendar then
        return false
    end

    if C_Calendar.OpenCalendar then
        C_Calendar.OpenCalendar()
    end

    local currentDate = C_DateAndTime.GetCurrentCalendarTime()
    if not currentDate then return false end

    local numEvents = C_Calendar.GetNumDayEvents(0, currentDate.monthDay) or 0
    if numEvents == 0 then
        return nil -- loading
    end

    -- Helper to convert calendar time tables into comparable numbers
    local function TimeToMinutes(t)
        if not t then return 0 end
        return (t.year * 525600) + (t.month * 43200) + (t.monthDay * 1440) + (t.hour * 60) + (t.minute or 0)
    end

    local currentMinutes = TimeToMinutes(currentDate)

    for i = 1, numEvents do
        local event = C_Calendar.GetDayEvent(0, currentDate.monthDay, i)
        if event then
            local matches = false
            if eventID and tonumber(eventID) and event.eventID == tonumber(eventID) then
                matches = true
            elseif eventName and event.title and event.title:lower():find(eventName:lower(), 1, true) then
                matches = true
            end

            if matches then
                -- Verify current time is strictly within the event's active window
                local startMin = TimeToMinutes(event.startTime)
                local endMin = TimeToMinutes(event.endTime)

                if startMin > 0 and endMin > 0 then
                    if currentMinutes >= startMin and currentMinutes <= endMin then
                        return true
                    end
                else
                    return true
                end
            end
        end
    end

    return false
end

function DVD.IsVendorActive(vendorID, vendorEntry)
    vendorEntry = vendorEntry or (DVD.FindVendorByExactID and DVD.FindVendorByExactID(vendorID)) or (DVD.npcs and DVD.npcs[vendorID])
    if not vendorEntry then return true end

    local eventID = vendorEntry.worldEventID
    local eventName = vendorEntry.eventName

    if eventID or eventName then
        local active = DVD.IsWorldEventActive(eventID, eventName)
        -- If active is false or nil (loading/inactive), treat as inactive
        if active == false then
            return false
        end
    end

    return true
end
-------------------------------------------------------------------------------
-- Internal source helpers
-------------------------------------------------------------------------------

local function NormalizeMainSource(rawSource)
    if rawSource == nil then
        return nil
    end

    local source =
        string.lower(
            tostring(rawSource)
        )

    source =
        source:gsub(
            "[-_%s]+",
            ""
        )

    return SOURCE_ALIASES[source]
        or "other"
end

local function ForEachSourceValue(sourceTable, callback)
    if type(sourceTable) ~= "table"
    or type(callback) ~= "function" then
        return
    end

    for key, value in pairs(sourceTable) do
        local rawSource

        -- Array form:
        -- { "Vendor", "Achievement" }
        if type(value) == "string" then
            rawSource = value

        -- Object form:
        -- { { sourceType = "Vendor" } }
        elseif type(value) == "table" then
            rawSource =
                value.sourceType
                or value.source
                or value.type

        -- Set form:
        -- { vendor = true }
        elseif value == true
        and type(key) == "string" then
            rawSource = key
        end

        if rawSource then
            callback(rawSource)
        end
    end
end

-------------------------------------------------------------------------------
-- FormatCoords
-- Formats map coordinates as "XX.X, YY.Y".
-------------------------------------------------------------------------------

function Utils.FormatCoords(x, y)
    x = tonumber(x)
    y = tonumber(y)

    if not x
    or not y then
        return "??, ??"
    end

    if x <= 1
    and y <= 1 then
        x = x * 100
        y = y * 100
    end

    return string.format(
        "%.1f, %.1f",
        x,
        y
    )
end

-------------------------------------------------------------------------------
-- GetPlayerMapPosition
-- Returns mapID and normalized player coordinates.
-------------------------------------------------------------------------------

function Utils.GetPlayerMapPosition()
    if not C_Map
    or not C_Map.GetBestMapForUnit
    or not C_Map.GetPlayerMapPosition then
        return nil, nil, nil
    end

    local mapID =
        C_Map.GetBestMapForUnit(
            "player"
        )

    if not mapID then
        return nil, nil, nil
    end

    local position =
        C_Map.GetPlayerMapPosition(
            mapID,
            "player"
        )

    if not position
    or type(position.GetXY) ~= "function" then
        return mapID, nil, nil
    end

    local x, y =
        position:GetXY()

    return mapID, x, y
end

-------------------------------------------------------------------------------
-- PrintMessage
-- Prints a prefixed chat message.
-------------------------------------------------------------------------------

function Utils.PrintMessage(message)
    print(
        tostring(
            C.ADDON_PREFIX
            or "|cff00ccff[Decor Vendor]|r "
        )
        .. tostring(
            message
            or ""
        )
    )
end

-------------------------------------------------------------------------------
-- HexToRGB
-- Converts RGB/RGBA hex into values between 0 and 1.
-------------------------------------------------------------------------------

function Utils.HexToRGB(hex)
    hex =
        tostring(
            hex
            or ""
        )

    hex =
        hex:gsub(
            "#",
            ""
        )

    -- Expand shorthand RGB:
    -- F0A -> FF00AA
    if #hex == 3 then
        hex =
            hex:sub(1, 1)
            .. hex:sub(1, 1)
            .. hex:sub(2, 2)
            .. hex:sub(2, 2)
            .. hex:sub(3, 3)
            .. hex:sub(3, 3)
    end

    if #hex ~= 6
    and #hex ~= 8 then
        return 1, 1, 1, 1
    end

    local red =
        tonumber(
            hex:sub(1, 2),
            16
        )

    local green =
        tonumber(
            hex:sub(3, 4),
            16
        )

    local blue =
        tonumber(
            hex:sub(5, 6),
            16
        )

    local alpha =
        #hex == 8
        and tonumber(
            hex:sub(7, 8),
            16
        )
        or 255

    if not red
    or not green
    or not blue
    or not alpha then
        return 1, 1, 1, 1
    end

    return
        red / 255,
        green / 255,
        blue / 255,
        alpha / 255
end

-------------------------------------------------------------------------------
-- DistanceBetween
-- Calculates two-dimensional distance between coordinate pairs.
-------------------------------------------------------------------------------

function Utils.DistanceBetween(x1, y1, x2, y2)
    x1 = tonumber(x1)
    y1 = tonumber(y1)
    x2 = tonumber(x2)
    y2 = tonumber(y2)

    if not x1
    or not y1
    or not x2
    or not y2 then
        return math.huge
    end

    local dx =
        x2 - x1

    local dy =
        y2 - y1

    return math.sqrt(
        dx * dx
        + dy * dy
    )
end

-------------------------------------------------------------------------------
-- TableCount
-- Returns the number of entries in a table.
-------------------------------------------------------------------------------

function Utils.TableCount(value)
    if type(value) ~= "table" then
        return 0
    end

    local count = 0

    for _ in pairs(value) do
        count = count + 1
    end

    return count
end

-------------------------------------------------------------------------------
-- Multi-acquisition source scanner
-------------------------------------------------------------------------------

function Utils.GetItemSources(item)
    if type(item) ~= "table" then
        return {}
    end

    local present = {}

    local function AddSource(rawSource, isPrimary)
        local sourceType =
            NormalizeMainSource(rawSource)

        if not sourceType then
            return
        end

        local existing =
            present[sourceType]

        if existing then
            if isPrimary then
                existing.isPrimary = true
            end

            return
        end

        present[sourceType] = {
            type = sourceType,

            label =
                SOURCE_LABELS[sourceType]
                or tostring(rawSource),

            isPrimary =
                isPrimary == true,
        }
    end

    -------------------------------------------------
    -- Primary source
    -------------------------------------------------

    local primarySource =
        item.sourceType
        or item.source

    if primarySource
    and primarySource ~= "" then
        AddSource(
            primarySource,
            true
        )
    end

    -------------------------------------------------
    -- Explicit secondary sources
    -------------------------------------------------

    ForEachSourceValue(
        item.sources,
        function(rawSource)
            AddSource(
                rawSource,
                false
            )
        end
    )

    ForEachSourceValue(
        item.additionalSources,
        function(rawSource)
            AddSource(
                rawSource,
                false
            )
        end
    )

    -------------------------------------------------
    -- Inferred achievement source
    -------------------------------------------------

    if item.vendorUnlockAchievement
    or item.vendorUnlockAchievementID
    or item.achievementID
    or (
        item.achievementName
        and item.achievementName ~= ""
    ) then
        AddSource(
            "achievement",
            false
        )
    end

    -------------------------------------------------
    -- Inferred vendor source
    -------------------------------------------------

    if item.vendorID
    or item.soldBy
    or (
        item.vendorName
        and item.vendorName ~= ""
    ) then
        AddSource(
            "vendor",
            false
        )
    end

    -------------------------------------------------
    -- Inferred treasure source
    -------------------------------------------------

    if (
        item.treasureX
        and item.treasureY
    )
    or item.treasureName then
        AddSource(
            "treasure",
            false
        )
    end

    -------------------------------------------------
    -- Return in configured order
    -------------------------------------------------

    local ordered = {}

    for _, sourceType in ipairs(
        SOURCE_PRIORITY
    ) do
        if present[sourceType] then
            table.insert(
                ordered,
                present[sourceType]
            )
        end
    end

    return ordered
end

-------------------------------------------------------------------------------
-- FormatSourcesText
-- Formats source badges using shared label colors.
-------------------------------------------------------------------------------

function Utils.FormatSourcesText(sources)
    if type(sources) ~= "table"
    or #sources == 0 then
        return "Unknown"
    end

    local parts = {}

local labelColors =
    C.LabelColors
    and C.LabelColors.Sources
    or {}

    for index, source in ipairs(sources) do
        local sourceType =
            source.type
            or "other"

        local label =
            source.label
            or SOURCE_LABELS[sourceType]
            or tostring(sourceType)

        local coloredLabel

        if DVD.ColorizeLabel then
            coloredLabel =
                DVD.ColorizeLabel(
                    label,
                    labelColors,
                    sourceType
                )
        else
            local hex =
                labelColors[sourceType]
                or labelColors.other
                or labelColors.Other
                or "999999"

            coloredLabel =
                "|cff"
                .. tostring(hex)
                .. tostring(label)
                .. "|r"
        end

        if index > 1 then
            table.insert(
                parts,
                "|cff888888+|r"
            )
        end

        table.insert(
            parts,
            coloredLabel
        )
    end

    return table.concat(
        parts,
        " "
    )
end
end)(...);
