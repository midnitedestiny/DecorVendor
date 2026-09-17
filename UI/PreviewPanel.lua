-- [[
-- ============================================================
-- Decor Vendor Addon - Preview Panel & Popups
-- © 2026 MidniteDestiny. All Rights Reserved.
-- ============================================================
-- ]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor PreviewPanel:|r constants are missing.")
    return
end

local Sizing = C.PreviewPanelSizing
local ReagentsSizing = C.ReagentsPopupSizing or {}
local VendorPopupSizing = C.VendorPopupSizing or {}

if not Sizing then
    print("|cffff4040DecorVendor PreviewPanel:|r PreviewPanelSizing is missing.")
    return
end

local DEFAULT_SCENE_ID = C.DEFAULT_SCENE_ID
local CAMERA_IMMEDIATE = C.CAMERA and C.CAMERA.TRANSITION_IMMEDIATE
local CAMERA_DISCARD = C.CAMERA and C.CAMERA.MODIFICATION_DISCARD
local GOLD = (C.COLORS and C.COLORS.GOLD) or { 1, 0.82, 0, 1 }
local COLLECTED_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\collected"

if not DVD.contentArea then
    print("|cffff4040DecorVendor PreviewPanel:|r DVD.contentArea is missing. Make sure MainFrame loads first.")
    return
end

local PANEL_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
}


--------------------------------------------------------------------------------
-- SECTION 1: MAIN PREVIEW PANEL & MODEL VIEWER
--------------------------------------------------------------------------------
local previewPanel = CreateFrame("Frame", "DV_PreviewPanel", DVD.contentArea, "BackdropTemplate")
DVD.previewPanel = previewPanel

previewPanel:SetWidth(Sizing.Width)
previewPanel:SetPoint("TOPRIGHT", DVD.contentArea, "TOPRIGHT", -Sizing.PanelInset, -Sizing.PanelInset)
previewPanel:SetPoint("BOTTOMRIGHT", DVD.contentArea, "BOTTOMRIGHT", -Sizing.PanelInset, Sizing.PanelInset)

previewPanel:SetBackdrop(PANEL_BACKDROP)
previewPanel:SetBackdropColor(0.018, 0.014, 0.032, 0.92)
previewPanel:SetBackdropBorderColor(0, 0, 0, 0)

local previewBg = previewPanel:CreateTexture(nil, "BACKGROUND")
previewBg:SetPoint("TOPLEFT", previewPanel, "TOPLEFT", 3, -3)
previewBg:SetPoint("BOTTOMRIGHT", previewPanel, "BOTTOMRIGHT", -3, 3)
previewBg:SetColorTexture(0.01, 0.008, 0.018, 0.86)

local modelBox = CreateFrame("Frame", "DV_ModelBox", previewPanel, "BackdropTemplate")
DVD.modelContainer = modelBox
DVD.modelBox = modelBox

modelBox:SetPoint("TOPLEFT", previewPanel, "TOPLEFT", Sizing.ModelBoxInset, -Sizing.ModelBoxInset)
modelBox:SetPoint("TOPRIGHT", previewPanel, "TOPRIGHT", -Sizing.ModelBoxInset, -Sizing.ModelBoxInset)
modelBox:SetHeight(Sizing.ModelViewerHeight)

modelBox:SetBackdrop(PANEL_BACKDROP)
modelBox:SetBackdropColor(0.01, 0.01, 0.018, 0.35)
modelBox:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.95) -- steel blue color

modelBox.modelBg = modelBox:CreateTexture(nil, "BACKGROUND")
modelBox.modelBg:SetAllPoints()
modelBox.modelBg:SetAtlas("catalog-list-preview-bg")

local modelScene = CreateFrame("ModelScene", "DV_ModelScene", modelBox, "PanningModelSceneMixinTemplate")
DVD.modelScene = modelScene

modelScene:SetPoint("TOPLEFT", modelBox, "TOPLEFT", Sizing.ModelSceneInset, -Sizing.ModelSceneInset)
modelScene:SetPoint("BOTTOMRIGHT", modelBox, "BOTTOMRIGHT", -Sizing.ModelSceneInset, Sizing.ModelSceneInset)
modelScene:EnableMouse(true)
modelScene:EnableMouseWheel(true)
modelScene:Show()

pcall(function()
    modelScene:TransitionToModelSceneID(DEFAULT_SCENE_ID, CAMERA_IMMEDIATE, CAMERA_DISCARD, true)
end)

local actor = modelScene:CreateActor()
DVD.previewActor = actor
if actor then
    if actor.SetTag then actor:SetTag("decor") end
    if actor.SetPreferModelCollisionBounds then actor:SetPreferModelCollisionBounds(true) end
end

-- Mouse Drag Rotate
local dragLastX, dragLastY = nil, nil
modelScene:HookScript("OnMouseDown", function(_, button)
    if button == "LeftButton" then dragLastX, dragLastY = GetCursorPosition() end
end)
modelScene:HookScript("OnMouseUp", function(_, button)
    if button == "LeftButton" then dragLastX, dragLastY = nil, nil end
end)
modelScene:HookScript("OnUpdate", function(self)
    if not dragLastX or not dragLastY then return end
    local x, y = GetCursorPosition()
    local dx = (x - dragLastX) * 0.02
    local dy = (y - dragLastY) * 0.02
    dragLastX, dragLastY = x, y

    local a = DVD.previewActor or self:GetActorByTag("decor") or self:GetActorByTag("item")
    if a then
        if a.SetYaw then a:SetYaw((a:GetYaw() or 0) + dx) end
        if a.SetPitch then a:SetPitch((a:GetPitch() or 0) - dy) end
    end
end)

