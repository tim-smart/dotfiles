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
      cmd = { 'G', 'Gw', 'Gdiff' }
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

    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  end
}
