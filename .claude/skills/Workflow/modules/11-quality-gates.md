# MODULE 11 — AUTOMATED QUALITY GATES
# Loaded for: BUILD tasks with UI components
# Runs BEFORE agent-based review chain (Phase 4) — cheap checks first

---

## Purpose

Automated pass/fail checks that run before expensive agent reviews. If these fail, fix before wasting tokens on code-reviewer/design-reviewer agents.

---

## 1. GATE ORDER (cheapest → most expensive)

```
1. BUILD CHECK           → npm run build (0 errors)
2. SPEC COMPLIANCE       → did we build what was asked? (moved from last)
3. TERMINAL VERIFICATION → fresh terminal proof that it works
4. REGRESSION TESTS      → npm test (0 new failures)
5. TDD ENFORCER          → new code has corresponding tests
6. DEPENDENCY AUDIT      → npm audit (0 high/critical vulns)
7. SMOKE TEST            → dev server starts, homepage loads
8. ACCESSIBILITY         → axe-core scan (0 critical)
9. PERFORMANCE           → Lighthouse/CWV check
10. IMAGE VERIFICATION    → all URLs return HTTP 200
```

**Then:** Agent-based Phase 4 review chain (code + design + security)

---

## 2. BUILD CHECK

```bash
npm run build 2>&1 | tail -5
```
**Pass:** Exit code 0
**Fail:** Fix all build errors. Do NOT proceed until clean.

---

## 3. SPEC COMPLIANCE (formerly KAREN)

Dispatch `karen` agent (or run inline):

```
"Review what was asked vs what was built. Check:
 - Every requirement mentioned by user: implemented?
 - Branded footer: present? (if Landingpage/Hemsida skill active)
 - Content separation: all text in /content/? (if required by skill)
 - Functions work end-to-end, not just exist?
 Report: COMPLETE / INCOMPLETE with specific gaps."
```

**Pass:** COMPLETE
**Fail:** Fix gaps before proceeding to remaining gates

**Why this runs second (not last):** If the implementation doesn't match the spec, running 8 more gates on wrong code is wasted. Catch spec drift early.

---

## 4. TERMINAL VERIFICATION

Fresh terminal output proving the system actually works. No hedging, no "should work", no "I believe it passes".

```bash
# Run build + tests and capture ACTUAL output
echo "=== TERMINAL VERIFICATION ==="
npm run build 2>&1 | tail -10
echo "---"
npm test 2>&1 | tail -15
echo "---"
echo "Exit codes: build=$? test=$?"
```

**Pass:** Both exit code 0 AND output shows actual pass messages (not just "no errors found")
**Fail:** If either command fails, the task is NOT complete. Fix before proceeding.

**Rules:**
- Output must be from THIS session, not cached or assumed
- Never say "tests pass" without running them — SHOW the output
- If no test suite exists, terminal verification = build clean + manual smoke test description
- For UI tasks: also verify dev server starts without errors (`npm run dev` for 5 seconds)

**Hedging language that FAILS this gate:**
- "The tests should pass"
- "I believe the build is clean"
- "Based on the code, this should work"
- "The implementation looks correct"

**Passing language:**
- "Build passed: `✓ Compiled successfully`"
- "Tests: 24 passed, 0 failed (terminal output above)"
- "Dev server started on localhost:3000, no errors in console"

---

## 5. REGRESSION TESTS

```bash
npm test 2>&1 | tail -10
```
**Pass:** 0 new failures (existing failures documented)
**Fail:** Fix regressions before proceeding.
**Skip if:** No test suite exists (log as tech debt)

---

## 6. TDD ENFORCER

For any NEW functionality (not bug fixes to existing code):

```bash
# Check: are there tests for the new code?
NEW_FILES=$(git diff --name-only --diff-filter=A | grep -E '\.(ts|tsx|js|jsx)$' | grep -v '\.test\.' | grep -v '\.spec\.')
for f in $NEW_FILES; do
  TEST_FILE=$(echo "$f" | sed 's/\.\(ts\|tsx\|js\|jsx\)$/.test.\1/')
  [ ! -f "$TEST_FILE" ] && echo "MISSING TEST: $f"
done
```

