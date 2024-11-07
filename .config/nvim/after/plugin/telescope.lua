local builtin = require('telescope.builtin')

local telescope = require("telescope")

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        grep_string = {
            additional_args = function(opts)
                return { "--hidden" }
            end
        },
        live_grep = {
            additional_args = function(opts)
                return { "--hidden", '--glob', -- this flag allows you to hide exclude these files and folders from your search 👇
                    '!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock,**/pnpm-lock.yaml}' }
            end
        },
        buffers = {
            ignore_current_buffer = true,
            sort_mru = true
        }
    }
}
telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pd', function()
    local search = vim.fn.input("Directory to grep ")
    builtin.live_grep({ search_dirs = { search } })
end)
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
