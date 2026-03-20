#!/bin/bash
set -e

cd "$(dirname "$0")"

_source_default() {
    local dir=$1
    local pkg_name=$(basename "$dir")
    local nl=$([ -z "$2" ] && echo -e "\n" || echo "")
    echo -e "$nl-- Setting up $pkg_name --"
    ./default.bash
}

find . -name ".bashrc" -print0 | while IFS= read -r -d '' file; do
    dir=$(readlink -f $(dirname "$file")/../)
    cd "$dir" && _source_default $dir || exit 1
done

find . -name "default.bash" -print0 | while IFS= read -r -d '' file; do
    dir=$(dirname "$file")
    if [[ "$dir" == *"bash"* ]]; then
        continue
    fi
    (cd "$dir" && _source_default $dir) || exit 1
done

unset _source_default
