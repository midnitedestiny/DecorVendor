--[[
============================================================
Decor Vendor Addon — Chat Slash Commands & Compartments
© 2026 MidniteDestiny. All Rights Reserved.
============================================================
]]

local addonName, DVD = ...

local frame = DVD.frame

if not frame then
    print("|cffff4040DecorVendor Commands:|r DVD.frame is missing. Ensure UI\\MainFrame.lua loads first.")
    return
end

-------------------------------------------------
-- Slash Commands Registry
-------------------------------------------------
SLASH_DECORVENDOR1 = "/decor"
SLASH_DECORVENDOR2 = "/dv"
SLASH_DECORVENDOR3 = "/decorvendor"

SlashCmdList["DECORVENDOR"] = function()
    if frame and frame:IsShown() then
        frame:Hide()
    else
        if DVD.OpenMainUI then
            DVD.OpenMainUI()
        end
    end
end

-------------------------------------------------
-- Addon Compartment Integration
-------------------------------------------------
function DecorVendor_OnAddonCompartmentClick(addonName, button)
    if button == "LeftButton" then
        if frame and frame:IsShown() then
            frame:Hide()
            return
        end

        if DVD.OpenMainUI then
            DVD.OpenMainUI()
            return
        end

        if frame then
            frame:Show()
            if DVD.ShowMainHomePanel then
                DVD.ShowMainHomePanel()
            elseif DVD.CreateMainHomePanel then
                DVD:CreateMainHomePanel(frame)
                if frame.homePanel then
                    frame.homePanel:Show()
                end
            end
            return
        end

        print("|cffff4040Decor Vendor:|r Main frame is not loaded.")

    elseif button == "RightButton" then
        if Settings and DVD.optionsCategory then
            Settings.OpenToCategory(DVD.optionsCategory:GetID())
        end
    end
end

function DecorVendor_OnAddonCompartmentEnter(addonName, button)
    GameTooltip:SetOwner(button, "ANCHOR_LEFT")
    GameTooltip:SetText("Decor Vendor", 1, 0.82, 0)
    GameTooltip:AddLine("Left-click: Open Decor Vendor", 1, 1, 1)
    GameTooltip:AddLine("Right-click: Open Options Panel", 0.7, 0.7, 0.7)
    GameTooltip:Show()
end

function DecorVendor_OnAddonCompartmentLeave(addonName, button)
    GameTooltip:Hide()
end