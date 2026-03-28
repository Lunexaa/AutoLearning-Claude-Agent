---
name: workflow
description: JARVIS workflow v5.0 — autonomous multi-agent system. Tasks trigger parallel brainstorm → best approach selected → specialist agents build in parallel → multi-reviewer chain catches errors before user sees result. 533 skills, 310 agents, 7 MCP servers.
---

# JARVIS WORKFLOW v5.0

> You give me a task. I spin up agents that brainstorm, build, and quality-assure. You only see the finished result.

**MASTER FLOW:**

```
USER TASK
    ↓
SESSION START → INTENT → AUTO-ROUTE (skills + agents + MCP)
    ↓
SKILL COMPLIANCE GATE
    ↓
┌─── JARVIS PROTOCOL ──────────────────────────────────┐
│                                                        │
│  PHASE 1: INTEL (parallel)                             │
│  ├─ Research agent → best practices, competitors       │
│  ├─ Skill reader → extract all rules & constraints     │
│  └─ Memory loader → relevant project context           │
│                                                        │
│  PHASE 2: BRAINSTORM (parallel, 3 perspectives)        │
│  ├─ Architect agent → approach A (structure-first)      │
│  ├─ Creative agent → approach B (design-first)         │
│  └─ Pragmatist agent → approach C (speed-first)        │
│  → Auto-select best OR present top 2 to user           │
│                                                        │
│  PHASE 3: BUILD (parallel specialists)                 │
│  ├─ Frontend agent(s)                                  │
│  ├─ Backend agent(s)                                   │
│  └─ Design agent                                       │
│                                                        │
│  PHASE 4: REVIEW CHAIN (parallel, then gate)           │
│  ├─ Code reviewer → quality + patterns                 │
│  ├─ Security reviewer → vulnerabilities                │
│  ├─ Design reviewer → visual quality + wow factor      │
│  └─ ⛔ QUALITY GATE → all must pass before user sees   │
│                                                        │
│  PHASE 5: DELIVER                                      │
│  → Clean result to user                                │
│  → Log learnings to memory                             │
└────────────────────────────────────────────────────────┘
```

---

## MODULE LOADING RULES

Same as before — load ONLY what the task requires.

| Task type | Load |
|---|---|
| **All sessions** | This file (already loaded) |
| **Session start** | `modules/04-session.md` (selective knowledge priming) |
| **BUILD / BUG / URGENT** | `modules/01-planning.md` + `modules/02-execution.md` + `modules/03-verification.md` |
| **BUILD with brainstorm** | + `modules/10-brainstorm.md` (reference-first + brainstorm modes A-D) |
| **BUILD with UI** | + `modules/11-quality-gates.md` (8 automated gates incl. TDD + terminal verify) |
| **Full JARVIS (10+ files)** | + `modules/12-orchestration.md` (progress, rollback, handoff, hot-swap) |
| **Autonomous execution** | + `modules/14-autonomous.md` (ralph loop, safety limits, circuit breakers) |
| **REVIEW request** | `modules/03-verification.md` only |
| **Deep research task** | `modules/13-deep-research.md` (5-hop protocol, confidence scoring) |
| **New project / skill work** | `modules/08-skills.md` + BUILD modules |
| **Multi-sprint project** | + `modules/06-pm.md` |
| **Creating/updating memory** | `modules/05-memory.md` |
| **Session end** | `modules/09-learning.md` (skill maturity tracking) + `modules/07-self-monitor.md` |
| **RESEARCH / quick question** | No modules — answer directly |

**Rule:** Never load a module that isn't needed. Context is finite.

---

## 0. SESSION START (always run)

1. Read `~/.claude/Memory/MEMORY.md` → load only relevant memory files (max 2-3)
2. Read `~/.claude/Memory/routing-overrides.md` → apply learned routes before auto-routing
3. Read `modules/04-session.md` → check for incomplete `tasks/todo.md`
4. Silent Ruflo check if complex task: `ruflo doctor 2>/dev/null`

