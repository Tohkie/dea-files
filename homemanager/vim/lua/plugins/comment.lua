return {
	{
		"comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		after = function(plugin)
			require("Comment").setup({
				toggler = {
					line = "<leader>cc",
					block = "<leader>bc",
				},
				opleader = {
					line = "<leader>c",
					block = "<leader>b",
				},
				extra = {
					above = "<leader>c<S-o>",
					below = "<leader>co",
					eol = "<leader>cA",
				},
			})
		end,
	},
}
