local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

local function env()
  local name = 'neovim'
  if vim.g.vscode then
    name = 'vscode'
  end
  return name
end

require('packer').init {
  plugin_package = env()
}

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  require 'plugins.common'.startup(use)

  if not vim.g.vscode then
    require 'plugins.lsp'.startup(use)
    require 'plugins.language'.startup(use)
    require 'plugins.editor'.startup(use)
    require 'plugins.ui'.startup(use)
  end

  if packer_bootstrap then
    require('packer').sync()
  end
end)
