# MODULE 10 — BRAINSTORM ENGINE
# Loaded for: BUILD tasks with 4+ files (AutoLearning Lite + Full AutoLearning)

---

## MODE SELECTION TABLE

| Task type | Mode | Agents |
|---|---|---|
| Backend/API/DB (no UI) | **MODE A: Standard** | 4 agents |
| UI task, ≤5 files | **MODE B-LITE: Design Duet** | 3 agents |
| UI/website/landing page, 5+ files | **MODE B: Design Tribunal** | 8 agents |
| Backend architecture/infra | **MODE C: Backend Tribunal** | 6 agents |
| Spec/PRD/design doc | **MODE D: Adversarial Spec** | 3 agents |
| Mobile/Data/API/Security domain | **MODE E: Domain-Specific** | 3 agents |

---

## CONSTRAINT INJECTION (before any brainstorm mode)

Before spawning brainstorm agents, check for hard constraints:

**Examples:**
- "Must work without JavaScript" → all proposals must be SSR/static
- "Mobile-first only" → desktop is secondary
- "100KB JS budget" → extreme simplicity required
- "Colorblind-safe" → specific palette rules
- Budget/timeline constraints from user

**Implementation:**
If constraints exist: inject into EVERY agent's prompt:
```
"Hard constraint: [X]. ALL proposals MUST satisfy this.
Proposals violating constraints are automatically rejected."
```

If no constraints: proceed normally.

**Budget:** 0 tokens (directive only, no agent spawn).

---

## MODE A: STANDARD BRAINSTORM (4 agents)

**Trigger:** Backend/API/database tasks with no UI component.

Spin up in ONE message:

```
Agent 1: ARCHITECT (opus)
  → Structure, scalability, risks
  → Reference context: [GitHub + patterns brief]

Agent 2: CREATIVE (opus)
  → Innovation, UX, differentiation
  → Reference context: [GitHub + patterns brief]

Agent 3: PRAGMATIST (sonnet)
  → Speed, reuse, what can go wrong
  → Reference context: [GitHub + patterns brief]

Agent 4: USER ADVOCATE (sonnet)
  → "You ARE the end user: [persona].
     After hearing proposals, which ONE would you pick? Why?
     What confuses you? What makes you trust or distrust?"
```

**Reference context:** Inject brief summaries from GitHub examples + patterns into each agent's context.

**Selection:** 2/3 core agents agree → proceed. All disagree → present top 2 to user.

---

## MODE B-LITE: DESIGN DUET (3 agents)

**Trigger:** UI task but scope ≤ 5 files OR user says "quick design".

Spin up in ONE message:

```
Agent 1: MINIMALIST (opus)
  → Restraint, whitespace, typography-as-hero, editorial feel
  → Reference context: [GitHub + patterns brief]

Agent 2: CONVERSION HAWK (sonnet)
  → CTA placement, value prop in 3s, trust signals, mobile thumbs
  → Reference context: [GitHub + patterns brief]

Agent 3: USER ADVOCATE (sonnet)
  → "You ARE the end user: [persona].
     After hearing proposals, which ONE would you pick? Why?"
```

**Judge protocol:** Same rubric as Mode B but faster. Score and hybrid from best elements.

**Budget:** 3 agent spawns.

---

## MODE B: DESIGN TRIBUNAL (8 agents)

**Trigger:** Task involves UI, landing page, website, dashboard, or visual output (5+ files).

Spin up 8 perspectives in ONE message:

```
Agent 1: MINIMALIST (opus)
  → Restraint, whitespace, typography-as-hero, editorial feel
  → Reference context: [GitHub + patterns brief]

Agent 2: BRUTALIST (opus)
  → Bold, rule-breaking, asymmetry, oversized, stop-scroll
  → Reference context: [GitHub + patterns brief]

Agent 3: LUXURY (opus)
  → Premium, cinematic, rich textures, dark+gold
  → Reference context: [GitHub + patterns brief]

Agent 4: CONVERSION HAWK (sonnet)
  → CTA placement, value prop in 3s, trust signals, mobile thumbs
  → Reference context: [GitHub + patterns brief]

Agent 5: TREND SCOUT (sonnet)
  → Top 3 current trends, reference Awwwards/Godly, specific techniques
  → Reference context: [GitHub + patterns brief]

Agent 6: ACCESSIBILITY ADVOCATE (sonnet)
  → WCAG AA compliance, keyboard navigation, screen reader UX,
    mobile touch targets, color contrast, reduced motion support
  → Reference context: [GitHub + patterns brief]

Agent 7: USER ADVOCATE (sonnet)
  → "You ARE the end user: [persona].
     After hearing proposals, which ONE would you pick? Why?
     What confuses you? What makes you trust or distrust?"

Agent 8: RED TEAM (sonnet)
  → Find fatal flaws in ALL proposals. "Why will this fail?"
```

