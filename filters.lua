local addonName, dv = ...
-------------------------------------------------
-- 🔹 Helpers
-------------------------------------------------

function dv.ItemPassesRequirements(itemID)
    local data = dv.decorItem and dv.decorItem[itemID]
    if not data then return true end

    if selectedExpansions and next(selectedExpansions) then
        if data.expansion and not selectedExpansions[data.expansion] then
            return false
        end
    end
    if selectedExpansionz and next(selectedExpansionz) then
        if data.expansion and not selectedExpansionz[data.expansion] then
            return false
        end
    end
    if selectedFactions and next(selectedFactions) then
        if data.faction and not selectedFactions[data.faction] then
            return false
        end
    end

    return true
end
-------------------------------------------------
-- 🔹 Filters
-------------------------------------------------
function dv.BuildVendorFilters()
  local parent = dv.sidebarFilters
  local filters = dv.filters.vendors
	local selectedExpansions = filters.expansions
	local selectedFactions   = filters.factions


    -- wipe old
    for _, child in ipairs({ parent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local y = -6
    local HEADER_X = 12
    local CHECKBOX_X = 20
    local SPACING = 20

    local function Header(text)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", HEADER_X, y)
        fs:SetTextColor(1, 0.82, 0)
        fs:SetText(text)
        y = y - 20
    end

    local function Checkbox(label, tbl, key)
        tbl[key] = tbl[key] or false
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		cb.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
        cb:SetPoint("TOPLEFT", CHECKBOX_X, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])
        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
			dv.filtersJustChanged = true
            BuildVendorUI()
        end)
        y = y - SPACING
    end

-- EXPANSIONS
Header("Expansions")
local seen = {}

-- discover which expansions are actually used
for _, vendor in ipairs(dv.npcs or {}) do
    local exp = vendor.expansion
    if exp then
        seen[exp] = true
    end
end

-- render in defined expansion order
for _, exp in ipairs(dv.EXPANSION_ORDER) do
    if seen[exp] then
        Checkbox(exp, selectedExpansions, exp)
    end
end


    y = y - 10

    -- FACTION
    Header("Faction")

    for _, f in ipairs({ "alliance", "horde", "neutral" }) do
        Checkbox(f, selectedFactions, f)
    end
end

function dv.BuildQuestFilters()


    local parent = dv.sidebarFilters
	local filters = dv.filters.quests
	local selectedExpansionz = filters.expansions
	local selectedFactionz   = filters.factions


    for _, child in ipairs({ parent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local y = -6
    local HEADER_X = 12
    local CHECKBOX_X = 20
    local SPACING = 20

    local function Header(text)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", HEADER_X, y)
        fs:SetTextColor(1, 0.82, 0)
        fs:SetText(text)
        y = y - 20
    end

    local function Checkbox(label, tbl, key)
        tbl[key] = tbl[key] or false
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		cb.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
        cb:SetPoint("TOPLEFT", CHECKBOX_X, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])
        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
			dv.filtersJustChanged = true
            BuildVendorUI()
        end)
        y = y - SPACING
    end
	
-- EXPANSIONS
Header("Expansions")
local seen = {}

-- discover which expansions are actually used
for _, group in ipairs(dv.quests or {}) do
    if group.expansion then
        seen[group.expansion] = true
    end
end

-- render in defined expansion order
for _, exp in ipairs(dv.EXPANSION_ORDER or {}) do
    if seen[exp] then
        Checkbox(exp, selectedExpansionz, exp)
    end
end
	

    y = y - 10

    -- FACTIONS USED IN QUESTS
    Header("Faction")
    selectedFactionz = selectedFactionz or {}
    local found = {}

for _, group in ipairs(dv.quests or {}) do
    for _, quest in ipairs(group.quests or {}) do
        if quest.faction then
            found[string.lower(quest.faction)] = true
        end
    end
end


    for f,_ in pairs(found) do
        Checkbox(f, selectedFactionz, f)
    end
end

