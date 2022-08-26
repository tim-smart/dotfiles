-- Add additional capabilities supported by nvim-cmp
local capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require('cmp_nvim_lsp').update_capabilities(capabilities)
end

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

  vim.cmd([[command! -nargs=0 OrganizeImports lua require('utils.lsp').organize_imports()]])
end

local on_attach_formatting = function(client, b)
  on_attach(client, b)
  require 'lsp-format'.on_attach(client)
end

local document_code_action = function(action_name)
  local params = vim.lsp.util.make_range_params()
  params.context = { diagnostics = {}, only = { action_name } }

  local responses = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)

  if not responses or vim.tbl_isempty(responses) then
    return
  end

  for client_id, response in pairs(responses) do
    for _, result in pairs(response.result or {}) do
      if result.edit then
        vim.lsp.util.apply_workspace_edit(result.edit, vim.lsp.get_client_by_id(client_id).offset_encoding)
      else
        vim.lsp.buf.execute_command(result.command)
      end
    end
  end
end

local organize_imports = function()
  document_code_action("source.organizeImports")
end

return {
  on_attach = on_attach,
  on_attach_formatting = on_attach_formatting,
  capabilities = capabilities,
  document_code_action = document_code_action,
  organize_imports = organize_imports
}
