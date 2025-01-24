#!/usr/bin/env bash

command_to_run=$1

hyprctl dispatch togglespecialworkspace
if [ "$(hyprctl clients -j | jq ".[] | select(.workspace.id == -99 and .floating == false) | .class")" = "" ]; then
    hyprctl dispatch exec "[workspace special silent] $command_to_run"
fi

