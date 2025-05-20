#  ┏┓┏┓┓┏┳┓┏┓
#  ┏┛┗┓┣┫┣┫┃ 
#  ┗┛┗┛┛┗┛┗┗┛
#            


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#  ┏┓┓ ┳┏┓┏┓┏┓┏┓
#  ┣┫┃ ┃┣┫┗┓┣ ┗┓
#  ┛┗┗┛┻┛┗┗┛┗┛┗┛
#               
[[ -r ${ZDOTDIR:-$HOME}/zaliases ]] && source ${ZDOTDIR:-$HOME}/zaliases


#  ┏┓┳┓┏┓┳┳┓┏┓
#  ┣ ┃┃┃┓┃┃┃┣ 
#  ┗┛┛┗┗┛┻┛┗┗┛
#             
autoload -Uz compinit 

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump
autoload -Uz colors && colors # Enabling colors
autoload -Uz add-zsh-hook     # Adding zsh hook for custom functions
_comp_options+=(globdots)


#  ┏┓┏┓┳┳┓┏┓┓ ┏┓┏┳┓┳┏┓┳┓  ┏┓┏┳┓┓┏┓ ┏┓┏┓
#  ┃ ┃┃┃┃┃┃┃┃ ┣  ┃ ┃┃┃┃┃  ┗┓ ┃ ┗┫┃ ┣ ┗┓
#  ┗┛┗┛┛ ┗┣┛┗┛┗┛ ┻ ┻┗┛┛┗  ┗┛ ┻ ┗┛┗┛┗┛┗┛
#                                      
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=0\;33'
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'


#  ┓ ┏┏┓┳┏┳┓┳┳┓┏┓  ┳┓┏┓┏┳┓┏┓
#  ┃┃┃┣┫┃ ┃ ┃┃┃┃┓  ┃┃┃┃ ┃ ┗┓
#  ┗┻┛┛┗┻ ┻ ┻┛┗┗┛  ┻┛┗┛ ┻ ┗┛
#                           
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots



#  ┏┓┳┳┳┓┏┓  ┏┓┳┓┏┓┳┳┓┏┓┏┳┓
#  ┗┓┃┃┃┃┃┃  ┃┃┣┫┃┃┃┃┃┃┃ ┃
#  ┗┛┗┛┻┛┗┛  ┣┛┛┗┗┛┛ ┗┣┛ ┻
#
export SUDO_PROMPT="$fg[white]Deploying $fg[red]root access for %u $fg[blue]password pls:󰌾 $fg[white]"



#  ┏┳┓┓┏┏┓  ┏┓┳┓┏┓┳┳┓┏┓┏┳┓
#   ┃ ┣┫┣   ┃┃┣┫┃┃┃┃┃┃┃ ┃ 
#   ┻ ┛┗┗┛  ┣┛┛┗┗┛┛ ┗┣┛ ┻ 
#                         
# !!! USING PURE ZSH PROMPT & IT WILL BE DOWNLOADED AUTOMATICALLY BY THE PLUGIN HELPER 🚀 !!!
# !! PROMPT COLOR STYLING
zstyle :prompt:pure:git:arrow color "#bb9af7"
zstyle :prompt:pure:git:branch color "#8db0ff"
zstyle :prompt:pure:path color "#c0caf5"
zstyle :prompt:pure:prompt:error color "#ff899d"
zstyle :prompt:pure:prompt:success color "#9fe044"
zstyle :prompt:pure:prompt:continuation color "#8db0ff"
zstyle :prompt:pure:suspended_jobs color "#c7a9ff"
zstyle :prompt:pure:user color "#faba4a"
zstyle :prompt:pure:user:root color "#c0caf5"



#  ┏┓┏┓┳┳┓┳┳┓┏┓┳┓┳┓  ┳┓┏┓┏┳┓  ┏┓┏┓┳┳┳┓┳┓  ┓┏┏┓┳┓┳┓┓ ┏┓┳┓
#  ┃ ┃┃┃┃┃┃┃┃┣┫┃┃┃┃  ┃┃┃┃ ┃   ┣ ┃┃┃┃┃┃┃┃  ┣┫┣┫┃┃┃┃┃ ┣ ┣┫
#  ┗┛┗┛┛ ┗┛ ┗┛┗┛┗┻┛  ┛┗┗┛ ┻   ┻ ┗┛┗┛┛┗┻┛  ┛┗┛┗┛┗┻┛┗┛┗┛┛┗
#                                                       
command_not_found_handler() {
	printf "%s%s? WTF!!  you are typing\n" "$acc" "$0" >&2
    return 127
}



#  ┓┏┳┏┓┏┳┓┏┓┳┓┓┏
#  ┣┫┃┗┓ ┃ ┃┃┣┫┗┫
#  ┛┗┻┗┛ ┻ ┗┛┛┗┗┛
#                
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



