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
BASE_DIRECTORY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

########
# MAIN #
########
echo "Starting dotfiles deployment..."
echo "--------------------------------"

"$BASE_DIRECTORY_PATH/symlink-config.sh"
"$BASE_DIRECTORY_PATH/symlink-local-share.sh"
"$BASE_DIRECTORY_PATH/symlink-zsh.sh"

echo "--------------------------------"
echo "Deployment complete!"
