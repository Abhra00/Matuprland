#  ┏┓┏┓  ┏┓┏┓┏┓┏┓┏┓┳┓┏┓┳┓┏┓┏┓
#  ┣┓┃┫━━┣┫┃┃┃┃┣ ┣┫┣┫┣┫┃┃┃ ┣ 
#  ┗┛┗┛  ┛┗┣┛┣┛┗┛┛┗┛┗┛┗┛┗┗┛┗┛
#                            

# Autocomplete and highlight colors 
set -g fish_color_normal 	      brgreen
set -g fish_color_autosuggestion      brblack
set -g fish_color_command 	      brgreen
set -g fish_color_error 	      brred
set -g fish_color_param 	      brwhite



# Prompt (Download HYDRO prompt using fundle)
fundle plugin 'jorgebucaran/hydro'
fundle init

