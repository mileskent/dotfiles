#!/bin/bash

# config
PKG="${PWD##*/}"
TARGET="$HOME/.config/$PKG"
rm -rf $TARGET && mkdir -p $TARGET
stow --verbose=2 -t $TARGET config

# bash
for f in "$PWD"/bash/*; do
    if [ -f "$f" ]; then
        echo "  -> Sourcing: $(basename "$f")"
        source "$f"
    fi
done