function dv.BuildProfessionFilters()
    local parent = dv.sidebarFilters
	local filters = dv.filters.professions
	local selectedProfessions = filters.professions


    for _, child in ipairs({ parent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local y = -6
    local HEADER_X = 12
    local CHECKBOX_X = 20
    local SPACING = 20

    local function Header(text)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", HEADER_X, y)
        fs:SetTextColor(1, 0.82, 0)
        fs:SetText(text)
        y = y - 20
    end

    local function Checkbox(label, tbl, key)
        tbl[key] = tbl[key] or false
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		cb.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
        cb:SetPoint("TOPLEFT", CHECKBOX_X, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])
        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
			dv.filtersJustChanged = true
            BuildVendorUI()
        end)
        y = y - SPACING
    end

    -- CATEGORIES
    Header("Categories")

    for _, group in ipairs(dv.professions or {}) do
        Checkbox(group.name, selectedProfessions, group.name)
    end

    y = y - 10
end

function dv.BuildAchievementFilters()
    local parent = dv.sidebarFilters
	local filters = dv.filters.achievements
	local selectedAchievements = filters.groups
	local selectedFactionz   = filters.factions



    for _, child in ipairs({ parent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local y = -6
    local HEADER_X = 12
    local CHECKBOX_X = 20
    local SPACING = 20

    local function Header(text)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", HEADER_X, y)
        fs:SetTextColor(1, 0.82, 0)
        fs:SetText(text)
        y = y - 20
    end

    local function Checkbox(label, tbl, key)
        tbl[key] = tbl[key] or false
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		cb.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")		
        cb:SetPoint("TOPLEFT", CHECKBOX_X, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])
        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
			dv.filtersJustChanged = true
            BuildVendorUI()
        end)
        y = y - SPACING
    end

    -- CATEGORIES
    Header("Categories")

    for _, group in ipairs(dv.achievements or {}) do
        Checkbox(group.name, selectedAchievements, group.name)
    end

    y = y - 10

    -- FACTION
    Header("Faction")
    local found = {}

for _, group in ipairs(dv.achievements or {}) do
    for _, achieve in ipairs(group.achievements or {}) do
        if achieve.faction then
            found[string.lower(achieve.faction)] = true
        end
    end
end


    for f,_ in pairs(found) do
        Checkbox(f, selectedFactionz, f)
    end
end

function dv.BuildBossDropFilters()
    local parent = dv.sidebarFilters
	local filters = dv.filters.bossdrops
	local selectedBossExpansions = filters.expansions


    -- wipe sidebar
    for _, child in ipairs({ parent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local y = -6

    -- Header builder
    local function Header(text)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", 12, y)
        fs:SetTextColor(1, 0.82, 0)
        fs:SetText(text)
        y = y - 20
    end

    -- Checkbox builder
    local function Checkbox(label, tbl, key)
        tbl[key] = tbl[key] or false
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		cb.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
        cb:SetPoint("TOPLEFT", 20, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])

        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
            dv.filtersJustChanged = true
            BuildVendorUI() -- refresh
        end)

        y = y - 20
    end

    ---------------------------------------------------------
    -- EXPANSIONS (ONLY FILTER WE USE)
    ---------------------------------------------------------
Header("Expansions")

local seenExp = {}

-- discover which expansions are used by boss drops
for _, group in ipairs(dv.bossdrops or {}) do
    if group.expansion then
        seenExp[group.expansion] = true
    end
end

-- render in defined expansion order
for _, exp in ipairs(dv.EXPANSION_ORDER or {}) do
    if seenExp[exp] then
        Checkbox(exp, selectedBossExpansions, exp)
    end
end

end

function dv.ResetSidebarFilters()
    if dv.sidebarFilters then
        dv.sidebarFilters:Hide()
        dv.sidebarFilters:SetParent(nil)
    end

    -- Create a brand-new container
    dv.sidebarFilters = CreateFrame("Frame", "DV_sidebarFilters", dv.sidebar)
    dv.sidebarFilters:SetPoint("TOPLEFT", dv.sidebar, "TOPLEFT", 0, 0)
	dv.sidebarFilters:SetPoint("BOTTOMRIGHT", dv.sidebar, "BOTTOMRIGHT", 0, 40)
end