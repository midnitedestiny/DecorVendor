-- ============================================================
-- Decor Vendor Data
-- Debug.lua
-- Debug commands, catalog checks, and copy/paste exports
-- ============================================================
--
-- Slash Commands:
--
-- /dvdata
--   Shows this command list.
--
-- /dvdata count
--   Prints total ActiveItems, unique decorIDs, and missing decorID count.
--
-- /dvdata catalog
--   Checks which DecorVendorData decorIDs are visible in the current Housing Catalog.
--
-- /dvdata groups
--   Prints item counts for every registered data group/file.
--
-- /dvdata group Midnight
--   Prints the item count for one specific group.
--   Example: /dvdata group The Burning Crusade
--
-- /dvdata hidden
--   Prints page 1 of decor items hidden/missing from the current Housing Catalog.
--
-- /dvdata hidden 2
--   Prints page 2 of hidden/missing catalog items.
--
-- /dvdata hidden groups
--   Prints hidden/missing item counts grouped by data file/category.
--
-- /dvdata target (or /dvdata check)
--   Scrapes current merchant items with live catalog pricing/zone cross-referencing.
--
-- /dvhidden
--   Opens a copy/paste popout box with all hidden/missing catalog items.
--
-- ============================================================

local addonName, DVD = ...

DVD.ActiveItems = DVD.ActiveItems or {}
DVD.ActiveItemsByExpansion = DVD.ActiveItemsByExpansion or {}

-- Global tracking variables for multi-page stream caching
DVD.ScraperSessionDump = DVD.ScraperSessionDump or {}
DVD.ScraperSessionNPC = DVD.ScraperSessionNPC or 0

-- ============================================================
-- Basic Counts
-- ============================================================

function DVD.DebugCounts()
    local total = 0
    local noDecorID = 0
    local uniqueDecorIDs = 0
    local seenDecorIDs = {}

    for itemID, data in pairs(DVD.ActiveItems or {}) do
        total = total + 1

        if data.decorID then
            if not seenDecorIDs[data.decorID] then
                seenDecorIDs[data.decorID] = true
                uniqueDecorIDs = uniqueDecorIDs + 1
            end
        else
            noDecorID = noDecorID + 1
        end
    end

    print("|cffffd100DecorVendorData Counts|r")
    print("Active itemIDs:", total)
    print("Unique decorIDs:", uniqueDecorIDs)
    print("Missing decorID:", noDecorID)
end

function DVD.DebugCatalogMatch()
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        print("|cffff4040DecorVendorData: Housing Catalog API is not available.|r")
        return
    end

    local checked = 0
    local found = 0
    local missing = 0

    for itemID, data in pairs(DVD.ActiveItems or {}) do
        if data.decorID then
            checked = checked + 1

            local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, 1, data.decorID, true)

            if ok and info then
                found = found + 1
            else
                missing = missing + 1
            end
        end
    end

    print("|cffffd100DecorVendorData Catalog Match|r")
    print("Checked decorIDs:", checked)
    print("Found in this catalog:", found)
    print("Missing/hidden on this build:", missing)
end

-- ============================================================
-- Group Counts
-- ============================================================

function DVD.DebugGroup(groupName)
    if not groupName or groupName == "" then
        print("|cffffcc00Usage:|r /dvdata group Midnight")
        return
    end

    local groups = DVD.ActiveItemsByExpansion or {}
    local group = groups[groupName]

    if not group then
        local lowerWanted = string.lower(groupName)

        for name, data in pairs(groups) do
            if string.lower(name) == lowerWanted then
                groupName = name
                group = data
                break
            end
        end
    end

    if not group then
        print("|cffff4040DecorVendorData: No group found named:|r", groupName)
        return
    end

    local count = 0

    for _ in pairs(group) do
        count = count + 1
    end

    print("|cffffd100DecorVendorData Group|r", groupName, "=", count, "items")
end

function DVD.DebugGroups()
    print("|cffffd100DecorVendorData Groups|r")

    local names = {}

    for groupName in pairs(DVD.ActiveItemsByExpansion or {}) do
        table.insert(names, groupName)
    end

    table.sort(names)

    for _, groupName in ipairs(names) do
        local count = 0
        local group = DVD.ActiveItemsByExpansion[groupName]

        for _ in pairs(group or {}) do
            count = count + 1
        end

        print(groupName .. ":", count)
    end
end

-- ============================================================
-- Hidden / Missing Catalog Items
-- ============================================================

function DVD.GetHiddenCatalogItems()
    local hidden = {}

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        print("|cffff4040DecorVendorData: Housing Catalog API is not available.|r")
        return hidden
    end

    for itemID, data in pairs(DVD.ActiveItems or {}) do
        if data.decorID then
            local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, 1, data.decorID, true)

            if not ok or not info then
                table.insert(hidden, {
                    itemID = itemID,
                    data = data,
                    group = data.expansion or (DVD.ActiveItemSources and DVD.ActiveItemSources[itemID]) or "Unknown",
                })

                if C_Item and C_Item.RequestLoadItemDataByID then
                    C_Item.RequestLoadItemDataByID(itemID)
                end
            end
        end
    end

    table.sort(hidden, function(a, b)
        if a.group == b.group then
            return a.itemID < b.itemID
        end

        return tostring(a.group) < tostring(b.group)
    end)

    return hidden
end

function DVD.DebugHiddenCatalogItems(page)
    page = tonumber(page) or 1

    local hidden = DVD.GetHiddenCatalogItems()
    local perPage = 20
    local total = #hidden
    local totalPages = math.max(1, math.ceil(total / perPage))

    if page < 1 then
        page = 1
    end

    if page > totalPages then
        page = totalPages
    end

    print("|cffffd100DecorVendorData Hidden Catalog Items|r")
    print("Hidden/missing on this build:", total, "Page:", page .. "/" .. totalPages)

    local startIndex = ((page - 1) * perPage) + 1
    local endIndex = math.min(startIndex + perPage - 1, total)

    for i = startIndex, endIndex do
        local entry = hidden[i]
        local itemName = C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(entry.itemID)

        itemName = itemName or ("itemID " .. entry.itemID)

        print(
            i .. ".",
            "|cff66ccff" .. tostring(entry.group) .. "|r",
            itemName,
            "itemID:", entry.itemID,
            "decorID:", entry.data.decorID,
            "source:", tostring(entry.data.source)
        )
    end

    if page < totalPages then
        print("|cffffcc00Next page:|r /dvdata hidden " .. (page + 1))
    end
end

function DVD.DebugHiddenByGroup()
    local hidden = DVD.GetHiddenCatalogItems()
    local counts = {}
    local names = {}

    for _, entry in ipairs(hidden) do
        local group = entry.group or "Unknown"

        if not counts[group] then
            table.insert(names, group)
            counts[group] = 0
        end

        counts[group] = counts[group] + 1
    end

    table.sort(names)

    print("|cffffd100DecorVendorData Hidden By Group|r")

    for _, group in ipairs(names) do
        print(group .. ":", counts[group])
    end
end

-- ============================================================
-- Lua Export Helpers
-- ============================================================

local function DVD_TableKeySort(a, b)
    return tostring(a) < tostring(b)
end

local function DVD_SerializeValue(value)
    local valueType = type(value)

    if valueType == "string" then
        return string.format("%q", value)
    elseif valueType == "number" or valueType == "boolean" then
        return tostring(value)
    elseif valueType == "table" then
        local parts = {}
        local isArray = true
        local maxIndex = 0

        for k in pairs(value) do
            if type(k) ~= "number" then
                isArray = false
                break
            end

            if k > maxIndex then
                maxIndex = k
            end
        end

        if isArray then
            for i = 1, maxIndex do
                table.insert(parts, DVD_SerializeValue(value[i]))
            end

            return "{" .. table.concat(parts, ", ") .. "}"
        end

        local keys = {}

        for k in pairs(value) do
            if k ~= "expansion" then
                table.insert(keys, k)
            end
        end

        table.sort(keys, DVD_TableKeySort)

        for _, k in ipairs(keys) do
            local keyText

            if type(k) == "string" and string.match(k, "^[%a_][%w_]*$") then
                keyText = k
            else
                keyText = "[" .. DVD_SerializeValue(k) .. "]"
            end

            table.insert(parts, keyText .. " = " .. DVD_SerializeValue(value[k]))
        end

        return "{ " .. table.concat(parts, ", ") .. " }"
    end

    return "nil"
