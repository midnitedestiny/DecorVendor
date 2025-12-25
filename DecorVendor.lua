local addonName, dv = ...

-- Filter state tables (restored to original logic)
selectedExpansions  = selectedExpansions  or {}
selectedProfessions = selectedProfessions or {}
selectedFactions    = selectedFactions    or {}


local function HasAnySelection(tbl)
    if type(tbl) ~= "table" then return false end
    for _, v in pairs(tbl) do
        if v then return true end
    end
    return false
end


-- Retail-only addon loaded check
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
	visited = {},              -- Add this
    hideCompleted = false,     -- Add this
}
dbDV = dbDV or {}
dbDV.minimap = dbDV.minimap or { hide = false }


local dv_optionsCategory = nil
local decorThumbCache = {}
local itemNameCache = {}
local refreshTimer = nil
local activeWidgets = {}       -- tracks all created lines and headers for clearing
local collapsedHeaders = {}    -- tracks which expansion/vendor group headers are collapsed

local LibDBIcon = LibStub("LibDBIcon-1.0", true)
local minimapButton 
local initialized = false
 dv.currentTab = "vendors"
 
dv.searchQuery = ""


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

local function BuildProfessionLookup()
    dv.itemToProfession = {}
    for _, profession in ipairs(dv.professions or {}) do
        for _, recipe in ipairs(profession.items or {}) do
            dv.itemToProfession[recipe.id] = profession.name
        end
    end
end

local function GetFullTexturePath(texturePath)
    if texturePath and not string.match(texturePath, "[\\/]") then
        return "Interface\\AddOns\\DecorVendor\\Assets\\" .. texturePath
    end
    return texturePath
end

local frame = CreateFrame("Frame", "DV_MainFrame", UIParent, "BackdropTemplate")
frame:SetSize(860, 580)
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

-- After creating main frame
frame.sidebar = CreateFrame("Frame", "DV_Sidebar", frame, "BackdropTemplate")
frame.sidebar:SetWidth(170)

frame.sidebar:ClearAllPoints()
frame.sidebar:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -72)
frame.sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 10)

frame.sidebar:SetFrameLevel(frame:GetFrameLevel() + 1)

frame.sidebar:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
})

frame.sidebar:SetBackdropColor(
    52/255,
    1/255,
    62/255,
    0.95
)

dv.sidebar = frame.sidebar

-- ===============================
-- Sidebar containers
-- ===============================

-- Tabs container (static)
frame.sidebarTabs = CreateFrame("Frame", nil, frame.sidebar)
frame.sidebarTabs:SetPoint("TOPLEFT", frame.sidebar, "TOPLEFT", 0, 0)
frame.sidebarTabs:SetPoint("TOPRIGHT", frame.sidebar, "TOPRIGHT", 0, 0)
frame.sidebarTabs:SetHeight(80)

-- Divider (AFTER tabs exist)
local divider = frame.sidebar:CreateTexture(nil, "ARTWORK")
divider:SetHeight(1)
divider:SetPoint("TOPLEFT", frame.sidebarTabs, "BOTTOMLEFT", 4, -2)
divider:SetPoint("TOPRIGHT", frame.sidebarTabs, "BOTTOMRIGHT", -8, -2)
divider:SetColorTexture(0, 0, 0, 0.4)

-- Filters container (dynamic)
frame.sidebarFilters = CreateFrame("Frame", nil, frame.sidebar)
frame.sidebarFilters:SetPoint("TOPLEFT", frame.sidebarTabs, "BOTTOMLEFT", 0, -2)
frame.sidebarFilters:SetPoint("TOPRIGHT", frame.sidebarTabs, "BOTTOMRIGHT", 0, -2)
frame.sidebarFilters:SetPoint("BOTTOMLEFT", frame.sidebar, "BOTTOMLEFT", 0, 0)
frame.sidebarFilters:SetPoint("BOTTOMRIGHT", frame.sidebar, "BOTTOMRIGHT", 0, 0)

-- IMPORTANT assignments
dv.sidebarTabs = frame.sidebarTabs
dv.sidebar     = frame.sidebarFilters

-- ===============================
-- Tabs
-- ===============================

