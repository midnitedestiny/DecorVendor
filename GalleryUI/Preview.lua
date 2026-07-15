-- ============================================================
-- Decor Vendor Gallery
-- GalleryPreview.lua
-- Sidebar details inspector canvas panel with 3D model engine
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C
local CatSizing = C.CatalogSizing or {}

Gallery.ActiveItems = DVD.ActiveItems or {}

function Gallery.CreatePreview(frame)
    local preview = CreateFrame("Frame", "DecorVendorGalleryPreview", frame, "BackdropTemplate")
    preview:SetWidth(CatSizing.DetailPanelWidth or 330)
    preview:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -33)
    preview:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 15)
    preview:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8"})
    preview:SetBackdropColor(0.05, 0.05, 0.07, 1)

    frame.preview = preview

    preview.modelBox = CreateFrame("Frame", nil, preview)
    preview.modelBox:SetHeight(CatSizing.ModelViewerHeight or 240)
    preview.modelBox:SetPoint("TOPLEFT", preview, "TOPLEFT", 4, -4)
    preview.modelBox:SetPoint("TOPRIGHT", preview, "TOPRIGHT", -4, -4)

    preview.modelBg = preview.modelBox:CreateTexture(nil, "BACKGROUND")
    preview.modelBg:SetAllPoints()
    preview.modelBg:SetAtlas("catalog-list-preview-bg")

    preview.modelScene = CreateFrame("ModelScene", nil, preview.modelBox, "PanningModelSceneMixinTemplate")
    preview.modelScene:SetPoint("TOPLEFT", 6, -6)
    preview.modelScene:SetPoint("BOTTOMRIGHT", -6, 6)
    preview.modelScene:EnableMouse(true)
    preview.modelScene:EnableMouseWheel(true)

    local dragLastX, dragLastY = nil, nil

    preview.modelScene:HookScript(
        "OnMouseDown",
        function(self, button)
            if button == "LeftButton" then
                dragLastX, dragLastY = GetCursorPosition()
            end
        end
    )

    preview.modelScene:HookScript(
        "OnMouseUp",
        function(self, button)
            if button == "LeftButton" then
                dragLastX, dragLastY = nil, nil
            end
        end
    )

    preview.modelScene:HookScript(
        "OnUpdate",
        function(self)
            if dragLastX and dragLastY then
                local x, y = GetCursorPosition()
                local dx = (x - dragLastX) * 0.02
                local dy = (y - dragLastY) * 0.02

                dragLastX, dragLastY = x, y

                local actor = self:GetActorByTag("decor")

                if actor then
                    actor:SetYaw((actor:GetYaw() or 0) + dx)
                    actor:SetPitch((actor:GetPitch() or 0) - dy)
                end
            end
        end
    )

    preview.controls = CreateFrame("Frame", nil, preview.modelBox, "ModelSceneControlFrameTemplate")
    preview.controls:SetPoint("BOTTOM", preview.modelBg, "BOTTOM", 0, 8)
    preview.controls:SetModelScene(preview.modelScene)

    preview.corbelLeft = preview.modelBox:CreateTexture(nil, "OVERLAY")
    preview.corbelLeft:SetAtlas("catalog-corbel-bottom-left")
    preview.corbelLeft:SetSize(66, 50)
    preview.corbelLeft:SetPoint("BOTTOMLEFT", preview.modelBox, "BOTTOMLEFT", 0, 0)

    preview.corbelRight = preview.modelBox:CreateTexture(nil, "OVERLAY")
    preview.corbelRight:SetAtlas("catalog-corbel-bottom-right")
    preview.corbelRight:SetSize(66, 50)
    preview.corbelRight:SetPoint("BOTTOMRIGHT", preview.modelBox, "BOTTOMRIGHT", 0, 0)

    -- Watermark / fallback icon
    preview.watermarkFrame = CreateFrame("Frame", nil, preview)
    preview.watermarkFrame:SetPoint("TOPLEFT", preview.modelBg, "TOPLEFT", 0, 0)
    preview.watermarkFrame:SetPoint("BOTTOMRIGHT", preview.modelBg, "BOTTOMRIGHT", 0, 0)
    preview.watermarkFrame:SetFrameStrata("HIGH")

    preview.watermark = preview.watermarkFrame:CreateTexture(nil, "ARTWORK")
    preview.watermark:SetSize(180, 180)
    preview.watermark:SetPoint("CENTER", preview.watermarkFrame, "CENTER", 0, 0)
    preview.watermark:SetTexture("Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga")
    preview.watermark:SetAlpha(0.30)

    -- ============================================================
    -- 🛡️ THE "NO PREVIEW" FALLBACK TEXT ELEMENT (PASTE THIS HERE)
    -- ============================================================
    preview.watermarkText = preview.watermarkFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    preview.watermarkText:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    -- Centers the text directly on top of the watermark icon graphic
    preview.watermarkText:SetPoint("CENTER", preview.watermarkFrame, "CENTER", 0, 0)
    preview.watermarkText:SetWidth(280)
    preview.watermarkText:SetJustifyH("CENTER")
    preview.watermarkText:SetTextColor(1, 0.25, 0.25) -- Clear bright red warning shade
    preview.watermarkText:SetText("")
    -- ============================================================

    preview.watermarkFrame:Show()

    preview.name = preview:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    preview.name:SetPoint("TOP", preview.modelBox, "BOTTOM", 0, -12)
    preview.name:SetWidth(320)
    preview.name:SetHeight(38)
    preview.name:SetJustifyH("CENTER")
    preview.name:SetJustifyV("TOP")
    preview.name:SetWordWrap(true)

    preview.status = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    preview.status:SetPoint("TOP", preview.name, "BOTTOM", 0, -4)
    preview.status:SetWidth(320)
    preview.status:SetHeight(18)
    preview.status:SetJustifyH("CENTER")
    preview.status:SetText("|cffaaaaaaNo Decor Selected|r")

    preview.statsText = preview:CreateFontString(nil, "OVERLAY", "GameFontHighlight")

    local statsText = preview.statsText

    statsText:SetPoint("TOP", preview.status, "BOTTOM", 0, -10)
    statsText:SetWidth(360)
    statsText:SetHeight(28)
    statsText:SetJustifyH("CENTER")
    statsText:SetJustifyV("MIDDLE")
    statsText:SetWordWrap(false)
    statsText:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
    statsText:SetTextColor(0.9, 0.9, 0.9)
    statsText:SetText("")

    preview.sourceHeader = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    preview.sourceHeader:SetPoint("TOPLEFT", statsText, "BOTTOMLEFT", 28, -14)
    preview.sourceHeader:SetText("|cffffd100SOURCE|r")

    preview.sourceLine = preview:CreateTexture(nil, "ARTWORK")
    preview.sourceLine:SetColorTexture(0.85, 0.65, 0.2, 0.85)
    preview.sourceLine:SetPoint("TOPLEFT", preview.sourceHeader, "BOTTOMLEFT", 0, -4)
    preview.sourceLine:SetPoint("TOPRIGHT", preview, "TOPRIGHT", -16, 0)
    preview.sourceLine:SetHeight(1)

    preview.sourceText = preview:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    preview.sourceText:SetPoint("TOPLEFT", preview.sourceLine, "BOTTOMLEFT", 0, -10)
    preview.sourceText:SetWidth(320)
    preview.sourceText:SetJustifyH("LEFT")

    preview.requirementText = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    preview.requirementText:SetPoint("TOPLEFT", preview.sourceText, "BOTTOMLEFT", 0, -12)
    preview.requirementText:SetWidth(320)
    preview.requirementText:SetJustifyH("LEFT")
    preview.requirementText:SetTextColor(1, 0.82, 0.2)
    preview.requirementText:SetText("")

    preview.noteText = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    preview.noteText:SetPoint("TOPLEFT", preview.requirementText, "BOTTOMLEFT", 0, -10)
    preview.noteText:SetWidth(320)
    preview.noteText:SetJustifyH("LEFT")
    preview.noteText:SetTextColor(0.85, 0.78, 0.55)
    preview.noteText:SetText("")

    preview.actionButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.actionButton:SetSize((CatSizing.DetailPanelWidth or 330) - 16, 26)
    preview.actionButton:SetPoint("BOTTOM", 0, 18)
    preview.actionButton:SetText("No Action")
    preview.actionButton:Disable()

    preview.sourceButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.sourceButton:SetSize((CatSizing.DetailPanelWidth or 330) - 16, 24)
    preview.sourceButton:SetPoint("BOTTOM", preview.actionButton, "TOP", 0, 6)
    preview.sourceButton:SetText("Show Source Location")
    preview.sourceButton:Hide()

    preview.achievementButton = CreateFrame("Button", nil, preview, "UIPanelButtonTemplate")
    preview.achievementButton:SetSize((CatSizing.DetailPanelWidth or 330) - 16, 24)
    preview.achievementButton:SetPoint("BOTTOM", preview.sourceButton, "TOP", 0, 6)
    preview.achievementButton:SetText("Open Achievement")
    preview.achievementButton:Hide()
