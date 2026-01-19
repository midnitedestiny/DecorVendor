local addonName, dv = ...
local COLLECTED_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\collected"

local TAB_LEFT_PADDING = {
    vendors = 180,  -- room for sidebar
    professions = 10,
}

local function IsLoaded(addon)
    return C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded(addon)
end

hasTomTom = IsLoaded("TomTom")
hasWaypointUI = IsLoaded("WaypointUI")

-- Saved Vendor Settings
vendorSettings = vendorSettings or {
    scale = 1.0,
    useTomTom = true,
    showMinimapButton = true,
    closeOnEsc = true,
	visited = {},             
    hideFound = false,     
	markFound = false,
	hideCompleted = false,     
	markCompleted = false,
	showVendorCheckmarks = true,
	completedDrop = {},
}
dbDV = dbDV or {}
dbDV.minimap = dbDV.minimap or { hide = false }

local activeWidgets = {}
local questTitleCache = {}
local dv_optionsCategory = nil
local decorThumbCache = {}
local itemNameCache = {}
local collectionCache = {}
local refreshTimer = nil
local activeWidgets = {}       -- tracks all created lines and headers for clearing
local collapsedHeaders = {}    -- tracks which expansion/vendor group headers are collapsed
local LibDBIcon = LibStub("LibDBIcon-1.0", true)
local minimapButton 
local initialized = false
local BuildSidebarFilters
dv.currentTab = "vendors" 
dv.searchQuery = ""
dv.activeWowheadBox = nil

local function GetFullTexturePath(texturePath)
    if texturePath and not string.match(texturePath, "[\\/]") then
        return "Interface\\AddOns\\DecorVendor\\Assets\\" .. texturePath
    end
    return texturePath
end

function dv.GetHeaderWidth()
    if dv.currentTab == "professions" then
        -- Full width (minus padding)
        return frame:GetWidth() - 40
    else
        -- Vendors tab (respect sidebar width)
        return frame:GetWidth() - frame.sidebar:GetWidth() - 40
    end
end

local function RequestUpdate()
  if refreshTimer then refreshTimer:Cancel() end
  refreshTimer = C_Timer.NewTimer(0.2, function()
    refreshTimer = nil
    if DV_MainFrame and DV_MainFrame:IsShown() then
      BuildVendorUI()
    end
  end)
end

local function GetCachedItemName(itemID)
  if itemNameCache[itemID] then return itemNameCache[itemID], false end
  
  local item = Item:CreateFromItemID(itemID)
  if not item:IsItemEmpty() then
    item:ContinueOnItemLoad(function() 
      itemNameCache[itemID] = item:GetItemName() 
      RequestUpdate() 
    end)
  end
  return "Loading Item...", true
end

local function GetDecorThumbnail(itemID)
    if decorThumbCache[itemID] then
        return decorThumbCache[itemID]
    end

    local decorData = dv.professionItem and dv.professionItem[itemID]
    if not decorData then return nil end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorData.decorID, true)
    if info and info.iconTexture then
        decorThumbCache[itemID] = info.iconTexture
        return info.iconTexture
    end
end

function dv.ItemPassesRequirements(itemID)
	
	local data = dv.professionItem and dv.professionItem[itemID]
	if not data then return true end

	return true
end

local function BuildProfessionLookup()
    dv.itemToProfession = {}
    for _, profession in ipairs(dv.professions or {}) do
        for _, recipe in ipairs(profession.items or {}) do
            dv.itemToProfession[recipe.id] = profession.name
        end
    end
end

local function CountProfessionItems(profession)
    local total = 0
    local completed = 0

    for _, item in ipairs(profession.items or {}) do
        total = total + 1

        -- Optional: if tracking completion later
        if professionSettings and professionSettings.completed
           and professionSettings.completed[item.id] then
            completed = completed + 1
        end
    end

    return completed, total
end

local function IsItemCollected(itemID)
	if vendorSettings.completedDrop[itemID] then return true end
	if collectionCache[itemID] ~= nil then return collectionCache[itemID] end
	local decorID = dv.professionItem[itemID] and dv.professionItem[itemID].decorID
	if not decorID then 
		collectionCache[itemID] = false
		return false 
	end
	local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorID, true)
	if info and info.firstAcquisitionBonus == 0 then
		vendorSettings.completedDrop[itemID] = true
		return true
	end
	collectionCache[itemID] = false
	return false
end

local frame = CreateFrame("Frame", "DV_MainFrame", UIParent, "BackdropTemplate")
frame:SetSize(860, 580)
frame:SetPoint("CENTER")
frame:SetFrameStrata("HIGH")
frame:SetFrameLevel(100)
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

local titleBg = frame:CreateTexture(nil, "BACKGROUND")
titleBg:SetTexture("Interface\\Buttons\\WHITE8x8")
titleBg:SetPoint("TOPLEFT", 4, -4)
titleBg:SetPoint("TOPRIGHT", -4, -4)
titleBg:SetHeight(50)
titleBg:SetGradient("VERTICAL", CreateColor(0.15, 0.10, 0.25, 0.9), CreateColor(0.05, 0.05, 0.15, 0.9))

local title = frame:CreateFontString(nil, "OVERLAY")
title:SetFont(STANDARD_TEXT_FONT, 20, "OUTLINE")
title:SetPoint("TOP", 0, -14)
title:SetText("The Original Decor Vendors")
title:SetTextColor(1, 0.82, 0)
--title:SetTextColor(0, 1, 0.9)

local subtitle = frame:CreateFontString(nil, "OVERLAY")
subtitle:SetFont(STANDARD_TEXT_FONT, 14)
subtitle:SetPoint("TOP", title, "BOTTOM", 0, -2)
subtitle:SetText("I spy a Housing Vendor")
subtitle:SetTextColor(1, 0.82, 0)

local infoIcon = CreateFrame("Button", nil, frame)
infoIcon:SetSize(24, 24)
infoIcon:SetPoint("TOPLEFT", 8, -8)
local iconTexture = infoIcon:CreateTexture(nil, "ARTWORK")
iconTexture:SetTexture("Interface\\BUTTONS\\UI-GuildButton-OfficerNote-Up")
iconTexture:SetAllPoints(infoIcon)
infoIcon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

infoIcon:SetScript("OnEnter", function(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:AddLine("Decor Vendor Notice", 1, 0.82, 0)
  GameTooltip:AddLine("Current Working Version 1.46", 1, 1, 1, true)
  GameTooltip:Show()
end)

 infoIcon:SetScript("OnLeave", function(self)
  GameTooltip:Hide()
end)

local resetBtn = CreateFrame("Button", "DV_ResetProgressBtn", frame, "UIPanelButtonTemplate")
resetBtn:SetSize(120, 22)
-- Position it LEFT of the support icon
resetBtn:SetPoint("LEFT", infoIcon, "RIGHT", 6, 0)
resetBtn:SetText("Reset Progress")
resetBtn:SetScript("OnClick", function()
    StaticPopupDialogs["DV_RESET_VENDORS"] = {
        text = "Reset all vendor progress?\nThis cannot be undone.",
        button1 = "Reset",
        button2 = "Cancel",

        OnAccept = function()
            ResetAllVendors()
            BuildVendorUI()
        end,

        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }

    StaticPopup_Show("DV_RESET_VENDORS")
end)

function dv.ClearWidgets()
    for _, w in ipairs(activeWidgets) do
        w:Hide()
    end
    wipe(activeWidgets)
end

local searchBox = CreateFrame("EditBox", "DV_SearchBox", frame, "SearchBoxTemplate")
searchBox:SetSize(160, 24)
searchBox:SetPoint("TOPRIGHT", -24, -2)
searchBox:SetScale(1.2)
searchBox:SetAutoFocus(false)
searchBox.Instructions:SetText("Search Vendor Names...")

searchBox:SetScript("OnTextChanged", function(self)
    SearchBoxTemplate_OnTextChanged(self)

    -- Save lowercase search text
    dv.searchQuery = string.lower(self:GetText() or "")

    -- Refresh display
    BuildVendorUI()
end)

local function CreateVendorHeader(parent, group, y, completed, total)

    completed = tonumber(completed) or 0
    total     = tonumber(total) or 0

    -- Collapse state per group
    if collapsedHeaders[group.name] == nil then
        collapsedHeaders[group.name] = true
    end

-- 🔥 FILTER-AWARE AUTO COLLAPSE / EXPAND (EXPANSIONS)
if dv.filtersJustChanged then
    if selectedExpansions and selectedExpansions[group.name] then
        collapsedHeaders[group.name] = false
    else
        collapsedHeaders[group.name] = true
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
    header.icon:SetText(collapsedHeaders[group.name] and ">>" or "<<")
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
        collapsedHeaders[group.name] = not collapsedHeaders[group.name]
        BuildVendorUI()
    end)

    table.insert(activeWidgets, header)
    return header, collapsedHeaders[group.name], y - 36
end

local function CreateProfessionHeader(parent, profession, y, completed, total)
    completed = tonumber(completed) or 0
    total     = tonumber(total) or 0

    if collapsedHeaders["prof_" .. profession.name] == nil then
        collapsedHeaders["prof_" .. profession.name] = true
    end
-- 🔥 AUTO COLLAPSE / EXPAND BASED ON FILTERS
if dv.filtersJustChanged then
    if selectedProfessions and selectedProfessions[profession.name] then
        collapsedHeaders["prof_" .. profession.name] = false
    else
        collapsedHeaders["prof_" .. profession.name] = true
    end
end


    local collapsed = collapsedHeaders["prof_" .. profession.name]

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
        collapsedHeaders["prof_" .. profession.name] = not collapsed
        BuildVendorUI()
    end)

    table.insert(activeWidgets, header)
    return collapsed, y - 36
end

local function CreateAchievementHeader(parent, achievement, y, completed, total)
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

    if collapsedHeaders[collapseKey] == nil then
        collapsedHeaders[collapseKey] = true
    end

-- 🔥 FILTER-AWARE AUTO COLLAPSE / EXPAND
if dv.filtersJustChanged then
    if selectedCategories and selectedCategories[headerName] then
        collapsedHeaders[collapseKey] = false
    else
        collapsedHeaders[collapseKey] = true
    end
end


    local collapsed = collapsedHeaders[collapseKey]

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
        collapsedHeaders[collapseKey] = not collapsedHeaders[collapseKey]
        BuildVendorUI()
    end)

    table.insert(activeWidgets, header)
    return collapsed, y - 36
end

local function CreateQuestHeader(parent, questGroup, y, completed, total)
    -- Normalize group name (string OR table)
	completed = tonumber(completed) or 0
    total     = tonumber(total) or 0
	
    local groupName = questGroup.name or tostring(questGroup)

    -- Create unique collapse key
    local collapseKey = "quest_" .. groupName

    -- Initialize collapse state
    if collapsedHeaders[collapseKey] == nil then
        collapsedHeaders[collapseKey] = true
    end

-- 🔥 FILTER-AWARE AUTO COLLAPSE / EXPAND
if dv.filtersJustChanged then
    if selectedCategories and selectedCategories[headerName] then
        collapsedHeaders[collapseKey] = false
    else
        collapsedHeaders[collapseKey] = true
    end
end


    local collapsed = collapsedHeaders[collapseKey]

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
        collapsedHeaders[collapseKey] = not collapsed
        BuildVendorUI()
    end)

    table.insert(activeWidgets, header)
    return collapsed, y - 36
