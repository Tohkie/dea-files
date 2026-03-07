vim.g.mapleader = " "

vim.opt.termguicolors = true -- use terminal colors
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = true
-- vim.opt.colorcolumn = "80"
vim.cmd.colorscheme("candyland")

require("plugins")
require("lsp")
