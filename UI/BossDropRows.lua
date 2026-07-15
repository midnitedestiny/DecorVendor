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
    print("|cffff4040DecorVendor BossDropRows:|r constants are missing.")
    return
end

-- ============================================================
-- 🛡️ COMPATIBILITY GHOST HEADER (REMOVES ACCORDION SECTIONS SAFELY)
-- ============================================================
function DVD.CreateBossDropHeader(parent, group, collected, total, y)
    local key = "boss_" .. (group.name or "Unknown")
    DVD.collapsedHeaders = DVD.collapsedHeaders or {}
    if DVD.collapsedHeaders[key] == nil then
        DVD.collapsedHeaders[key] = false -- Keep rows streaming out uncollapsed
    end

    -- Return false and y - 1 to make the section dividers completely invisible
    -- while keeping ListBuilders.lua tracking perfectly happy!
    return false, y - 1
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
            DVD.modelTitle:SetText(itemObj:GetItemName() or "Preview")
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
        DVD.bossNotes:SetFrameLevel((DVD.itemContainer:GetFrameLevel() or 1) + 8)

        DVD.bossNotes.bg = DVD.bossNotes:CreateTexture(nil, "BACKGROUND")
        DVD.bossNotes.bg:SetAllPoints()
        DVD.bossNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

        DVD.bossNotes.text = DVD.bossNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        DVD.bossNotes.text:SetPoint("TOPLEFT", DVD.bossNotes, "TOPLEFT", 10, -10)
        DVD.bossNotes.text:SetPoint("BOTTOMRIGHT", DVD.bossNotes, "BOTTOMRIGHT", -10, 10)
        DVD.bossNotes.text:SetJustifyH("LEFT")
        DVD.bossNotes.text:SetJustifyV("TOP")
        DVD.bossNotes.text:SetWordWrap(true)
        DVD.bossNotes.text:SetNonSpaceWrap(false)
        DVD.bossNotes.text:SetFont(STANDARD_TEXT_FONT, 11, "")
    end

    local lines = {}

    if itemData.bossencounter then
        local encounterName = EJ_GetEncounterInfo(itemData.bossencounter)
        table.insert(lines, "|cffFFD200Boss:|r " .. (encounterName or "Unknown Boss"))
    end

    if itemData.instance or itemData.bossevent then
        local loc = itemData.instance or itemData.bossevent
        table.insert(lines, "|cff00fbffEvent:|r " .. tostring(loc))
    end

    if itemData.zone then
        table.insert(lines, "|cff00fbffLocation:|r " .. tostring(itemData.zone))
    end

    if itemData.note and itemData.note ~= "" then
        table.insert(lines, "|cff00ff00Note:|r " .. tostring(itemData.note))
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
    local charsPerLine = 36

    for line in string.gmatch(plainText .. "\n", "(.-)\n") do
        if line == "" then
            estimatedLines = estimatedLines + 1
        else
            estimatedLines = estimatedLines + math.max(1, math.ceil(string.len(line) / charsPerLine))
        end
    end

    local noteHeight = math.max(88, estimatedLines * 14 + 24)
    noteHeight = math.min(noteHeight, 210)

    DVD.bossNotes:ClearAllPoints()
    DVD.bossNotes:SetPoint("TOPLEFT", DVD.modelTitle, "BOTTOMLEFT", 0, -8)
    DVD.bossNotes:SetPoint("TOPRIGHT", DVD.modelTitle, "BOTTOMRIGHT", 0, -8)
    DVD.bossNotes:SetHeight(noteHeight)

    DVD.bossNotes.text:SetText(fullBossInfo)
    DVD.bossNotes:Show()
end

