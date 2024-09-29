# L_Meth
Simple FiveM meth script for esx framework with 3 steps ( Boiling, crushing and bagging ) using ox_target and ox lib. Didnt feel like doing a config or locale file but maybe in the future i will add those. Join my discord for support https://discord.gg/f7mWnAP5ve.

# Dependencies
- ox_lib
- ox_inventory
- ox_lib

# Install

- Download a release
- Add start l_meth in server.cfg
- Add this to ox_inventory/data/items.lua 
    ["boiledmeth"] = {
        label = "Keitetty meta",
        weight = 150,
        stack = true,
        close = true,
    },

    ["crushedmeth"] = {
        label = "Murskattu meta",
        weight = 145,
        stack = true,
        close = true,
    },

    ['meth'] = {
      label = 'Meta 5G', 
      weight = 5, 
      stack = true, 
    },
  - Start your server and should be ready to go!
