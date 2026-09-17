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
    bg:SetColorTexture(0.10, 0.065, 0.17, 0.82)
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
    accent:SetColorTexture(0.75, 0.50, 1.00, 0.45)
    header.accent = accent

    -------------------------------------------------
    -- Collapse icon
    -------------------------------------------------
    local icon = header:CreateFontString(nil, "OVERLAY")
    icon:SetFont(STANDARD_TEXT_FONT, HeaderSizing.CollapseIconFontSize, "OUTLINE")

    icon:SetPoint("LEFT", header, "LEFT", HeaderSizing.CollapseIconLeftInset, 0)
    icon:SetText(collapsed and "+" or "-")
    icon:SetTextColor(0.92, 0.86, 1.00)
    header.icon = icon

    -------------------------------------------------
    -- Progress
    -------------------------------------------------
    local progress = header:CreateFontString(nil, "OVERLAY")
    progress:SetFont(STANDARD_TEXT_FONT, HeaderSizing.ProgressFontSize, "OUTLINE")

    progress:SetPoint("RIGHT", header, "RIGHT", -HeaderSizing.ProgressRightInset, 0)
    progress:SetJustifyH("RIGHT")

    local progressLabel = tostring(options.progressLabel or "completed")
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
    text:SetTextColor(0.95, 0.92, 1.00)
    text:SetNonSpaceWrap(false)
    text:SetWordWrap(false)
    header.text = text

    -------------------------------------------------
    -- Hover
    -------------------------------------------------
    header:SetScript(
        "OnEnter",
        function(self)
            self.bg:SetColorTexture(0.16, 0.10, 0.26, 0.95)
            self.accent:SetColorTexture(1.00, 0.78, 0.28, 0.80)
        end
    )

    header:SetScript(
        "OnLeave",
        function(self)
            self.bg:SetColorTexture(0.10, 0.065, 0.17, 0.82)
            self.accent:SetColorTexture(0.75, 0.50, 1.00, 0.45)
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

    local backgroundColor = options.backgroundColor or {0.12, 0.08, 0.18, 0.85}
    local borderColor = options.borderColor or {0.25, 0.20, 0.35, 0.60}

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
    iconBorder:SetBackdropBorderColor(0.35, 0.30, 0.50, 0.60)

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
