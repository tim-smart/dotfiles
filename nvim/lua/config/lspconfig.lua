return function()
  local lsp = require 'lspconfig'
  local l = require 'utils.lsp'
  local on_attach = l.on_attach
  local on_attach_formatting = l.on_attach_formatting
  local capabilities = l.capabilities()

  lsp.elixirls.setup {
    cmd = { vim.fn.expand('~/.elixir-ls/language_server.sh') },
    on_attach = on_attach_formatting,
    capabilities = capabilities,
  }

  lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

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
end
