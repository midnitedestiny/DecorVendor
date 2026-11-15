-- ============================================================
-- Decor Vendor: Rows.lua
-- Consolidated file. Each section below is one original file,
-- preserved verbatim and wrapped in its own function scope:
-- (function(...) ... end)(...). That gives the section exactly
-- the behavior it had as a separate file - its local variables
-- stay private, and a top-level return or guard clause exits
-- only that section. Sections run in the original .toc order.
-- ============================================================

-- ------------------------------------------------------------
-- SECTION: Rows/RowWidgets.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon — Shared Row Headers
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]
local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor RowWidgets:|r constants are missing.")
    return
end

local Sizing = C.RowWidgetSizing

if not Sizing then
    print("|cffff4040DecorVendor RowWidgets:|r RowWidgetSizing is missing.")
    return
end

local HeaderSizing = Sizing.Header
local CardSizing = Sizing.Card

if not HeaderSizing or not CardSizing then
    print("|cffff4040DecorVendor RowWidgets:|r RowWidgetSizing.Header or RowWidgetSizing.Card is missing.")
    return
end

DVD.collapsedHeaders = DVD.collapsedHeaders or {}
DVD.activeWidgets = DVD.activeWidgets or {}

-------------------------------------------------
-- Shared header refresh
-------------------------------------------------
local function RefreshCurrentList()
    if DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    elseif BuildVendorUI then
        BuildVendorUI()
    end
end

-------------------------------------------------
-- Universal accordion header
-------------------------------------------------
function DVD.CreateUniversalHeader(parent, y, options)
    options = options or {}

    local title = tostring(options.title or "Unknown Category")
    local key = tostring(options.key or title)
    local section = options.section

    local completed = tonumber(options.completed) or 0
    local total = tonumber(options.total) or 0

    local height = tonumber(options.height) or HeaderSizing.Height

    local spacing = tonumber(options.spacing)

    if spacing == nil then
        spacing = HeaderSizing.Spacing
    end

    if DVD.collapsedHeaders[key] == nil then
        DVD.collapsedHeaders[key] = options.defaultCollapsed and true or false
    end

    if options.forceCollapsed ~= nil then
        DVD.collapsedHeaders[key] = options.forceCollapsed and true or false
    end

    local collapsed = DVD.collapsedHeaders[key]

    local header = CreateFrame("Button", nil, parent)
    local leftInset = tonumber(options.leftInset) or HeaderSizing.LeftInset

    local rightInset = tonumber(options.rightInset) or HeaderSizing.RightInset

    header:SetPoint("TOPLEFT", parent, "TOPLEFT", leftInset, y)

    header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -rightInset, y)
    header:SetHeight(height)
    header:RegisterForClicks("LeftButtonUp")

    -------------------------------------------------
    -- Background
    -------------------------------------------------
    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetColorTexture(0.05, 0.07, 0.14, 0.82)
    header.bg = bg

    -------------------------------------------------
    -- Purple accent strip
    -------------------------------------------------
    local accent = header:CreateTexture(nil, "ARTWORK")
    accent:SetPoint("LEFT", header, "LEFT", HeaderSizing.AccentLeftInset, 0)

    accent:SetSize(
        HeaderSizing.AccentWidth,
        math.max(HeaderSizing.AccentMinimumHeight, height - HeaderSizing.AccentVerticalPadding)
    )
    accent:SetColorTexture(0.25, 0.52, 0.88, 0.45)
    header.accent = accent

    -------------------------------------------------
    -- Collapse icon
    -------------------------------------------------
    local icon = header:CreateFontString(nil, "OVERLAY")
    icon:SetFont(STANDARD_TEXT_FONT, HeaderSizing.CollapseIconFontSize, "OUTLINE")

    icon:SetPoint("LEFT", header, "LEFT", HeaderSizing.CollapseIconLeftInset, 0)
    icon:SetText(collapsed and "+" or "-")
    icon:SetTextColor(1, 1, 1)
    header.icon = icon

    -------------------------------------------------
    -- Progress
    -------------------------------------------------
    local progress = header:CreateFontString(nil, "OVERLAY")
    progress:SetFont(STANDARD_TEXT_FONT, HeaderSizing.ProgressFontSize, "OUTLINE")

    progress:SetPoint("RIGHT", header, "RIGHT", -HeaderSizing.ProgressRightInset, 0)
    progress:SetJustifyH("RIGHT")

    local progressLabel = tostring(options.progressLabel or "completed")
    local PROGRESS_L = { found = "PROGRESS_FOUND", learned = "PROGRESS_LEARNED", completed = "PROGRESS_COMPLETED", collected = "PROGRESS_COLLECTED" }
    progressLabel = (PROGRESS_L[progressLabel] and DVD.L[PROGRESS_L[progressLabel]]) or progressLabel
    progress:SetText(options.progressText or string.format("%d/%d %s", completed, total, progressLabel))

    if total > 0 and completed >= total then
        progress:SetTextColor(0.40, 1.00, 0.40)
    elseif total > 0 and completed >= total / 2 then
        progress:SetTextColor(1.00, 0.85, 0.30)
    else
        progress:SetTextColor(0.75, 0.75, 0.75)
    end

    header.progress = progress

    -------------------------------------------------
    -- Header title
    -------------------------------------------------
    local text = header:CreateFontString(nil, "OVERLAY")
    text:SetFont(STANDARD_TEXT_FONT, HeaderSizing.TitleFontSize, "OUTLINE")

    text:SetPoint("LEFT", icon, "RIGHT", HeaderSizing.TitleIconGap, 0)

    text:SetPoint("RIGHT", progress, "LEFT", -HeaderSizing.TitleProgressGap, 0)
    text:SetJustifyH("LEFT")
    text:SetText(title)
    text:SetTextColor(1, 1, 1)
    text:SetNonSpaceWrap(false)
    text:SetWordWrap(false)
    header.text = text

    -------------------------------------------------
    -- Hover
    -------------------------------------------------
    header:SetScript(
        "OnEnter",
        function(self)
            self.bg:SetColorTexture(0.08, 0.11, 0.22, 0.95)
            self.accent:SetColorTexture(1.00, 0.78, 0.28, 0.80)
        end
    )

    header:SetScript(
        "OnLeave",
        function(self)
            self.bg:SetColorTexture(0.05, 0.07, 0.14, 0.82)
            self.accent:SetColorTexture(0.25, 0.52, 0.88, 0.45)
        end
    )

    -------------------------------------------------
    -- Collapse behavior
    -------------------------------------------------
    header:SetScript(
        "OnClick",
        function()
            if options.useLegacyToggle and DVD.ToggleAccordionHeader then
                DVD.ToggleAccordionHeader(section, key)
                return
            end

            DVD.collapsedHeaders[key] = not DVD.collapsedHeaders[key]
            RefreshCurrentList()
        end
    )

    header.section = section
    header.collapseKey = key
    header.isUniversalHeader = true

    table.insert(DVD.activeWidgets, header)

    return header, collapsed, y - height - spacing
end

-------------------------------------------------
-- Universal 44px row card foundation
-------------------------------------------------
local function CreateSharedFontString(owner, layer, template)
    if template then
        return owner:CreateFontString(nil, layer, template)
    end

    return owner:CreateFontString(nil, layer)
end

function DVD.CreateUniversalCard(parent, y, options)
    options = options or {}

    local rowHeight = tonumber(options.rowHeight) or CardSizing.Height

    local leftInset = tonumber(options.leftInset) or CardSizing.LeftInset

    local rightInset = tonumber(options.rightInset) or CardSizing.RightInset

    local nameWidth = tonumber(options.nameWidth) or CardSizing.NameWidth

    local nameFontSize = tonumber(options.nameFontSize) or CardSizing.NameFontSize

    local subFontSize = tonumber(options.subFontSize) or CardSizing.SubFontSize

    local rightTopFontSize = tonumber(options.rightTopFontSize) or CardSizing.RightTopFontSize

    local rightBottomFontSize = tonumber(options.rightBottomFontSize) or CardSizing.RightBottomFontSize

    local line = CreateFrame("Button", nil, parent, "BackdropTemplate")
    line:SetPoint("TOPLEFT", parent, "TOPLEFT", leftInset, y)
    line:SetPoint("RIGHT", parent, "RIGHT", -rightInset, 0)
    line:SetHeight(rowHeight)

    local clicks = options.clicks or {"AnyUp"}

    if type(clicks) == "table" then
        line:RegisterForClicks(unpack(clicks))
    else
        line:RegisterForClicks(clicks)
    end

    line:SetBackdrop(
        {
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            tile = false,
            tileSize = 0,
            edgeSize = CardSizing.BackdropEdgeSize,
            insets = {left = 0, right = 0, top = 0, bottom = 0}
        }
    )

    local backgroundColor = options.backgroundColor or {0.08, 0.08, 0.10, 0.85}
    local borderColor = options.borderColor or {0.30, 0.30, 0.30, 0.60}

    line:SetBackdropColor(unpack(backgroundColor))
    line:SetBackdropBorderColor(unpack(borderColor))

    -------------------------------------------------
    -- Split status strip
    -------------------------------------------------
    local topIndicator = line:CreateTexture(nil, "OVERLAY")
    topIndicator:SetWidth(CardSizing.IndicatorWidth)
    topIndicator:SetPoint("TOPLEFT", line, "TOPLEFT", 0, 0)
    topIndicator:SetPoint("BOTTOMLEFT", line, "LEFT", 0, 0)
    topIndicator:SetTexture("Interface\\Buttons\\WHITE8x8")

    local bottomIndicator = line:CreateTexture(nil, "OVERLAY")
    bottomIndicator:SetWidth(CardSizing.IndicatorWidth)
    bottomIndicator:SetPoint("TOPLEFT", line, "LEFT", 0, 0)
    bottomIndicator:SetPoint("BOTTOMLEFT", line, "BOTTOMLEFT", 0, 0)
    bottomIndicator:SetTexture("Interface\\Buttons\\WHITE8x8")

    -------------------------------------------------
    -- Icon and border
    -------------------------------------------------
    local icon = line:CreateTexture(nil, "ARTWORK")
    local iconSize = tonumber(options.iconSize) or CardSizing.IconSize

    local iconLeftInset = tonumber(options.iconLeftInset) or CardSizing.IconLeftInset

    icon:SetSize(iconSize, iconSize)

    icon:SetPoint("LEFT", line, "LEFT", iconLeftInset, 0)

    if options.cropIcon ~= false then
        icon:SetTexCoord(
            CardSizing.IconCropMinimum,
            CardSizing.IconCropMaximum,
            CardSizing.IconCropMinimum,
            CardSizing.IconCropMaximum
        )
    end

    local iconBorder = CreateFrame("Frame", nil, line, "BackdropTemplate")
    local iconBorderSize = tonumber(options.iconBorderSize) or CardSizing.IconBorderSize

    iconBorder:SetSize(iconBorderSize, iconBorderSize)
    iconBorder:SetPoint("CENTER", icon, "CENTER", 0, 0)

    local lineLevel = line:GetFrameLevel() or 1
    iconBorder:SetFrameLevel(math.max(0, lineLevel - CardSizing.IconBorderFrameLevelOffset))
    iconBorder:SetBackdrop(
        {
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            tile = false,
            edgeSize = CardSizing.IconBorderEdgeSize,
            insets = {
                left = CardSizing.IconBorderInset,
                right = CardSizing.IconBorderInset,
                top = CardSizing.IconBorderInset,
                bottom = CardSizing.IconBorderInset
            }
        }
    )
    iconBorder:SetBackdropColor(0.05, 0.05, 0.05, 0.80)
    iconBorder:SetBackdropBorderColor(0.35, 0.35, 0.35, 0.60)

    -------------------------------------------------
    -- Left-side text
    -------------------------------------------------
    local nameText = CreateSharedFontString(line, "OVERLAY", options.nameTemplate)
    nameText:SetFont(STANDARD_TEXT_FONT, nameFontSize, "")
    nameText:SetPoint("LEFT", icon, "RIGHT", CardSizing.NameIconGap, CardSizing.NameOffsetY)
    nameText:SetWidth(nameWidth)
    nameText:SetJustifyH("LEFT")

    local subText = CreateSharedFontString(line, "OVERLAY", options.subTemplate or "GameFontNormalSmall")
    subText:SetFont(STANDARD_TEXT_FONT, subFontSize, "")
    subText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -CardSizing.SubTextGap)
    subText:SetWidth(nameWidth)
    subText:SetJustifyH("LEFT")
    subText:SetTextColor(0.70, 0.68, 0.78)

    -------------------------------------------------
    -- Right-side text
    -------------------------------------------------
    local rightTopText = CreateSharedFontString(line, "OVERLAY", options.rightTopTemplate or "GameFontNormalSmall")
    rightTopText:SetFont(STANDARD_TEXT_FONT, rightTopFontSize, "")
    rightTopText:SetPoint("TOPRIGHT", line, "TOPRIGHT", -CardSizing.RightTextRightInset, -CardSizing.RightTextTopInset)
    rightTopText:SetJustifyH("RIGHT")
    rightTopText:SetTextColor(0.85, 0.75, 0.45)

    local rightBottomText =
        CreateSharedFontString(line, "OVERLAY", options.rightBottomTemplate or "GameFontNormalSmall")
    rightBottomText:SetFont(STANDARD_TEXT_FONT, rightBottomFontSize, "")
    rightBottomText:SetPoint("TOPRIGHT", rightTopText, "BOTTOMRIGHT", 0, -CardSizing.RightBottomGap)
    rightBottomText:SetJustifyH("RIGHT")
    rightBottomText:SetTextColor(0.50, 0.48, 0.58)

    line.topIndicator = topIndicator
    line.bottomIndicator = bottomIndicator
    line.icon = icon
    line.iconBorder = iconBorder
    line.nameText = nameText
    line.subText = subText
    line.rightTopText = rightTopText
    line.rightBottomText = rightBottomText
    line.rowHeight = rowHeight
    line.isUniversalCard = true

    return {
        line = line,
        rowHeight = rowHeight,
        topIndicator = topIndicator,
        bottomIndicator = bottomIndicator,
        icon = icon,
        iconBorder = iconBorder,
        nameText = nameText,
        subText = subText,
        rightTopText = rightTopText,
        rightBottomText = rightBottomText
    }
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Rows/VendorRows.lua
-- ------------------------------------------------------------
(function(...)
-- [[
-- ============================================================
-- Decor Vendor Addon - Main Frame
-- © 2026 MidniteDestiny. All Rights Reserved.
-- ============================================================
-- ]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor VendorRows:|r constants are missing.")
    return
end

local Sizing = C.VendorRowsSizing
local NotesSizing = C.NotesPanelSizing

if not Sizing then
    print("|cffff4040DecorVendor VendorRows:|r VendorRowsSizing is missing.")
    return
end

if not NotesSizing then
    print("|cffff4040DecorVendor VendorRows:|r NotesPanelSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader or not DVD.CreateUniversalCard then
    print(
        "|cffff4040DecorVendor VendorRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first."
    )
    return
end

local COLORS = C.COLORS or {}
local GOLD = COLORS.GOLD or {1, 0.82, 0, 1}

local function IsLoaded(addon)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addon)
    end
    if IsAddOnLoaded then
        return IsAddOnLoaded(addon)
    end
    return false
end

-- Prefixed with 'local' to protect global namespace safety
local hasTomTom = IsLoaded("TomTom")
local hasWaypointUI = IsLoaded("WaypointUI")

-- Expose to our unified addon scope so other files can check them natively
DVD.hasTomTom = hasTomTom
DVD.hasWaypointUI = hasWaypointUI

-- ============================================================
-- 🛡️ SHARED VENDOR ACCORDION HEADER
-- ============================================================
function DVD.CreateVendorHeader(parent, group, y, completed, total)
    local groupName = type(group) == "table" and group.zoneGroup or type(group) == "string" and group or "Unknown Hub"

    return DVD.CreateUniversalHeader(
        parent,
        y,
        {
            section = "vendors",
            key = groupName,
            title = groupName,
            completed = completed,
            total = total,
            progressLabel = "found",
            defaultCollapsed = true,
            spacing = Sizing.HeaderSpacing,
            useLegacyToggle = true
        }
    )
end

-------------------------------------------------
-- Vendor Grid — own sizing, own pool
-------------------------------------------------

local VEND_CARD_SIZE            = 120
local VEND_CARD_WIDTH           = 120
local VEND_CARD_HEIGHT          = 168
local VEND_HEADER_HEIGHT        = 20
local VEND_FOOTER_HEIGHT        = 38
local VEND_CARD_FRAME_LEVEL_OFF = 2
local VEND_ICON_INSET           = 10
local VEND_BADGE_SIZE           = 22
local VEND_BADGE_INSET          = 6

local VEND_GRID_PADDING         = 18
local VEND_CARD_GAP_X           = 12
local VEND_CARD_GAP_Y           = 12
local VEND_PREFERRED_COLS       = 5
local VEND_NARROW_COLS          = 4
local VEND_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local FACTION_ALLIANCE = { 0.00, 0.60, 1.00 }
local FACTION_HORDE    = { 1.00, 0.20, 0.20 }
local FACTION_NEUTRAL  = { 0.40, 0.90, 0.40 }

local vendorCardPool = {}
local vendorCardCounter = 0

-------------------------------------------------
-- Vendor card (mirrors CreateProfessionCard)
-------------------------------------------------
local function CreateVendorCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(VEND_CARD_WIDTH, VEND_CARD_HEIGHT)
    card:SetFrameLevel(parent:GetFrameLevel() + VEND_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Trading-card header: name strip
    -------------------------------------------------
    local headerBar = card:CreateTexture(nil, "ARTWORK")
    headerBar:SetPoint("TOPLEFT", card, "TOPLEFT", 0, 0)
    headerBar:SetPoint("TOPRIGHT", card, "TOPRIGHT", 0, 0)
    headerBar:SetHeight(VEND_HEADER_HEIGHT)
    headerBar:SetColorTexture(0.05, 0.04, 0.10, 0.90)
    card.headerBar = headerBar

    local nameText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("TOPLEFT", headerBar, "TOPLEFT", 26, -3)
    nameText:SetPoint("TOPRIGHT", headerBar, "TOPRIGHT", -6, -3)
    nameText:SetJustifyH("CENTER")
    nameText:SetFont("Fonts\\ARIALN.TTF", 12, "OUTLINE")
    nameText:SetWordWrap(false)
    nameText:SetTextColor(1, 1, 1)
    card.nameText = nameText

    -------------------------------------------------
    -- Trading-card footer: zone + items / status
    -------------------------------------------------
    local footerBar = card:CreateTexture(nil, "ARTWORK")
    footerBar:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 0, 0)
    footerBar:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", 0, 0)
    footerBar:SetHeight(VEND_FOOTER_HEIGHT)
    footerBar:SetColorTexture(0.05, 0.04, 0.10, 0.90)
    card.footerBar = footerBar

    local zoneText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    zoneText:SetPoint("TOPLEFT", footerBar, "TOPLEFT", 6, -5)
    zoneText:SetPoint("TOPRIGHT", footerBar, "TOPRIGHT", -6, -5)
    zoneText:SetJustifyH("CENTER")
    zoneText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
    zoneText:SetWordWrap(false)
    zoneText:SetTextColor(0.75, 0.73, 0.82)
    card.zoneText = zoneText

    local infoText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    infoText:SetPoint("BOTTOM", card, "BOTTOM", 0, 6)
    infoText:SetJustifyH("CENTER")
    infoText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
    infoText:SetTextColor(0.85, 0.75, 0.45)
    card.infoText = infoText

    -------------------------------------------------
    -- Portrait / icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", VEND_ICON_INSET, -(VEND_HEADER_HEIGHT + 4))
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -VEND_ICON_INSET, VEND_FOOTER_HEIGHT + 4)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10")
    card.icon = icon

    -------------------------------------------------
    -- Visited badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(VEND_BADGE_SIZE, VEND_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -VEND_BADGE_INSET, -(VEND_HEADER_HEIGHT + 4))
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.visitedBadge = badge
	
	-------------------------------------------------
	-- Endeavor status label (bottom-right corner)
	-------------------------------------------------
	local statusText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	statusText:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -6, 6)
	statusText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
	statusText:Hide()
	card.statusText = statusText

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    --dot:SetSize(10, 10)
	dot:SetSize(18, 18)
    dot:SetPoint("LEFT", headerBar, "LEFT", 4, 0)
    dot:SetColorTexture(1, 1, 1)
    card.factionDot = dot

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local vendor = self.vendor
        if not vendor then return end

        self.slotBg:SetVertexColor(1, 1, 1) -- no backdrop color swap needed, atlas stays put

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(vendor.title, 1, 1, 1)

        if vendor.zone then
            GameTooltip:AddLine(DVD.L["ZONE_LABEL"] .. vendor.zone, 0.8, 0.8, 0.8)
        end

        if vendor.mapID then
            local mapInfo = C_Map.GetMapInfo(vendor.mapID)
            if mapInfo then
                GameTooltip:AddLine(mapInfo.name, GOLD[1], GOLD[2], GOLD[3])
            end
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00" .. DVD.L["LEFT_CLICK"] .. "|r " .. DVD.L["LEFT_CLICK_OPEN_VENDOR"], 1, 1, 1)
        GameTooltip:AddLine("|cff00ff00" .. DVD.L["RIGHT_CLICK"] .. "|r " .. DVD.L["RIGHT_CLICK_WAYPOINT"], 1, 1, 1)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    vendorCardPool[idx] = card
    return card
