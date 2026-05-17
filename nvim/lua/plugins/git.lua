return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gdiff", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite" },
        keys = {
            { "<leader>gs", "<cmd>Git<cr>",          desc = "Git status" },
            { "<leader>gd", "<cmd>Gdiffsplit<cr>",   desc = "Git diff" },
            { "<leader>gp", "<cmd>Git push<cr>",     desc = "Git push" },
        },
    },
}
