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
local DEFAULT_SCENE_ID = C.DEFAULT_SCENE_ID or 859
local CAMERA_IMMEDIATE = C.CAMERA and C.CAMERA.TRANSITION_IMMEDIATE
local CAMERA_DISCARD = C.CAMERA and C.CAMERA.MODIFICATION_DISCARD

if not DVD.contentArea then
    print("|cffff4040DecorVendor PreviewPanel:|r DVD.contentArea is missing. Make sure UI\\MainFrame.lua loads before UI\\PreviewPanel.lua.")
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

-------------------------------------------------
-- Main Preview Panel
-------------------------------------------------

local previewPanel = CreateFrame("Frame", "DV_PreviewPanel", DVD.contentArea, "BackdropTemplate")
DVD.previewPanel = previewPanel

local CatSizing = C.CatalogSizing or {}
local DETAIL_PANEL_WIDTH = CatSizing.DetailPanelWidth or 330
local MODEL_VIEWER_HEIGHT = CatSizing.ModelViewerHeight or 240

previewPanel:SetWidth(DETAIL_PANEL_WIDTH)
previewPanel:SetPoint("TOPRIGHT", DVD.contentArea, "TOPRIGHT", -4, -4)
previewPanel:SetPoint("BOTTOMRIGHT", DVD.contentArea, "BOTTOMRIGHT", -4, 4)

previewPanel:SetBackdrop(PANEL_BACKDROP)
previewPanel:SetBackdropColor(0.018, 0.014, 0.032, 0.92)
previewPanel:SetBackdropBorderColor(0.34, 0.24, 0.52, 0.9)

local previewBg = previewPanel:CreateTexture(nil, "BACKGROUND")
previewBg:SetPoint("TOPLEFT", previewPanel, "TOPLEFT", 3, -3)
previewBg:SetPoint("BOTTOMRIGHT", previewPanel, "BOTTOMRIGHT", -3, 3)
previewBg:SetColorTexture(0.01, 0.008, 0.018, 0.86)

-------------------------------------------------
-- Gallery-style Model Box
-------------------------------------------------

local modelBox = CreateFrame("Frame", "DV_ModelBox", previewPanel, "BackdropTemplate")
DVD.modelContainer = modelBox
DVD.modelBox = modelBox

modelBox:SetPoint("TOPLEFT", previewPanel, "TOPLEFT", 10, -10)
modelBox:SetPoint("TOPRIGHT", previewPanel, "TOPRIGHT", -10, -10)
modelBox:SetHeight(MODEL_VIEWER_HEIGHT)

modelBox:SetBackdrop(PANEL_BACKDROP)
modelBox:SetBackdropColor(0.01, 0.01, 0.018, 0.35)
modelBox:SetBackdropBorderColor(0.38, 0.26, 0.58, 0.9)

modelBox.modelBg = modelBox:CreateTexture(nil, "BACKGROUND")
modelBox.modelBg:SetAllPoints()
modelBox.modelBg:SetAtlas("catalog-list-preview-bg")

-------------------------------------------------
-- Model Scene
-------------------------------------------------

local modelScene = CreateFrame("ModelScene", "DV_ModelScene", modelBox, "PanningModelSceneMixinTemplate")
DVD.modelScene = modelScene

modelScene:SetPoint("TOPLEFT", modelBox, "TOPLEFT", 6, -6)
modelScene:SetPoint("BOTTOMRIGHT", modelBox, "BOTTOMRIGHT", -6, 6)
modelScene:EnableMouse(true)
modelScene:EnableMouseWheel(true)
modelScene:Show()

pcall(function()
    modelScene:TransitionToModelSceneID(
        DEFAULT_SCENE_ID,
        CAMERA_IMMEDIATE,
        CAMERA_DISCARD,
        true
    )
end)

local actor = modelScene:CreateActor()
DVD.previewActor = actor

if actor then
    if actor.SetTag then
        actor:SetTag("decor")
    end

    if actor.SetPreferModelCollisionBounds then
        actor:SetPreferModelCollisionBounds(true)
    end
end

-------------------------------------------------
-- Mouse Drag Rotate
-------------------------------------------------

local dragLastX, dragLastY = nil, nil

modelScene:HookScript("OnMouseDown", function(_, button)
    if button == "LeftButton" then
        dragLastX, dragLastY = GetCursorPosition()
    end
end)

modelScene:HookScript("OnMouseUp", function(_, button)
    if button == "LeftButton" then
        dragLastX, dragLastY = nil, nil
    end
end)