end

local function GetOrCreateVendorCard(parent, idx)
    return vendorCardPool[idx] or CreateVendorCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with vendor data
-------------------------------------------------
local function PopulateVendorCard(card, vendor, vendorSettings)
    card.vendor = vendor

    if card.nameText then
        card.nameText:SetText(vendor.title or vendor.name or "")
        -- White, not gold and not faction colour:
        -- highest contrast on the dark header.
        -- Faction is shown by the icon.
        card.nameText:SetTextColor(1, 1, 1)
        -- Shrink long names to fit instead of cutting them:
        -- 12pt Arial Narrow normally, down to 10pt.
        -- Arial Narrow is condensed, so Holly fits
        -- at 11-12pt instead of shrinking to 8-9pt.
        local nameFontSize = 12
        card.nameText:SetFont("Fonts\\ARIALN.TTF", nameFontSize, "OUTLINE")
        while nameFontSize > 10 do
            local w = card.nameText:GetStringWidth()
            if not w or w <= VEND_CARD_WIDTH - 32 then break end
            nameFontSize = nameFontSize - 1
            card.nameText:SetFont("Fonts\\ARIALN.TTF", nameFontSize, "OUTLINE")
        end
    end
    if card.zoneText then
        card.zoneText:SetText(vendor.zone or vendor.zoneGroup or "")
    end

    local isFound =
        vendorSettings
        and vendorSettings.visited
        and vendorSettings.visited[vendor.id]

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
   --[[ local f = vendor.faction and string.lower(vendor.faction) or "neutral"
    local tint = FACTION_NEUTRAL
    if f == "alliance" then
        tint = FACTION_ALLIANCE
    elseif f == "horde" then
        tint = FACTION_HORDE
    end
    card.factionDot:SetColorTexture(tint[1], tint[2], tint[3])]]
	
local f = vendor.faction and string.lower(vendor.faction) or "neutral"

if card.factionDot then
    if f == "alliance" then
        card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\blue.tga")
        card.factionDot:Show()
    elseif f == "horde" then
        card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\red.tga")
        card.factionDot:Show()
    else
    card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\neutral.tga") -- Replace with your actual filename
    card.factionDot:Show()
    end
end
	-------------------------------------------------
	-- Endeavor status (only shown for Endeavor-tracked vendors)
	-------------------------------------------------
	local resolvedWaypoint, waypointState

	if DVD.ResolveVendorWaypoint then
		resolvedWaypoint, waypointState = DVD.ResolveVendorWaypoint(vendor)
	end

	-- Old bottom-right status label is now in the footer;
	-- keep it hidden so it does not double up.
	card.statusText:Hide()
	-- Localization (v4 status fix, 2026-11-11): statusLabel stays the
	-- LOGIC value ("Active"/"Inactive") for the colour checks below;
	-- statusDisplay is what the player actually sees, via DVD.L.
	-- Keys already existed in all three locale files (ACTIVE/INACTIVE/
	-- FOUND/ITEMS) — Rows just never used them until now.
	local statusLabel = ""
	local statusDisplay = ""
	if resolvedWaypoint then
		statusLabel = "Active"
		statusDisplay = DVD.L["ACTIVE"]
	elseif waypointState == "inactive" then
		statusLabel = "Inactive"
		statusDisplay = DVD.L["INACTIVE"]
	end
	if card.infoText then
		local goodies = DVD.vendorGoodies and DVD.vendorGoodies[vendor.id]
		local itemList = goodies and (goodies.items or goodies) or {}
		local itemCount = 0
		for _, _ in ipairs(itemList) do itemCount = itemCount + 1 end
		local info = tostring(itemCount) .. " " .. DVD.L["ITEMS"]
		if statusDisplay ~= "" then info = info .. "  \194\183  " .. statusDisplay end
		if isFound then info = info .. "  \194\183  " .. DVD.L["FOUND"] end
		card.infoText:SetText(info)
		if statusLabel == "Active" then
			card.infoText:SetTextColor(0.20, 1.00, 0.50)
		elseif statusLabel == "Inactive" then
			-- Warm amber (surprise pick, 2026-11-05): not red,
			-- not grey. Reads as "waiting / standby".
			card.infoText:SetTextColor(0.95, 0.70, 0.30)
		else
			card.infoText:SetTextColor(0.85, 0.75, 0.45)
		end
	end
    -------------------------------------------------
    -- Visited badge + dim if marked found
    -------------------------------------------------
    card.visitedBadge:SetShown(isFound and true or false)

    if isFound and vendorSettings and vendorSettings.markFoundVendors then
        card.icon:SetVertexColor(0.6, 0.6, 0.6)
        card.icon:SetAlpha(0.7)
    else
        card.icon:SetVertexColor(1, 1, 1)
        card.icon:SetAlpha(1)
    end

    -------------------------------------------------
    -- Portrait (creature model) with icon fallback
    -------------------------------------------------
    if vendor.model3D then
        SetPortraitTextureFromCreatureDisplayID(card.icon, vendor.model3D)
    else
        card.icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10")
        card.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    end

    -------------------------------------------------
    -- Standalone preview updater (unchanged from row logic)
    -------------------------------------------------
    local function UpdatePreview(v)
        if not v then return end
        DVD.contentArea._isVendorPreview = true

if DVD.modelTitle then
        local vendorName = v.title or "Vendor"
        local faction = v.faction or "neutral"
        DVD.modelTitle:SetText(vendorName)
        DVD.modelTitle:SetTextColor(DVD.GetFactionColor(faction))
    end
    
	
        if v.model3D then
            DVD.ShowPreviewCreature(v.model3D, v.title or "Vendor")
            local actor = DVD.previewActor
            if actor and actor.SetAnimation then actor:SetAnimation(0) end
            if actor and actor.SetFacing then actor:SetFacing(0) end

            C_Timer.After(0.05, function()
                local ms = DVD.modelScene
                local camera = ms and ms:GetActiveCamera()
                if not camera then return end

                local cam =
                    DVD.VendorCameraOverrides and DVD.VendorCameraOverrides[v.model3D]
                    or { targetZ = 0.4, pitch = 0.1, zoom = 5.5 }

                if camera.SetTarget then camera:SetTarget(0, 0, cam.targetZ or 0.4) end
                if camera.SetPitch then camera:SetPitch(cam.pitch or 0.1) end
                if camera.SetZoomDistance then camera:SetZoomDistance(cam.zoom or 5.5) end
            end)
        else
            if DVD.SetPreviewWatermarkVisible then
                DVD.SetPreviewWatermarkVisible(true)
            end
        end

        if DVD.texture then DVD.texture:Hide() end
    end

    -------------------------------------------------
    -- Click actions (unchanged logic from row, self -> card)
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            UpdatePreview(vendor)
            DVD.ShowVendorPopup(vendor.id, vendor.title)

            if DVD.vendorNotes then
                if vendor.note and vendor.note ~= "" then
                    DVD.vendorNotes.text:SetText(vendor.note)

                    local width = DVD.vendorNotes:GetWidth() or 0
                    if width > NotesSizing.VendorTextWidthPadding then
                        DVD.vendorNotes.text:SetWidth(width - NotesSizing.VendorTextWidthPadding)
                    end

                    local textHeight = DVD.vendorNotes.text:GetStringHeight() or 0
                    DVD.vendorNotes:SetHeight(
                        math.max(NotesSizing.VendorMinimumHeight, textHeight + NotesSizing.VendorHeightPadding)
                    )

                    if DVD.PositionVendorNotes then
                        DVD.PositionVendorNotes(vendor)
                    end

                    DVD.vendorNotes:Show()
                else
                    DVD.vendorNotes.text:SetText("")
                    DVD.vendorNotes:Hide()
                end
            end
        end

        if button == "RightButton" then
            if InCombatLockdown and InCombatLockdown() then return end

            local waypoint, waypointState
            if DVD.ResolveVendorWaypoint then
                waypoint, waypointState = DVD.ResolveVendorWaypoint(vendor)
            end

            if not waypoint then
                if waypointState == "inactive" then
                    print("|cffffd100Decor Vendor:|r " .. tostring(vendor.title or vendor.name or "This vendor") .. " is not active in this neighborhood.")
                elseif waypointState == "loading" then
                    print("|cffffd100Decor Vendor:|r Neighborhood Endeavor information is still loading. Try again in a moment.")
                elseif waypointState == "missingInitiative" then
                    print("|cffff4040Decor Vendor:|r This Endeavor source action is missing its initiativeID.")
                else
                    print("|cffffd100Decor Vendor:|r No waypoint location was found for " .. tostring(vendor.title or vendor.name or "this vendor") .. ".")
                end
                return
            end

            local mapID = tonumber(waypoint.mapID)
            local x = tonumber(waypoint.x)
            local y = tonumber(waypoint.y)

            if not mapID or not x or not y then
                print("|cffff4040Decor Vendor:|r Invalid waypoint data for " .. tostring(vendor.title or vendor.name or "this vendor") .. ".")
                return
            end

            local nx = x > 1 and x / 100 or x
            local ny = y > 1 and y / 100 or y

            local title = tostring(waypoint.title or vendor.title or vendor.name or "Decor Vendor")
            local zone = waypoint.zone
            if zone and zone ~= "" and zone ~= "It Depends" then
                title = title .. " - " .. tostring(zone)
            end

            if TomTom and TomTom.AddWaypoint then
                TomTom:AddWaypoint(mapID, nx, ny, {
                    title = title,
                    persistent = false,
                    minimap = true,
                    world = true
                })
                print("|cff00ccffDecor Vendor:|r TomTom waypoint added for " .. title .. ".")
                return
            end

            if C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                local mapPoint
                if UiMapPoint.CreateFromCoordinates then
                    mapPoint = UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                elseif UiMapPoint.CreateFromVector2D and CreateVector2D then
                    mapPoint = UiMapPoint.CreateFromVector2D(mapID, CreateVector2D(nx, ny))
                end

                if mapPoint then
                    C_Map.SetUserWaypoint(mapPoint)
                    if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                    end
                    print("|cff00ccffDecor Vendor:|r Map waypoint added for " .. title .. ".")
                    return
                end
            end

            print("|cffff4040Decor Vendor:|r Could not create a waypoint for " .. title .. ".")
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetVendorGridCards()
    for _, card in ipairs(vendorCardPool) do
        card:Hide()
    end
    vendorCardCounter = 0
end

-------------------------------------------------
-- Lays out vendors as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildVendorGridSection(parentContainer, vendors, startY, vendorSettings)
    vendors = vendors or {}

    local width = parentContainer:GetWidth() or 0
    local columns = VEND_PREFERRED_COLS
    local gapX = VEND_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (VEND_GRID_PADDING * 2)
        local neededWidth = (columns * VEND_CARD_WIDTH) + ((columns - 1) * VEND_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = VEND_NARROW_COLS
        end
    end

    local col, row = 0, 0
    for _, vendor in ipairs(vendors) do
        local isFound =
            vendorSettings
            and vendorSettings.visited
            and vendorSettings.visited[vendor.id]

        if not (vendorSettings and vendorSettings.hideFoundVendors and isFound) then
            vendorCardCounter = vendorCardCounter + 1
            local card = GetOrCreateVendorCard(parentContainer, vendorCardCounter)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                parentContainer,
                "TOPLEFT",
                VEND_GRID_PADDING + col * (VEND_CARD_WIDTH + gapX),
                startY - (row * (VEND_CARD_HEIGHT + VEND_CARD_GAP_Y))
            )
            card:Show()
            table.insert(DVD.activeWidgets, card)

            PopulateVendorCard(card, vendor, vendorSettings)

            col = col + 1
            if col >= columns then
                col = 0
                row = row + 1
            end
        end
    end

    local rows = math.ceil(#vendors / columns)
    local sectionHeight = rows * (VEND_CARD_HEIGHT + VEND_CARD_GAP_Y)

    return startY - sectionHeight
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Rows/ProfessionRows.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local Gallery = DVD.Gallery

if not C then
    print("|cffff4040DecorVendor ProfessionRows:|r constants are missing.")
    return
end

local Sizing = C.ProfessionRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor ProfessionRows:|r ProfessionRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor ProfessionRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end


-- ============================================================
-- 🛡️ SHARED PROFESSION ACCORDION HEADER
-- ============================================================
function DVD.CreateProfessionHeader(parent, profession, y, completed, total)
    local professionName =
        type(profession) == "table" and profession.name
        or type(profession) == "string" and profession
        or "Unknown Profession"

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "professions",
        key = "prof_" .. professionName,
        title = professionName,
        completed = completed,
        total = total,
        progressLabel = "learned",
        defaultCollapsed = true,
        spacing = Sizing.HeaderSpacing,
		useLegacyToggle = true,
    })

    return collapsed, newY
end

-- ✅ Standing standalone preview engine function
function DVD.UpdateProfessionPreview(profItem)
    if not profItem then
        return
    end

    DVD.contentArea._isVendorPreview = false

    if DVD.vendorPopup then DVD.vendorPopup:Hide() end
    if DVD.vendorNotes then DVD.vendorNotes:Hide() end
    if DVD.bossNotes then DVD.bossNotes:Hide() end
    if DVD.questNotes then DVD.questNotes:Hide() end
    if DVD.achievementPanel then DVD.achievementPanel:Hide() end
    if DVD.achievementWowheadWrapper then DVD.achievementWowheadWrapper:Hide() end
    if DVD.questWowheadWrapper then DVD.questWowheadWrapper:Hide() end

    local itemName = "Preview"

    if profItem.id then
        local item = Item:CreateFromItemID(profItem.id)

        item:ContinueOnItemLoad(function()
            itemName = item:GetItemName() or "Preview"

            if DVD.modelTitle then
                DVD.modelTitle:SetText(itemName)
                DVD.modelTitle:SetTextColor(1, 1, 1)
            end
        end)
    end

    if profItem.model3D or profItem.decorID then
        if DVD.ShowPreviewModel then
            DVD.ShowPreviewModel(profItem.model3D, itemName, profItem)
        end
    else
        if DVD.SetPreviewWatermarkVisible then
            DVD.SetPreviewWatermarkVisible(true)
        end
    end

    if not DVD.profNotes then
        DVD.profNotes = CreateFrame("Frame", nil, DVD.itemContainer)
        DVD.profNotes:SetPoint("BOTTOMLEFT", DVD.itemContainer, "BOTTOMLEFT", Sizing.NotesHorizontalInset, Sizing.NotesBottomOffset)
        DVD.profNotes:SetPoint("BOTTOMRIGHT", DVD.itemContainer, "BOTTOMRIGHT", -Sizing.NotesHorizontalInset, Sizing.NotesBottomOffset)
        DVD.profNotes:SetHeight(Sizing.NotesHeight)

        DVD.profNotes.bg = DVD.profNotes:CreateTexture(nil, "BACKGROUND")
        DVD.profNotes.bg:SetAllPoints()
        DVD.profNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

        DVD.profNotes.text = DVD.profNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.profNotes.text:SetPoint("TOPLEFT", DVD.profNotes, "TOPLEFT", Sizing.NotesTextHorizontalInset, -Sizing.NotesTextTopInset)
        DVD.profNotes.text:SetPoint("BOTTOMRIGHT", DVD.profNotes, "BOTTOMRIGHT", -Sizing.NotesTextHorizontalInset, Sizing.NotesTextBottomInset)
        DVD.profNotes.text:SetFont(STANDARD_TEXT_FONT, Sizing.NotesTextFontSize, "")
        DVD.profNotes.text:SetJustifyH("LEFT")
        DVD.profNotes.text:SetJustifyV("TOP")
    end

    local profInfo = ""

    if profItem.skill then
        profInfo = profInfo .. "|cffFFD200" .. DVD.L["PROFESSION_LABEL"] .. "|r " .. profItem.skill .. "\n"
    end

    if profItem.skillNeeded then
        profInfo = profInfo .. "|cff00fbff" .. DVD.L["SKILL_REQUIRED"] .. "|r " .. profItem.skillNeeded
    end

    if profItem.note and profItem.note ~= "" then
        profInfo = profInfo .. "\n|cff00ff00" .. DVD.L["NOTE_LABEL"] .. "|r " .. profItem.note
    end

    if profInfo ~= "" then
        DVD.profNotes.text:SetText(profInfo)
        DVD.profNotes:Show()
    else
        DVD.profNotes:Hide()
    end