local tabs = {}
local TAB_START_Y = -16
local TAB_SPACING = 32
local tabY = TAB_START_Y

local function UpdateTabStyles()
    for _, tab in ipairs(tabs) do
        if tab.id == dv.currentTab then
            tab:SetBackdropColor(0.18, 0.08, 0.25, 1) -- active purple
            tab:SetBackdropBorderColor(1, 0.82, 0, 1)
        else
            tab:SetBackdropColor(0.1, 0.1, 0.1, 0.9)
            tab:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
        end
    end
end
local function UpdateSidebarForTab()
    if dv.currentTab == "vendors" then
        dv.sidebar:Show()
        dv.BuildSidebarFilters()
    else
        dv.sidebar:Hide()
    end
end
local function CreateSideTab(id, text, icon)
    local tab = CreateFrame("Button", nil, dv.sidebarTabs, "BackdropTemplate")
    tab:SetSize(150, 26)
    tab:SetPoint("TOPLEFT", dv.sidebarTabs, "TOPLEFT", 10, tabY)

    tab:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })

    local iconTex = tab:CreateTexture(nil, "ARTWORK")
    iconTex:SetSize(16, 16)
    iconTex:SetPoint("LEFT", 8, 0)
    iconTex:SetTexture(icon)

    local label = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", iconTex, "RIGHT", 6, 0)
    label:SetText(text)

    tab.id = id
    tabs[#tabs + 1] = tab

   tab:SetScript("OnClick", function()
    if dv.currentTab ~= id then
        dv.currentTab = id
        dv.ClearWidgets()
        UpdateTabStyles()

        UpdateSidebarForTab()  -- 👈 ADD THIS

        if id == "vendors" then
            BuildVendorUI()
        elseif id == "professions" then
            BuildProfessionList()
        end
    end
end)


    tabY = tabY - TAB_SPACING
    return tab
end

CreateSideTab("vendors", "Vendors", "Interface\\Icons\\INV_Misc_Bag_10")
CreateSideTab("professions", "Professions", "Interface\\Icons\\Trade_Tailoring")

UpdateTabStyles()

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
title:SetText("The Original Decor Vendors")
title:SetTextColor(0.85, 0.65, 1)

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
iconTexture:SetTexture("Interface\\BUTTONS\\UI-GuildButton-OfficerNote-Up")
iconTexture:SetAllPoints(infoIcon)
infoIcon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

infoIcon:SetScript("OnEnter", function(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:AddLine("Decor Vendor Notice", 1, 0.82, 0)
  GameTooltip:AddLine("Professions is on Profession Tab", 1, 1, 1, true)
  GameTooltip:AddLine("Remove Hide Found Vendors is back!", 1, 1, 1, true)
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

-- Active widgets
local activeWidgets = {}

-- Clear widgets
function dv.ClearWidgets()
    for _, w in ipairs(activeWidgets) do
        w:Hide()
    end
    wipe(activeWidgets)
end

-- Create Search Box
local searchBox = CreateFrame("EditBox", "DV_SearchBox", frame, "SearchBoxTemplate")
searchBox:SetSize(160, 24)
searchBox:SetPoint("TOPRIGHT", -24, -2)
searchBox:SetScale(1.2)
searchBox:SetAutoFocus(false)
searchBox.Instructions:SetText("Search Vendor Names...")

-- Store search text globally in your addon
dv.searchQuery = ""

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

local function CreateProfessionHeader(parent, profession, y)
    

    if collapsedHeaders["prof_" .. profession.name] == nil then
        collapsedHeaders["prof_" .. profession.name] = true
    end

    local collapsed = collapsedHeaders["prof_" .. profession.name]

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
    header.icon:SetText(collapsed and ">>" or "<<")

    -- Title (LEFT)
    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    header.text:SetPoint("LEFT", 28, 0)
    header.text:SetText(
        string.format(profession.name)
    )

    -- Progress (RIGHT)
    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11)
    header.progress:SetPoint("RIGHT", -8, 0)
    

    -- Click to collapse
    header:SetScript("OnClick", function()
        collapsedHeaders["prof_" .. profession.name] = not collapsed
        BuildVendorUI()
    end)

    table.insert(activeWidgets, header)
    return collapsed, y - 36
end

local function CreateProfessionLine(parent, profItem, y)
    local line = CreateFrame("Button", nil, parent)
line:SetPoint("TOPLEFT", 10, y)
line:SetSize(560, 22)
line:RegisterForClicks("AnyUp") -- 🔥 REQUIRED


    -------------------------------------------------
    -- ITEM NAME (FAST / ASYNC)
    -------------------------------------------------
    local nameText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("TOPLEFT", 0, -2)
    nameText:SetJustifyH("LEFT")
    nameText:SetText("• Loading item...")

    -- Async-safe item name
    local itemObj = Item:CreateFromItemID(profItem.id)
    itemObj:ContinueOnItemLoad(function()
        if nameText then
            nameText:SetText("• " .. itemObj:GetItemName())
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
    skillText:SetTextColor(0.7, 0.7, 0.7)

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

        -- Thumbnail preview (if available)
        local thumb = dv.GetDecorThumbnail and dv.GetDecorThumbnail(profItem.id)
        if thumb and dv.smallPreviewFrame then
            dv.smallPreviewFrame.texture:SetTexture(thumb)
            dv.smallPreviewFrame:ClearAllPoints()
            dv.smallPreviewFrame:SetPoint("TOPLEFT", GameTooltip, "TOPRIGHT", 10, 0)
            dv.smallPreviewFrame:Show()
        end
    end)

    line:SetScript("OnLeave", function()
        ResetCursor()
        GameTooltip:Hide()
        if dv.smallPreviewFrame then
            dv.smallPreviewFrame:Hide()
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
    return y - 38
end

local function CreateVendorLine(parent, vendor, y)

    if vendorSettings.hideCompleted
   and vendorSettings.visited
   and vendorSettings.visited[vendor.id]
then
    return y
end


    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", 10, y)
    line:SetSize(590, 22)

    -- Vendor name
    local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("LEFT", 0, 0)
    text:SetFont(STANDARD_TEXT_FONT, 14)
    text:SetText(vendor.title or "Unknown Vendor")

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

    -- Zone text
    if vendor.zone then
        local zoneText = line:CreateFontString(nil, "OVERLAY")
        zoneText:SetFont(STANDARD_TEXT_FONT, 11)
        zoneText:SetPoint("RIGHT", -10, 0)
        zoneText:SetText(vendor.zone)
        zoneText:SetTextColor(0.7, 0.7, 0.7, 1)
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
        SetFactionColor()
        GameTooltip:Hide()
    end)

    -------------------------------------------------
    -- Waypoint Button (unchanged logic, cleaned)
    -------------------------------------------------
    if vendor.mapID and vendor.x and vendor.y then
        local waypointBtn = CreateFrame("Button", nil, line, "UIPanelButtonTemplate")
        waypointBtn:SetSize(80, 18)
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
    return y - 24
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

-- Event handler: mark visited vendors when opening a merchant
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")

eventFrame:SetScript("OnEvent", function()
    local targetName = UnitName("target")
    if not targetName then return end

    if not dv.npcs then return end

    for _, group in ipairs(dv.npcs) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.title == targetName then
                vendorSettings.visited = vendorSettings.visited or {}
				vendorSettings.visited[vendor.id] = true
                -- Rebuild UI if needed
                if vendorSettings.hideCompleted then
                    BuildVendorUI()
                end

                return  -- stop after finding the first match
            end
        end
    end
end)

function ResetAllVendors()
    vendorSettings.visited = {}   -- wipe ALL progress
    print("|cff88ff88DecorVendor:|r Vendor progress reset.")
end

local function BuildSidebarFilters()
dv.BuildSidebarFilters = BuildSidebarFilters
    local parent = dv.sidebar
    if not parent then return end

    -- ===============================
    -- Layout constants (IMPORTANT)
    -- ===============================
    local START_X_HEADER    = 12
	local START_X_CHECKBOX  = 20
	local START_X_BUTTON    = 30   -- 👈 NEW (between header & checkbox)
	local SPACING           = 19
	local SECTION_GAP       = 10    -- 👈 small breathing room
	local y = -6
    -- ===============================
    -- Helpers
    -- ===============================
    local function Header(text)
        local h = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        h:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
        h:SetTextColor(1, 0.82, 0)
        h:SetPoint("TOPLEFT", parent, "TOPLEFT", START_X_HEADER, y)
        h:SetText(text)

        y = y - SECTION_GAP

        --[[-- divider line
        local div = parent:CreateTexture(nil, "ARTWORK")
        div:SetHeight(1)
        div:SetPoint("TOPLEFT", parent, "TOPLEFT", START_X_HEADER, y + 10)
        div:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -12, y + 10)
        div:SetColorTexture(0, 0, 0, 0.4)

        y = y - SECTION_GAP]]
    end


    local function Checkbox(label, tbl, key)
        tbl[key] = tbl[key] or false

        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", parent, "TOPLEFT", START_X_CHECKBOX, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])

        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
            BuildVendorUI()
        end)

        y = y - SPACING
    end

  
