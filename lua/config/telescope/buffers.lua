local action_state = require("telescope.actions.state")

local M = {}

M.attach_mappings = function(prompt_bufnr, map)
    local function delete_buffers()
        local picker = action_state.get_current_picker(prompt_bufnr)
        picker:delete_selection(function(selection)
            local ok, err = pcall(vim.api.nvim_buf_delete, selection.bufnr, { force = false })
            if not ok then
                vim.notify(err, vim.log.levels.WARN)
            end
            return ok
        end)
    end

    map("n", "dd", delete_buffers)
    map("n", "<C-d>", delete_buffers)
    map("i", "<C-d>", delete_buffers)

    return true
end

return M
