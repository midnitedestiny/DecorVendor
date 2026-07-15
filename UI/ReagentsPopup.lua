--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

This file is part of the Decor Vendor addon.

All code, structure, and design are the intellectual
property of MidniteDestiny unless otherwise stated.

You may NOT:
• Copy, reproduce, or redistribute this code
• Modify and redistribute this code
• Use this code in other addons or projects

without explicit permission from the author.

This addon is distributed for personal use only.

============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C or {}
local COLORS = C.COLORS or {}

if not DVD.itemContainer then
    print("|cffff4040DecorVendor ReagentsPopup:|r DVD.itemContainer is missing. Make sure UI\\PreviewPanel.lua loads first.")
    return
end

if not tContains(UISpecialFrames, "DV_ReagentsPopup") then
    tinsert(UISpecialFrames, "DV_ReagentsPopup")
end

local GOLD = COLORS.GOLD or { 1, 0.82, 0, 1 }

local PANEL_BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

-------------------------------------------------
-- Reagents Area
-- This sits inside the existing itemContainer.
-- It does NOT create another big full-panel title.
-------------------------------------------------

DVD.reagentsPopup = CreateFrame("Frame", "DV_ReagentsPopup", DVD.itemContainer, "BackdropTemplate")
local rpopup = DVD.reagentsPopup

rpopup:ClearAllPoints()
rpopup:SetPoint("TOPLEFT", DVD.itemContainer, "TOPLEFT", 10, -44)
rpopup:SetPoint("TOPRIGHT", DVD.itemContainer, "TOPRIGHT", -10, -44)
rpopup:SetHeight(150)
rpopup:SetFrameLevel(DVD.itemContainer:GetFrameLevel() + 8)
rpopup:SetBackdrop(nil)
rpopup:Hide()

-------------------------------------------------
-- Header
-------------------------------------------------

rpopup.header = rpopup:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
rpopup.header:SetPoint("TOP", rpopup, "TOP", 0, 0)
rpopup.header:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
rpopup.header:SetTextColor(GOLD[1], GOLD[2], GOLD[3], GOLD[4] or 1)
rpopup.header:SetText("Reagents Needed")

-------------------------------------------------
-- Recipe Row
-------------------------------------------------

rpopup.recipeFrame = CreateFrame("Button", nil, rpopup, "BackdropTemplate")
rpopup.recipeFrame:SetSize(210, 34)
rpopup.recipeFrame:SetPoint("TOP", rpopup.header, "BOTTOM", 0, -8)
rpopup.recipeFrame:SetBackdrop(PANEL_BACKDROP)
rpopup.recipeFrame:SetBackdropColor(0.035, 0.025, 0.055, 0.78)
rpopup.recipeFrame:SetBackdropBorderColor(0.45, 0.33, 0.65, 0.75)
rpopup.recipeFrame:RegisterForClicks("AnyUp")
rpopup.recipeFrame:Hide()

rpopup.recipeIcon = rpopup.recipeFrame:CreateTexture(nil, "ARTWORK")
rpopup.recipeIcon:SetSize(26, 26)
rpopup.recipeIcon:SetPoint("LEFT", rpopup.recipeFrame, "LEFT", 5, 0)
rpopup.recipeIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

rpopup.recipeText = rpopup.recipeFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
rpopup.recipeText:SetPoint("LEFT", rpopup.recipeIcon, "RIGHT", 6, 0)
rpopup.recipeText:SetPoint("RIGHT", rpopup.recipeFrame, "RIGHT", -6, 0)
rpopup.recipeText:SetJustifyH("LEFT")
rpopup.recipeText:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
rpopup.recipeText:SetTextColor(0.9, 0.9, 0.9, 1)
rpopup.recipeText:SetText("Recipe")

rpopup.recipeFrame:SetScript("OnEnter", function(self)
    if self.recipeID then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink("item:" .. tostring(self.recipeID))
        GameTooltip:Show()
    end

    self:SetBackdropBorderColor(1, 0.82, 0, 1)
end)

rpopup.recipeFrame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetBackdropBorderColor(0.45, 0.33, 0.65, 0.75)
end)

rpopup.recipeFrame:SetScript("OnClick", function(self)
    if self.recipeID and DVD.ShowWowheadLinkPopup then
        DVD.ShowWowheadLinkPopup(self.recipeID, "item")
    end
end)

-------------------------------------------------
-- Icon Cache
-------------------------------------------------

DVD.reagentIconCache = DVD.reagentIconCache or {}

