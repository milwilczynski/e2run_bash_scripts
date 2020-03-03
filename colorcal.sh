#!/bin/bash
# Link to this file: https://goo.gl/6Sbmt2


file="xiccd.desktop"
dir="/etc/xdg/autostart"

lines="[Desktop Entry]
Encoding=UTF-8
Name=Xiccd
GenericName=Screen Color Bridge
Comment=Enables screen color calibration
Exec=xiccd
Terminal=false
Type=Application
Categories="


mainFunction () {
    installApps "displaycal yaourt"
    buildApps "xiccd"
    enableBridge
}


addLines () {
    for line in "$1"; do
        echo "$line" | sudo tee --append "$2" > /dev/null
    done
}


changeToDir () {
    if [ ! -d "$1" ]; then
        (>&2 echo "ERROR: $1 doesn't exist")
        exit 1
    fi

    cd "$1"
}


buildApps () {
    yaourt --sync --noconfirm $1
}


enableBridge () {
    changeToDir "$dir"
    removeFile "$file"
    addLines "$lines" "$file"
}


installApps () {
    sudo pacman --sync --refresh --refresh
    sudo pacman --sync --refresh --sysupgrade --noconfirm
    sudo pacman --sync --noconfirm $1
}


removeFile () {
    if [ -f "$1" ]; then
        sudo rm "$1"
    fi
}


mainFunction