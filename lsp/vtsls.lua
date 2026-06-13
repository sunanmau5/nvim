local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

---@type vim.lsp.Config
return {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    settings = {
        typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = { completeFunctionCalls = true },
        },
        javascript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = { completeFunctionCalls = true },
        },
        vtsls = {
            autoUseWorkspaceTsdk = true,
            tsserver = {
                globalPlugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vue_language_server_path,
                        languages = { "vue" },
                        configNamespace = "typescript",
                        enableForWorkspaceTypeScriptVersions = true,
                    },
                },
            },
        },
    },
    on_attach = function(client)
        if client.server_capabilities.semanticTokensProvider then
            client.server_capabilities.semanticTokensProvider.full = vim.bo.filetype ~= "vue"
        end
    end,
}
