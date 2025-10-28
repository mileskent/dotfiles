[[ $- != *i* ]] && return # If not running interactively, don't do anything

# ibus support for multilang kb
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export GLFW_IM_MODULE=ibus

# ALIASES
    alias c='clear'
    
    alias ls='eza'
    alias la='eza -a'
    alias ll='la -olh --smart-group --no-user --no-time'
    alias lls='ll --total-size'
    
    alias grep='grep --color=auto'
    alias cp='cp -rv'
    alias cat='bat'
    alias open='xdg-open'
    
    alias gadd='git add -A && git status'
    alias gp='git pull'
    alias gP='git push'
    alias gs='git status'
    alias gl="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white) - %an%C(reset)%C(auto)%d%C(reset)'"
    alias lg='lazygit'
    

# MISC
    eval "$(fzf --bash)"
    PS1='[\u@\h \W]\$ '
