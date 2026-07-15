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
local frame = DVD.frame

if not frame then
    print("|cffff4040DecorVendor BottomTabs:|r DVD.frame is missing. Make sure UI\\MainFrame.lua loads before UI\\BottomTabs.lua.")
    return
end

local CORE_TABS = {
    { id = "vendors",      text = "Vendors",      icon = "Interface\\Icons\\inv_misc_5potionbag_special", width = 128 },
    { id = "professions",  text = "Professions",  icon = "Interface\\Icons\\Trade_Tailoring",             width = 136 },
    { id = "quests",       text = "Quests",       icon = "Interface\\Icons\\Inv_misc_note_01",             width = 128 },
    { id = "achievements", text = "Achievements", icon = "Interface\\Icons\\achievement_level_100",        width = 158 },
    { id = "bossdrops",    text = "Boss Drops",   icon = "Interface\\Icons\\achievement_boss_blackhand",   width = 136 },
}

local CatSizing = C.CatalogSizing or {}

local TAB_BAR_HEIGHT = CatSizing.BottomBarHeight or 44
local DEFAULT_TAB_WIDTH = 128
local TAB_HEIGHT = 28
local TAB_GAP = 6

local bottomTabs = {}
DVD.bottomTabs = bottomTabs
DVD.tabButtons = DVD.tabButtons or {}

local TAB_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

-------------------------------------------------
-- Preview Sizing
-------------------------------------------------

function DVD.UpdatePreviewSize()
    if not DVD.modelContainer then
        return
    end

local heights = {
    vendors = 265,
    professions = 265,
    quests = 250,
    achievements = 250,
    bossdrops = 265,
}

    DVD.modelContainer:SetHeight(heights[DVD.currentTab] or 245)

    if DVD.modelDivider then
        DVD.modelDivider:ClearAllPoints()
        DVD.modelDivider:SetPoint("TOPLEFT", DVD.modelContainer, "BOTTOMLEFT", 12, -8)
        DVD.modelDivider:SetPoint("TOPRIGHT", DVD.modelContainer, "BOTTOMRIGHT", -12, -8)
    end

    if DVD.itemContainer and DVD.modelDivider and DVD.previewPanel then
        DVD.itemContainer:ClearAllPoints()
        DVD.itemContainer:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", -2, -10)
        DVD.itemContainer:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", 2, -10)
        DVD.itemContainer:SetPoint("BOTTOMRIGHT", DVD.previewPanel, "BOTTOMRIGHT", -10, 10)
    end
end

-------------------------------------------------
-- Tab Bar Shell
-------------------------------------------------

local tabBar = CreateFrame("Frame", "DV_BottomTabBar", frame, "BackdropTemplate")
DVD.tabBar = tabBar

tabBar:SetHeight(TAB_BAR_HEIGHT)
tabBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 8, 8)
tabBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, 8)

tabBar:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
})

tabBar:SetBackdropColor(0.025, 0.018, 0.045, 0.90)
tabBar:SetBackdropBorderColor(0.38, 0.26, 0.58, 0.85)

local tabGlow = tabBar:CreateTexture(nil, "ARTWORK")
tabGlow:SetPoint("TOPLEFT", tabBar, "TOPLEFT", 10, -3)
tabGlow:SetPoint("TOPRIGHT", tabBar, "TOPRIGHT", -10, -3)
tabGlow:SetHeight(1)
tabGlow:SetColorTexture(1, 0.78, 0.28, 0.35)

-------------------------------------------------
-- Tab Visuals
-------------------------------------------------

local function SetTabVisual(tab, active)
    if active then
        tab:SetBackdropColor(0.11, 0.075, 0.18, 0.98)
        tab:SetBackdropBorderColor(1, 0.78, 0.28, 0.95)

        tab.bg:SetColorTexture(0.12, 0.07, 0.20, 0.95)
        tab.accent:SetColorTexture(1, 0.78, 0.28, 0.85)

        tab.text:SetTextColor(1, 0.86, 0.34, 1)
        tab.icon:SetVertexColor(1, 0.86, 0.34, 1)
    else
        tab:SetBackdropColor(0.045, 0.032, 0.075, 0.90)
        tab:SetBackdropBorderColor(0.35, 0.25, 0.52, 0.75)

        tab.bg:SetColorTexture(0.035, 0.025, 0.060, 0.88)
        tab.accent:SetColorTexture(0.55, 0.28, 0.95, 0.35)

        tab.text:SetTextColor(0.88, 0.84, 0.95, 1)
        tab.icon:SetVertexColor(0.78, 0.68, 0.95, 1)
    end
