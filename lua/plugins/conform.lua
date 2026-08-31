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
            javascript = { "biome", "prettier", stop_after_first = true },
            javascriptreact = { "biome", "prettier", stop_after_first = true },
            typescript = { "biome", "prettier", stop_after_first = true },
            typescriptreact = { "biome", "prettier", stop_after_first = true },
            json = { "biome", "prettier", stop_after_first = true },
            jsonc = { "biome", "prettier", stop_after_first = true },
            yaml = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            html = { "prettier" },
            markdown = { "prettier", "markdownlint-cli2" },
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
        formatters = {
            biome = { require_cwd = true },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = function(bufnr)
            local ignore_filetypes = { "sql", "yaml", "yml" }
            if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                return
            end
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("/node_modules/") then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
    },
}
