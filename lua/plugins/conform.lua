local BIOME_FILES = { "biome.json", "biome.jsonc" }
local ESLINT_FILES = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
}
local PRETTIER_FILES = { ".prettierrc", ".prettierrc.json", ".prettierrc.js", "prettier.config.js" }

local function js_formatters(bufnr)
    local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    if dir and vim.fs.root(dir, BIOME_FILES) then
        return { "biome" }
    end
    local f = {}
    if dir and vim.fs.root(dir, ESLINT_FILES) then
        f[#f + 1] = "eslint"
    end
    if dir and vim.fs.root(dir, PRETTIER_FILES) then
        f[#f + 1] = "prettier"
    end
    -- defaults to prettier
    return #f == 0 and { "prettier" } or f
end

return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = { "n", "v" },
            desc = "Format",
        },
    },
    opts = {
        formatters_by_ft = {
            ["*"] = { "trim_whitespace", "trim_newlines" },
            javascript = js_formatters,
            javascriptreact = js_formatters,
            typescript = js_formatters,
            typescriptreact = js_formatters,
            json = js_formatters,
            jsonc = js_formatters,
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
