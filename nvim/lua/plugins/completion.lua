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
            -- Custom keymap matching:
            --   <Tab>     cycle next  (or jump snippet, or insert tab)
            --   <S-Tab>   cycle prev  (or jump back, or unindent)
            --   <CR>      accept the highlighted item
            --   <Esc>     dismiss the menu (without exiting insert mode)
            -- The chained array form tries each command in order; if a command
            -- returns false (e.g. menu not visible) it falls through to the next.
            keymap = {
                preset = "none",
                ["<Tab>"]     = { "select_next", "snippet_forward",  "fallback" },
                ["<S-Tab>"]   = { "select_prev", "snippet_backward", "fallback" },
                ["<CR>"]      = { "accept",      "fallback" },
                ["<Esc>"]     = {
                    function(cmp) if cmp.is_visible() then cmp.hide() end return false end,
                    "fallback",
                },
                ["<C-Space>"] = { "show",        "show_documentation", "hide_documentation" },
                ["<C-y>"]     = { "accept" },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            snippets = { preset = "luasnip" },
            completion = {
                -- (1) Inline ghost preview of the selected item at the cursor.
                ghost_text = { enabled = true },
                menu = {
                    -- (4) Rounded border + tighter padding.
                    border = "rounded",
                    draw = {
                        padding = 1,
                        -- (3) Add a source-label column ([LSP] / [Snip] / etc.)
                        -- alongside the existing label + kind columns.
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind",                       gap = 1 },
                            { "source_name" },
                        },
                        components = {
                            source_name = {
                                text = function(ctx)
                                    local labels = {
                                        lsp      = "[LSP]",
                                        snippets = "[Snip]",
                                        buffer   = "[Buf]",
                                        path     = "[Path]",
                                    }
                                    return labels[ctx.item.source_id] or ("[" .. (ctx.item.source_id or "?") .. "]")
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = { border = "rounded" },
                },
            },
            signature = {
                enabled = true,
                window  = { border = "rounded" },
            },
            -- (5) Drive cmdline (`:` and `/`) completion through blink too.
            cmdline = {
                enabled = true,
                keymap  = { preset = "cmdline" },
                completion = {
                    menu = { auto_show = true },
                },
            },
        },
    },
}