DVD.modelControls = CreateFrame("Frame", nil, modelBox, "ModelSceneControlFrameTemplate")
DVD.modelControls:SetPoint("BOTTOM", modelBox.modelBg, "BOTTOM", 0, Sizing.ModelControlsBottomOffset)
DVD.modelControls:SetModelScene(modelScene)
DVD.modelControls:Hide()

modelBox.corbelLeft = modelBox:CreateTexture(nil, "OVERLAY")
modelBox.corbelLeft:SetAtlas("catalog-corbel-bottom-left")
modelBox.corbelLeft:SetSize(Sizing.CorbelWidth, Sizing.CorbelHeight)
modelBox.corbelLeft:SetPoint("BOTTOMLEFT", modelBox, "BOTTOMLEFT", 0, 0)

modelBox.corbelRight = modelBox:CreateTexture(nil, "OVERLAY")
modelBox.corbelRight:SetAtlas("catalog-corbel-bottom-right")
modelBox.corbelRight:SetSize(Sizing.CorbelWidth, Sizing.CorbelHeight)
modelBox.corbelRight:SetPoint("BOTTOMRIGHT", modelBox, "BOTTOMRIGHT", 0, 0)

DVD.previewWatermarkFrame = CreateFrame("Frame", nil, modelBox)
DVD.previewWatermarkFrame:SetPoint("TOPLEFT", modelBox.modelBg, "TOPLEFT", 0, 0)
DVD.previewWatermarkFrame:SetPoint("BOTTOMRIGHT", modelBox.modelBg, "BOTTOMRIGHT", 0, 0)
DVD.previewWatermarkFrame:SetFrameLevel(modelBox:GetFrameLevel() + 5)

DVD.previewWatermark = DVD.previewWatermarkFrame:CreateTexture(nil, "ARTWORK")
DVD.previewWatermark:SetSize(Sizing.WatermarkSize, Sizing.WatermarkSize)
DVD.previewWatermark:SetPoint("CENTER", DVD.previewWatermarkFrame, "CENTER", 0, 0)
DVD.previewWatermark:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga")
DVD.previewWatermark:SetAlpha(Sizing.WatermarkAlpha)

function DVD.SetPreviewWatermarkVisible(show)
    if DVD.previewWatermarkFrame then DVD.previewWatermarkFrame:SetShown(show) end
    if DVD.modelControls then DVD.modelControls:SetShown(not show) end
end

local dividerFrame = CreateFrame("Frame", "Dv_DividerLine", previewPanel)
dividerFrame:SetHeight(Sizing.DividerHeight)
dividerFrame:SetPoint("TOPLEFT", modelBox, "BOTTOMLEFT", Sizing.DividerHorizontalInset, -Sizing.DividerTopGap)
dividerFrame:SetPoint("TOPRIGHT", modelBox, "BOTTOMRIGHT", -Sizing.DividerHorizontalInset, -Sizing.DividerTopGap)
dividerFrame:SetFrameLevel(previewPanel:GetFrameLevel() + 10)

local dividerTex = dividerFrame:CreateTexture("DV_DividerTexture", "OVERLAY")
dividerTex:SetAllPoints()
dividerTex:SetColorTexture(0.86, 0.31, 0.09, 1)
DVD.modelDivider = dividerFrame

local itemContainer = CreateFrame("Frame", "DV_ItemContainer", previewPanel, "BackdropTemplate")
DVD.itemContainer = itemContainer
itemContainer:SetPoint("TOPLEFT", dividerFrame, "BOTTOMLEFT", -Sizing.ItemContainerDividerOverlap, -Sizing.ItemContainerTopGap)
itemContainer:SetPoint("TOPRIGHT", dividerFrame, "BOTTOMRIGHT", Sizing.ItemContainerDividerOverlap, -Sizing.ItemContainerTopGap)
itemContainer:SetPoint("BOTTOMRIGHT", previewPanel, "BOTTOMRIGHT", -Sizing.ItemContainerOuterInset, Sizing.ItemContainerOuterInset)
itemContainer:SetBackdrop(PANEL_BACKDROP)
itemContainer:SetBackdropColor(0.015, 0.012, 0.026, 0.75)
itemContainer:SetBackdropBorderColor(0.25, 0.52, 0.88, 0.95)

DVD.modelTitle = itemContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
DVD.modelTitle:SetFont(STANDARD_TEXT_FONT, Sizing.TitleFontSize, "OUTLINE")
DVD.modelTitle:SetJustifyH("CENTER")
DVD.modelTitle:SetDrawLayer("OVERLAY", 7)
DVD.modelTitle:SetPoint("TOPLEFT", itemContainer, "TOPLEFT", Sizing.TitleHorizontalInset, -Sizing.TitleTopOffset)
DVD.modelTitle:SetPoint("TOPRIGHT", itemContainer, "TOPRIGHT", -Sizing.TitleHorizontalInset, -Sizing.TitleTopOffset)
DVD.modelTitle:SetText("|cffaaaaaaNo Decor Selected|r")
DVD.modelTitle:Show()


