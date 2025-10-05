return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},

	"jeffkreeftmeijer/vim-numbertoggle",

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			if require("utils").is_night() then
				vim.opt.background = "dark"
				vim.cmd("colorscheme tokyonight-storm")
			else
				vim.opt.background = "light"
				vim.cmd("colorscheme tokyonight-day")
			end
		end,
	},

	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme tokyonight-storm")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme tokyonight-day")
			end,
			update_interval = 3000,
			fallback = "light",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup()
		end,
	},
}
