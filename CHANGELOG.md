# Decor Vendor Changelog

## Version 2.06

### Collection Detection Fixes
- **Restored the original stable decor collection detection logic** after version 2.05 was released it  showed the newer dynamic catalog checker could falsely mark some vendor items as collected.
- Fixed false green checkmarks appearing on merchant/vendor items that were still uncollected and still showing a first-time collection bonus.
- Restored the previous collection rules that worked reliably before the original addon split so 10 versions ago:
- Reverted collection lookup behavior back to `GetCatalogEntryInfoByRecordID` using the decor record ID, matching the older working implementation.
- Removed overly broad collection checks that treated catalog-known or item-direct catalog data as proof of ownership.
- Improved reliability after deleting saved variables, switching characters, and waiting for the Housing Catalog to finish loading.

### Merchant / Vendor Checkmark Fixes
- Fixed merchant green checkmarks incorrectly appearing on items the player did not own.
- Restored accurate vendor/merchant ownership detection after the 2.05 refactor cleanup.
- Confirmed checkmarks now correctly separate owned decor from uncollected decor after fresh login and cache rebuild.

### Notes
Version 2.06 is a focused hotfix for collection detection and vendor checkmark accuracy. This update restores the older proven ownership logic while keeping the unified `DVD` namespace from the 2.05 refactor.

## Version 2.05

### Unified Addon Packaging
- **Re-merged Decor Vendor into one unified addon project** instead of maintaining separate internal addon folders for DecorVendor, DecorVendorData, and DecorVendorGallery.
- Updated internal namespace handling so the main addon, data files, constants, and Gallery Browser all share the same `DVD` addon table.
- Preserved compatibility aliases for older internal references while cleaning up the active folder structure for easier maintenance and CurseForge packaging.
- Updated license wording to reflect Decor Vendor as one unified project instead of a split addon suite.

### Gallery Browser & Source Action Fixes
- Improved Gallery source-action handling for multi-location content such as Midnight Delves, Dreamsurge, and other map-pinned sources.
- Fixed Gallery source buttons and right-click behavior so supported sources can pin multiple map locations through shared source action data.
- Improved vendor-driven source actions for special vendors with rotating or variable locations.
- Added support for vendor records that use `sourceAction`, `pinSourceAction`, and `openMapID` for special map-pin behavior.

### Vendor Waypoint Fixes
- Fixed vendor row right-click waypoint behavior after the refactor.
- Restored normal TomTom waypoint support for fixed-location vendors.
- Fixed the vendor waypoint button so it checks TomTom directly instead of relying on a cached TomTom state.
- Restored the previous behavior where normal vendor waypoints drop a pin without forcing the world map open.
- Special multi-location vendors can still open the map and pin supported source locations when configured.

### Boss Drop & Delve Location Improvements
- Improved boss/drop location handling so multi-map source actions can use each location’s own `mapID`.
- Updated boss/drop pinning logic to better support source actions with multiple zones or entrances.
- Improved compatibility between main boss rows and Gallery Browser map-pin behavior.

### Collection & Stats Refresh Improvements
- Added delayed collection/stat refresh support after login and world entry to better handle Blizzard Housing Catalog data loading late.
- Improved cache clearing for collection and vendor status data after housing catalog/storage updates.
- Reduced cases where collection totals appear incorrect immediately after switching characters or factions.
- Added additional delayed refresh passes for sessions where the Housing Catalog takes longer to fully load.

### Achievement & Saved Variable Fixes
- Restored account-wide saved variable behavior for `vendorSettings` so achievement and completion caches are not accidentally treated as per-character data.
- Improved cross-character and cross-faction consistency for completed achievement tracking.
- Reconfirmed achievement completion caching should remain a helper cache, not the only source of completion truth.

### Helpful Information Panel Update
- Reworked the Helpful Information settings panel layout for better readability.
- Added a cleaner boxed layout, improved section spacing, dividers, and clearer wording.
- Updated tips for Gallery loading, stats syncing, profession decor, boss drops, vendor decor, and color indicators.

### Debug / Release Cleanup
- Disabled noisy quest watcher debug output for live release builds.
- Cleaned up release-facing behavior so normal users no longer see internal quest accepted/completed debug messages.
- Continued general refactor cleanup from the unified addon structure.

### Notes
Version 2.05 is a cleanup and stabilization update focused on the unified addon structure, Gallery/source-action compatibility, waypoint behavior, delayed collection syncing, and CurseForge release readiness.

## Version 2.04

## Achievement Added
- Added the Goal Achievement which is a promotional achievement to earn 3 decor!

## Version 2.03

