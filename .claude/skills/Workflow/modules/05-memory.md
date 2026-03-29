# MODULE 05 — MEMORY SYSTEM & 3-TIER ARCHITECTURE
# Loaded for: creating/updating memory files

---

## 1. Memory path (Mac)
```
~/.claude/Memory/
```
ALWAYS here. NEVER in project folders or `~/.claude/projects/`.

---

## 2. 3-TIER ARCHITECTURE

Memory is organized into three tiers. Each tier serves a different time horizon and access pattern.

### Tier 1: WORKING (in-session, project-scoped)
**Purpose:** Active project state and recent decisions you need RIGHT NOW.
**Scope:** Per-project, cleared between projects (or kept in project .claude/ folder)
**Retention:** Current session + occasional cross-session review
**Files:**
- `project_*.md` — Stack, status, key technical decisions for a project
- `session-notes.md` — Live memory written during work + pre-compaction capture (Module 15 §1)
- Branch memory in `branches/[branch-name].md` (Module 15 §6)

**Access:** Loaded at session start for the active project.

### Tier 2: VAULT (persistent, cross-project rules)
**Purpose:** Rules, patterns, and user identity that apply ACROSS projects.
**Scope:** Global — applies to all future work
**Retention:** Permanent (never auto-deleted; user manually archives)
**Files:**
- `user_profile.md` — Who you are, your working style, preferences
- `feedback_*.md` — Dev patterns, design standards, token efficiency, communication style
- `instincts.md` — Behavioral rules that fire on pattern recognition (Module 15 §4)

**Access:** Loaded at session start, always.

### Tier 3: SIGNALS (learning data, analyzed offline)
**Purpose:** Routing intelligence and pattern discovery for future improvement.
**Scope:** Global — used to optimize skill matching and auto-generate instincts
**Retention:** Historical, decayed over time (older signals get half weight)
**Files:**
- `routing-signals.md` — Task execution scores (skill match quality, first-try success)
- `routing-overrides.md` — Learned route overrides discovered from signal analysis
- Pattern mining outputs (cross-project lessons, auto-generated instinct candidates)

**Access:** Loaded at session start for routing decisions. Analyzed at session end (Module 09 §11, §12).

---

## 3. File Format

All memory files (Tiers 1, 2, 3) follow this optional header:
```markdown
---
name: memory-name
description: one-line description
type: working | vault | signals
---
[ultra-compressed bullet content]
```

---

## 4. MEMORY.md Index

`~/.claude/Memory/MEMORY.md` — links + one-line descriptions organized by tier.
Max 200 lines. Update every time a file is created or changed.

---

## 5. GARBAGE COLLECTION RULES (mandatory)

### Auto-Merge before creating any new file:
1. Read `~/.claude/Memory/MEMORY.md`
2. Topic/project already exists → open that file and merge. Do NOT create duplicate.
3. Max 1 file per project · Max 1 file per feedback category

### Extreme Compression (all memory content):
- Bullets only — no narrative sentences
- Technical keywords + abbreviations
- No verbose headers
- Target: 50–70% token reduction vs. verbose originals

### GC trigger (rewrite entire file when ANY is true):
- File exceeds ~40 lines
- Content references completed/cancelled work
- Same fact appears in 2+ places

### GC steps:
1. Delete: outdated info, completed blockers, superseded decisions
2. Merge: duplicate facts into single bullets
3. Compress: maximally — every line earns its place
4. Update MEMORY.md description if needed

---

## 6. LESSONS→MEMORY PIPELINE

### Log format for `tasks/lessons.md`:
```
DATE: [YYYY-MM-DD]
WHAT: [what happened]
ROOT CAUSE: [why it really happened]
CATEGORY: logic_error | wrong_assumption | missing_verification | overengineering | tool_failure | drift
NEW RULE: [concrete rule to prevent recurrence]
SCOPE: project_only | cross_project
```

### Promotion rule:
`SCOPE: cross_project` → immediately write to relevant global memory:
- Dev/tech lesson → `feedback_dev.md`
- Behavior/communication → `feedback_communication.md`
- Project-specific → `project_[name].md`

This is how the system gets smarter across projects, not just within one.

### Rules:
- Patterns > incidents. One rule preventing 5 mistakes > 5 individual logs.
- Mistake made twice in same project = systemic failure. Fix the rule.
- Verify memory against current code before acting — memory decays.
- Do NOT save: code patterns, git history, debug fixes, anything in CLAUDE.md.
