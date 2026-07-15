-- ============================================================
-- Decor Vendor Gallery
-- GalleryGrid.lua
-- Main grid viewport container and visual cards compiler
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

Gallery.ActiveItems = DVD.ActiveItems or {}

function Gallery.CreateGrid(frame)
    local CatSizing = Gallery.C and Gallery.C.CatalogSizing or {}

    local detailWidth = CatSizing.DetailPanelWidth or 330
    local bottomHeight = CatSizing.BottomBarHeight or 44

    local scroll = CreateFrame("ScrollFrame", "DecorVendorGalleryScrollFrame", frame, "UIPanelScrollFrameTemplate")

    -- X = space after sidebar
    -- Y = move up/down
    -- 0 lines it up with the sidebar top.
    -- Positive numbers move it higher.
    scroll:SetPoint("TOPLEFT", frame.sidebar, "TOPRIGHT", 16, 0)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -(detailWidth + 65), bottomHeight + 8)

    local child = CreateFrame("Frame", nil, scroll)
    child:SetSize(1, 1)

    scroll:SetScrollChild(child)

    frame.scroll = scroll
    frame.scrollChild = child
end

function Gallery.CreateCard(parent, item, x, y)
    local card = CreateFrame("Button", nil, parent)
    card:SetSize(C.CARD_SIZE or 104, C.CARD_SIZE or 104)
    card:SetPoint("TOPLEFT", x, y)
    card:SetFrameLevel(parent:GetFrameLevel() + 2)

    -- Blizzard housing-style card background
    card.slotBg = card:CreateTexture(nil, "BACKGROUND")
    card.slotBg:SetAllPoints()
    card.slotBg:SetAtlas("house-chest-list-Item-default")

    -- Hover glow
    card.hoverBg = card:CreateTexture(nil, "BACKGROUND", nil, 1)
    card.hoverBg:SetAllPoints()
    card.hoverBg:SetAtlas("house-chest-list-Item-default")
    card.hoverBg:SetBlendMode("ADD")
    card.hoverBg:SetAlpha(0.65)
    card.hoverBg:Hide()

    -- Main icon
    card.icon = card:CreateTexture(nil, "ARTWORK")
    card.icon:SetPoint("TOPLEFT", 10, -10)
    card.icon:SetPoint("BOTTOMRIGHT", -10, 10)
    card.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    local icon = item.icon or (Gallery.GetItemIcon and Gallery.GetItemIcon(item.itemID, item.data))

    if item.iconType == "atlas" and card.icon.SetAtlas then
        card.icon:SetAtlas(icon)
    else
        card.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    end

    local collected = item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID))

    card.collected = card:CreateTexture(nil, "OVERLAY")
    card.collected:SetSize(22, 22)
    card.collected:SetPoint("TOPRIGHT", -6, -6)
    card.collected:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    card.collected:SetShown(collected)

    card:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    card:SetScript("OnEnter", function(self)
        self.hoverBg:Show()

        local itemData = item.data or {}
        local itemName = item.name or (Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData))
        local sourceText = Gallery.GetSourceTextForItem and Gallery.GetSourceTextForItem(item) or (Gallery.GetSourceLabel and Gallery.GetSourceLabel(item.sourceType))
        local reqText = Gallery.FormatRequirement and Gallery.FormatRequirement(itemData.requirement)
        local vendors = Gallery.GetVendorNamesFromItem and Gallery.GetVendorNamesFromItem(itemData)

        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()

        GameTooltip:AddLine(itemName or "Unknown Decor", 1, 0.82, 0, true)
        GameTooltip:AddLine("Housing Decor", 0.35, 0.75, 1, true)

        if sourceText then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Source: " .. sourceText, 0.4, 1, 0.4, true)
        end

        if vendors then
            GameTooltip:AddLine("Sold by: " .. vendors, 0.4, 1, 0.4, true)
        end

        if reqText then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(reqText, 1, 0.82, 0.1, true)
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Left-click: Preview", 0.7, 0.7, 0.7, true)
        GameTooltip:AddLine("Right-click: Set vendor waypoint", 0.7, 0.7, 0.7, true)

        GameTooltip:Show()
    end)

    card:SetScript("OnLeave", function(self)
        self.hoverBg:Hide()
        GameTooltip:Hide()
    end)

    card:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if Gallery.ShowItem then Gallery.ShowItem(item) end
        elseif button == "RightButton" then
            if Gallery.TrySetVendorWaypoint then Gallery.TrySetVendorWaypoint(item) end
        end
    end)

    return card
end

function Gallery.RefreshGrid()
    local frame = Gallery.frame
    if not frame or not frame.scrollChild then return end

    if Gallery.ClearCards then Gallery.ClearCards() end

    if Gallery.BuildCategorySidebar then
        Gallery.BuildCategorySidebar(Gallery.frame)
    end

    local visibleItems = Gallery.GetVisibleItems and Gallery.GetVisibleItems() or {}

    local width = frame.scroll:GetWidth() or 500
    local padding = C.GRID_PADDING or 18
    local cardSize = C.CARD_SIZE or 104

    -- Force a cleaner 4-column layout when there is room.
    local desiredColumns = 4
    local columns = desiredColumns

    local contentWidth = width - (padding * 2)
    local gapX = math.floor((contentWidth - (columns * cardSize)) / math.max(1, columns - 1))

    -- If the frame is ever too narrow, fall back to 3 columns instead of overlapping.
    if gapX < 8 then
        columns = 3
        gapX = C.CARD_GAP or 24
    end

    local gapY = C.CARD_GAP or 24

    for index, item in ipairs(visibleItems) do
        local col = (index - 1) % columns
        local row = math.floor((index - 1) / columns)

        local x = padding + col * (cardSize + gapX)
        local y = -padding - row * (cardSize + gapY)

        local card = Gallery.CreateCard(frame.scrollChild, item, x, y)
        table.insert(Gallery.cards, card)
    end

    local rows = math.ceil(#visibleItems / columns)
    frame.scrollChild:SetSize(width - 26, padding + rows * (cardSize + gapY) + 60)

    if frame.bottom and frame.bottom.text then
        local sourceText = Gallery.GetSourceLabel and Gallery.GetSourceLabel(Gallery.filters.source or "all") or "All"

        local availableTotal = Gallery.sidebarCountCache and Gallery.sidebarCountCache.availableTotal

        if not availableTotal then
            availableTotal = 0
            for _, item in ipairs(Gallery.items or {}) do
                if not DVD.IsDataAvailableForClient or DVD.IsDataAvailableForClient(item) then
                    availableTotal = availableTotal + 1
                end
            end
        end

        frame.bottom.text:SetText(
            string.format(
                "|cffaaaaaaShowing %d of %d items  |  Source: %s|r",
                #visibleItems,
                availableTotal,
                sourceText
            )
        )
    end

    if Gallery.frame and Gallery.frame.sidebar and Gallery.frame.sidebar.filtersContainer then
        if Gallery.CreateSidebarFilters then
            Gallery.CreateSidebarFilters(Gallery.frame.sidebar.filtersContainer)
        end
    end
end