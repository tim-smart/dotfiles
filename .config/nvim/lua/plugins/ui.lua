return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        show_end_of_line = true,
      }
    end
  },

  'jeffkreeftmeijer/vim-numbertoggle',

  {
    'lifepillar/vim-solarized8',
    config = function()
      vim.cmd 'colorscheme solarized8'
      vim.opt.termguicolors = true

      if require 'utils'.is_night() then
        vim.opt.background = 'dark'
        vim.cmd [[highlight NonText guifg=#005062 gui=nocombine]]
        vim.cmd [[highlight SpecialKey guifg=#005062 gui=nocombine]]
      else
        vim.opt.background = 'light'
        vim.cmd [[highlight NonText guifg=#C2BCAB gui=nocombine]]
        vim.cmd [[highlight SpecialKey guifg=#C2BCAB gui=nocombine]]
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
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    version = 'nightly',
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