--------------------------------------------------------------------------------
-- SECTION 2: REAGENTS POPUP PANEL
--------------------------------------------------------------------------------
if not tContains(UISpecialFrames, "DV_ReagentsPopup") then
    tinsert(UISpecialFrames, "DV_ReagentsPopup")
end

local REAGENT_PANEL_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

DVD.reagentsPopup = CreateFrame("Frame", "DV_ReagentsPopup", DVD.itemContainer, "BackdropTemplate")
local rpopup = DVD.reagentsPopup
rpopup:ClearAllPoints()
rpopup:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", ReagentsSizing.HorizontalInset or 8, -(ReagentsSizing.TopOffset or 8))
rpopup:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -(ReagentsSizing.HorizontalInset or 8), -(ReagentsSizing.TopOffset or 8))
rpopup:SetHeight(ReagentsSizing.DefaultHeight or 100)
rpopup:SetFrameLevel(DVD.itemContainer:GetFrameLevel() + (ReagentsSizing.FrameLevelOffset or 5))
rpopup:SetBackdrop(nil)
rpopup:Hide()

rpopup.header = rpopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
rpopup.header:SetPoint("TOP", rpopup, "TOP", 0, 0)
rpopup.header:SetFont(STANDARD_TEXT_FONT, ReagentsSizing.HeaderFontSize or 12, "OUTLINE")
rpopup.header:SetTextColor(GOLD[1], GOLD[2], GOLD[3], GOLD[4] or 1)
rpopup.header:SetText("Reagents Needed")

rpopup.recipeFrame = CreateFrame("Button", nil, rpopup, "BackdropTemplate")
rpopup.recipeFrame:SetSize(ReagentsSizing.RecipeWidth or 200, ReagentsSizing.RecipeHeight or 24)
rpopup.recipeFrame:SetPoint("TOP", rpopup.header, "BOTTOM", 0, -(ReagentsSizing.RecipeTopGap or 4))
rpopup.recipeFrame:SetBackdrop(REAGENT_PANEL_BACKDROP)
rpopup.recipeFrame:SetBackdropColor(0.035, 0.025, 0.055, 0.78)
rpopup.recipeFrame:SetBackdropBorderColor(0.45, 0.33, 0.65, 0.75)
rpopup.recipeFrame:RegisterForClicks("AnyUp")
rpopup.recipeFrame:Hide()

rpopup.recipeIcon = rpopup.recipeFrame:CreateTexture(nil, "ARTWORK")
rpopup.recipeIcon:SetSize(ReagentsSizing.RecipeIconSize or 18, ReagentsSizing.RecipeIconSize or 18)
rpopup.recipeIcon:SetPoint("LEFT", rpopup.recipeFrame, "LEFT", ReagentsSizing.RecipeIconLeftInset or 4, 0)
rpopup.recipeIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

rpopup.recipeText = rpopup.recipeFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
rpopup.recipeText:SetPoint("LEFT", rpopup.recipeIcon, "RIGHT", ReagentsSizing.RecipeTextGap or 6, 0)
rpopup.recipeText:SetPoint("RIGHT", rpopup.recipeFrame, "RIGHT", -(ReagentsSizing.RecipeTextRightInset or 4), 0)
rpopup.recipeText:SetJustifyH("LEFT")
rpopup.recipeText:SetFont(STANDARD_TEXT_FONT, ReagentsSizing.RecipeTextFontSize or 10, "OUTLINE")
rpopup.recipeText:SetTextColor(0.9, 0.9, 0.9, 1)
rpopup.recipeText:SetText("Recipe")

rpopup.recipeFrame:SetScript("OnEnter", function(self)
    if self.recipeID then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink("item:" .. tostring(self.recipeID))
        GameTooltip:Show()
    end
    self:SetBackdropBorderColor(1, 0.82, 0, 1)
end)

rpopup.recipeFrame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetBackdropBorderColor(0.45, 0.33, 0.65, 0.75)
end)

rpopup.recipeFrame:SetScript("OnClick", function(self)
    if self.recipeID and DVD.ShowWowheadLinkPopup then
        DVD.ShowWowheadLinkPopup(self.recipeID, "item")
    end
end)

DVD.reagentIconCache = DVD.reagentIconCache or {}

local function GetReagentIconFrame(i)
    local f = DVD.reagentIconCache[i]
    if f then
        f:Show()
        return f
    end

    f = CreateFrame("Frame", nil, rpopup, "BackdropTemplate")
    f:SetSize(ReagentsSizing.TileWidth or 36, ReagentsSizing.TileHeight or 36)
    f:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = ReagentsSizing.TileBorderEdgeSize or 1,
    })
    f:SetBackdropBorderColor(0.42, 0.42, 0.42, 1)
    f:SetClipsChildren(true)

    local btn = CreateFrame("Button", nil, f)
    btn:SetAllPoints()
    btn:RegisterForClicks("AnyUp")
    f.btn = btn

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", f, "TOPLEFT", ReagentsSizing.TileIconInset or 2, -(ReagentsSizing.TileIconInset or 2))
    icon:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -(ReagentsSizing.TileIconInset or 2), ReagentsSizing.TileIconBottomReserve or 10)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    f.icon = icon

    local countBg = f:CreateTexture(nil, "BACKGROUND")
    countBg:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 0, 0)
    countBg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
    countBg:SetHeight(ReagentsSizing.CountBarHeight or 12)
    countBg:SetColorTexture(0, 0, 0, 0.95)

    local countText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countText:SetPoint("BOTTOM", f, "BOTTOM", 0, ReagentsSizing.CountTextBottomOffset or 2)
    countText:SetFont(STANDARD_TEXT_FONT, ReagentsSizing.CountTextFontSize or 9, "OUTLINE")
    countText:SetTextColor(1, 1, 1, 1)
    f.countText = countText

    btn:SetScript("OnEnter", function(self)
        SetCursor("CAST_CURSOR")
        f:SetBackdropBorderColor(1, 0.82, 0, 1)
        if self.itemID then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. tostring(self.itemID))
            GameTooltip:Show()
        end
    end)

    btn:SetScript("OnLeave", function()
        ResetCursor()
        f:SetBackdropBorderColor(0.42, 0.42, 0.42, 1)
        GameTooltip:Hide()
    end)

    btn:SetScript("OnClick", function(self)
        if self.itemID and DVD.ShowWowheadLinkPopup then
            DVD.ShowWowheadLinkPopup(self.itemID, "item")
        end
    end)

    DVD.reagentIconCache[i] = f
    return f
