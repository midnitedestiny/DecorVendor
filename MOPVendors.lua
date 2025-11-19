local MOPVendors = {
{
  name = "Mists of Pandaria",
  continents = {
    {
      name = "Jade Forest",
      vendors = {
        { zone = "Arboretum", name = "San Redscale", faction = "Neutral", mapID = 371, x = 0.5673, y = 0.4439 },
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
        { zone = "One Keg", name = "Brother Furtrim", faction = "Neutral", mapID = 379, x = 0.5722, y = 0.6101 },
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
        { zone = "Shrine of 2 Moons", name = "Sage Lotusbloom", faction = "Horde", mapID = 390, x = 0.6281, y = 0.2336 },
		{ zone = "Shrine of 2 Moons", name = "Jaluu the Generous", faction = "Horde", mapID = 390, x = TBA , y = TBA },
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
        { zone = "Shrine of 7 Stars", name = "Sage Whiteheart", faction = "Alliance", mapID = 390, x = 0.8464, y = 0.6364 },
		{ zone = "Shrine of 7 Stars", name = "Jaluu the Generous", faction = "Alliance", mapID = 390, x = TBA, y = TBA },
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
        { zone = "Seat of Knowledge", name = "Tan Shin Tao", faction = "Neutral", mapID = 390, x = 0.8229, y = 0.2938 },
        { zone = "Seat of Knowledge", name = "Lali the Assistant", faction = "Neutral", mapID = 390, x = 0.8278, y = 0.3069 },
      }
    },
  }
},
}

-- Make accessible to other files
_G.MOPVendors = MOPVendors