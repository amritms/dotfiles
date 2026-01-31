
# Top of .zshrc
#DISABLE_AUTO_UPDATE="true"
#DISABLE_MAGIC_FUNCTIONS="true"
#DISABLE_COMPFIX="true"


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

# --- 2. Sourcing Dotfiles (Exports, Path) ---
# We load exports and path early to set up the environment.
for file in ~/.dotfiles/zsh/.{exports,path}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
for file in ~/.dotfiles-custom/zsh/.{exports,zshrc}; do
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
# zsh-completions must be loaded before compinit
zinit light zsh-users/zsh-completions

# --- 5. Completion Initialization ---
# compinit must be called after adding completions to fpath but before loading fzf-tab
autoload -Uz compinit && compinit

# Load other plugins
zinit light zsh-users/zsh-autosuggestions
zinit light jessarcher/zsh-artisan

# fzf-tab must be loaded AFTER compinit
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
#zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# Syntax highlighting should be loaded last
zinit light zdharma-continuum/fast-syntax-highlighting

# --- 5b. Sourcing Aliases & Functions (Post-Plugin) ---
# We load aliases and functions AFTER plugins so user definitions override plugin defaults.
for file in ~/.dotfiles/zsh/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
for file in ~/.dotfiles-custom/zsh/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

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

# Option + Left/Right (MacOS Standard & iTerm2)
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word


# This will be our new default `ctrl+w` command
my-backward-delete-word() {
    # Copy the global WORDCHARS variable to a local variable. That way any
    # modifications are scoped to this function only
    local WORDCHARS=$WORDCHARS
    # Removes all listed characters in one go: : / . ; ? = % -
    WORDCHARS="${WORDCHARS//[:\/.\;?=%-]}"
    # Use bash string manipulation to remove `:` so our delete will stop at it
#    WORDCHARS="${WORDCHARS//:}"
    # Use bash string manipulation to remove `/` so our delete will stop at it
#    WORDCHARS="${WORDCHARS//\/}"
    # Use bash string manipulation to remove `.` so our delete will stop at it
#    WORDCHARS="${WORDCHARS//.}"
#    WORDCHARS="${WORDCHARS//-}"
#    WORDCHARS="${WORDCHARS//;}"
    # zle <widget-name> will run an existing widget.
    zle .backward-delete-word
}
# `zle -N` will create a new widget that we can use on the command line
zle -N my-backward-delete-word
# bind this new widget to `ctrl+w`
bindkey '^W' my-backward-delete-word

# This will be our `ctrl+alt+w` command
my-backward-delete-whole-word() {
    # Copy the global WORDCHARS variable to a local variable. That way any
    # modifications are scoped to this function only
    local WORDCHARS=$WORDCHARS
    # Use bash string manipulation to add `:` to WORDCHARS if it's not present
    # already.
    [[ ! $WORDCHARS == *":"* ]] && WORDCHARS="$WORDCHARS"":"
    # zle <widget-name> will run that widget.
    zle backward-delete-word
}
# `zle -N` will create a new widget that we can use on the command line
zle -N my-backward-delete-whole-word
# bind this new widget to `ctrl+alt+w`
bindkey '^[^w' my-backward-delete-whole-word



# --- 8. Late Loading / Integrations ---
export PATH="/usr/local/opt/zip/bin:$PATH"
eval "$(fzf --zsh)"

# Herd / NVM
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR
export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"


# NVM Loading
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP configuration.
# export HERD_PHP_74_INI_SCAN_DIR="/Users/amritshrestha/Library/Application Support/Herd/config/php/74/"
# export HERD_PHP_80_INI_SCAN_DIR="/Users/amritshrestha/Library/Application Support/Herd/config/php/80/"
# export HERD_PHP_81_INI_SCAN_DIR="/Users/amritshrestha/Library/Application Support/Herd/config/php/81/"
export HERD_PHP_82_INI_SCAN_DIR="/Users/amritshrestha/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_83_INI_SCAN_DIR="/Users/amritshrestha/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"

export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

export PATH="$PATH:$HOME/.local/bin"