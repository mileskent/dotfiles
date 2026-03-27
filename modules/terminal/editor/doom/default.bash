export EMACSDIR="$HOME/.config/emacs"
export DOOMDIR="$HOME/.config/doom"
PKG="Doom Emacs"

echo "$PKG: Checking if Emacs config exists"
if [ ! -d "$EMACSDIR" ] || [ -z "$(ls -A "$EMACSDIR")" ]; then
    echo "$PKG: Emacs config doesn't exist"
    mkdir -p $EMACSDIR 2> /dev/null
    git clone --depth 1 https://github.com/doomemacs/doomemacs "$EMACSDIR"
fi

BIN=/usr/local/bin/doom
if [ ! -f $BIN ]; then
    EMACSDIR="$HOME/.config/emacs"
    sudo ln -sf "$EMACSDIR/bin/doom" $BIN
    sudo chmod +x $BIN
fi

PATH="$EMACSDIR/bin:$PATH"
if [ ! -d "$DOOMDIR" ] || [ -z "$(ls -A "$DOOMDIR")" ]; then
    mkdir -p "$DOOMDIR"
    stow --verbose=2 -t "$DOOMDIR" config
    doom install --no-config
else
    stow --verbose=2 -t $DOOMDIR config
    doom sync
fi
