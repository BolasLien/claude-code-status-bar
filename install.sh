#!/usr/bin/env bash
set -e

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Claude Code Status Bar Installer ==="
echo ""

# Check jq dependency
if ! command -v jq &>/dev/null; then
  echo "❌ jq is required but not installed."
  echo ""
  echo "Install it with:"
  echo "  macOS:  brew install jq"
  echo "  Ubuntu: sudo apt install jq"
  echo "  Arch:   sudo pacman -S jq"
  exit 1
fi

# Ensure ~/.claude exists
mkdir -p "$CLAUDE_DIR"

# Copy statusline script
cp "$SCRIPT_DIR/statusline.sh" "$CLAUDE_DIR/statusline.sh"
chmod +x "$CLAUDE_DIR/statusline.sh"
echo "✅ Installed statusline.sh to $CLAUDE_DIR/statusline.sh"

# Configure settings.json
SETTINGS_FILE="$CLAUDE_DIR/settings.json"

if [ -f "$SETTINGS_FILE" ]; then
  # Check if statusLine already configured
  if echo "$(cat "$SETTINGS_FILE")" | jq -e '.statusLine' &>/dev/null; then
    echo "⚠️  statusLine already configured in settings.json, updating..."
  fi
  # Add/update statusLine config
  tmp=$(mktemp)
  jq '.statusLine = {"type": "command", "command": "~/.claude/statusline.sh"}' "$SETTINGS_FILE" > "$tmp"
  mv "$tmp" "$SETTINGS_FILE"
else
  # Create new settings.json
  echo '{"statusLine":{"type":"command","command":"~/.claude/statusline.sh"}}' | jq . > "$SETTINGS_FILE"
fi

echo "✅ Configured statusLine in $SETTINGS_FILE"
echo ""
echo "🎉 Done! Restart Claude Code to see the status bar."
