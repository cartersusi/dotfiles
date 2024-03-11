#!/bin/bash

CUR_DIR=$(pwd)
OS=$(uname -s)

os_check() {
    if [ "$OS" = "Linux" ]; then
        linux_script
        chmod +x $CUR_DIR/linux.sh
        $CUR_DIR/linux.sh
    elif [ "$OS" = "Darwin" ]; then
        mac_script
        chmod +x $CUR_DIR/mac.sh
        $CUR_DIR/mac.sh
    else
        echo "idk"
        exit
    fi
}

finisher() {
    mkdir $HOME/Clones
    firefox
}

firefox() {
    cd $HOME/Clones
    git clone https://github.com/cascadefox/cascade.git
    cd cascade

    FF_PATH=$(find $HOME/Library/Application\ Support/Firefox/Profiles/ -type d -name "*.default-release" | head -1)

    echo -e "\n@import 'includes/cascade-tcr.css';" >> chrome/UserChrome.css
    cp integrations/tabcenter-reborn/cascade-tcr.css chrome/includes/

    cp -r chrome "$FF_PATH"

    echo "Firefox -> about:config -> toolkit.legacyUserProfileCustomizations.stylesheets -> true"
    echo "Firefox -> Extensions -> Tab Center -> Preferences -> Custom Styles -> Save CSS"
}

os_check
finisher
