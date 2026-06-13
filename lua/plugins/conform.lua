---@type conform.FormatOpts
local formatOpts = { async = true, lsp_fallback = true }

return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format(formatOpts)
            end,
            mode = { "n", "v" },
            desc = "Format",
        },
    },
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            html = { "prettier" },
            markdown = { "prettier" },
            vue = { "prettier" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            zsh = { "shfmt" },
            lua = { "stylua" },
            python = { "ruff_format" },
            terraform = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            hcl = { "terraform_fmt" },
        },
        format_after_save = formatOpts,
    },
}
