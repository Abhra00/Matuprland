#  ┏┓┏┓  ┏┓┓ ┳┏┓┏┓┏┓┏┓
#  ┏┛┃┫━━┣┫┃ ┃┣┫┗┓┣ ┗┓
#  ┗━┗┛  ┛┗┗┛┻┛┗┗┛┗┛┗┛
#                     

# ── File Management & Navigation with eza ────────────────
alias ls='eza --icons --color=always --group-directories-first'
alias l='eza -lh --icons --color=always'                   # long + human-readable
alias la='eza -a --icons --color=always'                   # show hidden
alias ll='eza -lga --icons --color=always'                 # long + git + all + icons
alias lsd='eza -d */ --icons --color=always'               # directories only
alias lt='eza --tree --icons --color=always'               # tree view
alias l1='eza -1 --icons --color=always'                   # one entry per line
alias cat='bat --theme=matugen-bat-colors'				         # bat for cat

# ── File Utilities ────────────────────────────────────────
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'
alias mkdir='mkdir -pv'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias c='clear'

# ── Editing & Viewing ─────────────────────────────────────
alias v='nvim'
alias e='nvim'
alias less='less -R'

# ── Quick Navigation ──────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ── Networking ────────────────────────────────────────────
alias wget='wget -c'

# ── Git Shortcuts ─────────────────────────────────────────
alias g='git'
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gcl='git clone'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gco='git checkout'

# ── Misc Utilities ────────────────────────────────────────
alias h='history'
alias reload='exec fish'
alias q='exit'