end

local function RefreshTabVisuals()
    for _, tab in ipairs(bottomTabs) do
        SetTabVisual(tab, tab.id == DVD.currentTab)
    end
end

-------------------------------------------------
-- Clear Preview / Sidebar When Switching Tabs
-------------------------------------------------

function UpdateSidebarForTab()
    if DVD.reagentsPopup then DVD.reagentsPopup:Hide() end
    if DVD.vendorPopup then DVD.vendorPopup:Hide() end

    if DVD.achievementWowheadWrapper then DVD.achievementWowheadWrapper:Hide() end
    if DVD.questWowheadWrapper then DVD.questWowheadWrapper:Hide() end

    if DVD.bossNotes then DVD.bossNotes:Hide() end
    if DVD.profNotes then DVD.profNotes:Hide() end
    if DVD.questNotes then DVD.questNotes:Hide() end
    if DVD.vendorNotes then DVD.vendorNotes:Hide() end

    if DVD.achievementPanel then DVD.achievementPanel:Hide() end
    if DVD.vendorWaypointBtn then DVD.vendorWaypointBtn:Hide() end

    if DVD.vendorPrevBtn then DVD.vendorPrevBtn:Hide() end
    if DVD.vendorNextBtn then DVD.vendorNextBtn:Hide() end
    if DVD.vendorPageText then DVD.vendorPageText:Hide() end
    if DVD.pagingFrame then DVD.pagingFrame:Hide() end

    -------------------------------------------------
    -- Clear model scene so old previews do not ghost
    -------------------------------------------------
    if DVD.modelScene then
        DVD.modelScene:Hide()

        local actor = DVD.previewActor

        if actor and actor.ClearModel then
            actor:ClearModel()
        end

        if DVD.modelScene.sceneID then
            DVD.modelScene:TransitionToModelSceneID(
                DVD.modelScene.sceneID,
                Enum.ModelSceneCameraTransitionType.Immediate,
                Enum.ModelSceneCameraModificationType.Discard,
                true
            )
        end
    end

    if DVD.texture then
        DVD.texture:SetTexture(nil)
        DVD.texture:Hide()
    end

-- Show the empty preview icon again when switching tabs
if DVD.ShowPreviewEmptyState then
    DVD.ShowPreviewEmptyState(true)
else
    if DVD.SetPreviewWatermarkVisible then
        DVD.SetPreviewWatermarkVisible(true)
    end

    if DVD.modelScene then
        DVD.modelScene:Show()
    end
end

    if DVD.modelTitle and DVD.itemContainer then
        DVD.modelTitle:ClearAllPoints()
        DVD.modelTitle:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", 10, -10)
        DVD.modelTitle:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -10, -10)
        DVD.modelTitle:SetText("Select an item")
        DVD.modelTitle:SetTextColor(1, 0.82, 0.2)
        DVD.modelTitle:Show()
    end

    if DVD.modelDivider then
        DVD.modelDivider:Show()
    end

    -------------------------------------------------
    -- Sidebar filters
    -------------------------------------------------
    if DVD.sidebar then
        DVD.sidebar:Show()
    end

    if DVD.ResetSidebarFilters then
        DVD.ResetSidebarFilters()
    end

    if DVD.sidebarFilters then
        DVD.sidebarFilters:Hide()
        DVD.sidebarFilters:Show()
    end

    if DVD.currentTab == "vendors" and DVD.BuildVendorFilters then
        DVD.BuildVendorFilters()

    elseif DVD.currentTab == "quests" and DVD.BuildQuestFilters then
        DVD.BuildQuestFilters()

    elseif DVD.currentTab == "achievements" and DVD.BuildAchievementFilters then
        DVD.BuildAchievementFilters()

    elseif DVD.currentTab == "professions" and DVD.BuildProfessionFilters then
        DVD.BuildProfessionFilters()

    elseif DVD.currentTab == "bossdrops" and DVD.BuildBossDropFilters then
        DVD.BuildBossDropFilters()
    end
