return {
  startup = function(use)
    use {
      'neovim/nvim-lspconfig',
      config = require 'config.lspconfig'
    }
    use 'jose-elias-alvarez/null-ls.nvim'
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'lukas-reineke/lsp-format.nvim',
      },
      config = require 'config.nvim-cmp'
    }
  end
}
