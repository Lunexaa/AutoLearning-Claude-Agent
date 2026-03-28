#!/bin/bash
# JARVIS v5.0 — Installation Script
# Copies JARVIS workflow system into your Claude Code configuration

set -e

JARVIS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "╔══════════════════════════════════════════╗"
echo "║        JARVIS v5.0 — Installer           ║"
echo "╠══════════════════════════════════════════╣"
echo "║ 533 skills · 310 agents · 12 modules     ║"
echo "║ 12 commands · 7 MCP servers               ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Check if Claude Code config exists
if [ ! -d "$CLAUDE_DIR" ]; then
  echo "Creating ~/.claude/ directory..."
  mkdir -p "$CLAUDE_DIR"
fi

# Backup existing config
if [ -f "$CLAUDE_DIR/CLAUDE.md" ] || [ -d "$CLAUDE_DIR/skills/Workflow" ]; then
  BACKUP="$CLAUDE_DIR/backup-$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing config to $BACKUP/"
  mkdir -p "$BACKUP"
  [ -f "$CLAUDE_DIR/CLAUDE.md" ] && cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP/"
  [ -f "$CLAUDE_DIR/ROADMAP.md" ] && cp "$CLAUDE_DIR/ROADMAP.md" "$BACKUP/"
  [ -d "$CLAUDE_DIR/skills/Workflow" ] && cp -r "$CLAUDE_DIR/skills/Workflow" "$BACKUP/"
  echo "  Backup saved."
fi

echo ""
echo "Installing JARVIS v5.0..."

# Core files
echo "  [1/6] Core config files..."
cp "$JARVIS_DIR/.claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
cp "$JARVIS_DIR/.claude/ROADMAP.md" "$CLAUDE_DIR/ROADMAP.md"

# Don't overwrite settings.json — merge would be needed
if [ ! -f "$CLAUDE_DIR/settings.json" ]; then
  cp "$JARVIS_DIR/.claude/settings.json" "$CLAUDE_DIR/settings.json"
  echo "    settings.json created (configure MCP env vars)"
else
  echo "    settings.json exists — skipped (merge manually if needed)"
fi

# Workflow
echo "  [2/6] Workflow skill + 12 modules..."
mkdir -p "$CLAUDE_DIR/skills/Workflow/modules"
cp "$JARVIS_DIR/.claude/skills/Workflow/SKILL.md" "$CLAUDE_DIR/skills/Workflow/SKILL.md"
cp "$JARVIS_DIR/.claude/skills/Workflow/modules/"*.md "$CLAUDE_DIR/skills/Workflow/modules/"

# Agents
echo "  [3/6] 310 agents..."
mkdir -p "$CLAUDE_DIR/agents"
cp "$JARVIS_DIR/.claude/agents/"*.md "$CLAUDE_DIR/agents/"

# Commands
echo "  [4/6] 12 slash commands..."
mkdir -p "$CLAUDE_DIR/commands"
cp "$JARVIS_DIR/.claude/commands/"*.md "$CLAUDE_DIR/commands/"

# Memory structure
echo "  [5/6] 5-layer memory system..."
mkdir -p "$CLAUDE_DIR/Memory"/{L1-conversational,L2-working,L3-vault,L4-episodic,L5-self-healing}
# Only copy memory templates if they don't exist (don't overwrite user's memories)
for f in "$JARVIS_DIR/.claude/Memory/"*.md; do
  fname=$(basename "$f")
  if [ ! -f "$CLAUDE_DIR/Memory/$fname" ]; then
    cp "$f" "$CLAUDE_DIR/Memory/$fname"
  fi
done

# Verification
echo "  [6/6] Verifying installation..."
SKILLS=$(ls "$CLAUDE_DIR/skills/" 2>/dev/null | wc -l | tr -d ' ')
AGENTS=$(ls "$CLAUDE_DIR/agents/"*.md 2>/dev/null | wc -l | tr -d ' ')
COMMANDS=$(ls "$CLAUDE_DIR/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
MODULES=$(ls "$CLAUDE_DIR/skills/Workflow/modules/"*.md 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║        Installation Complete!             ║"
echo "╠══════════════════════════════════════════╣"
echo "║ Skills installed:    $SKILLS"
echo "║ Agents installed:    $AGENTS"
echo "║ Commands installed:  $COMMANDS"
echo "║ Modules installed:   $MODULES"
echo "╠══════════════════════════════════════════╣"
echo "║ Next steps:                               ║"
echo "║ 1. Edit ~/.claude/Memory/user_profile.md  ║"
echo "║ 2. Configure MCP env vars in settings.json║"
echo "║ 3. Start Claude Code — JARVIS loads auto  ║"
echo "║ 4. Run /self-test to verify               ║"
echo "╚══════════════════════════════════════════╝"