end

function Gallery.LoadDecorSceneSafe(scene, preferredID)
    if not scene or not scene.TransitionToModelSceneID then
        return nil
    end

    local DEFAULT_DECOR_SCENE_ID = 859
    local sceneID = preferredID or DEFAULT_DECOR_SCENE_ID

    local function tryScene(id)
        local ok = pcall(function()
            scene:TransitionToModelSceneID(
                id,
                CAMERA_TRANSITION_TYPE_IMMEDIATE,
                CAMERA_MODIFICATION_TYPE_DISCARD,
                true
            )
        end)

        if not ok then return nil end

        return scene:GetActorByTag("decor")
    end

    local actor = tryScene(sceneID)

    if actor then
        return actor
    end

    if sceneID ~= DEFAULT_DECOR_SCENE_ID then
        pcall(function()
            scene:ClearScene()
        end)

        actor = tryScene(DEFAULT_DECOR_SCENE_ID)
    end

    return actor
end

function Gallery.ShowPreviewModel(preview, item)
    if not preview or not item then return false end

    local itemData = item.data or {}
    local decorID = itemData.decorID or item.decorID
    local catalogInfo = Gallery.GetCatalogInfo and Gallery.GetCatalogInfo(decorID)

    -- 🚀 THE CRASH SHIELD CLAUSE:
    if itemData.skip3DPreview then
        if preview.modelScene then preview.modelScene:Hide() end
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        return false
    end

    local asset = (catalogInfo and catalogInfo.asset) or itemData.asset or itemData.model3D
    asset = tonumber(asset)

    local sceneID = (catalogInfo and catalogInfo.uiModelSceneID) or itemData.uiModelSceneID or 859

    if not asset or asset <= 0 then
        return false
    end

    local scene = preview.modelScene
    if not scene then return false end

    if preview.watermarkFrame then
        preview.watermarkFrame:Hide()
    end

    scene:Show()

    if preview.controls then
        preview.controls:Show()
    end

    -- =========================================================
    -- SAFE SCENE + ACTOR LOAD
    -- =========================================================
    local actor = Gallery.LoadDecorSceneSafe(scene, sceneID)

    if not actor then
        scene:Hide()
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        return false
    end

    actor:SetPreferModelCollisionBounds(true)

    local ok = pcall(function()
        actor:SetModelByFileID(asset)
    end)

    if not ok then
        scene:Hide()
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end
        return false
    end

    if actor.SetYaw then
        actor:SetYaw(0)
    end

    if actor.SetPitch then
        actor:SetPitch(0)
    end

    if preview.watermarkFrame then
        preview.watermarkFrame:Hide()
    end

    return true
