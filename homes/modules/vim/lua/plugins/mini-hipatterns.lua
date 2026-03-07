return {
  {
    "mini.hipatterns",
    after = function(plugin)
      local hipatterns = require("mini.hipatterns")

      -- Returns hex color group for matching short hex color.
      --
      ---@param match string
      ---@return string
      local hex_color_short = function(_, match)
        local style = 'fg' -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
        local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
        local hex = string.format('#%s%s%s%s%s%s', r, r, g, g, b, b)
        return hipatterns.compute_hex_color_group(hex, style)
      end

      -- Returns hex color group for matching alpha hex color.
      --
      ---@param match string
      ---@return string
      local hex_color_alpha = function(_, match)
        local style = 'fg' -- 'fg' or 'bg', for extmark_opts_inline use 'fg'
        local r, g, b = match:sub(2, 3), match:sub(4, 5), match:sub(6, 7)
        local hex = string.format('#%s%s%s', r, g, b)
        return hipatterns.compute_hex_color_group(hex, style)
      end

      -- Returns extmark opts for highlights with virtual inline text.
      --
      ---@param data table Includes `hl_group`, `full_match` and more.
      ---@return table
      local extmark_opts_inline = function(_, _, data)
        return {
          virt_text = { { '󰧞', data.hl_group } },
          virt_text_pos = 'inline',
          right_gravity = false,
        }
      end

      -- Returns extmark opts for highlights with virtual inline text.
      --
      ---@param data table Includes `hl_group`, `full_match` and more.
      ---@return table
      local extmark_opts_inline_alpha = function(_, _, data)
        return {
          virt_text = { { '󱡓', data.hl_group } },
          virt_text_pos = 'inline',
          right_gravity = false,
        }
      end

      hipatterns.setup({
	highlighters = {
          -- #rrggbb
	  hex_color = hipatterns.gen_highlighter.hex_color({
	    style = "inline",
            inline_text = '󰧞',
	  }),
          -- #rgb
	  hex_color_short = {
	    pattern = "#%x%x%x%f[%X]",
	    group = hex_color_short,
	    extmark_opts = extmark_opts_inline,
	  },
          -- #rrggbbaa
	  hex_color_alpha = {
	    pattern = "#%x%x%x%x%x%x%x%x%f[%X]",
	    group = hex_color_alpha,
	    extmark_opts = extmark_opts_inline_alpha,
	  },
	},
      })
    end,
  },
}
