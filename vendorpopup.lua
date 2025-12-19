local addonName, dv = ...

-- ===============================
-- Vendor Popup
-- ===============================
-- Helper: look up vendor info by vendorID (NEW npc structure)
function dv.GetVendorInfo(vendorID)
    if not vendorID or not dv.npcs then return nil end

    for _, group in ipairs(dv.npcs) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.id == vendorID then
                -- Attach useful context (optional but recommended)
                vendor.groupName = group.name
                vendor.expansion = group.expansion
                return vendor
            end
        end
    end

    return nil
end
-- Create popup frame
dv.vendorPopup = dv.vendorPopup or CreateFrame("Frame", "DV_VendorPopup", UIParent, "BackdropTemplate")
local popup = dv.vendorPopup
popup:SetSize(350, 100)
popup:SetPoint("CENTER")
popup:SetFrameStrata("DIALOG")
popup:Hide()

-- Caches for items
dv.vendorCache = dv.vendorCache or {}
dv.popupIconCache = dv.popupIconCache or {}

-- Backdrop
popup:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
popup:SetBackdropColor(0.1, 0.1, 0.1, 1)
popup:SetBackdropBorderColor(0.64, 0.64, 0.64, 1)

-- Gradient background
local popupGradient = popup:CreateTexture(nil, "BACKGROUND")
popupGradient:SetPoint("TOPLEFT", 4, -4)
popupGradient:SetPoint("BOTTOMRIGHT", -4, 4)
popupGradient:SetColorTexture(1, 1, 1, 1)
popupGradient:SetGradient("VERTICAL", CreateColor(0.12, 0.12, 0.12, 1), CreateColor(0.05, 0.05, 0.05, 1))

-- Title
popup.title = popup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
popup.title:SetPoint("TOP", 0, -12)
popup.title:SetText("Vendor Items")
popup.title:SetTextColor(1, 0.82, 0)

-- Separator
local titleSeparator = popup:CreateTexture(nil, "ARTWORK")
titleSeparator:SetHeight(2)
titleSeparator:SetColorTexture(0.4, 0.4, 0.4, 0.8)
titleSeparator:SetPoint("TOPLEFT", 10, -36)
titleSeparator:SetPoint("TOPRIGHT", -10, -36)

popup.content = CreateFrame("Frame", nil, popup)
popup.content:SetPoint("TOPLEFT", 12, -44)   -- below title
popup.content:SetPoint("BOTTOMRIGHT", -12, 12)


local recipeTitle = popup:CreateFontString(nil, "OVERLAY")
recipeTitle:SetFont(STANDARD_TEXT_FONT, 14); recipeTitle:SetText("Recipe:"); recipeTitle:Hide()

-- Close button
popup.closeBtn = CreateFrame("Button", nil, popup, "UIPanelCloseButton")
popup.closeBtn:SetPoint("TOPRIGHT", 0, 0)
popup.closeBtn:SetSize(30, 30)
popup.closeBtn:SetScript("OnClick", function() popup:Hide() end)

-- Make draggable
popup:EnableMouse(true)
popup:SetMovable(true)
popup:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)
popup:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)

