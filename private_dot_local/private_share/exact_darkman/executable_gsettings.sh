#!/usr/bin/env bash

case "$1" in
    dark)
        SCHEME="prefer-dark"
        THEME="Adwaita-dark"
        ;;
    light|*)
        SCHEME="prefer-light"
        THEME="Adwaita"
        ;;
esac

gsettings set org.gnome.desktop.interface color-scheme "$SCHEME"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
