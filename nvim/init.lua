vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.lsp.enable("clangd")

-- require
require("config.options")
require("config.lazy")
require("config.binds")
