# Decor Vendor Changelog

### Version 2.29

* **Tips & Helpful Info Refreshed:** The Tips panel in Settings got a cleanup. The Vendor Decor tip now correctly says clicking an item shows its 3D model in the preview pane, and the Active/Inactive tip now explains that a vendor with no waypoint shows no status at all — it used to wrongly say it shows as Inactive.
* **Two New Tips:** Preview Decor on Click and Merchant Checkmarks now have their own sections, so the preview toggle and the collected-item checkmarks are explained in one place.
* **4 New Phrases for Translators:** Four new interface phrases were added for the new tips, bringing the total to 277. They'll appear on the CurseForge Localization page with this upload for anyone who wants to translate them.
* **Rexxar Wild Pack Moved:** The Zhevraskin Rug is no longer listed under Promos — the Champion of the Wilds promo ended, but the rug can still be bought in the in-game shop for 100 Hearthsteel, so it's now listed under Shop Decor instead.

### Version 2.28.1

* **Fixed: Home Screen Note Colour:** The note at the bottom of the Home screen was showing the raw text "|cffde9b6Note: ..." instead of coloured text, because a colour code was missing a digit. It's fixed — the note shows in its proper colour again.
* **Fixed: Merchant Window Error:** Talking to a merchant who sells a spell instead of an item (for example, the Silvermoon Court Voucher) could pop a Lua error from the merchant checkmark code. That's fixed — those merchants just show no checkmark now, and the error is gone.
* **Help Translate:** All of the addon's English phrases are now on the CurseForge Localization page — click Localization under Links on the Decor Vendor project page. Anyone who wants to translate Decor Vendor into another language can start there, right in the browser, no files needed. Russian, Spanish, German, French, Portuguese, and every other language are all welcome.

### Version 2.28

* **Localization — English First, Volunteers Welcome:** The addon is now set up for translation. All 274 interface phrases — every button, tab, tooltip, setting, and Gallery source label — live in one English file, and CurseForge's localization tool is turned on, so anyone who wants to help can translate on the CurseForge website and their translations come back with the next upload. The addon still ships in English for now.
* **Card Status Translated:** The vendor-card footer ("12 items • Active • Found") now translates too, so it shows in the player's language instead of always English. The green / amber colours for active and inactive vendors are unchanged.
* **Vol'dun Vendors Fixed:** Vol'dun vendors are now correctly listed under Battle for Azeroth in the expansion filter, instead of the wrong expansion.

### Version 2.27

* **Back to OG Dark Colours:** The whole addon is back to its original dark look — dark navy backgrounds, white text, gold titles, and steel-blue borders — instead of the purple chrome.
* **Expansion Filter Colours:** Every expansion in the left filter list now has its own distinct colour — Classic gold, Burning Crusade fel green, Wrath ice blue, Cataclysm lava, Mists jade, Warlords bronze, Legion fel purple, Battle for Azeroth orange, Shadowlands shadow purple, Dragonflight sky blue, The War Within amber, and Midnight stays purple — so you can tell them apart at a glance instead of all of them looking pale lavender / blue.
* **Inactive Status Colour:** Endeavor vendors that aren't active right now now show in warm amber instead of red, so red doesn't shout at you for something that isn't wrong. Active vendors still show in green.
* **Preview Decor on Click:** New option in Settings — "Preview decor on click" (on by default). Turn it off and clicking a vendor no longer swaps the preview, so the vendor stays put in the preview panel.
* **Missing Silvermoon Vendors Fixed:** Seven Silvermoon City vendors were hidden because of a profession check that hid any vendor with a profession your character hadn't learned. That check is gone — all vendors now show, whether you've learned their profession or not.
* **Removed: Shop Tab Code:** The old Shop tab code is gone — it was dead code, the tab itself was already turned off. All your shop items are still in the Gallery Browser, exactly where they were.

### Version 2.26

* **Holiday Decor Filters:** Holiday Decor now has its own section in the Gallery Browser, with separate checkboxes for Brewfest, Hallow's End, and Winter Veil (Currently hidden for now), so you can filter by just one holiday instead of all of them at once.
* **Holiday Sources Cleaned Up:** Holiday items are now listed under their correct holiday — Brewfest, Hallow's End, or Winter Veil — instead of a generic Holiday Decor source. Winter Veil is ready ahead of the event, even though its items aren't live yet.
* **Removed: Twitch Drop:** The Twitch Drop promo has been removed from the Options Menu and is now listed as a previous October drop like the others.


### Version 2.25

