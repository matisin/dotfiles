#!/bin/bash

show_ccpu() { # save this module in a file with the name <module_name>.sh
  local index=$2 # this variable is used by the module loader in order to know the position of this module 
  local icon="$(get_tmux_option "@catppuccin_ram_icon" "cpu")"
  local color="$(get_tmux_option "@catppuccin_ram_color" $thm_blue)"
  local text="$(get_tmux_option "@catppuccin_cpu_text" "#(top -b -n1 | sed 's/,/./g' | grep 'Cpu(s)' | awk '{printf \"%.1f\\n\", \$2 + \$4}')")%"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
} 