-- Show Vendor Popup
function dv.ShowVendorPopup(vendorID, vendorName)
    if not vendorID then
        print("Decor Vendor: No vendor ID provided.")
        return
    end

    local vendorInfo = dv.GetVendorInfo(vendorID)
    if not vendorInfo then
        print("Decor Vendor: Vendor ID not found in database.")
        return
    end

    local goodies = dv.vendorGoodies[vendorID]
    if not goodies or #goodies == 0 then
        print("Decor Vendor: No items found for this vendor.")
        return
    end

    local popup = dv.vendorPopup
    popup.title:SetText((vendorName or "Vendor") .. " sells:")

    -- Hide existing item frames
    for _, frame in pairs(dv.vendorCache) do frame:Hide() end

    local tileSize, margin, columns = 50, 12, 6
    local startX, startY = 25, -48

    for i, itemID in ipairs(goodies) do
        local itemFrame = dv.vendorCache[i]
        if not itemFrame then
            itemFrame = CreateFrame("Frame", nil, popup, "BackdropTemplate")
            itemFrame:SetSize(tileSize, tileSize)
            itemFrame:SetClipsChildren(true)
            itemFrame:SetBackdrop({ edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 2 })
            itemFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

            local btn = CreateFrame("Button", nil, itemFrame)
            btn:SetAllPoints(itemFrame)

            local glow = btn:CreateTexture(nil, "BACKGROUND")
            glow:SetPoint("TOPLEFT", -2, 2)
            glow:SetPoint("BOTTOMRIGHT", 2, -2)
            glow:SetColorTexture(0, 0, 0, 0.5)
            btn.glow = glow

            local icon = btn:CreateTexture(nil, "ARTWORK")
            icon:SetPoint("TOPLEFT", 2, -2)
            icon:SetPoint("BOTTOMRIGHT", -2, 2)
            icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
            btn.icon = icon

            btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
            btn:GetHighlightTexture():SetBlendMode("ADD")
            btn:GetHighlightTexture():SetAllPoints(icon)

            itemFrame.btn = btn
            dv.vendorCache[i] = itemFrame
        end

        local col = (i - 1) % columns
        local row = math.floor((i - 1) / columns)
        itemFrame:SetPoint("TOPLEFT", popup, "TOPLEFT", startX + (col * (tileSize + margin)), startY - (row * (tileSize + margin)))

        local btn = itemFrame.btn
        btn.icon:SetTexture(GetItemIcon(itemID) or "Interface\\Icons\\INV_Misc_QuestionMark")

        btn:SetScript("OnEnter", function(self)
            SetCursor("INSPECT_CURSOR")
            itemFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
            self.glow:SetColorTexture(1, 0.82, 0, 0.2)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. itemID)
            GameTooltip:Show()
        end)

        btn:SetScript("OnLeave", function(self)
            ResetCursor()
            itemFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
            self.glow:SetColorTexture(0, 0, 0, 0.5)
            GameTooltip:Hide()
        end)

        btn:SetScript("OnClick", function()
            DressUpItemLink("item:" .. itemID)
        end)

        itemFrame:Show()
    end

    -- Resize popup
    local totalRows = math.floor((#goodies - 1) / columns) + 1
    local totalHeight = math.abs(startY) + (totalRows * (tileSize + margin)) + 4
    local totalWidth = (startX * 2) + (columns * (tileSize + margin)) - margin
    popup:SetSize(totalWidth, totalHeight)
    popup:SetScale(dv.vendorSettings and dv.vendorSettings.scale or 1.0)
	if dv.reagentsPopup then dv.reagentsPopup:Hide() end
    popup:Show()
end

-- ===============================
-- Reagents Popup (SEPARATE FRAME)
-- ===============================

dv.reagentsPopup = dv.reagentsPopup or CreateFrame("Frame", "DV_ReagentsPopup", UIParent, "BackdropTemplate")
local rpopup = dv.reagentsPopup
rpopup:SetSize(320, 140)
rpopup:SetPoint("CENTER")
rpopup:SetFrameStrata("DIALOG")
rpopup:SetClampedToScreen(true)
rpopup:Hide()

rpopup:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
rpopup:SetBackdropColor(0.1, 0.1, 0.1, 1)
rpopup:SetBackdropBorderColor(0.64, 0.64, 0.64, 1)

local rgrad = rpopup:CreateTexture(nil, "BACKGROUND")
rgrad:SetPoint("TOPLEFT", 4, -4)
rgrad:SetPoint("BOTTOMRIGHT", -4, 4)
rgrad:SetColorTexture(1, 1, 1, 1)
rgrad:SetGradient("VERTICAL", CreateColor(0.12, 0.12, 0.12, 1), CreateColor(0.05, 0.05, 0.05, 1))

rpopup.title = rpopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
rpopup.title:SetPoint("TOP", 0, -12)
rpopup.title:SetTextColor(1, 0.82, 0)
rpopup.title:SetText("Reagents Required")

local rsep = rpopup:CreateTexture(nil, "ARTWORK")
rsep:SetHeight(2)
rsep:SetColorTexture(0.4, 0.4, 0.4, 0.8)
rsep:SetPoint("TOPLEFT", 10, -36)
rsep:SetPoint("TOPRIGHT", -10, -36)

rpopup.content = CreateFrame("Frame", nil, rpopup)
rpopup.content:SetPoint("TOPLEFT", 12, -44)
rpopup.content:SetPoint("BOTTOMRIGHT", -12, 12)

rpopup.closeBtn = CreateFrame("Button", nil, rpopup, "UIPanelCloseButton")
rpopup.closeBtn:SetPoint("TOPRIGHT", 0, 0)
rpopup.closeBtn:SetSize(30, 30)
rpopup.closeBtn:SetScript("OnClick", function() rpopup:Hide() end)

rpopup:EnableMouse(true)
rpopup:SetMovable(true)
rpopup:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then self:StartMoving() end
end)
rpopup:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then self:StopMovingOrSizing() end
end)

dv.reagentIconCache = dv.reagentIconCache or {}

