local addonName, dv = ...
local TAB_LEFT_PADDING = {
    vendors = 180,  -- room for sidebar
    professions = 10,
}

function dv.CreateVendorLine(parent, vendor, y)
local line = CreateFrame("Button", nil, parent)
line:SetPoint("TOPLEFT", 10, y)
line:SetSize(590, 22)

local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
text:SetPoint("LEFT", 0, 0)
text:SetFont(STANDARD_TEXT_FONT, 14)
text:SetText(vendor.title or "Unknown Vendor")

local isFound =
    vendorSettings.visited
    and vendorSettings.visited[vendor.id]

    local function SetFactionColor()
        if vendor.faction == "alliance" then
            text:SetTextColor(0.3, 0.6, 1)
        elseif vendor.faction == "horde" then
            text:SetTextColor(1, 0.2, 0.2)
        else
            text:SetTextColor(0.2, 0.8, 0.3)
        end
    end
    SetFactionColor()
	
if isFound and vendorSettings.markFound then
    text:SetTextColor(0.6, 0.6, 0.6) -- greyed out
    text:SetAlpha(0.7)
end

    if vendor.zone then
        local zoneText = line:CreateFontString(nil, "OVERLAY")
        zoneText:SetFont(STANDARD_TEXT_FONT, 11)
        zoneText:SetPoint("RIGHT", -10, 0)
        zoneText:SetText(vendor.zone)
        zoneText:SetTextColor(1, 0.82, 0)
    end

local function UpdatePreview(vendor)
    if not vendor or not vendor.model3D then
        dv.previewFrame.model:Hide()
        return
    end

    local preview = dv.previewFrame
    local model   = preview.model

    preview.title:SetText(vendor.title or "Preview")

    model:ClearModel()
    model:SetDisplayInfo(vendor.model3D) -- displayID from Wowhead
    model:Show()

    if preview.texture then
        preview.texture:Hide()
    end
end

    line:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            dv.ShowVendorPopup(vendor.id, vendor.title)
        end
    end)

line:SetScript("OnEnter", function()
    text:SetTextColor(1, 0.82, 0, 1)

    GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
    GameTooltip:AddLine(vendor.title, 1, 1, 1)

    if vendor.zone then
        GameTooltip:AddLine("Zone: " .. vendor.zone, 0.8, 0.8, 0.8)
    end

    if vendor.mapID then
        local mapInfo = C_Map.GetMapInfo(vendor.mapID)
        if mapInfo then
            GameTooltip:AddLine(mapInfo.name, 1, 0.82, 0)
        end
    end

    GameTooltip:AddLine("\n|cff00ff00<Left Click>|r Open Vendor Items", 1, 1, 1)
    GameTooltip:Show()

    -- 🔒 CRASH-SAFE PREVIEW
    if vendor
       and vendor.model3D
       and dv.previewFrame
       and dv.previewFrame.model
       and not InCombatLockdown()
    then
        dv.AnchorPreviewBelowTooltip(dv.previewFrame, GameTooltip)
        UpdatePreview(vendor)
    end
end)

line:SetScript("OnLeave", function()
    GameTooltip:Hide()

    dv.previewFrame.model:ClearModel()
    dv.previewFrame:Hide()

    if isFound and vendorSettings.markFound then
        text:SetTextColor(0.6, 0.6, 0.6)
        text:SetAlpha(0.7)
    else
        SetFactionColor()
        text:SetAlpha(1)
    end
end)

    if vendor.mapID and vendor.x and vendor.y then
        local waypointBtn = CreateFrame("Button", nil, line, "UIPanelButtonTemplate")
        waypointBtn:SetSize(80, 18)
        waypointBtn:SetPoint("RIGHT", -240, 0)
        waypointBtn:SetText("Waypoint")

        waypointBtn:SetScript("OnClick", function()
            if hasTomTom then
                TomTom:AddWaypoint(
                    vendor.mapID,
                    vendor.x / 100,
                    vendor.y / 100,
                    {
                        title = vendor.title.. " - " .. (vendor.zone or ""),
                        persistent = false,
                        minimap = true,
                        world = true,
                    }
                )
            end

            local vec = CreateVector2D(vendor.x / 100, vendor.y / 100)
            local mapPoint = UiMapPoint.CreateFromVector2D(vendor.mapID, vec)
            C_Map.SetUserWaypoint(mapPoint)
            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end)
    end

    table.insert(dv.activeWidgets, line)
    return y - 24
