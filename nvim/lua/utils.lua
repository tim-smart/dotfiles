local nnoremap = function(key, action)
  vim.keymap.set('n', key, action, { noremap = true, silent = true })
end

local nnoremapfn = function(key, action)
  vim.keymap.set('n', key, '', { noremap = true, silent = true, callback = action })
end

return {
  nnoremap = nnoremap,
  nnoremapfn = nnoremapfn,
}
