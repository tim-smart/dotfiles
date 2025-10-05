return function()
	local null_ls = require("null-ls")
	local ifEslint = function(utils)
		return utils.root_has_file({
			"eslint.config.js",
			"eslint.config.cjs",
			"eslint.config.mjs",
			".eslintrc.js",
			".eslintrc.cjs",
		})
	end
	local ifPrettier = function(utils)
		return utils.root_has_file({
			".prettierrc",
			".prettierrc.json",
		})
	end

	null_ls.setup({
		on_attach = require("lsp-format").on_attach,
		sources = {
			null_ls.builtins.formatting.alejandra,
			null_ls.builtins.formatting.prettier.with({
				only_local = "node_modules/.bin",
				extra_filetypes = { "ruby" },
				condition = ifPrettier,
			}),
			null_ls.builtins.formatting.stylua,
			require("none-ls.diagnostics.eslint_d").with({
				condition = ifEslint,
			}),
			require("none-ls.formatting.eslint_d").with({
				condition = ifEslint,
			}),
			require("none-ls.code_actions.eslint_d").with({
				condition = ifEslint,
			}),
		},
	})
end
