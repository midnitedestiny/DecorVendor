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
    "subfaction",
    "friendship",
    "race",
    "neighborhood",
    "Promo",
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
        subfaction = false,
        friendship = false,
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
            local exp = vendor.expansion
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
                    local exp = quest.expansion
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
                    local exp = item.expansion
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        end
    end
    return GetExpansionOptionsFromCounts(counts)
end

-- 4. Achievements / Boss Drops (Handles group.achievements or direct group expansion properties, with item-level overrides)
local function GetGroupExpansionOptions(groups)
    local counts = {}
    for _, group in ipairs(groups or {}) do
        -- Check if it contains inner items arrays (like bossdrops/professions groups)
        if type(group.items) == "table" then
            for _, item in ipairs(group.items) do
                -- Prioritize item-level expansion override, then fallback to group-level expansion
                local exp = item.expansion or group.expansion
                if exp then
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        -- Check if it contains inner achievements arrays
        elseif type(group.achievements) == "table" then
            for _, item in ipairs(group.achievements) do
                local exp = item.expansion or group.expansion
                if exp then
                    counts[exp] = (counts[exp] or 0) + 1
                end
            end
        -- Fallback to group itself having an expansion property
        elseif group.expansion then
            local exp = group.expansion
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
    -- Count items per category across all boss drop groups
    local counts = {}

    for _, group in ipairs(DVD.bossdrops or {}) do
        for _, boss in ipairs(group.items or {}) do
            local cat = boss.category or group.name
            if cat then
                counts[cat] = (counts[cat] or 0) + 1
            end
        end
    end

    local categoryDefs = {
        { key = "daily",    label = "Dailies" },
        { key = "decor",    label = "Decor Specialties" },	
        { key = "delve",    label = "Delves" },
        { key = "dungeon",  label = "Dungeons" },
        { key = "event",    label = "Events" },
        { key = "raid",     label = "Raids" },
        { key = "rare",     label = "Rares" },
        { key = "renown",   label = "Renown" },
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
        { key = "race",         label = "Race Locked" },
        { key = "renown",       label = "Renown" },
        { key = "reputation",   label = "Reputation" },
        { key = "subfaction",   label = "Subfaction" },
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

    y = AddSection(parent, "bossdrops", "expansions", "Expansions", y, GetGroupExpansionOptions(DVD.bossdrops), filters.expansions, false)
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