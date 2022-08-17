require("options")
require("plugins")

vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

require("setup-diagnostics")
require("setup-telescope")
require("setup-lspconfig")
require("setup-cmp")
require("setup-nightfox")
require("setup-hop")
require("setup-lualine")
