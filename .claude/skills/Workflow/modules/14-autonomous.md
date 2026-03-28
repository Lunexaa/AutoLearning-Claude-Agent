# MODULE 14 — AUTONOMOUS MODE
# Loaded for: Large tasks where user grants autonomous execution
# Inspired by: Ralph Wiggum Loop (Anthropic community pattern)

---

## Purpose

For large, well-defined tasks, JARVIS can operate autonomously — executing a full plan without human checkpoints at every step. This module defines safety limits, circuit breakers, and completion verification for autonomous execution.

**Key principle:** Autonomy is GRANTED, not assumed. User must explicitly opt in.

---

## 1. ACTIVATION

### Explicit triggers (user must say one of these):
- "run autonomous"
- "build everything"
- "I trust you, go"
- "autonomous mode"

### Never auto-activate when:
- Task is ambiguous or underspecified
- Task involves destructive operations (delete, drop, force-push)
- Task touches auth, payments, or user data
- First time working in a new codebase

**Rule:** When in doubt, ask. Autonomy is a privilege, not a default.

---

## 2. PRE-FLIGHT CHECKLIST

Before entering autonomous mode, verify ALL:

```
[ ] Task is clearly defined (specific deliverable, not vague goal)
[ ] Plan exists (JARVIS Phase 1+2 completed, or user provided plan)
[ ] Rollback available (git checkpoint created — Module 12 §2)
[ ] Test suite exists (or task includes creating one)
[ ] Scope is bounded (finite number of files/components)
[ ] No destructive operations in plan
```

**If any check fails:** Fall back to interactive mode. Explain why.

---

## 3. EXECUTION LOOP

```
WHILE task not complete AND iteration < MAX_ITERATIONS:

  1. Pick next item from plan
  2. Execute it (write code, run commands)
  3. VERIFY immediately:
     - Does it build? (npm run build)
     - Do tests pass? (npm test)
     - Is it consistent with plan?
  4. If verification fails:
     - Attempt fix (max 2 tries per item)
     - If fix fails → log to issues list, skip, continue
  5. Mark item complete
  6. Every 5 items: CHECKPOINT
     - git add + commit progress
     - Review: am I still on track?
     - Check: have I drifted from scope?

END WHILE
```

---

## 4. SAFETY LIMITS

| Limit | Value | Why |
|---|---|---|
| MAX_ITERATIONS | 50 | Prevents infinite loops |
| MAX_CONSECUTIVE_FAILURES | 3 | Stops digging deeper into broken approach |
| MAX_FILES_MODIFIED | 30 | Scope creep detection |
| MAX_TIME_ESTIMATE | 15 min | Practical limit for unattended execution |
| CHECKPOINT_INTERVAL | Every 5 items | Regular git commits for rollback |

---

## 5. CIRCUIT BREAKERS (auto-stop triggers)

Autonomous mode STOPS immediately if ANY of these occur:

| Trigger | Action |
|---|---|
| Same error 3 times in a row | STOP — approach is wrong, need human input |
| Build breaks and can't be fixed in 2 attempts | STOP — rollback to last checkpoint |
| Scope drift detected (modifying files not in plan) | STOP — confirm with user |
| Security-sensitive file touched (.env, auth, RLS) | STOP — require explicit approval |
| Token budget exceeded (>80K tokens in one autonomous run) | STOP — checkpoint and continue in new session |
| Test suite goes from passing to 5+ failures | STOP — regression detected |
| Agent spawn returns score < 2/5 twice | STOP — quality degradation |

**When stopped:** Present user with:
1. What was completed (with file list)
2. What triggered the stop
3. What remains on the plan
4. Recommended next step

---

## 6. COMPLETION PROTOCOL

When autonomous loop ends (all items done OR circuit breaker triggered):

### Step 1: Terminal Verification (mandatory)
```bash
npm run build 2>&1 | tail -5     # Must pass
npm test 2>&1 | tail -10          # Must pass
```

### Step 2: Self-Review
```
- Read every modified file
- Check: does implementation match plan?
- Check: any TODO/FIXME/HACK left behind?
- Check: any hardcoded values that should be config?
```

### Step 3: Summary to User
```markdown
## Autonomous Run Complete

**Items completed:** [N/total]
**Files created:** [list]
**Files modified:** [list]
**Tests:** [passing/total]
**Build:** [clean/warnings]

### What was built
[2-3 sentence summary]

### Issues encountered
[list any skipped items or workarounds]

### Needs human review
[anything that requires manual verification]
```

### Step 4: Quality Gate
Run Module 11 quality gates on the result. If gates fail → fix before presenting to user.

---

## 7. SCOPE CONTROL

Autonomous mode must NEVER:
- Add features not in the plan
- Refactor code unrelated to the task
- Install new dependencies without plan approval
- Change configuration files not mentioned in plan
- Create documentation unless plan says to
- Push to remote (only local commits)

**The golden rule:** Do exactly what the plan says. Nothing more, nothing less.

---

## 8. INTEGRATION WITH JARVIS

| Scenario | How autonomous mode works |
|---|---|
| Full JARVIS (10+ files) | Phase 1+2 interactive → Phase 3 autonomous → Phase 4+5 interactive |
| JARVIS Lite (4-10 files) | Phase 1 interactive → Phase 3 autonomous → Phase 4 interactive |
| Solo (≤3 files) | Not worth autonomous mode — just do it |
| Multi-sprint project | Each sprint can have autonomous Phase 3 |

**The pattern:** Humans decide WHAT (Phase 1+2), machines execute HOW (Phase 3), humans verify QUALITY (Phase 4+5).

---

## 9. TOKEN BUDGET

| Component | Budget |
|---|---|
| Pre-flight checklist | ~1K |
| Per iteration (code + verify) | ~2-3K |
| Checkpoint (git + review) | ~1K |
| Completion protocol | ~3K |
| **50-item autonomous run** | **~80K max** |

**Rule:** If approaching 80K tokens, trigger checkpoint circuit breaker and continue in new session.

---

## 10. ANTI-PATTERNS

- **Never go autonomous without a plan** — autonomous execution of a vague goal = chaos
- **Never disable circuit breakers** — they exist for safety, not convenience
- **Never skip terminal verification** — "it should work" is not verification
- **Never modify auth/payment code autonomously** — always require human approval
- **Never force-push or deploy autonomously** — local commits only
- **Never exceed scope** — scope creep in autonomous mode is dangerous
- **Never retry the same failing approach** — 3 strikes = stop and ask
