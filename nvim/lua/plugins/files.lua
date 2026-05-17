return {
    {
        "ibhagwan/fzf-lua",
        keys = {
            { "<leader>o", "<cmd>FzfLua files<cr>", desc = "Find files" },
        },
        opts = {},
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
        },
        opts = {
            actions = { open_file = { quit_on_open = true } },
            filters = { custom = { "^.git$", "^node_modules$", "^__pycache__$" } },
            renderer = { icons = { show = { file = false, folder = false, folder_arrow = true, git = false } } },
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            -- Don't let buffer-nav arrows fire inside the tree.
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "NvimTree",
                callback = function()
                    vim.keymap.set("n", "<Left>", "<nop>", { buffer = true })
                    vim.keymap.set("n", "<Right>", "<nop>", { buffer = true })
                end,
            })
        end,
    },
}
