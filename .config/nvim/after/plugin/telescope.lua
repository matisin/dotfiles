local builtin = require('telescope.builtin')

local telescope = require("telescope")

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        grep_string = {
            additional_args = function()
                return { "--hidden" }
            end
        },
        live_grep = {
            additional_args = function()
                return { "--hidden", '--glob',
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

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope Find" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope Git" })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Telescope Grep" })
vim.keymap.set('n', '<leader>pd', function()
    local search = vim.fn.input("Directory to grep ")
    builtin.live_grep({ search_dirs = { search } })
end, { desc = "Telescope Grep Directory" })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "Telescope Buffers" })
