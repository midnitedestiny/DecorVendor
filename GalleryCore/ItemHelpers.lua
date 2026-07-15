-- ============================================================
-- Decor Vendor Gallery
-- ItemHelpers.lua
-- Helper utilities for processing item data strings, icon graphics, and validation requirements
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

Gallery.ActiveItems = DVD.ActiveItems or {}

function Gallery.GetCatalogInfo(decorID)
    if not decorID then return nil end

    if Gallery.catalogInfoCache[decorID] then
        return Gallery.catalogInfoCache[decorID]
    end

    if Gallery.catalogInfoMisses[decorID] then
        return nil
    end

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end

    local entryType = Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1

    local ok, info = pcall(
        C_HousingCatalog.GetCatalogEntryInfoByRecordID,
        entryType,
        decorID,
        true
    )

    if ok and info then
        Gallery.catalogInfoCache[decorID] = info
        return info
    end

    Gallery.catalogInfoMisses[decorID] = true
    return nil
end

function Gallery.GetItemName(itemID, itemData)
    local decorID = itemData and itemData.decorID
    local catalogInfo = Gallery.GetCatalogInfo(decorID)

    if catalogInfo and catalogInfo.name and catalogInfo.name ~= "" then
        return catalogInfo.name
    end

    if itemData and itemData.name and itemData.name ~= "" then
        return itemData.name
    end

    if C_Item and C_Item.GetItemNameByID and itemID then
        local name = C_Item.GetItemNameByID(itemID)
        if name then return name end
    end

    local name = itemID and GetItemInfo(itemID)
    return name or ("Item " .. tostring(itemID or decorID or "Unknown"))
end

function Gallery.GetItemIcon(itemID, itemData)
    local decorID = itemData and itemData.decorID
    local catalogInfo = Gallery.GetCatalogInfo(decorID)

    -- Best: housing catalog icon
    if catalogInfo and catalogInfo.iconTexture and catalogInfo.iconTexture ~= 0 then
        return catalogInfo.iconTexture
    end

    -- Baked icon from your database, if you add it later
    if itemData and itemData.iconTexture and itemData.iconTexture ~= 0 then
        return itemData.iconTexture
    end

    -- Item icon fallback
    if C_Item and C_Item.GetItemIconByID and itemID then
        local icon = C_Item.GetItemIconByID(itemID)
        if icon then return icon end
    end

    if itemID then
        local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
        if icon then return icon end
    end

    return "Interface\\Icons\\INV_Misc_QuestionMark"
end

function Gallery.FormatRequirement(req)
    if not req then
        return nil
    end

    if type(req) == "string" then
        return req
    end

    if type(req) ~= "table" then
        return tostring(req)
    end

    local reqType = req.type and string.lower(tostring(req.type)) or nil

    local faction =
        req.faction
        or req.factionName
        or req.reputation
        or req.renown
        or req.subfaction
        or req.friendship
        or req.name

    local rank =
        req.rank
        or req.level
        or req.standing
        or req.value

    if not faction and not rank then
        return nil
    end

    -- Auto-detect type from your main Decor Vendor lookup tables.
    if not reqType and faction then
        if DVD.renownFactionIDs and DVD.renownFactionIDs[faction] then
            reqType = "renown"
        elseif DVD.subfactionIDs and DVD.subfactionIDs[faction] then
            reqType = "subfaction"
        elseif DVD.friendshipFactionIDs and DVD.friendshipFactionIDs[faction] then
            reqType = "friendship"
        else
            reqType = "reputation"
        end
    end

    -- Renown uses the number directly.
    if reqType == "renown" then
        if faction and rank then
            return "Requires Renown " .. tostring(rank) .. " with " .. tostring(faction)
        elseif rank then
            return "Requires Renown " .. tostring(rank)
        elseif faction then
            return "Requires Renown with " .. tostring(faction)
        end
    end

    -- Normal reputation should translate 1/2/3/4/5 into Neutral/Friendly/Honored/Revered/Exalted.
    if reqType == "reputation" or reqType == "rep" then
        local standing = rank

        if type(rank) == "number" and DVD.reputationRanks then
            standing = DVD.reputationRanks[rank] or rank
        end

        if faction and standing then
            return "Requires " .. tostring(faction) .. " - " .. tostring(standing)
        elseif faction then
            return "Requires " .. tostring(faction)
        elseif standing then
            return "Requires reputation - " .. tostring(standing)
        end
    end

    -- Subfactions use their own custom rank names.
    if reqType == "subfaction" then
        local standing = rank

        if faction and type(rank) == "number"
            and DVD.subfactionRanks
            and DVD.subfactionRanks[faction]
        then
            standing = DVD.subfactionRanks[faction][rank] or rank
        end

        if faction and standing then
            return "Requires " .. tostring(faction) .. " - " .. tostring(standing)
        elseif faction then
            return "Requires " .. tostring(faction)
        end
    end

    -- Friendship ranks use Stranger / Acquaintance / Buddy / etc.
    if reqType == "friendship" then
        local standing = rank

        if type(rank) == "number" and DVD.friendshipRanks then
            standing = DVD.friendshipRanks[rank] or rank
        end

        if faction and standing then
            return "Requires " .. tostring(faction) .. " - " .. tostring(standing)
        elseif faction then
            return "Requires friendship with " .. tostring(faction)
        end
    end

    if reqType == "quest" then
        local questName = req.questName or req.name or req.title or faction

        if questName then
            return "Requires quest: " .. tostring(questName)
        end
    end

    if reqType == "achievement" then
        local achievementName = req.achievementName or req.name or req.title or faction

        if achievementName then
            return "Requires achievement: " .. tostring(achievementName)
        end
    end

    -- Generic fallback.
    if faction and rank then
        return "Requires " .. tostring(faction) .. " - " .. tostring(rank)
    elseif faction then
        return "Requires " .. tostring(faction)
    elseif rank then
        return "Requires rank " .. tostring(rank)
    end

    return nil
end

function Gallery.CleanSortName(name)
    name = tostring(name or "")
    name = name:gsub("|c%x%x%x%x%x%x%x%x", "")
    name = name:gsub("|r", "")
    name = name:gsub("^%s+", "")
    name = name:gsub("%s+$", "")
    name = name:gsub('^"', "")
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

function Gallery.SortItemsAZ(items)
    table.sort(items, function(a, b)
        local nameA =
            a.name
            or (a.data and a.data.name)
            or (Gallery.GetItemName and Gallery.GetItemName(a.itemID, a.data))
            or ""

        local nameB =
            b.name
            or (b.data and b.data.name)
            or (Gallery.GetItemName and Gallery.GetItemName(b.itemID, b.data))
            or ""

        if Gallery.CleanSortName then
            nameA = Gallery.CleanSortName(nameA)
            nameB = Gallery.CleanSortName(nameB)
        else
            nameA = string.lower(tostring(nameA))
            nameB = string.lower(tostring(nameB))
        end

        if nameA == nameB then
            return tostring(a.itemID or a.decorID or 0) < tostring(b.itemID or b.decorID or 0)
        end

        return nameA < nameB
    end)
end