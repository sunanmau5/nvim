local event = { "BufReadPost", "BufWritePost", "BufNewFile" }

return {
    "mfussenegger/nvim-lint",
    event = event,
    keys = {
        {
            "<leader>cl",
            function()
                require("lint").try_lint()
            end,
            desc = "Lint",
        },
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            markdown = { "markdownlint-cli2" },
        }

        vim.api.nvim_create_autocmd(event, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
