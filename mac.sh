#!/bin/bash

# 3AM - bat 85%

CUR_DIR=$(pwd)
pkgs=(  "git"
        "neovim"
        "fish"
        "mas"
        "alacritty"
        "--cask zed"
        "--cask firefox"
        "--cask gimp"
        "--cask telegram"
        "--cask discord"
        "--cask istat-menus")

deps() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    curl -fsSL https://bun.sh/install | bash
}

brews() {
    for pkg in ${pkgs[@]}; do
        echo "Installing $pkg ..."
        brew install $pkg
    done
}

metal() {
    xcode-select --install
    xcode_id=$(mas search Xcode | grep Xcode | awk '{print $1}')
    mas install $xcode_id
}

configs() {
    echo "Setting up Alacritty configs ..."
    mkdir -p $HOME/.config/alacritty
    cp $CUR_DIR/confs/mac_alacritty.toml $HOME/.config/alacritty/alacritty.toml

    echo "Setting up Zed configs ..."
    mkdir $HOME/.config/zed
    cp -r $CUR_DIR/confs/zed/* $HOME/.config/zed/
}

reminders() {
    echo "System Settings -> Privacy & Security -> Allow Alacritty Open"
}

deps
brews
metal
configs
reminders
