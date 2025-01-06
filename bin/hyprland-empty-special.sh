#!/usr/bin/env bash

command_to_run=$1

hyprctl dispatch togglespecialworkspace
# Verifica si el workspace special está vacío
if [ "$(hyprctl clients -j | jq ".[] | select(.workspace.id == -99 and .floating == false) | .class")" = "" ]; then
    # Si está vacío, ejecuta el comando
    hyprctl dispatch exec "[workspace special silent] $command_to_run"
fi

