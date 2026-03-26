return function()
	local h = require("null-ls.helpers")
	local methods = require("null-ls.methods")
	local u = require("null-ls.utils")

	local FORMATTING = methods.internal.FORMATTING

	local vp = h.make_builtin({
		name = "vite+",
		method = FORMATTING,
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
			"astro",
			"html",
			"css",
			"scss",
			"less",
		},
		factory = h.formatter_factory,
		generator_opts = {
			command = "vp",
			args = { "fmt", "$FILENAME" },
			to_temp_file = true,
			from_temp_file = true,
			timeout = 10000,
			cwd = h.cache.by_bufnr(function(params)
				return u.root_pattern(".oxfmtrc.json")(params.bufname)
			end),
		},
	})

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
	local ifBiome = function(utils)
		return utils.root_has_file({
			"biome.json",
			"biome.jsonc",
		})
	end

	null_ls.setup({
		on_attach = require("lsp-format").on_attach,
		sources = {
			null_ls.builtins.formatting.alejandra,
			null_ls.builtins.formatting.biome.with({
				condition = ifBiome,
			}),
			require("none-ls.formatting.oxfmt").with({
				only_local = "node_modules/.bin",
			}),
			vp.with({
				only_local = "node_modules/.bin",
			}),
			null_ls.builtins.formatting.prettier.with({
				only_local = "node_modules/.bin",
				extra_filetypes = { "ruby" },
				condition = ifPrettier,
			}),
			null_ls.builtins.formatting.stylua,
		},
	})
end
