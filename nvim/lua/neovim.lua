vim.opt.mouse = 'a'

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.colorcolumn = '80'

-- wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wildignore = '.gems'

-- modeline
vim.opt.modeline = true
vim.opt.showcmd = true
vim.opt.laststatus = 2

-- scroll
vim.opt.scrolloff = 3
vim.opt.ruler = true

-- For showing whitespace
vim.opt.list = true
vim.opt.listchars = 'tab:>-,trail:·,eol:¶'

-- indent guides
vim.g.indent_guides_enable_on_vim_startup = true
vim.g.indent_guides_auto_colors = true

-- undo
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.undodir = vim.fn.expand('~/.cache/nvim/undo')
