require('common')
require('plugins')

if not vim.g.vscode then
  require('neovim')
  require('keymaps')
end
