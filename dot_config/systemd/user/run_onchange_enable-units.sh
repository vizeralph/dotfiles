#!/usr/bin/env bash
set -eu

echo "Reloading systemd user daemon..."
systemctl --user daemon-reload

UNITS=(
    "darkman.service"
    "gammastep.service"
    "geoclue-agent.service"
)

for UNIT in "${UNITS[@]}"; do
    if ! systemctl --user list-unit-files "$UNIT" &>/dev/null; then
        echo "$UNIT is not installed. Skipping..."
        continue
    fi

    if ! systemctl --user --quiet is-enabled "$UNIT" 2>/dev/null; then
        echo "Enabling $UNIT..."
        systemctl --user enable "$UNIT"
    fi
done
