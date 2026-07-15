-- ============================================================
-- Decor Vendor Gallery
-- GalleryAchievements.lua
-- Achievement data lookups and UI toggles helpers
-- ============================================================

-- 🌟 NATIVE UNIFIED NAMESPACE: Natively maps everything onto DVD
local addonName, DVD = ...

local Gallery = DVD.Gallery or {}
DVD.Gallery = Gallery

Gallery.C = Gallery.C or DVD.C or {}
local C = Gallery.C

Gallery.ActiveItems = DVD.ActiveItems or {}

function Gallery.GetPlayerFactionKey()
    local faction = UnitFactionGroup("player")
    if faction == "Alliance" then return "alliance" end
    if faction == "Horde" then return "horde" end
    return "neutral"
end

function Gallery.GetFactionText(faction)
    faction = type(faction) == "string" and string.lower(faction) or "neutral"

    if faction == "alliance" then
        return "|cff69ccffAlliance|r"
    elseif faction == "horde" then
        return "|cffff4040Horde|r"
    else
        return "|cff80ff80Neutral|r"
    end
end

function Gallery.GetAchievementForItem(item)
    if not item then
        return nil
    end

    local itemData = item.data or {}

    -- If you ever add achievementID directly to ActiveItems later
    if itemData.achievementID then
        return {
            id = itemData.achievementID,
            title = itemData.achievementName or itemData.title
        }
    end

    -- Look through the Gallery source index.
    local indexed = Gallery.sourceIndex and Gallery.sourceIndex[item.itemID]

    if indexed and indexed.details then
        for _, entry in ipairs(indexed.details) do
            if entry.source == "achievement" and type(entry.detail) == "table" then
                local detail = entry.detail

                local achievementID = detail.achievementID or detail.achieveID or detail.id

                if achievementID then
                    local achievementName, completed, earnedBy = Gallery.GetAchievementNameByID(achievementID)

                    return {
                        id = achievementID,
                        name = achievementName,
                        title = detail.title,
                        faction = detail.faction or "neutral",
                        completed = completed,
                        earnedBy = earnedBy,
                    }
                end
            end
        end
    end

    -- Direct fallback: scan DVD.achievements by itemID
    if DVD.achievements then
        local function scan(tbl)
            if type(tbl) ~= "table" then
                return nil
            end

            if tbl.itemID == item.itemID and tbl.id then
                local achievementName, completed, earnedBy = Gallery.GetAchievementNameByID(tbl.id)

                return {
                    id = tbl.id,
                    name = achievementName,
                    title = tbl.title,
                    faction = tbl.faction or "neutral",
                    completed = completed,
                    earnedBy = earnedBy,
                }
            end

            for _, child in pairs(tbl) do
                local found = scan(child)
                if found then
                    return found
                end
            end

            return nil
        end

        return scan(DVD.achievements)
    end

    return nil
end

function Gallery.GetAchievementSourceText(item)
    local achievement = Gallery.GetAchievementForItem and Gallery.GetAchievementForItem(item)
    if not achievement then return nil end

    local achievementName = achievement.name or achievement.achievementName or ("Achievement " .. tostring(achievement.id or "?"))

    local factionIcon, factionText = Gallery.GetFactionIconMarkup(achievement.faction)

    local statusText
    if achievement.completed then
        statusText = "|cff1eff00Earned|r"
    else
        statusText = "|cffff7777Status unavailable / not earned here|r"
    end

    return
        "|cffffd100Earn achievement:|r\n" ..
        factionIcon .. " |cff00aaff" .. achievementName .. "|r\n" ..
        factionText .. "  •  " .. statusText
end

function Gallery.GetAchievementNameByID(achievementID)
    if not achievementID then
        return nil, false, nil
    end

    local achievementName
    local completed = false
    local earnedBy

    -- Newer C_AchievementInfo path, if available
    if C_AchievementInfo and C_AchievementInfo.GetAchievementInfo then
        local ok, info = pcall(C_AchievementInfo.GetAchievementInfo, achievementID)

        if ok and type(info) == "table" then
            achievementName = info.name or achievementName

            if info.completed or info.wasEarnedByMe then
                completed = true
            end

            if info.earnedBy and info.earnedBy ~= "" then
                completed = true
                earnedBy = info.earnedBy
            end
        end
    end

    -- Legacy achievement API fallback
    if GetAchievementInfo then
        local _, name, _, isCompleted, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedByName = GetAchievementInfo(achievementID)

        achievementName = achievementName or name

        if isCompleted or wasEarnedByMe then
            completed = true
        end

        if earnedByName and earnedByName ~= "" then
            completed = true
            earnedBy = earnedBy or earnedByName
        end
    end

    return achievementName or ("Achievement " .. tostring(achievementID)), completed, earnedBy
end

function Gallery.OpenAchievementByID(achievementID)
    if not achievementID then return end

    if AchievementFrame_LoadUI then
        AchievementFrame_LoadUI()
    elseif C_AddOns and C_AddOns.LoadAddOn then
        pcall(C_AddOns.LoadAddOn, "Blizzard_AchievementUI")
    end

    if OpenAchievementFrameToAchievement then
        OpenAchievementFrameToAchievement(achievementID)
        return
    end

    if AchievementFrame_ToggleAchievementFrame then
        AchievementFrame_ToggleAchievementFrame()
    elseif ToggleAchievementFrame then
        ToggleAchievementFrame()
    end

    if AchievementFrame_SelectAchievement then
        AchievementFrame_SelectAchievement(achievementID)
    elseif AchievementFrame and AchievementFrame.SelectAchievement then
        AchievementFrame:SelectAchievement(achievementID)
    end
end

function Gallery.GetFactionIconMarkup(faction)
    faction = type(faction) == "string" and string.lower(faction) or "neutral"

    local texture = "Interface\\AddOns\\DecorVendorGallery\\Assets\\neutral"
    local text = "|cff80ff80Neutral|r"

    if faction == "alliance" then
        texture = "Interface\\AddOns\\DecorVendorGallery\\Assets\\alliance"
        text = "|cff69ccffAlliance|r"
    elseif faction == "horde" then
        texture = "Interface\\AddOns\\DecorVendorGallery\\Assets\\horde"
        text = "|cffff4040Horde|r"
    end

    return "|T" .. texture .. ":14:14:0:0|t", text
end

function Gallery.UpdateAchievementButton(item)
    local frame = Gallery.frame
    local preview = frame and frame.preview
    if not preview or not preview.achievementButton then return end

    local achievement = Gallery.GetAchievementForItem and Gallery.GetAchievementForItem(item)

    if achievement and achievement.id then
        preview.achievementButton:Show()
        preview.achievementButton:Enable()
        preview.achievementButton:SetText("Open Achievement")

        preview.achievementButton:SetScript("OnClick", function()
            if AchievementFrame_LoadUI then
                AchievementFrame_LoadUI()
            end

            if AchievementFrame_ToggleAchievementFrame then
                AchievementFrame_ToggleAchievementFrame()
            end

            if AchievementFrame_SelectAchievement then
                AchievementFrame_SelectAchievement(achievement.id)
            end
        end)
    else
        preview.achievementButton:Hide()
    end
end