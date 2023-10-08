return {
    {
        'tamago324/nlsp-settings.nvim',
        config = function()
            require 'nlspsettings'.setup {
                append_default_schemas = true
            }
        end
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'b0o/schemastore.nvim',
            'lukas-reineke/lsp-format.nvim',
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = require 'config.lspconfig',
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = require 'config.null-ls'
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'lukas-reineke/lsp-format.nvim'
        },
        config = require 'config.nvim-cmp'
    },

    "rafamadriz/friendly-snippets",

    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        lazy = true,
        cmd = 'TroubleToggle',
        config = function()
            require("trouble").setup {}
        end
    }
}
