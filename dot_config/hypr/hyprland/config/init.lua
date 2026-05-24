local current_path = ...

local sub_configs = {
  "animations",
  "cursor",
  "decoration",
  "dwindle",
  "ecosystem",
  "general",
  "gestures",
  "input",
  "master",
  "misc",
  "scrolling",
}

local config_table = {}

for _, name in ipairs(sub_configs) do
  config_table[name] = require(current_path .. "." .. name)
end

hl.config(config_table)
