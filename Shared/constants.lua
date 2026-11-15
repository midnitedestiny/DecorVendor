-- ============================================================
-- Decor Vendor: Constants.lua
-- Consolidated file. Each section below is one original file,
-- preserved verbatim and wrapped in its own function scope:
-- (function(...) ... end)(...). That gives the section exactly
-- the behavior it had as a separate file - its local variables
-- stay private, and a top-level return or guard clause exits
-- only that section. Sections run in the original .toc order.
-- ============================================================

-- ------------------------------------------------------------
-- SECTION: Shared/Fonts.lua
-- ------------------------------------------------------------
(function(...)
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
end)(...);

-- ------------------------------------------------------------
-- SECTION: Shared/constants.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon — Unified Constants Registry
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

Merged from the old three-file setup:
• DecorVendor/constants.lua
• DecorVendorData/SharedConstants.lua
• DecorVendorGallery/Constants.lua

This file is now the single shared constants source for the unified
DecorVendor addon namespace: DVD.
============================================================
]]

-------------------------------------------------
-- Unified Constants Namespace
-------------------------------------------------
local addonName, DVD = ...
local C = DVD.CONSTANTS or DVD.C or {}

DVD.CONSTANTS = C
DVD.C = C

-- Temporary compatibility alias.
DVD.Constants = C
-------------------------------------------------
-- Temporary Shared Compatibility
-------------------------------------------------
DVD.Shared = DVD.Shared or {}
local Shared = DVD.Shared
-------------------------------------------------
-- Gallery Constants Bridge
-------------------------------------------------

DVD.Gallery = DVD.Gallery or {}
local Gallery = DVD.Gallery

Gallery.C = C

-- Temporary compatibility aliases.
Gallery.Constants = C
Gallery.Shared = Shared

C.ADDON_PREFIX = C.ADDON_PREFIX or "|cff00ccff[Decor Vendor]|r "
C.VERSION_TEXT = C.VERSION_TEXT or "Current Version %s"
C.VERSION = C.VERSION or "2.29"
------------------------------------------------
-- Command Configuration
-------------------------------------------------
C.MAIN_FRAME_NAME = C.MAIN_FRAME_NAME or "DV_MainFrame"

C.SLASH_COMMANDS = C.SLASH_COMMANDS or {
    "/decor",
    "/dv",
    "/decorvendor",
}
-------------------------------------------------
-- Client Availability
-- Hide only unreleased/hidden items
-------------------------------------------------
function DVD.IsDataAvailableForClient(data)
    if type(data) ~= "table" then
        return true
    end

    local source =
        data.source
        or data.sourceType

    if type(source) == "string" then
        local sourceKey =
            string.lower(source)

        sourceKey =
            sourceKey:gsub(
                "[-_%s]+",
                ""
            )

        source =
            C.SOURCE_ALIASES
            and C.SOURCE_ALIASES[sourceKey]
            or sourceKey
    end

    if data.unreleased == true
    or data.hiddenOnLive == true
    or source == "unreleased" then
        return false
    end

    return true
end

function DVD.IsItemAvailableForClient(itemID)
    if itemID == nil then
        return true
    end

    local activeItems =
        DVD.ActiveItems
        or {}

    local numericItemID =
        tonumber(itemID)

    local data =
        activeItems[itemID]
        or (
            numericItemID
            and activeItems[numericItemID]
        )
        or activeItems[tostring(itemID)]

    return DVD.IsDataAvailableForClient(
        data
    )
end
-------------------------------------------------
-- All Main Frame Sizing
-------------------------------------------------
C.GalleryFrameSizing = C.GalleryFrameSizing or {
    Width = 1100,
    Height = 788,

    CenterOffsetY = 30,
    TitleBarHeight = 32,

    MainButtonWidth = 125,
    MainButtonHeight = 22,

    SearchBoxWidth = 260,
    SearchBoxHeight = 26,

    SidebarWidth = 200,
    DetailPanelWidth = 330,
    ModelViewerHeight = 240,

    BottomBarHeight = 44,
    BottomBorderHeight = 8,
}

C.MainFrameSizing = C.MainFrameSizing or {
    Width = 1320,
    Height = 800,
	HeaderHeight = 62,
    SidebarWidth = 204,
	Footer = 30,
    BottomBarHeight = 30,	
    HomeHintWidth = 760,	
    InfoButtonWidth = 24,
    InfoButtonHeight = 24,
    SettingsButtonWidth = 86,
    SettingsButtonHeight = 22,
    HomeButtonWidth = 70,
    HomeButtonHeight = 22,
    ResetButtonWidth = 110,
    ResetButtonHeight = 24,
    SearchBoxWidth = 260,
    SearchBoxHeight = 22,


} 

C.MainHomePanelSizing = C.MainHomePanelSizing or {
    -- Outer panel
LeftInset = 14,
RightInset = 14,
TopOffset = 8,
BottomOffset = 8,
    CreateFrameLevelOffset = 80,
    ShowFrameLevelOffset = 200,

    -- Header
    HeaderHeight = 58,
    HeaderInset = 10,
    HeaderTextInset = 18,
	HeaderRightReserve = 50,

    -- Cards
    CardWidth = 300,
    CardHeight = 112,
    Columns = 3,
    GapX = 14,
    GapY = 18,
    CardsStartY = -110,
    MinimumStartX = 10,
    CardStripHeight = 3,
    CardTitleLeftInset = 12,
    CardTitleTopInset = 14,

    CountRightInset = 12,
    CountTopInset = 14,

    DescriptionTopGap = 8,
    DescriptionRightInset = 12,

    -- Count refresh
    CountRefreshDelay = 0.25,

    -- Footer
    FooterLine1FontSize = 14,
    FooterLine1BottomOffset = 46,
    FooterLine2FontSize = 12,
    FooterLine2Gap = 4,
    FooterLine3FontSize = 11,
    FooterLine3Gap = 4,
	
    -- NEW: dynamic panel height
    FooterAboveGap = 24,
    FooterBottomPadding = 24,	
}
-------------------------------------------------
-- Bottom Tabs Sizing
-------------------------------------------------
C.BottomTabsSizing = C.BottomTabsSizing or {
    -- Tab bar
    BarInset = 8,

    -- Individual tabs
    DefaultTabWidth = 128,
    TabHeight = 28,
    TabGap = 6,
    StartX = 8,
	
    --StartX = 12,

    -- Bar accent
    BarGlowHorizontalInset = 10,
    BarGlowTopInset = 3,
    BarGlowHeight = 1,

    -- Tab background
    TabBackgroundInset = 2,

    -- Tab accent
    TabAccentHorizontalInset = 6,
    TabAccentTopInset = 3,
    TabAccentHeight = 1,

    -- Icon and text
    IconSize = 16,
    IconLeftInset = 9,

    TextFontSize = 12,
    TextGap = 6,
    TextRightInset = 8,

    -- Per-section preview heights
    PreviewHeights = {
        vendors = 265,
        professions = 265,
        quests = 250,
        achievements = 250,
        bossdrops = 265,
    },

    DefaultPreviewHeight = 245,

    -- Title position after switching sections
    ResetTitleTopOffset = 10,
}
-------------------------------------------------
-- All Popup Sizing
-------------------------------------------------
C.VendorPopupSizing = C.VendorPopupSizing or {
    -- Main popup placement
    HorizontalInset = 10,
    TopOffset = 42,
    BottomInset = 10,

    -- Vendor subtitle
    ZoneRightReserve = 92,
    ZoneHeight = 18,
    ZoneFontSize = 12,
    HiddenTextFontSize = 11,
    HiddenTextGap = 2,

    -- Icon grid area
    ContentTopOffset = 26,
    ContentBottomOffset = 32,

    IconSize = 40,
    IconGap = 8,
    IconContainerExtraHeight = 10,
    IconInset = 2,
    IconBorderEdgeSize = 2,

    IconsPerPage = 15,
    MaxColumns = 6,
    GridRowExtraGap = 8,

    FallbackPopupWidth = 300,
    FallbackContentWidth = 280,

    -- Collected check
    CheckSize = 18,
    CheckOffsetY = -8,

    -- Paging controls
    PagingWidth = 150,
    PagingHeight = 24,
    PagingBottomOffset = 2,

    PagingButtonSize = 22,
    PagingButtonInset = 6,
    PagingTextGap = 3,
    PagingTextFontSize = 11,

    -- Preview title
    PreviewTitleInset = 10,
    PreviewTitleHeight = 22,
    PreviewTitleWaypointGap = 8,

    -- Waypoint button
    WaypointButtonWidth = 76,
    WaypointButtonHeight = 20,
    WaypointButtonInset = 10,
}

