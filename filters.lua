local addonName, dv = ...
dv.filters = {
    expansions = {},   -- empty = all
    factions   = {},   -- empty = all
    professions = {},  -- empty = all
}


function dv.BuildSidebarFilters()
    local parent = dv.sidebar
    if not parent then return end

    -- wipe old UI
    for _, child in ipairs({ parent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local y = -6
    local spacing = 20

    local function Header(text)
        local h = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        h:SetPoint("TOPLEFT", 12, y)
        h:SetText(text)
        h:SetTextColor(1, 0.82, 0)
        y = y - spacing
    end

    local function Checkbox(label, tbl, key)
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 12, y)
        cb.Text:SetText(label)
        cb:SetChecked(tbl[key])

        cb:SetScript("OnClick", function(self)
            tbl[key] = self:GetChecked()
            BuildVendorUI()
        end)

        y = y - spacing
    end

    -- Hide found
    Checkbox("Hide Found Vendors", vendorSettings, "hideCompleted")

    y = y - 6
    Header("Expansions")

    dv.filters.expansions = dv.filters.expansions or {}

    local seen = {}
    for _, g in ipairs(dv.npcs or {}) do
        if g.expansion and not seen[g.expansion] then
            seen[g.expansion] = true
            Checkbox(g.expansion, dv.filters.expansions, g.expansion)
        end
    end

    y = y - 6
    Header("Faction")

    dv.filters.factions = dv.filters.factions or {}
    for _, f in ipairs({ "alliance", "horde", "neutral" }) do
        Checkbox(f, dv.filters.factions, f)
    end
end

function dv.CreateMinimapCheckbox(parentFrame)
    if dv.minimapCheckbox then return end

    local cb = CreateFrame("CheckButton", "DV_MinimapCheckbox", parentFrame, "UICheckButtonTemplate")
    cb:ClearAllPoints()
    cb:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 14, -48)
    cb:SetSize(26, 26)
    cb:SetFrameStrata("DIALOG")
    cb:SetFrameLevel(parentFrame:GetFrameLevel() + 5)

    local label = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", cb, "RIGHT", 4, 1)
    label:SetText("Minimap")
    label:SetTextColor(0.9, 0.8, 1)

    cb:SetChecked(vendorSettings.showMinimapButton)

    cb:SetScript("OnClick", function(self)
        vendorSettings.showMinimapButton = self:GetChecked()

        if LibDBIcon then
            if self:GetChecked() then
                LibDBIcon:Show("DecorVendor")
            else
                LibDBIcon:Hide("DecorVendor")
            end
        end
    end)

    dv.minimapCheckbox = cb
end