modelScene:HookScript("OnUpdate", function(self)
    if not dragLastX or not dragLastY then
        return
    end

    local x, y = GetCursorPosition()
    local dx = (x - dragLastX) * 0.02
    local dy = (y - dragLastY) * 0.02

    dragLastX, dragLastY = x, y

    local a = DVD.previewActor or self:GetActorByTag("decor") or self:GetActorByTag("item")

    if a then
        if a.SetYaw then
            a:SetYaw((a:GetYaw() or 0) + dx)
        end

        if a.SetPitch then
            a:SetPitch((a:GetPitch() or 0) - dy)
        end
    end
end)

-------------------------------------------------
-- Model Controls
-------------------------------------------------

DVD.modelControls = CreateFrame("Frame", nil, modelBox, "ModelSceneControlFrameTemplate")
DVD.modelControls:SetPoint("BOTTOM", modelBox.modelBg, "BOTTOM", 0, 8)
DVD.modelControls:SetModelScene(modelScene)
DVD.modelControls:Hide()

-------------------------------------------------
-- Gallery-style Corbels
-------------------------------------------------

modelBox.corbelLeft = modelBox:CreateTexture(nil, "OVERLAY")
modelBox.corbelLeft:SetAtlas("catalog-corbel-bottom-left")
modelBox.corbelLeft:SetSize(66, 50)
modelBox.corbelLeft:SetPoint("BOTTOMLEFT", modelBox, "BOTTOMLEFT", 0, 0)

modelBox.corbelRight = modelBox:CreateTexture(nil, "OVERLAY")
modelBox.corbelRight:SetAtlas("catalog-corbel-bottom-right")
modelBox.corbelRight:SetSize(66, 50)
modelBox.corbelRight:SetPoint("BOTTOMRIGHT", modelBox, "BOTTOMRIGHT", 0, 0)

-------------------------------------------------
-- Watermark / No Preview
-------------------------------------------------

DVD.previewWatermarkFrame = CreateFrame("Frame", nil, modelBox)
DVD.previewWatermarkFrame:SetPoint("TOPLEFT", modelBox.modelBg, "TOPLEFT", 0, 0)
DVD.previewWatermarkFrame:SetPoint("BOTTOMRIGHT", modelBox.modelBg, "BOTTOMRIGHT", 0, 0)
DVD.previewWatermarkFrame:SetFrameLevel(modelBox:GetFrameLevel() + 5)

DVD.previewWatermark = DVD.previewWatermarkFrame:CreateTexture(nil, "ARTWORK")
DVD.previewWatermark:SetSize(155, 155)
DVD.previewWatermark:SetPoint("CENTER", DVD.previewWatermarkFrame, "CENTER", 0, 0)
DVD.previewWatermark:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga")
DVD.previewWatermark:SetAlpha(0.26)

function DVD.SetPreviewWatermarkVisible(show)
    if DVD.previewWatermarkFrame then
        DVD.previewWatermarkFrame:SetShown(show)
    end

    if DVD.modelControls then
        DVD.modelControls:SetShown(not show)
    end
end

-------------------------------------------------
-- Divider
-------------------------------------------------

local dividerFrame = CreateFrame("Frame", nil, previewPanel)
dividerFrame:SetHeight(C.DIVIDER_HEIGHT or 2)
dividerFrame:SetPoint("TOPLEFT", modelBox, "BOTTOMLEFT", 12, -8)
dividerFrame:SetPoint("TOPRIGHT", modelBox, "BOTTOMRIGHT", -12, -8)
dividerFrame:SetFrameLevel(previewPanel:GetFrameLevel() + 10)

local dividerTex = dividerFrame:CreateTexture(nil, "OVERLAY")
dividerTex:SetAllPoints()
dividerTex:SetColorTexture(1, 0.82, 0.2, 0.9)

DVD.modelDivider = dividerFrame

-------------------------------------------------
-- Item / Details Container
-------------------------------------------------

local itemContainer = CreateFrame("Frame", "DV_ItemContainer", previewPanel, "BackdropTemplate")
DVD.itemContainer = itemContainer

itemContainer:SetPoint("TOPLEFT", dividerFrame, "BOTTOMLEFT", -2, -10)
itemContainer:SetPoint("TOPRIGHT", dividerFrame, "BOTTOMRIGHT", 2, -10)
itemContainer:SetPoint("BOTTOMRIGHT", previewPanel, "BOTTOMRIGHT", -10, 10)