end

local function CreateVendorLine(parent, vendor, y)

    --[[if vendorSettings.hideFound
   and vendorSettings.visited
   and vendorSettings.visited[vendor.id]
then
    return y
end]]


local line = CreateFrame("Button", nil, parent)
line:SetPoint("TOPLEFT", 10, y)
line:SetSize(590, 22)

local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
text:SetPoint("LEFT", 0, 0)
text:SetFont(STANDARD_TEXT_FONT, 12)
text:SetText(vendor.title or "Unknown Vendor")

local isFound =
    vendorSettings.visited
    and vendorSettings.visited[vendor.id]


    -- Faction color
    local function SetFactionColor()
        if vendor.faction == "alliance" then
            text:SetTextColor(0.3, 0.6, 1)
        elseif vendor.faction == "horde" then
            text:SetTextColor(1, 0.2, 0.2)
        else
            text:SetTextColor(0.2, 0.8, 0.3)
        end
    end
    SetFactionColor()
	
	-- VISUAL MARK FOR FOUND VENDORS
if isFound and vendorSettings.markFound then
    text:SetTextColor(0.6, 0.6, 0.6) -- greyed out
    text:SetAlpha(0.7)
end


    -- Zone text
    if vendor.zone then
        local zoneText = line:CreateFontString(nil, "OVERLAY")
        zoneText:SetFont(STANDARD_TEXT_FONT, 11)
        zoneText:SetPoint("RIGHT", -10, 0)
        zoneText:SetText(vendor.zone)
        zoneText:SetTextColor(1, 0.82, 0)
    end

    -- Click → vendor popup
    line:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            dv.ShowVendorPopup(vendor.id, vendor.title)
        end
    end)

    -- Tooltip (ONE handler)
    line:SetScript("OnEnter", function()
        text:SetTextColor(1, 0.82, 0, 1)

        GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
        GameTooltip:AddLine(vendor.title, 1, 1, 1)

        if vendor.zone then
            GameTooltip:AddLine("Zone: " .. vendor.zone, 0.8, 0.8, 0.8)
        end

        if vendor.mapID then
            local mapInfo = C_Map.GetMapInfo(vendor.mapID)
            if mapInfo then
                GameTooltip:AddLine(mapInfo.name, 1, 0.82, 0)
            end
        end

        GameTooltip:AddLine("\n|cff00ff00<Left Click>|r Open Vendor Items", 1, 1, 1)
        GameTooltip:Show()
    end)

line:SetScript("OnLeave", function()
    if isFound and vendorSettings.markFound then
        text:SetTextColor(0.6, 0.6, 0.6)
        text:SetAlpha(0.7)
    else
        SetFactionColor()
        text:SetAlpha(1)
    end
    GameTooltip:Hide()
end)


    if vendor.mapID and vendor.x and vendor.y then
        local waypointBtn = CreateFrame("Button", nil, line, "UIPanelButtonTemplate")
        waypointBtn:SetSize(80, 16)
        waypointBtn:SetPoint("RIGHT", -240, 0)
        waypointBtn:SetText("Waypoint")

        waypointBtn:SetScript("OnClick", function()
            if hasTomTom then
                TomTom:AddWaypoint(
                    vendor.mapID,
                    vendor.x / 100,
                    vendor.y / 100,
                    {
                        title = vendor.title.. " - " .. (vendor.zone or ""),
                        persistent = false,
                        minimap = true,
                        world = true,
                    }
                )
            end

            local vec = CreateVector2D(vendor.x / 100, vendor.y / 100)
            local mapPoint = UiMapPoint.CreateFromVector2D(vendor.mapID, vec)
            C_Map.SetUserWaypoint(mapPoint)
            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end)
    end

    table.insert(activeWidgets, line)
    return y - 20
end

local function StandardizeLineScripts(line, onEnter, onClick, onLeave)
  line:SetScript("OnEnter", onEnter)
  line:SetScript("OnClick", onClick)
  line:SetScript("OnLeave", function(self)
    ResetCursor()
    GameTooltip:Hide()
    smallPreviewFrame:Hide()
    if previewFrame then
      previewFrame:Hide(); previewFrame.model:Hide(); previewFrame.texture:Hide(); previewFrame.currentReward = nil; 
      if line.nextButton then line.nextButton:Hide() end
    end
    if onLeave then onLeave(self) end
  end)
end
--[[
-- Event handler: mark visited vendors when opening a merchant
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")
eventFrame:SetScript("OnEvent", function()
    local targetName = UnitName("target")
    if not targetName or not dv.npcs then return end

    for _, group in ipairs(dv.npcs) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.title == targetName then
                vendorSettings.visited = vendorSettings.visited or {}

                -- If already marked, do nothing
                if vendorSettings.visited[vendor.id] then
                    return
                end

                -- Mark vendor as found
                vendorSettings.visited[vendor.id] = true

                -- 🔄 Rebuild UI if either hide OR mark is enabled
                if vendorSettings.hideFound or vendorSettings.markFound then
                    BuildVendorUI()
                end

                return
            end
        end
    end
end)]]

-- Event handler: mark visited vendors when opening a merchant
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")
eventFrame:SetScript("OnEvent", function()
    local targetName = UnitName("target")
    if not targetName or not dv.npcs then return end

    -- Determine player's faction for comparison
    local playerFaction = UnitFactionGroup("player") -- "Alliance" or "Horde"
    if playerFaction then
        playerFaction = string.lower(playerFaction)
    end

    for _, group in ipairs(dv.npcs) do
        for _, vendor in ipairs(group.vendors or {}) do
            
            -- Normalize vendor faction
            local vFaction = vendor.faction and string.lower(vendor.faction) or nil

            ----------------------------------------------------
            -- Match vendor by BOTH name AND faction if available
            ----------------------------------------------------
            local nameMatches = (vendor.title == targetName)
            local factionMatches = true  -- default if no faction specified

            if vFaction then
                factionMatches = (vFaction == playerFaction)
            end

            if nameMatches and factionMatches then
                vendorSettings.visited = vendorSettings.visited or {}

                -- Already marked
                if vendorSettings.visited[vendor.id] then
                    return
                end

                -- Mark vendor as found
                vendorSettings.visited[vendor.id] = true

                -- Rebuild UI if needed
                if vendorSettings.hideFound or vendorSettings.markFound then
                    BuildVendorUI()
                end

                return
            end
        end
    end
end)

function ResetAllVendors()
    vendorSettings.visited = {}   -- wipe ALL progress
    print("|cff88ff88DecorVendor:|r Vendor progress reset.")
end

local tabBar = CreateFrame("Frame", "DV_TabBar", frame)
tabBar:SetPoint("TOPRIGHT", frame, "TOPLEFT", -4, 0)
tabBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMLEFT", -4, 0)
tabBar:SetWidth(80)

local verticalTabs = {}
dv.currentTab = dv.currentTab or "vendors"

local function CreateVerticalTab(id, text, icon, order, anchor)
    local tab = CreateFrame("Button", nil, tabBar, "BackdropTemplate")
    tab:SetSize(90, 44)

    if anchor == "BOTTOM" then
        tab:SetPoint("BOTTOMLEFT", tabBar, "BOTTOMLEFT", 0, 12)
    else
        tab:SetPoint("TOPLEFT", tabBar, "TOPLEFT", 0, -((order - 1) * 48))
    end

    tab:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })

    local iconT = tab:CreateTexture(nil, "ARTWORK")
    iconT:SetSize(20, 20)
    iconT:SetPoint("TOP", 0, -5)
    iconT:SetTexture(icon)

    local label = tab:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    label:SetPoint("TOP", iconT, "BOTTOM", 0, -2)
    label:SetText(text)

    tab.id = id
    table.insert(verticalTabs, tab)

    tab:SetScript("OnClick", function()
        dv.currentTab = id
        UpdateVerticalTabStyles()
        UpdateSidebarForTab()
        BuildVendorUI()
    end)

    return tab
end

CreateVerticalTab("vendors", "Vendors", "Interface\\Icons\\inv_misc_5potionbag_special", 1)
CreateVerticalTab("professions", "Professions", "Interface\\Icons\\Trade_Tailoring", 2)
CreateVerticalTab("quests", "Quests", "Interface\\Icons\\Inv_misc_note_01", 3)
CreateVerticalTab("achievements", "Achievements", "Interface\\Icons\\achievement_level_100", 4)
CreateVerticalTab("about", "About", "Interface\\Icons\\achievement_character_bloodelf_female", 10)
CreateVerticalTab("support", "Support", "Interface\\Icons\\INV_Misc_Gift_01", 11)
CreateVerticalTab("tips", "Tips", "Interface\\Icons\\achievement_quests_completed_twilighthighlands", nil, "BOTTOM")

--CreateVerticalTab("currency", "Currency", "Interface\\Icons\\inv_misc_coin_01", 7)

function UpdateVerticalTabStyles()
    for _, tab in ipairs(verticalTabs) do
        if dv.currentTab == tab.id then
            tab:SetBackdropColor(0.25, 0.1, 0.35, 1) -- selected
        else
            tab:SetBackdropColor(0.1, 0.1, 0.1, 0.9) -- normal
        end
    end
end

UpdateVerticalTabStyles()

-- SIDEBAR (holds gradient + filters)
frame.sidebar = CreateFrame("Frame", "DV_Sidebar", frame, "BackdropTemplate")
frame.sidebar:SetWidth(170)
frame.sidebar:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -72)
frame.sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 10)

-- Remove backdrop so gradient is visible
frame.sidebar:SetBackdrop(nil)

-- Gradient background
local sbg = frame.sidebar:CreateTexture(nil, "BACKGROUND")
sbg:SetAllPoints()
sbg:SetTexture("Interface\\Buttons\\WHITE8x8")
sbg:SetGradient("VERTICAL",
    CreateColor(0.15, 0.10, 0.25, 0.95),
    CreateColor(0.05, 0.05, 0.15, 0.95)
)

dv.sidebar = frame.sidebar

frame.sidebarFilters = CreateFrame("Frame", nil, frame.sidebar)
frame.sidebarFilters:SetAllPoints()
dv.sidebarFilters = frame.sidebarFilters

local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "ScrollFrameTemplate")
scrollFrame:ClearAllPoints()
scrollFrame:SetPoint("TOPLEFT", frame.sidebar, "TOPRIGHT", 6, 0)
scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -40, 14)

-- Scrollbar (inside scrollFrame)
scrollFrame.ScrollBar:ClearAllPoints()
scrollFrame.ScrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -4, -8)
scrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -4, 8)

-- Scroll child
local scrollChild = CreateFrame("Frame", nil, scrollFrame)
scrollChild:SetSize(520, 1)
scrollFrame:SetScrollChild(scrollChild)

dv.previewFrame = CreateFrame("Frame", "DV_RewardFrame", UIParent, "BackdropTemplate")
local preview = dv.previewFrame
preview:SetSize(300, 330)
preview:SetFrameStrata("TOOLTIP")
preview:SetBackdrop({
    bgFile   = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets   = { left = 4, right = 4, top = 4, bottom = 4 }
})
preview:SetBackdropColor(0.05, 0.05, 0.05, 0.98)
preview:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
preview:Hide()

