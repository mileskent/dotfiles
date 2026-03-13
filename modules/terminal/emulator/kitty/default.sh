PKG="${PWD##*/}"
TARGET="$HOME/.config/$PKG"
echo "Setting up: $PKG"
rm -rf $TARGET && mkdir -p $TARGET
stow -v -t $TARGET config