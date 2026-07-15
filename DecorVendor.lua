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
vendorSettings.scale = vendorSettings.scale or 1.0
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