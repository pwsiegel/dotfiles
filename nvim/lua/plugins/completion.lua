return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "*",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
        opts = {
            -- `enter` adds <CR> = accept-if-popup-else-fallback on top of default.
            keymap = { preset = "enter" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            snippets = { preset = "luasnip" },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
            },
            signature = { enabled = true },
        },
    },
}
