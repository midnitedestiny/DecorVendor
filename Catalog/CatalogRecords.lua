-- ============================================================
-- Decor Vendor Gallery
-- Data/CatalogRecords.lua
-- Builds live housing catalog records from Blizzard APIs
-- ============================================================

local addonName, DVD = ...

-- Compatibility alias:
-- This lets the old Gallery.catalogRecords / Gallery.LoadCatalogRecords
-- function names keep working while the real owner is DecorVendorData.
local Gallery = DVD

Gallery.catalogRecords = Gallery.catalogRecords or {}
Gallery.catalogByDecorID = Gallery.catalogByDecorID or {}
Gallery.catalogByItemID = Gallery.catalogByItemID or {}

Gallery.catalogLoaded = Gallery.catalogLoaded or false
Gallery.catalogLoading = Gallery.catalogLoading or false
Gallery.catalogSearcher = Gallery.catalogSearcher or nil

local FALLBACK_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"
local ALL_CATEGORY_ATLAS = "category-icons_all_inactive"

local function IsValidFileID(id)
    return type(id) == "number" and id > 0
end

local function IsValidString(value)
    return type(value) == "string" and value ~= ""
end

local function CalculateTotalOwned(info)
    if type(info) ~= "table" then return 0 end

    return
        (tonumber(info.totalNumPlaced) or 0) +
        (tonumber(info.totalNumStored) or 0) +
        (tonumber(info.remainingRedeemable) or 0)
end

local function IsInfoCollected(info)
    return CalculateTotalOwned(info) > 0
end

local function GetCatalogIcon(info)
    if type(info) ~= "table" then
        return FALLBACK_ICON, "texture", true
    end

    if IsValidFileID(info.iconTexture) or IsValidString(info.iconTexture) then
        return info.iconTexture, "texture", false
    end

    if IsValidString(info.iconAtlas) then
        return info.iconAtlas, "atlas", false
    end

    if C_HousingCatalog then
        if C_HousingCatalog.GetCatalogCategoryInfo and info.categoryIDs then
            for _, categoryID in ipairs(info.categoryIDs) do
                local categoryInfo = C_HousingCatalog.GetCatalogCategoryInfo(categoryID)

                if categoryInfo and IsValidString(categoryInfo.icon) then
                    return categoryInfo.icon, "atlas", true
                end
            end
        end

        if C_HousingCatalog.GetCatalogSubcategoryInfo and info.subcategoryIDs then
            for _, subcategoryID in ipairs(info.subcategoryIDs) do
                local subcategoryInfo = C_HousingCatalog.GetCatalogSubcategoryInfo(subcategoryID)

                if subcategoryInfo and IsValidString(subcategoryInfo.icon) then
                    return subcategoryInfo.icon, "atlas", true
                end
            end
        end
    end

    return ALL_CATEGORY_ATLAS, "atlas", true
end

local function GetCatalogInfoByRecord(entryType, recordID)
    if not C_HousingCatalog or not C_HousingCatalog.GetCatalogEntryInfoByRecordID then
        return nil
    end

    local ok, info = pcall(
        C_HousingCatalog.GetCatalogEntryInfoByRecordID,
        entryType,
        recordID,
        true
    )

    if ok and info then
        return info
    end

    ok, info = pcall(
        C_HousingCatalog.GetCatalogEntryInfoByRecordID,
        entryType,
        recordID
    )

    if ok and info then
        return info
    end

    return nil
end

local function BuildCatalogRecord(entryVariantID, info)
    if not entryVariantID or type(info) ~= "table" then return nil end
    if info.isPrefab then return nil end

    local decorEntryType = Enum.HousingCatalogEntryType and Enum.HousingCatalogEntryType.Decor or 1

    -- Keep this gallery as decor only, not rooms.
    if entryVariantID.entryType and entryVariantID.entryType ~= decorEntryType then
        return nil
    end

    local icon, iconType, isModelOnly = GetCatalogIcon(info)
    local recordID = entryVariantID.recordID

    return {
        catalogRecord = true,

        entryID = entryVariantID,
        entryType = entryVariantID.entryType,
        recordID = recordID,
        decorID = recordID,

        itemID = info.itemID,
        name = info.name or ("Decor " .. tostring(recordID)),

        icon = icon,
        iconType = iconType,
        isModelOnly = isModelOnly,

        model3D = info.asset,
        asset = info.asset,
        uiModelSceneID = info.uiModelSceneID,

        sourceText = info.sourceText or "",

        categoryIDs = info.categoryIDs or {},
        subcategoryIDs = info.subcategoryIDs or {},

        size = info.size or 0,
        isIndoors = info.isAllowedIndoors or false,
        isOutdoors = info.isAllowedOutdoors or false,
        canCustomize = info.canCustomize or false,

        totalOwned = CalculateTotalOwned(info),
        isCollected = IsInfoCollected(info),
        quantity = info.totalNumStored or 0,
        numPlaced = info.totalNumPlaced or 0,
        remainingRedeemable = info.remainingRedeemable or 0,
    }
