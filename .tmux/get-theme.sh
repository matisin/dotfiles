#!/usr/bin/env bash

set -e

function get_theme() {
  local status="$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")"
  if [[ $status == "default" ]]; then
    echo "dawn"
  else
    echo "main"
  fi
}

theme=$(get_theme)
tmux set -g @rose_pine_variant "${theme}"
