return {
  startup = function(use)
    use 'nathanaelkane/vim-indent-guides'
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
        else
          vim.opt.background = 'light'
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
