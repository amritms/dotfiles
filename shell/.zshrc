export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/opt/homebrew/bin:$PATH"
#export PATH=$HOME/development/flutter/bin:$PATH
export JAVA_HOME="$(brew --prefix openjdk@17)"

# for homebrew auto completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)" && command chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

# Oh-my-posh initialization
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/omp-zen.json)"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#zinit ice depty=1; zinit light romkatv/powerlvel10k


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit  light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light jessarcher/zsh-artisan
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# up or down arrow to go through suggestions
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


# Completion styling
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS} ma=0\;33" # colorize cmp menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Load the shell dotfiles, and then some:
# * ~/.dotfiles-custom can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/shell/.{exports,aliases,functions,path}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


export PATH="/usr/local/opt/zip/bin:$PATH"

# Shell integrations
eval "$(fzf --zsh)" # fuzzy search on z-shell



# Herd injected PHP binary.
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR

# Herd injected NVM configuration
export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/74/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/81/"

# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/80/"

# Herd injected PHP binary.
export PATH="/Users/driesvints/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP binary.
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP binary.
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

# Created by `pipx` on 2024-10-23 23:50:09
export PATH="$PATH:$HOME/.local/bin"

alias cursorpersonal='/Applications/Cursor_Personal.app/Contents/MacOS/Cursor --user-data-dir=$HOME/.cursor-profile-2 --extensions-dir=$HOME/.cursor-profile-2/extensions'


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
