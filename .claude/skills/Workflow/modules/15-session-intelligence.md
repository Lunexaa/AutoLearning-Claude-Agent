# MODULE 15 — SESSION INTELLIGENCE
# Loaded for: every session (lightweight sections §1, §4), full load on complex tasks
# Inspired by: blader/napkin, GMaN1911/claude-cognitive, FlineDev/Recall, ChristopherKahler/carl

---

## Purpose

Make Claude smarter about context during and across sessions. Seven systems that work together: a live scratchpad (napkin), pre-compaction preservation (diary), intelligent file prioritization (attention tiers), always-on behavioral rules (instincts), cross-session continuity (recall), branch-scoped memory, and architectural understanding (theory document).

---

## 1. SESSION NOTES — Live Memory + PreCompact Capture

A single file that serves as both real-time scratchpad AND pre-compaction diary.

**Storage:**
- Global (all projects): `~/.claude/Memory/session-notes.md`
- Per-project (current branch): `.claude/session-notes.md` (optional, for branch-specific notes)

**Write in real-time (during work):**
- After any user correction
- After encountering an unexpected error
- After discovering something non-obvious
- After a successful approach that wasn't obvious

**Write at pre-compaction (via PreCompact hook):**
- Key decisions made this session
- Open questions not yet resolved
- Current task state (done/remaining)

**Format:**
```markdown
## [YYYY-MM-DD HH:MM] — [topic]
- **Type:** correction | discovery | decision | state
- **Detail:** [what happened]
- **Files:** [affected files, if applicable]
- **Rule:** [what to do differently, if applicable]
- **Scope:** project | cross-project
```

**Example:**
```markdown
## [2026-03-28 14:30] — Chromium builds require full bundle
- **Type:** discovery
- **Detail:** Using @sparticuz/chromium-min causes Vercel builds to fail on PDF generation
- **Files:** lib/pdf.ts, package.json
- **Rule:** Always use @sparticuz/chromium (full), never chromium-min for production
- **Scope:** cross-project
```

**Rules:**
- Read at session start (if exists)
- Write continuously in real-time, not batched at session end
- Max 150 lines — when exceeded, archive oldest entries to `session-notes-archive.md`
- Never delete entries — only archive
- Entries with `scope: cross-project` get promoted to `feedback_*.md` at session end (Module 09 feedback system)
- PreCompact hook MUST always exit 0 (never block compaction)

---

## 2. ATTENTION TIERS — HOT/WARM/COLD File Prioritization

Not all files deserve equal context injection. Tier them by relevance.

| Tier | Criteria | Injection Level |
|------|----------|----------------|
| **HOT** | Touched in last 5 interactions | Full content loaded |
| **WARM** | Mentioned but not edited recently | Headers, function signatures, exports only |
| **COLD** | Not referenced in current session | Skip entirely |

**Tier assignment logic:**
```
For each file in project:
  IF edited in last 5 tool calls → HOT
  ELSE IF mentioned in last 15 messages → WARM
  ELSE → COLD
```

**Re-evaluation:** Every 10 interactions, re-tier all files.

**Token savings:** On a 50-file project, this typically reduces context injection by 60-70% compared to loading all relevant files fully.

**Rules:**
- HOT files: max 10 simultaneously (prevent context overflow)
- WARM files: load only the first 20 lines (signatures/exports)
- COLD files: never load unless user explicitly asks
- New files mentioned by user always start as HOT

---

## 3. INSTINCTS — Always-On Behavioral Rules

Instincts are persistent behavioral rules that fire on pattern recognition, separate from skills (which are task-specific).

**Storage:** `~/.claude/Memory/instincts.md`

**Format:**
```
## Instinct: [short name]
- **Rule:** [what to always do or never do]
- **Why:** [the reason this instinct exists]
- **Added:** [date]
- **Source:** [user correction / discovered pattern / cross-project learning]
```

**Default instincts (ship with AutoLearning):**
1. Always search for existing implementations before writing new code
2. Always run tests before claiming a task is complete
3. Never modify auth, payment, or security code without flagging it
4. Always check if a skill exists for the current task type before building from scratch
5. Read the file before editing it — never edit blind

**Rules:**
- Loaded at session start (always, even for Solo mode)
- Max 15 instincts — more than that means some should be skills instead
- Instincts can be added via Module 09 learning (cross-project patterns that appear 3+ times)
- User can add/remove instincts manually
- Instincts OVERRIDE skill instructions when they conflict

---

## 4. SESSION RECALL — Cross-Session Continuity (from session-notes.md)

Enable starting a new session and restoring context from a previous one.

**At session end (automatic):**
```
Append to session-notes.md:
## [YYYY-MM-DD HH:MM] — SESSION RECALL
- **Type:** state
- **Detail:** Session complete. Project: [name], Branch: [git branch]
- **Files:** [files touched]
- **Rule:** Next session: [what to do next if resuming]
- **Scope:** project
```

**At session start (when user requests):**
- User says "continue from last session" or "resume" or "where was I?"
- Read session-notes.md, find most recent state entry
- Load: project context, branch, files touched, next step
- Announce: "Resuming from [date]: [task]. Next step: [action]."

