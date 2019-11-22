#!/usr/bin/env bash

set -eu

cp .mackup.cfg "$HOME"

# Mac basic settings
scripts/configure.sh
echo

scripts/deploy.sh
echo

# install homebrew
if ! command -v brew > /dev/null 2>&1; then
    # Install homebrew: https://brew.sh/
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo
fi
brew bundle
echo

mackup restore
echo

echo "restore complete."