---

## 1. INTENT + AUTO-ROUTING

### Step 1: Detect intent

| User intent | Type | Action |
|---|---|---|
| New project | `NEW_PROJECT` | Load 08-skills + 06-pm + BUILD modules |
| Bug report | `BUG` | BUILD modules → 01-planning §BUG |
| Quick fix ≤2 steps | `URGENT` | Skip to PHASE 3 (solo, no brainstorm) |
| Feature / build | `BUILD` | Full JARVIS PROTOCOL |
| Code review | `REVIEW` | PHASE 4 only |
| Question | `RESEARCH` | Answer directly |
| Unclear | `UNCLEAR` | Clarify ONCE, then route |

### Step 2: Auto-route skills

Read ROADMAP.md → find matching skill → load it.

| Domain | Auto-load skill | Dispatch agent |
|---|---|---|
| **FRONTEND** | | |
| Build UI/pages/dashboards | `frontend-design` | `frontend-developer` |
| React/Next.js code | `frontend-patterns` + `react-best-practices` | `frontend-developer` |
| Component architecture | `composition-patterns` | — |
| shadcn blocks | `shadcn-blocks` | — |
| Tailwind/shadcn setup | `tailwind-v4-shadcn` | — |
| Animation/motion | `framer-motion` | — |
| Motion audit | `design-motion` | — |
| Dashboard/admin UI | `interface-design` | `ui-designer` |
| Design system | `design-system` | `ui-designer` |
| Forms + validation | `react-hook-form-zod` | — |
| Data fetching | `tanstack-query` | — |
| State management | `zustand-state-management` | — |
| Responsive layout | `responsive-web-design` | — |
| Performance/CWV | `web-performance-optimization` | — |
| A11y/UX audit | `web-design-guidelines` | — |
| Next.js/Turbopack | `nextjs-turbopack` | — |
| Landing page | `Landingpage` | `website-architect` |
| Full website | `Hemsida` | `website-architect` |
| **BACKEND** | | |
| API design | `api-design` | `api-designer` |
| SQL/Postgres | `postgres-patterns` | `database-reviewer` |
| CRM/Supabase/WhatsApp | `nextjs-crm` | — |
| **CODE QUALITY** | | |
| TS/JS changes | — | `typescript-reviewer` |
| Architecture | — | `architect` |
| Security | `security-review` | `security-reviewer` |
| Build failure | — | `build-error-resolver` |
| E2E testing | `e2e-testing` | `e2e-runner` |
| Refactoring | `coding-standards` | `refactor-cleaner` |
| **MARKETING** | | |
| Marketing/ads/CRO | `marketing` (→ sub-skill) | — |
| SEO | `seo` or specific `seo-*` | — |
| **AUTOMATION** | | |
| n8n workflows | `n8n-automation` (→ sub-skill) | — |
| Complex planning | `planning-with-files` | `planner` |
| Deep research | `deep-research` + `modules/13-deep-research.md` | — |
| Codebase onboarding | `codebase-onboarding` | — |

### Step 2b: SKILL COMPLIANCE GATE

When a skill is loaded, BEFORE any code:
1. READ the skill's SKILL.md — extract folder structure, mandatory elements, step flow
2. BUILD a compliance checklist
3. Only then proceed

Skills with hard structural requirements:

| Skill | MUST follow |
|---|---|
| `Landingpage` | Golden Folder, NO MONOLITH, `/content/`, BrandedFooter, 8-step flow, design quality standard |
| `Hemsida` | Golden Folder, NO MONOLITH, BrandedFooter on ALL pages, 9-step flow, design quality standard |
| `frontend-design` | Anti-AI-slop, bold direction, real images, no Inter/purple |
| `shadcn-blocks` | Check catalog before building custom |
| `nextjs-crm` | Prisma+Supabase, RLS, AES-256-GCM |

### Step 3: MCP servers (auto-used)

