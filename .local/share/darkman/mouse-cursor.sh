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
SIZE=32

case "${1:-}" in
    light)
        THEME="phinger-cursors-dark"
        ;;
    dark|*)
        THEME="phinger-cursors-light"
        ;;
esac

dconf write /org/gnome/desktop/interface/cursor-theme "'$THEME'"
dconf write /org/gnome/desktop/interface/cursor-size "$SIZE"

mkdir -p "$HOME/.icons/default"
cat <<EOF > "$HOME/.icons/default/index.theme"
[Icon Theme]
Inherits=$THEME
EOF

if command -v hyprctl >/dev/null 2>&1 &&
   [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
    hyprctl setcursor "$THEME" "$SIZE"
fi

if command -v swaymsg >/dev/null 2>&1 &&
   [[ -n "${SWAYSOCK:-}" ]]; then
    swaymsg seat '*' xcursor_theme "$THEME" "$SIZE"
fi
