return function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"ts_ls",
		},
		automatic_enable = {
			exclude = { "ts_ls", "elixirls", "jsonls", "solargraph" },
		},
	})

	local base_on_attach = vim.lsp.config.eslint.on_attach
	vim.lsp.config("eslint", {
		on_attach = function(client, bufnr)
			if not base_on_attach then
				return
			end

			base_on_attach(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "LspEslintFixAll",
			})
		end,
	})

	vim.lsp.config("dprint", {
		on_attach = function(client, bufnr)
			if not base_on_attach then
				return
			end

			base_on_attach(client, bufnr)

			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = false,
						bufnr = bufnr,
						id = client.id,
					})
				end,
			})
		end,
	})

	vim.lsp.config("jsonls", {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})

	vim.lsp.enable({
		"biome",
		"dprint",
		"eslint",
		"jsonls",
		"oxlint",
		"ts_ls",
	})
end
