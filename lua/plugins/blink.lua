return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
        enabled = function()
            return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
        end,
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            accept = {
                auto_brackets = { enabled = false },
            },
        },
        signature = { enabled = true },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
