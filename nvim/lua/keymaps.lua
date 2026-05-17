local map = vim.keymap.set

-- General
map("n", "<leader>r", function()
    vim.cmd("source $MYVIMRC")
    vim.cmd("nohlsearch")
end, { desc = "Reload config" })
map("n", "<leader>/", ":nohlsearch<CR>", { silent = true })
map("n", "<leader>j", "<C-d>zz")
map("n", "<leader>k", "<C-u>zz")

-- Buffers / windows
map("n", "<leader>c", ":bd<CR>")
map("n", "<Left>",   ":bp<CR>", { silent = true })
map("n", "<Right>",  ":bn<CR>", { silent = true })
map("n", "<leader>K", "<C-w>k")
map("n", "<leader>J", "<C-w>j")

-- Folding
map("n", "<leader><space>", "zA")
map("n", "<leader>a", "zR")
map("n", "<leader>f", "zM")

-- (<CR> popup-aware accept is handled by blink.cmp's "enter" preset.)

-- Mouse / scrollwheel fully disabled
local modes = { "n", "v", "i" }
for _, lhs in ipairs({
    "<LeftMouse>", "<2-LeftMouse>",
    "<ScrollWheelUp>",   "<S-ScrollWheelUp>",   "<C-ScrollWheelUp>",
    "<ScrollWheelDown>", "<S-ScrollWheelDown>", "<C-ScrollWheelDown>",
}) do
    map(modes, lhs, "<nop>")
end
