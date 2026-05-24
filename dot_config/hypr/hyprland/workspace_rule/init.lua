local current_file = debug.getinfo(1, "S").source:sub(2)
local dir_path = current_file:match("(.*[/\\])")

if dir_path then
  local require = require
  local prefix = (...)

  for file in io.popen('ls -1 "' .. dir_path .. '"'):lines() do
    local rule_name = file:match("([^/]+)%.lua$")

    if rule_name and rule_name ~= "init" then
      require(prefix .. "." .. rule_name)
    end
  end
end

