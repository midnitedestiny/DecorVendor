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

local C = DVD.CONSTANTS

DVD.decorThumbCache = DVD.decorThumbCache or {}
DVD.itemNameCache = DVD.itemNameCache or {}
DVD.vendorSessionCache = DVD.vendorSessionCache or {}

local decorThumbCache = DVD.decorThumbCache
local itemNameCache = DVD.itemNameCache
local vendorSessionCache = DVD.vendorSessionCache

local refreshTimer = nil

-------------------------------------------------
-- Refresh / cache helpers
-------------------------------------------------

function DVD.RequestUpdate()
    if refreshTimer then
        refreshTimer:Cancel()
    end

    refreshTimer = C_Timer.NewTimer(0.2, function()
        refreshTimer = nil

        if DV_MainFrame and DV_MainFrame:IsShown() then
            if BuildVendorUI then
                BuildVendorUI()
            elseif DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            end
        end
    end)
end

-- Compatibility wrapper
function RequestUpdate()
    return DVD.RequestUpdate()
end

function DVD.IsCatalogUsable()
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return false
    end

    local test = C_HousingCatalog.GetCatalogEntryInfoByRecordID(1, 1, true)
    return test ~= nil
end

-- Compatibility wrapper
function IsCatalogUsable()
    return DVD.IsCatalogUsable()
end

function DVD.GetCachedItemName(itemID)
    if not itemID then
        return "Unknown Item", false
    end

    if itemNameCache[itemID] then
        return itemNameCache[itemID], false
    end

    local item = Item:CreateFromItemID(itemID)

    if not item:IsItemEmpty() then
        item:ContinueOnItemLoad(function()
            itemNameCache[itemID] = item:GetItemName()
            DVD.RequestUpdate()
        end)
    end

    return "Loading...", true
end

-- Compatibility wrapper
function GetCachedItemName(itemID)
    return DVD.GetCachedItemName(itemID)
end

function DVD.GetDecorThumbnail(itemID)
    if decorThumbCache[itemID] then
        return decorThumbCache[itemID]
    end

    local decorData = DVD.ActiveItems and DVD.ActiveItems[itemID]
    if not decorData or not decorData.decorID then
        return nil
    end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(
        1,
        decorData.decorID,
        true
    )

    if info and info.iconTexture then
        decorThumbCache[itemID] = info.iconTexture
        return info.iconTexture
    end

    return nil
end

-- Compatibility wrapper
function GetDecorThumbnail(itemID)
    return DVD.GetDecorThumbnail(itemID)
end

-------------------------------------------------
-- Decor / ownership helpers
-------------------------------------------------

function DVD.GetDecorIconByItemID(itemID)
    local decorData = DVD.ActiveItems and DVD.ActiveItems[itemID]

    if not decorData or not decorData.decorID then
        return nil
    end

    local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(
        1,
        decorData.decorID,
        true
    )

    return info and info.iconTexture
end

function DVD.IsDecorOwned(itemID)
    if not DVD.catalogReady then
        return false
    end

    if not itemID then
        return false
    end

    local data = DVD.ActiveItems and DVD.ActiveItems[itemID]

    if not data or not data.decorID then
        return false
    end

    if C_HousingCatalog and C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        local info = C_HousingCatalog.GetCatalogEntryInfoByRecordID(
            Enum.HousingCatalogEntryType.Decor,
            data.decorID,
            true
        )

        if type(info) == "table" then
            local owned =
                (tonumber(info.numPlaced) or 0) +
                (tonumber(info.numStored) or 0) +
                (tonumber(info.ownedCount) or 0) +
                (tonumber(info.quantity) or 0)

            return owned > 0
        end
    end

    return false
end

