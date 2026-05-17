return {
    {
        "echasnovski/mini.nvim",
        version = false,
        event = "VeryLazy",
        config = function()
            require("mini.comment").setup()      -- gc / gcc (matches commentary)
            require("mini.pairs").setup()        -- auto-pairs replacement
            require("mini.bracketed").setup()    -- unimpaired-style [/] bindings
            require("mini.ai").setup()           -- richer a/i text objects
        end,
    },
    -- vim-surround kept (muscle memory: ys/cs/ds). mini.surround uses
    -- sa/sd/sr by default and is a much bigger rewire than it's worth.
    { "tpope/vim-surround", event = "VeryLazy" },
    { "tpope/vim-repeat",   event = "VeryLazy" },
    { "tpope/vim-abolish",  cmd = { "S", "Subvert", "Abolish" }, keys = { { "cr", mode = "n" } } },
}
