# MODULE 10 — BRAINSTORM ENGINE
# Loaded for: BUILD tasks with 4+ files (JARVIS Lite + Full JARVIS)

---

## 1. MODE SELECTION

| Task type | Mode | Agents |
|---|---|---|
| Backend/API/DB (no UI) | **MODE A: Standard** | 3 agents |
| UI/website/landing page | **MODE B: Design Tribunal** | 6 agents |
| Backend architecture/infra | **MODE C: Backend Tribunal** | 5 agents |

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

- Standard brainstorm (Mode A): max 3 agent spawns
- Design Tribunal (Mode B): max 6 agent spawns + 1 optional (Devil's Advocate)
- Backend Tribunal (Mode C): max 5 agent spawns + 1 optional
- Round 2 refinement: max 1 agent spawn
- **Total brainstorm budget: never exceed 7 agent spawns per task**
- Use sonnet for all non-strategic agents (Conversion Hawk, Trend Scout, Red Team, DX Advocate, Cost Optimizer)
- Use opus ONLY for creative/architectural perspectives (Minimalist, Brutalist, Luxury, Scale Architect, Devil's Advocate)
