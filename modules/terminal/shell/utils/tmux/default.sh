#!/bin/bash

# config
PKG="${PWD##*/}"
TARGET="$HOME/.config/$PKG"
echo "Setting up: $PKG"
rm -rf $TARGET && mkdir -p $TARGET
stow -v -t $TARGET config
#
# bash
for f in "$PWD"/bash/*; do
    if [ -f "$f" ]; then
        echo "  -> Sourcing: $(basename "$f")"
        source "$f"
    fi
done
