-------------------------------------------------------------------------------
-- Decor Vendor Addon — Core Math & Data Utilities
-- Shared logical and mathematical functions used across the addon.
-------------------------------------------------------------------------------
local addonName, dv = ...

dv.Utils = dv.Utils or {}

-------------------------------------------------------------------------------
-- FormatCoords: Formats map coordinates as "XX.X, YY.Y"
-------------------------------------------------------------------------------
function dv.Utils.FormatCoords(x, y)
    if not x or not y then return "??, ??" end
    if x <= 1 and y <= 1 then
        x = x * 100
        y = y * 100
    end
    return string.format("%.1f, %.1f", x, y)
end

-------------------------------------------------------------------------------
-- GetPlayerMapPosition: Returns the player's current map position.
-------------------------------------------------------------------------------
function dv.Utils.GetPlayerMapPosition()
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then return nil end

    local pos = C_Map.GetPlayerMapPosition(mapID, "player")
    if not pos then return mapID, nil, nil end

    local x, y = pos:GetXY()
    return mapID, x, y
end

-------------------------------------------------------------------------------
-- PrintMessage: Prints a prefixed chat message.
-------------------------------------------------------------------------------
function dv.Utils.PrintMessage(msg)
    print((dv.ADDON_PREFIX or "|cff00ccff[Decor Vendor]|r ") .. tostring(msg))
end

-------------------------------------------------------------------------------
-- HexToRGB: Converts a hex color string to RGBA values (0-1).
-------------------------------------------------------------------------------
function dv.Utils.HexToRGB(hex)
    hex = hex:gsub("#", "")
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    return r, g, b, 1.0
end

-------------------------------------------------------------------------------
-- DistanceBetween: Calculates 2D distance between two coordinate pairs.
-------------------------------------------------------------------------------
function dv.Utils.DistanceBetween(x1, y1, x2, y2)
    if not (x1 and y1 and x2 and y2) then return math.huge end
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

-------------------------------------------------------------------------------
-- TableCount: Returns the number of entries in a table.
-------------------------------------------------------------------------------
function dv.Utils.TableCount(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

-------------------------------------------------------------------------------
-- Multi-Acquisition Badge Scanners
-------------------------------------------------------------------------------
dv.SourcePriority = {
    "Quest", "Achievement", "Prey", "Profession",
    "Drop", "Treasure", "Vendor", "Shop", "Other",
}

function dv.Utils.GetItemSources(item)
    if not item then return {} end
    local present = {}
    local primaryType = item.sourceType
    if primaryType and primaryType ~= "" then
        present[primaryType] = { type = primaryType, isPrimary = true }
    end

    if primaryType ~= "Achievement" then
        if (item.vendorUnlockAchievement and item.vendorUnlockAchievement ~= "")
                or (item.achievementName and item.achievementName ~= "") then
            present["Achievement"] = present["Achievement"] or { type = "Achievement", isPrimary = false }
        end
    end

    if primaryType ~= "Vendor" and item.vendorName and item.vendorName ~= "" then
        present["Vendor"] = present["Vendor"] or { type = "Vendor", isPrimary = false }
    end

    if primaryType ~= "Treasure" and item.treasureX and item.treasureY then
        present["Treasure"] = present["Treasure"] or { type = "Treasure", isPrimary = false }
    end

    if type(item.additionalSources) == "table" then
        for _, alt in ipairs(item.additionalSources) do
            local alt_t = alt and alt.sourceType
            if alt_t and alt_t ~= "" and not present[alt_t] then
                present[alt_t] = { type = alt_t, isPrimary = false }
            end
        end
    end

    local ordered = {}
    for _, t in ipairs(dv.SourcePriority) do
        if present[t] then ordered[#ordered + 1] = present[t] end
    end
    return ordered
end

function dv.Utils.FormatSourcesText(sources)
    if not sources or #sources == 0 then return "Unknown" end
    local parts = {}
    for i, src in ipairs(sources) do
        local c = dv.SourceColors and dv.SourceColors[src.type]
            or (dv.SourceColors and dv.SourceColors.Other)
            or { 0.6, 0.6, 0.6, 1 }
        local hex = string.format("%02x%02x%02x",
            math.floor(c[1] * 255 + 0.5),
            math.floor(c[2] * 255 + 0.5),
            math.floor(c[3] * 255 + 0.5))
        local sep = i == 1 and "" or " |cff888888+|r "
        parts[#parts + 1] = sep .. "|cff" .. hex .. src.type .. "|r"
    end
    return table.concat(parts)
end