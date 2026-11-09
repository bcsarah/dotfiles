vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- require
require("config.lazy")
require("config.options")
require("config.binds")

-- get theme
dofile(vim.fn.expand("~/dotfiles/themes/current/nvim.lua"))
