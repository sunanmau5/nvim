local function git()
    local git_info = vim.b.gitsigns_status_dict
    if not git_info or git_info.head == "" then
        return ""
    end

    local added = git_info.added and git_info.added > 0 and (" +" .. git_info.added) or ""
    local changed = git_info.changed and git_info.changed > 0 and (" ~" .. git_info.changed) or ""
    local removed = git_info.removed and git_info.removed > 0 and (" -" .. git_info.removed) or ""
    local worktree = git_info.root and vim.fn.fnamemodify(git_info.root, ":t") or ""
    local branch = worktree ~= "" and (worktree .. ":" .. git_info.head) or git_info.head

    return string.format(" [ %s%s%s%s]", branch, added, changed, removed)
end

local function is_normal_window()
    return vim.bo.buftype == "" and vim.api.nvim_win_get_config(0).relative == ""
end

Statusline = {}

function Statusline.git()
    return git()
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Add git info to normal window statusline",
    callback = function()
        if not is_normal_window() then
            vim.opt_local.statusline = ""
            return
        end

        vim.opt_local.statusline = "%<%f%h%m%r%{v:lua.Statusline.git()}%=%-14.(%l,%c%V%) %P"
    end,
})
