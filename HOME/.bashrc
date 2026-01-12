[[ $- != *i* ]] && return # If not running interactively, don't do anything

# ibus support for multilang kb
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export GLFW_IM_MODULE=ibus

# MACROS

# cmake macro, to make it more `make`-like
bake() {
    local build_dir="build"

    if [[ "$1" == "help" ]] || [[ "$1" == "--help" ]]; then
        # Print usage instructions
        echo "Bake Usage:"
        echo "To build:                 bake"
        echo "To clean build files:     bake clean"
        echo "To purge (delete build):  bake purge"
        return 0
    fi

    if [[ "$1" == "clean" ]]; then
        echo "Running cmake --build $build_dir --target clean..."
        cmake --build "$build_dir" --target clean || { echo "Bake: Clean failed"; return 1; }
        return 0
    fi

    if [[ "$1" == "purge" ]]; then
        echo "Bake: Purging the build directory: $build_dir"
        rm -rf "$build_dir" || { echo "Bake: Purge failed"; return 1; }
        echo "Bake: Build directory purged."
        return 0
    fi

    echo "Bake: Building CMake Project!"
    cmake -B "$build_dir" || { echo "Bake: CMake configuration failed"; return 1; }
    cmake --build "$build_dir" --parallel || { echo "Bake: Build failed"; return 1; }
}

# ALIASES
    alias c='clear'
    
    alias ls='eza'
    alias la='ls -a'
    alias ll='la -olh --smart-group --no-user --no-time'
    alias lls='ll --total-size'
    
    alias grep='grep --color=auto'
    alias cp='cp -rv'
    alias cat='bat'
    
    alias gadd='git add -A && git status'
    alias gp='git pull'
    alias gP='git push'
    alias gs='git status'
    alias gl="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white) - %an%C(reset)%C(auto)%d%C(reset)'"
    alias lg='lazygit'
    

# MISC
    eval "$(fzf --bash)"
    PS1='[\u@\h \W]\$ '
