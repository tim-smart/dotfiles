return function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"ts_ls",
		},
		automatic_enable = {
			exclude = { "eslint", "ts_ls", "elixirls", "jsonls", "solargraph" },
		},
	})

	vim.lsp.enable({
		"jsonls",
		"ts_ls",
	})
end
