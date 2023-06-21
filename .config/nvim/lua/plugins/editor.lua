return {
  startup = function(use)
    use {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate',
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = {
            "javascript",
            "typescript"
          },
          auto_install = true,
        }
      end
    }

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
      cmd = 'FzfLua',
      config = function()
        vim.cmd("FzfLua register_ui_select")
      end
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
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        { 'tim-smart/neotest-vitest', branch = "search-paths" }
      },
      config = function()
        require('neotest').setup({
          adapters = {
            require('neotest-vitest')
          },
          -- diagnostic = {
          --   enabled = false,
          -- }
        })
      end
    }

    use {
      'tpope/vim-dispatch',
      cmd = { 'Dispatch', 'Dispatch!' },
    }

    use { 'github/copilot.vim' }
  end
}
