
local neotree = require("neo-tree")

neotree.setup({
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
        indent = {
            padding = 2
        }
    },
    filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_by_name = {
                '.git',
            },
        }
    },
    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false
        }
    },
    -- window = {
        -- width = 100
    -- }
})
vim.keymap.set('n', '<leader>pt', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pv', ':Neotree<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gss', ':Neotree float git_status<CR>')
