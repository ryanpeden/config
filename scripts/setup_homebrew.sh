#!/usr/bin/env zsh

set -e

BREWFILE_PATH="$(dirname "$0")/../Brewfile"

echo "Updating Homebrew"
brew update

echo "Installing packages from Brewfile"
brew bundle --file="$BREWFILE"

echo "Upgrading packages"
brew upgrade

echo "Cleaning up old versions and caches"
brew cleanup
