return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local parsers = {
                "bash", "css", "diff", "dockerfile", "gitcommit", "gitignore",
                "html", "javascript", "json", "lua", "markdown", "markdown_inline",
                "python", "query", "regex", "sql", "toml", "tsx", "typescript",
                "vim", "vimdoc", "yaml",
            }
            require("nvim-treesitter").install(parsers)

            -- Enable treesitter highlighting + indent on every supported buffer.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if lang and vim.treesitter.language.add(lang) then
                        pcall(vim.treesitter.start, args.buf)
                        vim.bo[args.buf].indentexpr =
                            "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}
