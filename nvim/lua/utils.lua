local noremap = function(mode, key, action)
  vim.keymap.set(mode, key, action, { noremap = true, silent = true })
end

local noremapfn = function(mode, key, action)
  vim.keymap.set(mode, key, '', { noremap = true, silent = true, callback = action })
end

local nnoremap = function(key, action)
  vim.keymap.set('n', key, action, { noremap = true, silent = true })
end

local nnoremapfn = function(key, action)
  vim.keymap.set('n', key, '', { noremap = true, silent = true, callback = action })
end

local function is_night()
  local hour = tonumber(vim.fn.strftime("%H"))
  return hour >= 17 or hour < 7
end

return {
  noremap = noremap,
  noremapfn = noremapfn,
  nnoremap = nnoremap,
  nnoremapfn = nnoremapfn,
  is_night = is_night,
}
