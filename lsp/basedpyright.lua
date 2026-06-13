---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "standard",
                -- let ruff handle these
                ignore = { "*" },
            },
        },
    },
}
