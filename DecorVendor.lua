print("DecorVendor loaded")
print("Loaded " .. tostring(#VendorData) .. " vendor categories!")

selectedExpansions = { All = true }
selectedProfessions = { All = true }
selectedFactions = { All = true }


-- Detect TomTom and WaypointUI
local hasTomTom = false
local hasWaypointUI = false



-- Universal addon loaded check (handles Classic + Retail)
local function IsLoaded(addon)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addon)
    elseif IsAddOnLoaded then
        return IsAddOnLoaded(addon)
    end
    return false
end

hasTomTom = IsLoaded("TomTom")
hasWaypointUI = IsLoaded("WaypointUI")

-- ===============================
-- Saved Vendor Settings
-- ===============================
vendorSettings = vendorSettings or {
    scale = 1.0,                       -- UI scale
    hideFound = false,                  -- hide vendors already visited
	useTomTom = true, 
    showMinimapButton = true,           -- show/hide minimap button
    completedVendors = {},              -- tracks visited vendors
    filters = {
    -- Factions
    neutral = true,
    alliance = true,
    horde = true,

    -- Professions
    Tailoring = true,
    Leatherworking = true,
    Jewelcrafting = true,
    Inscription = true,
    Engineering = true,
    Enchanting = true,
    Blacksmithing = true,
    Alchemy = true,
    Cooking = true,

    -- Expansions
    Classic = true,
    ["Burning Crusade"] = true,
    ["Wrath of the Lich King"] = true,
    Cataclysm = true,
    ["Mists of Pandaria"] = true,
    ["Warlords of Draenor"] = true,
    Legion = true,
    ["Battle for Azeroth"] = true,
    Shadowlands = true,
    Dragonflight = true,
    ["The War Within"] = true,
    Midnight = true,
}

}

-- ===============================
-- Minimap Button DB
-- ===============================
DVDB = {
    minimap = {
        hide = false
    }
}

-- ===============================
-- UI Tracking
-- ===============================
local activeWidgets = {}       -- tracks all created lines and headers for clearing
local collapsedHeaders = {}    -- tracks which expansion/vendor group headers are collapsed

-- ===============================
-- Minimap Button Library
-- ===============================
local LibDBIcon = LibStub("LibDBIcon-1.0", true)
local minimapButton



local function SortVendorData(sortBy)

    ----------------------------------------------------
    -- 1️⃣ Sort EXPANSIONS by release order
    ----------------------------------------------------
    local expansionOrder = {
        ["Classic"] = 1,
        ["Burning Crusade"]= 2,
        ["Wrath of the Lich King"] = 3,
        ["Cataclysm"]= 4,
        ["Mists of Pandaria"] = 5,
        ["Warlords of Draenor"] = 6,
        ["Legion"] = 7,
        ["Battle for Azeroth"] = 8,
        ["Shadowlands"] = 9,
        ["Dragonflight"] = 10,
        ["The War Within"] = 11,
        ["Midnight"] = 12,       
        ["Raids"] = 13,
    }

    table.sort(VendorData, function(a, b)
        return (expansionOrder[a.name] or 999) < (expansionOrder[b.name] or 999)
    end)



    ----------------------------------------------------
    -- 2️⃣ SPECIAL HANDLING: Sort continents for ALL expansions
    --     (because each expansion has many 1-continent tables)
    ----------------------------------------------------

    local function SortExpansionContinents(expansionName)
        local idxList = {}
        local tblList = {}

        -- Gather all matching expansion entries
        for i, exp in ipairs(VendorData) do
            if exp.name == expansionName then
                table.insert(idxList, i)
                table.insert(tblList, exp)
            end
        end

        -- Skip expansions with no continent tables
        if #tblList == 0 then return end

        -- Sort by the continent name
        table.sort(tblList, function(a, b)
            local aName = a.continents and a.continents[1] and a.continents[1].name or ""
            local bName = b.continents and b.continents[1] and b.continents[1].name or ""
            return aName < bName
        end)

        -- Put sorted tables back in their same spots
        for n, index in ipairs(idxList) do
            VendorData[index] = tblList[n]
        end
    end

    -- List ALL expansions that need special continent sorting
    local expansionsToSort = {
        "Classic",
        "Burning Crusade",
        "Wrath of the Lich King",
        "Cataclysm",
        "Mists of Pandaria",
        "Warlords of Draenor",
        "Legion",
        "Battle for Azeroth",
        "Shadowlands",
        "Dragonflight",
        "The War Within",
        "Midnight",
    }

    for _, name in ipairs(expansionsToSort) do
        SortExpansionContinents(name)
    end



    ----------------------------------------------------
    -- 3️⃣ Sort vendors within each continent / expansion
    ----------------------------------------------------
    for _, expansion in ipairs(VendorData) do
        if expansion.continents then
            -- Multi-continent structure (or 1 per table)
            for _, continent in ipairs(expansion.continents) do
                table.sort(continent.vendors, function(a, b)			
                    if sortBy == "zone" then
                        if a.zone == b.zone then
                            return a.name < b.name
                        else
                            return a.zone < b.zone
                        end
                    else
                        return a.name < b.name
                    end
                end)
            end

        elseif expansion.vendors then
            -- No continents, vendors directly on expansion
            table.sort(expansion.vendors, function(a, b)
                if sortBy == "zone" then
                    if a.zone == b.zone then
                        return a.name < b.name
                    else
                        return a.zone < b.zone
                    end
                else
                    return a.name < b.name
                end
            end)
        end
    end

end


local function GetFullTexturePath(texturePath)
    if texturePath and not string.match(texturePath, "[\\/]") then
        return "Interface\\AddOns\\DecorVendor\\Assets\\" .. texturePath
    end
    return texturePath
end

local frame = CreateFrame("Frame", "Vendor_MainFrame", UIParent, "BackdropTemplate")
frame:SetSize(650, 500)
frame:SetPoint("CENTER")
frame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = false,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0.02, 0.02, 0.02, 0.95)
frame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
frame:SetMovable(true)
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

 -- Close button