end

function DVD.ShowReagentsPopup(itemData)
    if not DVD.reagentsPopup then return end
    local rpopup = DVD.reagentsPopup

    if not itemData or not itemData.reagents or #itemData.reagents == 0 then
        rpopup:Hide()
        return
    end

    for _, f in pairs(DVD.reagentIconCache or {}) do
        f:Hide()
    end

    local hasRecipe = itemData.recipe and itemData.recipe > 0
    local startY = ReagentsSizing.NoRecipeStartY or -20

    rpopup.recipeFrame:Hide()
    rpopup.recipeFrame.recipeID = nil

    if hasRecipe then
        rpopup.recipeFrame.recipeID = itemData.recipe
        rpopup.recipeIcon:SetTexture(GetItemIcon(itemData.recipe) or "Interface\\Icons\\INV_Scroll_03")
        rpopup.recipeText:SetText("Recipe")

        local itemObj = Item:CreateFromItemID(itemData.recipe)
        itemObj:ContinueOnItemLoad(function()
            if rpopup.recipeText then
                local recipeName = itemObj:GetItemName() or "Recipe"
                local maxChars = ReagentsSizing.RecipeNameMaxCharacters or 25
                if #recipeName > maxChars then
                    recipeName = recipeName:sub(1, maxChars - 1) .. "..."
                end
                rpopup.recipeText:SetText(recipeName)
            end
        end)

        rpopup.recipeFrame:Show()
        startY = ReagentsSizing.WithRecipeStartY or -45
    end

    local tileW = ReagentsSizing.TileWidth or 36
    local tileH = ReagentsSizing.TileHeight or 36
    local gap = ReagentsSizing.TileGap or 4
    local availableWidth = math.max(1, rpopup:GetWidth() or ReagentsSizing.FallbackWidth or 250)

    local iconsPerRow = math.floor((availableWidth + gap) / (tileW + gap))
    iconsPerRow = math.max(1, math.min(ReagentsSizing.MaxColumns or 5, iconsPerRow))

    for i, reagent in ipairs(itemData.reagents) do
        local f = GetReagentIconFrame(i)
        f:ClearAllPoints()

        local row = math.floor((i - 1) / iconsPerRow)
        local col = (i - 1) % iconsPerRow

        local iconsThisRow = math.min(#itemData.reagents - (row * iconsPerRow), iconsPerRow)
        local thisRowWidth = (iconsThisRow * tileW) + ((iconsThisRow - 1) * gap)
        local thisStartX = math.floor((availableWidth - thisRowWidth) / 2)

        f:SetPoint("TOPLEFT", rpopup, "TOPLEFT", thisStartX + col * (tileW + gap), startY - row * (tileH + gap))
        f.btn.itemID = reagent.id
        f.icon:SetTexture(GetItemIcon(reagent.id) or "Interface\\Icons\\INV_Misc_QuestionMark")
        f.countText:SetText(reagent.amount or 1)
        f:Show()
    end

    local rows = math.ceil(#itemData.reagents / iconsPerRow)
    local height = math.abs(startY) + (rows * (tileH + gap)) + (ReagentsSizing.BottomPadding or 10)

    rpopup:SetHeight(height)
    rpopup:Show()
end


--------------------------------------------------------------------------------
-- SECTION 3: VENDOR POPUP PANEL
--------------------------------------------------------------------------------
local ICON_SIZE = VendorPopupSizing.IconSize or 36
local ICON_GAP = VendorPopupSizing.IconGap or 6
local ICONS_PER_PAGE = VendorPopupSizing.IconsPerPage or 12

vendorFilteredItems = vendorFilteredItems or {}
currentVendorPage = currentVendorPage or 1

if not tContains(UISpecialFrames, "DV_VendorPopup") then
    tinsert(UISpecialFrames, "DV_VendorPopup")
end

DVD.vendorPopup = CreateFrame("Frame", "DV_VendorPopup", DVD.itemContainer, "BackdropTemplate")
local vendorPopup = DVD.vendorPopup

vendorPopup:ClearAllPoints()
vendorPopup:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", VendorPopupSizing.HorizontalInset or 8, -(VendorPopupSizing.TopOffset or 25))
vendorPopup:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -(VendorPopupSizing.HorizontalInset or 8), -(VendorPopupSizing.TopOffset or 25))
vendorPopup:SetPoint("BOTTOMRIGHT", DVD.itemContainer, "BOTTOMRIGHT", -(VendorPopupSizing.HorizontalInset or 8), VendorPopupSizing.BottomInset or 8)
vendorPopup:EnableMouseWheel(true)
vendorPopup:Hide()

DVD.popupIconCache = DVD.popupIconCache or {}
local popupIconCache = DVD.popupIconCache

local vendorZoneText = vendorPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
vendorZoneText:ClearAllPoints()
vendorZoneText:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", 0, 0)
vendorZoneText:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", -(VendorPopupSizing.ZoneRightReserve or 20), 0)
vendorZoneText:SetHeight(VendorPopupSizing.ZoneHeight or 16)
vendorZoneText:SetJustifyH("LEFT")
vendorZoneText:SetFont(STANDARD_TEXT_FONT, VendorPopupSizing.ZoneFontSize or 11, "OUTLINE")
vendorZoneText:SetTextColor(0.85, 0.85, 0.85, 1)
vendorZoneText:SetText("")
DVD.vendorZoneText = vendorZoneText

vendorPopup.content = CreateFrame("Frame", nil, vendorPopup)
vendorPopup.content:SetPoint("TOPLEFT", vendorPopup, "TOPLEFT", 0, -(VendorPopupSizing.ContentTopOffset or 20))
vendorPopup.content:SetPoint("TOPRIGHT", vendorPopup, "TOPRIGHT", 0, -(VendorPopupSizing.ContentTopOffset or 20))
vendorPopup.content:SetPoint("BOTTOM", vendorPopup, "BOTTOM", 0, VendorPopupSizing.ContentBottomOffset or 30)

DVD.pagingFrame = CreateFrame("Frame", nil, vendorPopup, "BackdropTemplate")
local pagingFrame = DVD.pagingFrame

pagingFrame:SetSize(VendorPopupSizing.PagingWidth or 120, VendorPopupSizing.PagingHeight or 24)
pagingFrame:SetPoint("BOTTOM", vendorPopup, "BOTTOM", 0, VendorPopupSizing.PagingBottomOffset or 4)
pagingFrame:SetFrameLevel(vendorPopup:GetFrameLevel() + 20)
pagingFrame:Hide()

pagingFrame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
})
pagingFrame:SetBackdropColor(0.035, 0.025, 0.055, 0.82)
pagingFrame:SetBackdropBorderColor(0.45, 0.33, 0.65, 0.75)

