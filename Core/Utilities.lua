-------------------------------------------------------------------------------
-- Decor Vendor Addon
-- Utilities.lua
-- Shared mathematical and data utilities
-------------------------------------------------------------------------------

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

if not C then
    print("|cffff4040DecorVendor Utilities:|r constants are missing.")
    return
end

local SOURCE_PRIORITY = C.MAIN_SOURCE_PRIORITY

local SOURCE_LABELS = C.MAIN_SOURCE_LABELS

local SOURCE_ALIASES = C.MAIN_SOURCE_ALIASES

if not SOURCE_PRIORITY
or not SOURCE_LABELS
or not SOURCE_ALIASES then
    print("|cffff4040DecorVendor Utilities:|r main source constants are missing.")
    return
end

DVD.Utils = DVD.Utils or {}

local Utils = DVD.Utils

-- Temporary compatibility alias.
DVD.SourcePriority = DVD.SourcePriority or SOURCE_PRIORITY

-------------------------------------------------------------------------------
-- Internal source helpers
-------------------------------------------------------------------------------

local function NormalizeMainSource(rawSource)
    if rawSource == nil then
        return nil
    end

    local source =
        string.lower(
            tostring(rawSource)
        )

    source =
        source:gsub(
            "[-_%s]+",
            ""
        )

    return SOURCE_ALIASES[source]
        or "other"
end

local function ForEachSourceValue(sourceTable, callback)
    if type(sourceTable) ~= "table"
    or type(callback) ~= "function" then
        return
    end

    for key, value in pairs(sourceTable) do
        local rawSource

        -- Array form:
        -- { "Vendor", "Achievement" }
        if type(value) == "string" then
            rawSource = value

        -- Object form:
        -- { { sourceType = "Vendor" } }
        elseif type(value) == "table" then
            rawSource =
                value.sourceType
                or value.source
                or value.type

        -- Set form:
        -- { vendor = true }
        elseif value == true
        and type(key) == "string" then
            rawSource = key
        end

        if rawSource then
            callback(rawSource)
        end
    end
end

-------------------------------------------------------------------------------
-- FormatCoords
-- Formats map coordinates as "XX.X, YY.Y".
-------------------------------------------------------------------------------

function Utils.FormatCoords(x, y)
    x = tonumber(x)
    y = tonumber(y)

    if not x
    or not y then
        return "??, ??"
    end

    if x <= 1
    and y <= 1 then
        x = x * 100
        y = y * 100
    end

    return string.format(
        "%.1f, %.1f",
        x,
        y
    )
end

-------------------------------------------------------------------------------
-- GetPlayerMapPosition
-- Returns mapID and normalized player coordinates.
-------------------------------------------------------------------------------

function Utils.GetPlayerMapPosition()
    if not C_Map
    or not C_Map.GetBestMapForUnit
    or not C_Map.GetPlayerMapPosition then
        return nil, nil, nil
    end

    local mapID =
        C_Map.GetBestMapForUnit(
            "player"
        )

    if not mapID then
        return nil, nil, nil
    end

    local position =
        C_Map.GetPlayerMapPosition(
            mapID,
            "player"
        )

    if not position
    or type(position.GetXY) ~= "function" then
        return mapID, nil, nil
    end

    local x, y =
        position:GetXY()

    return mapID, x, y
end

-------------------------------------------------------------------------------
-- PrintMessage
-- Prints a prefixed chat message.
-------------------------------------------------------------------------------

function Utils.PrintMessage(message)
    print(
        tostring(
            C.ADDON_PREFIX
            or "|cff00ccff[Decor Vendor]|r "
        )
        .. tostring(
            message
            or ""
        )
    )
end

-------------------------------------------------------------------------------
-- HexToRGB
-- Converts RGB/RGBA hex into values between 0 and 1.
-------------------------------------------------------------------------------

function Utils.HexToRGB(hex)
    hex =
        tostring(
            hex
            or ""
        )

    hex =
        hex:gsub(
            "#",
            ""
        )

    -- Expand shorthand RGB:
    -- F0A -> FF00AA
    if #hex == 3 then
        hex =
            hex:sub(1, 1)
            .. hex:sub(1, 1)
            .. hex:sub(2, 2)
            .. hex:sub(2, 2)
            .. hex:sub(3, 3)
            .. hex:sub(3, 3)
    end

    if #hex ~= 6
    and #hex ~= 8 then
        return 1, 1, 1, 1
    end

    local red =
        tonumber(
            hex:sub(1, 2),
            16
        )

    local green =
        tonumber(
            hex:sub(3, 4),
            16
        )

    local blue =
        tonumber(
            hex:sub(5, 6),
            16
        )

    local alpha =
        #hex == 8
        and tonumber(
            hex:sub(7, 8),
            16
        )
        or 255

    if not red
    or not green
    or not blue
    or not alpha then
        return 1, 1, 1, 1
    end

    return
        red / 255,
        green / 255,
        blue / 255,
        alpha / 255
