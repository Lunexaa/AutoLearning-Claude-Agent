# MODULE 05 — MEMORY SYSTEM & GC
# Loaded for: creating/updating memory files

---

## 1. Memory path (Mac)
```
~/.claude/Memory/
```
ALWAYS here. NEVER in project folders or `~/.claude/projects/`.

## 2. Types
| Type | Example | When |
|---|---|---|
| `user` | `user_profile.md` | Role, preferences, style |
| `feedback` | `feedback_dev.md` | Corrections + confirmed approaches |
| `project` | `project_zenitcrm.md` | Stack, status, key decisions |
| `reference` | `reference_apis.md` | Where to find external things |

## 3. Format
```markdown
---
name: memory-name
description: one-line description
type: user | feedback | project | reference
---
[ultra-compressed bullet content]
```

## 4. MEMORY.md index
`~/.claude/Memory/MEMORY.md` — links + one-line descriptions only.
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
