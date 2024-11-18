#!/usr/bin/env sh

KITTY_FILE="${HOME:-/home/$USER}/.config/kitty/kitty.conf"

current_padding=$(grep "window_margin_width" $KITTY_FILE | awk '{print $3}')

if [ "$current_padding" == 500 ]; then
    sed -i 's/window_margin_width 8 500/window_margin_width 8 150/' "$KITTY_FILE"
else
    sed -i 's/window_margin_width 8 150/window_margin_width 8 500/' "$KITTY_FILE"
fi;

kitty_instances=$(pgrep -a -f "kitty" | awk '{print $1}')

# Verificar si se encontraron instancias de Kitty
if [ -n "$kitty_instances" ]; then
    for instance in $kitty_instances; do
        kill -USR1 "$instance"
    done
fi

