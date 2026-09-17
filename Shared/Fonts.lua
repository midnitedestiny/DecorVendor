--[[
    Decor Vendor - Fonts.lua
    Custom font system
]]

local addonName, DVD = ...

local CUSTOM_FONT_PATH = "Interface\\AddOns\\DecorVendor\\Fonts\\Roboto_Condensed_semibold.ttf"

local FONT_TEMPLATES = {
    "GameFontNormalSmall",
    "GameFontHighlightSmall",
    "GameFontNormal",
    "GameFontHighlight",
    "GameFontNormalLarge",
    "GameFontHighlightLarge",
}

DVD.customFonts = {}
DVD.fontStringRegistry = {}
local registryCounter = 0

local function CreateCustomFontObjects()
    for _, templateName in ipairs(FONT_TEMPLATES) do
        local fontObjName = "DecorVendor_" .. templateName
        local fontObj = CreateFont(fontObjName)
        local baseFont = _G[templateName]

        if baseFont then
            fontObj:CopyFontObject(baseFont)
            local _, size, flags = baseFont:GetFont()
            fontObj:SetFont(CUSTOM_FONT_PATH, size, flags or "")
        else
            fontObj:SetFont(CUSTOM_FONT_PATH, 12, "")
        end

        DVD.customFonts[templateName] = fontObj
    end
end

function DVD:UseCustomFont()
    return vendorSettings and vendorSettings.useCustomFont
end

function DVD:GetFontPath()
    return self:UseCustomFont() and CUSTOM_FONT_PATH or STANDARD_TEXT_FONT
end

function DVD:GetFontObject(templateName)
    if self:UseCustomFont() and self.customFonts[templateName] then
        return self.customFonts[templateName]
    end
    return _G[templateName] or GameFontNormal
end

function DVD:SetCustomFontEnabled(enabled)
    if not vendorSettings then return end
    vendorSettings.useCustomFont = enabled == true
    self:ApplyFontSettings()
end

function DVD:CreateFontString(parent, layer, templateName)
    templateName = templateName or "GameFontNormal"
    local fontString = parent:CreateFontString(nil, layer or "OVERLAY")
    fontString:SetFontObject(self:GetFontObject(templateName))

    registryCounter = registryCounter + 1
    fontString.dvFontRegistryID = registryCounter
    self.fontStringRegistry[registryCounter] = {
        fontString = fontString,
        templateName = templateName,
    }

    return fontString
end

function DVD:ApplyFontSettings()
    local useCustom = self:UseCustomFont()

    for id, entry in pairs(self.fontStringRegistry) do
        local fs = entry.fontString
        if fs and fs:IsObjectType("FontString") then
            if useCustom and self.customFonts[entry.templateName] then
                fs:SetFontObject(self.customFonts[entry.templateName])
            else
                fs:SetFontObject(_G[entry.templateName] or GameFontNormal)
            end
        else
            self.fontStringRegistry[id] = nil
        end
    end
end

CreateCustomFontObjects()