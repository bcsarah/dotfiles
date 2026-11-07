vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "SignColumn", {
    bg = "#282828"
})

require("statusline").setup({
    match_colorscheme = false,
    tabline = true,
    lsp_diagnostics = true,
    ale_diagnostics = false,
})
