return {
    {
        "lifepillar/vim-solarized8",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme("solarized8")
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
                theme = "solarized_dark",
                icons_enabled = false,
                -- Powerline chevrons (U+E0B0–E0B3) by explicit UTF-8 escape so
                -- the literal glyphs survive transit through tooling.
                section_separators   = { left = "\238\130\176", right = "\238\130\178" },
                component_separators = { left = "\238\130\177", right = "\238\130\179" },
            },
            tabline = {
                lualine_a = { { "buffers", show_filename_only = true, mode = 0 } },
            },
        },
    },
}
