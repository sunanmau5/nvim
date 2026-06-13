local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

M.live_multigrep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job({
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            local pieces = vim.split(prompt, "  ")
            local args = vim.iter({
                conf.vimgrep_arguments,
                { "--fixed-strings", "--hidden", "--glob", "!**/.git/*" },
            })
                :flatten()
                :totable()

            if pieces[2] then
                table.insert(args, "--glob=" .. pieces[2])
            end

            return vim.iter({
                args,
                { "--", pieces[1] },
            })
                :flatten()
                :totable()
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    })

    pickers
        .new(opts, {
            debounce = 100,
            prompt_title = "Multi Grep",
            finder = finder,
            previewer = conf.grep_previewer(opts),
            sorter = require("telescope.sorters").empty(),
        })
        :find()
end

return M
