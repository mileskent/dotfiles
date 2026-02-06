[[ $- != *i* ]] && return # If not running interactively, don't do anything

# ENV VARS
export VISUAL=nvim
export EDITOR=nvim
PS1='[\u @ \W]\n λ '

# SOURCE SCRIPTS
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
for dir in $SCRIPT_DIR/.shell/*; do
    if [ -d "$dir" ]; then
        source "$dir/$(basename "$dir").sh"
    fi
done
unset SCRIPT_DIR

# MISC
alias c='clear'
alias grep='grep --color=auto'
alias cp='cp -rv'
alias rm='safe-rm'
