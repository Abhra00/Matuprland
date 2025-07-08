#!/usr/bin/env bash
#  ┏┓┳┳┓┏┓┓ ┏┓┳┓┏┓┳┳┓┏┓┳┓┏┓
#  ┣┫┃┣┫┃┃┃ ┣┫┃┃┣ ┃┃┃┃┃┃┃┣ 
#  ┛┗┻┛┗┣┛┗┛┛┗┛┗┗┛┛ ┗┗┛┻┛┗┛
#                          


# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Airplane Mode. Turning on or off all wifi using rfkill. 

notifon="$HOME/.config/swaync/icons/airplane-mode-on.png"
notifoff="$HOME/.config/swaync/icons/airplane-mode-off.png"

# Check if any wireless device is blocked
wifi_blocked=$(rfkill list wifi | grep -o "Soft blocked: yes")

if [ -n "$wifi_blocked" ]; then
    rfkill unblock wifi
    notify-send -u low -i "$notifoff" " Airplane" " mode: OFF"
else
    rfkill block wifi
    notify-send -u low -i "$notifon" " Airplane" " mode: ON"
fi
