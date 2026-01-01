# --- 1. Environment & Path ---
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.antigravity/antigravity/bin:$PATH:$HOME/.composer/vendor/bin:/opt/homebrew/bin"
export JAVA_HOME="$(brew --prefix openjdk@17)"
HIST_STAMPS="%F %T"

# Homebrew auto completion path
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# --- 2. Sourcing Dotfiles (Exports, Aliases) ---
for file in ~/.dotfiles/zsh/.{exports,aliases,functions,path}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
for file in ~/.dotfiles-custom/zsh/.{exports,aliases,functions,zshrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# --- 3. Zsh Styles (Completion Config) ---
# MUST be before compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS} ma=0\;33"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# --- 4. Zinit & Plugins ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)" && command chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# a popular alternative to oh-my-posh
# zinit ice depty=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
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

# --- 5. Completion Initialization ---
autoload -U compinit && compinit
zinit cdreplay -q

# --- 6. Prompt (Oh-My-Posh) ---
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/omp-zen.json)"

# --- 7. Keybindings ---
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# --- 8. Late Loading / Integrations ---
export PATH="/usr/local/opt/zip/bin:$PATH"
eval "$(fzf --zsh)"

# Herd / NVM
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR
export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

export HERD_PHP_74_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/74/"
export HERD_PHP_83_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_82_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_81_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/81/"
export HERD_PHP_80_INI_SCAN_DIR="/Users/driesvints/Library/Application Support/Herd/config/php/80/"

export PATH="/Users/driesvints/Library/Application Support/Herd/bin/":$PATH
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

export PATH="$PATH:$HOME/.local/bin"

alias cursorpersonal='/Applications/Cursor_Personal.app/Contents/MacOS/Cursor --user-data-dir=$HOME/.cursor-profile-2 --extensions-dir=$HOME/.cursor-profile-2/extensions'

export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
