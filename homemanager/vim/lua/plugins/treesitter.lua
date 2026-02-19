-- to help me write this after nvim-treesitter updated, i used:
-- https://github.com/BirdeeHub/nixCats-nvim/blob/3c9bc4d7123e1b48d92f25ba505b889af541e897/templates/example/lua/myLuaConf/plugins/treesitter.lua

return {
  {
    "nvim-treesitter",
    lazy = false,
    after = function (plugin)
      --@param buf integer
      --@param language string
      local function treesitter_try_attach(buf, language)
	--check if parser exists and load it
	if not vim.treesitter.language.add(language) then
	  return
	end

	-- enables syntax highlight and other treesitter features
	vim.treesitter.start(buf, language)

	-- enables treesitter based folds
	vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

	-- enables treesiter based indentation
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      local available_parsers = require("nvim-treesitter").get_available()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
	  local buf, filetype = args.buf, args.match
	  local language = vim.treesitter.language.get_lang(filetype)
	  if not language then
	    return
	  end

	  local installed_parsers = require("nvim-treesitter").get_installed("parsers")

	  if vim.tbl_contains(installed_parsers, language) then
	    -- enable the parser if it is installed
	    treesitter_try_attach(buf, language)
	  elseif vim.tbl_contains(available_parsers, language) then
	    -- if a parser is available in `nvim-treesitter` enable it after ensuring it is installed
	    require("nvim-treesitter").install(language):await(function()
	      treesitter_try_attach(buf, language)
	    end)
	  else
	    -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
	    treesitter_try_attach(buf, language)
	  end
	end,
      })
    end,
  },
  {
    "nvim-treesitter-textobjects",
    lazy = false,
    before = function(plugin)
      vim.g.no_plugin_maps = true
    end,
    after = function(plugin)
      require("nvim-treesitter-textobjects").setup {
        select = {
	  lookahead = true,
	  selection_modes = {
	    ['@parameter.outer'] = 'v', -- charwise
	    ['@function.outer'] = 'V', -- linewise
	  },
	  include_surrounding_whitespace = false,
	},
      }

      -- keymaps
      vim.keymap.set({ "x", "o" }, "am", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "im", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
      end)
      -- You can also use captures from other query groups like `locals.scm`
      vim.keymap.set({ "x", "o" }, "as", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
      end)

      -- NOTE: for more textobjects options, see the following link.
      -- This template is using the new `main` branch of the repo.
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main
    end,
  },
}
