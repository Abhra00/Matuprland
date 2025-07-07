#!/usr/bin/env bash
#  ┏┓┏┓┓ ┏┓┳┓┏┓┳┏┓┓┏┓┏┓┳┓  
#  ┃ ┃┃┃ ┃┃┣┫┃┃┃┃ ┃┫ ┣ ┣┫  
#  ┗┛┗┛┗┛┗┛┛┗┣┛┻┗┛┛┗┛┗┛┛┗  
#                          


#!/bin/bash

# Dependencies: hyprpicker, wl-copy, notify-send, waybar listening on SIGRTMIN+1

# Check if a command exists
check() {
  command -v "$1" >/dev/null
}

# Setup
loc="$HOME/.cache/colorpicker"
mkdir -p "$loc"
touch "$loc/colors"

limit=10

# List saved colors
[[ $# -eq 1 && $1 == "-l" ]] && {
  cat "$loc/colors"
  exit
}

# Output for Waybar JSON module
[[ $# -eq 1 && $1 == "-j" ]] && {
  text="$(head -n 1 "$loc/colors")"
  mapfile -t allcolors < <(tail -n +2 "$loc/colors")
  tooltip="<b>   COLORS</b>\n\n"
  tooltip+="-> <b>$text</b>  <span color='$text'></span>\n"

  for i in "${allcolors[@]}"; do
    tooltip+="   <b>$i</b>  <span color='$i'></span>\n"
  done

  cat <<EOF
{ "text":"<span color='$text'></span>", "tooltip":"$tooltip" }
EOF
  exit
}

# Dependencies check
check hyprpicker || {
  notify-send "Color Picker" "❌ hyprpicker is not installed" -u critical
  exit 1
}

killall -q hyprpicker

# Pick color (force autoselect, no GUI if supported)
color="$(hyprpicker -a | tr -d '\n')"

# Validate hex color format
[[ "$color" =~ ^#?[0-9a-fA-F]{6}$ ]] || {
  notify-send "Color Picker" "❌ Invalid color format: $color" -u critical
  exit 1
}

# Ensure leading '#' if missing
[[ "$color" != \#* ]] && color="#$color"

# Copy to clipboard if available
check wl-copy && echo -n "$color" | wl-copy

# Maintain unique, limited history
prevColors="$(grep -vFx "$color" "$loc/colors" | head -n $((limit - 1)))"
{
  echo "$color"
  echo "$prevColors"
} > "$loc/colors"

# Send notification
notify-send "Color Picker" "This color has been selected: $color" -i "$HOME/.local/share/bg"

# Signal Waybar to update (requires `signal: 1` in Waybar module)
pkill -RTMIN+1 waybar
