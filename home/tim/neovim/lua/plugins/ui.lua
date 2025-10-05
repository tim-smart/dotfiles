return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup()
    end
  },

  'jeffkreeftmeijer/vim-numbertoggle',

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- dark mode
      if require 'utils'.is_night() then
        vim.opt.background = 'dark'
        vim.cmd 'colorscheme tokyonight-storm'
      else
        vim.opt.background = 'light'
        vim.cmd 'colorscheme tokyonight-day'
      end
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'lualine'.setup {}
    end
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function ()
      require("oil").setup()
    end
  },

  -- {
  --   'ldelossa/gh.nvim',
  --   dependencies = { 'ldelossa/litee.nvim' },
  --   config = function()
  --     require 'litee.lib'.setup()
  --     require 'litee.gh'.setup {}
  --   end
  -- }
}