end

function dv.CreateGoodieLine(parent, goodie, y)
    local id = goodie.id
    local name, loading = nil, false
    local isCompleted = false

    if goodie.type == "achievement" then
        local _, _, _, completed = GetAchievementInfo(id)
        isCompleted = completed

    elseif goodie.type == "quest" then
        isCompleted = dv.IsQuestEffectivelyCompleted(goodie)
    end

    -- Hide ONLY if Hide Completed ON and Mark Completed OFF
    if isCompleted and vendorSettings.hideCompleted and not vendorSettings.markCompleted then
        return y
    end

    if goodie.type == "quest" then
        name = dv.questTitleCache[id] or C_QuestLog.GetTitleForQuestID(id)
        if name then
            dv.questTitleCache[id] = name
        else
            name = "Loading quest..."
            loading = true
        end
    else
        name = select(2, GetAchievementInfo(id)) or "Unknown Achievement"
    end

    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", 10, y)
    line:SetSize(590, 22)
    line:RegisterForClicks("AnyUp")
    line.text = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    line.text:SetPoint("LEFT", 0, 0)
    line.text:SetFont(STANDARD_TEXT_FONT, 12)
    line.text:SetText(name)		
-- Right-side note (zone-style metadata)
if goodie.note then
    line.note = line:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    line.note:SetPoint("RIGHT", -8, 0)
    line.note:SetJustifyH("RIGHT")
    line.note:SetText("|cffaaaaaa" .. goodie.note .. "|r")
end

    if isCompleted then
        line.text:SetTextColor(0.2, 1, 0.2)
    end

    local wowheadBox = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    wowheadBox:SetSize(260, 22)
    wowheadBox:SetPoint("LEFT", line.text, "RIGHT", 8, 0)
    wowheadBox:SetAutoFocus(false)
    wowheadBox:Hide()

    wowheadBox:SetScript("OnChar", function(self)
        self:SetText(self:GetText())
        self:HighlightText()
    end)

    wowheadBox:SetScript("OnMouseUp", function(self)
        self:HighlightText()
    end)

    local function SetBaseColor()
        if isCompleted and vendorSettings.markCompleted then
            line.text:SetTextColor(0.62, 0.62, 0.62)
            line.text:SetAlpha(0.7)
            return
        end

        line.text:SetAlpha(1)

        if goodie.faction then
            local f = string.lower(goodie.faction)
            if f == "alliance" then
                line.text:SetTextColor(0.3, 0.6, 1)
            elseif f == "horde" then
                line.text:SetTextColor(1, 0.2, 0.2)
            elseif f == "neutral" then
                line.text:SetTextColor(0.2, 0.8, 0.3)
            end
        else
            line.text:SetTextColor(0.9, 0.9, 0.9)
        end
    end
    SetBaseColor()

    if loading then
        QuestEventListener:AddCallback(id, function()
            local newName = C_QuestLog.GetTitleForQuestID(id)
            if newName and line.text:IsVisible() then
                line.text:SetText(newName)
                dv.questTitleCache[id] = newName
            end
        end)
    end

