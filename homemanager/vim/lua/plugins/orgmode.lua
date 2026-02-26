# options: https://github.com/nvim-orgmode/orgmode/blob/master/docs/installation.org
return {
	{
		"orgmode",
		event = { "FileType" },
		ft = { "org" },
		after = function(plugin)
			require("orgmode").setup({
				org_agenda_files = "~/.orgmode/**/*",
				org_default_notes_file = "~/.orgmode/refile.org",
			})

			vim.lsp.enable("org")
		end,
	},
}
