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
C.VERSION = C.VERSION or "2.14"
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
    PartSeparator = "  ",
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

