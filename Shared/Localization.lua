-- ============================================================
-- Decor Vendor: Shared/Localization.lua  (loader)
-- Housing Codex style: one file per locale, L["KEY"] = "value".
--   Shared/Localization/enUS.lua  — base, always loads
--   Shared/Localization/ruRU.lua  — loads only on ruRU
--   Shared/Localization/esES.lua  — loads only on esES / esMX
-- Each locale file guards itself with:
--   if (DVD.EFFECTIVE_LOCALE or GetLocale()) ~= "ruRU" then return end
-- so loading order is: this loader, then enUS, then ruRU, then esES.
-- A missing key falls back to the key itself (see below), never nil.
--
-- Font note (ruRU): vendor cards use Arial Narrow, which renders
-- Cyrillic in WoW. Morpheus does NOT — do not switch the card
-- font back to Morpheus while ruRU is supported.
-- ============================================================

local addonName, DVD = ...

DVD.LOCALE = GetLocale()
--DVD.EFFECTIVE_LOCALE = "esES"
DVD.EFFECTIVE_LOCALE = DVD.LOCALE


-- TEST HOOK (safe to ship): on an English client you will ALWAYS
-- see English by default — that is correct, not a bug. To preview:
--   /dvlocale ruRU   /dvlocale esES   /dvlocale enUS (or /dvlocale clear)
-- It remembers your choice in vendorSettings.testLocale until cleared.
if vendorSettings and vendorSettings.testLocale and vendorSettings.testLocale ~= "" then
    DVD.EFFECTIVE_LOCALE = vendorSettings.testLocale
end

SLASH_DVLOCALE1 = "/dvlocale"
SlashCmdList = SlashCmdList or {}
SlashCmdList.DVLOCALE = function(msg)
    msg = (msg or ""):gsub("^%s+", ""):gsub("%s+$", ""):lower()
    vendorSettings = vendorSettings or {}
    local proper = { enus = "enUS", eses = "esES", esmx = "esMX", ruru = "ruRU" }
    if msg == "" or msg == "clear" or msg == "enus" then
        vendorSettings.testLocale = nil
        print("Decor Vendor: locale test cleared — back to your client language. Reloading...")
    elseif proper[msg] then
        vendorSettings.testLocale = proper[msg]
        print("Decor Vendor: testing locale '" .. proper[msg] .. "'. Reloading...")
    else
        print("Decor Vendor: unknown locale '" .. msg .. "'. Try: enUS, esES, ruRU")
        return
    end
    ReloadUI()
end

-- DVD.L: every key defaults to itself, so a key that no locale
-- file filled in yet still shows readable English text, never nil.
DVD.L = setmetatable({}, { __index = function(_, k) return k end })

DVD.LOCALIZATION_VERSION = 3
return DVD.L
