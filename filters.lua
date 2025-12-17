local addonName, dv = ...

-- ===============================
-- State
-- ===============================
dv.currentTab = dv.currentTab or "vendors"

selectedExpansions  = selectedExpansions  or { All = true }
selectedProfessions = selectedProfessions or { All = true }
selectedFactions    = selectedFactions    or { All = true }

-- ===============================
-- Create Filter Dropdown (ONCE)
-- ===============================
function dv.CreateFilterDropdown(parentFrame)
    if dv.filterButton then return end

    local filterButton = CreateFrame(
        "DropdownButton",
        "DV_FilterButton",
        parentFrame,
        "WowStyle1FilterDropdownTemplate"
    )

    filterButton:SetSize(140, 24)
    filterButton:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 10, -60)
    filterButton:SetText("The Choices")

    filterButton.Text:ClearAllPoints()
    filterButton.Text:SetPoint("CENTER")

    filterButton:SetFrameStrata("DIALOG")
    filterButton:SetFrameLevel(parentFrame:GetFrameLevel() + 10)

    filterButton:SetupMenu(function(_, root)
        dv.BuildFilterMenu(root)
    end)

    filterButton:Show()
    dv.filterButton = filterButton

    dv.CreateMinimapCheckbox(parentFrame)
end

-- ===============================
-- Build Filter Menu (TAB AWARE)
-- ===============================
function dv.BuildFilterMenu(root)

    -------------------------------------------------
    -- VENDORS TAB
    -------------------------------------------------
    if dv.currentTab == "vendors" then

        root:CreateCheckbox(
            "Hide Found Vendors",
            function() return vendorSettings.hideCompleted end,
            function()
                vendorSettings.hideCompleted = not vendorSettings.hideCompleted
                BuildVendorUI()
            end
        )
		root:CreateDivider()
		root:CreateButton("Reset Found Vendors", function()
                vendorSettings.visited = {}
                BuildVendorUI()
            end)

        root:CreateDivider()

        -- Expansions
        local expMenu = root:CreateButton("Expansions")

        expMenu:CreateCheckbox("All",
            function() return selectedExpansions.All end,
            function()
                selectedExpansions = { All = true }
                BuildVendorUI()
            end
        )

        local seen = {}
        for _, group in ipairs(dv.npcs or {}) do
            if group.expansion and not seen[group.expansion] then
                seen[group.expansion] = true

                expMenu:CreateCheckbox(group.expansion,
                    function() return selectedExpansions[group.expansion] end,
                    function()
                        selectedExpansions[group.expansion] =
                            not selectedExpansions[group.expansion]
                        selectedExpansions.All = false
                        BuildVendorUI()
                    end
                )
            end
        end

        root:CreateDivider()

        -- Faction
        local factionMenu = root:CreateButton("Faction")

        factionMenu:CreateCheckbox("All",
            function() return selectedFactions.All end,
            function()
                selectedFactions = { All = true }
                BuildVendorUI()
            end
        )

        for _, f in ipairs({ "alliance", "horde", "neutral" }) do
            factionMenu:CreateCheckbox(f,
                function() return selectedFactions[f] end,
                function()
                    selectedFactions[f] = not selectedFactions[f]
                    selectedFactions.All = false
                    BuildVendorUI()
                end
            )
        end
    end

    -------------------------------------------------
    -- PROFESSIONS TAB
    -------------------------------------------------
    if dv.currentTab == "professions" then
        local profMenu = root:CreateButton("Professions")

        profMenu:CreateCheckbox("All",
            function() return selectedProfessions.All end,
            function()
                wipe(selectedProfessions)
                selectedProfessions.All = true
                BuildProfessionList()
            end
        )

        for _, profession in ipairs(dv.professions or {}) do
            profMenu:CreateCheckbox(profession.name,
                function() return selectedProfessions[profession.name] end,
                function()
                    selectedProfessions[profession.name] =
                        not selectedProfessions[profession.name]
                    selectedProfessions.All = false
                    BuildProfessionList()
                end
            )
        end
    end

    -------------------------------------------------
    -- RESET (ALWAYS PRESENT)
    -------------------------------------------------
    root:CreateDivider()

    root:CreateButton("Reset Filters", function()
        selectedExpansions  = { All = true }
        selectedProfessions = { All = true }
        selectedFactions    = { All = true }

        if dv.currentTab == "vendors" then
            BuildVendorUI()
        else
            BuildProfessionList()
        end
    end)
end

-- ===============================
-- Minimap Checkbox (ONCE)
-- ===============================
function dv.CreateMinimapCheckbox(parentFrame)
    if dv.minimapCheckbox then return end

    local cb = CreateFrame(
        "CheckButton",
        "DV_MinimapCheckbox",
        parentFrame,
        "UICheckButtonTemplate"
    )

    cb:SetPoint("LEFT", dv.filterButton, "RIGHT", 10, 0)
    cb:SetSize(26, 26)

    local label = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", cb, "RIGHT", 2, 0)
    label:SetText("Minimap")

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