end

-------------------------------------------------
-- Profession Grid — Gallery-style icon cards, own sizing
-------------------------------------------------

local CAT_CARD_SIZE            = 104
local CAT_CARD_FRAME_LEVEL_OFF = 2
local CAT_ICON_INSET           = 10
local CAT_ICON_CROP_MIN        = 0.08
local CAT_ICON_CROP_MAX        = 0.92
local CAT_BADGE_SIZE           = 22
local CAT_BADGE_INSET          = 6

local CAT_GRID_PADDING         = 18
local CAT_CARD_GAP_X           = 2   -- horizontal spacing between columns
local CAT_CARD_GAP_Y           = 12  -- vertical spacing between rows
local CAT_PREFERRED_COLS       = 6
local CAT_NARROW_COLS          = 3
local CAT_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local STATE_COLLECTED = { 0.20, 1.00, 0.50 }
local STATE_LEARNED   = { 1.00, 0.60, 0.10 }
local STATE_LOCKED    = { 1.00, 0.20, 0.20 }

local cardPool = {}

-------------------------------------------------
-- Profession card (mirrors Gallery.CreateCard)
-------------------------------------------------
local function CreateProfessionCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(CAT_CARD_SIZE, CAT_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + CAT_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", CAT_ICON_INSET, -CAT_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -CAT_ICON_INSET, CAT_ICON_INSET)
    icon:SetTexCoord(CAT_ICON_CROP_MIN, CAT_ICON_CROP_MAX, CAT_ICON_CROP_MIN, CAT_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(CAT_BADGE_SIZE, CAT_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -CAT_BADGE_INSET, -CAT_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    -------------------------------------------------
    -- State dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(10, 10)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.stateDot = dot

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()
        SetCursor("INSPECT_CURSOR")

        local profItem = self.profItem
        if not profItem then return end

        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()

        local itemName =
            (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(profItem.id))
            or GetItemInfo(profItem.id)

        GameTooltip:AddLine(itemName or (DVD.L["ITEM_ID"] .. tostring(profItem.id)), 1, 1, 1)
        GameTooltip:AddLine(" ")

        if self.state == "collected" then
            GameTooltip:AddLine("|cff00ff00" .. DVD.L["OWNED_DECOR"] .. "|r")
        elseif self.state == "learned" then
            GameTooltip:AddLine("|cffff9900" .. DVD.L["RECIPE_LEARNED"] .. "|r")
        else
            GameTooltip:AddLine("|cffaaaaaa" .. DVD.L["NOT_LEARNED"] .. "|r")
        end

        GameTooltip:AddLine("|cff00ff00" .. DVD.L["LEFT_CLICK"] .. "|r " .. DVD.L["LEFT_CLICK_VIEW_DECOR_REAGENTS"], 1, 1, 1)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        ResetCursor()
        GameTooltip:Hide()
    end)

    cardPool[idx] = card
    return card
end

local function GetOrCreateCard(parent, idx)
    return cardPool[idx] or CreateProfessionCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with a profItem's data
-------------------------------------------------
local function PopulateProfessionCard(card, profItem)
    card.profItem = profItem

    -------------------------------------------------
    -- Resolve state
    -------------------------------------------------
    local learned = profItem.__learned
    if learned == nil then
        learned = profItem.spell and (IsSpellKnown(profItem.spell) or IsPlayerSpell(profItem.spell)) or false
    end

    local collected = profItem.__collected
    if collected == nil then
        collected = (profItem.id and DVD.IsItemCollected) and DVD.IsItemCollected(profItem.id) or false
    end

    local state, tint
    if collected then
        state, tint = "collected", STATE_COLLECTED
    elseif learned then
        state, tint = "learned", STATE_LEARNED
    else
        state, tint = "locked", STATE_LOCKED
    end
    card.state = state

    card.stateDot:SetColorTexture(tint[1], tint[2], tint[3])
    card.collected:SetShown(collected)

    -------------------------------------------------
    -- Icon — Housing Catalog first, same as Gallery cards.
    -- itemData covers both shapes: profItem.data.decorID (Gallery-style
    -- nested items) or profItem.decorID directly on the entry itself.
    -------------------------------------------------
-------------------------------------------------
-- Icon via Gallery.GetItemIcon (Housing Catalog first, same as Gallery cards)
-------------------------------------------------
local activeData = DVD.ActiveItems and DVD.ActiveItems[profItem.id]

local icon =
    profItem.icon
    or (
        Gallery.GetItemIcon
        and Gallery.GetItemIcon(
            profItem.id,
            activeData
        )
    )

if profItem.iconType == "atlas"
and icon
and card.icon.SetAtlas then
    card.icon:SetAtlas(icon)
else
    card.icon:SetTexture(
        icon
        or "Interface\\Icons\\INV_Misc_QuestionMark"
    )
end

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self)
        if DVD.UpdateProfessionPreview then
            DVD.UpdateProfessionPreview(profItem)
        end
        if DVD.ShowReagentsPopup then
            DVD.ShowReagentsPopup(profItem)
        end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)
end
-------------------------------------------------
-- Refresh (Draws Profession Headers + Grids)
-------------------------------------------------
local function RefreshProfessionGrid(parentContainer, professionsList)
    professionsList = professionsList or {}

    -- Hide all existing cards in pool first
    for _, card in ipairs(cardPool) do
        card:Hide()
    end

    local width = parentContainer:GetWidth() or 0
    local columns = CAT_PREFERRED_COLS
    local gapX = CAT_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (CAT_GRID_PADDING * 2)
        local neededWidth = (columns * CAT_CARD_SIZE) + ((columns - 1) * CAT_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = CAT_NARROW_COLS
        end
    end

    local currentY = -CAT_GRID_PADDING
    local cardGlobalIndex = 1

    -- Loop through each distinct profession section
    for _, profession in ipairs(professionsList) do
        local visibleItems = profession.items or {}

        if #visibleItems > 0 then
            -- 1. Draw your Profession Header using your original header function
            if DVD.CreateProfessionHeader then
                local collapsed, newY = DVD.CreateProfessionHeader(
                    parentContainer, 
                    profession, 
                    currentY, 
                    profession.__completedCount or 0, 
                    profession.__totalCount or #visibleItems
                )
                currentY = newY

                -- If the section isn't collapsed, draw its card grid
                if not collapsed then
                    local col, row = 0, 0
                    
                    for _, profItem in ipairs(visibleItems) do
                        local card = GetOrCreateCard(parentContainer, cardGlobalIndex)

                        card:ClearAllPoints()
                        card:SetPoint(
                            "TOPLEFT",
                            parentContainer,
                            "TOPLEFT",
                            CAT_GRID_PADDING + col * (CAT_CARD_SIZE + gapX),
                            currentY - (row * (CAT_CARD_SIZE + CAT_CARD_GAP_Y))
                        )
                        card:Show()
                        table.insert(DVD.activeWidgets, card)

                        PopulateProfessionCard(card, profItem)

                        cardGlobalIndex = cardGlobalIndex + 1
                        col = col + 1
                        if col >= columns then
                            col = 0
                            row = row + 1
                        end
                    end

                    -- Advance currentY downward past this grid's total rows
                    local rows = math.ceil(#visibleItems / columns)
                    currentY = currentY - (rows * (CAT_CARD_SIZE + CAT_CARD_GAP_Y)) - CAT_GRID_PADDING
                end
            end
        end
    end

    -- Update total content height for scrolling
    local contentHeight = math.max(math.abs(currentY) + CAT_GRID_PADDING, 100)
    parentContainer:SetHeight(contentHeight)

    return contentHeight
end
-------------------------------------------------
-- Entry point kept for ListBuilders.lua compatibility
-------------------------------------------------
function DVD.BuildProfessionGridUI(parentContainer, professionEntries)
    professionEntries = professionEntries or {}
    return RefreshProfessionGrid(parentContainer, professionEntries)
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Rows/QuestRows.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local Gallery = DVD.Gallery
if not C then
    print("|cffff4040DecorVendor QuestRows:|r constants are missing.")
    return
end

local Sizing = C.QuestRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor QuestRows:|r QuestRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor QuestRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end

local COLORS = C.COLORS or {}

-- Create a session anchor string to pass down parent header category names
local currentGroupName = "World Quest"

-- ============================================================
-- 🛡️ SHARED QUEST ACCORDION HEADER
-- ============================================================
function DVD.CreateQuestHeader(parent, questGroup, y, completed, total)
    if type(questGroup) == "table" and questGroup.name then
        currentGroupName = questGroup.name
    elseif type(questGroup) == "string" then
        currentGroupName = questGroup
    else
        currentGroupName = "World Quest"
    end

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "quests",
        key = "quest_" .. currentGroupName,
        title = currentGroupName,
        completed = completed,
        total = total,
        progressLabel = "completed",
        defaultCollapsed = true,
        spacing = Sizing.HeaderSpacing,
		useLegacyToggle = true,
    })

    return collapsed, newY
end

-------------------------------------------------
-- Quest Grid — own sizing, own pool
-------------------------------------------------

local QUEST_CARD_SIZE            = 104
local QUEST_CARD_FRAME_LEVEL_OFF = 2
local QUEST_ICON_INSET           = 10
local QUEST_ICON_CROP_MIN        = 0.08
local QUEST_ICON_CROP_MAX        = 0.92
local QUEST_BADGE_SIZE           = 22
local QUEST_BADGE_INSET          = 6

local QUEST_GRID_PADDING         = 18
local QUEST_CARD_GAP_X           = 12
local QUEST_CARD_GAP_Y           = 12
local QUEST_PREFERRED_COLS       = 6
local QUEST_NARROW_COLS          = 3
local QUEST_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local FACTION_ALLIANCE = { 0.00, 0.60, 1.00 }
local FACTION_HORDE    = { 1.00, 0.20, 0.20 }
local FACTION_NEUTRAL  = { 0.40, 0.90, 0.40 }

local questCardPool = {}
local questCardCounter = 0

-------------------------------------------------
-- Quest card (mirrors CreateVendorCard / CreateProfessionCard)
-------------------------------------------------
local function CreateQuestCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(QUEST_CARD_SIZE, QUEST_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + QUEST_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Reward icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", QUEST_ICON_INSET, -QUEST_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -QUEST_ICON_INSET, QUEST_ICON_INSET)
    icon:SetTexCoord(QUEST_ICON_CROP_MIN, QUEST_ICON_CROP_MAX, QUEST_ICON_CROP_MIN, QUEST_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(QUEST_BADGE_SIZE, QUEST_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -QUEST_BADGE_INSET, -QUEST_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(20, 20)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.factionDot = dot

    card:RegisterForClicks("LeftButtonUp")

card:SetScript("OnEnter", function(self)
    self.hoverBg:Show()

    local quest = self.quest
    if not quest then return end

    local qID = type(quest.id) == "table" and quest.id[1] or quest.id

    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:ClearLines()
    GameTooltip:SetHyperlink("quest:" .. qID)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cff00ff00" .. DVD.L["LEFT_CLICK"] .. "|r " .. DVD.L["LEFT_CLICK_VIEW_REWARDS"], 1, 1, 1)
    GameTooltip:Show()
end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    questCardPool[idx] = card
    return card
end

local function GetOrCreateQuestCard(parent, idx)
    return questCardPool[idx] or CreateQuestCard(parent, idx)
end


-------------------------------------------------
-- Preview updater (unchanged from row logic)
-------------------------------------------------
local function UpdateQuestPreview(quest)
    if not quest then return end
    DVD.contentArea._isVendorPreview = false
    
    if DVD.modelTitle then
        local liveName = (DVD.questTitleCache and DVD.questTitleCache[quest.id]) or quest.questName or "Quest Reward"
        DVD.modelTitle:SetText(liveName)
        DVD.modelTitle:SetTextColor(1, 1, 1)
    end
    
	
    if not DVD.questWowheadWrapper then
        DVD.questWowheadWrapper = CreateFrame("Frame", nil, DVD.itemContainer, "BackdropTemplate")
        DVD.questWowheadWrapper:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = {left = 3, right = 3, top = 3, bottom = 3}
        })
        DVD.questWowheadWrapper:SetBackdropColor(0.08, 0.08, 0.12, 0.95)
        DVD.questWowheadWrapper:SetBackdropBorderColor(1, 0.82, 0, 1)
        DVD.questWowheadWrapper:SetHeight(Sizing.WowheadWrapperHeight)
        
        DVD.questWowheadBox = CreateFrame("EditBox", nil, DVD.questWowheadWrapper, "InputBoxTemplate")
        DVD.questWowheadBox:SetAutoFocus(false)
        DVD.questWowheadBox:SetHeight(Sizing.WowheadBoxHeight)
        DVD.questWowheadBox:SetPoint("LEFT", DVD.questWowheadWrapper, "LEFT", Sizing.WowheadBoxGap, 0)
        DVD.questWowheadBox:SetPoint("RIGHT", DVD.questWowheadWrapper, "RIGHT", -Sizing.WowheadBoxRightInset, 0)
        
        DVD.questWowheadWrapper.icon = DVD.questWowheadWrapper:CreateTexture(nil, "ARTWORK")
        DVD.questWowheadWrapper.icon:SetSize(Sizing.WowheadIconSize, Sizing.WowheadIconSize)
        DVD.questWowheadWrapper.icon:SetPoint("LEFT", DVD.questWowheadWrapper, "LEFT", Sizing.WowheadIconLeftInset, 0)
        DVD.questWowheadWrapper.icon:SetTexture("Interface\\Icons\\INV_Misc_Spyglass_03")
        DVD.questWowheadBox:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    end
    
    DVD.questWowheadWrapper:ClearAllPoints()
    DVD.questWowheadWrapper:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -Sizing.WowheadWrapperGap)
    DVD.questWowheadWrapper:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -Sizing.WowheadWrapperGap)
    local qID = type(quest.id) == "table" and quest.id[1] or quest.id
	DVD.questWowheadBox:SetText("https://www.wowhead.com/quest=" .. qID)
    
    local previewData = {
        id = quest.itemID,
        model3D = quest.model3D,
        decorID = quest.decorID,
        questID = quest.id
    }
    
    if DVD.UpdateProfessionPreview then
        DVD.UpdateProfessionPreview(previewData)
    end
    DVD.questWowheadWrapper:Show()

-------------------------------------------------
    -- Quest Name & Notes Panel (All inside one block!)
    -------------------------------------------------
    if not DVD.questNotes then
        DVD.questNotes = CreateFrame("Frame", nil, DVD.itemContainer)
        DVD.questNotes.bg = DVD.questNotes:CreateTexture(nil, "BACKGROUND")
        DVD.questNotes.bg:SetAllPoints()
        DVD.questNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)
        DVD.questNotes.text = DVD.questNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.questNotes.text:SetPoint("TOPLEFT", Sizing.NotesTextLeftInset, -Sizing.NotesTextTopInset)
        DVD.questNotes.text:SetJustifyH("LEFT")
        DVD.questNotes.text:SetWordWrap(true)
        DVD.questNotes.text:SetFont(STANDARD_TEXT_FONT, Sizing.NotesTextFontSize, "")
    end
    
    DVD.questNotes:ClearAllPoints()
    DVD.questNotes:SetPoint("TOPLEFT", DVD.questWowheadWrapper, "BOTTOMLEFT", 0, -Sizing.NotesTopGap)
    DVD.questNotes:SetPoint("TOPRIGHT", DVD.questWowheadWrapper, "BOTTOMRIGHT", 0, -Sizing.NotesTopGap)
    
    -- Grab the Quest Name exactly like we did in the Gallery Browser
    local displayQuestName = (DVD.questTitleCache and DVD.questTitleCache[quest.id]) 
        or quest.questName 
        or (C_QuestLog.GetTitleForQuestID and C_QuestLog.GetTitleForQuestID(quest.id)) 
        or DVD.L["UNKNOWN_QUEST"]

    local combinedText = "|cffffd100" .. DVD.L["QUEST_LABEL"] .. "|r |cff80ff80" .. displayQuestName .. "|r"

    -- Append the note if one exists
    if quest.note then
        combinedText = combinedText .. "\n|cffffd100" .. DVD.L["NOTE_LABEL"] .. "|r " .. quest.note
    end
    
    DVD.questNotes.text:SetText(combinedText)
    
    local availableWidth = DVD.itemContainer:GetWidth() - Sizing.NotesAvailableWidthPadding
    DVD.questNotes.text:SetWidth(availableWidth - Sizing.NotesTextWidthPadding)
    DVD.questNotes:SetHeight(DVD.questNotes.text:GetStringHeight() + Sizing.NotesHeightPadding)
    
    DVD.questNotes:Show()
end
-------------------------------------------------
-- Populate one card with quest data
-------------------------------------------------
local function PopulateQuestCard(card, quest)
    card.quest = quest

    local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

    local shouldMark =
        isCompleted
        and vendorSettings
        and vendorSettings.markCompletedThings

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local fLower = string.lower(tostring(quest.faction or "neutral"))
    if card.factionDot then
        if fLower == "alliance" then
            card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\blue.tga")
        elseif fLower == "horde" then
            card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\red.tga")
        else
            card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\neutral.tga")
        end
        card.factionDot:Show()
    end

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local collected =
        quest.itemID
        and DVD.IsItemCollected
        and DVD.IsItemCollected(quest.itemID)
        or false
    card.collected:SetShown(collected)

    -------------------------------------------------
    -- Reward icon
    -------------------------------------------------
-------------------------------------------------
-- Reward icon via Gallery.GetItemIcon (Housing Catalog first, same as professions)
-------------------------------------------------
local activeData = quest.itemID and DVD.ActiveItems and DVD.ActiveItems[quest.itemID]

local icon =
    quest.icon
    or (
        Gallery.GetItemIcon
        and quest.itemID
        and Gallery.GetItemIcon(quest.itemID, activeData)
    )

if quest.iconType == "atlas"
and icon
and card.icon.SetAtlas then
    card.icon:SetAtlas(icon)
else
    card.icon:SetTexture(
        icon
        or "Interface\\Icons\\INV_Misc_Bag_10"
    )
end

if shouldMark then
    card.icon:SetDesaturated(true)
    card.icon:SetAlpha(0.40)
else
    card.icon:SetDesaturated(false)
    card.icon:SetAlpha(1)
end

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if DVD.MarkPreviewContentShown then DVD.MarkPreviewContentShown() end
            UpdateQuestPreview(quest)
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetQuestGridCards()
    for _, card in ipairs(questCardPool) do
        card:Hide()
    end
    questCardCounter = 0
end

