local map = vim.keymap.set

-- General
map("n", "<leader>/", ":nohlsearch<CR>", { silent = true })
map("n", "<leader>j", "<C-d>zz")
map("n", "<leader>k", "<C-u>zz")

-- Git
-- (Branch review lives in review.lua: :ReviewBranch)

-- Buffers / windows
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>X", ":%bd<CR>", { desc = "Close all buffers" })
map("n", "<Left>",   ":bp<CR>", { silent = true })
map("n", "<Right>",  ":bn<CR>", { silent = true })
-- Window cycling (works from terminal mode too, so it pops you out of the
-- Claude split without the <C-\><C-n> dance).
map({ "n", "t" }, "<leader>w", "<cmd>wincmd w<cr>", { desc = "Cycle next window" })
map({ "n", "t" }, "<leader>W", "<cmd>wincmd W<cr>", { desc = "Cycle prev window" })

-- Force vim navigation: arrows do nothing.
-- (Left/Right in normal mode are reused above for buffer nav.)
map({ "n", "v" }, "<Up>",    "<nop>")
map({ "n", "v" }, "<Down>",  "<nop>")
map("i",          "<Up>",    "<nop>")
map("i",          "<Down>",  "<nop>")
map("i",          "<Left>",  "<nop>")
map("i",          "<Right>", "<nop>")

-- Folding
map("n", "<leader><space>", "zA")
map("n", "<leader>fo",      "zR")
map("n", "<leader>fc",      "zM")

-- (<CR> popup-aware accept is handled by blink.cmp's "enter" preset.)

-- Mark the startup [No Name] buffer to wipe itself the moment it's hidden,
-- so opening any real file makes it vanish.
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" and vim.bo.buftype == "" then
            vim.bo.bufhidden = "wipe"
        end
    end,
})

-- Mouse / scrollwheel fully disabled
local modes = { "n", "v", "i" }
for _, lhs in ipairs({
    "<LeftMouse>", "<2-LeftMouse>",
    "<ScrollWheelUp>",   "<S-ScrollWheelUp>",   "<C-ScrollWheelUp>",
    "<ScrollWheelDown>", "<S-ScrollWheelDown>", "<C-ScrollWheelDown>",
}) do
    map(modes, lhs, "<nop>")
end
