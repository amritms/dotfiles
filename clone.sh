#!/bin/sh

set -euo pipefail

echo "Cloning repositories..."

SITES="$HOME/Projects"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

mkdir -p "$SITES"
mkdir -p "$ZSH_CUSTOM/plugins"

clone_repo() {
  local url="$1"
  local dest="$2"
  shift 2
  if [ -d "$dest" ]; then
    echo "Directory $dest already exists, skipping..."
  else
    git clone "$@" "$url" "$dest" || echo "Warning: Failed to clone $url"
  fi
}

# zsh plugins
clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_repo https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" --depth 1
clone_repo https://github.com/jessarcher/zsh-artisan.git "$ZSH_CUSTOM/plugins/artisan"
clone_repo https://github.com/Aloxaf/fzf-tab "$ZSH_CUSTOM/plugins/fzf-tab"

# Personal
clone_repo git@github.com:amritms/docker-multi-project-mysql57.git "$SITES/mysql57"
clone_repo git@github.com:amritms/docker-multi-project-mysql8.git "$SITES/mysql"
clone_repo git@github.com:amritms/docker-postgres.git "$SITES/postgres"

