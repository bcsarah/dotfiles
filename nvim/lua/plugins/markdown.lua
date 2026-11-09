return {
    { -- markdown render
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    { -- markdown
        "tadmccorkle/markdown.nvim",
        ft = "markdown",
        opts = {},
    },
}
