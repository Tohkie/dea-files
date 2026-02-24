local servers = {}

servers.lua_ls = {
	settings = {
		Lua = {
			formatters = {
				ignoreComments = false,
			},
			signatureHelp = { enable = true },
			diagnostics = {
				globals = { "nixCats", "vim" },
				-- disable = { 'missing-fields' },
			},
			workspace = {
				-- make the server aware of the neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
		telemetry = { enabled = false },
	},
}

servers.nil_ls = {
	settings = {},
}

local rust_analyzer_cmd = os.getenv("RUST_ANALYZER_CMD")
servers.rust_analyzer = {
	cmd = { rust_analyzer_cmd },
	settings = {
		server = {
			-- For debugging rust-analyzer, to see log location do :LspInfo in neovim
			-- extraEnv = { {["RA_LOG"]="project_model=debug"} },
		},
		cargo = {
			allFeatures = false,
			allTargets = false,
			buildScripts = { enable = true },
			target = "x86_64-unknown-linux-gnu",
		},
		diagnostics = {
			enable = true,
		},
	},
}

servers.hls = {
	settings = {},
}

-- Taken from nixCats example:
-- If you were to comment out this autocommand
-- and instead pass the on attach function directly to
-- nvim-lspconfig, it would do the same thing.
-- come to think of it, it might be better because then lspconfig doesnt have to be called before lsp attach?
-- but you would still end up triggering on a FileType event anyway, so, it makes little difference.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("nixCats-lsp-attach", { clear = true }),
	callback = function(event)
		require("lsp.capabilities").on_attach(vim.lsp.get_client_by_id(event.data.client_id), event.buf)
	end,
})

require("lze").load({
	{
		"nvim-lspconfig",
		event = "FileType",
		after = function(plugin)
			-- Just register configs, don't enable yet
			for server_name, cfg in pairs(servers) do
				vim.lsp.config(server_name, {
					capabilities = require("lsp.capabilities").get(server_name),
					settings = (cfg or {}).settings,
					filetypes = (cfg or {}).filetypes,
					cmd = (cfg or {}).cmd,
					root_pattern = (cfg or {}).root_pattern,
				})
			end

			-- Enable on-demand per filetype
			for server_name, cfg in pairs(servers) do
				local filetypes = cfg.filetypes or vim.lsp.config[server_name].filetypes
				if filetypes then
					vim.api.nvim_create_autocmd("FileType", {
						pattern = filetypes,
						callback = function()
							vim.lsp.enable(server_name)
						end,
					})
				end
			end
		end,
	},
})
