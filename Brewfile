# Taps
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'

# Binaries
brew 'awscli'
brew 'bash' # Latest Bash version
brew "bat" # Output highlighting (better `cat`)
brew "betterzip" # Extract and view archives
brew "btop" # Performance and resource monitoring tool (better `top`)
brew 'composer' # PHP package manager
brew 'coreutils' # Those that come with macOS are outdated
brew 'ffmpeg' # Video converter
brew 'fzf' # Fuzzy finder
brew 'gh' # GitHub CLI: interact with GitHub PRs, issues, repos
brew 'git' # Version control
brew "git-delta" # Diff pager for `git` and `grep` output (better `diff`)
brew 'grep' # Global regular expression print
brew 'httpie' # HTTP client
brew 'imagemagick' # Tools and libraries to manipulate images in many formats
brew "jesseduffield/lazydocker/lazydocker" # Full Docker management app
brew "jless" #pretty print JSON with syntax highlighting
brew "lazyvim/lazyvim/lazyvim" # Full-featured Neovim distribution
brew 'mackup' # Backup and restore your dotfiles
brew 'mailpit' # SMTP server for testing
brew 'mas' # Mac App Store manager
brew "mpv" # Media player
brew "neovim" # Full-featured Neovim distribution
brew 'node'
brew 'npm'
brew "oh-my-posh" # Customizable prompt for any shell
brew 'php'
brew 'php@8.2'
brew 'php@8.3'
brew 'php@8.4'
brew 'pkg-config' # https://github.com/driesvints/dotfiles/issues/20
brew "ripgrep" # Searching within files (better `grep`)
brew 'sqlite' # Database
brew 'tailscale' # Easiest, most secure way to use WireGuard and 2FA
brew "tlrc" # Community-maintained docs (better `man`)
brew 'trash' # Manage the Trash bin
brew "trash-cli", link: true # Record and restore removed files (better `rm`)
brew 'tree' # List directories in a tree structure
brew 'yarn' # JavaScript package manager
brew "yt-dlp" # Download YouTube videos
brew "zsh" # A shell of choice
brew "zsh-autosuggestions" # Fish-like autosuggestions for Zsh
brew "zsh-syntax-highlighting" # Fish-like syntax highlighting for Zsh
#brew 'zlib' # Needed for Memcached


# GUI Apps
cask 'alt-tab' # windows like preview for tab switcher
cask 'balenaetcher' # Balena Etcher 
cask 'bitwarden'
cask "bruno" # Local-first API client
cask "dash" # API documentation reader
cask "datagrip" Database management system from Jetbrains (free for personal use)
cask 'docker' # Docker
cask 'filezilla' # free FTP client
cask 'firefox@developer-edition' # Firefox Developer Edition
cask 'font-fira-code'
cask 'font-fira-code-nerd-font'
cask "ghostty" # Better terminal emulator
cask 'google-backup-and-sync' # Google Backup and Sync
cask 'google-chrome' # Google Chrome
cask 'handbrake' # Video converter
cask 'headset' # Headset youtube player
cask 'herd' # Laravel and PHP development environment manager
cask 'imageoptim' # Image Optimizer
cask 'iina' # video player
cask 'insomnia' # Insomnia
cask 'iterm2' # iTerm2
cask "itsycal" # Tiny popup calendar in a menu bar
cask 'jordanbaird-ice' # free alternative to bartender
cask 'keka' # free alternative to zip
cask "marta" # File manager
cask "notion" # Collaborative note taking app
cask "obsidian" # Main note taking app
cask "orbstack" # Running containerized applications. Ships `docker-compose` as well
cask "pearcleaner" # Clean up macOS from junk and apps leftovers
cask "pgadmin4" # Database management for postgres
cask 'phpstorm'
cask 'qbittorrent'
cask "raycast" # All-in-one app / tasks launcher
cask "selfcontrol" # Block your own access to distracting websites
cask 'sequel-ace' # MySQL/MariaDB database management for macOS
cask "slack" # Messaging social platform
cask 'sublime-text'
cask 'surfshark'
cask "telegram" # Messenger
cask 'there' # Tool to display the local times of friends, teammates, cities or any time zone
cask 'vlc' # Video player
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
