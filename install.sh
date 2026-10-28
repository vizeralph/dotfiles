#!/usr/bin/env bash

############
# SETTINGS #
############
set -o errexit -o nounset
shopt -s nullglob dotglob

##########################
# COMMAND LINE INTERFACE #
##########################
dry_run=0
force=0

for option in "$@"; do
  case $option in
    --dry-run)
      dry_run=1
      ;;
    --force)
      force=1
      ;;
    *)
      printf 'Usage: %s [--dry-run] [--force]\n' "$0" >&2
      exit 2
      ;;
  esac
done

####################
# GLOBAL VARIABLES #
####################
root_path=$(cd "$(dirname "$0")" && pwd -P)
home_config_path=${XDG_CONFIG_HOME:-$HOME/.config}
home_data_path=${XDG_DATA_HOME:-$HOME/.local/share}
zsh_plugins_path=$home_data_path/zsh/plugins

config_directories=(
  btop
  darkman
  fontconfig
  gammastep
  hypr
  kitty
  mango
  nvim
)

shell_rc_files=(
  .bashrc
  .zshrc
)

zsh_plugins=(
  marlonrichert/zsh-autocomplete
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
)

#############
# FUNCTIONS #
#############
link() {
  local source=$1 target=$2

  if [[ ! -e $source ]]; then
    printf 'SKIP  %s (source missing)\n' "$source" >&2
    return
  fi

  if [[ -e $target || -L $target ]]; then
    if ((! force)); then
      printf 'SKIP  %s (already exists)\n' "$target"
      return
    fi

    if [[ $source == "$target" || $source == "$target/"* ]]; then
      printf 'ERROR %s (would remove source)\n' "$target" >&2
      return 1
    fi

    if ((dry_run)); then
      printf 'REPLACE %s -> %s\n' "$target" "$source"
      return
    fi

    rm --recursive --force -- "$target"
  elif ((dry_run)); then
    printf 'LINK  %s -> %s\n' "$target" "$source"
    return
  fi

  mkdir --parents -- "$(dirname "$target")"
  ln --symbolic -- "$source" "$target"
}

install_dotfiles() {
  local config_directory shell_rc_file

  for config_directory in "${config_directories[@]}"; do
    link "$root_path/.config/$config_directory" "$home_config_path/$config_directory"
  done

  for shell_rc_file in "${shell_rc_files[@]}"; do
    link "$root_path/$shell_rc_file" "$HOME/$shell_rc_file"
  done

  link "$root_path/.config/starship.toml" "$home_config_path/starship.toml"
  link "$root_path/.local/share/darkman" "$home_data_path/darkman"
  link "$root_path/.local/share/dbus-1/services/org.freedesktop.secrets.service" \
    "$home_data_path/dbus-1/services/org.freedesktop.secrets.service"
}

install_firefox() {
  local firefox_root_path profile_path
  local defaults_path=$root_path/.config/mozilla/firefox/default

  for firefox_root_path in "$HOME/.mozilla/firefox" "$home_config_path/mozilla/firefox"; do
    for profile_path in "$firefox_root_path"/*; do
      [[ -f $profile_path/prefs.js ]] || continue
      link "$defaults_path/chrome" "$profile_path/chrome"
      link "$defaults_path/user.js" "$profile_path/user.js"
    done
  done
}

install_zsh_plugins() {
  local plugin_directory repository repository_url refs tag

  for repository in "${zsh_plugins[@]}"; do
    plugin_directory=$zsh_plugins_path/${repository##*/}
    repository_url=https://github.com/$repository

    if [[ -e $plugin_directory || -L $plugin_directory ]] && ((! force)); then
      printf 'OK    %s (already exists)\n' "$plugin_directory"
    elif ((dry_run)); then
      printf 'CLONE latest tag %s -> %s\n' "$repository_url" "$plugin_directory"
    else
      refs=$(git ls-remote --tags --refs --sort=-version:refname "$repository_url")

      if [[ -z $refs ]]; then
        printf 'ERROR %s (no tags found)\n' "$repository_url" >&2
        return 1
      fi

      tag=${refs%%$'\n'*}
      tag=${tag##*/}

      mkdir --parents -- "$zsh_plugins_path"
      if [[ -e $plugin_directory || -L $plugin_directory ]]; then
        rm --recursive --force -- "$plugin_directory"
      fi

      git --no-advice clone \
        --depth 1 --branch "$tag" \
        --recurse-submodules --shallow-submodules \
        "$repository_url" "$plugin_directory"
    fi
  done
}

install_yazi() {
  local config_file
  local source_file=$root_path/.config/yazi/package.toml
  local target_file=$home_config_path/yazi/package.toml

  for config_file in "$root_path"/.config/yazi/*; do
    [[ -f $config_file ]] || continue
    link "$config_file" "$home_config_path/yazi/${config_file##*/}"
  done

  if [[ ! -f $source_file ]]; then
    printf 'SKIP  Yazi packages (source missing)\n' >&2
    return
  fi

  if ((dry_run)); then
    if ((force)) ||
      [[ ! -e $target_file && ! -L $target_file ]] ||
      [[ -L $target_file && $(readlink "$target_file") == "$source_file" ]]; then
      printf 'RUN   ya pkg install\n'
    else
      printf 'SKIP  Yazi packages (package.toml not linked)\n' >&2
    fi
  elif [[ -L $target_file && $(readlink "$target_file") == "$source_file" ]]; then
    ya pkg install
  else
    printf 'SKIP  Yazi packages (package.toml not linked)\n' >&2
  fi
}

########
# MAIN #
########
install_dotfiles
install_firefox
install_zsh_plugins
install_yazi
