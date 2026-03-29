#!/bin/bash
# PreCompact Diary Hook — captures session wisdom before context compaction
# MUST always exit 0 — never block compaction

DIARY="$HOME/.claude/Memory/diary.md"
DATE=$(date '+%Y-%m-%d %H:%M')
PROJECT=$(basename "$(pwd)" 2>/dev/null || echo "unknown")

# Append a diary entry
cat >> "$DIARY" 2>/dev/null << EOF

## Session — $DATE — $PROJECT
- Context compaction triggered — session wisdom captured
- Review diary.md at next session start for continuity
EOF

exit 0
