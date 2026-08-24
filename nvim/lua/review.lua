-- Branch review: view the full files a feature branch has changed, with
-- gitsigns hunks painted against the branch point.
--
-- `:ReviewBranch [base]`  Load every file that differs from <base> (default:
--                         the repo's default branch) into the arglist and
--                         repoint gitsigns to the merge-base, so hunks show
--                         exactly what this branch did. Navigate with the
--                         usual <leader>l / <leader>h.
-- `:ReviewBranch!`        Reset gitsigns back to its normal HEAD-vs-worktree
--                         diff.

-- Run git with argv (no shell), returning trimmed stdout lines + success flag.
local function git(args)
    local out = vim.fn.systemlist(args)
    return out, vim.v.shell_error == 0
end

-- The base ref to compare against when none is given.
local function default_base()
    local ref, ok = git({ "git", "rev-parse", "--abbrev-ref", "origin/HEAD" })
    if ok and ref[1] and ref[1] ~= "" then
        return ref[1] -- e.g. "origin/main"
    end
    for _, candidate in ipairs({ "origin/main", "origin/master", "main", "master" }) do
        local _, exists = git({ "git", "rev-parse", "--verify", "--quiet", candidate })
        if exists then
            return candidate
        end
    end
    return nil
end

local function notify(msg, level)
    vim.notify(msg, level or vim.log.levels.INFO, { title = "ReviewBranch" })
end

local function reset()
    require("gitsigns").change_base(nil, true)
    notify("gitsigns base reset to HEAD")
end

local function review(base)
    base = base or default_base()
    if not base then
        return notify("Could not determine a base branch (no origin/HEAD, main, or master).", vim.log.levels.ERROR)
    end

    local mb, ok = git({ "git", "merge-base", base, "HEAD" })
    if not ok or not mb[1] or mb[1] == "" then
        return notify("No merge-base with '" .. base .. "'.", vim.log.levels.ERROR)
    end
    local merge_base = mb[1]

    local root = git({ "git", "rev-parse", "--show-toplevel" })[1]
    local files = git({ "git", "diff", "--name-only", merge_base })
    if #files == 0 then
        return notify("No changes relative to '" .. base .. "' — are you on the default branch?")
    end

    -- Point gitsigns at the branch point *before* loading buffers so they
    -- attach with the right base.
    require("gitsigns").change_base(merge_base, true)

    local escaped = {}
    for _, f in ipairs(files) do
        escaped[#escaped + 1] = vim.fn.fnameescape(root .. "/" .. f)
    end
    vim.cmd("args " .. table.concat(escaped, " "))

    notify(("%d file%s changed vs %s"):format(#files, #files == 1 and "" or "s", base))
end

local function complete_branches(arglead)
    local branches, ok = git({ "git", "for-each-ref", "--format=%(refname:short)", "refs/heads", "refs/remotes" })
    if not ok then
        return {}
    end
    return vim.tbl_filter(function(b)
        return b:find(arglead, 1, true) == 1
    end, branches)
end

vim.api.nvim_create_user_command("ReviewBranch", function(opts)
    if opts.bang then
        reset()
    else
        review(opts.args ~= "" and opts.args or nil)
    end
end, {
    nargs = "?",
    bang = true,
    complete = complete_branches,
    desc = "Load files changed on this branch vs base; set gitsigns base to the branch point",
})

vim.keymap.set("n", "<leader>gc", "<cmd>ReviewBranch<cr>", { desc = "Review branch changes vs default" })
