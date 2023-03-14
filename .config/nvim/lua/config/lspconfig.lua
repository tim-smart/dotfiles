return function()
    local lsp = require 'lspconfig'
    local l = require 'utils.lsp'
    local on_attach = l.on_attach
    local on_attach_formatting = l.on_attach_formatting
    local capabilities = l.capabilities()

    if vim.fn.executable('flutter') == 0 then
        lsp.dartls.setup {
            on_attach = on_attach_formatting,
            capabilities = capabilities,
        }
    end

    lsp.elixirls.setup {
        on_attach = on_attach_formatting,
        capabilities = capabilities,
        cmd = { 'elixir-ls' },
    }

    lsp.graphql.setup {
        on_attach = on_attach_formatting,
        capabilities = capabilities,
    }

    lsp.emmet_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    lsp.jsonls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        },
    }

    lsp.metals.setup {
        on_attach = on_attach_formatting,
        capabilities = capabilities,
    }

    lsp.solargraph.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    lsp.lua_ls.setup {
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
    lsp.rust_analyzer.setup {
        on_attach = on_attach_formatting,
        capabilities = capabilities,
    }

    lsp.tailwindcss.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