DVD.vendorPrevBtn = CreateFrame("Button", nil, pagingFrame)
DVD.vendorPrevBtn:SetSize(VendorPopupSizing.PagingButtonSize or 20, VendorPopupSizing.PagingButtonSize or 20)
DVD.vendorPrevBtn:SetPoint("LEFT", pagingFrame, "LEFT", VendorPopupSizing.PagingButtonInset or 4, 0)
DVD.vendorPrevBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
DVD.vendorPrevBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
DVD.vendorPrevBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")

DVD.vendorNextBtn = CreateFrame("Button", nil, pagingFrame)
DVD.vendorNextBtn:SetSize(VendorPopupSizing.PagingButtonSize or 20, VendorPopupSizing.PagingButtonSize or 20)
DVD.vendorNextBtn:SetPoint("RIGHT", pagingFrame, "RIGHT", -(VendorPopupSizing.PagingButtonInset or 4), 0)
DVD.vendorNextBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
DVD.vendorNextBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
DVD.vendorNextBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")

DVD.vendorPageText = pagingFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
DVD.vendorPageText:SetPoint("LEFT", DVD.vendorPrevBtn, "RIGHT", VendorPopupSizing.PagingTextGap or 4, 0)
DVD.vendorPageText:SetPoint("RIGHT", DVD.vendorNextBtn, "LEFT", -(VendorPopupSizing.PagingTextGap or 4), 0)
DVD.vendorPageText:SetJustifyH("CENTER")
DVD.vendorPageText:SetFont(STANDARD_TEXT_FONT, VendorPopupSizing.PagingTextFontSize or 10, "OUTLINE")
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
    if delta > 0 and currentVendorPage > 1 then
        currentVendorPage = currentVendorPage - 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    elseif delta < 0 and currentVendorPage < totalPages then
        currentVendorPage = currentVendorPage + 1
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN)
        UpdateVendorPopup()
    end
end)