-------------------------------------------------
-- Lays out quests as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildQuestGridSection(parentContainer, quests, startY)
    quests = quests or {}

    local width = parentContainer:GetWidth() or 0
    local columns = QUEST_PREFERRED_COLS
    local gapX = QUEST_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (QUEST_GRID_PADDING * 2)
        local neededWidth = (columns * QUEST_CARD_SIZE) + ((columns - 1) * QUEST_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = QUEST_NARROW_COLS
        end
    end

    local col, row = 0, 0
    local shown = 0

    for _, quest in ipairs(quests) do
        local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

        local skip =
            isCompleted
            and vendorSettings
            and vendorSettings.hideCompletedThings
            and not vendorSettings.markCompletedThings

        if not skip then
            shown = shown + 1
            questCardCounter = questCardCounter + 1
            local card = GetOrCreateQuestCard(parentContainer, questCardCounter)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                parentContainer,
                "TOPLEFT",
                QUEST_GRID_PADDING + col * (QUEST_CARD_SIZE + gapX),
                startY - (row * (QUEST_CARD_SIZE + QUEST_CARD_GAP_Y))
            )
            card:Show()
            table.insert(DVD.activeWidgets, card)

            PopulateQuestCard(card, quest)

            col = col + 1
            if col >= columns then
                col = 0
                row = row + 1
            end
        end
    end

    local rows = math.ceil(shown / columns)
    local sectionHeight = rows * (QUEST_CARD_SIZE + QUEST_CARD_GAP_Y)

    return startY - sectionHeight
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Rows/AchievementRows.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...
local Gallery = DVD.Gallery

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor AchievementRows:|r constants are missing.")
    return
end

local Sizing = C.AchievementRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor AchievementRows:|r AchievementRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor AchievementRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end

local COLORS = C.COLORS or {}

-- ============================================================
-- 🛡️ SHARED ACHIEVEMENT ACCORDION HEADER
-- ============================================================
function DVD.CreateAchievementHeader(parent, achievement, y, completed, total)
    local headerName

    if type(achievement) == "string" then
        headerName = achievement
    elseif type(achievement) == "table" and achievement.name then
        headerName = achievement.name
    else
        headerName = "Unknown Category"
    end

    local collapseKey = "ach_" .. headerName
    local forceCollapsed

    if DVD.filtersJustChanged then
        local groupSel =
            DVD.filters
            and DVD.filters.achievements
            and DVD.filters.achievements.groups
            or {}

        if not groupSel[headerName] then
            forceCollapsed = true
        end
    end

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "achievements",
        key = collapseKey,
        title = headerName,
        completed = completed,
        total = total,
        progressLabel = "completed",
        defaultCollapsed = true,
        forceCollapsed = forceCollapsed,
        spacing = Sizing.HeaderSpacing,
        useLegacyToggle = true,
    })

    return collapsed, newY
end

-- ============================================================
-- 🖼️ SAFE PREVIEW INSPECTOR ENGINE
-- ============================================================
function DVD.UpdateAchievementPreview(achievement)
    if not achievement then return end
    local ms = DVD.modelScene
    local actor = DVD.previewActor
    local texture = DVD.texture
    if not ms or not actor then return end
    DVD.contentArea._isVendorPreview = false
    -- Title alignment tweaks

    if achievement.itemID then
        local item = Item:CreateFromItemID(achievement.itemID)
        item:ContinueOnItemLoad(function()
            if DVD.modelTitle then
                DVD.modelTitle:SetText(item:GetItemName() or achievement.title or DVD.L["ACHIEVEMENT_PREVIEW"])
                DVD.modelTitle:SetTextColor(1, 1, 1)
                DVD.modelTitle:Show()
            end
        end)
    end
    -- 3D Model Scenario loading
    if achievement.model3D then
        if texture then texture:Hide() end
        ms:Show()
        ms._cameraLocked = nil
        DVD.ShowModel(ms, achievement.model3D)
        if not ms._cameraLocked then
            ms._cameraLocked = true
            C_Timer.After(0.05, function()
                local camera = ms:GetActiveCamera()
                if not camera then return end
                if camera.SetTarget then camera:SetTarget(0, 0, 0) end
                if camera.SetZoomDistance then camera:SetZoomDistance(4.5) end
                if camera.SetPitch then camera:SetPitch(0.1) end
            end)
        end
    elseif achievement.texture then
        ms:Hide()
        if texture then
            texture:SetTexture(achievement.texture)
            texture:Show()
        end
    else
        ms:Hide()
        if texture then texture:Hide() end
    end
    -- Wowhead string frame initializing safely
    if not DVD.achievementWowheadWrapper then
        DVD.achievementWowheadWrapper = CreateFrame("Frame", nil, DVD.itemContainer, "BackdropTemplate")
        local wrapper = DVD.achievementWowheadWrapper
        wrapper:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 }
        })
        wrapper:SetBackdropColor(0.08, 0.08, 0.12, 0.95)
        wrapper:SetBackdropBorderColor(0.6, 0.4, 1, 1)
        wrapper:SetHeight(Sizing.WowheadWrapperHeight)
        wrapper.icon = wrapper:CreateTexture(nil, "ARTWORK")
        wrapper.icon:SetSize(Sizing.WowheadIconSize, Sizing.WowheadIconSize)
        wrapper.icon:SetPoint("LEFT", Sizing.WowheadIconLeftInset, 0)
        wrapper.icon:SetTexture("Interface\\Icons\\Achievement_Quests_Completed_08")
        DVD.achievementWowheadBox = CreateFrame("EditBox", nil, wrapper, "InputBoxTemplate")
        local box = DVD.achievementWowheadBox
        box:SetAutoFocus(false)
        box:SetHeight(Sizing.WowheadBoxHeight)
        box:SetPoint("LEFT", wrapper.icon, "RIGHT", Sizing.WowheadBoxGap, 0)
        box:SetPoint("RIGHT", wrapper, "RIGHT", -Sizing.WowheadBoxRightInset, 0)
        box:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    end
    DVD.achievementWowheadWrapper:ClearAllPoints()
    DVD.achievementWowheadWrapper:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -Sizing.WowheadWrapperGap)
    DVD.achievementWowheadWrapper:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -Sizing.WowheadWrapperGap)
    DVD.achievementWowheadBox:SetText("https://www.wowhead.com/achievement=" .. achievement.id)
    DVD.achievementWowheadWrapper:Show()

    -- Safely hide the old button if it was previously created
    if DVD.achievementOpenButton then
        DVD.achievementOpenButton:Hide()
    end
end

-------------------------------------------------
-- Achievement Grid — own sizing, own pool
-------------------------------------------------

local ACH_CARD_SIZE            = 104
local ACH_CARD_FRAME_LEVEL_OFF = 2
local ACH_ICON_INSET           = 10
local ACH_ICON_CROP_MIN        = 0.08
local ACH_ICON_CROP_MAX        = 0.92
local ACH_BADGE_SIZE           = 22
local ACH_BADGE_INSET          = 6

local ACH_GRID_PADDING         = 18
local ACH_CARD_GAP_X           = 12
local ACH_CARD_GAP_Y           = 12
local ACH_PREFERRED_COLS       = 6
local ACH_NARROW_COLS          = 3
local ACH_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local FACTION_ALLIANCE = { 0.00, 0.98, 1.00 } -- matches |cff00fbff
local FACTION_HORDE    = { 1.00, 0.25, 0.25 } -- matches |cffff4040
local FACTION_NEUTRAL  = { 0.40, 0.90, 0.40 }

local STATE_COMPLETED = { 0.20, 1.00, 0.50 }
local STATE_LOCKED    = { 1.00, 0.20, 0.20 }

local achievementCardPool = {}
local achievementCardCounter = 0

