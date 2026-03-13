[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR=nvim
export PS1='[\u @ \W]\n λ '

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