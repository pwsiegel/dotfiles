return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({ style = "storm" })
            vim.cmd.colorscheme("tokyonight")
            -- Match the old "SignColumn linked to LineNr" cosmetic so the
            -- gitsigns column blends with the number column.
            local function link_signcol()
                vim.cmd("highlight! link SignColumn LineNr")
            end
            vim.api.nvim_create_autocmd("ColorScheme", { callback = link_signcol })
            link_signcol()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "tokyonight",
                icons_enabled = false,
                section_separators = "",
                component_separators = "|",
            },
            tabline = {
                lualine_a = { { "buffers", show_filename_only = false, mode = 0 } },
            },
        },
    },
}
