return {
	{
		"telescope.nvim",
		cmd = { "Telescope" },
		keys = {
			{
				"<leader>f",
				function()
					return require("telescope.builtin").find_files()
				end,
				mode = { "n" },
				desc = "Telescope search [F]iles",
			},
			{
				"<leader>tr",
				function()
					return require("telescope.builtin").oldfiles()
				end,
				mode = { "n" },
				desc = "[T]elescope search [R]ecent files",
			},
			{
				"<leader>ts",
				function()
					return require("telescope.builtin").live_grep()
				end,
				mode = { "n" },
				desc = "[T]elescope [S]earch cwd with grep",
			},
			{
				"<leader>tw",
				function()
					return require("telescope.builtin").grep_string()
				end,
				mode = { "n" },
				desc = "[T]elescope search current [W]ord",
			},
			{
				"<leader>tk",
				function()
					return require("telescope.builtin").keymaps()
				end,
				mode = { "n" },
				desc = "[T]elescope search [K]eymaps",
			},
			{
				"<leader>tb",
				function()
					return require("telescope.builtin").buffers()
				end,
				mode = { "n" },
				desc = "[T]elescope search [B]uffers",
			},
		},
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("telescope-fzf-native.nvim")
		end,
		after = function(plugin)
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			pcall(telescope.load_extension, "fzf")
		end,
	},
}
