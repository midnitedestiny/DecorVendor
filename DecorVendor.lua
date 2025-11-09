local HORDE_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\horde"
local ALLIANCE_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\alliance"
local NEUTRAL_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\neutral"

print("DecorVendor loaded")
print("Loaded " .. tostring(#VendorData) .. " vendor categories!")



local function SortVendorData(sortBy)
    -- Optional: define expansion order for correct release order
    local expansionOrder = {
        ["Classic"] = 1,
        ["Classic Dungeon"] = 2,
        ["The Burning Crusade"] = 3,
        ["Wrath of the Lich King"] = 4,
        ["Cataclysm"] = 5,
        ["Mists of Pandaria"] = 6,
        ["Warlords of Draenor"] = 7,
        ["Legion"] = 8,
        ["Legion Argus"] = 9,
        ["Legion Class Hall"] = 10, 
        ["Battle for Azeroth"] = 11,
        ["Shadowlands"] = 12,
        ["Shadowlands Covenant"] = 13,
        ["Dragonflight"] = 14,
        ["Dragonflight Dreamsurge"] = 15,
        ["The War Within"] = 16,
        ["Midnight Coming Soon!"] = 17,
    }

    -- 1️⃣ Sort expansions by release order
    table.sort(VendorData, function(a, b)
        return (expansionOrder[a.name] or 999) < (expansionOrder[b.name] or 999)
    end)

    -- 2️⃣ Sort vendors inside each expansion
    for _, expansion in ipairs(VendorData) do
        if expansion.vendors then
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



vendorSettings = vendorSettings or { scale = 1.0, hideFound = false, completedVendors = {}, minimap = { hide = false } } -- stores UI scale & hide/show visited
local activeWidgets = {}        -- tracks all created lines and headers for clearing
local collapsedHeaders = {}     -- tracks which expansion/vendor group headers are collapsed
local LibDBIcon = LibStub("LibDBIcon-1.0", true)
local minimapButton




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
subtitle:SetText("Track your Player Housing vendors")
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
  GameTooltip:AddLine("More vendors coming soon to the database!", 1, 1, 1, true)
  GameTooltip:Show()
end)

infoIcon:SetScript("OnLeave", function(self)
  GameTooltip:Hide()
end)

-- Close button
local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
closeBtn:SetPoint("TOPRIGHT", -2, -2)
closeBtn:SetSize(28, 28)



-- =====================================
-- 🧭 Faction Filter Dropdown using WoW template
-- =====================================

local factionFilter = "All"
local showVisited = true  -- toggle for visited vendors

-- Create the filter dropdown button using WoW template
local filterButton = CreateFrame("DropdownButton", "DV_FactionFilterDropdown", frame, "WowStyle1FilterDropdownTemplate")
filterButton:SetSize(140, 24)
filterButton:SetPoint("TOPLEFT", 10, -60)
filterButton:SetText("Filters")
filterButton.Text:ClearAllPoints()
filterButton.Text:SetPoint("CENTER")

-- Setup the dropdown menu
filterButton:SetupMenu(function(dropdown, rootDescription)
    -- Hide Visited / Completed toggle
    rootDescription:CreateCheckbox("Hide Completed", 
        function() return not showVisited end,  -- checked if we are hiding visited
        function() showVisited = not showVisited; BuildVendorUI() end
    )

    rootDescription:CreateDivider()

    -- Faction options
    for _, faction in ipairs({"All", "Alliance", "Horde", "Neutral"}) do
        rootDescription:CreateCheckbox(faction,
            function() return factionFilter == faction end,  -- checked if this faction is active
            function() factionFilter = faction; BuildVendorUI() end
        )
    end

    rootDescription:CreateDivider()

    -- Reset Filters button
    rootDescription:CreateButton("Reset Filters", function()
        factionFilter = "All"
        showVisited = true
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
      print("DecorVendor minimap button hidden.")
    else
      LibDBIcon:Show("DecorVendor")
      vendorSettings.showMinimapButton = true
      print("DecorVendor minimap button shown.")
    end
  end
end)


-- Only run if LibDBIcon is loaded
if LibStub and LibStub("LibDBIcon-1.0", true) then
    if not DVDB then DVDB = {} end -- Saved variable table
    local icon = LibStub("LibDBIcon-1.0")

    local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("DecorVendor", {
        type = "launcher",
        text = "DecorVendor",
        icon = "Interface\\AddOns\\DecorVendor\\Assets\\DecorVendor.tga",
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
            tt:AddLine("Left-click to toggle window.", 1, 1, 1)
        end,
    })

    icon:Register("DecorVendor", LDB, DVDB)
end


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

    if collapsedHeaders[group.name] == nil then
        collapsedHeaders[group.name] = true
    end
    local collapsed = collapsedHeaders[group.name]

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
    local percent = totalCount > 0 and math.floor((visibleCount / totalCount) * 100) or 0
    local color
    if percent == 100 then
        color = CreateColor(0.2, 1, 0.2, 1)
    elseif percent >= 50 then
        color = CreateColor(1, 0.82, 0, 1)
    else
        color = CreateColor(0.9, 0.9, 0.9, 1)
    end
    header.progress:SetText(string.format("%d/%d (%d%%)", visibleCount, totalCount, percent))
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
    if TomTom and vendor.mapID and vendor.x and vendor.y then
        local waypointBtn = CreateFrame("Button", nil, line, "UIPanelButtonTemplate")
        waypointBtn:SetSize(80, 18)
        waypointBtn:SetPoint("RIGHT", -240, 0)
        waypointBtn:SetText("Waypoint")

        waypointBtn:SetScript("OnClick", function()
            TomTom:AddWaypoint(vendor.mapID, vendor.x, vendor.y, {
                title = vendor.name .. " - " .. (vendor.zone or ""),
                persistent = false,
                minimap = true,
                world = true,
            })
            print("|cff33ff99DecorVendor:|r Waypoint added for " .. vendor.name)
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

    -- 2️⃣ Loop through each expansion/group
    for _, group in ipairs(VendorData) do
        local totalVendors = group.vendors and #group.vendors or 0
        local visibleVendors = {}

        -- Filter vendors by settings
        for _, vendor in ipairs(group.vendors or {}) do
            local passesHide = not (not showVisited and vendor.completed)
            local passesFaction = (factionFilter == "All" or vendor.faction == factionFilter)

            if passesHide and passesFaction then
                table.insert(visibleVendors, vendor)
            end
        end

        if #visibleVendors > 0 then
            hasContent = true

            -- Create the group header (show visible / total)
            local header, collapsed, newY = CreateVendorHeader(scrollChild, group, y, #visibleVendors, totalVendors)
            y = newY

            -- Create lines for visible vendors if not collapsed
            if not collapsed then
                local originalY = y
                for _, vendor in ipairs(visibleVendors) do
                    if vendor then
                        y = CreateVendorLine(scrollChild, vendor, y)
                    end
                end
                if y < originalY then
                    y = y - 10 -- spacing after group
                end
            end
        end
    end

    -- If no vendors are visible
    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText("All vendors visited or filtered out!\nGreat job!")
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

SLASH_VENDOR1 = "/vendor"
SlashCmdList["VENDOR"] = function()
        BuildVendorUI()
    frame:Show()
end


