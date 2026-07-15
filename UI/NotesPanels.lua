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

-- 🌟 PRIVATE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not DVD.itemContainer then
    print("|cffff4040DecorVendor NotesPanels:|r DVD.itemContainer is missing. Make sure UI\\PreviewPanel.lua loads first.")
    return
end

if not DVD.modelDivider then
    print("|cffff4040DecorVendor NotesPanels:|r DVD.modelDivider is missing. Make sure UI\\PreviewPanel.lua loads first.")
    return
end

-- ============================================================
-- Vendor Notes Panel
-- ============================================================

if not DVD.vendorNotes then
    DVD.vendorNotes = CreateFrame("Frame", nil, DVD.itemContainer)

DVD.vendorNotes.defaultY = -260

DVD.vendorNotes:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", 10, DVD.vendorNotes.defaultY)
DVD.vendorNotes:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", -10, DVD.vendorNotes.defaultY)
    DVD.vendorNotes:SetHeight(60)
    DVD.vendorNotes:Hide()

    DVD.vendorNotes.bg = DVD.vendorNotes:CreateTexture(nil, "BACKGROUND")
    DVD.vendorNotes.bg:SetAllPoints()
    DVD.vendorNotes.bg:SetColorTexture(0.08, 0.08, 0.08, 0.75)

    DVD.vendorNotes.text = DVD.vendorNotes:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    DVD.vendorNotes.text:SetPoint("TOPLEFT", DVD.vendorNotes, "TOPLEFT", 10, -10)
    DVD.vendorNotes.text:SetPoint("TOPRIGHT", DVD.vendorNotes, "TOPRIGHT", -10, -10)
    DVD.vendorNotes.text:SetJustifyH("LEFT")
    DVD.vendorNotes.text:SetJustifyV("TOP")
    DVD.vendorNotes.text:SetWordWrap(true)
    DVD.vendorNotes.text:SetNonSpaceWrap(false)
    DVD.vendorNotes.text:SetFont(STANDARD_TEXT_FONT, 12, "")
    DVD.vendorNotes.text:SetTextColor(1, 1, 1, 1)
end


function DVD.PositionVendorNotes(vendor)
    if not DVD.vendorNotes or not DVD.modelDivider then
        return
    end

    local y = DVD.vendorNotes.defaultY or -260

    if vendor and vendor.noteY then
        y = vendor.noteY
    end

    DVD.vendorNotes:ClearAllPoints()
    DVD.vendorNotes:SetPoint("TOPLEFT", DVD.modelDivider, "BOTTOMLEFT", 10, y)
    DVD.vendorNotes:SetPoint("TOPRIGHT", DVD.modelDivider, "BOTTOMRIGHT", -10, y)
end