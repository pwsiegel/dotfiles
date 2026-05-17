return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = { "pyright", "ruff", "ts_ls", "eslint", "lua_ls" },
            automatic_enable = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- Per-server tweaks (vim.lsp.config merges with lspconfig defaults).
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            -- Diagnostic UI.
            vim.diagnostic.config({
                virtual_text = { spacing = 4, prefix = "●" },
                signs = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- LSP-aware keymaps, attached when a server connects.
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local buf = ev.buf
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
                    end
                    map("gd",         vim.lsp.buf.definition,     "Goto definition")
                    map("gD",         vim.lsp.buf.declaration,    "Goto declaration")
                    map("gi",         vim.lsp.buf.implementation, "Goto implementation")
                    map("gr",         vim.lsp.buf.references,     "References")
                    map("K",          vim.lsp.buf.hover,          "Hover")
                    map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
                    map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
                end,
            })

            -- Diagnostic nav: use ]d / [d from mini.bracketed (built in).
        end,
    },
}
