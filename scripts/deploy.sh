#!/usr/bin/env bash

set -eu

cd "$ICLOUDPATH"

for file in .??*; do
    [[ "$file" = ".git" ]] && continue
    [[ "$file" = ".DS_Store" ]] && continue

    ln -fvns "$ICLOUDPATH/$file" "$HOME/$file"
done

ln -fvns "$ICLOUDPATH/iTerm2/" "$HOME/iTerm2/"
ln -fvns "$ICLOUDPATH/../Boostnote/" "$HOME/../Boostnote/"

cd "$HOME"

[[ -z $XDG_CONFIG_HOME ]] && XDG_CONFIG_HOME=$HOME/.config
mkdir -p "$XDG_CONFIG_HOME"

echo `which zsh` | sudo tee -a /etc/shells
chsh -s `which zsh`
