# MODULE 03 — VERIFICATION, REVIEW & QUALITY GATE
# Loaded for: BUILD, BUG, REVIEW tasks — and always before DONE

---

## 1. VERIFICATION TIERS

Choose the right depth. Under-verification ships bugs. Over-verification wastes time.

| Change type | Tier |
|---|---|
| Config, copy, style change | **Smoke** |
| Single feature, new route | **Integration** |
| Auth, payment, data mutation | **Full** |
| Security-related any change | **Security** |

### Smoke:
- Renders without error · No console errors or build warnings

### Integration:
- Feature works with real data (never mocked)
- CRUD actually persists (not just "route exists")
- UI shows correct state after each operation
- Error states handled — what happens on failure?

### Full (everything in Integration plus):
- Empty state, max values, concurrent operations
- All existing features still work
- Logs checked — no silent errors

### Security:
- Unauthenticated users cannot access protected routes
- User input validated and sanitized
- No credentials in code, logs, or API responses
- Supabase RLS enforced correctly on all affected tables

### Bug verification (always Full tier minimum):
- Root cause identified (not symptom)
- Fix proven with exact scenario that triggered the bug
- Proven the bug cannot recur with different input
- Regressions checked in related code

**Gate:** "If I didn't test this, would it break in production?" YES → keep verifying.

---

## 2. ADVERSARIAL SELF-REVIEW

> Runs after EXECUTE, before Quality Gate. Reviews the **output** — not the plan.
> Plan integrity check is in 01-planning §5 (Verify Plan) — separate phase, different purpose.

**For REVIEW tasks:** Enter here directly from intent detection.

### Review order (non-negotiable — this sequence catches the most):
1. **Correctness** — does the logic actually work? Off-by-one, wrong condition, wrong branch?
2. **Error handling** — what happens when each part fails? All exceptions covered?
3. **Performance** — unnecessary I/O, N+1 queries, blocking ops, over-fetching?
4. **Security** — auth bypass possible? Input validated? Secrets in code or logs?
5. **Maintainability** — readable in 3 months without context?

### Forced disagreement (non-negotiable):
You MUST find at least one concrete improvement. "Looks good" is never valid output.
Can't find anything after first pass → look harder. The issue is there.

### Evidence requirement:
Wrong: "Add error handling."
Right: "Add try-catch around `db.query()` on line 42 — throws on connection timeout, currently crashes silently."

### After adversarial review is clean → proceed to Quality Gate.

---

## 3. QUALITY GATE (mandatory before DONE)

Five dimensions. All must pass. No exceptions — not even for "small" tasks.

| Dimension | Pass condition |
|---|---|
| **Correctness** | Does exactly what was asked. No more, no less. |
| **Completeness** | All requirements met. No "fix later" shortcuts. |
| **Security** | No new vulnerabilities. Auth respected. No exposed secrets. |
| **Resilience** | Handles errors gracefully. No silent failures. |
| **Maintainability** | Readable. No magic numbers. No unnecessary complexity. |

Any dimension fails → fix it. Then re-run the gate.

**Final check before shipping:**
> "Would this embarrass me in a production code review?"

Yes → fix it. No → ship it.

---

## 4. DEFINITION OF DONE

DONE only when ALL of these are true:
- Works as intended, verified with real execution
- Correct verification tier applied and passed
- Quality Gate passed on all 5 dimensions
- No regressions
- `tasks/todo.md` updated — completed items checked off
- Review written (what worked · what didn't · cross-project lessons if any)

Cross-project lessons → promote to `~/.claude/Memory/feedback_*.md` per 05-memory.md rules.
