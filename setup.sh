#!/usr/bin/env bash

set -eu

# 保存パス
export DOTPATH="$HOME/dotfiles/"
export ICLOUDPATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Dotfiles/"

# -uのときローカルでGitを更新
while getopts :u opts
do
    case $opts in
        u)
            cd "$DOTPATH"
            echo "update dotfiles"
            scripts/update.sh
            exit 0
            ;;

            echo "invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

echo "start restore"

# cloneしてくる
if [ ! -d "$DOTPATH" ]; then
    git clone https://github.com/wh1tecat-nya/dotfiles.git "$DOTPATH"
else
    echo "already has dotfiles."
    exit 0
fi

cd "$DOTPATH"

scripts/restore.sh
