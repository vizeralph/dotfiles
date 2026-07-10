#!/usr/bin/env bash

############
# SETTINGS #
############
set -o errexit
set -o nounset
set -o pipefail

###########
# GLOBALS #
###########
BASE_DIRECTORY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOME_CONFIG_DIRECTORY_PATH="${XDG_CONFIG_HOME:-$HOME/.config}"
SCRIPT_CONFIG_DIRECTORY_PATH="$BASE_DIRECTORY_PATH/.config"

CONFIG_DIRECTORIES=(
    "darkman"
    "gammastep"
    "hypr"
    "kitty"
    "nvim"
)

#############
# FUNCTIONS #
#############
source "$BASE_DIRECTORY_PATH/scripts/lib/helper.sh"

sync_directory_contents() {
    local source_directory="$1"
    local destination_directory="$2"

    ensure_directory "contents directory" "$destination_directory" || return 1

    for item_path in "$source_directory"/*; do
        [[ -e "$item_path" ]] || continue

        local item_name="${item_path##*/}"
        create_symbolic_link "$item_path" "$destination_directory/$item_name" || return 1
    done
}

########
# MAIN #
########
printf "Initializing environment setup...\n"
if ! ensure_directory "home config directory" "$HOME_CONFIG_DIRECTORY_PATH"; then
    printf "Aborting due to environment setup error.\n" >&2
    exit 1
fi

printf "\nProceeding with base configuration directories...\n"
for configuration_name in "${CONFIG_DIRECTORIES[@]}"; do
    if ! create_symbolic_link "$SCRIPT_CONFIG_DIRECTORY_PATH/$configuration_name" "$HOME_CONFIG_DIRECTORY_PATH/$configuration_name"; then
        printf "Aborting due to linking error.\n" >&2
        exit 1
    fi
done

printf "\nProceeding with Firefox environment configuration...\n"
if ! create_symbolic_link "$SCRIPT_CONFIG_DIRECTORY_PATH/mozilla/firefox/profiles.ini" "$HOME_CONFIG_DIRECTORY_PATH/mozilla/firefox/profiles.ini"; then
    printf "Aborting due to Firefox profile error.\n" >&2
    exit 1
fi

if ! sync_directory_contents "$SCRIPT_CONFIG_DIRECTORY_PATH/mozilla/firefox/default" "$HOME_CONFIG_DIRECTORY_PATH/mozilla/firefox/default"; then
    printf "Aborting due to Firefox default profile synchronization error.\n" >&2
    exit 1
fi

printf "\nProceeding with Systemd user units configuration...\n"
if ! sync_directory_contents "$SCRIPT_CONFIG_DIRECTORY_PATH/systemd/user" "$HOME_CONFIG_DIRECTORY_PATH/systemd/user"; then
    printf "Aborting due to Systemd synchronization error.\n" >&2
    exit 1
fi

printf "\nProceeding with Yazi configuration...\n"
if ! sync_directory_contents "$SCRIPT_CONFIG_DIRECTORY_PATH/yazi" "$HOME_CONFIG_DIRECTORY_PATH/yazi"; then
    printf "Aborting due to Yazi synchronization error.\n" >&2
    exit 1
fi
printf "Running Yazi package manager updates...\n"
ya pkg install && ya pkg upgrade

printf "\nProceeding with Starship configuration...\n"
if ! create_symbolic_link "$SCRIPT_CONFIG_DIRECTORY_PATH/starship.toml" "$HOME_CONFIG_DIRECTORY_PATH/starship.toml"; then
    printf "Aborting due to Starship linking error.\n" >&2
    exit 1
fi

printf "\nAll configuration setup tasks complete!\n"
