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
    title:SetText("Decor Vendor Settings")
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
        "Show Minimap Button",
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
        "Close on Escape",
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
        "Open Achievement Frame on Click",
        "Automatically opens the Blizzard Achievement UI when clicking an achievement card.",
        function() return vendorSettings.openAchievementFrame end,
        function(checked)
            vendorSettings.openAchievementFrame = checked
        end
    )
    openAchievementFrameCheckbox:SetPoint("TOPLEFT", COL2_X, yOffset)
  

    local customFontCheck = CreateCheckbox(
        configFrame,
        "Use Custom Font",
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
        "Mark Found Vendors",
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
        "Mark Completed Quests/Achievements",
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
        "Hide Completed Boss Drops",
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
        "Hide Found Vendors",
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
        "Hide Completed Quests/Achievements",
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
        "Show Waypoint Button",
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
        "Merchant Frame Checkmarks",
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
        "Vendor Line Checkmarks",
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
        "|cffffdd00Decor Vendor|r  •  developed by |cff00aaffMidniteDestiny|r\n" ..
        "|cffffffffYour companion for vendor tracking, decor discovery, and housing collection.|r"
    )

local rootCategory = Settings.RegisterCanvasLayoutCategory(configFrame, "Decor Vendor")
    Settings.RegisterAddOnCategory(rootCategory)
    DVD.optionsCategory = rootCategory

    -------------------------------------------------
    -- Events Subcategory
    -------------------------------------------------
    local eventsFrame = CreateFrame("Frame")
    eventsFrame.name = "Events"
    eventsFrame.parent = "Decor Vendor"

    local titleEvents = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontNormalLarge")
    titleEvents:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    titleEvents:SetText("Event Decor & Promotions")

    local y = Sizing.EventsStartY

    -- =========================
    -- TWITCH DROP EVENT
    -- =========================
   y = y - Sizing.EventsInitialGap

    local eventHeader = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontNormal")
    eventHeader:SetPoint("TOPLEFT", Sizing.PageInset, y)
    eventHeader:SetText("Current Twitch Drop Event")
	--eventHeader:SetText("More Twitch Drops Coming Soon!")
    eventHeader:SetTextColor(unpack(C.COLORS.GOLD))

    y = y - Sizing.EventsHeaderGap

    local startText = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    startText:SetPoint("TOPLEFT", 16, y)
    startText:SetText("Start Time:")
    startText:SetTextColor(1, 0.82, 0)

    local startValue = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    startValue:SetPoint("LEFT", startText, "RIGHT", 6, 0)
    startValue:SetText("September 12, 9:30 am PDT")
    startValue:SetTextColor(0.3, 1, 0.3)

    y = y - 20

    local endText = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    endText:SetPoint("TOPLEFT", 16, y)
    endText:SetText("End Time:")
    endText:SetTextColor(1, 0.82, 0)

    local endValue = DVD:CreateFontString(eventsFrame, "ARTWORK", "GameFontHighlight")
    endValue:SetPoint("LEFT", endText, "RIGHT", 6, 0)
    endValue:SetText("September 27, 10:00 am PDT")
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
        "to earn the |cff68aef6Cuddly Blue Grrgle|r housing decor item."
    )

    local eventsCategory = Settings.RegisterCanvasLayoutSubcategory(
        rootCategory,
        eventsFrame,
        "Events"
    )
    Settings.RegisterAddOnCategory(eventsCategory)

-------------------------------------------------
-- Tips Subcategory
-------------------------------------------------
local tipsFrame = CreateFrame("Frame")
tipsFrame.name = "Helpful Information"
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
titleTips:SetText("Tips & Helpful Info")
titleTips:SetTextColor(1, 0.82, 0, 1)

local subtitleTips = DVD:CreateFontString(content, "ARTWORK", "GameFontHighlightSmall")
subtitleTips:SetPoint("TOPLEFT", titleTips, "BOTTOMLEFT", 0, -Sizing.TipsSubtitleGap)
subtitleTips:SetPoint("TOPRIGHT", content, "TOPRIGHT", -Sizing.TipsRightInset, -Sizing.TipsSubtitleTopInset)
subtitleTips:SetJustifyH("LEFT")
subtitleTips:SetJustifyV("TOP")
subtitleTips:SetText("Quick notes for how Decor Vendor and the Gallery Browser behave.")
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
    "Wowhead Links",
    "Left-clicking achievements or quests places the Wowhead link directly beneath the decor preview.", true
)

CreateTipSection(
    "Achievement Decor",
    "For the most accurate achievement progress, log into characters from both factions at least once so the addon can verify faction-specific completion.", true
)

CreateTipSection(
    "Housing Endeavor Vendors",
    "Endeavor vendors can appear in either neighborhood, but only the vendor tied to your plot's currently active Neighborhood Endeavor is available. That vendor's card will read |cff30d580Active|r and shows its neighborhood, with the Waypoint button and right-click navigation both enabled. Every other Endeavor vendor's card will read |cffff4c4cInactive|r until their Endeavor becomes the active one.",
    true
) 

CreateTipSection(
    "Active/Inactive",
    "Vendors with waypoints show as Green Active status where as Vendors with no waypoints or if certain endeavors are currently not in your neighborhood will show as inactive", true
)

CreateTipSection(
    "Gallery Browser",
    "The first time the Gallery Browser opens during a game session, it may take up to a minute to retrieve Housing Catalog data. This is normal.", true
)

CreateTipSection(
    "Profession Decor",
    "Left-clicking opens the decor preview and the reagents window beneath it. Recipe progress is tracked per character, while learned decor ownership is tracked warband-wide.", true
)