local function GetPopupIconFrame(index)
    local container = popupIconCache[index]
    if container then
        container:Show()
        return container
    end

    container = CreateFrame("Frame", nil, vendorPopup.content)
    container:SetSize(ICON_SIZE, ICON_SIZE + (VendorPopupSizing.IconContainerExtraHeight or 4))

    local borderFrame = CreateFrame("Frame", nil, container, "BackdropTemplate")
    borderFrame:SetSize(ICON_SIZE, ICON_SIZE)
    borderFrame:SetPoint("TOP", container, "TOP", 0, 0)
    borderFrame:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = VendorPopupSizing.IconBorderEdgeSize or 1,
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
    icon:SetPoint("TOPLEFT", VendorPopupSizing.IconInset or 2, -(VendorPopupSizing.IconInset or 2))
    icon:SetPoint("BOTTOMRIGHT", -(VendorPopupSizing.IconInset or 2), VendorPopupSizing.IconInset or 2)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    container.icon = icon

    local checkFrame = CreateFrame("Frame", nil, container)
    checkFrame:SetSize(VendorPopupSizing.CheckSize or 16, VendorPopupSizing.CheckSize or 16)
    checkFrame:SetPoint("BOTTOM", borderFrame, "BOTTOM", 0, VendorPopupSizing.CheckOffsetY or 2)
    checkFrame:SetFrameLevel(borderFrame:GetFrameLevel() + 10)
    checkFrame:Hide()

    local checkTex = checkFrame:CreateTexture(nil, "ARTWORK")
    checkTex:SetAllPoints()
    checkTex:SetTexture(COLLECTED_ICON_TEXTURE)
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
        local itemName = (C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(self.itemID)) or (GetItemInfo and GetItemInfo(self.itemID))
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(itemName or ("Item ID: " .. tostring(self.itemID)), 0, 1, 0)
        GameTooltip:AddLine(self.isCollected and "Collected" or "Not collected", self.isCollected and 0.2 or 1, self.isCollected and 1 or 0.82, 0.2)
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
    borderFrame:SetBackdropBorderColor(self.isCollected and 1 or 0.4, self.isCollected and 1 or 0.4, self.isCollected and 1 or 0.4, 1)
    glow:SetColorTexture(0, 0, 0, 0.5)
    GameTooltip:Hide()
end

function PopupButton_OnClick(self, button)
    if not self.itemID then return end
    if button == "LeftButton" then
        DressUpItemLink("item:" .. tostring(self.itemID))
    end
end

--[[local function SetupPopupButton(container, itemID)
    local btn = container.btn
    local borderFrame = container.borderFrame

    container.itemID = itemID
    btn.itemID = itemID
    btn.isCollected = (DVD.catalogReady and DVD.IsItemCollected and DVD.IsItemCollected(itemID)) or false

    borderFrame:SetBackdropBorderColor(btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, 1)
    if btn.isCollected and vendorSettings.showVendorCheckmarks then
        container.checkFrame:Show()
    else
        container.checkFrame:Hide()
    end

    container.icon:SetTexture(GetItemIcon(itemID) or "Interface\\Icons\\INV_Misc_QuestionMark")
    btn:SetScript("OnEnter", PopupButton_OnEnter)
    btn:SetScript("OnLeave", PopupButton_OnLeave)
    btn:SetScript("OnClick", PopupButton_OnClick)
    container:Show()
end]]

local function GetSafeItemIcon(itemID)
    itemID = tonumber(itemID)
    if not itemID then return "Interface\\Icons\\INV_Misc_QuestionMark" end

    if C_Item and C_Item.GetItemIconByID then
        local icon = C_Item.GetItemIconByID(itemID)
        if icon then return icon end
    end

    if DVD.Gallery and DVD.Gallery.GetItemIcon then
        local icon = DVD.Gallery.GetItemIcon(itemID)
        if icon then return icon end
    end

    return "Interface\\Icons\\INV_Misc_QuestionMark"
end

local function SetupPopupButton(container, itemID)
    local btn = container.btn
    local borderFrame = container.borderFrame

    container.itemID = itemID
    btn.itemID = itemID
    btn.isCollected = (DVD.catalogReady and DVD.IsItemCollected and DVD.IsItemCollected(itemID)) or false

    borderFrame:SetBackdropBorderColor(btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, btn.isCollected and 1 or 0.4, 1)
    if btn.isCollected and vendorSettings.showVendorCheckmarks then
        container.checkFrame:Show()
    else
        container.checkFrame:Hide()
    end

    container.icon:SetTexture(GetSafeItemIcon(itemID))
    btn:SetScript("OnEnter", PopupButton_OnEnter)
    btn:SetScript("OnLeave", PopupButton_OnLeave)
    btn:SetScript("OnClick", PopupButton_OnClick)
    container:Show()
end

local function GetIconsPerRow()
    local width = vendorPopup.content:GetWidth()
    if not width or width <= 1 then
        width = (vendorPopup:GetWidth() or VendorPopupSizing.FallbackPopupWidth or 300) - ((VendorPopupSizing.HorizontalInset or 8) * 2)
    end
    local iconsPerRow = math.floor((width + ICON_GAP) / (ICON_SIZE + ICON_GAP))
    return math.max(1, math.min(VendorPopupSizing.MaxColumns or 6, iconsPerRow))
end

local function LayoutPopupItems(items)
    local totalItems = #items
    local columns = GetIconsPerRow()
    if totalItems <= 0 then return end

    for i, itemID in ipairs(items) do
        local container = GetPopupIconFrame(i)
        container:ClearAllPoints()

        local row = math.floor((i - 1) / columns)
        local col = (i - 1) % columns
        local iconsThisRow = math.min(totalItems - (row * columns), columns)
        local rowWidth = (iconsThisRow * ICON_SIZE) + ((iconsThisRow - 1) * ICON_GAP)

        local x = math.floor(((vendorPopup.content:GetWidth() or VendorPopupSizing.FallbackContentWidth or 280) - rowWidth) / 2)
        local y = -row * (ICON_SIZE + ICON_GAP + (VendorPopupSizing.GridRowExtraGap or 4))

        container:SetPoint("TOPLEFT", vendorPopup.content, "TOPLEFT", x + col * (ICON_SIZE + ICON_GAP), y)
        SetupPopupButton(container, itemID)
    end
end

