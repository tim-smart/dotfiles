return {
  startup = function(use)
    use 'mfussenegger/nvim-dap'
    use {
      'rcarriga/nvim-dap-ui',
      requires = 'mfussenegger/nvim-dap',
      config = function() require 'dapui'.setup {} end
    }

    use 'tpope/vim-sleuth'
    use { 'tpope/vim-fugitive', opt = true, cmd = 'G' }
    use 'andweeb/presence.nvim'

    use {
      'ibhagwan/fzf-lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      opt = true,
      cmd = 'FzfLua'
    }
  end
}
