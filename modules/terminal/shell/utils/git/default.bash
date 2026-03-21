#!/bin/bash

# config
PKG="${PWD##*/}"
TARGET="$HOME/.config/$PKG"
BASE_CONFIG=$TARGET/config
rm "$HOME/.gitconfig" 2> /dev/null # make sure we are using ~/.config one
rm $BASE_CONFIG 2> /dev/null
mkdir -p $TARGET
stow --verbose=2 -t $TARGET config

# bash
for f in "$PWD"/bash/*; do
    if [ -f "$f" ]; then
        echo "  -> Sourcing: $(basename "$f")"
        source "$f"
    fi
done


# handle config.local
if [ ! -f "$GIT_CONFIG_GLOBAL" ] || ! grep -q "path = .*git/config" "$GIT_CONFIG_GLOBAL" 2>/dev/null; then
    cat >> "$GIT_CONFIG_GLOBAL" << EOF
[include]
    path = $BASE_CONFIG
EOF
fi
