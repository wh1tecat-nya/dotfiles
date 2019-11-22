#!/usr/bin/env bash

set -eu

for f in .??*; do
    [[ -d "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    cp -ia "$f" "$ICLOUDPATH"
done

for f in .??*; do
    [[ -f "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    cp -ia "$f" "$ICLOUDPATH"
done

cd ICLOUDPATH

for f in .??*; do
    [[ -d "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    rm -i "$HOME/$f"
    ln -fvns "$ICLOUDPATH/$f" "$HOME/$f"
done

for f in .??*; do
    [[ -f "$f" ]] && continue
    [[ -L "$f" ]] && continue
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == *"_history" ]] && continue

    rm -ri "$HOME/$f"
    ln -fvns "$ICLOUDPATH/$f/" "$HOME/$f/"
done


echo "all dotfiles updated"
exit 0