#!/bin/bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh (unattended)..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended
fi

# Check for Homebrew and install if we don't have it
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Setup Homebrew environment for the current script session
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  if ! grep -q 'brew shellenv' "$HOME/.zprofile" 2>/dev/null; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  fi
elif [ -x "/usr/local/bin/brew" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
  if ! grep -q 'brew shellenv' "$HOME/.zprofile" 2>/dev/null; then
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
  fi
fi

# Add global gitignore
ln -sf "$DOTFILES_DIR/tilde/.gitignore_global" "$HOME/.gitignore_global"
git config --global core.excludesfile "$HOME/.gitignore_global"

# Symlink other root dotfiles
[ -f "$DOTFILES_DIR/tilde/.ideavimrc" ] && ln -sf "$DOTFILES_DIR/tilde/.ideavimrc" "$HOME/.ideavimrc"
[ -f "$DOTFILES_DIR/tilde/.tlrc.toml" ] && ln -sf "$DOTFILES_DIR/tilde/.tlrc.toml" "$HOME/.tlrc.toml"

# Backup existing zsh file if not already a symlink
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# symlinks the .zshrc file from the .dotfiles
ln -sf "$DOTFILES_DIR/tilde/.zshrc" "$HOME/.zshrc"

# Symlink ~/.config apps and oh-my-posh theme
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/oh-my-posh"
ln -sf "$DOTFILES_DIR/tilde/config/oh-my-posh-custom/themes/omp-zen.json" "$HOME/.config/oh-my-posh/omp-zen.json"

for config_dir in "$DOTFILES_DIR"/tilde/config/*; do
  if [ -d "$config_dir" ]; then
    base=$(basename "$config_dir")
    ln -sfn "$config_dir" "$HOME/.config/$base"
  fi
done

# Use Touch ID to authorize sudo
if [ ! -f /etc/pam.d/sudo_local ]; then
  echo "Enabling Touch ID to authorize sudo commands"
  echo "auth       sufficient     pam_tid.so" | sudo tee /etc/pam.d/sudo_local
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing software…"
brew bundle --file "$DOTFILES_DIR/Brewfile"
brew cleanup --prune=all

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create projects directories
mkdir -p "$HOME/Projects"
mkdir -p "$HOME/Herd"

# Create Code subdirectories
mkdir -p "$HOME/Code/blade-ui-kit"
mkdir -p "$HOME/Code/laravel"

# Clone Github repositories
"$DOTFILES_DIR/clone.sh"

# Symlink the Mackup config file to the home directory
ln -sf "$DOTFILES_DIR/macos/.mackup.cfg" "$HOME/.mackup.cfg"


# Symlink the aliases file to the home directory
# aliases and custom-aliases are sourced directly from .dotfiles from ~/.zshrc

# Set macOS preferences - we will run this last because this will reload the shell
if [ -f "$DOTFILES_DIR/macos/.macos.sh" ]; then
  source "$DOTFILES_DIR/macos/.macos.sh"
fi


echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo '1. Make sure dropbox is running first. If you have not backed up via Mackup yet, then run `mackup backup` to symlink preferences for a wide collection of apps to your dropbox. If you already had a backup via mackup run `mackup restore` You'\''ll find more info on Mackup here: https://github.com/lra/mackup.'
echo '2. Make a ~/.dotfiles-custom/tilde/.aliases for your personal commands'

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'