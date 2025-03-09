#!/usr/bin/env bash
#  ┳┓┏┓┏┓┳  ┓ ┏┓┳┳┳┓┏┓┓┏┏┓┳┓  ┏┓┏┳┓┓┏┓ ┏┓  ┏┓┏┓┓ ┏┓┏┓┏┳┓┏┓┳┓
#  ┣┫┃┃┣ ┃━━┃ ┣┫┃┃┃┃┃ ┣┫┣ ┣┫━━┗┓ ┃ ┗┫┃ ┣ ━━┗┓┣ ┃ ┣ ┃  ┃ ┃┃┣┫
#  ┛┗┗┛┻ ┻  ┗┛┛┗┗┛┛┗┗┛┛┗┗┛┛┗  ┗┛ ┻ ┗┛┗┛┗┛  ┗┛┗┛┗┛┗┛┗┛ ┻ ┗┛┛┗
#                                                           

# Copyright: The Hyde Project


# Rofi vars
rofiStyleDir="$HOME/.config/rofi/launchers/styles"
rofiAssetDir="$HOME/.config/rofi/launchers/assets"
rofiTheme="$HOME/.config/rofi/applets/rofiSelect.rasi"

#// set rofi font scaling
font_scale=10

# Element vars
elem_border=$((2 * 5))
icon_border=$((elem_border - 5))

#// scale for monitor

mon_data=$(hyprctl -j monitors)
mon_x_res=$(jq '.[] | select(.focused==true) | if (.transform % 2 == 0) then .width else .height end' <<<"${mon_data}")
mon_scale=$(jq '.[] | select(.focused==true) | .scale' <<<"${mon_data}" | sed "s/\.//")
mon_x_res=$((mon_x_res * 100 / mon_scale))

#// generate config

elm_width=$(((20 + 12 + 16) * font_scale))
max_avail=$((mon_x_res - (4 * font_scale)))
col_count=$((max_avail / elm_width))
[[ "${col_count}" -gt 5 ]] && col_count=5
r_override="window{width:100%;} 
    listview{columns:${col_count};}
    element{orientation:vertical;border-radius:${elem_border}px;}
    element-icon{border-radius:${icon_border}px;size:25em;} 
    element-text{enabled:false;}"

# Map the available style files into an array (style_files)
mapfile -t style_files < <(find -L "$rofiAssetDir" -type f -name '*.png')

# Extract the base name
style_names=()
for file in "${style_files[@]}"; do
    echo "$file"
    style_names+=("$(basename "$file")")
done

# Sort the (style_files) array
IFS=$'\n' style_names=($(sort -V <<<"${style_names[*]}"))
unset IFS



# Prepare the list for rofi with previews
rofi_list=""
for style_name in "${style_names[@]}"; do
    rofi_list+="${style_name}\x00icon\x1f${rofiAssetDir}/${style_name}\n"
done


# Present the list of styles using rofi and get the selected style
RofiSel=$(echo -en "$rofi_list" | rofi -dmenu -markup-rows -theme-str "$r_override" -theme "$rofiTheme")

# Set Rofi Style 
if [ ! -z "${RofiSel}" ] ; then
    RofiSel=$(echo "$RofiSel" | awk -F '.' '{print $1}')
    sed -i "s/style_theme='.*'/style_theme='${RofiSel}'/g" $HOME/.config/rofi/launchers/launcher.sh
    notify-send -e -h string:x-canonical-private-synchronous:rofi_notif -a "t1" -r 91190 -t 2200 -i "${rofiAssetDir}/${RofiSel}.png" " Rofi style ${RofiSel} applied..." 
fi
