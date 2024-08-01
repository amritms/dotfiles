#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Projects
ZSH="$HOME/.oh-my-zsh"

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions
git clone https://github.com/jessarcher/zsh-artisan.git $ZSH/custom/plugins/artisan

# Personal
git clone git@github.com:amritms/docker-multi-project-mysql57.git $SITES/mysql57
git clone git@github.com:amritms/docker-multi-project-mysql8.git $SITES/mysql
git clone git@github.com:amritms/docker-postgres.git $SITES/postgres

