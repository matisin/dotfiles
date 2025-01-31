#!/usr/bin/env sh

KITTY_FILE="${HOME:-/home/$USER}/.config/kitty/kitty.conf"
GHOSTTY_FILE="${HOME:-/home/$USER}/.config/ghostty/config"

current_padding=$(grep "window_margin_width" "$KITTY_FILE" | awk '{print $3}')

if [ "$current_padding" == 350 ]; then
    sed -i 's/window_margin_width 8 [0-9][0-9][0-9]/window_margin_width 8 150/' "$KITTY_FILE"
    sed -i 's/font_size [0-9][0-9]/font_size 10/' "$KITTY_FILE"
else
    sed -i 's/window_margin_width 8 [0-9][0-9][0-9]/window_margin_width 8 350/' "$KITTY_FILE"
    sed -i 's/font_size [0-9]\?[0-9]/font_size 10/' "$KITTY_FILE"
fi;

kitty_instances=$(pgrep -a -f "kitty" | awk '{print $1}')

# Verificar si se encontraron instancias de Kitty
if [ -n "$kitty_instances" ]; then
    for instance in $kitty_instances; do
        kill -USR1 "$instance"
    done
fi

ghostty_padding=$(grep "window-padding-x" "$GHOSTTY_FILE" | awk '{print $3}')

if [ "$ghostty_padding" == 350 ]; then
    sed -i 's/window-padding-x = [0-9][0-9][0-9]/window-padding-x = 150/' "$GHOSTTY_FILE"
else
    sed -i 's/window-padding-x = [0-9][0-9][0-9]/window-padding-x = 350/' "$GHOSTTY_FILE"
fi;
