#!/usr/bin/env bash

################################################################################
###                               swayimg-hyprland                           ###
################################################################################
# Replicate the overlay behavior of swayimg, but in Hyprland                   #
#                                                                              #
# Because Hyprland can't just have a window tree, like swaymsg -t get_tree, or #
# even use absolute and relative coordinates consistently, or even provide     #
# half-decent documentation of the protocols/commands, this took way longer    #
# than it should have and I'm salty.                                           #
################################################################################
#                                Hari Ganti | 2025/03/11 | hariganti@gmail.com #
################################################################################

# Ensure we have exactly one argument
if [ "$#" -ne 1 ]; then
    echo 'Usage: swayimg-hyprland <path/to/image>'
    exit 1
fi

IMAGE_PATH="$1"

# Get window parameters (absolute coordinates)
read -r X Y WIDTH HEIGHT MONITOR_ID < <(
    hyprctl clients -j | jq -r '
        .[] | select(.focusHistoryID == 0)
        | "\(.at[0]) \(.at[1]) \(.size[0]) \(.size[1]) \(.monitor)"'
)


# Get monitor properties
read -r MON_X MON_Y < <(
    hyprctl monitors -j | jq -r "
        .[] | select(.id == $MONITOR_ID)
        | \"\(.x) \(.y)\""
)

# Adjust size and position
POS_X=$((X - MON_X))
POS_Y=$((Y - MON_Y))

# Execute swayimg with the adjusted coordinates
hyprctl dispatch exec "[float; move $POS_X $POS_Y; size $WIDTH $HEIGHT]" swayimg "$IMAGE_PATH"