#  ┏┓┏┓┏┓┓   ┏┓┏┓┏┳┓┳┏┓┳┓┏┓
#  ┃ ┃┃┃┃┃   ┃┃┃┃ ┃ ┃┃┃┃┃┗┓
#  ┗┛┗┛┗┛┗┛  ┗┛┣┛ ┻ ┻┗┛┛┗┗┛
#
setopt interactive_comments # Interactive comments
stty stop undef             # Disable ctrl-s for frezzing terminal
setopt AUTOCD               # Change directory just by typing its name
setopt PROMPT_SUBST         # enable command substitution in prompt
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt LIST_PACKED	    # The completion menu takes less space.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.


#  ┓┏┏┓┏┓┳  ┏┓┳┳┳┓┏┓┏┓  ┏┓  ┳┓┳┳┓┳┓┏┓
#  ┗┫┣┫┏┛┃  ┣ ┃┃┃┃┃ ┗┓  ┣╋  ┣┫┃┃┃┃┃┗┓
#  ┗┛┛┗┗┛┻  ┻ ┗┛┛┗┗┛┗┛  ┗┻  ┻┛┻┛┗┻┛┗┛
#                                    
yazicd() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bindkey -s '^o' '^uyazicd\n'


#  ┓┏┳┳┳┓  ┳┳┓┏┓┳┓┏┓  ┏┓  ┓┏┓┏┓┓┏┳┓┳┳┓┳┓┏┓
#  ┃┃┃┃┃┃━━┃┃┃┃┃┃┃┣   ┣╋  ┃┫ ┣ ┗┫┣┫┃┃┃┃┃┗┓
#  ┗┛┻┛ ┗  ┛ ┗┗┛┻┛┗┛  ┗┻  ┛┗┛┗┛┗┛┻┛┻┛┗┻┛┗┛
#                                         
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Basic binds deleting char both in normal or vi mode
bindkey '^[[3~' delete-char
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Vicmd specific binds
bindkey -M vicmd '^e' edit-command-line
bindkey -M vicmd '^?' vi-delete-char
bindkey -M visual '^?' vi-delete-char

# Additionaly set up basic Emacs-style navigation
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^B' backward-char



#  ┏┓┓ ┳┳┏┓┳┳┓┏┓  ┏┓  ┏┓┓ ┳┳┏┓┳┳┓  ┏┓┏┓┏┓┏┓┳┏┓┳┏┓  ┓┏┓┏┓┓┏┳┓┳┳┓┳┓┏┓
#  ┃┃┃ ┃┃┃┓┃┃┃┗┓  ┣╋  ┃┃┃ ┃┃┃┓┃┃┃  ┗┓┃┃┣ ┃ ┃┣ ┃┃   ┃┫ ┣ ┗┫┣┫┃┃┃┃┃┗┓
#  ┣┛┗┛┗┛┗┛┻┛┗┗┛  ┗┻  ┣┛┗┛┗┛┗┛┻┛┗  ┗┛┣┛┗┛┗┛┻┻ ┻┗┛  ┛┗┛┗┛┗┛┻┛┻┛┗┻┛┗┛
#                                                                  
# basic plugin manager to automatically import zsh plugins
# script by mattmc3 from https://github.com/mattmc3/zsh_unplugged
# clone a plugin, identify its init file, source it, and add it to your fpath
function plugin-load {
	local repo plugdir initfile initfiles=()
	: ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
	for repo in $@; do
		plugdir=$ZPLUGINDIR/${repo:t}
		initfile=$plugdir/${repo:t}.plugin.zsh
		if [[ ! -d $plugdir ]]; then
			echo "Cloning $repo..."
			git clone -q --depth 1 --recursive --shallow-submodules \
				https://github.com/$repo $plugdir
		fi
		if [[ ! -e $initfile ]]; then
			initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
			(( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
			ln -sf $initfiles[1] $initfile
		fi
		fpath+=$plugdir
		(( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
	done
}

# list of github repos of plugins
repos=(
	sindresorhus/pure
	zsh-users/zsh-autosuggestions
	zdharma-continuum/fast-syntax-highlighting
	zsh-users/zsh-history-substring-search
)
plugin-load $repos

# Styling of autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=12"

# Keybinds for plugins
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down



#  ┏┓┓┏┏┓┓ ┓   ┳┳┓┏┳┓┏┓┏┓┳┓┏┓┏┳┓┳┏┓┳┓
#  ┗┓┣┫┣ ┃ ┃   ┃┃┃ ┃ ┣ ┃┓┣┫┣┫ ┃ ┃┃┃┃┃
#  ┗┛┛┗┗┛┗┛┗┛  ┻┛┗ ┻ ┗┛┗┛┛┗┛┗ ┻ ┻┗┛┛┗
#
eval "$(zoxide init zsh)"
source <(fzf --zsh)

#  ┏┓┳┳┏┳┓┏┓┏┓┏┳┓┏┓┳┓┏┳┓
#  ┣┫┃┃ ┃ ┃┃┗┓ ┃ ┣┫┣┫ ┃ 
#  ┛┗┗┛ ┻ ┗┛┗┛ ┻ ┛┗┛┗ ┻ 
#                       
python3 $HOME/.local/bin/anifetch.py -f "$HOME/Videos/Anifetch/video.mp4" -r 10 -W 110 -H 60 -c "--symbols wide --fg-only" -ff