end

function DVD.BuildHiddenCatalogExport()
    local hidden = DVD.GetHiddenCatalogItems()
    local lines = {}

    table.insert(lines, "-- ============================================================")
    table.insert(lines, "-- DecorVendorData hidden/missing catalog items")
    table.insert(lines, "-- These are in DecorVendorData.ActiveItems but hidden/missing")
    table.insert(lines, "-- from the Housing Catalog API on this current build/realm.")
    table.insert(lines, "-- Total hidden/missing: " .. tostring(#hidden))
    table.insert(lines, "-- ============================================================")
    table.insert(lines, "")

    local lastGroup

    for _, entry in ipairs(hidden) do
        local itemID = entry.itemID
        local data = entry.data
        local group = entry.group or "Unknown"

        if group ~= lastGroup then
            if lastGroup then
                table.insert(lines, "")
            end

            table.insert(lines, "-- " .. tostring(group))
            lastGroup = group
        end

        local itemName = C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(itemID)
        local nameComment = itemName and (" -- " .. itemName) or ""

        table.insert(lines, "[" .. itemID .. "] = " .. DVD_SerializeValue(data) .. "," .. nameComment)
    end

    return table.concat(lines, "\n")
end

-- ============================================================
-- Copy Box Frame
-- ============================================================

function DVD.ShowCopyBox(title, text)
    if not DVD.CopyFrame then
        local frame = CreateFrame("Frame", "DecorVendorDataCopyFrame", UIParent, "BackdropTemplate")
        frame:SetSize(850, 620)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("DIALOG")
        frame:SetFrameLevel(500)
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

        frame:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            edgeSize = 1,
        })

        frame:SetBackdropColor(0.02, 0.015, 0.035, 0.98)
        frame:SetBackdropBorderColor(0.9, 0.7, 0.2, 1)

        frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        frame.title:SetPoint("TOP", 0, -14)
        frame.title:SetText("|cffffd100DecorVendorData Export|r")

        frame.instructions = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        frame.instructions:SetPoint("TOP", frame.title, "BOTTOM", 0, -6)
        frame.instructions:SetText("|cffccccccClick inside the box, press Ctrl+A, then Ctrl+C.|r")

        local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", 18, -58)
        scroll:SetPoint("BOTTOMRIGHT", -32, 48)

        local editBox = CreateFrame("EditBox", nil, scroll)
        editBox:SetMultiLine(true)
        editBox:SetAutoFocus(false)
        editBox:SetFontObject(ChatFontNormal)
        editBox:SetWidth(780)
        editBox:SetTextInsets(8, 8, 8, 8)

        editBox:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
        end)

        editBox:SetScript("OnEditFocusGained", function(self)
            self:HighlightText()
        end)

        scroll:SetScrollChild(editBox)

        frame.editBox = editBox
        frame.scroll = scroll

        frame.selectAll = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
        frame.selectAll:SetSize(110, 24)
        frame.selectAll:SetPoint("BOTTOMLEFT", 18, 14)
        frame.selectAll:SetText("Select All")
        frame.selectAll:SetScript("OnClick", function()
            frame.editBox:SetFocus()
            frame.editBox:HighlightText()
        end)

        frame.close = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
        frame.close:SetSize(90, 24)
        frame.close:SetPoint("BOTTOMRIGHT", -18, 14)
        frame.close:SetText("Close")
        frame.close:SetScript("OnClick", function()
            frame:Hide()
        end)

        DVD.CopyFrame = frame
    end

    DVD.CopyFrame.title:SetText(title or "|cffffd100DecorVendorData Export|r")
    DVD.CopyFrame.editBox:SetText(text or "")
    DVD.CopyFrame.editBox:SetCursorPosition(0)
    DVD.CopyFrame.editBox:HighlightText()
    DVD.CopyFrame:Show()
end

function DVD.OpenHiddenCatalogCopyBox()
    local text = DVD.BuildHiddenCatalogExport()
    DVD.ShowCopyBox("|cffffd100Hidden Catalog Items|r", text)
end

-- ============================================================
-- 🏛️ PTR LIVE MERCHANDISE SCRAPER & DATA SYNC MATRIX
-- ============================================================

function DVD.ScrapeAndCrossReferenceCatalog(msg)
    if not MerchantFrame or not MerchantFrame:IsShown() then
        print("❌ Error: You must talk to a housing vendor and open their shop window first!")
        return
    end

    local lowerMsg = string.lower(msg or "")

    -- Identify targeted merchant NPC metadata properties safely
    local npcName = UnitName("target") or "Unknown Vendor"
    local npcID = 0
    local guid = UnitGUID("target")
    if guid then
        local parts = { strsplit("-", guid) }
        if parts[1] == "Creature" or parts[1] == "Vehicle" then
            npcID = tonumber(parts[6]) or 0
        end
    end
    if npcID == 0 then npcID = 255222 end

    -- Reset session list if switching to a brand new NPC or typing clear
    if DVD.ScraperSessionNPC ~= npcID or lowerMsg == "clear" or lowerMsg == "reset" then
        DVD.ScraperSessionDump = {}
        DVD.ScraperSessionNPC = npcID
    end

    -- Determine slot count variables matching active engine configurations
    local numMerchantItems = 0
    if C_MerchantFrame and C_MerchantFrame.GetNumMerchantItems then
        numMerchantItems = C_MerchantFrame.GetNumMerchantItems() or 0
    elseif _G.GetNumMerchantItems then
        numMerchantItems = _G.GetNumMerchantItems() or 0
    end

    local currentPage = 1
    if C_MerchantFrame and C_MerchantFrame.GetPage then
        currentPage = C_MerchantFrame.GetPage() or 1
    elseif MerchantFrame and MerchantFrame.page then
        currentPage = MerchantFrame.page or 1
    end

    local itemsPerPage = MERCHANT_ITEMS_PER_PAGE or 10
    if itemsPerPage < 10 then itemsPerPage = 10 end

    local startSlot = ((currentPage - 1) * itemsPerPage) + 1
    local endSlot = startSlot + itemsPerPage - 1

    local newlyScrapedThisPage = 0
    local fileMatchesCount = 0

    for i = startSlot, endSlot do
        local itemLink
        if C_MerchantFrame and C_MerchantFrame.GetMerchantItemLink then
            itemLink = C_MerchantFrame.GetMerchantItemLink(i)
        elseif _G.GetMerchantItemLink then
            itemLink = _G.GetMerchantItemLink(i)
        end
        
        if itemLink then
            local itemID = tonumber(itemLink:match("item:(%d+)"))
            
            if itemID and not DVD.ScraperSessionDump[itemID] then
                local name, price, currencyID = "Unknown Item", 0, nil
                
                -- Protected evaluation pass-through
                pcall(function()
                    if C_MerchantFrame and C_MerchantFrame.GetMerchantItemInfo then
                        local info = C_MerchantFrame.GetMerchantItemInfo(i)
                        if info then
                            name = info.name or name
                            price = info.price or 0
                            currencyID = info.currencyID
                        end
                    elseif _G.GetMerchantItemInfo then
                        name, _, price, _, _, _, _, currencyID = _G.GetMerchantItemInfo(i)
                    end
                end)

                -- Query backend core database fields to gather true zone definitions text
                local catalogZone = "Unknown Zone"
                
                if C_Housing and C_Housing.GetDecorInfoByItemID then
                    local decorInfo = C_Housing.GetDecorInfoByItemID(itemID)
                    if decorInfo and decorInfo.decorID then
                        catalogZone = decorInfo.sourceZone or decorInfo.obtainedFrom or "Catalog Record Bound"
                    else
                        catalogZone = "⚠️ NOT IN CATALOG ⚠️"
                    end
                end

                -- Cross-reference against your updated layout database structures (Deep Scan Arrays)
                local fileRecord = DVD.ActiveItems and DVD.ActiveItems[itemID]
                local catalogComment = ""
                
                if fileRecord then
                    catalogComment = string.format(" -- ✅ MATCHED IN FILES (decorID: %s)", tostring(fileRecord.decorID or "???"))
                    fileMatchesCount = fileMatchesCount + 1
                else
                    catalogComment = " -- 🚨 GAP DETECTED! Unmarked or missing from files list arrays!"
                end

                -- Auto-format pricing definitions properties string layouts safely
                local priceString = ""
                price = price or 0
                if currencyID and price > 0 then
                    priceString = string.format("price = { currencyID = %d, amount = %d }, ", currencyID, price)
                elseif price > 0 then
                    local goldAmount = math.floor(price / 10000)
                    priceString = string.format('priceText = "%d ", ', goldAmount)
                end

                local row = string.format(
                    '    [%d] = {\n        [%d] = { %sdisplayZone = "%s" },%s\n    },',
                    itemID, npcID, priceString, catalogZone, catalogComment
                )
                
                DVD.ScraperSessionDump[itemID] = row
                newlyScrapedThisPage = newlyScrapedThisPage + 1
            end
        end
    end

    -- Combine tracking dictionary indexes back to consecutive ledger strings
    local finalDump = {}
    table.insert(finalDump, "    -- ============================================================")
    table.insert(finalDump, string.format("    -- 🏛️ BLIZZARD HOUSING CATALOG SYNC: %s (NPC ID: %d)", npcName:upper(), npcID))
    table.insert(finalDump, "    -- ============================================================")

    local absoluteTotalCount = 0
    for _, formattedRow in pairs(DVD.ScraperSessionDump) do
        table.insert(finalDump, formattedRow)
        absoluteTotalCount = absoluteTotalCount + 1
    end

    local finalOutputText = table.concat(finalDump, "\n")

    -- Stream outputs directly into visual copy popup frames
    if absoluteTotalCount > 0 then
        if DVD.ShowCopyBox then
            DVD.ShowCopyBox(string.format("%s DATA CODES", npcName:upper()), finalOutputText)
            
            local boxFrame = _G["DecorVendorDataCopyFrame"] or DVD.CopyFrame
            if boxFrame and boxFrame:IsShown() then
                local editBox = boxFrame.editBox
                if editBox and editBox.SetText then
                    editBox:SetText(finalOutputText)
                    editBox:HighlightText()
                end
            end
        else
            print(finalOutputText)
        end
        print(string.format("|cff30d580[Catalog Sync]|r Page %d processed! Added %d items. Total Session: |cffbfa0ff%d items|r.", currentPage, newlyScrapedThisPage, absoluteTotalCount))
    else
        print("|cffff4040[Catalog Error]|r No items processed. Turn the page view and re-run your macro command option.")
    end
