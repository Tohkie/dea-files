return {
  {
    "friendly-snippets",
    dep_of = { "blink.cmp" },
  },
  {
    "blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    on_require = "blink",
    load = function (name)
      vim.cmd.packadd(name)
    end,
    after = function(plugin)
      local blink = require('blink.cmp')

      blink.setup({
        keymap = {
	  preset = 'default',
        },

        appearance = {
	  nerd_font_variant = 'mono',
	},

	sources = {
	  default = { 'lsp', 'path', 'snippets', 'buffer' },
	  providers = {
	    lsp = {
	      name = 'LSP',
	      module = 'blink.cmp.sources.lsp',
	      enabled = true,
	    },
	    path = {
	      name = 'Path',
	      module = 'blink.cmp.sources.path',
	      enabled = true,
	    },
	    snippets = {
	      name = 'Snippets',
	      module = 'blink.cmp.sources.snippets',
	      enabled = true,
	    },
	    buffer = {
	      name = 'Buffer',
	      module = 'blink.cmp.sources.buffer',
	      enabled = true,
	    },
	  },
	},

        completion = {
	  accept = {
	    auto_brackets = {
	      enabled = true,
	    },
	  },

          menu = {
	    border = 'rounded',
	    max_height = 12,
	    scrolloff = 2,

            draw = {
	      columns = {
		{ "kind_icon", gap = 1, },
	        { "label", "label_description", gap = 1, },
	      },
	    },
	  },

          documentation = {
	    auto_show = false,
	    window = {
	      border = 'rounded',
	    },
	  },
	},

        signature = {
	  enabled = true,
	  window = {
	    border = 'rounded',
	  },
	},
      })
    end
  },
}
