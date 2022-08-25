local nnoremap = require 'utils'.nnoremap
local nnoremapfn = require 'utils'.nnoremapfn
local noremap = require 'utils'.noremap
local noremapfn = require 'utils'.noremapfn

-- undo
nnoremap('<leader>u', ':UndotreeToggle<CR>')

-- git
nnoremap('<Leader>gp', ':G push<CR>')
nnoremap('<Leader>gu', ':G pull<CR>')

-- fzf
nnoremap('<c-P>', ':FzfLua files<CR>')
nnoremap('<c-G>', ':FzfLua grep<CR>')

-- dap
nnoremapfn('<F5>', function() require 'dap'.continue() end)
nnoremapfn('<F10>', function() require 'dap'.step_over({}) end)
nnoremapfn('<F11>', function() require 'dap'.step_into() end)
nnoremapfn('<F12>', function() require 'dap'.step_out() end)
nnoremapfn('<Leader>b', function() require 'dap'.toggle_breakpoint() end)
nnoremapfn('<Leader>dr', function() require 'dap'.repl.open() end)
nnoremapfn('<Leader>dl', function() require 'dap'.run_last() end)

-- dap-ui
nnoremapfn('<Leader>dd', function()
  require 'dapui'.toggle({})
end)

-- nvim-tree
nnoremap('<leader>e', ':NvimTreeFindFileToggle<CR>')

-- touble
nnoremap('<Leader>xx', ':TroubleToggle<CR>')

-- luasnip
noremapfn('i', '<c-j>', function()
  require 'luasnip'.jump(1)
end)
noremapfn('s', '<c-j>', function()
  require 'luasnip'.jump(1)
end)
noremapfn('i', '<c-k>', function()
  require 'luasnip'.jump(-1)
end)
noremapfn('s', '<c-k>', function()
  require 'luasnip'.jump(-1)
end)
