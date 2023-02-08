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
      'jose-elias-alvarez/typescript.nvim',
      ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
      config = require 'config.typescript'
    }
    use {
      'elixir-editors/vim-elixir',
      ft = { 'elixir' }
    }
    use {
      'solarnz/thrift.vim',
      ft = { 'thrift' }
    }
    use {
      'tpope/vim-rails',
      ft = { 'ruby' }
    }
    use {
      'derekwyatt/vim-scala',
      ft = { 'scala' }
    }
  end
}
