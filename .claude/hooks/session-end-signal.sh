#!/usr/bin/env bash
# session-end-signal.sh — Captures routing signal after task completion
# Triggered by: PostToolUse hook on Bash calls
# Writes automated signals to routing-signals.md based on build/test outcomes
# DEDUPLICATION: Only logs once per unique commit message per day

set -euo pipefail

SIGNALS_FILE="$HOME/.claude/Memory/routing-signals.md"
TODAY=$(date +%Y-%m-%d)

# Only run if we're in a git repo with recent commits
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  exit 0
fi

# Get the latest commit message (proxy for task summary)
LATEST_COMMIT=$(git log -1 --pretty=format:"%s" 2>/dev/null || echo "unknown")

# Skip if commit is a merge, trivial, or unknown
case "$LATEST_COMMIT" in
  Merge*|Initial*|""|"unknown") exit 0 ;;
esac

# DEDUPLICATION: Skip if this exact commit was already logged today
if [ -f "$SIGNALS_FILE" ] && grep -qF "## ${TODAY} — ${LATEST_COMMIT}" "$SIGNALS_FILE" 2>/dev/null; then
  exit 0
fi

# Detect project directory name
PROJECT_DIR=$(basename "$(git rev-parse --show-toplevel 2>/dev/null || pwd)")

# Automated signal scoring (Module 09 §13)
SCORE=0
SIGNALS=""

# Check build status (only if npm is available)
if command -v npm >/dev/null 2>&1 && [ -f "package.json" ]; then
  if npm run build --if-present >/dev/null 2>&1; then
    SCORE=$((SCORE + 1))
    SIGNALS="${SIGNALS}BUILD_PASS "
  else
    SCORE=$((SCORE - 2))
    SIGNALS="${SIGNALS}BUILD_FAIL "
  fi
fi

# Check test status (only if npm is available)
if command -v npm >/dev/null 2>&1 && [ -f "package.json" ] && grep -q '"test"' package.json 2>/dev/null; then
  if npm test --if-present >/dev/null 2>&1; then
    SCORE=$((SCORE + 1))
    SIGNALS="${SIGNALS}TESTS_PASS "
  else
    SCORE=$((SCORE - 2))
    SIGNALS="${SIGNALS}TESTS_REGRESS "
  fi
fi

# Map aggregate score to 1-5 rating
if [ "$SCORE" -ge 2 ]; then
  RATING=5
elif [ "$SCORE" -ge 1 ]; then
  RATING=4
elif [ "$SCORE" -ge 0 ]; then
  RATING=3
elif [ "$SCORE" -ge -1 ]; then
  RATING=2
else
  RATING=1
fi

# Detect which skill likely matched (from project structure)
SKILL="unknown"
if [ -f "prisma/schema.prisma" ] && [ -d "src/app" ]; then
  SKILL="nextjs-crm"
elif [ -d "src/app" ] && [ -f "next.config.mjs" -o -f "next.config.js" -o -f "next.config.ts" ]; then
  SKILL="nextjs"
elif [ -f "package.json" ] && grep -q "react" package.json 2>/dev/null; then
  SKILL="react"
fi

FIRST_TRY="yes"
if [ "$SCORE" -lt 0 ]; then
  FIRST_TRY="no"
fi

# Ensure file exists
mkdir -p "$(dirname "$SIGNALS_FILE")"
touch "$SIGNALS_FILE"

# Append signal to routing-signals.md
cat >> "$SIGNALS_FILE" << EOF

## ${TODAY} — ${LATEST_COMMIT} (${PROJECT_DIR})
- **Skill:** ${SKILL} | Score: ${RATING} | First-try success: ${FIRST_TRY}
- **Automated signals:** ${SIGNALS:-"none"}
- **Aggregate score:** ${SCORE}
EOF
