-- ============================================================
-- Decor Vendor Gallery
-- PriceHelpers.lua
-- Fully optimized for modern FileDataID asset numbers
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

Gallery.ActiveItems = DVD.ActiveItems or {}

function Gallery.FormatCostText(cost)
    if cost == nil then return nil end

    if type(cost) == "string" then
        return cost
    end

    if type(cost) == "number" then
        if GetMoneyString then
            return GetMoneyString(cost)
        end
        return tostring(cost)
    end

    if type(cost) ~= "table" then
        return nil
    end

    -- Multiple/Token costs array handling
    if #cost > 0 then
        local parts = {}

        for i, entry in ipairs(cost) do
            if type(entry) == "table" and entry.currencyID and entry.amount then
                -- 🚀 ROUTER CONVERSION: Grab icons natively from C configurations
                local iconID = C.CurrencyIcons and C.CurrencyIcons[entry.currencyID]
                
                if not iconID and C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo then
                    local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(entry.currencyID)
                    if currencyInfo then
                        iconID = currencyInfo.iconFileID
                    end
                end

                -- Format clean inline token text maps natively via numerical placeholders (%d)
                if iconID then
                    parts[i] = string.format("%s |T%d:14:14:0:0|t", tostring(entry.amount), iconID)
                else
                    parts[i] = string.format("%s (Token %s)", tostring(entry.amount), tostring(entry.currencyID))
                end
            end
        end

        return table.concat(parts, "  ")
    end

    -- Single object parameter check
    if cost.currencyID and cost.amount then
        return Gallery.FormatCostText({ cost })
    end

    return nil
end

function Gallery.CleanPriceText(text)
    if type(text) ~= "string" then
        return text
    end

    -- Blizzard tooltip/source text uses |n for line breaks.
    text = text:gsub("|n", "\n")
    text = text:gsub("\r", "\n")

    -- Remove WoW color codes but keep texture icons.
    text = text:gsub("|c%x%x%x%x%x%x%x%x", "")
    text = text:gsub("|r", "")

    -- Keep only the first line.
    text = text:match("^%s*([^\n]+)") or text

    -- Remove labels.
    text = text:gsub("^%s*[Cc]ost:%s*", "")
    text = text:gsub("^%s*[Pp]rice:%s*", "")
    text = text:gsub("^%s*[Ss]ell [Pp]rice:%s*", "")

    -- Safety cleanup if anything leaked through.
    text = text:gsub("%s+[Vv]endor:.*$", "")
    text = text:gsub("%s+[Pp]urchase from.*$", "")
    text = text:gsub("%s+[Zz]one:.*$", "")
    text = text:gsub("%s+[Ff]action:.*$", "")

    text = text:gsub("^%s+", ""):gsub("%s+$", "")

    if text == "" then
        return nil
    end

    return text
end

function Gallery.ExtractCostFromText(text)
    if type(text) ~= "string" or text == "" then
        return nil
    end

    -- Make Blizzard tooltip/source line breaks usable.
    text = text:gsub("|n", "\n")
    text = text:gsub("\r", "\n")

    -- Remove color codes before matching.
    text = text:gsub("|c%x%x%x%x%x%x%x%x", "")
    text = text:gsub("|r", "")

    local cost =
        text:match("[Cc]ost:%s*([^\n]+)")
        or text:match("[Pp]rice:%s*([^\n]+)")
        or text:match("[Ss]ell [Pp]rice:%s*([^\n]+)")

    return Gallery.CleanPriceText(cost)
end

function Gallery.GetPriceText(item)
    if not item then return nil end

    local data = item.data or {}

    -- Manual override
    if data.priceText then
        return Gallery.CleanPriceText(data.priceText)
    end

    -- Text copied/merged from catalog/source APIs
    local textCost =
        Gallery.ExtractCostFromText(data.sourceText)
        or Gallery.ExtractCostFromText(data.catalogSourceText)
        or Gallery.ExtractCostFromText(data.tooltipText)

    if textCost then
        return Gallery.CleanPriceText(textCost)
    end

    -- Manual structured fields
    local priceFields = {
        "price",
        "cost",
        "currencyCost",
        "vendorCost",
        "shopCost",
    }

    for _, field in ipairs(priceFields) do
        if data[field] ~= nil then
            local text = Gallery.FormatCostText and Gallery.FormatCostText(data[field])

            if text then
                return Gallery.CleanPriceText(text)
            end
        end
    end

    -- Simple currency format:
    if data.currencyID and (data.currencyAmount or data.amount or data.costAmount) then
        return Gallery.FormatCostText({
            currencyID = data.currencyID,
            amount = data.currencyAmount or data.amount or data.costAmount,
        })
    end

    -- Simple copper/money
    if data.money or data.copper then
        return Gallery.FormatCostText(data.money or data.copper)
    end

    -- Catalog info fallback
    local decorID = data.decorID or item.decorID
    local info

    if Gallery.GetCatalogInfo and decorID then
        info = Gallery.GetCatalogInfo(decorID)
    end

    if info then
        local infoTextCost =
            Gallery.ExtractCostFromText(info.sourceText)
            or Gallery.ExtractCostFromText(info.tooltipText)

        if infoTextCost then
            return infoTextCost
        end

        local infoPrice =
            info.price
            or info.purchasePrice
            or info.sellPrice
            or info.cost
            or info.costAmount
            or info.currencyCost
            or info.vendorCost
            or info.shopCost

        local text = Gallery.FormatCostText and Gallery.FormatCostText(infoPrice)

        if text then
            return text
        end
    end

    return nil
end

function Gallery.BuildPreviewStatsText(item)
    local stored, placed, redeemable = Gallery.GetCatalogStats(item)
    local priceText = Gallery.GetPriceText and Gallery.GetPriceText(item)

    if Gallery.CleanPriceText then
        priceText = Gallery.CleanPriceText(priceText)
    end

    local text =
        "|cffaaaaaaStorage:|r " .. tostring(stored or 0) ..
        "    |cffaaaaaaPlaced:|r " .. tostring(placed or 0)

    if priceText then
        text = text .. "    |cffffd100Cost:|r " .. priceText
    else
        text = text .. "    |cffaaaaaaRedeemable:|r " .. tostring(redeemable or 0)
    end

    return text
end

function Gallery.GetCatalogStats(item)
    if not item then
        return 0, 0, 0, 0
    end

    local data = item.data or {}
    local decorID = data.decorID or item.decorID

    local info
    if Gallery.GetCatalogInfo and decorID then
        info = Gallery.GetCatalogInfo(decorID)
    end

    local stored =
        tonumber(data.quantity)
        or tonumber(data.totalNumStored)
        or tonumber(info and info.totalNumStored)
        or 0

    local placed =
        tonumber(data.numPlaced)
        or tonumber(data.totalNumPlaced)
        or tonumber(info and info.totalNumPlaced)
        or 0

    local redeemable =
        tonumber(data.remainingRedeemable)
        or tonumber(info and info.remainingRedeemable)
        or 0

    local totalOwned =
        tonumber(data.totalOwned)
        or tonumber(info and info.totalOwned)
        or (stored + placed + redeemable)

    return stored, placed, redeemable, totalOwned
end