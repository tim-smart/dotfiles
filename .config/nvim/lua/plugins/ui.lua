return {
  startup = function(use)
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup {
          show_end_of_line = true,
          char_highlight_list = {
            "IndentBlanklineIndent1",
          },
        }
      end
    }

    use 'jeffkreeftmeijer/vim-numbertoggle'

    use {
      'mbbill/undotree',
      opt = true,
      cmd = "UndotreeToggle"
    }

    use {
      'frankier/neovim-colors-solarized-truecolor-only',
      config = function()
        vim.cmd 'colorscheme solarized'
        vim.opt.termguicolors = true

        if require 'utils'.is_night() then
          vim.opt.background = 'dark'
          vim.cmd [[highlight IndentBlanklineIndent1 guifg=#005062 gui=nocombine]]
        else
          vim.opt.background = 'light'
          vim.cmd [[highlight IndentBlanklineIndent1 guifg=#C2BCAB gui=nocombine]]
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
  end
}
