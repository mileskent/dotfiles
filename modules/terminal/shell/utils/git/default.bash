#!/bin/bash

# config
PKG="${PWD##*/}"
TARGET="$HOME/.config/$PKG"
echo "Setting up: $PKG"
BASE_CONFIG=$TARGET/config
rm "$HOME/.gitconfig" 2> /dev/null # make sure we are using ~/.config one
rm $BASE_CONFIG
stow -v -t $TARGET config

# bash
for f in "$PWD"/bash/*; do
    if [ -f "$f" ]; then
        echo "  -> Sourcing: $(basename "$f")"
        source "$f"
    fi
done


# handle config.local
export GIT_CONFIG_GLOBAL="$HOME/.config/git/config.local"
if [ ! -f "$GIT_CONFIG_GLOBAL" ] || ! grep -q "path = .*git/config" "$GIT_CONFIG_GLOBAL" 2>/dev/null; then
    cat >> "$GIT_CONFIG_GLOBAL" << EOF
[include]
    path = $BASE_CONFIG
EOF
fi
