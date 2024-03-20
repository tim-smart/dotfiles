return {
    {
        'tamago324/nlsp-settings.nvim',
        config = function()
            require 'nlspsettings'.setup {
                config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
                local_settings_dir = ".nlsp-settings",
                local_settings_root_markers_fallback = { '.git' },
                append_default_schemas = true,
                loader = 'json'
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
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'lukas-reineke/lsp-format.nvim',
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" }
            },
            'saadparwaiz1/cmp_luasnip'
        },
        config = require 'config.nvim-cmp'
    },

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
