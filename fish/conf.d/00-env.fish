#  ┏┓┏┓  ┏┓┳┓┓┏
#  ┃┫┃┫━━┣ ┃┃┃┃
#  ┗┛┗┛  ┗┛┛┗┗┛
#              


# Environment variables and application defaults
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.local/bin/statusbar $HOME/.local/bin/cron $HOME/Applications /var/lib/flatpak/exports/bin/ $fish_user_paths

# Supresses fish's intro message
set fish_greeting ""                               

# Default programs
set -gx EDITOR nvim
set -gx TERMINAL st
set -gx TERMINAL_PROG st
set -gx LOCATION Memari
set -gx BROWSER zen

# XDG paths and application config
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XINITRC "$XDG_CONFIG_HOME/x11/xinitrc"
# set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -gx NOTMUCH_CONFIG "$XDG_CONFIG_HOME/notmuch-config"
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
set -gx INPUTRC "$XDG_CONFIG_HOME/shell/inputrc"
set -gx ZDOTDIR "$XDG_CONFIG_HOME/zsh"
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"
# set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
set -gx KODI_DATA "$XDG_DATA_HOME/kodi"
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
set -gx TMUX_TMPDIR "$XDG_RUNTIME_DIR"
set -gx ANDROID_SDK_HOME "$XDG_CONFIG_HOME/android"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOMODCACHE "$XDG_CACHE_HOME/go/mod"
set -gx ANSIBLE_CONFIG "$XDG_CONFIG_HOME/ansible/ansible.cfg"
set -gx UNISON "$XDG_DATA_HOME/unison"
set -gx HISTFILE "$XDG_DATA_HOME/history"
set -gx MBSYNCRC "$XDG_CONFIG_HOME/mbsync/config"
set -gx ELECTRUMDIR "$XDG_DATA_HOME/electrum"
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -gx SQLITE_HISTORY "$XDG_DATA_HOME/sqlite_history"

# Fzf options
set -gx FZF_DEFAULT_OPTS "--style=full --height=90% --pointer '>' --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' --input-label ' Search ' --color 'input-border:blue,input-label:blue:bold' --list-label ' Results ' --color 'list-border:green,list-label:green:bold' --preview-label ' Preview ' --color 'preview-border:magenta,preview-label:magenta:bold'"

# Other program settings
set -gx DICS "/usr/share/stardict/dic/"
set -gx SUDO_ASKPASS "$HOME/.local/bin/dmenupass"
set -gx LESS R
set -gx LESS_TERMCAP_mb (printf '\e[1;31m')
set -gx LESS_TERMCAP_md (printf '\e[1;36m')
set -gx LESS_TERMCAP_me (printf '\e[0m')
set -gx LESS_TERMCAP_so (printf '\e[01;44;33m')
set -gx LESS_TERMCAP_se (printf '\e[0m')
set -gx LESS_TERMCAP_us (printf '\e[1;32m')
set -gx LESS_TERMCAP_ue (printf '\e[0m')
set -gx LESSOPEN "| /usr/bin/highlight -O ansi %s 2>/dev/null"
set -gx QT_QPA_PLATFORMTHEME "gtk2"
set -gx MOZ_USE_XINPUT2 1
set -gx AWT_TOOLKIT "MToolkit wmname LG3D"
set -gx _JAVA_AWT_WM_NONREPARENTING 1
