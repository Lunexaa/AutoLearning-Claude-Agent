# Global Instructions

## MEMORY PATH
All memory files are saved in: `~/.claude/Memory/`
NEVER save memory in project folders or `~/.claude/projects/`.

---

## ALWAYS ACTIVE AT SESSION START

Invoke the **workflow** skill (JARVIS v5.0) at the start of **every session**, before any task, regardless of what the user asks.

This is mandatory — not optional. Do not skip it, do not wait for the user to ask.

After loading `SKILL.md`:
- Run Section 0 (SESSION START) immediately
- Load `modules/04-session.md` to check for incomplete work
- Route via INTENT → AUTO-ROUTE → SKILL COMPLIANCE GATE
- Activate **JARVIS PROTOCOL** based on complexity:
  - Quick fix (≤3 files) → Solo, skip brainstorm
  - Feature (4-10 files) → JARVIS Lite (PHASE 1→3→4)
  - Website/large feature (10+ files) → Full JARVIS (all 5 phases: INTEL→BRAINSTORM→BUILD→REVIEW→DELIVER)
- **PHASE 2 DESIGN TRIBUNAL:** For ANY visual/design task → spin up 5 design agents (Minimalist, Brutalist, Luxury, Conversion Hawk, Trend Scout). Main agent judges and builds hybrid from best elements. Never pick one wholesale.
- **PHASE 4 REVIEW CHAIN is mandatory** — user never sees unreviewed work
- All agent phases run in PARALLEL (batch spawns in one message)

**Module references:**
- New project → `modules/08-skills.md` Section D
- Need a new skill → `modules/08-skills.md` Section B
- Uncertain → return to PLAN (01-planning)
- Session end → `modules/07-self-monitor.md`

---

## SKILL COMPLIANCE GATE (always enforced — blocks code execution)

When auto-routing matches a skill, you MUST **read and obey** that skill's structural rules BEFORE writing any code. This is not optional.

**The sequence is:**
1. Auto-route detects matching skill (e.g. `Landingpage`, `Hemsida`, `nextjs-crm`)
2. **READ the skill's SKILL.md** — extract folder structure, required components, mandatory elements (branded footer, content separation, step flow)
3. **Follow the skill's step flow** — if the skill defines STEP 0→8, execute every step in order
4. Only then write code — using the skill's architecture, not your own

**NEVER:**
- Load a skill but ignore its folder structure
- Skip a skill's step flow because "it's faster to just code it"
- Build a monolith page.tsx when the skill requires section-per-file
- Forget mandatory elements (branded footer, content separation)

**This rule overrides speed/convenience.** A correct build following the skill takes longer but produces the right result. A fast build ignoring the skill creates rework.

---

## REFERENCE-FIRST DEVELOPMENT (always enforced for builds)

Before writing code for any BUILD task, JARVIS must search for references:
- 2 parallel agents search GitHub + design patterns
- Reference brief injected into brainstorm agents
- Skip only for: internal refactors, bug fixes, Solo mode (≤3 files)

This prevents reinventing the wheel and anchors builds in proven patterns.

---

## TERMINAL VERIFICATION (always enforced)

Every completed task must have **fresh terminal output** proving it works:
- `npm run build` → exit code 0
- `npm test` → exit code 0
- Show ACTUAL output, not "I believe it passes"

Hedging language ("should work", "looks correct") FAILS this gate.
Only concrete proof passes: "Build passed: ✓ Compiled successfully"

---

## AUTONOMOUS MODE (opt-in only)

When user explicitly says "run autonomous" / "build everything" / "I trust you, go":
- Pre-flight checklist must pass (plan exists, rollback ready, scope bounded)
- Execute with safety limits: max 50 iterations, checkpoint every 5 items
- Circuit breakers auto-stop on: 3 same errors, scope drift, security files touched
- Load `modules/14-autonomous.md` for full protocol

**Never auto-activate.** Autonomy is granted, not assumed.

---

## PARALLEL TOOL RULE (always enforced)

When multiple tool calls are independent — batch ALL in ONE message.
Never serialize what can be parallelized.
