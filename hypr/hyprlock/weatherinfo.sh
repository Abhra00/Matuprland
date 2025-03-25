#!/usr/bin/env bash
#  ┓ ┏┏┓┏┓┏┳┓┓┏┏┓┳┓┳┳┓┏┓┏┓
#  ┃┃┃┣ ┣┫ ┃ ┣┫┣ ┣┫┃┃┃┣ ┃┃
#  ┗┻┛┗┛┛┗ ┻ ┛┗┗┛┛┗┻┛┗┻ ┗┛
#

# HARDCODE Location & City
CITY=$(grep -oP '^\s*\$CITY\s*=\s*\K.+' ~/.config/hypr/hyprlock.conf | xargs)
COUNTRY=$(grep -oP '^\s*\$COUNTRY\s*=\s*\K.+' ~/.config/hypr/hyprlock.conf | xargs)

# Check if CITY and COUNTRY are valid
if [[ -z "$CITY" || -z "$COUNTRY" ]]; then
  echo "Error: Unable to determine your location from hyprlock.conf"
  exit 1
fi

# Fetch weather info for the detected city from wttr.in
weather_info=$(curl -s --fail "https://en.wttr.in/$CITY?format=%c+%C+%t" 2>/dev/null)

# Check if curl succeeded
if [[ $? -ne 0 || -z "$weather_info" ]]; then
  echo "Error: Failed to retrieve weather info for $COUNTRY, $CITY"
  exit 1
fi

echo "$COUNTRY, $CITY: $weather_info"
