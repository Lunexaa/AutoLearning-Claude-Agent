# MODULE 10 — BRAINSTORM ENGINE
# Loaded for: BUILD tasks with 4+ files (JARVIS Lite + Full JARVIS)

---

## 1. MODE SELECTION

| Task type | Mode | Agents |
|---|---|---|
| Backend/API/DB (no UI) | **MODE A: Standard** | 3 agents |
| UI/website/landing page | **MODE B: Design Tribunal** | 6 agents |
| Backend architecture/infra | **MODE C: Backend Tribunal** | 5 agents |
| Spec/PRD/design doc/architecture | **MODE D: Adversarial Spec** | 3 agents |

---

## 1b. REFERENCE-FIRST DEVELOPMENT (all modes)

Before ANY brainstorm mode starts, agents must research first:

```
REFERENCE SEARCH (parallel, 2 agents):

Agent R1 (sonnet): GITHUB SCOUT
  "Search GitHub for 3+ high-quality implementations of [task type].
   Look for: repos with 500+ stars, recent activity, clean architecture.
   Return: top 3 repos with URLs, what they do well, what to steal."

Agent R2 (sonnet): PATTERN SCOUT
  "Search for design patterns and best practices for [task type].
   Check: Awwwards/Godly (if visual), official docs, architecture guides.
   Return: top 3 patterns with examples, common pitfalls to avoid."
```

**Output:** Reference brief (50 words max) injected into every brainstorm agent's prompt:
```
"Reference context: [GitHub examples found]. [Patterns identified].
 Build on proven patterns — don't reinvent."
```

**Token budget:** 2 agent spawns (both sonnet). Runs BEFORE mode A/B/C/D.

**Skip when:**
- Task is project-specific (internal refactor, bug fix)
- You already have high-confidence knowledge of the domain
- Solo mode (≤3 files — not worth the overhead)

---

## 2. MODE A: STANDARD BRAINSTORM (3 agents)

Spin up in ONE message:

```
Agent A: ARCHITECT (opus)     → structure, scalability, risks
Agent B: CREATIVE (opus)      → innovation, UX, differentiation
Agent C: PRAGMATIST (sonnet)  → speed, reuse, what can go wrong
```

**Selection:** 2/3 agree → proceed. All disagree → present top 2 to user.

---

## 3. MODE B: DESIGN TRIBUNAL (6 agents)

**Trigger:** Task involves UI, landing page, website, dashboard, or visual output.

Spin up 6 design perspectives in ONE message:

```
Agent 1: MINIMALIST (opus)
  → Restraint, whitespace, typography-as-hero, editorial feel

Agent 2: BRUTALIST (opus)
  → Bold, rule-breaking, asymmetry, oversized, stop-scroll

Agent 3: LUXURY (opus)
  → Premium, cinematic, rich textures, dark+gold

Agent 4: CONVERSION HAWK (sonnet)
  → CTA placement, value prop in 3s, trust signals, mobile thumbs

Agent 5: TREND SCOUT (sonnet)
  → Top 3 current trends, reference Awwwards/Godly, specific techniques

Agent 6: RED TEAM (sonnet)
  → Find fatal flaws in ALL proposals. "Why will this fail?"
```

**Judge protocol:** Main agent scores each on: impact (1-5), uniqueness (1-5), feasibility (1-5), conversion (1-5). Build hybrid from best elements. **NEVER pick one wholesale.**

---

## 4. MODE C: BACKEND TRIBUNAL (5 agents)

**Trigger:** Task is backend-heavy — API, database, microservices, infra.

Spin up 5 perspectives in ONE message:

```
Agent 1: SCALE ARCHITECT (opus)
  → Horizontal scaling, caching layers, query optimization

Agent 2: SECURITY HAWK (sonnet)
  → Attack vectors, auth flaws, data exposure, RLS gaps

Agent 3: DX ADVOCATE (sonnet)
  → Developer experience, API ergonomics, error messages, docs

Agent 4: COST OPTIMIZER (sonnet)
  → Minimize DB queries, avoid N+1, serverless vs always-on

Agent 5: RED TEAM (sonnet)
  → "What breaks at 10x scale? What's the single point of failure?"
```

**Judge protocol:** Same as Design Tribunal — hybrid from best elements.

---

## 4b. MODE D: ADVERSARIAL SPEC REFINEMENT

**Trigger:** Task involves creating a specification, PRD, technical design, or architecture document.

Spin up 3 spec agents in ONE message:

```
Agent 1: SPEC AUTHOR (opus)
  → Write the initial spec based on user requirements and reference context.
  → Be comprehensive: cover scope, non-scope, edge cases, success criteria.

Agent 2: SPEC CRITIC (sonnet)
  → Review the spec. Find: ambiguities, missing edge cases, untestable requirements,
    unrealistic assumptions, scope creep risks, missing success metrics.
  → Be adversarial — assume the spec will be implemented by someone who takes
    every ambiguity in the worst possible direction.

Agent 3: SPEC DEFENDER (sonnet)
  → Review the critic's objections. For each:
    → If valid: propose specific fix
    → If invalid: explain why the original spec is sufficient
  → Produce final revised spec incorporating valid critiques.
```

**Iteration rule:** Maximum 1 round of critique→defense. The Defender's output is the final spec.

**Output:** Refined specification with:
- All ambiguities resolved
- Edge cases documented
- Success criteria that are testable
- Scope explicitly bounded (what's IN and what's OUT)

**Token budget:** 3 agent spawns (1 opus + 2 sonnet)

---

## 5. USER PERSONA INJECTION (all modes)

Before brainstorm starts, inject a 1-sentence persona into every agent's prompt:

```
"The end user is: [persona from brief or inferred].
Every proposal must work for THIS person, not for developers."
```

If no persona available, use: "a non-technical user who wants to accomplish their goal in under 30 seconds."

---

## 6. DEVIL'S ADVOCATE (Round 2)

**Trigger:** ONLY when Round 1 confidence < 80% OR top 2 approaches score within 2 points.

After Round 1 selects an approach, spin up:

```
Agent: DEVIL'S ADVOCATE (opus)
  "Here is the selected approach: [brief]. Your ONLY job is to
   find the fatal flaw. What will go wrong? What did the team miss?
   Be specific — name the file, the edge case, the user scenario."
```

**If Devil's Advocate finds a critical flaw:** Revise the approach to address it, then proceed.
**If no critical flaw found:** Proceed with higher confidence.

**HARD RULE:** Maximum 1 refinement round. Never loop.

---

## 7. TOKEN BUDGET

- Reference-First Development: max 2 agent spawns (runs before all modes)
- Standard brainstorm (Mode A): max 3 agent spawns
- Design Tribunal (Mode B): max 6 agent spawns + 1 optional (Devil's Advocate)
- Backend Tribunal (Mode C): max 5 agent spawns + 1 optional
- Adversarial Spec (Mode D): max 3 agent spawns
- Round 2 refinement: max 1 agent spawn
- **Total brainstorm budget: never exceed 9 agent spawns per task** (including reference-first)
- Use sonnet for all non-strategic agents (Conversion Hawk, Trend Scout, Red Team, DX Advocate, Cost Optimizer)
- Use opus ONLY for creative/architectural perspectives (Minimalist, Brutalist, Luxury, Scale Architect, Devil's Advocate)
