local modules = {
  "config",
  "device",
  "gesture",
  "bind.default",
  "monitor.default",
  "window_rule",
  "workspace_rule",
}

for _, module in ipairs(modules) do
  require("hyprland." .. module)
end
