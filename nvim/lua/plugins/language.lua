return {
  startup = function(use)
    use {
      'akinsho/flutter-tools.nvim',
      requires = 'nvim-lua/plenary.nvim',
      opt = true,
      ft = { 'dart' },
      config = require 'config.flutter-tools'
    }
    use {
      'jose-elias-alvarez/typescript.nvim',
      opt = true,
      ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
      config = require 'config.typescript'
    }
    use {
      'elixir-editors/vim-elixir',
      opt = true,
      ft = { 'elixir' }
    }
  end
}
