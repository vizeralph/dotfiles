hl.config({
	general = {
		resize_on_border = true,
		snap = { enabled = true },
	},

	input = {
		numlock_by_default = true,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
			tap_to_click = false,
		},
	},

	gestures = { workspace_swipe_distance = 500 },

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		background_color = "#000000",
	},

	cursor = { hide_on_key_press = true },

	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},

	dwindle = { preserve_split = true },

	master = { new_status = "master" },
})