end

-- ============================================================
-- Slash Command Global Dispatch Engine Router
-- ============================================================

SLASH_DECORVENDORDATA1 = "/dvdata"
SlashCmdList["DECORVENDORDATA"] = function(msg)
    msg = msg or ""
    local lower = string.lower(msg)

    if lower == "count" or lower == "counts" then
        DVD.DebugCounts()
    elseif lower == "catalog" then
        DVD.DebugCatalogMatch()
    elseif lower == "groups" then
        DVD.DebugGroups()
    elseif lower == "hidden groups" or lower == "hiddengroups" then
        DVD.DebugHiddenByGroup()
    elseif string.match(lower, "^hidden%s*%d*") then
        local page = string.match(msg, "^hidden%s*(%d*)$")
        DVD.DebugHiddenCatalogItems(page)
    elseif string.match(lower, "^group%s+") then
        local groupName = string.match(msg, "^group%s+(.+)$")
        DVD.DebugGroup(groupName)
    elseif lower == "target" or lower == "vendor" or lower == "scrape" or lower == "" or lower == "check" or lower == "ptr" or lower == "compare" or lower == "faction" then
        DVD.ScrapeAndCrossReferenceCatalog(msg)
    else
        print("|cffffd100DecorVendorData Commands|r")
        print("/dvdata count")
        print("/dvdata catalog")
        print("/dvdata groups")
        print("/dvdata group Midnight")
        print("/dvdata hidden")
        print("/dvdata hidden 2")
        print("/dvdata hidden groups")
        print("/dvdata target — Scrape/Verify Active Merchant Storefront")
        print("/dvhidden")
    end
end

SLASH_DECORVENDORHIDDEN1 = "/dvhidden"
SlashCmdList["DECORVENDORHIDDEN"] = function()
    DVD.OpenHiddenCatalogCopyBox()
end

-- ============================================================
-- 🏛️ INTENSIVE CATALOG CLIENT SWEEPER WITH LIVE RE-CACHE
-- Bypasses item lists, updates cache from server, and dumps missing lines
-- ============================================================
SLASH_DVGFORCESWEEP1 = "/dvgforcesweep"
SlashCmdList["DVGFORCESWEEP"] = function()
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        print("|cffff4040DVG Sweep Error:|r Housing Catalog API is not available on this client build.")
        return
    end

    print("|cffffd100DVG Sweep:|r Aggressively syncing with server and scanning database indices...")

    -- Build a fast lookup map of decorIDs you already have in ActiveItems
    local activeByDecorID = {}
    for itemID, itemData in pairs(DVD.ActiveItems or {}) do
        if type(itemData) == "table" and itemData.decorID then
            activeByDecorID[itemData.decorID] = true
        end
    end

    local lines = {}
    local totalFound = 0
    local totalMissing = 0

    table.insert(lines, "Decor Vendor Gallery - Live Client Data Sync Sweep")
    table.insert(lines, "Generated via /dvgforcesweep")
    table.insert(lines, "============================================================")
    table.insert(lines, "")

    -- Scan extended range up to 6000 to catch anything added deep in the PTR build tables
    for testDecorID = 1, 6000 do
        local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, 1, testDecorID, true)
        
        if ok and info and info.name and info.name ~= "" then
            totalFound = totalFound + 1
            
            -- Isolate items not caught in your ActiveItems list
            if not activeByDecorID[testDecorID] then
                totalMissing = totalMissing + 1
                
                local decorName = info.name or "Unknown Decor"
                local model3D = info.asset or info.model3D or 0
                local sourceZone = info.sourceZone or info.obtainedFrom or "New PTR Source"
                
                -- Output human-readable list detail
                table.insert(lines, string.format("NEW PTR ITEM %d: %s | decorID: %d | model3D: %d | Source: %s", totalMissing, decorName, testDecorID, model3D, sourceZone))
                
                -- Generate code template block using temporary placeholder itemID index numbers
                local fakeItemID = 999000 + testDecorID
                table.insert(lines, string.format("    [%d] = { decorID = %d, model3D = %d, name = %q, source = \"catalog\", zone = %q },", fakeItemID, testDecorID, model3D, decorName, sourceZone))
            end
        end
    end

    table.insert(lines, "")
    table.insert(lines, "============================================================")
    table.insert(lines, "Total Client Decor Records Loaded: " .. tostring(totalFound))
    table.insert(lines, "New PTR Items Discovered: " .. tostring(totalMissing))

    -- Load straight into your addon's custom copy-paste frame container
    if totalMissing > 0 then
        if DVD.ShowCopyBox then
            DVD.ShowCopyBox("Fresh Client Database Sync Results", table.concat(lines, "\n"))
        else
            print(table.concat(lines, "\n"))
        end
    else
        print("|cff00ff66DVG Sweep Complete:|r Cache fully synchronized, but zero new items detected. Try opening the default catalog frame first.")
    end
end

-- ============================================================
-- 🏛️ RE-ARCHITECTED EXPORTER FOR MASTER DATA FILES
-- Generates clean, properly separated lines for all three data files
-- ============================================================
SLASH_DVMISSING1 = "/dvmissing"

