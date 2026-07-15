--[[
============================================================
Decor Vendor Addon — Visual Gallery On-Demand Module
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

-- We no longer need to "Load" the gallery because it's part of the main addon.
-- We just need to ensure we call the Open function from the DVD namespace.
function DVD.OpenGalleryAddon()
    -- 1. Hide the main frame if it's open (as per your original behavior)
    if DVD.frame and DVD.frame:IsShown() then 
        DVD.frame:Hide() 
    end

    -- 2. Call the Gallery Open function directly from the DVD namespace
    -- This assumes your Gallery files are now part of the DVD table (DVD.Gallery)
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