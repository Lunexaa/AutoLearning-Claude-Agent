# MODULE 11 — AUTOMATED QUALITY GATES
# Loaded for: BUILD tasks with UI components
# Runs BEFORE agent-based review chain (Phase 4) — cheap checks first

---

## Purpose

Automated pass/fail checks that run before expensive agent reviews. If these fail, fix before wasting tokens on code-reviewer/design-reviewer agents.

---

## 1. GATE ORDER (cheapest → most expensive)

```
1. BUILD CHECK        → npm run build (0 errors)
2. REGRESSION TESTS   → npm test (0 new failures)
3. ACCESSIBILITY      → axe-core scan (0 critical)
4. PERFORMANCE        → Lighthouse/CWV check
5. IMAGE VERIFICATION → all URLs return HTTP 200
6. KAREN VALIDATOR    → completion check (did we do everything asked?)
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

## 3. REGRESSION TESTS

```bash
npm test 2>&1 | tail -10
```
**Pass:** 0 new failures (existing failures documented)
**Fail:** Fix regressions before proceeding.
**Skip if:** No test suite exists (log as tech debt)

---

## 4. ACCESSIBILITY (UI tasks only)

```bash
npx axe-core-cli [url] 2>/dev/null || echo "axe not available"
```
**Pass:** 0 critical, 0 serious violations
**Fail:** Fix critical/serious a11y issues
**Fallback:** If axe-core unavailable, manually check: contrast 4.5:1, keyboard nav, alt-texts, ARIA
**Skip if:** Task has no UI output

---

## 5. PERFORMANCE (UI tasks only)

Check against thresholds:
| Metric | Pass | Fail |
|--------|------|------|
| LCP | < 2.5s | ≥ 2.5s |
| CLS | < 0.1 | ≥ 0.1 |
| Bundle size | No single chunk > 200KB | Any chunk > 200KB |

**Method:** `npx next build` output shows chunk sizes. For LCP/CLS, check that `next/image` is used, no layout shift from unsized media.
**Skip if:** Task has no UI output

---

## 6. IMAGE VERIFICATION (UI tasks only)

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

## 7. KAREN VALIDATOR (completion check)

Dispatch `karen` agent (or run inline):

```
"Review what was asked vs what was built. Check:
 - Every requirement mentioned by user: implemented?
 - Your Company footer: present? (if Landingpage/Hemsida skill active)
 - Content separation: all text in /content/? (if required by skill)
 - Functions work end-to-end, not just exist?
 Report: COMPLETE / INCOMPLETE with specific gaps."
```

**Pass:** COMPLETE
**Fail:** Fix gaps before Phase 4 agent review

---

## 8. FAILURE PROTOCOL

| Gates failed | Action |
|---|---|
| 0 | Proceed to Phase 4 agent review |
| 1-2 | Fix, re-run ONLY failed gates |
| 3+ | Stop. Return to Phase 3. Something is fundamentally wrong. |
| Same gate fails 3x | Escalate to user with specific error |

---

## 9. TOKEN SAVINGS

These automated gates cost ~0 tokens (bash commands). Running them BEFORE agent reviews prevents wasting 3 agent spawns (~15K tokens) on code that doesn't even build.

**Expected savings:** 30-50% of Phase 4 token cost on tasks with issues.
