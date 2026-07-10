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
HOME_DATA_DIRECTORY_PATH="${XDG_DATA_HOME:-$HOME/.local/share}"
SCRIPT_DATA_DIRECTORY_PATH="$BASE_DIRECTORY_PATH/.local/share"

DATA_DIRECTORIES=(
    "darkman"
    "dbus-1"
)

#############
# FUNCTIONS #
#############
source "$BASE_DIRECTORY_PATH/scripts/lib/helper.sh"

########
# MAIN #
########
printf "Initializing environment setup...\n"
if ! ensure_directory "home data directory" "$HOME_DATA_DIRECTORY_PATH"; then
    printf "Aborting due to environment setup error.\n" >&2
    exit 1
fi

printf "\nProceeding with symbolic links...\n"
for data_directory in "${DATA_DIRECTORIES[@]}"; do
    if ! create_symbolic_link "$SCRIPT_DATA_DIRECTORY_PATH/$data_directory" "$HOME_DATA_DIRECTORY_PATH/$data_directory"; then
        printf "Aborting due to linking error.\n" >&2
        exit 1
    fi
done

printf "\nAll home data tasks complete!"
