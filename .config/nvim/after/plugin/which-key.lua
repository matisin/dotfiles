local wk = require("which-key")

wk.setup({
    preset = "helix",
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
    },
    window = {
        border = "rounded",
        position = "bottom",
    },
    ignore_missing = true,
})