| Server | When |
|---|---|
| `ruflo` | Agent swarms |
| `supabase` | Any DB task |
| `playwright` | E2E/visual |
| `github` | PRs, issues |
| `meta-ads` | Meta campaigns |
| `firecrawl` | Web scraping |
| `google-search-console` | SEO data |

---

## 2. THE JARVIS PROTOCOL

This is the core differentiator. Instead of one agent working linearly, **multiple agents work in parallel at every phase.**

### When to activate JARVIS vs Solo

| Complexity | Approach |
|---|---|
| Quick fix, ≤3 files, low risk | **Solo** — skip to PHASE 3 directly |
| Feature, 4-10 files, medium risk | **JARVIS Lite** — skip PHASE 2 (brainstorm), do PHASE 1→3→4 |
| Website, large feature, new project, 10+ files | **Full JARVIS** — all 5 phases |
| Large well-defined task, user opts in | **Autonomous JARVIS** — Phase 1+2 interactive → Phase 3 autonomous (Module 14) → Phase 4+5 interactive |

### PHASE 1: INTEL (parallel agents, 15-30 sec)

Spin up in ONE message:

```
Agent 1: RESEARCHER
  "Research best practices for [task domain]. Check competitors.
   Use web search and firecrawl. Return: top 5 patterns, common
   mistakes to avoid, recommended approach."

Agent 2: SKILL READER
  "Read [matched skill SKILL.md]. Extract: folder structure,
   mandatory elements, step flow, quality gates. Return as
   checklist."

Agent 3: CONTEXT LOADER
  "Read project memory files + recent git history. Return:
   relevant decisions, patterns used, gotchas specific to
   this project."
```

**Reference-First** (for BUILD tasks): Also spin up 2 reference agents → `modules/10-brainstorm.md` §1b
```
Agent R1: GITHUB SCOUT → 3+ high-quality repos matching task type
Agent R2: PATTERN SCOUT → best practices, Awwwards/Godly refs (if visual)
```
Reference brief (50 words max) is injected into every Phase 2 agent's prompt.

**Plan Lock:** After intel is complete, produce a written PLAN before proceeding:
- List files to create/modify
- List skill rules that must be followed
- List success criteria
- **Do NOT write code until plan exists.** Phase 2 brainstorms ON the plan, not on code.

**Deep Research:** If task requires external knowledge → load `modules/13-deep-research.md` (5-hop protocol).

**Output:** Combined intel brief (1 paragraph) + reference brief + plan outline that informs PHASE 2.

### PHASE 2: BRAINSTORM → load `modules/10-brainstorm.md`

| Task type | Mode | Agents | Detail |
|---|---|---|---|
| Backend/API/DB | **Mode A: Standard** | 3 | Architect + Creative + Pragmatist |
| UI/website/design | **Mode B: Design Tribunal** | 6 | 5 design perspectives + Red Team |
| Backend architecture | **Mode C: Backend Tribunal** | 5 | Scale + Security + DX + Cost + Red Team |

All modes include: **User Persona injection** (end-user context in every agent prompt), **Devil's Advocate** round if confidence < 80%, max 1 refinement round.
Judge builds hybrid from best elements — never picks one wholesale.

### PHASE 3: BUILD (parallel specialists)

Route based on task domains. Spin up relevant agents in ONE message:

**Website/Landing page build:**
```
Agent: WEBSITE-ARCHITECT (opus, background)
  → Plans site structure, SITE-PLAN.md

Agent: UI-DESIGNER (opus, background)
  → Design direction, tokens, color/font/motion spec

Then sequentially:
Agent: FRONTEND-DEVELOPER (sonnet)
  → Implements using both plans
```

**Full-stack feature:**
```
Agent: DATABASE (sonnet, worktree)
  → Schema + migrations + RLS policies

Agent: API (sonnet, worktree)
  → Server Actions / API routes + Zod schemas

Agent: FRONTEND (sonnet, worktree)
  → UI components + state + forms

→ Merge worktrees after all complete
```

