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

-- 🌟 THE SOLE UNIFIED NAMESPACE: DVD reigns supreme!
local addonName, DVD = ...
_G.DVD = DVD
local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Commands:|r constants are missing.")
    return
end

local frame = DVD.frame

if not frame then
    print("|cffff4040DecorVendor Commands:|r DVD.frame is missing. Ensure UI\\MainFrame.lua loads first.")
    return
end

DVD.ADDON_NAME = addonName
DVD.ADDON_PREFIX = DVD.ADDON_PREFIX or "|cff00ccff[Decor Vendor]|r "

-------------------------------------------------
-- Optional Addon Detection (Safely Localized)
-------------------------------------------------
local function IsLoaded(addon)
    if C_AddOns and C_AddOns.IsAddOnLoaded then
        return C_AddOns.IsAddOnLoaded(addon)
    end
    if IsAddOnLoaded then
        return IsAddOnLoaded(addon)
    end
    return false
end

-- Prefixed with 'local' to protect global namespace safety
local hasTomTom = IsLoaded("TomTom")
local hasWaypointUI = IsLoaded("WaypointUI")

-- Expose to our unified addon scope so other files can check them natively
DVD.hasTomTom = hasTomTom
DVD.hasWaypointUI = hasWaypointUI

-------------------------------------------------
-- Saved Variables Auto-Repair Defaults
-------------------------------------------------
vendorSettings = vendorSettings or {}
vendorSettings.useTomTom = (vendorSettings.useTomTom ~= nil) and vendorSettings.useTomTom or true
vendorSettings.scale = vendorSettings.scale or .90
vendorSettings.textScale = vendorSettings.textScale or 1.25
vendorSettings.closeOnEsc = (vendorSettings.closeOnEsc ~= nil) and vendorSettings.closeOnEsc or true
vendorSettings.showMinimapButton = (vendorSettings.showMinimapButton ~= nil) and vendorSettings.showMinimapButton or true
vendorSettings.showVendorCheckmarks = (vendorSettings.showVendorCheckmarks ~= nil) and vendorSettings.showVendorCheckmarks or true
vendorSettings.showMerchantCheckmarks = (vendorSettings.showMerchantCheckmarks ~= nil) and vendorSettings.showMerchantCheckmarks or true
vendorSettings.showWaypointButton = (vendorSettings.showWaypointButton ~= nil) and vendorSettings.showWaypointButton or true

vendorSettings.visited = vendorSettings.visited or {}
vendorSettings.completedAchievs = vendorSettings.completedAchievs or {}
vendorSettings.completedDrop = vendorSettings.completedDrop or {}
vendorSettings.completedDropNoXP = vendorSettings.completedDropNoXP or {}

vendorSettings.markCompletedThings = (vendorSettings.markCompletedThings ~= nil) and vendorSettings.markCompletedThings or false
vendorSettings.markFoundVendors = (vendorSettings.markFoundVendors ~= nil) and vendorSettings.markFoundVendors or false
vendorSettings.hideCompletedThings = (vendorSettings.hideCompletedThings ~= nil) and vendorSettings.hideCompletedThings or false
vendorSettings.hideCollectedBossDrops = (vendorSettings.hideCollectedBossDrops ~= nil) and vendorSettings.hideCollectedBossDrops or false
vendorSettings.openAchievementFrame = (vendorSettings.openAchievementFrame ~= nil) and vendorSettings.openAchievementFrame or true

dbDV = dbDV or {}
dbDV.minimap = dbDV.minimap or { hide = false }

-------------------------------------------------
-- Runtime State Setup (Attached to DVD namespace)
-------------------------------------------------
DVD.searchQuery = DVD.searchQuery or ""
DVD.decorItem = DVD.decorItem or {}

DVD.waitingForMarketData = false
DVD.catalogReady = false
DVD.currentTab = DVD.currentTab or "vendors"

vendorFilteredItems = vendorFilteredItems or {}
currentVendorPage = currentVendorPage or 1

DVD.activeWowheadBox = DVD.activeWowheadBox or nil
DVD.collapsedHeaders = DVD.collapsedHeaders or {}
DVD.activeWidgets = DVD.activeWidgets or {}
DVD.questTitleCache = DVD.questTitleCache or {}
DVD.collectionCache = DVD.collectionCache or {}

DVD.vendorSessionCache = DVD.vendorSessionCache or {}

-------------------------------------------------
-- Active Item Lookups Compiler Execution
-------------------------------------------------
-- Because files load sequentially, we execute this at the absolute bottom
-- of the file structure once the database indices have fully compiled.
if DVD.BuildActiveItemLookups then
    DVD:BuildActiveItemLookups()
else
    -- Left as a silent tracker print for development profiling
    print("|cffff4040DecorVendor:|r BuildActiveItemLookups is missing. Ensure Core\\ActiveItemLookups.lua maps to DVD.")
end

function DVD.UpdateEscBehavior()
    local frameName = C.MAIN_FRAME_NAME

    for i = #UISpecialFrames, 1, -1 do
        if UISpecialFrames[i] == frameName then
            table.remove(UISpecialFrames, i)
        end
    end

    if vendorSettings and vendorSettings.closeOnEsc then
        table.insert(UISpecialFrames, frameName)
    end
end

function UpdateEscBehavior()
    return DVD.UpdateEscBehavior()
end

-------------------------------------------------
-- Slash Commands Registry
-------------------------------------------------
SLASH_DECORVENDOR1 = C.SLASH_COMMANDS[1]
SLASH_DECORVENDOR2 = C.SLASH_COMMANDS[2]
SLASH_DECORVENDOR3 = C.SLASH_COMMANDS[3]

SlashCmdList["DECORVENDOR"] = function()
    if frame and frame:IsShown() then
        frame:Hide()
    else
        if DVD.OpenMainUI then
            DVD.OpenMainUI()
        end
    end
end

-------------------------------------------------
-- Addon Compartment Integration
-------------------------------------------------
function DecorVendor_OnAddonCompartmentClick(addonName, button)
    if button == "LeftButton" then
        if frame and frame:IsShown() then
            frame:Hide()
            return
        end

        if DVD.OpenMainUI then
            DVD.OpenMainUI()
            return
        end

        if frame then
            frame:Show()
            if DVD.ShowMainHomePanel then
                DVD.ShowMainHomePanel()
            elseif DVD.CreateMainHomePanel then
                DVD:CreateMainHomePanel(frame)
                if frame.homePanel then
                    frame.homePanel:Show()
                end
            end
            return
        end

        print("|cffff4040Decor Vendor:|r Main frame is not loaded.")

    elseif button == "RightButton" then
        if Settings and DVD.optionsCategory then
            Settings.OpenToCategory(DVD.optionsCategory:GetID())
        end
    end
end

function DecorVendor_OnAddonCompartmentEnter(addonName, button)
    GameTooltip:SetOwner(button, "ANCHOR_LEFT")
    GameTooltip:SetText("Decor Vendor", 1, 0.82, 0)
    GameTooltip:AddLine("Left-click: Open Decor Vendor", 1, 1, 1)
    GameTooltip:AddLine("Right-click: Open Options Panel", 0.7, 0.7, 0.7)
    GameTooltip:Show()
end

function DecorVendor_OnAddonCompartmentLeave(addonName, button)
    GameTooltip:Hide()
end