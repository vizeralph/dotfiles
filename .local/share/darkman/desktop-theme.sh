#!/usr/bin/env bash

############
# SETTINGS #
############
set -o errexit
set -o nounset
set -o pipefail

########
# MAIN #
########
case "${1:-}" in
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