SlashCmdList["DVMISSING"] = function()
    if not DVD.LoadCatalogRecords then
        print("Loader missing.")
        return
    end

    DVD.LoadCatalogRecords(function(success)
        if not success then
            print("Catalog failed to load.")
            return
        end

        local activeLines = {
            "-- ============================================================",
            "-- SECTION 1: PASTE INTO ActiveItems.lua",
            "-- ============================================================"
        }
        
        local itemDetailLines = {
            "",
            "-- ============================================================",
            "-- SECTION 2: PASTE INTO GalleryItemDetails.lua",
            "-- ============================================================"
        }
        
        local vendorLines = {
            "",
            "-- ============================================================",
            "-- SECTION 3: PASTE INTO GalleryVendorDetails.lua",
            "-- ============================================================"
        }

        local count = 0

        -- Inline helper to strip out newlines, colors, and clean up messy text strings
        local function CleanCatalogString(text)
            if not text or type(text) ~= "string" then return "" end
            text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "") -- Strip layout colors
            text = text:gsub("\r", " "):gsub("\n", " ") -- Flatten all vertical layout linebreaks
            text = text:gsub("%s+", " ") -- Collapse wide tab gaps
            return text:gsub("^%s+", ""):gsub("%s+$", "") -- Final edge trim
        end

        for itemID, record in pairs(DVD.catalogByItemID or {}) do
            if itemID and not DVD.ActiveItems[itemID] then
                count = count + 1

                local decorID = record.decorID or record.recordID or 0
                local model3D = record.model3D or record.asset or record.uiModelSceneID or 0
                local rawSource = record.sourceText or record.source or "unknown"
                local cleanSource = CleanCatalogString(rawSource)
                local name = CleanCatalogString(record.name or "Unknown Item")

                -- ------------------------------------------------------------
                -- 📊 REGEX EVALUATION MATRIX
                -- ------------------------------------------------------------
                local determinedType = "catalog"
                local npcName = cleanSource:match("Vendor:%s*([^:][^Zone:]+)") or cleanSource:match("Vendor:%s*([^:]+)")
                local zoneName = cleanSource:match("Zone:%s*([^:][^Cost:]+)") or cleanSource:match("Zone:%s*([^:]+)")
                local costText = cleanSource:match("Cost:%s*(.-)$") or cleanSource:match("(%d+)$")
                local achName = cleanSource:match("Achievement:%s*([^:][^Category:]+)") or cleanSource:match("Achievement:%s*([^:]+)")
                local achCategory = cleanSource:match("Category:%s*([^:][^Vendor:]+)") or cleanSource:match("Category:%s*([^:]+)")
                local questName = cleanSource:match("Quest:%s*([^:][^Zone:]+)") or cleanSource:match("Quest:%s*([^:]+)")
                local dropName = cleanSource:match("Drop:%s*([^:][^Zone:]+)") or cleanSource:match("Drop:%s*([^:]+)")

                -- Strict line-end cleaning blocks
                if npcName then npcName = npcName:gsub("Zone.*", ""):gsub("Cost.*", ""):trim() end
                if zoneName then zoneName = zoneName:gsub("Cost.*", ""):gsub("Vendor.*", ""):trim() end
                if achName then achName = achName:gsub("Category.*", ""):gsub("Vendor.*", ""):trim() end
                if achCategory then achCategory = achCategory:gsub("Vendor.*", ""):trim() end
                if questName then questName = questName:gsub("Zone.*", ""):trim() end
                if dropName then dropName = dropName:gsub("Zone.*", ""):trim() end

                -- Match source types for ActiveItems
                if cleanSource:find("Shop") then
                    determinedType = "shop"
                elseif questName then
                    determinedType = "quest"
                elseif achName then
                    determinedType = "achievement"
                elseif dropName then
                    determinedType = "drop"
                elseif npcName then
                    determinedType = "vendor"
                end

                -- ------------------------------------------------------------
                -- 📂 FILE TYPE 1: ActiveItems.lua Output Line
                -- ------------------------------------------------------------
                table.insert(activeLines, string.format(
                    "[%d] = { decorID = %d, model3D = %d, source = %q }, -- %s",
                    itemID, decorID, model3D, determinedType, name
                ))

                -- ------------------------------------------------------------
                -- 📂 FILE TYPE 2: GalleryItemDetails.lua Output Line
                -- ------------------------------------------------------------
                local detailFields = {}
                if questName then table.insert(detailFields, string.format("questName = %q", questName)) end
                if achName then table.insert(detailFields, string.format("achievementName = %q", achName)) end
                if achCategory then table.insert(detailFields, string.format("achievementCategory = %q", achCategory)) end
                if dropName then table.insert(detailFields, string.format("dropName = %q", dropName)) end
                
                if #detailFields > 0 then
                    table.insert(itemDetailLines, string.format(
                        "Gallery.ItemDetails[%d] = { %s }",
                        itemID, table.concat(detailFields, ", ")
                    ))
                end

                -- ------------------------------------------------------------
                -- 📂 FILE TYPE 3: GalleryVendorDetails.lua Nested Format Block
                -- ------------------------------------------------------------
                if npcName or zoneName or costText then
                    local vendorFields = {}
                    
                    if costText and costText ~= "" then
                        local currencyID = costText:match("currency:(%d+)")
                        local numericalAmount = costText:match("^(%d+)") or costText:match("(%d+)%s*$")
                        
                        if currencyID and numericalAmount then
                            table.insert(vendorFields, string.format("currencyID = %d, amount = %d", tonumber(currencyID), tonumber(numericalAmount)))
                        elseif numericalAmount then
                            table.insert(vendorFields, string.format("priceText = %q", numericalAmount .. " "))
                        else
                            table.insert(vendorFields, string.format("priceText = %q", CleanCatalogString(costText)))
                        end
                    end
                    
                    if zoneName then 
                        table.insert(vendorFields, string.format("displayZone = %q", zoneName)) 
                    end
                    
                    local insideFields = #vendorFields > 0 and table.concat(vendorFields, ", ") or ""
                    local commentNpc = npcName or "Unknown NPC"
                    
                    local formattedBlock = string.format(
                        "[%d] = {\n    -- %s\n    [1247] = { %s },\n},",
                        itemID, commentNpc, insideFields
                    )
                    table.insert(vendorLines, formattedBlock)
                end
            end
        end

        -- Wrap everything together into your copy box window output
        local masterDump = {}
        for _, v in ipairs(activeLines) do table.insert(masterDump, v) end
        for _, v in ipairs(itemDetailLines) do table.insert(masterDump, v) end
        for _, v in ipairs(vendorLines) do table.insert(masterDump, v) end
        
        table.insert(masterDump, "")
        table.insert(masterDump, "-- Total Missing Items Handled: " .. tostring(count))

        if DVD.ShowCopyBox then
            DVD.ShowCopyBox("|cff55ff55Clean Formatted Data Export (Three-File Split)|r", table.concat(masterDump, "\n"))
        end
    end)
end

SLASH_DVFLATTENVENDORS1 = "/dvflattenvendors"

SlashCmdList["DVFLATTENVENDORS"] = function()
    local lines = {}

    table.insert(lines, "local addonName, DVD = ...")
    table.insert(lines, "")
    table.insert(lines, "DVD.npcs = DVD.npcs or {}")
    table.insert(lines, "")

    for _, group in ipairs(DVD.npcs or {}) do
        table.insert(lines, "--==================================================")
        table.insert(lines, "-- " .. (group.expansion or "Unknown"))
        table.insert(lines, "-- " .. (group.name or ""))
        table.insert(lines, "--==================================================")

        local vendorsList = group.vendors or group
        for _, vendor in pairs(vendorsList) do
            if type(vendor) == "table" and vendor.id then
                local entryParts = {
                    string.format('zone=%q', vendor.zone or ""),
                    string.format('model3D=%d', vendor.model3D or 0),
                    string.format('title=%q', vendor.title or ""),
                    string.format('expansion=%q', group.expansion or ""),
                    string.format('zoneGroup=%q', group.name or ""), 
                    string.format('faction=%q', vendor.faction or "neutral"),
                }

                if vendor.variableLocation then
                    table.insert(entryParts, 'variableLocation=true')
                else
                    table.insert(entryParts, string.format('x=%s', tostring(vendor.x or 0)))
                    table.insert(entryParts, string.format('y=%s', tostring(vendor.y or 0)))
                    table.insert(entryParts, string.format('mapID=%d', vendor.mapID or 0))
                end

                if vendor.profession and vendor.profession ~= "" then
                    table.insert(entryParts, string.format('profession=%q', string.lower(vendor.profession)))
                end

                if vendor.note and vendor.note ~= "" then
                    table.insert(entryParts, string.format('note=%q', vendor.note))
                end
                if vendor.category and vendor.category ~= "" then
                    table.insert(entryParts, string.format('category=%q', vendor.category))
                end

                local finalLine = string.format('DVD.npcs[%d] = { %s }', vendor.id, table.concat(entryParts, ", "))
                table.insert(lines, finalLine)
            end
        end

        table.insert(lines, "")
    end

    if DVD.ShowCopyBox then
        DVD.ShowCopyBox("Flattened Vendors Directory", table.concat(lines, "\n"))
    end
