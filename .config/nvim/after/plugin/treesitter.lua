local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = { "help", "go", "javascript", "typescript", "sql", "lua", "vim", "vimdoc", "query", "dockerfile", "lua" },
    sync_install = false,
    ignore_install = { "help" },
    auto_install = true,
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
}