**Solo build (TIER 1):**
```
No agents — implement directly. Still follow skill rules.
```

**Compound error defense:** After every 3-4 steps, stop and verify:
- Does it actually work?
- Am I still on the plan?
- Did I introduce regressions?

### PHASE 4: REVIEW CHAIN (automated gates → agent review → quality gate)

**Step 1: Automated gates** (0 tokens, run via bash) → load `modules/11-quality-gates.md`
```
BUILD CHECK → REGRESSION TESTS → TDD ENFORCER → TERMINAL VERIFICATION → ACCESSIBILITY → PERFORMANCE → IMAGE URLS → KAREN VALIDATOR
```
**Terminal Verification is MANDATORY** — fresh `npm run build && npm test` output proving it works. No hedging ("should work") — only concrete proof.
If any automated gate fails → fix before spawning expensive agent reviewers.

**Step 2: Agent review** (only if automated gates pass). Spin up in ONE message:
```
CODE-REVIEWER (sonnet)    → TS strict, error handling, patterns
DESIGN-REVIEWER (sonnet)  → feedback_design.md standards, wow factor
SECURITY-REVIEWER (sonnet) → secrets, auth, XSS, env vars
```

**Quality gate (all must pass):**

| Gate | Pass | If fail |
|---|---|---|
| Automated (Step 1) | All 6 gates pass | Fix, re-run only failed gate |
| Code review | 0 CRITICAL, ≤2 HIGH | Fix before showing user |
| Design review | Score ≥ 7/10 | Fix visual issues |
| Security review | 0 CRITICAL | Fix immediately |

**Failure protocol:** Max 2 fix-review cycles. If same issue fails 3x → rollback (Module 12 §2) and try second-best approach from brainstorm. Never infinite loop.

**Hot-swap:** If an agent returns poor output (< 2/5), swap to alternative agent (Module 12 §4). Max 1 swap per role.

### PHASE 5: DELIVER

1. Present clean result to user
2. Brief status (what was built, files changed)
3. No summaries of process — user doesn't need to know 6 agents worked on this
4. Log learnings to `tasks/lessons.md` if applicable

---

## 3. AGENT ROSTER (310 agents — auto-matched by description)

310 agents installed in `~/.claude/agents/`. They are matched automatically via their `description` frontmatter, same as skills. Only key agents per JARVIS phase are listed here — the rest dispatch on-demand when task domain matches.

### JARVIS Core Agents (used in every full JARVIS run)

**PHASE 2 — Brainstorm:** `architect` (opus) · `ui-designer` (opus) · `planner` (opus)

**PHASE 3 — Website builds:** `website-architect` (opus) · `frontend-developer` · `conversion-optimizer` · `seo-specialist`

**PHASE 3 — Full-stack builds:** `fullstack-developer` · `api-designer` · `database-reviewer`

**PHASE 4 — Review chain:** `code-reviewer` · `typescript-reviewer` · `security-reviewer` · `design-reviewer`

### Specialist Pools (dispatched when task domain matches)

**DevOps:** `devops-engineer` · `cloud-architect` · `docker-specialist` · `kubernetes-specialist` · `sre-engineer` · `terraform-engineer` · `deployment-engineer` · `cicd-pipeline-architect`

**Testing:** `qa-expert` · `test-automator` · `test-strategy-architect` · `performance-testing-expert` · `accessibility-tester` · `chaos-engineer` · `penetration-tester` · `tdd-guide` · `karen` (task completion validator)

**Data & AI:** `data-engineer` · `data-analyst` · `ml-engineer` · `llm-architect` · `prompt-engineer` · `rag-architecture-expert` · `llm-finetuning-expert`

**Content:** `technical-writer` · `content-writer` · `content-marketer` · `prd-writer` · `documentation-specialist`

**Business:** `product-manager` · `project-manager` · `sales-engineer` · `business-analyst` · `competitive-analyst` · `market-researcher` · `agile-sprint-planner`

