local noremap = function(mode, key, action)
  vim.keymap.set(mode, key, action, { noremap = true, silent = true })
end

local function is_night()
  local hour = tonumber(vim.fn.strftime("%H"))
  return hour >= 17 or hour < 7
end

return {
  noremap = noremap,
  is_night = is_night,
}
