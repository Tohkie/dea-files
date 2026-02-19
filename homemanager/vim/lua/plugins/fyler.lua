return {
  {
    "fyler.nvim",
    cmd = { "Fyler" },
    keys = {
      { "<leader>tf", function() return require('fyler').toggle({ kind = "split_right" }) end, mode = {"n"}, desc = 'Open [F]yler' },
    },
    load = function (name)
      vim.cmd.packadd(name)
    end,
    after = function(plugin)
      local fyler = require("fyler").setup()
    end,
  },
}
