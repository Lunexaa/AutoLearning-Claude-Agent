# Global Instructions

## MEMORY PATH
All memory files are saved in: `~/.claude/Memory/`
NEVER save memory in project folders or `~/.claude/projects/`.

---

## ALWAYS ACTIVE AT SESSION START

Invoke the **workflow** skill (AutoLearning Claude Agent) at the start of **every session**, before any task, regardless of what the user asks.

This is mandatory — not optional. Do not skip it, do not wait for the user to ask.

After loading `SKILL.md`:
- Run Section 0 (SESSION START) immediately
- Route via INTENT → AUTO-ROUTE → SKILL COMPLIANCE GATE
- Activate **AutoLearning Protocol** based on complexity:
  - Quick fix (≤3 files) → Solo
  - Feature (4-10 files) → AutoLearning Lite (PHASE 1→3→4)
  - Website/large feature (10+ files) → Full AutoLearning (all phases)
- **PHASE 2 DESIGN TRIBUNAL:** For visual tasks → 6-8 design agents + Accessibility Advocate
- **PHASE 4 REVIEW CHAIN is mandatory** — user never sees unreviewed work
- All agent phases run in PARALLEL (batch spawns in one message)
- See SKILL.md for full phase details — do NOT duplicate rules here

**Module references:**
- New project → `modules/08-skills.md` Section D
- Session end → `modules/07-self-monitor.md`

---

## SKILL COMPLIANCE GATE (always enforced — blocks code execution)

When auto-routing matches a skill, you MUST **read and obey** that skill's structural rules BEFORE writing any code. This is not optional.

**The sequence is:**
1. Auto-route detects matching skill (e.g. `Landingpage`, `Hemsida`, `nextjs-crm`)
2. **READ the skill's SKILL.md** — extract folder structure, required components, mandatory elements (branded footer, content separation, step flow)
3. **Follow the skill's step flow** — if the skill defines STEG 0→8, execute every step in order
4. Only then write code — using the skill's architecture, not your own

**NEVER:**
- Load a skill but ignore its folder structure
- Skip a skill's step flow because "it's faster to just code it"
- Build a monolith page.tsx when the skill requires section-per-file
- Forget mandatory elements (branded footer, content separation)

**This rule overrides speed/convenience.** A correct build following the skill takes longer but produces the right result. A fast build ignoring the skill creates rework.

---

## REFERENCE-FIRST DEVELOPMENT (always enforced for builds)

Before writing code for any BUILD task, AutoLearning must search for references:
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

When user explicitly says "run autonomously" / "build everything" / "I trust you, go":
- Pre-flight checklist must pass (plan exists, rollback ready, scope bounded)
- Execute with safety limits: max 50 iterations, checkpoint every 5 items
- Circuit breakers auto-stop on: 3 same errors, scope drift, security files touched
- Load `modules/14-autonomous.md` for full protocol

**Never auto-activate.** Autonomy is granted, not assumed.

---

## CONSTITUTION (highest authority — if .claude/CONSTITUTION.md exists)

If the project has a `.claude/CONSTITUTION.md` file, its rules override ALL other instructions.
Authority hierarchy: CONSTITUTION > CLAUDE.md > SKILL.md > individual skills > agents.
The constitution defines immutable project laws that cannot be overridden by any skill or agent.
Example constitutional rules: "Never delete user data", "All API responses must include request-id", "Test coverage must never decrease".

---

## BASE-AGENT INHERITANCE (reduces agent duplication)

All agents inherit common behaviors from `~/.claude/agents/BASE-AGENT.md` (if it exists).
BASE-AGENT.md defines: default response format, error handling patterns, tool usage rules.
Individual agent files OVERRIDE base behaviors where they differ.
This reduces duplication across 310+ agents by ~57%.

---

## PARALLEL TOOL RULE (always enforced)

When multiple tool calls are independent — batch ALL in ONE message.
Never serialize what can be parallelized.
