local lualine = require('lualine')
lualine.setup({
    options = {
        theme = 'catppuccin',
        icons_enabled = true,
        section_separators = { right = '', left = '' },
        component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
    },
    -- sections = {
        -- -- lualine_a = {
            -- -- {
                -- -- 'buffers'
            -- -- }
        -- -- }
    -- }
})