preview.title = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
preview.title:SetFont(STANDARD_TEXT_FONT, 15)
preview.title:SetPoint("TOP", 0, -12)
preview.title:SetWidth(280)
preview.title:SetTextColor(1, 0.82, 0)

preview.texture = preview:CreateTexture(nil, "ARTWORK")
preview.texture:SetSize(288, 288)
preview.texture:SetPoint("BOTTOM", 0, 6)
preview.texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
preview.texture:Hide()

preview.model = CreateFrame("PlayerModel", nil, preview)
local model = preview.model
model:SetSize(288, 288)
model:SetPoint("BOTTOM", 0, 6)
model:SetScript("OnModelLoaded", function(self)
    self:MakeCurrentCameraCustom()

    local modelID = self:GetModelFileID()
    local posData = dv.modelPositions[modelID]

    if posData then
        self:SetPosition(posData.model_x, 0, posData.model_z)
        self:SetCameraPosition(0, 0, posData.camera_y)
        self:SetCameraDistance(posData.zoom)
    else
        -- Default camera setup
        self:SetPosition(0, 0, 0)
        self:SetCameraPosition(0, 0, 4)
        self:SetCameraDistance(10)
    end
end)
model:Hide()

-- Rotation
local rotation = 0
preview:SetScript("OnUpdate", function(self, elapsed)
    if self:IsShown() and self.model:IsShown() then
        rotation = rotation + elapsed * 0.4
        self.model:SetFacing(rotation)
    end
end)

dv.smallPreviewFrame = CreateFrame("Frame", "DV_SmallPreviewFrame", UIParent, "BackdropTemplate")
local small = dv.smallPreviewFrame
small:SetSize(220, 220)
small:SetFrameStrata("TOOLTIP")
small:SetBackdrop({
    bgFile   = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 14,
    insets   = { left = 4, right = 4, top = 4, bottom = 4 }
})
small:SetBackdropColor(0, 0, 0, 0.95)
small:SetBackdropBorderColor(0.6, 0.6, 0.6)
small:Hide()

dv.smallPreviewTexture = dv.smallPreviewFrame:CreateTexture(nil, "ARTWORK")
dv.smallPreviewTexture:SetPoint("TOPLEFT", 4, -4)
dv.smallPreviewTexture:SetPoint("BOTTOMRIGHT", -4, 4)
dv.smallPreviewTexture:SetTexCoord(0.08, 0.92, 0.08, 0.92)

function dv.ShowPreviewTexture(texture, title)
    preview.model:Hide()
    preview.texture:SetTexture(texture)
    preview.texture:Show()
    preview.title:SetText(title or "Decor Preview")
    preview:Show()
end

function dv.ShowPreviewModel(modelFileID, title)
    preview.texture:Hide()
    preview.model:SetModel(modelFileID)
    preview.model:SetFacing(0)
    preview.model:Show()
    preview.title:SetText(title or "Decor Preview")
    preview:Show()
end

function dv.HidePreview()
    preview:Hide()
    small:Hide()
end

function dv.AnchorPreviewBelowTooltip(preview, tooltip)
    preview:ClearAllPoints()
    preview:SetParent(tooltip)
    preview:SetPoint("TOP", tooltip, "BOTTOM", 0, -4)  -- 4 px gap

    preview:Show()
end

function dv:GetWowheadLink(id, rewardType)
    if rewardType == "quest" then
        return "https://www.wowhead.com/quest=" .. tostring(id)
    elseif rewardType == "item" then
        return "https://www.wowhead.com/item=" .. tostring(id)
    else
        return "https://www.wowhead.com/achievement=" .. tostring(id)
    end
end

function dv.GetDecorIconByItemID(itemID)
    local decorData = dv.professionItem and dv.professionItem[itemID]
    if not decorData or not decorData.decorID then
        return nil
    end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(
        1,                  -- Catalog type (1 = housing)
        decorData.decorID,  -- Decor record ID
        true                -- force cache
    )

    return info and info.iconTexture
end

function dv.IsDecorOwned(itemID)
    local decor = dv.professionItem[itemID]
    if not decor then return false end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(
        1,
        decor.decorID,
        true
    )

    return info and info.isOwned
end

function dv.GetVendorInfo(vendorID)
    if not vendorID or not dv.npcs then return nil end

    for _, group in ipairs(dv.npcs) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.id == vendorID then
                -- Attach useful context (optional but recommended)
                vendor.groupName = group.name
                vendor.expansion = group.expansion
                return vendor
            end
        end
    end

    return nil
end

if not tContains(UISpecialFrames, "DV_VendorPopup") then
    tinsert(UISpecialFrames, "DV_VendorPopup")
end

local vendorPopup = CreateFrame("Frame", "DV_VendorPopup", UIParent, "BackdropTemplate")
vendorPopup:SetSize(350, 100)
vendorPopup:SetPoint("CENTER")
vendorPopup:SetFrameStrata("DIALOG")
vendorPopup:Hide()
vendorPopup:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
vendorPopup:SetBackdropColor(0.1, 0.1, 0.1, 1)
vendorPopup:SetBackdropBorderColor(0.64, 0.64, 0.64, 1)
vendorPopup:EnableMouse(true)
vendorPopup:SetMovable(true)
vendorPopup:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)
vendorPopup:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)

local popupGradient = vendorPopup:CreateTexture(nil, "BACKGROUND")
popupGradient:SetPoint("TOPLEFT", 4, -4)
popupGradient:SetPoint("BOTTOMRIGHT", -4, 4)
popupGradient:SetColorTexture(1, 1, 1, 1)
popupGradient:SetGradient("VERTICAL", CreateColor(0.12, 0.12, 0.12, 1), CreateColor(0.05, 0.05, 0.05, 1))

local popupIconCache = {} 

vendorPopupTitle = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
vendorPopupTitle:SetPoint("TOP", 0, -12)
vendorPopupTitle:SetText("Vendor Goodies")
vendorPopupTitle:SetTextColor(1, 0.82, 0)

local vendorPopupHiddenText = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
vendorPopupHiddenText:SetFont(STANDARD_TEXT_FONT, 12)
vendorPopupHiddenText:SetTextColor(0.9, 0.9, 0.9, 1)
vendorPopupHiddenText:SetPoint("TOP", vendorPopupTitle, "BOTTOM", 0, -2)
vendorPopupHiddenText:Hide()
vendorPopup.hiddenText = vendorPopupHiddenText

local titleSeparator = vendorPopup:CreateTexture(nil, "ARTWORK")
titleSeparator:SetHeight(2)
titleSeparator:SetColorTexture(0.4, 0.4, 0.4, 0.8)
titleSeparator:SetPoint("TOPLEFT", 10, -36)
titleSeparator:SetPoint("TOPRIGHT", -10, -36)

local recipeTitle = vendorPopup:CreateFontString(nil, "OVERLAY")
recipeTitle:SetFont(STANDARD_TEXT_FONT, 14); recipeTitle:SetText("Recipe:"); recipeTitle:Hide()

vendorPopup.closeBtn = CreateFrame("Button", nil, vendorPopup, "UIPanelCloseButton")
vendorPopup.closeBtn:SetPoint("TOPRIGHT", 0, 0)
vendorPopup.closeBtn:SetSize(30, 30)
vendorPopup.closeBtn:SetScript("OnClick", function() vendorPopup:Hide() end)

vendorPopup.content = CreateFrame("Frame", nil, vendorPopup)
vendorPopup.content:SetPoint("TOPLEFT", 12, -44) 
vendorPopup.content:SetPoint("BOTTOMRIGHT", -12, 12)

local function GetPopupIconFrame(index)
	local container = popupIconCache[index]
	if not container then
		container = CreateFrame("Frame", nil, vendorPopup)
		container:SetSize(50, 50) 
		
		local borderFrame = CreateFrame("Frame", nil, container, "BackdropTemplate")
		borderFrame:SetSize(50, 50)
		borderFrame:SetPoint("TOP")
		borderFrame:SetBackdrop({ edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 2 })
		borderFrame:SetClipsChildren(true)
		container.borderFrame = borderFrame
		
		local btn = CreateFrame("Button", nil, borderFrame)
		btn:SetAllPoints(borderFrame)
		btn:RegisterForClicks("AnyUp")
		container.btn = btn
		
		local glow = btn:CreateTexture(nil, "BACKGROUND")
		glow:SetPoint("TOPLEFT", -2, 2); glow:SetPoint("BOTTOMRIGHT", 2, -2)
		glow:SetColorTexture(0, 0, 0, 0.5)
		container.glow = glow
		
		local icon = btn:CreateTexture(nil, "ARTWORK")
		icon:SetPoint("TOPLEFT", 2, -2); icon:SetPoint("BOTTOMRIGHT", -2, 2)
		icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		container.icon = icon
		
		local checkFrame = CreateFrame("Frame", nil, container)
		checkFrame:SetSize(18, 18)
		checkFrame:SetPoint("BOTTOM", 0, -10)
		checkFrame:SetFrameLevel(borderFrame:GetFrameLevel() + 10)
		checkFrame:Hide()
		
		local checkTex = checkFrame:CreateTexture(nil, "ARTWORK")
		checkTex:SetAllPoints()
		checkTex:SetTexture(COLLECTED_ICON_TEXTURE)
		checkFrame.texture = checkTex
		
		container.checkFrame = checkFrame

		local countBar = CreateFrame("Frame", nil, container)
		countBar:SetSize(50, 16)
		countBar:SetPoint("TOP", borderFrame, "BOTTOM", 0, 0)
		container.countBar = countBar
		
		local countBg = countBar:CreateTexture(nil, "BACKGROUND")
		countBg:SetAllPoints()
		countBg:SetColorTexture(0, 0, 0, 1) 
		
		local countText = countBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		countText:SetFont(STANDARD_TEXT_FONT, 14, nil) 
		countText:SetTextColor(1, 1, 1, 1)
		countText:SetPoint("CENTER", countBar, "CENTER", 0, 0)
		container.countText = countText
		btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
		btn:GetHighlightTexture():SetBlendMode("ADD"); btn:GetHighlightTexture():SetAllPoints(icon)
		table.insert(popupIconCache, container)
	end
	return container
end

