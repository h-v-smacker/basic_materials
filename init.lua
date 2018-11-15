-- Minimal Basic Materials mod

-- A barebones verson of Basic Materials by Vanessa Dannenberg, aimed to provide only
-- the items involved in pipeworks mod technology chain.
-- For those of us who don't use homedecor and Co and have no use for most materials
-- from vanilla basic materials mod.

basic_materials = {}

-- marker to check for mod variety
basic_materials.mod = "minimal"

-- items --------------------------------------------------------------------------------

minetest.register_craftitem("basic_materials:oil_extract", {
	description = "Oil extract",
	inventory_image = "basic_materials_oil_extract.png",
})

minetest.register_craftitem("basic_materials:paraffin", {
	description = "Unprocessed paraffin",
	inventory_image = "basic_materials_paraffin.png",
})

minetest.register_craftitem("basic_materials:plastic_sheet", {
	description = "Plastic sheet",
	inventory_image = "basic_materials_plastic_sheet.png",
})

minetest.register_craftitem("basic_materials:gear_steel", {
	description = "Steel gear",
	inventory_image = "basic_materials_gear_steel.png"
})

-- crafts -------------------------------------------------------------------------------

minetest.register_craft({
	type = "shapeless",
	output = "basic_materials:oil_extract 3",
	recipe = {
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves",
		"group:leaves"
	}
})

minetest.register_craft({
	type = "cooking",
	output = "basic_materials:paraffin",
	recipe = "basic_materials:oil_extract",
})

minetest.register_craft({
	type = "cooking",
	output = "basic_materials:plastic_sheet",
	recipe = "basic_materials:paraffin",
})

minetest.register_craft( {
	output = "basic_materials:gear_steel 6",
	recipe = {
		{ "",                   "default:steel_ingot", ""                    },
		{ "default:steel_ingot","default:stone",       "default:steel_ingot" },
		{ "",                   "default:steel_ingot", ""                    }
	},
})

-- fuels --------------------------------------------------------------------------------

minetest.register_craft({
	type = "fuel",
	recipe = "basic_materials:plastic_sheet",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "basic_materials:oil_extract",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "basic_materials:paraffin",
	burntime = 30,
})

-- aliases ------------------------------------------------------------------------------

minetest.register_alias("homedecor:plastic_sheeting", "basic_materials:plastic_sheet")
minetest.register_alias("homedecor:oil_extract",      "basic_materials:oil_extract")
minetest.register_alias("homedecor:paraffin",         "basic_materials:paraffin")
minetest.register_alias("homedecor:plastic_base",     "basic_materials:paraffin")
minetest.register_alias("pipeworks:gear",             "basic_materials:gear_steel")
