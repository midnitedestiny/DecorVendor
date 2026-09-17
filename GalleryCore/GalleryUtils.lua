-- ============================================================
-- Decor Vendor Gallery
-- GalleryUtilities.lua
-- Shared graphical UI utilities
-- ============================================================

local addonName, DVD = ...

local Gallery = DVD.Gallery

if not Gallery then
    print("|cffff4040DecorVendor Gallery Utilities:|r DVD.Gallery is missing.")
    return
end

local C =
    DVD.CONSTANTS
    or DVD.C

if not C then
    print("|cffff4040DecorVendor Gallery Utilities:|r constants are missing.")
    return
end

local UtilityStyle =
    C.GalleryUtilityStyle

if not UtilityStyle
or not UtilityStyle.Backdrop then
    print("|cffff4040DecorVendor Gallery Utilities:|r GalleryUtilityStyle.Backdrop is missing.")
    return
end

local BackdropStyle =
    UtilityStyle.Backdrop

-------------------------------------------------
-- Backdrop helper
-------------------------------------------------

function Gallery.SafeSetBackdrop(
    frame,
    backgroundColor,
    borderColor
)
    if not frame
    or type(frame.SetBackdrop) ~= "function" then
        return false
    end

    frame:SetBackdrop({
        bgFile =
            BackdropStyle.BackgroundFile,

        edgeFile =
            BackdropStyle.BorderFile,

        edgeSize =
            BackdropStyle.EdgeSize,

        insets =
            BackdropStyle.Insets,
    })

    if type(backgroundColor) == "table" then
        frame:SetBackdropColor(
            backgroundColor[1] or 0,
            backgroundColor[2] or 0,
            backgroundColor[3] or 0,
            backgroundColor[4] or 1
        )
    end

    if type(borderColor) == "table" then
        frame:SetBackdropBorderColor(
            borderColor[1] or 1,
            borderColor[2] or 1,
            borderColor[3] or 1,
            borderColor[4] or 1
        )
    end

    return true
end

-------------------------------------------------
-- Gallery card cleanup
-------------------------------------------------

function Gallery.ClearCards()
    Gallery.cards =
        Gallery.cards
        or {}

    for _, card in pairs(Gallery.cards) do
        if card then
            if card.Hide then
                card:Hide()
            end

            if card.SetParent then
                card:SetParent(nil)
            end
        end
    end

    wipe(Gallery.cards)
end