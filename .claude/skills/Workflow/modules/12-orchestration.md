# MODULE 12 — ORCHESTRATION & RESILIENCE
# Loaded for: Full AutoLearning (10+ files) only
# Handles: progress, rollback, context compression, hot-swap, session continuity

---

## 1. PROGRESS STREAMING

During multi-phase AutoLearning execution, emit status after each phase:

```
[AutoLearning] PHASE 1/5: Intel complete — 3 agents returned, brief ready
[AutoLearning] PHASE 2/5: Design Tribunal — 6 proposals scored, hybrid brief selected
[AutoLearning] PHASE 3/5: Building — 4 files created, 2 modified
[AutoLearning] PHASE 4/5: Quality gates — build ✅, tests ✅, a11y ✅, perf ✅
[AutoLearning] PHASE 4/5: Agent review — code 8/10, design 9/10, security clean
[AutoLearning] PHASE 5/5: Delivering result
```

**Rules:**
- One line per phase, not per agent
- Never explain the internal process in detail — user doesn't care that 6 agents debated
- If a phase takes >30 seconds, emit mid-phase: `[AutoLearning] PHASE 3: building... 2/4 components done`

---

## 2. ROLLBACK PROTOCOL

Before PHASE 3 (BUILD) starts, create a branch checkpoint:

```bash
BRANCH_NAME="autolearning/checkpoint-$(date +%s)"
git checkout -b "$BRANCH_NAME" 2>/dev/null || git branch "$BRANCH_NAME"
```

**Rollback triggers:**
- Phase 4 quality gate fails 3 times on same issue
- Compound error detected (fixing a fix of a fix)
- User says "start over" or "something went wrong"

**Rollback action:**
```bash
git checkout main  # or original branch
git branch -D "$BRANCH_NAME"  # cleanup failed attempt
```

**Advantages over stash:**
- No collision with user's working tree
- Clear history (`git log --all --graph` shows each attempt)
- Can inspect failed attempt: `git show autolearning/checkpoint-...:file`
- Multiple parallel runs don't interfere

**Branch cleanup:** Keep for 7 days (for postmortem), then delete.

**HARD RULE:** Maximum 1 rollback per task. Second failure → escalate to user.

---

## 3. CONTEXT HANDOFF COMPRESSION

Between AutoLearning phases, compress output to STRUCTURED briefs (not prose with word limits):

**Phase 1 → Phase 2 handoff:**
```yaml
task: [what to build]
user: [who it's for]
constraints: [hard rules from skill + user]
references: [top 3 repos/patterns found]
project_context: [1 sentence from memory]
```

**Phase 2 → Phase 3 handoff:**
```yaml
direction: [style/approach chosen]
stack: [framework + libs]
files_to_create: [list]
files_to_modify: [list]
key_decisions: [list of choices made]
skill_rules: [checklist from compliance gate]
```

**Phase 3 → Phase 4 handoff:**
```yaml
files_created: [list with paths]
files_modified: [list with paths]
tests: [passing/total]
build: [clean/warnings]
deviations_from_plan: [list, if any]
requirements_covered: [checklist]
```

**Rule:** Structure > brevity. Required fields must be present. Optional fields can be empty.
Full agent output stays in main context but is NOT forwarded to next-phase agents.

---

## 4. HOT-SWAP AGENTS

If an agent returns low-quality output (< 2/5 score or clearly off-topic):

1. Do NOT retry the same agent
2. Identify the closest alternative agent from the 310-agent roster
3. Spawn the replacement with the same prompt + note: "Previous agent returned poor output. Focus on [specific gap]."

**Swap map (15+ agents):**
| Failed agent | Swap to | Fallback |
|---|---|---|
| `frontend-developer` | `nextjs-developer` | `react-specialist` |
| `ui-designer` | `frontend-designer` | `design-system-architect` |
| `code-reviewer` | `typescript-reviewer` | `clean-architecture-expert` |
| `architect` | `clean-architecture-expert` | `microservices-architect` |
| `security-reviewer` | `penetration-tester` | `backend-security-coder` |
| `design-reviewer` | `ui-designer` | `accessibility-expert` |
| `api-designer` | `graphql-architect` | `backend-developer` |
| `database-reviewer` | `database-optimizer` | `postgres-pro` |
| `website-architect` | `frontend-designer` | `nextjs-developer` |
| `conversion-optimizer` | `ux-researcher` | `product-manager` |
| `seo-specialist` | `seo-content-writer` | `seo-meta-optimizer` |
| `critic` (loop) | `code-reviewer` | `typescript-reviewer` |
| `fixer` (loop) | `fullstack-developer` | `debugger` |
| `e2e-runner` | `playwright-expert` | `test-automator` |
| `ml-engineer` | `data-scientist` | `python-expert` |

