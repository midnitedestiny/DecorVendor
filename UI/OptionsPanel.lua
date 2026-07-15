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
local frame = DVD.frame
local LibDBIcon = LibStub("LibDBIcon-1.0", true)

if not C then
    print("|cffff4040DecorVendor OptionsPanel:|r constants are missing.")
    return
end

if not frame then
    print("|cffff4040DecorVendor OptionsPanel:|r DVD.frame is missing. Make sure UI\\MainFrame.lua loads first.")
    return
end

function DVD.CreateOptionsPanel()
    local configFrame = CreateFrame("Frame", "DV_ConfigFrame", UIParent)
    configFrame.name = "Decor Vendor"

    local title = configFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Decor Vendor Settings")
    title:SetTextColor(unpack(C.COLORS.GOLD))

    local yOffset = -60
    local spacing = 24

    local displayHeader = configFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    displayHeader:SetPoint("TOPLEFT", 16, yOffset)
    displayHeader:SetText("Display")
    displayHeader:SetTextColor(unpack(C.COLORS.GOLD))

    yOffset = yOffset - 30

    local minimapCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    minimapCheck:SetPoint("TOPLEFT", 16, yOffset)
    minimapCheck.Text:SetFontObject(GameFontHighlight)
    minimapCheck.Text:SetText("Controls the Minimap Button")
    minimapCheck:SetChecked(vendorSettings.showMinimapButton)
    minimapCheck:SetScript("OnClick", function(self)
        local show = self:GetChecked()
        vendorSettings.showMinimapButton = show
        dbDV.minimap.hide = not show

        if LibDBIcon then
            if show then
                LibDBIcon:Show("DecorVendor")
            else
                LibDBIcon:Hide("DecorVendor")
            end
        end
    end)

    yOffset = yOffset - spacing

    local escCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    escCheck:SetPoint("TOPLEFT", 16, yOffset)
    escCheck.Text:SetFontObject(GameFontHighlight)
    escCheck.Text:SetText("Close Main Frame upon hitting Escape Key")
    escCheck:SetChecked(vendorSettings.closeOnEsc)
    escCheck:SetScript("OnClick", function(self)
        vendorSettings.closeOnEsc = self:GetChecked()
        if DVD.UpdateEscBehavior then
            DVD.UpdateEscBehavior()
        elseif UpdateEscBehavior then
            UpdateEscBehavior()
        end
    end)

    yOffset = yOffset - spacing

    local markFoundCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    markFoundCheck:SetPoint("TOPLEFT", 16, yOffset)
    markFoundCheck.Text:SetFontObject(GameFontHighlight)
    markFoundCheck.Text:SetText("Mark Found Vendors upon interaction")
    markFoundCheck:SetChecked(vendorSettings.markFoundVendors)
    markFoundCheck:SetScript("OnClick", function(self)
        vendorSettings.markFoundVendors = self:GetChecked()
        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end)
	
    yOffset = yOffset - spacing
	
    local hideFoundCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    hideFoundCheck:SetPoint("TOPLEFT", 16, yOffset)
    hideFoundCheck.Text:SetFontObject(GameFontHighlight)
    hideFoundCheck.Text:SetText("Hide Found Vendors from map/lists")
    hideFoundCheck:SetChecked(vendorSettings.hideFoundVendors)
    hideFoundCheck:SetScript("OnClick", function(self)
        vendorSettings.hideFoundVendors = self:GetChecked()
        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end)

    yOffset = yOffset - spacing

    local hideCompletedCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    hideCompletedCheck:SetPoint("TOPLEFT", 16, yOffset)
    hideCompletedCheck.Text:SetFontObject(GameFontHighlight)
    hideCompletedCheck.Text:SetText("Hide completed Quests and Achievements")
    hideCompletedCheck:SetChecked(vendorSettings.hideCompletedThings)
    hideCompletedCheck:SetScript("OnClick", function(self)
        vendorSettings.hideCompletedThings = self:GetChecked()
        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end)

    yOffset = yOffset - spacing

    local markCompletedCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    markCompletedCheck:SetPoint("TOPLEFT", 16, yOffset)
    markCompletedCheck.Text:SetFontObject(GameFontHighlight)
    markCompletedCheck.Text:SetText("Mark completed Quests and Achievements")
    markCompletedCheck:SetChecked(vendorSettings.markCompletedThings)
    markCompletedCheck:SetScript("OnClick", function(self)
        vendorSettings.markCompletedThings = self:GetChecked()
        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end)

    yOffset = yOffset - spacing
	
    local hidebosscheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    hidebosscheck:SetPoint("TOPLEFT", 16, yOffset)
    hidebosscheck.Text:SetFontObject(GameFontHighlight)
    hidebosscheck.Text:SetText("Hide completed Boss Drops")
    hidebosscheck:SetChecked(vendorSettings.hideCollectedBossDrops)
    hidebosscheck:SetScript("OnClick", function(self)
        vendorSettings.hideCollectedBossDrops = self:GetChecked()
        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end)

    yOffset = yOffset - spacing

    local waypointButtonCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    waypointButtonCheck:SetPoint("TOPLEFT", 16, yOffset)
    waypointButtonCheck.Text:SetFontObject(GameFontHighlight)
    waypointButtonCheck.Text:SetText("Show the Dedicated Waypoint Button under Vendor Model")
    waypointButtonCheck:SetChecked(vendorSettings.showWaypointButton)
    waypointButtonCheck:SetScript("OnClick", function(self)
        local isChecked = self:GetChecked()
        vendorSettings.showWaypointButton = isChecked
        
        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end

        if DVD.vendorWaypointBtn and DVD.selectedVendor then
            if isChecked and DVD.selectedVendor.mapID then
                DVD.vendorWaypointBtn:Show()
            else
                DVD.vendorWaypointBtn:Hide()
            end
        end
    end)

    yOffset = yOffset - spacing

    local showMerchantCheckmark = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    showMerchantCheckmark:SetPoint("TOPLEFT", 16, yOffset)
    showMerchantCheckmark.Text:SetFontObject(GameFontHighlight)
    showMerchantCheckmark.Text:SetText("Include Merchant Checkmarks on Merchant Frame")
    showMerchantCheckmark:SetChecked(vendorSettings.showMerchantCheckmarks)
    showMerchantCheckmark:SetScript("OnClick", function(self)
        local checked = self:GetChecked()
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
    end)

    yOffset = yOffset - spacing
	
    local vendorCheckmarkOption = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    vendorCheckmarkOption:SetPoint("TOPLEFT", 16, yOffset)
    vendorCheckmarkOption.Text:SetFontObject(GameFontHighlight)
    vendorCheckmarkOption.Text:SetText("Include Vendor Checkmarks when clicking the Vendor Line")
    vendorCheckmarkOption:SetChecked(vendorSettings.showVendorCheckmarks)
    vendorCheckmarkOption:SetScript("OnClick", function(self)
        local isChecked = self:GetChecked()
        vendorSettings.showVendorCheckmarks = isChecked

        for _, container in pairs(DVD.popupIconCache or {}) do
            if container:IsShown() and container.btn and container.btn.isCollected then
                container.checkFrame:SetShown(isChecked)
            end
        end
    end)

    yOffset = yOffset - spacing

    local openAchievementFrameCheckbox = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    openAchievementFrameCheckbox:SetPoint("TOPLEFT", 16, yOffset)
    openAchievementFrameCheckbox.Text:SetFontObject(GameFontHighlight)
    openAchievementFrameCheckbox.Text:SetText("Open Achievement Frame on Click")
    openAchievementFrameCheckbox:SetChecked(vendorSettings.openAchievementFrame)
    openAchievementFrameCheckbox:SetScript("OnClick", function(self)
        local checked = self:GetChecked()
        vendorSettings.openAchievementFrame = checked
    end)

    yOffset = yOffset - 40

    local scaleLabel = configFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    scaleLabel:SetPoint("TOPLEFT", 16, yOffset)
    scaleLabel:SetText("Scale for UI")
    scaleLabel:SetTextColor(unpack(C.COLORS.GOLD))

    yOffset = yOffset - 20

    local scaleSlider = CreateFrame("Slider", nil, configFrame, "MinimalSliderWithSteppersTemplate")
    scaleSlider:SetWidth(400)
    scaleSlider:SetPoint("TOPLEFT", 16, yOffset)
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

    -------------------------------------------------
    -- Footer Text
    -------------------------------------------------
    local footerText = configFrame:CreateFontString(nil, "OVERLAY")
    footerText:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
    footerText:SetPoint("BOTTOM", configFrame, "BOTTOM", 0, 34)
    footerText:SetWidth(760)
    footerText:SetJustifyH("CENTER")
    footerText:SetText(
        "|cffffdd00Decor Vendor|r  •  developed by |cff00aaffMidniteDestiny|r\n" ..
        "|cffffffffYour companion for vendor tracking, decor discovery, and housing collection.|r"
    )

    local rootFrame = CreateFrame("Frame")
    rootFrame.name = "Decor Vendor"

    local rootCategory = Settings.RegisterCanvasLayoutCategory(rootFrame, "Decor Vendor")
    Settings.RegisterAddOnCategory(rootCategory)

    local generalCategory = Settings.RegisterCanvasLayoutSubcategory(
        rootCategory,
        configFrame,
        "General"
    )
    Settings.RegisterAddOnCategory(generalCategory)
    DVD.optionsCategory = generalCategory

    -------------------------------------------------
    -- Events Subcategory
    -------------------------------------------------
    local eventsFrame = CreateFrame("Frame")
    eventsFrame.name = "Events"
    eventsFrame.parent = "Decor Vendor"

    local titleEvents = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titleEvents:SetPoint("TOPLEFT", 16, -16)
    titleEvents:SetText("Event Decor & Promotions")

    local y = -50

    -- =========================
    -- TWITCH DROP EVENT
    -- =========================
    y = y - 10

    local eventHeader = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    eventHeader:SetPoint("TOPLEFT", 16, y)
    --eventHeader:SetText("Current Twitch Drop Event")
	eventHeader:SetText("More Twitch Drops Coming Soon!")
    eventHeader:SetTextColor(unpack(C.COLORS.GOLD))

    y = y - 25

 --[[   local startText = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    startText:SetPoint("TOPLEFT", 16, y)
    startText:SetText("Start Time:")
    startText:SetTextColor(1, 0.82, 0)

    local startValue = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    startValue:SetPoint("LEFT", startText, "RIGHT", 6, 0)
    startValue:SetText("June 16, 10:00 am PDT")
    startValue:SetTextColor(0.3, 1, 0.3)

    y = y - 20

    local endText = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    endText:SetPoint("TOPLEFT", 16, y)
    endText:SetText("End Time:")
    endText:SetTextColor(1, 0.82, 0)

    local endValue = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    endValue:SetPoint("LEFT", endText, "RIGHT", 6, 0)
    endValue:SetText("July 14, 10:00 am PDT")
    endValue:SetTextColor(0.3, 1, 0.3)

    y = y - 30

    local descEvents = eventsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    descEvents:SetPoint("TOPLEFT", 16, y)
    descEvents:SetPoint("TOPRIGHT", -16, y)
    descEvents:SetJustifyH("LEFT")
    descEvents:SetJustifyV("TOP")
    descEvents:SetWordWrap(true)
    descEvents:SetText(
        "Watch |cff00ccff4 hours|r of eligible World of Warcraft content on Twitch while Drops are active " ..
        "to earn the |cff00FF98Cuddly Cotton Candy Grrgle|r housing decor item."
    )]]

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
-- Background / Content Panel
-------------------------------------------------
local content = CreateFrame("Frame", nil, tipsFrame, "BackdropTemplate")
content:SetPoint("TOPLEFT", 10, -10)
content:SetPoint("BOTTOMRIGHT", -10, 10)

content:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
})
content:SetBackdropColor(0.05, 0.05, 0.08, 0.55)
content:SetBackdropBorderColor(0.35, 0.25, 0.50, 0.8)

-------------------------------------------------
-- Title
-------------------------------------------------
local titleTips = content:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
titleTips:SetPoint("TOPLEFT", 18, -16)
titleTips:SetText("Tips & Helpful Info")
titleTips:SetTextColor(1, 0.82, 0, 1)

local subtitleTips = content:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
subtitleTips:SetPoint("TOPLEFT", titleTips, "BOTTOMLEFT", 0, -6)
subtitleTips:SetPoint("TOPRIGHT", content, "TOPRIGHT", -18, -22)
subtitleTips:SetJustifyH("LEFT")
subtitleTips:SetJustifyV("TOP")
subtitleTips:SetText("Quick notes for how Decor Vendor and the Gallery Browser behave.")
subtitleTips:SetTextColor(0.82, 0.82, 0.82, 1)

local yTips = -62

-------------------------------------------------
-- Helpers
-------------------------------------------------
local function AddDivider()
    local line = content:CreateTexture(nil, "ARTWORK")
    line:SetColorTexture(1, 0.82, 0, 0.18)
    line:SetPoint("TOPLEFT", content, "TOPLEFT", 18, yTips)
    line:SetPoint("TOPRIGHT", content, "TOPRIGHT", -18, yTips)
    line:SetHeight(1)
    yTips = yTips - 10
