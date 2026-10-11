local state = require("hyprland.state")

local device = {
	name = "asue120d:00-04f3:31fb-touchpad",
	enabled = state.get("touchpad", false),
	accel_profile = "adaptive",
}

hl.device(device)

return device
