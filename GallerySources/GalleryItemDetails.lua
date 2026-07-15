-- ============================================================
-- Decor Vendor Gallery
-- Data/GalleryItemDetails.lua
-- Gallery-only item details and display overrides
--
-- IMPORTANT:
-- Use ITEM ID as the table key, not decorID.
--
-- This file is for gallery-only info such as:
-- price text, requirements, quest unlocks, direct quest rewards,
-- achievement IDs, notes, or display overrides that the main
-- Decor Vendor frame does not need.
--
-- ActiveItems should still handle:
-- itemID -> decorID, model3D, source, soldBy
--
-- Naming rule:
--
-- questID / questName
-- = the item is earned directly from a quest.
--
-- ============================================================

local addonName, DVD = ...

DVD.ItemDetails = DVD.ItemDetails or {}

local Gallery = DVD

Gallery.ItemDetails = Gallery.ItemDetails or {}


Gallery.ItemDetails[262453] = {note = "Rank 6 House to buy"}

do --Founder's Point quests
Gallery.ItemDetails[245375] = { questId = 92437, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245384] = { questId = 92961, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245355] = { questId = 92962, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245356] = { questId = 92963, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245376] = { questId = 92964, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[235523] = { questId = 92965, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[236676] = { questId = 92966, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[236678] = { questId = 92967, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[236677] = { questId = 92968, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[242951] = { questId = 92969, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246742] = { questId = 92970, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246104] = { questId = 92971, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246103] = { questId = 92972, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246101] = { questId = 92973, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246246] = { questId = 92974, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246245] = { questId = 92975, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246243] = { questId = 92976, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245548] = { questId = 92977, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[243334] = { questId = 92978, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245334] = { questId = 92979, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245556] = { questId = 92980, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245547] = { questId = 92981, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244531] = { questId = 92982, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245372] = { questId = 92983, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245336] = { questId = 92984, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246106] = { questId = 92985, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[239075] = { questId = 92986, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[235677] = { questId = 92987, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[235675] = { questId = 92988, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[253589] = { questId = 92989, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246258] = { questId = 92990, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246254] = { questId = 92991, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245578] = { questId = 92992, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245576] = { questId = 92993, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245575] = { questId = 92994, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[255650] = { questId = 92995, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246502] = { questId = 92996, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246107] = { questId = 92997, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246102] = { questId = 92998, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245662] = { questId = 92999, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[241618] = { questId = 93000, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244782] = { questId = 93001, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[253490] = { questId = 93002, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[257690] = { questId = 93003, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244780] = { questId = 93004, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[253441] = { questId = 93005, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[253479] = { questId = 93006, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[253181] = { questId = 93007, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[235994] = { questId = 93008, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246255] = { questId = 93009, questName = "Decor Treasure Hunt" }
end

do--Razorwind Shores quests
Gallery.ItemDetails[236654] = { questId = 93073, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[236655] = { questId = 93074, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[236666] = { questId = 93075, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244532] = { questId = 93077, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244533] = { questId = 93078, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244534] = { questId = 93079, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245266] = { questId = 93080, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245532] = { questId = 93081, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245533] = { questId = 93082, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245545] = { questId = 93083, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245546] = { questId = 93084, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246259] = { questId = 93085, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246260] = { questId = 93087, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246261] = { questId = 93088, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246036] = { questId = 93091, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246217] = { questId = 93097, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246218] = { questId = 93098, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246224] = { questId = 93099, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246587] = { questId = 93100, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246687] = { questId = 93101, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[250920] = { questId = 93102, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246241] = { questId = 93103, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246880] = { questId = 93104, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246883] = { questId = 93105, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[247221] = { questId = 93106, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[248246] = { questId = 93107, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[251973] = { questId = 93108, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245680] = { questId = 93109, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245398] = { questId = 93110, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245555] = { questId = 93111, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246614] = { questId = 93115, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246868] = { questId = 93131, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246869] = { questId = 93132, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246882] = { questId = 93133, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[248760] = { questId = 93134, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245581] = { questId = 93135, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245583] = { questId = 93136, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[245649] = { questId = 93137, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246250] = { questId = 93138, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246253] = { questId = 93139, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[246249] = { questId = 93140, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[251981] = { questId = 93141, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[257691] = { questId = 93142, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[241617] = { questId = 93143, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[253493] = { questId = 93147, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[244169] = { questId = 93148, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[243495] = { questId = 93149, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[241620] = { questId = 93150, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[257692] = { questId = 93151, questName = "Decor Treasure Hunt" }
Gallery.ItemDetails[241621] = { questId = 93152, questName = "Decor Treasure Hunt" }
end	

do-- Quests
Gallery.ItemDetails[248797] = { questID = 26229, questName = "\"I TAKE Candle!\"" }
Gallery.ItemDetails[247223] = { questID = 67063, questName = "10,000 Years of Roasting" }
Gallery.ItemDetails[256673] = { questID = 7604, questName = "A Binding Contract" }
Gallery.ItemDetails[253542] = { questID = 92319, questName = "A Favor to Axe" }
Gallery.ItemDetails[253598] = { questID = 92321, questName = "A Frostbitten Tally" }
Gallery.ItemDetails[258741] = { questID = 35671, questName = "A Gathering of Shadows" }
Gallery.ItemDetails[253174] = { questID = 92327, questName = "A Generational Moment" }
Gallery.ItemDetails[253543] = { questID = 92327, questName = "A Generational Moment" }
Gallery.ItemDetails[248653] = { questID = 71097, questName = "A Helping Claw" }
Gallery.ItemDetails[246863] = { questID = 66001, questName = "A Last Hope" }
Gallery.ItemDetails[254878] = { questID = 86891, questName = "A Last Resort" }
Gallery.ItemDetails[264508] = { questID = 86557, questName = "A Matter of Strife and Death" }
Gallery.ItemDetails[257352] = { questID = 77283, questName = "A Multi-Front Battle" }
Gallery.ItemDetails[245411] = { questID = 38882, questName = "A New Life for Undeath" }
Gallery.ItemDetails[245422] = { questID = 47691, questName = "A Non-Prophet Organization" }
Gallery.ItemDetails[262472] = { questID = 86561, questName = "A Strange, Different World" }
Gallery.ItemDetails[245308] = { questID = 87008, questName = "Ad-Hoc Wedding Planner" }
Gallery.ItemDetails[267082] = { questID = 86516, questName = "All Become Prey" }
Gallery.ItemDetails[252403] = { questID = 53720, questName = "Allegiance of Kul Tiras" }
Gallery.ItemDetails[263196] = { questID = 88995, questName = "Aln'hara's Bloom" }
Gallery.ItemDetails[264334] = { questID = 86711, questName = "Amani Clarion Call" }
Gallery.ItemDetails[247914] = { questID = 44052, questName = "And They Will Tremble" }
Gallery.ItemDetails[248335] = { questID = 36202, questName = "Anglin' In Our Garrison" }
Gallery.ItemDetails[248651] = { questID = 72935, questName = "Archives Return" }
Gallery.ItemDetails[249549] = { questID = 72515, questName = "Augmenting a Dragon" }
Gallery.ItemDetails[246422] = { questID = 26868, questName = "Axis of Awful" }
Gallery.ItemDetails[252756] = { questID = 79530, questName = "Bad Business" }
Gallery.ItemDetails[244653] = { questID = 36592, questName = "Bigger is Better" }
Gallery.ItemDetails[248661] = { questID = 36592, questName = "Bigger is Better" }
Gallery.ItemDetails[257722] = { questID = 39426, questName = "Blood Debt" }
Gallery.ItemDetails[251480] = { questID = 44004, questName = "Bringer of the Light" }
Gallery.ItemDetails[258265] = { questID = 80516, questName = "Bump off the Boss" }
Gallery.ItemDetails[254319] = { questID = 86866, questName = "Can We Heal This?" }
Gallery.ItemDetails[252395] = { questID = 51401, questName = "Carry On" }
Gallery.ItemDetails[243321] = { questID = 87297, questName = "Cashing the Check" }
Gallery.ItemDetails[258145] = { questID = 13103, questIDs = { 13103, 13115 }, questName = "Cheese for Glowergold", note = "Alliance/Horde versions both unlock this decor." }
Gallery.ItemDetails[253172] = { questID = 83160, questName = "Cinderbrew Reserve" }
Gallery.ItemDetails[245417] = { questID = 47874, questName = "Clearing the Fog" }
Gallery.ItemDetails[248334] = { questID = 36404, questName = "Clearing the Garden" }
Gallery.ItemDetails[245624] = { questID = 26760, questName = "Cry For The Moon" }
Gallery.ItemDetails[245427] = { questID = 53566, questName = "Dark Iron Dwarves" }
Gallery.ItemDetails[255648] = { questID = 86693, questName = "De Legend of de Hash'ey" }
Gallery.ItemDetails[264480] = { questID = 86681, questName = "Den of Nalorakk: A Taste of Vengeance" }
Gallery.ItemDetails[264481] = { questID = 86681, questName = "Den of Nalorakk: A Taste of Vengeance" }
Gallery.ItemDetails[246407] = { questID = 86857, questName = "Descent into the Rift" }
Gallery.ItemDetails[248622] = { questID = 12227, questName = "Doing Your Duty" }
Gallery.ItemDetails[248116] = { questID = 92578, questName = "Draconic Decor" }
Gallery.ItemDetails[245259] = { questID = 92577, questName = "Dreamy Inspiration" }
Gallery.ItemDetails[246415] = { questID = 86911, questName = "Echoes and Memories" }
Gallery.ItemDetails[257723] = { questID = 39305, questName = "Empty Nest" }
Gallery.ItemDetails[248621] = { questID = 26390, questName = "Ending the Invasion!" }
Gallery.ItemDetails[256429] = { questID = 70745, questName = "Enforced Relaxation" }
Gallery.ItemDetails[245443] = { questID = 34586, questName = "Establish Your Garrison" }
Gallery.ItemDetails[248799] = { questID = 34586, questName = "Establish Your Garrison" }
Gallery.ItemDetails[246427] = { questID = 28244, questName = "Eye Spy" }
Gallery.ItemDetails[262351] = { questID = 86513, questName = "Face the Tide" }
Gallery.ItemDetails[264248] = { questID = 86739, questName = "Fairbreeze Favors" }
Gallery.ItemDetails[245701] = { questID = 40321, questName = "Feathersong's Redemption" }
Gallery.ItemDetails[264657] = { questID = 86530, questName = "First, The Shells" }
Gallery.ItemDetails[257418] = { questID = 92025, questName = "Flowers for Amalthea" }
Gallery.ItemDetails[251914] = { questID = 88941, questName = "For Quel'Thalas" }
Gallery.ItemDetails[251478] = { questID = 35196, questName = "Forging Ahead" }
Gallery.ItemDetails[244538] = { questID = 86650, questName = "Fractured" }
Gallery.ItemDetails[265106] = { questID = 90867, questName = "From Darkness, Light" }
Gallery.ItemDetails[265631] = { questID = 90867, questName = "From Darkness, Light" }
Gallery.ItemDetails[263020] = { questID = 90834, questName = "From This Point Forward" }
Gallery.ItemDetails[253173] = { questID = 92572, questName = "Furniture Favor" }
Gallery.ItemDetails[264255] = { questID = 86654, questName = "Gnarldin Bashing" }
Gallery.ItemDetails[245535] = { questID = 86973, questName = "Halting Harm in Har'mara" }
Gallery.ItemDetails[245491] = { questID = 50808, questName = "Halting the Empire's Fall" }
Gallery.ItemDetails[263038] = { questID = 96507, questName = "Haranir Reclined Bed" }
Gallery.ItemDetails[253021] = { questID = 78999, questName = "Heart of a Hero" }
Gallery.ItemDetails[253544] = { questID = 92325, questName = "Hellscream's Heritage" }
Gallery.ItemDetails[252045] = { questID = 86861, questName = "Herding Manifestations" }
Gallery.ItemDetails[248401] = { questID = 76213, questName = "Honor of the Goddess" }
Gallery.ItemDetails[253035] = { questID = 79703, questName = "Hope, An Anomaly" }
Gallery.ItemDetails[258748] = { questID = 35273, questName = "Hot Seat" }
Gallery.ItemDetails[257397] = { questID = 39992, questName = "Huln's War - The Nathrezim" }
Gallery.ItemDetails[253467] = { questID = 86867, questName = "Into the Lightbloom" }
Gallery.ItemDetails[253020] = { questID = 78761, questName = "Into the Machine" }
Gallery.ItemDetails[258267] = { questID = 79565, questName = "Janky Candles" }
Gallery.ItemDetails[267209] = { questID = 86541, questName = "Just In Case..." }
Gallery.ItemDetails[248810] = { questID = 35176, questName = "Keeping it Together" }
Gallery.ItemDetails[248938] = { questID = 60, questName = "Kobold Candles" }
Gallery.ItemDetails[258742] = { questID = 33582, questName = "Kura's Vengeance" }
Gallery.ItemDetails[247915] = { questID = 92581, questName = "Last Light" }
Gallery.ItemDetails[245438] = { questID = 33527, questName = "Last Steps" }
Gallery.ItemDetails[247234] = { questID = 86896, questName = "Light Finds a Way" }
Gallery.ItemDetails[245992] = { questID = 86741, questName = "Lightbloom Looming" }
Gallery.ItemDetails[245504] = { questID = 27098, questName = "Lordaeron" }
Gallery.ItemDetails[245505] = { questID = 27098, questName = "Lordaeron" }
Gallery.ItemDetails[248663] = { questID = 30526, questName = "Lost and Lonely" }
Gallery.ItemDetails[260582] = { questID = 86820, questName = "Manaforge Omega: Dimensius Looms" }
Gallery.ItemDetails[245258] = { questID = 42751, questName = "Moon Reaver" }
Gallery.ItemDetails[256905] = { questID = 26754, questName = "Morbent's Bane" }
Gallery.ItemDetails[252754] = { questID = 55045, questName = "My Brother's Keeper" }
Gallery.ItemDetails[245306] = { questID = 86408, questName = "My Hole in the Wall" }
Gallery.ItemDetails[248800] = { questID = 36615, questName = "My Very Own Castle" }
Gallery.ItemDetails[244315] = { questID = 36614, questName = "My Very Own Fortress" }
Gallery.ItemDetails[258264] = { questID = 78642, questName = "New Candle, New Hope" }
Gallery.ItemDetails[262606] = { questID = 86521, questName = "Nexus-Point Xenas: Eclipse" }
Gallery.ItemDetails[264660] = { questID = 88706, questName = "Nothing Stands Forever" }
Gallery.ItemDetails[245485] = { questID = 50963, questName = "Of Dark Deeds and Dark Days" }
Gallery.ItemDetails[258221] = { questID = 40230, questName = "Oh, the Clawdacity!" }
Gallery.ItemDetails[250912] = { questID = 76597, questName = "On New Wings" }
Gallery.ItemDetails[253040] = { questID = 82144, questName = "On the Road" }
Gallery.ItemDetails[247858] = { questID = 32816, questName = "Path of the Last Emperor" }
Gallery.ItemDetails[263231] = { questID = 86735, questName = "Paved in Ash" }
Gallery.ItemDetails[244320] = { questID = 33470, questName = "Pool of Visions" }
Gallery.ItemDetails[257412] = { questID = 27550, questName = "Pyrewood's Fall" }
Gallery.ItemDetails[245620] = { questID = 14402, questName = "Ready to Go" }
Gallery.ItemDetails[248798] = { questID = 54, questName = "Report to Goldshire" }
Gallery.ItemDetails[256331] = { questID = 28183, questName = "Return to Keeshan" }
Gallery.ItemDetails[245465] = { questID = 51985, questName = "Return to Zuldazar" }
Gallery.ItemDetails[245473] = { questID = 51985, questName = "Return to Zuldazar" }
Gallery.ItemDetails[245475] = { questID = 51985, questName = "Return to Zuldazar" }
Gallery.ItemDetails[245303] = { questID = 85780, questName = "Right Where We Want Him" }
Gallery.ItemDetails[264178] = { questID = 91589, questName = "Root Dash Delivery" }
Gallery.ItemDetails[263041] = { questID = 12227, questName = "Root of the World" }
Gallery.ItemDetails[262906] = { questID = 88997, questName = "Russula's Outreach" }
Gallery.ItemDetails[260700] = { questID = 84675, questName = "Showdown in the Attic" }
Gallery.ItemDetails[247842] = { questID = 44756, questName = "Sign of the Dusk Lily" }
Gallery.ItemDetails[253443] = { questID = 12227, questName = "Sky's Hope" }
Gallery.ItemDetails[251653] = { questID = 35685, questName = "Socrethar's Demise" }
Gallery.ItemDetails[245616] = { questID = 46107, questName = "Source of the Corruption" }
Gallery.ItemDetails[246487] = { questID = 92580, questName = "Spare A Chair" }
Gallery.ItemDetails[239606] = { questID = 46931, questName = "Speaker of the Horde" }
Gallery.ItemDetails[253178] = { questID = 92320, questName = "Still Behind Enemy Portals" }
Gallery.ItemDetails[252655] = { questID = 50611, questName = "Storm's Vengeance" }
Gallery.ItemDetails[258220] = { questID = 11566, questName = "Surrender... Not!" }
Gallery.ItemDetails[248009] = { questID = 42489, questName = "Thalyssra's Drawers" }
Gallery.ItemDetails[245488] = { questID = 47188, questName = "The Aid of the Loa" }
Gallery.ItemDetails[264257] = { questID = 86712, questName = "The Amani Stand Strong" }
Gallery.ItemDetails[258749] = { questID = 35896, questName = "The Avatar of Terokk" }
Gallery.ItemDetails[245456] = { questID = 39579, questName = "The Backdoor" }
Gallery.ItemDetails[245486] = { questID = 47432, questName = "The Bargain is Struck" }
Gallery.ItemDetails[251640] = { questID = 34099, questName = "The Battle for Shattrath" }
Gallery.ItemDetails[245466] = { questID = 51601, questName = "The Bridgeport Ride" }
Gallery.ItemDetails[263315] = { questID = 88994, questName = "The Cauldron of Echoes" }
Gallery.ItemDetails[245425] = { questID = 35396, questName = "The Dark Heart of Oshu'gun" }
Gallery.ItemDetails[248801] = { questID = 26297, questName = "The Dawning of a New Day" }
Gallery.ItemDetails[251654] = { questID = 33256, questName = "The Defense of Karabor" }
Gallery.ItemDetails[245700] = { questID = 38663, questName = "The Die is Cast" }
Gallery.ItemDetails[264262] = { questID = 88996, questName = "The Echoless Flame" }
Gallery.ItemDetails[246458] = { questID = 88942, questName = "The Elves are Going to War" }
Gallery.ItemDetails[253527] = { questID = 114, questName = "The Escape" }
Gallery.ItemDetails[244783] = { questID = 90907, questName = "The First to Know" }
Gallery.ItemDetails[245409] = { questID = 39496, questName = "The Flow of the River" }
Gallery.ItemDetails[253179] = { questID = 92326, questName = "The Fragrance of the Dunes" }
Gallery.ItemDetails[253700] = { questID = 92326, questName = "The Fragrance of the Dunes" }
Gallery.ItemDetails[266259] = { questID = 86851, questName = "The Foundation of Aln" }
Gallery.ItemDetails[264659] = { questID = 86512, questName = "The Harvest" }
Gallery.ItemDetails[246864] = { questID = 37470, questName = "The Head of the Snake" }
Gallery.ItemDetails[253485] = { questID = 90493, questName = "The Heart of Tranquillien" }
Gallery.ItemDetails[264362] = { questID = 30000, questName = "The Jade Serpent" }
Gallery.ItemDetails[264349] = { questID = 30612, questName = "The Leader Hozen" }
Gallery.ItemDetails[247917] = { questID = 41915, questName = "The Master's Legacy" }
Gallery.ItemDetails[245333] = { questID = 28035, questName = "The Mountain-Lord's Support" }
Gallery.ItemDetails[245698] = { questID = 40573, questName = "The Nightmare Lord" }
Gallery.ItemDetails[245699] = { questID = 40573, questName = "The Nightmare Lord" }
Gallery.ItemDetails[248662] = { questID = 543, questName = "The Perenolde Tiara" }
Gallery.ItemDetails[251022] = { questID = 78864, questName = "The Returning" }
Gallery.ItemDetails[256903] = { questID = 28337, questName = "The Shredders of Irontree" }
Gallery.ItemDetails[257401] = { questID = 39387, questName = "The Skies of Highmountain" }
Gallery.ItemDetails[246701] = { questID = 54992, questName = "The Start of Something Bigger" }
Gallery.ItemDetails[251330] = { questID = 34792, questName = "The Traitor's True Name" }
Gallery.ItemDetails[251548] = { questID = 34792, questName = "The Traitor's True Name" }
Gallery.ItemDetails[262614] = { questID = 86956, questName = "The Traveling Flowers" }
Gallery.ItemDetails[251477] = { questID = 36169, questName = "The Trial of Champions" }
Gallery.ItemDetails[253034] = { questID = 82895, questName = "The Weight of Duty" }
Gallery.ItemDetails[258262] = { questID = 79510, questName = "The Wickless Candle" }
Gallery.ItemDetails[244316] = { questID = 34192, questName = "Things Are Not Goren Our Way" }
Gallery.ItemDetails[248660] = { questID = 34192, questName = "Things Are Not Goren Our Way" }
Gallery.ItemDetails[264340] = { questID = 86540, questName = "Third, Blow It Up" }
Gallery.ItemDetails[253176] = { questID = 92322, questName = "Timear Foresees a Proof of Demise!" }
Gallery.ItemDetails[248655] = { questID = 70880, questName = "To Cook With Finery" }
Gallery.ItemDetails[260583] = { questID = 82141, questName = "To Kill a Queen" }
Gallery.ItemDetails[253166] = { questID = 78759, questName = "To Wake a Giant" }
Gallery.ItemDetails[262610] = { questID = 88700, questName = "Two Tons of Metal and Holy Fire" }
Gallery.ItemDetails[253177] = { questID = 92324, questName = "Uncrowned's Cold Case" }
Gallery.ItemDetails[245325] = { questID = 85711, questName = "Unsolicited Feedback" }
Gallery.ItemDetails[246851] = { questID = 84996, questName = "Vereesa's Tale" }
Gallery.ItemDetails[245558] = { questID = 44955, questName = "Visitor in Shal'Aran" }
Gallery.ItemDetails[243335] = { questID = 26397, questName = "Walk With The Earth Mother" }
Gallery.ItemDetails[252400] = { questID = 53887, questName = "War Marches On" }
Gallery.ItemDetails[246706] = { questID = 67047, questName = "Warm Away These Shivers" }
Gallery.ItemDetails[245489] = { questID = 47250, questName = "We'll Meet Again" }
Gallery.ItemDetails[246409] = { questID = 28064, questName = "Welcome to the Brotherhood" }
Gallery.ItemDetails[246703] = { questID = 55736, questName = "Welcome to the Resistance" }
Gallery.ItemDetails[263037] = { questID = 88993, questName = "Wey'nan's Ward" }
Gallery.ItemDetails[258745] = { questID = 35704, questName = "When All Is Aligned" }
Gallery.ItemDetails[253175] = { questID = 92323, questName = "Where the Fire Once Burned" }
Gallery.ItemDetails[246428] = { questID = 28655, questName = "Wild, Wild, Wildhammer Wedding" }
Gallery.ItemDetails[245470] = { questID = 52978, questName = "With Prince in Tow" }
Gallery.ItemDetails[263240] = { questID = 86531, questName = "Work Disruption" }
Gallery.ItemDetails[248618] = { questID = 26270, questName = "You Have Our Thanks" }
end

do-- Achievements

-- Achievement Category: Alterac Valley
Gallery.ItemDetails[247758] = { achievementID = 221, achievementName = "Alterac Grave Robber", achievementCategory = "Alterac Valley" }
Gallery.ItemDetails[247760] = { achievementID = 222, achievementName = "Tower Defense", achievementCategory = "Alterac Valley" }

-- Achievement Category: Arathi Basin
Gallery.ItemDetails[247757] = { achievementID = 158, achievementName = "Me and the Cappin' Makin' It Happen", achievementCategory = "Arathi Basin" }
Gallery.ItemDetails[247759] = { achievementID = 1153, achievementName = "Overly Defensive", achievementCategory = "Arathi Basin" }

-- Achievement Category: Archaeology
Gallery.ItemDetails[245426] = { achievementID = 4859, achievementName = "Kings Under the Mountain", achievementCategory = "Archaeology" }
Gallery.ItemDetails[258740] = { achievementID = 9415, achievementName = "Secrets of Skettis", achievementCategory = "Archaeology" }

-- Achievement Category: Battle Dungeon
Gallery.ItemDetails[246479] = { achievementID = 13723, achievementName = "M.C., Hammered", achievementCategory = "Battle Dungeon" }

-- Achievement Category: Battle for Azeroth
Gallery.ItemDetails[245271] = { achievementID = 12582, achievementName = "Come Sail Away", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[246483] = { achievementID = 13473, achievementName = "Diversified Investments", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[244326] = { achievementID = 13018, achievementName = "Dune Rider", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[245476] = { achievementID = 13284, achievementName = "Frontline Warrior", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[246598] = { achievementID = 13477, achievementName = "Junkyard Apprentice", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[246603] = { achievementID = 13475, achievementName = "Junkyard Scavenger", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[245497] = { achievementID = 12614, achievementName = "Loa Expectations", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[245494] = { achievementID = 13039, achievementName = "Paku'ai", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[245487] = { achievementID = 13038, achievementName = "Raptari Rider", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[241062] = { achievementID = 12509, achievementName = "Ready for War", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[252653] = { achievementID = 13049, achievementName = "The Long Con", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[252654] = { achievementID = 12997, achievementName = "The Pride of Kul Tiras", achievementCategory = "Battle for Azeroth" }
Gallery.ItemDetails[245522] = { achievementID = 12479, achievementName = "Zandalar Forever!", achievementCategory = "Battle for Azeroth" }

-- Achievement Category: Battle for Gilneas
Gallery.ItemDetails[256896] = { achievementID = 5245, achievementName = "Battle for Gilneas Victory", achievementCategory = "Battle for Gilneas" }

-- Achievement Category: Cooking
Gallery.ItemDetails[244325] = { achievementID = 12746, achievementName = "The Zandalari Menu", achievementCategory = "Cooking" }

-- Achievement Category: Deephaul Ravine
Gallery.ItemDetails[253170] = { achievementID = 40210, achievementName = "Deephaul Ravine Victory", achievementCategory = "Deephaul Ravine" }
Gallery.ItemDetails[247750] = { achievementID = 40612, achievementName = "Sprinting in the Ravine", achievementCategory = "Deephaul Ravine" }

-- Achievement Category: Dragon Isles
Gallery.ItemDetails[248656] = { achievementID = 17529, achievementName = "Forbidden Spoils", achievementCategory = "Dragon Isles" }

-- Achievement Category: Dragonflight
Gallery.ItemDetails[248104] = { achievementID = 17773, achievementName = "A Blue Dawn", achievementCategory = "Dragonflight" }
Gallery.ItemDetails[248105] = { achievementID = 19507, achievementName = "Fringe Benefits", achievementCategory = "Dragonflight" }
Gallery.ItemDetails[245520] = { achievementID = 19719, achievementName = "Reclamation of Gilneas", achievementCategory = "Dragonflight" }

-- Achievement Category: Eastern Kingdoms
Gallery.ItemDetails[248796] = { achievementID = 5442, achievementName = "Full Caravan", achievementCategory = "Eastern Kingdoms" }
Gallery.ItemDetails[248808] = { achievementID = 940, achievementName = "The Green Hills of Stranglethorn", achievementCategory = "Eastern Kingdoms" }

-- Achievement Category: Expansion Features
Gallery.ItemDetails[248124] = { achievementID = 19458, achievementName = "A World Awoken", achievementCategory = "Expansion Features" }
Gallery.ItemDetails[248125] = { achievementID = 20501, achievementName = "Back from the Beyond", achievementCategory = "Expansion Features" }
Gallery.ItemDetails[257353] = { achievementID = 61451, achievementName = "Worldsoul-Searching", achievementCategory = "Expansion Features" }

-- Achievement Category: Eye of the Storm
Gallery.ItemDetails[247761] = { achievementID = 212, achievementName = "Storm Capper", achievementCategory = "Eye of the Storm" }
Gallery.ItemDetails[247762] = { achievementID = 213, achievementName = "Stormtrooper", achievementCategory = "Eye of the Storm" }

--Achievement Category Feats of Strength
Gallery.ItemDetails[260785] = { achievementID = 62387, achievementName = "It's Nearly Midnight", achievementCategory = "Events"} 

-- Achievement Category: Harandar
Gallery.ItemDetails[265792] = { achievementID = 62290, achievementName = "Harandar: The Highest Peaks", achievementCategory = "Midnight" }

-- Achievement Category: Legion
Gallery.ItemDetails[257721] = { achievementID = 10398, achievementName = "Drum Circle", achievementCategory = "Legion" }
Gallery.ItemDetails[245448] = { achievementID = 11124, achievementName = "Good Suramaritan", achievementCategory = "Legion" }
Gallery.ItemDetails[247843] = { achievementID = 11340, achievementName = "Insurrection", achievementCategory = "Legion" }
Gallery.ItemDetails[245697] = { achievementID = 10698, achievementName = "That's Val'sharah Folks!", achievementCategory = "Legion" }
Gallery.ItemDetails[245460] = { achievementID = 11257, achievementName = "Treasures of Highmountain", achievementCategory = "Legion" }
Gallery.ItemDetails[245703] = { achievementID = 11258, achievementName = "Treasures of Val'sharah", achievementCategory = "Legion" }

-- Achievement Category: Legion Class Hall
Gallery.ItemDetails[250134] = { achievementID = 42289, achievementName = "Hidden Potential of the Archdruid", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250306] = { achievementID = 42291, achievementName = "Hidden Potential of the Archmage", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249458] = { achievementID = 42298, achievementName = "Hidden Potential of the Battlelord", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250123] = { achievementID = 42287, achievementName = "Hidden Potential of the Deathlord", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250914] = { achievementID = 42296, achievementName = "Hidden Potential of the Farseer", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[262619] = { achievementID = 42292, achievementName = "Hidden Potential of the Grandmaster", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250790] = { achievementID = 42294, achievementName = "Hidden Potential of the High Priest", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250230] = { achievementID = 42293, achievementName = "Hidden Potential of the Highlord", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250125] = { achievementID = 42290, achievementName = "Hidden Potential of the Huntmaster", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[248940] = { achievementID = 42297, achievementName = "Hidden Potential of the Netherlord", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250787] = { achievementID = 42295, achievementName = "Hidden Potential of the Shadowblade", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249457] = { achievementID = 42288, achievementName = "Hidden Potential of the Slayer", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[256679] = { achievementID = 60967, achievementName = "Legendary Research of Five Dawns", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[256907] = { achievementID = 60972, achievementName = "Legendary Research of the Black Harvest", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250111] = { achievementID = 60964, achievementName = "Legendary Research of the Dreamgrove", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[260584] = { achievementID = 60962, achievementName = "Legendary Research of the Ebon Blade", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249690] = { achievementID = 60963, achievementName = "Legendary Research of the Illidari", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250915] = { achievementID = 60971, achievementName = "Legendary Research of the Maelstrom", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250791] = { achievementID = 60969, achievementName = "Legendary Research of the Netherlight Conclave", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250233] = { achievementID = 60968, achievementName = "Legendary Research of the Silver Hand", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[256674] = { achievementID = 60966, achievementName = "Legendary Research of the Tirisgarde", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250788] = { achievementID = 60970, achievementName = "Legendary Research of the Uncrowned", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250127] = { achievementID = 60965, achievementName = "Legendary Research of the Unseen Path", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[257396] = { achievementID = 60973, achievementName = "Legendary Research of the Valarjar", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250112] = { achievementID = 60981, achievementName = "Raise an Army for Acherus", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249461] = { achievementID = 60992, achievementName = "Raise an Army for Skyhold", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[264242] = { achievementID = 60991, achievementName = "Raise an Army for the Dreadscar Rift", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[251013] = { achievementID = 60983, achievementName = "Raise an Army for the Dreamgrove", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249518] = { achievementID = 60982, achievementName = "Raise an Army for the Fel Hammer", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250786] = { achievementID = 60989, achievementName = "Raise an Army for the Hall of Shadows", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250131] = { achievementID = 60985, achievementName = "Raise an Army for the Hall of the Guardian", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[251014] = { achievementID = 60990, achievementName = "Raise an Army for the Maelstrom", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[251636] = { achievementID = 60988, achievementName = "Raise an Army for the Netherlight Temple", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250236] = { achievementID = 60987, achievementName = "Raise an Army for the Sanctum of Light", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[248942] = { achievementID = 60986, achievementName = "Raise an Army for the Temple of Five Dawns", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250126] = { achievementID = 60984, achievementName = "Raise an Army for the Trueshot Lodge", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[260581] = { achievementID = 42272, achievementName = "The Archdruid's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[245429] = { achievementID = 42274, achievementName = "The Archmage's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249466] = { achievementID = 42282, achievementName = "The Battlelord's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250115] = { achievementID = 42270, achievementName = "The Deathlord's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[257403] = { achievementID = 42280, achievementName = "The Farseer's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[248958] = { achievementID = 42275, achievementName = "The Grandmaster's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250792] = { achievementID = 42277, achievementName = "The High Priest's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[250234] = { achievementID = 42276, achievementName = "The Highlord's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[248011] = { achievementID = 42273, achievementName = "The Huntmaster's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[248960] = { achievementID = 42281, achievementName = "The Netherlord's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[260776] = { achievementID = 42279, achievementName = "The Shadowblade's Campaign", achievementCategory = "Legion Class Hall" }
Gallery.ItemDetails[249459] = { achievementID = 42271, achievementName = "The Slayer's Campaign", achievementCategory = "Legion Class Hall" }

-- Achievement Category: Legion Dungeon
Gallery.ItemDetails[256913] = { achievementID = 10996, achievementName = "Got to Ketchum All", achievementCategory = "Legion Dungeon" }

-- Achievement Category: Legion Raid
Gallery.ItemDetails[258223] = { achievementID = 11699, achievementName = "Grand Fin-ale", achievementCategory = "Legion Raid" }

-- Achievement Category: Lich King Raid
Gallery.ItemDetails[244852] = { achievementID = 4405, achievementName = "More Dots! (25 player)", achievementCategory = "Lich King Raid" }

-- Achievement Category: Legion Remix
Gallery.ItemDetails[250307]  = { achievementID = 42318,  achievementName = "Court of Farondis", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250406]  = { achievementID = 42321,  achievementName = "Legion Remix Raids", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[258299]  = { achievementID = 42547,  achievementName = "Highmountain Tribe", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250407]  = { achievementID = 42619,  achievementName = "Dreamweavers", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250690]  = { achievementID = 42627,  achievementName = "Argussian reach", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[256677]  = { achievementID = 42628,  achievementName = "The Nightfallen", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[252753]  = { achievementID = 42655,  achievementName = "The Armies of Legionfall", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250402]  = { achievementID = 42658,  achievementName = "Valarjar", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250693]  = { achievementID = 42674,  achievementName = "Broken Isles World Quests V", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250622]  = { achievementID = 42675,  achievementName = "Defending the Broken Isles III", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[251779]  = { achievementID = 42689,  achievementName = "Timesworn Keystone Master", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250403]  = { achievementID = 42692,  achievementName = "Broken Isles Dungeoneer", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250689]  = { achievementID = 61054,  achievementName = "Heroic Broken World Quests III", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250405]  = { achievementID = 61060,  achievementName = "Power of the Obelisks II", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[251778]  = { achievementID = 61218,  achievementName = "The Wardens", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[256678] = {  achievementID = 42628,  achievementName = "The Nightfallen", achievementCategory = "Legion Remix "}
Gallery.ItemDetails[250404] = {  achievementID = 42675,  achievementName = "Defending the Broken Isles III", achievementCategory = "Legion Remix "}

-- Achievement Category: Lorewalking
Gallery.ItemDetails[257355] = { achievementID = 42188, achievementName = "Lorewalking: Blade's Bane", achievementCategory = "Lorewalking" }
Gallery.ItemDetails[257354] = { achievementID = 42187, achievementName = "Lorewalking: Ethereal Wisdom", achievementCategory = "Lorewalking" }
Gallery.ItemDetails[245332] = { achievementID = 61467, achievementName = "Lorewalking: The Elves of Quel'thalas", achievementCategory = "Lorewalking" }
Gallery.ItemDetails[257351] = { achievementID = 42189, achievementName = "Lorewalking: The Lich King", achievementCategory = "Lorewalking" }
Gallery.ItemDetails[271971] = { achievementID = 61442, achievementName = "Lorewalking: The Loa", achievementCategory = "Lorewalking" }

-- Achievement Category: Midnight
Gallery.ItemDetails[257367] = { achievementID = 61507, achievementName = "A Bloody Song", achievementCategory = "Midnight" }
Gallery.ItemDetails[244656] = { achievementID = 62185, achievementName = "Ever Painting", achievementCategory = "Midnight" }
Gallery.ItemDetails[254773] = { achievementID = 62288, achievementName = "Eversong Woods: The Highest Peaks", achievementCategory = "Midnight" }
Gallery.ItemDetails[264266] = { achievementID = 61264, achievementName = "Leaf None Behind", achievementCategory = "Midnight" }
Gallery.ItemDetails[264259] = { achievementID = 61574, achievementName = "Legends Never Die", achievementCategory = "Midnight" }
Gallery.ItemDetails[264335] = { achievementID = 62122, achievementName = "Tallest Tree in the Forest", achievementCategory = "Midnight" }
Gallery.ItemDetails[251909] = { achievementID = 62186, achievementName = "The Party Must Go On", achievementCategory = "Midnight" }
Gallery.ItemDetails[264493] = { achievementID = 62130, achievementName = "The Ultimate Predator", achievementCategory = "Midnight" }
Gallery.ItemDetails[264656] = { achievementID = 62291, achievementName = "Voidstorm: The Highest Peaks", achievementCategory = "Midnight" }
Gallery.ItemDetails[256925] = { achievementID = 62289, achievementName = "Zul'Aman: The Highest Peaks", achievementCategory = "Midnight" }

-- Achievement Category: Northrend
Gallery.ItemDetails[248807] = { achievementID = 938, achievementName = "The Snows of Northrend", achievementCategory = "Northrend" }

-- Achievement Category: Pandaria Scenarios
Gallery.ItemDetails[256425] = { achievementID = 8316, achievementName = "Blood in the Snow", achievementCategory = "Pandaria Scenarios" }

-- Achievement Category: Player vs. Player
Gallery.ItemDetails[247765] = { achievementID = 61687, achievementName = "Champion in Battle", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247756] = { achievementID = 1157, achievementName = "Duel-icious", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247763] = { achievementID = 61683, achievementName = "Entering Battle", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247770] = { achievementID = 61686, achievementName = "Expert in Battle", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247766] = { achievementID = 61688, achievementName = "Master in Battle", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247769] = { achievementID = 61685, achievementName = "Proficient in Battle", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247768] = { achievementID = 61684, achievementName = "Progressing in Battle", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247745] = { achievementID = 229, achievementName = "The Grim Reaper", achievementCategory = "Player vs. Player" }
Gallery.ItemDetails[247744] = { achievementID = 231, achievementName = "Wrecking Ball", achievementCategory = "Player vs. Player" }

-- Achievement Category: Prey
Gallery.ItemDetails[265798] = { achievementID = 62154, achievementName = "Prey: A Different Kind of Void (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265796] = { achievementID = 62169, achievementName = "Prey: A Different Kind of Void (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265707] = { achievementID = 62165, achievementName = "Prey: A Thorn in the Side (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265692] = { achievementID = 62183, achievementName = "Prey: A Thorn in the Side (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265699] = { achievementID = 62156, achievementName = "Prey: Anger Management (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265684] = { achievementID = 62174, achievementName = "Prey: Anger Mangement (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265702] = { achievementID = 62160, achievementName = "Prey: Blinded By The Light (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265687] = { achievementID = 62178, achievementName = "Prey: Blinded By The Light (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265701] = { achievementID = 62159, achievementName = "Prey: Bloody Green Thumbs (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265686] = { achievementID = 62177, achievementName = "Prey: Bloody Green Thumbs (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265708] = { achievementID = 62166, achievementName = "Prey: Breaking the Blade (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265694] = { achievementID = 62184, achievementName = "Prey: Breaking the Blade (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265705] = { achievementID = 62163, achievementName = "Prey: Chasing Death (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265690] = { achievementID = 62181, achievementName = "Prey: Chasing Death (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265704] = { achievementID = 62162, achievementName = "Prey: Dominating the Void (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265689] = { achievementID = 62180, achievementName = "Prey: Dominating the Void (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265698] = { achievementID = 62155, achievementName = "Prey: Ethereal Assassins (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265683] = { achievementID = 62173, achievementName = "Prey: Ethereal Assassins (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265697] = { achievementID = 62153, achievementName = "Prey: Insane Inventors (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265682] = { achievementID = 62168, achievementName = "Prey: Insane Inventors (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265696] = { achievementID = 62144, achievementName = "Prey: Mad Magisters (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265681] = { achievementID = 62167, achievementName = "Prey: Mad Magisters (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265706] = { achievementID = 62164, achievementName = "Prey: No Rest for the Wretched (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265691] = { achievementID = 62182, achievementName = "Prey: No Rest for the Wretched (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265703] = { achievementID = 62161, achievementName = "Prey: Outsmarting the Schemers (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265688] = { achievementID = 62179, achievementName = "Prey: Outsmarting the Schemers (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265700] = { achievementID = 62157, achievementName = "Prey: Sadistic Shamans (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265685] = { achievementID = 62175, achievementName = "Prey: Sadistic Shamans (Nightmare)", achievementCategory = "Prey" }
Gallery.ItemDetails[265799] = { achievementID = 62158, achievementName = "Prey: The Fallen Farstriders (Hard)", achievementCategory = "Prey" }
Gallery.ItemDetails[265797] = { achievementID = 62176, achievementName = "Prey: The Fallen Farstriders (Nightmare)", achievementCategory = "Prey" }

-- Achievement Category: Professions
Gallery.ItemDetails[263997] = { achievementID = 42788, achievementName = "Alchemizing at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[263998] = { achievementID = 42792, achievementName = "Blacksmithing at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[263999] = { achievementID = 42795, achievementName = "Cooking at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264000] = { achievementID = 42787, achievementName = "Enchanting at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264001] = { achievementID = 42798, achievementName = "Engineering at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264002] = { achievementID = 42797, achievementName = "Fishing at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264003] = { achievementID = 42793, achievementName = "Herbalism at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264004] = { achievementID = 42796, achievementName = "Inscribing at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264005] = { achievementID = 42789, achievementName = "Jewelcrafting at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264006] = { achievementID = 42786, achievementName = "Leatherworking at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264172] = { achievementID = 42791, achievementName = "Mining at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[253163] = { achievementID = 19408, achievementName = "Professional Algari Master", achievementCategory = "Professions" }
Gallery.ItemDetails[245490] = { achievementID = 12733, achievementName = "Professional Zandalari Master", achievementCategory = "Professions" }
Gallery.ItemDetails[264173] = { achievementID = 42790, achievementName = "Skinning at Midnight", achievementCategory = "Professions" }
Gallery.ItemDetails[264174] = { achievementID = 42794, achievementName = "Tailoring at Midnight", achievementCategory = "Professions" }

-- Achievement Category: Twin Peaks
Gallery.ItemDetails[247727] = { achievementID = 5223, achievementName = "Master of Twin Peaks", achievementCategory = "Twin Peaks" }

-- Achievement Category: Void Assaults
Gallery.ItemDetails[276083] = { achievementID = 63325, achievementName = "Omnium Folio Studies", achievementCategory = "Void Assaults" }


-- Achievement Category: War Effort
Gallery.ItemDetails[245467] = { achievementID = 12869, achievementName = "Azeroth at War: After Lordaeron", achievementCategory = "War Effort" }
Gallery.ItemDetails[245483] = { achievementID = 12870, achievementName = "Azeroth at War: Kalimdor on Fire", achievementCategory = "War Effort" }
Gallery.ItemDetails[245463] = { achievementID = 12867, achievementName = "Azeroth at War: The Barrens", achievementCategory = "War Effort" }

-- Achievement Category: War Within
Gallery.ItemDetails[253023] = { achievementID = 40504, achievementName = "Rocked to Sleep", achievementCategory = "War Within" }
Gallery.ItemDetails[246867] = { achievementID = 41186, achievementName = "Slate of the Union", achievementCategory = "War Within" }
Gallery.ItemDetails[246866] = { achievementID = 40542, achievementName = "Smelling History", achievementCategory = "War Within" }
Gallery.ItemDetails[252757] = { achievementID = 20595, achievementName = "Sojourner of Isle of Dorn", achievementCategory = "War Within" }
Gallery.ItemDetails[245324] = { achievementID = 40894, achievementName = "Sojourner of Undermine", achievementCategory = "War Within" }
Gallery.ItemDetails[253037] = { achievementID = 40859, achievementName = "We're Here All Night", achievementCategory = "War Within" }

-- Achievement Category: War Within Raid
Gallery.ItemDetails[245302] = { achievementID = 41119, achievementName = "One Rank Higher", achievementCategory = "War Within Raid" }

-- Achievement Category: Warsong Gulch
Gallery.ItemDetails[247746] = { achievementID = 200, achievementName = "Persistent Defender", achievementCategory = "Warsong Gulch" }
Gallery.ItemDetails[247747] = { achievementID = 167, achievementName = "Warsong Gulch Veteran", achievementCategory = "Warsong Gulch" }

end

do-- Professions  , recipeItemID = , recipeName = "", soldBy = {} }

-- Profession: Battle for Azeroth Alchemy (140)
Gallery.ItemDetails[257046] = { professionText = "Battle for Azeroth Alchemy (140)",  recipeName = "Boralus Bottle Lamp"}
Gallery.ItemDetails[257047] = { professionText = "Battle for Azeroth Alchemy (140)",  recipeName = "Zandalari Bottle Shipment"}

-- Profession: Battle for Azeroth Blacksmithing (140)
Gallery.ItemDetails[252397] = { professionText = "Battle for Azeroth Blacksmithing (140)",  recipeName = "Brennadam Grinder"}
Gallery.ItemDetails[252399] = { professionText = "Battle for Azeroth Blacksmithing (140)",  recipeName = "Stormsong Stove"}

-- Profession: Battle for Azeroth Cooking (140)
Gallery.ItemDetails[245484] = { professionText = "Battle for Azeroth Cooking (140)",  recipeName = "Boralus-Style Lobster Platter"}

-- Profession: Battle for Azeroth Enchanting (140)
Gallery.ItemDetails[258559] = { professionText = "Battle for Azeroth Enchanting (140)",  recipeName = "Tidesage's Totem"}
Gallery.ItemDetails[258560] = { professionText = "Battle for Azeroth Enchanting (140)",  recipeName = "Drust Enchanter's Rod"}

-- Profession: Battle for Azeroth Engineering (140)
Gallery.ItemDetails[246486] = { professionText = "Battle for Azeroth Engineering (140)",  recipeName = "Gnomish Tesla Mega-Coil"}
Gallery.ItemDetails[246500] = { professionText = "Battle for Azeroth Engineering (140)",  recipeName = "Mechagon Miniature Artificial Sun"}
Gallery.ItemDetails[246604] = { professionText = "Battle for Azeroth Engineering (140)",  recipeName = "Deactivated Atomic Recalibrator"}

-- Profession: Battle for Azeroth Inscription (140)
Gallery.ItemDetails[245415] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Zuldazar Fence" }
Gallery.ItemDetails[245416] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Zuldazar Fencepost" }
Gallery.ItemDetails[245499] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Gilded Zandalari Table"}
Gallery.ItemDetails[252035] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Boralus Barrel"}
Gallery.ItemDetails[252389] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Proudmoore Shipping Crate"}
Gallery.ItemDetails[252401] = { professionText = "Battle for Azeroth Inscription (140)",  recipeName = "Boralus Bookshelf"}

-- Profession: Battle for Azeroth Jewelcrafting (140)
Gallery.ItemDetails[245414] = { professionText = "Battle for Azeroth Jewelcrafting (140)",  recipeName = "Zandalari Skullfire Lamp"}
Gallery.ItemDetails[245496] = { professionText = "Battle for Azeroth Jewelcrafting (140)",  recipeName = "Small Mask of Bwonsamdi, Loa of Graves"}

-- Profession: Battle for Azeroth Leatherworking (140)
Gallery.ItemDetails[245412] = { professionText = "Battle for Azeroth Leatherworking (140)",  recipeName = "Zandalari Ritual Drum"}
Gallery.ItemDetails[258558] = { professionText = "Battle for Azeroth Leatherworking (140)",  recipeName = "Sandfury Diplomat's Banner"}

-- Profession: Battle for Azeroth Tailoring (140)
Gallery.ItemDetails[243101] = { professionText = "Battle for Azeroth Tailoring (140)",  recipeName = "Red Dazar'alor Rug"}
Gallery.ItemDetails[245418] = { professionText = "Battle for Azeroth Tailoring (140)",  recipeName = "Zanchuli Tapestry"}

-- Profession: Cataclysm Alchemy (60)
Gallery.ItemDetails[245517] = { professionText = "Cataclysm Alchemy (60)",  recipeName = "Gilnean Cauldron"}
Gallery.ItemDetails[257694] = { professionText = "Cataclysm Alchemy (60)",  recipeName = "Gilnean Green Potion"}

-- Profession: Cataclysm Blacksmithing (60)
Gallery.ItemDetails[257042] = { professionText = "Cataclysm Blacksmithing (60)",  recipeName = "Gilnean Pitchfork"}
Gallery.ItemDetails[257409] = { professionText = "Cataclysm Blacksmithing (60)",  recipeName = "Standing Smoke Lamp"}

-- Profession: Cataclysm Enchanting (60)
Gallery.ItemDetails[257095] = { professionText = "Cataclysm Enchanting (60)",  recipeName = "Twilight Fire Canister"}
Gallery.ItemDetails[257404] = { professionText = "Cataclysm Enchanting (60)",  recipeName = "Pyrewood Glass Bottle"}

-- Profession: Cataclysm Engineering (60)
Gallery.ItemDetails[245602] = { professionText = "Cataclysm Engineering (60)",  recipeName = "Gilnean Problem Solver"}
Gallery.ItemDetails[257689] = { professionText = "Cataclysm Engineering (60)",  recipeName = "Small Gilnean Windmill"}

-- Profession: Cataclysm Inscription (60)
Gallery.ItemDetails[245621] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Wooden Table"}
Gallery.ItemDetails[245622] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Wall Shelf"}
Gallery.ItemDetails[245623] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Rocking Chair"}
Gallery.ItemDetails[257695] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Postbox"}
Gallery.ItemDetails[257696] = { professionText = "Cataclysm Inscription (60)",  recipeName = "Gilnean Map"}

-- Profession: Cataclysm Jewelcrafting (60)
Gallery.ItemDetails[249143] = { professionText = "Cataclysm Jewelcrafting (60)",  recipeName = "Smoke Sconce"}
Gallery.ItemDetails[257406] = { professionText = "Cataclysm Jewelcrafting (60)",  recipeName = "Smoke Lamp"}

-- Profession: Cataclysm Leatherworking (60)
Gallery.ItemDetails[257806] = { professionText = "Cataclysm Leatherworking (60)",  recipeName = "Scaled Twilight Mosaic"}
Gallery.ItemDetails[264677] = { professionText = "Cataclysm Leatherworking (60)",  recipeName = "Rolled Scarab Rug"}
Gallery.ItemDetails[264712] = { professionText = "Cataclysm Leatherworking (60)",  recipeName = "Gilnean Spare Saddle"}

-- Profession: Cataclysm Tailoring (60)
Gallery.ItemDetails[245618] = { professionText = "Cataclysm Tailoring (60)",  recipeName = "Surwich Expedition Tent"}
Gallery.ItemDetails[257402] = { professionText = "Cataclysm Tailoring (60)",  recipeName = "\"Unity of Thorns\" Tapestry"}

-- Profession: Classic Alchemy (240)
Gallery.ItemDetails[257041] = { professionText = "Classic Alchemy (240)",  recipeName = "Stoppered Black Potion"}
Gallery.ItemDetails[257100] = { professionText = "Classic Alchemy (240)",  recipeName = "Apothecary's Worktable"}

-- Profession: Classic Blacksmithing (240)
Gallery.ItemDetails[246111] = { professionText = "Classic Blacksmithing (240)",  recipeName = "Shadowforge Sconce"}
Gallery.ItemDetails[246489] = { professionText = "Classic Blacksmithing (240)",  recipeName = "Steel Ironforge Emblem"}

-- Profession: Classic Enchanting (240)
Gallery.ItemDetails[253250] = { professionText = "Classic Enchanting (240)",  recipeName = "Tirisfal Hollow Campfire"}
Gallery.ItemDetails[263027] = { professionText = "Classic Enchanting (240)",  recipeName = "Darkmaster's Mystical Brazier"}

-- Profession: Classic Engineering (240)
Gallery.ItemDetails[246410] = { professionText = "Classic Engineering (240)",  recipeName = "Dark Iron Table Saw"}
Gallery.ItemDetails[246700] = { professionText = "Classic Engineering (240)",  recipeName = "Gnomish Steam-Powered Bed"}

-- Profession: Classic Inscription (240)
Gallery.ItemDetails[245502] = { professionText = "Classic Inscription (240)",  recipeName = "Brill Coffin"}
Gallery.ItemDetails[245503] = { professionText = "Classic Inscription (240)",  recipeName = "Brill Coffin Lid"}
Gallery.ItemDetails[246420] = { professionText = "Classic Inscription (240)",  recipeName = "Kharanos Bookcase"}
Gallery.ItemDetails[246423] = { professionText = "Classic Inscription (240)",  recipeName = "Wooden Ironforge Table"}
Gallery.ItemDetails[258289] = { professionText = "Classic Inscription (240)",  recipeName = "Thunder Bluff Totem"}

-- Profession: Classic Jewelcrafting (240)
Gallery.ItemDetails[246413] = { professionText = "Classic Jewelcrafting (240)",  recipeName = "Blackrock Lamppost"}
Gallery.ItemDetails[246488] = { professionText = "Classic Jewelcrafting (240)",  recipeName = "Ironforge Chandelier"}

-- Profession: Classic Leatherworking (240)
Gallery.ItemDetails[242948] = { professionText = "Classic Leatherworking (240)",  recipeName = "Loch Modan Bearskin Rug"}
Gallery.ItemDetails[257725] = { professionText = "Classic Leatherworking (240)",  recipeName = "Camp Narache Rug"}

-- Profession: Classic Tailoring (240)
Gallery.ItemDetails[243336] = { professionText = "Classic Tailoring (240)",  recipeName = "Elder Rise Rug"}
Gallery.ItemDetails[246685] = { professionText = "Classic Tailoring (240)",  recipeName = "Dwarven District Banner"}

-- Profession: Draenor Alchemy (80)
Gallery.ItemDetails[244318] = { professionText = "Draenor Alchemy (80)",  recipeName = "Wine Barrel"}
Gallery.ItemDetails[257044] = { professionText = "Draenor Alchemy (80)",  recipeName = "Orcish Felblood Cauldron"}

-- Profession: Draenor Blacksmithing (80)
Gallery.ItemDetails[245436] = { professionText = "Draenor Blacksmithing (80)",  recipeName = "Blackrock Weapon Rack"}
Gallery.ItemDetails[245600] = { professionText = "Draenor Blacksmithing (80)",  recipeName = "Frostwall Forge"}

-- Profession: Draenor Cooking (80)
Gallery.ItemDetails[245428] = { professionText = "Draenor Cooking (80)",  recipeName = "Hungry Human's Platter"}

-- Profession: Draenor Enchanting (80)
Gallery.ItemDetails[245601] = { professionText = "Draenor Enchanting (80)",  recipeName = "Ancestral Signal Brazier"}
Gallery.ItemDetails[251655] = { professionText = "Draenor Enchanting (80)",  recipeName = "Draenethyst String Lights"}

-- Profession: Draenor Engineering (80)
Gallery.ItemDetails[244314] = { professionText = "Draenor Engineering (80)",  recipeName = "Frostwall Architect's Table"}
Gallery.ItemDetails[251482] = { professionText = "Draenor Engineering (80)",  recipeName = "Draenei Stargazer's Telescope"}

-- Profession: Draenor Inscription
Gallery.ItemDetails[244317] = { professionText = "Draenor Inscription",  recipeName = "Orcish Banded Barrel"}

-- Profession: Draenor Inscription (80)
Gallery.ItemDetails[244313] = { professionText = "Draenor Inscription (80)",  recipeName = "Orcish Fence"}
Gallery.ItemDetails[244319] = { professionText = "Draenor Inscription (80)",  recipeName = "Wooden Shipping Crate"}
Gallery.ItemDetails[245441] = { professionText = "Draenor Inscription (80)",  recipeName = "Orcish Fencepost"}
Gallery.ItemDetails[245534] = { professionText = "Draenor Inscription (80)",  recipeName = "Frostwall Elevated Brazier"}

-- Profession: Draenor Jewelcrafting (80)
Gallery.ItemDetails[251495] = { professionText = "Draenor Jewelcrafting (80)",  recipeName = "Draenic Basin"}
Gallery.ItemDetails[251550] = { professionText = "Draenor Jewelcrafting (80)",  recipeName = "Draenethyst Sconce"}

-- Profession: Draenor Leatherworking (80)
Gallery.ItemDetails[244323] = { professionText = "Draenor Leatherworking (80)",  recipeName = "Orcish Sleeping Cot"}
Gallery.ItemDetails[245432] = { professionText = "Draenor Leatherworking (80)",  recipeName = "Blackrock Bunkbed"}

-- Profession: Draenor Tailoring (80)
Gallery.ItemDetails[245421] = { professionText = "Draenor Tailoring (80)",  recipeName = "Karabor Bed"}
Gallery.ItemDetails[251546] = { professionText = "Draenor Tailoring (80)",  recipeName = "Argussian Circular Rug"}
Gallery.ItemDetails[258303] = { professionText = "Draenor Tailoring (80)",  recipeName = "Beloved Elekk Plushie"}

-- Profession: Dragon Isles Alchemy (80)
Gallery.ItemDetails[248111] = { professionText = "Dragon Isles Alchemy (80)",  recipeName = "Verdant Valdrakken Vase"}
Gallery.ItemDetails[257052] = { professionText = "Dragon Isles Alchemy (80)",  recipeName = "Dragon's Elixir Bottle"}

-- Profession: Dragon Isles Blacksmithing (80)
Gallery.ItemDetails[256427] = { professionText = "Dragon Isles Blacksmithing (80)",  recipeName = "Wingrest Signal Brazier"}
Gallery.ItemDetails[256430] = { professionText = "Dragon Isles Blacksmithing (80)",  recipeName = "Valdrakken Hanging Cauldron"}

-- Profession: Dragon Isles Cooking (80)
Gallery.ItemDetails[247222] = { professionText = "Dragon Isles Cooking (80)",  recipeName = "Drake Kebab Platter"}
Gallery.ItemDetails[247224] = { professionText = "Dragon Isles Cooking (80)",  recipeName = "Valdrakken Blossomfruit Platter"}
Gallery.ItemDetails[247225] = { professionText = "Dragon Isles Cooking (80)",  recipeName = "Bruffalon Rib Platter"}

-- Profession: Dragon Isles Enchanting (80)
Gallery.ItemDetails[256170] = { professionText = "Dragon Isles Enchanting (80)",  recipeName = "Draconic Scribe's Basin"}
Gallery.ItemDetails[256171] = { professionText = "Dragon Isles Enchanting (80)",  recipeName = "Five Flights' Grimoire"}

-- Profession: Dragon Isles Engineering (80)
Gallery.ItemDetails[248113] = { professionText = "Dragon Isles Engineering (80)",  recipeName = "Thaldraszus Telescope"}
Gallery.ItemDetails[258253] = { professionText = "Dragon Isles Engineering (80)",  recipeName = "Titanic Tyrhold Fountain"}

-- Profession: Dragon Isles Inscription (80)
Gallery.ItemDetails[248106] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Valdrakken Banded Barrel"}
Gallery.ItemDetails[248107] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Valdrakken Storage Crate"}
Gallery.ItemDetails[248108] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Long Valdrakken Storage Crate"}
Gallery.ItemDetails[248118] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Literature of the Blue Dragonflight"}
Gallery.ItemDetails[248119] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Literature of the Green Dragonflight"}
Gallery.ItemDetails[248120] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Literature of the Red Dragonflight"}
Gallery.ItemDetails[264679] = { professionText = "Dragon Isles Inscription (80)",  recipeName = "Valdrakken Wall Shelf"}

-- Profession: Dragon Isles Jewelcrafting (80)
Gallery.ItemDetails[248109] = { professionText = "Dragon Isles Jewelcrafting (80)",  recipeName = "Valdrakken Fence"}
Gallery.ItemDetails[248110] = { professionText = "Dragon Isles Jewelcrafting (80)",  recipeName = "Valdrakken Fencepost"}
Gallery.ItemDetails[248654] = { professionText = "Dragon Isles Jewelcrafting (80)",  recipeName = "Valdrakken Gilded Throne"}

-- Profession: Dragon Isles Leatherworking (80)
Gallery.ItemDetails[248114] = { professionText = "Dragon Isles Leatherworking (80)",  recipeName = "Draconic Nesting Bed"}
Gallery.ItemDetails[248657] = { professionText = "Dragon Isles Leatherworking (80)",  recipeName = "Valdrakken Market Tent"}

-- Profession: Dragon Isles Tailoring (80)
Gallery.ItemDetails[248121] = { professionText = "Dragon Isles Tailoring (80)",  recipeName = "Draconic Circular Rug"}
Gallery.ItemDetails[257053] = { professionText = "Dragon Isles Tailoring (80)",  recipeName = "Tapestry of the Five Flights"}

-- Profession: Junkyard Tinkering
Gallery.ItemDetails[246482] = { professionText = "Junkyard Tinkering",  recipeName = "Mechanical Gnomish Lamppost"}
Gallery.ItemDetails[246485] = { professionText = "Junkyard Tinkering",  recipeName = "Mechagnome Sustenance Distributor"}
Gallery.ItemDetails[246595] = { professionText = "Junkyard Tinkering",  recipeName = "Gnomish Fencepost"}
Gallery.ItemDetails[246596] = { professionText = "Junkyard Tinkering",  recipeName = "Gnomish Fence"}
Gallery.ItemDetails[246597] = { professionText = "Junkyard Tinkering",  recipeName = "Perpetual Motion Crate"}
Gallery.ItemDetails[246606] = { professionText = "Junkyard Tinkering",  recipeName = "Mechagon Armory Rack"}

-- Profession: Khaz Algar Alchemy (80)
Gallery.ItemDetails[252758] = { professionText = "Khaz Algar Alchemy (80)",  recipeName = "Boulder Springs Hot Tub"}
Gallery.ItemDetails[257102] = { professionText = "Khaz Algar Alchemy (80)",  recipeName = "Nerubian Alchemist's Retort"}

-- Profession: Khaz Algar Blacksmithing (80)
Gallery.ItemDetails[245312] = { professionText = "Khaz Algar Blacksmithing (80)",  recipeName = "Rusting Bolted Bench"}
Gallery.ItemDetails[245323] = { professionText = "Khaz Algar Blacksmithing (80)",  recipeName = "Shredderwheel Storage Chest"}

-- Profession: Khaz Algar Cooking (80)
Gallery.ItemDetails[239170] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Dornic Mine and Cheese Platter"}
Gallery.ItemDetails[245326] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Kaheti Predator's Assortment"}
Gallery.ItemDetails[246708] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Dornic Sliced Mineloaf"}
Gallery.ItemDetails[246709] = { professionText = "Khaz Algar Cooking (80)",  recipeName = "Earthen Hospitality Cheese-Like Brick"}

-- Profession: Khaz Algar Enchanting (80)
Gallery.ItemDetails[253039] = { professionText = "Khaz Algar Enchanting (80)",  recipeName = "Dornogal Hanging Sconce"}
Gallery.ItemDetails[253171] = { professionText = "Khaz Algar Enchanting (80)",  recipeName = "Replica Awakening Machine Stasis Pod"}

-- Profession: Khaz Algar Engineering (80)
Gallery.ItemDetails[246066] = { professionText = "Khaz Algar Engineering (80)",  recipeName = "Schmancy Goblin String Lights"}
Gallery.ItemDetails[253252] = { professionText = "Khaz Algar Engineering (80)",  recipeName = "Replica Rumbling Wastes Drill Pod"}

-- Profession: Khaz Algar Inscription (80)
Gallery.ItemDetails[253022] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Dornogal Bookcase"}
Gallery.ItemDetails[253036] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Freywold Table"}
Gallery.ItemDetails[253164] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Algari Fence"}
Gallery.ItemDetails[253165] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Algari Fencepost"}
Gallery.ItemDetails[253167] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Forgeground Market Bins"}
Gallery.ItemDetails[253169] = { professionText = "Khaz Algar Inscription (80)",  recipeName = "Meadery Storage Chest"}

-- Profession: Khaz Algar Jewelcrafting (80)
Gallery.ItemDetails[245559] = { professionText = "Khaz Algar Jewelcrafting (80)",  recipeName = "Octagonal Ochre Window"}
Gallery.ItemDetails[253253] = { professionText = "Khaz Algar Jewelcrafting (80)",  recipeName = "Gundargaz Candelabra"}

-- Profession: Khaz Algar Leatherworking (80)
Gallery.ItemDetails[239214] = { professionText = "Khaz Algar Leatherworking (80)",  recipeName = "Well-Lit Incontinental Couch"}
Gallery.ItemDetails[243327] = { professionText = "Khaz Algar Leatherworking (80)",  recipeName = "Zhevra-Stripe Rug"}

-- Profession: Khaz Algar Tailoring (80)
Gallery.ItemDetails[245305] = { professionText = "Khaz Algar Tailoring (80)",  recipeName = "Undermine Bean Bag Chair"}
Gallery.ItemDetails[252755] = { professionText = "Khaz Algar Tailoring (80)",  recipeName = "Dornogal Framed Rug"}

-- Profession: Legion Alchemy (80)
Gallery.ItemDetails[256680] = { professionText = "Legion Alchemy (80)",  recipeName = "Arcan'dor Cutting Fountain"}
Gallery.ItemDetails[257045] = { professionText = "Legion Alchemy (80)",  recipeName = "Starry Scrying Pool"}

-- Profession: Legion Blacksmithing (80)
Gallery.ItemDetails[245408] = { professionText = "Legion Blacksmithing (80)",  recipeName = "Tauren Soup Pot"}
Gallery.ItemDetails[247909] = { professionText = "Legion Blacksmithing (80)",  recipeName = "Suramar Fencepost"}
Gallery.ItemDetails[247922] = { professionText = "Legion Blacksmithing (80)",  recipeName = "Suramar Fence"}

-- Profession: Legion Enchanting (80)
Gallery.ItemDetails[247923] = { professionText = "Legion Enchanting (80)",  recipeName = "Suramar Containment Cell"}
Gallery.ItemDetails[256681] = { professionText = "Legion Enchanting (80)",  recipeName = "Nightspire Fountain"}

-- Profession: Legion Engineering (80)
Gallery.ItemDetails[258225] = { professionText = "Legion Engineering (80)",  recipeName = "Failed Failure Detection Pylon"}
Gallery.ItemDetails[258226] = { professionText = "Legion Engineering (80)",  recipeName = "Dalaran Auto-Hammer"}

-- Profession: Legion Inscription (80)
Gallery.ItemDetails[245396] = { professionText = "Legion Inscription (80)",  recipeName = "Suramar Dresser"}
Gallery.ItemDetails[245459] = { professionText = "Legion Inscription (80)",  recipeName = "Tauren Storage Chest"}
Gallery.ItemDetails[247916] = { professionText = "Legion Inscription (80)",  recipeName = "Covered Square Suramar Table"}
Gallery.ItemDetails[247918] = { professionText = "Legion Inscription (80)",  recipeName = "Nightborne Jeweler's Table"}
Gallery.ItemDetails[247925] = { professionText = "Legion Inscription (80)",  recipeName = "Suramar Storage Crate"}
Gallery.ItemDetails[258224] = { professionText = "Legion Inscription (80)",  recipeName = "Dalaran Display Shelves"}

-- Profession: Legion Jewelcrafting (80)
Gallery.ItemDetails[245557] = { professionText = "Legion Jewelcrafting (80)",  recipeName = "Shaded Suramar Window"}
Gallery.ItemDetails[258227] = { professionText = "Legion Jewelcrafting (80)",  recipeName = "Suramar Jeweler's Assortment"}

-- Profession: Legion Leatherworking (80)
Gallery.ItemDetails[245406] = { professionText = "Legion Leatherworking (80)",  recipeName = "Tauren Leather Fence"}
Gallery.ItemDetails[245407] = { professionText = "Legion Leatherworking (80)",  recipeName = "Tauren Fencepost"}
Gallery.ItemDetails[257400] = { professionText = "Legion Leatherworking (80)",  recipeName = "Highmountain Tanner's Frame"}

-- Profession: Legion Tailoring (80)
Gallery.ItemDetails[247920] = { professionText = "Legion Tailoring (80)",  recipeName = "Circular Shal'dorei Rug"}
Gallery.ItemDetails[248010] = { professionText = "Legion Tailoring (80)",  recipeName = "Shal'dorei Open-Air Tent"}
Gallery.ItemDetails[258557] = { professionText = "Legion Tailoring (80)",  recipeName = "Beloved Raptor Plushie"}

-- Profession: Midnight Alchemy (10)
Gallery.ItemDetails[253506] = { professionText = "Midnight Alchemy (10)",  recipeName = "Rootbound Vat"}
Gallery.ItemDetails[256356] = { professionText = "Midnight Alchemy (10)",  recipeName = "Sunsmoke Censer"}
Gallery.ItemDetails[257420] = { professionText = "Midnight Alchemy (10)",  recipeName = "Silvermoon Spire Fountain"}
Gallery.ItemDetails[262354] = { professionText = "Midnight Alchemy (10)",  recipeName = "Riftstone"}
Gallery.ItemDetails[262355] = { professionText = "Midnight Alchemy (10)",  recipeName = "Entropic Illuminant"}
Gallery.ItemDetails[262356] = { professionText = "Midnight Alchemy (10)",  recipeName = "Haranir Preserving Agents"}

-- Profession: Midnight Blacksmithing
Gallery.ItemDetails[262451] = { professionText = "Midnight Blacksmithing",  recipeName = "Gilded Silvermoon Anvil"}
Gallery.ItemDetails[262452] = { professionText = "Midnight Blacksmithing",  recipeName = "Masterwork Crafting Hammer"}
Gallery.ItemDetails[262456] = { professionText = "Midnight Blacksmithing",  recipeName = "Ornamental Silvermoon Hanger"}
Gallery.ItemDetails[262457] = { professionText = "Midnight Blacksmithing",  recipeName = "Gilded Silvermoon Hanger"}
Gallery.ItemDetails[262460] = { professionText = "Midnight Blacksmithing",  recipeName = "Ren'dorei Anvil"}

-- Profession: Midnight Enchanting (50)
Gallery.ItemDetails[246693] = { professionText = "Midnight Enchanting (50)",  recipeName = "Self-Pouring Thalassian Sunwine"}
Gallery.ItemDetails[262458] = { professionText = "Midnight Enchanting (50)",  recipeName = "Animated Sin'dorei Pick"}
Gallery.ItemDetails[262459] = { professionText = "Midnight Enchanting (50)",  recipeName = "Animated Sin'dorei Hammer"}
Gallery.ItemDetails[262468] = { professionText = "Midnight Enchanting (50)",  recipeName = "Ren'dorei Postal Repository"}
Gallery.ItemDetails[262470] = { professionText = "Midnight Enchanting (50)",  recipeName = "Spellbound Tome of Thalassian Magics" }
Gallery.ItemDetails[262590] = { professionText = "Midnight Enchanting (50)",  recipeName = "Rootflame Campfire"}
Gallery.ItemDetails[268038] = { professionText = "Midnight Enchanting (50)",  recipeName = "Endless Codex of Blooming Light"}
Gallery.ItemDetails[268039] = { professionText = "Midnight Enchanting (50)",  recipeName = "Endless Codex of Nature's Grace"}
Gallery.ItemDetails[268041] = { professionText = "Midnight Enchanting (50)",  recipeName = "Endless Codex of the Voidtouched"}

-- Profession: Midnight Enchanting (80)
Gallery.ItemDetails[262450] = { professionText = "Midnight Enchanting (80)",  recipeName = "Ensorcelled Broom"}
Gallery.ItemDetails[262455] = { professionText = "Midnight Enchanting (80)",  recipeName = "Font of Gleaming Water"}

-- Profession: Midnight Engineering
Gallery.ItemDetails[246460] = { professionText = "Midnight Engineering",  recipeName = "Ambient Aethercharged Crystal"}
Gallery.ItemDetails[262465] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Stargazer"}
Gallery.ItemDetails[262602] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Warp Orb"}
Gallery.ItemDetails[262617] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Crafting Framework"}
Gallery.ItemDetails[262618] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Void Projector"}
Gallery.ItemDetails[262789] = { professionText = "Midnight Engineering",  recipeName = "Small Telogrus Lamp"}
Gallery.ItemDetails[263049] = { professionText = "Midnight Engineering",  recipeName = "Ren'dorei Lightpost"}

-- Profession: Midnight Inscription (50)
Gallery.ItemDetails[253508] = { professionText = "Midnight Inscription (50)",  recipeName = "Harandar Signpost"}
Gallery.ItemDetails[262464] = { professionText = "Midnight Inscription (50)",  recipeName = "Floating Void-Touched Tome"}
Gallery.ItemDetails[262594] = { professionText = "Midnight Inscription (50)",  recipeName = "Homely Sin'dorei Shelf"}
Gallery.ItemDetails[262595] = { professionText = "Midnight Inscription (50)",  recipeName = "Homely Wall Shelves"}
Gallery.ItemDetails[262597] = { professionText = "Midnight Inscription (50)",  recipeName = "Gilded Eversong Book"}
Gallery.ItemDetails[262598] = { professionText = "Midnight Inscription (50)",  recipeName = "Opened Sin'dorei Scroll"}
Gallery.ItemDetails[262601] = { professionText = "Midnight Inscription (50)",  recipeName = "Wild Hanging Scroll"}
Gallery.ItemDetails[262612] = { professionText = "Midnight Inscription (50)",  recipeName = "Sturdy Ren'dorei Cask"}
Gallery.ItemDetails[262615] = { professionText = "Midnight Inscription (50)",  recipeName = "Sin'dorei Phoenix Quill"}
Gallery.ItemDetails[262616] = { professionText = "Midnight Inscription (50)", sourceAction = "Forgotten Ink and Quill", treasureName = "Forgotten Ink and Quill", note = "Learned from Forgotten Ink and Quill." }
Gallery.ItemDetails[262790] = { professionText = "Midnight Inscription (50)",  recipeName = "Restful Bronze Bench"}
Gallery.ItemDetails[263034] = { professionText = "Midnight Inscription (50)",  recipeName = "Magnificent Towering Bookcase"}

-- Profession: Midnight Jewelcrafting (50)
Gallery.ItemDetails[248965] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Resplendent Highborne Statue"}
Gallery.ItemDetails[262454] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Shining Sin'dorei Hourglass"}
Gallery.ItemDetails[262471] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Bejeweled Sin'dorei Lyre"}
Gallery.ItemDetails[262613] = { professionText = "Midnight Jewelcrafting (50)",  recipeName = "Replica Haranir Mural"}

-- Profession: Midnight Jewelcrafting (80)
Gallery.ItemDetails[262461] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Tenebrous Ren'dorei Armillary"}
Gallery.ItemDetails[262469] = { professionText = "Midnight Jewelcrafting (80)",  recipeName = "Brilliant Phoenix Harp"}

-- Profession: Midnight Leatherworking (50)
Gallery.ItemDetails[243090] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Sturdy Haranir Chair"}
Gallery.ItemDetails[262600] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Stitched Haranir Rug"}
Gallery.ItemDetails[264244] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Plush Haranir Leather Pillow"}
Gallery.ItemDetails[265791] = { professionText = "Midnight Leatherworking (50)",  recipeName = "Haranir Canopy Bed"}

-- Profession: Midnight Leatherworking (80)
Gallery.ItemDetails[253457] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Leather-Bound Haranir Wall Shelf"}
Gallery.ItemDetails[262449] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Embossed Sin'dorei Fur Rug"}
Gallery.ItemDetails[262589] = { professionText = "Midnight Leatherworking (80)",  recipeName = "Simple Haranir Table"}

-- Profession: Midnight Tailoring (50)
Gallery.ItemDetails[262352] = { professionText = "Midnight Tailoring (50)",  recipeName = "Lush Telogrus Carpet"}
Gallery.ItemDetails[262591] = { professionText = "Midnight Tailoring (50)",  recipeName = "Luxurious Silvermoon Lounge Cushion"}
Gallery.ItemDetails[262592] = { professionText = "Midnight Tailoring (50)",  recipeName = "Plush Silvermoon Bed"}
Gallery.ItemDetails[262593] = { professionText = "Midnight Tailoring (50)",  recipeName = "Chic Silvermoon Pillow"}
Gallery.ItemDetails[262599] = { professionText = "Midnight Tailoring (50)",  recipeName = "Silvermoon Curtains"}
Gallery.ItemDetails[262611] = { professionText = "Midnight Tailoring (50)",  recipeName = "Voidstrider Saddlebag"}

-- Profession: Northrend Alchemy (60)
Gallery.ItemDetails[258212] = { professionText = "Northrend Alchemy (60)",  recipeName = "San'layn Blood Orb"}
Gallery.ItemDetails[258213] = { professionText = "Northrend Alchemy (60)",  recipeName = "Icecrown Plague Canister"}

-- Profession: Northrend Blacksmithing (60)
Gallery.ItemDetails[257040] = { professionText = "Northrend Blacksmithing (60)",  recipeName = "Dalaran Runic Anvil"}
Gallery.ItemDetails[264676] = { professionText = "Northrend Blacksmithing (60)",  recipeName = "Dalaran Sewer Gate"}
Gallery.ItemDetails[264710] = { professionText = "Northrend Blacksmithing (60)",  recipeName = "Dalaran Sun Sconce"}

-- Profession: Northrend Enchanting (60)
Gallery.ItemDetails[257094] = { professionText = "Northrend Enchanting (60)",  recipeName = "Mark of the Mages' Eye"}
Gallery.ItemDetails[257101] = { professionText = "Northrend Enchanting (60)",  recipeName = "Stampwhistle's Postal Portal"}

-- Profession: Northrend Engineering (60)
Gallery.ItemDetails[264707] = { professionText = "Northrend Engineering (60)",  recipeName = "Resizable All-Purpose Gear"}
Gallery.ItemDetails[264708] = { professionText = "Northrend Engineering (60)",  recipeName = "Home Defense Gadget"}
Gallery.ItemDetails[264711] = { professionText = "Northrend Engineering (60)",  recipeName = "Joybuzz's Joyful Wall of Trains"}

-- Profession: Northrend Inscription (60)
Gallery.ItemDetails[258203] = { professionText = "Northrend Inscription (60)",  recipeName = "Silver Dalaran Bench"}
Gallery.ItemDetails[258204] = { professionText = "Northrend Inscription (60)",  recipeName = "Dalaran Post"}
Gallery.ItemDetails[258207] = { professionText = "Northrend Inscription (60)",  recipeName = "Dalaran Scholar's Bookcase"}
Gallery.ItemDetails[258209] = { professionText = "Northrend Inscription (60)",  recipeName = "Kirin Tor Crate"}
Gallery.ItemDetails[258210] = { professionText = "Northrend Inscription (60)",  recipeName = "Dalaran Street Sign"}

-- Profession: Northrend Jewelcrafting (60)
Gallery.ItemDetails[258208] = { professionText = "Northrend Jewelcrafting (60)",  recipeName = "Kirin Tor Sun Chandelier"}
Gallery.ItemDetails[258211] = { professionText = "Northrend Jewelcrafting (60)",  recipeName = "Kirin Tor Glass Table"}

-- Profession: Northrend Leatherworking (60)
Gallery.ItemDetails[257693] = { professionText = "Northrend Leatherworking (60)",  recipeName = "Snowfall Tribe Scare-Totem"}
Gallery.ItemDetails[258205] = { professionText = "Northrend Leatherworking (60)",  recipeName = "Wolvar Postbag"}

-- Profession: Northrend Tailoring (60)
Gallery.ItemDetails[258206] = { professionText = "Northrend Tailoring (60)",  recipeName = "Gilded Dalaran Banner"}
Gallery.ItemDetails[258298] = { professionText = "Northrend Tailoring (60)",  recipeName = "Kirin Tor Skyline Banner"}

-- Profession: Outland Alchemy (60)
Gallery.ItemDetails[264705] = { professionText = "Outland Alchemy (60)",  recipeName = "Glazed Sin'dorei Vial"}
Gallery.ItemDetails[264706] = { professionText = "Outland Alchemy (60)",  recipeName = "Shadow Council Torch"}
Gallery.ItemDetails[264709] = { professionText = "Outland Alchemy (60)",  recipeName = "Stranglekelp Sack"}
Gallery.ItemDetails[264899] = { professionText = "Outland Alchemy (60)",  recipeName = "Arakkoan Alchemist's Concoction"}
Gallery.ItemDetails[264900] = { professionText = "Outland Alchemy (60)",  recipeName = "Arakkoan Alchemist's Bottle"}

-- Profession: Outland Blacksmithing (60)
Gallery.ItemDetails[257035] = { professionText = "Outland Blacksmithing (60)",  recipeName = "Bronze Banner of the Exiled"}
Gallery.ItemDetails[257036] = { professionText = "Outland Blacksmithing (60)",  recipeName = "Draenei Smith's Anvil"}
Gallery.ItemDetails[257039] = { professionText = "Outland Blacksmithing (60)",  recipeName = "Draenei Crystal Forge"}

-- Profession: Outland Enchanting (60)
Gallery.ItemDetails[257037] = { professionText = "Outland Enchanting (60)",  recipeName = "Draenei Holo-Dais"}
Gallery.ItemDetails[257038] = { professionText = "Outland Enchanting (60)",  recipeName = "Draenei Holo-Path"}
Gallery.ItemDetails[257093] = { professionText = "Outland Enchanting (60)",  recipeName = "Aldor Stellar Console"}

-- Profession: Outland Engineering (60)
Gallery.ItemDetails[258193] = { professionText = "Outland Engineering (60)",  recipeName = "Draenei Holo-Projector Pedestal"}
Gallery.ItemDetails[258194] = { professionText = "Outland Engineering (60)",  recipeName = "Tempest Keep Cryo-Pod"}
Gallery.ItemDetails[258196] = { professionText = "Outland Engineering (60)",  recipeName = "Draenei Transmitter"}

-- Profession: Outland Inscription (60)
Gallery.ItemDetails[258192] = { professionText = "Outland Inscription (60)",  recipeName = "Talon King's Totem"}
Gallery.ItemDetails[258197] = { professionText = "Outland Inscription (60)",  recipeName = "Crystal Signpost"}
Gallery.ItemDetails[258198] = { professionText = "Outland Inscription (60)",  recipeName = "Gilded Draenei Round Table"}
Gallery.ItemDetails[258199] = { professionText = "Outland Inscription (60)",  recipeName = "Aldor Bookcase"}
Gallery.ItemDetails[258215] = { professionText = "Outland Inscription (60)",  recipeName = "Halaa Bench"}

-- Profession: Outland Jewelcrafting (60)
Gallery.ItemDetails[258200] = { professionText = "Outland Jewelcrafting (60)",  recipeName = "Shattrath Sconce"}
Gallery.ItemDetails[258201] = { professionText = "Outland Jewelcrafting (60)",  recipeName = "Shattrath Lamppost"}
Gallery.ItemDetails[262347] = { professionText = "Outland Jewelcrafting (60)",  recipeName = "Draenei Crystal Chandelier"}

-- Profession: Outland Leatherworking (60)
Gallery.ItemDetails[258190] = { professionText = "Outland Leatherworking (60)",  recipeName = "Outland Mag'har Banner"}
Gallery.ItemDetails[258191] = { professionText = "Outland Leatherworking (60)",  recipeName = "Arakkoa Decoy Scarecrow"}

-- Profession: Outland Tailoring (60)
Gallery.ItemDetails[258195] = { professionText = "Outland Tailoring (60)",  recipeName = "Draenei Weaver's Loom"}
Gallery.ItemDetails[258202] = { professionText = "Outland Tailoring (60)",  recipeName = "Grand Drape of the Exiles"}

-- Profession: Pandaria Alchemy (60)
Gallery.ItemDetails[257043] = { professionText = "Pandaria Alchemy (60)",  recipeName = "Pandaren Alchemist's Retort"}
Gallery.ItemDetails[258214] = { professionText = "Pandaria Alchemy (60)",  recipeName = "Pandaren Alchemist's Kit"}

-- Profession: Pandaria Blacksmithing (60)
Gallery.ItemDetails[247661] = { professionText = "Pandaria Blacksmithing (60)",  recipeName = "Pandaren Signal Brazier"}
Gallery.ItemDetails[247752] = { professionText = "Pandaria Blacksmithing (60)",  recipeName = "Pandaren Fireplace"}

-- Profession: Pandaria Cooking (60)
Gallery.ItemDetails[247220] = { professionText = "Pandaria Cooking (60)",  recipeName = "Mushan Dumpling Stack"}

-- Profession: Pandaria Enchanting (60)
Gallery.ItemDetails[257096] = { professionText = "Pandaria Enchanting (60)",  recipeName = "Pandaren Table Lamp"}
Gallery.ItemDetails[257097] = { professionText = "Pandaria Enchanting (60)",  recipeName = "Intense Mogu Brazier"}

-- Profession: Pandaria Engineering (60)
Gallery.ItemDetails[247733] = { professionText = "Pandaria Engineering (60)",  recipeName = "Halfhill Cookpot"}
Gallery.ItemDetails[258216] = { professionText = "Pandaria Engineering (60)",  recipeName = "Reconstructed Mogu Lightning Drill"}

-- Profession: Pandaria Inscription (60)
Gallery.ItemDetails[245513] = { professionText = "Pandaria Inscription (60)",  recipeName = "Square Pandaren Table"}
Gallery.ItemDetails[245514] = { professionText = "Pandaria Inscription (60)",  recipeName = "Pandaren Wooden Table"}
Gallery.ItemDetails[247669] = { professionText = "Pandaria Inscription (60)",  recipeName = "Lorewalker's Bookcase"}
Gallery.ItemDetails[247731] = { professionText = "Pandaria Inscription (60)",  recipeName = "Hanging Paper Lanterns"}
Gallery.ItemDetails[247735] = { professionText = "Pandaria Inscription (60)",  recipeName = "Lucky Traveler's Bench"}

-- Profession: Pandaria Jewelcrafting (60)
Gallery.ItemDetails[245509] = { professionText = "Pandaria Jewelcrafting (60)",  recipeName = "Pandaren Stone Wall"}
Gallery.ItemDetails[247728] = { professionText = "Pandaria Jewelcrafting (60)",  recipeName = "Pandaren Stone Post"}
Gallery.ItemDetails[247736] = { professionText = "Pandaria Jewelcrafting (60)",  recipeName = "Jade Temple Dragon Fountain"}

-- Profession: Pandaria Leatherworking (60)
Gallery.ItemDetails[247767] = { professionText = "Pandaria Leatherworking (60)",  recipeName = "Wise Pandaren's Bed"}
Gallery.ItemDetails[247856] = { professionText = "Pandaria Leatherworking (60)",  recipeName = "Serenity Peak Tent"}

-- Profession: Pandaria Tailoring (60)
Gallery.ItemDetails[247738] = { professionText = "Pandaria Tailoring (60)",  recipeName = "Pandaren Meander Rug"}
Gallery.ItemDetails[258302] = { professionText = "Pandaria Tailoring (60)",  recipeName = "Pandaren Fishing Net"}

-- Profession: Shadowlands Alchemy (140)
Gallery.ItemDetails[257050] = { professionText = "Shadowlands Alchemy (140)",  recipeName = "Veil-Secured Animacone"}
Gallery.ItemDetails[257051] = { professionText = "Shadowlands Alchemy (140)",  recipeName = "Sintallow Candles"}

-- Profession: Shadowlands Blacksmithing (80)
Gallery.ItemDetails[257048] = { professionText = "Shadowlands Blacksmithing (80)",  recipeName = "Aspirant's Meditation Pool"}
Gallery.ItemDetails[257049] = { professionText = "Shadowlands Blacksmithing (80)",  recipeName = "Bejeweled Venthyr Chalice"}

-- Profession: Shadowlands Cooking (60)
Gallery.ItemDetails[246705] = { professionText = "Shadowlands Cooking (60)",  recipeName = "Caramel Mint Noodle Dish"}

-- Profession: Shadowlands Enchanting (90)
Gallery.ItemDetails[257098] = { professionText = "Shadowlands Enchanting (90)",  recipeName = "Venthyr Anima Bottle"}
Gallery.ItemDetails[258237] = { professionText = "Shadowlands Enchanting (90)",  recipeName = "Ardenweald Lamppost"}

-- Profession: Shadowlands Engineering (80)
Gallery.ItemDetails[258240] = { professionText = "Shadowlands Engineering (80)",  recipeName = "Kyrian Anima Barrel"}
Gallery.ItemDetails[258252] = { professionText = "Shadowlands Engineering (80)",  recipeName = "Cartel Xy Capture Crate"}

-- Profession: Shadowlands Inscription (80)
Gallery.ItemDetails[258235] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Aspiring Soul's Chair"}
Gallery.ItemDetails[258239] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Tome of Maldraxxian Rituals"}
Gallery.ItemDetails[258242] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Hollow Night Fae Shrine"}
Gallery.ItemDetails[258244] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Broker's Hex Table"}
Gallery.ItemDetails[258245] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Ardenweald Hanging Baskets"}
Gallery.ItemDetails[258247] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Large Revendreth Storage Crate"}
Gallery.ItemDetails[258250] = { professionText = "Shadowlands Inscription (80)",  recipeName = "Cartel Ta Bookcase"}

-- Profession: Shadowlands Jewelcrafting (80)
Gallery.ItemDetails[260699] = { professionText = "Shadowlands Jewelcrafting (80)",  recipeName = "Maldraxxian Runic Tablet"}
Gallery.ItemDetails[262663] = { professionText = "Shadowlands Jewelcrafting (80)",  recipeName = "Kyrian Floating Lamp"}

-- Profession: Shadowlands Leatherworking (80)
Gallery.ItemDetails[258238] = { professionText = "Shadowlands Leatherworking (80)",  recipeName = "Maldraxxian Crate"}
Gallery.ItemDetails[258248] = { professionText = "Shadowlands Leatherworking (80)",  recipeName = "Margrave's Stitched Leather Rug"}

-- Profession: Shadowlands Tailoring (80)
Gallery.ItemDetails[258561] = { professionText = "Shadowlands Tailoring (80)",  recipeName = "Kyrian Aspirant's Rolled Cushion"}
Gallery.ItemDetails[264678] = { professionText = "Shadowlands Tailoring (80)",  recipeName = "Aspirant's Ringed Banner"}
Gallery.ItemDetails[264713] = { professionText = "Shadowlands Tailoring (80)",  recipeName = "Heart of the Forest Banner"}

end

do-- Drops
-- Drop: Advisor Melandrus
Gallery.ItemDetails[247913] = { dropName = "Advisor Melandrus" }

-- Drop: Belo'ren
Gallery.ItemDetails[264187] = { dropName = "Belo'ren" }

-- Drop: Charonus
Gallery.ItemDetails[264336] = { dropName = "Charonus" }

-- Drop: Chimaerus
Gallery.ItemDetails[264246] = { dropName = "Chimaerus" }
Gallery.ItemDetails[265950] = { dropName = "Chimaerus" }
Gallery.ItemDetails[266886] = { dropName = "Chimaerus" }
Gallery.ItemDetails[267645] = { dropName = "Chimaerus" }

-- Drop: Crown of the Cosmos
Gallery.ItemDetails[265951] = { dropName = "Crown of the Cosmos" }
Gallery.ItemDetails[266887] = { dropName = "Crown of the Cosmos" }
Gallery.ItemDetails[268049] = { dropName = "Crown of the Cosmos" }
Gallery.ItemDetails[269269] = { dropName = "Crown of the Cosmos" }

-- Drop: Dargrul
Gallery.ItemDetails[245451] = { dropName = "Dargrul" }

-- Drop: Darkshore Rares
Gallery.ItemDetails[241066] = { dropName = "Darkshore Rares" }
Gallery.ItemDetails[245462] = { dropName = "Darkshore Rares" }
Gallery.ItemDetails[245627] = { dropName = "Darkshore Rares" }
Gallery.ItemDetails[246110] = { dropName = "Darkshore Rares" }

-- Drop: Midnight Delves
Gallery.ItemDetails[251967] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[263036] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[263042] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[263233] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[264258] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[264329] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[264330] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[264342] = { dropName = "Midnight Delves" }
Gallery.ItemDetails[267009] = { dropName = "Midnight Delves" }

-- Drop: Vanessa Vancleef
Gallery.ItemDetails[248332] = { dropName = "Vanessa Vancleef" }

-- Drop: Degentrius
Gallery.ItemDetails[263230] = { dropName = "Degentrius" }

--Highmountain Paragon Chest
Gallery.ItemDetails[257724] = { dropName = "Highmountain Paragon Chest" }

--Theater Troup
Gallery.ItemDetails[245294] = { dropName = "Distinguished Actor's Chest" }

-- Drop: Echo of Doragosa
Gallery.ItemDetails[260359] = { dropName = "Echo of Doragosa" }

-- Drop: Emperor Dagran Thaurissan
Gallery.ItemDetails[246429] = { dropName = "Emperor Dagran Thaurissan" }

-- Drop: Fallen-King Salhadaar
Gallery.ItemDetails[264494] = { dropName = "Fallen-King Salhadaar" }

-- Drop: Garrosh Hellscream
Gallery.ItemDetails[253242] = { dropName = "Garrosh Hellscream" }

-- Drop: General Amias Bellamy
Gallery.ItemDetails[262957] = { dropName = "General Amias Bellamy" }

--Golden
Gallery.ItemDetails[248934] = { dropName = "Frederick the Fabulous"}

-- Drop: Goldie Baronbottom
Gallery.ItemDetails[245560] = { dropName = "Goldie Baronbottom" }

-- Drop: Harlan Sweete
Gallery.ItemDetails[246421] = { dropName = "Harlan Sweete" }

-- Drop: High Sage Viryx
Gallery.ItemDetails[258744] = { dropName = "High Sage Viryx" }

-- Drop: Imperator Averzian
Gallery.ItemDetails[264497] = { dropName = "Imperator Averzian" }

-- Drop: King Mechagon
Gallery.ItemDetails[255672] = { dropName = "King Mechagon" }

-- Drop: Kyrakka and Erkhart Stormvein	
Gallery.ItemDetails[256428] = { dropName = "Kyrakka and Erkhart Stormvein"}

-- Drop: L'ura
Gallery.ItemDetails[241044] = { dropName = "L'ura" }

-- Drop: Lithiel Cinderfury
Gallery.ItemDetails[263238] = { dropName = "Lithiel Cinderfury" }

-- Drop: Lord Godfrey
Gallery.ItemDetails[244655] = { dropName = "Lord Godfrey" }

-- Drop: Lothraxion
Gallery.ItemDetails[264338] = { dropName = "Lothraxion" }



-- Drop: Midnight Falls
Gallery.ItemDetails[264492] = { dropName = "Midnight Falls" }
Gallery.ItemDetails[265949] = { dropName = "Midnight Falls" }
Gallery.ItemDetails[266885] = { dropName = "Midnight Falls" }
Gallery.ItemDetails[267646] = { dropName = "Midnight Falls" }

-- Drop: Nalorakk
Gallery.ItemDetails[264332] = { dropName = "Nalorakk" }

-- Drop: Prioress Murrpray
Gallery.ItemDetails[245938] = { dropName = "Prioress Murrpray" }

-- Drop: Rak'tul
Gallery.ItemDetails[264717] = { dropName = "Rak'tul" }

-- Drop: Restless Heart
Gallery.ItemDetails[256683] = { dropName = "Restless Heart" }

-- Drop: Rotmire
Gallery.ItemDetails[247235] = { dropName = "Rotmire" }

-- Drop: Scourgelord Tyrannus
Gallery.ItemDetails[267007] = { dropName = "Scourgelord Tyrannus" }

-- Drop: Sha of Doubt
Gallery.ItemDetails[246846] = { dropName = "Sha of Doubt" }

-- Drop: Shade of Xavius
Gallery.ItemDetails[238857] = { dropName = "Shade of Xavius" }

-- Drop: Skulloc
Gallery.ItemDetails[245434] = { dropName = "Skulloc" }

-- Drop: Spellblade Aluriel
Gallery.ItemDetails[256682] = { dropName = "Spellblade Aluriel" }

-- Drop: Stormarion Cache
Gallery.ItemDetails[262608] = { dropName = "Stormarion Assault" }
Gallery.ItemDetails[264343] = { dropName = "Stormarion Assault" }	
Gallery.ItemDetails[264483] = { dropName = "Stormarion Assault" }

--Drop: Teron'gor
Gallery.ItemDetails[251331] = {dropName = "Teron'gor" }


-- Drop: The Darkness
Gallery.ItemDetails[258268] = { dropName = "The Darkness" }

-- Drop: Vaelgor
Gallery.ItemDetails[264491] = { dropName = "Vaelgor" }

-- Drop: Viz'aduum the Watcher
Gallery.ItemDetails[246865] = { dropName = "Viz'aduum the Watcher" }

-- Drop: Vol'zith the Whisperer
Gallery.ItemDetails[245681] = { dropName = "Vol'zith the Whisperer" }

-- Drop: Vorasius
Gallery.ItemDetails[264498] = { dropName = "Vorasius" }

-- Drop: Warlord Sargha
Gallery.ItemDetails[256354] = { dropName = "Warlord Sargha" }

-- Drop: Warlord Zaela
Gallery.ItemDetails[245435] = { dropName = "Warlord Zaela" }

-- Drop: Zaxasj the Speaker
Gallery.ItemDetails[267008] = { dropName = "Zaxasj the Speaker" }

-- Drop: Ziekket
Gallery.ItemDetails[253451] = { dropName = "Ziekket" }

-- Drops: Shadowmoon Valley Missive
Gallery.ItemDetails[241043] = { dropName = "Shadowmoon Valley Missive", note = "Missive: Assault on Shattrath Harbor" }
Gallery.ItemDetails[251329] = { dropName = "Shadowmoon Valley Missive", note = "Requires Missive: Assault on Socrethar's Rise" }
Gallery.ItemDetails[251547] = { dropName = "Shadowmoon Valley Missive", note = "Missive: Assault on the Heart of Shattrath" }

-- Drops: Mechagon
Gallery.ItemDetails[246481] = { dropName = "Mechagon", note = "Self-Assembling Homeware Kit" }
Gallery.ItemDetails[246599] = { dropName = "Mechagon", note = "Self-Assembling Homeware Kit" }
Gallery.ItemDetails[246600] = { dropName = "Mechagon", note = "Self-Assembling Homeware Kit" }
Gallery.ItemDetails[246602] = { dropName = "Mechagon", note = "Self-Assembling Homeware Kit" }

Gallery.ItemDetails[245320] = { dropName = "Undermine", note = "Requires Shipping and Handling Job Streak"}
Gallery.ItemDetails[257928] = { dropName = "Mechagon", note = "Strange Recycling Requisition"}

end 

do-- Treasures
-- Treasure: Gift of the Phoenix
Gallery.ItemDetails[263211] = { sourceAction = "Gift of the Phoenix", treasureName = "Gift of the Phoenix" }

-- Treasure: Glimmering Treasure Chest
Gallery.ItemDetails[245449] = {  sourceAction = "Withered Army Training", treasureName = "Glimmering Treasure Chest" }

-- Treasure: Incomplete Book of Sonnets
Gallery.ItemDetails[245282] = { sourceAction = "Incomplete Book of Sonnets", treasureName = "Incomplete Book of Sonnets" }

-- Treasure: Malignant Chest
Gallery.ItemDetails[264482] = { sourceAction = "Malignant Chest", treasureName = "Malignant Chest" }

-- Treasure: Reliquary's Lost Paint Supplies
Gallery.ItemDetails[246416] = { sourceAction = "Reliquary's Lost Paint Supplies", treasureName = "Reliquary's Lost Paint Supplies" }

-- Treasure: Stellar Stash
Gallery.ItemDetails[262467] = { sourceAction = "Stellar Stash", treasureName = "Stellar Stash" }

-- Treasure: Stone Vat
Gallery.ItemDetails[251912] = { sourceAction = "Stone Vat", treasureName = "Stone Vat" }

-- Treasure: Triple-Locked Safebox
Gallery.ItemDetails[243106] = { sourceAction = "Triple-Locked Safebox", treasureName = "Triple-Locked Safebox" }

-- Treasure: Undermine
Gallery.ItemDetails[245315] = { sourceAction = "Scraps Heaps", treasureName = "Uncovered Strongbox", note = "Chance to drop in any of the Scrap Heap Events"}

end

do-- Shop Only
Gallery.ItemDetails[256764] = { source = "vendor", shopName = "Diablo 2 DLC" }-- Sanctuary's Horadric Cube
Gallery.ItemDetails[259055] = { source = "vendor", shopName = "Hatred's Wolfpelt Rug", note = "Diablo 4 Pre-Order" }
Gallery.ItemDetails[259056] = { source = "vendor", shopName = "Prime Evil's Chest", note = "Diablo 4 Pre-Order" }
Gallery.ItemDetails[259057] = { source = "vendor", shopName = "Sanctuary's Chess Match", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259058] = { source = "vendor", shopName = "Sanctuary's Chess Board", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259059] = { source = "vendor", shopName = "Sanctuary Chess Dark Bishop", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259060] = { source = "vendor", shopName = "Sanctuary Chess Dark Rook", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259061] = { source = "vendor", shopName = "Sanctuary Chess Dark Queen", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259062] = { source = "vendor", shopName = "Sanctuary Chess Dark Pawn", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259063] = { source = "vendor", shopName = "Sanctuary Chess Dark Knight", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259064] = { source = "vendor", shopName = "Sanctuary Chess Dark King", note = "Diablo 4 Pre-Order"}  
Gallery.ItemDetails[259065] = { source = "vendor", shopName = "Sanctuary Chess Light Bishop", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259066] = { source = "vendor", shopName = "Sanctuary Chess Light Rook", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259067] = { source = "vendor", shopName = "Sanctuary Chess Light Queen", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259068] = { source = "vendor", shopName = "Sanctuary Chess Light Pawn", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259069] = { source = "vendor", shopName = "Sanctuary Chess Light Knight", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[259070] = { source = "vendor", shopName = "Sanctuary Chess Light King", note = "Diablo 4 Pre-Order"}
Gallery.ItemDetails[244668] = { source = "vendor", shopName = "Light-Infused Fountain", note = "Midnight Pre-Order"}
Gallery.ItemDetails[245939] = { source = "vendor", shopName = "Void-Corrupted Fountain", note = "Midnight Pre-Order"}
Gallery.ItemDetails[246414] = { source = "vendor", shopName = "Light-Infused Rotunda", note = "Midnight Pre-Order"}
Gallery.ItemDetails[248809] = { source = "vendor", shopName = "Void-Corrupted Rotunda", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252666] = { source = "vendor", shopName = "The High Exarch Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252667] = { source = "vendor", shopName = "The Ranger of the Void Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252668] = { source = "vendor", shopName = "The Harbinger Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[252669] = { source = "vendor", shopName = "The Redeemer Painting", note = "Midnight Pre-Order"}
Gallery.ItemDetails[263052] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Beloved Lion Plushie" }
Gallery.ItemDetails[263053] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Beloved Wolf Plushie" }
Gallery.ItemDetails[250798] = { source = "shop", priceText = "250 Hearthsteel", shopName = "Spring Blossom Shelf" }
Gallery.ItemDetails[250797] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Ceiling Light" }
Gallery.ItemDetails[253547] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Wreath" }
Gallery.ItemDetails[254417] = { source = "shop", priceText = "250 Hearthsteel", shopName = "Spring Blossom Hanging Chair" }
Gallery.ItemDetails[258568] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Window" }
Gallery.ItemDetails[258569] = { source = "shop", priceText = "800 Hearthsteel", shopName = "Spring Blossom Gazebo" }
Gallery.ItemDetails[263290] = { source = "shop", priceText = "250 Hearthsteel", shopName = "Spring Blossom Tree" }
Gallery.ItemDetails[266167] = { source = "shop", priceText = "600 Hearthsteel", shopName = "Spring Blossom Pond" }
Gallery.ItemDetails[263291] = { source = "shop", priceText = "300 Hearthsteel", shopName = "Spring Blossom Tree Pond"}  	
Gallery.ItemDetails[265555] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Spring Blossom Stepping Stone"}  		
Gallery.ItemDetails[265556] = { source = "shop", priceText = "300 Hearthsteel", shopName = "Spring Blossom Privacy Screen"} 		
Gallery.ItemDetails[265557] = { source = "shop", priceText = "20 Hearthsteel", shopName = "Spring Blossom Stepping Stone Duo"}	
Gallery.ItemDetails[265558] = { source = "shop", priceText = "30 Hearthsteel", shopName = "Spring Blossom Stepping Stone Trio"} 	
Gallery.ItemDetails[265559] = { source = "shop", priceText = "50 Hearthsteel", shopName = "Spring Blossom Stepping Stone Collection"}
Gallery.ItemDetails[266068] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Tea Set"}
Gallery.ItemDetails[266069] = { source = "shop", priceText = "300 Hearthsteel", shopName = "Spring Blossom Table"}
Gallery.ItemDetails[266165] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Spring Blossom Lantern"}
Gallery.ItemDetails[266166] = { source = "shop", priceText = "500 Hearthsteel", shopName = "Spring Blossom Tranquility Garden"}
Gallery.ItemDetails[250793] = { source = "shop", priceText = "250 Hearthsteel", shopName = "Lush Garden Trellis" } 
Gallery.ItemDetails[252419] = { source = "shop", priceText = "250 Hearthsteel", shopName = "Lush Garden Fungal Basin" }
Gallery.ItemDetails[253546] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Lush Garden Butterfly Sconce" }
Gallery.ItemDetails[258294] = { source = "shop", priceText = "50 Hearthsteel", shopName = "Lush Garden Gnome-Like Statue" }
Gallery.ItemDetails[258567] = { source = "shop", priceText = "250 Hearthsteel", shopName = "Lush Garden Fungal Chair" }
Gallery.ItemDetails[258888] = { source = "shop", priceText = "500 Hearthsteel", shopName = "Lush Garden Fungal Fountain" }
Gallery.ItemDetails[266070] = { source = "shop", priceText = "300 Hearthsteel", shopName = "Lush Garden Fungal Table" }
Gallery.ItemDetails[266163] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Lush Garden Fungal Planter" }
Gallery.ItemDetails[264692] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Lush Garden Window"}					
Gallery.ItemDetails[266162] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Lush Garden Hedge"} 
Gallery.ItemDetails[266163] = { source = "shop", priceText = "100 Hearthsteel", shopName = "Lush Garden Fungal Planter"} 
Gallery.ItemDetails[266164] = { source = "shop", priceText = "200 Hearthsteel", shopName = "Lush Garden Fungal Picnic"} 	
Gallery.ItemDetails[267203] = { source = "shop", priceText = "500 Hearthsteel", shopName = "Lush Garden Stable"}
Gallery.ItemDetails[268550] = { source = "shop", priceText = "200 Hearthsteel", shopName = "Lush Garden Rug"}	
Gallery.ItemDetails[260727] = { source = "shop", priceText = "200 Hearthsteel", shopName = "Alliance Doormat" }
Gallery.ItemDetails[260728] = { source = "shop", priceText = "200 Hearthsteel", shopName = "Horde Doormat" }
Gallery.ItemDetails[250794] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Colorful Shroomic Egg"}
Gallery.ItemDetails[250795] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Colorful Dotted Egg"}
Gallery.ItemDetails[250796] = { source = "shop", priceText = "10 Hearthsteel", shopName = "Colorful Striped Egg"}

end

-- ============================================================
-- Shared achievement unlock groups
-- These are gallery-only mappings.
--
-- Use this when one achievement unlocks access to multiple
-- vendor-sold decor items.
-- ============================================================

local function ApplyGalleryAchievementUnlock(achievementID, achievementName, category, itemIDs)
    Gallery.ItemDetails = Gallery.ItemDetails or {}

    for _, itemID in ipairs(itemIDs or {}) do
        local details = Gallery.ItemDetails[itemID] or {}

        -- Force these because this group is intentional gallery-only data.
        details.achievementID = achievementID
        details.achievementName = achievementName
        details.category = details.category or category

        Gallery.ItemDetails[itemID] = details
    end
end

ApplyGalleryAchievementUnlock(
    42117,
    "The War of Light and Shadow",
    "Quests",
    {
        253602,
        253603,
        253604,
        253605,
        253607,
        253608,
        253614,
        253615,
        253616,
        253617,
        253618,
        253619,
        253620,
    }
)

ApplyGalleryAchievementUnlock(
    63343,
    "Goal!",
    "Promotions",
    {
        274731,
        274734,
        274736,
    }
)

ApplyGalleryAchievementUnlock(
    63384,
    "Prepared for a Showdown",
    "Void Assaults",
    {
		276316,
		276429,
		276432,
    }
)

ApplyGalleryAchievementUnlock(
    62905,
    "Pain of Command",
    "Void Assaults",
    {
		276321,
		276318,
		267211,
    }
)