-- ============================================================
-- ============================================================
-- ⚔️ PREMIUM MIDNIGHT WIDE CARD BOSS DROP ROW LAYOUT (FIXED DELVES)
-- ============================================================
function DVD.CreateBossDropLine(parent, itemData, y)
    local id = itemData.id
    local isCollected = DVD.IsItemCollected(id)

    -- 🌟 1. Main Row Card Container Button
    local rowHeight = 44
    local line = CreateFrame("Button", nil, parent, "BackdropTemplate")
    line:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, y)
    line:SetPoint("RIGHT", parent, "RIGHT", -12, 0)
    line:SetHeight(rowHeight)
    line:RegisterForClicks("AnyUp")

    -- 🌟 2. Custom Premium Midnight Backdrop 
    line:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        tileSize = 0,
        edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
    line:SetBackdropColor(0.12, 0.08, 0.18, 0.85)       
    line:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6) 

    -- 🌟 3. LEFT EDGE: Split Color Status Strip Indicators
    local topIndicator = line:CreateTexture(nil, "OVERLAY")
    topIndicator:SetWidth(4)
    topIndicator:SetPoint("TOPLEFT", line, "TOPLEFT", 0, 0)
    topIndicator:SetPoint("BOTTOMLEFT", line, "LEFT", 0, 0)
    topIndicator:SetTexture("Interface\\Buttons\\WHITE8x8")

    local bottomIndicator = line:CreateTexture(nil, "OVERLAY")
    bottomIndicator:SetWidth(4)
    bottomIndicator:SetPoint("TOPLEFT", line, "LEFT", 0, 0)
    bottomIndicator:SetPoint("BOTTOMLEFT", line, "BOTTOMLEFT", 0, 0)
    bottomIndicator:SetTexture("Interface\\Buttons\\WHITE8x8")

    if isCollected then
        topIndicator:SetVertexColor(0.2, 1.0, 0.5, 1)
        bottomIndicator:SetVertexColor(0.2, 1.0, 0.5, 1)
    else
        topIndicator:SetVertexColor(1.0, 0.2, 0.2, 1)    
        bottomIndicator:SetVertexColor(0.4, 0.4, 0.4, 1) 
    end

    -- 🌟 4. True Reward Decor Icon Artwork Loader
    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("LEFT", line, "LEFT", 12, 0)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    
    local itemTexture = "Interface\\Icons\\INV_Misc_Armband_01"
    if id then
        itemTexture = C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(id) or GetItemIcon(id) or itemTexture
    end
    icon:SetTexture(itemTexture)

    -- Quality Rim Inset Border Box Frame
    local iconBorder = CreateFrame("Frame", nil, line, "BackdropTemplate")
    iconBorder:SetSize(36, 36)
    iconBorder:SetPoint("CENTER", icon, "CENTER", 0, 0)
    local lineLevel = line:GetFrameLevel() or 1
    iconBorder:SetFrameLevel(math.max(0, lineLevel - 1))
    iconBorder:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    iconBorder:SetBackdropColor(0.05, 0.05, 0.05, 0.8)
    iconBorder:SetBackdropBorderColor(0.35, 0.30, 0.50, 0.6)

    -- 🌟 5. LEFT SIDE TEXTS: Primary Decor Item Name Label
    local nameFS = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameFS:SetFont(STANDARD_TEXT_FONT, 11, "")
    nameFS:SetPoint("LEFT", icon, "RIGHT", 12, 4)
    nameFS:SetWidth(185)
    nameFS:SetJustifyH("LEFT")
    nameFS:SetText("Loading loot properties...")

    -- Left Subtext: Sourced description status layout
    local subText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subText:SetFont(STANDARD_TEXT_FONT, 11, "")
    subText:SetPoint("TOPLEFT", nameFS, "BOTTOMLEFT", 0, -2)
    subText:SetWidth(185)
    subText:SetJustifyH("LEFT")
    
    if isCollected then
        nameFS:SetTextColor(0.2, 1.0, 0.5)
        subText:SetTextColor(0.2, 1.0, 0.5)
        subText:SetText("Collected & Owned")
    else
        nameFS:SetTextColor(0.92, 0.90, 0.96)
        subText:SetTextColor(0.70, 0.68, 0.78)
        subText:SetText("Loot Uncollected")
    end