-- ===============================
-- EXPANSIONS
-- ===============================
Header("Expansions")

selectedExpansions = selectedExpansions or {}

local seen = {}
for _, g in ipairs(dv.npcs or {}) do
    if g.expansion and not seen[g.expansion] then
        seen[g.expansion] = true

        Checkbox(g.expansion,
            selectedExpansions,
            g.expansion,
            function()
                selectedExpansions[g.expansion] = not selectedExpansions[g.expansion]

                -- If nothing selected → restore "All"
                local any = false
                for k, v in pairs(selectedExpansions) do
                    if k ~= "All" and v then any = true end
                end
                if any then
                    selectedExpansions.All = false
                else
                    selectedExpansions = { All = true }
                end

                BuildVendorUI()
            end)
    end
end

-- ===============================
-- FACTION
-- ===============================
y = y - 25
Header("Faction")

selectedFactions = selectedFactions or {}

for _, f in ipairs({ "alliance", "horde", "neutral" }) do
    Checkbox(f,
        selectedFactions,
        f,
        function()
            selectedFactions[f] = not selectedFactions[f]

            local any = false
            for k, v in pairs(selectedFactions) do
                if k ~= "All" and v then any = true end
            end
            if any then
                selectedFactions.All = false
            else
                selectedFactions = { All = true }
            end

            BuildVendorUI()
        end)
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