end

function Gallery.UpdatePreviewDetails(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview

    if not preview or not item then return end

    if preview.statsText then
        local statsText = (Gallery.BuildPreviewStatsText and Gallery.BuildPreviewStatsText(item)) or ""
        preview.statsText:SetText(statsText)
    end
end

function Gallery.ShowItem(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview

    if not preview or not item then return end

    local itemData = item.data or {}
    preview._currentItem = item

    -- ============================================================
    -- 🛡️ PATCH PROTECTION CATCH: NO 3D ASSETS FALLBACK LINK
    -- ============================================================
    local hasNoModelAsset = itemData.unreleased or not itemData.model3D or itemData.model3D == 0

    if hasNoModelAsset then
        -- 1. Set Item Name
        local itemName = item.name or itemData.name or (Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData)) or "Unknown Decor"
        preview.name:SetText("|cffffd100" .. itemName .. "|r")
        
        -- 2. Display "Preview Unavailable" instead of freezing or crashing
        preview.status:SetText("|cffff4040Preview Unavailable|r")
        
        -- 3. Shut down the 3D scene engine and show your watermark graphic frame instead
        if preview.modelScene then preview.modelScene:Hide() end
        if preview.controls then preview.controls:Hide() end
        if preview.watermarkFrame then preview.watermarkFrame:Show() end

        -- 4. Clean up secondary button clutter
        if preview.sourceButton then preview.sourceButton:Hide() end
        if preview.achievementButton then preview.achievementButton:Hide() end

        -- 5. Hijack the main Action Button to act as your Catalogue Dressup shortcut link!
        if preview.actionButton then
            preview.actionButton:SetText("Open Housing Catalogue Link")
            preview.actionButton:Enable()
            preview.actionButton:SetAlpha(1)
            preview.actionButton:SetScript("OnClick", function()
                if C_Housing and C_Housing.OpenToDecorID then
                    local targetDecor = itemData.decorID or item.decorID or 0
                    C_Housing.OpenToDecorID(targetDecor)
                else
                    print("|cffff4040Decor Vendor Gallery:|r Housing Catalogue API is unavailable.")
                end
            end)
        end

        -- 6. Set up basic source tracking summary details text so they can still read about it
        local sourceText = "Unknown"
        if Gallery.BuildPreviewSourceText then
            sourceText = Gallery.BuildPreviewSourceText(item)
        elseif Gallery.GetSourceTextForItem then
            sourceText = Gallery.GetSourceTextForItem(item)
        end
        preview.sourceText:SetText((sourceText or "Unknown") .. "\n\n|cffff4040* 3D data files are missing from this game patch. Click the button below to view via the official Catalogue.*|r")
        
        if preview.requirementText then preview.requirementText:Hide() end

        return -- 🛑 STOP RIGHT HERE! Bypasses all normal model loading completely.
    end

    -- ============================================================
    -- Name
    -- ============================================================
    local itemName = item.name or itemData.name or (Gallery.GetItemName and Gallery.GetItemName(item.itemID, itemData)) or "Unknown Decor"

    preview.name:SetText("|cffffd100" .. itemName .. "|r")

    if string.len(itemName or "") > 34 then
        preview.name:SetFont(STANDARD_TEXT_FONT, 13, "")
    else
        preview.name:SetFont(STANDARD_TEXT_FONT, 15, "")
    end

    -- ============================================================
    -- Collection status
    -- ============================================================
    local collected = item.isCollected or (item.itemID and DVD.IsItemCollected and DVD.IsItemCollected(item.itemID)) or false

    if collected then
        preview.status:SetText("|cff00ff00Collected|r")
    else
        preview.status:SetText("|cffff4040Not Collected|r")
    end

    -- ============================================================
    -- Model preview
    -- ============================================================
    local modelShown = Gallery.ShowPreviewModel and Gallery.ShowPreviewModel(preview, item)

    if modelShown then
        if preview.watermarkFrame then
            preview.watermarkFrame:Hide()
        end
        if preview.watermarkText then
            preview.watermarkText:SetText("")
        end
    else
        if preview.modelScene then preview.modelScene:Hide() end
        if preview.controls then preview.controls:Hide() end

        if preview.watermarkFrame then
            if preview.watermarkText then
                if itemData and itemData.skip3DPreview then
                    preview.watermarkText:SetText("NO PREVIEW AVAILABLE\n|cfff5ebd1(Asset missing from game files)|r")
                    preview.watermarkFrame:Show()
                else
                    preview.watermarkText:SetText("")
                    preview.watermarkFrame:Show()
                end
            else
                preview.watermarkFrame:Show()
            end
        end
    end

    -- ============================================================
    -- Requirement
    -- ============================================================
    local requirementText = nil
    local itemDetails = Gallery.GetItemDetailsForItem and Gallery.GetItemDetailsForItem(item) or {}
    local vendorDetails = Gallery.GetVendorDetailsForItem and Gallery.GetVendorDetailsForItem(item)

    local hasVendorDetails = itemData.soldBy or itemData.vendorID or (type(vendorDetails) == "table" and next(vendorDetails) ~= nil)

    if not hasVendorDetails then
        local requirement = itemDetails.requirement or itemDetails.requires or itemData.requirement or itemData.requires

        if requirement and Gallery.FormatRequirement then
            requirementText = Gallery.FormatRequirement(requirement)
        elseif type(requirement) == "string" then
            requirementText = requirement
        end
    end

    if preview.requirementText then
        if requirementText and requirementText ~= "" then
            preview.requirementText:SetText("|cffffd100Requirement:|r\n" .. requirementText)
            preview.requirementText:Show()
        else
            preview.requirementText:SetText("")
            preview.requirementText:Hide()
        end
    end

    -- ============================================================
    -- Note
    -- ============================================================
    if preview.noteText then
        preview.noteText:SetText("")
        preview.noteText:Hide()
    end

    -- ============================================================
    -- Extra preview details
    -- ============================================================
    if Gallery.UpdatePreviewDetails then
        Gallery.UpdatePreviewDetails(item)
    end

    -- ============================================================
    -- Source/details text
    -- ============================================================
    local sourceText
    if Gallery.BuildPreviewSourceText then
        sourceText = Gallery.BuildPreviewSourceText(item)
    elseif Gallery.GetSourceTextForItem then
        sourceText = Gallery.GetSourceTextForItem(item)
    else
        sourceText = "Unknown"
    end

    preview.sourceText:SetText(sourceText or "Unknown")
    preview.sourceText:SetTextColor(1, 1, 1, 1)

    if not Gallery.BuildPreviewSourceText then
        local achievementText = Gallery.GetAchievementSourceText and Gallery.GetAchievementSourceText(item)

        if achievementText then
            sourceText = sourceText .. "\n\n" .. achievementText
        end

        local vendors = Gallery.GetVendorNamesFromItem and Gallery.GetVendorNamesFromItem(itemData)

        if vendors then
            sourceText = sourceText .. "\n\n|cff80ff80Sold by:|r " .. vendors
        end

        if itemData.questName then
            sourceText = sourceText .. "\n|cff80ff80Quest:|r " .. itemData.questName
        elseif itemData.questID then
            sourceText = sourceText .. "\n|cff80ff80Quest ID:|r " .. tostring(itemData.questID)
        end

        if itemData.bossName then
            sourceText = sourceText .. "\n|cff80ff80Boss:|r " .. itemData.bossName
        elseif itemData.bossevent then
            sourceText = sourceText .. "\n|cff80ff80Event:|r " .. tostring(itemData.bossevent)
        elseif itemData.bossencounter then
            sourceText = sourceText .. "\n|cff80ff80Boss Encounter:|r " .. tostring(itemData.bossencounter)
        end

        if itemData.profession then
            sourceText = sourceText .. "\n|cff80ff80Profession:|r " .. tostring(itemData.profession)
        end
    end

    -- ============================================================
    -- Buttons
    -- ============================================================
    if Gallery.UpdateActionButton then
        Gallery.UpdateActionButton(item)
    end

    -- ============================================================
    -- 🚀 THE DRESS-UP LINK ACTION BUTTON HIJACK SHIELD
    -- ============================================================
    if itemData.skip3DPreview then
        preview.actionButton:SetText("Open Housing Catalogue")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)
        
        local targetItemID = item.itemID or itemData.itemID or 0

        preview.actionButton:SetScript("OnClick", function(self, button)
            if button == "LeftButton" and targetItemID > 0 then
                DressUpItemLink("item:" .. tostring(targetItemID))
            else
                print("|cffff4040Decor Vendor Gallery:|r Missing itemID for dress-up fallback.")
            end
        end)
        
        return
    end

    if Gallery.UpdateAchievementButton then
        Gallery.UpdateAchievementButton(item)
    end
