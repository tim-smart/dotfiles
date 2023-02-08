return function()
    local null_ls = require 'null-ls'

    null_ls.setup {
        on_attach = require 'lsp-format'.on_attach,
        sources = {
            null_ls.builtins.formatting.prettier.with {
                extra_filetypes = { 'ruby' },
            },
            null_ls.builtins.formatting.sql_formatter,
        },
    }
end
