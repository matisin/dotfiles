local wk = require("which-key")

wk.setup({
    preset = "classic",
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

-- wk.show({
    -- keys = "<c-w>",
    -- loop = true,
-- })
