local vscode = not not vim.g.vscode
local not_vscode = function() return not vim.g.vscode end
local nnoremap = function(key, action)
  vim.keymap.set('n', key, action, { noremap = true, silent = true })
end
local nnoremapfn = function(key, action)
  vim.keymap.set('n', key, '', { noremap = true, silent = true, callback = action })
end

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-unimpaired'
  use 'vim-scripts/matchit.zip'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'

  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'lukas-reineke/lsp-format.nvim'

  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"

  use {
    'frankier/neovim-colors-solarized-truecolor-only',
    cond = not_vscode,
    config = function()
      vim.cmd 'colorscheme solarized'
      vim.opt.termguicolors = true
      vim.opt.background = 'light'
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- language support
  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'jose-elias-alvarez/typescript.nvim'
  use { 'elixir-editors/vim-elixir', cond = not_vscode }

  -- indent
  use { 'tpope/vim-sleuth', cond = not_vscode }
  use {
    'nathanaelkane/vim-indent-guides',
    cond = not_vscode,
  }

  use {
    'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cond = not_vscode,
  }

  use { 'jeffkreeftmeijer/vim-numbertoggle', cond = not_vscode }

  use {
    'mbbill/undotree',
    cond = not_vscode,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
  }

  use { 'tpope/vim-fugitive', cond = not_vscode }

  use 'andweeb/presence.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- shared config
vim.opt.smartindent = true
vim.opt.textwidth = 80
vim.opt.incsearch = true

-- temp files
vim.opt.backupdir = vim.fn.expand('~/.cache/nvim/session')
vim.opt.directory = vim.fn.expand('~/.cache/nvim/session')

if not vscode then
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
  nnoremap('<leader>u', ':UndotreeToggle<CR>')

  -- lualine
  require 'lualine'.setup {}

  -- fzf
  nnoremapfn('<c-P>', function() require('fzf-lua').files() end)

  -- nvim tree
  require 'nvim-tree'.setup {}
  nnoremap('<leader>e', ':NvimTreeFindFileToggle<CR>')

  -- dap
  nnoremapfn('<F5>', function() require 'dap'.continue() end)
  nnoremapfn('<F10>', function() require 'dap'.step_over({}) end)
  nnoremapfn('<F11>', function() require 'dap'.step_into() end)
  nnoremapfn('<F12>', function() require 'dap'.step_out() end)
  nnoremapfn('<Leader>b', function() require 'dap'.toggle_breakpoint() end)
  nnoremapfn('<Leader>dr', function() require 'dap'.repl.open() end)
  nnoremapfn('<Leader>dl', function() require 'dap'.run_last() end)
  nnoremapfn('<Leader>dd', function() require 'dapui'.toggle({}) end)

  require 'dapui'.setup {}

  -- nvim-cmp setup
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }

  local null_ls = require('null-ls')
  null_ls.setup {
    on_attach = require 'lsp-format'.on_attach,
    sources = {
      null_ls.builtins.formatting.prettier.with {
        extra_filetypes = { 'ruby' },
      },
    },
  }

  -- LSP
  local lsp = require('lspconfig')

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
  end

  local on_attach_formatting = function(client, b)
    on_attach(client, b)
    require 'lsp-format'.on_attach(client)
  end

  lsp.elixirls.setup {
    cmd = { vim.fn.expand('~/.elixir-ls/language_server.sh') },
    on_attach = on_attach_formatting,
    capabilities = capabilities,
  }

  lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  require 'flutter-tools'.setup {
    dev_tools = {
      auto_open_browser = true
    },
    debugger = { enabled = true },
    lsp = {
      on_attach = on_attach_formatting,
      capabilities = capabilities,
    }
  }
  nnoremap('<leader>fr', ':FlutterRun<CR>')
  nnoremap('<leader>fe', ':FlutterEmulators<CR>')

  lsp.solargraph.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  lsp.sumneko_lua.setup {
    on_attach = on_attach_formatting,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', },
        diagnostics = { globals = { 'vim' }, },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), },
      },
    },
  }

  require 'typescript'.setup {
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  }

  -- git
  nnoremap('<Leader>gp', ':G push<CR>')
  nnoremap('<Leader>gu', ':G pull<CR>')
end
