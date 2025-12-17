local addonName, dv = ...

-- Ensure tables exist
dv.expansions = dv.expansions or {}
dv.professions = dv.professions or {}
dv.professionItem = dv.professionItem or {}

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
        -- Midnight = true,
    }
}
DVDB = DVDB or {}
DVDB.minimap = DVDB.minimap or {}
vendorSettings.completedDrops = vendorSettings.completedDrops or {}


local refreshTimer = nil
local function RequestUpdate()
  if refreshTimer then refreshTimer:Cancel() end
  refreshTimer = C_Timer.NewTimer(0.2, function()
    refreshTimer = nil
    if DV_MainFrame and DV_MainFrame:IsShown() then
      BuildVendorUI()
    end
  end)
end

local itemNameCache = {}
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

local decorThumbCache = {}

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

-- Lookup: item -> profession
local function BuildProfessionLookup()
    dv.itemToProfession = {}
    for _, profession in ipairs(dv.professions or {}) do
        for _, recipe in ipairs(profession.items or {}) do
            dv.itemToProfession[recipe.id] = profession.name
        end
    end
end

-- UI Tracking
local activeWidgets = {}       -- tracks all created lines and headers for clearing
local collapsedHeaders = {}    -- tracks which expansion/vendor group headers are collapsed
 dv.currentTab = "vendors"
-- ===============================
-- Minimap Button Library
-- ===============================
local LibDBIcon = LibStub("LibDBIcon-1.0", true)
local minimapButton

local function GetFullTexturePath(texturePath)
    if texturePath and not string.match(texturePath, "[\\/]") then
        return "Interface\\AddOns\\DecorVendor\\Assets\\" .. texturePath
    end
    return texturePath
end

local frame = CreateFrame("Frame", "DV_MainFrame", UIParent, "BackdropTemplate")
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
iconTexture:SetTexture("Interface\\BUTTONS\\UI-GuildButton-OfficerNote-Up")
iconTexture:SetAllPoints(infoIcon)
infoIcon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