**Pass:** Every new source file has a corresponding test file OR is a pure UI component (no logic)
**Fail:** Flag missing tests. Do NOT block — but log as tech debt and warn user.
**Skip if:** Task is pure refactor with no new functionality, or pure CSS/styling changes

**Enforcement level:**
| Context | Action on missing tests |
|---|---|
| Autonomous mode (Module 14) | BLOCK — cannot proceed without tests |
| Full AutoLearning | WARN — flag but continue, add to tech debt |
| AutoLearning Lite | WARN — flag but continue |
| Solo | SKIP — too small to enforce |

---

## 7. DEPENDENCY AUDIT

```bash
npm audit --audit-level=high 2>&1 | tail -5
```
**Pass:** 0 high or critical vulnerabilities
**Fail:** Fix or document known vulnerabilities before proceeding
**Skip if:** No package.json exists, or project uses non-npm package manager (check for yarn.lock, pnpm-lock.yaml)

**Action on fail:** Run `npm audit fix` for auto-fixable issues. For manual fixes, log as tech debt with CVE numbers.

---

## 8. SMOKE TEST (UI tasks only)

```bash
# Start dev server in background
npm run dev &
DEV_PID=$!
sleep 3

# Verify homepage returns HTML
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000 2>/dev/null)
if [ "$STATUS" = "200" ]; then
  echo "SMOKE PASS: Homepage returns 200"
else
  echo "SMOKE FAIL: Homepage returns $STATUS"
fi

# Cleanup
kill $DEV_PID 2>/dev/null
```
**Pass:** Homepage returns HTTP 200 with HTML content
**Fail:** Fix runtime errors (missing env vars, import errors, etc.)
**Skip if:** Task has no UI output, or project has no dev server

---

## 9. ACCESSIBILITY (UI tasks only)

```bash
npx axe-core-cli [url] 2>/dev/null || echo "axe not available"
```
**Pass:** 0 critical, 0 serious violations
**Fail:** Fix critical/serious a11y issues
**Fallback:** If axe-core unavailable, manually check: contrast 4.5:1, keyboard nav, alt-texts, ARIA
**Skip if:** Task has no UI output

---

## 10. PERFORMANCE (UI tasks only)

Check against thresholds:
| Metric | Pass | Fail |
|--------|------|------|
| LCP | < 2.5s | ≥ 2.5s |
| CLS | < 0.1 | ≥ 0.1 |
| Bundle size | No single chunk > 200KB | Any chunk > 200KB |

**Method:** `npx next build` output shows chunk sizes. For LCP/CLS, check that `next/image` is used, no layout shift from unsized media.
**Skip if:** Task has no UI output

---

## 11. IMAGE VERIFICATION (UI tasks only)

```bash
grep -ro 'https://images.unsplash.com/[^"]*' content/ components/ | while read url; do
  code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$url")
  [ "$code" != "200" ] && echo "BROKEN: $url"
done
```
**Pass:** All image URLs return 200
**Fail:** Replace broken images before proceeding
**Skip if:** No external images used

---

## 12. FAILURE PROTOCOL

| Gates failed | Action |
|---|---|
| 0 | Proceed to Phase 4 agent review |
| 1-2 | Fix, re-run ONLY failed gates |
| 3+ | Stop. Return to Phase 3. Something is fundamentally wrong. |
| Same gate fails 3x | Escalate to user with specific error |
| TDD warns only | Continue but log tech debt |
| Terminal verification fails | HARD BLOCK — fix before anything else |

---

## 13. TOKEN SAVINGS

These automated gates cost ~0 tokens (bash commands). Running them BEFORE agent reviews prevents wasting 3 agent spawns (~15K tokens) on code that doesn't even build.

**Expected savings:** 30-50% of Phase 4 token cost on tasks with issues.

**Terminal verification is the strongest gate** — it's the only one that proves the code actually works, not just that it compiles.

---

## 14. EVIDENCE-GATED FINDINGS

Any agent reporting an issue in Phase 4 MUST provide concrete evidence. No evidence = finding discarded.

