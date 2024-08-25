#! /bin/bash

i_deps() {
    #sudo pacman -S base-devel ccache cmake git go libiconv libtool make ninja pkg-config python rust sed unzip ruby
    yay -S llvm16 # really slow, I used this instead of archive so idk symlinks 
    mkdir -p ~/clones
    cd ~/clones
    curl -O https://archive.archlinux.org/packages/c/clang16/clang16-16.0.6-1-x86_64.pkg.tar.zst
    curl -O https://archive.archlinux.org/packages/c/compiler-rt16/compiler-rt16-16.0.6-1-x86_64.pkg.tar.zst
    curl -O https://archive.archlinux.org/packages/l/lld16/lld16-16.0.6-1-x86_64.pkg.tar.zst
    sudo ln -s /usr/lib/llvm16/bin/ld.lld /usr/lib/llvm16/bin/ld.lld-16
}

f_conf() {
  printf "%s\n" "set -gx PATH ~/.local/bin \$PATH" >> ~/.config/fish/config.fish
  printf "%s\n" "set -gx PATH ~/bun/build \$PATH" >> ~/.config/fish/config.fish
}

i_bun() {
    curl -fsSL https://bun.sh/install | bash
    source ~/.config/fish/config.fish

    cd --
    gh repo fork oven-sh/bun
    cd bun
    bun setup
}

if [ "$1" == "init" ]; then
    i_deps
    f_conf
    i_bun
elif [ "$1" == "test" ]; then
    cd ~/bun
    bun-debug test
elif [ "$1" == "build" ]; then
    cd ~/bun
    bun run build
else
    echo "Invalid argument"
    exit 1
fi