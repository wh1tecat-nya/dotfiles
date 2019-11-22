#!/usr/bin/env bash

set -eu

# 保存パス
export ICLOUDPATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
export LOCALDOTPATH="$HOME/dotfiles"
export REMOTEDOTPATH="$ICLOUDPATH/Dotfiles"

function replaceFile () {
    local af=$1
    local c=$2
    echo "replace \"$HOME/$af\" OK?"

    read -n1 -p "type y/n: " yn
    echo
    if [[ $yn = [yY] ]]; then
        rm -rf "$HOME/$af"

        if "$c"; then
            ln -fvns "$REMOTEDOTPATH/$af" "$HOME/.config"
        else
            ln -fvns "$REMOTEDOTPATH/$af" "$HOME"
        fi
    else
        echo "skipped"
    fi
}

export -f replaceFile

# -uのときローカルでGitを更新
while getopts :u opts
do
    case $opts in
        u)
            cd "$LOCALDOTPATH"
            echo "update dotfiles"
            scripts/update.sh
            exit 0
            ;;
        \?)
            echo "invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

echo "start restore"

# cloneしてくる
if [ ! -d "$LOCALDOTPATH" ]; then
    git clone https://github.com/wh1tecat-nya/dotfiles.git "$LOCALDOTPATH"
else
    echo "already has dotfiles."
    exit 0
fi

cd "$LOCALDOTPATH"

scripts/restore.sh
