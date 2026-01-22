return function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"ts_ls",
		},
		automatic_enable = {
			exclude = { "elixirls", "jsonls", "solargraph" },
		},
	})

	local util = require("lspconfig.util")

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

	vim.lsp.config("oxlint", {
		cmd = { "oxlint", "--lsp" },
	})

	vim.lsp.config("ts_ls", {
		root_dir = function(bufnr, on_dir)
			local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
			root_markers = vim.list_extend(root_markers, { ".git" })
			local project_root = vim.fs.root(bufnr, root_markers)
			on_dir(project_root or vim.fn.getcwd())
		end,
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