local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
closeBtn:SetPoint("TOPRIGHT", -2, -2)
closeBtn:SetSize(28, 28)

 -- ESC key support
tinsert(UISpecialFrames, frame:GetName())

local supportFrame = CreateFrame("Frame", "DV_SupportFrame", UIParent, "BackdropTemplate")
supportFrame:SetSize(400, 210)
supportFrame:SetPoint("CENTER")
supportFrame:SetBackdrop({
  bgFile = "Interface\\Buttons\\WHITE8x8",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = false,
  edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
supportFrame:SetBackdropColor(0.02, 0.02, 0.02, 0.95)
supportFrame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
supportFrame:SetFrameStrata("DIALOG")
supportFrame:SetMovable(true)
supportFrame:EnableMouse(true)
supportFrame:RegisterForDrag("LeftButton")
supportFrame:SetScript("OnDragStart", supportFrame.StartMoving)
supportFrame:SetScript("OnDragStop", supportFrame.StopMovingOrSizing)
supportFrame:Hide()

local supportTitleBg = supportFrame:CreateTexture(nil, "BACKGROUND")
supportTitleBg:SetTexture("Interface\\Buttons\\WHITE8x8")
supportTitleBg:SetPoint("TOPLEFT", 4, -4)
supportTitleBg:SetPoint("TOPRIGHT", -4, -4)
supportTitleBg:SetHeight(40)
supportTitleBg:SetGradient("VERTICAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))

local supportTitle = supportFrame:CreateFontString(nil, "OVERLAY")
supportTitle:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
supportTitle:SetPoint("TOP", 0, -16)
supportTitle:SetText("Community & Support")
supportTitle:SetTextColor(1, 0.85, 0, 1)

local supportCloseBtn = CreateFrame("Button", nil, supportFrame, "UIPanelCloseButton")
supportCloseBtn:SetPoint("TOPRIGHT", -2, -2)
supportCloseBtn:SetSize(28, 28)

local shareText = supportFrame:CreateFontString(nil, "OVERLAY")
shareText:SetFont(STANDARD_TEXT_FONT, 12)
shareText:SetPoint("TOPLEFT", 20, -60)
shareText:SetText("Please share with your friends!")
shareText:SetTextColor(0.9, 0.9, 0.9, 1)

local shareEditBox = CreateFrame("EditBox", nil, supportFrame, "InputBoxTemplate")
shareEditBox:SetSize(350, 20)
shareEditBox:SetPoint("TOPLEFT", 22, -80)
shareEditBox:SetAutoFocus(false)
shareEditBox:SetText("https://www.curseforge.com/wow/addons/Decor-Vendor")
shareEditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
shareEditBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

local tipText = supportFrame:CreateFontString(nil, "OVERLAY")
tipText:SetFont(STANDARD_TEXT_FONT, 12)
tipText:SetPoint("TOPLEFT", 20, -120)
tipText:SetText("You can leave a tip if you like")
tipText:SetTextColor(0.9, 0.9, 0.9, 1)

local tipEditBox = CreateFrame("EditBox", nil, supportFrame, "InputBoxTemplate")
tipEditBox:SetSize(350, 20)
tipEditBox:SetPoint("TOPLEFT", 22, -140)
tipEditBox:SetAutoFocus(false)
tipEditBox:SetText("https://buymeacoffee.com/midnitedestiny")
tipEditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
tipEditBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

local tipEditBox = CreateFrame("EditBox", nil, supportFrame, "InputBoxTemplate")
tipEditBox:SetSize(350, 20)
tipEditBox:SetPoint("TOPLEFT", 22, -170)
tipEditBox:SetAutoFocus(false)
tipEditBox:SetText("ko-fi.com/midnitedestiny")
tipEditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
tipEditBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

-- Title background
local titleBg = frame:CreateTexture(nil, "BACKGROUND")
titleBg:SetTexture("Interface\\Buttons\\WHITE8x8")
titleBg:SetPoint("TOPLEFT", 4, -4)
titleBg:SetPoint("TOPRIGHT", -4, -4)
titleBg:SetHeight(50)
titleBg:SetGradient("VERTICAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))

-- Title text
local title = frame:CreateFontString(nil, "OVERLAY")
title:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
title:SetPoint("TOP", 0, -14)
title:SetText("The Housing Decor Vendors")
title:SetTextColor(1, 0.85, 0, 1)

-- Subtitle text
local subtitle = frame:CreateFontString(nil, "OVERLAY")
subtitle:SetFont(STANDARD_TEXT_FONT, 11)
subtitle:SetPoint("TOP", title, "BOTTOM", 0, -2)
subtitle:SetText("I spy a Housing Vendor")
subtitle:SetTextColor(0.7, 0.7, 0.7, 1)

--Info Icon
local infoIcon = CreateFrame("Button", nil, frame)
infoIcon:SetSize(24, 24)
infoIcon:SetPoint("TOPLEFT", 8, -8)
local iconTexture = infoIcon:CreateTexture(nil, "ARTWORK")
iconTexture:SetTexture("Interface\\BUTTONS\\UI-GuildButton-PublicNote-Up")
iconTexture:SetAllPoints(infoIcon)
infoIcon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

infoIcon:SetScript("OnEnter", function(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:AddLine("Decor Vendor Tips", 1, 0.82, 0)
  GameTooltip:AddLine("If you see a vendor not listed please inform me on curse!", 1, 1, 1, true)
  GameTooltip:AddLine("Waypoints work mainly with TomTom, or will show WaypointUI skin if you have the addon enabled with TomTom disabled", 1, 1, 1, true)
  GameTooltip:AddLine("Bare with me I am still learning how to code", 1, 1, 1, true)
  GameTooltip:Show()
end)

 infoIcon:SetScript("OnLeave", function(self)
  GameTooltip:Hide()
end)

--Support Icon
local supportIcon = CreateFrame("Button", nil, frame)
supportIcon:SetSize(24, 24)
supportIcon:SetPoint("LEFT", infoIcon, "RIGHT", 6, 0)
local supportIconTexture = supportIcon:CreateTexture(nil, "ARTWORK")
supportIconTexture:SetTexture("Interface\\FriendsFrame\\Battlenet-Portrait")
supportIconTexture:SetAllPoints(supportIcon)
supportIcon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

supportIcon:SetScript("OnEnter", function(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:AddLine("Community & Support", 1, 0.82, 0)
  GameTooltip:AddLine("\nClick to share the addon!", 1, 1, 1, true)
  GameTooltip:Show()
end)

supportIcon:SetScript("OnLeave", function(self)
  GameTooltip:Hide()
end)

supportIcon:SetScript("OnClick", function()
  supportFrame:Show()
end)






-- Unified Filter Dropdown (deduplicates + sorts)
local filterButton = CreateFrame("DropdownButton", "DV_FilterButton", frame, "WowStyle1FilterDropdownTemplate")
filterButton:SetSize(140, 24)
filterButton:SetPoint("TOPLEFT", 10, -60)
filterButton:SetText("The Choices")
filterButton.Text:ClearAllPoints()
filterButton.Text:SetPoint("CENTER")

local function buildUniqueSorted(tbl)
    local out = {}
    for k in pairs(tbl) do table.insert(out, k) end
    table.sort(out, function(a,b) return (a or ""):lower() < (b or ""):lower() end)
    return out
end


filterButton:SetupMenu(function(dropdown, root)
    root:CreateDivider()

-----------------------------------------------------
-- EXPANSIONS (multi-select)
-----------------------------------------------------
local expansionMenu = root:CreateButton("Expansions")

-- Multi-select tracking table
if not selectedExpansions then selectedExpansions = { All = true } end

-- "All" checkbox first
expansionMenu:CreateCheckbox("All",
    function() return selectedExpansions.All end,
    function()
        selectedExpansions = { All = true }
        BuildVendorUI()
    end
)

-- Collect unique expansions
local expansionsSeen = {}
for _, expansion in ipairs(VendorData or {}) do
    if expansion.name then
        expansionsSeen[expansion.name] = true
    end
end

local expansionList = buildUniqueSorted(expansionsSeen)

for _, name in ipairs(expansionList) do
    if name ~= "Professions" then
        expansionMenu:CreateCheckbox(name,
            function() return selectedExpansions[name] end,
            function()
                selectedExpansions[name] = not selectedExpansions[name]
                if selectedExpansions[name] then selectedExpansions.All = false end

                local anySelected = false
                for k,v in pairs(selectedExpansions) do
                    if k ~= "All" and v then anySelected = true end
                end
                if not anySelected then selectedExpansions.All = true end

                BuildVendorUI()
            end
        )
    end
end


root:CreateDivider()

-----------------------------------------------------
-- PROFESSIONS (multi-select)
-----------------------------------------------------
local professionMenu = root:CreateButton("Professions")

if not selectedProfessions then selectedProfessions = { All = true } end

professionMenu:CreateCheckbox("All",
    function() return selectedProfessions.All end,
    function()
        selectedProfessions = { All = true }
        BuildVendorUI()
    end
)

-- Collect unique professions
local professionsSeen = {}
for _, expansion in ipairs(VendorData or {}) do
    for _, vendor in ipairs(expansion.vendors or {}) do
        if vendor.profession and vendor.profession ~= "" then
            professionsSeen[vendor.profession] = true
        end
    end
    for _, continent in ipairs(expansion.continents or {}) do
        for _, vendor in ipairs(continent.vendors or {}) do
            if vendor.profession and vendor.profession ~= "" then
                professionsSeen[vendor.profession] = true
            end
        end
    end
end

local professionList = buildUniqueSorted(professionsSeen)

for _, p in ipairs(professionList) do
    professionMenu:CreateCheckbox(p,
        function() return selectedProfessions[p] end,
        function()
            selectedProfessions[p] = not selectedProfessions[p]
            if selectedProfessions[p] then selectedProfessions.All = false end

            local anySelected = false
            for k,v in pairs(selectedProfessions) do
                if k ~= "All" and v then anySelected = true end
            end
            if not anySelected then selectedProfessions.All = true end

            BuildVendorUI()
        end
    )
end

root:CreateDivider()

-----------------------------------------------------
-- FACTION (multi-select)
-----------------------------------------------------
local factionMenu = root:CreateButton("Faction")

if not selectedFactions then selectedFactions = { All = true } end

-- "All" checkbox first
factionMenu:CreateCheckbox("All",
    function() return selectedFactions.All end,
    function()
        selectedFactions = { All = true }
        BuildVendorUI()
    end
)

local factionsSeen = { Alliance = true, Horde = true, Neutral = true }
local factionList = buildUniqueSorted(factionsSeen)

for _, f in ipairs(factionList) do
    factionMenu:CreateCheckbox(f,
        function() return selectedFactions[f] end,
        function()
            selectedFactions[f] = not selectedFactions[f]
            if selectedFactions[f] then selectedFactions.All = false end

            local anySelected = false
            for k,v in pairs(selectedFactions) do
                if k ~= "All" and v then anySelected = true end
            end
            if not anySelected then selectedFactions.All = true end

            BuildVendorUI()
        end
    )
end

root:CreateDivider()

root:CreateButton("Reset Filters", function()
    selectedExpansions = { All = true }
    selectedProfessions = { All = true }
    selectedFactions = { All = true }
    continentFilter, zoneFilter = "All", "All"
    filterButton:SetText("The Choices")
    BuildVendorUI()
end)
end)


local minimapCheckbox = CreateFrame("CheckButton", "DV_MinimapCheckbox", frame, "UICheckButtonTemplate")
minimapCheckbox:SetPoint("TOPLEFT", filterButton, "TOPRIGHT", 10, 0)
minimapCheckbox:SetSize(26, 26)
local minimapCheckboxText = minimapCheckbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
minimapCheckboxText:SetPoint("LEFT", minimapCheckbox, "RIGHT", 2, 0)
minimapCheckboxText:SetText("Minimap Button")

minimapCheckbox:SetScript("OnClick", function(self)
  if LibDBIcon then
    if vendorSettings.showMinimapButton then
      LibDBIcon:Hide("DecorVendor")
      vendorSettings.showMinimapButton = false
    else
      LibDBIcon:Show("DecorVendor")
      vendorSettings.showMinimapButton = true
    end
  end
end)


-- Scale slider
local scaleSlider = CreateFrame("Slider", "Vendor_ScaleSlider", frame, "UISliderTemplate")
scaleSlider:SetPropagateMouseMotion(true)
scaleSlider:SetWidth(150)
scaleSlider:SetHeight(22)
scaleSlider:SetMinMaxValues(0.5, 1.5)
scaleSlider:SetValueStep(0.05)
scaleSlider:SetPoint("TOPRIGHT", -120, -60)
scaleSlider:SetValue(vendorSettings.scale or 1.0)

-- Scale value text
local scaleValueText = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
scaleValueText:SetFont(STANDARD_TEXT_FONT, 14)
scaleValueText:SetPoint("TOPLEFT", scaleSlider, "TOPRIGHT", 8, -3)
scaleValueText:SetText(string.format("UI Scale: %.2f", vendorSettings.scale or 1.0))

-- Update text on slider move
scaleSlider:SetScript("OnValueChanged", function(_, value)
    local roundedValue = tonumber(string.format("%.2f", value))
    scaleValueText:SetText(string.format("UI Scale: %.2f", roundedValue))
end)

-- Apply scale on mouse release
scaleSlider:SetScript("OnMouseUp", function(self)
    local value = self:GetValue()
    local roundedValue = tonumber(string.format("%.2f", value))
    vendorSettings.scale = roundedValue
    frame:SetScale(roundedValue)
end)

-- Scroll frame for vendor lines
local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "ScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", 12, -90)
scrollFrame:SetPoint("BOTTOMRIGHT", -32, 12)

local scrollChild = CreateFrame("Frame", nil, scrollFrame)
scrollChild:SetSize(620, 1)
scrollFrame:SetScrollChild(scrollChild)

-- Adjust scrollbar position
scrollFrame.ScrollBar:ClearAllPoints()
scrollFrame.ScrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 15, -8)
scrollFrame.ScrollBar:SetHeight(385)

-- Clear previous widgets from scroll child
local function ClearWidgets()
    for _, widget in ipairs(activeWidgets) do
        widget:Hide()
    end
    wipe(activeWidgets)
end


-- Active widgets
local activeWidgets = {}

-- Clear widgets
local function ClearWidgets()
    for _, w in ipairs(activeWidgets) do w:Hide() end
    wipe(activeWidgets)
end

local function CreateVendorHeader(parent, group, y, visibleCount, totalCount)
    visibleCount = visibleCount or 0
    totalCount   = totalCount or (group.vendors and #group.vendors or 0)

    -- If group is an expansion with continents, use "Expansion - Continent" as the key
local headerKey
if group.continents then
    headerKey = group.name -- top-level expansion header
elseif group.parentName then
    -- for continents inside an expansion
    headerKey = group.parentName .. " - " .. group.name
else
    headerKey = group.name
end

-- Initialize collapsed state if nil
if collapsedHeaders[headerKey] == nil then
    collapsedHeaders[headerKey] = true
end
local collapsed = collapsedHeaders[headerKey]


    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", 0, y)
    header:SetSize(600, 32)

    -- Background gradient
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetGradient("HORIZONTAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))
    header.bg = bg

    -- Collapse/expand icon
    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    header.icon:SetPoint("LEFT", 8, 0)
    header.icon:SetText(collapsed and "+" or "−")
    header.icon:SetTextColor(0.8, 0.8, 0.8, 1)

    -- Header main text
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(string.format("%s (%d/%d)", group.name or "Unknown", visibleCount, totalCount))
    header.text:SetTextColor(1, 1, 1, 1)

    -- Progress text
header.progress = header:CreateFontString(nil, "OVERLAY")
header.progress:SetFont(STANDARD_TEXT_FONT, 11)
header.progress:SetPoint("RIGHT", -8, 0)

-- Just show numbers, not percentage
header.progress:SetText(string.format("%d/%d", visibleCount, totalCount))

-- Optional: keep the color based on progress
local color
if totalCount > 0 and visibleCount == totalCount then
    color = CreateColor(0.2, 1, 0.2, 1)
elseif totalCount > 0 and visibleCount >= totalCount / 2 then
    color = CreateColor(1, 0.82, 0, 1)
else
    color = CreateColor(0.9, 0.9, 0.9, 1)
end
header.progress:SetTextColor(color:GetRGBA())


    -- Highlight texture (moved inside the function)
    local highlight = header:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetGradient("HORIZONTAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))

    -- Click and hover scripts
    header:SetScript("OnClick", function()
        collapsedHeaders[group.name] = not collapsed
        BuildVendorUI()
    end)
    header:SetScript("OnEnter", function(self)
        bg:SetGradient("HORIZONTAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))
    end)
    header:SetScript("OnLeave", function(self)
        bg:SetGradient("HORIZONTAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))
    end)

    table.insert(activeWidgets, header)
    return header, collapsed, y - 36
end




-- Create vendor line
local function CreateVendorLine(parent, vendor, y)
    if vendorSettings.hideFound and vendor.completed then return y end

    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", 10, y)
    line:SetSize(590, 22)

    -- Create the text label for the vendor name
    local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("LEFT", 0, 0)
    text:SetText(vendor.name or "Unknown Vendor")
    text:SetFont(STANDARD_TEXT_FONT, 11)

    -- Set the text color based on faction (no more icons)
    if vendor.faction == "Alliance" then
        text:SetTextColor(0.3, 0.6, 1)      -- blue
    elseif vendor.faction == "Horde" then
        text:SetTextColor(1, 0.2, 0.2)      -- red
    else
        text:SetTextColor(0.2, 0.8, 0.3)    -- emerald green
    end

   
    -- Expansion/zone info
    if vendor.zone then
        local zoneText = line:CreateFontString(nil, "OVERLAY")
        zoneText:SetFont(STANDARD_TEXT_FONT, 11)
        zoneText:SetPoint("RIGHT", -10, 0)
        zoneText:SetText(vendor.zone)
        zoneText:SetTextColor(0.7, 0.7, 0.7, 1)
    end
		 

 

     --  Add TomTom waypoint button
   if vendor.mapID and vendor.x and vendor.y then
    local waypointBtn = CreateFrame("Button", nil, line, "UIPanelButtonTemplate")
    waypointBtn:SetSize(80, 18)
    waypointBtn:SetPoint("RIGHT", -240, 0)
    waypointBtn:SetText("Waypoint")

    -- Waypoint tooltip
    local mapInfo = C_Map.GetMapInfo(vendor.mapID)
    local mapName = mapInfo and mapInfo.name or "Unknown"
    local xPct = math.floor(vendor.x * 10000) / 100
    local yPct = math.floor(vendor.y * 10000) / 100
    local coordString = string.format("%s %.2f %.2f", mapName, xPct, yPct)

    waypointBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(vendor.name, 1, 1, 0)
        GameTooltip:AddLine(coordString, 0, 1, 0)
        GameTooltip:Show()
    end)

    waypointBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    waypointBtn:SetScript("OnClick", function()
    -- TomTom waypoint
    if hasTomTom then
        TomTom:AddWaypoint(vendor.mapID, vendor.x, vendor.y, {
            title = vendor.name .. " - " .. (vendor.zone or ""),
            persistent = false,
            minimap = true,
            world = true,
        })
    end

    -- Blizzard default waypoint
    if vendor.mapID and vendor.x and vendor.y then
        local mapPoint = UiMapPoint.CreateFromVector2D(vendor.mapID, CreateVector2D(vendor.x, vendor.y))
        C_Map.SetUserWaypoint(mapPoint)
    end
end)
end


    line:SetScript("OnEnter", function()
        text:SetTextColor(1, 0.82, 0, 1)
        GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
        GameTooltip:SetText(vendor.name, 1, 1, 1)
        if vendor.zone then
            GameTooltip:AddLine("Zone: " .. vendor.zone, 0.8, 0.8, 0.8)
        end
        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function()
       if vendor.faction == "Alliance" then
        text:SetTextColor(0.3, 0.6, 1)      -- blue
    elseif vendor.faction == "Horde" then
        text:SetTextColor(1, 0.2, 0.2)      -- red
    else
        text:SetTextColor(0.2, 0.8, 0.3)    -- emerald green
    end
        GameTooltip:Hide()
    end)

    table.insert(activeWidgets, line)

    return y - 24
end



-- Build the Vendor UI
function BuildVendorUI()
    ClearWidgets()

    local y = 0
    local hasContent = false

    -- 1️⃣ Sync saved completed flags with VendorData
    for _, group in ipairs(VendorData) do
        for _, vendor in ipairs(group.vendors or {}) do
            vendor.completed = vendorSettings.completedVendors[vendor.name] or false
        end
    end
	
	-- Define the expansion order
    local expansionOrder = {
        ["Classic"] = 1,
        ["Burning Crusade"] = 2,
        ["Wrath of the Lich King"] = 3,
        ["Cataclysm"] = 4,
        ["Mists of Pandaria"] = 5,
        ["Warlords of Draenor"] = 6,
        ["Legion"] = 7,
        ["Battle for Azeroth"] = 8,
        ["Shadowlands"] = 9,
        ["Dragonflight"] = 10,
        ["The War Within"] = 11,
        ["Midnight"] = 12,
    }

local expansionsToShow = {}
for _, exp in ipairs(VendorData) do
    -- Skip the "Professions" expansion unless a profession is selected
    if exp.name == "Professions" then
        if not selectedProfessions or selectedProfessions.All then
            -- no profession selected or "All" selected → skip
        else
            table.insert(expansionsToShow, exp)
        end
    else
        -- normal expansions
        if not selectedExpansions or selectedExpansions.All or selectedExpansions[exp.name] then
            table.insert(expansionsToShow, exp)
        end
    end
end



    table.sort(expansionsToShow, function(a, b)
        return (expansionOrder[a.name] or 999) < (expansionOrder[b.name] or 999)
    end)

    -- Loop through each expansion (already filtered and sorted)
    for _, expansion in ipairs(expansionsToShow) do
        local subGroups = expansion.continents
        if not subGroups or #subGroups == 0 then
            subGroups = { expansion }
        end
	
	-- ⭐ Sort your vendor headers alphabetically
table.sort(subGroups, function(a, b)
    return (a.name or "") < (b.name or "")
end)

    for _, subGroup in ipairs(subGroups) do
        local totalVendors = subGroup.vendors and #subGroup.vendors or 0
        local visibleVendors = {}

        for _, vendor in ipairs(subGroup.vendors or {}) do
            -- Attach reference data for filtering
            vendor.expansion = expansion.name
            vendor.continent = subGroup.name or expansion.name

            local passesFaction = (selectedFactions.All or selectedFactions[vendor.faction])
			local passesExpansion = (selectedExpansions.All or selectedExpansions[vendor.expansion])
			local passesContinent = (continentFilter == "All" or vendor.continent == continentFilter)
			local passesZone = (zoneFilter == "All" or vendor.zone == zoneFilter)
			local passesProfession = (selectedProfessions.All or selectedProfessions[vendor.profession])



            if passesFaction and passesExpansion and passesContinent and passesZone and passesProfession then
    table.insert(visibleVendors, vendor)
end

        end

        if #visibleVendors > 0 then
            hasContent = true

            -- Create header
            local header, collapsed, newY = CreateVendorHeader(scrollChild, subGroup, y, #visibleVendors, totalVendors)
            y = newY

            -- Create visible vendor lines
            if not collapsed then
                local originalY = y
                for _, vendor in ipairs(visibleVendors) do
                    y = CreateVendorLine(scrollChild, vendor, y)
                end
                if y < originalY then
                    y = y - 10 -- spacing after group
                end
            end
        end
    end
end




    -- If no vendors are visible
    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText("No Vendors needed for this faction and or expansion!\nGreat job!")
        msg:SetTextColor(0.2, 1, 0.2, 1)
        table.insert(activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

-- Saved settings
if not vendorSettings then vendorSettings = {} end
if not vendorSettings.completedVendors then
    vendorSettings.completedVendors = {}
end

-- UI setup
SortVendorData("zone")
BuildVendorUI()

-- Event handler to mark visited vendors
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")
eventFrame:SetScript("OnEvent", function()
    local name = UnitName("target")
    if not name then return end
    for _, group in ipairs(VendorData) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.name == name then
                vendor.completed = true
                vendorSettings.completedVendors[name] = true
                if vendorSettings.hideFound then
                    BuildVendorUI()
                end
                return
            end
        end
    end
end)








-- Saved settings
if not vendorSettings then vendorSettings = {} end
if not vendorSettings.completedVendors then
    vendorSettings.completedVendors = {}
end

-- UI setup
SortVendorData("zone")
BuildVendorUI()

-- Event handler to mark visited vendors
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")
eventFrame:SetScript("OnEvent", function()
    local name = UnitName("target")
    if not name then return end
    for _, group in ipairs(VendorData) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.name == name then
                vendor.completed = true
                vendorSettings.completedVendors[name] = true
                if vendorSettings.hideFound then
                    BuildVendorUI()
                end
                return
            end
        end
    end
end)


-- ============================
--  Minimap Button (LibDBIcon)
-- ============================

local addonName = ...
local LibDBIcon = LibStub("LibDBIcon-1.0")
local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("DecorVendor", {
    type = "launcher",
    icon = "Interface\\AddOns\\DecorVendor\\Assets\\DecorVendor.tga",
    label = "DecorVendor",
    OnClick = function(_, button)
        if button == "LeftButton" then
            if frame:IsShown() then
                frame:Hide()
            else
                BuildVendorUI()
                frame:Show()
            end
        end
    end,
    OnTooltipShow = function(tt)
        tt:AddLine("DecorVendor")
        tt:AddLine("Left-click to open/close", 1, 1, 1)
    end
})

-- Create initialization frame
local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:SetScript("OnEvent", function(self, event, loadedAddon)
    
    if loadedAddon ~= "DecorVendor" then return end

    -- Ensure SavedVariable exists
if not DVDB then DVDB = {} end
DVDB.minimap = DVDB.minimap or { minimapPos = 225 }  -- only create table if it doesn't exist

-- Register minimap button
LibDBIcon:Register("DecorVendor", LDB, DVDB.minimap)


    self:UnregisterEvent("ADDON_LOADED")
end)



SLASH_DECORVENDOR1 = "/decor"
SLASH_DECORVENDOR2 = "/dv"
SLASH_DECORVENDOR3 = "/decorvendor"
SlashCmdList["DECORVENDOR"] = function()
        BuildVendorUI()
    frame:Show()
end


