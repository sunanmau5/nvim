local M = {}

local function find_nearest_node_modules(start)
    local dir = vim.fn.fnamemodify(start, ":p:h")
    while true do
        local candidate = dir .. "/node_modules"
        if vim.uv.fs_stat(candidate) then
            return candidate
        end
        local parent = vim.fn.fnamemodify(dir, ":h")
        if parent == dir then
            return nil
        end
        dir = parent
    end
end

function M.find_files(opts)
    opts = opts or {}
    local start = vim.fn.expand("%:p")
    if start == "" then
        start = vim.uv.cwd()
    end

    local node_modules = find_nearest_node_modules(start)
    if not node_modules then
        vim.notify("No node_modules directory found", vim.log.levels.WARN)
        return
    end

    require("telescope.builtin").find_files(vim.tbl_deep_extend("force", opts, {
        prompt_title = "node_modules",
        cwd = node_modules,
        no_ignore = true,
        follow = true,
        hidden = true,
    }))
end

return M
