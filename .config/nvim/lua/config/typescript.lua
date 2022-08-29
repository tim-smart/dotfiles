return function()
  local l = require('utils.lsp')

  require 'typescript'.setup {
    server = {
      on_attach = l.on_attach,
      capabilities = l.capabilities(),
    }
  }
end