### Gallery Crash Proofing & Engine Stabilization
- **Implemented Model Viewer Crash Isolation**: Patched critical client rendering flaws occurring when attempting to load structural neighborhood assets missing physical 3D model meshes (`.m2`/`.wmo`) from the live patch file configurations.
- **Added Conditional 3D Render Bypass**: Introduced a strict `skip3DPreview` property check directly inside `Gallery.ShowPreviewModel`. Items carrying this database flag automatically bypass the high-risk `SetModelByFileID` game engine calculations, ensuring 100% immunity against desktop hard-crashes.

### Dress-Up Interface Links
- **Integrated Native DressUp Links**: Upgraded fallback operations inside the Gallery detailing module to dynamically inherit and capture the core item structures.
- **Wired Action Button Redirection**: Intercepted standard execution patterns within `Gallery.UpdateActionButton` to isolate broken assets. Selecting a preview-less structural asset now safely transforms the main panel button into an operational **"Open Housing Catalogue"** shortcut, utilizing `DressUpItemLink` to cleanly pass data directly to Blizzard's global preview frame interface without data corruption or interface loss.

### Dynamic Fallback UI Overlays
- **Created "No Preview" Contextual Text Layouts**: Attached a layered sub-element configuration string onto the `preview.watermarkFrame` container object to communicate asset gaps safely.
- **Smart View Text Management**: Configured text strings to remain completely hidden at startup to preserve a clean panel aesthetic on addon initialization. Clicking a missing asset instantly draws a centered bold crimson text notification reading: *"NO PREVIEW AVAILABLE (Asset missing from game files)"*, which automatically clears out and drops from view the exact moment a normal, fully asset-supported item card is selected.

## Version 2.02

### Catalog Data Refinement
- Hidden generic neighborhood structural elements from the main listing views to clean up browsing.
- Items hidden include basic building blocks such as pillars, doorways, and blank wall assets from neighborhood vendors.
- Restricted the browser display to focus primarily on true interactive and decorative housing furnishings rather than generic structural layouts.
- Will unhide them once the in-game catalog adds the previews in game which will solve the crash

## Version 2.01

### Quest Display Theme Improvements
- **Restored Quest Mark Completed Features**: Fully adapted the "Mark completed Quests and Achievements" option to support the brand-new Midnight layout. Completed quests no longer remain brightly lit alongside active ones.
- **Premium Muted Completed States**: Finished quests now dynamically dim their card backgrounds to a desaturated dark velvet slate (`0.06, 0.05, 0.08`), drop reward icon opacities, desaturate item textures, and shift typography to a clean, readable dark iron-grey palette to mirror your completed achievements style perfectly.
- **Unified Faction Color Fallbacks**: Re-integrated the addon's custom color constants matrix into the quest row constructor module, ensuring active title text automatically inherits vibrant faction color shades unless explicitly greyed out by the completion toggle settings.

### UI & Tooltip Streamlining
- **Streamlined Achievement Row Interactions**: Stripped away heavy live-cache data lookups from the row hover states to eliminate live-server game latency. Rows now cleanly display a lightweight left-click tracking instruction tip instantly on mouseover.
- **Removed Dropdown Menu Status Filter**: Dropped the redundant "Status" option out of the main dropdown filter module, keeping the filtering interface aligned with your simplified achievement list behaviors.
- **Cleaned Up Achievement Code Weight**: Removed dead static completion properties (`status = "complete"`) from the local data tracking blocks, shifting entirely to dynamic, on-the-fly live game database lookups.

### Performance & Crash Protection (PTR / Live Sync)
- **Implemented Tooltip Processor Sanity Shield**: Patched an engine-level bug unique to modern client build structures. Added an explicit data protection handler to `AddTooltipPostCall` to stop un-cached item rows or achievements from leaking raw `(null)` text strings onto item tooltips.
- **Created Asset Blacklist Protection**: Added an explicit crash-isolation bypass filter into `Debug.lua`. The core scraper loop now gracefully drops database queries for known broken Blizzard catalog items missing 3D models (`.m2`/`.wmo`) or 2D layouts before they can panic the client's rendering pipeline and force a desktop crash.

### Maintenance & Warning Elements
- **Added Pre-Patch Maintenance Footer Warning**: Appended a third outline-styled warning row to the main welcome dashboard panel footer area.
- **User Warning Messaging**: Injected a sharp, bright red notice (`|cffff4040`) stating: *"Pre-Patch Update: No decor is being hidden and may show up as itemID until after maintenance! I will double check everything is showing correctly after the patch launches."*
- **Optimized Layout Adjustments**: Shifted the vertical spacing constraints of the original footer text configurations upward (`BOTTOM, 46`) to balance the new three-line block layout cleanly inside the frame container borders.

### Notes
Version 2.01 is an urgent pre-patch stabilization update deployed to prepare the addon for tomorrow's main content update maintenance. 

All UI row functions have been hardened against server latency cache-miss states, and quest marking lines are now fully responsive within the new Midnight visual presentation styles.

---

## Version 2.00

