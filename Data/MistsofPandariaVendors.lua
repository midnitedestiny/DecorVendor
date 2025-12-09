local MOPVendors = {
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Jade Forest",
      vendors = {
        { zone = "Arboretum", faction = "neutral", id = 58414, title = "San Redscale", x = 56.8, y = 44.4, mapID = 371 },
      }
    },
  }
},
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Kun-Lai Summit",
      vendors = {
        { zone = "One Keg", faction = "neutral", id = 59698, title = "Brother Furtrim", x = 57.24, y = 60.96, mapID = 379 },
      }
    },
  }
},
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Valley of the Four Winds",
      vendors = {
        { zone = "Halfhill", faction = "neutral", d = 58706, title = "Gina Mudclaw", x = 53.2, y = 51.8, mapID = 376 },
      }
    },
  }
},
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Vale of Eternal Blossoms - Shrine of 2 Moons",
      vendors = {
        { zone = "Shrine of 2 Moons", faction = "horde", id = 64001, title = "Sage Lotusbloom", x = 62.8, y = 23.2, mapID = 390 },
      }
    },
  }
},
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Vale of Eternal Blossoms - Shrine of 7 Stars",
      vendors = {
        { zone = "Shrine of 7 Stars", id = 64032, title = "Sage Whiteheart", x = 85.2, y = 61.6, mapID = 1530, faction = "alliance" },
      }
    },
  }
},
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Vale of Eternal Blossoms",
      vendors = {
        { zone = "Seat of Knowledge", faction = "neutral", id = 64605, title = "Tan Shin Tiao", x = 82.23, y = 29.33, mapID = 390 },
        { zone = "Seat of Knowledge", faction = "neutral", id = 62088, title = "Lali the Assistant", x = 82.8, y = 30.8, mapID = 390 },
      }
    },
  }
},
}

-- Make accessible to other files
_G.MOPVendors = MOPVendors