function BuildProfessionList()
    dv.ClearWidgets()

    local y = -6
    local hasContent = false

    local professions = dv.professions or {}

    table.sort(professions, function(a, b)
        return (a.name or "") < (b.name or "")
    end)

    for _, profession in ipairs(professions) do
        hasContent = true

        local collapsed, newY =
            CreateProfessionHeader(scrollChild, profession, y)
        y = newY

        if not collapsed then
            for _, item in ipairs(profession.items or {}) do
                y = CreateProfessionLine(scrollChild, item, y)
            end
            y = y - 8
        end
    end

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

function dv.HideAllPopups()
    if dv.vendorPopup then dv.vendorPopup:Hide() end
    if dv.reagentsPopup then dv.reagentsPopup:Hide() end
    if dv.wowheadPopup then dv.wowheadPopup:Hide() end
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

	hideFoundCheck:SetChecked(vendorSettings.hideCompleted)

	hideFoundCheck:SetScript("OnClick", function(self)
    vendorSettings.hideCompleted = self:GetChecked()
    BuildVendorUI()
end)




-- ==========================
-- SUPPORT & COMMUNITY HEADER
-- ==========================
local supportHeader = configFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
supportHeader:SetPoint("TOPLEFT", hideFoundCheck, "BOTTOMLEFT", 0, -18)
supportHeader:SetText("Support & Community")
supportHeader:SetTextColor(1, 0.82, 0)


-- ==========================
-- SUPPORT ICON
-- ==========================
local supportIcon = CreateFrame("Frame", nil, configFrame)
supportIcon:SetSize(28, 28)
supportIcon:SetPoint("TOPLEFT", supportHeader, "BOTTOMLEFT", 0, -6)

local tex = supportIcon:CreateTexture(nil, "ARTWORK")
tex:SetAllPoints()
tex:SetTexture("Interface\\Icons\\INV_Misc_Gift_01")


-- ==========================
-- LABELS
-- ==========================
-- CurseForge label (TOP)
local curseLabel = configFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
curseLabel:SetPoint("LEFT", supportIcon, "RIGHT", 10, 4)
curseLabel:SetText("CurseForge:")

