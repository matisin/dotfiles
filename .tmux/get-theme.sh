#!/usr/bin/env bash

# https://github.com/victorkristof/tmux-auto-dark-mode/blob/master/scripts/auto-dark-mode.sh
set -e

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
    echo "main"
  else
    echo "dawn"
  fi
}

theme=$(get_theme)
tmux set -g @rose_pine_variant "${theme}"
