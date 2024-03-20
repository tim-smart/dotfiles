return {
  'tpope/vim-sleuth',
  {
    'tpope/vim-fugitive',
    lazy = true,
    cmd = { 'G', 'Gr', 'Gw', 'Gdiffsplit' }
  },
  'andweeb/presence.nvim',

  {
    'ibhagwan/fzf-lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    lazy = true,
    cmd = 'FzfLua',
    config = function()
      vim.cmd("FzfLua register_ui_select")
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end
  },

  {
    'mbbill/undotree',
    lazy = true,
    cmd = "UndotreeToggle",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = true
    end
  },

  { 'tpope/vim-dispatch' },

  { 'github/copilot.vim' },

  {
    "nvim-treesitter/nvim-treesitter",
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
        }
      })
    end,
  }
}