-------------------------------------------------
-- Achievement card
-------------------------------------------------
local function CreateAchievementCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(ACH_CARD_SIZE, ACH_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + ACH_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", ACH_ICON_INSET, -ACH_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -ACH_ICON_INSET, ACH_ICON_INSET)
    icon:SetTexCoord(ACH_ICON_CROP_MIN, ACH_ICON_CROP_MAX, ACH_ICON_CROP_MIN, ACH_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Gift_01")
    card.icon = icon

    -------------------------------------------------
    -- Completed badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(ACH_BADGE_SIZE, ACH_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -ACH_BADGE_INSET, -ACH_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.completedBadge = badge

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(20, 20)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.factionDot = dot

    -------------------------------------------------
    -- Points label (bottom-right corner)
    -------------------------------------------------
    local pointsText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    pointsText:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -6, 6)
    pointsText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
    pointsText:SetTextColor(1, 0.82, 0)
    card.pointsText = pointsText

    card:RegisterForClicks("LeftButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local achievement = self.achievement
        if not achievement then return end

        local id = achievement.id
        local name = self.achName or "Unknown Achievement"

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(name, 1, 1, 1)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00" .. DVD.L["LEFT_CLICK"] .. "|r " .. DVD.L["LEFT_CLICK_OPEN_ACHIEVEMENT"], 1, 1, 1)
		GameTooltip:AddLine(DVD.L["CLICK_OPTIONS_NOTE"])
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    achievementCardPool[idx] = card
    return card
end

local function GetOrCreateAchievementCard(parent, idx)
    return achievementCardPool[idx] or CreateAchievementCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with achievement data
-------------------------------------------------
local function PopulateAchievementCard(card, achievement)
    card.achievement = achievement

    local id = achievement.id
    local isCompleted = DVD.IsAchievementComplete(id)
    local name = select(2, GetAchievementInfo(id)) or "Unknown Achievement"
    card.achName = name

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local fLower = string.lower(tostring(achievement.faction or "neutral"))
    if card.factionDot then
        if fLower == "alliance" then
            card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\blue.tga")
        elseif fLower == "horde" then
            card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\red.tga")
        else
            card.factionDot:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\neutral.tga")
        end
        card.factionDot:Show()
    end

    -------------------------------------------------
    -- Completed badge
    -------------------------------------------------
    card.completedBadge:SetShown(isCompleted)

    -------------------------------------------------
    -- Icon
    -------------------------------------------------
    local rewardTexture = "Interface\\Icons\\INV_Misc_Gift_01"

    if achievement.itemID then
        local activeData = DVD.ActiveItems and DVD.ActiveItems[achievement.itemID]
        rewardTexture =
            (Gallery.GetItemIcon and Gallery.GetItemIcon(achievement.itemID, activeData))
            or (C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(achievement.itemID))
            or GetItemIcon(achievement.itemID)
            or rewardTexture
    elseif id then
        rewardTexture = select(10, GetAchievementInfo(id)) or rewardTexture
    end

    card.icon:SetTexture(rewardTexture)

    if isCompleted and vendorSettings and vendorSettings.markCompletedThings then
        card.icon:SetDesaturated(true)
        card.icon:SetAlpha(0.40)
    else
        card.icon:SetDesaturated(false)
        card.icon:SetAlpha(1)
    end

    -------------------------------------------------
    -- Points label
    -------------------------------------------------
    local points = select(3, GetAchievementInfo(id)) or 10
    card.pointsText:SetText(tostring(points))

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            DVD.UpdateAchievementPreview(achievement)

            if vendorSettings and vendorSettings.openAchievementFrame then
                if not AchievementFrame or not AchievementFrame:IsShown() then
                    AchievementFrame_LoadUI()
                    AchievementFrame_ToggleAchievementFrame()
                end
                AchievementFrame_SelectAchievement(id)
            end

            if DVD.achievementWowheadBox then
                DVD.achievementWowheadBox:HighlightText()
            end
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetAchievementGridCards()
    for _, card in ipairs(achievementCardPool) do
        card:Hide()
    end
    achievementCardCounter = 0
end

-------------------------------------------------
-- Lays out achievements as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildAchievementGridSection(parentContainer, achievements, startY)
    achievements = achievements or {}

    local width = parentContainer:GetWidth() or 0
    local columns = ACH_PREFERRED_COLS
    local gapX = ACH_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (ACH_GRID_PADDING * 2)
        local neededWidth = (columns * ACH_CARD_SIZE) + ((columns - 1) * ACH_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = ACH_NARROW_COLS
        end
    end

    local col, row = 0, 0
    local shown = 0

    for _, achievement in ipairs(achievements) do
        local isCompleted = DVD.IsAchievementComplete(achievement.id)

        local skip =
            isCompleted
            and vendorSettings
            and vendorSettings.hideCompletedThings
            and not vendorSettings.markCompletedThings

        if not skip then
            shown = shown + 1
            achievementCardCounter = achievementCardCounter + 1
            local card = GetOrCreateAchievementCard(parentContainer, achievementCardCounter)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                parentContainer,
                "TOPLEFT",
                ACH_GRID_PADDING + col * (ACH_CARD_SIZE + gapX),
                startY - (row * (ACH_CARD_SIZE + ACH_CARD_GAP_Y))
            )
            card:Show()
            table.insert(DVD.activeWidgets, card)

            PopulateAchievementCard(card, achievement)

            col = col + 1
            if col >= columns then
                col = 0
                row = row + 1
            end
        end
    end

    local rows = math.ceil(shown / columns)
    local sectionHeight = rows * (ACH_CARD_SIZE + ACH_CARD_GAP_Y)

    return startY - sectionHeight
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: Rows/BossDropRows.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local Gallery = DVD.Gallery

if not C then
    print("|cffff4040DecorVendor BossDropRows:|r constants are missing.")
    return
end

local Sizing = C.BossDropRowsSizing

if not Sizing then
    print("|cffff4040DecorVendor BossDropRows:|r BossDropRowsSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader
or not DVD.CreateUniversalCard then
    print("|cffff4040DecorVendor BossDropRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first.")
    return
end

local function IsLoaded(addon)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addon)
    end
    if IsAddOnLoaded then
        return IsAddOnLoaded(addon)
    end
    return false
end

-- Prefixed with 'local' to protect global namespace safety
local hasTomTom = IsLoaded("TomTom")
local hasWaypointUI = IsLoaded("WaypointUI")

-- Expose to our unified addon scope so other files can check them natively
DVD.hasTomTom = hasTomTom
DVD.hasWaypointUI = hasWaypointUI

local RareEvents = C.RARE_EVENTS or {}
local SourceActions = C.SOURCE_ACTIONS or {}

-- ============================================================
-- 🛡️ SHARED BOSS DROP ACCORDION HEADER
-- ============================================================
function DVD.CreateBossDropHeader(parent, group, collected, total, y)
    local groupName =
        type(group) == "table" and group.name
        or type(group) == "string" and group
        or "Unknown Drops"

    local _, collapsed, newY = DVD.CreateUniversalHeader(parent, y, {
        section = "bossdrops",
        key = "boss_" .. groupName,
        title = groupName,
        completed = collected,
        total = total,
        progressLabel = "collected",
        defaultCollapsed = true,
        spacing = Sizing.HeaderSpacing,
		--useLegacyToggle = true,
    })

    return collapsed, newY
end

-- ============================================================
-- 🖼️ SAFE PREVIEW INSPECTOR ENGINE
-- ============================================================
function DVD.UpdateBossPreview(itemData)
    if not itemData then return end

    local ms = DVD.modelScene
    local actor = DVD.previewActor
    local texture = DVD.texture

    if not ms or not actor then return end

    DVD.contentArea._isVendorPreview = false

    -- Title
    local itemObj = Item:CreateFromItemID(itemData.id)
    itemObj:ContinueOnItemLoad(function()
        if DVD.modelTitle then
            DVD.modelTitle:SetText(itemObj:GetItemName() or DVD.L["PREVIEW"])
            DVD.modelTitle:SetTextColor(1, 1, 1)
        end
    end)

    -- Model Loading
    if itemData.model3D then
        if texture then texture:Hide() end
        ms:Show()

        DVD.ShowModel(ms, itemData.model3D)

        C_Timer.After(0.01, function()
            local camera = ms:GetActiveCamera()
            if not camera then return end

            local cam = DVD.DecorCameraOverrides and DVD.DecorCameraOverrides[itemData.model3D]

            if camera.TargetActor then
                camera:TargetActor(actor, true)
            end

            if camera.SetPitch then
                camera:SetPitch(0.2)
            end

            if cam and cam.zoom and camera.SetZoomDistance then
                camera:SetZoomDistance(cam.zoom)
            end
        end)
    else
        ms:Hide()
    end

    -- Boss Drop Notes Wrapper
    if not DVD.bossNotes then
        DVD.bossNotes = CreateFrame("Frame", nil, DVD.itemContainer)
        DVD.bossNotes:SetFrameLevel((DVD.itemContainer:GetFrameLevel() or 1) + Sizing.NotesFrameLevelOffset)

        DVD.bossNotes.bg = DVD.bossNotes:CreateTexture(nil, "BACKGROUND")
        DVD.bossNotes.bg:SetAllPoints()
        DVD.bossNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

        DVD.bossNotes.text = DVD.bossNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.bossNotes.text:SetPoint("TOPLEFT", DVD.bossNotes, "TOPLEFT", Sizing.NotesTextHorizontalInset, -Sizing.NotesTextVerticalInset)
        DVD.bossNotes.text:SetPoint("BOTTOMRIGHT", DVD.bossNotes, "BOTTOMRIGHT", -Sizing.NotesTextHorizontalInset, Sizing.NotesTextVerticalInset)
        DVD.bossNotes.text:SetJustifyH("LEFT")
        DVD.bossNotes.text:SetJustifyV("TOP")
        DVD.bossNotes.text:SetWordWrap(true)
        DVD.bossNotes.text:SetNonSpaceWrap(false)
        DVD.bossNotes.text:SetFont(STANDARD_TEXT_FONT, Sizing.NotesTextFontSize, "")
    end

    local lines = {}

    if itemData.bossencounter then
        local encounterName = EJ_GetEncounterInfo(itemData.bossencounter)
        table.insert(lines, "|cffFFD200" .. DVD.L["BOSS_LABEL"] .. "|r " .. (encounterName or DVD.L["UNKNOWN_BOSS"]))
    end

    if itemData.instance or itemData.bossevent then
        local loc = itemData.instance or itemData.bossevent
        table.insert(lines, "|cff00fbff" .. DVD.L["EVENT_LABEL"] .. "|r " .. tostring(loc))
    end

    if itemData.zone then
        table.insert(lines, "|cff00fbff" .. DVD.L["LOCATION_LABEL"] .. "|r " .. tostring(itemData.zone))
    end

    if itemData.note and itemData.note ~= "" then
        table.insert(lines, "|cff00ff00" .. DVD.L["NOTE_LABEL"] .. "|r " .. tostring(itemData.note))
    end

    if #lines == 0 then
        DVD.bossNotes:Hide()
        return
    end

    local fullBossInfo = table.concat(lines, "\n")

    local plainText = fullBossInfo
        :gsub("|c%x%x%x%x%x%x%x%x", "")
        :gsub("|r", "")
        :gsub("|T.-|t", "")

    local estimatedLines = 0
    local charsPerLine = Sizing.NotesCharactersPerLine

    for line in string.gmatch(plainText .. "\n", "(.-)\n") do
        if line == "" then
            estimatedLines = estimatedLines + 1
        else
            estimatedLines = estimatedLines + math.max(1, math.ceil(string.len(line) / charsPerLine))
        end
    end

    local noteHeight = math.max(Sizing.NotesMinimumHeight, estimatedLines * Sizing.NotesEstimatedLineHeight + Sizing.NotesVerticalPadding)
    noteHeight = math.min(noteHeight, Sizing.NotesMaximumHeight)

    DVD.bossNotes:ClearAllPoints()
    DVD.bossNotes:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -Sizing.NotesTopGap)
    DVD.bossNotes:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -Sizing.NotesTopGap)
    DVD.bossNotes:SetHeight(noteHeight)

    DVD.bossNotes.text:SetText(fullBossInfo)
    DVD.bossNotes:Show()
end

-------------------------------------------------
-- Boss Drop Grid — own sizing, own pool
-------------------------------------------------

local BOSS_CARD_SIZE            = 104
local BOSS_CARD_FRAME_LEVEL_OFF = 2
local BOSS_ICON_INSET           = 10
local BOSS_ICON_CROP_MIN        = 0.08
local BOSS_ICON_CROP_MAX        = 0.92
local BOSS_BADGE_SIZE           = 22
local BOSS_BADGE_INSET          = 6

local BOSS_GRID_PADDING         = 18
local BOSS_CARD_GAP_X           = 12
local BOSS_CARD_GAP_Y           = 12
local BOSS_PREFERRED_COLS       = 6
local BOSS_NARROW_COLS          = 3
local BOSS_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local bossCardPool = {}
local bossCardCounter = 0

-------------------------------------------------
-- Boss drop card (mirrors quest/vendor/profession cards)
-------------------------------------------------
local function CreateBossDropCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(BOSS_CARD_SIZE, BOSS_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + BOSS_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Item icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", BOSS_ICON_INSET, -BOSS_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -BOSS_ICON_INSET, BOSS_ICON_INSET)
    icon:SetTexCoord(BOSS_ICON_CROP_MIN, BOSS_ICON_CROP_MAX, BOSS_ICON_CROP_MIN, BOSS_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Armband_01")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(BOSS_BADGE_SIZE, BOSS_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -BOSS_BADGE_INSET, -BOSS_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local itemData = self.itemData
        if not itemData or not itemData.id then return end

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:SetHyperlink("item:" .. itemData.id)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00" .. DVD.L["RIGHT_CLICK"] .. "|r " .. DVD.L["RIGHT_CLICK_WAYPOINT_PINS"], 1, 1, 1)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    bossCardPool[idx] = card
    return card
end

local function GetOrCreateBossDropCard(parent, idx)
    return bossCardPool[idx] or CreateBossDropCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with boss drop data
-------------------------------------------------
local function PopulateBossDropCard(card, itemData)
    card.itemData = itemData

    local id = itemData.id
    local isCollected = DVD.IsItemCollected(id)

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    card.collected:SetShown(isCollected and true or false)

    -------------------------------------------------
    -- Icon via DVD.Gallery.GetItemIcon (Housing Catalog first)
    -------------------------------------------------
    local activeData = id and DVD.ActiveItems and DVD.ActiveItems[id]

    local icon =
        itemData.icon
        or (
            DVD.Gallery
            and DVD.Gallery.GetItemIcon
            and id
            and DVD.Gallery.GetItemIcon(id, activeData)
        )

    if itemData.iconType == "atlas"
    and icon
    and card.icon.SetAtlas then
        card.icon:SetAtlas(icon)
    else
        card.icon:SetTexture(
            icon
            or "Interface\\Icons\\INV_Misc_Armband_01"
        )
    end

    -------------------------------------------------
    -- Click Actions (unchanged waypoint/preview logic, self -> card)
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            DVD.UpdateBossPreview(itemData)

        elseif button == "RightButton" then
            if InCombatLockdown and InCombatLockdown() then
                return
            end

            local actionKey =
                itemData.sourceAction
                or itemData.bossevent
                or itemData.rareEvent
                or itemData.eventName
                or itemData.dropName

            local rares =
                actionKey
                and RareEvents[actionKey]

            if rares and #rares > 0 then
                if TomTom and TomTom.AddWaypoint then
                    for _, rare in ipairs(rares) do
                        local mapID = tonumber(rare.mapID or itemData.mapID)
                        local x = tonumber(rare.x)
                        local y = tonumber(rare.y)

                        if mapID and x and y then
                            local nx = x > 1 and x / 100 or x
                            local ny = y > 1 and y / 100 or y

                            local title =
                                rare.title
                                or rare.name
                                or itemData.bossevent
                                or itemData.name
                                or "Decor Location"

                            if rare.zone then
                                title = tostring(title) .. " - " .. tostring(rare.zone)
                            end

                            TomTom:AddWaypoint(
                                mapID,
                                nx,
                                ny,
                                {
                                    title = title,
                                    persistent = false,
                                    minimap = true,
                                    world = true,
                                }
                            )
                        end
                    end
                else
                    -- Blizzard can only supertrack one waypoint, so use the first valid one.
                    for _, rare in ipairs(rares) do
                        local mapID = tonumber(rare.mapID or itemData.mapID)
                        local x = tonumber(rare.x)
                        local y = tonumber(rare.y)

                        if mapID and x and y and C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                            local nx = x > 1 and x / 100 or x
                            local ny = y > 1 and y / 100 or y

                            local waypoint

                            if UiMapPoint.CreateFromCoordinates then
                                waypoint = UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                            elseif UiMapPoint.CreateFromVector2D and CreateVector2D then
                                waypoint = UiMapPoint.CreateFromVector2D(mapID, CreateVector2D(nx, ny))
                            end

                            if waypoint then
                                C_Map.SetUserWaypoint(waypoint)

                                if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                                    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                                end

                                break
                            end
                        end
                    end
                end

                local action =
                    actionKey
                    and SourceActions[actionKey]

                local first = rares[1]

                local openMapID =
                    tonumber(action and (action.openMapID or action.parentMapID or action.mapID))
                    or tonumber(itemData.openMapID)
                    or tonumber(first and first.mapID)
                    or tonumber(itemData.mapID)

                if openMapID and C_Map and C_Map.OpenWorldMap then
                    C_Map.OpenWorldMap(openMapID)
                end

                return
            end

            if itemData.mapID and C_Map and C_Map.OpenWorldMap then
                C_Map.OpenWorldMap(itemData.mapID)
            end
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetBossDropGridCards()
    for _, card in ipairs(bossCardPool) do
        card:Hide()
    end
    bossCardCounter = 0
end

-------------------------------------------------
-- Lays out boss drops as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildBossDropGridSection(parentContainer, items, startY)
    items = items or {}

    local width = parentContainer:GetWidth() or 0
    local columns = BOSS_PREFERRED_COLS
    local gapX = BOSS_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (BOSS_GRID_PADDING * 2)
        local neededWidth = (columns * BOSS_CARD_SIZE) + ((columns - 1) * BOSS_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = BOSS_NARROW_COLS
        end
    end

    local col, row = 0, 0
    for _, itemData in ipairs(items) do
        bossCardCounter = bossCardCounter + 1
        local card = GetOrCreateBossDropCard(parentContainer, bossCardCounter)

        card:ClearAllPoints()
        card:SetPoint(
            "TOPLEFT",
            parentContainer,
            "TOPLEFT",
            BOSS_GRID_PADDING + col * (BOSS_CARD_SIZE + gapX),
            startY - (row * (BOSS_CARD_SIZE + BOSS_CARD_GAP_Y))
        )
        card:Show()
        table.insert(DVD.activeWidgets, card)

        PopulateBossDropCard(card, itemData)

        col = col + 1
        if col >= columns then
            col = 0
            row = row + 1
        end
    end

    local rows = math.ceil(#items / columns)
    local sectionHeight = rows * (BOSS_CARD_SIZE + BOSS_CARD_GAP_Y)

    return startY - sectionHeight
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: UI/ListBuilders.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local Gallery = DVD.Gallery

if not C then
    print("|cffff4040DecorVendor ListBuilders:|r constants are missing.")
    return
end

local Sizing = C.ListBuildersSizing

if not Sizing then
    print("|cffff4040DecorVendor ListBuilders:|r ListBuildersSizing is missing.")
    return
end

local scrollChild = DVD.scrollChild
local HasAnySelection = DVD.HasAnySelection

if not scrollChild then
    print("|cffff4040DecorVendor ListBuilders:|r DVD.scrollChild is missing. Make sure UI\\ListFrame.lua loads first.")
    return
end

if not HasAnySelection then
    print("|cffff4040DecorVendor ListBuilders:|r DVD.HasAnySelection is missing. Make sure Helpers.lua loads before UI\\ListBuilders.lua.")
    return
end

-------------------------------------------------
-- Client Availability Helpers
-------------------------------------------------

local function IsDataAvailable(data)
    if not data then
        return true
    end

    if DVD.IsDataAvailableForClient then
        return DVD.IsDataAvailableForClient(data)
    end

    return true
end

local function IsItemAvailable(itemID)
    if not itemID then
        return true
    end

    if DVD.IsItemAvailableForClient then
        return DVD.IsItemAvailableForClient(itemID)
    end

    return true
end

local function IsLinkedItemAvailable(data)
    if not data then
        return true
    end

    local itemID =
        data.itemID
        or data.rewardItemID
        or data.decorItemID
        or data.id

    if itemID then
        return IsItemAvailable(itemID)
    end

    return IsDataAvailable(data)
end

-------------------------------------------------
-- List Layout Helpers
-------------------------------------------------
local function CreateEmptyListMessage(text)
    local msg =
        scrollChild:CreateFontString(
            nil,
            "OVERLAY"
        )

    msg:SetFont(
        STANDARD_TEXT_FONT,
        Sizing.EmptyMessageFontSize
    )

    msg:SetPoint(
        "TOP",
        scrollChild,
        "TOP",
        0,
        -Sizing.EmptyMessageTopOffset
    )

    msg:SetText(text)
    msg:SetTextColor(0.7, 0.7, 0.7, 1)

    table.insert(DVD.activeWidgets, msg)

    return msg
end

local function SetListContentHeight(y, padding, minimumHeight)
    local height =
        math.abs(y)
        + padding

    if minimumHeight then
        height = math.max(
            minimumHeight,
            height
        )
    end

    scrollChild:SetHeight(height)
end
-------------------------------------------------
-- Search Helpers
-------------------------------------------------

local function GetSearchQuery()
    if not DVD.searchQuery or DVD.searchQuery == "" then
        return nil
    end

    return string.lower(tostring(DVD.searchQuery))
end

local function TextMatchesSearch(text, query)
    if not query or query == "" then
        return true
    end

    if text == nil then
        return false
    end

    return string.find(string.lower(tostring(text)), query, 1, true) ~= nil
end

local function GetItemNameSafe(itemID)
    if not itemID then
        return nil
    end

    local itemName

    if C_Item and C_Item.GetItemNameByID then
        itemName = C_Item.GetItemNameByID(itemID)
    end

    if not itemName and GetItemInfo then
        itemName = GetItemInfo(itemID)
    end

    return itemName
end

local function ItemMatchesSearch(itemID, query)
    if not itemID or not query then
        return false
    end

    if not IsItemAvailable(itemID) then
        return false
    end

    if TextMatchesSearch(itemID, query) then
        return true
    end

    local itemName = GetItemNameSafe(itemID)

    if itemName and TextMatchesSearch(itemName, query) then
        return true
    end

    local data =
        (DVD.ActiveItems and DVD.ActiveItems[itemID])
        or (DVD.decorItem and DVD.decorItem[itemID])

    if data and IsDataAvailable(data) then
        return
            TextMatchesSearch(data.name, query)
            or TextMatchesSearch(data.title, query)
            or TextMatchesSearch(data.questName, query)
            or TextMatchesSearch(data.bossName, query)
            or TextMatchesSearch(data.bossevent, query)
            or TextMatchesSearch(data.zone, query)
            or TextMatchesSearch(data.expansion, query)
            or TextMatchesSearch(data.category, query)
            or TextMatchesSearch(data.profession, query)
            or TextMatchesSearch(data.source, query)
            or TextMatchesSearch(data.sourceType, query)
            or TextMatchesSearch(data.note, query)
    end

    return false
end

local function ProfessionMatchesSearch(profession, item, query)
    if not query then
        return true
    end

    item = item or {}

    return
        TextMatchesSearch(profession and profession.name, query)
        or TextMatchesSearch(item.name, query)
        or TextMatchesSearch(item.title, query)
        or TextMatchesSearch(item.category, query)
        or TextMatchesSearch(item.skill, query)
        or TextMatchesSearch(item.expansion, query)
        or TextMatchesSearch(item.note, query)
        or TextMatchesSearch(item.id, query)
        or ItemMatchesSearch(item.id, query)
end

local function QuestMatchesSearch(group, quest, query)
    if not query then
        return true
    end

    quest = quest or {}

    return
        TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(quest.questName, query)
        or TextMatchesSearch(quest.name, query)
        or TextMatchesSearch(quest.title, query)
        or TextMatchesSearch(quest.zone, query)
        or TextMatchesSearch(quest.faction, query)
        or TextMatchesSearch(quest.category, query)
        or TextMatchesSearch(quest.expansion, query)
        or TextMatchesSearch(quest.note, query)
        or TextMatchesSearch(quest.id, query)
        or ItemMatchesSearch(quest.itemID, query)
        or ItemMatchesSearch(quest.rewardItemID, query)
        or ItemMatchesSearch(quest.decorItemID, query)
end

local function AchievementMatchesSearch(group, achieve, query)
    if not query then
        return true
    end

    achieve = achieve or {}

    return
        TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(achieve.name, query)
        or TextMatchesSearch(achieve.title, query)
        or TextMatchesSearch(achieve.category, query)
        or TextMatchesSearch(achieve.faction, query)
        or TextMatchesSearch(achieve.expansion, query)
        or TextMatchesSearch(achieve.note, query)
        or TextMatchesSearch(achieve.id, query)
        or ItemMatchesSearch(achieve.itemID, query)
        or ItemMatchesSearch(achieve.rewardItemID, query)
        or ItemMatchesSearch(achieve.decorItemID, query)
end

local function BossDropMatchesSearch(group, boss, query)
    if not query then
        return true
    end

    boss = boss or {}

    return
        TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(group and group.expansion, query)
        or TextMatchesSearch(boss.name, query)
        or TextMatchesSearch(boss.title, query)
        or TextMatchesSearch(boss.zone, query)
        or TextMatchesSearch(boss.category, query)
        or TextMatchesSearch(boss.expansion, query)
        or TextMatchesSearch(boss.bossName, query)
        or TextMatchesSearch(boss.bossevent, query)
        or TextMatchesSearch(boss.bossencounter, query)
        or TextMatchesSearch(boss.note, query)
        or TextMatchesSearch(boss.id, query)
        or ItemMatchesSearch(boss.id, query)
        or ItemMatchesSearch(boss.itemID, query)
end

local function VendorMatchesSearch(group, vendor, query)
    if not query then
        return true
    end

    vendor = vendor or {}

    if TextMatchesSearch(group and group.name, query)
        or TextMatchesSearch(group and group.expansion, query)
        or TextMatchesSearch(vendor.title, query)
        or TextMatchesSearch(vendor.name, query)
        or TextMatchesSearch(vendor.zone, query)
        or TextMatchesSearch(vendor.faction, query)
        or TextMatchesSearch(vendor.category, query)
        or TextMatchesSearch(vendor.expansion, query)
        or TextMatchesSearch(vendor.note, query)
        or TextMatchesSearch(vendor.id, query)
    then
        return true
    end

    local vendorData =
        DVD.vendorGoodies
        and DVD.vendorGoodies[vendor.id]

    local goodies =
        vendorData
        and (vendorData.items or vendorData)

    if goodies then
        for _, itemID in ipairs(goodies) do
            if ItemMatchesSearch(itemID, query) then
                return true
            end
        end
    end

    return false
end

-------------------------------------------------
-- Professions
-------------------------------------------------
function BuildProfessionList()
    DVD.ClearWidgets()

    local query = GetSearchQuery()

    local catSel = DVD.filters.professions.professions
    local hasCategoryFilter = HasAnySelection(catSel)

    local expSel = DVD.filters.professions.expansions
    local hasExpFilter = HasAnySelection(expSel)

    local y = Sizing.DefaultStartY
    local hasContent = false

    local professions = DVD.professions or {}

    table.sort(professions, function(a, b)
        return (a.name or "") < (b.name or "")
    end)

    -------------------------------------------------
    -- Process structured professions with headers & items
    -------------------------------------------------
    local processedProfessions = {}

    for _, profession in ipairs(professions) do
        if IsDataAvailable(profession) then
            local visible = {}
            local completedCount = 0
            local totalCount = 0

            for _, item in ipairs(profession.items or {}) do
                local include = true

                if include and not IsDataAvailable(item) then
                    include = false
                end

                if include and item.id and not IsItemAvailable(item.id) then
                    include = false
                end

                if include and hasExpFilter then
                    local expName = DVD.GetExpansionName(item.expansion)
                    if not item.expansion or not expSel[expName] then
                        include = false
                    end
                end

                if include and hasCategoryFilter then
                    local cat = item.category or profession.name
                    if not catSel[cat] then
                        include = false
                    end
                end

                if include and query and not ProfessionMatchesSearch(profession, item, query) then
                    include = false
                end

                if include then
                    totalCount = totalCount + 1
                    local learned = false
                    if item.spell then
                        learned = IsSpellKnown(item.spell) or IsPlayerSpell(item.spell)
                    end

                    local collected = false
                    if item.id and DVD.IsItemCollected then
                        collected = DVD.IsItemCollected(item.id)
                    end

                    if learned or collected then
                        completedCount = completedCount + 1
                    end

                    item.__learned = learned
                    item.__collected = collected

                    table.insert(visible, item)
                end
            end

            -- Only include the profession if it has visible items after filtering
            if #visible > 0 then
                hasContent = true
                
                -- Attach counts and filtered items for the section header grid renderer
                local profCopy = {}
                for k, v in pairs(profession) do profCopy[k] = v end
                profCopy.items = visible
                profCopy.__completedCount = completedCount
                profCopy.__totalCount = totalCount

                table.insert(processedProfessions, profCopy)
            end
        end
    end

    -------------------------------------------------
    -- 🚀 Pre-load items into cache to prevent ID pop-in
    -------------------------------------------------
    for _, profession in ipairs(processedProfessions) do
        for _, item in ipairs(profession.items or {}) do
            if item.id and C_Item and C_Item.RequestLoadItemDataByID then
                C_Item.RequestLoadItemDataByID(item.id)
            elseif item.id and Item and Item.CreateFromItemID then
                local itemObj = Item:CreateFromItemID(item.id)
                if itemObj and itemObj.ContinueOnItemLoad then
                    itemObj:ContinueOnItemLoad(function() end)
                end
            end
        end
    end

    if hasContent then
        if DVD.BuildProfessionGridUI then
            local totalGridHeight = DVD.BuildProfessionGridUI(scrollChild, processedProfessions)
            if totalGridHeight then
                y = Sizing.DefaultStartY - totalGridHeight
            end
        end
    end

    if not hasContent then
        CreateEmptyListMessage(
            query
            and DVD.L["NO_PROFESSIONS_MATCH_SEARCH"]
            or DVD.L["NO_PROFESSION_DATA"]
        )
    end

    SetListContentHeight(
        y,
        Sizing.ExtendedBottomPadding
    )
end
-------------------------------------------------
-- Quests
-------------------------------------------------
function BuildQuestList()
    DVD.ClearWidgets()

    if DVD.ResetQuestGridCards then
        DVD.ResetQuestGridCards()
    end

    local query = GetSearchQuery()

    selectedQuests = selectedQuests or {}

    local expSel = DVD.filters.quests.expansions
    local facSel = DVD.filters.quests.factions
    local catSel = DVD.filters.quests.categories

    local hasCategoryFilter = HasAnySelection(catSel)
    local hasFactionFilter = HasAnySelection(facSel)
    local hasExpansionFilter = HasAnySelection(expSel)

    local y = Sizing.DefaultStartY
    local hasContent = false

    local questGroups = {}

    for _, g in ipairs(DVD.quests or {}) do
        if IsDataAvailable(g) then
            table.insert(questGroups, g)
        end
    end

    table.sort(questGroups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(questGroups) do
        local visible = {}

        for _, quest in ipairs(group.quests or {}) do
            if quest then
                local include = true
                local isCompleted = DVD.IsQuestEffectivelyCompleted(quest)

                -- Hide unreleased/future quest rows.
                if include and not IsDataAvailable(quest) then
                    include = false
                end

                -- Hide rows whose linked reward/decor item is unreleased/future.
                if include and quest.itemID and not IsItemAvailable(quest.itemID) then
                    include = false
                end

                if include and quest.rewardItemID and not IsItemAvailable(quest.rewardItemID) then
                    include = false
                end

                if include and quest.decorItemID and not IsItemAvailable(quest.decorItemID) then
                    include = false
                end

                -- Expansion filter
                -- Expansion filter
                if include and hasExpansionFilter then
                    local expName = DVD.GetExpansionName(quest.expansion)
                    if not quest.expansion or not expSel[expName] then
                        include = false
                    end
                end

                -- Hide completed
                if include
                    and isCompleted
                    and vendorSettings.hideCompletedThings
                    and not vendorSettings.markCompletedThings
                then
                    include = false
                end

                -- Faction filter
                if include and hasFactionFilter then
                    local f = quest.faction and string.lower(quest.faction)

                    if f and not facSel[f] then
                        include = false
                    end
                end

                -- Category filter
                if include and hasCategoryFilter then
                    local cat = quest.category or group.name

                    if not catSel[cat] then
                        include = false
                    end
                end

                -- Search filter
                if include and query and not QuestMatchesSearch(group, quest, query) then
                    include = false
                end

                if include then
                    table.insert(visible, quest)
                end
            end
        end

        if #visible > 0 then
            hasContent = true

            local total, completed = 0, 0

            for _, quest in ipairs(visible) do
                total = total + 1

                if DVD.IsQuestEffectivelyCompleted(quest) then
                    completed = completed + 1
                end
            end

            local collapsed, newY =
                DVD.CreateQuestHeader(scrollChild, group, y, completed, total)

            y = newY

            if not collapsed then
                if DVD.BuildQuestGridSection then
                    y = DVD.BuildQuestGridSection(scrollChild, visible, y)
                end

                y = y - Sizing.GroupBottomGap
            end
        end
    end

if not hasContent then
    CreateEmptyListMessage(
        query
        and DVD.L["NO_QUESTS_MATCH_SEARCH"]
        or DVD.L["NO_QUEST_DATA"]
    )
end

SetListContentHeight(
    y,
    Sizing.StandardBottomPadding
)
end
-------------------------------------------------
-- Achievements
-------------------------------------------------
function BuildAchievementList()
    DVD.ClearWidgets()

    if DVD.ResetAchievementGridCards then
        DVD.ResetAchievementGridCards()
    end

    local query = GetSearchQuery()

    local groupSel = DVD.filters.achievements.groups
    local facSel = DVD.filters.achievements.factions

    local hasGroupFilter = HasAnySelection(groupSel)
    local hasFactionFilter = HasAnySelection(facSel)

    local y = Sizing.DefaultStartY
    local hasContent = false

    local achieveGroups = {}

    for _, g in ipairs(DVD.achievements or {}) do
        if IsDataAvailable(g) then
            achieveGroups[#achieveGroups + 1] = g
        end
    end

    table.sort(achieveGroups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(achieveGroups) do
        if hasGroupFilter and not groupSel[group.name] then
            -- skip this group
        else
            local visible = {}

            for _, achieve in ipairs(group.achievements or {}) do
                local include = true

                -- Hide unreleased/future achievement rows.
                if include and not IsDataAvailable(achieve) then
                    include = false
                end

                -- Hide rows whose linked reward/decor item is unreleased/future.
                if include and achieve.itemID and not IsItemAvailable(achieve.itemID) then
                    include = false
                end

                if include and achieve.rewardItemID and not IsItemAvailable(achieve.rewardItemID) then
                    include = false
                end

                if include and achieve.decorItemID and not IsItemAvailable(achieve.decorItemID) then
                    include = false
                end

                local completed = false

                if include and DVD.IsAchievementComplete then
                    completed = DVD.IsAchievementComplete(achieve.id)
                end

                if include
                    and completed
                    and vendorSettings.hideCompletedThings
                    and not vendorSettings.markCompletedThings
                then
                    include = false
                end

                achieve.__isCompleted = completed

                if include and hasFactionFilter then
                    local f = achieve.faction and string.lower(achieve.faction)

                    if not facSel[f] then
                        include = false
                    end
                end

                -- Search filter
                if include and query and not AchievementMatchesSearch(group, achieve, query) then
                    include = false
                end

                if include then
                    table.insert(visible, achieve)
                end
            end

            if #visible > 0 then
                hasContent = true

                local total, completed = 0, 0

                for _, achieve in ipairs(visible) do
                    total = total + 1

                    if DVD.IsAchievementComplete and DVD.IsAchievementComplete(achieve.id) then
                        completed = completed + 1
                    end
                end

                local collapsed, newY =
                    DVD.CreateAchievementHeader(
                        scrollChild,
                        group.name,
                        y,
                        completed,
                        total
                    )

                y = newY

                if not collapsed then
                    if DVD.BuildAchievementGridSection then
                        y = DVD.BuildAchievementGridSection(scrollChild, visible, y)
                    end

                    y = y - Sizing.GroupBottomGap
                end
            end
        end
    end

if not hasContent then
    CreateEmptyListMessage(
        query
        and DVD.L["NO_ACHIEVEMENTS_MATCH_SEARCH"]
        or DVD.L["NO_ACHIEVEMENT_DATA"]
    )
end

    SetListContentHeight(
    y,
    Sizing.StandardBottomPadding
)
end
-------------------------------------------------
-- Boss Drops
-------------------------------------------------
--[[function BuildBossDropList()
    DVD.ClearWidgets()

    if DVD.ResetBossDropGridCards then
        DVD.ResetBossDropGridCards()
    end

    local query = GetSearchQuery()
	
    local y = Sizing.DefaultStartY
    local hasContent = false
	
    local expSel = DVD.filters.bossdrops.expansions
    local catSel = DVD.filters.bossdrops.categories
	
    local hasExpansionFilter = HasAnySelection(expSel)
    local hasCategoryFilter = HasAnySelection(catSel)
	
   -- ========================================================
    -- 🚀 STEP 1: DYNAMIC DICTIONARY RE-GROUPER (Vendor Pattern)
    -- ========================================================
    local groupsMap = {}
    local groups = {}

    for itemID, itemData in pairs(DVD.bossdrops or {}) do
        local groupName = itemData.group or "Other Boss Drops"
        if not groupsMap[groupName] then
            groupsMap[groupName] = {
                name = groupName,
                expansion = itemData.expansion,
                items = {}
            }
            table.insert(groups, groupsMap[groupName])
        end
        
        local bossItem = itemData
        bossItem.id = bossItem.id or itemID
        table.insert(groupsMap[groupName].items, bossItem)
    end

    -- Alphabetize headers by name
    table.sort(groups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

   for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter
            or DVD.filters.bossdrops.expansions[group.expansion]
        if passesExpansion then
            local visible = {}
            local total = 0
            local collected = 0
            for _, boss in ipairs(group.items or {}) do
                local include = true
                -- Hide unreleased/future boss drop rows.
                if include and not IsDataAvailable(boss) then
                    include = false
                end
                -- Boss drop boss.id is usually the itemID in your data.
                if include and boss.id and not IsItemAvailable(boss.id) then
                    include = false
                end
                if include and boss.itemID and not IsItemAvailable(boss.itemID) then
                    include = false
                end
                local isCollected = false
                if include and DVD.IsItemCollected then
                    isCollected = DVD.IsItemCollected(boss.id)
                end
                -- Category filter
                if include and hasCategoryFilter then
                    local cat = boss.category or group.name
                    if not catSel[cat] then
                        include = false
                    end
                end
                -- Hide collected
                if include and vendorSettings.hideCollectedBossDrops and isCollected then
                    include = false
                end
                -- Search filter
                if include and query and not BossDropMatchesSearch(group, boss, query) then
                    include = false
                end
                if include then
                    total = total + 1
                    if isCollected then
                        collected = collected + 1
                    end
                    table.insert(visible, boss)
                end
            end
            if #visible > 0 then
                hasContent = true
                local collapsed, newY =
                    DVD.CreateBossDropHeader(scrollChild, group, collected, total, y)
                y = newY
                if not collapsed then
                    if DVD.BuildBossDropGridSection then
                        y = DVD.BuildBossDropGridSection(scrollChild, visible, y)
                    end
                    y = y - Sizing.GroupBottomGap
                end
            end
        end
    end
if not hasContent then
    CreateEmptyListMessage(
        query
        and DVD.L["NO_BOSS_DROPS_MATCH_SEARCH"]
        or DVD.L["NO_BOSS_DROP_DATA"]
    )
end
    SetListContentHeight(
    y,
    Sizing.ExtendedBottomPadding,
    Sizing.BossMinimumHeight
)
end
]]

function BuildBossDropList()
    DVD.ClearWidgets()

    if DVD.ResetBossDropGridCards then
        DVD.ResetBossDropGridCards()
    end

    local query = GetSearchQuery()
    local y = Sizing.DefaultStartY
    local hasContent = false
    
    local expSel = DVD.filters.bossdrops.expansions
    local catSel = DVD.filters.bossdrops.categories
    
    local hasExpansionFilter = HasAnySelection(expSel)
    local hasCategoryFilter = HasAnySelection(catSel)

    -- ========================================================
    -- 🚀 STEP 1: DYNAMIC DICTIONARY RE-GROUPER (Vendor Pattern)
    -- ========================================================
    local groupsMap = {}
    local groups = {}

    for itemID, itemData in pairs(DVD.bossdrops or {}) do
        local groupName = itemData.group or "Other Boss Drops"
        if not groupsMap[groupName] then
            groupsMap[groupName] = {
                name = groupName,
                expansion = DVD.GetExpansionName(itemData.expansion or "Classic"), -- 🌟 Normalized expansion string!
                items = {}
            }
            table.insert(groups, groupsMap[groupName])
        end
        
        local bossItem = itemData
        bossItem.id = bossItem.id or itemID
        table.insert(groupsMap[groupName].items, bossItem)
    end

    -- Alphabetize headers by name
    table.sort(groups, function(a, b)
        return (a.name or ""):lower() < (b.name or ""):lower()
    end)

    for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter
            or expSel[group.expansion] -- Now matches the normalized string key!

        if passesExpansion then
            local visible = {}
            local total = 0
            local collected = 0
            
            for _, boss in ipairs(group.items or {}) do
                local include = true
                
                -- Hide unreleased/future boss drop rows.
                if include and not IsDataAvailable(boss) then
                    include = false
                end
                if include and boss.id and not IsItemAvailable(boss.id) then
                    include = false
                end
                if include and boss.itemID and not IsItemAvailable(boss.itemID) then
                    include = false
                end
                
                local isCollected = false
                if include and DVD.IsItemCollected then
                    isCollected = DVD.IsItemCollected(boss.id)
                end
                
                -- Category filter
                if include and hasCategoryFilter then
                    local activeData = boss.id and DVD.ActiveItems and DVD.ActiveItems[boss.id] or {}
                    local cat = boss.category or activeData.category
                    if not cat then
                        local text = string.lower((group.name or "") .. " " .. (boss.bossevent or ""))
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
                    if not catSel[cat] then
                        include = false
                    end
                end
                
                -- Hide collected
                if include and vendorSettings.hideCollectedBossDrops and isCollected then
                    include = false
                end
                
                -- Search filter
                if include and query and not BossDropMatchesSearch(group, boss, query) then
                    include = false
                end
                
                if include then
                    total = total + 1
                    if isCollected then
                        collected = collected + 1
                    end
                    table.insert(visible, boss)
                end
            end
            
            if #visible > 0 then
                hasContent = true
                local collapsed, newY =
                    DVD.CreateBossDropHeader(scrollChild, group, collected, total, y)
                y = newY
                if not collapsed then
                    if DVD.BuildBossDropGridSection then
                        y = DVD.BuildBossDropGridSection(scrollChild, visible, y)
                    end
                    y = y - Sizing.GroupBottomGap
                end
            end
        end
    end

    if not hasContent then
        CreateEmptyListMessage(
            query
            and DVD.L["NO_BOSS_DROPS_MATCH_SEARCH"]
            or DVD.L["NO_BOSS_DROP_DATA"]
        )
    end
    
    SetListContentHeight(
        y,
        Sizing.ExtendedBottomPadding,
        Sizing.BossMinimumHeight
    )
end
-------------------------------------------------
-- Vendors
-------------------------------------------------
function BuildVendorList()
    DVD.ClearWidgets()

    if DVD.ResetVendorGridCards then
        DVD.ResetVendorGridCards()
    end
	
    local query = GetSearchQuery()

    local y = Sizing.VendorStartY
    local hasContent = false

    local expSel = DVD.filters.vendors.expansions
    local facSel = DVD.filters.vendors.factions
    local catSel = DVD.filters.vendors.categories

    local hasExpansionFilter = HasAnySelection(expSel)
    local hasFactionFilter = HasAnySelection(facSel)
    local hasCategoryFilter = HasAnySelection(catSel)

    -- ========================================================
    -- 🚀 STEP 1: DYNAMIC DICTIONARY RE-GROUPER
    -- Maps your clean flat database lines out by zoneGroup!
    -- ========================================================
    local groupMap = {}
    local groups = {}

for npcID, vendor in pairs(DVD.npcs or {}) do
        if IsDataAvailable(vendor) then
            -- Set vendor.id from the primary number key so item popup clicks work!
            vendor.id = npcID 

            local gKey = vendor.zoneGroup or "Unknown Location"
            if not groupMap[gKey] then
                groupMap[gKey] = {
                    zoneGroup = gKey, -- 🌟 Explicitly sets zoneGroup
                    expansion = DVD.GetExpansionName(vendor.expansion or "Classic"), 
                    vendors = {}
                }
                table.insert(groups, groupMap[gKey])
            end
            table.insert(groupMap[gKey].vendors, vendor)
        end
    end

    -- Alphabetize headers by zoneGroup
    table.sort(groups, function(a, b)
        return (a.zoneGroup or ""):lower() < (b.zoneGroup or ""):lower()
    end)

    -- ========================================================
    -- STEP 2: LOOP AND FILTER THE VISIBLE ROWS
    -- ========================================================
    for _, group in ipairs(groups) do
        local passesExpansion =
            not hasExpansionFilter
            or expSel[group.expansion]

        if passesExpansion then
            local visibleVendors = {}

            for _, vendor in ipairs(group.vendors or {}) do
                local includeVendor = true

                -- Hide unreleased/future vendor rows.
                if includeVendor and not IsDataAvailable(vendor) then
                    includeVendor = false
                end

                -- Faction filter
                local passesFaction =
                    not hasFactionFilter
                    or facSel[vendor.faction]

                if includeVendor and not passesFaction then
                    includeVendor = false
                end

                -- Category / requirement filter
                if includeVendor and hasCategoryFilter then
                    local cat = vendor.category

                    if cat and cat ~= "" then
                        cat = string.lower(cat)
                    end

                    local matches = false

                    for selectedCategory, enabled in pairs(catSel) do
                        if enabled then
                            selectedCategory = string.lower(selectedCategory)

                            if selectedCategory == cat then
                                matches = true
                                break
                            end
                        end
                    end

                    if not matches then
                        includeVendor = false
                    end
                end

                -- Search filter
                if includeVendor and query and not VendorMatchesSearch(group, vendor, query) then
                    includeVendor = false
                end

                -- Profession check REMOVED 2026-11-05:
                -- profession vendors now always show in the
                -- Vendors tab, even if this character does
                -- not have that profession. The profession
                -- field is still kept on the vendor line
                -- for the Professions tab.
                -- Found status
                if includeVendor then
                    local isFound = false

                    if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                        local playerFaction = UnitFactionGroup("player")
                        playerFaction = playerFaction and playerFaction:lower()

                        if vendor.faction == playerFaction or vendor.faction == "neutral" then
                            isFound = true
                        end
                    end

                    vendor.__isFound = isFound

                    -- Hide Found filter
                    if vendorSettings and vendorSettings.hideFoundVendors and isFound then
                        includeVendor = false
                    end
                end

                if includeVendor then
                    table.insert(visibleVendors, vendor)
                end
            end

if #visibleVendors > 0 then
                hasContent = true

                table.sort(visibleVendors, function(a, b)
                    return (a.title or ""):lower() < (b.title or ""):lower()
                end)

                -- Calculate total progress milestones
                local total, completed = 0, 0
                for _, vendor in ipairs(group.vendors or {}) do
                    total = total + 1
                    if vendorSettings.visited and vendorSettings.visited[vendor.id] then
                        completed = completed + 1
                    end
                end

                local _, collapsed, newY =
                    DVD.CreateVendorHeader(scrollChild, group, y, completed, total)

                y = newY

                if not collapsed then
                    if DVD.BuildVendorGridSection then
                        y = DVD.BuildVendorGridSection(scrollChild, visibleVendors, y, vendorSettings)
                    end

                    y = y - Sizing.GroupBottomGap
                end
            end
        end
    end

if not hasContent then
    CreateEmptyListMessage(
        query
        and DVD.L["NO_VENDORS_MATCH_SEARCH"]
        or DVD.L["NO_VENDORS_MATCH_FILTERS"]
    )
end

SetListContentHeight(
    y,
    Sizing.StandardBottomPadding
)
end


-------------------------------------------------
-- Main UI Router
-------------------------------------------------
function DVD.BuildVendorUI()
    if not DVD.catalogReady then
        return
    end

    if DVD.currentTab == "vendors" then
        BuildVendorList()

    elseif DVD.currentTab == "professions" then
        BuildProfessionList()

    elseif DVD.currentTab == "quests" then
        BuildQuestList()

    elseif DVD.currentTab == "achievements" then
        BuildAchievementList()

    elseif DVD.currentTab == "bossdrops" then
        BuildBossDropList()

    end

    DVD.filtersJustChanged = false
end

-- Compatibility wrapper.
-- Older DecorVendor code still calls BuildVendorUI() directly.
function BuildVendorUI()
    return DVD.BuildVendorUI()
end
end)(...);

-- ------------------------------------------------------------
-- SECTION: UI/OptionsPanel.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor OptionsPanel:|r constants are missing.")
    return
end

local Sizing = C.OptionsPanelSizing

if not Sizing then
    print("|cffff4040DecorVendor OptionsPanel:|r OptionsPanelSizing is missing.")
    return
end

local frame = DVD.frame
local LibDBIcon = LibStub("LibDBIcon-1.0", true)

if not frame then
    print("|cffff4040DecorVendor OptionsPanel:|r DVD.frame is missing. Make sure UI\\MainFrame.lua loads first.")
    return
end

--------------------------------------------------------------------------------
-- Helper: Create checkbox with tooltip
--------------------------------------------------------------------------------
local function CreateCheckbox(parent, label, tooltip, getValue, setValue)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check.Text:SetFontObject(GameFontNormal)
    check.Text:SetTextColor(1, 0.82, 0)
    check.Text:SetText(label)
    check:SetChecked(getValue())

    check:SetScript("OnClick", function(self)
        setValue(self:GetChecked())
    end)

    check:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(label, 1, 0.82, 0)
        if tooltip then
            GameTooltip:AddLine(tooltip, 1, 1, 1, true)
        end
        GameTooltip:Show()
    end)

    check:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    return check
end

--------------------------------------------------------------------------------
-- Helper: Create section header with divider
--------------------------------------------------------------------------------
local SECTION_GAP = 20

local function CreateSectionHeader(parent, text, yOffset)
    local label = DVD:CreateFontString(parent, "ARTWORK", "GameFontNormal")
    label:SetPoint("TOPLEFT", Sizing.PageInset, yOffset)
    label:SetText(text)
    label:SetTextColor(unpack(C.COLORS.TEXT_PRIMARY))

    local divider = parent:CreateTexture(nil, "ARTWORK")
    divider:SetHeight(2)
    divider:SetPoint("LEFT", label, "RIGHT", 8, 0)
    divider:SetWidth(340)
    divider:SetColorTexture(1, 0.82, 0, 0.6)

    return label
end

function DVD.CreateOptionsPanel()
    local configFrame = CreateFrame("Frame", "DV_ConfigFrame", UIParent)
    configFrame.name = "Decor Vendor"

    local title = DVD:CreateFontString(configFrame, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    title:SetText(DVD.L["DECOR_VENDOR_SETTINGS"])
    title:SetTextColor(unpack(C.COLORS.GOLD))

    local yOffset = Sizing.GeneralStartY
    local COL1_X = Sizing.PageInset
    local COL2_X = Sizing.PageInset + 300

    --------------------------------------------------------------------------------
    -- DISPLAY SECTION
    --------------------------------------------------------------------------------
    CreateSectionHeader(configFrame, "Display", yOffset)
    yOffset = yOffset - Sizing.HeaderBottomGap

    local minimapCheck = CreateCheckbox(
        configFrame,
        DVD.L["SHOW_MINIMAP_BUTTON"],
        "Toggles the Decor Vendor icon on the minimap.",
        function() return vendorSettings.showMinimapButton end,
        function(checked)
            vendorSettings.showMinimapButton = checked
            dbDV.minimap.hide = not checked
            if LibDBIcon then
                if checked then
                    LibDBIcon:Show("DecorVendor")
                else
                    LibDBIcon:Hide("DecorVendor")
                end
            end
        end
    )
    minimapCheck:SetPoint("TOPLEFT", COL1_X, yOffset)

    local escCheck = CreateCheckbox(
        configFrame,
        DVD.L["CLOSE_ON_ESCAPE"],
        "Closes the main Decor Vendor window when pressing the Escape key.",
        function() return vendorSettings.closeOnEsc end,
        function(checked)
            vendorSettings.closeOnEsc = checked
            if DVD.UpdateEscBehavior then
                DVD.UpdateEscBehavior()
            elseif UpdateEscBehavior then
                UpdateEscBehavior()
            end
        end
    )
    escCheck:SetPoint("TOPLEFT", COL2_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing

    local openAchievementFrameCheckbox = CreateCheckbox(
        configFrame,
        DVD.L["OPEN_ACHIEVEMENT_FRAME"],
        "Automatically opens the Blizzard Achievement UI when clicking an achievement card.",
        function() return vendorSettings.openAchievementFrame end,
        function(checked)
            vendorSettings.openAchievementFrame = checked
        end
    )
    openAchievementFrameCheckbox:SetPoint("TOPLEFT", COL2_X, yOffset)
  

    local customFontCheck = CreateCheckbox(
        configFrame,
        DVD.L["USE_CUSTOM_FONT"],
        "Applies a custom font across Decor Vendor's UI.",
        function() return vendorSettings.useCustomFont end,
        function(checked)
            DVD:SetCustomFontEnabled(checked)
        end
    )
    customFontCheck:SetPoint("TOPLEFT", COL1_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing
	
	--------------------------------------------------------------------------------
    -- Mark SECTION
    --------------------------------------------------------------------------------
    yOffset = yOffset - SECTION_GAP
    CreateSectionHeader(configFrame, "Mark Options", yOffset)
    yOffset = yOffset - 20	

    local markFoundCheck = CreateCheckbox(
        configFrame,
        DVD.L["MARK_FOUND_VENDORS"],
        "Marks a vendor as found once you've interacted with them.",
        function() return vendorSettings.markFoundVendors end,
        function(checked)
            vendorSettings.markFoundVendors = checked
            if BuildVendorUI then BuildVendorUI() elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end
    )
    markFoundCheck:SetPoint("TOPLEFT", COL1_X, yOffset)

    local markCompletedCheck = CreateCheckbox(
        configFrame,
        DVD.L["MARK_COMPLETED"],
        "Visually dims quests and achievements you've already completed.",
        function() return vendorSettings.markCompletedThings end,
        function(checked)
            vendorSettings.markCompletedThings = checked
            if BuildVendorUI then BuildVendorUI() elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end
    )
    markCompletedCheck:SetPoint("TOPLEFT", COL2_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing	
	--------------------------------------------------------------------------------
    -- Hide SECTION
    --------------------------------------------------------------------------------
    yOffset = yOffset - SECTION_GAP
    CreateSectionHeader(configFrame, "Hide Options", yOffset)
    yOffset = yOffset - 20	
	
    local hidebosscheck = CreateCheckbox(
        configFrame,
        DVD.L["HIDE_COMPLETED_BOSS_DROPS"],
        "Removes boss drops you've already collected from the list.",
        function() return vendorSettings.hideCollectedBossDrops end,
        function(checked)
            vendorSettings.hideCollectedBossDrops = checked
            if BuildVendorUI then BuildVendorUI() elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end
    )
    hidebosscheck:SetPoint("TOPLEFT", COL1_X, yOffset)	

    local hideFoundCheck = CreateCheckbox(
        configFrame,
        DVD.L["HIDE_FOUND_VENDORS"],
        "Removes found vendors from the list and map.",
        function() return vendorSettings.hideFoundVendors end,
        function(checked)
            vendorSettings.hideFoundVendors = checked
            if BuildVendorUI then BuildVendorUI() elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end
    )
    hideFoundCheck:SetPoint("TOPLEFT", COL2_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing	
	
    local hideCompletedCheck = CreateCheckbox(
        configFrame,
        DVD.L["HIDE_COMPLETED"],
        "Removes completed quests and achievements from their lists.",
        function() return vendorSettings.hideCompletedThings end,
        function(checked)
            vendorSettings.hideCompletedThings = checked
            if BuildVendorUI then BuildVendorUI() elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
        end
    )
    hideCompletedCheck:SetPoint("TOPLEFT", COL1_X, yOffset)
	yOffset = yOffset - Sizing.RowSpacing		
    --------------------------------------------------------------------------------
    -- Map SECTION
    --------------------------------------------------------------------------------
    yOffset = yOffset - SECTION_GAP
    CreateSectionHeader(configFrame, "Map", yOffset)
    yOffset = yOffset - 20	
	
    local waypointButtonCheck = CreateCheckbox(
        configFrame,
        DVD.L["SHOW_WAYPOINT_BUTTON"],
        "Shows a dedicated waypoint button beneath the vendor model preview.",
        function() return vendorSettings.showWaypointButton end,
        function(checked)
            vendorSettings.showWaypointButton = checked
            if BuildVendorUI then BuildVendorUI() elseif DVD.BuildVendorUI then DVD.BuildVendorUI() end
            if DVD.vendorWaypointBtn and DVD.selectedVendor then
                if checked and DVD.selectedVendor.mapID then
                    DVD.vendorWaypointBtn:Show()
                else
                    DVD.vendorWaypointBtn:Hide()
                end
            end
        end
    )
    waypointButtonCheck:SetPoint("TOPLEFT", COL1_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing	
    --------------------------------------------------------------------------------
    -- Vendor SECTION
    --------------------------------------------------------------------------------
    yOffset = yOffset - SECTION_GAP
    CreateSectionHeader(configFrame, "Vendor", yOffset)
    yOffset = yOffset - 20
	
    local showMerchantCheckmark = CreateCheckbox(
        configFrame,
        DVD.L["MERCHANT_CHECKMARKS"],
        "Adds checkmarks to items on the Merchant Frame that you've already collected.",
        function() return vendorSettings.showMerchantCheckmarks end,
        function(checked)
            vendorSettings.showMerchantCheckmarks = checked
            if not checked then
                if DVD.HideMerchantCheckmarks then
                    DVD.HideMerchantCheckmarks()
                elseif HideMerchantCheckmarks then
                    HideMerchantCheckmarks()
                end
            end
            if MerchantFrame and MerchantFrame:IsShown() then
                MerchantFrame_Update()
            end
        end
    )
    showMerchantCheckmark:SetPoint("TOPLEFT", COL1_X, yOffset)

    local vendorCheckmarkOption = CreateCheckbox(
        configFrame,
        DVD.L["VENDOR_LINE_CHECKMARKS"],
        "Shows checkmarks in the item popup when clicking a vendor line.",
        function() return vendorSettings.showVendorCheckmarks end,
        function(checked)
            vendorSettings.showVendorCheckmarks = checked
            for _, container in pairs(DVD.popupIconCache or {}) do
                if container:IsShown() and container.btn and container.btn.isCollected then
                    container.checkFrame:SetShown(checked)
                end
            end
        end
    )
    vendorCheckmarkOption:SetPoint("TOPLEFT", COL2_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing	
	local previewDecorCheck = CreateCheckbox(
    configFrame,
    DVD.L["PREVIEW_DECOR_ON_CLICK"],
    "When on, left-clicking a decor item in a vendor popup shows its 3D model in the preview pane, replacing the vendor. When off, the vendor stays in the preview pane.",
    function() return vendorSettings.previewDecorOnClick ~= false end,
    function(checked) vendorSettings.previewDecorOnClick = checked end
)
previewDecorCheck:SetPoint("TOPLEFT", COL1_X, yOffset)
    yOffset = yOffset - Sizing.RowSpacing	
	
    --------------------------------------------------------------------------------
    -- SCALE SECTION
    --------------------------------------------------------------------------------
    yOffset = yOffset - SECTION_GAP
    CreateSectionHeader(configFrame, "Scale for UI", yOffset)
    yOffset = yOffset - Sizing.ScaleLabelGap

    local scaleSlider = CreateFrame("Slider", nil, configFrame, "MinimalSliderWithSteppersTemplate")
    scaleSlider:SetWidth(Sizing.ScaleSliderWidth)
    scaleSlider:SetPoint("TOPLEFT", COL1_X, yOffset)
    scaleSlider:Init(vendorSettings.scale or 0.7, 0.5, 1.5, 20, {
        [MinimalSliderWithSteppersMixin.Label.Right] = function(value)
            return string.format("%.2f", value)
        end
    })

    scaleSlider.Slider:SetValueStep(0.05)
    scaleSlider:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, function(_, value)
        local rounded = tonumber(string.format("%.2f", value))
        vendorSettings.scale = rounded
        frame:SetScale(rounded)
        if DVD.vendorPopup then
            DVD.vendorPopup:SetScale(rounded)
        end
    end)

    --------------------------------------------------------------------------------
    -- Footer Text
    --------------------------------------------------------------------------------
    local footerText = DVD:CreateFontString(configFrame, "OVERLAY")
    footerText:SetFont("Fonts\\FRIZQT__.TTF", Sizing.FooterFontSize, "OUTLINE")
    footerText:SetPoint("BOTTOM", configFrame, "BOTTOM", 0, Sizing.FooterBottomOffset)
    footerText:SetWidth(Sizing.FooterWidth)
    footerText:SetJustifyH("CENTER")
    footerText:SetText(
        "|cffffdd00" .. DVD.L["ADDON_TITLE"] .. "|r  •  " .. DVD.L["DEVELOPED_BY"] .. " |cff00aaffMidniteDestiny|r\n" ..
        "|cffffffff" .. DVD.L["FOOTER_COMPANION"] .. "|r"
    )

local rootCategory = Settings.RegisterCanvasLayoutCategory(configFrame, "Decor Vendor")
    Settings.RegisterAddOnCategory(rootCategory)
    DVD.optionsCategory = rootCategory

    -------------------------------------------------
    -- Events Subcategory
    -------------------------------------------------
    local eventsFrame = CreateFrame("Frame")
    eventsFrame.name = DVD.L["EVENTS"]
    eventsFrame.parent = "Decor Vendor"

    local titleEvents = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontNormalLarge")
    titleEvents:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    titleEvents:SetText(DVD.L["EVENT_DECOR_PROMOTIONS"])

    local y = Sizing.EventsStartY

    -- =========================
    -- TWITCH DROP EVENT
    -- =========================
   y = y - Sizing.EventsInitialGap

    local eventHeader = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontNormal")
    eventHeader:SetPoint("TOPLEFT", Sizing.PageInset, y)
   -- eventHeader:SetText("Current Twitch Drop Event")
	eventHeader:SetText(DVD.L["TWITCH_DROPS_SOON"])
    eventHeader:SetTextColor(unpack(C.COLORS.TEXT_PRIMARY))

    y = y - Sizing.EventsHeaderGap

  --[[ local startText = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    startText:SetPoint("TOPLEFT", 16, y)
    startText:SetText("Start Time:")
    startText:SetTextColor(1, 0.82, 0)

    local startValue = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    startValue:SetPoint("LEFT", startText, "RIGHT", 6, 0)
    startValue:SetText("October 13, 8:00 am PDT")
    startValue:SetTextColor(0.3, 1, 0.3)

    y = y - 20

    local endText = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    endText:SetPoint("TOPLEFT", 16, y)
    endText:SetText("End Time:")
    endText:SetTextColor(1, 0.82, 0)

    local endValue = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    endValue:SetPoint("LEFT", endText, "RIGHT", 6, 0)
    endValue:SetText("November 3, 9:00 am PDT")
    endValue:SetTextColor(0.3, 1, 0.3)

    y = y - 30

    local descEvents = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    descEvents:SetPoint("TOPLEFT", 16, y)
    descEvents:SetPoint("TOPRIGHT", -16, y)
    descEvents:SetJustifyH("LEFT")
    descEvents:SetJustifyV("TOP")
    descEvents:SetWordWrap(true)
    descEvents:SetText(
        "Watch |cff00ccff4 hours|r of eligible World of Warcraft Blizzcon content on Twitch while Drops are active " ..
        "to earn the |cffe4c562Cuddly Gold Grrgle|r housing decor item."
    )
]]
    
    local eventsCategory = Settings.RegisterCanvasLayoutSubcategory(
        rootCategory,
        eventsFrame,
        DVD.L["EVENTS"]
    )
    Settings.RegisterAddOnCategory(eventsCategory)

-------------------------------------------------
-- Tips Subcategory
-------------------------------------------------
local tipsFrame = CreateFrame("Frame")
tipsFrame.name = DVD.L["HELPFUL_INFORMATION"]
tipsFrame.parent = "Decor Vendor"

-------------------------------------------------
-- Background Panel
-------------------------------------------------

local panel =
    CreateFrame(
        "Frame",
        nil,
        tipsFrame,
        "BackdropTemplate"
    )

panel:SetPoint(
    "TOPLEFT",
    Sizing.TipsPanelInset,
    -Sizing.TipsPanelInset
)

panel:SetPoint(
    "BOTTOMRIGHT",
    -Sizing.TipsPanelInset,
    Sizing.TipsPanelInset
)

panel:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
})

panel:SetBackdropColor(
    0.05,
    0.05,
    0.08,
    0.55
)

panel:SetBackdropBorderColor(
    0.35,
    0.25,
    0.50,
    0.8
)

-------------------------------------------------
-- Scrollable Content Area
-------------------------------------------------

local scrollFrame =
    CreateFrame(
        "ScrollFrame",
        nil,
        panel,
        "UIPanelScrollFrameTemplate"
    )

scrollFrame:SetPoint(
    "TOPLEFT",
    panel,
    "TOPLEFT",
    0,
    0
)

scrollFrame:SetPoint(
    "BOTTOMRIGHT",
    panel,
    "BOTTOMRIGHT",
    -28,
    0
)

scrollFrame:EnableMouseWheel(true)

local content =
    CreateFrame(
        "Frame",
        nil,
        scrollFrame
    )

content:SetSize(1, 1)

scrollFrame:SetScrollChild(content)

-------------------------------------------------
-- Mouse-wheel scrolling
-------------------------------------------------

scrollFrame:SetScript(
    "OnMouseWheel",
    function(self, delta)
        local currentScroll =
            self:GetVerticalScroll()

        local maximumScroll =
            math.max(
                0,
                self:GetVerticalScrollRange()
            )

        local scrollStep = 40

        local newScroll =
            currentScroll
            - delta * scrollStep

        newScroll =
            math.max(
                0,
                math.min(
                    maximumScroll,
                    newScroll
                )
            )

        self:SetVerticalScroll(newScroll)
    end
)

-------------------------------------------------
-- Title
-------------------------------------------------
local titleTips = DVD:CreateFontString(content, "ARTWORK", "GameFontNormalLarge")
titleTips:SetPoint("TOPLEFT", Sizing.TipsTitleLeftInset, -Sizing.TipsTitleTopInset)
titleTips:SetText(DVD.L["TIPS_TITLE"])
titleTips:SetTextColor(1, 0.82, 0, 1)

local subtitleTips = DVD:CreateFontString(content, "ARTWORK", "GameFontHighlightSmall")
subtitleTips:SetPoint("TOPLEFT", titleTips, "BOTTOMLEFT", 0, -Sizing.TipsSubtitleGap)
subtitleTips:SetPoint("TOPRIGHT", content, "TOPRIGHT", -Sizing.TipsRightInset, -Sizing.TipsSubtitleTopInset)
subtitleTips:SetJustifyH("LEFT")
subtitleTips:SetJustifyV("TOP")
subtitleTips:SetText(DVD.L["TIPS_SUBTITLE"])
subtitleTips:SetTextColor(0.82, 0.82, 0.82, 1)

local yTips = Sizing.TipsStartY

-------------------------------------------------
-- Tips content
--
-- The Settings canvas does not always have its
-- final width while this file is first loading.
-- Create everything now, then calculate vertical
-- positions after the panel has been laid out.
-------------------------------------------------

local tipSections = {}
local LayoutTipSections -- forward declaration so CreateTipSection's click handler can call it

local function CreateTipSection(headerText, bodyText, startCollapsed)
    local section = {}
    section.collapsed = startCollapsed or false

    -------------------------------------------------
    -- Header (clickable button with arrow + label)
    -------------------------------------------------
    section.headerButton = CreateFrame("Button", nil, content)
    section.headerButton:SetHeight(20)

    section.arrow = DVD:CreateFontString(section.headerButton, "ARTWORK", "GameFontNormal")
    section.arrow:SetPoint("LEFT", section.headerButton, "LEFT", 0, 0)
    section.arrow:SetTextColor(unpack(C.COLORS.GOLD))
    section.arrow:SetText(section.collapsed and "+" or "-")

    section.header = DVD:CreateFontString(section.headerButton, "ARTWORK", "GameFontNormal")
    section.header:SetPoint("LEFT", section.arrow, "RIGHT", 6, 0)
    section.header:SetJustifyH("LEFT")
    section.header:SetJustifyV("TOP")
    section.header:SetTextColor(unpack(C.COLORS.GOLD))
    section.header:SetText(headerText)

    -------------------------------------------------
    -- Body
    -------------------------------------------------
    section.body = DVD:CreateFontString(content, "ARTWORK", "GameFontHighlight")
    section.body:SetJustifyH("LEFT")
    section.body:SetJustifyV("TOP")
    section.body:SetWordWrap(true)
    section.body:SetNonSpaceWrap(false)
    section.body:SetSpacing(
        Sizing.TipsBodySpacing
    )

    section.body:SetTextColor(
        0.95,
        0.95,
        0.95,
        1
    )

    section.body:SetText(bodyText)
    section.body:SetShown(not section.collapsed)

    section.divider =
        content:CreateTexture(
            nil,
            "ARTWORK"
        )

    section.divider:SetColorTexture(
        1,
        0.82,
        0,
        0.18
    )

    -------------------------------------------------
    -- Toggle behavior
    -------------------------------------------------
    section.headerButton:SetScript("OnClick", function()
        section.collapsed = not section.collapsed
        section.arrow:SetText(section.collapsed and "+" or "-")
        section.body:SetShown(not section.collapsed)
        if LayoutTipSections then
            LayoutTipSections()
        end
    end)

    section.headerButton:SetScript("OnEnter", function()
        section.header:SetTextColor(1, 1, 1)
    end)

    section.headerButton:SetScript("OnLeave", function()
        section.header:SetTextColor(unpack(C.COLORS.GOLD))
    end)

    tipSections[#tipSections + 1] =
        section

    return section
end

-------------------------------------------------
-- Content
-------------------------------------------------

CreateTipSection(
    DVD.L["TIP_WOWHEAD_LINKS"],
    DVD.L["TIP_WOWHEAD_LINKS_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_ACHIEVEMENT_DECOR"],
    DVD.L["TIP_ACHIEVEMENT_DECOR_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_ENDEAVOR_VENDORS"],
    DVD.L["TIP_ENDEAVOR_VENDORS_BODY"], true
) 

CreateTipSection(
    DVD.L["TIP_ACTIVE_INACTIVE"],
    DVD.L["TIP_ACTIVE_INACTIVE_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_GALLERY_BROWSER"],
    DVD.L["TIP_GALLERY_BROWSER_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_PROFESSION_DECOR"],
    DVD.L["TIP_PROFESSION_DECOR_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_BOSS_DROPS"],
    DVD.L["TIP_BOSS_DROPS_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_VENDOR_DECOR"],
    DVD.L["TIP_VENDOR_DECOR_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_PREVIEW_ON_CLICK"],
    DVD.L["TIP_PREVIEW_ON_CLICK_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_MERCHANT_CHECKMARKS"],
    DVD.L["TIP_MERCHANT_CHECKMARKS_BODY"], true
)

CreateTipSection(
    DVD.L["TIP_LEGEND"],
    DVD.L["TIP_LEGEND_BODY"], true
)

-------------------------------------------------
-- Dynamic layout
-------------------------------------------------

LayoutTipSections = function()
local contentWidth =
    tonumber(
        scrollFrame:GetWidth()
    )
    or 0

if contentWidth < 100 then
    return
end

-------------------------------------------------
-- The scroll child must have an explicit width
-- before wrapped text can be measured correctly.
-------------------------------------------------

content:SetWidth(contentWidth)

    local headerWidth =
        math.max(
            1,
            contentWidth
                - Sizing.TipsHeaderLeftInset
                - Sizing.TipsRightInset
        )

    local bodyWidth =
        math.max(
            1,
            contentWidth
                - Sizing.TipsBodyLeftInset
                - Sizing.TipsBodyRightInset
        )

    local dividerWidth =
        math.max(
            1,
            contentWidth
                - Sizing.TipsHeaderLeftInset
                - Sizing.TipsRightInset
        )

    local yTips =
        Sizing.TipsStartY

    for _, section in ipairs(tipSections) do
        -------------------------------------------------
        -- Header button
        -------------------------------------------------

        section.headerButton:ClearAllPoints()
        section.headerButton:SetWidth(headerWidth)

        section.headerButton:SetPoint(
            "TOPLEFT",
            content,
            "TOPLEFT",
            Sizing.TipsHeaderLeftInset,
            yTips
        )

        local headerHeight =
            math.max(
                section.header:GetStringHeight(),
                14
            )

        yTips =
            yTips
            - headerHeight
            - Sizing.TipsHeaderBottomGap

        -------------------------------------------------
        -- Body (only takes space when expanded)
        -------------------------------------------------

        if not section.collapsed then
            section.body:ClearAllPoints()
            section.body:SetWidth(bodyWidth)

            section.body:SetPoint(
                "TOPLEFT",
                content,
                "TOPLEFT",
                Sizing.TipsBodyLeftInset,
                yTips
            )

            local bodyHeight =
                math.max(
                    section.body:GetStringHeight(),
                    14
                )

            yTips =
                yTips
                - bodyHeight
                - Sizing.TipsSectionBottomGap
        else
            yTips =
                yTips
                - Sizing.TipsSectionBottomGap
        end

        -------------------------------------------------
        -- Divider
        -------------------------------------------------

        section.divider:ClearAllPoints()
        section.divider:SetWidth(dividerWidth)
        section.divider:SetHeight(
            Sizing.TipsDividerHeight
        )

        section.divider:SetPoint(
            "TOPLEFT",
            content,
            "TOPLEFT",
            Sizing.TipsHeaderLeftInset,
            yTips
        )

        yTips =
            yTips
            - Sizing.TipsDividerHeight
            - Sizing.TipsDividerGap
    end

    -------------------------------------------------
    -- Expand the scroll child to fit all sections.
    -------------------------------------------------

    local requiredHeight =
        math.max(
            tonumber(scrollFrame:GetHeight()) or 1,
            -yTips + Sizing.TipsPanelInset
        )

    content:SetHeight(requiredHeight)

    if scrollFrame.UpdateScrollChildRect then
        scrollFrame:UpdateScrollChildRect()
    end

    -------------------------------------------------
    -- Keep the scrollbar at a valid position after
    -- the Settings window changes size.
    -------------------------------------------------

    local maximumScroll =
        math.max(
            0,
            scrollFrame:GetVerticalScrollRange()
        )

    if scrollFrame:GetVerticalScroll()
        > maximumScroll then
        scrollFrame:SetVerticalScroll(
            maximumScroll
        )
    end
end

-------------------------------------------------
-- Recalculate after the Settings panel receives
-- its actual width.
-------------------------------------------------

local layoutPending = false

local function QueueTipLayout()
    if layoutPending then
        return
    end

    layoutPending = true

    C_Timer.After(0, function()
        layoutPending = false
        LayoutTipSections()
    end)
end

tipsFrame:SetScript(
    "OnShow",
    QueueTipLayout
)

scrollFrame:SetScript(
    "OnSizeChanged",
    QueueTipLayout
)

QueueTipLayout()

local tipsCategory = Settings.RegisterCanvasLayoutSubcategory(
    rootCategory,
    tipsFrame,
    DVD.L["HELPFUL_INFORMATION"]
)
Settings.RegisterAddOnCategory(tipsCategory)

    -------------------------------------------------
    -- Support Subcategory
    -------------------------------------------------
    local supportFrame = CreateFrame("Frame")
    supportFrame.name = DVD.L["DONATIONS"]
    supportFrame.parent = "Decor Vendor"

    local titleSupport = DVD:CreateFontString(supportFrame, "ARTWORK", "GameFontNormalLarge")
    titleSupport:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    titleSupport:SetText(DVD.L["SUPPORT_TITLE"])

    local ySupport = Sizing.SupportStartY

    local function AddText(text, spacingVal)
        local fs = DVD:CreateFontString(supportFrame, "ARTWORK", "GameFontHighlight")
        fs:SetPoint("TOPLEFT", Sizing.PageInset, ySupport)
        fs:SetWidth(Sizing.SupportTextWidth)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")
        fs:SetText(text)
        ySupport = ySupport - (fs:GetStringHeight() + (spacingVal or Sizing.SupportDefaultSpacing))
    end

    AddText(DVD.L["SUPPORT_INTRO"], 20)

    AddText("|cff999999" .. DVD.L["TIP"] .. ": " .. DVD.L["SUPPORT_TIP_COPY_BODY"] .. "|r", 15)
    AddText("|cffFFD200" .. DVD.L["PREFERRED_SUPPORT"] .. "|r", 10)

    local function CreateURLBox(parent, anchor, url)
        local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
        box:SetSize(Sizing.URLBoxWidth, Sizing.URLBoxHeight)
        box:SetPoint("LEFT", anchor, "RIGHT", Sizing.URLBoxGap, 0)
        box:SetAutoFocus(false)
        box:SetText(url)
        box:SetCursorPosition(0)

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

        box:SetScript("OnMouseUp", function(self)
            self:HighlightText()
        end)

        box:SetScript("OnEditFocusGained", function(self)
            self:HighlightText()
        end)

        box:EnableMouse(true)
        box:Disable()
        box:Enable()

        return box
    end

    local function AddSupportLink(parent, labelText, url, yPos)
        local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
        btn:SetSize(Sizing.SupportButtonWidth, Sizing.SupportButtonHeight)
        btn:SetPoint("TOPLEFT", Sizing.PageInset, yPos)
        btn:SetText(labelText)

        local box = CreateURLBox(parent, btn, url)

        btn:SetScript("OnClick", function()
            box:SetFocus()
            box:HighlightText()
        end)

        return yPos - Sizing.SupportRowGap
    end

    ySupport = AddSupportLink(
        supportFrame,
        DVD.L["PAYPAL_PREFERRED"],
        "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=lizbella123@gmail.com&currency_code=USD&item_name=Decor+Vendor",
        ySupport
    )

    AddText(DVD.L["PAYPAL_FALLBACK_NOTE"], 5)

    ySupport = AddSupportLink(
        supportFrame,
        DVD.L["PAYPAL_ME_FALLBACK"],
        "https://paypal.me/midnitedestiny",
        ySupport
    )

    AddText("|cffFFD200" .. DVD.L["THANK_YOU"] .. "|r", 10)
    AddText(DVD.L["THANK_YOU_BODY"], 15)
    AddText("|cffFFD200" .. DVD.L["CONTACT_ME"] .. "|r", 10)
    AddText(DVD.L["CONTACT_BODY"], 10)
    AddText("|cffFFD200" .. DVD.L["CURSEFORGE_PAGE"] .. "|r", 10)

    ySupport = AddSupportLink(
        supportFrame,
        DVD.L["CURSEFORGE"],
        "https://www.curseforge.com/wow/addons/decor-vendor",
        ySupport
    )

    AddText(DVD.L["SUPPORT_CLOSING"], 20)

    -- BOX
    local supportBox = CreateFrame("Frame", nil, supportFrame, "BackdropTemplate")
    supportBox:SetSize(Sizing.SupportBoxWidth, Sizing.SupportBoxHeight)
    supportBox:SetPoint("BOTTOM", supportFrame, "BOTTOM", Sizing.SupportBoxOffsetX, Sizing.SupportBoxBottomOffset)
    supportBox:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    supportBox:SetBackdropColor(0.05, 0.05, 0.08, 0.9)
    supportBox:SetBackdropBorderColor(0.4, 0.3, 0.6, 1)

    -- TEXT
    local textSupporters = DVD:CreateFontString(supportBox, "OVERLAY", "GameFontNormalSmall")
    textSupporters:SetPoint("TOP", supportBox, "TOP", 0, -6)
    textSupporters:SetText("|cffc89bff" .. DVD.L["SUPPORTERS"] .. "|r\n\nAmy G.\nKim R.\nDanya O.\nIstvan K.\nDavid B.\nKym C.")
    textSupporters:SetJustifyH("CENTER")

    -- =========================
    -- LEFT HEART
    -- =========================
    local leftHeart = CreateFrame("Frame", nil, supportFrame)
    leftHeart:SetSize(Sizing.HeartSize, Sizing.HeartSize)
    leftHeart:SetPoint("RIGHT", supportBox, "LEFT", -Sizing.HeartGap, Sizing.HeartOffsetY)

    local leftShadow = leftHeart:CreateTexture(nil, "BACKGROUND")
    leftShadow:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\heart")
    leftShadow:SetAllPoints()
    leftShadow:SetPoint("CENTER", 1, -1)
    leftShadow:SetVertexColor(0, 0, 0, 1)

    local leftIcon = leftHeart:CreateTexture(nil, "ARTWORK")
    leftIcon:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\heart")
    leftIcon:SetVertexColor(0.2, 0.6, 1)
    leftIcon:SetAllPoints()

    -- =========================
    -- RIGHT HEART
    -- =========================
    local rightHeart = CreateFrame("Frame", nil, supportFrame)
    rightHeart:SetSize(Sizing.HeartSize, Sizing.HeartSize)
    rightHeart:SetPoint("LEFT", supportBox, "RIGHT", Sizing.HeartGap, Sizing.HeartOffsetY)

    local rightShadow = rightHeart:CreateTexture(nil, "BACKGROUND")
    rightShadow:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\heart")
    rightShadow:SetAllPoints()
    rightShadow:SetPoint("CENTER", 1, -1)
    rightShadow:SetVertexColor(0, 0, 0, 1)

    local rightIcon = rightHeart:CreateTexture(nil, "ARTWORK")
    rightIcon:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\heart")
    rightIcon:SetVertexColor(0.2, 0.6, 1)
    rightIcon:SetAllPoints()

    local supportCategory = Settings.RegisterCanvasLayoutSubcategory(
        rootCategory,
        supportFrame,
        DVD.L["DONATIONS"]
    )
    Settings.RegisterAddOnCategory(supportCategory)

    -------------------------------------------------
    -- About Subcategory
    -------------------------------------------------
    local aboutFrame = CreateFrame("Frame")
    aboutFrame.name = DVD.L["ABOUT"]
    aboutFrame.parent = "Decor Vendor"

    local titleAbout = DVD:CreateFontString(aboutFrame, "ARTWORK", "GameFontNormalLarge")
    titleAbout:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    titleAbout:SetTextColor(unpack(C.COLORS.GOLD))
    titleAbout:SetText(DVD.L["ADDON_TITLE"])

    local descAbout = DVD:CreateFontString(aboutFrame, "ARTWORK", "GameFontHighlight")
    descAbout:SetWidth(Sizing.AboutTextWidth)
    descAbout:SetPoint("TOPLEFT", Sizing.PageInset, Sizing.AboutDescriptionY)
    descAbout:SetJustifyH("LEFT")
    descAbout:SetJustifyV("TOP")
	descAbout:SetText(DVD.L["ABOUT_DESC"])

    local artAbout = aboutFrame:CreateTexture(nil, "ARTWORK")
    artAbout:SetSize(Sizing.AboutArtSize, Sizing.AboutArtSize)
    artAbout:SetPoint("TOPLEFT", Sizing.PageInset, Sizing.AboutArtY)
    artAbout:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\cutie")

    local footerAbout = DVD:CreateFontString(aboutFrame, "ARTWORK", "GameFontNormal")
    footerAbout:SetPoint("TOP", artAbout, "BOTTOM", 0, -Sizing.AboutFooterGap)
    footerAbout:SetWidth(Sizing.AboutFooterWidth)
    footerAbout:SetJustifyH("CENTER")
    footerAbout:SetText(
        "|cffffdd00" .. DVD.L["ADDON_TITLE"] .. "|r • " .. DVD.L["DEVELOPED_BY"] .. " |cff00aaffMidniteDestiny|r\n" ..
        "|cffffffff" .. DVD.L["ABOUT_FOOTER"] .. "|r"
    )

    local aboutCategory = Settings.RegisterCanvasLayoutSubcategory(
        rootCategory,
        aboutFrame,
        DVD.L["ABOUT"]
    )
    Settings.RegisterAddOnCategory(aboutCategory)
end

function CreateOptionsPanel()
    return DVD.CreateOptionsPanel()
end
end)(...);
