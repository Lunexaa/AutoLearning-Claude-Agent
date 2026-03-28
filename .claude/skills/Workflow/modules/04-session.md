# MODULE 04 — SESSION MANAGEMENT & CONTEXT BUDGET
# Loaded for: every session start

---

## 1. SESSION START PROTOCOL

1. Read `~/.claude/Memory/MEMORY.md` — identify which 2-3 files are relevant to today's task
2. Read ONLY those files (not all of them)
3. Check `tasks/todo.md` in current project — incomplete items? → go to Section 3 (Session Resume)
4. Scan `tasks/lessons.md` for patterns matching today's task type
5. Silent Ruflo health check if complex task expected: `ruflo doctor 2>/dev/null`

**Result:** You enter with exactly the context needed. Nothing more.

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

### If yes:
- New topic → create skill (08-skills §B) + update ROADMAP
- New within existing area → append to skill (08-skills §C)
- Mistake, project-only → log to `tasks/lessons.md`
- Mistake, cross-project → log + promote to `~/.claude/Memory/feedback_*.md`

### Load `modules/07-self-monitor.md` → log session adherence score

**Rule:** Every session must leave the system smarter than it started.
A successful session with no learning is a missed opportunity.
