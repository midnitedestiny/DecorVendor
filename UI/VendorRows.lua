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
    print("|cffff4040DecorVendor VendorRows:|r constants are missing.")
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


-- ============================================================
-- 🛡️ EXPANSION ACCORDION HEADER (FIXED TO READ ZONEGROUP KEY)
-- ============================================================
function DVD.CreateVendorHeader(parent, group, y, completed, total)
    completed = tonumber(completed) or 0
    total = tonumber(total) or 0

    -- 🚀 KEY MAP FIX: Maps collapse tracking state directly to your zoneGroup string name!
    if DVD.collapsedHeaders[group.zoneGroup] == nil then
        DVD.collapsedHeaders[group.zoneGroup] = true
    end

    local header = CreateFrame("Button", nil, parent)
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", 6, y)
    header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -10, y)
    header:SetHeight(C.VENDOR_HEADER_HEIGHT or 24)

    local bg = header:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetColorTexture(0.10, 0.065, 0.17, 0.82)

    local accent = header:CreateTexture(nil, "ARTWORK")
    accent:SetPoint("LEFT", header, "LEFT", 2, 0)
    accent:SetSize(2, header:GetHeight() - 6)
    accent:SetColorTexture(0.75, 0.50, 1, 0.45)

    header.icon = header:CreateFontString(nil, "OVERLAY")
    header.icon:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    header.icon:SetPoint("LEFT", header, "LEFT", 10, 0)

    if DVD.collapsedHeaders[group.zoneGroup] then
        header.icon:SetText("+")
    else
        header.icon:SetText("-")
    end

    header.icon:SetTextColor(0.92, 0.86, 1)

    header.progress = header:CreateFontString(nil, "OVERLAY")
    header.progress:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
    header.progress:SetPoint("RIGHT", header, "RIGHT", -8, 0)
    header.progress:SetJustifyH("RIGHT")
    header.progress:SetText(string.format("%d/%d found", completed, total))

    if total > 0 and completed == total then
        header.progress:SetTextColor(0.4, 1, 0.4)
    elseif total > 0 and completed >= total / 2 then
        header.progress:SetTextColor(1, 0.85, 0.3)
    else
        header.progress:SetTextColor(0.75, 0.75, 0.75)
    end

    header.text = header:CreateFontString(nil, "OVERLAY")
    header.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    header.text:SetPoint("LEFT", header.icon, "RIGHT", 8, 0)
    header.text:SetPoint("RIGHT", header.progress, "LEFT", -8, 0)
    header.text:SetJustifyH("LEFT")
    header.text:SetText(group.zoneGroup or "Unknown Hub")
    header.text:SetTextColor(0.95, 0.92, 1)
    header.text:SetNonSpaceWrap(false)
    header.text:SetWordWrap(false)

    header:SetScript("OnEnter", function()
        bg:SetColorTexture(0.16, 0.10, 0.26, 0.95)
        accent:SetColorTexture(1, 0.78, 0.28, 0.8)
    end)

    header:SetScript("OnLeave", function()
        bg:SetColorTexture(0.10, 0.065, 0.17, 0.82)
        accent:SetColorTexture(0.75, 0.50, 1, 0.45)
    end)

    header:SetScript("OnClick", function()
        DVD.ToggleAccordionHeader("vendors", group.zoneGroup)
    end)

    table.insert(DVD.activeWidgets, header)
    return header, DVD.collapsedHeaders[group.zoneGroup], y - (C.VENDOR_HEADER_HEIGHT or 24)
end