end

function Gallery.ClearCatalogRecords()
    wipe(Gallery.catalogRecords)
    wipe(Gallery.catalogByDecorID)
    wipe(Gallery.catalogByItemID)

    Gallery.catalogLoaded = false
    Gallery.catalogLoading = false
    Gallery.catalogSearcher = nil
end

local function ShowCatalogTip(text)
    if Gallery.frame and Gallery.frame.bottom and Gallery.frame.bottom.tipText then
        Gallery.frame.bottom.tipText:SetText("|cffffd100Tip:|r " .. tostring(text))
        Gallery.frame.bottom.tipText:Show()
        return
    end

    -- Chat fallback, only once.
    if not Gallery._catalogTipPrinted then
        Gallery._catalogTipPrinted = true
        print("|cffffd100Decor Vendor Gallery:|r " .. tostring(text))
    end
end

function Gallery.ProcessCatalogSearchResults()
    local searcher = Gallery.catalogSearcher
    if not searcher then
        return
    end

    local results = searcher:GetCatalogSearchResults()

if not results or #results == 0 then
    ShowCatalogTip("Housing Catalog data is still loading. The Gallery should fill in shortly.")
    Gallery.catalogLoading = false
    return
end

    wipe(Gallery.catalogRecords)
    wipe(Gallery.catalogByDecorID)
    wipe(Gallery.catalogByItemID)

    local seen = {}
    local count = 0

    for _, entryVariantID in ipairs(results) do
        local recordID = entryVariantID.recordID

        if recordID and not seen[recordID] then
            seen[recordID] = true

            local info = GetCatalogInfoByRecord(entryVariantID.entryType, recordID)
            local record = BuildCatalogRecord(entryVariantID, info)

            if record then
                table.insert(Gallery.catalogRecords, record)

                Gallery.catalogByDecorID[record.decorID] = record

                if record.itemID then
                    Gallery.catalogByItemID[record.itemID] = record
                end

                count = count + 1
            end
        end
    end

    Gallery.catalogLoaded = true
    Gallery.catalogLoading = false

if Gallery.frame and Gallery.frame.bottom and Gallery.frame.bottom.tipText then
    Gallery.frame.bottom.tipText:SetText("|cffffd100Tip:|r First Gallery load may take a moment.")
end
    -- Optional Gallery UI refresh.
    -- DecorVendorData should not require the Gallery addon, but if Gallery is loaded,
    -- refresh it after the shared catalog records update.
    local G = _G.DecorVendorGallery

    if G and G.frame and G.frame:IsShown() then
        if G.BuildItemList then
            G.BuildItemList()
        end

        if G.RefreshGrid then
            G.RefreshGrid()
        end
    end
end

function Gallery.LoadCatalogRecords(callback)
    if Gallery.catalogLoaded then
        if callback then callback(true) end
        return
    end

    if Gallery.catalogLoading then
        if callback then
            C_Timer.After(0.25, function()
                callback(Gallery.catalogLoaded)
            end)
        end
        return
    end

    if not C_HousingCatalog or not C_HousingCatalog.CreateCatalogSearcher then
        print("|cffff4040Decor Vendor Gallery:|r Housing catalog API is not ready.")
        if callback then callback(false) end
        return
    end

    local searcher = C_HousingCatalog.CreateCatalogSearcher()

    if not searcher then
        print("|cffff4040Decor Vendor Gallery:|r Could not create housing catalog searcher.")
        if callback then callback(false) end
        return
    end

    Gallery.catalogSearcher = searcher
    Gallery.catalogLoading = true

    searcher:SetStoredOnly(false)
    searcher:SetBaseVariantOnly(true)
    searcher:SetCollected(true)
    searcher:SetUncollected(true)
    searcher:SetAutoUpdateOnParamChanges(false)

    -- nil = full catalog context, like Blizzard's catalog/dashboard behavior.
    if searcher.SetEditorModeContext then
        searcher:SetEditorModeContext(nil)
    end

    searcher:SetResultsUpdatedCallback(function()
        Gallery.ProcessCatalogSearchResults()

        if callback then
            callback(Gallery.catalogLoaded)
        end
    end)

    searcher:RunSearch()

    -- Fallback if callback is slow/weird.
    C_Timer.After(5, function()
        if Gallery.catalogLoading then
            Gallery.ProcessCatalogSearchResults()

            if callback then
                callback(Gallery.catalogLoaded)
            end
        end
    end)
end