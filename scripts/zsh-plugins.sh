#!/usr/bin/env bash

set -eu

ZSH_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
PLUGINS=(
    "marlonrichert/zsh-autocomplete"
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-syntax-highlighting"
)

echo "Checking Zsh plugins directory..."
if [ ! -d "$ZSH_PLUGIN_DIR" ]; then
    echo "Creating directory: $ZSH_PLUGIN_DIR"
    mkdir -p "$ZSH_PLUGIN_DIR"
fi

for repo in "${PLUGINS[@]}"; do
    plugin_name="${repo##*/}"
    target_dir="$ZSH_PLUGIN_DIR/$plugin_name"

    if [ -d "$target_dir" ]; then
        echo "  ✓ $plugin_name is already installed."
    else
        echo -n "  Installing $plugin_name... "
        if ! git clone -q --depth 1 "https://github.com/$repo.git" "$target_dir" 2>/dev/null; then
            echo "Failed!"
            rm -rf "$target_dir"
            exit 1
        fi
        echo "Done!"
    fi
done

echo ""
echo "All plugins checked!"
