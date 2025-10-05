return {
  'tpope/vim-unimpaired',
  'vim-scripts/matchit.zip',
  'tpope/vim-abolish',
  'tpope/vim-endwise',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'jiangmiao/auto-pairs',

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'mattn/emmet-vim',
    lazy = true,
    ft = { 'html', 'haml', 'css', 'scss', 'javascriptreact', 'typescriptreact' }
  },
}
