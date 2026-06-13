vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

local transparent_groups = {
    "Normal",
    "NormalNC",
    "EndOfBuffer",
    "FoldColumn",
    "SignColumn",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
}

local function apply_transparency()
    for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
end

apply_transparency()

vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Apply transparent background",
    group = vim.api.nvim_create_augroup("transparent-background", { clear = true }),
    callback = apply_transparency,
})