C.ReagentsPopupSizing = C.ReagentsPopupSizing or {
    -- Main popup
    HorizontalInset = 10,
    TopOffset = 44,
    DefaultHeight = 150,
    FrameLevelOffset = 8,

    -- Header
    HeaderFontSize = 12,

    -- Recipe row
    RecipeWidth = 210,
    RecipeHeight = 34,
    RecipeTopGap = 8,

    RecipeIconSize = 26,
    RecipeIconLeftInset = 5,

    RecipeTextGap = 6,
    RecipeTextRightInset = 6,
    RecipeTextFontSize = 11,

    RecipeNameMaxCharacters = 28,

    -- Reagent tiles
    TileWidth = 44,
    TileHeight = 54,
    TileGap = 10,
    MaxColumns = 5,

    TileBorderEdgeSize = 2,
    TileIconInset = 2,
    TileIconBottomReserve = 16,

    CountBarHeight = 15,
    CountTextBottomOffset = 1,
    CountTextFontSize = 10,

    -- Dynamic layout
    NoRecipeStartY = -24,
    WithRecipeStartY = -66,
    FallbackWidth = 280,
    BottomPadding = 6,
}
-------------------------------------------------
-- Options Panel Sizing
-------------------------------------------------
C.OptionsPanelSizing = C.OptionsPanelSizing or {
    -- Shared page layout
    PageInset = 16,
    TitleTopOffset = 16,

    -- General settings page
    GeneralStartY = -60,
    RowSpacing = 24,
    HeaderBottomGap = 20,

    ScaleSectionGap = 40,
    ScaleLabelGap = 20,
    ScaleSliderWidth = 400,

    FooterFontSize = 16,
    FooterBottomOffset = 34,
    FooterWidth = 760,

    -- Events page
    EventsStartY = -50,
    EventsInitialGap = 10,
    EventsHeaderGap = 25,

    -- Tips page
    TipsPanelInset = 10,

    TipsTitleLeftInset = 18,
    TipsTitleTopInset = 16,
    TipsSubtitleGap = 6,
    TipsRightInset = 18,
    TipsSubtitleTopInset = 22,

    TipsStartY = -62,
    TipsDividerHeight = 1,
    TipsDividerGap = 10,

    TipsHeaderLeftInset = 18,
    TipsHeaderBottomGap = 6,

    TipsBodyLeftInset = 24,
    TipsBodyRightInset = 18,
    TipsBodySpacing = 3,
    TipsSectionBottomGap = 16,

    -- Support page
    SupportStartY = -50,
    SupportTextWidth = 800,
    SupportDefaultSpacing = 20,

    URLBoxWidth = 260,
    URLBoxHeight = 24,
    URLBoxGap = 6,

    SupportButtonWidth = 180,
    SupportButtonHeight = 26,
    SupportRowGap = 40,

    SupportBoxWidth = 100,
    SupportBoxHeight = 90,
    SupportBoxOffsetX = -120,
    SupportBoxBottomOffset = 40,

    HeartSize = 24,
    HeartGap = 8,
    HeartOffsetY = -2,

    -- About page
    AboutTextWidth = 800,
    AboutDescriptionY = -50,

    AboutArtSize = 280,
    AboutArtY = -270,

    AboutFooterGap = 20,
    AboutFooterWidth = 800,
}
-------------------------------------------------
-- Main List Frame and Builders Sizing
-------------------------------------------------
C.ListFrameSizing = C.ListFrameSizing or {
    -- Outer list panel
    PanelInset = 4,
    PreviewGap = 12,

    -- Inner background
    BackgroundInset = 3,

    -- Decorative accent lines
    AccentHorizontalInset = 8,
    TopAccentInset = 5,
    BottomAccentInset = 5,
    AccentHeight = 1,

    -- Scroll frame
    ScrollInset = 8,
    ScrollWidthPadding = 20,
    FallbackScrollChildWidth = 340,
    MouseWheelStep = 45,

    -- Shared header and tab scroll helpers
    FallbackHeaderWidth = 560,
    HeaderHorizontalPadding = 40,
    TabScrollTopOffset = 26,
    TabScrollRightInset = 20,
    InitialScrollChildSize = 1,
}

C.ListBuildersSizing = C.ListBuildersSizing or {
    -- Initial vertical positions
    DefaultStartY = -6,
    VendorStartY = 0,

    -- Space after an expanded group
    GroupBottomGap = 10,

    -- Empty-list message
    EmptyMessageFontSize = 14,
    EmptyMessageTopOffset = 50,

    -- Scroll-child bottom padding
    StandardBottomPadding = 20,
    ExtendedBottomPadding = 40,

    -- Boss list keeps additional scrollable space
    BossMinimumHeight = 800,
}
-------------------------------------------------
-- Universal Row Widget and Row Sizing
-------------------------------------------------
C.RowWidgetSizing = C.RowWidgetSizing or {
    Header = {
        Height = 24,
        Spacing = 2,

        LeftInset = 6,
        RightInset = 10,

        AccentLeftInset = 2,
        AccentWidth = 2,
        AccentVerticalPadding = 6,
        AccentMinimumHeight = 1,

        CollapseIconFontSize = 12,
        CollapseIconLeftInset = 10,

        ProgressFontSize = 11,
        ProgressRightInset = 8,

        TitleFontSize = 12,
        TitleIconGap = 8,
        TitleProgressGap = 8,
    },

    Card = {
        Height = 44,

        LeftInset = 8,
        RightInset = 12,

        NameWidth = 180,
        NameFontSize = 13,
        SubFontSize = 11,
        RightTopFontSize = 12,
        RightBottomFontSize = 10,

        BackdropEdgeSize = 1,

        IndicatorWidth = 4,

        IconSize = 32,
        IconLeftInset = 12,

        IconCropMinimum = 0.08,
        IconCropMaximum = 0.92,

        IconBorderSize = 36,
        IconBorderFrameLevelOffset = 1,
        IconBorderEdgeSize = 1,
        IconBorderInset = 1,

        NameIconGap = 12,
        NameOffsetY = 4,

        SubTextGap = 2,

        RightTextRightInset = 16,
        RightTextTopInset = 6,
        RightBottomGap = 2,
    },
}

C.AchievementRowsSizing = C.AchievementRowsSizing or {
    -- Universal header override
    HeaderSpacing = 2,

    -- Preview title
    PreviewTitleGap = 6,

    -- Wowhead wrapper
    WowheadWrapperHeight = 28,
    WowheadWrapperGap = 6,

    WowheadIconSize = 18,
    WowheadIconLeftInset = 6,

    WowheadBoxHeight = 22,
    WowheadBoxGap = 6,
    WowheadBoxRightInset = 8,

    -- Universal card overrides
    NameFontSize = 13,
    NameWidth = 185,

    -- Space after each completed row
    RowBottomGap = 5,
}

C.ProfessionRowsSizing = C.ProfessionRowsSizing or {
    -- Universal header override
    HeaderSpacing = 2,

    -- Profession notes panel
    NotesHorizontalInset = 10,
    NotesBottomOffset = 18,
    NotesHeight = 44,

    NotesTextHorizontalInset = 10,
    NotesTextTopInset = 8,
    NotesTextBottomInset = 8,
    NotesTextFontSize = 10,

    -- Universal card overrides
    NameFontSize = 13,
    NameWidth = 180,

    -- Profession-specific status placement
    StatusRightInset = 16,

    -- Space after each row
    RowBottomGap = 5,
}

C.BossDropRowsSizing = C.BossDropRowsSizing or {
    -- Universal header override
    HeaderSpacing = 2,

    -- Boss notes panel
    NotesFrameLevelOffset = 8,

    NotesTextHorizontalInset = 10,
    NotesTextVerticalInset = 10,
    NotesTextFontSize = 11,

    NotesTopGap = 8,

    -- Dynamic note-height calculation
    NotesCharactersPerLine = 36,
    NotesMinimumHeight = 88,
    NotesEstimatedLineHeight = 14,
    NotesVerticalPadding = 24,
    NotesMaximumHeight = 210,

    -- Universal card overrides
    NameFontSize = 11,
    NameWidth = 185,

    -- Space after each row
    RowBottomGap = 5,
}

C.QuestRowsSizing = C.QuestRowsSizing or {
    -- Universal header override
    HeaderSpacing = 2,

    -- Universal card overrides
    NameFontSize = 11,
    NameWidth = 180,

    -- Wowhead wrapper
    WowheadWrapperHeight = 28,
    WowheadWrapperGap = 6,

    WowheadIconSize = 18,
    WowheadIconLeftInset = 6,

    WowheadBoxHeight = 22,
    WowheadBoxGap = 4,
    WowheadBoxRightInset = 8,

    -- Quest notes
    NotesTopGap = 6,

    NotesTextLeftInset = 10,
    NotesTextTopInset = 10,
    NotesTextFontSize = 12,

    NotesAvailableWidthPadding = 20,
    NotesTextWidthPadding = 20,
    NotesHeightPadding = 20,

    -- Space after each row
    RowBottomGap = 5,
}

C.VendorRowsSizing = C.VendorRowsSizing or {
    -- Universal header override
    HeaderSpacing = 0,

    -- Universal card overrides
    NameFontSize = 13,
    NameWidth = 180,

    -- Space after each row
    RowBottomGap = 5,
}
-------------------------------------------------
-- Notes Panel Sizing
-------------------------------------------------
C.NotesPanelSizing = C.NotesPanelSizing or {
    VendorDefaultY = -260,

    HorizontalInset = 10,
    Height = 60,

    TextHorizontalInset = 10,
    TextTopInset = 10,
    TextFontSize = 12,

    -- Dynamic vendor note sizing
    VendorMinimumHeight = 42,
    VendorTextWidthPadding = 20,
    VendorHeightPadding = 20,
}
-------------------------------------------------
-- Gallery Sidebar and Main Sidebar Sizing
-------------------------------------------------
C.GallerySidebarSizing = C.GallerySidebarSizing or {
    -- Sidebar frame
    FrameLeftInset = 1,
    FrameTopOffset = 33,
    FrameBottomInset = 1,

    -- Section headers
    SectionHorizontalInset = 4,
    SectionHeight = 20,

    SectionArrowRightInset = 4,

    SectionDividerHeight = 1,
    SectionDividerBottomOffset = 2,

    SectionAdvance = 26,
    SectionContentGap = 8,

    -- Checkboxes
    CheckboxSize = 20,
    CheckboxLeftInset = 2,
    CheckboxTopAdjustment = 4,

    CheckboxLabelGap = 2,
    CheckboxLabelWidth = 150,

    CheckboxAdvance = 22,

    -- Filter content
    ContentStartY = -4,
    ContentTopInset = 4,
    ContentRightInset = 6,
    ContentBottomReserve = 76,
    ContentWidthPadding = 8,
    ContentBottomPadding = 20,

    -- Sidebar help text
    HelpLeftInset = 16,
    HelpBottomInset = 18,
    HelpWidth = 155,
}

C.MainFiltersSizing = C.MainFiltersSizing or {
    -- Filter content frame
    ContentTopInset = 8,
    ContentRightInset = 6,
    ContentBottomInset = 12,
    ContentWidthPadding = 14,

    ContentStartY = -4,
    ContentBottomPadding = 20,

    -- Section headers
    SectionRightInset = 2,
    SectionHeight = 20,
    SectionFontSize = 12,
    SectionArrowRightInset = 2,

    SectionDividerHeight = 1,
    SectionDividerBottomOffset = 2,

    SectionAdvance = 26,
    CollapsedSectionGap = 4,
    ExpandedSectionGap = 8,

    -- Checkboxes
    CheckboxSize = 20,
    CheckboxTopAdjustment = 4,

    CheckboxLabelGap = 2,
    CheckboxLabelWidthPadding = 42,
    CheckboxLabelFontSize = 11,

    CheckboxAdvance = 18,
}
-------------------------------------------------
-- Gallery Grid Sizing
-------------------------------------------------
C.GalleryGridSizing = C.GalleryGridSizing or {
    -- Scroll viewport
    ScrollLeftGap = 16,
    ScrollTopOffset = 0,
    ScrollRightExtraReserve = 65,
    ScrollBottomGap = 8,

    InitialChildSize = 1,
    FallbackViewportWidth = 500,

    -- Cards
    CardSize = 104,
    CardFrameLevelOffset = 2,

    CardIconInset = 10,
    CardIconCropMinimum = 0.08,
    CardIconCropMaximum = 0.92,

    CollectedBadgeSize = 22,
    CollectedBadgeInset = 6,

    -- Grid layout
    GridPadding = 18,
    CardGap = 24,

    PreferredColumns = 4,
    NarrowColumns = 3,
    MinimumHorizontalGap = 8,

    -- Scroll-child dimensions
    ScrollChildWidthPadding = 26,
    ScrollChildBottomPadding = 60,
}
-------------------------------------------------
-- Gallery Price Formatting
-------------------------------------------------
C.GalleryPriceFormatting = C.GalleryPriceFormatting or {
    InlineIconSize = 14,
    PartSeparator = ", ",
}
-------------------------------------------------
-- Gallery Achievement Display
-------------------------------------------------
C.GalleryAchievementFormatting =
    C.GalleryAchievementFormatting
    or {
        FactionIconSize = 14,
    }
