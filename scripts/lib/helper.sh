ensure_directory() {
    local label_message="$1"
    local directory_path="$2"
    local error_message

    printf "  Preparing %s... " "$label_message"
    if ! error_message=$(mkdir --parents "$directory_path" 2>&1); then
        printf "\n  %s\n" "$error_message" >&2
        return 1
    fi
    printf "Done!\n"
}

create_symbolic_link() {
    local source_path="$1"
    local destination_path="$2"
    local error_message

    if [[ ! -e "$source_path" ]]; then
        printf "  Error: Source '%s' does not exist.\n" "$source_path" >&2
        return 1
    fi

    if [[ -e "$destination_path" && ! -L "$destination_path" ]]; then
        printf "  Error: A regular file or directory already exists at '%s'\n" "$destination_path" >&2
        return 1
    fi

    printf "  Linking %s -> '%s'... " "$(basename "$source_path")" "$destination_path"
    if ! error_message=$(ln --force --no-dereference --symbolic "$source_path" "$destination_path" 2>&1); then
        printf "\n  %s\n" "$error_message" >&2
        return 1
    fi
    printf "Done!\n"
}