* **New Shop Decor: Grimtide Decor:** The new Grimtide Decor set from the in-game shop is now tracked in Decor Vendor, so it shows up in the Gallery.
* **Event Vendor Fix:** Fixed Halloween, the ipcoming Winter Veil, and Timewalking vendors getting stuck on "Loading..." when you first log in. They now load right away with working waypoints, and the calendar is checked in the background on login, so you no longer have to open it to unstuck them or update their Active / Inactive status.
* **Vendor Popup Fix:** Fixed vendor popup icons, names, and click-to-preview for decor-only items that don't have a regular item icon. (they again appear when clicking on them under each vendor)
* **No Preview Watermark:** Clicking a decor item with no preview asset now shows a clear "No Preview Available" watermark instead of a blank preview. (In the Main Decor Vendor)
* ** PTR Prep:** Talebound Decor have officially been added to the file and prices shown but mind you currently can only be tracked via live side as addons wont currently work in Talebound

### Version 2.24

* **New Look:** The minimap icon is now the golden spiral door from the Decor Vendor cottage, the gallery header bar has a warm bronzed-metal finish, and the addon list icon matches.
* **Pepe Fix:** Fixed Scarecrow Pepe showing two "Open Achievement" buttons in the gallery.
* **Under the Hood:** Reorganized the whole codebase from 40+ loose files into a handful of tidy folders. Nothing changes in how you use the addon — it just runs cleaner and makes future updates easier.
* **Gallery Action Button Fix:** Fixed the action button not showing for drop decor in the Gallery Browser, so boss and rare drops once again show their map and pins.
* **PTR Prep:** Patch 12.1.7 decor data now lives in its own PTR folder, ready to go live the moment the patch launches.

### Version 2.23

* **Profession Filter Section:** Added a dedicated Profession section to the gallery sidebar with full sub-category filtering for all crafting professions.
* **Halloween Decor:** Integrated seasonal Halloween decor items and collection support. Including the two permanent seasonal vendors and the four seasonal vendors for Halloween  one in each neighborhood faction and of course outside Undercity and Stormwind
* **Patch 12.1.7 Background Prep:** Laid the foundational data structures and groundwork for upcoming Patch 12.1.7 decor items.

### Version 2.20-2.22

* **Patch Day Data:** Officially ready for patch 12.1.5
* **TOC:** Updated the toc file

### Version 2.19

* **Patch Day Data Prep:** Finalized vendor prices, currency information, and data structures to prep everything for Tuesday's patch rollout.
* **Vendor Database Flattening:** Refactored `Gallery.VendorDetails` from a nested hierarchy into a clean, item-indexed flat structure for instantaneous lookups and reduced memory usage.
* **Sidebar UI Bugfix:** Resolved an issue where empty filter sections (such as "Upcoming Patch") left orphan headers visible in the gallery sidebar when containing zero items.
* **Shop Source Expansion:** Updated shop validation logic to correctly include `lushshop` and `blossomshop` item paths  as in allowing the action button  to allow you to click it to see that you can buy the item via the in game shop.
* **Added Twitch Drop: Golden Grrgle has been added so its already showing and in the events section of settings to tell you to watch 4 hours of wow content on twitch to earn it.

### 🌟 Version 2.17 — PTR Compatibility & UI Fixes

* **Patch 12.1.5 & PTR Updates:** 
  * Updated profession reagent icon rendering to use the modern `C_Item.GetItemIconByID` API, ensuring full compatibility with the latest client changes following the removal of deprecated global functions.
  * Optimized PTR data loading to safely merge items into existing category headers, preventing duplicate UI sections.
* **Preview & Fallback Improvements:**
  * Re-integrated the `DressUpItemLink` fallback for items flagged with missing 3D model assets (`skip3DPreview`), ensuring smooth inspection via the dress-up window.
* **Bug Fixes:**
  * Resolved Lua concatenation errors involving table-based `quest.id` structures in `QuestRows.lua`.
  * Various stability improvements and UI layout refinements.
  
## Version 2.16

### Holiday Decor Updates
* **Brewfest 2026 Rewards:**  Updated some of the codes from the Brewfest decor that came out including the third set of vendors that sell holiday decor 
* **Vendor Filters:**  Added  a Holiday Decor Filter that will display any vendors who sell holiday decor from neighborhoods to the holiday vendors outside major cities like Stormwind Orgrimmar and Ironforge.

## Version 2.14

### Blizzcon Updates
* **BlizzCon 2026 Rewards:**  Updated some of the codes from the Blizzcon decor that came out 

### PTR & Upcoming Patch Updates
* **Ptr Prep:**  Preparions for the upcoming 12.1.5 Patch as well as Holiday Preparations

## Version 2.13