local function UpdatePreview(goodie)
    if not goodie or not dv.previewFrame then return end

    local preview = dv.previewFrame
    local model   = preview.model
    local texture = preview.texture

    -- 📝 Title (guarded)
    if type(goodie.title) == "string" then
        preview.title:SetText(goodie.title)
    else
        preview.title:SetText("Preview")
    end

    ----------------------------------------------------------------
    -- 🧙 1️⃣ Vendor / NPC preview (vendor unlock quests, vendors)
    ----------------------------------------------------------------
    if goodie.vendorDisplayID then
        preview._isVendorPreview = true
        texture:Hide()
        model:ClearModel()
        model:SetDisplayInfo(goodie.vendorDisplayID)
        model:Show()

        return
    end

    ----------------------------------------------------------------
    -- 🪑 2️⃣ Normal decor / item model
    ----------------------------------------------------------------
    preview._isVendorPreview = false

    if goodie.model3D then
        texture:Hide()
        model:ClearModel()
        model:SetModel(goodie.model3D)
        model:Show()

        model:MakeCurrentCameraCustom()

        local pos = dv.modelPositions[goodie.model3D]
        if pos then
            model:SetPosition(pos.model_x, 0, pos.model_z)
            model:SetCameraPosition(0, 0, pos.camera_y)
            model:SetCameraDistance(pos.zoom)
        else
            model:SetPosition(0, 0, 0)
            model:SetCameraPosition(0, 0, 4)
            model:SetCameraDistance(10)
        end

        return
    end

    ----------------------------------------------------------------
    -- 🖼️ 3️⃣ Texture fallback
    ----------------------------------------------------------------
    if goodie.texture then
        model:Hide()
        texture:SetTexture(goodie.texture)
        texture:Show()
        return
    end

    ----------------------------------------------------------------
    -- ❌ 4️⃣ Nothing to preview
    ----------------------------------------------------------------
    model:Hide()
    texture:Hide()
end

    line:SetScript("OnEnter", function()
        line.text:SetTextColor(1, 0.82, 0)

        GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
        if goodie.type == "quest" then
            GameTooltip:SetHyperlink("quest:" .. id)
        else
            GameTooltip:SetHyperlink(GetAchievementLink(id))
        end

        GameTooltip:AddLine(" ")

        if goodie.type == "achievement" then
            GameTooltip:AddLine("|cff00ff00<Left Click>|r Open Achievement")
            GameTooltip:AddLine("|cffff5500<Right Click>|r Copy Wowhead Link")
        else
            GameTooltip:AddLine("|cffff5500<Right Click>|r Copy Wowhead Link")
        end

        GameTooltip:Show()

        dv.AnchorPreviewBelowTooltip(dv.previewFrame, GameTooltip)
        UpdatePreview(goodie)
    end)

    line:SetScript("OnClick", function(_, button)
        if button == "LeftButton" and goodie.type == "achievement" then
if not AchievementFrame or not AchievementFrame:IsShown() then
    AchievementFrame_LoadUI()
    AchievementFrame_ToggleAchievementFrame()
end

AchievementFrame_SelectAchievement(id)

            

        elseif button == "RightButton" then
            local url = dv:GetWowheadLink(id, goodie.type)

            if dv.activeWowheadBox and dv.activeWowheadBox ~= wowheadBox then
                dv.activeWowheadBox:Hide()
            end

            wowheadBox:SetText(url)
            wowheadBox:Show()
            wowheadBox:SetFocus()
            wowheadBox:HighlightText()
            dv.activeWowheadBox = wowheadBox
        end
    end)

    line:SetScript("OnLeave", function()
        GameTooltip:Hide()
        dv.previewFrame:Hide()
        SetBaseColor()
    end)

    wowheadBox:SetScript("OnEditFocusLost", function()
        wowheadBox:Hide()
        if dv.activeWowheadBox == wowheadBox then
            dv.activeWowheadBox = nil
        end
    end)

    table.insert(dv.activeWidgets, line)
    return y - 22
end

