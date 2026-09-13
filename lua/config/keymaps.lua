local function zen_open()
    local ok, zen = pcall(require, "zen-mode.view")
    return ok and zen.is_open()
end

-- zen-mode closes when focus leaves the zen window to a non-float, so the
-- hidden parent window would end the session. In zen there's only one window,
-- so window navigation is a no-op.
local function win_nav(cmd)
    return function()
        if not zen_open() then
            vim.cmd(cmd)
        end
    end
end

vim.keymap.set("n", "<C-h>", win_nav("wincmd h"), { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", win_nav("wincmd j"), { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", win_nav("wincmd k"), { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", win_nav("wincmd l"), { desc = "Go to right window" })

vim.keymap.set("n", "<M-=>", "<cmd>vertical resize +5<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<M-->", "<cmd>vertical resize -5<cr>", { desc = "Decrease window width" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without yanking" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear search highlight" })

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader><leader>x", "<cmd>so %<cr>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", ":.lua<cr>", { desc = "Execute" })
vim.keymap.set("v", "<leader>x", ":lua<cr>", { desc = "Execute" })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