function DVD.GetVendorStatus(vendorID)
    if not DVD.catalogReady then
        return false, 0
    end

    if vendorSessionCache[vendorID] then
        return vendorSessionCache[vendorID].isComplete,
               vendorSessionCache[vendorID].missingCount
    end

    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]
    local items = vendorData and (vendorData.items or vendorData)

    if not items then
        return false, 0
    end

    local missingCount = 0
    local relevantCount = 0

    for _, itemID in ipairs(items) do
        local decor = DVD.ActiveItems and DVD.ActiveItems[itemID]

        if decor and decor.decorID then
            relevantCount = relevantCount + 1

            if not DVD.IsDecorOwned(itemID) then
                missingCount = missingCount + 1
            end
        end
    end

    local isComplete = relevantCount > 0 and missingCount == 0

    vendorSessionCache[vendorID] = {
        isComplete = isComplete,
        missingCount = missingCount,
    }

    return isComplete, missingCount
end

-- Compatibility wrapper
function GetVendorStatus(vendorID)
    return DVD.GetVendorStatus(vendorID)
end

-------------------------------------------------
-- Vendor / faction helpers
-------------------------------------------------

function DVD.GetVendorInfo(vendorID)
    if not vendorID or not DVD.npcs then
        return nil
    end

    for _, group in ipairs(DVD.npcs) do
        for _, vendor in ipairs(group.vendors or {}) do
            if vendor.id == vendorID then
                vendor.groupName = group.name
                vendor.expansion = group.expansion
                return vendor
            end
        end
    end

    return nil
end

function DVD.GetFactionColor(faction)
    faction = faction and string.lower(faction)

    if faction == "alliance" then
        return unpack(C.COLORS.ALLIANCE)

    elseif faction == "horde" then
        return unpack(C.COLORS.HORDE)

    else
        return unpack(C.COLORS.NEUTRAL)
    end
end

function ResetAllVendors()
    vendorSettings.visited = {}
    print("|cff88ff88DecorVendor:|r Vendor progress reset.")
end

function DVD.ClearWidgets()
    for _, w in ipairs(DVD.activeWidgets or {}) do
        if w and w.Hide then
            w:Hide()
        end
    end

    wipe(DVD.activeWidgets)
end

function DVD.GetPlayerRenownLevel(factionID)
    local data = C_MajorFactions.GetMajorFactionData(factionID)

    if data then
        return data.renownLevel or 0
    end

    return 0
end

function DVD.GetSubfactionTier(factionID)
    local data = C_MajorFactions.GetMajorFactionData(factionID)

    if data then
        return data.renownLevel or 0
    end

    return 0
end

function DVD.GetVendorRequirementType(vendorID)
    local vendorData = DVD.vendorGoodies and DVD.vendorGoodies[vendorID]
    local items = vendorData and (vendorData.items or vendorData)

    if not items then
        return "none"
    end

    local foundType = nil

    for _, itemID in ipairs(items) do
        local itemData = DVD.ActiveItems and DVD.ActiveItems[itemID]

        if itemData then
            local req = itemData.requirement

            if req and req.type then
                local t = string.lower(req.type)

                -- subfaction wins immediately
                if t == "subfaction" then
                    return "subfaction"
                end

                foundType = t
            end
        end
    end

    return foundType or "none"
end

-------------------------------------------------
-- Links
-------------------------------------------------

function DVD:GetWowheadLink(id, rewardType)
    if rewardType == "quest" then
        return "https://www.wowhead.com/quest=" .. tostring(id)

    elseif rewardType == "item" then
        return "https://www.wowhead.com/item=" .. tostring(id)

    else
        return "https://www.wowhead.com/achievement=" .. tostring(id)
    end
end

function DVD.ShowWowheadBox(parent, wowheadBox, id, rewardType)
    if not wowheadBox or not id then
        return
    end

    local url = dv:GetWowheadLink(id, rewardType)

    if DVD.activeWowheadBox and DVD.activeWowheadBox ~= wowheadBox then
        DVD.activeWowheadBox:Hide()
    end

    wowheadBox:SetText(url)
    wowheadBox:Show()
    wowheadBox:SetFocus()
    wowheadBox:HighlightText()

    DVD.activeWowheadBox = wowheadBox
end

-- Compatibility wrapper.
-- Older row code still calls ShowWowheadBox(...) directly.
function ShowWowheadBox(parent, wowheadBox, id, rewardType)
    return DVD.ShowWowheadBox(parent, wowheadBox, id, rewardType)
end