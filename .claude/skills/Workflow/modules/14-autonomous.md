# MODULE 14 — AUTONOMOUS MODE
# Loaded for: Large tasks where user grants autonomous execution
# Inspired by: Ralph Wiggum Loop (Anthropic community pattern)

---

## Purpose

For large, well-defined tasks, AutoLearning can operate autonomously — executing a full plan without human checkpoints at every step. This module defines safety limits, circuit breakers, and completion verification for autonomous execution.

**Key principle:** Autonomy is GRANTED, not assumed. User must explicitly opt in.

---

## 1. ACTIVATION

### Explicit triggers (user must say one of these):
- "kör autonomt" / "run autonomous"
- "bygg allt" / "build everything"
- "jag litar på dig, kör" / "I trust you, go"
- "autonomous mode" / "autonom"

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
[ ] Plan exists (AutoLearning Phase 1+2 completed, or user provided plan)
[ ] Rollback available (git checkpoint created — Module 12 §2)
[ ] Test suite exists (or task includes creating one)
[ ] Scope is bounded (finite number of files/components)
[ ] No destructive operations in plan
[ ] Working tree is clean (no uncommitted changes — git status clean)
[ ] Tests currently pass (if test suite exists — npm test exit 0)
[ ] All dependencies installed (npm ci or yarn install succeeded)
[ ] No pending git conflicts (git status shows no merge conflicts)
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
| npm install needed for new package | STOP — require user approval for new dependencies |
| File deletion not in original plan | STOP — require user approval before deleting |
| git merge/rebase conflict | STOP — rollback to last checkpoint |
| Files modified > 2x original plan | STOP — scope explosion detected |
| Single iteration creates > 3 new files | STOP — exponential generation detected |

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

## 8. INTEGRATION WITH AutoLearning

| Scenario | How autonomous mode works |
|---|---|
| Full AutoLearning (10+ files) | Phase 1+2 interactive → Phase 3 autonomous → Phase 4+5 interactive |
| AutoLearning Lite (4-10 files) | Phase 1 interactive → Phase 3 autonomous → Phase 4 interactive |
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

---

## 11. DUAL-CONDITION EXIT GATE

The autonomous execution loop MUST NOT exit based on a single signal. Two independent conditions must BOTH be true.

**Condition 1: Completion indicators**
- All plan items marked done
- Build passes (exit code 0)
- Tests pass (exit code 0)
- No TODO/FIXME left in new code

**Condition 2: Explicit EXIT_SIGNAL**
- Agent must emit the literal string `EXIT_SIGNAL:COMPLETE` in its output
- This is a deliberate, conscious declaration — not just "I'm done"

**Logic:**
```
IF completion_indicators AND exit_signal_present:
  → EXIT loop (truly done)
ELIF completion_indicators BUT NOT exit_signal:
  → CONTINUE (agent may be confused about what "done" means)
ELIF exit_signal BUT NOT completion_indicators:
  → CONTINUE (agent declared done but work remains)
ELSE:
  → CONTINUE (still working)
```

**Why both:** An agent saying "done" is unreliable — it may have skipped items or misunderstood scope. Completion indicators alone can false-positive when a partial build passes. Requiring both eliminates false terminations.

**Anti-pattern:** Never allow the loop to exit on "I believe this is complete" without the EXIT_SIGNAL token.

---

## 12. POST-PR SELF-REFLECTION

After each commit or merge during autonomous execution, run a reflection step.

**Reflection process:**
1. Read the diff (`git diff HEAD~1`)
2. Extract:
   - What patterns worked well (reuse these)
   - What caused friction (avoid these)
   - What took more iterations than expected (flag for skill improvement)
3. Append findings to `routing-signals.md`:
   ```
   ## Reflection — [YYYY-MM-DD] — [commit SHA short]
   - **Worked:** [pattern that succeeded]
   - **Friction:** [what was harder than expected]
   - **Lesson:** [one-sentence actionable takeaway]
   ```
4. If the same friction pattern appears 3+ times across reflections:
   - Propose a new instinct (Module 15 §4)
   - Present to user: "Recurring pattern detected: [X]. Add as instinct?"

**Budget:** Max 1K tokens per reflection. Keep it concise — this is a log, not an essay.

**Rules:**
- Reflection runs AFTER successful commit, not after failed attempts
- Skip reflection if the commit is trivial (< 5 lines changed)
- Never block the autonomous loop for reflection — it runs inline
- Reflection findings feed into Module 09 learning at session end

---

## 13. TASK-TYPE-SPECIFIC GATES

Different task types have different failure modes. Apply extra gates based on what's being built.

| Task type | Autonomous? | Extra verification |
|-----------|------------|-------------------|
| UI component build | YES | Smoke test: dev server + homepage loads |
| API endpoint | YES | Endpoint responds with correct status code |
| Database schema change | NO | Always require human approval before migrate |
| Refactor (no new features) | YES | Benchmark before/after (no performance regression) |
| New dependency addition | NO | Always require human approval |
| Config/env changes | YES | Service starts successfully with new config |
| Auth/security/payment code | NO | Always require human review |
| Test suite creation | YES | All new tests pass + no existing test regressions |

**Detection:** Infer task type from the plan (Phase 1 output). If plan mentions "migrate", "schema", "auth", "payment" → apply NO-autonomous gate.

**Rule:** When in doubt about task type, treat as NO-autonomous. Safety > speed.
