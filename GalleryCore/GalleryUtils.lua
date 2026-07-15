-- ============================================================
-- Decor Vendor Gallery — Graphical Layout UI Utilities
-- ============================================================
local addonName, dv = ...

-- Automatically retrieve or initialize the local Gallery sub-namespace
local Gallery = dv.Gallery or _G.DecorVendorGallery or _G.DecorVendor_Gallery or {}
dv.Gallery = Gallery

local DVD = _G.DecorVendorData or _G.DecorVendor_Data
Gallery.ActiveItems = DVD and DVD.ActiveItems or dv.ActiveItems or {}

function Gallery.SafeSetBackdrop(frame, bgColor, borderColor)
    if not frame then return end

    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })

    frame:SetBackdropColor(unpack(bgColor))
    frame:SetBackdropBorderColor(unpack(borderColor))
end

function Gallery.ClearCards()
    if not Gallery.cards then return end

    for _, card in ipairs(Gallery.cards) do
        card:Hide()
        card:SetParent(nil)
    end

    wipe(Gallery.cards)
end

function Gallery.CleanSortName(name)
    name = tostring(name or "")
    name = name:gsub("|c%x%x%x%x%x%x%x%x", "")
    name = name:gsub("|r", "")
    name = name:gsub("^%s+", "")
    name = name:gsub("%s+$", "")
    name = name:gsub('"', "")
    name = name:gsub('"$', "")
    return string.lower(name)
end

function Gallery.LuaString(value)
    value = tostring(value or "")
    value = value:gsub("\\", "\\\\")
    value = value:gsub('"', '\\"')
    return '"' .. value .. '"'
end

function Gallery.ShortText(text, maxLen)
    text = tostring(text or "")
    maxLen = maxLen or 26

    if string.len(text) <= maxLen then
        return text
    end

    return string.sub(text, 1, maxLen - 3) .. "..."
end