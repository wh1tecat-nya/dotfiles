#!/usr/bin/env bash
set -eu

cd "$REMOTEDOTPATH"

for f1 in .??*; do
    [[ -d "$f1" ]] && continue
    [[ "$f1" = ".git" ]] && continue
    [[ "$f1" = ".DS_Store" ]] && continue

    ln -fvns "$REMOTEDOTPATH/$f1" "$HOME"
done

for f2 in .??*; do
    [[ -f "$f2" ]] && continue
    [[ "$f2" == ".config" ]] && continue
    [[ "$f2" == ".git" ]] && continue
    [[ "$f2" == ".DS_Store" ]] && continue

    replaceFile "$f2" false
    ## rm -rI "$HOME/$f"
    ## ln -fvns "$REMOTEDOTPATH/$f" "$HOME"
done

cd .config
mkdir -p "$HOME/.config"

for f3 in *; do
    [[ -f "$f3" ]] && continue
    [[ "$f3" == "yarn" ]] && continue
    [[ "$f3" == ".git" ]] && continue
    [[ "$f3" == ".DS_Store" ]] && continue
    
    replaceFile ".config/$f3" true
    ## rm -rI "$HOME/.config/$f"
    ## ln -fvns "$REMOTEDOTPATH/.config/$f" "$HOME/.config"
done

cd "../"

replaceFile "iTerm2" false
## ln -fvns "$REMOTEDOTPATH/iTerm2" "$HOME/iTerm2"

rm -rf "$HOME/Boostnote"
ln -fvns "ICLOUDPATH/Boostnote" "$HOME/Boostnote"

cd "$HOME"

echo `which zsh` | sudo tee -a /etc/shells
chsh -s `which zsh`
