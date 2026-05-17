return {
    {
        "coder/claudecode.nvim",
        config = true,
        cmd = {
            "ClaudeCode",
            "ClaudeCodeFocus",
            "ClaudeCodeAdd",
            "ClaudeCodeSend",
            "ClaudeCodeDiffAccept",
            "ClaudeCodeDiffDeny",
        },
        keys = {
            { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
            { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
            { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
            { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue last session" },
            { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer to context" },
            { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v", desc = "Send selection to Claude" },
            -- Diff review (when Claude is editing files):
            { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept current diff" },
            { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny current diff" },
        },
    },
}