### New Features & Expansions
* **World of Warcraft: Forever:** Added data mapping and source tracking for the exclusive housing decor items included with the *World of Warcraft: Forever* pre-purchase and collector's editions.
* **BlizzCon 2026 Rewards:** Added full dataset support and achievement tracking for the new BlizzCon 2026 doormat  decor.

### PTR & Upcoming Patch Updates
* **Faction-Split Quest Grouping:** Overhauled quest tracking logic (`DVD.IsQuestEffectivelyCompleted`) to support multi-ID tables, allowing faction-split dailies and questlines (such as *Cheese for Glowergold*) to share a single unified grid card while accurately reflecting completion status for both Alliance and Horde characters.
* **Uncached Data Handling:** Added robust fallback parsing for raw data IDs and upcoming PTR content to ensure smooth grid loading even when items are unreleased or unindexed by external databases.
* **Diagnostic & Debug Tooling:** Enhanced in-game achievement scanning commands and table structures to easily extract and verify upcoming patch IDs directly from the client UI.

## Version 2.12

### UI & Navigation
* **Unified Gallery Integration:** Removed the standalone "Shop Decor" tab, migrating all premium shop, pre-purchase, and promotional items directly into the main Gallery Browser with dedicated source tags.
* **Default Expansion View:** Updated the Vendors tab expansion filter to default to **Midnight** on startup, reducing initial scroll fatigue.
* **Clean Previews:** Removed the "Open Achievement Frame" button from the Achievement preview panel to streamline the layout.

### Filters & Sources
* **New Source Labels:** Added support for **"Past Charity"**, **"Lush Garden Pack"**, and **"Spring Blossom Pack"** filter options in the Gallery sidebar.
* **Expanded Aliases:** Updated source alias and priority mappings to ensure accurate categorization across vendor, quest, achievement, and shop datasets.

### Visual Styling & Colors
* **Color Palette Refresh:** Overhauled source label colors to strictly avoid blue, green, red, yellow, gold, purple, and white hues, implementing a polished set of orange, coral, and pink tones optimized for dark UI backgrounds.

### Data & Currencies
* **Brewfest Token Support:** Added currency icon mapping for Brewfest Prize Tokens (`37829`).

### Codebase Architecture
* **Modular Constants:** Split the monolithic constants file into separate, maintainable files (`Constants_Core.lua`, `Constants_Colors.lua`, and `Constants_Filters.lua`).
* **Global Debugging:** Exposed the `DVD` namespace globally (`_G.DVD`) to allow direct in-game chat testing and diagnostic commands.

## Version 2.12

### UI & Navigation
* **Unified Gallery Integration:** Removed the standalone "Shop Decor" tab since it was all in the Gallery Browser  part of the addon already
* **Default Expansion View:** Updated the Vendors, professions, quests and drops tabs expansion filter to default to **Midnight** on startup, reducing initial scroll fatigue.
* **Clean Previews:** Removed the "Open Achievement Frame" button from the Achievement preview panel to streamline the layout. As it would  randomly vanish anyways.

### Filters & Sources
* **New Source Labels:** Added support for **"Roofus Pack"**, **"Lush Garden Pack"**, **"Spring Blossom Pack"**, **"Holiday Decor"** and **"Pre Purchase"** filter options in the Gallery sidebar.
* **Expanded Aliases:** Updated source alias and priority mappings to ensure accurate categorization across vendor, quest, achievement, and shop datasets.

### Visual Styling & Colors
* **Color Palette testing:** Overhauled source label colors to strictly avoid blue, green, red, yellow, gold, purple, and white hues, implementing a polished set of orange, coral, and pink tones optimized for dark UI backgrounds. In the browser only!

### Data & Currencies
* **Brewfest Token Support:** Added currency icon mapping for Brewfest Prize Tokens (`37829`). For the Upcoming Brewfest items
* **12.1.5:** Currently adding Patch 12.1.5 decor in the backend ready to be intiated when it goes live.
* ** New Vendors Added:** The Holiday Hub vendors are added to the vendor list as well as the upcoming Brewfest Vendors for the neighborhoods the locations are all currently set to the Holiday Hub for each location.

### Codebase Architecture
* **Modular Constants:** Split the monolithic constants file into separate, maintainable files (`Constants.lua`, `Constants_Colors.lua`, and `Constants_Filters.lua`).
* **Global Debugging:** Exposed the `DVD` namespace globally (`_G.DVD`) to allow direct in-game chat testing and diagnostic commands.

## Version 2.11