-- ============================================================
-- 👤 PREMIUM DYNAMIC NPC PORTRAIT WIDE CARD ROW LAYOUT
-- ============================================================
function DVD.CreateVendorLine(parent, vendor, y)
    local isFound = vendorSettings and vendorSettings.visited and vendorSettings.visited[vendor.id]

    -- 🚀 THE HIDE FOUND OVERRIDE TRICK:
    -- If the hideFoundVendors checkbox option is turned on and this vendor has been visited,
    -- cleanly bypass creating the UI frame completely and return the unmodified Y layout offset!
    if vendorSettings and vendorSettings.hideFoundVendors and isFound then
        return y
    end

    -- 🌟 1. Main Row Card Container Button
    local rowHeight = 44
    local line = CreateFrame("Button", nil, parent, "BackdropTemplate")
    line:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, y)
    line:SetPoint("RIGHT", parent, "RIGHT", -12, 0)
    line:SetHeight(rowHeight)
    line:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    -- 🌟 2. Custom Midnight Premium Theme Backdrop
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

    -- 🌟 3. LEFT EDGE: Split Color Indicator Status Bars (Top = Faction, Bottom = Found Status)
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

    local f = vendor.faction and string.lower(vendor.faction) or "neutral"
    if f == "alliance" then
        topIndicator:SetVertexColor(0.00, 0.60, 1.00, 1) 
    elseif f == "horde" then
        topIndicator:SetVertexColor(1.00, 0.20, 0.20, 1) 
    else
        topIndicator:SetVertexColor(0.70, 0.50, 1.00, 1) 
    end

    if isFound then
        bottomIndicator:SetVertexColor(0.2, 1.0, 0.5, 1) 
    else
        bottomIndicator:SetVertexColor(0.4, 0.4, 0.4, 1) 
    end

    -- 🌟 4. True High-End Dynamic Creature Portrait Loader
    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("LEFT", line, "LEFT", 12, 0)
    
    -- 🚀 THE PORTRAIT MAGIC:
    local portraitTexture = "Interface\\Icons\\INV_Misc_Head_Tauren_01" -- Fallback icon
    if vendor.model3D then
        SetPortraitTextureFromCreatureDisplayID(icon, vendor.model3D)
    else
        icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10") -- Fallback bag icon if model missing
        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    end

    -- Quality Rim Border Inset Box Frame
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

    -- 🌟 5. LEFT SIDE TEXTS: Primary Merchant Title String Frame
    local text = line:CreateFontString(nil, "OVERLAY")
    text:SetFont(STANDARD_TEXT_FONT, 13, "")
    text:SetPoint("LEFT", icon, "RIGHT", 12, 4)
    text:SetWidth(180)
    text:SetJustifyH("LEFT")
    text:SetText(vendor.title or "Unknown Merchant")

    if isFound and vendorSettings and vendorSettings.markFoundVendors then
        text:SetTextColor(0.6, 0.6, 0.6)
        text:SetAlpha(0.7)
    else
        if vendor.faction == "alliance" then
            text:SetTextColor(unpack(C.COLORS.ALLIANCE))
        elseif vendor.faction == "horde" then
            text:SetTextColor(unpack(C.COLORS.HORDE))
        else
            text:SetTextColor(unpack(C.COLORS.NEUTRAL))
        end
        text:SetAlpha(1)
    end

    -- Left Secondary Subtext description frame
    local subText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subText:SetFont(STANDARD_TEXT_FONT, 11, "")
    subText:SetPoint("TOPLEFT", text, "BOTTOMLEFT", 0, -2)
    subText:SetWidth(180)
    subText:SetJustifyH("LEFT")
    subText:SetTextColor(0.70, 0.68, 0.78)
    subText:SetText(isFound and "Merchant Visited" or "Merchant Unvisited")

    -- 🌟 6. RIGHT SIDE TEXTS: Zone Location Sizing
    local zoneText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    zoneText:SetFont(STANDARD_TEXT_FONT, 12, "")
    zoneText:SetPoint("TOPRIGHT", line, "TOPRIGHT", -16, -6) 
    zoneText:SetJustifyH("RIGHT")
    zoneText:SetTextColor(0.85, 0.75, 0.45) 
    zoneText:SetText(vendor.zone or "World Map Hub")

    -- 🌟 7. RIGHT SIDE TEXTS: Map Info Expansion Tags
    local mapText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    mapText:SetFont(STANDARD_TEXT_FONT, 10, "")
    mapText:SetPoint("TOPRIGHT", zoneText, "BOTTOMRIGHT", 0, -2)
    mapText:SetJustifyH("RIGHT")
    mapText:SetTextColor(0.50, 0.48, 0.58) 
    
    if vendor.mapID then
        local mapInfo = C_Map.GetMapInfo(vendor.mapID)
        if mapInfo and mapInfo.name then
            mapText:SetText(mapInfo.name)
        else
            mapText:SetText("Map Reference ID: " .. tostring(vendor.mapID))
        end
    else
        mapText:SetText("Sanctuary Zone")
    end

    -- Standalone preview module updater functions
    local function UpdatePreview(v)
        if not v then return end
        DVD.contentArea._isVendorPreview = true

        if DVD.modelTitle then
            DVD.modelTitle:SetText(v.title or "Vendor")
            local faction = v.faction or "neutral"
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

                local cam = DVD.VendorCameraOverrides and DVD.VendorCameraOverrides[v.model3D] or {
                    targetZ = 0.4,
                    pitch = 0.1,
                    zoom = 5.5,
                }
                if camera.SetTarget then camera:SetTarget(0, 0, cam.targetZ or 0.4) end
                if camera.SetPitch then camera:SetPitch(cam.pitch or 0.1) end
                if camera.SetZoomDistance then camera:SetZoomDistance(cam.zoom or 5.5) end
            end)
        else
            if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        end

        if DVD.texture then DVD.texture:Hide() end
    end

    -- 🌟 8. Interaction Clicking Scripts
    line:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            UpdatePreview(vendor)
            DVD.ShowVendorPopup(vendor.id, vendor.title)

            if not DVD.vendorNotes then return end

            if vendor.note and vendor.note ~= "" then
                DVD.vendorNotes.text:SetText(vendor.note)
                local width = DVD.vendorNotes:GetWidth() or 0
                if width > 20 then DVD.vendorNotes.text:SetWidth(width - 20) end

                local textHeight = DVD.vendorNotes.text:GetStringHeight() or 0
                DVD.vendorNotes:SetHeight(math.max(42, textHeight + 20))
							if DVD.PositionVendorNotes then
    DVD.PositionVendorNotes(vendor)
