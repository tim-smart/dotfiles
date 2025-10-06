return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"b0o/schemastore.nvim",
			"lukas-reineke/lsp-format.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = require("config.lspconfig"),
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = require("config.nvim-cmp"),
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		opts = {}, -- for default options, refer to the configuration section for custom setup.
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim", "nvim-lua/plenary.nvim" },
		config = require("config.none-ls"),
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {},
	},
}
