--[[
============================================================
Decor Vendor Addon — Default Merchant Button Overlays
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

local COLLECTED_ICON_TEXTURE = "Interface\\AddOns\\DecorVendor\\Assets\\collected"
local merchantHooked = false

function DVD.HideMerchantCheckmarks()
    for i = 1, MERCHANT_ITEMS_PER_PAGE do
        local button = _G["MerchantItem" .. i .. "ItemButton"]
        if button and button.dvCheckmark then
            button.dvCheckmark:Hide()
        end
    end
end

-- Backward compatibility wrapper style
function HideMerchantCheckmarks()
    return DVD.HideMerchantCheckmarks()
end

function DVD.HookMerchantFrame()
    if merchantHooked then return end
    merchantHooked = true

    hooksecurefunc("MerchantFrame_Update", function()
        if not MerchantFrame or not MerchantFrame:IsShown() then
            DVD.HideMerchantCheckmarks()
            return
        end

        if not vendorSettings or not vendorSettings.showMerchantCheckmarks then
            DVD.HideMerchantCheckmarks()
            return
        end

        local numMerchantItems = GetMerchantNumItems()

        for i = 1, MERCHANT_ITEMS_PER_PAGE do
            local index = ((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i
            local button = _G["MerchantItem" .. i .. "ItemButton"]

            if button then
                if not button.dvCheckmark then
                    local check = button:CreateTexture(nil, "OVERLAY", nil, 7)
                    check:SetSize(18, 18)
                    check:SetPoint("BOTTOM", 0, -8)
                    check:SetTexture(COLLECTED_ICON_TEXTURE)
                    button.dvCheckmark = check
                end

                local checked = false

                if button:IsShown() and index <= numMerchantItems then
                    -- Extract raw item ID directly from the merchant slot to dodge link caching bugs
                    local itemID = GetMerchantItemID and GetMerchantItemID(index)
                    if not itemID then
                        local itemLink = GetMerchantItemLink(index)
                        if itemLink then
                            itemID = GetItemInfoInstant(itemLink)
                        end
                    end

                    -- Verify item ownership status against your collection maps
                    if itemID and DVD.ActiveItems and DVD.ActiveItems[itemID] then
                        if DVD.IsItemCollected and DVD.IsItemCollected(itemID) then
                            checked = true
                        end
                    end
                end

                button.dvCheckmark:SetShown(checked)
            end
        end
    end)
end

function HookMerchantFrame()
    return DVD.HookMerchantFrame()
end