end

-- ============================================================
-- 📜 LIVE PTR QUEST LOG TRACKER & EVENT WATCHDOG
-- ============================================================
local ENABLE_DVG_QUEST_WATCHER = false

if ENABLE_DVG_QUEST_WATCHER then
    local questWatchFrame = CreateFrame("Frame")
    questWatchFrame:RegisterEvent("QUEST_TURNED_IN")
    questWatchFrame:RegisterEvent("QUEST_ACCEPTED")

    questWatchFrame:SetScript("OnEvent", function(self, event, questID)
        if not questID then return end

        local questName = C_QuestLog.GetTitleForQuestID(questID) or "Unknown Quest"

        if event == "QUEST_TURNED_IN" then
            print(string.format("|cff00ff00[DVG Quest Watcher]:|r COMPLETED! %s |cffffd100(Quest ID: %d)|r", questName, questID))
        elseif event == "QUEST_ACCEPTED" then
            print(string.format("|cff66ccff[DVG Quest Watcher]:|r ACCEPTED: %s |cffffd100(Quest ID: %d)|r", questName, questID))
        end
    end)
end

SLASH_DVRECIPES1 = "/dvrecipes"

SlashCmdList["DVRECIPES"] = function()
    if not DVD or not DVD.LoadCatalogRecords then
        print("|cffff4040DV Recipes:|r DecorVendorData catalog loader missing.")
        return
    end

    if not C_TradeSkillUI or not C_TradeSkillUI.GetAllRecipeIDs then
        print("|cffff4040DV Recipes:|r TradeSkill API missing. Open a profession window first.")
        return
    end

    DVD.LoadCatalogRecords(function(success)
        if not success then
            print("|cffff4040DV Recipes:|r Housing catalog failed to load.")
            return
        end

        local lines = {}
        local count = 0

        table.insert(lines, "-- ============================================================")
        table.insert(lines, "-- DecorVendorData Housing Profession Recipe Export")
        table.insert(lines, "-- Generated with /dvrecipes")
        table.insert(lines, "-- ============================================================")
        table.insert(lines, "")

        local recipeIDs = C_TradeSkillUI.GetAllRecipeIDs() or {}

        for _, recipeID in ipairs(recipeIDs) do
            local info = C_TradeSkillUI.GetRecipeInfo(recipeID)

            local output
            if C_TradeSkillUI.GetRecipeOutputItemData then
                output = C_TradeSkillUI.GetRecipeOutputItemData(recipeID)
            end

            local itemID = output and (output.itemID or (output.hyperlink and tonumber(output.hyperlink:match("item:(%d+)"))))

            local catalogRecord = itemID and DVD.catalogByItemID and DVD.catalogByItemID[itemID]

            if catalogRecord then
                count = count + 1

                local name = catalogRecord.name or (info and info.name) or ("Item " .. tostring(itemID))
                local profession = (info and (info.professionName or info.parentProfessionName)) or "profession"

                table.insert(lines, string.format(
                    '[%d] = { decorID = %d, model3D = %d, source = "profession", profession = %q, recipeID = %d }, -- %s',
                    itemID,
                    tonumber(catalogRecord.decorID or catalogRecord.recordID) or 0,
                    tonumber(catalogRecord.model3D or catalogRecord.asset) or 0,
                    tostring(profession),
                    tonumber(recipeID) or 0,
                    tostring(name)
                ))
            end
        end

        table.insert(lines, "")
        table.insert(lines, "-- Total housing profession recipes found: " .. tostring(count))

        if DVD.ShowCopyBox then
            DVD.ShowCopyBox("|cffffd100Housing Profession Recipes|r", table.concat(lines, "\n"))
        else
            print(table.concat(lines, "\n"))
        end
    end)
end

SLASH_DVDUMPCATALOG1 = "/dvdumpcatalog"

SlashCmdList["DVDUMPCATALOG"] = function(msg)
    local decorID = tonumber(msg)

    if not decorID then
        print("Usage: /dvdumpcatalog <decorID>")
        return
    end

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        print("|cffff4040DecorVendorData: Housing Catalog API is not available.|r")
        return
    end

    local ok, info = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, 1, decorID, true)

    if not ok or not info then
        print("DecorID not found:", decorID)
        return
    end

    local lines = {}

    table.insert(lines, "-- Catalog Entry Dump")
    table.insert(lines, "-- DecorID: "..decorID)
    table.insert(lines, "")

    local function Serialize(tbl, indent)
        indent = indent or ""
        local keys = {}

        for k in pairs(tbl) do table.insert(keys, k) end
        table.sort(keys, function(a,b) return tostring(a) < tostring(b) end)

        for _,key in ipairs(keys) do
            local value = tbl[key]

            if type(value) == "table" then
                table.insert(lines, indent..tostring(key).." = {")
                Serialize(value, indent.."    ")
                table.insert(lines, indent.."}")
            else
                table.insert(lines, indent..tostring(key).." = "..tostring(value))
            end
        end
    end

    Serialize(info)

    local text = table.concat(lines,"\n")

    if DVD.ShowCopyBox then
        DVD.ShowCopyBox("Catalog Dump "..decorID, text)
    else
        print(text)
    end
end

SLASH_DVPROFMISSING1 = "/dvprofessionmissing"

SlashCmdList["DVPROFMISSING"] = function()
    if not DVD or not DVD.LoadCatalogRecords then
        print("|cffff4040DV Prof Missing:|r Catalog loader missing.")
        return
    end

    DVD.LoadCatalogRecords(function(success)
        if not success then
            print("|cffff4040DV Prof Missing:|r Catalog failed to load.")
            return
        end

        local lines = {}
        local count = 0

        table.insert(lines, "-- ============================================================")
        table.insert(lines, "-- DecorVendorData Missing Profession Decor")
        table.insert(lines, "-- Generated with /dvprofessionmissing")
        table.insert(lines, "-- ============================================================")
        table.insert(lines, "")

        for _, record in ipairs(DVD.catalogRecords or {}) do
            local itemID = record.itemID
            local sourceText = tostring(record.sourceText or "")

            if itemID and sourceText:find("Profession:", 1, true) and not (DVD.ActiveItems and DVD.ActiveItems[itemID]) then
                count = count + 1

                local profession = sourceText:match("Profession:%s*(.-)%s*%(") or sourceText:gsub("^Profession:%s*", "") or "Profession"

                table.insert(lines, string.format(
                    '[%d] = { decorID = %d, model3D = %d, noxp = true, source = "profession", profession = %q }, -- %s',
                    itemID,
                    tonumber(record.decorID or record.recordID) or 0,
                    tonumber(record.model3D or record.asset) or 0,
                    tostring(profession),
                    tostring(record.name or "Unknown Decor")
                ))
            end
        end

        table.insert(lines, "")
        table.insert(lines, "-- Total missing profession decor: " .. tostring(count))

        if DVD.ShowCopyBox then
            DVD.ShowCopyBox("|cffffd100Missing Profession Decor|r", table.concat(lines, "\n"))
        end
    end)
end

-- ============================================================
-- Profession Book Housing Decor Export
-- ============================================================