**Required for every finding:**
| Field | Required | Example |
|-------|----------|---------|
| File path | YES | `src/components/Auth.tsx` |
| Line number/range | YES | `lines 42-58` |
| Code snippet | YES | The actual problematic code |
| Severity | YES | CRITICAL / HIGH / MEDIUM / LOW |
| Explanation | YES | Why this is a problem |

**Enforcement:**
- Include this instruction in every review agent prompt:
  `"Every finding MUST include file:line and a code snippet. Findings without evidence are INVALID and will be discarded."`
- Main agent filters findings: no file:line citation → removed from review output
- This prevents hallucinated security vulnerabilities and phantom quality issues

**Structured finding format (required):**
```json
{
  "id": "F1",
  "severity": "CRITICAL|HIGH|MEDIUM|LOW",
  "file": "src/auth.tsx",
  "line_start": 42,
  "line_end": 58,
  "snippet": "const token = userInput",
  "explanation": "Unsanitized user input used as auth token",
  "suggested_fix": "Use sanitizeInput(userInput) before assignment",
  "category": "security|quality|performance|accessibility"
}
```
Findings not in this format are DISCARDED. Main agent filters before synthesis.

**Filtered findings audit:**
Log discarded findings to tasks/filtered-findings.md:
```
FILTERED: "[finding text]" — Reason: No file:line citation
```
This prevents silent loss of potentially valid findings.

**Why this matters:** LLMs can hallucinate plausible-sounding issues. Requiring code evidence forces the agent to actually READ the code, not guess about it. In testing, evidence-gating reduced false-positive findings by ~80%.

---

## 15. BEHAVIORAL BLOCKING HOOKS

Upgrade from advisory warnings to hard blocks for dangerous patterns.

| Pattern | Detection | Action |
|---------|-----------|--------|
| Implementation before failing test | New .ts/.tsx file without .test. counterpart | BLOCK in Full AutoLearning, WARN in Solo/Lite |
| Edit .env or auth files | File path matches `*.env*` or `*auth*` or `*secret*` | BLOCK — require explicit security flag |
| Force-push to main/master | `git push --force` to main or master | BLOCK always |
| Delete production files | `rm -rf` on src/ or app/ directories | BLOCK always |

**Hook implementation:** `~/.claude/hooks/tdd-gate.sh`

**Block vs Warn:**
- **BLOCK** (hook exits with code 2): Claude Code prevents the tool call entirely. The action does not happen.
- **WARN** (hook exits with code 0 + stderr message): Claude sees the warning but can proceed. Used for Solo mode where TDD enforcement would be too strict.

**The key insight:** CLAUDE.md instructions can be ignored under pressure. Hooks CANNOT be bypassed — they are deterministic enforcement at the tool-call level. This is the difference between "please follow TDD" and "you literally cannot write code without a test."

**Anti-pattern:** Never set all patterns to BLOCK — Solo mode needs to move fast. Only BLOCK patterns that are genuinely dangerous (force-push, delete production, edit secrets).

---

## 16. STATEFUL BROWSER QA (UI tasks with auth — optional but recommended)

For apps behind authentication, the curl-based smoke test (Gate 7) is insufficient. This gate uses Playwright MCP for authenticated browser testing.

**When to run:**
- Task modifies UI components behind auth
- Task changes API routes that auth-gated pages depend on
- Task touches WhatsApp, payment, or user-facing flows

**Protocol:**
```
1. Start dev server: npm run dev &
2. Launch Playwright MCP browser session
3. Navigate to login page → authenticate with test credentials
4. Execute 3-5 critical user flows:
   - Navigate to dashboard (verify it loads)
   - Click primary CTA (verify it works)
   - Submit a form (verify validation + submission)
   - Check data displays correctly (verify API integration)
5. Capture any console errors or network failures
6. Kill dev server
```

**Pass:** All flows complete without console errors or network failures
**Fail:** Fix broken flows before proceeding to agent review
**Skip if:** Task has no UI, no auth, or is backend-only

**Why this exists:** gstack's /qa skill proved that curl-based smoke tests miss ~60% of issues that appear behind authentication. A real browser session with login state catches what automated gates cannot.

**Cost:** ~30 seconds per run. Uses Playwright MCP (already configured in settings.json).