function PopupButton_OnEnter(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    if self.isReagent or self.isRecipe then
        SetCursor("CAST_CURSOR")
        borderFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
        glow:SetColorTexture(1, 0.82, 0, 0.2)
    else
        SetCursor("INSPECT_CURSOR")
        if self.isCollected then
            borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
            glow:SetColorTexture(1, 1, 1, 0.1)
        else
            borderFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
            glow:SetColorTexture(1, 0.82, 0, 0.2)
        end
    end

    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetHyperlink("item:" .. self.itemID)
    GameTooltip:Show()
end

function PopupButton_OnLeave(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    ResetCursor()

    if self.isReagent or self.isRecipe or not self.isCollected then
        borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    else
        borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
    end

    glow:SetColorTexture(0, 0, 0, 0.5)
    GameTooltip:Hide()
end

function PopupButton_OnClick(self, button)
    if IsModifiedClick("CHATLINK") then
        local _, link = GetItemInfo(self.itemID)
        if link then
            ChatEdit_InsertLink(link)
        end
    elseif (self.isReagent or self.isRecipe) and (button == "LeftButton" or button == "RightButton") then
        if dv.ShowWowheadLinkPopup then
            dv.ShowWowheadLinkPopup(self.itemID, "item")
        end
    elseif button == "LeftButton" then
        DressUpItemLink("item:" .. self.itemID)
    end
end

local function SetupPopupButton(container, data, typeStr)
	local btn = container.btn
	local borderFrame = container.borderFrame
	local itemID = data.id
	btn.itemID = itemID
	btn.isReagent = (typeStr == "reagent")
	btn.isRecipe = (typeStr == "recipe")
	btn.isCollected = false
	if typeStr == "vendor" then
		btn.isCollected = IsItemCollected(itemID)
		borderFrame:SetBackdropBorderColor(btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, 1)
		
		if btn.isCollected and vendorSettings.showVendorCheckmarks then 
			container.checkFrame:Show() 
		else 
			container.checkFrame:Hide() 
		end
		
		container:SetSize(50, 50)
		container.countBar:Hide()
	elseif typeStr == "reagent" then
		borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
		container.checkFrame:Hide()
		container:SetSize(50, 66)
		container.countText:SetText(data.amount or 1)
		container.countBar:Show()
	else
		borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
		container.checkFrame:Hide()
		container:SetSize(50, 50)
		container.countBar:Hide()
	end
	local texture = GetItemIcon(itemID)
	container.icon:SetTexture(texture or (typeStr == "recipe" and "Interface\\Icons\\INV_Scroll_03" or "Interface\\Icons\\INV_Misc_QuestionMark"))
	btn:SetScript("OnEnter", PopupButton_OnEnter)
	btn:SetScript("OnLeave", PopupButton_OnLeave)
	btn:SetScript("OnClick", PopupButton_OnClick)
	container:Show()
end

local function LayoutPopupItems(items, typeStr, startIndex, startX, startY, verticalStep)
	local tileSize, margin, columns = 50, 12, 6
	local i = startIndex
	for _, item in ipairs(items) do
		local container = GetPopupIconFrame(i + 1)
		local col = i % columns
		local row = math.floor(i / columns)
		container:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", startX + (col * (tileSize + margin)), startY - (row * verticalStep))
		SetupPopupButton(container, typeStr == "vendor" and {id = item} or item, typeStr)
		i = i + 1
	end
	local totalRows = math.floor((i - startIndex - 1) / columns) + 1
	local totalHeight = math.abs(startY) + (totalRows * verticalStep)
	return i, totalHeight
end

function dv.ShowVendorPopup(vendorID, vendorName)
	if not vendorID or not dv.vendorGoodies or not dv.vendorGoodies[vendorID] then return end
	
	currentPopupVendorID = vendorID
	currentPopupNpcName = vendorName or currentPopupNpcName

	local allItems = dv.vendorGoodies[vendorID]
	
	local addedItems = {}
	local totalCount = #allItems
	local hiddenCount = 0
	
	for _, itemID in ipairs(allItems) do
		if dv.ItemPassesRequirements(itemID) then
			table.insert(addedItems, itemID)
		else
			hiddenCount = hiddenCount + 1
		end
	end

	vendorPopupTitle:SetText((currentPopupNpcName or "Vendor") .. " has these items:")
		
	recipeTitle:Hide()
	for _, frame in pairs(popupIconCache) do frame:Hide() end
	
	local topOffset = -48
	if hiddenCount > 0 then
		vendorPopup.hiddenText:SetText("(" .. hiddenCount .. " hidden)")
		vendorPopup.hiddenText:Show()
		titleSeparator:SetPoint("TOPLEFT", 10, -50)
		titleSeparator:SetPoint("TOPRIGHT", -10, -50)
		topOffset = -62
	else
		vendorPopup.hiddenText:Hide()
		titleSeparator:SetPoint("TOPLEFT", 10, -36)
		titleSeparator:SetPoint("TOPRIGHT", -10, -36)
	end
	
	local tileSize, margin = 50, 12
	local columns = 6
	local _, height = LayoutPopupItems(addedItems, "vendor", 0, 25, topOffset, tileSize + margin)
	local totalWidth = (25 * 2) + (columns * (tileSize + margin)) - margin
	vendorPopup:SetSize(totalWidth, height + 4)
	vendorPopup:Show()
end

if not tContains(UISpecialFrames, "DV_ReagentsPopup") then
    tinsert(UISpecialFrames, "DV_ReagentsPopup")
end
dv.reagentsPopup = dv.reagentsPopup or CreateFrame("Frame", "DV_ReagentsPopup", UIParent, "BackdropTemplate")
local rpopup = dv.reagentsPopup
rpopup:SetSize(320, 140)
rpopup:SetPoint("CENTER")
rpopup:SetFrameStrata("DIALOG")
rpopup:SetClampedToScreen(true)
rpopup:Hide()

rpopup:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
rpopup:SetBackdropColor(0.1, 0.1, 0.1, 1)
rpopup:SetBackdropBorderColor(0.64, 0.64, 0.64, 1)

local rgrad = rpopup:CreateTexture(nil, "BACKGROUND")
rgrad:SetPoint("TOPLEFT", 4, -4)
rgrad:SetPoint("BOTTOMRIGHT", -4, 4)
rgrad:SetColorTexture(1, 1, 1, 1)
rgrad:SetGradient("VERTICAL", CreateColor(0.12, 0.12, 0.12, 1), CreateColor(0.05, 0.05, 0.05, 1))

rpopup.title = rpopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
rpopup.title:SetPoint("TOP", 0, -12)
rpopup.title:SetTextColor(1, 0.82, 0)
rpopup.title:SetText("Reagents that are Needed")

local rsep = rpopup:CreateTexture(nil, "ARTWORK")
rsep:SetHeight(2)
rsep:SetColorTexture(0.4, 0.4, 0.4, 0.8)
rsep:SetPoint("TOPLEFT", 10, -36)
rsep:SetPoint("TOPRIGHT", -10, -36)

rpopup.content = CreateFrame("Frame", nil, rpopup)
rpopup.content:SetPoint("TOPLEFT", 12, -44)
rpopup.content:SetPoint("BOTTOMRIGHT", -12, 12)

rpopup.recipeFrame = CreateFrame("Button", nil, rpopup.content)
rpopup.recipeFrame:SetSize(260, 40)
rpopup.recipeFrame:SetPoint("TOPLEFT", rpopup.content, "TOPLEFT", 0, 0)
rpopup.recipeFrame:Hide()

rpopup.recipeIcon = rpopup.recipeFrame:CreateTexture(nil, "ARTWORK")
rpopup.recipeIcon:SetSize(40, 40)
rpopup.recipeIcon:SetPoint("LEFT", 0, 0)
rpopup.recipeIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

rpopup.recipeText = rpopup.recipeFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
rpopup.recipeText:SetPoint("LEFT", rpopup.recipeIcon, "RIGHT", 8, 0)
rpopup.recipeText:SetJustifyH("LEFT")
rpopup.recipeText:SetWidth(200)
rpopup.recipeText:SetWordWrap(false)
rpopup.recipeText:SetMaxLines(1)
rpopup.recipeFrame:SetScript("OnEnter", function(self)
    if not self.recipeID then return end

    GameTooltip:SetOwner(self, "ANCHOR_NONE")
    GameTooltip:ClearAllPoints()

    -- Anchor tooltip BELOW the reagents popup
    GameTooltip:SetPoint(
        "TOP",
        rpopup,
        "BOTTOM",
        0,
        -6
    )

    GameTooltip:SetHyperlink("item:" .. self.recipeID)
    GameTooltip:Show()
end)

rpopup.recipeFrame:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

rpopup.recipeFrame:SetScript("OnClick", function(self)
    if dv.ShowWowheadLinkPopup then
        dv.ShowWowheadLinkPopup(self.recipeID, "item")
    end
end)

rpopup.closeBtn = CreateFrame("Button", nil, rpopup, "UIPanelCloseButton")
rpopup.closeBtn:SetPoint("TOPRIGHT", 0, 0)
rpopup.closeBtn:SetSize(30, 30)
rpopup.closeBtn:SetScript("OnClick", function() rpopup:Hide() end)
rpopup:EnableMouse(true)
rpopup:SetMovable(true)
rpopup:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then self:StartMoving() end
end)
rpopup:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then self:StopMovingOrSizing() end
end)

dv.reagentIconCache = dv.reagentIconCache or {}

local function GetReagentIconFrame(i)
    local f = dv.reagentIconCache[i]
    if f then f:Show(); return f end

    f = CreateFrame("Frame", nil, rpopup.content, "BackdropTemplate")
    f:SetSize(50, 66)
    f:SetBackdrop({ edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 2 })
    f:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    f:SetClipsChildren(true)

    local btn = CreateFrame("Button", nil, f)
    btn:SetAllPoints()
    btn:RegisterForClicks("AnyUp")
    f.btn = btn

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", 2, -2)
    icon:SetPoint("BOTTOMRIGHT", -2, 18)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    f.icon = icon

    local countBg = f:CreateTexture(nil, "BACKGROUND")
    countBg:SetPoint("BOTTOMLEFT", 0, 0)
    countBg:SetPoint("BOTTOMRIGHT", 0, 0)
    countBg:SetHeight(16)
    countBg:SetColorTexture(0, 0, 0, 1)

    local countText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    countText:SetPoint("BOTTOM", 0, 2)
    countText:SetTextColor(1, 1, 1, 1)
    f.countText = countText

    btn:SetScript("OnEnter", function(self)
        SetCursor("CAST_CURSOR")
        f:SetBackdropBorderColor(1, 0.82, 0, 1)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink("item:" .. self.itemID)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function()
        ResetCursor()
        f:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        GameTooltip:Hide()
    end)
    btn:SetScript("OnClick", function(self)
        if dv.ShowWowheadLinkPopup then
            dv.ShowWowheadLinkPopup(self.itemID, "item")
        end
    end)

    dv.reagentIconCache[i] = f
    return f
end

