local addonName, dv = ...

function dv.CreateOptionsPanel()
    if dv.optionsCategory then return end  -- prevent double registration

    local configFrame = CreateFrame("Frame", "DV_ConfigFrame", UIParent)
    configFrame.name = "Decor Vendor"

    local configTitle = configFrame:CreateFontString(nil, "ARTWORK")
    configTitle:SetFont(STANDARD_TEXT_FONT, 16)
    configTitle:SetPoint("TOPLEFT", 16, -16)
    configTitle:SetText("Decor Vendor Settings")

    local escCheck = CreateFrame("CheckButton", nil, configFrame, "UICheckButtonTemplate")
	escCheck.Text:SetFont(STANDARD_TEXT_FONT, 16)
    escCheck:SetPoint("TOPLEFT", configTitle, "BOTTOMLEFT", 0, -20)
    escCheck.Text:SetText("Esc to Close Decor Vendor")
    escCheck:SetChecked(vendorSettings.closeOnEsc)

    escCheck:SetScript("OnClick", function(self)
        vendorSettings.closeOnEsc = self:GetChecked()
        dv.UpdateEscBehavior()
    end)

    -- ✅ NEW SETTINGS API ONLY
    local category = Settings.RegisterCanvasLayoutCategory(configFrame, "Decor Vendor")
    Settings.RegisterAddOnCategory(category)

    dv.optionsCategory = category
end