function dv.CreateProfessionLine(parent, profItem, y)
local isCompleted = false
if profItem.spell then
    isCompleted = IsSpellKnown(profItem.spell) or IsPlayerSpell(profItem.spell)
end

   local line = CreateFrame("Button", nil, parent)
	local pad = TAB_LEFT_PADDING[dv.currentTab] or 10
	line:SetPoint("TOPLEFT", pad, y)
	line:RegisterForClicks("AnyUp") -- 🔥 REQUIRED
	--line:SetPoint("TOPLEFT", 10, y)
	line:SetSize(560, 22)

    -------------------------------------------------
    -- ITEM NAME (FAST / ASYNC)
    -------------------------------------------------
    local nameText = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("TOPLEFT", 0, -2)
    nameText:SetJustifyH("LEFT")
    nameText:SetText("• Loading item...")
	if isCompleted then
    nameText:SetTextColor(0.5, 1, 0.5)
else
    nameText:SetTextColor(1, 1, 1)
end

    -- Async-safe item name
    local itemObj = Item:CreateFromItemID(profItem.id)
    itemObj:ContinueOnItemLoad(function()
        if nameText then
            nameText:SetText(itemObj:GetItemName())
        end
    end)

    -------------------------------------------------
    -- SKILL LINE (THIS IS THE PART YOU ASKED FOR)
    -------------------------------------------------
    local skillText = line:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	skillText:SetPoint("RIGHT", line, "RIGHT", -12, 0)
	skillText:SetJustifyH("RIGHT")

	local skillString = (profItem.skill or "Skill") .. " (" .. (profItem.skillNeeded or 0) .. ")"
	skillText:SetText(skillString)
    skillText:SetTextColor(1, 0.82, 0)

	local function UpdatePreview(profItem)
    local modelID = profItem and profItem.model3D
    local model = dv.previewFrame.model
   -- Set the title if provided
	if profItem and itemObj then
    itemObj:ContinueOnItemLoad(function()
        if dv.previewFrame and dv.previewFrame.title then
            dv.previewFrame.title:SetText(itemObj:GetItemName() or "Preview")
        end
    end)
	else
    dv.previewFrame.title:SetText("Preview")
	end

    if modelID then
        model:ClearModel()
        model:SetModel(modelID)
        model:Show()
        if dv.previewFrame.texture then
            dv.previewFrame.texture:Hide()
        end
    else
        model:Hide()
    end
end


    -------------------------------------------------
    -- HOVER: TOOLTIP + PREVIEW
    -------------------------------------------------
line:SetScript("OnEnter", function(self)
    SetCursor("INSPECT_CURSOR")

    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetItemByID(profItem.id)
    GameTooltip:AddLine("\n|cff00ff00<Left Click>|r View Decor", 1, 1, 1)
    GameTooltip:AddLine("|cff00ff00<Right Click>|r View Reagents", 1, 1, 1)
    GameTooltip:Show()
local decorData = dv.professionItem[profItem.id]
			if decorData and not decorData.thumbnailID then
				local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, decorData.decorID, true)
				decorData.thumbnailID = info and info.iconTexture
			end
			if decorData and decorData.thumbnailID then
				dv.smallPreviewTexture:SetTexture(decorData.thumbnailID)
				dv.AnchorPreviewBelowTooltip(dv.smallPreviewFrame, GameTooltip)
			end
       -- Position preview below tooltip
    --dv.AnchorPreviewBelowTooltip(dv.previewFrame, GameTooltip)

    -- Update the model/texture
    UpdatePreview(profItem) 
    end)

line:SetScript("OnLeave", function()
    ResetCursor()
    GameTooltip:Hide()

    if dv.smallPreviewFrame then
        dv.smallPreviewFrame:Hide()
    end

    if dv.previewFrame then
        dv.previewFrame:Hide()
    end
end)


    -------------------------------------------------
    -- CLICK BEHAVIOR
    -------------------------------------------------
    line:SetScript("OnClick", function(_, button)

    if IsModifiedClick("CHATLINK") then
        local _, link = GetItemInfo(profItem.id)
        if link then ChatEdit_InsertLink(link) end

    elseif button == "LeftButton" then
        DressUpItemLink("item:" .. profItem.id)

    elseif button == "RightButton" then
            dv.ShowReagentsPopup(profItem)   
    end
end)


    table.insert(dv.activeWidgets, line)
    return y - 22