* **Code Cleanup**: Streamlined backend data files, optimized active item tables, and cleaned up legacy debugging utility blocks. As well as condensed a bunch of the files.
* **New Additions**: Integrated upcoming Twitch drop decoration item and corresponding source metadata.
* **UI Updates**: Refreshed sidebar filter category colors for improved visual clarity and consistency.

**Currently  working on the favorite tab/ new UI design**

## Version 2.10

### NEW & UPDATED

• Updated more pricing info
• Hid certain decor that is currently not live yet.
• Ypdated some of the decor when it comes to filters and stuff
• Added the weekly housing  Quest item by The Last Architect I listed those particular decor items to his list and informing you of the requirements of needing a level 10 house to do the quest.
•  Using Waypoint UI works again with DecorVendor as  it relies on his code to be updated in order to correctly work.

### Looking into

• Adding a Blueprint and a favorites section.

## Version 2.09

### NEW & UPDATED

• Fixed map coords for the new Coiled Delves decor.
• Updated minimap icon.
• Currently updating prices of some vendor items

### Looking into

• WaypointUI is currently causing a bug when hitting the waypoint button please use TomTom until its sorted out

## Version 2.08

### NEW & UPDATED
• Added a brand-new **Shop Decor** section to the Home dashboard. You can now easily browse premium decor items.
• Added the 12.1 Decor in the Galler Browser you can view all of the new decor with the Patch 12.1 filter.
• Added dedicated sidebar filters for the new Shop section, allowing you to easily toggle between  In-Game Shop items, and Charity items some of them are currently not  avaiable due to being limited time.
• Upgraded the "Vendors" card on the Home dashboard to simultaneously display both the total number of NPCs *and* the total amount of decor they sell (e.g., "238 NPCs | 1,450 decor").
• Integrated Waypoint navigation buttons directly into the Quest preview panels. If a quest reward is tied to a specific vendor location, you can now drop a map pin straight from the quest tab.
• Reorganized the UI layout so Wowhead links, item notes, and waypoint buttons stack chronologically for a much cleaner top-to-bottom reading flow.
• All sections now show up as Cards  example in vendors  youll see the normal Headers for the zones but now underneath is bigger cards feautring the vendors. Same goes for Quests, Achievements, Drops, Professions and shop. The Gallery Browser is  a  good source if you want to know the actual prices for any of the vendor items consider it the backup browser.

### BUG FIXES & SYSTEM STREAMLINING
• **Routing File Cleanup:** Centralized all tab-switching and frame-routing logic into a dedicated `BottomTabs.lua` file, removing duplicate code from the main frame and improving the addon's load reliability.
• **TOC Architecture:** Fixed a missing file registration in the addon's `.toc` manifest that was causing some tab routing updates to be ignored by the game client.

### NOTES
Version 2.08 focuses heavily on UI stability and QoL improvements. The addition of the Shop Decor dashboard card balances out the main menu beautifully while giving Trading Post and Premium items the dedicated tracking space they deserve.

## Version 2.07

### NEW & UPDATED
• Added the Blizzcon Decor 
• Added support for Neighborhood Endeavor vendors.
• Endeavor vendors now update dynamically based on the neighborhood or plot currently selected in the Housing Dashboard.
• Active Endeavor vendors display their correct neighborhood location and support waypoint navigation Remember be on that zone for right click and waypoint to route you correctly.
• Inactive Endeavor vendors are clearly marked amd will not show a waypoint button and right click will say the vendor is currently inactive.
• Added persistent neighborhood-location tracking so previously visited plots remain recognized after reloading or logging back in.

### GALLERY BROWSER
• Improved Gallery Browser navigation for vendors with rotating or neighborhood-specific locations.
• Shop-sourced decorations are now identified without attempting to automatically open the protected in-game shop interface. Basically prints a message telling you  to open it manually.
• Updated the shop action with instructions for opening Blizzard’s Shop button manually.
• Improved first-session Housing Catalog loading behavior and related messaging.

### OPTIONS & HELP
• Updated the Helpful Information page with instructions for Neighborhood Endeavor vendors.
• Improved Tips panel text wrapping and spacing.
• Added scrolling support so all help sections remain readable at smaller Settings window sizes.
• Removed Stats Panel for now will be back in a future Update
• Looking into adding a wishlist or Favorite section but not sure

### DATA & COMPATIBILITY
• Added data and framework support for the upcoming Patch 12.1 decorations.
• Patch 12.1 items are currently hidden until they become available on live servers.
• Improved filtering so unreleased items do not appear in vendor lists, searches, previews, or collection results except showing the current number of estimated Patch 12.1  decor in the Gallery Filter section.

### BUG FIXES
• Additional cleanup and stability improvements throughout the main addon and Gallery Browser.

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