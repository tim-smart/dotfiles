local nnoremap = function(key, action)
  vim.keymap.set('n', key, action, { noremap = true, silent = true })
end

local nnoremapfn = function(key, action)
  vim.keymap.set('n', key, '', { noremap = true, silent = true, callback = action })
end

local function is_night()
  local hour = tonumber(vim.fn.strftime("%H"))
  return hour >= 17 or hour <= 7
end

return {
  nnoremap = nnoremap,
  nnoremapfn = nnoremapfn,
  is_night = is_night,
}
