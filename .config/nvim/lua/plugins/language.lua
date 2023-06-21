return {
  startup = function(use)
    use {
      'akinsho/flutter-tools.nvim',
      requires = 'nvim-lua/plenary.nvim',
      ft = { 'dart' },
      cond = function()
        return vim.fn.executable('flutter') == 1
      end,
      config = require 'config.flutter-tools'
    }
    use {
      'elixir-editors/vim-elixir',
      ft = { 'elixir' }
    }
    use {
      'tpope/vim-rails',
      ft = { 'ruby' }
    }
  end
}
