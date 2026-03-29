# MODULE 04 — SESSION MANAGEMENT & CONTEXT BUDGET
# Loaded for: every session start

---

## 1. SESSION START PROTOCOL

1. Read `~/.claude/Memory/MEMORY.md` — identify which 2-3 files are relevant to today's task
2. Read ONLY those files (not all of them)
3. **Selective Knowledge Priming** — match memories to context:
   - Identify which files/directories will likely be touched
   - Load ONLY memory entries that relate to those files or that domain
   - If task is frontend → load `feedback_design.md`, skip backend memories
   - If task is backend → load `feedback_dev.md`, skip design memories
   - If task is new domain → load `routing-overrides.md` for learned routes
4. Check `tasks/todo.md` in current project — incomplete items? → go to Section 3 (Session Resume)
5. Scan `tasks/lessons.md` for patterns matching today's task type
6. Silent Ruflo health check if complex task expected: `ruflo doctor 2>/dev/null`

**Result:** You enter with exactly the context needed. Nothing more.

**Priming decision tree:**
```
TASK RECEIVED
  ↓
What domain? → [frontend | backend | fullstack | devops | research | other]
  ↓
Which files will change? → git diff --stat OR inferred from task description
  ↓
Load memories that match:
  - Domain-specific feedback (feedback_design.md, feedback_dev.md, etc.)
  - File-specific lessons (grep tasks/lessons.md for touched paths)
  - Routing overrides (always — it's tiny)
  ↓
Skip everything else.
```

---

## 2. CONTEXT BUDGET

> Every token on irrelevant rules, unused tools, old history = token stolen from the actual task.

### Load only what's needed:
- Memory: max 2-3 files per session, only relevant domain
- Skills: only the one matching skill — never browse the library
- MCP servers: disable unused ones (Playwright = 11.7k tokens/message)
- Modules: only what the task type requires (per SKILL.md routing rules)

### Hard thresholds — start new conversation when ANY trigger is met:

| Trigger | Action |
|---|---|
| Session > 25 turns AND switching task domain | New conversation |
| Same error repeated 3+ times in conversation | New conversation — context is poisoned |
| 4+ memory files + 2+ skill modules loaded | New conversation for next task |
| Current task complete AND next task is unrelated | New conversation |
| Performance noticeably degrading mid-session | New conversation |

### When ending for context reasons:
1. Complete current task fully — never split a task across context boundaries
2. Write state to `tasks/todo.md`
3. Promote any new learning to memory files
4. Start fresh — next task begins clean

### Never:
- Split an in-progress task across two conversations
- Load all memory files when 2 are relevant
- Carry long solved threads into new tasks

---

## 2b. PERSISTENT MEMORY — SESSION CAPTURE

Every session generates knowledge. Capture it systematically, not just when you remember.

### Auto-capture triggers (check at session end):
| What happened | Memory action |
|---|---|
| Bug fixed | Log root cause + fix to `tasks/lessons.md` |
| New pattern discovered | Append to relevant `feedback_*.md` in Memory |
| Skill worked well (score ≥ 4) | Log signal to `routing-signals.md` |
| Skill failed (score ≤ 2) | Log signal + lesson to `routing-signals.md` |
| User corrected approach | Create/update `feedback_*.md` — this is gold |
| User confirmed approach worked | Also log — positive signals prevent drift |
| Architecture decision made | Log to `tasks/lessons.md` with rationale |

### Memory compression rules:
- Keep entries under 3 sentences — dense, not verbose
- Lead with the actionable rule, follow with the reason
- Use absolute dates, not "yesterday" or "last week"
- Tag entries with domain: `[frontend]`, `[backend]`, `[design]`, `[devops]`

### What NOT to capture:
- Ephemeral debugging steps (the fix is in the code)
- Code snippets (the code is in the repo)
- Things already in CLAUDE.md or skill files
- Task-specific details with no future value

### Memory hygiene (run monthly or when routing-signals.md > 50 entries):
1. Archive signals older than 90 days (move to `routing-signals-archive.md`)
2. Promote any lesson that appears 3+ times to permanent `feedback_*.md`
3. Remove contradictory entries (keep the most recent)
4. Verify memory file references still point to existing files

---

## 3. SESSION RESUME PROTOCOL

Run when `tasks/todo.md` has incomplete items from a previous session.

1. Read `tasks/todo.md` — what was in progress?
2. Read `tasks/lessons.md` — anything from last session relevant today?
3. Load relevant memory files for this project
4. Identify the last **completed checkpoint** (not where you stopped — where you verified)
5. **Smoke check** last session's work before building on it — don't assume it's correct
6. Resume from the last verified checkpoint

**The cold-start trap:** Incomplete implementation may have left the system in an invalid state. Always verify before building on it. Never assume last session's partial work is correct.

---

## 4. SESSION END PROTOCOL

Run when task completes or session ends naturally.

### Ask:
1. Did we learn something new this session?
2. Did we discover a pattern/technique missing from an existing skill?
3. Was a mistake made that could happen again?
4. Did the user correct or confirm my approach? (→ feedback memory)

### If yes:
- New topic → create skill (08-skills §B) + update ROADMAP
- New within existing area → append to skill (08-skills §C)
- Mistake, project-only → log to `tasks/lessons.md`
- Mistake, cross-project → log + promote to `~/.claude/Memory/feedback_*.md`
- User correction → create/update `feedback_*.md` with rule + reason (highest-value memory)
- User confirmation of non-obvious approach → log positive signal to prevent drift

### Load `modules/07-self-monitor.md` → log session adherence score

**Rule:** Every session must leave the system smarter than it started.
A successful session with no learning is a missed opportunity.

---

## 5. CONTEXT-CLEAR-BETWEEN-TASKS

When completing one task and starting another in the same session, actively reset context.

**The problem:** Context pollution. After debugging a complex issue, the debugging context (error messages, failed approaches, stack traces) stays in the conversation. When the user asks about a new feature, Claude "sees" phantom problems from the old context — suggesting fixes for things that aren't broken.

**Detection triggers:**
- User gives a new instruction unrelated to the previous task
- Topic shift > 70% from current conversation focus
- User explicitly says "new task", "next", "something else", "different topic"
- Previous task was marked complete (via KAREN validator or user confirmation)

**Context reset procedure:**
1. Write current task summary to session-notes.md (Module 15 §1) — preserve learnings
2. Log completion signal to routing-signals.md (Module 09 §1)
3. Mentally reset: stop referencing files, errors, and patterns from the completed task
4. Re-read MEMORY.md index — identify which 2-3 files are relevant to the NEW task
5. Load fresh context for the new task (selective knowledge priming, §1 of this module)
6. Begin the new task as if it's a fresh session

**What to carry forward:**
- Instincts (always active — Module 15 §4)
- Project-level knowledge (THEORY.md, branch memory)
- Napkin entries (they're always relevant)

**What to drop:**
- Debugging context from previous task
- File contents loaded for the previous task
- Error messages and stack traces from previous task
- Temporary patterns that were specific to the previous task

**Hard rule:** If session > 25 turns AND user starts a new unrelated task → strongly recommend starting a new conversation. Context pollution is real and degrades output quality.

**Anti-pattern:** Carrying debugging context into a new feature discussion. If Claude says "we should also check for the null pointer issue from earlier" during a new CSS styling task — context pollution has occurred.
