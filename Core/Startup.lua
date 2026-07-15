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

local frame = DVD.frame
local LibDBIcon = LibStub("LibDBIcon-1.0", true)

DVD.vendorSessionCache = DVD.vendorSessionCache or {}
local vendorSessionCache = DVD.vendorSessionCache

if not frame then
    print("|cffff4040DecorVendor Startup:|r DVD.frame is missing. Make sure UI\\MainFrame.lua loads first.")
    return
end

-------------------------------------------------
-- Open Main UI
-------------------------------------------------

function DVD.OpenMainUI()
    if C_HousingCatalog and C_HousingCatalog.RequestHousingMarketInfoRefresh then
        DVD.waitingForMarketData = true
        C_HousingCatalog.RequestHousingMarketInfoRefresh()
    end

    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end

    local mainFrame = DVD.frame or frame

    if mainFrame then
        mainFrame:Show()
    end

	if DVD.ShowMainHomePanel then
		DVD.ShowMainHomePanel()
	end
end

-------------------------------------------------
-- Defaults
-------------------------------------------------

local function InitDefaults()
    vendorSettings = vendorSettings or {}

    vendorSettings.completedDrop = vendorSettings.completedDrop or {}
    vendorSettings.completedDropNoXP = vendorSettings.completedDropNoXP or {}
    vendorSettings.visited = vendorSettings.visited or {}
    vendorSettings.completedAchievs = vendorSettings.completedAchievs or {}

    if vendorSettings.showWaypointButton == nil then
        vendorSettings.showWaypointButton = false
    end

    if vendorSettings.showMinimapButton == nil then
        vendorSettings.showMinimapButton = true
    end

    if vendorSettings.closeOnEsc == nil then
        vendorSettings.closeOnEsc = true
    end

    if vendorSettings.scale == nil then
        vendorSettings.scale = 1.0
    end

    if vendorSettings.hideCompletedThings == nil then
        vendorSettings.hideCompletedThings = false
    end

    if vendorSettings.markCompletedThings == nil then
        vendorSettings.markCompletedThings = false
    end

    if vendorSettings.showMerchantCheckmarks == nil then
        vendorSettings.showMerchantCheckmarks = true
    end

    if vendorSettings.showVendorCheckmarks == nil then
        vendorSettings.showVendorCheckmarks = true
    end

    if vendorSettings.hideCollectedBossDrops == nil then
        vendorSettings.hideCollectedBossDrops = false
    end

    vendorSettings.openAchievementFrame = vendorSettings.openAchievementFrame ~= false

    dbDV = dbDV or {}
    dbDV.minimap = dbDV.minimap or {}
    dbDV.minimap.hide = not vendorSettings.showMinimapButton

    DVD.currentTab = DVD.currentTab or "vendors"
end

-------------------------------------------------
-- Minimap / LDB
-------------------------------------------------

local function RegisterMinimapButton()
    if not LibDBIcon then
        return
    end

    local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)

    if not ldb then
        return
    end

    local dataobj =
        ldb:NewDataObject(
        "DecorVendor",
        {
            type = "launcher",
            icon = "Interface\\AddOns\\DecorVendor\\Assets\\decorvendoricon.tga",
            label = "DecorVendor",
            text = "DecorVendor",
            name = "DecorVendor",
            OnClick = function(_, button)
                if button == "LeftButton" then
                    if frame and frame:IsShown() then
                        frame:Hide()
                    else
                        if DVD.OpenMainUI then
                            DVD.OpenMainUI()
                        else
                            if BuildVendorUI then
                                BuildVendorUI()
                            elseif DVD.BuildVendorUI then
                                DVD.BuildVendorUI()
                            end

                            if frame then
                                frame:Show()
                            end

                            if DVD.ShowWelcomePanel then
                                dv:ShowWelcomePanel()
                            end
                        end
                    end
                elseif button == "RightButton" then
                    if frame and frame:IsShown() then
                        frame:Hide()
                    end

                    if Settings and DVD.optionsCategory then
                        Settings.OpenToCategory(DVD.optionsCategory:GetID())
                    end
                end
            end
        }
    )

    function dataobj:OnTooltipShow()
        self:AddLine("|cffffffffDecor Vendor|r")
        self:AddLine("|cff00ff00<Left Click>|r Toggle window")
        self:AddLine("|cff00ff00<Right Click>|r Settings")
    end

    LibDBIcon:Register("DecorVendor", dataobj, dbDV.minimap)

    if vendorSettings.showMinimapButton then
        LibDBIcon:Show("DecorVendor")
    else
        LibDBIcon:Hide("DecorVendor")
    end
end

-------------------------------------------------
-- Delayed Collection / Stats Refresh
-------------------------------------------------

function DVD.RefreshCollectionStatsAfterDelay(reason)
    -- Clear caches that can be wrong if housing catalog data loads late.
    wipe(vendorSessionCache)

    DVD.collectionCache = {}
    DVD.vendorStatusCache = {}
    DVD.vendorMissingCache = {}
    DVD.statsCache = {}
    DVD.galleryStatsCache = {}

    -- Rebuild decorID -> itemID lookup.
    DVD.decorIdToItemId = {}

    for itemID, data in pairs(DVD.ActiveItems or {}) do
        if data.decorID then
            DVD.decorIdToItemId[data.decorID] = itemID
        end
    end

    -- Refresh main vendor UI.
    if BuildVendorUI then
        BuildVendorUI()
    elseif DVD.BuildVendorUI then
        DVD.BuildVendorUI()
    end

    -- Refresh stats panel if your stats file has one of these.
    if DVD.RefreshStatsPanel then
        DVD.RefreshStatsPanel()
    end

    if DVD.UpdateStatsPanel then
        DVD.UpdateStatsPanel()
    end

    -- Refresh gallery if loaded.
    if DVD.Gallery then
        if DVD.Gallery.RefreshStats then
            DVD.Gallery.RefreshStats()
        end

        if DVD.Gallery.RefreshGrid then
            DVD.Gallery.RefreshGrid()
        end
    end

    --print("|cff00ccffDecor Vendor:|r Collection stats refreshed: " .. tostring(reason or "delayed"))
