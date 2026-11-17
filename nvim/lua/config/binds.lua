vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        vim.keymap.set("n", "<CR>", function()
            vim.cmd.normal("gx")
        end, opts)

        vim.keymap.set("n", "<BS>", "<C-o>", opts)

        vim.keymap.set("n", "<Tab>", function()
            vim.fn.search([=[\[[^]]\+\](]=], "W")
        end, opts)

        vim.keymap.set("n", "<S-Tab>", function()
            vim.fn.search([=[\[[^]]\+\](]=], "bW")
        end, opts)
    end,
})
