#!/bin/bash

########################################
# CONFIG — Change theme names here
########################################
LIGHT_THEME="Classic"
DARK_THEME="Kon"

MARTA_APP="Marta"
MARTA_CONFIG="$HOME/Library/Application Support/org.yanex.marta/conf.marco"

########################################
# FUNCTION: Resolve symlinks (Mackup-safe)
########################################
resolve_path() {
  local path="$1"
  while [ -L "$path" ]; do
    local target
    target="$(readlink "$path")"
    [[ "$target" != /* ]] && target="$(dirname "$path")/$target"
    path="$target"
  done
  echo "$path"
}

REAL_CONFIG="$(resolve_path "$MARTA_CONFIG")"

# Exit if not a file
[[ -f "$REAL_CONFIG" ]] || exit 0

########################################
# Detect system appearance
########################################
if defaults read -g AppleInterfaceStyle &>/dev/null; then
  TARGET_THEME="$DARK_THEME"
else
  TARGET_THEME="$LIGHT_THEME"
fi

########################################
# Exit if theme already matches
########################################
CURRENT_THEME=$(grep -o 'theme "[^"]*"' "$REAL_CONFIG" | cut -d'"' -f2)
if [[ "$CURRENT_THEME" == "$TARGET_THEME" ]]; then
  exit 0
fi

########################################
# Update config with new theme
########################################
/usr/bin/sed -i '' "s/theme \"[^\"]*\"/theme \"$TARGET_THEME\"/" "$REAL_CONFIG"

########################################
# Restart Marta if running
########################################
if pgrep -x "$MARTA_APP" >/dev/null; then
  osascript -e "tell application \"$MARTA_APP\" to quit"
  sleep 1
  open -a "$MARTA_APP"
fi
