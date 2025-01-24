local ibl = require('ibl')

local highlight = {
    "Grey",
}

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Grey", { fg = "#ABB2BF" })
end)

ibl.setup({
    indent = {
        highlight = highlight,
    },
    whitespace = {
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
    enabled = true,
    exclude = {
        filetypes = { 'dashboard' }
    }
})
