return {
  -- {
  --   'elixir-editors/vim-elixir',
  --   ft = { 'elixir' }
  -- },
  -- {
  --   'tpope/vim-rails',
  --   ft = { 'ruby' }
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
            "elixir",
            "html",
            "javascript",
            "lua",
            "ruby",
            "typescript",
            "vim",
            "vimdoc",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 },
}
