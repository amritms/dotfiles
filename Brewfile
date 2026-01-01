# Taps
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'

# Binaries
brew 'awscli'
brew 'bash' # Latest Bash version
brew "bat" # Output highlighting (better `cat`)
brew "btop" # Performance and resource monitoring tool (better `top`)
brew 'coreutils' # Those that come with macOS are outdated
brew 'ffmpeg'
brew 'fzf'
brew 'gh' # GitHub CLI: interact with GitHub PRs, issues, repos
brew 'git' # Version control
brew "git-delta" # Diff pager for `git` and `grep` output (better `diff`)
brew 'grep'
brew 'httpie'
#brew 'hub' # github
brew "jesseduffield/lazydocker/lazydocker" # Full Docker management app
brew "lazyvim/lazyvim/lazyvim" # Full-featured Neovim distribution
brew 'mackup'
brew 'mas' # Mac App Store manager
brew "mpv" # Media player
brew "neovim"
brew 'pkg-config' # https://github.com/driesvints/dotfiles/issues/20
#brew 'pug' # for maintaining multiple local git repo
brew "ripgrep" # Searching within files (better `grep`)
brew "tlrc" # Community-maintained docs (better `man`)
brew 'trash' # Manage the Trash bin
brew "trash-cli", link: true # Record and restore removed files (better `rm`)
brew 'tree' # List directories in a tree structure
#brew 'zlib' # Needed for Memcached
brew "zsh" # A shell of choice
brew "zsh-autosuggestions" # Fish-like autosuggestions for Zsh
brew "zsh-syntax-highlighting" # Fish-like syntax highlighting for Zsh
brew "oh-my-posh" # Customizable prompt for any shell

# Development
brew 'composer'
brew 'imagemagick'
brew 'neovim'
brew 'node'
brew 'npm'
brew 'php'
brew 'php@8.2'
brew 'php@8.3'
brew 'sqlite'
brew 'yarn'

# GUI Apps
cask 'alt-tab' # windows like preview for tab switcher
cask 'bitwarden'
cask "bruno" # Local-first API client
cask "dash" # API documentation reader
cask 'docker' # Docker
cask 'filezilla' # free FTP client
cask 'firefox@developer-edition' # Firefox Developer Edition
cask "ghostty" # Better terminal emulator
cask 'google-backup-and-sync' # Google Backup and Sync
cask 'google-chrome' # Google Chrome
cask 'herd' # Herd
cask 'imageoptim' # Image Optimizer
cask 'insomnia' # Insomnia
cask 'iterm2' # iTerm2
cask "itsycal" # Tiny popup calendar in a menu bar
cask 'jordanbaird-ice' # free alternative to bartender
cask 'keka'
cask "marta" # File manager
cask "notion" # Collaborative note taking app
cask "obsidian" # Main note taking app
cask "orbstack" # Running containerized applications. Ships `docker-compose` as well
cask "pearcleaner" # Clean up macOS from junk and apps leftovers
cask 'phpstorm'
cask 'qbittorrent'
cask "raycast" # All-in-one app / tasks launcher
cask 'sequel-ace'
cask "slack" # Messaging social platform
cask 'sublime-text'
cask 'surfshark'
cask "tableplus" # Database management system
cask "telegram" # Messenger
cask 'there'
cask 'vlc'
cask "visual-studio-code" # Main code editor
cask "whatsapp" # Messenger

# Mac App Store
mas 'Amphetamine', id: 937984704
#mas 'Byword', id: 420212497
mas 'Giphy Capture', id: 668208984
#mas 'Irvue Wallpaper changer', id: 1039633667
#mas 'Keynote', id: 409183694
#mas 'Numbers', id: 409203825
#mas 'RescueTime', id: 966285407
#mas 'Spark', id: 1176895641


# Remove outdated versions of formulae and casks from the cellar
# Besides, this will run `brew autoremove` to remove all the hanging, no longer needed packages
brew cleanup --prune=all