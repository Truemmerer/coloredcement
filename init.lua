--------------
-- Load Walls
--------------
local modpath = minetest.get_modpath(minetest.get_current_modname())
dofile(modpath.."/colored_walls.lua")

------------
-- VARIABLE
------------
local S = minetest.get_translator("coloredcement")
local coloredcementversion = "05-21 v1"


-- END VARIABLE
----------------

----------------------------
-- Version list chatcommand
----------------------------

minetest.register_chatcommand("coloredcement", {
  privs = {
      interact = true,
  },
  params = "",
  description = "Show Version of coloredcement.",

  func = function(player)
  minetest.chat_send_player(player, "coloredCement Version: ".. coloredcementversion)
end
})

-- END Version list chatcommand
-------------------------------

------------------------
-- Register hard Cement
------------------------
minetest.register_node("colordcement:hard", {
  description = S("Hard Cement"),
  tiles = {"cement_hard.png"},
  paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
  walkable = true,
	sunlight_propagates = false,
	groups = {cracky = 3, stone = 1, ud_param2_colorable = 1},
  drop = "colordcement:hard",
  sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "colordcement:hard 3",
  recipe = {
            {"default:sand", "default:gravel", "default:sand"},
            {"default:gravel", "default:gravel", "default:gravel"},
            {"default:sand", "default:gravel", "default:sand"}
  }
})


------------------------
-- Register Sanded Cement
------------------------

minetest.register_node("colordcement:sanded", {
  description = S("Sanded Cement"),
  tiles = {"cement_sanded.png"},
  paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
  walkable = true,
	sunlight_propagates = false,
	groups = {cracky = 3, stone = 1, ud_param2_colorable = 1},
  drop = "colordcement:sanded",
  sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
  output = "colordcement:sanded 3",
  recipe = {
            {"default:sand", "default:sand", "default:sand"},
            {"default:gravel", "default:gravel", "default:gravel"},
            {"default:sand", "default:sand", "default:sand"}
  }
})

-------------------------------
-- Register Sanded Cement Wall
-------------------------------
coloredwalls.register(":walls:cement_sanded", "Cement Sanded Wall", "cement_sanded.png",
        "coloredcement:sanded", default.node_sound_stone_defaults())

-----------------------------
-- Register Hard Cement Wall
-----------------------------
coloredwalls.register(":walls:cement_hard", "Cement Hard Wall", "cement_hard.png",
        "coloredcement:hard", default.node_sound_stone_defaults())
