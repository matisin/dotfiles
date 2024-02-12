#!/bin/bash

show_<ram>() { # save this module in a file with the name <module_name>.sh
  local index=$2 # this variable is used by the module loader in order to know the position of this module 
  local icon="$(get_tmux_option "@catppuccin_ram_icon" "󰍛")"
  local color="$(get_tmux_option "@catppuccin_ram_color" $thm_red)"
  local text="$(get_tmux_option "@catppuccin_ram_text" "#(free | awk '/Mem/{printf(\"%.1f\\n\"), \$3/\$2*100}')")%"
  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
} 
