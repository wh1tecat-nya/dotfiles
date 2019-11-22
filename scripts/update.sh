#!/usr/bin/env bash

set -eu

for f in .??*; do
    [[ -d "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    cp -ia "$f" "$REMOTEDOTPATH"
done

for f in .??*; do
    [[ -f "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".config" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    cp -ia "$f" "$REMOTEDOTPATH"
done

cd ".config"

for f in .??*; do
    [[ -f "$f" ]] && continue
    [[ "$f" == "yarn" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    cp -ia "$f" "$REMOTEDOTPATH/.config"
done

cd ICLOUDPATH

for f in .??*; do
    [[ -d "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    rm -i "$HOME/$f"
    ln -fvns "$REMOTEDOTPATH/$f" "$HOME/$f"
done

for f in .??*; do
    [[ -f "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".config" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    rm -rI "$HOME/$f"
    ln -fvns "$REMOTEDOTPATH/$f" "$HOME"
done

cd ".config"

for f in .??*; do
    [[ -f "$f" ]] && continue
    [[ "$f" == "yarn" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    
    rm -rI "$HOME/.config/$f"
    ln -fvns "$REMOTEDOTPATH/.config/$f" "$HOME/.config"
done

echo "all dotfiles updated"
exit 0