**Rules:**
- Session entries are lightweight
- Keep last 20 sessions in session-notes.md, archive older ones to session-notes-archive.md
- Session recall is a SUGGESTION — always verify state before building on it
- If recalled state conflicts with current git state, trust git

---

## 5. BRANCH-AWARE MEMORY

Different git branches represent different work contexts. Memory should follow.

**At session start:**
```bash
BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
BRANCH_MEMORY="~/.claude/Memory/branches/${BRANCH}.md"
```

**If branch memory file exists:** Load it alongside main memory files.
**If not:** Create it on first write for this branch.

**What goes in branch memory:**
- Decisions specific to this feature/branch
- Temporary patterns that don't apply to main
- Known issues being worked on in this branch
- Acceptance criteria for the branch's PR

**Branch lifecycle:**
- Branch created → empty branch memory
- Work progresses → branch memory accumulates context
- PR merged → merge relevant entries into main memory, archive branch file
- Branch deleted → archive branch memory file

**Rules:**
- main/master branch uses default memory (no separate branch file)
- Branch memory is ADDITIONAL, not replacement — main memory always loads
- Max 50 lines per branch memory file

---

## 6. THEORY DOCUMENT — Architectural Understanding

A living `.claude/THEORY.md` that explains WHY the codebase is structured the way it is.

**Sections:**
```markdown
# Project Theory — [Project Name]

## Architecture Rationale
Why is the code organized this way? What pattern does it follow?

## Key Decisions
Major technical choices and the reasoning behind them.

## Trade-offs
What was sacrificed and what was gained in major decisions.

## Gotchas
Things that look wrong but are intentional. Things that will bite you.

## Conventions
Unwritten rules that the codebase follows.
```

**When to update:**
- After making architectural changes
- After discovering a non-obvious codebase convention
- After a user explains WHY something is done a certain way
- After a refactor that changes project structure

**Rules:**
- Read at session start for project-level context
- Update incrementally — never rewrite the whole thing
- Keep under 100 lines — link to detailed docs instead of inlining
- Theory is descriptive (what IS), not prescriptive (what SHOULD BE)
- Only exists for projects where Claude has enough context to maintain it

---

## 7. INTEGRATION WITH WORKFLOW

| Context | What loads |
|---------|-----------|
| Session start (always) | §1 session-notes (read), §3 instincts (read), §4 recall (check) |
| Session start (project) | §5 branch memory, §6 theory doc |
| During work | §1 session-notes (write), §2 attention tiers (evaluate) |
| Pre-compaction | §1 session-notes (write via hook) |
| Session end | §4 session recall (write entry to session-notes) |
| Post-merge | §5 merge branch memory to main |

---

## 8. ANTI-PATTERNS

- Writing to session-notes only at session end — defeats the purpose; write in real-time
- Loading all memory files regardless of relevance — use attention tiers
- Instincts that are too specific to one project — those should be skills, not instincts
- Theory documents that describe HOW instead of WHY — how is in the code, why is in theory
- Branch memory files larger than 50 lines — you're storing too much detail
- Ignoring recalled session state without verifying — always check git before trusting recall
- More than 15 instincts — that's a skill system, not instincts

---

## 9. JIT CONTEXT BRACKETS

Adapt how much context is injected based on remaining session capacity. Inspired by CARL's context bracket system.

**Three brackets:**

| Bracket | Condition | Injection Strategy |
|---------|-----------|-------------------|
| **FRESH** | Session start, < 10 turns | Full injection: all instincts, full session-notes, full feedback files, theory doc |
| **MODERATE** | 10-25 turns | Selective injection: instincts (always), session-notes (last 10 entries), feedback (headers only) |
| **DEPLETED** | > 25 turns OR approaching context limit | Minimal injection: instincts only (they're the most distilled rules). Everything else via on-demand Read. |

**How to detect bracket:**
```
IF session just started OR turn_count < 10:
  bracket = FRESH
ELIF turn_count < 25 AND no compaction triggered:
  bracket = MODERATE
ELSE:
  bracket = DEPLETED
```

**What changes per bracket:**

```
FRESH (full power):
  - Load: instincts.md (full)
  - Load: session-notes.md (full, up to 150 lines)
  - Load: relevant feedback_*.md (full)
  - Load: branch memory (if exists)
  - Load: theory doc (if exists)
  - Load: routing-overrides.md

MODERATE (selective):
  - Load: instincts.md (full — always loaded, non-negotiable)
  - Load: session-notes.md (last 10 entries only)
  - Reference: feedback_*.md (don't load — read on-demand if topic arises)
  - Reference: branch memory (headers only)
  - Skip: theory doc (read on-demand)

DEPLETED (survival mode):
  - Load: instincts.md (full — the 12 rules ARE the system at this point)
  - Skip: everything else (use Read tool on-demand when needed)
  - Recommend: "Session is long. Consider /compact or starting fresh."
```

**Why this matters:** Loading 5 memory files (instincts + session-notes + 2 feedback + routing-overrides) costs ~2-3K tokens. In a depleted session, that's 3K tokens stolen from the actual task. JIT brackets ensure memory investment scales with session capacity.

**Integration:** Module 04 §1 (Session Start) uses the bracket to decide what to load. Module 15 §2 (Attention Tiers) operates within the bracket's constraints.
- Forgetting to promote cross-project entries from session-notes to feedback files — cross-project learning requires action
