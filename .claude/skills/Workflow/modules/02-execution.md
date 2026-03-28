# MODULE 02 — EXECUTION ROUTING
# Loaded for: BUILD, BUG, URGENT tasks

---

## 1. THREE-TIER ROUTING MATRIX

Route every task before starting. No exceptions.

| Task type | Files | Independent sub-tasks | Tier |
|---|---|---|---|
| Bug fix, quick change, config | ≤3 | 0–1 | **TIER 1: Solo** |
| Feature, multi-component, research+build | 4–10 | 2–4 | **TIER 2: Subagent** |
| Full system, parallel domains, large refactor | 11+ | 5+ | **TIER 3: Ruflo Swarm** |

---

## 2. TIER 1 — Solo Execution

- Implement directly
- One task at a time, check off in `tasks/todo.md` as you go
- Minimal changes — no side effects, no unrelated refactoring
- No quick hacks — if it needs to be right, do it right
- Batch all independent tool calls in one message

---

## 3. TIER 2 — Subagent Execution (Claude Code Agent tool)

Use when: parallel research, independent components, or scope > 1 screen.

**Per-agent contract:**
- One task per agent — clear input/output boundary
- Agent receives: task + relevant memory files + stack constraints
- Agent returns: what was done + files changed + what to verify
- Main context stays clean — agents handle the details

**Git worktree isolation (use for parallel file-editing agents):**
Each agent that modifies code gets its own worktree — prevents filesystem conflicts.
```bash
git worktree add ../worktree-agent-1 -b agent/feature-auth
git worktree add ../worktree-agent-2 -b agent/feature-db
# Agents work independently, review and merge after
git worktree remove ../worktree-agent-1
git worktree remove ../worktree-agent-2
```
**Worktree rules:**
- Share: `.git` metadata, Docker daemon, local DB — do NOT have two agents mutate DB state simultaneously
- Isolate: working directory, branch, terminal environment
- Merge: review each branch independently, then merge to main

**Anti-pattern:** Spawning agents for tasks that share state — do those sequentially in Tier 1.

---

## 4. TIER 3 — Ruflo Swarm Execution

Trigger: 11+ files, parallel domains (frontend + backend + DB simultaneously), specialized agents needed.

**Pre-flight (MANDATORY — inject into every agent before first task):**
```
Memory context:
- ~/.claude/Memory/feedback_dev.md
- ~/.claude/Memory/feedback_communication.md
- ~/.claude/Memory/project_[current].md
- ~/.claude/Memory/feedback_project.md (your-project only)

Stack constraints:
Next.js 16.2.1+ (your-project) / Next.js 14 (your-project)
Prisma: db push NEVER migrate dev. Build: prisma generate && next build
Supabase: port 6543, pgbouncer=true, connection_limit=1
Cloudflare DNS: grey cloud only. R2_PUBLIC_URL must be set.
Chromium: @sparticuz/chromium full ONLY. Vercel: auto-deploy from main.
```

**Swarm pattern:**
```
Architect (you) → defines tasks + DoD + constraints
  ├── Coder agent(s)  → implementation per domain (each in own worktree)
  ├── Tester agent    → verifies render + CRUD (not just "route exists")
  └── Reviewer agent  → regressions + code quality
```

**Commands (batch spawn in one message):**
```bash
ruflo swarm init
ruflo spawn coder && ruflo spawn tester && ruflo spawn reviewer
ruflo delegate [id] "[full task + injected memory context]"
ruflo swarm status
ruflo swarm shutdown
```

**Stream-JSON chaining (for agent pipelines):**
```bash
ruflo delegate agent-1 --output-format stream-json | ruflo delegate agent-2 --input-format stream-json
```
Reduces handoff latency from 2-3s to <100ms. Use for sequential agent pipelines.

**Partial failure protocol:**
| Agents succeeded | Action |
|---|---|
| ≥80% | Keep completed work. Re-delegate failed task only. |
| 50–79% | Review completed work for consistency before keeping. |
| <50% | Discard all. Diagnose root cause. Restart swarm. |

**Ruflo fallback (if daemon fails):**
```bash
ruflo doctor   # diagnose
ruflo init --yes  # re-init
```
Unrecoverable in <2 min → drop to Tier 2. Never block execution on tooling.

Full Ruflo reference: `~/.claude/skills/ruflo-swarm/SKILL.md`

---

## 5. COMPOUND ERROR DEFENSE

> At 20% per-step error rate, a 10-step task has 11% success without checkpoints.

**Checkpoint rule:** After every 3–4 implementation steps — stop and verify:
- Does what I just built actually work?
- Did I introduce regressions?
- Am I still on the plan, or have I drifted?

**Drift detection:** If your current step is not directly traceable to `tasks/todo.md` → stop. Re-read the plan.

**Compound error signals (stop immediately if any appear):**
- Fixing a fix
- Solution is more complex than the problem
- You've touched files not in the original plan
- Confidence has dropped below 70% mid-execution → pause, research, re-score

**When compound errors detected:** Stop all execution. Return to PLAN. Do NOT build on a broken foundation.

**Integration failure first:** Most production failures are tool failures, not reasoning.
Before assuming logic is wrong: check env vars → check service reachability → read the exact error → read library source if needed.

---

## 6. OUTPUT FORMAT STANDARDS

Consistent formats per task type. Always use these — no improvising.

**Bug fix:**
```
ROOT CAUSE: [one sentence]
FIX: [what was changed and where]
VERIFIED: [how you proved it works]
REGRESSIONS: [checked — none / list]
```

**Feature delivery:**
```
BUILT: [what was implemented]
FILES CHANGED: [list]
HOW TO TEST: [exact steps]
EDGE CASES COVERED: [list]
```

**Research answer:**
```
ANSWER: [direct answer first]
CONFIDENCE: [%]
BASIS: [source / reasoning]
CAVEAT: [if any]
```

**Status update (mid-task):**
```
STATUS: [DONE / IN PROGRESS / BLOCKED]
DONE: [1-2 lines]
BLOCKER: [none / describe]
NEXT: [1 line]
```
