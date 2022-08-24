return function()
  local l = require('utils.lsp')
  local u = require('utils')

  require 'flutter-tools'.setup {
    dev_tools = {
      auto_open_browser = true
    },
    debugger = { enabled = true },
    lsp = {
      on_attach = l.on_attach_formatting,
      capabilities = l.capabilities,
    }
  }

  u.nnoremap('<leader>fr', ':FlutterRun<CR>')
  u.nnoremap('<leader>fe', ':FlutterEmulators<CR>')
end
