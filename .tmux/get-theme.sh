#!/usr/bin/env bash

# https://github.com/victorkristof/tmux-auto-dark-mode/blob/master/scripts/auto-dark-mode.sh
set -e
dark_style='fg=#cdd6f4,bg=#1e1e2e'
light_style='fg=#4c4f69,bg=#eff1f5'

get_system_mode() {
  # Check status of dark mode (ignore errors, i.e., when light mode is enabled).
  local status="$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")"
  # Return system mode.
  if [[ $status == "default" ]]; then
    echo "light"
  else
    echo "dark"
  fi
}

# set -g @catppuccin_flavour 'latte' # or frappe, macchiato, mocha
function get_theme() {
  local mode=$(get_system_mode)
  # theme variables aren't available, so copy from catppuccin files
  if [[ $mode == "dark" ]]; then
    # tmux set -g window-style $dark_style
    tmux set -g status-style $dark_style    
    tmux set -g @catppuccin_flavour 'mocha'
    echo "main"
  else
    tmux set -g @catppuccin_flavour 'latte'
    # tmux set -g window-style $light_style
    tmux set -g status-style $light_style  
    echo "dawn"
  fi
}

theme=$(get_theme)
# tmux set -g @rose_pine_variant "${theme}"
