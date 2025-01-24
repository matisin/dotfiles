#!/usr/bin/env bash

# Mostrar menú y guardar selección
selected=$(echo -e "󰤄 Apagar\n󰑓 Reiniciar\n󰗽 Cerrar Sesión\n󰤄 Suspender" | \
    rofi -dmenu \
    -i \
    -p "Sistema " \
    -theme-str 'listview {columns: 1; lines: 5;}' \
    -theme-str 'entry {placeholder: "Escoge una opción...";}' \
    -theme-str 'window {height: 25%;}'
)

# Ejecutar comando según la selección
case "$selected" in
    *"Apagar"*)
        systemctl poweroff
        ;;
    *"Reiniciar"*)
        systemctl reboot
        ;;
    *"Cerrar Sesión"*)
        hyprctl dispatch exit
        ;;
    *"Suspender"*)
        systemctl suspend
        ;;
esac
