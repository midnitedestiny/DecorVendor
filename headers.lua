local addonName, dv = ...
local TAB_LEFT_PADDING = {
    vendors = 180,  -- room for sidebar
    professions = 10,
}

function dv.CreateVendorHeader(parent, group, y, completed, total)

    completed = tonumber(completed) or 0
    total     = tonumber(total) or 0

    -- Collapse state per group
    if dv.collapsedHeaders[group.name] == nil then
        dv.collapsedHeaders[group.name] = true
    end

-- 🔥 FILTER-AWARE AUTO COLLAPSE / EXPAND (EXPANSIONS)
if dv.filtersJustChanged then
    if selectedExpansions and selectedExpansions[group.name] then
        dv.collapsedHeaders[group.name] = false
    else
        dv.collapsedHeaders[group.name] = true
    end
end


    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", 0, y)
    header:SetSize(600, 32)

    -- Background
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL",
        CreateColor(0.15, 0.10, 0.25, 0.9),
        CreateColor(0.05, 0.05, 0.15, 0.9)
    )

    -- Collapse icon
    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    header.icon:SetPoint("LEFT", 8, 0)
    header.icon:SetText(dv.collapsedHeaders[group.name] and ">>" or "<<")
    header.icon:SetTextColor(0.8, 0.8, 0.8, 1)

    -- Header title
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(
        string.format("%s (%d/%d found)", group.name or "Unknown", completed, total)
    )

    -- Progress (right)
    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11)
    header.progress:SetPoint("RIGHT", -8, 0)
    header.progress:SetText(string.format("%d/%d found", completed, total))

    -- Progress color
    local color
    if total > 0 and completed == total then
        color = CreateColor(0.2, 1, 0.2, 1)
    elseif completed >= total / 2 then
        color = CreateColor(1, 0.82, 0, 1)
    else
        color = CreateColor(0.9, 0.9, 0.9, 1)
    end
    header.progress:SetTextColor(color:GetRGBA())

    -- Click behavior
    header:SetScript("OnClick", function()
        dv.collapsedHeaders[group.name] = not dv.collapsedHeaders[group.name]
        BuildVendorUI()
    end)

    table.insert(dv.activeWidgets, header)
    return header, dv.collapsedHeaders[group.name], y - 36
end

function dv.CreateProfessionHeader(parent, profession, y, completed, total)
    completed = tonumber(completed) or 0
    total     = tonumber(total) or 0

    if dv.collapsedHeaders["prof_" .. profession.name] == nil then
        dv.collapsedHeaders["prof_" .. profession.name] = true
    end
-- 🔥 AUTO COLLAPSE / EXPAND BASED ON FILTERS
if dv.filtersJustChanged then
    if selectedProfessions and selectedProfessions[profession.name] then
        dv.collapsedHeaders["prof_" .. profession.name] = false
    else
        dv.collapsedHeaders["prof_" .. profession.name] = true
    end
end


    local collapsed = dv.collapsedHeaders["prof_" .. profession.name]

    local header = CreateFrame("Button", nil, parent)
    local pad = TAB_LEFT_PADDING[dv.currentTab] or 10
	header:SetPoint("TOPLEFT", pad, y)
   --header:SetPoint("TOPLEFT", 0, y)    
	header:SetSize(600, 32)

    -- Background
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL",
        CreateColor(0.15, 0.10, 0.25, 0.9),
        CreateColor(0.05, 0.05, 0.15, 0.9)
    )

    -- Collapse icon
    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    header.icon:SetPoint("LEFT", 8, 0)
    header.icon:SetText(collapsed and ">>" or "<<")

    -- Title (LEFT)
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(string.format("%s (%d/%d learned)", profession.name or "Unknown", completed, total))

	    -- Right-side placeholder (optional)
    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11)
    header.progress:SetPoint("RIGHT", -8, 0)
    header.progress:SetText(string.format("%d/%d learned", completed, total))
	
	-- Progress color
    local color
    if total > 0 and completed == total then
        color = CreateColor(0.2, 1, 0.2, 1)
    elseif completed >= total / 2 then
        color = CreateColor(1, 0.82, 0, 1)
    else
        color = CreateColor(0.9, 0.9, 0.9, 1)
    end
    header.progress:SetTextColor(color:GetRGBA())

    -- Click to collapse
    header:SetScript("OnClick", function()
        dv.collapsedHeaders["prof_" .. profession.name] = not collapsed
        BuildVendorUI()
    end)

    table.insert(dv.activeWidgets, header)
    return collapsed, y - 36
end

function dv.CreateAchievementHeader(parent, achievement, y, completed, total)
	completed = tonumber(completed) or 0
    total     = tonumber(total) or 0
	
    -- Accept both string category headers AND table objects
    local headerName
    if type(achievement) == "string" then
        headerName = achievement
    elseif type(achievement) == "table" and achievement.name then
        headerName = achievement.name
    else
        headerName = "Unknown Category"
    end

    -- Build collapse identifier safely
    local collapseKey = "ach_" .. headerName

    if dv.collapsedHeaders[collapseKey] == nil then
        dv.collapsedHeaders[collapseKey] = true
    end

-- 🔥 FILTER-AWARE AUTO COLLAPSE / EXPAND
if dv.filtersJustChanged then
    if selectedCategories and selectedCategories[headerName] then
        dv.collapsedHeaders[collapseKey] = false
    else
        dv.collapsedHeaders[collapseKey] = true
    end
