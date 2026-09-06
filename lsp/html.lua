---@type vim.lsp.Config
return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ", "gotmpl" },
    root_markers = { "package.json", ".git" },
}
