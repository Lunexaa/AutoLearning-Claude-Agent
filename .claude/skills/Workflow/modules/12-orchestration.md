# MODULE 12 — ORCHESTRATION & RESILIENCE
# Loaded for: Full JARVIS (10+ files) only
# Handles: progress, rollback, context compression, hot-swap, session continuity

---

## 1. PROGRESS STREAMING

During multi-phase JARVIS execution, emit status after each phase:

```
[JARVIS] PHASE 1/5: Intel complete — 3 agents returned, brief ready
[JARVIS] PHASE 2/5: Design Tribunal — 6 proposals scored, hybrid brief selected
[JARVIS] PHASE 3/5: Building — 4 files created, 2 modified
[JARVIS] PHASE 4/5: Quality gates — build ✅, tests ✅, a11y ✅, perf ✅
[JARVIS] PHASE 4/5: Agent review — code 8/10, design 9/10, security clean
[JARVIS] PHASE 5/5: Delivering result
```

**Rules:**
- One line per phase, not per agent
- Never explain the internal process in detail — user doesn't care that 6 agents debated
- If a phase takes >30 seconds, emit mid-phase: `[JARVIS] PHASE 3: building... 2/4 components done`

---

## 2. ROLLBACK PROTOCOL

Before PHASE 3 (BUILD) starts, create a checkpoint:

```bash
git stash push -m "jarvis-checkpoint-$(date +%s)" 2>/dev/null || true
```

**Rollback triggers:**
- Phase 4 quality gate fails 3 times on same issue
- Compound error detected (fixing a fix of a fix)
- User says "start over" or "det blev fel"

**Rollback action:**
```bash
git stash pop  # Restore to pre-build state
```

Then: Return to Phase 2 and select the SECOND-BEST approach from brainstorm. Never retry the same approach.

**HARD RULE:** Maximum 1 rollback per task. If second attempt also fails → escalate to user with diagnosis.

---

## 3. CONTEXT HANDOFF COMPRESSION

Between JARVIS phases, compress output to minimal brief:

**Phase 1 → Phase 2 handoff:**
```
INTEL BRIEF: [task] for [who]. Skill rules: [list].
Project context: [1 sentence]. Key constraint: [1 sentence].
```
Max 50 words. NOT the full agent output.

**Phase 2 → Phase 3 handoff:**
```
DESIGN BRIEF: Direction [style]. Palette [colors]. Typography [fonts].
Layout [pattern]. CTA [placement]. Technique [specific].
Files to create: [list]. Skill rules: [checklist].
```
Max 80 words.

**Phase 3 → Phase 4 handoff:**
```
BUILD REPORT: Created [N] files, modified [N] files.
Files: [paths]. Stack: [framework+libs].
User requirements covered: [checklist].
```
Max 60 words.

**Rule:** Agents return full output. Main agent COMPRESSES before passing to next phase. The full output stays in main context but is NOT forwarded to next-phase agents.

---

## 4. HOT-SWAP AGENTS

If an agent returns low-quality output (< 2/5 score or clearly off-topic):

1. Do NOT retry the same agent
2. Identify the closest alternative agent from the 310-agent roster
3. Spawn the replacement with the same prompt + note: "Previous agent returned poor output. Focus on [specific gap]."

**Swap map (common replacements):**
| Failed agent | Swap to |
|---|---|
| `frontend-developer` | `react-specialist` or `nextjs-developer` |
| `ui-designer` | `frontend-designer` or `design-system-architect` |
| `code-reviewer` | `typescript-reviewer` |
| `architect` | `clean-architecture-expert` |

**HARD RULE:** Maximum 1 swap per agent role per task. If swap also fails → do it yourself (Solo).

---

## 5. SESSION CONTINUITY

If a JARVIS run spans multiple sessions (context limit hit), write state:

```markdown
<!-- tasks/jarvis-state.md -->
## JARVIS State — [timestamp]
- **Task:** [original user request]
- **Current phase:** PHASE [N]
- **Completed phases:** [list with key outputs]
- **Design brief:** [if Phase 2 complete, paste compressed brief]
- **Files created so far:** [list]
- **Files remaining:** [list from plan]
- **Quality gate status:** [which passed, which pending]
- **Rollback available:** [yes/no, stash ref]
```

**Next session:** Module 04 (session.md) checks for `tasks/jarvis-state.md` → resumes from the correct phase, not from scratch.

**HARD RULE:** Never re-run completed phases. If Phase 1+2 are done and state is saved, next session starts at Phase 3.

---

## 6. TOKEN BUDGET PER PHASE

| Phase | Max agent spawns | Model mix | Estimated tokens |
|---|---|---|---|
| Phase 1: Intel | 3 | all sonnet | ~8K |
| Phase 2: Brainstorm | 5-7 | 2-3 opus + rest sonnet | ~20K |
| Phase 3: Build | 2-3 | 1 opus + rest sonnet | ~12K |
| Phase 4: Quality gates | 0 (automated) | — | ~0 |
| Phase 4: Agent review | 3 | all sonnet | ~10K |
| **Total Full JARVIS** | **13-16** | | **~50K** |

**Cost reduction rules:**
- JARVIS Lite skips Phase 2 → saves ~20K tokens
- Solo skips Phase 1+2+4 → saves ~38K tokens
- Automated quality gates (Module 11) replace 1-2 agent reviews when issues are caught early
- Use sonnet for ALL review agents — opus adds cost, not review quality
- Context handoff compression (Section 3) reduces per-agent input by ~40%
