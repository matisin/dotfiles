function ColorVim(color)
    color = color or "rose-pine"

    -- if vim.g.theme_is_dark == true then
    -- vim.o.background = 'dark'
    -- else
    -- vim.o.background = 'light'
    -- end
    vim.cmd.colorscheme(color)
end

function GetTheme()
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme | tr -d \"'\"")
    local current_color_scheme = 'default'
    if handle then
        current_color_scheme = handle:read("*a")
        handle:close()
        current_color_scheme = current_color_scheme:gsub("^%s*(.-)%s*$", "%1")
    end
    if current_color_scheme == 'default' then
        -- vim.o.background = 'light'
        ColorVim("rose-pine-dawn")
    elseif current_color_scheme == 'prefer-dark' then
        -- vim.o.background = 'dark'
        ColorVim("rose-pine-main")
    end
    -- vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Comment guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Constant guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Special guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Identifier guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Statement guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi PreProc guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Type guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Underlined guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Todo guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi String guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Function guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Conditional guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Repeat guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Operator guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi Structure guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi LineNr guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi NonText guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi CursorLine guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi CursorLineNr guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi StatusLine guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi StatusLineNC guibg=NONE ctermbg=NONE ]])
    -- vim.cmd([[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]])
end
ColorVim()

GetTheme()
