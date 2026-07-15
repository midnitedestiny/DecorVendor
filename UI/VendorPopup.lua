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

local C = DVD.CONSTANTS or DVD.C or {}
local frame = DVD.frame
local itemContainer = DVD.itemContainer

local COLLECTED_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\collected"

local ICON_SIZE = 40
local ICON_GAP = 8
local ICONS_PER_PAGE = 15

vendorFilteredItems = vendorFilteredItems or {}
currentVendorPage = currentVendorPage or 1

if not frame then
    print("|cffff4040DecorVendor VendorPopup:|r DVD.frame is missing. Make sure UI\\MainFrame.lua loads first.")
    return
end

if not itemContainer then
    print("|cffff4040DecorVendor VendorPopup:|r DVD.itemContainer is missing. Make sure UI\\PreviewPanel.lua loads first.")
    return
end

if not tContains(UISpecialFrames, "DV_VendorPopup") then
    tinsert(UISpecialFrames, "DV_VendorPopup")
end

-------------------------------------------------
-- Main Vendor Popup Area
-- Sits below DVD.modelTitle inside itemContainer.
-------------------------------------------------

DVD.vendorPopup = CreateFrame("Frame", "DV_VendorPopup", itemContainer, "BackdropTemplate")
local vendorPopup = DVD.vendorPopup

vendorPopup:ClearAllPoints()
vendorPopup:SetPoint("TOPLEFT", itemContainer, "TOPLEFT", 10, -42)
vendorPopup:SetPoint("TOPRIGHT", itemContainer, "TOPRIGHT", -10, -42)
vendorPopup:SetPoint("BOTTOMRIGHT", itemContainer, "BOTTOMRIGHT", -10, 10)
vendorPopup:EnableMouseWheel(true)
vendorPopup:Hide()

DVD.popupIconCache = DVD.popupIconCache or {}
local popupIconCache = DVD.popupIconCache

-------------------------------------------------
-- Zone / subtitle text
-------------------------------------------------

local vendorZoneText = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
vendorZoneText:ClearAllPoints()
vendorZoneText:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", 0, 0)
vendorZoneText:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", -92, 0)
vendorZoneText:SetHeight(18)
vendorZoneText:SetJustifyH("LEFT")
vendorZoneText:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
vendorZoneText:SetTextColor(0.85, 0.85, 0.85, 1)
vendorZoneText:SetText("")
DVD.vendorZoneText = vendorZoneText

local vendorPopupHiddenText = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
vendorPopupHiddenText:SetFont(STANDARD_TEXT_FONT, 11, "")
vendorPopupHiddenText:SetTextColor(0.75, 0.75, 0.75, 1)
vendorPopupHiddenText:SetPoint("TOPLEFT", vendorZoneText, "BOTTOMLEFT", 0, -2)
vendorPopupHiddenText:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", -4, -2)
vendorPopupHiddenText:SetJustifyH("LEFT")
vendorPopupHiddenText:Hide()
vendorPopup.hiddenText = vendorPopupHiddenText

-------------------------------------------------
-- Content Grid Area
-------------------------------------------------

vendorPopup.content = CreateFrame("Frame", nil, vendorPopup)
vendorPopup.content:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", 0, -26)
vendorPopup.content:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", 0, -26)
vendorPopup.content:SetPoint("BOTTOM", vendorPopup, "BOTTOM", 0, 32)

-------------------------------------------------
-- Paging Footer
-------------------------------------------------

DVD.pagingFrame = CreateFrame("Frame", nil, vendorPopup, "BackdropTemplate")
local pagingFrame = DVD.pagingFrame

pagingFrame:SetSize(150, 24)
pagingFrame:SetPoint("BOTTOM", vendorPopup, "BOTTOM", 0, 2)
pagingFrame:SetFrameLevel(vendorPopup:GetFrameLevel() + 20)
pagingFrame:Hide()

pagingFrame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
})
pagingFrame:SetBackdropColor(0.035, 0.025, 0.055, 0.82)
pagingFrame:SetBackdropBorderColor(0.45, 0.33, 0.65, 0.75)

