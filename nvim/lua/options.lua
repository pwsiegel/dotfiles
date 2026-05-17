local opt = vim.opt

-- Behavior
opt.swapfile = false
opt.updatetime = 50
opt.hidden = true
opt.hlsearch = true
opt.clipboard = "unnamed"
opt.number = true
opt.belloff = "all"
opt.mouse = ""

-- Folding
opt.foldmethod = "indent"
opt.foldlevelstart = 99
opt.foldopen:remove("block")

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true
opt.smarttab = true

-- Cosmetics
opt.background = "dark"
opt.colorcolumn = "120"

-- Completion (placeholder; refined when the completion plugin lands)
opt.completeopt = { "longest", "menuone" }
