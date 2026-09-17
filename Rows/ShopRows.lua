-- ============================================================
-- Decor Vendor
-- UI/ShopRows.lua
-- Renders the list of premium and shop-exclusive decor items
-- ============================================================

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C
local Sizing = C and C.ListSizing or {}
local Gallery = DVD.Gallery

-------------------------------------------------
-- Local Filter Helper
-------------------------------------------------
local function HasActiveFilters(filterTable)
    if not filterTable then return false end
    for _, isActive in pairs(filterTable) do
        if isActive == true then return true end
    end
    return false
end


-------------------------------------------------
-- Shop Grid — own sizing, own pool
-------------------------------------------------

local SHOP_CARD_SIZE            = 104
local SHOP_CARD_FRAME_LEVEL_OFF = 2
local SHOP_ICON_INSET           = 10
local SHOP_ICON_CROP_MIN        = 0.08
local SHOP_ICON_CROP_MAX        = 0.92
local SHOP_BADGE_SIZE           = 22
local SHOP_BADGE_INSET          = 6

local SHOP_GRID_PADDING         = 18
local SHOP_CARD_GAP_X           = 12
local SHOP_CARD_GAP_Y           = 12
local SHOP_PREFERRED_COLS       = 6
local SHOP_NARROW_COLS          = 3
local SHOP_MIN_HORIZONTAL_GAP   = 8

local SLOT_ATLAS = "house-chest-list-Item-default"

local shopCardPool = {}
local shopCardCounter = 0

-------------------------------------------------
-- Shop card
-------------------------------------------------
local function CreateShopCard(parent, idx)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(SHOP_CARD_SIZE, SHOP_CARD_SIZE)
    card:SetFrameLevel(parent:GetFrameLevel() + SHOP_CARD_FRAME_LEVEL_OFF)

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
    -- Icon
    -------------------------------------------------
    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", card, "TOPLEFT", SHOP_ICON_INSET, -SHOP_ICON_INSET)
    icon:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -SHOP_ICON_INSET, SHOP_ICON_INSET)
    icon:SetTexCoord(SHOP_ICON_CROP_MIN, SHOP_ICON_CROP_MAX, SHOP_ICON_CROP_MIN, SHOP_ICON_CROP_MAX)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    card.icon = icon

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local badge = card:CreateTexture(nil, "OVERLAY")
    badge:SetSize(SHOP_BADGE_SIZE, SHOP_BADGE_SIZE)
    badge:SetPoint("TOPRIGHT", card, "TOPRIGHT", -SHOP_BADGE_INSET, -SHOP_BADGE_INSET)
    badge:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    badge:Hide()
    card.collected = badge

    -------------------------------------------------
    -- Source dot (shop vs charity)
    -------------------------------------------------
    local dot = card:CreateTexture(nil, "OVERLAY")
    dot:SetSize(10, 10)
    dot:SetPoint("BOTTOMLEFT", card, "BOTTOMLEFT", 6, 6)
    dot:SetColorTexture(1, 1, 1)
    card.sourceDot = dot

    card:RegisterForClicks("LeftButtonUp")

card:SetScript("OnEnter", function(self)
    self.hoverBg:Show()

    local itemID = self.itemID
    local details = self.details
    if not itemID or not details then return end

    local itemName = details.shopName or ("Item " .. tostring(itemID))

    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine(itemName, 1, 0.82, 0)

    if details.priceText then
        GameTooltip:AddLine("|cff30d580" .. details.priceText .. "|r")
    end

    GameTooltip:AddLine(" ")

    if details.source == "charity" then
        GameTooltip:AddLine("|cffff77ffCharity Shop|r")
    else
        GameTooltip:AddLine("|cff77aaffIn-Game Shop|r")
    end

    if details.note then
        GameTooltip:AddLine("|cffaaaaaa" .. details.note .. "|r")
    end

    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cff00ff00<Left Click>|r Preview", 1, 1, 1)
    GameTooltip:Show()
end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    shopCardPool[idx] = card
    return card
end

local function GetOrCreateShopCard(parent, idx)
    return shopCardPool[idx] or CreateShopCard(parent, idx)
end
-------------------------------------------------
-- Populate one card with shop item data
-------------------------------------------------
local function PopulateShopCard(card, itemID, details, activeData)
    card.itemID = itemID
    card.details = details
    card.activeData = activeData

    -------------------------------------------------
    -- Source dot
    -------------------------------------------------
    if details.source == "charity" then
        card.sourceDot:SetColorTexture(1.00, 0.55, 1.00)
    else
        card.sourceDot:SetColorTexture(0.35, 0.65, 1.00)
    end

    -------------------------------------------------
    -- Collected badge
    -------------------------------------------------
    local collected = DVD.IsItemCollected and DVD.IsItemCollected(itemID) or false
    card.collected:SetShown(collected)

    -------------------------------------------------
    -- Icon via Gallery.GetItemIcon (Housing Catalog first)
    -------------------------------------------------
    local icon =
        (Gallery.GetItemIcon and Gallery.GetItemIcon(itemID, activeData))
        or "Interface\\Icons\\INV_Misc_QuestionMark"

    card.icon:SetTexture(icon)

    -------------------------------------------------
    -- Click Action
    -------------------------------------------------
    card:SetScript("OnClick", function(self)
        local previewData = {
            id = itemID,
            model3D = activeData and activeData.model3D,
            decorID = activeData and activeData.decorID,
            title = details.shopName,
        }

        if DVD.UpdateProfessionPreview then
            DVD.UpdateProfessionPreview(previewData)
        end

        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end)
end

-------------------------------------------------
-- Reset (call once per full rebuild)
-------------------------------------------------
function DVD.ResetShopGridCards()
    for _, card in ipairs(shopCardPool) do
        card:Hide()
    end
    shopCardCounter = 0
end

-------------------------------------------------
-- Lays out shop items as a flat grid.
-- entries is a list of { itemID = ..., itemData = ... }
-------------------------------------------------
function DVD.BuildShopGridSection(parentContainer, entries, startY)
    entries = entries or {}

    local width = parentContainer:GetWidth() or 0
    local columns = SHOP_PREFERRED_COLS
    local gapX = SHOP_CARD_GAP_X

    if width > 0 then
        local contentWidth = width - (SHOP_GRID_PADDING * 2)
        local neededWidth = (columns * SHOP_CARD_SIZE) + ((columns - 1) * SHOP_CARD_GAP_X)
        if contentWidth < neededWidth then
            columns = SHOP_NARROW_COLS
        end
    end

    local col, row = 0, 0

    for _, entry in ipairs(entries) do
        shopCardCounter = shopCardCounter + 1
        local card = GetOrCreateShopCard(parentContainer, shopCardCounter)

        card:ClearAllPoints()
        card:SetPoint(
            "TOPLEFT",
            parentContainer,
            "TOPLEFT",
            SHOP_GRID_PADDING + col * (SHOP_CARD_SIZE + gapX),
            startY - (row * (SHOP_CARD_SIZE + SHOP_CARD_GAP_Y))
        )
        card:Show()
        table.insert(DVD.activeWidgets, card)

        PopulateShopCard(card, entry.itemID, entry.details, entry.activeData)

        col = col + 1
        if col >= columns then
            col = 0
            row = row + 1
        end
    end

    local rows = math.ceil(#entries / columns)
    local sectionHeight = rows * (SHOP_CARD_SIZE + SHOP_CARD_GAP_Y)

    return startY - sectionHeight
end