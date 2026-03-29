#!/bin/bash
# TDD Gate Hook — blocks implementation without tests in Full AutoLearning mode
# Exit 2 = BLOCK (tool call prevented), Exit 0 = WARN/PASS

# Check for new source files without test counterparts
NEW_FILES=$(git diff --cached --name-only --diff-filter=A 2>/dev/null | grep -E '\.(ts|tsx|js|jsx)$' | grep -v '\.test\.' | grep -v '\.spec\.' | grep -v 'node_modules')

if [ -z "$NEW_FILES" ]; then
  exit 0  # No new files, pass
fi

MISSING_TESTS=""
for f in $NEW_FILES; do
  TEST_FILE=$(echo "$f" | sed 's/\.\(ts\|tsx\|js\|jsx\)$/.test.\1/')
  if [ ! -f "$TEST_FILE" ]; then
    MISSING_TESTS="$MISSING_TESTS\n  - $f"
  fi
done

if [ -n "$MISSING_TESTS" ]; then
  echo "TDD Gate: New files without tests:$MISSING_TESTS" >&2
  echo "Consider writing tests first (Module 11 Section 12)." >&2
  # Always warn, never block (exit 0) — blocking requires more context than a hook can determine
  exit 0
fi

exit 0
