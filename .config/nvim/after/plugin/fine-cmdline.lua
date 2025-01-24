local finecmd = require('fine-cmdline')

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

finecmd.setup({
    popup = {
        position = {
            row = '20%',
            col = '50%',
        },
        size = {
            width = '80%'
        }
    }
})