-------------------------------------------------
-- Gallery Utility Styling
-------------------------------------------------
C.GalleryUtilityStyle = C.GalleryUtilityStyle or {
    Backdrop = {
        BackgroundFile = "Interface\\Buttons\\WHITE8x8",
        BorderFile = "Interface\\Tooltips\\UI-Tooltip-Border",

        EdgeSize = 12,

        Insets = {
            left = 2,
            right = 2,
            top = 2,
            bottom = 2,
        },
    },
}	
-------------------------------------------------
-- All Preview Sizing
-------------------------------------------------
C.GalleryPreviewSizing = C.GalleryPreviewSizing or {
    -- Outer panel
    FrameInset = 1,
    TitleBarGap = 1,
    FrameBottomInset = 15,

    -- Model area
    ModelBoxInset = 4,
    ModelSceneInset = 6,
    ModelControlsBottomInset = 8,

    CorbelWidth = 66,
    CorbelHeight = 50,

    -- Watermark
    WatermarkSize = 180,
    WatermarkAlpha = 0.30,

    WatermarkTextFontSize = 14,
    WatermarkTextWidth = 280,

    -- Item name
    NameTopGap = 12,
    DetailTextWidth = 320,
    NameHeight = 38,

    NameFontSize = 15,
    LongNameFontSize = 13,
    LongNameThreshold = 34,

    -- Collection status
    StatusTopGap = 4,
    StatusHeight = 18,

    -- Statistics
    StatsTopGap = 10,
    StatsWidth = 360,
    StatsHeight = 28,
    StatsFontSize = 13,

    -- Source section
    SourceHeaderLeftInset = 28,
    SourceHeaderTopGap = 14,

    SourceLineTopGap = 4,
    SourceLineRightInset = 16,
    SourceLineHeight = 1,

    SourceTextTopGap = 10,
    RequirementTopGap = 12,
    NoteTopGap = 10,

    -- Bottom buttons
    ButtonWidthPadding = 16,

    ActionButtonHeight = 26,
    ActionButtonBottomInset = 18,

    SecondaryButtonHeight = 24,
    ButtonGap = 6,
}

C.PreviewPanelSizing = C.PreviewPanelSizing or {
    -- Outer preview panel
    Width = 330,
    PanelInset = 8,
	--PanelInset = 4,
	
    -- Model box
    ModelBoxInset = 12,
	--ModelBoxInset = 10,
    ModelViewerHeight = 252,
	--ModelViewerHeight = 240,
    ModelSceneInset = 6,

    -- Model controls and decoration
    ModelControlsBottomOffset = 8,

    CorbelWidth = 66,
    CorbelHeight = 50,

    WatermarkSize = 155,
    WatermarkAlpha = 0.26,

    -- Divider
    DividerHeight = 2,
    DividerHorizontalInset = 12,
    DividerTopGap = 8,

    -- Item/details container
    ItemContainerDividerOverlap = 2,
    ItemContainerTopGap = 10,
    ItemContainerOuterInset = 10,

    -- Item title
    TitleFontSize = 15,
    TitleHorizontalInset = 10,
    TitleTopOffset = 12,
}
-------------------------------------------------
-- All Preview Scene
-------------------------------------------------
local DecorDefaultSceneID =
    Enum and Enum.HousingCatalogEntryModelScenePresets and Enum.HousingCatalogEntryModelScenePresets.DecorDefault or 0

C.GALLERY_DEFAULT_DECOR_SCENE_ID = C.GALLERY_DEFAULT_DECOR_SCENE_ID or 859

C.DEFAULT_SCENE_ID = C.DEFAULT_SCENE_ID or Shared.DefaultSceneID or DecorDefaultSceneID

C.MODEL_SCENE_ID = C.MODEL_SCENE_ID or Shared.ModelSceneID or 1317

C.SCENE_PRESETS =
    C.SCENE_PRESETS or
    {
        [0] = DecorDefaultSceneID,
        [65] = Enum and Enum.HousingCatalogEntryModelScenePresets and
            Enum.HousingCatalogEntryModelScenePresets.DecorTiny or
            65,
        [66] = Enum and Enum.HousingCatalogEntryModelScenePresets and
            Enum.HousingCatalogEntryModelScenePresets.DecorSmall or
            66,
        [67] = Enum and Enum.HousingCatalogEntryModelScenePresets and
            Enum.HousingCatalogEntryModelScenePresets.DecorMedium or
            67,
        [68] = Enum and Enum.HousingCatalogEntryModelScenePresets and
            Enum.HousingCatalogEntryModelScenePresets.DecorLarge or
            68,
        [69] = Enum and Enum.HousingCatalogEntryModelScenePresets and
            Enum.HousingCatalogEntryModelScenePresets.DecorHuge or
            69
    }

-- Temporary compatibility aliases.
Shared.DefaultSceneID = C.DEFAULT_SCENE_ID

Shared.ModelSceneID = C.MODEL_SCENE_ID

C.Camera = C.Camera or {
    TRANSITION_IMMEDIATE = CAMERA_TRANSITION_TYPE_IMMEDIATE or 1,
    MODIFICATION_DISCARD = CAMERA_MODIFICATION_TYPE_DISCARD or 1,
	
    MODIFICATION_MAINTAIN = CAMERA_MODIFICATION_TYPE_MAINTAIN or 1,
    ORBIT_MOUSE_NOTHING = ORBIT_CAMERA_MOUSE_MODE_NOTHING or 0,
    ORBIT_MOUSE_YAW = ORBIT_CAMERA_MOUSE_MODE_YAW_ROTATION or 1,
    ORBIT_MOUSE_PITCH = ORBIT_CAMERA_MOUSE_MODE_PITCH_ROTATION or 2,
    ORBIT_MOUSE_ZOOM = ORBIT_CAMERA_MOUSE_MODE_ZOOM or 6,
    ORBIT_MOUSE_PAN_HORIZONTAL = ORBIT_CAMERA_MOUSE_PAN_HORIZONTAL or 7,
    ORBIT_MOUSE_PAN_VERTICAL = ORBIT_CAMERA_MOUSE_PAN_VERTICAL or 8,
    PREVIEW_MIN_ZOOM_SCALE = 0.5,
    ROTATION_SPEED = 0.5,
    ZOOM_STEP = 0.02,
}

end)(...);

