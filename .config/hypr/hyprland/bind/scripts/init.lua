local current_path = ...

return setmetatable({}, {
  __index = function(_, key)
    return require(current_path .. "." .. key)
  end
})