end
                DVD.vendorNotes:Show()
            else
                DVD.vendorNotes.text:SetText("")
                DVD.vendorNotes:Hide()
            end
        end

if button == "RightButton" then
    if InCombatLockdown and InCombatLockdown() then
        return
    end

    if vendor.mapID and vendor.x and vendor.y then
        local mapID = tonumber(vendor.mapID)
        local x = tonumber(vendor.x)
        local y = tonumber(vendor.y)

        if not mapID or not x or not y then
            print("|cffff4040Decor Vendor:|r Invalid vendor waypoint data.")
            return
        end

        -- Supports both 58.4 style and 0.584 style coords.
        local nx = x > 1 and x / 100 or x
        local ny = y > 1 and y / 100 or y

        local title =
            tostring(vendor.title or vendor.name or "Decor Vendor")
            .. " - "
            .. tostring(vendor.zone or "")

        -------------------------------------------------
        -- TomTom waypoint
        -- Do NOT use cached hasTomTom here.
        -------------------------------------------------
        if TomTom and TomTom.AddWaypoint then
            TomTom:AddWaypoint(mapID, nx, ny, {
                title = title,
                persistent = false,
                minimap = true,
                world = true,
            })

            print("|cff00ccffDecor Vendor:|r TomTom waypoint added for " .. title .. ".")
            return
        end

        -------------------------------------------------
        -- Blizzard waypoint fallback
        -------------------------------------------------
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

        print("|cffff4040Decor Vendor:|r Could not create waypoint.")
        return
    end

    print("|cffffd100Decor Vendor:|r This vendor has no fixed waypoint location.")
end
    end)

    -- Mouse Hover Tooltip Generation
    line:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.18, 0.14, 0.26, 0.95)
        self:SetBackdropBorderColor(0.00, 0.80, 1.00, 0.8) 

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine(vendor.title, 1, 1, 1)

        if vendor.zone then
            GameTooltip:AddLine("Zone: " .. vendor.zone, 0.8, 0.8, 0.8)
        end

        if vendor.mapID then
            local mapInfo = C_Map.GetMapInfo(vendor.mapID)
            if mapInfo then
                GameTooltip:AddLine(mapInfo.name, C.COLORS.GOLD)
            end
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00Left Click|r Open Vendor Items", 1, 1, 1)
        GameTooltip:AddLine("|cff00ff00Right Click|r Drop Map Waypoint Pin", 1, 1, 1)
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