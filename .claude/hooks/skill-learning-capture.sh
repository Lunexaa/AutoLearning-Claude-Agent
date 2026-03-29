#!/usr/bin/env bash
# skill-learning-capture.sh — Auto-updates memory and skills after changes
# Triggered by: PostToolUse hook on Edit/Write
# Tracks freshness per domain + detects bug fix patterns
# Lightweight — exits fast if nothing relevant

set -euo pipefail

MEMORY_DIR="$HOME/.claude/Memory"
TODAY=$(date +%Y-%m-%d)

# --- FRESHNESS TRACKING (no file path needed) ---
# Track which domain was last worked on per project

PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
PROJECT_NAME=$(basename "$PROJECT_ROOT")
TRACKER_FILE="${MEMORY_DIR}/.freshness-tracker"

# Create tracker if missing
if [ ! -f "$TRACKER_FILE" ]; then
  echo "# Freshness Tracker — auto-updated by skill-learning-capture.sh" > "$TRACKER_FILE"
  echo "# Format: project|domain|last_worked|last_researched" >> "$TRACKER_FILE"
fi

# Detect domain from recent git changes (instead of relying on $CLAUDE_FILE_PATH)
RECENT_FILES=$(git diff --name-only HEAD 2>/dev/null | head -10 || echo "")
DOMAIN="general"
if echo "$RECENT_FILES" | grep -qi "whatsapp\|webhook\|meta" 2>/dev/null; then
  DOMAIN="whatsapp"
elif echo "$RECENT_FILES" | grep -qi "pipeline\|deal\|crm\|lead" 2>/dev/null; then
  DOMAIN="crm"
elif echo "$RECENT_FILES" | grep -qi "supabase\|prisma\|schema\|migration" 2>/dev/null; then
  DOMAIN="database"
elif echo "$RECENT_FILES" | grep -qi "component\|page\|layout\|ui" 2>/dev/null; then
  DOMAIN="frontend"
elif echo "$RECENT_FILES" | grep -qi "api\|route\|action" 2>/dev/null; then
  DOMAIN="backend"
elif echo "$RECENT_FILES" | grep -qi "test\|spec" 2>/dev/null; then
  DOMAIN="testing"
fi

# Update or add tracker entry (upsert) — using # as sed delimiter to avoid pipe conflicts
if grep -q "^${PROJECT_NAME}|${DOMAIN}|" "$TRACKER_FILE" 2>/dev/null; then
  LAST_RESEARCHED=$(grep "^${PROJECT_NAME}|${DOMAIN}|" "$TRACKER_FILE" | head -1 | cut -d'|' -f4)
  sed -i '' "s#^${PROJECT_NAME}|${DOMAIN}|.*#${PROJECT_NAME}|${DOMAIN}|${TODAY}|${LAST_RESEARCHED}#" "$TRACKER_FILE" 2>/dev/null || true
else
  echo "${PROJECT_NAME}|${DOMAIN}|${TODAY}|never" >> "$TRACKER_FILE"
fi

# --- SKILL LEARNING: detect bug fix patterns ---
# Only log if there's a recent commit with "fix" in it

RECENT_FIX=$(git log -1 --pretty=format:"%s" --since="5 minutes ago" 2>/dev/null || echo "")
if echo "$RECENT_FIX" | grep -qi "fix\|bug\|patch\|hotfix" 2>/dev/null; then
  CHANGED_FILES=$(git diff --name-only HEAD~1..HEAD 2>/dev/null | head -5 || echo "")

  if [ -n "$CHANGED_FILES" ]; then
    SESSION_NOTES="${MEMORY_DIR}/session-notes.md"

    # Only append if not already logged (deduplication)
    if [ -f "$SESSION_NOTES" ] && ! grep -qF "$RECENT_FIX" "$SESSION_NOTES" 2>/dev/null; then
      cat >> "$SESSION_NOTES" << EOF

## [${TODAY}] — Bug fix detected
- **Type:** discovery
- **Detail:** ${RECENT_FIX}
- **Files:** ${CHANGED_FILES}
- **Domain:** ${DOMAIN}
- **Scope:** project
EOF
    fi
  fi
fi

exit 0
