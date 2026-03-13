PKG="${PWD##*/}"
TARGET="$HOME"
echo "Setting up: $PKG"
stow -v -t $TARGET config