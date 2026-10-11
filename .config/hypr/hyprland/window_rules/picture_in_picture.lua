hl.window_rule({
	-----------
	-- PROPS --
	-----------
	match = { title = "^(Picture-in-Picture)$" },

	--------------------
	-- STATIC EFFECTS --
	--------------------
	float = true,
	pin = true,

	---------------------
	-- DYNAMIC EFFECTS --
	---------------------
	border_size = 0,
	rounding = 0,
	keep_aspect_ratio = true,
})
