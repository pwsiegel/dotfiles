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
            { "<leader>ic", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
            { "<leader>if", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
            { "<leader>ir", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
            { "<leader>iC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue last session" },
            { "<leader>ib", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer to context" },
            { "<leader>is", "<cmd>ClaudeCodeSend<cr>",        mode = "v", desc = "Send selection to Claude" },
            -- Diff review (when Claude is editing files):
            { "<leader>ia", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept current diff" },
            { "<leader>id", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny current diff" },
        },
    },
}
