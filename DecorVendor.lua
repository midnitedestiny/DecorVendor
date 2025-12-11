local addonName, dv = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, loadedAddon)
    if loadedAddon ~= addonName then return end

    print("DecorVendor loaded.")

    -- Initialize filters so UI shows everything
    selectedExpansions  = { All = true }
    selectedProfessions = { All = true }
    selectedFactions    = { All = true }
    continentFilter = "All"
    zoneFilter = "All"

    -- Build the UI AFTER filters exist
    BuildUI()
end)



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
   -- Midnight = true,
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
iconTexture:SetTexture("Interface\\BUTTONS\\UI-GuildButton-PublicNote-Up")
iconTexture:SetAllPoints(infoIcon)
infoIcon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

infoIcon:SetScript("OnEnter", function(self)
  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
  GameTooltip:AddLine("Decor Vendor Tips", 1, 0.82, 0)
  GameTooltip:AddLine("If you see a vendor not listed please inform me on curse!", 1, 1, 1, true)
  GameTooltip:AddLine("Please correct me if a vendor is incorrectly faction labeled", 1, 1, 1, true)
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

local popupGradient = vendorPopup:CreateTexture(nil, "BACKGROUND")
popupGradient:SetPoint("TOPLEFT", 4, -4)
popupGradient:SetPoint("BOTTOMRIGHT", -4, 4)
popupGradient:SetColorTexture(1, 1, 1, 1)
popupGradient:SetGradient("VERTICAL", CreateColor(0.12, 0.12, 0.12, 1), CreateColor(0.05, 0.05, 0.05, 1))

local vendorPopupTitle = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
vendorPopupTitle:SetPoint("TOP", 0, -12)
vendorPopupTitle:SetText("Vendor Items")
vendorPopupTitle:SetTextColor(1, 0.82, 0)

local titleSeparator = vendorPopup:CreateTexture(nil, "ARTWORK")
titleSeparator:SetHeight(2)
titleSeparator:SetColorTexture(0.4, 0.4, 0.4, 0.8)
titleSeparator:SetPoint("TOPLEFT", 10, -36)
titleSeparator:SetPoint("TOPRIGHT", -10, -36)

local vendorPopupCloseBtn = CreateFrame("Button", nil, vendorPopup, "UIPanelCloseButton")
vendorPopupCloseBtn:SetPoint("TOPRIGHT", 0, 0)
vendorPopupCloseBtn:SetSize(30, 30)
vendorPopupCloseBtn:SetScript("OnClick", function() vendorPopup:Hide() end)

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

local vendorIconCache = {} 
local function ShowVendorPopup(npcID, vendorName)
    if not npcID then
        print("Decor Vendor: No vendor ID provided.")
        return
    end

    -- 1️⃣ Look up the vendor in the merged VendorData
    local vendorInfo
    for _, expansion in ipairs(VendorData) do
        for _, continent in ipairs(expansion.continents or {}) do
            for _, vendor in ipairs(continent.vendors or {}) do
                if vendor.id == npcID then
                    vendorInfo = vendor
                    break
                end
            end
            if vendorInfo then break end
        end
        if vendorInfo then break end
    end

    if not vendorInfo then
        print("Decor Vendor: Vendor ID not found in database.")
        return
    end

   
    local items = dv.vendorItems[npcID]
    vendorPopupTitle:SetText((vendorName or "Vendor") .. " sells:")
    
    --Hide all existing item frames
    for _, frame in pairs(vendorIconCache) do
        frame:Hide()
    end

    local tileSize = 50
    local margin = 12 
    local columns = 6
    local startX = 25
    local startY = -48

    local row = 0
    local col = 0

    for i, itemID in ipairs(items) do
        local itemFrame = vendorIconCache[i]
        
        if not itemFrame then
            itemFrame = CreateFrame("Frame", nil, vendorPopup, "BackdropTemplate")
            itemFrame:SetSize(tileSize, tileSize)
            itemFrame:SetClipsChildren(true) 
            
            itemFrame:SetBackdrop({
                edgeFile = "Interface\\Buttons\\WHITE8x8",
                edgeSize = 2, 
            })
            itemFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

            local btn = CreateFrame("Button", nil, itemFrame)
            btn:SetAllPoints(itemFrame)

            local glow = btn:CreateTexture(nil, "BACKGROUND")
            glow:SetPoint("TOPLEFT", -2, 2)
            glow:SetPoint("BOTTOMRIGHT", 2, -2)
            glow:SetColorTexture(0, 0, 0, 0.5)
            btn.glow = glow

            local icon = btn:CreateTexture(nil, "ARTWORK")
            icon:SetPoint("TOPLEFT", 2, -2)
            icon:SetPoint("BOTTOMRIGHT", -2, 2)
            icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
            btn.icon = icon

            btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
            btn:GetHighlightTexture():SetBlendMode("ADD")
            btn:GetHighlightTexture():SetAllPoints(icon)
            
            itemFrame.btn = btn

            table.insert(vendorIconCache, itemFrame)
        end

        col = (i - 1) % columns
        row = math.floor((i - 1) / columns)
        
        itemFrame:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", startX + (col * (tileSize + margin)), startY - (row * (tileSize + margin)))
        
        --Update the button data
        local btn = itemFrame.btn
        local texture = GetItemIcon(itemID)
        btn.icon:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")
        
        btn:SetScript("OnEnter", function(self)
            SetCursor("INSPECT_CURSOR")
            itemFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
            self.glow:SetColorTexture(1, 0.82, 0, 0.2)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. itemID)
            GameTooltip:Show()
        end)
        
        btn:SetScript("OnLeave", function(self)
            ResetCursor()
            itemFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
            self.glow:SetColorTexture(0, 0, 0, 0.5)
            GameTooltip:Hide()
        end)
        
        btn:SetScript("OnClick", function()
            DressUpItemLink("item:" .. itemID)
        end)

        itemFrame:Show()
    end

    local totalRows = math.floor((#items - 1) / columns) + 1
    local totalHeight = math.abs(startY) + (totalRows * (tileSize + margin)) + 4
    local totalWidth = (startX * 2) + (columns * (tileSize + margin)) - margin

    vendorPopup:SetSize(totalWidth, totalHeight)
    vendorPopup:SetScale(vendorSettings.scale or 1.0) 
    vendorPopup:Show()
end

--Create reusable frame for the texture
local previewFrame = CreateFrame("Frame", "DV_RewardFrame", UIParent, "BackdropTemplate")
previewFrame:SetSize(300, 330)
previewFrame:SetFrameStrata("TOOLTIP")
previewFrame:SetBackdrop({
  bgFile = "Interface\\Buttons\\WHITE8x8",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = false, edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
previewFrame:SetBackdropColor(0.05, 0.05, 0.05, 0.98)
previewFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
previewFrame:Hide()

local previewTitle = previewFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
previewTitle:SetFont(STANDARD_TEXT_FONT, 15)
previewTitle:SetPoint("TOP", 0, -12)
previewTitle:SetText("Decor Reward")
previewTitle:SetWidth(280)
previewTitle:SetTextColor(1, 0.82, 0)

previewFrame.currentReward = nil
previewFrame.currentRewardIndex = 1
previewFrame.totalRewards = 0

--Legacy 2D Texture
local previewTexture = previewFrame:CreateTexture(nil, "ARTWORK")
previewTexture:SetSize(288, 288)
previewTexture:SetPoint("BOTTOM", 0, 6)
previewTexture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
previewFrame.texture = previewTexture

--3D Model Frame
local previewModel = CreateFrame("PlayerModel", nil, previewFrame)
previewModel:SetSize(288, 288)
previewModel:SetPoint("BOTTOM", 0, 6)

previewModel:SetScript("OnModelLoaded", function(self)
  self:MakeCurrentCameraCustom()
  
  local modelID = self:GetModelFileID()
  local posData = dv.modelPositions[modelID]
  
  if posData then
    self:SetPosition(posData.model_x, 0, posData.model_z)
    self:SetCameraPosition(0, 0, posData.camera_y)
    self:SetCameraDistance(posData.zoom)
  else --Default
    self:SetPosition(0, 0, 0)
    self:SetCameraPosition(0, 0, 4)
    self:SetCameraDistance(10)
  end
end)
previewFrame.model = previewModel
previewModel:Hide()

local smallPreviewFrame = CreateFrame("Frame", "DV_SmallPreviewFrame", UIParent, "BackdropTemplate")
smallPreviewFrame:SetSize(300, 300)
smallPreviewFrame:SetFrameStrata("TOOLTIP")
smallPreviewFrame:SetBackdrop({
  bgFile = "Interface\\Buttons\\WHITE8x8",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = false, edgeSize = 16,
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
smallPreviewFrame:SetBackdropColor(0.05, 0.05, 0.05, 0.98)
smallPreviewFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
smallPreviewFrame:Hide()

local smallPreviewTexture = smallPreviewFrame:CreateTexture(nil, "ARTWORK")
smallPreviewTexture:SetPoint("TOPLEFT", 4, -4)
smallPreviewTexture:SetPoint("BOTTOMRIGHT", -4, 4)
smallPreviewTexture:SetTexCoord(0.08, 0.92, 0.08, 0.92)

local rotation = 0
local rotationSpeed = 0.5

previewFrame:SetScript("OnUpdate", function(self, elapsed)
  if self:IsShown() and self.model:IsShown() then
    rotation = rotation + (rotationSpeed * elapsed)
    if rotation >= (math.pi * 2) then
      rotation = rotation - (math.pi * 2)
    end
    self.model:SetFacing(rotation)
  end
end)

local wowheadPopup = CreateFrame("Frame", "DV_WowheadLinkFrame", UIParent, "BackdropTemplate")
wowheadPopup:SetSize(350, 90)
wowheadPopup:SetFrameStrata("DIALOG")
wowheadPopup:SetBackdrop({
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = true, tileSize = 32, edgeSize = 32,
  insets = { left = 8, right = 8, top = 8, bottom = 8 }
})

wowheadPopup:SetBackdropColor(0.1, 0.1, 0.1, 1)
wowheadPopup:SetPoint("CENTER")
wowheadPopup:EnableMouse(true)
wowheadPopup:SetMovable(true)
wowheadPopup:RegisterForDrag("LeftButton")
wowheadPopup:SetScript("OnDragStart", wowheadPopup.StartMoving)
wowheadPopup:SetScript("OnDragStop", wowheadPopup.StopMovingOrSizing)
wowheadPopup:Hide()

local wowheadPopupTitle = wowheadPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
wowheadPopupTitle:SetPoint("TOP", 0, -14)
wowheadPopupTitle:SetText("Ctrl + C to copy")
wowheadPopupTitle:SetTextColor(1, 0.82, 0)

local wowheadPopupEditBox = CreateFrame("EditBox", nil, wowheadPopup, "InputBoxTemplate")
wowheadPopupEditBox:SetSize(300, 20)
wowheadPopupEditBox:SetPoint("CENTER", 0, -5)
wowheadPopupEditBox:SetAutoFocus(false)
wowheadPopupEditBox:SetScript("OnEscapePressed", function() wowheadPopup:Hide() end)

local wowheadPopupCloseBtn = CreateFrame("Button", nil, wowheadPopup, "UIPanelCloseButton")
wowheadPopupCloseBtn:SetPoint("TOPRIGHT", 2, 2)
wowheadPopupCloseBtn:SetSize(30, 30)
wowheadPopupCloseBtn:SetScript("OnClick", function() wowheadPopup:Hide() end)

local function ShowWowheadLinkPopup(id, rewardType)
  local url
  if rewardType == "quest" then
      url = "https://www.wowhead.com/quest=" .. tostring(id)
  else
      url = "https://www.wowhead.com/achievement=" .. tostring(id)
  end
  wowheadPopupEditBox:SetText(url)
  wowheadPopup:SetPoint("CENTER", UIParent, "CENTER")
  wowheadPopup:Show()
  wowheadPopupEditBox:SetFocus()
  wowheadPopupEditBox:HighlightText()
end

frame:SetScript("OnHide", function()
    if wowheadPopup and wowheadPopup:IsShown() then
        wowheadPopup:Hide()
    end
    if supportFrame and supportFrame:IsShown() then
        supportFrame:Hide()
    end
    if vendorPopup and vendorPopup:IsShown() then
        vendorPopup:Hide()
    end
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


-- EXPANSIONS (multi-select)
local expansionMenu = root:CreateButton("Expansions")

-- Multi-select tracking table
if not selectedExpansions then selectedExpansions = { All = true } end

-- "All" checkbox first
expansionMenu:CreateCheckbox("All",
    function() return selectedExpansions.All end,
    function()
        selectedExpansions = { All = true }
        BuildUI()
    end
)

-- Collect unique expansions
local expansionsSeen = {}
for _, expansion in ipairs(VendorData or {}) do
    if expansion.name then
        expansionsSeen[expansion.name] = true
    end
end

-- Convert to list
local expansionList = {}
for name in pairs(expansionsSeen) do
    table.insert(expansionList, name)
end

-- Sort by release order
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
    --["Midnight"] = 12,
}

table.sort(expansionList, function(a, b)
    return (expansionOrder[a] or 999) < (expansionOrder[b] or 999)
end)

-- Create checkboxes for each expansion
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

                BuildUI()
            end
        )
    end
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
        BuildUI()
    end
)

local factionsSeen = { alliance = true, horde = true, neutral = true }
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

            BuildUI()
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
    BuildUI()
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
        BuildUI()
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

local function UpdatePreviewDisplay()
    if not previewFrame.currentReward or not previewFrame:IsShown() then return end

    local reward = previewFrame.currentReward
    local index = previewFrame.currentRewardIndex

    --Update Title
    local titleText = (type(reward.title) == "table") and reward.title[index] or reward.title or "Decor Reward"
    previewTitle:SetText(titleText)

    --Update Model or Texture
    local hasPreview = false
    if reward.model3D then
        local modelId = (type(reward.model3D) == "table") and reward.model3D[index] or reward.model3D
        if modelId then
            previewFrame.model:Show(); previewFrame.texture:Hide()
            previewFrame.model:SetModel(modelId)
            rotation = 0; hasPreview = true
        end
    elseif reward.texture then
        local textureId = (type(reward.texture) == "table") and reward.texture[index] or reward.texture
        if textureId and textureId ~= "" then
            previewFrame.model:Hide(); previewFrame.texture:Show()
            local fullTexturePath = GetFullTexturePath(tostring(textureId))
            if fullTexturePath then
                previewFrame.texture:SetTexture(fullTexturePath)
                hasPreview = true
            end
        end
    end
    if not hasPreview then previewFrame:Hide() end
end

--Cycle through multiple rewards
local function CycleReward(direction) --direction is 1 for next, -1 for prev
    if not previewFrame:IsShown() or previewFrame.totalRewards <= 1 then return end

    local newIndex = previewFrame.currentRewardIndex + direction
    if newIndex > previewFrame.totalRewards then newIndex = 1 end
    if newIndex < 1 then newIndex = previewFrame.totalRewards end

    previewFrame.currentRewardIndex = newIndex
    UpdatePreviewDisplay()
end

-- Create vendor line
local function CreateVendorLine(parent, vendor, y, faction)
    if vendorSettings.hideFound and vendor.completed then return y end

    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", 10, y)
    line:SetSize(590, 22)

    -- Create the text label for the vendor name
    local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("LEFT", 0, 0)
    text:SetText(vendor.title or "Unknown Vendor")
    text:SetFont(STANDARD_TEXT_FONT, 14)

    -- Set the text color based on faction (no more icons)
    if vendor.faction == "alliance" then
        text:SetTextColor(0.3, 0.6, 1)      -- blue
    elseif vendor.faction == "horde" then
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
		 
--[[local mapText = line:CreateFontString(nil, "OVERLAY")
    mapText:SetFont(STANDARD_TEXT_FONT, 11); mapText:SetPoint("RIGHT", -10, 0)
	local mapName = "Unknown Zone"
    if vendor.mapID then
        local mapInfo = C_Map.GetMapInfo(vendor.mapID)
        if mapInfo and mapInfo.name then
            mapName = mapInfo.name
        end
    end
    mapText:SetText(mapName)
    mapText:SetTextColor(0.7, 0.7, 0.7)	 ]]

    line:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(vendor.title, 1, 1, 1)
        if vendor.mapID then 
            GameTooltip:AddLine(mapName, 1, 0.82, 0) 
        end
        GameTooltip:AddLine("\n|cff00ff00<Left Click>|r to open Vendor Items", 1, 1, 1)
        GameTooltip:Show()
    end)

line:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then 
	ShowVendorPopup(vendor.id, vendor.title) end
end)	
	
     --  Add TomTom waypoint button
	if vendor.mapID and vendor.x and vendor.y then
    local waypointBtn = CreateFrame("Button", nil, line, "UIPanelButtonTemplate")
    waypointBtn:SetSize(80, 18)
    waypointBtn:SetPoint("RIGHT", -240, 0)
    waypointBtn:SetText("Waypoint")

    -------------------------------------------------
    -- Tooltip setup (Code B)
    -------------------------------------------------
    local mapInfo = C_Map.GetMapInfo(vendor.mapID)
    local mapName = mapInfo and mapInfo.name or "Unknown"

    -- Convert to percent (Code B)
    local xPct = math.floor(vendor.x * 100) / 100
    local yPct = math.floor(vendor.y * 100) / 100
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

    -------------------------------------------------
    -- Click handler - HYBRID (A + B)
    -------------------------------------------------
    waypointBtn:SetScript("OnClick", function()
    ---------------------------
    -- 1. TomTom
    ---------------------------
    if hasTomTom then
        TomTom:AddWaypoint(
            vendor.mapID,
            vendor.x / 100,
            vendor.y / 100,
            {
                title = vendor.title .. " - " .. (vendor.zone or ""),
                persistent = false,
                minimap = true,
                world = true,			
            }
        )
    end
	

    ---------------------------
    -- 2. Blizzard Super-Tracked Waypoint
    ---------------------------
    -- Convert to normalized coordinates (this is what was missing)
    local vec = CreateVector2D(vendor.x / 100, vendor.y / 100)

    local mapPoint = UiMapPoint.CreateFromVector2D(
        vendor.mapID,
        vec
    )

    C_Map.SetUserWaypoint(mapPoint)
    C_SuperTrack.SetSuperTrackedUserWaypoint(true)

        ---------------------------
        -- OPTIONAL: Open map on click
        ---------------------------
        -- C_Map.OpenWorldMap(vendor.mapID)
    end)
end

--[[
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
        GameTooltip:AddLine(vendor.title, 1, 1, 0)
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
            title = vendor.title .. " - " .. (vendor.zone or ""),
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
end)]]


line:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(vendor.title, 1, 1, 1)
        if vendor.mapID then 
            GameTooltip:AddLine(mapName, 1, 0.82, 0) 
        end
        GameTooltip:AddLine("\n|cff00ff00<Left Click>|r to open Vendor Items", 1, 1, 1)
        GameTooltip:Show()
    end)

line:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then 
	ShowVendorPopup(vendor.id, vendor.title) end
end)

    line:SetScript("OnEnter", function()
        text:SetTextColor(1, 0.82, 0, 1)
        GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
        GameTooltip:SetText(vendor.title, 1, 1, 1)
        if vendor.zone then
            GameTooltip:AddLine("Zone: " .. vendor.zone, 0.8, 0.8, 0.8)
        end
        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function()
       if vendor.faction == "alliance" then
        text:SetTextColor(0.3, 0.6, 1)      -- blue
    elseif vendor.faction == "horde" then
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
function BuildUI()
    ClearWidgets()

    local y = 0
    local hasContent = false

    -- 1️⃣ Sync saved completed flags with VendorData
    for _, group in ipairs(VendorData) do
        for _, vendor in ipairs(group.vendors or {}) do
            vendor.completed = vendorSettings.completedVendors[vendor.title or vendor.name] or false
        end
    end

    -- Define expansions to show (apply expansion & profession filters)
    local expansionsToShow = {}
    for _, exp in ipairs(VendorData) do
        if exp.name == "Professions" then
            if selectedProfessions and not selectedProfessions.All then
                table.insert(expansionsToShow, exp)
            end
        else
            if not selectedExpansions or selectedExpansions.All or selectedExpansions[exp.name] then
                table.insert(expansionsToShow, exp)
            end
        end
    end

    -- Loop through each expansion (already filtered)
    for _, expansion in ipairs(expansionsToShow) do
        local subGroups = expansion.continents
        if not subGroups or #subGroups == 0 then
            subGroups = { expansion } -- fallback if no continents
        end

        -- Loop through each continent/group (do NOT sort here!)
        for _, subGroup in ipairs(subGroups) do
            local totalVendors = subGroup.vendors and #subGroup.vendors or 0
            local visibleVendors = {}

            -- Filter vendors
            for _, vendor in ipairs(subGroup.vendors or {}) do
                -- Attach reference data for filtering
                vendor.expansion = expansion.name
                vendor.continent = subGroup.name or expansion.name

                local passesFaction = selectedFactions.All or selectedFactions[vendor.faction]
                local passesExpansion = selectedExpansions.All or selectedExpansions[vendor.expansion]
                local passesContinent = continentFilter == "All" or vendor.continent == continentFilter
                local passesZone = zoneFilter == "All" or vendor.zone == zoneFilter
                -- local passesProfession = selectedProfessions.All or selectedProfessions[vendor.profession]

                if passesFaction and passesExpansion and passesContinent and passesZone then
                    table.insert(visibleVendors, vendor)
                end
            end

            -- Only create headers if there are visible vendors
            if #visibleVendors > 0 then
                hasContent = true

                -- Create header
                local header, collapsed, newY = CreateVendorHeader(scrollChild, subGroup, y, #visibleVendors, totalVendors)
                y = newY

                -- Create vendor lines if not collapsed
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
BuildUI()

-- Event handler to mark visited vendors
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")
eventFrame:SetScript("OnEvent", function()
    local name = UnitName("target")
    if not name then return end
    for _, group in ipairs(VendorData) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.title == name then
                vendor.completed = true
                vendorSettings.completedVendors[name] = true
                if vendorSettings.hideFound then
                    BuildUI()
                end
                return
            end
        end
    end
end)

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



--Options panel
local function CreateOptionsPanel()
    local configFrame = CreateFrame("Frame", "DV_ConfigFrame", UIParent)
    configFrame.name = "Decor Vendor"
    
    local configTitle = configFrame:CreateFontString(nil, "ARTWORK")
    configTitle:SetFont(STANDARD_TEXT_FONT, 16);
    configTitle:SetPoint("TOPLEFT", 16, -16)
    configTitle:SetText("Decor Vendor Settings")
    
    local escCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    escCheck:SetPoint("TOPLEFT", configTitle, "BOTTOMLEFT", 0, -20)
    escCheck.Text:SetFont(STANDARD_TEXT_FONT, 14); escCheck.Text:SetTextColor(1, 0.82, 0)
    escCheck.Text:SetText(" Esc to Close Decor Vendor")
    escCheck:SetChecked(vendorSettings.closeOnEsc)
    escCheck:SetScript("OnClick", function(self)
        vendorSettings.closeOnEsc = self:GetChecked()
        UpdateEscBehavior()
    end)

    if Settings and Settings.RegisterCanvasLayoutCategory then
         local category, layout = Settings.RegisterCanvasLayoutCategory(configFrame, "Decor Vendor")
         Settings.RegisterAddOnCategory(category)
    else
         InterfaceOptions_AddCategory(configFrame)
    end
end

--Initialize
local init = CreateFrame("Frame")
init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_ENTERING_WORLD")
init:RegisterEvent("ACHIEVEMENT_EARNED")
init:RegisterEvent("QUEST_TURNED_IN")
init:RegisterEvent("MERCHANT_SHOW")

init:SetScript("OnEvent", function(self, event, addon)
  if event == "ADDON_LOADED" and addon == "DecorVendor" then
    vendorSettings.completedVendors = vendorSettings.completedVendors or {}
    vendorSettings.completedDrops = vendorSettings.completedDrops or {}
    
    vendorSettings.showMinimapButton = vendorSettings.showMinimapButton == nil and true or vendorSettings.showMinimapButton
    if vendorSettings.useTomTom == nil then vendorSettings.useTomTom = true end
	if vendorSettings.closeOnEsc == nil then vendorSettings.closeOnEsc = true end

    vendorSettings.filters = vendorSettings.filters or {  neutral = true, alliance = true, horde = true}

    if vendorSettings.filters.neutral == nil then vendorSettings.filters.neutral = true end
    if vendorSettings.filters.alliance == nil then vendorSettings.filters.alliance = true end
    if vendorSettings.filters.horde == nil then vendorSettings.filters.horde = true end	
  
    minimapCheckbox:SetChecked(vendorSettings.showMinimapButton)
    
    local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
    if ldb then
      local dataobj = ldb:NewDataObject("DecorVendor", { type = "launcher", icon = 1530229, label = "DecorVendor", text = "DecorVendor", name = "DecorVendor",
        OnClick = function(_, button)
          if button == "LeftButton" then
            if not frame:IsShown() then BuildUI() end
            frame:SetShown(not frame:IsShown())
          end
        end
      })
      function dataobj:OnTooltipShow() self:AddLine("|cffffffffDecor Vendor|r"); self:AddLine("|cff00ff00<Left Click to toggle>"); self:SetScale(GameTooltip:GetScale()) end
      LibDBIcon:Register("DecorVendor", dataobj, DVDB.minimap)
    end
  elseif event == "PLAYER_ENTERING_WORLD" then
    if UnitFactionGroup("player") == "horde" then currentFaction = 2 end

    local scale = vendorSettings.scale or 1.0
    frame:SetScale(scale); supportFrame:SetScale(scale); scaleSlider:SetValue(scale)
    scaleValueText:SetText(string.format("UI Scale: %.2f", scale))
     vendorPopup:SetScale(scale)
    BuildUI()
    CreateOptionsPanel()
    UpdateEscBehavior()
	
    if not vendorSettings.showMinimapButton then LibDBIcon:Hide("DecorVendor") end

    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
  elseif event == "MERCHANT_SHOW" then
    local guid = UnitGUID("npc")
    if guid then
        local npcID = select(6, strsplit("-", guid))
        npcID = tonumber(npcID)
        if npcID and dv.vendorItems[npcID] and not vendorSettings.completedVendors[npcID] then
          vendorSettings.completedVendors[npcID] = true
          print("|cffffd700Decor Vendor:|r New vendor collected!")
          BuildUI()
        end
    end
  end
end) 



SLASH_DECORVENDOR1 = "/decor"
SLASH_DECORVENDOR2 = "/dv"
SLASH_DECORVENDOR3 = "/decorvendor"
SlashCmdList["DECORVENDOR"] = function()
        BuildUI()
    frame:Show()
end


