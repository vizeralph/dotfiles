#!/bin/sh

############
# SETTINGS #
############
set -o errexit

########
# MAIN #
########
case ${1:-} in
  dark)
    scheme=prefer-dark
    theme=Adwaita-dark
    ;;
  *)
    scheme=prefer-light
    theme=Adwaita
    ;;
esac

dconf write /org/gnome/desktop/interface/gtk-theme "'$theme'"
dconf write /org/gnome/desktop/interface/color-scheme "'$scheme'"