**HARD RULE:** Maximum 1 swap per agent role per task. If swap also fails → do it yourself (Solo).

---

## 5. SESSION CONTINUITY

If an AutoLearning run spans multiple sessions (context limit hit), write state:

```markdown
<!-- AutoLearning state metadata (saved in tasks/todo.md) -->
## AutoLearning State — [timestamp]
- **Task:** [original user request]
- **Current phase:** PHASE [N]
- **Completed phases:** [list with key outputs]
- **Design brief:** [if Phase 2 complete, paste compressed brief]
- **Files created so far:** [list]
- **Files remaining:** [list from plan]
- **Quality gate status:** [which passed, which pending]
- **Rollback available:** [yes/no, branch ref]
```

**Next session:** Module 04 (session.md) checks for `tasks/todo.md` with AutoLearning state metadata → resumes from the correct phase, not from scratch.

**HARD RULE:** Never re-run completed phases. If Phase 1+2 are done and state is saved, next session starts at Phase 3.

---

## 6. TOKEN BUDGET PER PHASE

| Phase | Max agent spawns | Model mix | Estimated tokens |
|---|---|---|---|
| Phase 1: Intel | 3 | all sonnet | ~8K |
| Phase 2: Brainstorm | 5-7 | 2-3 opus + rest sonnet | ~20K |
| Phase 3: Build | 2-3 | 1 opus + rest sonnet | ~15K |
| Phase 4: Quality gates | 0 (automated) | — | ~0 |
| Phase 4: Agent review | 3 | all sonnet | ~12K |
| **Total Full AutoLearning** | **13-16** | | **~70-90K** |

**Cost reduction rules:**
- AutoLearning Lite skips Phase 2 → saves ~20K tokens
- Solo skips Phase 1+2+4 → saves ~38K tokens
- Automated quality gates (Module 11) replace 1-2 agent reviews when issues are caught early
- Use sonnet for ALL review agents — opus adds cost, not review quality
- Context handoff compression (Section 3) reduces per-agent input by ~40%

---

## 7. LOCK-BASED FILE COORDINATION

When multiple agents work in the SAME worktree (not isolated worktrees), prevent file conflicts with locks.

**Lock protocol:**
```
BEFORE editing file X:
  1. Check: does tasks/.locks/[filename].lock exist?
  2. IF locked:
     - Read lock file: [agent name] + [timestamp]
     - IF timestamp > 60 seconds old → stale lock, break it
     - ELSE → skip this file, work on another file from the plan
  3. IF unlocked:
     - Create lock: write [agent name] + [timestamp] to tasks/.locks/[filename].lock
     - Edit the file
     - Delete the lock file

AFTER editing:
  - Always release the lock (delete the .lock file)
  - If edit fails → still release the lock
```

**Lock file format:**
```
agent: [agent-name]
locked: [ISO timestamp]
file: [path being edited]
```

**Lock timeout:** 60 seconds. If a lock is older than 60 seconds, assume the agent crashed and break the lock.

**When this is needed:**
- AutoLearning Lite: agents share a single worktree
- Autonomous mode: rapid sequential edits to shared files
- Any scenario where 2+ agents might touch the same file

**When this is NOT needed:**
- Full AutoLearning with isolated worktrees (each agent has its own copy)
- Solo mode (only one agent working)

**Anti-pattern:** Never hold a lock while spawning a subagent — the subagent may take too long and the lock will go stale, blocking other agents unnecessarily.

---

## 8. ANONYMIZED INTER-AGENT REVIEW

In Phase 4 review chain, strip authorship before agents review each other's findings to prevent sycophancy.

**The problem:** When Agent B (sonnet) reviews Agent A's (opus) findings, it tends to agree because opus is perceived as higher authority. This creates a rubber-stamp review that misses real issues.

**The solution:** Anonymize all review outputs before cross-review.