end

local function AddSection(headerText, bodyText)
    local header = content:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    header:SetPoint("TOPLEFT", content, "TOPLEFT", 18, yTips)
    header:SetPoint("TOPRIGHT", content, "TOPRIGHT", -18, yTips)
    header:SetJustifyH("LEFT")
    header:SetTextColor(unpack(C.COLORS.GOLD))
    header:SetText(headerText)

    yTips = yTips - (header:GetStringHeight() + 6)

    local body = content:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    body:SetPoint("TOPLEFT", content, "TOPLEFT", 24, yTips)
    body:SetPoint("TOPRIGHT", content, "TOPRIGHT", -18, yTips)
    body:SetJustifyH("LEFT")
    body:SetJustifyV("TOP")
    body:SetWordWrap(true)
    body:SetSpacing(3)
    body:SetTextColor(0.95, 0.95, 0.95, 1)
    body:SetText(bodyText)

    yTips = yTips - (body:GetStringHeight() + 16)

    AddDivider()
end

-------------------------------------------------
-- Content
-------------------------------------------------
AddSection(
    "Wowhead Links",
    "Left-clicking achievements or quests now places the Wowhead link directly under the decor preview instead of inline in the source text."
)

AddSection(
    "Achievement Decor",
    "For the most accurate achievement progress, log into both factions at least once so the addon can verify faction-specific completion properly."
)

