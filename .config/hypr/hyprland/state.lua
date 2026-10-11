local directory = os.getenv("XDG_STATE_HOME")
if not directory or directory == "" then
	directory = os.getenv("HOME") .. "/.local/state"
end

local path = directory .. "/vize-hyprland"
os.execute('mkdir -p -- "${XDG_STATE_HOME:-$HOME/.local/state}"')
local values = {}

local file = io.open(path, "r")
if file then
	for line in file:lines() do
		local key, value = line:match("^([%w_]+)=([01])$")
		if key then
			values[key] = value == "1"
		end
	end
	file:close()
end

local function get(key, default)
	if values[key] == nil then
		return default
	end
	return values[key]
end

local function set(key, value)
	values[key] = value

	local output, err = io.open(path, "w")
	if not output then
		return false, err
	end

	local keys = {}
	for name in pairs(values) do
		keys[#keys + 1] = name
	end
	table.sort(keys)

	for _, name in ipairs(keys) do
		local written, write_err = output:write(name, "=", values[name] and "1" or "0", "\n")
		if not written then
			output:close()
			return false, write_err
		end
	end

	return output:close()
end

return { get = get, set = set }
