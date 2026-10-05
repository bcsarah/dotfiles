require("config.lazy")
vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.c", "*.h" },
  command = ":lsp enable"
})
vim.g.autoformat = false
