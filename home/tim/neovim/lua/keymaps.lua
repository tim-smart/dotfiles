local noremap = require 'utils'.noremap

-- write
noremap('n', '<Leader>w', ':w<CR>')

-- undo
noremap('n', '<leader>u', ':UndotreeToggle<CR>')

-- git
noremap('n', '<Leader>gg', ':G<CR>')
noremap('n', '<Leader>gp', ':G push<CR>')
noremap('n', '<Leader>gu', ':G pull<CR>')

-- fzf
noremap('n', '<c-P>', ':FzfLua files<CR>')
noremap('n', '<c-G>', ':FzfLua grep<CR>')

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  end,
})

-- dap
noremap('n', '<F5>', function() require 'dap'.continue() end)
noremap('n', '<F10>', function() require 'dap'.step_over({}) end)
noremap('n', '<F11>', function() require 'dap'.step_into() end)
noremap('n', '<F12>', function() require 'dap'.step_out() end)
noremap('n', '<Leader>b', function() require 'dap'.toggle_breakpoint() end)
noremap('n', '<Leader>dr', function() require 'dap'.repl.open() end)
noremap('n', '<Leader>dl', function() require 'dap'.run_last() end)

-- dap-ui
noremap('n', '<Leader>dd', function()
  require 'dapui'.toggle({})
end)

-- oil
noremap('n', '<leader>e', function()
  require('oil').open()
end)

-- luasnip
noremap('i', '<c-h>', function()
  require 'luasnip'.jump(1)
end)
noremap('s', '<c-h>', function()
  require 'luasnip'.jump(1)
end)
noremap('i', '<c-t>', function()
  require 'luasnip'.jump(-1)
end)
noremap('s', '<c-t>', function()
  require 'luasnip'.jump(-1)
end)

-- open quickfix on grep
vim.cmd [[
augroup keymaps
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
]]

-- close quickfix menu after selecting choice
vim.api.nvim_create_autocmd(
  "FileType", {
  pattern={"qf"},
  command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]})

-- tests
noremap('n', '<Leader>ts', function()
  require("neotest").summary.toggle()
end)
noremap('n', '<Leader>to', function()
  require("neotest").output.open({ enter = true })
end)
noremap('n', '<Leader>tn', function()
  require("neotest").run.run()
end)
noremap('n', '<Leader>tf', function()
  require("neotest").run.run(vim.fn.expand("%"))
end)
noremap('n', '<Leader>tw', function()
  require("neotest").watch.toggle(vim.fn.expand("%"))
end)

-- diagnostics float
noremap('n', '<Leader>i', function()
  vim.diagnostic.open_float()
end)

-- spectre
noremap('n', '<Leader>f', function()
  require("spectre").toggle()
end)

-- sneak
vim.keymap.set('n', '<Leader>s', "<Plug>Sneak_s", { silent = true })
vim.keymap.set('n', '<Leader>S', "<Plug>Sneak_S", { silent = true })

-- harpoon
noremap('n', '<Leader>h', function() require("harpoon"):list():add() end)
noremap('n', '<Leader>H', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end)
noremap("n", "<C-h>", function() require("harpoon"):list():select(1) end)
noremap("n", "<C-t>", function() require("harpoon"):list():select(2) end)
noremap("n", "<C-s>", function() require("harpoon"):list():select(3) end)
noremap("n", "<C-n>", function() require("harpoon"):list():select(4) end)