-- Ko-Fi label (BOTTOM)
local koFiLabel = configFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
koFiLabel:SetPoint("TOPLEFT", curseLabel, "BOTTOMLEFT", 0, -14)
koFiLabel:SetText("Ko-Fi:")


--[[
-- ==========================
-- EDIT BOX FACTORY
-- ==========================
local function CreateURLBox(anchor, url)
    local box = CreateFrame("EditBox", nil, configFrame, "InputBoxTemplate")
    box:SetSize(260, 24)
    box:SetPoint("LEFT", anchor, "RIGHT", 6, 0)
    box:SetAutoFocus(false)
    box:SetText(url)
    box:SetCursorPosition(0)

    box:SetScript("OnEditFocusGained", function(self)
        self:HighlightText()
    end)

    return box
end]]
-- ==========================
-- EDIT BOX FACTORY (READ-ONLY)
-- ==========================
local function CreateURLBox(anchor, url)
    local box = CreateFrame("EditBox", nil, configFrame, "InputBoxTemplate")
    box:SetSize(260, 24)
    box:SetPoint("LEFT", anchor, "RIGHT", 6, 0)
    box:SetAutoFocus(false)
    box:SetText(url)
    box:SetCursorPosition(0)

    ------------------------------------------------
    -- 🔒 Make it READ-ONLY (no typing or deleting)
    ------------------------------------------------
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

    ------------------------------------------------
    -- 📋 Highlight on click for easy copying
    ------------------------------------------------
    box:SetScript("OnMouseUp", function(self)
        self:HighlightText()
    end)
    box:SetScript("OnEditFocusGained", function(self)
        self:HighlightText()
    end)

    ------------------------------------------------
    -- 🎨 GREYED OUT LOOK (disabled style)
    ------------------------------------------------
    box:EnableMouse(true)
    box:Disable()     -- makes it visually greyed out & non-editable
    box:Enable()      -- re-enable mouse so it can still highlight text

    return box
end

-- Ko-Fi box
local koFiBox = CreateURLBox(koFiLabel, "https://ko-fi.com/midnitedestiny")

-- CurseForge box
local curseBox = CreateURLBox(curseLabel, "https://www.curseforge.com/wow/addons/decor-vendor")

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
                if includeVendor then
                    local notVisited =
                        not (
                            vendorSettings.hideCompleted
                            and vendorSettings.visited
                            and vendorSettings.visited[vendor.id]
                        )

                    if not notVisited then
                        includeVendor = false
                    end
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


function BuildVendorUI()   
    if dv.currentTab == "vendors" then
        BuildVendorList()
    elseif dv.currentTab == "professions" then
        BuildProfessionList()
    end
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
selectedFactions    = selectedFactions    or {}

init:SetScript("OnEvent", function(self, event, loadedAddon)
    if event == "ADDON_LOADED" and loadedAddon == addonName then
        print("DecorVendor loaded.")

        -- Build lookup tables
        BuildProfessionLookup()
		BuildSidebarFilters()
		
        -- Safe defaults for non-filter globals
        continentFilter = continentFilter or "All"
        zoneFilter      = zoneFilter      or "All"			          
       
        -- Saved settings defaults
        vendorSettings = vendorSettings or {}
        vendorSettings.visited        = vendorSettings.visited or {}
        vendorSettings.hideCompleted  = vendorSettings.hideCompleted or false
        vendorSettings.completedDrops = vendorSettings.completedDrops or {}
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
		frame:SetScale(scale); supportFrame:SetScale(scale); dv.vendorPopup:SetScale(scale); dv.wowheadPopup:SetScale(scale)
   
        -- Final UI setup
		BuildVendorUI()
		CreateOptionsPanel()
        UpdateEscBehavior()
        frame:Show()
		if not vendorSettings.showMinimapButton then LibDBIcon:Hide("DecorVendor") end

    end

    if event == "PLAYER_ENTERING_WORLD" then
        -- Don’t register options again here (prevents duplicates)
        if frame then frame:SetScale(vendorSettings.scale or 1.0) end
        if supportFrame then supportFrame:SetScale(vendorSettings.scale or 1.0) end
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



