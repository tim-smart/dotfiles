local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  local use_not_vscode = require 'utils'.use_not_vscode(use)

  use 'wbthomason/packer.nvim'

  require 'plugins.common'.startup(use)
  require 'plugins.lsp'.startup(use_not_vscode)
  require 'plugins.language'.startup(use_not_vscode)
  require 'plugins.editor'.startup(use_not_vscode)
  require 'plugins.ui'.startup(use_not_vscode)

  if packer_bootstrap then
    require('packer').sync()
  end
end)