infoIcon:SetScript("OnEnter", function(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:AddLine("Decor Vendor Notice", 1, 0.82, 0)
  GameTooltip:AddLine("Profession Filter is on Profession Tab", 1, 1, 1, true)
  GameTooltip:AddLine("Remove Hide Found Vendors is back!", 1, 1, 1, true)
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

-- Report Missing Vendor Icon
local reportIcon = CreateFrame("Button", nil, frame)
reportIcon:SetSize(24, 24)
reportIcon:SetPoint("LEFT", supportIcon, "RIGHT", 6, 0)

local reportIconTexture = reportIcon:CreateTexture(nil, "ARTWORK")
reportIconTexture:SetTexture("Interface\\Buttons\\UI-GuildButton-MOTD-Up")
reportIconTexture:SetAllPoints(reportIcon)

reportIcon:SetHighlightTexture(
  "Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight",
  "ADD"
)

reportIcon:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
    GameTooltip:AddLine("Updates slowly coming out but are coming!", 1, 0.82, 0)
    GameTooltip:Show()
end)

reportIcon:SetScript("OnLeave", GameTooltip_Hide)

-- ===============================
-- Bottom Tabs (Vendors / Professions)
-- ===============================
local tabs = {}
 dv.currentTabX = 10

local function UpdateTabStyles()
    for _, tab in ipairs(tabs) do
        if tab.id == dv.currentTab then
            tab:SetBackdropColor(0.02, 0.02, 0.02, 1)
            tab:SetBackdropBorderColor(1, 0.82, 0, 1)
        else
            tab:SetBackdropColor(0.1, 0.1, 0.1, 1)
            tab:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
        end
    end
end
local function UpdateFiltersForTab()
    if dv.filterButton then
        if dv.currentTab == "professions" then
            dv.filterButton:Show()
        else
            dv.filterButton:Hide()
        end
    end
end



local function CreateBottomTab(id, text, icon)
    local tab = CreateFrame("Button", nil, frame, "BackdropTemplate")
    tab:SetHeight(28)
    tab:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })

    local iconTex = tab:CreateTexture(nil, "ARTWORK")
    iconTex:SetSize(18, 18)
    iconTex:SetPoint("LEFT", 8, 0)
    iconTex:SetTexture(icon)

    local label = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", iconTex, "RIGHT", 6, 0)
    label:SetText(text)

    local width = 8 + 18 + 6 + label:GetStringWidth() + 12
    tab:SetWidth(width)

    tab:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", dv.currentTabX, 2)
    dv.currentTabX = dv.currentTabX + width - 1

    tab.id = id
    tabs[#tabs + 1] = tab

    tab:SetScript("OnClick", function()
    if dv.currentTab ~= id then
        dv.currentTab = id
        dv.ClearWidgets()
        UpdateTabStyles()

        if dv.filterButton then
            dv.filterButton:Show()
        end

        if id == "vendors" then
            BuildVendorUI()
        elseif id == "professions" then
            BuildProfessionList()
        end
    end
end)
    return tab
end

CreateBottomTab("vendors", "Vendors", "Interface\\Icons\\INV_Misc_Bag_10")
CreateBottomTab("professions", "Professions", "Interface\\Icons\\Trade_Tailoring")

UpdateTabStyles()
UpdateFiltersForTab()

-- Scale slider
local scaleSlider = CreateFrame("Slider", "DV_ScaleSlider", frame, "UISliderTemplate")
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

-- Active widgets
local activeWidgets = {}

-- Clear widgets
function dv.ClearWidgets()
    for _, w in ipairs(activeWidgets) do
        w:Hide()
    end
    wipe(activeWidgets)
end

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
    header.icon:SetText(collapsedHeaders[group.name] and "+" or "−")
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
    header.icon:SetText(collapsed and "+" or "−")

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

-- Create vendor line
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

    -- ABC sort
    table.sort(professions, function(a, b)
        return (a.name or "") < (b.name or "")
    end)

    for _, profession in ipairs(professions) do
        if selectedProfessions.All or selectedProfessions[profession.name] then
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
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText("No profession items available.")
        msg:SetTextColor(0.7, 0.7, 0.7)
        table.insert(activeWidgets, msg)
    end

    scrollChild:SetHeight(math.abs(y) + 20)
end

function BuildVendorList()
    dv.ClearWidgets()

    local y = 0
    local hasContent = false

    -- Copy & sort groups A–Z
    local groups = {}
    for _, group in ipairs(dv.npcs or {}) do
        table.insert(groups, group)
    end

    table.sort(groups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(groups) do
        -- Expansion filter (group-level)
        if selectedExpansions.All or selectedExpansions[group.expansion] then

            local visibleVendors = {}

            for _, vendor in ipairs(group.vendors or {}) do
                local passesFaction =
                    selectedFactions.All or selectedFactions[vendor.faction]

                local passesZone =
                    zoneFilter == "All" or vendor.zone == zoneFilter

                local notVisited =
                    not (
                        vendorSettings.hideCompleted
                        and vendorSettings.visited
                        and vendorSettings.visited[vendor.id]
                    )

                if passesFaction and passesZone and notVisited then
                    table.insert(visibleVendors, vendor)
                end
            end

            if #visibleVendors > 0 then
                hasContent = true

                -- Sort vendors A–Z
                table.sort(visibleVendors, function(a, b)
                    return (a.title or ""):lower() < (b.title or ""):lower()
                end)

                -- Count totals from FULL group
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
                    local startY = y
                    for _, vendor in ipairs(visibleVendors) do
                        y = CreateVendorLine(scrollChild, vendor, y)
                    end
                    if y < startY then y = y - 10 end
                end
            end
        end
    end

    if not hasContent then
        local msg = scrollChild:CreateFontString(nil, "OVERLAY")
        msg:SetFont(STANDARD_TEXT_FONT, 14)
        msg:SetPoint("TOP", 0, -50)
        msg:SetText("No Vendors needed for these filters.\nGreat job!")
        msg:SetTextColor(0.2, 1, 0.2, 1)
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

--Esc logic
local function UpdateEscBehavior()
    local frameName = "DV_MainFrame"
    local foundIndex = nil
    for i, v in pairs(UISpecialFrames) do if v == frameName then foundIndex = i break end end
    
    if vendorSettings.closeOnEsc then
        if not foundIndex then table.insert(UISpecialFrames, frameName) end
    else
        if foundIndex then table.remove(UISpecialFrames, foundIndex) end
    end
end

-- ============================================
-- Initialize on ADDON_LOADED
-- ============================================
local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_ENTERING_WORLD")

init:SetScript("OnEvent", function(self, event, loadedAddon)

    -- ===============================
    -- ADDON LOADED
    -- ===============================
    if event == "ADDON_LOADED" and loadedAddon == addonName then
        print("DecorVendor loaded.")

        -------------------------------------------------
        -- Core lookups
        -------------------------------------------------
        BuildProfessionLookup()

        -------------------------------------------------
        -- Initialize filters (safe defaults)
        -------------------------------------------------
        selectedExpansions   = selectedExpansions   or { All = true }
        selectedProfessions  = selectedProfessions  or { All = true }
        selectedFactions     = selectedFactions     or { All = true }
        continentFilter      = continentFilter      or "All"
        zoneFilter           = zoneFilter           or "All"

        -------------------------------------------------
        -- Initialize saved settings (VERY IMPORTANT)
        -------------------------------------------------
        vendorSettings                = vendorSettings or {}
        vendorSettings.visited         = vendorSettings.visited or {}
        vendorSettings.hideCompleted   = vendorSettings.hideCompleted or false
        vendorSettings.completedDrops  = vendorSettings.completedDrops or {}
        vendorSettings.scale           = vendorSettings.scale or 1.0
        vendorSettings.showMinimapButton =
            (vendorSettings.showMinimapButton ~= false)

        -------------------------------------------------
        -- LibDB / Minimap
        -------------------------------------------------
        DVDB = DVDB or {}
        DVDB.minimap = DVDB.minimap or {}
        DVDB.minimap.hide = not vendorSettings.showMinimapButton

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
                        if dv_options_category then
                            Settings.OpenToCategory(dv_options_category:GetID())
                        end
                    end
                end
            })

            function dataobj:OnTooltipShow()
                self:AddLine("|cffffffffDecor Vendor|r")
                self:AddLine("|cff00ff00<Left Click>|r Toggle window")
                self:AddLine("|cff00ff00<Right Click>|r Options")
            end

            LibDBIcon:Register("DecorVendor", dataobj, DVDB.minimap)
        end

    

        -------------------------------------------------
        -- Initial UI build
        -------------------------------------------------
        BuildVendorUI()

        -------------------------------------------------
        -- Filters / options UI
        -------------------------------------------------
        if dv.CreateFilterDropdown then
            dv.CreateFilterDropdown(DV_MainFrame)
        end

        if dv.CreateOptionsPanel then
            dv.CreateOptionsPanel()
        end

        if dv.minimapCheckbox then
            dv.minimapCheckbox:SetChecked(vendorSettings.showMinimapButton)
        end

        -------------------------------------------------
        -- Final UI setup
        -------------------------------------------------
        frame:SetScale(vendorSettings.scale)
        frame:Show()
        UpdateEscBehavior()
    end

    -- ===============================
    -- PLAYER ENTERING WORLD
    -- ===============================
    if event == "PLAYER_ENTERING_WORLD" then
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



