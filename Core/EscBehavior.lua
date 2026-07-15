--[[
============================================================
Decor Vendor Addon — Escape Key Behavior Controller
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

function DVD.UpdateEscBehavior()
    local frameName = "DV_MainFrame"

    for i = #UISpecialFrames, 1, -1 do
        if UISpecialFrames[i] == frameName then
            table.remove(UISpecialFrames, i)
        end
    end

    if vendorSettings and vendorSettings.closeOnEsc then
        table.insert(UISpecialFrames, frameName)
    end
end

-- Global layout compatibility link wrapper
function UpdateEscBehavior()
    return DVD.UpdateEscBehavior()
end