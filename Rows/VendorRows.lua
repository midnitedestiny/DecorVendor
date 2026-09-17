-- [[
-- ============================================================
-- Decor Vendor Addon - Main Frame
-- © 2026 MidniteDestiny. All Rights Reserved.
-- ============================================================
-- ]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor VendorRows:|r constants are missing.")
    return
end

local Sizing = C.VendorRowsSizing
local NotesSizing = C.NotesPanelSizing

if not Sizing then
    print("|cffff4040DecorVendor VendorRows:|r VendorRowsSizing is missing.")
    return
end

if not NotesSizing then
    print("|cffff4040DecorVendor VendorRows:|r NotesPanelSizing is missing.")
    return
end

if not DVD.CreateUniversalHeader or not DVD.CreateUniversalCard then
    print(
        "|cffff4040DecorVendor VendorRows:|r universal row widgets are missing. Make sure UI\\RowWidget.lua loads first."
    )
    return
end

local COLORS = C.COLORS or {}
local GOLD = COLORS.GOLD or {1, 0.82, 0, 1}

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
-- 🛡️ SHARED VENDOR ACCORDION HEADER
-- ============================================================
function DVD.CreateVendorHeader(parent, group, y, completed, total)
    local groupName = type(group) == "table" and group.zoneGroup or type(group) == "string" and group or "Unknown Hub"

    return DVD.CreateUniversalHeader(
        parent,
        y,
        {
            section = "vendors",
            key = groupName,
            title = groupName,
            completed = completed,
            total = total,
            progressLabel = "found",
            defaultCollapsed = true,
            spacing = Sizing.HeaderSpacing,
            useLegacyToggle = true
        }
    )
end

-------------------------------------------------
-- Vendor Grid — own sizing, own pool
-------------------------------------------------

local VEND_CARD_SIZE            = 104
local VEND_CARD_FRAME_LEVEL_OFF = 2
local VEND_ICON_INSET           = 10
local VEND_BADGE_SIZE           = 22
local VEND_BADGE_INSET          = 6

local VEND_GRID_PADDING         = 18
local VEND_CARD_GAP_X           = 12
local VEND_CARD_GAP_Y           = 12
local VEND_PREFERRED_COLS       = 6
local VEND_NARROW_COLS          = 3
local VEND_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local FACTION_ALLIANCE = { 0.00, 0.60, 1.00 }
local FACTION_HORDE    = { 1.00, 0.20, 0.20 }
local FACTION_NEUTRAL  = { 0.40, 0.90, 0.40 }

local vendorCardPool = {}
local vendorCardCounter = 0

-------------------------------------------------
-- Vendor card (mirrors CreateProfessionCard)
-------------------------------------------------
local function CreateVendorCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(VEND_CARD_SIZE, VEND_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + VEND_CARD_FRAME_LEVEL_OFF)

    -------------------------------------------------
    -- Slot background
    -------------------------------------------------
    local slotBg = card:CreateTexture(nil, "BACKGROUND")
    slotBg:SetAllPoints()
    slotBg:SetAtlas(SLOT_ATLAS)
    slotBg:SetVertexColor(1, 1, 1)
    card.slotBg = slotBg

    -------------------------------------------------
    -- Hover glow
    -------------------------------------------------
    local hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    hoverBg:SetAllPoints()
    hoverBg:SetAtlas(SLOT_ATLAS)
    hoverBg:SetBlendMode("ADD")
    hoverBg:SetAlpha(0.65)
    hoverBg:Hide()
    card.hoverBg = hoverBg

    -------------------------------------------------
    -- Portrait / icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", VEND_ICON_INSET, -VEND_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -VEND_ICON_INSET, VEND_ICON_INSET)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10")
    card.icon = icon

    -------------------------------------------------
    -- Visited badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(VEND_BADGE_SIZE, VEND_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -VEND_BADGE_INSET, -VEND_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.visitedBadge = badge
	
	-------------------------------------------------
	-- Endeavor status label (bottom-right corner)
	-------------------------------------------------
	local statusText = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	statusText:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -6, 6)
	statusText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
	statusText:Hide()
	card.statusText = statusText

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(10, 10)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.factionDot = dot

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local vendor = self.vendor
        if not vendor then return end

        self.slotBg:SetVertexColor(1, 1, 1) -- no backdrop color swap needed, atlas stays put

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(vendor.title, 1, 1, 1)

        if vendor.zone then
            GameTooltip:AddLine("Zone: " .. vendor.zone, 0.8, 0.8, 0.8)
        end

        if vendor.mapID then
            local mapInfo = C_Map.GetMapInfo(vendor.mapID)
            if mapInfo then
                GameTooltip:AddLine(mapInfo.name, GOLD[1], GOLD[2], GOLD[3])
            end
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cff00ff00Left Click|r Open Vendor Items", 1, 1, 1)
        GameTooltip:AddLine("|cff00ff00Right Click|r Drop Map Waypoint Pin", 1, 1, 1)
        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    vendorCardPool[idx] = card
    return card
