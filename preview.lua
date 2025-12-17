local addonName, dv = ...

-------------------------------------------------
-- MAIN PREVIEW FRAME (Large)
-------------------------------------------------
dv.previewFrame = CreateFrame("Frame", "DV_RewardFrame", UIParent, "BackdropTemplate")
local preview = dv.previewFrame

preview:SetSize(300, 330)
preview:SetFrameStrata("TOOLTIP")
preview:SetBackdrop({
    bgFile   = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets   = { left = 4, right = 4, top = 4, bottom = 4 }
})
preview:SetBackdropColor(0.05, 0.05, 0.05, 0.98)
preview:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
preview:Hide()

-- Title
preview.title = preview:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
preview.title:SetFont(STANDARD_TEXT_FONT, 15)
preview.title:SetPoint("TOP", 0, -12)
preview.title:SetWidth(280)
preview.title:SetTextColor(1, 0.82, 0)

-- Texture preview (2D)
preview.texture = preview:CreateTexture(nil, "ARTWORK")
preview.texture:SetSize(288, 288)
preview.texture:SetPoint("BOTTOM", 0, 6)
preview.texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
preview.texture:Hide()

-- 3D Model preview
preview.model = CreateFrame("PlayerModel", nil, preview)
preview.model:SetSize(288, 288)
preview.model:SetPoint("BOTTOM", 0, 6)
preview.model:Hide()

-- Rotation
local rotation = 0
preview:SetScript("OnUpdate", function(self, elapsed)
    if self:IsShown() and self.model:IsShown() then
        rotation = rotation + elapsed * 0.4
        self.model:SetFacing(rotation)
    end
end)

-------------------------------------------------
-- SMALL TOOLTIP PREVIEW (Used elsewhere)
-------------------------------------------------
dv.smallPreviewFrame = CreateFrame("Frame", "DV_SmallPreviewFrame", UIParent, "BackdropTemplate")
local small = dv.smallPreviewFrame

small:SetSize(220, 220)
small:SetFrameStrata("TOOLTIP")
small:SetBackdrop({
    bgFile   = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 14,
    insets   = { left = 4, right = 4, top = 4, bottom = 4 }
})
small:SetBackdropColor(0, 0, 0, 0.95)
small:SetBackdropBorderColor(0.6, 0.6, 0.6)
small:Hide()

small.texture = small:CreateTexture(nil, "ARTWORK")
small.texture:SetAllPoints()
small.texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)



-------------------------------------------------
-- GENERIC PREVIEW HELPERS
-------------------------------------------------
function dv.ShowPreviewTexture(texture, title)
    preview.model:Hide()
    preview.texture:SetTexture(texture)
    preview.texture:Show()
    preview.title:SetText(title or "Decor Preview")
    preview:Show()
end

function dv.ShowPreviewModel(modelFileID, title)
    preview.texture:Hide()
    preview.model:SetModel(modelFileID)
    preview.model:SetFacing(0)
    preview.model:Show()
    preview.title:SetText(title or "Decor Preview")
    preview:Show()
end

function dv.HidePreview()
    preview:Hide()
    small:Hide()
end