local function GetReagentIconFrame(i)
    local f = dv.reagentIconCache[i]
    if f then f:Show(); return f end

    f = CreateFrame("Frame", nil, rpopup.content, "BackdropTemplate")
    f:SetSize(50, 66)
    f:SetBackdrop({ edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 2 })
    f:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    f:SetClipsChildren(true)

    local btn = CreateFrame("Button", nil, f)
    btn:SetAllPoints()
    btn:RegisterForClicks("AnyUp")
    f.btn = btn

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", 2, -2)
    icon:SetPoint("BOTTOMRIGHT", -2, 18)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    f.icon = icon

    local countBg = f:CreateTexture(nil, "BACKGROUND")
    countBg:SetPoint("BOTTOMLEFT", 0, 0)
    countBg:SetPoint("BOTTOMRIGHT", 0, 0)
    countBg:SetHeight(16)
    countBg:SetColorTexture(0, 0, 0, 1)

    local countText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    countText:SetPoint("BOTTOM", 0, 2)
    countText:SetTextColor(1, 1, 1, 1)
    f.countText = countText

    btn:SetScript("OnEnter", function(self)
        SetCursor("CAST_CURSOR")
        f:SetBackdropBorderColor(1, 0.82, 0, 1)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink("item:" .. self.itemID)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function()
        ResetCursor()
        f:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        GameTooltip:Hide()
    end)
    btn:SetScript("OnClick", function(self)
        if dv.ShowWowheadLinkPopup then
            dv.ShowWowheadLinkPopup(self.itemID, "item")
        end
    end)

    dv.reagentIconCache[i] = f
    return f
end

