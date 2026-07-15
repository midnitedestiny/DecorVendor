-- ============================================================
-- Decor Vendor Gallery
-- GalleryUI.lua
-- Standalone gallery browser window
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Shares your favorite master table directly!
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

local C = DVD.CONSTANTS or DVD.C or {}
local CatSizing = C.CatalogSizing or {}

local BACKDROP_SOLID = {
    bgFile   = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Buttons\\WHITE8X8",
    edgeSize = 1,
    insets   = { left = 1, right = 1, top = 1, bottom = 1 },
}

function Gallery.CreateFrame()
    local frame = CreateFrame("Frame", "DecorVendorGalleryFrame", UIParent, "BackdropTemplate")
    frame:SetSize(CatSizing.FrameWidth or 1100, CatSizing.FrameHeight or 788)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 30)

    frame:SetBackdrop(BACKDROP_SOLID)
    frame:SetBackdropColor(0.06, 0.06, 0.08, 0.95)
    frame:SetBackdropBorderColor(0.20, 0.20, 0.22, 1)

    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(120)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    Gallery.frame = frame

    -- ESC closes frame
    tinsert(UISpecialFrames, "DecorVendorGalleryFrame")

    -- ============================================================
    -- Title bar
    -- ============================================================

    local dvgTitleBar = CreateFrame("Frame", "DecorVendorGallerydvgTitleBar", frame)
    dvgTitleBar:SetHeight(32)
    dvgTitleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
    dvgTitleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
    dvgTitleBar:EnableMouse(true)
    dvgTitleBar:RegisterForDrag("LeftButton")

    dvgTitleBar:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)

    dvgTitleBar:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
    end)

    frame.titleBar = dvgTitleBar

    -- ============================================================
    -- Header background texture
    -- ============================================================

    local HEADER_TEXTURE = "Interface\\AddOns\\DecorVendor_Gallery\\Assets\\FilterBarBackground"
    frame.headerBg = dvgTitleBar:CreateTexture(nil, "BACKGROUND")
    frame.headerBg:SetAllPoints(dvgTitleBar)
    frame.headerBg:SetTexture(HEADER_TEXTURE)
    frame.headerBg:SetHorizTile(true)
    frame.headerBg:SetVertTile(false)
    frame.headerBg:SetAlpha(0.85)

    -- Keep the texture from stretching ugly if the art is tile-friendly.
    dvgTitleBar:SetScript("OnSizeChanged", function(self, width)
        if frame.headerBg and width and width > 0 then
            frame.headerBg:SetTexCoord(0, width / 512, 0, 1)
        end
    end)

    -- ============================================================
    -- Title text
    -- ============================================================

    frame.title = dvgTitleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.title:SetPoint("CENTER", dvgTitleBar, "CENTER", 0, 2)
    frame.title:SetText("|cffffd100Decor Vendor Gallery|r")
    frame.title:SetTextColor(1, 0.82, 0, 1)
    frame.title:SetShadowOffset(1, -1)
    frame.title:SetShadowColor(0, 0, 0, 0.9)

    -- ============================================================
    -- Close button
    -- ============================================================

    frame.closeBtn = CreateFrame("Button", nil, dvgTitleBar, "UIPanelCloseButton")
    frame.closeBtn:SetPoint("RIGHT", dvgTitleBar, "RIGHT", -2, 0)
    frame.closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)

    -- ============================================================
    -- Main Decor Vendor button
    -- ============================================================

    frame.mainBtn = CreateFrame("Button", nil, dvgTitleBar, "UIPanelButtonTemplate")
    frame.mainBtn:SetSize(125, 22)
    frame.mainBtn:SetPoint("LEFT", dvgTitleBar, "LEFT", 8, 0)
    frame.mainBtn:SetText("Decor Vendor")

    frame.mainBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("Open Decor Vendor", 1, 0.82, 0)
        GameTooltip:AddLine("Return to the Decor Vendor section menu.", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)

    frame.mainBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    frame.mainBtn:SetScript("OnClick", function()
        GameTooltip:Hide()

        -- Close Gallery first.
        if Gallery.frame and Gallery.frame:IsShown() then
            Gallery.frame:Hide()
        end

        -- Open Decor Vendor through the main addon opener natively.
        if DVD.OpenMainUI then
            DVD.OpenMainUI()
            return
        end

        local mainFrame = DVD.frame or _G.DV_MainFrame
        if mainFrame then
            mainFrame:Show()
            if DVD.ShowMainHomePanel then
                DVD.ShowMainHomePanel()
            elseif DVD.CreateMainHomePanel then
                DVD:CreateMainHomePanel(mainFrame)
                if mainFrame.homePanel then
                    mainFrame.homePanel:Show()
                end
            end
            return
        end

        print("|cffff4040Decor Vendor main frame is not loaded.|r")
    end)

    -- ============================================================
    -- Search box
    -- ============================================================

    local searchBox = CreateFrame("EditBox", "DecorVendorGallerySearchBox", dvgTitleBar, "SearchBoxTemplate")
    searchBox:SetSize(CatSizing.SearchBoxWidth or 260, 26)
    searchBox:SetPoint("RIGHT", frame.closeBtn, "LEFT", -12, 0)
    searchBox:SetAutoFocus(false)

    if searchBox.Instructions then
        searchBox.Instructions:SetText("Search decor, vendor, quest, boss...")
    end

    searchBox:SetScript("OnTextChanged", function(self)
        if SearchBoxTemplate_OnTextChanged then
            SearchBoxTemplate_OnTextChanged(self)
        end

        Gallery.filters = Gallery.filters or {}
        Gallery.filters.search = string.lower(self:GetText() or "")

        if Gallery.searchTimer then
            Gallery.searchTimer:Cancel()
            Gallery.searchTimer = nil
        end

        Gallery.searchTimer = C_Timer.NewTimer(0.2, function()
            if frame.scroll then
                frame.scroll:SetVerticalScroll(0)
            end

            if Gallery.RefreshGrid then
                Gallery.RefreshGrid()
            end
        end)
    end)

    searchBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)

    searchBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)

    frame.searchBox = searchBox

    -- ============================================================
    -- Main sections
    -- ============================================================

    if Gallery.CreateSidebar then Gallery.CreateSidebar(frame) end
    if Gallery.CreateGrid then Gallery.CreateGrid(frame) end
    if Gallery.CreatePreview then Gallery.CreatePreview(frame) end
    if Gallery.CreateBottomBar then Gallery.CreateBottomBar(frame) end

    frame:Hide()
