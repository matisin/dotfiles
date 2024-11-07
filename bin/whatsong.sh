#!/usr/bin/env sh

playerctl -a metadata --format "{{ artist }} - {{ title }}"
