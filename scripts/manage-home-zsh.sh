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
ZSH_PLUGINS_DIRECTORY_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"

PLUGINS=(
    "marlonrichert/zsh-autocomplete"
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-syntax-highlighting"
)

#############
# FUNCTIONS #
#############
source "$BASE_DIRECTORY_PATH/scripts/lib/helper.sh"

update_zsh_plugin() {
    local directory_path="$1"
    local error_message

    if ! error_message=$(git -C "$directory_path" pull --quiet 2>&1); then
        printf "\n  %s\n" "$error_message" >&2
        return 1
    fi
}

install_zsh_plugin() {
    local repository="$1"
    local directory_path="$2"
    local error_message

    if ! error_message=$(git clone --depth 1 --quiet "https://github.com/$repository.git" "$directory_path" 2>&1); then
        printf "\n  %s\n" "$error_message" >&2
        [[ -d "$directory_path" ]] && rm --force --recursive "$directory_path"
        return 1
    fi
}

sync_zsh_plugin() {
    local repository="$1"
    local plugin_name="${repository##*/}"
    local directory_path="$ZSH_PLUGINS_DIRECTORY_PATH/$plugin_name"

    if [[ -d "$directory_path" ]]; then
        printf "  Updating %s... " "$plugin_name"
        update_zsh_plugin "$directory_path" || return 1
    else
        printf "  Installing %s... " "$plugin_name"
        install_zsh_plugin "$repository" "$directory_path" || return 1
    fi

    printf "Done!\n"
}

########
# MAIN #
########
printf "Initializing environment setup...\n"
if ! ensure_directory "zsh plugins directory" "$ZSH_PLUGINS_DIRECTORY_PATH"; then
    printf "Aborting due to environment setup error.\n" >&2
    exit 1
fi

printf "\nProceeding with zsh plugins installation...\n"
for repository in "${PLUGINS[@]}"; do
    if ! sync_zsh_plugin "$repository"; then
        printf "Aborting due to installation error.\n" >&2
        exit 1
    fi
done

printf "\nProceeding with symbolic link...\n"
if ! create_symbolic_link "$BASE_DIRECTORY_PATH/.zshrc" "$HOME/.zshrc"; then
    printf "Aborting due to linking error.\n" >&2
    exit 1
fi

printf "\nAll zsh tasks complete!"