end

local function GetOrCreateVendorCard(parent, idx)
    return vendorCardPool[idx] or CreateVendorCard(parent, idx)
end

-------------------------------------------------
-- Populate one card with vendor data
-------------------------------------------------
local function PopulateVendorCard(card, vendor, vendorSettings)
    card.vendor = vendor

    local isFound =
        vendorSettings
        and vendorSettings.visited
        and vendorSettings.visited[vendor.id]

    -------------------------------------------------
    -- Faction dot
    -------------------------------------------------
    local f = vendor.faction and string.lower(vendor.faction) or "neutral"
    local tint = FACTION_NEUTRAL
    if f == "alliance" then
        tint = FACTION_ALLIANCE
    elseif f == "horde" then
        tint = FACTION_HORDE
    end
    card.factionDot:SetColorTexture(tint[1], tint[2], tint[3])
 
	-------------------------------------------------
	-- Endeavor status (only shown for Endeavor-tracked vendors)
	-------------------------------------------------
	local resolvedWaypoint, waypointState

	if DVD.ResolveVendorWaypoint then
		resolvedWaypoint, waypointState = DVD.ResolveVendorWaypoint(vendor)
	end

	if resolvedWaypoint then
		card.statusText:SetText("Active")
		card.statusText:SetTextColor(0.20, 1.00, 0.50)
		card.statusText:Show()
	elseif waypointState == "inactive" then
		card.statusText:SetText("Inactive")
		card.statusText:SetTextColor(1.00, 0.30, 0.30)
		card.statusText:Show()
	elseif waypointState == "loading" then
		card.statusText:SetText("Loading...")
		card.statusText:SetTextColor(0.80, 0.80, 0.80)
		card.statusText:Show()
	else
		card.statusText:Hide()
	end
    -------------------------------------------------
    -- Visited badge + dim if marked found
    -------------------------------------------------
    card.visitedBadge:SetShown(isFound and true or false)

    if isFound and vendorSettings and vendorSettings.markFoundVendors then
        card.icon:SetVertexColor(0.6, 0.6, 0.6)
        card.icon:SetAlpha(0.7)
    else
        card.icon:SetVertexColor(1, 1, 1)
        card.icon:SetAlpha(1)
    end

    -------------------------------------------------
    -- Portrait (creature model) with icon fallback
    -------------------------------------------------
    if vendor.model3D then
        SetPortraitTextureFromCreatureDisplayID(card.icon, vendor.model3D)
    else
        card.icon:SetTexture("Interface\\Icons\\INV_Misc_Bag_10")
        card.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    end

    -------------------------------------------------
    -- Standalone preview updater (unchanged from row logic)
    -------------------------------------------------
    local function UpdatePreview(v)
        if not v then return end
        DVD.contentArea._isVendorPreview = true