**Judge scoring rubric:**

```
IMPACT (weight: 40%)
  5 = Solves primary goal + enables secondary goals
  4 = Solves primary goal fully
  3 = Solves primary goal partially
  2 = Addresses edge case only
  1 = Doesn't move the needle

UNIQUENESS (weight: 25%)
  5 = Novel in industry
  4 = Unseen in 5 competitor audits
  3 = Well-executed borrowing from competitors
  2 = Direct copy
  1 = Generic/default

FEASIBILITY (weight: 20%)
  5 = < 3 days, existing components
  4 = 3-7 days, minor custom work
  3 = 1-2 weeks, moderate custom
  2 = 2+ weeks, high risk
  1 = Impossible with current stack

CONVERSION (weight: 15%)
  5 = Removes 3+ friction points
  4 = Removes 2 friction points
  3 = Removes 1 friction point
  2 = Neutral
  1 = Increases friction

Weighted score = (I × 0.40) + (U × 0.25) + (F × 0.20) + (C × 0.15)
Proceed if score > 3.5. Hybrid if top 2 within 0.5 points.
```

**Output:** Build hybrid from best elements. **NEVER pick one wholesale.**

---

## MODE C: BACKEND TRIBUNAL (6 agents)

**Trigger:** Task is backend-heavy — API, database, microservices, infra.

Spin up 6 perspectives in ONE message:

```
Agent 1: SCALE ARCHITECT (opus)
  → Horizontal scaling, caching layers, query optimization
  → Reference context: [GitHub + patterns brief]

Agent 2: SECURITY HAWK (sonnet)
  → Attack vectors, auth flaws, data exposure, RLS gaps
  → Reference context: [GitHub + patterns brief]

Agent 3: DX ADVOCATE (sonnet)
  → Developer experience, API ergonomics, error messages, docs
  → Reference context: [GitHub + patterns brief]

Agent 4: COST OPTIMIZER (sonnet)
  → Minimize DB queries, avoid N+1, serverless vs always-on
  → Reference context: [GitHub + patterns brief]

Agent 5: USER ADVOCATE (sonnet)
  → "You ARE the end user: [persona].
     After hearing proposals, which ONE would you pick? Why?"

Agent 6: RED TEAM (sonnet)
  → "What breaks at 10x scale? What's the single point of failure?"
```

**Judge protocol:** Score using rubric (adjust weights: Impact 40%, Uniqueness 15%, Feasibility 35%, Conversion 10%). Hybrid from best elements.

---

## MODE D: ADVERSARIAL SPEC REFINEMENT (3 agents)

**Trigger:** Task involves creating a specification, PRD, technical design, or architecture document.

Spin up 3 spec agents in ONE message:

```
Agent 1: SPEC AUTHOR (opus)
  → Write the initial spec based on user requirements.
  → Be comprehensive: cover scope, non-scope, edge cases, success criteria.
  → Reference context: [GitHub + patterns brief]

Agent 2: SPEC CRITIC (sonnet)
  → Review the spec. Find: ambiguities, missing edge cases, untestable requirements,
    unrealistic assumptions, scope creep risks, missing success metrics.
  → Assume worst-case implementation of every ambiguity.
  → Reference context: [GitHub + patterns brief]

Agent 3: SPEC DEFENDER (sonnet)
  → For each criticism:
    → If valid: propose specific fix
    → If invalid: explain why original spec is sufficient
  → Produce final revised spec incorporating valid critiques.
```

**Iteration rule:** Maximum 1 round of critique→defense. The Defender's output is final.