CreateTipSection(
    "Boss Drops",
    "Left-clicking opens the decor preview. Right-clicking opens the map or pins locations for supported rares, bosses, and event drops.", true
)

CreateTipSection(
    "Vendor Decor",
    "Left-clicking opens the vendor preview with the vendor's items displayed beneath it. Left-clicking an item opens its Housing Catalog entry.", true
)

CreateTipSection(
    "Legend",
    "|cffff2020Red|r = Horde  •  "
        .. "|cff4faaffBlue|r = Alliance  •  "
        .. "|cff00ff00Green|r = Neutral\n"
        .. "|cff9d9d9dGrey line|r = Found Vendor, Completed Quest, or Completed Achievement", true
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
    "Helpful Information"
)
Settings.RegisterAddOnCategory(tipsCategory)

    -------------------------------------------------
    -- Support Subcategory
    -------------------------------------------------
    local supportFrame = CreateFrame("Frame")
    supportFrame.name = "Donations"
    supportFrame.parent = "Decor Vendor"

    local titleSupport = DVD:CreateFontString(supportFrame, "ARTWORK", "GameFontNormalLarge")
    titleSupport:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    titleSupport:SetText("Support Decor Vendor")

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

    AddText(
        "If you enjoy using Decor Vendor and want to support its development,\n" ..
        "all support is optional and deeply appreciated.",
        20
    )

    AddText("|cff999999Tip: Buttons highlight links for copying. Use Ctrl+C to copy.|r", 15)
    AddText("|cffFFD200Preferred Support|r", 10)

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
        "PayPal (Preferred)",
        "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=lizbella123@gmail.com&currency_code=USD&item_name=Decor+Vendor",
        ySupport
    )

    AddText("If the PayPal link above does not work, you can also use:", 5)

    ySupport = AddSupportLink(
        supportFrame,
        "PayPal.me (Fallback)",
        "https://paypal.me/midnitedestiny",
        ySupport
    )

    AddText("|cffFFD200Thank You|r", 10)
    AddText("Thank you to those who have supported me.", 15)
    AddText("|cffFFD200Contact Me|r", 10)
    AddText("If you truly need to reach me please use CurseForge messaging.", 10)
    AddText("|cffFFD200CurseForge Page|r", 10)

    ySupport = AddSupportLink(
        supportFrame,
        "CurseForge",
        "https://www.curseforge.com/wow/addons/decor-vendor",
        ySupport
    )

    AddText(
        "Thank you for supporting the addon!\n" ..
        "Your support helps ongoing updates, fixes, and new features.",
        20
    )

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
    textSupporters:SetText("|cffc89bffSupporters|r\n\nAmy G.\nKim R.\nDanya O.\nIstvan K.\nDavid B.\nKym C.")
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
        "Donations"
    )
    Settings.RegisterAddOnCategory(supportCategory)

    -------------------------------------------------
    -- About Subcategory
    -------------------------------------------------
    local aboutFrame = CreateFrame("Frame")
    aboutFrame.name = "About"
    aboutFrame.parent = "Decor Vendor"

    local titleAbout = DVD:CreateFontString(aboutFrame, "ARTWORK", "GameFontNormalLarge")
    titleAbout:SetPoint("TOPLEFT", Sizing.PageInset, -Sizing.TitleTopOffset)
    titleAbout:SetTextColor(unpack(C.COLORS.GOLD))
    titleAbout:SetText("Decor Vendor")

    local descAbout = DVD:CreateFontString(aboutFrame, "ARTWORK", "GameFontHighlight")
    descAbout:SetWidth(Sizing.AboutTextWidth)
    descAbout:SetPoint("TOPLEFT", Sizing.PageInset, Sizing.AboutDescriptionY)
    descAbout:SetJustifyH("LEFT")
    descAbout:SetJustifyV("TOP")
    descAbout:SetText(
        "Created by MidniteDestiny\n\n" ..
        "Decor Vendor was built out of a love for collecting everything Azeroth has to offer.\n\n" ..
        "What started as a simple idea turned into a full system for tracking vendors, rewards, and hidden treasures .\n\n" ..
        "Inside you'll find:\n" ..
        "• Vendors and where to find them\n" ..
        "• Quest & achievement rewards\n" ..
        "• Boss drop previews\n" ..
        "• Profession unlocks\n" ..
        "• Live 3D previews of decor and NPCs\n\n" ..
        "Everything is designed to be easy to use, accurate, and constantly evolving.\n\n" ..
        "Made by a gamer, for gamers.\n\n"
    )

    local artAbout = aboutFrame:CreateTexture(nil, "ARTWORK")
    artAbout:SetSize(Sizing.AboutArtSize, Sizing.AboutArtSize)
    artAbout:SetPoint("TOPLEFT", Sizing.PageInset, Sizing.AboutArtY)
    artAbout:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\cutie")

    local footerAbout = DVD:CreateFontString(aboutFrame, "ARTWORK", "GameFontNormal")
    footerAbout:SetPoint("TOP", artAbout, "BOTTOM", 0, -Sizing.AboutFooterGap)
    footerAbout:SetWidth(Sizing.AboutFooterWidth)
    footerAbout:SetJustifyH("CENTER")
    footerAbout:SetText(
        "|cffffdd00Decor Vendor|r • developed by |cff00aaffMidniteDestiny|r\n" ..
        "|cffffffffFirst to introduce vendor tracking|r"
    )

    local aboutCategory = Settings.RegisterCanvasLayoutSubcategory(
        rootCategory,
        aboutFrame,
        "About"
    )
    Settings.RegisterAddOnCategory(aboutCategory)
end

function CreateOptionsPanel()
    return DVD.CreateOptionsPanel()
end