itemContainer:SetBackdrop(PANEL_BACKDROP)
itemContainer:SetBackdropColor(0.015, 0.012, 0.026, 0.75)
itemContainer:SetBackdropBorderColor(0.24, 0.18, 0.36, 0.75)

DVD.modelTitle = itemContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
DVD.modelTitle:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
DVD.modelTitle:SetJustifyH("CENTER")
DVD.modelTitle:SetDrawLayer("OVERLAY", 7)
DVD.modelTitle:SetPoint("TOPLEFT", itemContainer, "TOPLEFT", 10, -12)
DVD.modelTitle:SetPoint("TOPRIGHT", itemContainer, "TOPRIGHT", -10, -12)
DVD.modelTitle:SetText("|cffaaaaaaNo Decor Selected|r")
DVD.modelTitle:Show()

-------------------------------------------------
-- Compatibility helpers used by row files
-------------------------------------------------

function DVD.ShowPreviewEmptyState(resetContent)
    if resetContent then
        if DVD.vendorPopup then DVD.vendorPopup:Hide() end
        if DVD.reagentsPopup then DVD.reagentsPopup:Hide() end
        if DVD.vendorNotes then DVD.vendorNotes:Hide() end
        if DVD.bossNotes then DVD.bossNotes:Hide() end
        if DVD.profNotes then DVD.profNotes:Hide() end
        if DVD.questNotes then DVD.questNotes:Hide() end
    end

    if DVD.modelScene then
        DVD.modelScene:Show()
    end

    if DVD.previewActor and DVD.previewActor.ClearModel then
        DVD.previewActor:ClearModel()
    end

    if DVD.SetPreviewWatermarkVisible then
        DVD.SetPreviewWatermarkVisible(true)
    end

    if DVD.modelTitle then
        DVD.modelTitle:SetText("|cffaaaaaaNo Decor Selected|r")
        DVD.modelTitle:Show()
    end
end

function DVD.HidePreviewEmptyState()
    DVD.MarkPreviewContentShown()
end

function DVD.ShowPreviewTexture(texture, title)
    if DVD.modelScene then
        DVD.modelScene:Hide()
    end

    if DVD.texture then
        DVD.texture:SetTexture(texture)
        DVD.texture:Show()
    end

    if DVD.modelTitle then
        DVD.modelTitle:SetText(title or "Preview")
    end
end

function DVD.HidePreview()
    if DVD.modelScene then
        DVD.modelScene:Show()
    end

    if DVD.texture then
        DVD.texture:Hide()
    end

    if DVD.profNotes then DVD.profNotes:Hide() end
    if DVD.bossNotes then DVD.bossNotes:Hide() end

    if DVD.SetPreviewWatermarkVisible then
        DVD.SetPreviewWatermarkVisible(true)
    end
end

-------------------------------------------------
-- Gallery-style Decor Catalog Lookup
-------------------------------------------------

local function GetCatalogInfoForDecor(decorID)
    if not decorID then
        return nil
    end

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end

    local entryType =
        Enum
        and Enum.HousingCatalogEntryType
        and Enum.HousingCatalogEntryType.Decor
        or 1

    local ok, info = pcall(
        C_HousingCatalog.GetCatalogEntryInfoByRecordID,
        entryType,
        decorID,
        true
    )

    if ok and type(info) == "table" then
        return info
    end

    return nil
end

local function BuildModelToItemLookup()
    DVD._modelToItemLookup = DVD._modelToItemLookup or {}

    if next(DVD._modelToItemLookup) then
        return
    end

    for itemID, itemData in pairs(DVD.ActiveItems or {}) do
        local model =
            itemData.model3D
            or itemData.asset

        if model then
            DVD._modelToItemLookup[model] = {
                itemID = itemID,
                data = itemData,
            }
        end
    end
end

local function GetItemDataFromModel(modelFileID)
    BuildModelToItemLookup()

    local match = DVD._modelToItemLookup and DVD._modelToItemLookup[modelFileID]

    if match then
        return match.itemID, match.data
    end

    return nil, nil
end

-------------------------------------------------
-- Public Preview Helpers
-------------------------------------------------

function DVD.MarkPreviewContentShown()
    if DVD.SetPreviewWatermarkVisible then
        DVD.SetPreviewWatermarkVisible(false)
    end

    if DVD.modelScene then
        DVD.modelScene:Show()
    end

    if DVD.modelTitle then
        DVD.modelTitle:Show()
    end
