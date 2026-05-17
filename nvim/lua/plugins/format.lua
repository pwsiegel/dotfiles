return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                -- Run on every save in addition to filetype-specific formatters.
                ["*"] = { "trim_whitespace", "trim_newlines" },
                python  = { "ruff_format", "ruff_organize_imports" },
                javascript      = { "prettier" },
                typescript      = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json    = { "prettier" },
                css     = { "prettier" },
                html    = { "prettier" },
            },
            default_format_opts = { lsp_format = "fallback" },
            format_on_save = { timeout_ms = 500 },
        },
    },
}
