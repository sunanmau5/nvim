return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
            desc = "Format",
        },
    },
    opts = {
        formatters_by_ft = {
            ["*"] = { "trim_whitespace", "trim_newlines" },
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
        format_on_save = { lsp_fallback = true },
    },
}
