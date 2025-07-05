#  ┏┓┏┓  ┳┓┏┓┓┏┏┓┓┏┳┏┓┳┳┳┓
#   ┫┃┫━━┣┫┣ ┣┫┣┫┃┃┃┃┃┃┃┣┫
#  ┗┛┗┛  ┻┛┗┛┛┗┛┗┗┛┻┗┛┗┛┛┗
#                         


# Set either default emacs mode or vi mode #
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end

# Different cursor styles in diiferent modes
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block