SLASH_DVPROFBOOK1 = "/dvprofbook"

SlashCmdList["DVPROFBOOK"] = function()
    if not DVD or not DVD.LoadCatalogRecords then
        print("|cffff4040DV Prof Book:|r DecorVendorData catalog loader missing.")
        return
    end

    if not C_TradeSkillUI or not C_TradeSkillUI.GetAllRecipeIDs then
        print("|cffff4040DV Prof Book:|r Open a profession book first.")
        return
    end

    local function CleanName(text)
        text = tostring(text or "")
        text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " ")
        return text
    end

    local function NormalizeName(text)
        text = CleanName(text):lower()
        text = text:gsub("^recipe:%s*", ""):gsub("^pattern:%s*", ""):gsub("^plans:%s*", ""):gsub("^formula:%s*", ""):gsub("^schematic:%s*", ""):gsub("^design:%s*", ""):gsub("^technique:%s*", ""):gsub("%.$", "")
        return text
    end

    local function GetOutputItemID(recipeID)
        if C_TradeSkillUI.GetRecipeOutputItemData then
            local ok, output = pcall(C_TradeSkillUI.GetRecipeOutputItemData, recipeID)
            if ok and output then
                if output.itemID then return output.itemID end
                if output.hyperlink then return tonumber(output.hyperlink:match("item:(%d+)")) end
            end
        end

        if C_TradeSkillUI.GetRecipeSchematic then
            local ok, schematic = pcall(C_TradeSkillUI.GetRecipeSchematic, recipeID, false)
            if ok and schematic then
                if schematic.outputItemID then return schematic.outputItemID end
                if schematic.outputItemHyperlink then return tonumber(schematic.outputItemHyperlink:match("item:(%d+)")) end
            end
        end
        return nil
    end

    local function GetRecipeReagents(recipeID)
        local reagents = {}
        local reagentIDs = {}

        if C_TradeSkillUI.GetRecipeSchematic then
            local ok, schematic = pcall(C_TradeSkillUI.GetRecipeSchematic, recipeID, false)
            if ok and schematic and schematic.reagentSlotSchematics then
                for _, slot in ipairs(schematic.reagentSlotSchematics) do
                    local quantity = slot.quantityRequired or slot.requiredQuantity or slot.reagentsRequired or slot.quantity or 0
                    if slot.reagents then
                        for _, reagent in ipairs(slot.reagents) do
                            local reagentID = reagent.itemID or reagent.itemId
                            local amount = reagent.quantity or reagent.quantityRequired or reagent.requiredQuantity or quantity or 0
                            if reagentID and amount and amount > 0 then
                                table.insert(reagents, string.format("{id = %d, amount = %d}", reagentID, amount))
                                reagentIDs[reagentID] = true
                                break
                            end
                        end
                    end
                end
            end
        end

        if #reagents == 0 and C_TradeSkillUI.GetRecipeReagentInfo then
            for i = 1, 30 do
                local ok, reagent = pcall(C_TradeSkillUI.GetRecipeReagentInfo, recipeID, i)
                if ok and reagent then
                    local reagentID = reagent.itemID or reagent.itemId
                    local amount = reagent.numRequired or reagent.quantityRequired or reagent.requiredQuantity or reagent.quantity
                    if reagentID and amount and amount > 0 then
                        table.insert(reagents, string.format("{id = %d, amount = %d}", reagentID, amount))
                        reagentIDs[reagentID] = true
                    end
                end
            end
        end
        return reagents, reagentIDs
    end

    local function HasLumberReagent(reagentIDs)
        for reagentID in pairs(reagentIDs or {}) do
            local name = C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(reagentID)
            name = string.lower(tostring(name or ""))
            if name:find("lumber", 1, true) then return true end
        end
        return false
    end

    local function GetProfessionInfoText(info, record)
        local sourceText = record and tostring(record.sourceText or "") or ""
        local skill = sourceText:match("Profession:%s*(.-)%s*%(") or (info and info.parentProfessionName) or (info and info.professionName) or "Profession"
        local skillNeeded = tonumber(sourceText:match("%((%d+)%)")) or (info and tonumber(info.requiredSkillRank)) or (info and tonumber(info.skillLineCurrentLevelRequirement)) or (info and tonumber(info.skillLevel)) or 0
        return skill, skillNeeded
    end

    local function GetExpansionFromSkill(skill)
        skill = tostring(skill or "")
        local expansion = skill:gsub("%s+Alchemy$", ""):gsub("%s+Blacksmithing$", ""):gsub("%s+Cooking$", ""):gsub("%s+Enchanting$", ""):gsub("%s+Engineering$", ""):gsub("%s+Inscription$", ""):gsub("%s+Jewelcrafting$", ""):gsub("%s+Leatherworking$", ""):gsub("%s+Tailoring$", "")
        if expansion == skill or expansion == "" then return "Unknown" end
        return expansion
    end

    local function GetCategoryFromSkill(skill)
        skill = tostring(skill or "")
        local professions = { "Alchemy", "Blacksmithing", "Cooking", "Enchanting", "Engineering", "Inscription", "Jewelcrafting", "Leatherworking", "Tailoring" }
        for _, profession in ipairs(professions) do
            if skill:find(profession, 1, true) then return profession end
        end
        return skill
    end

    local function FindCatalogRecordByName(recipeName)
        local wanted = NormalizeName(recipeName)
        if wanted == "" then return nil end

        for _, record in ipairs(DVD.catalogRecords or {}) do
            if NormalizeName(record.name) == wanted then return record end
        end
        return nil
    end

    local function BuildExportLine(itemID, category, expansion, model3D, recipeID, skill, skillNeeded, reagents, name, missingCatalog)
        local missingText = missingCatalog and ", missingCatalog = true" or ""
        return string.format(
            '{ id = %d, category = %q, expansion = %q, model3D = %d, spell = %d, skill = %q, skillNeeded = %d%s, reagents = {%s} }, -- %s',
            tonumber(itemID) or 0,
            tostring(category or "Profession"),
            tostring(expansion or "Unknown"),
            tonumber(model3D) or 0,
            tonumber(recipeID) or 0,
            tostring(skill or "Profession"),
            tonumber(skillNeeded) or 0,
            missingText,
            table.concat(reagents or {}, ", "),
            tostring(name or "Unknown Decor")
        )
    end

    DVD.LoadCatalogRecords(function(success)
        if not success then
            print("|cffff4040DV Prof Book:|r Housing catalog failed to load.")
            return
        end

        local lines = {}
        local skipped = {}
        local confirmedCount = 0
        local lumberCount = 0
        local recipeIDs = C_TradeSkillUI.GetAllRecipeIDs() or {}

        table.insert(lines, "-- ============================================================")
        table.insert(lines, "-- DecorVendorData Profession Book Housing Export")
        table.insert(lines, "-- Generated with /dvprofbook")
        table.insert(lines, "-- ============================================================")
        table.insert(lines, "")

        for _, recipeID in ipairs(recipeIDs) do
            local info = C_TradeSkillUI.GetRecipeInfo(recipeID)
            local recipeName = info and info.name or ""
            local itemID = GetOutputItemID(recipeID)
            local reagents, reagentIDs = GetRecipeReagents(recipeID)

            local record = itemID and DVD.catalogByItemID and DVD.catalogByItemID[itemID]

            if not record and recipeName ~= "" then
                record = FindCatalogRecordByName(recipeName)
                if record then itemID = record.itemID end
            end

            if record and itemID then
                confirmedCount = confirmedCount + 1
                local skill, skillNeeded = GetProfessionInfoText(info, record)
                local expansion = GetExpansionFromSkill(skill)
                local category = GetCategoryFromSkill(skill)

                table.insert(lines, BuildExportLine(itemID, category, expansion, tonumber(record.model3D or record.asset) or 0, recipeID, skill, skillNeeded, reagents, record.name or recipeName, false))
            elseif itemID and HasLumberReagent(reagentIDs) then
                lumberCount = lumberCount + 1
                local skill = (info and (info.parentProfessionName or info.professionName)) or "Profession"
                local skillNeeded = (info and tonumber(info.requiredSkillRank)) or (info and tonumber(info.skillLineCurrentLevelRequirement)) or (info and tonumber(info.skillLevel)) or 0
                local expansion = GetExpansionFromSkill(skill)
                local category = GetCategoryFromSkill(skill)

                table.insert(lines, BuildExportLine(itemID, category, expansion, 0, recipeID, skill, skillNeeded, reagents, recipeName, true))
            elseif info and info.name then
                table.insert(skipped, tostring(recipeID) .. " - " .. tostring(info.name))
            end
        end

        table.insert(lines, "")
        table.insert(lines, "-- Confirmed housing decor recipes exported: " .. tostring(confirmedCount))
        table.insert(lines, "-- Missing-catalog lumber recipes exported: " .. tostring(lumberCount))
        table.insert(lines, "-- Total exported: " .. tostring(confirmedCount + lumberCount))
        table.insert(lines, "-- Skipped recipes: " .. tostring(#skipped))

        if #skipped > 0 then
            table.insert(lines, "\n-- Skipped:")
            for _, skippedLine in ipairs(skipped) do table.insert(lines, "-- " .. skippedLine) end
        end

        if DVD.ShowCopyBox then
            DVD.ShowCopyBox("|cffffd100Profession Book Housing Export|r", table.concat(lines, "\n"))
        else
            print(table.concat(lines, "\n"))
        end
    end)
end

-- ============================================================
-- Recipe Inspector
-- ============================================================

local function CleanValue(value)
    if type(value) == "string" then
        value = value:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("\r", " "):gsub("\n", " ")
    end
    return value
end

local function SerializeValue(value, indent, seen)
    indent, seen = indent or "", seen or {}
    value = CleanValue(value)
    if type(value) ~= "table" then return tostring(value) end
    if seen[value] then return "<cycle>" end
    seen[value] = true

    local parts, keys = {}, {}
    for k in pairs(value) do table.insert(keys, k) end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)

    table.insert(parts, "{")
    for _, k in ipairs(keys) do
        table.insert(parts, indent .. "    " .. tostring(k) .. " = " .. SerializeValue(value[k], indent .. "    ", seen))
    end
    table.insert(parts, indent .. "}")
    return table.concat(parts, "\n")
end

SLASH_DVRECIPEINSPECT1 = "/dvrecipe"

SlashCmdList["DVRECIPEINSPECT"] = function(msg)
    local recipeID = tonumber(msg)

    if not recipeID then
        print("|cffff4040DV Recipe:|r Usage: /dvrecipe <recipeID>")
        return
    end

    if not C_TradeSkillUI then
        print("|cffff4040DV Recipe:|r TradeSkill API missing.")
        return
    end

    local lines = {}
    local function DumpBlock(title, value)
        table.insert(lines, "\n-- " .. title .. "\n" .. string.rep("-", 50))
        table.insert(lines, value == nil and "nil" or SerializeValue(value))
    end

    table.insert(lines, "-- ============================================================\n-- DecorVendorData Recipe Inspector\n-- Recipe ID: " .. tostring(recipeID) .. "\n-- ============================================================")

    local info, output, schematic, description
    if C_TradeSkillUI.GetRecipeInfo then
        local ok, result = pcall(C_TradeSkillUI.GetRecipeInfo, recipeID)
        info = ok and result or nil
        DumpBlock("C_TradeSkillUI.GetRecipeInfo", info)
    end

    if C_TradeSkillUI.GetRecipeOutputItemData then
        local ok, result = pcall(C_TradeSkillUI.GetRecipeOutputItemData, recipeID)
        output = ok and result or nil
        DumpBlock("C_TradeSkillUI.GetRecipeOutputItemData", output)
    end

    if C_TradeSkillUI.GetRecipeSchematic then
        local ok, result = pcall(C_TradeSkillUI.GetRecipeSchematic, recipeID, false)
        schematic = ok and result or nil
        DumpBlock("C_TradeSkillUI.GetRecipeSchematic", schematic)
    end

    if C_TradeSkillUI.GetRecipeDescription then
        local ok, result = pcall(C_TradeSkillUI.GetRecipeDescription, recipeID)
        description = ok and result or nil
        DumpBlock("C_TradeSkillUI.GetRecipeDescription", description)
    end

    local outputItemID = output and (output.itemID or (output.hyperlink and tonumber(output.hyperlink:match("item:(%d+)")))) or schematic and (schematic.outputItemID or (schematic.outputItemHyperlink and tonumber(schematic.outputItemHyperlink:match("item:(%d+)"))))
    DumpBlock("Resolved Output ItemID", outputItemID)

    if outputItemID and C_Item then
        if C_Item.RequestLoadItemDataByID then C_Item.RequestLoadItemDataByID(outputItemID) end
        DumpBlock("Output Item Name", C_Item.GetItemNameByID and C_Item.GetItemNameByID(outputItemID))
        if C_Item.GetItemInfo then DumpBlock("C_Item.GetItemInfo(outputItemID)", { C_Item.GetItemInfo(outputItemID) }) end
    end

    if DVD and DVD.LoadCatalogRecords then
        DVD.LoadCatalogRecords(function(success)
            DumpBlock("Housing Catalog Match", (success and outputItemID and DVD.catalogByItemID and DVD.catalogByItemID[outputItemID]) or "none")
            if DVD.ShowCopyBox then DVD.ShowCopyBox("Recipe Inspector " .. recipeID, table.concat(lines, "\n")) end
        end)
    else
        if DVD and DVD.ShowCopyBox then DVD.ShowCopyBox("Recipe Inspector " .. recipeID, table.concat(lines, "\n")) end
    end
end

-- ============================================================
-- Merchant Recipe Scanner
-- ============================================================

SLASH_DVMERCHANTRECIPES1 = "/dvmerchantrecipes"

SlashCmdList["DVMERCHANTRECIPES"] = function(msg)
    msg = string.lower(tostring(msg or ""))

    if not MerchantFrame or not MerchantFrame:IsShown() then
        print("|cffff4040DV Merchant Recipes:|r Open a vendor window first.")
        return
    end

    local vendorName = UnitName("target") or "Unknown Vendor"
    local npcID = 0
    local guid = UnitGUID("target")

    if guid then
        local unitType, _, _, _, _, id = strsplit("-", guid)
        if unitType == "Creature" or unitType == "Vehicle" then npcID = tonumber(id) or 0 end
    end

    local function StripText(text)
        text = tostring(text or ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("%[", ""):gsub("%]", ""):gsub("\r", " "):gsub("\n", " "):gsub("%s+", " ")
        return text:gsub("^%s+", ""):gsub("%s+$", "")
    end

    local function GetMerchantCount()
        if C_MerchantFrame and C_MerchantFrame.GetNumMerchantItems then return C_MerchantFrame.GetNumMerchantItems() or 0
        elseif _G.GetNumMerchantItems then return _G.GetNumMerchantItems() or 0 end
        return 0
    end

    local function GetMerchantLink(index)
        if C_MerchantFrame and C_MerchantFrame.GetMerchantItemLink then return C_MerchantFrame.GetMerchantItemLink(index)
        elseif _G.GetMerchantItemLink then return _G.GetMerchantItemLink(index) end
    end

    local function GetMerchantInfo(index)
        if C_MerchantFrame and C_MerchantFrame.GetMerchantItemInfo then return C_MerchantFrame.GetMerchantItemInfo(index)
        elseif _G.GetMerchantItemInfo then
            local name, texture, price, quantity, numAvailable, isUsable, extendedCost = _G.GetMerchantItemInfo(index)
            return { name = name, texture = texture, price = price, quantity = quantity, numAvailable = numAvailable, isUsable = isUsable, extendedCost = extendedCost }
        end
    end

    local function IsRecipeItem(link)
        if not link or not C_Item or not C_Item.GetItemInfoInstant then return false end
        local _, _, _, _, _, classID = C_Item.GetItemInfoInstant(link)
        return classID == Enum.ItemClass.Recipe
    end

    local function TooltipHasHousingHint(link)
        if not link then return false end
        local tooltipText = ""

        if C_TooltipInfo and C_TooltipInfo.GetHyperlink then
            local tooltipData = C_TooltipInfo.GetHyperlink(link)
            if tooltipData and tooltipData.lines then
                for _, line in ipairs(tooltipData.lines) do
                    if line.leftText then tooltipText = tooltipText .. " " .. StripText(line.leftText) end
                    if line.rightText then tooltipText = tooltipText .. " " .. StripText(line.rightText) end
                end
            end
        end

        tooltipText = string.lower(tooltipText)
        if tooltipText:find("housing", 1, true) or tooltipText:find("decor", 1, true) or tooltipText:find("house chest", 1, true) then return true end

        local housingReagents = { "lumber", "timber", "stone block", "stone blocks", "fabric roll", "fabric rolls" }
        for _, reagent in ipairs(housingReagents) do
            if tooltipText:find(reagent, 1, true) then return true end
        end
        return false
    end

    local showAll = msg == "all"
    local lines = {}
    local totalRecipes = 0
    local housingHints = 0

    table.insert(lines, "-- ============================================================\n-- DecorVendorData Merchant Recipe Export\n-- Vendor: " .. tostring(vendorName) .. "\n-- NPC ID: " .. tostring(npcID) .. "\n-- ============================================================\n")

    local total = GetMerchantCount()

    for slot = 1, total do
        local info = GetMerchantInfo(slot)
        local link = GetMerchantLink(slot)

        if link and IsRecipeItem(link) then
            local itemID = tonumber(link:match("item:(%d+)"))
            local name = StripText((info and info.name) or link:match("%[(.-)%]") or "Unknown Recipe")
            local hasHousingHint = TooltipHasHousingHint(link)

            if itemID and (showAll or hasHousingHint) then
                totalRecipes = totalRecipes + 1
                if hasHousingHint then housingHints = housingHints + 1 end

                local price = info and tonumber(price) or 0
                local priceText = (price and price > 0) and string.format(", price = %d", price) or ""

                table.insert(lines, string.format('[%d] = { recipeItemID = %d, soldBy = {%d}, source = "profession"%s }, -- %s / %s%s', itemID, itemID, npcID, priceText, name, tostring(vendorName), hasHousingHint and " / HOUSING HINT" or ""))
            end
        end
    end

    table.insert(lines, "\n-- Total exported recipes: " .. tostring(totalRecipes) .. "\n-- Housing/decor tooltip hints: " .. tostring(housingHints))

    if DVD and DVD.ShowCopyBox then
        DVD.ShowCopyBox("|cffffd100Merchant Recipes|r", table.concat(lines, "\n"))
    else
        print(table.concat(lines, "\n"))
    end
end

-----------------------------------------------------------------
-- 🔍 DECOR VENDOR: COMPACT VENDOR-SCOPED DATABASE SCRAPER
-- Formats comments inside the 'do' line block natively.
-- Usage in-game: /dvscanxp
-----------------------------------------------------------------

SLASH_DVSCANXP1 = "/dvscanxp"
SlashCmdList["DVSCANXP"] = function()
    if not DVD or not DVD.ShowCopyBox then
        print("|cffff4040[DV Debug]:|r Master utility window 'DVD.ShowCopyBox' is missing or not loaded.")
        return
    end

    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        print("|cffff4040[DV Debug]:|r C_HousingCatalog.GetCatalogEntryInfoByRecordID is not available.")
        return
    end

    print("|cffffd100[DV Debug]: Scraping and structuring scoped vendor layout...|r")
    
    local npcNamesMap = {}
    if DVD.npcs then
        for npcID, npcData in pairs(DVD.npcs) do
            if type(npcData) == "table" and npcData.title then
                npcNamesMap[tonumber(npcID)] = npcData.title
            end
        end
    end

    local existingAddonDataMap = {}
    if DVD.ActiveItems then
        for itemID, data in pairs(DVD.ActiveItems) do
            if type(data) == "table" and data.decorID then
                local cleanDecorID = tonumber(data.decorID)
                if cleanDecorID then
                    existingAddonDataMap[cleanDecorID] = {
                        soldBy = data.soldBy,
                        source = data.source or "vendor",
                        expansion = data.expansion or ""
                    }
                end
            end
        end
    end
    
    local lines = {}
    local vendorGroups = {}
    local unmappedGroup = {}
    local totalScanned = 0

    table.insert(lines, "-- ============================================================\n-- Decor Vendor Master Production Database File\n-- Automatically compiled from live client arrays\n-- Structured compactly with inline-scoped 'do' blocks\n-- ============================================================\n\nlocal addonName, DVD = ...\nDVD.ActiveItems = DVD.ActiveItems or {}\n")

    local DECOR_ENTRY_TYPE = 1 

    for recordID = 1, 35000 do
        local success, entryInfo = pcall(C_HousingCatalog.GetCatalogEntryInfoByRecordID, DECOR_ENTRY_TYPE, recordID)
        
        if success and entryInfo and entryInfo.recordID then
            totalScanned = totalScanned + 1
            
            local cleanDecorID = tonumber(entryInfo.recordID)
            local itemID = tonumber(entryInfo.itemID) or 0
            local name = entryInfo.name or "Unknown Decor Item"
            local xpAmount = entryInfo.firstAcquisitionBonus or 0
            local finalModel3D = tonumber(entryInfo.asset) or tonumber(entryInfo.uiModelSceneID) or 0
            
            local customProperties = existingAddonDataMap[cleanDecorID]
            local finalSource = customProperties and customProperties.source or "vendor"
            local finalExpansion = customProperties and customProperties.expansion or ""
            
            local expansionField = (finalExpansion ~= "") and string.format(", expansion = %q", finalExpansion) or ""
            local noxpField = (xpAmount == 0) and ", noxp = true" or ""

            local hasKnownVendor = false
            if customProperties and type(customProperties.soldBy) == "table" and #customProperties.soldBy > 0 then
                for _, npcID in ipairs(customProperties.soldBy) do
                    local cleanNPC = tonumber(npcID)
                    if cleanNPC and cleanNPC > 0 then
                        hasKnownVendor = true
                        vendorGroups[cleanNPC] = vendorGroups[cleanNPC] or {}
                        
                        local soldByText = table.concat(customProperties.soldBy, ", ")
                        local formattedLine = string.format(
                            "    DVD.ActiveItems[%d] = { decorID = %d, model3D = %d, soldBy = {%s}, source = %q%s%s } -- %s",
                            itemID, cleanDecorID, finalModel3D, soldByText, finalSource, expansionField, noxpField, name
                        )
                        table.insert(vendorGroups[cleanNPC], formattedLine)
                        break
                    end
                end
            end

            if not hasKnownVendor then
                local formattedLine = string.format(
                    "    DVD.ActiveItems[%d] = { decorID = %d, model3D = %d, soldBy = {0}, source = %q%s%s } -- %s",
                    itemID, cleanDecorID, finalModel3D, finalSource, expansionField, noxpField, name
                )
                table.insert(unmappedGroup, formattedLine)
            end
        end
    end

    local sortedNPCs = {}
    for npcID in pairs(vendorGroups) do table.insert(sortedNPCs, npcID) end
    table.sort(sortedNPCs)

    for _, npcID in ipairs(sortedNPCs) do
        local rowLines = vendorGroups[npcID]
        local npcTitleName = npcNamesMap[npcID] or "Unknown Merchant Name"
        
        table.insert(lines, string.format("do -- 🏪 VENDOR NPC: %d (%s)", npcID, npcTitleName))
        for _, lineText in ipairs(rowLines) do table.insert(lines, lineText) end
        table.insert(lines, "end\n")
    end

    if #unmappedGroup > 0 then
        table.insert(lines, "do -- 📦 UNMAPPED / NEW LOOSE PTR ITEMS")
        for _, lineText in ipairs(unmappedGroup) do table.insert(lines, lineText) end
        table.insert(lines, "end")
    end

    table.insert(lines, "\n-- Total Compiled Items: " .. totalScanned)

    DVD.ShowCopyBox("|cffffd100Scoped Vendor Database|r", table.concat(lines, "\n"))
end