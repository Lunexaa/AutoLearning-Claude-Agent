# MODULE 01 — PLANNING
# Loaded for: BUILD, BUG, URGENT tasks

---

## 1. CONFIDENCE CHECK (mandatory before any major action)

Score confidence 0–100% before executing:

| Score | Action |
|---|---|
| 90–100% | Proceed |
| 70–89% | Flag uncertain parts in plan. Proceed with extra verification. |
| 50–69% | Research first (docs, web, source code). Re-score before starting. |
| <50% | Stop. Do not guess. Research or escalate. |

**Measure confidence on:**
- Do I understand the full scope?
- Do I know how the existing code in this area works?
- Do I know the correct API/library/framework behavior?
- Am I certain about this project's stack rules?

**If still blocked after research → ESCALATE (business decision only):**
```
BLOCKED: [one sentence — what you need]
Options: [A] [B]
Recommendation: [your pick + why in 1 line]
```
Business decisions = escalate (scope priority, budget, product tradeoff).
Technical decisions = research, never ask.

---

## 2. REFERENCE-FIRST PROTOCOL (mandatory before writing any new code)

Before implementing, research proven patterns:
1. Search for existing implementations (GitHub, docs, library source)
2. Check if a skill in `~/.claude/ROADMAP.md` covers this domain
3. Identify the most battle-tested approach (not the most clever)
4. Only then write code

**Why:** Months of production validation > your first instinct. This is non-negotiable.

---

## 3. PLAN

### Enter PLAN mode if:
Task > 3 steps · Architectural decision required · Multiple files · Requirements unclear · Non-trivial bug

### Plan must include:
- Problem statement (what exactly is broken/missing — root cause, not symptom)
- Step-by-step tasks → write to `tasks/todo.md` with MoSCoW labels
- Definition of Done (explicit, measurable success criteria)
- Dependency map (below)
- Verification strategy

### Dependency map:
```
Task A → requires Task B (do B first)
Task C → parallel with Task D (no dependency — batch in one message)
Task E → blocked by external: [describe]
```

### Rules:
- No implementation before plan is verified
- Simplicity first — smallest solution satisfying DoD
- Security/auth/payment touched → escalate to Full verification tier

### MoSCoW labels for `tasks/todo.md`:
`[M]` Must (blocks delivery) · `[S]` Should (high value) · `[C]` Could (defer) · `[W]` Won't (out of scope)

---

## 4. PRE-MORTEM (mandatory for tasks > 3 steps)

Prospective hindsight increases failure identification by 30%. Not optional.

**Answer before executing:**

```
PRE-MORTEM:
- Failure mode 1 (HIGH): [what] → [detection signal] → [mitigation]
- Failure mode 2 (MED):  [what] → [detection signal] → [mitigation]
- Failure mode 3 (LOW):  [what] → [detection signal] → [mitigation]
- Hidden dependency: [assumption not yet verified]
- Rollback: [if catastrophic — how to recover]
```

HIGH-probability failure mode found → update plan to address it before proceeding.

---

## 5. VERIFY PLAN

> Runs after PRE-MORTEM, before EXECUTE. Validates the **plan logic** — not the output.
> Adversarial output review (Section 2 in 03-verification) runs after EXECUTE.

### Three mandatory integrity questions:
1. "What is the weakest assumption in this plan?" → If unverified → research it now.
2. "What does this plan not address that it should?" → Add it or mark explicitly out-of-scope.
3. "If the first step fails completely, can we recover?" → If no → add rollback path.

Gap found → fix the plan. Do not rationalize gaps away.

**Output:** Verified plan with all gaps closed. Only then proceed to EXECUTE.

---

## 6. BUG PATH (enter here for BUG intent)

1. Read the full error message — don't skim
2. Reproduce the issue (confirm you can trigger it)
3. Check tool/env failure first: env vars, ports, secrets, network — most prod failures are here
4. Trace to root cause (not symptom)
5. Apply fix
6. Verify with exact scenario that caused the bug
7. Check for regressions

**Persists after 1-2 fix attempts:** Stop guessing. Read library source code. Trace exact error path. Understand WHY before changing anything.

Root cause vs. symptom example:
- Symptom: "PDF doesn't generate"
- Root cause: "`chromium-min` extracts .tar at runtime — Vercel's webpack mangles tar-fs"
- Fix the root cause. Always.
