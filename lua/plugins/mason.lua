return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                -- LSP servers
                "bash-language-server",
                "basedpyright",
                "css-lsp",
                "elixir-ls",
                "html-lsp",
                "json-lsp",
                "lua-language-server",
                "marksman",
                "tailwindcss-language-server",
                "terraform-ls",
                "tflint",
                "vue-language-server",
                "vtsls",
                "yaml-language-server",
                -- Formatters / linters
                "biome",
                "markdownlint-cli2",
                "prettier",
                "shfmt",
                "stylua",
                -- Other
                "tree-sitter-cli",
            },
        },
    },
}
