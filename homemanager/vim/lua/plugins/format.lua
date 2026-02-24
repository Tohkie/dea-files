-- docs -> https://github.com/stevearc/conform.nvim
return {
	{
		"conform.nvim",
		enabled = nixCats("format") or false,
		keys = {
			{ "<leader>p", desc = "Format File (pretty :3)" },
		},
		after = function(plugin)
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = nixCats("lang.lua") and { "stylua" } or nil,
					nix = nixCats("lang.nix") and { "nixfmt" } or nil,
					rust = nixCats("lang.rust") and { "rustfmt", lsp_format = "fallback" } or nil,
					haskell = nixCats("lang.haskell") and { "ormolu" } or nil,
				},
				format_on_save = {
					timeout_ms = 500,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>p", function()
				conform.format({
					lsp_fallback = false,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format File (pretty :3)" })
		end,
	},
}
