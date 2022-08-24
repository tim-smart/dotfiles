return function()
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
  local luasnip = require 'luasnip'
  local mapping = require 'cmp'.mapping
  require 'cmp'.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = mapping.preset.insert({
      ['<C-d>'] = mapping.scroll_docs(-4),
      ['<C-f>'] = mapping.scroll_docs(4),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }
end
