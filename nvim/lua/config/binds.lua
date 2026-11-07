vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- plugins
vim.keymap.set("n", "<leader>e", function() require("ranger-nvim").open(true) end)

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fb', telescope.buffers)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)
