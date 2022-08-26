return {
  startup = function(use)
    use {
      'neovim/nvim-lspconfig',
      requires = { 'lukas-reineke/lsp-format.nvim' },
      config = require 'config.lspconfig',
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = require 'config.null-ls'
    }

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'lukas-reineke/lsp-format.nvim'
      },
      config = require 'config.nvim-cmp'
    }

    use "rafamadriz/friendly-snippets"

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      opt = true,
      cmd = 'TroubleToggle',
      config = function()
        require("trouble").setup {}
      end
    }
  end
}