function dv.ShowReagentsPopup(itemData)
    if not itemData or not itemData.reagents or #itemData.reagents == 0 then return end

    -- IMPORTANT: don't reuse vendor popup anymore
    if dv.vendorPopup then dv.vendorPopup:Hide() end

    rpopup.title:SetText("Reagents Required")

    -- hide old icons
    for _, f in pairs(dv.reagentIconCache) do f:Hide() end

    local tileSize, spacing = 50, 12
    for i, reagent in ipairs(itemData.reagents) do
        local f = GetReagentIconFrame(i)
        f:ClearAllPoints()
        f:SetPoint("TOPLEFT", rpopup.content, "TOPLEFT", (i - 1) * (tileSize + spacing), 0)

        f.btn.itemID = reagent.id
        f.icon:SetTexture(GetItemIcon(reagent.id) or "Interface\\Icons\\INV_Misc_QuestionMark")
        f.countText:SetText(reagent.amount or 1)
        f:Show()
    end

    local width = (#itemData.reagents * (tileSize + spacing)) - spacing
    rpopup:SetWidth(math.max(240, width + 24))
    rpopup:SetHeight(140)
    rpopup:SetScale(dv.vendorSettings and dv.vendorSettings.scale or 1.0)
    rpopup:Show()
end


--[[dv.popupIconCache = dv.popupIconCache or {}

-- Get / Create Popup Icon Frame
function dv.GetPopupIconFrame(index)
    local container = dv.popupIconCache[index]

    if not container then
        container = CreateFrame("Frame", nil, dv.vendorPopup)
        container:SetSize(50, 50)

        -- Border
        local borderFrame = CreateFrame("Frame", nil, container, "BackdropTemplate")
        borderFrame:SetSize(50, 50)
        borderFrame:SetPoint("TOP")
        borderFrame:SetBackdrop({
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            edgeSize = 2
        })
        borderFrame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
        borderFrame:SetClipsChildren(true)
        container.borderFrame = borderFrame

        -- Button
        local btn = CreateFrame("Button", nil, borderFrame)
        btn:SetAllPoints()
        btn:RegisterForClicks("AnyUp")
        container.btn = btn

        -- Glow
        local glow = btn:CreateTexture(nil, "BACKGROUND")
        glow:SetPoint("TOPLEFT", -2, 2)
        glow:SetPoint("BOTTOMRIGHT", 2, -2)
        glow:SetColorTexture(0, 0, 0, 0.5)
        container.glow = glow

        -- Icon
        local icon = btn:CreateTexture(nil, "ARTWORK")
        icon:SetPoint("TOPLEFT", 2, -2)
        icon:SetPoint("BOTTOMRIGHT", -2, 2)
        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        container.icon = icon

        -- Count Bar
        local countBar = CreateFrame("Frame", nil, container)
        countBar:SetSize(50, 16)
        countBar:SetPoint("TOP", borderFrame, "BOTTOM", 0, 0)
        container.countBar = countBar

        local countBg = countBar:CreateTexture(nil, "BACKGROUND")
        countBg:SetAllPoints()
        countBg:SetColorTexture(0, 0, 0, 1)

        local countText = countBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        countText:SetFont(STANDARD_TEXT_FONT, 14)
        countText:SetTextColor(1, 1, 1, 1)
        countText:SetPoint("CENTER")
        container.countText = countText

        -- Highlight
        btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
        btn:GetHighlightTexture():SetBlendMode("ADD")
        btn:GetHighlightTexture():SetAllPoints(icon)

        dv.popupIconCache[index] = container
    end

    container:Show()
    return container
end

]]

-- Popup Button: OnEnter
function dv.PopupButton_OnEnter(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    if self.isReagent or self.isRecipe then
        SetCursor("CAST_CURSOR")
        borderFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
        glow:SetColorTexture(1, 0.82, 0, 0.2)
    else
        SetCursor("INSPECT_CURSOR")
        if self.isCollected then
            borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
            glow:SetColorTexture(1, 1, 1, 0.1)
        else
            borderFrame:SetBackdropBorderColor(1, 0.82, 0, 1)
            glow:SetColorTexture(1, 0.82, 0, 0.2)
        end
    end

    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetHyperlink("item:" .. self.itemID)
    GameTooltip:Show()
end

-- Popup Button: OnLeave
function dv.PopupButton_OnLeave(self)
    local container = self:GetParent():GetParent()
    local borderFrame = container.borderFrame
    local glow = container.glow

    ResetCursor()

    if self.isReagent or self.isRecipe or not self.isCollected then
        borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    else
        borderFrame:SetBackdropBorderColor(1, 1, 1, 1)
    end

    glow:SetColorTexture(0, 0, 0, 0.5)
    GameTooltip:Hide()
end

-- Popup Button: OnClick
function dv.PopupButton_OnClick(self, button)
    if IsModifiedClick("CHATLINK") then
        local _, link = GetItemInfo(self.itemID)
        if link then
            ChatEdit_InsertLink(link)
        end
    elseif (self.isReagent or self.isRecipe) and (button == "LeftButton" or button == "RightButton") then
        if dv.ShowWowheadLinkPopup then
            dv.ShowWowheadLinkPopup(self.itemID, "item")
        end
    elseif button == "LeftButton" then
        DressUpItemLink("item:" .. self.itemID)
    end
end

-- Setup Popup Button (THIS IS THE GLUE)
function dv.SetupPopupButton(container, data, typeStr)
    local btn = container.btn
    local borderFrame = container.borderFrame
    local itemID = data.id

    btn.itemID = itemID
    btn.isReagent = (typeStr == "reagent")
    btn.isRecipe  = (typeStr == "recipe")
    btn.isCollected = false

    if typeStr == "vendor" then
        btn.isCollected = IsItemCollected(itemID)
        borderFrame:SetBackdropBorderColor(
            btn.isCollected and 1 or 0.4,
            btn.isCollected and 1 or 0.4,
            btn.isCollected and 1 or 0.4,
            1
        )
        container:SetSize(50, 50)
        container.countBar:Hide()

    elseif typeStr == "reagent" then
        borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        container:SetSize(50, 66)
        container.countText:SetText(data.amount or 1)
        container.countBar:Show()

    else -- recipe
        borderFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        container:SetSize(50, 50)
        container.countBar:Hide()
    end

    local texture = GetItemIcon(itemID)
    container.icon:SetTexture(
        texture
        or (typeStr == "recipe" and "Interface\\Icons\\INV_Scroll_03")
        or "Interface\\Icons\\INV_Misc_QuestionMark"
    )

    btn:SetScript("OnEnter", dv.PopupButton_OnEnter)
    btn:SetScript("OnLeave", dv.PopupButton_OnLeave)
    btn:SetScript("OnClick", dv.PopupButton_OnClick)

    container:Show()
end

--[[-- Reagents Popup (DecorVendor)
function dv.ShowReagentsPopup(itemData)
    if not itemData or not itemData.reagents or #itemData.reagents == 0 then
        return
    end

    popup.title:SetText("Reagents Required")

    for _, frame in pairs(dv.popupIconCache) do
        frame:Hide()
    end

    dv.LayoutPopupItems(itemData.reagents, "reagent")
    popup:Show()
end

function dv.LayoutPopupItems(items, typeStr)
    local tileSize = 50
    local spacing  = 12

    for i, item in ipairs(items) do
        local container = dv.GetPopupIconFrame(i)

        container:ClearAllPoints()
        container:SetParent(dv.vendorPopup.content)

        container:SetPoint(
            "TOPLEFT",
            dv.vendorPopup.content,
            "TOPLEFT",
            (i - 1) * (tileSize + spacing),
            0
        )

        dv.SetupPopupButton(container, item, typeStr)
        container:Show()
    end

    -- Resize popup cleanly
    local width = (#items * (tileSize + spacing)) - spacing
    dv.vendorPopup:SetWidth(math.max(220, width + 24))
    dv.vendorPopup:SetHeight(120)
end

]]


