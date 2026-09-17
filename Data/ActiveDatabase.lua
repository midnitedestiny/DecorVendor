--[[
AUTO-GENERATED DATA FILE

This database was generated programmatically using
custom tooling and in-game data sources.

Not copied from any addon or third-party database.

Structure and formatting are unique to Decor Vendor.

Any similarities to other addons are coincidental and
based on shared game data provided by Blizzard.

This file may be regenerated at any time.
]]
-- ============================================================
-- Decor Vendor Data
-- ActiveDatabase.lua
-- Shared active item database setup
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}

-- Compatibility tables.
-- These can stay for now in case old debug tools still touch them.
DVD.ActiveItemsByExpansion = DVD.ActiveItemsByExpansion or {}
DVD.ActiveItemSources = DVD.ActiveItemSources or {}

-- Temporary compatibility helper.
-- Keep this while any leftover files still use DVD.RegisterActiveItems().
function DVD.RegisterActiveItems(groupName, items)
    if not groupName or type(items) ~= "table" then
        return
    end

    DVD.ActiveItems = DVD.ActiveItems or {}

    for itemID, data in pairs(items) do
        if type(itemID) == "number" and type(data) == "table" then
            data.expansion = data.expansion or groupName

            if DVD.ActiveItems[itemID] then
                print("|cffffcc00DecorVendorData duplicate itemID:|r", itemID, "old:", tostring(DVD.ActiveItemSources[itemID]), "new:", tostring(groupName))
            end

            DVD.ActiveItems[itemID] = data
            DVD.ActiveItemSources[itemID] = groupName

            DVD.ActiveItemsByExpansion[groupName] = DVD.ActiveItemsByExpansion[groupName] or {}
            DVD.ActiveItemsByExpansion[groupName][itemID] = data
        end
    end
end

function DVD.GetActiveItem(itemID)
    return DVD.ActiveItems and DVD.ActiveItems[itemID]
end

function DVD.GetModel3D(itemID)
    local item = DVD.GetActiveItem(itemID)
    return item and item.model3D
end

function DVD.GetDecorID(itemID)
    local item = DVD.GetActiveItem(itemID)
    return item and item.decorID
end

function DVD.CountActiveItems()
    local count = 0

    for _ in pairs(DVD.ActiveItems or {}) do
        count = count + 1
    end

    return count
end

function DVD.CountActiveGroup(groupName)
    local count = 0
    local group = DVD.ActiveItemsByExpansion and DVD.ActiveItemsByExpansion[groupName]

    for _ in pairs(group or {}) do
        count = count + 1
    end

    return count
end