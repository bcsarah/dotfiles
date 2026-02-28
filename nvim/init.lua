-- Lazyvim
require("config.lazy")

-- Life Quality
vim.opt.clipboard = "unnamedplus"

-- Indentação
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.keymap.set("n", "<Tab>", ">>") -- Normal
vim.keymap.set("n", "<S-Tab>", "<<")

vim.keymap.set("v", "<Tab>", ">gv") -- Visual
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Word Wrap
vim.opt.wrap = true
vim.opt.breakindent = true

