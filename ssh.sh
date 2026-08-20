#!/bin/bash

set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: ./ssh.sh your_email@example.com"
  exit 1
fi

EMAIL="$1"
echo "Generating a new SSH key for GitHub ($EMAIL)..."

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Generating a new SSH key
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/id_ed25519"

# Adding your SSH key to the ssh-agent
eval "$(ssh-agent -s)"

# Configure SSH to use macOS Keychain
if ! grep -q "IdentityFile ~/.ssh/id_ed25519" "$HOME/.ssh/config" 2>/dev/null; then
  cat << 'EOF' >> "$HOME/.ssh/config"

Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
  chmod 600 "$HOME/.ssh/config"
fi

# Add key to Keychain
if ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519" 2>/dev/null; then
  echo "SSH key added to macOS Keychain."
elif ssh-add -K "$HOME/.ssh/id_ed25519" 2>/dev/null; then
  echo "SSH key added to macOS Keychain."
else
  ssh-add "$HOME/.ssh/id_ed25519"
fi

# Copy public key to clipboard
if command -v pbcopy &>/dev/null; then
  pbcopy < "$HOME/.ssh/id_ed25519.pub"
  echo "SSH public key copied to your clipboard!"
fi

echo "Add your key to GitHub at: https://github.com/settings/keys"