UpdateVendorPopup = function()
    for _, iconFrame in pairs(popupIconCache) do
        iconFrame:Hide()
    end

    local totalItems = #vendorFilteredItems
    local totalPages = math.max(1, math.ceil(totalItems / ICONS_PER_PAGE))
    if currentVendorPage > totalPages then currentVendorPage = totalPages end

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
    for itemID, data in pairs(DVD.ActiveItems or {}) do
        if type(data) == "table" and type(data.soldBy) == "table" then
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
    if not DVD.modelTitle or not DVD.itemContainer then return end
    DVD.modelTitle:ClearAllPoints()
    DVD.modelTitle:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", VendorPopupSizing.PreviewTitleInset or 10, -(VendorPopupSizing.PreviewTitleInset or 10))

    if hasWaypointButton and DVD.vendorWaypointBtn then
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.vendorWaypointBtn, "TOPLEFT", -(VendorPopupSizing.PreviewTitleWaypointGap or 8), 0)
    else
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -(VendorPopupSizing.PreviewTitleInset or 10), -(VendorPopupSizing.PreviewTitleInset or 10))
    end
    DVD.modelTitle:SetHeight(VendorPopupSizing.PreviewTitleHeight or 24)
    DVD.modelTitle:SetJustifyH("CENTER")
end

local function GetVendorWaypointData(vendor)
    if DVD.ResolveVendorWaypoint then
        return DVD.ResolveVendorWaypoint(vendor)
    end
    return nil, "missing"
end

function DVD.ShowVendorPopup(vendorID, vendorName)
    if not vendorID then return end
    vendorID = tonumber(vendorID) or vendorID

    local vendor = GetVendorInfoCompat(vendorID)
    if not vendor then return end

    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]
    currentPopupVendorID = vendorID
    currentPopupNpcName = vendorName or currentPopupNpcName
    DVD.selectedVendor = vendor

    local addedItems = {}
    local seenItems = {}

    if vendorData and type(vendorData.items) == "table" then
        for _, itemID in ipairs(vendorData.items) do
            if type(itemID) == "number" and not seenItems[itemID] then
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

    AddVendorItemIDsFromActiveItems(vendorID, addedItems, seenItems)
    table.sort(addedItems)

    vendorFilteredItems = addedItems
    currentVendorPage = 1

    if DVD.vendorZoneText then
        if vendor.zone and vendor.zone ~= "" and vendor.zone ~= "It Depends" and not vendor.variableLocation then
            DVD.vendorZoneText:SetText(vendor.zone)
            DVD.vendorZoneText:Show()
        else
            DVD.vendorZoneText:SetText("")
            DVD.vendorZoneText:Hide()
        end
    end

    if not DVD.vendorWaypointBtn and DVD.itemContainer then
        DVD.vendorWaypointBtn = CreateFrame("Button", nil, DVD.itemContainer, "UIPanelButtonTemplate")
        DVD.vendorWaypointBtn:SetSize(76, 20)
        DVD.vendorWaypointBtn:SetText("Waypoint")
    end

    local waypointBtn = DVD.vendorWaypointBtn
    if waypointBtn then
        waypointBtn:ClearAllPoints()
        waypointBtn:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -10, -10)

        local location = GetVendorWaypointData(vendor)
        local shouldShowWaypoint = vendorSettings and vendorSettings.showWaypointButton and location ~= nil

        if shouldShowWaypoint then
            waypointBtn:Show()
            waypointBtn:SetScript("OnClick", function()
                local loc = GetVendorWaypointData(vendor)
                if not loc then return end
                local mapID, x, y = tonumber(loc.mapID), tonumber(loc.x), tonumber(loc.y)
                if not mapID or not x or not y then return end

                local nx = x > 1 and x / 100 or x
                local ny = y > 1 and y / 100 or y
                local title = tostring(loc.title or vendor.title or vendor.name or "Decor Vendor")

                if TomTom and TomTom.AddWaypoint then
                    TomTom:AddWaypoint(mapID, nx, ny, { title = title, persistent = false, minimap = true, world = true })
                elseif C_Map and C_Map.SetUserWaypoint and UiMapPoint then
                    local mapPoint = UiMapPoint.CreateFromCoordinates and UiMapPoint.CreateFromCoordinates(mapID, nx, ny)
                    if mapPoint then
                        C_Map.SetUserWaypoint(mapPoint)
                        if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
                            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                        end
                        if C_Map.OpenWorldMap then C_Map.OpenWorldMap(mapID) end
                    end
                end
            end)
        else
            waypointBtn:Hide()
            waypointBtn:SetScript("OnClick", nil)
        end

        LayoutVendorPreviewTitle(waypointBtn:IsShown())
    end

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


--------------------------------------------------------------------------------
-- SECTION 4: PREVIEW PANEL HELPER FUNCTIONS & CATALOG LOOKUPS
--------------------------------------------------------------------------------
function DVD.ShowPreviewEmptyState(resetContent)
    if resetContent then
        if DVD.vendorPopup then DVD.vendorPopup:Hide() end
        if DVD.reagentsPopup then DVD.reagentsPopup:Hide() end
        if DVD.vendorNotes then DVD.vendorNotes:Hide() end
        if DVD.bossNotes then DVD.bossNotes:Hide() end
        if DVD.profNotes then DVD.profNotes:Hide() end
        if DVD.questNotes then DVD.questNotes:Hide() end
    end

    if DVD.modelScene then DVD.modelScene:Show() end
    if DVD.previewActor and DVD.previewActor.ClearModel then DVD.previewActor:ClearModel() end
    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end

    if DVD.modelTitle then
        DVD.modelTitle:SetText("|cffaaaaaaNo Decor Selected|r")
        DVD.modelTitle:Show()
    end