end

function dv.CreateBossDropLine(parent, boss, y)
    local pad = TAB_LEFT_PADDING[dv.currentTab] or 10

    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", pad, y)
    line:SetSize(560, 22)
    line:RegisterForClicks("AnyUp")

    -------------------------------------------------
    -- TEXT
    -------------------------------------------------
    local nameFS = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameFS:SetPoint("LEFT", 0, 0)

nameFS:SetText("Loading...")

local item = Item:CreateFromItemID(boss.id)
item:ContinueOnItemLoad(function()
    local itemName = item:GetItemName()
    if itemName and nameFS then
        nameFS:SetText(itemName)
    end
end)


    -------------------------------------------------
    -- COLLECTED CHECK
    -------------------------------------------------
    local isCollected = dv.IsItemCollected(boss.id)

    if isCollected then
        nameFS:SetTextColor(0.2, 1, 0.2) -- green
    else
        nameFS:SetTextColor(1, 1, 1)
    end

    -------------------------------------------------
    -- SOURCE TEXT (RIGHT SIDE)
    -------------------------------------------------
    local sourceFS = line:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    sourceFS:SetPoint("RIGHT", -8, 0)

    if boss.bossencounter then
        local encounterName = EJ_GetEncounterInfo(boss.bossencounter)
        sourceFS:SetText(encounterName or "Unknown Boss")
    elseif boss.bossevent then
        sourceFS:SetText(boss.bossevent)
    else
        sourceFS:SetText("Unknown Source")
    end

    -------------------------------------------------
    -- TOOLTIP
    -------------------------------------------------
    line:SetScript("OnEnter", function()
        SetCursor("INSPECT_CURSOR")

        GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(boss.id)

        if boss.bossencounter then
            GameTooltip:AddLine("\nDrops from:", 1, 0.82, 0)
            local name = EJ_GetEncounterInfo(boss.bossencounter)
            GameTooltip:AddLine(name or "Unknown Boss", 1, 1, 1)
            GameTooltip:AddLine("\n|cff00ff00Left-Click|r View Decor", 1, 1, 1)
            GameTooltip:AddLine("|cff00ff00Right-Click|r View Dungeon Map", 1, 1, 1)
        elseif boss.bossevent then
            GameTooltip:AddLine("\nSource:", 1, 0.82, 0)
            GameTooltip:AddLine(boss.bossevent, 1, 1, 1)
            GameTooltip:AddLine("\n|cff00ff00Left-Click|r View Decor", 1, 1, 1)
            GameTooltip:AddLine("|cff00ff00Right-Click|r View Map", 1, 1, 1)
        end

        if isCollected then
            GameTooltip:AddLine("\n|cff00ff00Collected|r", 0.2, 1, 0.2)
        end

        GameTooltip:Show()
    end)

    line:SetScript("OnLeave", function()
        ResetCursor()
        GameTooltip:Hide()

        if dv.previewFrame then
            dv.previewFrame:Hide()
        end
    end)

    -------------------------------------------------
    -- CLICK HANDLING
    -------------------------------------------------
    line:SetScript("OnClick", function(_, button)
        -------------------------------------------------
        -- LEFT CLICK → OPEN HOUSING CATALOG
        -------------------------------------------------
        if button == "LeftButton" then
            if C_HousingCatalog.OpenToItem then
                C_HousingCatalog.OpenToItem(boss.id)
                return
            end

            if C_HousingCatalog.OpenToItemID then
                C_HousingCatalog.OpenToItemID(boss.id)
                return
            end

            DressUpItemLink("item:" .. boss.id)
            return
        end

        -------------------------------------------------
        -- RIGHT CLICK → OPEN MAP (SAFE FOR ALL SOURCES)
        -------------------------------------------------
        if button == "RightButton" then
            if InCombatLockdown() then return end
            if boss.mapID then
                C_Map.OpenWorldMap(boss.mapID)
            end
        end
    end)

    table.insert(dv.activeWidgets, line)
    return y - 24