end


    local collapsed = dv.collapsedHeaders[collapseKey]

    local header = CreateFrame("Button", nil, parent)
    local pad = TAB_LEFT_PADDING[dv.currentTab] or 10
    header:SetPoint("TOPLEFT", pad, y)
    header:SetSize(600, 32)

    -- Background gradient
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL",
        CreateColor(0.15, 0.10, 0.25, 0.9),
        CreateColor(0.05, 0.05, 0.15, 0.9)
    )

    -- Collapse icon
    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    header.icon:SetPoint("LEFT", 8, 0)
    header.icon:SetText(collapsed and ">>" or "<<")

    -- Header title
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(string.format("%s (%d/%d completed)", headerName or "Unknown", completed, total))
	
	    -- Right-side placeholder (optional)
    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11)
    header.progress:SetPoint("RIGHT", -8, 0)
    header.progress:SetText(string.format("%d/%d completed", completed, total))
	
	-- Progress color
    local color
    if total > 0 and completed == total then
        color = CreateColor(0.2, 1, 0.2, 1)
    elseif completed >= total / 2 then
        color = CreateColor(1, 0.82, 0, 1)
    else
        color = CreateColor(0.9, 0.9, 0.9, 1)
    end
    header.progress:SetTextColor(color:GetRGBA())

    -- Click to collapse
    header:SetScript("OnClick", function()
        dv.collapsedHeaders[collapseKey] = not dv.collapsedHeaders[collapseKey]
        BuildVendorUI()
    end)

    table.insert(dv.activeWidgets, header)
    return collapsed, y - 36
end

function dv.CreateQuestHeader(parent, questGroup, y, completed, total)
    -- Normalize group name (string OR table)
	completed = tonumber(completed) or 0
    total     = tonumber(total) or 0
	
    local groupName = questGroup.name or tostring(questGroup)

    -- Create unique collapse key
    local collapseKey = "quest_" .. groupName

    -- Initialize collapse state
    if dv.collapsedHeaders[collapseKey] == nil then
        dv.collapsedHeaders[collapseKey] = true
    end

-- 🔥 FILTER-AWARE AUTO COLLAPSE / EXPAND
if dv.filtersJustChanged then
    if selectedCategories and selectedCategories[groupName] then
        dv.collapsedHeaders[collapseKey] = false
    else
        dv.collapsedHeaders[collapseKey] = true
    end
end

    local collapsed = dv.collapsedHeaders[collapseKey]

    -- Create header
    local header = CreateFrame("Button", nil, parent)
    local pad = TAB_LEFT_PADDING[dv.currentTab] or 10
    header:SetPoint("TOPLEFT", pad, y)
    header:SetSize(600, 32)

    -- Background
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL",
        CreateColor(0.15, 0.10, 0.25, 0.9),
        CreateColor(0.05, 0.05, 0.15, 0.9)
    )

    -- Collapse icon
    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    header.icon:SetPoint("LEFT", 8, 0)
    header.icon:SetText(collapsed and ">>" or "<<")

    -- Title label
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(string.format("%s (%d/%d completed)", groupName or "Unknown", completed, total))

    -- Right-side placeholder (optional)
    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11)
    header.progress:SetPoint("RIGHT", -8, 0)
    header.progress:SetText(string.format("%d/%d completed", completed, total))
	
	-- Progress color
    local color
    if total > 0 and completed == total then
        color = CreateColor(0.2, 1, 0.2, 1)
    elseif completed >= total / 2 then
        color = CreateColor(1, 0.82, 0, 1)
    else
        color = CreateColor(0.9, 0.9, 0.9, 1)
    end
    header.progress:SetTextColor(color:GetRGBA())

    -- Collapse behavior
header:SetScript("OnClick", function()
    dv.collapsedHeaders[collapseKey] = not dv.collapsedHeaders[collapseKey]
    BuildVendorUI()
end)

    table.insert(dv.activeWidgets, header)
    return collapsed, y - 36
end

function dv.CreateBossDropHeader(parent, group, collected, total, y)
    local pad = TAB_LEFT_PADDING[dv.currentTab] or 10

    dv.collapsedHeaders = dv.collapsedHeaders or {}
    local key = "boss_" .. group.name
    if dv.collapsedHeaders[key] == nil then dv.collapsedHeaders[key] = true end

    -- AUTO EXPAND based on filter
    if dv.filtersJustChanged then
        if selectedBossExpansions and selectedBossExpansions[group.expansion] then
            dv.collapsedHeaders[key] = false
        else
            dv.collapsedHeaders[key] = true
        end
    end
    ----------------------------------------
    -- COUNT COLLECTED ACROSS ALL BOSSES
    ----------------------------------------
local collected = 0
local total = 0

for _, boss in ipairs(group.items or {}) do
    total = total + 1

    if dv.IsItemCollected(boss.id) then
        collected = collected + 1
    end
end

	
    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", pad, y)
    header:SetSize(600, 32)

    -- background
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL",
        CreateColor(.15, .10, .25, .9),
        CreateColor(.05, .05, .15, .9)
    )

    -- collapse icon
    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    header.icon:SetPoint("LEFT", 8, 0)
    header.icon:SetText(dv.collapsedHeaders[key] and ">>" or "<<")

    -- TITLE
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(group.name)

    -- PROGRESS
    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11)
    header.progress:SetPoint("RIGHT", -10, 0)
    header.progress:SetText(("%d/%d collected"):format(collected, total))

    -- color code progress
    if total > 0 and collected == total then
        header.progress:SetTextColor(0.2,1,0.2)
    elseif collected >= total/2 then
        header.progress:SetTextColor(1,.82,0)
    else
        header.progress:SetTextColor(1,1,1)
    end

    -- click to collapse
    header:SetScript("OnClick", function()
        dv.collapsedHeaders[key] = not dv.collapsedHeaders[key]
        BuildVendorUI()
    end)

    table.insert(dv.activeWidgets, header)

    return dv.collapsedHeaders[key], y - 36
end