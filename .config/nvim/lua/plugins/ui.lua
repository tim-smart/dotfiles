return {
  startup = function(use)
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup {
          show_end_of_line = true,
        }
      end
    }

    use 'jeffkreeftmeijer/vim-numbertoggle'

    use {
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
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require 'lualine'.setup {}
      end
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      tag = 'nightly',
      opt = true,
      cmd = 'NvimTreeFindFileToggle',
      config = function()
        require 'nvim-tree'.setup {}
      end
    }

    use {
      'ldelossa/gh.nvim',
      requires = { 'ldelossa/litee.nvim' },
      config = function()
        require 'litee.lib'.setup()
        require 'litee.gh'.setup {}
      end
    }
  end
}
