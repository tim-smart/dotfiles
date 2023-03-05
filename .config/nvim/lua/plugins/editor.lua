return {
  startup = function(use)
    use 'mfussenegger/nvim-dap'

    use {
      'rcarriga/nvim-dap-ui',
      config = function() require 'dapui'.setup {} end
    }

    use 'tpope/vim-sleuth'
    use {
      'tpope/vim-fugitive',
      opt = true,
      cmd = { 'G', 'Gr', 'Gw', 'Gdiff' }
    }
    use 'andweeb/presence.nvim'

    use {
      'ibhagwan/fzf-lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      opt = true,
      cmd = 'FzfLua'
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use { 'stefandtw/quickfix-reflector.vim' }

    use {
      'mbbill/undotree',
      opt = true,
      cmd = "UndotreeToggle",
      config = function()
        vim.g.undotree_SetFocusWhenToggle = true
      end
    }

    use {
      'vim-test/vim-test',
      cmd = { 'TestNearest', 'TestFile' },
      config = function()
        vim.g['test#strategy'] = 'dispatch'
      end
    }

    use {
      'tpope/vim-dispatch',
      cmd = { 'Dispatch', 'Dispatch!' },
    }

    use { 'github/copilot.vim' }
  end
}