function dv.ShowReagentsPopup(itemData)
    if not itemData or not itemData.reagents or #itemData.reagents == 0 then return end

    -- Hide old reagent icons
    for _, f in pairs(dv.reagentIconCache) do f:Hide() end

    local yOffset = 0

    -- ===============================
    -- SHOW RECIPE (if exists)
    -- ===============================
    if itemData.recipe then
        rpopup.recipeFrame.recipeID = itemData.recipe
        rpopup.recipeIcon:SetTexture(GetItemIcon(itemData.recipe) or "Interface\\Icons\\INV_Scroll_03")

        local recipeName = GetItemInfo(itemData.recipe) or "Recipe"
        rpopup.recipeText:SetText(recipeName)

        rpopup.recipeFrame:Show()
        yOffset = -44
    else
        rpopup.recipeFrame:Hide()
    end

    -- ===============================
    -- REAGENTS
    -- ===============================
    local tileSize, spacing = 50, 12
    for i, reagent in ipairs(itemData.reagents) do
        local f = GetReagentIconFrame(i)
        f:ClearAllPoints()
        f:SetPoint(
            "TOPLEFT",
            rpopup.content,
            "TOPLEFT",
            (i - 1) * (tileSize + spacing),
            yOffset
        )

        f.btn.itemID = reagent.id
        f.icon:SetTexture(GetItemIcon(reagent.id) or "Interface\\Icons\\INV_Misc_QuestionMark")
        f.countText:SetText(reagent.amount or 1)
        f:Show()
    end

    local width = (#itemData.reagents * (tileSize + spacing)) - spacing
    rpopup:SetWidth(math.max(260, width + 24))
    rpopup:SetHeight(itemData.recipe and 190 or 140)
    rpopup:SetScale(vendorSettings and vendorSettings.scale or 1.0)
    rpopup:Show()
end

local function CreateOptionsPanel() 
    local configFrame = CreateFrame("Frame", "DV_ConfigFrame", UIParent)
    configFrame.name = "Decor Vendor"
    local title = configFrame:CreateFontString(nil, "ARTWORK")
    title:SetFont(STANDARD_TEXT_FONT, 16)
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Decor Vendor Settings")

    ---------------------------
    -- MINIMAP CHECKBOX
    ---------------------------
    local minimapCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    minimapCheck:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -20)
    minimapCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
    minimapCheck.Text:SetTextColor(1, 0.82, 0)
    minimapCheck.Text:SetText(" Minimap Button")
	minimapCheck:SetChecked(vendorSettings.showMinimapButton)
    minimapCheck:SetScript("OnClick", function(self)
    local show = self:GetChecked()

    vendorSettings.showMinimapButton = show
    dbDV.minimap.hide = not show   -- VERY IMPORTANT!

    if LibDBIcon then
        if show then
            LibDBIcon:Show("DecorVendor")
        else
            LibDBIcon:Hide("DecorVendor")
        end
    end
end)

    ---------------------------
    -- ESC TO CLOSE
    ---------------------------
    local escCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    escCheck:SetPoint("TOPLEFT", minimapCheck, "BOTTOMLEFT", 0, -12)
    escCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
    escCheck.Text:SetText(" Escape to Close")
    escCheck:SetChecked(vendorSettings.closeOnEsc)
    escCheck:SetScript("OnClick", function(self)
        vendorSettings.closeOnEsc = self:GetChecked()
    UpdateEscBehavior()end)
	
	----------------------------------
	-- HIDE FOUND VENDORS
	----------------------------------
	local hideFoundCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
	hideFoundCheck:SetPoint("TOPLEFT", escCheck, "BOTTOMLEFT", 0, -12)
	hideFoundCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
	hideFoundCheck.Text:SetTextColor(1, 0.82, 0)
	hideFoundCheck.Text:SetText(" Hide Found Vendors")
	hideFoundCheck:SetChecked(vendorSettings.hideFound)
	hideFoundCheck:SetScript("OnClick", function(self)
    vendorSettings.hideFound = self:GetChecked()
    BuildVendorUI()
end)

local markFoundCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
markFoundCheck:SetPoint("TOPLEFT", hideFoundCheck, "BOTTOMLEFT", 0, -8)
markFoundCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
markFoundCheck.Text:SetTextColor(1, 0.82, 0)
markFoundCheck.Text:SetText(" Mark Found Vendors (do not hide)")
markFoundCheck:SetChecked(vendorSettings.markFound)

markFoundCheck:SetScript("OnClick", function(self)
    vendorSettings.markFound = self:GetChecked()
    BuildVendorUI()
end)


	local hideCompletedCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
	hideCompletedCheck:SetPoint("TOPLEFT", markFoundCheck, "BOTTOMLEFT", 0, -12)
	hideCompletedCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
	hideCompletedCheck.Text:SetTextColor(1, 0.82, 0)
	hideCompletedCheck.Text:SetText(" Hide Completed Quests and Achievements")
	hideCompletedCheck:SetChecked(vendorSettings.hideCompleted)
	hideCompletedCheck:SetScript("OnClick", function(self)
    vendorSettings.hideCompleted = self:GetChecked()
    BuildVendorUI()
end)

local markCompletedCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
markCompletedCheck:SetPoint("TOPLEFT", hideCompletedCheck, "BOTTOMLEFT", 0, -8)
markCompletedCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
markCompletedCheck.Text:SetTextColor(1, 0.82, 0)
markCompletedCheck.Text:SetText(" Mark Completed Quests and Achievements")
markCompletedCheck:SetChecked(vendorSettings.markCompleted)

markCompletedCheck:SetScript("OnClick", function(self)
    vendorSettings.markCompleted = self:GetChecked()
    BuildVendorUI() -- this already rebuilds the active tab
end)

	local scaleDisplay = configFrame:CreateFontString(nil, "ARTWORK")
	scaleDisplay:SetFont(STANDARD_TEXT_FONT, 14)
	scaleDisplay:SetTextColor(1, 0.82, 0)
	scaleDisplay:SetPoint("TOPLEFT", markCompletedCheck, "BOTTOMLEFT", 0, -20)
	scaleDisplay:SetText("Scale for UI")
	local scaleSlider = CreateFrame("Slider", nil, configFrame, "MinimalSliderWithSteppersTemplate")
	scaleSlider:SetWidth(400)
	scaleSlider:SetHeight(20)
	scaleSlider:SetPoint("TOPLEFT", scaleDisplay, "BOTTOMLEFT", 0, -10)
	scaleSlider:Init(vendorSettings.scale or 1.0, 0.5, 1.5, 20, {
		[MinimalSliderWithSteppersMixin.Label.Right] = function(value)
			return string.format("%.2f", value)
		end
	})
	scaleSlider.RightText:SetFont(STANDARD_TEXT_FONT, 14)
	scaleSlider.Slider:SetValueStep(0.05)
	scaleSlider:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, function(_, value)
		local rounded = tonumber(string.format("%.2f", value))
		vendorSettings.scale = rounded
		frame:SetScale(rounded); vendorPopup:SetScale(rounded);
	end)


local vendorCheckmarkToggle = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
vendorCheckmarkToggle:SetPoint("TOPLEFT", scaleSlider, "BOTTOMLEFT", 0, -12)
vendorCheckmarkToggle.Text:SetFont(STANDARD_TEXT_FONT, 14)
vendorCheckmarkToggle.Text:SetTextColor(1, 0.82, 0)
vendorCheckmarkToggle.Text:SetText(" Show collected checkmarks on vendor items")
vendorCheckmarkToggle:SetChecked(vendorSettings.showVendorCheckmarks)

vendorCheckmarkToggle:SetScript("OnClick", function(self)
    vendorSettings.showVendorCheckmarks = self:GetChecked()

    -- Live update if popup is open
    if vendorPopup and vendorPopup:IsShown() then
        for _, container in pairs(popupIconCache or {}) do
            if container:IsShown() and container.btn then
                if container.checkFrame then
                    container.checkFrame:SetShown(
                        vendorSettings.showVendorCheckmarks and container.btn.isCollected
                    )
                end
            end
        end
    end
end)

vendorCheckmarkToggle:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Show a checkmark on items you have already collected.", 1, 1, 1)
    GameTooltip:Show()
end)

vendorCheckmarkToggle:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)


local footerText = configFrame:CreateFontString(nil, "OVERLAY")
footerText:SetFont(STANDARD_TEXT_FONT, 18, "OUTLINE")
footerText:SetPoint("BOTTOM", configFrame, "BOTTOM", 0, 28)
footerText:SetText("|cffffdd00Decor Vendor|r • developed by |cff00aaffMidniteDestiny|r\n|cffffffffFirst to introduce vendor tracking|r")
footerText:SetJustifyH("CENTER")

    ---------------------------
    -- Register Category
    ---------------------------
    local category = Settings.RegisterCanvasLayoutCategory(configFrame, "Decor Vendor")
    Settings.RegisterAddOnCategory(category)
    dv_optionsCategory = category
end

local function CreateGoodieLine(parent, goodie, y)
    local id = goodie.id
    local name, loading = nil, false

    -------------------------------------------------
    -- 0. COMPLETION CHECK (quest / achievement)
    -------------------------------------------------
    local isCompleted = false

    if goodie.type == "achievement" then
        local _, _, _, completed = GetAchievementInfo(id)
        isCompleted = completed

    elseif goodie.type == "quest" then
        isCompleted = C_QuestLog.IsQuestFlaggedCompleted(id)
    end

    -- Hide ONLY if Hide Completed ON and Mark Completed OFF
    if isCompleted and vendorSettings.hideCompleted and not vendorSettings.markCompleted then
        return y
    end

    -------------------------------------------------
    -- 1. NAME RESOLUTION
    -------------------------------------------------
    if goodie.type == "quest" then
        name = questTitleCache[id] or C_QuestLog.GetTitleForQuestID(id)
        if name then
            questTitleCache[id] = name
        else
            name = "Loading quest..."
            loading = true
        end
    else
        name = select(2, GetAchievementInfo(id)) or "Unknown Achievement"
    end

    -------------------------------------------------
    -- 2. LINE FRAME
    -------------------------------------------------
    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", 10, y)
    line:SetSize(590, 22)
    line:RegisterForClicks("AnyUp")

    line.text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    line.text:SetPoint("LEFT", 0, 0)
    line.text:SetFont(STANDARD_TEXT_FONT, 12)
    line.text:SetText(name)

    -------------------------------------------------
    -- 3. WOWHEAD COPY BOX
    -------------------------------------------------
    local wowheadBox = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    wowheadBox:SetSize(260, 22)
    wowheadBox:SetPoint("LEFT", line.text, "RIGHT", 8, 0)
    wowheadBox:SetAutoFocus(false)
    wowheadBox:Hide()

    wowheadBox:SetScript("OnChar", function(self)
        self:SetText(self:GetText())
        self:HighlightText()
    end)

    wowheadBox:SetScript("OnMouseUp", function(self)
        self:HighlightText()
    end)

    -------------------------------------------------
    -- 4. BASE COLOR (faction)
    -------------------------------------------------
    local function SetBaseColor()
        if isCompleted and vendorSettings.markCompleted then
            line.text:SetTextColor(0.62, 0.62, 0.62)
            line.text:SetAlpha(0.7)
            return
        end

        line.text:SetAlpha(1)

        if goodie.faction then
            local f = string.lower(goodie.faction)
            if f == "alliance" then
                line.text:SetTextColor(0.3, 0.6, 1)
            elseif f == "horde" then
                line.text:SetTextColor(1, 0.2, 0.2)
            elseif f == "neutral" then
                line.text:SetTextColor(0.2, 0.8, 0.3)
            end
        else
            line.text:SetTextColor(0.9, 0.9, 0.9)
        end
    end

    SetBaseColor()

    -------------------------------------------------
    -- 5. QUEST TITLE UPDATE (async)
    -------------------------------------------------
    if loading then
        QuestEventListener:AddCallback(id, function()
            local newName = C_QuestLog.GetTitleForQuestID(id)
            if newName and line.text:IsVisible() then
                line.text:SetText(newName)
                questTitleCache[id] = newName
            end
        end)
    end

local modelData = goodie.model3D
local textureData = goodie.texture

local function UpdatePreview(goodie)
   -- Set the title if provided
    if goodie and goodie.title then
        dv.previewFrame.title:SetText(goodie.title)
    else
        dv.previewFrame.title:SetText("Preview")
    end
    if modelData then
        dv.previewFrame.texture:Hide()
        dv.previewFrame.model:Show()

        local model = dv.previewFrame.model
        model:SetModel(modelData)

        -- 🔥 REQUIRED RIGHT HERE
        model:MakeCurrentCameraCustom()

        -- Apply custom camera data
        local pos = dv.modelPositions[modelData]
        if pos then
            model:SetPosition(pos.model_x, 0, pos.model_z)
            model:SetCameraPosition(0, 0, pos.camera_y)
            model:SetCameraDistance(pos.zoom)
        else
            -- fallback
            model:SetPosition(0, 0, 0)
            model:SetCameraPosition(0, 0, 4)
            model:SetCameraDistance(10)
        end

    elseif textureData then
        dv.previewFrame.model:Hide()
        dv.previewFrame.texture:Show()
        dv.previewFrame.texture:SetTexture(textureData)

    else
        dv.previewFrame.model:Hide()
        dv.previewFrame.texture:Hide()
    end
