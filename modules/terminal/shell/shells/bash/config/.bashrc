#!/bin/bash

[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR=nvim


short_pwd() {
    local cp="${PWD/#$HOME/\~}"
    local parent="${cp%/*}"
    local current="${cp##*/}"
    if [[ "$parent" == "$cp" ]]; then
        echo "$cp"
    else
        local shrunk=$(echo "$parent" | sed "s|\([^/]\{1\}\)[^/]*|\1|g; s| /|/|g")
        echo "${shrunk}/${current}"
    fi
}
get_git_info() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        local status=$(git status --porcelain 2>/dev/null)
        local mark=""
        [ -n "$status" ] && mark="*"
        local Cy='\[\e[0;36m\]'
        local RCol='\[\e[0m\]'
        echo -e " ${RCol}(${Cy}${branch}${mark}${RCol})"
    fi
}
__prompt_command() {
    local EXIT="$?"
    local RCol='\[\e[0m\]'
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BBlu='\[\e[1;34m\]'
    local BPur='\[\e[1;35m\]'
    local EXIT_STATUS="${Gre}:)${RCol}"
        [ $EXIT != 0 ] && EXIT_STATUS="${Red}:(${RCol}"
    local PROMPT=" ${BPur}λ${RCol} "
    PS1=" ${BBlu}$(short_pwd)$(get_git_info)${RCol} ${EXIT_STATUS}\n${PROMPT}"
}
PROMPT_COMMAND=__prompt_command

_source_config_providers() {
    local real_dir
    local utils_dir

    real_dir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
    utils_dir="$real_dir/../../../utils"

    if [ -d "$utils_dir" ]; then
        while IFS= read -r script; do
            if [ -f "$script" ]; then
                . "$script"
            fi
        done < <(find "$utils_dir" -type d -name "bash" -exec find {} -maxdepth 1 -type f \;)
    else
        echo "Error in .bashrc!"
    fi
}

_source_config_providers
unset -f _source_config_providers
