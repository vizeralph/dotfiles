local touchpad = require("hyprland.devices.touchpad")
local state = require("hyprland.state")

return function()
	touchpad.enabled = not touchpad.enabled
	hl.device(touchpad)

	local saved, err = state.set("touchpad", touchpad.enabled)
	hl.notification.create({
		text = "Touchpad "
			.. (touchpad.enabled and "enabled" or "disabled")
			.. (saved and "" or " (state not saved: " .. err .. ")"),
		timeout = saved and 1500 or 3000,
		icon = saved and "info" or "warning",
	})
end
