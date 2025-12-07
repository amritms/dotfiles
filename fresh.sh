#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add global gitignore
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a projects directories
mkdir $HOME/Projects
mkdir $HOME/Herd

# Create Code subdirectories
mkdir $HOME/Code/blade-ui-kit
mkdir $HOME/Code/laravel

# Clone Github repositories
./clone.sh

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/macos/.mackup.cfg $HOME/.mackup.cfg


# Symlink the aliases file to the home directory
# aliases and custom-aliases are sourced directly from .dotfiles from ~/.zshrc

# Set macOS preferences - we will run this last because this will reload the shell
source ./macos/.macos.sh


echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo '1. Make sure dropbox is running first. If you have not backed up via Mackup yet, then run `mackup backup` to symlink preferences for a wide collection of apps to your dropbox. If you already had a backup via mackup run `mackup restore` You'\''ll find more info on Mackup here: https://github.com/lra/mackup.'
echo '2. Make a ~/.dotfiles-custom/shell/.aliases for your personal commands'

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'