#!/usr/bin/env bash
#  ┓ ┏┏┓┓┏┳┓┏┓┳┓  ┏┓┏┓┓ ┏┓┏┓┏┳┓
#  ┃┃┃┣┫┗┫┣┫┣┫┣┫━━┗┓┣ ┃ ┣ ┃  ┃ 
#  ┗┻┛┛┗┗┛┻┛┛┗┛┗  ┗┛┗┛┗┛┗┛┗┛ ┻ 
#                              



WAYBAR_THEME_DIR="$HOME/.config/waybar/themes"
WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"
WAYBAR_CSS="$HOME/.config/waybar/style.css"
ROFI_THEME="$HOME/.config/rofi/applets/waybarSelect.rasi"

main() {
    choice=$(find "$WAYBAR_THEME_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | rofi -dmenu -theme "$ROFI_THEME")

    if [[ -n "$choice" ]]; then
        cp "$WAYBAR_THEME_DIR/$choice/config.jsonc" "$WAYBAR_CONFIG"
        cp "$WAYBAR_THEME_DIR/$choice/style.css" "$WAYBAR_CSS"
        
        # Restart Waybar
        pkill waybar
        sleep 0.5
        waybar &

        # Send a notification (optional)
        notify-send -e -h string:x-canonical-private-synchronous:waybar_notif "Waybar Theme" "Switched to: $choice"
    fi
}

main

