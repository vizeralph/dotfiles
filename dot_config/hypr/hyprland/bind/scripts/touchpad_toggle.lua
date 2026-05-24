local function toggle_touchpad()
  local path = os.getenv("HOME") .. "/.config/hypr/hyprland/device/touchpad.lua"

  local f = io.open(path, "r")
  if not f then return end
  local content = f:read("*all")
  f:close()

  local new_content, count = content:gsub("enabled = true", "enabled = false")
  local state = "Disabled"
  if count == 0 then
    new_content = content:gsub("enabled = false", "enabled = true")
    state = "Enabled"
  end

  f = io.open(path, "w")
  if f then
    f:write(new_content)
    f:close()
    os.execute("notify-send -u low -t 1500 'Touchpad' '" .. state .. "'")
  end
end

return toggle_touchpad
