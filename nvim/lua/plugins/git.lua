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
                map("<leader>l", function() gs.nav_hunk("next") end, "Next hunk")
                map("<leader>h", function() gs.nav_hunk("prev") end, "Prev hunk")
            end,
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
        },
        opts = {},
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
        keys = {
            { "<leader>gv", "<cmd>DiffviewOpen<cr>",  desc = "Open diff view" },
            { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
        },
        opts = {
            use_icons = true,
        },
    },
}
