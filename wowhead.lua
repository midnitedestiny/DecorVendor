local addonName, dv = ...

-- ===============================
-- Wowhead Link Popup
-- ===============================

dv.wowheadPopup = CreateFrame("Frame", "DV_WowheadLinkFrame", UIParent, "BackdropTemplate")
local popup = dv.wowheadPopup
popup:SetSize(350, 90)
popup:SetFrameStrata("DIALOG")
popup:SetBackdrop({
    bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile     = true, tileSize = 32, edgeSize = 32,
    insets   = { left = 8, right = 8, top = 8, bottom = 8 }
})
popup:SetBackdropColor(0.1, 0.1, 0.1, 1)
popup:SetPoint("CENTER")
popup:EnableMouse(true)
popup:SetMovable(true)
popup:RegisterForDrag("LeftButton")
popup:SetScript("OnDragStart", popup.StartMoving)
popup:SetScript("OnDragStop", popup.StopMovingOrSizing)
popup:Hide()

-- Title
popup.title = popup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
popup.title:SetPoint("TOP", 0, -14)
popup.title:SetText("Ctrl + C to copy")
popup.title:SetTextColor(1, 0.82, 0)

-- EditBox
popup.editBox = CreateFrame("EditBox", nil, popup, "InputBoxTemplate")
popup.editBox:SetSize(300, 20)
popup.editBox:SetPoint("CENTER", 0, -5)
popup.editBox:SetAutoFocus(false)
popup.editBox:SetScript("OnEscapePressed", function() popup:Hide() end)

-- Close Button
popup.closeBtn = CreateFrame("Button", nil, popup, "UIPanelCloseButton")
popup.closeBtn:SetPoint("TOPRIGHT", 2, 2)
popup.closeBtn:SetSize(30, 30)
popup.closeBtn:SetScript("OnClick", function() popup:Hide() end)

-- Function to show a Wowhead link
function dv:ShowWowheadLink(id, rewardType)
    local url
    if rewardType == "quest" then url = "https://www.wowhead.com/quest=" .. tostring(id)
  elseif rewardType == "item" then url = "https://www.wowhead.com/item=" .. tostring(id)
  else url = "https://www.wowhead.com/achievement=" .. tostring(id) end

    popup.editBox:SetText(url)
    popup:SetPoint("CENTER", UIParent, "CENTER")
    popup:Show()
    popup.editBox:SetFocus()
    popup.editBox:HighlightText()
end

-- Hide popup when main frames are hidden
if frame then
    frame:SetScript("OnHide", function()
        if popup:IsShown() then popup:Hide() end
        if supportFrame and supportFrame:IsShown() then supportFrame:Hide() end
        if dv.vendorPopup and dv.vendorPopup:IsShown() then dv.vendorPopup:Hide() end
    end)
end
