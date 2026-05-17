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
            -- Toggle: <leader>gs opens fugitive status, or closes it if already open.
            {
                "<leader>gs",
                function()
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.bo[buf].filetype == "fugitive" then
                            vim.api.nvim_win_close(win, false)
                            return
                        end
                    end
                    vim.cmd("Git")
                end,
                desc = "Toggle git status",
            },
        },
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
        keys = {
            { "<leader>gv", "<cmd>DiffviewOpen<cr>",  desc = "Open diff view" },
            { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
        },
        opts = {
            use_icons = false, -- no nerd font installed
        },
    },
}
