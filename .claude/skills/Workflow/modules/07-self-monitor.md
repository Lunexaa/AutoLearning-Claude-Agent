# MODULE 07 — SELF-MONITORING & WORKFLOW TELEMETRY
# Loaded for: session end (always), or when workflow adherence is uncertain

---

## 1. Per-Session Adherence Log

At session end, log to `tasks/workflow-log.md`:

```
DATE: [YYYY-MM-DD]
TASK TYPE: BUILD | BUG | URGENT | REVIEW | RESEARCH | NEW_PROJECT
MODULES LOADED: [list]

ADHERENCE:
[ ] Confidence check run before acting
[ ] Plan written before executing (BUILD/BUG)
[ ] Pre-mortem run (tasks > 3 steps)
[ ] Verify Plan run before EXECUTE
[ ] Compound check at every 3-4 steps
[ ] Adversarial review run before DONE
[ ] Quality Gate passed on all 5 dimensions
[ ] Correct verification tier applied
[ ] Parallel tool batching used where possible
[ ] Context budget respected (no unnecessary loads)
[ ] Memory updated if new learning emerged
[ ] tasks/todo.md updated on completion

VIOLATIONS: [list any checklist item skipped + why]
OUTCOME: SUCCESS | PARTIAL | FAILED
NOTES: [anything unusual about this session]
```

---

## 2. Pattern Detection (review monthly)

Read the last 10-20 entries in `tasks/workflow-log.md`. Look for:

| Pattern | Action |
|---|---|
| Same checklist item skipped repeatedly | Add enforcement to the relevant module |
| Same violation type 3+ sessions | Update anti-patterns in SKILL.md |
| Consistent PARTIAL/FAILED outcomes | Review the relevant module for gaps |
| Modules never loaded that keep being listed | Consider whether they're necessary |
| Context budget violations increasing | Tighten hard thresholds in 04-session |

---

## 3. Workflow Improvement Protocol

When a pattern is detected:
1. Identify which module the issue belongs to
2. Append a fix to that module (never rewrite)
3. If it's a universal anti-pattern → add to SKILL.md critical anti-patterns
4. Update `tasks/workflow-log.md` with "FIXED: [what was changed]"

**This is how the workflow itself gets smarter over time — not just the tasks.**

---

## 4. Confidence Calibration Review

Monthly: review sessions where confidence was <70% at start.
- Did the research step actually resolve the uncertainty?
- Did the task succeed or fail despite research?
- Are the confidence thresholds correctly calibrated?

Adjust thresholds in 01-planning if patterns emerge.

---

## 5. Red Flags (escalate to user immediately if observed)

- Workflow log shows 3+ consecutive FAILED outcomes
- Same violation appears in every session for 2+ weeks
- A module is never being loaded that should be
- Context budget violations causing visible quality degradation

These are systemic failures. Report to user with evidence and proposed fix.
