vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Markdown navigation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        local map = vim.keymap.set
        local opts = { buffer = ev.buf, silent = true }

        -- Follow link
        map("n", "<CR>", "gx", opts)

        -- Go back
        map("n", "<BS>", "<C-o>", opts)

        -- Next link
        map("n", "<Tab>", function()
            vim.fn.search([=[\[[^]]\+\](]=], "W")
        end, opts)

        -- Previous link
        map("n", "<S-Tab>", function()
            vim.fn.search([=[\[[^]]\+\](]=], "bW")
        end, opts)
    end,
})