**Integration with Phase 4 (from SKILL.md):**
```
Step 2: Agent review (3 agents spawn parallel)
  → Code reviewer produces findings
  → Design reviewer produces findings
  → Security reviewer produces findings

Step 2.5: ANONYMIZE (this module §8)
  - Collect all findings into single list
  - Strip agent names and model tiers
  - Randomize order AND finding IDs (A1, A2... not "Code Reviewer Finding 1")
  - Neutralize tone ("As a security expert..." → "Finding:")

Step 3: Critic/Fixer loop receives anonymized findings
  - Evaluates each on merit, not source
  - Synthesizes into action items
```

**Protocol:**
```
Phase 4 Step 2 completes:
  1. Main agent collects all findings
  2. Strip: agent name, model tier (opus/sonnet/haiku)
  3. Randomize: shuffle finding order + reassign IDs
  4. Neutralize: remove source language
  5. Present to Critic: "Here are [N] findings. Evaluate each on merit."
```

**Implementation:**
- Main agent (not a subagent) handles anonymization — it's a simple text transform
- Findings are numbered (Finding 1, Finding 2...) not attributed
- After synthesis, attribution is restored for final report if needed

**When to apply:**
- Full AutoLearning (Phase 4 with 3+ reviewers)
- Any scenario where multiple agents review the same work

**When to skip:**
- Solo mode (no review agents)
- AutoLearning Lite with single reviewer (nothing to cross-reference)

**Expected impact:** Reduces sycophantic agreement by ~40% based on multi-agent debate research. Findings that survive anonymous review are genuinely high-signal.

**Anti-pattern:** Never reveal agent identities during review synthesis. The goal is merit-based evaluation, not authority-based agreement.

---

## 9. 4-LEVEL TASK ESCALATION

Replace binary pass/fail with nuanced completion statuses. Inspired by PAUL's escalation model.

**The 4 levels:**

| Status | Meaning | Action |
|--------|---------|--------|
| **DONE** | Task complete, all gates pass, no concerns | Proceed to DELIVER |
| **DONE_WITH_CONCERNS** | Task works, but something feels off | Deliver with flagged concerns for user awareness |
| **NEEDS_CONTEXT** | Blocked by missing information — can't proceed without input | Pause, ask ONE specific question, resume after answer |
| **BLOCKED** | Fundamental issue — wrong approach, missing dependency, conflicting requirements | Stop, present diagnosis, propose alternatives |

**When to use each:**

```
DONE:
  - Build passes, tests pass, all gates green
  - Implementation matches plan
  - No TODO/FIXME left behind

DONE_WITH_CONCERNS:
  - Build passes, but performance is borderline (LCP 2.4s, threshold is 2.5s)
  - Implementation works, but an edge case wasn't tested
  - Code is correct, but a dependency is deprecated
  - Format: "Task complete. Concern: [specific issue]. Risk: [impact if ignored]."

NEEDS_CONTEXT:
  - Spec says "integrate with payment provider" but doesn't name which one
  - Two skill rules conflict and the priority isn't clear
  - User's intent is ambiguous between two valid interpretations
  - Rule: Ask exactly ONE question. Never ask 3 questions — pick the most blocking one.

BLOCKED:
  - npm install fails due to peer dependency conflict
  - Database migration would break existing data
  - Selected approach is fundamentally incompatible with existing architecture
  - Format: "BLOCKED: [root cause]. Tried: [what was attempted]. Options: [2-3 alternatives]."
```

**Integration with phases:**

| Phase | How escalation applies |
|-------|----------------------|
| Phase 3 BUILD | Agent reports status per subtask. DONE_WITH_CONCERNS subtasks continue; BLOCKED subtasks stop the build. |
| Phase 3.5 UNIFY | Aggregates subtask statuses. If any BLOCKED → escalate before Phase 4. If DONE_WITH_CONCERNS → include in deviation report. |
| Phase 4 REVIEW | Reviewers can escalate findings to BLOCKED (critical) or DONE_WITH_CONCERNS (high). |
| Phase 5 DELIVER | DONE → clean delivery. DONE_WITH_CONCERNS → deliver with concerns section. |
| Autonomous mode | NEEDS_CONTEXT → circuit breaker triggers (Module 14 §5). BLOCKED → immediate stop. |

**Diagnostic failure routing (when BLOCKED):**

Before attempting any fix, classify the root cause:

| Root cause | Fix approach |
|-----------|-------------|
| **Intent** — plan was wrong | Return to Phase 2, re-brainstorm |
| **Spec** — requirements are contradictory or incomplete | Ask user to clarify, then re-plan |
| **Code** — implementation bug | Fix inline, re-run gates |

**Rule:** Never patch code when the plan was wrong. Patching the wrong approach compounds failure.
