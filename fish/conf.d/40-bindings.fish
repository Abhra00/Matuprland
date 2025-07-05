#  ┏┓┏┓  ┳┓┳┳┓┳┓┳┳┓┏┓┏┓
#  ┃┃┃┫━━┣┫┃┃┃┃┃┃┃┃┃┓┗┓
#  ┗╋┗┛  ┻┛┻┛┗┻┛┻┛┗┗┛┗┛
#                      


# YY binding
for mode in insert default visual
    bind -M $mode \co 'commandline -r "yy"; commandline -f execute'
end

# The bindings for history_previous_command and history_previous_command_arguments
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! history_previous_command
  bind -Minsert '$' history_previous_command_arguments
else
  bind ! history_previous_command
  bind '$' history_previous_command_arguments
end
