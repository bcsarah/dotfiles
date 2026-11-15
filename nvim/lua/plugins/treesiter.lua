return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "markdown",
                "lua",
                "c",
                "html",
                "css",
                "javascript",
            },
            auto_install = false
        })
    end
}
