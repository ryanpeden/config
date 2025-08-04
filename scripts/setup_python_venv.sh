#!/usr/bin/env zsh

set -e

VENV_PATH="$HOME/.venv"
REQS_PATH="$(dirname "$0")/../requirements.txt"

if [ ! -d "$VENV_PATH" ]; then
    echo "Creating Python virtual environment at $VENV_PATH"
    python3 -m venv "$VENV_PATH"
fi

if [ -f "$REQS_PATH" ]; then
    echo "Installing Python packages from $REQS_PATH"
    "$VENV_PATH/bin/python" -m pip install -r "$REQS_PATH"
fi