end

function DVD.OpenMainSection(tabID, force)
    if not tabID then
        return false
    end

    -- Hide Home panel when entering a section.
    if DVD.frame and DVD.frame.homePanel then
        DVD.frame.homePanel:Hide()
    end

	if DVD.frame and DVD.frame.homeHint then
		DVD.frame.homeHint:Show()
	end
    -- Restore normal section UI.
    if DVD.sidebar then
        DVD.sidebar:Show()
    end

    if DVD.contentArea then
        DVD.contentArea:Show()
    end

    -- Keep bottom tabs hidden visually.
    if DVD.tabBar then
        DVD.tabBar:Hide()
    end

    -- Restore section-only header controls.
    if _G.DV_SearchBox then
        _G.DV_SearchBox:Show()
    end

    if _G.DV_ResetProgressBtn then
        _G.DV_ResetProgressBtn:Show()
    end

    if not force and DVD.currentTab == tabID then
        return true
    end

    DVD.currentTab = tabID

    RefreshTabVisuals()

    if DVD.UpdatePreviewSize then
        DVD.UpdatePreviewSize()
    end

    if UpdateSidebarForTab then
        UpdateSidebarForTab()
    end

    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end

    return true
end
-------------------------------------------------
-- Create Bottom Tabs
-------------------------------------------------

local startX = 12

for i, tabData in ipairs(CORE_TABS) do
    local tab = CreateFrame("Button", "DV_MainTab" .. i, tabBar, "BackdropTemplate")
    tab:SetSize(tabData.width or DEFAULT_TAB_WIDTH, TAB_HEIGHT)
    tab:SetBackdrop(TAB_BACKDROP)

    if i == 1 then
        tab:SetPoint("LEFT", tabBar, "LEFT", startX, 0)
    else
        tab:SetPoint("LEFT", bottomTabs[i - 1], "RIGHT", TAB_GAP, 0)
    end

    tab.id = tabData.id

    local bg = tab:CreateTexture(nil, "BACKGROUND")
    bg:SetPoint("TOPLEFT", tab, "TOPLEFT", 2, -2)
    bg:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", -2, 2)
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    tab.bg = bg

    local accent = tab:CreateTexture(nil, "ARTWORK")
    accent:SetPoint("TOPLEFT", tab, "TOPLEFT", 6, -3)
    accent:SetPoint("TOPRIGHT", tab, "TOPRIGHT", -6, -3)
    accent:SetHeight(1)
    tab.accent = accent

    local icon = tab:CreateTexture(nil, "ARTWORK")
    icon:SetSize(16, 16)
    icon:SetPoint("LEFT", tab, "LEFT", 9, 0)
    icon:SetTexture(tabData.icon)
    tab.icon = icon

    local text = tab:CreateFontString(nil, "OVERLAY")
    text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    text:SetPoint("RIGHT", tab, "RIGHT", -8, 0)
    text:SetJustifyH("CENTER")
    text:SetText(tabData.text)
    tab.text = text

    local hover = tab:CreateTexture(nil, "HIGHLIGHT")
    hover:SetAllPoints(tab)
    hover:SetTexture("Interface\\Buttons\\WHITE8x8")
    hover:SetColorTexture(1, 0.82, 0.2, 0.16)

    tab:SetScript("OnEnter", function(self)
        if self.id ~= DVD.currentTab then
            self:SetBackdropBorderColor(0.75, 0.55, 1, 0.95)
            self.text:SetTextColor(1, 1, 1, 1)
        end
    end)

    tab:SetScript("OnLeave", function()
        RefreshTabVisuals()
    end)

tab:SetScript("OnClick", function()
    if DVD.currentTab == tabData.id then
        return
    end

    if DVD.OpenMainSection then
        DVD.OpenMainSection(tabData.id, false)
    end

    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
end)

    bottomTabs[i] = tab
DVD.tabButtons[tabData.id] = tab
end

RefreshTabVisuals()

-- Home dashboard replaces the bottom tabs visually.
-- The tab buttons still exist for internal navigation, but stay hidden.
if DVD.tabBar then
    DVD.tabBar:Hide()
end