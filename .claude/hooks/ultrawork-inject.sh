#!/bin/bash
# Ultrawork Hook — detects "ultrawork" keyword and signals parallel execution mode
# MUST always exit 0 — never block prompt submission

# The hook itself just signals — the actual parallel execution is handled by AutoLearning
# when it reads the injected context in the prompt

# Check stdin or first argument for the ultrawork keyword
INPUT="${1:-$(cat 2>/dev/null || echo '')}"

if echo "$INPUT" | grep -qi "ultrawork"; then
  echo "[AutoLearning] Ultrawork mode detected — activating full parallel agent machinery" >&2
fi

exit 0