end

function Gallery.UpdateActionButton(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview

    if not preview or not preview.actionButton then
        return
    end

    preview.actionButton:SetScript("OnClick", nil)
    preview.actionButton:Disable()
    preview.actionButton:SetAlpha(0.55)
    preview.actionButton:SetText("No Action")

    if preview.sourceButton then
        preview.sourceButton:SetScript("OnClick", nil)
        preview.sourceButton:Disable()
        preview.sourceButton:SetAlpha(0.55)
        preview.sourceButton:SetText("Show Source Location")
        preview.sourceButton:Hide()
    end

    if preview.achievementButton then
        preview.achievementButton:SetScript("OnClick", nil)
        preview.achievementButton:Disable()
        preview.achievementButton:SetAlpha(0.55)
        preview.achievementButton:SetText("Open Achievement")
        preview.achievementButton:Hide()
    end

    if not item then
        return
    end

    local itemData = item.data or {}

    local function NormalizeSource(value)
        if Gallery.NormalizeSource then
            return Gallery.NormalizeSource(value)
        end
        return string.lower(tostring(value or ""))
    end

    local function HasSource(sourceKey)
        sourceKey = NormalizeSource(sourceKey)

        if Gallery.ItemHasSource and Gallery.ItemHasSource(item, sourceKey) then
            return true
        end

        if NormalizeSource(item.source) == sourceKey or NormalizeSource(item.sourceType) == sourceKey then
            return true
        end

        if NormalizeSource(itemData.source) == sourceKey or NormalizeSource(itemData.sourceType) == sourceKey then
            return true
        end

        local sources = item.sources or item.sourceTypes or itemData.sources or itemData.sourceTypes

        if type(sources) == "table" then
            for key, value in pairs(sources) do
                if value == true and NormalizeSource(key) == sourceKey then
                    return true
                end
                if NormalizeSource(value) == sourceKey then
                    return true
                end
            end
        end

        return false
    end

    local specialAction = Gallery.GetSpecialActionForItem and Gallery.GetSpecialActionForItem(item)
    local achievementInfo = Gallery.GetAchievementForItem and Gallery.GetAchievementForItem(item)
    local bestVendor = Gallery.GetBestFactionVendorForItem and Gallery.GetBestFactionVendorForItem(item)
    local vendors = Gallery.GetVendorsForItem and Gallery.GetVendorsForItem(item) or {}

    local hasVendorPath = bestVendor or #vendors > 0
    local hasShopPath = HasSource("shop")

    if achievementInfo and achievementInfo.id and preview.achievementButton then
        preview.achievementButton:SetText("Open Achievement")
        preview.achievementButton:Show()
        preview.achievementButton:Enable()
        preview.achievementButton:SetAlpha(1)

        preview.achievementButton:SetScript("OnClick", function()
            if Gallery.OpenAchievementByID then
                Gallery.OpenAchievementByID(achievementInfo.id)
                return
            end

            if AchievementFrame_LoadUI then AchievementFrame_LoadUI() end
            if AchievementFrame_ToggleAchievementFrame then AchievementFrame_ToggleAchievementFrame() end
            if AchievementFrame_SelectAchievement then AchievementFrame_SelectAchievement(achievementInfo.id) end
        end)
    end

    if specialAction and preview.sourceButton and (hasVendorPath or hasShopPath) then
        if specialAction.type == "journal" then
            preview.sourceButton:SetText("Open Source Journal")
        elseif specialAction.type == "map" then
            local count = specialAction.locations and #specialAction.locations or 0
            if count > 1 then
                preview.sourceButton:SetText("Pin Source Locations")
            else
                preview.sourceButton:SetText("Show Source Location")
            end
        elseif specialAction.type == "worldmap" then
            preview.sourceButton:SetText("Open Source Map")
        else
            preview.sourceButton:SetText("Open Source")
        end

        preview.sourceButton:Show()
        preview.sourceButton:Enable()
        preview.sourceButton:SetAlpha(1)

        preview.sourceButton:SetScript("OnClick", function()
            if Gallery.RunSpecialItemAction then Gallery.RunSpecialItemAction(item) end
        end)
    end

    if hasShopPath then
        preview.actionButton:SetText("Open In-Game Shop")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)

        preview.actionButton:SetScript("OnClick", function()
            if C_AddOns and C_AddOns.LoadAddOn then
                pcall(C_AddOns.LoadAddOn, "Blizzard_StoreUI")
            end

            if ToggleStoreUI then
                ToggleStoreUI()
            else
                print("|cffff4040Decor Vendor Gallery:|r The in-game shop UI is not available right now.")
            end
        end)

        return
    end

