local group = vim.api.nvim_create_augroup("GotmplDetect", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = group,
    pattern = { "*/layouts/*.html", "*/layout/*.html" },
    callback = function()
        vim.bo.filetype = "gotmpl"
    end,
})
