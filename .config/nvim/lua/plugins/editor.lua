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
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      { "tim-smart/neotest-vitest", branch = "search-paths" }
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest")
        }
      })
    end
  }
}
