--[[
============================================================
Decor Vendor Addon — Active Lookup Database Compiler
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

-- ============================================================
-- Build lookup maps from Unified Global ActiveItems
-- ============================================================
function DVD:BuildActiveItemLookups()
    self.vendorGoodies = {}
    self.decorToItem = {}
    self.itemToNPC = {}

    -- loops straight through your flat master registry tables
    for itemID, data in pairs(self.ActiveItems or {}) do
        local isAvailable = true
        
        if self.IsDataAvailableForClient then
            isAvailable = self.IsDataAvailableForClient(data)
        end

        if isAvailable and type(data) == "table" then
            if data.decorID then
                self.decorToItem[data.decorID] = itemID
            end

            if data.soldBy then
                for _, npcID in ipairs(data.soldBy) do
                    self.vendorGoodies[npcID] = self.vendorGoodies[npcID] or { items = {} }
                    table.insert(self.vendorGoodies[npcID].items, itemID)
                    
                    self.itemToNPC[itemID] = npcID
                end
            end
        end
    end
end