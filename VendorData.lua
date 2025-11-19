-- VendorData.lua



-- Main VendorData.lua: merge all separate vendor tables

local VendorData = {}

-- Merge expansions from separate files
if _G.ClassicVendors then
    for _, t in ipairs(_G.ClassicVendors) do
        table.insert(VendorData, t)
    end
end

if _G.BattleVendors then
    for _, t in ipairs(_G.BattleVendors) do
        table.insert(VendorData, t)
    end
end

if _G.BurningCrusadeVendors then
    for _, t in ipairs(_G.BurningCrusadeVendors) do
        table.insert(VendorData, t)
    end
end

if _G.CataclysmVendors then
    for _, t in ipairs(_G.CataclysmVendors) do
        table.insert(VendorData, t)
    end
end

if _G.DragonVendors then
    for _, t in ipairs(_G.DragonVendors) do
        table.insert(VendorData, t)
    end
end

if _G.DungeonVendors then
    for _, t in ipairs(_G.DungeonVendors) do
        table.insert(VendorData, t)
    end
end

if _G.LegionVendors then
    for _, t in ipairs(_G.LegionVendors) do
        table.insert(VendorData, t)
    end
end

if _G.MidnightVendors then
    for _, t in ipairs(_G.MidnightVendors) do
        table.insert(VendorData, t)
    end
end

if _G.MOPVendors then
    for _, t in ipairs(_G.MOPVendors) do
        table.insert(VendorData, t)
    end
end

if _G.RaidVendors then
    for _, t in ipairs(_G.RaidVendors) do
        table.insert(VendorData, t)
    end
end

if _G.ShadowlandsVendors then
    for _, t in ipairs(_G.ShadowlandsVendors) do
        table.insert(VendorData, t)
    end
end

if _G.WarlordsVendors then
    for _, t in ipairs(_G.WarlordsVendors) do
        table.insert(VendorData, t)
    end
end

if _G.WarVendors then
    for _, t in ipairs(_G.WarVendors) do
        table.insert(VendorData, t)
    end
end

if _G.WrathoftheLichKingVendors then
    for _, t in ipairs(_G.WrathoftheLichKingVendors) do
        table.insert(VendorData, t)
    end
end

-- Make merged table global for your addon
_G.VendorData = VendorData


