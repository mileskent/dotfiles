#!/bin/bash
PKG="${PWD##*/}"
TARGET="$HOME"
stow --verbose=2 -t $TARGET config
