function ColorVim(color)
  color = color or "rose-pine"
  -- if vim.g.theme_is_dark == true then
    -- vim.o.background = 'dark'
  -- else
    -- vim.o.background = 'light'
  -- end
  vim.cmd.colorscheme(color)

end

function ToggleTheme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end

ColorVim("onedark")
