--[[
============================================================
Decor Vendor Addon — Visual Gallery On-Demand Module
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

function DVD.OpenGalleryAddon()
    if DVD.frame and DVD.frame:IsShown() then 
        DVD.frame:Hide() 
    end
    local Gallery = DVD.Gallery

    if Gallery and Gallery.Open then 
        Gallery.Open()
    elseif Gallery and Gallery.Toggle then 
        Gallery.Toggle()
    elseif Gallery and Gallery.frame then 
        Gallery.frame:Show()
    else
        print("|cffffcc00Decor Vendor:|r Gallery functions not found in DVD namespace.")
    end
end