end

function DVD.ShowPreviewModel(modelFileID, title, itemData)
    if not modelFileID and not itemData then
        return false
    end

    itemData = itemData or {}

    if not itemData.decorID and modelFileID then
        local _, foundData = GetItemDataFromModel(modelFileID)

        if foundData then
            itemData = foundData
        end
    end

    local catalogInfo = GetCatalogInfoForDecor(itemData.decorID)

    local asset =
        (catalogInfo and catalogInfo.asset)
        or itemData.asset
        or itemData.model3D
        or modelFileID

    local sceneID =
        (catalogInfo and catalogInfo.uiModelSceneID)
        or itemData.uiModelSceneID
        or DEFAULT_SCENE_ID

    if not asset or asset == 0 then
        if DVD.SetPreviewWatermarkVisible then
            DVD.SetPreviewWatermarkVisible(true)
        end

        return false
    end

    DVD.MarkPreviewContentShown()

    if DVD.texture then
        DVD.texture:Hide()
    end

    if DVD.modelScene then
        DVD.modelScene:Show()
    end

    local ok, shown = pcall(function()
    return DVD.ShowModel(DVD.modelScene, asset, nil, sceneID)
end)

if not ok then
    if DVD.SetPreviewWatermarkVisible then
        DVD.SetPreviewWatermarkVisible(true)
    end

    if DVD.modelScene then
        DVD.modelScene:Hide()
    end

    return false
end

    if DVD.modelTitle then
        DVD.modelTitle:SetText(title or itemData.name or "Preview")
    end

    return shown
end

function DVD.ShowPreviewCreature(displayID, title)
    if not displayID then
        return false
    end

    DVD.MarkPreviewContentShown()

    if DVD.texture then
        DVD.texture:Hide()
    end

    local shown = DVD.ShowModel(DVD.modelScene, nil, displayID, DEFAULT_SCENE_ID)

    if DVD.modelTitle then
        DVD.modelTitle:SetText(title or "Preview")
    end

    return shown
end

-------------------------------------------------
-- Gallery-style Model Loader
-- Do NOT force actor scale/position for decor.
-------------------------------------------------

function DVD.ShowModel(scene, modelID, displayID, sceneID)
    if not scene then
        return false
    end

    scene:Show()

    if scene.ClearScene then
        scene:ClearScene()
    end

    pcall(function()
        scene:TransitionToModelSceneID(
            sceneID or DEFAULT_SCENE_ID,
            CAMERA_IMMEDIATE,
            CAMERA_DISCARD,
            true
        )
    end)

    local actor =
        scene:GetActorByTag("decor")
        or scene:GetActorByTag("item")

    if not actor and scene.CreateActor then
        actor = scene:CreateActor()

        if actor and actor.SetTag then
            actor:SetTag("decor")
        end
    end

    if not actor then
        if DVD.SetPreviewWatermarkVisible then
            DVD.SetPreviewWatermarkVisible(true)
        end

        return false
    end

    DVD.previewActor = actor

    if actor.SetPreferModelCollisionBounds then
        actor:SetPreferModelCollisionBounds(true)
    end

    if displayID then
        actor:SetModelByCreatureDisplayID(displayID)

    elseif modelID then
        actor:SetModelByFileID(modelID)

    else
        if DVD.SetPreviewWatermarkVisible then
            DVD.SetPreviewWatermarkVisible(true)
        end

        return false
    end

    -- Match Gallery behavior:
    -- reset rotation, but do NOT force scale or position.
    if actor.SetYaw then
        actor:SetYaw(0)
    end

    if actor.SetPitch then
        actor:SetPitch(0)
    end

    if DVD.SetPreviewWatermarkVisible then
        DVD.SetPreviewWatermarkVisible(false)
    end

    if DVD.modelControls then
        DVD.modelControls:Show()
    end

    return true
end
-------------------------------------------------
-- Reset to clean Gallery-style no-selection state
-------------------------------------------------

DVD.ShowPreviewEmptyState(true)

C_Timer.After(0, function()
    if DVD.frame and not DVD._previewResetOnShow then
        DVD.frame:HookScript("OnShow", function()
            C_Timer.After(0, function()
                if DVD.ShowPreviewEmptyState then
                    DVD.ShowPreviewEmptyState(true)
                end
            end)
        end)

        DVD._previewResetOnShow = true
    end

    if DVD.UpdatePreviewSize then
        DVD.UpdatePreviewSize()
    end
end)