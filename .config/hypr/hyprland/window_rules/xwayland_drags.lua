hl.window_rule({
	-----------
	-- PROPS --
	-----------
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	---------------------
	-- DYNAMIC EFFECTS --
	---------------------
	no_focus = true,
})
