# AutoLearning Claude Agent

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/Lunexaa/AutoLearning-Claude-Agent?style=social)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-blueviolet)](https://claude.ai/code)
[![Status](https://img.shields.io/badge/Status-Production-brightgreen)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Agents](https://img.shields.io/badge/Agents-331-blue)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Skills](https://img.shields.io/badge/Skills-535-green)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Modules](https://img.shields.io/badge/Modules-16-orange)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)

**AutoLearning Claude Agent** is the most comprehensive autonomous multi-agent workflow system for Claude Code. It transforms single-agent code generation into a self-learning, multi-agent orchestration platform with intelligent routing, automated quality gates, staleness-conditioned research, and continuous skill evolution. Works with Claude Code CLI, VS Code Extension, JetBrains, and Desktop App.

---

## What is AutoLearning?

AutoLearning Claude Agent solves the fundamental limitation of linear, single-agent code workflows. Instead of manually routing tasks to the same agent, AutoLearning automatically routes each task to the most appropriate specialized agent based on learned patterns and historical performance. The system learns from every task execution, continuously refining its routing decisions and skill effectiveness. It combines parallel multi-agent execution with evidence-gated quality control, real-time research integration, and a persistent memory system to deliver production-ready code faster and more reliably than traditional approaches.

---

## What's New in v2.0

### Staleness-Conditioned Research with last30days

AutoLearning now automatically detects when your knowledge about a domain is outdated and refreshes it before building. Powered by [last30days](https://github.com/mvanhorn/last30days-skill.git), the system searches Reddit, X, YouTube, Hacker News, Polymarket, and the web for the latest patterns, tools, and best practices.

**How it works:**
- Before every BUILD task, PHASE 1 checks the age of your memory files and matched skills
- If knowledge is **older than 30 days** or it's a **new project**, a FRESHNESS RESEARCHER agent runs `last30days --quick` in parallel with other PHASE 1 agents
- Research findings are **compared against the matched skill file** — if newer facts are found, they're **automatically appended** to the skill as a `## RESEARCH UPDATE` section
- Updated knowledge is injected into PHASE 2 brainstorm agents as constraint context
- The freshness tracker records when each domain was last researched, preventing redundant API calls

**No API keys required for baseline operation** — Reddit public search, Hacker News, and Polymarket work for free. Add `SCRAPECREATORS_API_KEY` for Reddit + TikTok + Instagram, `XAI_API_KEY` for X/Twitter.

### 21 New Brainstorm Agents with Explicit Dispatch

All brainstorm modes now use named agent files with `subagent_type` dispatch:

| Mode | Agents (all with dedicated .md files) |
|------|---------------------------------------|
| **Mode A: Standard** | `architect` + `creative` + `pragmatist` + `user-advocate` |
| **Mode B: Design Tribunal** | `minimalist` + `brutalist` + `luxury` + `conversion-hawk` + `trend-scout` + `accessibility-advocate` + `red-team` + `user-advocate` |
| **Mode C: Backend Tribunal** | `scale-architect` + `security-hawk` + `dx-advocate` + `cost-optimizer` + `red-team` + `user-advocate` |
| **Mode D: Adversarial Spec** | `spec-author` + `spec-critic` + `spec-defender` |
| **Post-selection** | `challenger` (5-dimension stress test) |

### Automated Signal Capture and Learning Pipeline

New hooks automatically track task outcomes and domain freshness:

- **`session-end-signal.sh`** — Captures routing signals after git commits with deduplication
- **`skill-learning-capture.sh`** — Tracks which domain you're working on, detects bug fix patterns
- **Mandatory PHASE 5.5** — Learning capture step with explicit commands (routing signal, freshness update, pattern promotion, ROADMAP update)

### Mandatory Staleness Check in PHASE 1

The staleness check is now marked MANDATORY in SKILL.md with exact bash commands — not optional, not aspirational. Claude runs it every time.

---

## Key Features

- **16 Modular Layers** — Planning, Execution, Verification, Session Intelligence, Memory Management, Project Coordination, Self-Monitoring, Skills Framework, Learning Systems, Brainstorm Modes, Quality Gates, Orchestration, Deep Research, Autonomous Execution, Session Intelligence, and Staleness-Conditioned Research
- **6 Brainstorm Modes** — Standard (4 agents), Design Tribunal (8 agents), Backend Tribunal (6 agents), Adversarial Spec (3 agents), Domain-Specific (3 agents), plus post-selection Challenger stress test
- **10 Automated Quality Gates** — Zero-token bash-based verification gates: build, tests, TDD enforcement, terminal verification, accessibility, performance, security, image URLs, completion validation, lint/format
- **Staleness-Conditioned Research** — Automatic knowledge refresh via last30days when memory or skills are older than 30 days. Searches 8+ sources in parallel. Auto-updates skill files with findings.
- **Self-Learning Routing** — Every task execution scores routing signals 1-5, feeding back into agent selection. Skills progress through maturity lifecycle: DRAFT, TESTED, HARDENED, CRYSTALLIZED
- **331 Specialized Agents** — Domain experts for frontend, backend, design, security, DevOps, AI/ML, brainstorm roles, review chain (critic + fixer), and 30+ other specializations
- **535 Pre-Built Skills** — Next.js, React, Tailwind, shadcn/ui, Framer Motion, 17 SEO sub-skills, 33 marketing sub-skills, Cloudflare (20+), testing frameworks, security patterns, and more
- **Autonomous Mode with 13 Circuit Breakers** — Safely runs unsupervised with automatic termination on repeated failures, scope drift, or safety violations
- **JIT Context Brackets** — FRESH, MODERATE, DEPLETED modes automatically selected based on session state and token budget
- **Evidence-Gated Review Chain** — 3-agent review (Code, Design, Security) with Critic/Fixer loop (max 5 rounds) ensures all deliverables meet quality thresholds
- **Anonymized Inter-Agent Review** — Agents review code without knowing who wrote it, eliminating sycophancy bias
- **12 Always-On Instincts** — Pattern recognition, risk detection, opportunity identification run continuously
- **Session Intelligence** — Persistent session notes, branch-specific memory, decision logs enable learning across projects and sessions
- **7 MCP Server Integrations** — Ruflo, Supabase, Playwright, GitHub, Google Search Console, Firecrawl, Meta Ads
- **5 Automated Hooks** — TDD gate, signal capture, freshness tracking, pre-compaction diary, ultrawork detection

---

## Architecture

```
USER TASK / CLAUDE CODE SESSION START
    |
INTENT DETECTION -> AUTO-ROUTE
    (535 skills + 331 agents + 7 MCP servers)
    |
SKILL COMPLIANCE GATE (mandatory)
    |
+------ AUTOLEARNING PROTOCOL ------------------------------------------+
|                                                                        |
|  PHASE 1: INTEL (parallel agents)                                     |
|  - Research Agent -> competitive analysis, best practices              |
|  - Skill Reader -> extract rules, constraints, maturity level          |
|  - Context Loader -> project memory, git history, session notes        |
|  - Freshness Researcher (conditional) -> last30days research           |
|    triggered when memory/skills > 30 days old or NEW_PROJECT           |
|  - Staleness check: MANDATORY before agent spawning                    |
|  - Skill update: append RESEARCH UPDATE if newer facts found           |
|  - Plan Lock -> documented plan required before code                   |
|                                                                        |
|  PHASE 2: BRAINSTORM (parallel named agents via subagent_type)        |
|  - Mode A: architect + creative + pragmatist + user-advocate           |
|  - Mode B: 8 design agents (minimalist to red-team) + judge           |
|  - Mode C: 6 backend agents (scale to cost) + judge                   |
|  - Mode D: spec-author + spec-critic + spec-defender                   |
|  - Post-selection: challenger (5-dimension stress test)                 |
|                                                                        |
|  PHASE 3: BUILD (parallel specialists with isolation)                 |
|  - Frontend, Backend, Design agents in parallel worktrees              |
|  - Checkpoint every 3-4 steps, rollback on failure                    |
|  - Autonomous sub-mode with 13 circuit breakers                        |
|                                                                        |
|  PHASE 3.5: UNIFY (Full AutoLearning only)                           |
|  - Compare planned scope vs actual files created                       |
|  - Flag deviations > 20% for user review                              |
|                                                                        |
|  PHASE 4: REVIEW CHAIN (automated + agent-based)                      |
|  - 10 Automated Gates (build, tests, TDD, a11y, perf, security)       |
|  - 3 Agent Reviewers (code-reviewer, design-reviewer, security)       |
|  - Critic/Fixer loop (max 5 rounds) for found issues                  |
|  - All gates must pass before delivery                                 |
|                                                                        |
|  PHASE 5: DELIVER + PHASE 5.5: LEARN (mandatory)                     |
|  - Clean result delivery                                               |
|  - Log routing signal to routing-signals.md                            |
|  - Update freshness tracker                                            |
|  - Check for pattern promotion (3+ occurrences -> instinct)            |
|  - Update ROADMAP.md if new skill created                              |
|  - Append RESEARCH UPDATE to skill if research found newer facts       |
|                                                                        |
+------------------------------------------------------------------------+
```

---

## The 16 Modules

| Module | Purpose |
|--------|---------|
| **01-Planning** | Confidence check, reference-first protocol, plan lock, pre-mortem, MoSCoW prioritization |
| **02-Execution** | 3-tier routing (Solo/Subagent/Swarm), worktree isolation, compound error defense |
| **03-Verification** | Adversarial self-review, 5-tier verification, quality gate enforcement |
| **04-Session** | Context budget, JIT bracketing, session resume protocol, memory hygiene |
| **05-Memory** | 3-tier memory (Working/Vault/Signals), freshness tracker, cross-project promotion |
| **06-ProjectManager** | Multi-sprint coordination, milestone tracking, dependency resolution |
| **07-SelfMonitor** | Workflow telemetry, adherence scoring, system health checks |
| **08-Skills** | Skill creation wizard, compliance gate enforcement, project scaffolding |
| **09-Learning** | Signal capture, maturity lifecycle (DRAFT to CRYSTALLIZED), auto-evolution, pattern mining |
| **10-Brainstorm** | 6 brainstorm modes, named agent dispatch, constraint injection, challenger stress test |
| **11-QualityGates** | 10 automated gates, 3 agent reviewers, critic/fixer loop, terminal verification |
| **12-Orchestration** | Progress streaming, context compression, hot-swap recovery, lock-based coordination |
| **13-DeepResearch** | 5-hop iterative research, confidence scoring, source triangulation |
| **14-Autonomous** | Ralph loop, 13 circuit breakers, 50 iteration max, pre-flight checklist |
| **15-SessionIntelligence** | Session notes, attention tiers, instincts, recall, branch memory, JIT brackets |
| **16-StalenessResearch** | last30days integration, 30-day threshold, skill file auto-update, freshness tracking |

---

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/Lunexaa/AutoLearning-Claude-Agent.git

# 2. Run the installer
cd AutoLearning-Claude-Agent
bash scripts/install.sh

# 3. Start Claude Code (AutoLearning loads automatically)
claude
```

The installer copies all 16 modules, 331 agents, 535 skills, hooks, commands, and memory templates to `~/.claude/`. AutoLearning activates automatically at every session start.

### Verify Installation

```bash
# Inside Claude Code:
/self-test           # Run system integrity checks
/health-check        # Quick diagnostic verification
```

### Optional: Enable last30days Research Sources

```bash
# Free sources work out of the box (Reddit public, Hacker News, Polymarket)
# For additional sources, set API keys:
export SCRAPECREATORS_API_KEY="..."  # Reddit + TikTok + Instagram
export XAI_API_KEY="..."              # X/Twitter via xAI Grok
export BRAVE_API_KEY="..."            # Web search via Brave

# Verify source availability:
python3 ~/.claude/skills/last30days/scripts/last30days.py --diagnose
```

---

## How It Works

AutoLearning auto-selects execution depth based on task complexity:

| Task Complexity | Mode | Phases | Staleness Research |
|-----------------|------|--------|--------------------|
| Quick fix (1-3 files) | **Solo** | Phase 3 + 4 (automated only) | Never |
| Feature (4-10 files) | **Lite** | Phase 1, 3, 4 | If memory > 30 days |
| Large feature (10+ files) | **Full** | All 5 phases + brainstorm | If memory > 30 days or NEW_PROJECT |
| Autonomous (user opts in) | **Autonomous** | Phase 1-2 interactive, 3 auto, 4-5 interactive | Always on NEW_PROJECT |

The system learns from each task. Skills with higher maturity scores (HARDENED, CRYSTALLIZED) are preferred over DRAFT skills. Research findings automatically update skill files so knowledge stays current.

---

## Quality Gates (10 Automated)

All must pass before the user sees any output:

1. **Build Gate** — `npm run build` exits 0
2. **Tests Gate** — All test suites pass
3. **TDD Enforcer** — New code has corresponding tests
4. **Terminal Verification** — Fresh terminal output proves it works (no hedging)
5. **Accessibility Gate** — WCAG 2.1 AA compliance
6. **Performance Gate** — Core Web Vitals thresholds met
7. **Security Gate** — No hardcoded secrets, dependency scan clean
8. **Image URLs Gate** — All image references return HTTP 200
9. **Completion Gate** — Spec requirements fully met
10. **Lint/Format Gate** — Code style enforced

---

## Brainstorm Modes (6 Specialized)

| Mode | Agent Files (subagent_type) | Use Case |
|------|---------------------------|----------|
| **A: Standard** | `architect`, `creative`, `pragmatist`, `user-advocate` | General features |
| **B: Design Tribunal** | `minimalist`, `brutalist`, `luxury`, `conversion-hawk`, `trend-scout`, `accessibility-advocate`, `red-team`, `user-advocate` | Visual design decisions |
| **B-Lite: Design Duet** | `minimalist`, `conversion-hawk`, `user-advocate` | Small UI tasks |
| **C: Backend Tribunal** | `scale-architect`, `security-hawk`, `dx-advocate`, `cost-optimizer`, `red-team`, `user-advocate` | Architecture decisions |
| **D: Adversarial Spec** | `spec-author`, `spec-critic`, `spec-defender` | Requirements debate |
| **E: Domain-Specific** | `domain-mobile` + context agents | Mobile, data, API, security |

Post-selection: `challenger` agent stress-tests the winning approach across Scale, Simplicity, Edge Cases, Architecture, and Dependencies.

---

## Hooks (5 Automated)

| Hook | Trigger | Purpose |
|------|---------|---------|
| `tdd-gate.sh` | Before Edit/Write | Warns if new code lacks tests |
| `session-end-signal.sh` | After Bash calls | Captures routing signals with deduplication |
| `skill-learning-capture.sh` | After Edit/Write | Tracks domain freshness, detects bug fix patterns |
| `precompact-diary.sh` | Before context compression | Preserves session wisdom |
| `ultrawork-inject.sh` | On user message | Detects parallel execution keywords |

---

## Slash Commands (15 Available)

| Command | Purpose |
|---------|---------|
| `/plan` | Structured implementation plan with risk assessment |
| `/code-review` | Full 3-agent review chain |
| `/verify` | Verification loop (tests + terminal checks) |
| `/quality-gate` | Run all 10 automated quality gates |
| `/tdd` | Test-Driven Development (red-green-refactor cycle) |
| `/deep-research` | Multi-source research with last30days + web search |
| `/self-test` | System integrity checks |
| `/health-check` | Quick diagnostic |
| `/build-fix` | Auto-fix build errors |
| `/refactor-clean` | Dead code cleanup |
| `/e2e` | Generate and run E2E tests |
| `/auto` | Trigger AutoLearning manually |
| `/multi-plan` | Multi-model collaborative planning |
| `/multi-execute` | Multi-model collaborative execution |
| `/multi-frontend` | Frontend-focused multi-model development |

---

## Self-Learning System

Every task feeds into continuous improvement:

1. **Signal Capture** — Hooks automatically log routing signals after git commits (build pass/fail, test results, skill match quality)
2. **Freshness Tracking** — Hooks track when each domain was last worked on and last researched
3. **Staleness Detection** — PHASE 1 checks memory age. If > 30 days, triggers last30days research
4. **Skill Auto-Update** — Research findings appended to skill files as `## RESEARCH UPDATE` sections
5. **Maturity Lifecycle** — DRAFT (< 3 uses), TESTED (3+, avg 3.0+), HARDENED (5+, avg 4.0+), CRYSTALLIZED (10+, avg 4.5+, 30 days stable)
6. **Pattern Mining** — After 10+ signals, recurring lessons promoted to instincts or feedback files
7. **Cross-Project Learning** — Patterns in 2+ projects get promoted to Vault (persistent memory)
8. **ROADMAP Auto-Update** — New skills and tools discovered via research are flagged in ROADMAP.md

---

## Memory Architecture (3-Tier)

| Tier | Purpose | Retention | Examples |
|------|---------|-----------|----------|
| **Tier 1: Working** | Active project state | Current session | `project_*.md`, `session-notes.md`, `branches/` |
| **Tier 2: Vault** | Cross-project rules | Permanent | `feedback_*.md`, `instincts.md`, `user_profile.md` |
| **Tier 3: Signals** | Learning data | Historical (decayed) | `routing-signals.md`, `routing-overrides.md` |

Memory files have verification dates with domain-specific decay schedules (60-180 days). Stale entries are flagged for re-verification.

---

## Standing on the Shoulders of Giants

| Feature | Inspired By | What We Adopted |
|---------|------------|-----------------|
| Reference-First Development | GodMode | GitHub search + pattern matching before coding |
| Terminal Verification | Superpowers | Fresh terminal output required, no hedging |
| TDD Enforcement | Superpowers | Automated warnings for code without tests |
| Skill Maturity Lifecycle | singularity-claude | DRAFT, TESTED, HARDENED, CRYSTALLIZED |
| Deep Research Protocol | SuperClaude | 5-hop iterative search with confidence scoring |
| Autonomous Execution | Ralph Wiggum Loop | Circuit breakers, safety limits, checkpoints |
| Adversarial Specification | adversarial-spec | Multi-agent debate on requirements |
| Selective Knowledge Loading | Metaswarm | Load only relevant memories per task context |
| Self-Evolving Skills | OpenSpace | Auto-improvement, success tracking, deprecation |
| Adaptive Agent Routing | Ruflo | Learning-based task-to-agent assignment |
| Real-Time Research | last30days | Multi-source staleness-conditioned knowledge refresh |

---

## Comparison with Other Claude Code Frameworks

| Capability | AutoLearning | Superpowers | GodMode | SuperClaude | Ruflo |
|-----------|-------------|------------|---------|------------|-------|
| Multi-agent brainstorm | 6 modes, up to 8 agents | No | No | No | Swarm-based |
| Design Tribunal | 8 named agents + judge | No | No | No | No |
| Automated quality gates | 10 gates (zero tokens) | 1 (terminal verify) | No | No | No |
| Self-learning routing | Signals + maturity | No | No | No | RL-based |
| Staleness research (last30days) | 8 sources, auto skill update | No | No | No | No |
| Autonomous circuit breakers | 13 breakers, 50 iter limit | No | No | No | Built-in |
| Skill auto-update from research | Append RESEARCH UPDATE | No | No | No | No |
| Deep research (5-hop) | Yes, with confidence scoring | No | No | Yes | No |
| Freshness tracking hooks | Domain + project tracking | No | No | No | No |
| TDD enforcement | Gate + real-time warnings | Strict mode | No | No | No |
| Skill library | 535 pre-built | 13 | 36 | 30 | 313 MCP tools |
| Agent library | 331 specialized | No | No | 20 | 100+ |
| Memory tiers | 3 tiers with decay | No | No | No | ReasoningBank |
| Always-on instincts | 12 behavioral rules | No | No | No | No |
| Automated hooks | 5 (TDD, signals, freshness) | No | No | No | No |

---

## Contributing

1. **New Skill** — Create `skills/your-skill/SKILL.md` with YAML frontmatter
2. **New Agent** — Add `agents/your-agent-name.md` with role definition and model tier
3. **New Module** — Add `modules/XX-name.md`, register in Workflow SKILL.md
4. **Bug or Improvement** — Open an issue or submit a PR

All skills follow the [Anthropic Agent Skills](https://github.com/anthropics/skills) specification.

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## Related Projects

- [last30days](https://github.com/mvanhorn/last30days-skill) — Multi-source research skill (integrated in AutoLearning v2.0)
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) — Curated Claude Code ecosystem index
- [Superpowers](https://github.com/obra/superpowers) — TDD-enforced Claude Code workflow
- [GodMode](https://github.com/NoobyGains/godmode) — 5-phase gated development pipeline
- [Ruflo](https://github.com/ruvnet/ruflo) — WASM-powered agent swarm orchestration
- [OpenSpace](https://github.com/HKUDS/OpenSpace) — Self-evolving skill system
- [Anthropic Skills](https://github.com/anthropics/skills) — Official skill specification

---

**AutoLearning Claude Agent** — The most comprehensive autonomous multi-agent orchestration system for Claude Code. Self-learning routing, staleness-conditioned research, 535 skills, 331 agents, 16 modules, 5 automated hooks, and evidence-gated quality assurance. Transform single-agent workflows into adaptive, self-improving distributed teams.
