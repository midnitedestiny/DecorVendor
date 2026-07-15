--[[
============================================================
Decor Vendor Addon — Vendor Discovery Event Hook Tracker
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MERCHANT_SHOW")

eventFrame:SetScript("OnEvent", function()
    if not DVD.npcs then return end

    local guid = UnitGUID("target")
    if not guid or issecretvalue(guid) then return end

    local npcID = select(6, strsplit("-", guid))
    npcID = tonumber(npcID)
    if not npcID then return end

    local vendor = DVD.npcs[npcID]
    if type(vendor) ~= "table" then return end

    vendor.id = vendor.id or npcID
    vendorSettings.visited = vendorSettings.visited or {}

    if not vendorSettings.visited[npcID] then
        vendorSettings.visited[npcID] = true

        if vendorSettings.hideCompletedThings or vendorSettings.markFoundVendors then
            if BuildVendorUI then
                BuildVendorUI()
            elseif DVD.BuildVendorUI then
                DVD.BuildVendorUI()
            end
        end
    end
end)