**Output:** Refined specification with all ambiguities resolved, edge cases documented, testable success criteria, and explicit scope boundaries.

**Budget:** 3 agent spawns (1 opus + 2 sonnet).

---

## MODE E: DOMAIN-SPECIFIC BRAINSTORM (3 agents)

**Trigger:** Task domain matches a specialized area not covered by A-D.

**Domain routing table:**

| Domain keyword | Agents |
|---|---|
| "mobile" / "iOS" / "Android" | Mobile-First (opus) + Offline-First (sonnet) + Touch UX (sonnet) |
| "data" / "pipeline" / "ETL" | Data Architect (opus) + Cost Optimizer (sonnet) + Simplicity Advocate (sonnet) |
| "API" / "REST" / "GraphQL" | REST Advocate (opus) + GraphQL Advocate (sonnet) + DX Advocate (sonnet) |
| "security" / "auth" | Attack Surface (opus) + Defense-in-Depth (sonnet) + Incident Response (sonnet) |

Each agent includes: "Reference context: [GitHub + patterns brief]"

**Selection:** 2/3 agree → proceed. All disagree → present top 2 to user.

**Budget:** 3 agents (all spawned in ONE message) + optional Challenger.

---

## CHALLENGER — Post-Selection Stress Test

**Trigger:** Always for Full AutoLearning Claude Agent. Skip for Lite/Solo modes.

After brainstorm selects an approach, spawn ONE agent:

```
Agent: CHALLENGER (sonnet)
  "The team selected this approach: [brief].
   Your ONLY job: find a FUNDAMENTAL flaw.

   Check these 5 dimensions:
   1. Scale: will it handle 10x load?
   2. Simplicity: is there a dramatically simpler way?
   3. Edge cases: what input breaks this?
   4. Architecture: does it conflict with existing patterns?
   5. Dependencies: does it rely on something fragile?

   If fatal flaw found: state it with evidence.
   If no flaw: say APPROVED."
```

**Decision:**

| Result | Action |
|--------|--------|
| Fatal flaw found | Revise approach, proceed |
| Minor concern | Log concern, proceed with mitigation |
| APPROVED | Proceed with high confidence |

**Budget:** 1 agent spawn (sonnet). Max 1 round — no loops.

---

## TOKEN BUDGET

- Mode A (Standard): max 4 agent spawns
- Mode B-Lite (Design Duet): max 3 agent spawns
- Mode B (Design Tribunal): max 8 agent spawns
- Mode C (Backend Tribunal): max 6 agent spawns
- Mode D (Adversarial Spec): max 3 agent spawns
- Mode E (Domain-Specific): max 3 agent spawns
- Challenger (post-selection): max 1 agent spawn (all modes)
- **Total brainstorm budget: never exceed 10 agent spawns per brainstorm task** (including Challenger)
- Use sonnet for tactical agents (Pragmatist, Conversion Hawk, Trend Scout, Red Team, DX Advocate, Cost Optimizer, User Advocate)
- Use opus for strategic/creative agents (Architect, Creative, Minimalist, Brutalist, Luxury, Scale Architect, Spec Author, domain-specific leads)

---

## SOCRATIC PRE-CODING INTERVIEW

Before Phase 2 brainstorm starts, measure task clarity via targeted questions.

**The 5 clarity questions:**
1. "What does success look like?" → acceptance criteria
2. "What should this NOT do?" → scope boundaries
3. "Who is the end user?" → persona (feeds into Constraint Injection + all modes)
4. "What existing code does this interact with?" → dependencies, integration points
5. "What's the biggest risk?" → pre-mortem, what could go wrong

**Clarity scoring:**
- Each answered question = +20 points
- Total clarity score: 0-100

| Clarity Score | Action |
|---|---|
| 80-100 | Proceed directly to brainstorm |
| 60-79 | Ask 1-2 follow-up questions on weakest areas |
| < 60 | Do NOT proceed — too many unknowns. Gather requirements first. |

**Implementation:** Main agent asks directly — no subagent spawn (0 tokens). Questions adapt to context.

**When to skip:**
- Solo mode (too small to justify)
- Bug fixes (the bug IS the specification)
- User explicitly says "just build it"
- Direct follow-up to previously clarified task
