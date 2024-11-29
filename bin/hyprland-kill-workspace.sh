#!/usr/bin/env sh

# Obtener los workspaces activos y parsear la salida
workspaces=$(hyprctl workspaces -j | jq -r '.[].id')

# Imprimir la información en formato que waybar pueda usar
echo "{\"text\": \"\", \"tooltip\": \"$workspaces\", \"class\": \"custom-workspace\"}"

# Si recibimos un click (argumento)
if [ "$1" = "click" ]; then
    # Obtener el workspace bajo el cursor usando hyprctl
    current_workspace=$(hyprctl cursorpos -j | jq -r '.workspace.id')
    if [ ! -z "$current_workspace" ]; then
        hyprctl dispatch workspace $current_workspace && hyprctl dispatch killactive
    fi
fi
