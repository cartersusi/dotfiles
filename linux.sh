#!/bin/bash

CUR_DIR=$(pwd)

pacman_pkgs="firefox gimp inkscape gnome-calculator discord docker neovim nodejs npm obs-studio btop go rustup nvidia-dkms opencl-nvidia nvidia-utils nvidia-settings unzip fish dosfstools gparted"

AUR_pkgs=(
    "gwe"
    "google-chrome"
    "visual-studio-code-bin"
)

start() {
    sudo pacman -Syy
    sudo pacman -Syu
    sudo pacman -S curl git
}

de() {
    curl https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller -o $HOME/RiceInstaller
    chmod +x RiceInstaller
    ./RiceInstaller
}

install() {
    sudo pacman -S $pacman_pkgs

    for pkg in ${AUR_pkgs[@]}; do
        echo "Installing $pkg ..."
        paru -S $pkg
    done
}

cuda() {
    mkdir $HOME/.cuda_sources
    cd $HOME/.cuda_sources

    curl -O https://archive.archlinux.org/packages/g/gcc11/gcc11-11.3.0-5-x86_64.pkg.tar.zst
    curl -O https://archive.archlinux.org/packages/g/gcc11-libs/gcc11-libs-11.3.0-5-x86_64.pkg.tar.zst
    sudo pacman -U gcc11-11.3.0-5-x86_64.pkg.tar.zst gcc11-libs-11.3.0-5-x86_64.pkg.tar.zst

    curl -O https://archive.archlinux.org/packages/c/cuda/cuda-11.8.0-1-x86_64.pkg.tar.zst
    sudo pacman -U cuda-11.8.0-1-x86_64.pkg.tar.zst

    curl -O https://archive.archlinux.org/packages/c/cudnn/cudnn-8.6.0.163-1-x86_64.pkg.tar.zst
    sudo pacman -U cudnn-8.6.0.163-1-x86_64.pkg.tar.zst
}

start
de
install
cuda
