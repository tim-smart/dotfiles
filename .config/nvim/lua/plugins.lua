local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  require 'plugins.common'.startup(use)
  require 'plugins.lsp'.startup(use)
  require 'plugins.language'.startup(use)
  require 'plugins.editor'.startup(use)
  require 'plugins.ui'.startup(use)

  if packer_bootstrap then
    require('packer').sync()
  end
end)