AddSection(
    "Stats Panel",
    "After a fresh install or after clearing saved variables, open the Gallery and the in-game Housing Catalog once so collection counts can finish syncing correctly."
)

AddSection(
    "Gallery Browser",
    "On the first load of a game session, the browser may take up to a minute to pull Housing Catalog data. This is normal."
)

AddSection(
    "Profession Decor",
    "Left-click opens the decor preview and the reagents window below it. Recipe progress is tracked per character, while learned decor ownership is tracked warband-wide."
)

AddSection(
    "Boss Drops",
    "Left-click opens the decor preview. Right-click opens the map or pins locations for supported rares, bosses, and event drops."
)

AddSection(
    "Vendor Decor",
    "Left-click opens the vendor preview with the vendor's items shown below. Left-clicking an item opens its Housing Catalog entry."
)

AddSection(
    "Legend",
    "|cffff2020Red|r = Horde  •  |cff4faaffBlue|r = Alliance  •  |cff00ff00Green|r = Neutral\n" ..
    "|cff9d9d9dGrey line|r = Found Vendor, Completed Quest, or Completed Achievement"
)

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
    supportFrame.name = "Support"
    supportFrame.parent = "Decor Vendor"

    local titleSupport = supportFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titleSupport:SetPoint("TOPLEFT", 16, -16)
    titleSupport:SetText("Support Decor Vendor")

    local ySupport = -50

    local function AddText(text, spacingVal)
        local fs = supportFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        fs:SetPoint("TOPLEFT", 16, ySupport)
        fs:SetWidth(800)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")
        fs:SetText(text)
        ySupport = ySupport - (fs:GetStringHeight() + (spacingVal or 20))
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
        box:SetSize(260, 24)
        box:SetPoint("LEFT", anchor, "RIGHT", 6, 0)
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
        btn:SetSize(180, 26)
        btn:SetPoint("TOPLEFT", 16, yPos)
        btn:SetText(labelText)

        local box = CreateURLBox(parent, btn, url)

        btn:SetScript("OnClick", function()
            box:SetFocus()
            box:HighlightText()
        end)

        return yPos - 40
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
    supportBox:SetSize(100, 80)
    supportBox:SetPoint("BOTTOM", supportFrame, "BOTTOM", -120, 40)
    supportBox:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    supportBox:SetBackdropColor(0.05, 0.05, 0.08, 0.9)
    supportBox:SetBackdropBorderColor(0.4, 0.3, 0.6, 1)

    -- TEXT
    local textSupporters = supportBox:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    textSupporters:SetPoint("TOP", supportBox, "TOP", 0, -6)
    textSupporters:SetText("|cffc89bffSupporters|r\n\nAmy G.\nKim R.\nDanya O.\nIstvan K.\nDavid B.")
    textSupporters:SetJustifyH("CENTER")

    -- =========================
    -- LEFT HEART
    -- =========================
    local leftHeart = CreateFrame("Frame", nil, supportFrame)
    leftHeart:SetSize(24, 24)
    leftHeart:SetPoint("RIGHT", supportBox, "LEFT", -8, -2)

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
    rightHeart:SetSize(24, 24)
    rightHeart:SetPoint("LEFT", supportBox, "RIGHT", 8, -2)

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
        "Support"
    )
    Settings.RegisterAddOnCategory(supportCategory)

    -------------------------------------------------
    -- About Subcategory
    -------------------------------------------------
    local aboutFrame = CreateFrame("Frame")
    aboutFrame.name = "About"
    aboutFrame.parent = "Decor Vendor"

    local titleAbout = aboutFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titleAbout:SetPoint("TOPLEFT", 16, -16)
    titleAbout:SetTextColor(unpack(C.COLORS.GOLD))
    titleAbout:SetText("Decor Vendor")

    local descAbout = aboutFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    descAbout:SetWidth(800)
    descAbout:SetPoint("TOPLEFT", 16, -50)
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
    artAbout:SetSize(280, 280)
    artAbout:SetPoint("TOPLEFT", 16, -270)
    artAbout:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\cutie")

    local footerAbout = aboutFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    footerAbout:SetPoint("TOP", artAbout, "BOTTOM", 0, -20)
    footerAbout:SetWidth(800)
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