local addonName, dv = ...

function dv.CreateOptionsPanel()
    local configFrame = CreateFrame("Frame", "DV_ConfigFrame", UIParent)
    configFrame.name = "Decor Vendor"

    local configTitle = configFrame:CreateFontString(nil, "ARTWORK")
    configTitle:SetFont(STANDARD_TEXT_FONT, 16)
    configTitle:SetPoint("TOPLEFT", 16, -16)
    configTitle:SetText("Decor Vendor Settings")

    local escCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
    escCheck:SetPoint("TOPLEFT", configTitle, "BOTTOMLEFT", 0, -20)
    escCheck.Text:SetFont(STANDARD_TEXT_FONT, 14)
    escCheck.Text:SetTextColor(1, 0.82, 0)
    escCheck.Text:SetText(" Esc to Close Decor Vendor")

    escCheck:SetChecked(dv.vendorSettings.closeOnEsc)
    escCheck:SetScript("OnClick", function(self)
        dv.vendorSettings.closeOnEsc = self:GetChecked()
        dv.UpdateEscBehavior()
    end)

    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(configFrame, "Decor Vendor")
        Settings.RegisterAddOnCategory(category)
    else
        InterfaceOptions_AddCategory(configFrame)
    end
end
