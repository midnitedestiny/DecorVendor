# Decor Vendor — Where Everything Lives Now

Your 42 code files were consolidated into 10. **No code was changed** — each
original file is a labeled section inside its new file (search for
`SECTION: <old path>`), wrapped in its own function scope, so it behaves exactly like the separate file did (including guard clauses that exit early), and everything still loads
in the original .toc order.

## The addon folder at a glance

```
DecorVendor/
├── DecorVendor.toc      (loads 14 files total)
├── Core.lua             (the only code file at the top level)
├── Shared/  Constants.lua
├── Data/    Database.lua
├── Sources/ Sources.lua
├── PTR/     ActiveItems_127.lua (loaded, self-gated — see below)
│          ptr127.lua (not loaded — draft detail records for the 12.7 items)
├── Core/    Utils.lua     (+ GalleryLoader.lua, not loaded — see below)
├── UI/      MainUI.lua, Rows.lua, Gallery.lua
├── Tools/   Debug.lua, CatalogDumper.lua
├── Libs/    (third-party, untouched)
├── Assets/, Fonts/
└── STRUCTURE.md         (this cheat sheet)
```

## Old file → new home

### Shared\Constants.lua
- Shared\Fonts.lua
- Shared\constants.lua
- Shared\SourceActions.lua
- Shared\Constants_Colors.lua
- Shared\Constants_Filters.lua

### Data\Database.lua
- Data\ActiveDatabase.lua
- Catalog\CatalogRecords.lua
- Data\ActiveItems.lua
- Data\ActiveItems_Achievements.lua
- Data\ActiveItems_Promo.lua
- Data\ActiveItems_Professions.lua
- Data\ActiveItems_Drops.lua
- Data\ActiveItems_Quests.lua
- Data\ActiveItems_125.lua

### PTR\ActiveItems_127.lua (its own file again)
- Data\ActiveItems_127.lua — patch 12.1.7 items. The file gates itself:
  below build 120107 it registers nothing. Loaded right after Database.

### Sources\Sources.lua
- Sources\MainSources.lua
- Sources\GalleryItemDetails.lua
- Sources\GalleryVendorDetails.lua

### Core\Utils.lua
- filters.lua
- Helpers\Helpers.lua
- Core\Utilities.lua

### UI\MainUI.lua
- Frames\MainHomePanel.lua
- Frames\MainFrame.lua
- UI\PreviewPanel.lua
- UI\ListFrame.lua

### UI\Rows.lua
- Rows\RowWidgets.lua
- Rows\VendorRows.lua
- Rows\ProfessionRows.lua
- Rows\QuestRows.lua
- Rows\AchievementRows.lua
- Rows\BossDropRows.lua
- Rows\ShopRows.lua
- UI\ListBuilders.lua
- UI\OptionsPanel.lua

### UI\Gallery.lua
- GalleryCore\GalleryUtils.lua
- Helpers\GalleryHelpers.lua
- GalleryCore\FilterHelpers.lua
- GalleryCore\GalleryDetailsBridge.lua
- Frames\GalleryUI.lua

### Stayed as their own files
- Core.lua → still at the top level (load-order sensitive)
- Debug.lua → Tools\Debug.lua
- Catalog\CatalogDumper.lua → Tools\CatalogDumper.lua
- Libs\*.lua → unchanged

## Load order (unchanged from before)

Libs → Constants → Database → PTR (ActiveItems_127) → Sources → Debug →
Utils → MainUI → Rows → Core → Gallery → CatalogDumper

## Finding code fast

Inside each merged file, every section starts with a header like:

```
-- SECTION: Rows/VendorRows.lua
```

So if you remember the old filename, Ctrl+F for it and you're there.

## Not loaded by the .toc (kept, but the game ignores them)

- Core\GalleryLoader.lua
- PTR\ptr127.lua — draft boss-drop/NPC detail records for the 12.7 items;
  these exist nowhere else, keep it until the details are merged into Sources.

They were never in the .toc, so they never ran. Safe to delete if they're
leftovers — but they're harmless where they are.