end
    -------------------------------------------------
    -- 6. TOOLTIP + PREVIEW
    -------------------------------------------------
    line:SetScript("OnEnter", function()
        line.text:SetTextColor(1, 0.82, 0)

        GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
        if goodie.type == "quest" then
            GameTooltip:SetHyperlink("quest:" .. id)
        else
            GameTooltip:SetHyperlink(GetAchievementLink(id))
        end

        GameTooltip:AddLine(" ")

        if goodie.type == "achievement" then
            GameTooltip:AddLine("|cff00ff00<Left Click>|r Open Achievement")
            GameTooltip:AddLine("|cffff5500<Right Click>|r Copy Wowhead Link")
        else
            GameTooltip:AddLine("|cffff5500<Right Click>|r Copy Wowhead Link")
        end

        GameTooltip:Show()

        dv.AnchorPreviewBelowTooltip(dv.previewFrame, GameTooltip)
        UpdatePreview(goodie)
    end)

    -------------------------------------------------
    -- 7. CLICK HANDLING
    -------------------------------------------------
    line:SetScript("OnClick", function(_, button)
        if button == "LeftButton" and goodie.type == "achievement" then
if not AchievementFrame or not AchievementFrame:IsShown() then
    AchievementFrame_LoadUI()
    AchievementFrame_ToggleAchievementFrame()
end

AchievementFrame_SelectAchievement(id)

            

        elseif button == "RightButton" then
            local url = dv:GetWowheadLink(id, goodie.type)

            if dv.activeWowheadBox and dv.activeWowheadBox ~= wowheadBox then
                dv.activeWowheadBox:Hide()
            end

            wowheadBox:SetText(url)
            wowheadBox:Show()
            wowheadBox:SetFocus()
            wowheadBox:HighlightText()
            dv.activeWowheadBox = wowheadBox
        end
    end)

    -------------------------------------------------
    -- 8. MOUSE LEAVE
    -------------------------------------------------
    line:SetScript("OnLeave", function()
        GameTooltip:Hide()
        dv.previewFrame:Hide()
        SetBaseColor()
    end)

    wowheadBox:SetScript("OnEditFocusLost", function()
        wowheadBox:Hide()
        if dv.activeWowheadBox == wowheadBox then
            dv.activeWowheadBox = nil
        end
    end)

    table.insert(activeWidgets, line)
    return y - 22
end

local function CreateProfessionLine(parent, profItem, y)
local isCompleted = false
if profItem.spell then
    isCompleted = IsSpellKnown(profItem.spell) or IsPlayerSpell(profItem.spell)
end

   

   local line = CreateFrame("Button", nil, parent)
	local pad = TAB_LEFT_PADDING[dv.currentTab] or 10
	line:SetPoint("TOPLEFT", pad, y)
	line:RegisterForClicks("AnyUp") -- 🔥 REQUIRED
	--line:SetPoint("TOPLEFT", 10, y)
	line:SetSize(560, 22)

    -------------------------------------------------
    -- ITEM NAME (FAST / ASYNC)
    -------------------------------------------------
    local nameText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("TOPLEFT", 0, -2)
    nameText:SetJustifyH("LEFT")
    nameText:SetText("• Loading item...")
	if isCompleted then
    nameText:SetTextColor(0.5, 1, 0.5)
else
    nameText:SetTextColor(1, 1, 1)
end


    -- Async-safe item name
    local itemObj = Item:CreateFromItemID(profItem.id)
    itemObj:ContinueOnItemLoad(function()
        if nameText then
            nameText:SetText(itemObj:GetItemName())
        end
    end)


    -------------------------------------------------
    -- SKILL LINE (THIS IS THE PART YOU ASKED FOR)
    -------------------------------------------------
    local skillText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	skillText:SetPoint("RIGHT", line, "RIGHT", -12, 0)
	skillText:SetJustifyH("RIGHT")

	local skillString = (profItem.skill or "Skill") .. " (" .. (profItem.skillNeeded or 0) .. ")"
	skillText:SetText(skillString)
    skillText:SetTextColor(1, 0.82, 0)

	local function UpdatePreview(profItem)
    local modelID = profItem and profItem.model3D
    local model = dv.previewFrame.model
   -- Set the title if provided
	if profItem and itemObj then
    itemObj:ContinueOnItemLoad(function()
        if dv.previewFrame and dv.previewFrame.title then
            dv.previewFrame.title:SetText(itemObj:GetItemName() or "Preview")
        end
    end)
	else
    dv.previewFrame.title:SetText("Preview")
	end

    if modelID then
        model:ClearModel()
        model:SetModel(modelID)
        model:Show()
        if dv.previewFrame.texture then
            dv.previewFrame.texture:Hide()
        end
    else
        model:Hide()
    end
end


    -------------------------------------------------
    -- HOVER: TOOLTIP + PREVIEW
    -------------------------------------------------
line:SetScript("OnEnter", function(self)
    SetCursor("INSPECT_CURSOR")

    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetItemByID(profItem.id)
    GameTooltip:AddLine("\n|cff00ff00<Left Click>|r View Decor", 1, 1, 1)
    GameTooltip:AddLine("|cff00ff00<Right Click>|r View Reagents", 1, 1, 1)
    GameTooltip:Show()
local decorData = dv.professionItem[profItem.id]
			if decorData and not decorData.thumbnailID then
				local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorData.decorID, true)
				decorData.thumbnailID = info and info.iconTexture
			end
			if decorData and decorData.thumbnailID then
				dv.smallPreviewTexture:SetTexture(decorData.thumbnailID)
				dv.AnchorPreviewBelowTooltip(dv.smallPreviewFrame, GameTooltip)
			end
       -- Position preview below tooltip
    --dv.AnchorPreviewBelowTooltip(dv.previewFrame, GameTooltip)

    -- Update the model/texture
    UpdatePreview(profItem) 
    end)

line:SetScript("OnLeave", function()
    ResetCursor()
    GameTooltip:Hide()

    if dv.smallPreviewFrame then
        dv.smallPreviewFrame:Hide()
    end

    if dv.previewFrame then
        dv.previewFrame:Hide()
    end
end)


    -------------------------------------------------
    -- CLICK BEHAVIOR
    -------------------------------------------------
    line:SetScript("OnClick", function(_, button)

    if IsModifiedClick("CHATLINK") then
        local _, link = GetItemInfo(profItem.id)
        if link then ChatEdit_InsertLink(link) end

    elseif button == "LeftButton" then
        DressUpItemLink("item:" .. profItem.id)

    elseif button == "RightButton" then
            dv.ShowReagentsPopup(profItem)   
    end
end)


    table.insert(activeWidgets, line)
    return y - 22
end

local function HasAnySelection(tbl)
    if not tbl then return false end
    for _, v in pairs(tbl) do
        if v then return true end
    end
    return false
end

function dv.BuildVendorFilters()
    local parent = dv.sidebarFilters

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
    selectedExpansions = selectedExpansions or {}
    local seen = {}

    for _, npc in ipairs(dv.npcs or {}) do
        local exp = npc.expansion
        if exp and not seen[exp] then
            seen[exp] = true
            Checkbox(exp, selectedExpansions, exp)
        end
    end

    y = y - 10

    -- FACTION
    Header("Faction")
    selectedFactions = selectedFactions or {}

    for _, f in ipairs({ "alliance", "horde", "neutral" }) do
        Checkbox(f, selectedFactions, f)
    end
end

function dv.BuildQuestFilters()
    local parent = dv.sidebarFilters

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
    selectedQuests = selectedQuests or {}

    for _, group in ipairs(dv.quests or {}) do
        Checkbox(group.name, selectedQuests, group.name)
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
    selectedProfessions = selectedProfessions or {}

    for _, group in ipairs(dv.professions or {}) do
        Checkbox(group.name, selectedProfessions, group.name)
    end

    y = y - 10
end

function dv.BuildAchievementFilters()
    local parent = dv.sidebarFilters

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
    selectedAchievements = selectedAchievements or {}

    for _, group in ipairs(dv.achievements or {}) do
        Checkbox(group.name, selectedAchievements, group.name)
    end

    y = y - 10

    -- FACTION
    Header("Faction")
    selectedFactionz = selectedFactionz or {}
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

function dv.ResetSidebarFilters()
    if dv.sidebarFilters then
        dv.sidebarFilters:Hide()
        dv.sidebarFilters:SetParent(nil)
    end

    -- Create a brand-new container
    dv.sidebarFilters = CreateFrame("Frame", nil, dv.sidebar)
    dv.sidebarFilters:SetAllPoints()
end

function UpdateSidebarForTab()
    dv.sidebar:Show()

    -- Always rebuild from a clean slate
    dv.ResetSidebarFilters()

    if dv.currentTab == "about" then
        dv.sidebarFilters:Hide()
        return
    end

    if dv.currentTab == "vendors" then
        dv.BuildVendorFilters()  -- expansions + factions
    
	elseif dv.currentTab == "quests" then
        dv.BuildQuestFilters()

    elseif dv.currentTab == "achievements" then
        dv.BuildAchievementFilters()
		
	elseif dv.currentTab == "professions" then
		dv.BuildProfessionFilters()



    -- Scroll width logic
    if scrollChild then
        if dv.currentTab == "vendors" or dv.currentTab == "quests" or dv.currentTab == "achievements" or dv.currentTab == "professions" then
            scrollChild:SetWidth(frame:GetWidth() - dv.sidebar:GetWidth() - 40)
        else
            scrollChild:SetWidth(frame:GetWidth() - 40)
        end
    end
	end
end

function BuildProfessionList()
    dv.ClearWidgets()

    -- Prepare filters
    selectedProfessions = selectedProfessions or {}
    local catSel = selectedProfessions
    local hasCategoryFilter = HasAnySelection(catSel)

    local y = -6
    local hasContent = false

    local professions = dv.professions or {}
    table.sort(professions, function(a, b)
        return (a.name or "") < (b.name or "")
    end)

    --------------------------------------------------------
    -- Loop through profession categories
    --------------------------------------------------------
    for _, profession in ipairs(professions) do

        ----------------------------------------------------
        -- CATEGORY FILTER
        ----------------------------------------------------
        if hasCategoryFilter and not catSel[profession.name] then
            -- skip profession
        else
            ------------------------------------------------
            -- Build visible items
            ------------------------------------------------
local visible = {}
local completedCount = 0
local totalCount = 0

for _, item in ipairs(profession.items or {}) do
    totalCount = totalCount + 1

local learned = false
if item.spell then
    learned = IsSpellKnown(item.spell) or IsPlayerSpell(item.spell)
end

if learned then
    completedCount = completedCount + 1
end

table.insert(visible, item)