DVD.vendorPrevBtn = CreateFrame("Button", nil, pagingFrame)
DVD.vendorPrevBtn:SetSize(22, 22)
DVD.vendorPrevBtn:SetPoint("LEFT", pagingFrame, "LEFT", 6, 0)
DVD.vendorPrevBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
DVD.vendorPrevBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
DVD.vendorPrevBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
DVD.vendorPrevBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

DVD.vendorNextBtn = CreateFrame("Button", nil, pagingFrame)
DVD.vendorNextBtn:SetSize(22, 22)
DVD.vendorNextBtn:SetPoint("RIGHT", pagingFrame, "RIGHT", -6, 0)
DVD.vendorNextBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
DVD.vendorNextBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
DVD.vendorNextBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
DVD.vendorNextBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

DVD.vendorPageText = pagingFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
DVD.vendorPageText:SetPoint("LEFT", DVD.vendorPrevBtn, "RIGHT", 3, 0)
DVD.vendorPageText:SetPoint("RIGHT", DVD.vendorNextBtn, "LEFT", -3, 0)
DVD.vendorPageText:SetJustifyH("CENTER")
DVD.vendorPageText:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
DVD.vendorPageText:SetText("Page 1")

local UpdateVendorPopup

DVD.vendorPrevBtn:SetScript("OnClick", function()
    if currentVendorPage > 1 then
        currentVendorPage = currentVendorPage - 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    end
end)

