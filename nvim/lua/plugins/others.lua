return {
    -- git
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },

    -- ranger
    {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({
                replace_netrw = true
            })
        end,
    },

    -- css colors
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    
    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- autoclose
    {
        "alvan/vim-closetag"
    },
}
