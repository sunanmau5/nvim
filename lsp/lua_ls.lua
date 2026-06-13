---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", "stylua.toml", ".git" },
    settings = {
        Lua = {
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
            diagnostics = { globals = { "vim" } },
        },
    },
}