DVD.vendorNextBtn:SetScript("OnClick", function()
    local totalPages = math.max(1, math.ceil(#vendorFilteredItems / ICONS_PER_PAGE))

    if currentVendorPage < totalPages then
        currentVendorPage = currentVendorPage + 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    end
end)

vendorPopup:SetScript("OnMouseWheel", function(_, delta)
    local totalPages = math.max(1, math.ceil(#vendorFilteredItems / ICONS_PER_PAGE))

    if delta > 0 then
        if currentVendorPage > 1 then
            currentVendorPage = currentVendorPage - 1
            PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
            UpdateVendorPopup()
        end
    else
        if currentVendorPage < totalPages then
            currentVendorPage = currentVendorPage + 1
            PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
            UpdateVendorPopup()
        end
    end
end)

-------------------------------------------------
-- Icon Frames
-------------------------------------------------

local function GetPopupIconFrame(index)
    local container = popupIconCache[index]

    if container then
        container:Show()
        return container
    end

    container = CreateFrame("Frame", nil, vendorPopup.content)
    container:SetSize(ICON_SIZE, ICON_SIZE + 10)

    local borderFrame = CreateFrame("Frame", nil, container, "BackdropTemplate")
    borderFrame:SetSize(ICON_SIZE, ICON_SIZE)
    borderFrame:SetPoint("TOP", container, "TOP", 0, 0)
    borderFrame:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = 2,
    })
    borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    borderFrame:SetClipsChildren(true)
    container.borderFrame = borderFrame

    local btn = CreateFrame("Button", nil, borderFrame)
    btn:SetAllPoints(borderFrame)
    btn:RegisterForClicks("AnyUp")
    container.btn = btn

    local glow = btn:CreateTexture(nil, "BACKGROUND")
    glow:SetPoint("TOPLEFT", -2, 2)
    glow:SetPoint("BOTTOMRIGHT", 2, -2)
    glow:SetColorTexture(0, 0, 0, 0.5)
    container.glow = glow

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", 2, -2)
    icon:SetPoint("BOTTOMRIGHT", -2, 2)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    container.icon = icon

    local checkFrame = CreateFrame("Frame", nil, container)
    checkFrame:SetSize(18, 18)
    checkFrame:SetPoint("BOTTOM", borderFrame, "BOTTOM", 0, -8)
    checkFrame:SetFrameLevel(borderFrame:GetFrameLevel() + 10)
    checkFrame:Hide()

    local checkTex = checkFrame:CreateTexture(nil, "ARTWORK")
    checkTex:SetAllPoints()
    checkTex:SetTexture(COLLECTED_ICON_TEXTURE)
    checkFrame.texture = checkTex
    container.checkFrame = checkFrame

    btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    btn:GetHighlightTexture():SetBlendMode("ADD")
    btn:GetHighlightTexture():SetAllPoints(icon)

    popupIconCache[index] = container

    return container
end

function PopupButton_OnEnter(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    SetCursor("INSPECT_CURSOR")

    if self.isCollected then
        borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
        glow:SetColorTexture(1, 1, 1, 0.1)
    else
        borderFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
        glow:SetColorTexture(1, 0.82, 0, 0.2)
    end

    if self.itemID then
        local itemName

        if C_Item and C_Item.GetItemNameByID then
            itemName = C_Item.GetItemNameByID(self.itemID)
        end

        if not itemName and GetItemInfo then
            itemName = GetItemInfo(self.itemID)
        end

        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()

        GameTooltip:AddLine(itemName or ("Item ID: " .. tostring(self.itemID)), 0, 1, 0)

        if self.isCollected then
            GameTooltip:AddLine("Collected", 0.2, 1, 0.2)
        else
            GameTooltip:AddLine("Not collected", 1, 0.82, 0)
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Left-click to preview in DecorVendor", 0.65, 0.85, 1)

        GameTooltip:Show()
    end
end

function PopupButton_OnLeave(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    ResetCursor()

    if self.isCollected then
        borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
    else
        borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    end

    glow:SetColorTexture(0, 0, 0, 0.5)
    GameTooltip:Hide()
end

local function GetVendorPopupItemName(itemID)
    if not itemID then
        return nil
    end

    local itemName

    if C_Item and C_Item.GetItemNameByID then
        itemName = C_Item.GetItemNameByID(itemID)
    end

    if not itemName and GetItemInfo then
        itemName = GetItemInfo(itemID)
    end

    return itemName
end

function PopupButton_OnClick(self, button)
    if not self.itemID then
        return
    end

    if button == "LeftButton" and IsShiftKeyDown() then
        DressUpItemLink("item:" .. tostring(self.itemID))
        return
    end

    if button == "LeftButton" then
        DressUpItemLink("item:" .. tostring(self.itemID))
        return
    end
end

local function SetupPopupButton(container, itemID)
    local btn = container.btn
    local borderFrame = container.borderFrame

    container.itemID = itemID
    btn.itemID = itemID
    btn.isCollected = false

    if DVD.catalogReady and DVD.IsItemCollected then
        btn.isCollected = DVD.IsItemCollected(itemID)
    end

    borderFrame:SetBackdropBorderColor(
        btn.isCollected and 1 or 0.4,
        btn.isCollected and 1 or 0.4,
        btn.isCollected and 1 or 0.4,
        1
    )

    if btn.isCollected and vendorSettings.showVendorCheckmarks then
        container.checkFrame:Show()
    else
        container.checkFrame:Hide()
    end

    local texture = GetItemIcon(itemID)
    container.icon:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")

    btn:SetScript("OnEnter", PopupButton_OnEnter)
    btn:SetScript("OnLeave", PopupButton_OnLeave)
    btn:SetScript("OnClick", PopupButton_OnClick)

    container:Show()
end

-------------------------------------------------
-- Dynamic Grid Layout
-------------------------------------------------

local function GetIconsPerRow()
    local width = vendorPopup.content:GetWidth()

    if not width or width <= 1 then
        width = (vendorPopup:GetWidth() or 300) - 20
    end

    local iconsPerRow = math.floor((width + ICON_GAP) / (ICON_SIZE + ICON_GAP))

    return math.max(1, math.min(6, iconsPerRow))
end

local function LayoutPopupItems(items)
    local totalItems = #items
    local columns = GetIconsPerRow()

    if totalItems <= 0 then
        return
    end

    for i, itemID in ipairs(items) do
        local container = GetPopupIconFrame(i)

        container:ClearAllPoints()

        local row = math.floor((i - 1) / columns)
        local col = (i - 1) % columns

        local iconsThisRow = math.min(totalItems - (row * columns), columns)
        local rowWidth = (iconsThisRow * ICON_SIZE) + ((iconsThisRow - 1) * ICON_GAP)

        local x = math.floor(((vendorPopup.content:GetWidth() or 280) - rowWidth) / 2)
        local y = -row * (ICON_SIZE + ICON_GAP + 8)

        container:SetPoint(
            "TOPLEFT",
            vendorPopup.content,
            "TOPLEFT",
            x + col * (ICON_SIZE + ICON_GAP),
            y
        )

        SetupPopupButton(container, itemID)
    end
end

UpdateVendorPopup = function()
    for _, iconFrame in pairs(popupIconCache) do
        iconFrame:Hide()
    end

    local totalItems = #vendorFilteredItems
    local totalPages = math.max(1, math.ceil(totalItems / ICONS_PER_PAGE))

    if currentVendorPage > totalPages then
        currentVendorPage = totalPages
    end

    local itemsToShow = {}
    local startIndex = (currentVendorPage - 1) * ICONS_PER_PAGE + 1
    local endIndex = math.min(startIndex + ICONS_PER_PAGE - 1, totalItems)

    for i = startIndex, endIndex do
        table.insert(itemsToShow, vendorFilteredItems[i])
    end

    LayoutPopupItems(itemsToShow)

    if DVD.currentTab == "vendors" and totalPages > 1 then
        pagingFrame:Show()
        DVD.vendorPrevBtn:Show()
        DVD.vendorNextBtn:Show()
        DVD.vendorPageText:Show()

        DVD.vendorPageText:SetText(string.format("%d / %d", currentVendorPage, totalPages))
        DVD.vendorPrevBtn:SetEnabled(currentVendorPage > 1)
        DVD.vendorNextBtn:SetEnabled(currentVendorPage < totalPages)
    else
        pagingFrame:Hide()
        DVD.vendorPrevBtn:Hide()
        DVD.vendorNextBtn:Hide()
        DVD.vendorPageText:Hide()
    end
end

-------------------------------------------------
-- Public Vendor Popup
-------------------------------------------------

local function GetVendorInfoCompat(vendorID)
    vendorID = tonumber(vendorID)
    if not vendorID then return nil end

    if DVD.GetVendorInfo then
        local vendor = DVD.GetVendorInfo(vendorID)
        if vendor then
            vendor.id = vendor.id or vendorID
            return vendor
        end
    end

    local vendor = DVD.npcs and DVD.npcs[vendorID]

    if type(vendor) == "table" then
        vendor.id = vendor.id or vendorID
        return vendor
    end

    return nil
end

local function AddVendorItemIDsFromActiveItems(vendorID, addedItems, seenItems)
    vendorID = tonumber(vendorID)
    if not vendorID then return end

    local activeItems = DVD.ActiveItems

    for itemID, data in pairs(activeItems or {}) do
        if type(data) == "table" and type(data.soldBy) == "table" then
            -- 🚀 EXTRA SAFE STEP: Skip this item immediately if it's flagged as unreleased
            if data.unreleased ~= true then
                for _, soldByID in ipairs(data.soldBy) do
                    if tonumber(soldByID) == vendorID then
                        if not seenItems[itemID] then
                            seenItems[itemID] = true
                            table.insert(addedItems, itemID)
                        end
                        break
                    end
                end
            end
        end
    end
end

local function LayoutVendorPreviewTitle(hasWaypointButton)
    if not DVD.modelTitle or not DVD.itemContainer then
        return
    end

    DVD.modelTitle:ClearAllPoints()
    DVD.modelTitle:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", 10, -10)

    if hasWaypointButton and DVD.vendorWaypointBtn then
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.vendorWaypointBtn, "TOPLEFT", -8, 0)
    else
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -10, -10)
    end

    DVD.modelTitle:SetHeight(22)
    DVD.modelTitle:SetJustifyH("CENTER")
    DVD.modelTitle:SetWordWrap(false)
    DVD.modelTitle:SetNonSpaceWrap(false)
end

function DVD.ShowVendorPopup(vendorID, vendorName)
    if not vendorID then
        return
    end

    vendorID = tonumber(vendorID) or vendorID

    local vendor = GetVendorInfoCompat(vendorID)

    if not vendor then
        print("|cffff4040DecorVendor:|r No vendor data found for NPC ID " .. tostring(vendorID))
        return
    end

    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]

    currentPopupVendorID = vendorID
    currentPopupNpcName = vendorName or currentPopupNpcName
    DVD.selectedVendor = vendor

    -------------------------------------------------
    -- Gather vendor items
    -------------------------------------------------

    local addedItems = {}
    local seenItems = {}

    if vendorData and type(vendorData.items) == "table" then
        for _, itemID in ipairs(vendorData.items) do
            if type(itemID) == "number" and not seenItems[itemID] then
                -- 🚀 DYNAMIC CHECK: Fetch global ActiveItems data record to screen for unreleased flag
                local itemRecord = DVD.ActiveItems and DVD.ActiveItems[itemID]

                if not itemRecord or itemRecord.unreleased ~= true then
                    seenItems[itemID] = true
                    table.insert(addedItems, itemID)
                end
            end
        end
    elseif type(vendorData) == "table" then
        for _, itemID in ipairs(vendorData) do
            if type(itemID) == "number" and not seenItems[itemID] then
                local itemRecord = DVD.ActiveItems and DVD.ActiveItems[itemID]

                if not itemRecord or itemRecord.unreleased ~= true then
                    seenItems[itemID] = true
                    table.insert(addedItems, itemID)
                end
            end
        end
    end

    -- New flat ActiveItems path: find items that list this NPC in soldBy = { npcID }.
    AddVendorItemIDsFromActiveItems(vendorID, addedItems, seenItems)

    table.sort(addedItems)

    vendorFilteredItems = addedItems
    currentVendorPage = 1

    -------------------------------------------------
    -- Vendor zone/subtitle
    -------------------------------------------------

    if DVD.vendorZoneText then
        if vendor.zone and vendor.zone ~= "" and vendor.zone ~= "It Depends" and not vendor.variableLocation then
            DVD.vendorZoneText:SetText(vendor.zone)
            DVD.vendorZoneText:Show()
        else
            DVD.vendorZoneText:SetText("")
            DVD.vendorZoneText:Hide()
        end
    end

    -------------------------------------------------
    -- Waypoint Button
    -------------------------------------------------

   if not DVD.vendorWaypointBtn and DVD.itemContainer then
    DVD.vendorWaypointBtn = CreateFrame("Button", nil, DVD.itemContainer, "UIPanelButtonTemplate")
    DVD.vendorWaypointBtn:SetSize(76, 20)
    DVD.vendorWaypointBtn:SetText("Waypoint")
end

local waypointBtn = DVD.vendorWaypointBtn

if waypointBtn then
    waypointBtn:ClearAllPoints()
    waypointBtn:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -10, -10)

    if vendorSettings and vendorSettings.showWaypointButton and vendor.mapID and vendor.x and vendor.y then
        waypointBtn:Show()

        waypointBtn:SetScript("OnClick", function()
            local mapID = tonumber(vendor.mapID)
            local x = tonumber(vendor.x)
            local y = tonumber(vendor.y)

            if not mapID or not x or not y then
                print("|cffff4040DecorVendor:|r Invalid waypoint data for " .. tostring(vendor.title or "vendor") .. ".")
                return
            end

            local nx = x > 1 and x / 100 or x
            local ny = y > 1 and y / 100 or y

            local title =
                tostring(vendor.title or vendor.name or "Decor Vendor")
                .. " - "
                .. tostring(vendor.zone or "")

            -------------------------------------------------
            -- TomTom first.
            -- Do NOT use cached hasTomTom here.
            -------------------------------------------------
            if TomTom and TomTom.AddWaypoint then
                TomTom:AddWaypoint(mapID, nx, ny, {
                    title = title,
                    persistent = false,
                    minimap = true,
                    world = true,
                })

                PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
                print("|cff00ff00DecorVendor:|r TomTom waypoint set for " .. title)
                return
            end

            -------------------------------------------------
            -- Blizzard waypoint fallback only if TomTom is missing.
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

                    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
                    print("|cff00ff00DecorVendor:|r Map waypoint set for " .. title)
                    return
                end
            end

            print("|cffff4040DecorVendor:|r Could not set waypoint for " .. title .. ".")
        end)
    else
        waypointBtn:Hide()
        waypointBtn:SetScript("OnClick", nil)
    end

    LayoutVendorPreviewTitle(waypointBtn:IsShown())
end

    -------------------------------------------------
    -- Build popup
    -------------------------------------------------

    UpdateVendorPopup()
    vendorPopup:Show()

    if C_HousingCatalog and C_HousingCatalog.RequestHousingMarketInfoRefresh then
        C_HousingCatalog.RequestHousingMarketInfoRefresh()
    end

    C_Timer.After(0.1, function()
        if vendorPopup:IsShown() then
            UpdateVendorPopup()
        end
    end)
end