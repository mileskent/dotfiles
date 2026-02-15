alias gadd='git add . && git status'
alias gAdd='git add -A && git status'
alias gp='git pull'
alias gP='git push'
alias gs='git status'
alias gl="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white) - %an%C(reset)%C(auto)%d%C(reset)'"
alias lg='lazygit'

GIT_SHELL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GIT_SHELL_SCRIPTS_DIR="$GIT_SHELL_DIR/scripts"
chmod +x "$GIT_SHELL_SCRIPTS_DIR"/*
if [[ ":$PATH:" != *":$GIT_SHELL_SCRIPTS_DIR:"* ]]; then
    export PATH="$GIT_SHELL_SCRIPTS_DIR:$PATH"
fi
unset GIT_SHELL_DIR
unset GIT_SHELL_SCRIPTS_DIR