end


            ------------------------------------------------
            -- Skip if empty
            ------------------------------------------------
            if #visible > 0 then
                hasContent = true

                ------------------------------------------------
                -- Get progress values
                ------------------------------------------------
                local completed, total = CountProfessionItems(profession)

                ------------------------------------------------
                -- Create header WITH progress
                ------------------------------------------------
                local collapsed, newY =
                    CreateProfessionHeader(scrollChild, profession, y, completedCount, total)
                y = newY

                ------------------------------------------------
                -- Draw profession items
                ------------------------------------------------
                if not collapsed then
                    for _, item in ipairs(visible) do
                        y = CreateProfessionLine(scrollChild, item, y)
                    end
                    y = y - 10
                end
            end
        end
    end

    --------------------------------------------------------
    -- Empty state
    --------------------------------------------------------
    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText("No profession data available.")
        msg:SetTextColor(0.7, 0.7, 0.7)
        table.insert(activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 40)
end

function BuildQuestList()
    dv.ClearWidgets()

    -- Prepare filters
    selectedQuests = selectedQuests or {}
    selectedFactionz   = selectedFactionz   or {}

    local catSel = selectedQuests
    local facSel = selectedFactionz

    local hasCategoryFilter = HasAnySelection(catSel)
    local hasFactionFilter  = HasAnySelection(facSel)
	
    local y = -6

    --------------------------------------------------------
    -- 1) Copy and sort quest groups
    --------------------------------------------------------
    local questGroups = {}
    for _, g in ipairs(dv.quests or {}) do
        questGroups[#questGroups + 1] = g
    end

    table.sort(questGroups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    --------------------------------------------------------
    -- 2) Loop through category groups
    --------------------------------------------------------
    for _, group in ipairs(questGroups) do

        ----------------------------------------------------
        -- CATEGORY FILTER: skip group if not selected
        ----------------------------------------------------
        if hasCategoryFilter and not catSel[group.name] then
            -- skip entire category group
        else

            ------------------------------------------------
            -- Build list of visible quests
            ------------------------------------------------
            local visible = {}

            for _, quest in ipairs(group.quests or {}) do
                local include = true
local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(quest.id)

-- Only hide if Hide Completed ON and Mark Completed OFF
if isCompleted and vendorSettings.hideCompleted and not vendorSettings.markCompleted then
    include = false
end

-- Pass completion state forward for visuals
quest.__isCompleted = isCompleted

                -- FACTION FILTER
                if hasFactionFilter then
                    local f = quest.faction and string.lower(quest.faction)
                    if not facSel[f] then
                        include = false
                    end
                end

                if include then
                    table.insert(visible, quest)
                end
            end


------------------------------------------------
-- Skip category if no matching quests
------------------------------------------------
if #visible > 0 then

    --------------------------------------------
    -- COUNT QUEST COMPLETION (⬅️ THIS IS NEW)
    --------------------------------------------
    local total, completed = 0, 0

    for _, quest in ipairs(visible) do
        total = total + 1
        if C_QuestLog.IsQuestFlaggedCompleted(quest.id) then
            completed = completed + 1
        end
    end

    --------------------------------------------
    -- Create header WITH COUNTS
    --------------------------------------------
    local collapsed, newY = CreateQuestHeader(
        scrollChild,
        group.name,
        y,
        completed,
        total
    )
    y = newY

    --------------------------------------------
    -- Draw quests only if header is expanded
    --------------------------------------------
    if not collapsed then
        for _, quest in ipairs(visible) do
            y = CreateGoodieLine(scrollChild, quest, y)
        end
        y = y - 10
    end
end

        end
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

function BuildAchievementList()
    dv.ClearWidgets()

    -- Prepare filters
    selectedAchievements = selectedAchievements or {}
    selectedFactionz   = selectedFactionz   or {}

    local catSel = selectedAchievements
    local facSel = selectedFactionz

    local hasCategoryFilter = HasAnySelection(catSel)
    local hasFactionFilter  = HasAnySelection(facSel)
	



    local y = -6

    --------------------------------------------------------
    -- 1) Copy and sort achievement groups
    --------------------------------------------------------
    local achieveGroups = {}
    for _, g in ipairs(dv.achievements or {}) do
        achieveGroups[#achieveGroups + 1] = g
    end

    table.sort(achieveGroups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    --------------------------------------------------------
    -- 2) Loop through category groups
    --------------------------------------------------------
    for _, group in ipairs(achieveGroups) do

        ----------------------------------------------------
        -- CATEGORY FILTER: skip group if not selected
        ----------------------------------------------------
        if hasCategoryFilter and not catSel[group.name] then
            -- skip entire category group
        else

            ------------------------------------------------
            -- Build list of visible achievements
            ------------------------------------------------
            local visible = {}

            for _, achieve in ipairs(group.achievements or {}) do
                local include = true
				local _, _, _, completed = GetAchievementInfo(achieve.id)

if completed and vendorSettings.hideCompleted and not vendorSettings.markCompleted then
    include = false
end

achieve.__isCompleted = completed


                -- FACTION FILTER
                if hasFactionFilter then
                    local f = achieve.faction and string.lower(achieve.faction)
                    if not facSel[f] then
                        include = false
                    end
                end

                if include then
                    table.insert(visible, achieve)
                end
            end


------------------------------------------------
-- Skip category if no matching achievements
------------------------------------------------
if #visible > 0 then

    --------------------------------------------
    -- COUNT ACHIEVEMENT COMPLETION (⬅️ NEW)
    --------------------------------------------
    local total, completed = 0, 0

    for _, achieve in ipairs(visible) do
        total = total + 1

        local _, _, _, isCompleted = GetAchievementInfo(achieve.id)
        if isCompleted then
            completed = completed + 1
        end
    end

    --------------------------------------------
    -- Create header WITH COUNTS
    --------------------------------------------
    local collapsed, newY = CreateAchievementHeader(
        scrollChild,
        group.name,
        y,
        completed,
        total
    )
    y = newY

    --------------------------------------------
    -- Draw achievements only if header is expanded
    --------------------------------------------
    if not collapsed then
        for _, achieve in ipairs(visible) do
            y = CreateGoodieLine(scrollChild, achieve, y)
        end
        y = y - 10
    end
end

        end
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

function BuildVendorList()
    dv.ClearWidgets()

    local y = 0
    local hasContent = false

    -- Ensure filter tables exist
    selectedExpansions = selectedExpansions or {}
    selectedFactions   = selectedFactions   or {}

    local expSel = selectedExpansions
    local facSel = selectedFactions

    local hasExpansionFilter = HasAnySelection(expSel)
    local hasFactionFilter   = HasAnySelection(facSel)
	

    -- Copy & sort groups A–Z
    local groups = {}
    for _, group in ipairs(dv.npcs or {}) do
        groups[#groups + 1] = group
    end

    table.sort(groups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter or expSel[group.expansion]

        if passesExpansion then
            local visibleVendors = {}

            for _, vendor in ipairs(group.vendors or {}) do
                local includeVendor = true

                ----------------------------------------------------
                -- SEARCH FILTER
                ----------------------------------------------------
                if dv.searchQuery and dv.searchQuery ~= "" then
                    local title = string.lower(vendor.title or "")
                    if not string.find(title, dv.searchQuery, 1, true) then
                        includeVendor = false
                    end
                end

                ----------------------------------------------------
                -- FACTION FILTER
                ----------------------------------------------------
                if includeVendor then
                    local passesFaction =
                        not hasFactionFilter or facSel[vendor.faction]

                    if not passesFaction then
                        includeVendor = false
                    end
                end

                ----------------------------------------------------
                -- HIDE COMPLETED LOGIC
                ----------------------------------------------------
                --[[if includeVendor then
                    local notVisited =
                        not (
                            vendorSettings.hideFound
                            and vendorSettings.visited
                            and vendorSettings.visited[vendor.id]
                        )

                    if not notVisited then
                        includeVendor = false
                    end
                end]]
				
				----------------------------------------------------
-- FOUND / HIDE / MARK LOGIC
----------------------------------------------------
if includeVendor then
    local isFound =
        vendorSettings.visited
        and vendorSettings.visited[vendor.id]

    -- Only hide if Hide Found is ON and Mark Found is OFF
    if isFound and vendorSettings.hideFound and not vendorSettings.markFound then
        includeVendor = false
    end

    -- Pass found state through for visual marking
    vendor.__isFound = isFound
end


                ----------------------------------------------------
                -- ADD TO VISIBLE LIST
                ----------------------------------------------------
                if includeVendor then
                    table.insert(visibleVendors, vendor)
                end
            end

            --------------------------------------------------------
            -- CREATE GROUP HEADER + VENDOR LINES
            --------------------------------------------------------
            if #visibleVendors > 0 then
                hasContent = true

                table.sort(visibleVendors, function(a, b)
                    return (a.title or ""):lower() < (b.title or ""):lower()
                end)

                local total, completed = 0, 0
                for _, vendor in ipairs(group.vendors or {}) do
                    total = total + 1
                    if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                        completed = completed + 1
                    end
                end

                local _, collapsed, newY =
                    CreateVendorHeader(scrollChild, group, y, completed, total)
                y = newY

                if not collapsed then
                    for _, vendor in ipairs(visibleVendors) do
                        y = CreateVendorLine(scrollChild, vendor, y)
                    end
                    y = y - 10
                end
            end
        end
    end

    --------------------------------------------------------
    -- EMPTY RESULTS MESSAGE
    --------------------------------------------------------
    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText("No vendors match these filters.")
        msg:SetTextColor(0.7, 0.7, 0.7)
        table.insert(activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

local function BuildAboutScreen()
    dv.ClearWidgets()

    local parent = scrollChild

    ----------------------------------------
    -- TITLE
    ----------------------------------------
    local title = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -80)
    title:SetTextColor(1, 0.82, 0)
    title:SetText("DecorVendor Addon")
    table.insert(activeWidgets, title)

    ----------------------------------------
    -- DESCRIPTION
    ----------------------------------------
    local desc = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    desc:SetWidth(500)
    desc:SetPoint("TOP", title, "BOTTOM", 0, -20)
    desc:SetJustifyH("CENTER")
    desc:SetText("Created by MidniteDestiny\n\nThank you for using DecorVendor!\nThis addon provides vendors, quests, achievements,\npreviews, tracking tools, and more.")
    table.insert(activeWidgets, desc)

    ----------------------------------------
    -- IMAGE
    ----------------------------------------
    local art = parent:CreateTexture(nil, "OVERLAY")
    art:SetSize(300, 300)
    art:SetPoint("TOP", desc, "BOTTOM", 0, -30)
    art:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\cutie") 
    -- (Do NOT include .png extension)
    table.insert(activeWidgets, art)

    ----------------------------------------
    -- FOOTER (single centered line)
    ----------------------------------------
    local footer = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    footer:SetPoint("TOP", art, "BOTTOM", 0, -15)
    footer:SetJustifyH("CENTER")
    footer:SetWidth(300)  -- ensures no word wrapping
    footer:SetText("|cffffdd00Decor Vendor|r • developed by |cff00aaffMidniteDestiny|r • First to introduce vendor tracking")
    table.insert(activeWidgets, footer)

    ----------------------------------------
    -- Update scroll area
    ----------------------------------------
    parent:SetHeight( art:GetHeight() + 300 )
end

local function CreateURLBox(parent, anchor, url)
    local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    box:SetSize(260, 24)
    box:SetPoint("LEFT", anchor, "RIGHT", 6, 0)
    box:SetAutoFocus(false)
    box:SetText(url)
    box:SetCursorPosition(0)

    -- Read-only behavior
    box:SetScript("OnChar", function(self)
        self:SetText(url)
        self:HighlightText()
    end)

    box:SetScript("OnTextChanged", function(self)
        if self:GetText() ~= url then
            self:SetText(url)
            self:HighlightText()
        end
    end)

    -- Highlight on click/focus
    box:SetScript("OnMouseUp", function(self)
        self:HighlightText()
    end)
    box:SetScript("OnEditFocusGained", function(self)
        self:HighlightText()
    end)

    -- Disabled look, but still selectable
    box:EnableMouse(true)
    box:Disable()
    box:Enable()

    return box
end

local function AddSupportLink(parent, labelText, url, y)
    -- Button
    local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    btn:SetSize(180, 26)
    btn:SetPoint("TOPLEFT", 20, y)
    btn:SetText(labelText)
    table.insert(activeWidgets, btn)

    -- URL box (initially visible, but passive)
    local box = CreateURLBox(parent, btn, url)
    table.insert(activeWidgets, box)

    -- Clicking button highlights URL
    btn:SetScript("OnClick", function()
        box:SetFocus()
        box:HighlightText()
    end)

    return y - 40
end

local function BuildSupportPage()
    dv.ClearWidgets()

    local parent = scrollChild
    local y = -20

    -- Title
    local title = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", parent, "TOP", 10, y)
	--title:SetPoint("TOP", frame, "TOP", 0, -80)
    title:SetText("Support Decor Vendor")
    table.insert(activeWidgets, title)
    y = y - 20

    local function AddText(text, spacing)
        local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        fs:SetPoint("TOPLEFT", 20, y)
        fs:SetWidth(500)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")
        fs:SetText(text)

        table.insert(activeWidgets, fs)
        y = y - (fs:GetStringHeight() + (spacing or 20))
    end

    AddText(
        "If you enjoy using Decor Vendor and want to support its development,\n" ..
        "all support is optional and deeply appreciated",
        20
    )
	AddText("|cff999999Tip: Buttons highlight links for copying. Use Ctrl+C to copy.|r", 15)


    AddText("|cffFFD200Preferred Support|r", 10)
    y = AddSupportLink(
        parent,
        "PayPal (Preferred)",
        "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=lizbella123@gmail.com&currency_code=USD&item_name=Decor+Vendor",
        y
    )
	
	AddText("If the PayPal link above does not work, you can also use:", 5)

	y = AddSupportLink(
		parent,
		"PayPal.me (Fallback)",
		"https://paypal.me/midnitedestiny",
		y
	)


    AddText("|cffFFD200Other Ways to Support|r", 10)
    y = AddSupportLink(parent, "Ko-fi", "https://ko-fi.com/midnitedestiny", y)
    y = AddSupportLink(parent, "Buy Me a Coffee", "https://www.buymeacoffee.com/midnitedestiny", y)
	
	AddText("|cffFFD200Contact Me|r", 10)

	AddText(
    "If you truly need to reach me please use curseforge messaging,\n")
	
	AddText("|cffFFD200Curseforge Page|r", 10)
    y = AddSupportLink(parent, "Curseforge", "https://www.curseforge.com/wow/addons/decor-vendor", y)

	
    
	
	

    AddText(
        "Thank you for supporting the addon!\n" ..
        "Your support helps ongoing updates, fixes, and new features.",
        20
    )
end

local function BuildTipsPage()
    dv.ClearWidgets()

 local parent = scrollChild

    local y = -20

    -- Title
local title = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOP", parent, "TOP", 10, y)
--title:SetPoint("TOP", frame, "TOP", 0, -80)
title:SetText("Tips & Helpful Info")
table.insert(activeWidgets, title)
y = y - 20


    -- Helper function for text blocks
local function AddText(text, spacing)
    local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    fs:SetPoint("TOPLEFT", 20, y)
    fs:SetWidth(500)
    fs:SetJustifyH("LEFT")
    fs:SetJustifyV("TOP")
    fs:SetText(text)

    table.insert(activeWidgets, fs) -- 🔥 THIS IS THE FIX

    y = y - (fs:GetStringHeight() + (spacing or 20))
end


    -- Sections
    AddText("|cffFFD200Wowhead Links|r", 10)
    AddText(
        "Right clicking on quests or achievements lets you view the Wowhead link\n")

    AddText("|cffFFD200Professions and Quests|r", 10)
    AddText(
        "Profession decor comes from various recipes and trainers and is still being worked on.")

    AddText("|cffFFD200Achievements|r", 10)
    AddText(
        "Left-click opens the achievement in-game.\n"..
		"Do not open opposite faction achievements as it will not show you anything in the achievement frame.\n"..
		"Drum Circle from Legion is a hidden achievement Hint: if its not showing go to base of Thunder Totem at the bottom in Highmountain and jump for roughly 2 minutes at the same pace and you will be awarded it. Same Beat not fast or slow just steady for roughly 2 minutes.")
	
    AddText("|cffFFD200Midnight Expansion Related|r", 10)
    AddText(
        "Vendors will be coming soon.\n" ..
        "Right now only the housing vendors are avaiable.")
	
	    AddText("|cffFFD200Mark and Hide Logic in Options|r", 10)
    AddText(       
        "If you mark vendors, quests or achievement they will remain but turn to a grey color. But if you Hide them but do not Mark them then anything found or completed vanishes from your tabs. If you enable both options they stay but turn grey.")
	
AddText("|cffFFD200Faction Color Indicators|r  |cffff2020Red|r = Horde • |cff4faaffBlue|r = Alliance • |cff00ff00Green|r = Neutral", 10)
AddText("|cffFFD200Line Color Indicator|r  |cff9d9d9dGrey|r = Found Vendor, Completed Quest, and Achievements", 10)



end

function BuildVendorUI()
    if dv.currentTab == "vendors" then
        BuildVendorList()

    elseif dv.currentTab == "professions" then
        BuildProfessionList()

    elseif dv.currentTab == "quests" then
        BuildQuestList()

    elseif dv.currentTab == "achievements" then
        BuildAchievementList()
		
	elseif dv.currentTab == "about" then
        BuildAboutScreen()
		
	elseif dv.currentTab == "support" then
        BuildSupportPage()	
	
	elseif dv.currentTab == "tips" then
        BuildTipsPage()
end

   -- 🔥 RESET FILTER CHANGE FLAG AFTER BUILD
    dv.filtersJustChanged = false
    end

function UpdateEscBehavior()
    local frameName = "DV_MainFrame"

    -- Remove ALL existing instances first
    for i = #UISpecialFrames, 1, -1 do
        if UISpecialFrames[i] == frameName then
            table.remove(UISpecialFrames, i)
        end
    end

    -- Add only if option is enabled
    if vendorSettings.closeOnEsc then
        table.insert(UISpecialFrames, frameName)
    end
end

local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_ENTERING_WORLD")

selectedExpansions  = selectedExpansions  or {}
selectedProfessions = selectedProfessions or {}
selectedFactionz = selectedFactionz or {}
selectedFactions    = selectedFactions    or {}
selectedQuests = selectedQuests or {}
selectedAchievements = selectedAchievements or {}
dv.collapsedProfessions = dv.collapsedProfessions or {}
dv.collapsedAchievements = dv.collapsedAchievements or {}
dv.collapsedQuests = dv.collapsedQuests or {}
vendorSettings.completedDrop = vendorSettings.completedDrop or {}
vendorSettings.markFound = vendorSettings.markFound or false

init:SetScript("OnEvent", function(self, event, loadedAddon)
    if event == "ADDON_LOADED" and loadedAddon == addonName then
        print("DecorVendor loaded.")

        -- Build lookup tables
        BuildProfessionLookup()
		
        -- Safe defaults for non-filter globals
        continentFilter = continentFilter or "All"
        zoneFilter      = zoneFilter      or "All"			          
       
        -- Saved settings defaults
        vendorSettings = vendorSettings or {}
        vendorSettings.visited        = vendorSettings.visited or {}
        vendorSettings.hideFound  = vendorSettings.hideFound or false
		vendorSettings.completedDrop = vendorSettings.completedDrop or {}
		if vendorSettings.showVendorCheckmarks == nil then vendorSettings.showVendorCheckmarks = true end
		vendorSettings.showMinimapButton = vendorSettings.showMinimapButton == nil and true or vendorSettings.showMinimapButton		
		if vendorSettings.closeOnEsc == nil then vendorSettings.closeOnEsc = true end
dbDV = dbDV or {}
dbDV.minimap = dbDV.minimap or {}

-- Convert your setting → LibDBIcon format
dbDV.minimap.hide = not vendorSettings.showMinimapButton

        -- LibDataBroker / LibDBIcon
-- LibDataBroker / LibDBIcon
local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if ldb then
    local dataobj = ldb:NewDataObject("DecorVendor", {
        type  = "launcher",
        icon  = 1530229,
        label = "DecorVendor",
        text  = "DecorVendor",
        name  = "DecorVendor",

        OnClick = function(_, button)
            if button == "LeftButton" then
                if not frame:IsShown() then
                    BuildVendorUI()
                end
                frame:SetShown(not frame:IsShown())
            elseif button == "RightButton" then
                Settings.OpenToCategory(dv_optionsCategory:GetID())
            end
        end
    })

    function dataobj:OnTooltipShow()
        self:AddLine("|cffffffffDecor Vendor|r")
        self:AddLine("|cff00ff00<Left Click>|r Toggle window")
        self:AddLine("|cff00ff00<Right Click>|r Options")
    end

    -- Register the icon
    LibDBIcon:Register("DecorVendor", dataobj, dbDV.minimap)

    --------------------------------------------------
    -- ⭐ ENSURE MINIMAP BUTTON STAYS HIDDEN ON RELOAD
    --------------------------------------------------
    if vendorSettings.showMinimapButton == false then
        LibDBIcon:Hide("DecorVendor")
    else
        LibDBIcon:Show("DecorVendor")
    end
end

		local scale = vendorSettings.scale or 1.0
		frame:SetScale(scale); vendorPopup:SetScale(scale)
   
        -- Final UI setup
		BuildVendorUI()
		UpdateSidebarForTab()
		CreateOptionsPanel()
        UpdateEscBehavior()
        frame:Show()
		if not vendorSettings.showMinimapButton then LibDBIcon:Hide("DecorVendor") end

    end

    if event == "PLAYER_ENTERING_WORLD" then
        -- Don’t register options again here (prevents duplicates)
        if frame then frame:SetScale(vendorSettings.scale or 1.0) end
        --if supportFrame then supportFrame:SetScale(vendorSettings.scale or 1.0) end
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)

--Slash Commands
SLASH_DECORVENDOR1 = "/decor"
SLASH_DECORVENDOR2 = "/dv"
SLASH_DECORVENDOR3 = "/decorvendor"
SlashCmdList["DECORVENDOR"] = function()
    if not frame:IsShown() then
        BuildVendorUI()
        frame:Show()
    else
        frame:Hide()
    end
end

SLASH_DECORVENDOROPTIONS1 = "/dvoptions"
SLASH_DECORVENDOROPTIONS2 = "/decoroptions"

SlashCmdList["DECORVENDOROPTIONS"] = function()
    if Settings and Settings.OpenToCategory and dv_optionsCategory then
        Settings.OpenToCategory(dv_optionsCategory:GetID())
    end
end





