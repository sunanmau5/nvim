---@type vim.lsp.Config
return {
    cmd = { "biome", "lsp-proxy" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "biome.json", "biome.jsonc" },
}
