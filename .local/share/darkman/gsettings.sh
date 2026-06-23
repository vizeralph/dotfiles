#!/usr/bin/env bash

set -eu

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

dconf write /org/gnome/desktop/interface/color-scheme "'$SCHEME'"
dconf write /org/gnome/desktop/interface/gtk-theme "'$THEME'"