-- ------------------------------------------------------------
-- SECTION: Shared/SourceActions.lua
-- ------------------------------------------------------------
(function(...)
--[[
============================================================
Decor Vendor Addon
© 2026 MidniteDestiny. All Rights Reserved.
============================================================

Source actions for maps, coordinates, world-map actions,
Encounter Journal actions, and rotating source locations.
============================================================
]]

local addonName, DVD = ...

local C = DVD.CONSTANTS or DVD.C

-------------------------------------------------
-- Temporary Shared Compatibility
-------------------------------------------------
DVD.Shared = DVD.Shared or {}
local Shared = DVD.Shared

if not C then
    print(
        "|cffff4040Decor Vendor:|r "
        .. "SourceActions.lua could not find the constants table. "
        .. "Check the TOC load order."
    )
    return
end

-------------------------------------------------
--  Source Actions / Map Pins
-------------------------------------------------
C.SOURCE_ACTIONS = C.SOURCE_ACTIONS or {}



C.SOURCE_ACTIONS["Dreamsurge Event"] = C.SOURCE_ACTIONS["Dreamsurge Event"] or {
    type = "map",
    label = "Dreamsurge Event",
    openMapID = 1978, -- Dragon Isles parent map, optional
    locations = {
        { title = "Dreamsurge Event", zone = "The Waking Shores", mapID = 2022, x = 58.4, y = 67.8 },
        { title = "Dreamsurge Event", zone = "Ohn'ahran Plains", mapID = 2023, x = 64.0, y = 41.6 },
        { title = "Dreamsurge Event", zone = "The Azure Span", mapID = 2024, x = 45.6, y = 39.8 },
        { title = "Dreamsurge Event", zone = "Thaldraszus", mapID = 2025, x = 51.2, y = 43.2 },
    },
}

C.SOURCE_ACTIONS["Darkshore Rares"] = C.SOURCE_ACTIONS["Darkshore Rares"] or {
    type = "map",
    label = "Daily Darkshore Rares",
    zone = "Darkshore",
    mapID = 62,
    locations = {
        { title = "Granokk", zone = "Darkshore", mapID = 62, x = 48.2, y = 55.6 },
        { title = "Stonebinder Ssra'vess", zone = "Darkshore", mapID = 62, x = 45.4, y = 58.8 },
        { title = "Shattershard", zone = "Darkshore", mapID = 62, x = 43.4, y = 29.2 },
        { title = "Scalefiend", zone = "Darkshore", mapID = 62, x = 47.4, y = 44.6 },
        { title = "Aman", zone = "Darkshore", mapID = 62, x = 37.4, y = 84.2 },
        { title = "Mrggr'marr", zone = "Darkshore", mapID = 62, x = 35.4, y = 81.4 },
        { title = "Glimmerspine", zone = "Darkshore", mapID = 62, x = 43.4, y = 19.8 },
        { title = "Madfeather", zone = "Darkshore", mapID = 62, x = 44.0, y = 48.4 },
    },
}

C.SOURCE_ACTIONS["Daily Darkshore Rares"] = C.SOURCE_ACTIONS["Daily Darkshore Rares"] or C.SOURCE_ACTIONS["Darkshore Rares"]

C.SOURCE_ACTIONS["Ral'kala"] = C.SOURCE_ACTIONS["Ral'kala"] or {
    type = "map",
    label = "Ral'kala",
    zone = "The Coiled Isle",
    mapID = 2512,
    locations = {
        { title = "Ral'kala", zone = "The Coiled Isle", mapID = 2512, x = 52.9, y = 42.2 },
        { title = "Ral'kala", zone = "The Coiled Isle", mapID = 2512, x = 68.5, y = 45.0 },
        { title = "Ral'kala", zone = "The Coiled Isle", mapID = 2512, x = 29.5, y = 64.9 },
    },
}

C.SOURCE_ACTIONS["Midnight Delves"] = C.SOURCE_ACTIONS["Midnight Delves"] or {
    type = "map",
    label = "Midnight Delves",
    openMapID = 2537,
    locations = {
        { title = "Parhelion Plaza", zone = "Isle of Quel’Danas", mapID = 2424, x = 46.8, y = 40.9 },
        { title = "The Shadow Enclave", zone = "Eversong Woods", mapID = 2395, x = 45.5, y = 86.0 },
        { title = "Atal'Aman", zone = "Eversong Woods", mapID = 2395, x = 63.7, y = 80.1 },
        { title = "Collegiate Calamity", zone = "Silvermoon City", mapID = 2393, x = 40.6, y = 53.7 },
        { title = "The Darkway", zone = "Silvermoon City", mapID = 2393, x = 39.3, y = 31.7 },
        { title = "Twilight Crypts", zone = "Zul'Aman", mapID = 2437, x = 25.4, y = 84.4 },
        { title = "The Gulf of Memory", zone = "Harandar", mapID = 2413, x = 36.7, y = 49.6 },
        { title = "The Grudge Pit", zone = "Harandar", mapID = 2413, x = 70.4, y = 64.8 },
        { title = "Shadowguard Point", zone = "Voidstorm", mapID = 2405, x = 37.1, y = 49.1 },
        { title = "Sunkiller Sanctum", zone = "Voidstorm", mapID = 2405, x = 54.8, y = 47.1 },
    },
}

C.SOURCE_ACTIONS["Labyrinth of Kindo'jan"] = C.SOURCE_ACTIONS["Labyrinth of Kindo'jan"] or {
    type = "map",
    label = "Labyrinth of Kindo'jan",
    openMapID = 2395,
    locations = {
        { title = "Labyrinth of Kindo'jan", zone = "Eversong Woods", mapID = 2395, x = 62.8, y = 72.0 },
    },
}

C.SOURCE_ACTIONS["The Coiled Isle Delves"] = C.SOURCE_ACTIONS["The Coiled Isle Delves"] or {
    type = "map",
    label = "The Coiled Isle Delves",
    openMapID = 2512,
    locations = {
        { title = "Gnarldor", zone = "The Coiled Isle", mapID = 2512, x = 64.6, y = 77.4 },
        { title = "The Ring of Glory", zone = "The Coiled Isle", mapID = 2512, x = 71.30, y = 56.53 },		
    },
}

C.SOURCE_ACTIONS["Withered Army Training"] = C.SOURCE_ACTIONS["Withered Army Training"] or {
    type = "map",
    label = "Withered Army Training",
    zone = "Suramar",
    mapID = 680,
    locations = {
        { title = "Glimmering Treasure Chest", zone = "Suramar", mapID = 680, x = 22.8, y = 36.2 },
    },
}

C.SOURCE_ACTIONS["Stellar Stash"] = C.SOURCE_ACTIONS["Stellar Stash"] or {
    type = "map",
    label = "Stellar Stash",
    zone = "Masters' Perch",
    mapID = 2444,
    locations = {
        { title = "Stellar Stash", zone = "Masters' Perch", mapID = 2444, x = 53.5, y = 32.2 },
    },
}

C.SOURCE_ACTIONS["Malignant Chest"] = C.SOURCE_ACTIONS["Malignant Chest"] or {
    type = "map",
    label = "Malignant Chest",
    zone = "Voidstorm",
    mapID = 2405,
    locations = {
        { title = "Malignant Chest", zone = "Voidstorm", mapID = 2405, x = 53.3, y = 42.7 },
    },
}

C.SOURCE_ACTIONS["Scraps Heaps"] = C.SOURCE_ACTIONS["Scraps Heaps"] or {
    type = "map",
    label = "Scraps Heaps",
    zone = "Undermine",
    mapID = 2346,
	note = "Chance to drop in any of the Scrap Heap Events",
    locations = {
        { title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 31.9, y = 21.4 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 70.0, y = 76.7 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 52.6, y = 83.3 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 50.8, y = 63.6 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 39.0, y = 81.6 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 36.8, y = 45.0 },
		{ title = "Uncovered Strongbox", zone = "Undermine", mapID = 2346, x = 67.5, y = 29.9 },
    },
}

C.SOURCE_ACTIONS["Triple-Locked Safebox"] = C.SOURCE_ACTIONS["Triple-Locked Safebox"] or {
    type = "map",
    label = "Triple-Locked Safebox",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Triple-Locked Safebox", zone = "Eversong Woods", mapID = 2395, x = 38.9, y = 76.1 },
    },
}

C.SOURCE_ACTIONS["Incomplete Book of Sonnets"] = C.SOURCE_ACTIONS["Incomplete Book of Sonnets"] or {
    type = "map",
    label = "Incomplete Book of Sonnets",
    zone = "Silvermoon City",
    mapID = 2393,
    locations = {
        { title = "Incomplete Book of Sonnets", zone = "Silvermoon City", mapID = 2393, x = 37.8, y = 52.5 },
    },
}

C.SOURCE_ACTIONS["Stone Vat"] = C.SOURCE_ACTIONS["Stone Vat"] or {
    type = "map",
    label = "Stone Vat",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Stone Vat", zone = "Eversong Woods", mapID = 2395, x = 40.5, y = 60.8 },
    },
}

C.SOURCE_ACTIONS["Gift of the Phoenix"] = C.SOURCE_ACTIONS["Gift of the Phoenix"] or {
    type = "map",
    label = "Gift of the Phoenix",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Gift of the Phoenix", zone = "Eversong Woods", mapID = 2395, x = 40.9, y = 19.5 },
    },
}

C.SOURCE_ACTIONS["Forgotten Ink and Quill"] = C.SOURCE_ACTIONS["Forgotten Ink and Quill"] or {
    type = "map",
    label = "Forgotten Ink and Quill",
    zone = "Eversong Woods",
    mapID = 2395,
    locations = {
        { title = "Forgotten Ink and Quill", zone = "Eversong Woods", mapID = 2395, x = 43.3, y = 69.5 },
    },
}

C.SOURCE_ACTIONS["Reliquary's Lost Paint Supplies"] = C.SOURCE_ACTIONS["Reliquary's Lost Paint Supplies"] or {
    type = "map",
    label = "Reliquary's Lost Paint Supplies",
    zone = "Harandar",
    mapID = 2413,
    locations = {
        { title = "Reliquary's Lost Paint Supplies", zone = "Harandar", mapID = 2413, x = 62.9, y = 51.3 },
    },
}

C.SOURCE_ACTIONS["Theater Troupe"] = C.SOURCE_ACTIONS["Theater Troupe"] or {
    type = "map",
    label = "Theater Troupe",
    zone = "Khaz Algar",
    mapID = 2248,
    locations = {
        { title = "Distinguished Actor's Chest", zone = "Khaz Algar", mapID = 2248, x = 56.42, y = 51.47 },
    },
}

C.SOURCE_ACTIONS["Highmountain Paragon Chest"] = C.SOURCE_ACTIONS["Highmountain Paragon Chest"] or {
    type = "map",
    label = "Highmountain Paragon Chest",
    zone = "Highmountain",
    mapID = 750,
    locations = {
        { title = "Highmountain Paragon Chest", zone = "Highmountain", mapID = 750, x = 38.06, y = 46.05 },
    },
}

C.SOURCE_ACTIONS["Stormarion Assault"] = C.SOURCE_ACTIONS["Stormarion Assault"] or {
    type = "map",
    label = "Stormarion Assault",
    zone = "Voidstorm",
    mapID = 2405,
    openMapID = 2405,
    locations = {
        { title = "Stormarion Cache", zone = "Voidstorm", mapID = 2405, x = 26.83, y = 67.78 },
    },
}

C.SOURCE_ACTIONS["Mechagon Dailies"] = C.SOURCE_ACTIONS["Mechagon Dailies"] or {
    type = "map",
    label = "Mechagon Dailies",
    zone = "Mechagon Island",
    mapID = 1462,
    --openMapID = 1462,
    locations = {
        { title = "Self-Assembling Homeware Kit", zone = "Mechagon Island", mapID = 1462, x = 56.0, y = 60.0 },
    },
}

C.SOURCE_ACTIONS["Junkwatt Depot Recycling"] = C.SOURCE_ACTIONS["Junkwatt Depot Recycling"] or {
    type = "map",
    label = "Junkwatt Depot Recycling",
    zone = "Mechagon Island",
    mapID = 1462,
    --openMapID = 1462,
    locations = {
		{ title = "Strange Recycling Requisition", zone = "Mechagon Island", mapID = 1462, x = 56.0, y = 60.0 },
    },
}

C.SOURCE_ACTIONS["Cooking Daily"] = C.SOURCE_ACTIONS["Cooking Daily"] or {
    type = "map",
    label = "Cooking Daily",
	
    locations = {
        { title = "Katherine Lee", x = 40.3, y = 66.1 },
        { title = "Awilo Lon'gomba", x = 70.0, y = 38.9 },
    },
}

C.SOURCE_ACTIONS["Frederick the Fabulous"] = C.SOURCE_ACTIONS["Frederick the Fabulous"] or {
    type = "map",
    label = "Frederick the Fabulous",
	zone = "Jade Forest",
	mapID = 371,
    locations = {
        { title = "Frederick the Fabulous", x = 55.7, y = 15.7 },
    },
}

-- Temporary source-action compatibility aliases.
Shared.SOURCE_ACTIONS = C.SOURCE_ACTIONS

Shared.SourceActions = C.SOURCE_ACTIONS

DVD.SOURCE_ACTIONS = C.SOURCE_ACTIONS

DVD.SourceActions = C.SOURCE_ACTIONS

C.RARE_EVENTS = C.RARE_EVENTS or {}

local function BuildRareEventsFromSourceActions()
    for key, action in pairs(C.SOURCE_ACTIONS or {}) do
        if type(action) == "table"
        and type(action.locations) == "table" then
            local rareList = C.RARE_EVENTS[key] or {}

            -- Rebuild this action's locations so aliases stay current.
            wipe(rareList)

            for _, loc in ipairs(action.locations) do
                rareList[#rareList + 1] = {
                    name = loc.name or loc.title,
                    title = loc.title or loc.name,
                    zone = loc.zone or action.zone,
                    mapID = loc.mapID or action.mapID,
                    x = loc.x,
                    y = loc.y,
                }
            end

            C.RARE_EVENTS[key] = rareList
        end
    end
