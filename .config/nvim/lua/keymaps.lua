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

-- nvim-tree
noremap('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')

-- touble
noremap('n', '<Leader>xx', ':TroubleToggle<CR>')

-- luasnip
noremap('i', '<c-j>', function()
  require 'luasnip'.jump(1)
end)
noremap('s', '<c-j>', function()
  require 'luasnip'.jump(1)
end)
noremap('i', '<c-k>', function()
  require 'luasnip'.jump(-1)
end)
noremap('s', '<c-k>', function()
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

-- diagnostics float
noremap('n', '<Leader>i', function()
  vim.diagnostic.open_float()
end)