**Architecture:** `microservices-architect` · `graphql-architect` · `clean-architecture-expert` · `design-patterns-expert` · `monorepo-architect`

**Orchestration:** `chief-of-staff` · `workflow-orchestrator` · `multi-agent-coordinator`

**+ 200 more** language specialists, framework experts, and domain-specific agents. See `ls ~/.claude/agents/` for full list.

---

## 4. PARALLEL TOOL RULE (always active)

When multiple tool calls are independent — batch ALL in ONE message.
Reading 3 files? One message, three Read calls.
Spawning 3 agents? One message, three Agent calls.
**This is what makes JARVIS fast. Serial agents = slow. Parallel agents = Jarvis.**

---

## 5. TOKEN & COST EFFICIENCY (always active)

Every token costs money. Every agent spawn costs 2-5K tokens. Optimize ruthlessly.

| Rule | Saves |
|---|---|
| Use **sonnet** for ALL review/execution agents. Opus ONLY for creative/architectural brainstorm. | ~60% per agent |
| **Automated gates before agent reviews** (Module 11). Catch issues with bash, not 3 agent spawns. | ~15K tokens when issues found |
| **Compress handoffs** between phases. Phase output → 50-80 word brief, not full agent response. | ~40% per handoff |
| **Max 4 modules loaded per task.** If 5+ needed, split into sequential tasks. | Prevents context bloat |
| **Skip brainstorm (Phase 2) for Solo and JARVIS Lite.** Only Full JARVIS gets brainstorm. | ~20K tokens per simple task |
| **Don't load skill SKILL.md if you already know the rules.** Only load for first use. | ~500-700 tokens |
| **"Is it worth an agent?" test:** If the task takes < 30 seconds to do yourself, don't spawn an agent. | Prevents wasteful spawns |

---

## 6. CORE PRINCIPLES

- **JARVIS, NOT CLIPPY** — don't ask, do. Present results, not options (unless brainstorm diverges)
- **PARALLEL BY DEFAULT** — every phase spawns agents simultaneously
- **QUALITY GATE IS MANDATORY** — user never sees unreviewed work
- **CHEAP GATES FIRST** — bash checks before agent reviews (Module 11)
- **CONFIDENCE BEFORE ACTION** — never act below 70%
- **ROOT CAUSE ONLY** — never fix symptoms
- **COMPOUND ERRORS KILL** — checkpoint every 3-4 steps
- **CONTEXT IS FINITE** — load only what's needed, compress between phases
- **AUTO-ROUTE** — match to skill/agent/MCP automatically
- **DESIGN = REAL IMAGES + DEPTH + WOW** — read feedback_design.md, always
- **ROLLBACK, NOT LOOP** — if fix fails 3x, rollback and try different approach (Module 12 §2)
- **REFERENCE-FIRST** — search GitHub + patterns before building, don't reinvent (Module 10 §1b)
- **TERMINAL PROOF** — fresh terminal output required, never hedge (Module 11 §3c)
- **PLAN BEFORE CODE** — no code until a written plan exists (Phase 1 plan lock)
- **MATURITY MATTERS** — route to HARDENED/CRYSTALLIZED skills over DRAFT when possible (Module 09 §4d)

---

## 6. CRITICAL ANTI-PATTERNS

**Process:** Skipping brainstorm for complex tasks · Showing user unreviewed work · Running agents sequentially when they can be parallel · Skipping PHASE 4 review because "it looks fine"

**Design:** Flat placeholder UI · Emojis as images · Inter/Roboto · Purple gradients · Rounded-everything · Missing branded footer · Not verifying image URLs

**Execution:** Loading skill but ignoring its rules · Scope drift · Fixing a fix · `migrate dev` on Supabase · `chromium-min` on Vercel · Serializing parallel calls

**Communication:** Explaining the agent process to user (just deliver results) · "Fix this later" · Asking user to pick a skill
