vim.cmd.colorscheme("ashen")

vim.api.nvim_set_hl(0, "SignColumn", {
    bg = "#1b1b1b"
})

require("statusline").setup({
    match_colorscheme = false,
    tabline = true,
    lsp_diagnostics = true,
    ale_diagnostics = false,
})
