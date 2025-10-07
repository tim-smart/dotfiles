vim.opt.mouse = "a"

-- Line numbers
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto"

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.colorcolumn = "80"

-- wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = ".gems"

-- modeline
vim.opt.modeline = true
vim.opt.showcmd = true
vim.opt.laststatus = 2

-- For showing whitespace
vim.opt.list = true
vim.opt.listchars = "tab:→ ,trail:·,eol:↩"

-- diff
vim.opt.diffopt:append("vertical")

-- indent guides
vim.g.indent_guides_enable_on_vim_startup = true
vim.g.indent_guides_auto_colors = true

-- undo
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo")

-- grep
if vim.fn.executable("rg") then
	vim.opt.grepprg = "rg --vimgrep --hidden"
end
