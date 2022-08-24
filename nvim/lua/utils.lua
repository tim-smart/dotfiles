local nnoremap = function(key, action)
  vim.keymap.set('n', key, action, { noremap = true, silent = true })
end

local nnoremapfn = function(key, action)
  vim.keymap.set('n', key, '', { noremap = true, silent = true, callback = action })
end

local not_vscode = function() return not vim.g.vscode end

local use_not_vscode = function(use)
  return function(opts)
    if type(opts) == "string" then
      opts = { opts }
    end

    opts.cond = not_vscode

    return use(opts)
  end
end

return {
  not_vscode = not_vscode,
  nnoremap = nnoremap,
  nnoremapfn = nnoremapfn,
  use_not_vscode = use_not_vscode,
}
