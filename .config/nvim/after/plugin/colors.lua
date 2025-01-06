function ColorVim(color)
    color = color or "rose-pine-moon"

    -- if vim.g.theme_is_dark == true then
    -- vim.o.background = 'dark'
    -- else
    -- vim.o.background = 'light'
    -- end
    vim.cmd.colorscheme(color)
end

ColorVim()