end

-------------------------------------------------------------------------------
-- DistanceBetween
-- Calculates two-dimensional distance between coordinate pairs.
-------------------------------------------------------------------------------

function Utils.DistanceBetween(x1, y1, x2, y2)
    x1 = tonumber(x1)
    y1 = tonumber(y1)
    x2 = tonumber(x2)
    y2 = tonumber(y2)

    if not x1
    or not y1
    or not x2
    or not y2 then
        return math.huge
    end

    local dx =
        x2 - x1

    local dy =
        y2 - y1

    return math.sqrt(
        dx * dx
        + dy * dy
    )
end

-------------------------------------------------------------------------------
-- TableCount
-- Returns the number of entries in a table.
-------------------------------------------------------------------------------

function Utils.TableCount(value)
    if type(value) ~= "table" then
        return 0
    end

    local count = 0

    for _ in pairs(value) do
        count = count + 1
    end

    return count
end

-------------------------------------------------------------------------------
-- Multi-acquisition source scanner
-------------------------------------------------------------------------------

function Utils.GetItemSources(item)
    if type(item) ~= "table" then
        return {}
    end

    local present = {}

    local function AddSource(rawSource, isPrimary)
        local sourceType =
            NormalizeMainSource(rawSource)

        if not sourceType then
            return
        end

        local existing =
            present[sourceType]

        if existing then
            if isPrimary then
                existing.isPrimary = true
            end

            return
        end

        present[sourceType] = {
            type = sourceType,

            label =
                SOURCE_LABELS[sourceType]
                or tostring(rawSource),

            isPrimary =
                isPrimary == true,
        }
    end

    -------------------------------------------------
    -- Primary source
    -------------------------------------------------

    local primarySource =
        item.sourceType
        or item.source

    if primarySource
    and primarySource ~= "" then
        AddSource(
            primarySource,
            true
        )
    end

    -------------------------------------------------
    -- Explicit secondary sources
    -------------------------------------------------

    ForEachSourceValue(
        item.sources,
        function(rawSource)
            AddSource(
                rawSource,
                false
            )
        end
    )

    ForEachSourceValue(
        item.additionalSources,
        function(rawSource)
            AddSource(
                rawSource,
                false
            )
        end
    )

    -------------------------------------------------
    -- Inferred achievement source
    -------------------------------------------------

    if item.vendorUnlockAchievement
    or item.vendorUnlockAchievementID
    or item.achievementID
    or (
        item.achievementName
        and item.achievementName ~= ""
    ) then
        AddSource(
            "achievement",
            false
        )
    end

    -------------------------------------------------
    -- Inferred vendor source
    -------------------------------------------------

    if item.vendorID
    or item.soldBy
    or (
        item.vendorName
        and item.vendorName ~= ""
    ) then
        AddSource(
            "vendor",
            false
        )
    end

    -------------------------------------------------
    -- Inferred treasure source
    -------------------------------------------------

    if (
        item.treasureX
        and item.treasureY
    )
    or item.treasureName then
        AddSource(
            "treasure",
            false
        )
    end

    -------------------------------------------------
    -- Return in configured order
    -------------------------------------------------

    local ordered = {}

    for _, sourceType in ipairs(
        SOURCE_PRIORITY
    ) do
        if present[sourceType] then
            table.insert(
                ordered,
                present[sourceType]
            )
        end
    end

    return ordered
end

-------------------------------------------------------------------------------
-- FormatSourcesText
-- Formats source badges using shared label colors.
-------------------------------------------------------------------------------

function Utils.FormatSourcesText(sources)
    if type(sources) ~= "table"
    or #sources == 0 then
        return "Unknown"
    end

    local parts = {}

local labelColors =
    C.LabelColors
    and C.LabelColors.Sources
    or {}

    for index, source in ipairs(sources) do
        local sourceType =
            source.type
            or "other"

        local label =
            source.label
            or SOURCE_LABELS[sourceType]
            or tostring(sourceType)

        local coloredLabel

        if DVD.ColorizeLabel then
            coloredLabel =
                DVD.ColorizeLabel(
                    label,
                    labelColors,
                    sourceType
                )
        else
            local hex =
                labelColors[sourceType]
                or labelColors.other
                or labelColors.Other
                or "999999"

            coloredLabel =
                "|cff"
                .. tostring(hex)
                .. tostring(label)
                .. "|r"
        end

        if index > 1 then
            table.insert(
                parts,
                "|cff888888+|r"
            )
        end

        table.insert(
            parts,
            coloredLabel
        )
    end

    return table.concat(
        parts,
        " "
    )
end