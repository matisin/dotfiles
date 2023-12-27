function ColorVim(color)
  color = color or "catppuccin"
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
    vim.o.background = 'light'
  elseif current_color_scheme == 'prefer-dark' then
    vim.o.background = 'dark'
  end
end

ColorVim("catppuccin")
GetTheme()
