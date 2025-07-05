# ┓┏┓  ┓┏┓┏┏┓┳┓┏┓┓┏┏┓┳┓
# ┃┃┫━━┣┫┗┫┃┃┣┫┃ ┣┫┣┫┃┃
# ┻┗┛  ┛┗┗┛┣┛┛┗┗┛┛┗┛┗┻┛
#                     

if test (tty) = "/dev/tty1"
    and not pgrep -x Hyprland > /dev/null
    echo "Starting Hyprland on tty1..."
    exec dbus-run-session Hyprland
end