local function GetReagentIconFrame(i)
    local f = DVD.reagentIconCache[i]

    if f then
        f:Show()
        return f
    end

    f = CreateFrame("Frame", nil, rpopup, "BackdropTemplate")
    f:SetSize(44, 54)
    f:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = 2,
    })
    f:SetBackdropBorderColor(0.42, 0.42, 0.42, 1)
    f:SetClipsChildren(true)

    local btn = CreateFrame("Button", nil, f)
    btn:SetAllPoints()
    btn:RegisterForClicks("AnyUp")
    f.btn = btn

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
    icon:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 16)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    f.icon = icon

    local countBg = f:CreateTexture(nil, "BACKGROUND")
    countBg:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 0, 0)
    countBg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
    countBg:SetHeight(15)
    countBg:SetColorTexture(0, 0, 0, 0.95)

    local countText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countText:SetPoint("BOTTOM", f, "BOTTOM", 0, 1)
    countText:SetFont(STANDARD_TEXT_FONT, 10, "OUTLINE")
    countText:SetTextColor(1, 1, 1, 1)
    f.countText = countText

    btn:SetScript("OnEnter", function(self)
        SetCursor("CAST_CURSOR")
        f:SetBackdropBorderColor(1, 0.82, 0, 1)

        if self.itemID then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. tostring(self.itemID))
            GameTooltip:Show()
        end
    end)

    btn:SetScript("OnLeave", function()
        ResetCursor()
        f:SetBackdropBorderColor(0.42, 0.42, 0.42, 1)
        GameTooltip:Hide()
    end)

    btn:SetScript("OnClick", function(self)
        if self.itemID and DVD.ShowWowheadLinkPopup then
            DVD.ShowWowheadLinkPopup(self.itemID, "item")
        end
    end)

    DVD.reagentIconCache[i] = f

    return f
end

-------------------------------------------------
-- Public Show Function
-------------------------------------------------

function DVD.ShowReagentsPopup(itemData)
    if not DVD.reagentsPopup then
        return
    end

    local rpopup = DVD.reagentsPopup

    if not itemData or not itemData.reagents or #itemData.reagents == 0 then
        rpopup:Hide()
        return
    end

    -------------------------------------------------
    -- Hide old reagent icons
    -------------------------------------------------

    for _, f in pairs(DVD.reagentIconCache or {}) do
        f:Hide()
    end

    -------------------------------------------------
    -- Recipe
    -------------------------------------------------

    local hasRecipe = itemData.recipe and itemData.recipe > 0
    local startY = -24

    rpopup.recipeFrame:Hide()
    rpopup.recipeFrame.recipeID = nil

    if hasRecipe then
        rpopup.recipeFrame.recipeID = itemData.recipe

        rpopup.recipeIcon:SetTexture(
            GetItemIcon(itemData.recipe)
            or "Interface\\Icons\\INV_Scroll_03"
        )

        rpopup.recipeText:SetText("Recipe")

        local itemObj = Item:CreateFromItemID(itemData.recipe)
        itemObj:ContinueOnItemLoad(function()
            if rpopup.recipeText then
                local recipeName = itemObj:GetItemName() or "Recipe"

                if #recipeName > 28 then
                    recipeName = recipeName:sub(1, 27) .. "..."
                end

                rpopup.recipeText:SetText(recipeName)
            end
        end)

        rpopup.recipeFrame:Show()
        startY = -66
    end

    -------------------------------------------------
    -- Dynamic centered reagent grid
    -------------------------------------------------

    local tileW = 44
    local tileH = 54
    local gap = 10
    local availableWidth = math.max(1, rpopup:GetWidth() or 280)

    local iconsPerRow = math.floor((availableWidth + gap) / (tileW + gap))
    iconsPerRow = math.max(1, math.min(5, iconsPerRow))

    local totalInFirstRow = math.min(#itemData.reagents, iconsPerRow)
    local rowWidth = (totalInFirstRow * tileW) + ((totalInFirstRow - 1) * gap)
    local startX = math.floor((availableWidth - rowWidth) / 2)

    for i, reagent in ipairs(itemData.reagents) do
        local f = GetReagentIconFrame(i)

        f:ClearAllPoints()

        local row = math.floor((i - 1) / iconsPerRow)
        local col = (i - 1) % iconsPerRow

        local iconsThisRow = math.min(#itemData.reagents - (row * iconsPerRow), iconsPerRow)
        local thisRowWidth = (iconsThisRow * tileW) + ((iconsThisRow - 1) * gap)
        local thisStartX = math.floor((availableWidth - thisRowWidth) / 2)

        f:SetPoint(
            "TOPLEFT",
            rpopup,
            "TOPLEFT",
            thisStartX + col * (tileW + gap),
            startY - row * (tileH + gap)
        )

        f.btn.itemID = reagent.id

        f.icon:SetTexture(
            GetItemIcon(reagent.id)
            or "Interface\\Icons\\INV_Misc_QuestionMark"
        )

        f.countText:SetText(reagent.amount or 1)
        f:Show()
    end

    local rows = math.ceil(#itemData.reagents / iconsPerRow)
    local height = math.abs(startY) + (rows * (tileH + gap)) + 6

    rpopup:SetHeight(height)
    rpopup:Show()
end