end

BuildRareEventsFromSourceActions()

-- Temporary compatibility aliases.
Shared.RARE_EVENTS = C.RARE_EVENTS

Shared.RareEvents = C.RARE_EVENTS

DVD.rareEvents = C.RARE_EVENTS

DVD.RareEvents = C.RARE_EVENTS
-------------------------------------------------
-- Neighborhood Endeavors
-------------------------------------------------

C.NEIGHBORHOOD_ENDEAVORS = C.NEIGHBORHOOD_ENDEAVORS or {}

function DVD.GetNeighborhoodEndeavorByID(initiativeID)
    initiativeID = tonumber(initiativeID)

    if not initiativeID then
        return nil
    end

    return C.NEIGHBORHOOD_ENDEAVORS[initiativeID]
end

C.NEIGHBORHOOD_ENDEAVORS[17] = {
    title = "Moderate Mechanization",
}
C.NEIGHBORHOOD_ENDEAVORS[13] = {
    title = "Friend of the Grummles",
}
C.NEIGHBORHOOD_ENDEAVORS[16] = {
    title = "Reaching Beyond the Possible",
}
C.NEIGHBORHOOD_ENDEAVORS[15] = {
    title = "Artistic Aid",
}
C.NEIGHBORHOOD_ENDEAVORS[19] = {
    title = "Smell Sensation",
}
C.NEIGHBORHOOD_ENDEAVORS[18] = {
    title = "Consortium Consternation",
}

