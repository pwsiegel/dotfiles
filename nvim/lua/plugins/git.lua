return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                local map = function(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
                end
                map("]c", function() gs.nav_hunk("next") end, "Next hunk")
                map("[c", function() gs.nav_hunk("prev") end, "Prev hunk")
            end,
        },
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
