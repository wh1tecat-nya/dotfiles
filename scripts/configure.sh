#!/usr/bin/env bash

set -eu

if ! command -v defaults > /dev/null 2>&1; then
    echo "\`defaults\` not found. Nothing to do."
    exit 0
fi

echo "Configuring UI..."
## バッテリー表示を % 表記にする
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
## ダークモード
defaults write -g AppleInterfaceStyle -string "Dark"

echo "Configuring Trackpad..."
## トラックパッドのタップでクリックにする
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

echo "Configuring Keyboard..."
## リピート入力認識までの時間
defaults write -g InitialKeyRepeat -int 25;
## キーのリピート
defaults write -g KeyRepeat -int 2

# echo "Configuring SystemUIServer..."

echo "Configuring Dock..."
## Dockの非表示
defaults write com.apple.dock autohide -bool true
## Dockの大サイズ
defaults write com.apple.dock largesize -int 69


echo "Configuring Finder..."
## 不可視ファイルを表示する
defaults write com.apple.finder AppleShowAllFiles true
## 拡張子表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## ステータスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true
## パスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true
killall Finder

# echo "Configuring Safari..."

echo ""
echo "Configuration Complete!"
echo "Please restart Mac to make sure settings are reflected."