C.SOURCE_ACTIONS["Pascal-K1N6"] = {
    type = "map",
    label = "Pascal-K1N6",
    availability = "endeavor",
    initiativeID = 17, -- we will discover the real ID

    locations = {
        {
            title = "Pascal-K1N6",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Pascal-K1N6",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Brother Dovetail"] = {
    type = "map",
    label = "Brother Dovetail",
    availability = "endeavor",

    initiativeID = 13, -- we will discover the real ID
    locations = {
        {
            title = "Brother Dovetail",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Brother Dovetail",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Hordranin"] = {
    type = "map",
    label = "Hordranin",
    availability = "endeavor",

    initiativeID = 16, -- we will discover the real ID
    locations = {
        {
            title = "Hordranin",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Hordranin",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Hesta Forlath"] = {
    type = "map",
    label = "Hesta Forlath",
    availability = "endeavor",

    initiativeID = 15, -- we will discover the real ID
    locations = {
        {
            title = "Hesta Forlath",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Hesta Forlath",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Harlowe Marl"] = {
    type = "map",
    label = "Harlowe Marl",
    availability = "endeavor",

    initiativeID = 19, -- we will discover the real ID
    locations = {
        {
            title = "Harlowe Marl",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Harlowe Marl",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Aeeshna"] = {
    type = "map",
    label = "Aeeshna",
    availability = "endeavor",

    initiativeID = 18, -- we will discover the real ID
    locations = {
        {
            title = "Aeeshna",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Aeeshna",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

-----------------Patch 12.1-------------------------
C.NEIGHBORHOOD_ENDEAVORS[24] = {
    title = "Vacation Season",
}
C.NEIGHBORHOOD_ENDEAVORS[20] = {
    title = "Every Bakar Has Its Day",
}
C.NEIGHBORHOOD_ENDEAVORS[22] = {
    title = "Knock-off Amani",
}
C.NEIGHBORHOOD_ENDEAVORS[12] = {
    title = "Candle Culture",
}


C.SOURCE_ACTIONS["Taifa"] = {
    type = "map",
    label = "Taifa",
    availability = "endeavor",

    initiativeID = 24, -- we will discover the real ID
    locations = {
        {
            title = "Taifa",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Taifa",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Griftah"] = {
    type = "map",
    label = "Griftah",
    availability = "endeavor",

    initiativeID = 22, -- we will discover the real ID
    locations = {
        {
            title = "Griftah",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Griftah",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Roshai Lightstep"] = {
    type = "map",
    label = "Roshai Lightstep",
    availability = "endeavor",

    initiativeID = 20, -- we will discover the real ID
    locations = {
        {
            title = "Roshai Lightstep",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Roshai Lightstep",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Timicky"] = {
    type = "map",
    label = "Timicky",
    availability = "endeavor",

    initiativeID = 12, -- we will discover the real ID
    locations = {
        {
            title = "Timicky",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Timicky",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Cousin Shortkaf"] = {
    type = "map",
    label = "Cousin Shortkaf",
    availability = "endeavor",

    initiativeID = 13, -- we will discover the real ID
    locations = {
        {
            title = "Cousin Shortkaf",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 54.2,
            y = 56.0,
            faction = "horde",
        },
        {
            title = "Cousin Shortkaf",
            zone = "Founder's Point",
            mapID = 2352,
            x = 52.8,
            y = 37.8,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Special Griftah"] = {
    type = "map",
    label = "Special Griftah",
	suppressWorldMap = true,
    locations = {
        {
            title = "Special Griftah",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 40.2,
            y = 72.9,
            faction = "horde",
        },
        {
            title = "Special Griftah",
            zone = "Founder's Point",
            mapID = 2352,
            x = 62.5,
            y = 79.3,
            faction = "alliance",
        },
    },
}

C.SOURCE_ACTIONS["Throska"] = {
    type = "map",
    label = "Throska",
	suppressWorldMap = true,
    locations = {
        {
            title = "Throska",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 39.1,
            y = 74.1,
            faction = "horde",
        },
        {
            title = "Throska",
            zone = "Founder's Point",
            mapID = 2352,
            x = 62.2,
            y = 82.2,
            faction = "alliance",
        },
    },
}
-- ============================================================
-- World Event helper
-- ============================================================


--[[C.SOURCE_ACTIONS["Bobadormu"] = {
    type = "map",
    label = "Bobadormu",
	availability = "worldevent",
    worldEventID = 1508, -- Classic/Warlords Timewalking event ID	
	eventName = "Timewalking",
	--suppressWorldMap = true,
    locations = {
        {
            title = "Bobadormu",
            zone = "Orgrimmar",
            mapID = 85,
            x = 52.8,
            y = 83.0,
            faction = "horde",
        },
        {
            title = "Bobadormu",
            zone = "Stormwind",
            mapID = 84,
            x = 56.0,
            y = 19.0,
            faction = "alliance",
        },
    },
}
C.SOURCE_ACTIONS["Kiatke"] = {
    type = "map",
    label = "Kiatke",
	availability = "worldevent",
    worldEventID = 587, -- Classic/Warlords Timewalking event ID
	eventName = "Timewalking",
	--suppressWorldMap = true,
    locations = {
        {
            title = "Kiatke",
            zone = "Orgrimmar",
            mapID = 85,
            x = 52.0,
            y = 41.6,
            faction = "horde",
        },
        {
            title = "Kiatke",
            zone = "Stormwind",
            mapID = 84,
            x = 76.6,
            y = 16.6,
            faction = "alliance",
        },
    },
}
C.SOURCE_ACTIONS["Churbro"] = {
    type = "map",
    label = "Churbro",
	availability = "worldevent",
    worldEventID = 1669, -- Classic/Warlords Timewalking event ID
	eventName = "Timewalking",
	--suppressWorldMap = true,
    locations = {
        {
            title = "Churbro",
            zone = "Dazalor'alor",
            mapID = 1165,
            x = 46.0,
            y = 94.9,
            faction = "horde",
        },
        {
            title = "Churbro",
            zone = "Boralus",
            mapID = 1161,
            x = 70.9,
            y = 17.2,
            faction = "alliance",
        },
    },
}	
C.SOURCE_ACTIONS["Xydan"] = {
    type = "map",
    label = "Xydan",
    availability = "worldevent",
    worldEventID = 1722, -- Warlords Timewalking event ID
    suppressWorldMap = true,
    locations = {
        {
            title = "Xydan",
            zone = "Valdrakken",
            mapID = 2112,
            x = 81.4, y = 47.3,
            faction = "neutral",
        },
    },
}
C.SOURCE_ACTIONS["Auzin"] = {
    type = "map",
    label = "Auzin",
    availability = "worldevent",
    worldEventID = 562, -- Warlords Timewalking event ID
    suppressWorldMap = true,
    locations = {
        {
            title = "Auzin",
            zone = "Northrend Dalaran",
            mapID = 125,
            x = 51.0, y = 47.6,
            faction = "neutral",
        },
    },
}
C.SOURCE_ACTIONS["Cupri"] = {
    type = "map",
    label = "Cupri",
    availability = "worldevent",
    worldEventID = 559, -- Warlords Timewalking event ID
    suppressWorldMap = true,
    locations = {
        {
            title = "Cupri",
            zone = "Shattrath City",
            mapID = 111,
            x = 54.6, y = 39.6,
            faction = "neutral",
        },
    },
}
C.SOURCE_ACTIONS["Mistweaver Xia"] = {
    type = "map",
    label = "Mistweaver Xia",
    availability = "worldevent",
    worldEventID = 643, -- Warlords Timewalking event ID
    suppressWorldMap = true,
    locations = {
        {
            title = "Mistweaver Xia",
            zone = "Timeless Isle",
            mapID = 544,
            x = 43.0, y = 55.6,
            faction = "neutral",
        },
    },
}
C.SOURCE_ACTIONS["Collector Ta'steld"] = {
    type = "map",
    label = "Collector Ta'steld",
    availability = "worldevent",
    worldEventID = 1703, -- Warlords Timewalking event ID
    suppressWorldMap = true,
    locations = {
        {
            title = "Collector Ta'steld",
            zone = "Oribos",
            mapID = 1670,
            x = 56.24, y = 64.13,
            faction = "neutral",
        },
    },
}	

C.SOURCE_ACTIONS["Dizzy Alechux"] = {
    type = "map",
    label = "Dizzy Alechux",
    availability = "worldevent",
    worldEventID = 372, -- Warlords Timewalking event ID
	eventName = "Brewfest", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Dizzy Alechux",
            zone = "Durotar",
            mapID = 1,
            x = 40.3,
            y = 17.3,
            faction = "horde",
        },
    },
}
C.SOURCE_ACTIONS["Fay Stouthammer"] = {
    type = "map",
    label = "Fay Stouthammer",
    availability = "worldevent",
    worldEventID = 372, -- Warlords Timewalking event ID
	eventName = "Brewfest", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Fay Stouthammer",
            zone = "Dun Morogh",
            mapID = 27,
            x = 56.1,
            y = 36.7,
            faction = "alliance",
        },
    },
}
C.SOURCE_ACTIONS["Kay Stouthammer"] = {
    type = "map",
    label = "Kay Stouthammer",
    availability = "worldevent",
    worldEventID = 372, -- Warlords Timewalking event ID
	eventName = "Brewfest", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Kay Stouthammer",
            zone = "Founders Point",
            mapID = 2352,
            x = 54.4,
            y = 32.7,
            faction = "alliance",
        },
    },
}
C.SOURCE_ACTIONS["Fizz Alechux"] = {
    type = "map",
    label = "Fizz Alechux",
    availability = "worldevent",
    worldEventID = 372, -- Warlords Timewalking event ID
	eventName = "Brewfest", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Fizz Alechux",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 52.4,
            y = 54.3,
            faction = "horde",
        },
    },
}
C.SOURCE_ACTIONS["Jack"] = {
    type = "map",
    label = "Jack",
    availability = "worldevent",
    worldEventID = 324, -- Warlords Timewalking event ID
	eventName = "Hallow's End", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Jack",
            zone = "Elwynn Forest",
            mapID = 37,
            x = 31.8,
            y = 50.0,
            faction = "alliance",
        },
    },
}
C.SOURCE_ACTIONS["Echo"] = {
    type = "map",
    label = "Echo",
    availability = "worldevent",
    worldEventID = 324, -- Warlords Timewalking event ID
	eventName = "Hallow's End", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Echo",
            zone = "Tirisfal Glades",
            mapID = 18,
            x = 62.2,
            y = 66.6,
            faction = "horde",
        },
    },
}
C.SOURCE_ACTIONS["Cordula Wolfgang"] = {
    type = "map",
    label = "Cordula Wolfgang",
    availability = "worldevent",
    worldEventID = 324, -- Warlords Timewalking event ID
	eventName = "Hallow's End", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Cordula Wolfgang",
            zone = "Founders Point",
            mapID = 2352,
            x = 54.4,
            y = 32.7,
            faction = "alliance",
        },
    },
}
C.SOURCE_ACTIONS["Spew Gutstout"] = {
    type = "map",
    label = "Spew Gutstout",
    availability = "worldevent",
    worldEventID = 324, -- Warlords Timewalking event ID
	eventName = "Hallow's End", -- <--- Add this calendar search term!
    suppressWorldMap = true,
    locations = {
        {
            title = "Spew Gutstout",
            zone = "Razorwind Shores",
            mapID = 2351,
            x = 52.4,
            y = 54.3,
            faction = "horde",
        },
    },
}]]

end)(...);

-- ------------------------------------------------------------
-- SECTION: Shared/Constants_Colors.lua
-- ------------------------------------------------------------
(function(...)
local addonName, DVD = ...
local C = DVD.CONSTANTS or DVD.C

-- Put C.COLORS, C.LabelColors, C.ExpansionColors, and C.CURRENCY_ICONS here.
-------------------------------------------------
-- Expansion and Profession Order  
-------------------------------------------------
C.EXPANSION_NAMES = C.EXPANSION_NAMES or {
	[1] = "Classic", [2] = "The Burning Crusade", [3] = "Wrath of the Lich King",
	[4] = "Cataclysm", [5] = "Mists of Pandaria", [6] = "Warlords of Draenor",
	[7] = "Legion", [8] = "Battle for Azeroth", [9] = "Shadowlands",
	[10] = "Dragonflight", [11] = "The War Within", [12] = "Midnight"
}

C.EXPANSION_ORDER = C.EXPANSION_ORDER or {
    "Classic",
    "The Burning Crusade",
    "Wrath of the Lich King",
    "Cataclysm",
    "Mists of Pandaria",
    "Warlords of Draenor",
    "Legion",
    "Battle for Azeroth",
    "Shadowlands",
    "Dragonflight",
    "The War Within",
    "Midnight",
}

C.PROFESSION_ORDER = C.PROFESSION_ORDER or {
    "Alchemy",
    "Blacksmithing",
    "Cooking",
    "Enchanting",
    "Engineering",
    "Inscription",
    "Jewelcrafting",
    "Junkyard Tinkering",
    "Leatherworking",
    "Tailoring",
}
-- Temporary compatibility alias.
--C.Profession_Order = C.PROFESSION_ORDER
-------------------------------------------------
-- Colors
-------------------------------------------------
C.COLORS = C.COLORS or {
GOLD = { 1, 0.82, 0, 1 },
GOLD_DIM = { 0.8, 0.66, 0, 1 },
TITLE = { 0.9, 0.85, 0.5, 1 },
SIDEBAR_BG = { 0.05, 0.05, 0.08, 0.9 },
CONTENT_BG = { 0, 0, 0, 0.8 },
TAB_NORMAL = { 0.1, 0.1, 0.12, 0.8 },
TAB_HOVER = { 0.15, 0.15, 0.17, 0.9 },
TAB_SELECTED = { 0.12, 0.12, 0.14, 1 },
TAB_TEXT_INACTIVE = { 0.56, 0.56, 0.56, 1 },
TAB_ICON_ALPHA_INACTIVE = 0.75,
TEXT_PRIMARY = { 1, 1, 1, 1 },
TEXT_SECONDARY = { 0.9, 0.9, 0.9, 1 },
TEXT_TERTIARY = { 0.7, 0.7, 0.7, 1 },
TEXT_DISABLED = { 0.5, 0.5, 0.5, 1 },
BORDER = { 0.3, 0.3, 0.3, 1 },
PROGRESS_COMPLETE = { 0.2, 1, 0.2, 1 },
PROGRESS_NEAR_COMPLETE = { 0.6, 0.9, 0.1, 1 },
PROGRESS_MID = { 0.75, 0.65, 0.35, 1 },
PROGRESS_LOW_DIM = { 0.6, 0.6, 0.6, 1 },
PANEL_NORMAL = { 0.14, 0.14, 0.16, 0.9 },
PANEL_HOVER = { 0.19, 0.19, 0.21, 1 },
PANEL_NORMAL_ALT = { 0.12, 0.12, 0.14, 0.95 },
PANEL_HOVER_ALT = { 0.16, 0.16, 0.18, 1 },
ROW_BG = { 0.08, 0.08, 0.10, 0.9 },
ROW_BG_SOLID = { 0.08, 0.08, 0.10, 1 },
SOURCE_NAME_GOLD = { 0.92, 0.76, 0, 1 },
ROW_SELECTED = { 0.20, 0.20, 0.22, 1 },
}

-------------------------------------------------
-- Label Colors
-------------------------------------------------
C.LabelColors = C.LabelColors or {}

C.LabelColors.Collection = {
    all = "FFD100",
    collected = "00FF66",
    notCollected = "FF6666",
    missing = "FF6666",
    unknown = "888888",
}

C.LabelColors.Factions = {
alliance = "44A1FF",
horde = "F75567",
neutral = "5BC193",
}

C.LabelColors.GalleryCategories = {
    all = "FFD100",
    accent = "FFAA33",
    accents = "FFAA33",
    lighting = "FFE066",
    furnishing = "C084FC",
    furnishings = "C084FC",
    miscellaneous = "AAAAAA",
    nature = "44DD88",
    structural = "8FB8FF",
    functional = "66D9EF",
    unknown = "888888",
}

C.LabelColors.Sources = {
    vendor = "E07A5F",
    shop = "F4A261",
    blossomshop = "FFA07A",
	grimtideshop = "43adab",
    lushshop = "D97757",
	talebound = "D6C6F2",
    quest = "E17055",
    achievement = "FAB1A0",
    Quests = "FFD100",
    Exploration = "44DD88",
    ["Feats of Strength"] = "FF66CC",
    ["Expansion Features"] = "66B2FF",
    ["Dungeons and Raids"] = "C084FC",
    ["Player vs Player"] = "FF5555",
    Professions = "FFAA44",
    ["Midnight Prey"] = "9955CC",
	["Legacy"] = "abffdc",
	["World Events"] = "cde61b",	
    drop = "FF6B81",
    promo = "FF7979",
	holiday = "dc2f02",
brewfest = "FFAA44",
halloween = "dc2f02",
winterveil = "8FB8FF",
    profession = "E67E22",
    Alchemy = "00FA9A",
    Blacksmithing = "B0C4DE",
    Cooking = "FF9F43",
    Enchanting = "BF5AF2",
    Engineering = "FFC000",
    Inscription = "0A84FF",
    Jewelcrafting = "FF64B4",
    ["Junkyard Tinkering"] = "B38B6D",
    Leatherworking = "D2691E",
    Tailoring = "D6A4FF",	
    prepurchase = "D68C45",
	diablo2 = "fe6e5d",
	rexxar = "489983",
	diablo4 = "fa6d6b",
	midnight = "a68df2",
	forever = "41adea",
    pastcharity = "E84393",
    catalog = "B2B2B2",
    unreleased = "B85D33",
    treasure = "CD7F32",
    boss = "A0522D",
    collab = "FF70A6",
	dnd = "E63329",
	expiredcollab = "f06272",
	expireddecor = "ec6b76",
    patch121 = "FF9770",
    prey = "BF6900",
    unknown = "808080",
}

C.LabelColors.Professions = {
    Alchemy = "00FA9A",
    Blacksmithing = "B0C4DE",
    Cooking = "FF9F43",
    Enchanting = "BF5AF2",
    Engineering = "FFC000",
    Inscription = "0A84FF",
    Jewelcrafting = "FF64B4",
    ["Junkyard Tinkering"] = "B38B6D",
    Leatherworking = "D2691E",
    Tailoring = "D6A4FF",
    unknown = "7F8C8D",

}

C.LabelColors.AchievementCategories = {
    Quests = "FFD100",
    Exploration = "44DD88",
    ["Feats of Strength"] = "FF66CC",
    ["Expansion Features"] = "66B2FF",
    ["Dungeons and Raids"] = "C084FC",
    ["Player vs Player"] = "FF5555",
    Professions = "FFAA44",
    ["Midnight Prey"] = "9955CC",
	["Legacy"] = "abffdc",
	["World Events"] = "cde61b",
    unknown = "888888",
}

C.LabelColors.BossCategories = {
    rare = "FF5555",
    dungeon = "66B2FF",
    delve = "C084FC",
    renown = "FFD100",
    event = "00FFCC",
    raid = "FF8844",
    daily = "44DD88",
    decor = "FF66CC",
	treasure = "FF7979",
    unknown = "888888",
}

C.LabelColors.QuestCategories = {
    race = "44DD88",
    spec = "FF66CC",
    unknown = "888888",
}

C.LabelColors.ShopCategories = {
    shop = "44DD88",
    charity = "6ef8fd",
    unknown = "888888",
}

C.LabelColors.VendorCategories = {
    none = "fb7698",
    friendship = "a6f942",
    neighborhood = "C084FC",
    Promo = "FFD100",
    race = "00FFCC",
	holiday = "dc2f02",
    renown = "FF8844",
    reputation = "44DD88",
    subfaction = "FF66CC",
	timewalking = "6ef8fd",
    unknown = "888888",
}


-------------------------------------------------
-- Expansion Colors
-------------------------------------------------
-- Filter colours, changed up 2026-11-05: one distinct hue per expansion, readable on dark navy. Midnight stays purple.
C.ExpansionColors = C.ExpansionColors or {
    ["Classic"]                = "FFD100",
    ["The Burning Crusade"]    = "00FF66",
    ["Wrath of the Lich King"] = "66B2FF",
    ["Cataclysm"]              = "FF6B35",
    ["Mists of Pandaria"]      = "00D9A0",
    ["Warlords of Draenor"]    = "D2691E",
    ["Legion"]                 = "BF5AF2",
    ["Battle for Azeroth"]     = "FF8844",
    ["Shadowlands"]            = "7A5CFF",
    ["Dragonflight"]           = "00C8FF",
    ["The War Within"]         = "FFAA33",
    ["Midnight"]               = "A68DF2",
    ["Neighborhoods"]          = "E0E0E0",
    ["Unknown"]                = "7F8C8D",

}
-------------------------------------------------
-- Currency Icons
-------------------------------------------------
C.CURRENCY_ICONS = C.CURRENCY_ICONS or {
    [823]  = 1061300,
    [824]  = 1005027,
    [1155] = 1377394,
    [1220] = 1397630,
    [1508] = 1064188,
    [1560] = 2032600,
    [1710] = 1604167,
    [1767] = 3743739,
    [1792] = 1455894,
    [1803] = 3069889,
    [1813] = 3528288,
    [2003] = 2065578,
    [2118] = 134388,
    [2657] = 1362650,
    [2803] = 133858,
    [2815] = 2967113,
    [3056] = 4549280,
    [3316] = 7137586,
    [3319] = 7195171,
    [3363] = 134495,
    [3373] = 348545,
    [3377] = 5041790,
    [3379] = 132849,
    [3392] = 4554435,
    [3405] = 2459456,
	[3448] = 8032876,
	[37829] = 133784,
	[33226] = 236546,
	[3361] = 2744751,
}

C.CurrencyIcons = C.CURRENCY_ICONS

C.GOLD_ICON = C.GOLD_ICON or "Interface\\MoneyFrame\\UI-GoldIcon"

C.HEARTHSTEEL_ATLAS = C.HEARTHSTEEL_ATLAS or "hearthsteel-icon-32x32"

C.GALLERY_FACTION_ICONS = C.GALLERY_FACTION_ICONS or {
    alliance = "Interface\\AddOns\\DecorVendor\\Assets\\blue",
    horde = "Interface\\AddOns\\DecorVendor\\Assets\\red",
    neutral = "Interface\\AddOns\\DecorVendor\\Assets\\neutral",
}





























end)(...);

-- ------------------------------------------------------------
-- SECTION: Shared/Constants_Filters.lua
-- ------------------------------------------------------------
(function(...)
local addonName, DVD = ...
local C = DVD.CONSTANTS or DVD.C

-- Put C.GALLERY_FILTER_SECTIONS, C.SOURCE_ALIASES, C.SOURCE_LABELS, C.SOURCE_ORDER, and C.MAIN_SECTIONS here.

-------------------------------------------------
-- Gallery Sidebar Filter Sections
-------------------------------------------------
C.GALLERY_FILTER_SECTIONS = C.GALLERY_FILTER_SECTIONS or {
    {
        key = "collection",
        title = "My Collection",
        defaultCollapsed = false,
        options = {
            {
                key = "showCollected",
                label = "Collected",
                type = "toggle",
            },
            {
                key = "showNotCollected",
                label = "Not Collected",
                type = "toggle",
            },
        },
    },
    {
        -- Changed key or removed it so it uses a unique identifier
        key = "source_standard", 
        title = "Source",
        defaultCollapsed = true,
        options = {
            { key = "vendor", label = "Vendor", type = "source" },
            { key = "quest", label = "Quest", type = "source" },
            { key = "drop", label = "Drop", type = "source" },
			{ key = "catalog", label = "Housing Catalog", type = "source", hideWhenZero = true},
        },
    },
{
    key = "source_holiday",
    title = "Holiday Decor",
    defaultCollapsed = true,
    options = {
        { key = "brewfest", label = "Brewfest", type = "source", hideWhenZero = true },
        { key = "halloween", label = "Hallow's End", type = "source", hideWhenZero = true },
        { key = "winterveil", label = "Winter Veil", type = "source", hideWhenZero = true  },
    },
},
	
	{
        -- Changed key or removed it so it uses a unique identifier
        key = "source_profession", 
        title = "Profession",
        defaultCollapsed = true,
        options = {
            { key = "Alchemy", label = "Alchemy", type = "source" },  
			{ key = "Blacksmithing", label = "Blacksmithing", type = "source" }, 
			{ key = "Cooking", label = "Cooking", type = "source" }, 
			{ key = "Enchanting", label = "Enchanting", type = "source" }, 
			{ key = "Engineering", label = "Engineering", type = "source" }, 
			{ key = "Inscription", label = "Inscription", type = "source" }, 
			{ key = "Jewelcrafting", label = "Jewelcrafting", type = "source" }, 
			{ key = "Junkyard Tinkering", label = "Junkyard Tinkering", type = "source" }, 
			{ key = "Leatherworking", label = "Leatherworking", type = "source" }, 
			{ key = "Tailoring", label = "Tailoring", type = "source" }, 			
        },
    },
	{
        -- Changed key or removed it so it uses a unique identifier
        key = "source_achievement", 
        title = "Achievement",
        defaultCollapsed = true,
        options = {
            { key = "Quests", label = "Quests", type = "source" },  
			{ key = "Exploration", label = "Exploration", type = "source" }, 
			{ key = "Feats of Strength", label = "Feats of Strength", type = "source" }, 
			{ key = "Expansion Features", label = "Expansion Features", type = "source" }, 
			{ key = "Dungeons and Raids", label = "Dungeons and Raids", type = "source" }, 
			{ key = "Player vs Player", label = "Player vs Player", type = "source" }, 
			{ key = "Professions", label = "Professions", type = "source" }, 
			{ key = "Legacy", label = "Legacy", type = "source" }, 
			{ key = "World Events", label = "World Events", type = "source" }, 			
        },
    },	
    {
        key = "source_prepurchase",
        title = "Expansion Pre-Purchase",
        defaultCollapsed = true,
        options = {
            { key = "prepurchase", label = "Pre Purchase", type = "source", hideWhenZero = true },
			{ key = "diablo2", label = "Diablo 2 DLC", type = "source", hideWhenZero = true },
			{ key = "diablo4", label = "Diablo 4 Pre Purchase", type = "source", hideWhenZero = true },
			{ key = "midnight", label = "Midnight Pre Purchase", type = "source", hideWhenZero = true },
            { key = "forever", label = "Warcraft Forever", type = "source", hideWhenZero = true },            
        },
    },	
    {
        key = "source_promos",
        title = "Promos",
        defaultCollapsed = true,
        options = {            
            { key = "promo", label = "Twitch Grrgles", type = "source", hideWhenZero = true },            
            { key = "collab", label = "Current Collabs", type = "source", hideWhenZero = true },
			{ key = "dnd", label = "DND", type = "source", hideWhenZero = true },
			{ key = "expiredcollab", label = "Expired Collabs", type = "source", hideWhenZero = true },		
        },
    },  
    {
        key = "source_shop",
        title = "Shop Decor",
        defaultCollapsed = true,
        options = {
            { key = "shop", label = "Cute Decor", type = "source" },
			{ key = "blizzcon", label = "Blizzcon 2026", type = "source", hideWhenZero = true  },
            { key = "lushshop", label = "Lush Garden Pack", type = "source" },
            { key = "blossomshop", label = "Spring Blossom Pack", type = "source" },
			{ key = "grimtideshop", label = "Grimtide Decor Pack", type = "source" },
			{ key = "rexxar", label = "Rexxar Wild Pack", type = "source", hideWhenZero = true },				
        },
    },
    {
        key = "source_gamemode",
        title = "Special Gamemode Decor",
        defaultCollapsed = true,
        options = {
			{ key = "talebound", label = "Talebound Shop", type = "source", hideWhenZero = true },
        },
    },		
    {
        key = "source_expired",
        title = "Expired Shop Decor",
        defaultCollapsed = true,
        options = {            
			{ key = "expireddecor", label = "Blizzcon", type = "source", hideWhenZero = true },
            { key = "pastcharity", label = "The Roofus Pack", type = "source", hideWhenZero = true },
        },
    },	
    {
        key = "source_patch",
        title = "Upcoming Patch",
        defaultCollapsed = true,
        options = {            
            { key = "patch125", label = "Patch 12.1.5", type = "source", hideWhenZero = true }, 
			{ key = "patch127", label = "Patch 12.1.7", type = "source", hideWhenZero = true },
        },
    },    
}

-------------------------------------------------
-- Gallery Source Aliases / Labels / Order
-------------------------------------------------
C.SOURCE_ALIASES = C.SOURCE_ALIASES or {
    -- Housing Catalog
    catalog = "catalog",
    housingcatalog = "catalog",
    other = "catalog",	

    -- Vendors
    vendor = "vendor",
    vendors = "vendor",

    -- Shop
    shop = "shop",
    ingameshop = "shop",
	soon = "shop",

	talebound = "talebound",
	taleboundshop = "talebound",

    -- Quests
    quest = "quest",
    quests = "quest",

    -- Achievements
   -- achievement = "achievement",
    achievements = "achievement",
    achieve = "achievement",
    ach = "achievement",
	
    quests = "Quests",
    exploration = "Exploration",
    featsofstrength = "Feats of Strength",
    expansionfeatures = "Expansion Features",
    dungeonsandraids = "Dungeons and Raids",
    playervsplayer = "Player vs Player",
    professions = "Professions",
    midnightprey = "Midnight Prey",
    legacy = "Legacy",
    worldevents = "World Events",
	
    -- Drops, bosses, and treasures
    drop = "drop",
    drops = "drop",
    boss = "drop",
    bossdrop = "drop",
    bossdrops = "drop",
    encounter = "drop",
    encounterdrop = "drop",
    encounterdrops = "drop",
    treasure = "drop",
    treasures = "drop",
	rare = "drop",
	event = "drop",
	delve = "drop",
    chest = "drop",
    chests = "drop",

    -- Promotions
    promo = "promo",
    promotion = "promo",
    promotional = "promo",

    -- Collaborations
    collab = "collab",
    collabs = "collab",
	dnd = "dnd",
	
    expiredcollab = "expiredcollab",
    expiredcollabs = "expiredcollab",

expireddecor = "expireddecor", 

    -- Patch 12.1
    patch125 = "patch125",
    ["patch12.1.5"] = "patch125",
    patch1201 = "patch125",
    ["125"] = "patch125",
	
     patch127 = "patch127",
    ["patch12.1.7"] = "patch127",
    patch1207 = "patch127",
    ["127"] = "patch127",

	-- Holiday
	holiday = "holiday",
	brewfest = "brewfest",
halloween = "halloween",
["hallow'send"] = "halloween",
winterveil = "winterveil",

    -- Patch 12.1
    prepurchase = "prepurchase",
	
	diablo2 = "diablo2",
	diablo4 = "diablo4",
	midnight = "midnight",
	rexxar = "rexxar",
	
	--Warcraft Forever
	forever = "forever",
	
	-- Charity
	pastcharity = "pastcharity",
	
	-- Charity
	blossomshop = "blossomshop",
	
	grimtideshop = "grimtideshop",
	
	-- Charity
	lushshop = "lushshop",
	
-- Professions
--    profession = "profession",
   -- professions = "profession",
--    crafted = "profession",
 --   crafting = "profession",
--    recipe = "profession",
    
    alchemy = "Alchemy",
    Alchemy = "Alchemy",
    blacksmithing = "Blacksmithing",
    Blacksmithing = "Blacksmithing",
    cooking = "Cooking",
    Cooking = "Cooking",
    enchanting = "Enchanting",
    Enchanting = "Enchanting",
    engineering = "Engineering",
    Engineering = "Engineering",
    inscription = "Inscription",
    Inscription = "Inscription",
    jewelcrafting = "Jewelcrafting",
    Jewelcrafting = "Jewelcrafting",
    ["junkyard tinkering"] = "Junkyard Tinkering",
    junkyardtinkering = "Junkyard Tinkering",
    JunkyardTinkering = "Junkyard Tinkering",
    leatherworking = "Leatherworking",
    Leatherworking = "Leatherworking",
    tailoring = "Tailoring",
    Tailoring = "Tailoring",
}

C.SOURCE_LABELS = C.SOURCE_LABELS or {
    all = "All Decor",
    vendor = "Vendor",
    shop = "In-Game Shop",
	talebound = "Talebound Shop",
	blossomshop = "Spring Blossom Pack",
	grimtideshop = "Grimtide Decor Pack",
	lushshop = "Lush Garden Pack",
    quest = "Quest",
    achievement = "Achievement",
    Quests = "Quests",
    Exploration = "Exploration",
    ["Feats of Strength"] = "Feats of Strength",
    ["Expansion Features"] = "Expansion Features",
    ["Dungeons and Raids"] = "Dungeons and Raids",
    ["Player vs Player"] = "Player vs Player",
    Professions = "Professions",
    ["Midnight Prey"] = "Midnight Prey",
	["Legacy"] = "Legacy",
	["World Events"] = "World Events",		
    drop = "Drop",
    promo = "Promo",
	holiday = "Holiday Decor",
	brewfest = "Brewfest",
halloween = "Hallow's End",
winterveil = "Winter Veil",

   -- profession = "Profession",
   
   	Alchemy = "Alchemy",
    Blacksmithing = "Blacksmithing",
    Cooking = "Cooking",
    Enchanting = "Enchanting",
    Engineering = "Engineering",
    Inscription = "Inscription",
    Jewelcrafting = "Jewelcrafting",
    JunkyardTinkering = "Junkyard Tinkering",
    Leatherworking = "Leatherworking",
    Tailoring = "Tailoring",
	
    catalog = "Housing Catalog",
    unreleased = "Unreleased",
    collab = "Current Collabs",
	expiredcollab = "Expired Collabs",
	expireddecor = " Expired Shop Decor",
    patch125 = "Patch 12.1.5",
	patch127 = "Patch 12.1.7",
	prepurchase = "Pre Purchase",
	diablo2 = "Diablo 2 DLC",
	rexxar = "Rexxar Wild Pack",
	diablo4 = "Diablo 4 Pre Purchase",
	midnight = "Midnight Pre Purchase",
	forever = "Warcraft Forever",
	pastcharity = "The Roofus Pack",
	dnd = "DND",
}

C.SOURCE_ORDER = C.SOURCE_ORDER or {
    "vendor",
    "shop",
	"blossomshop",
	"grimtideshop",
	"talebound",
	"lushshop",
    "quest",
    "achievement",
    "Quests",
    "Exploration",
    "Feats of Strength",
    "Expansion Features",
    "Dungeons and Raids",
    "Player vs Player",
    "Professions",
    "Midnight Prey",
	"Legacy",
	"World Events",		
    "drop",
	"holiday",
	"brewfest", 
	"halloween", 
	"winterveil",
    "promo",
    "collab",
	"dnd",
	"expiredcollab",
	"expireddecor",
	"prepurchase",
	"diablo2",
	"rexxar",
	"diablo4",
	"midnight",
	"forever",
	"pastcharity",	
    "profession",
    "Alchemy",
    "Blacksmithing",
    "Cooking",
    "Enchanting",
    "Engineering",
    "Inscription",
    "Jewelcrafting",
    "Junkyard Tinkering",
    "Leatherworking",
    "Tailoring",	
    "catalog",
    "patch125",
	"patch127",	
}

-------------------------------------------------
-- Main Addon Sections
-- Shared by BottomTabs and MainHomePanel
-------------------------------------------------
C.MAIN_SECTIONS = C.MAIN_SECTIONS or {
    {
        id = "vendors",
        text = "Vendors",
        icon = "Interface\\Icons\\inv_misc_5potionbag_special",
        width = 128,

        homeColor = { 0.35, 0.75, 1.00 },
        homeDescription = "Browse original decor vendors, waypoint support, and vendor locations.",
        showHomeCount = true,
    },
    {
        id = "professions",
        text = "Professions",
        icon = "Interface\\Icons\\Trade_Tailoring",
        width = 136,

        homeColor = { 0.55, 1.00, 0.70 },
        homeDescription = "View crafted decor, recipes, materials, and profession requirements.",
        showHomeCount = true,
    },
    {
        id = "quests",
        text = "Quests",
        icon = "Interface\\Icons\\Inv_misc_note_01",
        width = 128,

        homeColor = { 1.00, 0.82, 0.10 },
        homeDescription = "Track decor earned from quests and quest-related unlocks.",
        showHomeCount = true,
    },
    {
        id = "achievements",
        text = "Achievements",
        icon = "Interface\\Icons\\achievement_level_100",
        width = 158,

        homeColor = { 0.75, 0.45, 1.00 },
        homeDescription = "Find decor tied to achievements and collection progress.",
        showHomeCount = true,
    },
    {
        id = "bossdrops",
        text = "Drops",
        icon = "Interface\\Icons\\achievement_boss_blackhand",
        width = 136,

        homeColor = { 1.00, 0.45, 0.45 },
        homeDescription = "Browse decor from bosses, rares, treasures, events, and drops.",
        showHomeCount = true,
    },
--[[	{
        id = "shop",
        text = "Shop Decor",
		icon = "Interface\\Icons\\ui_shop",
		width = 136,
			
        homeColor = {0.00, 0.68, 0.94}, -- A crisp Blizzard Blue
        homeDescription = "View premium decor items available through the in-game shop",
        showHomeCount = true,
    },
   {
        id = "decor",
        text = "Vendor Decor Catalog",
		icon = "Interface\\Icons\\garrison_building_magetower",
        width = 160,
		
        homeColor = { 1.00, 0.35, 0.85 },
        homeDescription = "Preview decor in 3D, compare sources, and browse the full  vendor collection.",
        showHomeCount = true,
    },]]	
   {
        id = "gallery",
        text = "Gallery Browser",
		icon = "Interface\\Icons\\garrison_building_magetower",
        width = 160,
		
        homeColor = { 1.00, 0.35, 0.85 },
        homeDescription = "Preview decor in 3D, compare sources, and browse the full collection.",
        showHomeCount = false,
    },
}

-------------------------------------------------
-- Main Source Filter Options
-------------------------------------------------
C.MAIN_SOURCE_PRIORITY = C.MAIN_SOURCE_PRIORITY or {
        "quest",
        "achievement",
        "profession",
        "drop",
        "treasure",
        "vendor",
        "shop",
    }

C.MAIN_SOURCE_LABELS = C.MAIN_SOURCE_LABELS or {
        quest = "Quest",
        achievement = "Achievement",
        profession = "Profession",
        drop = "Drop",
        treasure = "Treasure",
        vendor = "Vendor",
        shop = "Shop",
    }

C.MAIN_SOURCE_ALIASES = C.MAIN_SOURCE_ALIASES or {
    quest = "quest",
    quests = "quest",

    achievement = "achievement",
    achievements = "achievement",
    achieve = "achievement",
    ach = "achievement",

    profession = "profession",
    professions = "profession",
    crafted = "profession",
    crafting = "profession",
    recipe = "profession",

    drop = "drop",
    drops = "drop",
    boss = "drop",
    bossdrop = "drop",
    bossdrops = "drop",
    encounter = "drop",
    encounterdrop = "drop",
    delve = "drop",
    event = "drop",
    dungeon = "drop",
    raid = "drop",
    rare = "drop",
	daily = "drop",
    
    -- 🌟 Align treasure to "drop" just like C.SOURCE_ALIASES does!
    treasure = "drop",
    treasures = "drop",
    chest = "drop",
    chests = "drop",

    vendor = "vendor",
    vendors = "vendor",

    shop = "shop",
    store = "shop",
    ingameshop = "shop",
    wowshop = "shop",
    battlenetshop = "shop",
}

end)(...);