if DVD.modelTitle then
        local vendorName = v.title or "Vendor"
        local faction = v.faction or "neutral"
        DVD.modelTitle:SetText(vendorName)
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

                local cam =
                    DVD.VendorCameraOverrides and DVD.VendorCameraOverrides[v.model3D]
                    or { targetZ = 0.4, pitch = 0.1, zoom = 5.5 }

                if camera.SetTarget then camera:SetTarget(0, 0, cam.targetZ or 0.4) end
                if camera.SetPitch then camera:SetPitch(cam.pitch or 0.1) end
                if camera.SetZoomDistance then camera:SetZoomDistance(cam.zoom or 5.5) end
            end)
        else
            if DVD.SetPreviewWatermarkVisible then
                DVD.SetPreviewWatermarkVisible(true)
            end
        end

        if DVD.texture then DVD.texture:Hide() end
    end

    -------------------------------------------------
    -- Click actions (unchanged logic from row, self -> card)
    -------------------------------------------------
    card:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            UpdatePreview(vendor)
            DVD.ShowVendorPopup(vendor.id, vendor.title)

            if DVD.vendorNotes then
                if vendor.note and vendor.note ~= "" then
                    DVD.vendorNotes.text:SetText(vendor.note)

                    local width = DVD.vendorNotes:GetWidth() or 0
                    if width > NotesSizing.VendorTextWidthPadding then
                        DVD.vendorNotes.text:SetWidth(width - NotesSizing.VendorTextWidthPadding)
                    end

                    local textHeight = DVD.vendorNotes.text:GetStringHeight() or 0
                    DVD.vendorNotes:SetHeight(
                        math.max(NotesSizing.VendorMinimumHeight, textHeight + NotesSizing.VendorHeightPadding)
                    )

                    if DVD.PositionVendorNotes then
                        DVD.PositionVendorNotes(vendor)
                    end

                    DVD.vendorNotes:Show()
                else
                    DVD.vendorNotes.text:SetText("")
                    DVD.vendorNotes:Hide()
                end
            end
        end

        if button == "RightButton" then
            if InCombatLockdown and InCombatLockdown() then return end

            local waypoint, waypointState
            if DVD.ResolveVendorWaypoint then
                waypoint, waypointState = DVD.ResolveVendorWaypoint(vendor)
            end

            if not waypoint then
                if waypointState == "inactive" then
                    print("|cffffd100Decor Vendor:|r " .. tostring(vendor.title or vendor.name or "This vendor") .. " is not active in this neighborhood.")
                elseif waypointState == "loading" then
                    print("|cffffd100Decor Vendor:|r Neighborhood Endeavor information is still loading. Try again in a moment.")
                elseif waypointState == "missingInitiative" then
                    print("|cffff4040Decor Vendor:|r This Endeavor source action is missing its initiativeID.")
                else
                    print("|cffffd100Decor Vendor:|r No waypoint location was found for " .. tostring(vendor.title or vendor.name or "this vendor") .. ".")
                end
                return
            end

            local mapID = tonumber(waypoint.mapID)
            local x = tonumber(waypoint.x)
            local y = tonumber(waypoint.y)

            if not mapID or not x or not y then
                print("|cffff4040Decor Vendor:|r Invalid waypoint data for " .. tostring(vendor.title or vendor.name or "this vendor") .. ".")
                return
            end

            local nx = x > 1 and x / 100 or x
            local ny = y > 1 and y / 100 or y

            local title = tostring(waypoint.title or vendor.title or vendor.name or "Decor Vendor")
            local zone = waypoint.zone
            if zone and zone ~= "" and zone ~= "It Depends" then
                title = title .. " - " .. tostring(zone)
            end

            if TomTom and TomTom.AddWaypoint then
                TomTom:AddWaypoint(mapID, nx, ny, {
                    title = title,
                    persistent = false,
                    minimap = true,
                    world = true
                })
                print("|cff00ccffDecor Vendor:|r TomTom waypoint added for " .. title .. ".")
                return
            end

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

            print("|cffff4040Decor Vendor:|r Could not create a waypoint for " .. title .. ".")
        end
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetVendorGridCards()
    for _, card in ipairs(vendorCardPool) do
        card:Hide()
    end
    vendorCardCounter = 0
end

-------------------------------------------------
-- Lays out vendors as a grid, starting at startY.
-- Returns the y position at the bottom.
-------------------------------------------------
function DVD.BuildVendorGridSection(parentContainer, vendors, startY, vendorSettings)
    vendors = vendors or {}

    local width = parentContainer:GetWidth() or 0
    local columns = VEND_PREFERRED_COLS
    local gapX = VEND_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (VEND_GRID_PADDING * 2)
        local neededWidth = (columns * VEND_CARD_SIZE) + ((columns - 1) * VEND_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = VEND_NARROW_COLS
        end
    end

    local col, row = 0, 0
    for _, vendor in ipairs(vendors) do
        local isFound =
            vendorSettings
            and vendorSettings.visited
            and vendorSettings.visited[vendor.id]

        if not (vendorSettings and vendorSettings.hideFoundVendors and isFound) then
            vendorCardCounter = vendorCardCounter + 1
            local card = GetOrCreateVendorCard(parentContainer, vendorCardCounter)

            card:ClearAllPoints()
            card:SetPoint(
                "TOPLEFT",
                parentContainer,
                "TOPLEFT",
                VEND_GRID_PADDING + col * (VEND_CARD_SIZE + gapX),
                startY - (row * (VEND_CARD_SIZE + VEND_CARD_GAP_Y))
            )
            card:Show()
            table.insert(DVD.activeWidgets, card)

            PopulateVendorCard(card, vendor, vendorSettings)

            col = col + 1
            if col >= columns then
                col = 0
                row = row + 1
            end
        end
    end

    local rows = math.ceil(#vendors / columns)
    local sectionHeight = rows * (VEND_CARD_SIZE + VEND_CARD_GAP_Y)

    return startY - sectionHeight
end