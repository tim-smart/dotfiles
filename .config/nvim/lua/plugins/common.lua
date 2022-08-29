return {
  startup = function(use)
    use 'tpope/vim-unimpaired'
    use 'vim-scripts/matchit.zip'
    use 'tpope/vim-abolish'
    use 'tpope/vim-endwise'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'jiangmiao/auto-pairs'

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    use {
      'mattn/emmet-vim',
      opt = true,
      ft = { 'html', 'haml', 'css', 'scss', 'javascriptreact', 'typescriptreact' }
    }
  end
}