if bestVendor then
    preview.actionButton:SetText("Navigate (" .. (bestVendor.title or bestVendor.name or "Vendor") .. ")")
    preview.actionButton:Enable()
    preview.actionButton:SetAlpha(1)

    preview.actionButton:SetScript("OnClick", function()
        if Gallery.SetWaypointToVendor then
            local itemName =
                (Gallery.GetItemName and Gallery.GetItemName(item.itemID, item.data))
                or item.name
                or itemData.name
                or "Decor"

            Gallery.SetWaypointToVendor(bestVendor, itemName)
        end
    end)

    return
end

-------------------------------------------------
-- Special source actions must come BEFORE
-- the generic "Location Varies" vendor fallback.
-- This handles Celestine / Dreamsurge.
-------------------------------------------------
if specialAction then
    if specialAction.type == "journal" then
        preview.actionButton:SetText("Open Encounter Journal")

    elseif specialAction.type == "map" then
        local count = specialAction.locations and #specialAction.locations or 0

        if count > 1 then
            preview.actionButton:SetText("Pin Locations")
        else
            preview.actionButton:SetText("Show Location")
        end

    elseif specialAction.type == "worldmap" then
        preview.actionButton:SetText("Open Map")

    else
        preview.actionButton:SetText("Open Source")
    end

    preview.actionButton:Enable()
    preview.actionButton:SetAlpha(1)

    preview.actionButton:SetScript("OnClick", function()
        if Gallery.RunSpecialItemAction then
            Gallery.RunSpecialItemAction(item)
        end
    end)

    return