### Main UI Redesign
- Reworked the main Decor Vendor window into a section-based Home dashboard.
- Removed the old bottom tab navigation from the visible UI.
- Added large section cards for:
  - Vendors
  - Professions
  - Quests
  - Achievements
  - Boss Drops
  - Gallery Browser
- Added a `Home` button to return to the section menu at any time.
- Added a small bottom tip reminding users that `Home` returns to the section menu.
- Improved the main frame flow so selecting a section opens the original vendor/profession/quest/achievement/drop browser views.

### Welcome Panel Removed
- Removed the old one-time Welcome Panel.
- The new Home dashboard now acts as the main landing page for Decor Vendor.
- Simplified the startup/opening experience by opening directly into the main section menu.

### Gallery Browser Integration
- Updated the Gallery Browser card to open the Gallery directly from the new Home dashboard.
- Improved Gallery-to-Decor Vendor navigation so returning from the Gallery opens the main Decor Vendor Home dashboard correctly.
- Fixed an issue where opening Decor Vendor from the Gallery could show an empty main frame.
- Updated Gallery opening behavior so the main Decor Vendor frame hides when the Gallery is opened.
- Added/updated loading tips for the Gallery so users know the first load may take a moment.

### Upcoming Patch Decor Updates
- Continued adding and cleaning up upcoming patch décor data.
- Added additional PTR/upcoming décor records as they become available.
- Continued reviewing Housing Catalog differences between live/PTR builds.
- Improved handling for décor that may exist in addon data before appearing in the in-game Housing Catalog.
- Added better tracking for upcoming or hidden décor using fields such as:
  - `minInterface`
  - `unreleased`
  - `hideFromGallery`
  - `modelBroken`
- Continued cleanup of shop, promo, other, and unreleased source categories for upcoming patch testing.

### Data / Debug Cleanup
- Kept debug tools separated by addon module:
  - Decor Vendor debug tools remain in `DecorVendor`
  - shared data/catalog debug tools remain in `DecorVendor_Data`
  - Gallery debug and dump tools remain in `DecorVendor_Gallery`
- Improved workflow for checking ActiveItems against the current Housing Catalog.
- Improved handling for catalog records that may be hidden, removed, or disabled on PTR builds.
- Reduced unnecessary catalog status messages in chat for normal users.

### Fixes
- Fixed Home dashboard navigation not finding the original section handlers.
- Fixed the Gallery card not hiding the main Decor Vendor frame.
- Fixed Decor Vendor returning from Gallery into an empty frame.
- Fixed bottom tab logic so the old tab buttons can still power section switching internally while remaining hidden from the UI.
- Improved Home/dashboard visibility so the old sidebar and content area do not bleed through behind the Home panel.
- Improved header button layout after removing the old Gallery header button.
- Improved tip text placement and readability in the main frame.

### Notes
Version 2.00 is a major UI cleanup update. Decor Vendor now opens into a cleaner Home dashboard instead of relying on bottom tabs or a separate Welcome Panel.

Upcoming patch décor support is still being finalized as PTR data changes, especially for items that appear in datamined sources before they are fully available in the in-game Housing Catalog.


## Version 1.98

### Packaging / Addon Suite Updates

- Updated addon folder structure for CurseForge packaging.
- Renamed supporting modules for better CurseForge compatibility:
  - `DecorVendor_Data`
  - `DecorVendor_Gallery`
- Updated addon dependency references to use the new folder names.
- Updated Gallery loading logic so the main Decor Vendor addon correctly loads `DecorVendor_Gallery`.
- Added compatibility globals so older internal references can still use:
  - `DecorVendorData`
  - `DecorVendorGallery`

### Gallery Browser Fixes

- Fixed the Gallery button failing to open after the folder rename.
- Updated Gallery loader checks to use the correct load-on-demand addon name.
- Improved Gallery global lookup support for both old and new naming styles.
- Added safer fallback handling when opening the Gallery from the welcome screen.

### Data Module Updates

- Added alias support for the renamed data module.
- `DecorVendor_Data` now supports both:
  - `_G.DecorVendorData`
  - `_G.DecorVendor_Data`
- Improved shared data bridge compatibility between Decor Vendor and DecorVendor Gallery.

### Welcome Screen Updates

- Added a new welcome screen for Decor Vendor.
- Added a Gallery Browser development notice.
- Improved welcome screen readability and font sizing.
- Added buttons for opening Decor Vendor or launching the Gallery Browser.

### Fixes

- Fixed Gallery Browser load errors caused by the addon folder rename.
- Fixed incorrect addon name references in the Gallery loader.
- Fixed compatibility issues caused by CurseForge folder naming requirements.
- Improved multi-folder addon packaging support.

### Notes

Decor Vendor is now packaged as a multi-folder addon suite. The package includes:

- `DecorVendor`
- `DecorVendor_Data`
- `DecorVendor_Gallery`

All three folders should remain installed together for the full addon experience.