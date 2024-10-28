#!/usr/bin/env sh

playerctl -p spotify metadata --format '{{ artist }} - {{ title }}'