end

function dv.CreateEventItemLine(parent, event, y)
    if not event or not event.itemID then
        return y
    end


	
    local line = CreateFrame("Button", nil, parent)
    line:SetPoint("TOPLEFT", 10, y)
    line:SetSize(590, 36)
    line:RegisterForClicks("AnyUp")	
-- Right-side note (zone-style metadata)
if event.note then
    line.note = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    line.note:SetPoint("RIGHT", -8, 0)
    line.note:SetJustifyH("RIGHT")
    line.note:SetText(event.note)
    line.note:SetTextColor(1, 1, 1) -- pure white
end

    -- Icon
    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(40, 40)
    icon:SetPoint("LEFT", 0, 0)
    icon:SetTexture(GetItemIcon(event.itemID) or "Interface\\Icons\\INV_Misc_QuestionMark")

    -- Title
    local title = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("LEFT", icon, "RIGHT", 10, 6)
    title:SetText(event.id or "Event Item")

    -- Timer / status
    local subtitle = line:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("LEFT", icon, "RIGHT", 10, -8)
	
local isCollected
if event.forceUncollected then
    isCollected = false
else
    isCollected = dv.IsItemCollected(event.itemID)
end

if isCollected then
    title:SetTextColor(0.2, 1, 0.2)
    subtitle:SetText("Collected")

elseif event.startTime and GetServerTime() < event.startTime then
    local secondsUntil = event.startTime - GetServerTime()
    local days = math.ceil(secondsUntil / 86400)
    subtitle:SetText("Starts in " .. days .. " days")

elseif event.endTime then
    local secondsLeft = event.endTime - GetServerTime()
    if secondsLeft > 0 then
        local days = math.ceil(secondsLeft / 86400)
        subtitle:SetText(days .. " days remaining")
    else
        subtitle:SetText("Event ended")
    end
end

local function UpdateEventPreview(event)
    if not event or not dv.previewFrame then return end
	
	local preview = dv.previewFrame
    local model   = preview.model
	
 preview.title:SetText(event.title or "Event Preview")

    if event.model3D then
        model:ClearModel()
        model:SetModel(event.model3D)
        model:Show()

        model:MakeCurrentCameraCustom()

        local pos = dv.modelPositions[event.model3D]
        if pos then
            model:SetPosition(pos.model_x, 0, pos.model_z)
            model:SetCameraPosition(0, 0, pos.camera_y)
            model:SetCameraDistance(pos.zoom)
        else
            model:SetPosition(0, 0, 0)
            model:SetCameraPosition(0, 0, 4)
            model:SetCameraDistance(10)
        end

        return
    end

    -- 3️⃣ Nothing usable
    model:Hide()
end
    -- Tooltip
line:SetScript("OnEnter", function()
    GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
    GameTooltip:SetText(event.id, 1, 0.82, 0)
    GameTooltip:AddLine(event.description or "", 1, 1, 1)
    GameTooltip:Show()
    
    dv.AnchorPreviewBelowTooltip(dv.previewFrame, GameTooltip)
	UpdateEventPreview(event)
end)

line:SetScript("OnLeave", function()
    GameTooltip:Hide()
    dv.previewFrame:Hide()
end)

    -- Click behavior
    line:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            DressUpItemLink("item:" .. event.itemID)
        end
    end)

    table.insert(dv.activeWidgets, line)
    return y - 40
end