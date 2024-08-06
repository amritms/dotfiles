#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Projects
ZSH_CUSTOM="$HOME/.oh-my-zsh"

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/jessarcher/zsh-artisan.git $ZSH_CUSTOM/plugins/artisan
git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab

# Personal
git clone git@github.com:amritms/docker-multi-project-mysql57.git $SITES/mysql57
git clone git@github.com:amritms/docker-multi-project-mysql8.git $SITES/mysql
git clone git@github.com:amritms/docker-postgres.git $SITES/postgres