-- Asynchronous asset data loading loops
    local item = Item:CreateFromItemID(id)
    item:ContinueOnItemLoad(function()
        if nameFS then
            -- 🚀 THE FORCE-NAME FIX:
            -- If we manually typed a clean custom name in our database table, use it!
            -- Otherwise, fall back to the raw retail server name.
            local cleanDisplayName = itemData.name or item:GetItemName() or "Unknown Loot"
            nameFS:SetText(cleanDisplayName)
        end
    end)

    -- ============================================================
    -- 🚀 THE SMART SEPARATION MATRIX (FIXES DELVES AND BOSSES)
    -- ============================================================
    local primarySource = "Rare Spawn"
    local secondaryLocation = "World Drop"

    if itemData.category == "delve" then
        -- If it's explicitly a delve, set the Delve Name as the bold header
        primarySource = itemData.bossevent or "Delve Run"
        secondaryLocation = "Delve Reward"
    elseif itemData.bossencounter then
        -- If it's a Dungeon Journal Boss, fetch their live name string
        local encounterName = EJ_GetEncounterInfo(itemData.bossencounter)
        primarySource = encounterName or "Encounter Boss"
        secondaryLocation = itemData.instance or "Dungeon Boss"
    else
        -- Fall back for normal open-world rares
        primarySource = itemData.bossevent or itemData.instance or "Rare Spawn"
        secondaryLocation = "World Drop"
    end

    -- Overwrite the secondary location string if raw data specifically includes an area name
    if itemData.zone and itemData.zone ~= "" then
        -- 🧹 CLEANSE THE DATA ON THE FLY:
        -- Automatically strip out any line breaks, bullet marks, and extra blank margins!
        local cleanZone = itemData.zone:gsub("\n", " "):gsub("•", ""):gsub("%s+", " ")
        -- Strip any trailing or leading empty spaces left over
        cleanZone = cleanZone:match("^%s*(.-)%s*$")
        secondaryLocation = cleanZone
    end

    -- 🌟 6. RIGHT SIDE TEXTS: Sourced Instance / Event (Bolds on top)
    local sourceText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    sourceText:SetFont(STANDARD_TEXT_FONT, 12, "")
    sourceText:SetPoint("TOPRIGHT", line, "TOPRIGHT", -16, -6) 
    sourceText:SetJustifyH("RIGHT")
    sourceText:SetTextColor(0.85, 0.75, 0.45) -- Gold accent header text
    sourceText:SetText(tostring(primarySource))

    -- 🌟 7. RIGHT SIDE TEXTS: Single-Line Cleansed Location Details (Below name)
    local zoneText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    zoneText:SetFont(STANDARD_TEXT_FONT, 10, "")
    zoneText:SetPoint("TOPRIGHT", sourceText, "BOTTOMRIGHT", 0, -2)
    zoneText:SetJustifyH("RIGHT")
    zoneText:SetTextColor(0.50, 0.48, 0.58) -- Muted layout text color
    zoneText:SetText(tostring(secondaryLocation))

    -- 🌟 8. Interaction Clicking Handlers
    line:SetScript("OnClick", function(_, button)
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
        and DVD.rareEvents
        and DVD.rareEvents[actionKey]

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

        local sourceActions =
            DVD.SourceActions
            or DVD.SOURCE_ACTIONS
            or (DVD.Shared and DVD.Shared.SourceActions)
            or ((DVD.CONSTANTS or DVD.C or {}).SOURCE_ACTIONS)
            or ((DVD.CONSTANTS or DVD.C or {}).SourceActions)

        local action =
            actionKey
            and sourceActions
            and sourceActions[actionKey]

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

    -- Mouse Hover Tooltip Scripts
    line:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.18, 0.14, 0.26, 0.95)
        self:SetBackdropBorderColor(0.00, 0.80, 1.00, 0.8) 

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetHyperlink("item:" .. id)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00<Right Click>|r Set Map Waypoint Pins", 1, 1, 1)
        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.12, 0.08, 0.18, 0.85)
        self:SetBackdropBorderColor(0.25, 0.20, 0.35, 0.6)
        GameTooltip:Hide()
    end)

    table.insert(DVD.activeWidgets, line)
    return y - (rowHeight + 5)
end