end

-------------------------------------------------
-- Generic vendor fallback only after specialAction.
-------------------------------------------------
if #vendors > 0 then
    preview.actionButton:SetText("Location Varies")
    preview.actionButton:Disable()
    preview.actionButton:SetAlpha(0.55)
    preview.actionButton:SetScript("OnClick", nil)
    return
end
    
-------------------------------------------------
-- Vendor sourceAction fallback.
-- This handles vendors like Celestine / Dreamsurge
-- where the item has vendors but no fixed mapID/x/y.
-------------------------------------------------
if not specialAction and type(vendors) == "table" then
    local sourceActions =
        (Gallery.C and (Gallery.C.SOURCE_ACTIONS or Gallery.C.SourceActions))
        or (DVD.Shared and DVD.Shared.SourceActions)
        or DVD.SOURCE_ACTIONS
        or DVD.SourceActions

    for _, vendor in ipairs(vendors) do
        local actionKey =
            vendor.sourceAction
            or vendor.mapAction
            or vendor.locationAction
            or vendor.rareEvent
            or vendor.eventName

        -- Exact vendor table fallback, in case GetVendorsForItem did not copy sourceAction.
        if not actionKey and vendor.id and DVD.npcs then
            local exactVendor =
                DVD.npcs[tonumber(vendor.id)]
                or DVD.npcs[tostring(vendor.id)]

            if type(exactVendor) == "table" then
                actionKey =
                    exactVendor.sourceAction
                    or exactVendor.mapAction
                    or exactVendor.locationAction
                    or exactVendor.rareEvent
                    or exactVendor.eventName
            end
        end

        local action =
            actionKey
            and sourceActions
            and sourceActions[actionKey]

        if type(action) == "table" then
            if action.type == "map" then
                local locations = {}

                if type(action.locations) == "table" then
                    for _, loc in ipairs(action.locations) do
                        if type(loc) == "table" then
                            local mapID = loc.mapID or action.mapID

                            if mapID and loc.x and loc.y then
                                table.insert(locations, {
                                    mapID = mapID,
                                    x = loc.x,
                                    y = loc.y,
                                    title = loc.title or loc.name or action.label or actionKey,
                                    zone = loc.zone or action.zone,
                                })
                            end
                        end
                    end
                end

                if #locations > 0 then
                    specialAction = {
                        type = "map",
                        title = action.label or actionKey,
                        locations = locations,
                        openMapID = action.openMapID or action.parentMapID or action.mapID,
                    }

                    break
                end
            elseif action.type == "worldmap" and action.mapID then
                specialAction = {
                    type = "worldmap",
                    mapID = action.mapID,
                    title = action.label or actionKey,
                }

                break
            elseif action.type == "journal" then
                specialAction = action
                break
            end
        end
    end
end	
	local achievementID = itemData.achievementID or item.achievementID or itemData.vendorUnlockAchievementID or item.vendorUnlockAchievementID or (achievementInfo and achievementInfo.id)

    if achievementID then
        preview.actionButton:SetText("Open Achievement")
        preview.actionButton:Enable()
        preview.actionButton:SetAlpha(1)

        preview.actionButton:SetScript("OnClick", function()
            if Gallery.OpenAchievementByID then
                Gallery.OpenAchievementByID(achievementID)
                return
            end

            if AchievementFrame_LoadUI then AchievementFrame_LoadUI() end
            if AchievementFrame_ToggleAchievementFrame then AchievementFrame_ToggleAchievementFrame() end
            if AchievementFrame_SelectAchievement then AchievementFrame_SelectAchievement(achievementID) end
        end)

        return
    end
end