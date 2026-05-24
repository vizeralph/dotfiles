#!/usr/bin/env bash
set -eu

if [ -z "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
    echo "Hyprland instance not found. Skipping..."
    exit 0
fi

echo "Hyprland session detected. Forcing config reload..."
hyprctl reload
