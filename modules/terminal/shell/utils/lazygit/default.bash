#!/bin/bash

# config
PKG="${PWD##*/}"
TARGET="$HOME/.config/$PKG"
rm -rf $TARGET && mkdir -p $TARGET
stow --verbose=2 -t $TARGET config