end

function DVD.HidePreviewEmptyState()
    DVD.MarkPreviewContentShown()
end

function DVD.ShowPreviewTexture(texture, title)
    if DVD.modelScene then DVD.modelScene:Hide() end
    if DVD.texture then
        DVD.texture:SetTexture(texture)
        DVD.texture:Show()
    end
    if DVD.modelTitle then DVD.modelTitle:SetText(title or "Preview") end
end

function DVD.HidePreview()
    if DVD.modelScene then DVD.modelScene:Show() end
    if DVD.texture then DVD.texture:Hide() end
    if DVD.profNotes then DVD.profNotes:Hide() end
    if DVD.bossNotes then DVD.bossNotes:Hide() end
    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
end

local function GetCatalogInfoForDecor(decorID)
    if not decorID or not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end
    local entryType = Enum and Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1
    local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, entryType, decorID, true)
    if ok and type(info) == "table" then return info end
    return nil
end

local function BuildModelToItemLookup()
    DVD._modelToItemLookup = DVD._modelToItemLookup or {}
    if next(DVD._modelToItemLookup) then return end

    for itemID, itemData in pairs(DVD.ActiveItems or {}) do
        local model = itemData.model3D or itemData.asset
        if model then
            DVD._modelToItemLookup[model] = { itemID = itemID, data = itemData }
        end
    end
end

local function GetItemDataFromModel(modelFileID)
    BuildModelToItemLookup()
    local match = DVD._modelToItemLookup and DVD._modelToItemLookup[modelFileID]
    if match then return match.itemID, match.data end
    return nil, nil
end

function DVD.MarkPreviewContentShown()
    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(false) end
    if DVD.modelScene then DVD.modelScene:Show() end
    if DVD.modelTitle then DVD.modelTitle:Show() end
end

function DVD.ShowPreviewModel(modelFileID, title, itemData)
    if not modelFileID and not itemData then return false end
    itemData = itemData or {}

    if not itemData.decorID and modelFileID then
        local _, foundData = GetItemDataFromModel(modelFileID)
        if foundData then itemData = foundData end
    end

    local catalogInfo = GetCatalogInfoForDecor(itemData.decorID)
    local asset = (catalogInfo and catalogInfo.asset) or itemData.asset or itemData.model3D or modelFileID
    local sceneID = (catalogInfo and catalogInfo.uiModelSceneID) or itemData.uiModelSceneID or DEFAULT_SCENE_ID

    if not asset or asset == 0 then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    DVD.MarkPreviewContentShown()
    if DVD.texture then DVD.texture:Hide() end
    if DVD.modelScene then DVD.modelScene:Show() end

    local ok, shown = pcall(function()
        return DVD.ShowModel(DVD.modelScene, nil, nil, sceneID) -- handled inside ShowModel
    end)

    if not ok then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        if DVD.modelScene then DVD.modelScene:Hide() end
        return false
    end

    -- Explicitly call ShowModel with the correct parameters
    return DVD.ShowModel(DVD.modelScene, asset, nil, sceneID)
end

function DVD.ShowPreviewCreature(displayID, title)
    if not displayID then return false end
    DVD.MarkPreviewContentShown()
    if DVD.texture then DVD.texture:Hide() end

    local shown = DVD.ShowModel(DVD.modelScene, nil, displayID, DEFAULT_SCENE_ID)
    if DVD.modelTitle then DVD.modelTitle:SetText(title or "Preview") end
    return shown
end

function DVD.ShowModel(scene, modelID, displayID, sceneID)
    if not scene then return false end
    scene:Show()

    if scene.ClearScene then scene:ClearScene() end
    pcall(function()
        scene:TransitionToModelSceneID(sceneID or DEFAULT_SCENE_ID, CAMERA_IMMEDIATE, CAMERA_DISCARD, true)
    end)

    local actor = scene:GetActorByTag("decor") or scene:GetActorByTag("item")
    if not actor and scene.CreateActor then
        actor = scene:CreateActor()
        if actor and actor.SetTag then actor:SetTag("decor") end
    end

    if not actor then
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    DVD.previewActor = actor
    if actor.SetPreferModelCollisionBounds then actor:SetPreferModelCollisionBounds(true) end

    if displayID then
        actor:SetModelByCreatureDisplayID(displayID)
    elseif modelID then
        actor:SetModelByFileID(modelID)
    else
        if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(true) end
        return false
    end

    if actor.SetYaw then actor:SetYaw(0) end
    if actor.SetPitch then actor:SetPitch(0) end

    if DVD.SetPreviewWatermarkVisible then DVD.SetPreviewWatermarkVisible(false) end
    if DVD.modelControls then DVD.modelControls:Show() end

    return true
end

-- Initialize Empty State & Update Sizing
DVD.ShowPreviewEmptyState(true)

C_Timer.After(0, function()
    if DVD.frame and not DVD._previewResetOnShow then
        DVD.frame:HookScript("OnShow", function()
            C_Timer.After(0, function()
                if DVD.ShowPreviewEmptyState then DVD.ShowPreviewEmptyState(true) end
            end)
        end)
        DVD._previewResetOnShow = true
    end

    if DVD.UpdatePreviewSize then
        DVD.UpdatePreviewSize()
    end
end)