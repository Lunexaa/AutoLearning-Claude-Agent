# MODULE 08 — SKILL SYSTEM & PROJECT INIT
# Loaded for: NEW_PROJECT, skill creation/update tasks

---

## A. SKILL INDEX — always read ROADMAP first

Never read skill files directly without checking the index.

1. Read `~/.claude/ROADMAP.md`
2. Find matching skill
3. **Confidence check:** 80%+ sure it's right?
   - Yes → read only that skill file
   - No → read max 2 candidates, pick most specific
4. Conflict (2+ match) → most specific = primary, other = complement (1 section only)
5. No match → Section B (create new skill)
6. Match but missing something new → Section C (update skill)

Purpose: load only what's needed. Context is finite.

---

## B. CREATE NEW SKILL

**Mandatory: search the web BEFORE writing anything.**

1. Formulate 2-3 specific search queries
2. Validate against ≥2 independent sources
3. Extract concrete facts, patterns, common mistakes
4. Create `~/.claude/skills/<name>/SKILL.md`:
   - Frontmatter with `name` (lowercase, hyphens only), `description` (trigger phrases critical for discovery)
   - Max 500 lines for optimal loading performance
   - Reference content one level deep (not nested)
   - High freedom (prose) for contextual decisions · Low freedom (exact scripts) for fragile operations
5. Immediately add row to `~/.claude/ROADMAP.md` in correct category

Do NOT create if search fails — ask the user instead.
Do NOT create for something already in ROADMAP.

---

## C. UPDATE EXISTING SKILL

**Rule: NEVER rewrite. ONLY append at the end.**

When applies:
- Building something new within a skill's domain
- User provides new facts/techniques missing from the skill
- Better pattern discovered during work

**Age check:** Topic moves fast (AI, SEO, frameworks) and file is 90+ days old → quick web search to verify core content still accurate before acting on it.

**Append format:**
```markdown
---
## [TOPIC] — Added [YYYY-MM-DD]
[New information — concrete, fact-based]
```

Update ROADMAP.md "What it does" if addition is significant.

---

## D. PROJECT INIT

Run when user says "new project", "start project", "init project", "start building":

```
~/Desktop/Agent/Projekt/<ProjectName>/
  Source/    ← Code, files, assets
  Docs/      ← Design, roadmap, task logs
  Logs/      ← JSON logs and KPIs
  Context/   ← Compressed context (chunk_001.json...)
```

Create:
- `Docs/ROADMAP.md` — project name, date, goal, Phase 1 tasks, DoD
- `Docs/todo.md` — first sprint tasks with MoSCoW labels
- `tasks/workflow-log.md` — empty, ready for session adherence logging

Then run **Section A** to find relevant skills for the project.

---

## Anti-patterns:
- Reading skill files without checking ROADMAP first — context waste
- Rewriting an entire skill — only append
- Creating a skill for something already in ROADMAP
- Creating a skill without internet research
- Adding a skill without updating ROADMAP.md
- Skill name with uppercase or spaces (must be lowercase-hyphens)
