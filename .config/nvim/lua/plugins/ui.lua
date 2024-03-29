return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup()
    end
  },

  'jeffkreeftmeijer/vim-numbertoggle',

  {
    'lifepillar/vim-solarized8',
    config = function()
      vim.cmd 'colorscheme solarized8'
      vim.opt.termguicolors = true

      -- dark mode
      if require 'utils'.is_night() then
        vim.opt.background = 'dark'
        vim.api.nvim_set_hl(0, 'NonText', { fg = "#005062" })
        vim.api.nvim_set_hl(0, 'SpecialKey', { fg = "#005062" })
      else
        vim.opt.background = 'light'
        vim.api.nvim_set_hl(0, 'NonText', { fg = "#C2BCAB" })
        vim.api.nvim_set_hl(0, 'SpecialKey', { fg = "#C2BCAB" })
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
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    cmd = 'NvimTreeFindFileToggle',
    config = function()
      require 'nvim-tree'.setup {}
    end
  },

  {
    'ldelossa/gh.nvim',
    dependencies = { 'ldelossa/litee.nvim' },
    config = function()
      require 'litee.lib'.setup()
      require 'litee.gh'.setup {}
    end
  }
}
