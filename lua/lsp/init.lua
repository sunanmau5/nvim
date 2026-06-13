vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true,
})

vim.lsp.enable({
    "basedpyright",
    "bashls",
    "biome",
    "cssls",
    "elixirls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "ruff",
    "sqls",
    "tailwindcss",
    "terraformls",
    "tflint",
    "vtsls",
    "vue_ls",
    "yamlls",
})