end

function Gallery.CreateBottomBar(frame)
    local bottom = CreateFrame("Frame", "DecorVendorGalleryBottom", frame, "BackdropTemplate")
    bottom:SetHeight(44)
    bottom:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, 0)
    bottom:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    bottom:SetBackdrop(BACKDROP_SOLID)
    bottom:SetBackdropColor(0.06, 0.06, 0.08, 0.95)
    bottom:SetBackdropBorderColor(0.20, 0.20, 0.22, 1)

    -- Metallic border strip at bottom
    local BOTTOM_TEXTURE = "Interface\\AddOns\\DecorVendor_Gallery\\Assets\\MetallicBorderStrip"
    local bottomBorder = bottom:CreateTexture(nil, "ARTWORK")
    bottomBorder:SetHeight(8)
    bottomBorder:SetPoint("BOTTOMLEFT", bottom, "BOTTOMLEFT", 0, 0)
    bottomBorder:SetPoint("BOTTOMRIGHT", bottom, "BOTTOMRIGHT", 0, 0)
    bottomBorder:SetTexture(BOTTOM_TEXTURE)
    
    local function UpdatebottomBorderCoords(_, w)
        if not w or w <= 0 then w = bottom:GetWidth() end
        if w > 0 then
            bottomBorder:SetTexCoord(0, w / 512, 0, 1)
        end
    end
    bottom:HookScript("OnSizeChanged", UpdatebottomBorderCoords)
    bottom:HookScript("OnShow", UpdatebottomBorderCoords)

    frame.bottom = bottom
        
    bottom.text = bottom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    bottom.text:SetPoint("TOPLEFT", bottom, "TOPLEFT", 8, -4)
    bottom.text:SetText("|cffaaaaaaShowing 0 items|r")  
    
    bottom.tipText = bottom:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bottom.tipText:SetPoint("RIGHT", bottom, "RIGHT", -10, 0)
    bottom.tipText:SetJustifyH("RIGHT")
    bottom.tipText:SetText("|cffffd100Tip:|r First load may take a moment.")
end

function Gallery.GetAvailableItemCount()
    local total = 0

    for _, item in ipairs(Gallery.items or {}) do
        if not DVD.IsDataAvailableForClient or DVD.IsDataAvailableForClient(item) then
            total = total + 1
        end
    end

    return total
end