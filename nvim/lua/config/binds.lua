vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- plugins
vim.keymap.set("n", "<leader>e", function() require("ranger-nvim").open(true) end)

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fb', telescope.buffers)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)

-- markdown
local markdown = vim.api.nvim_create_augroup("MarkdownBinds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = markdown,
    pattern = "markdown",

    callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        vim.keymap.set("n", "<CR>", "<Plug>(markdown_follow_link)")
        vim.keymap.set("n", "<BS>", "<C-o>", opts)
        vim.keymap.set("n", "<Tab>", function() vim.fn.search("\\[[^]]*\\](", "W") end, opts)
        vim.keymap.set("n", "<S-Tab>", function() vim.fn.search("\\[[^]]*\\](", "bW") end, opts)
    end,
})