end

function DVD.ScheduleDelayedCollectionRefreshes(reason)
    if DVD.collectionRefreshTimersScheduled then
        return
    end

    DVD.collectionRefreshTimersScheduled = true

    local delays = {
        2,
        10,
        30,
        120,
        300,
        600,
    }

    for _, delay in ipairs(delays) do
        C_Timer.After(delay, function()
            if DVD.RefreshCollectionStatsAfterDelay then
                DVD.RefreshCollectionStatsAfterDelay((reason or "login") .. " +" .. tostring(delay) .. "s")
            end
        end)
    end
end

local function SafeRegisterEvent(frame, eventName)
    if frame and eventName then
        pcall(frame.RegisterEvent, frame, eventName)
    end
end
-------------------------------------------------
-- Events
-------------------------------------------------

local init = CreateFrame("Frame")

init:RegisterEvent("ADDON_LOADED")
init:RegisterEvent("PLAYER_ENTERING_WORLD")
init:RegisterEvent("MERCHANT_SHOW")
init:RegisterEvent("HOUSING_MARKET_AVAILABILITY_UPDATED")
init:RegisterEvent("ACHIEVEMENT_EARNED")
init:RegisterEvent("QUEST_TURNED_IN")
init:RegisterEvent("HOUSE_DECOR_ADDED_TO_CHEST")

SafeRegisterEvent(init, "HOUSING_STORAGE_UPDATED")
SafeRegisterEvent(init, "HOUSING_STORAGE_ENTRY_UPDATED")

init:SetScript("OnEvent", function(self, event, loadedAddon, ...)
    if event == "ADDON_LOADED" and loadedAddon == addonName then
        InitDefaults()

        if UpdateEscBehavior then
            UpdateEscBehavior()
        end

        if DVD.BuildProfessionLookup then
            DVD.BuildProfessionLookup()
        end

        RegisterMinimapButton()

        vendorSettings.scale = vendorSettings.scale or 1.0
		frame:SetScale(vendorSettings.scale)

        if CreateOptionsPanel then
            CreateOptionsPanel()
        elseif DVD.CreateOptionsPanel then
            DVD.CreateOptionsPanel()
        end

        if UpdateSidebarForTab then
            UpdateSidebarForTab()
        end

        return
    end

    if event == "PLAYER_ENTERING_WORLD" then
        DVD.catalogReady = false
DVD.collectionRefreshTimersScheduled = nil

if DVD.ScheduleDelayedCollectionRefreshes then
    DVD.ScheduleDelayedCollectionRefreshes("PLAYER_ENTERING_WORLD")
end
        C_Timer.After(1, function()
            DVD.catalogReady = true

            DVD.decorIdToItemId = {}

            for itemID, data in pairs(DVD.ActiveItems or {}) do
                if data.decorID then
                    DVD.decorIdToItemId[data.decorID] = itemID
                end
            end

            wipe(vendorSessionCache)
            DVD.collectionCache = {}

            if BuildVendorUI then
                BuildVendorUI()
            elseif DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            end

            if HookMerchantFrame then
                HookMerchantFrame()
            elseif DVD.HookMerchantFrame then
                DVD.HookMerchantFrame()
            end
			
			if DVD.PreloadGalleryAddon then
				DVD.PreloadGalleryAddon()
			end
        end)

        return
    end

    if event == "MERCHANT_SHOW" then
        DVD.waitingForMarketData = true

        if C_HousingCatalog and C_HousingCatalog.RequestHousingMarketInfoRefresh then
            C_HousingCatalog.RequestHousingMarketInfoRefresh()
        end

        return
    end

    if event == "HOUSING_MARKET_AVAILABILITY_UPDATED" then
        if DVD.waitingForMarketData then
            DVD.waitingForMarketData = false
            DVD.catalogReady = true

            wipe(vendorSessionCache)
            DVD.collectionCache = {}

            if BuildVendorUI then
                BuildVendorUI()
            elseif DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            end
        end

        return
    end

if event == "HOUSING_STORAGE_UPDATED"
or event == "HOUSING_STORAGE_ENTRY_UPDATED" then
    C_Timer.After(1, function()
        if DVD.RefreshCollectionStatsAfterDelay then
            DVD.RefreshCollectionStatsAfterDelay(event)
        end
    end)

    return
end

    if event == "ACHIEVEMENT_EARNED" or event == "QUEST_TURNED_IN" then
        C_Timer.After(0.5, function()
            if BuildVendorUI then
                BuildVendorUI()
            elseif DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            end
        end)

        return
    end

    if event == "HOUSE_DECOR_ADDED_TO_CHEST" then
        if not DVD.catalogReady then
            return
        end

        local decorID = ...
        local itemID = DVD.decorIdToItemId and DVD.decorIdToItemId[decorID]

        if not itemID then
            return
        end

        local itemData = DVD.ActiveItems and DVD.ActiveItems[itemID]
        local noxp = itemData and itemData.noxp

        if noxp then
            vendorSettings.completedDropNoXP[itemID] = true
        else
            vendorSettings.completedDrop[itemID] = true
        end

        wipe(vendorSessionCache)

        if BuildVendorUI then
            BuildVendorUI()
        elseif DVD.BuildVendorUI then
            DVD.BuildVendorUI()
        end
    end
end)