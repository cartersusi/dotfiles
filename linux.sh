#! /bin/bash

currdir=$(pwd)
pacman_pkgs="firefox gimp inkscape gnome-calculator discord docker neovim nodejs npm obs-studio btop go rustup nvidia-dkms opencl-nvidia nvidia-utils nvidia-settings fish dosfstools gparted bluez bluez-utils fuse telegram-desktop imagemagick python-opencv ffmpeg tk steam base-devel ccache cmake git libiconv libtool make ninja pkg-config python rust sed unzip ruby os-prober zig"
AUR_pkgs="gwe google-chrome visual-studio-code-bin postman python310 lmstudio-appimage"

init_venv() {
    python3 -m venv ~/DataScience
    source ~/DataScience/bin/activate
    pip install --upgrade pip
    pip install -r $currdir/requirements.txt
}

init_bun(){
    chmod +x $currdir/bunscript.sh
    $currdir/bunscript.sh init
}

dualboot() {
    sudo grub-mkconfig -o /boot/grub/grub.cfg

    echo "SLEEP 10s: Uncomment the line GRUB_DISABLE_OS_PROBER=false in /etc/default/grub to enable os-prober."
    sleep 10s
    sudo nano /etc/default/grub

    sudo grub-mkconfig -o /boot/grub/grub.cfg
}

yay_installer() {
    cd $HOME
    pacman -Sy --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
}

pkg_installer() {
    sudo pacman -Syu
    sudo pacman -S $pacman_pkgs
    yay -S $AUR_pkgs
}

rtings_icc() {
    cd $HOME/Downloads
    curl -O https://i.rtings.com/assets/products/2fetTmnF/msi-mpg-271qrx-qd-oled/rtings-icc-profile.icm
    cp rtings-icc-profile.icm $HOME/local/share/icc
    cd ..
}

bt() {
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
}

cuda_installer() {
    cd $HOME/clones
    curl -O https://archive.archlinux.org/packages/c/cudnn/cudnn-9.1.1.17-1-x86_64.pkg.tar.zst
    curl -O https://archive.archlinux.org/packages/c/cuda/cuda-12.1.0-3-x86_64.pkg.tar.zst
    
    sudo pacman -U cuda-12.1.0-3-x86_64.pkg.tar.zst
    sudo pacman -U cudnn-9.1.1.17-1-x86_64.pkg.tar.zst
    cd ..
}


if [ "$1" == "new" ]; then
    init_venv
    init_bun
    dualboot
    yay_installer
    pkg_installer
    rtings_icc
    bt
    cuda_installer
    cp -r $currdir/linux/* $HOME
    dconf load / < $currdir/gnome-settings-backup.ini
fi