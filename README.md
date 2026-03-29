# AutoLearning Claude Agent

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/Lunexaa/AutoLearning-Claude-Agent?style=social)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-blueviolet)](https://claude.ai/code)
[![Status](https://img.shields.io/badge/Status-Production-brightgreen)
[![Agents](https://img.shields.io/badge/Agents-311-blue)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Skills](https://img.shields.io/badge/Skills-533-green)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)
[![Modules](https://img.shields.io/badge/Modules-15-orange)](https://github.com/Lunexaa/AutoLearning-Claude-Agent)

**AutoLearning Claude Agent** is the most comprehensive autonomous workflow system for Claude Code. It transforms single-agent code generation into a self-learning, multi-agent orchestration platform with intelligent routing, automated quality gates, and continuous skill improvement. Works with Claude Code CLI, Claude Code VS Code Extension, and Claude Code Desktop App.

---

## What is AutoLearning?

AutoLearning Claude Agent solves the fundamental limitation of linear, single-agent code workflows. Instead of manually routing tasks to the same agent, AutoLearning automatically routes each task to the most appropriate specialized agent based on learned patterns and historical performance. The system learns from every task execution, continuously refining its routing decisions and skill effectiveness. It combines parallel multi-agent execution with evidence-gated quality control and a self-healing memory system to deliver production-ready code faster and more reliably than traditional approaches.

---

## Key Features

- **15 Modular Layers** — Planning, Execution, Verification, Session Intelligence, Memory Management, Project Coordination, Self-Monitoring, Skills Framework, Learning Systems, Brainstorm Modes, Quality Gates, Orchestration, Deep Research, Autonomous Execution, and Integration
- **6 Brainstorm Modes** — Standard three-agent brainstorm, Design Tribunal (6 agents), Backend Tribunal (5 agents), Adversarial Spec refinement, plus 2 specialized modes for security and performance
- **10 Automated Quality Gates** — Zero-token bash-based verification gates that catch issues before expensive agent reviews (build validation, test coverage, accessibility, performance, security checks, terminal verification, TDD enforcement, completion validation)
- **4-Level Task Escalation** — DONE (shipped), DONE_WITH_CONCERNS (flag for review), NEEDS_CONTEXT (human decision), BLOCKED (circuit breaker engaged)
- **Self-Learning Routing** — Every task execution scores routing signals 1-5, feeding back into agent selection. Skills progress through maturity lifecycle: DRAFT → TESTED → HARDENED → CRYSTALLIZED
- **311 Specialized Agents** — Domain experts pre-tuned for frontend, backend, design, security, DevOps, AI/ML, and 30+ other specializations
- **533 Pre-Built Skills** — Next.js, React, Tailwind, shadcn/ui, Framer Motion, 17 SEO sub-skills, 33 marketing sub-skills, Cloudflare (20+), testing frameworks, security patterns, and more
- **Autonomous Mode with 13 Circuit Breakers** — Safely runs unsupervised with automatic termination on repeated failures, scope drift, or safety violations
- **JIT Context Brackets** — FRESH (full context), MODERATE (compressed), DEPLETED (token-efficient mode) automatically selected based on session state
- **Evidence-Gated Review Chain** — 3-agent review (Code, Design, Security) with JSON schema validation ensures all deliverables meet quality thresholds before user sees them
- **Anonymized Inter-Agent Review** — Agents review code without knowing who wrote it, eliminating bias and improving objectivity
- **12 Always-On Instincts** — Pattern recognition, risk detection, opportunity identification, consistency checking, and more run continuously in the background
- **Session Intelligence** — Persistent session notes, branch-specific memory, theory documentation, and decision logs enable learning across projects
- **7 MCP Server Integrations** — Ruflo (agent orchestration), Supabase (databases), Playwright (E2E testing), GitHub (repo management), Google Search (research), Firecrawl (web scraping), Meta Ads (campaign data)

---

## Architecture

```
USER TASK / CLAUDE CODE SESSION START
    |
INTENT DETECTION → AUTO-ROUTE
    (skills + agents + MCP servers)
    |
SKILL COMPLIANCE GATE (mandatory)
    |
+------ AUTOLEARNING PROTOCOL ------------------------------------------+
|                                                                        |
|  PHASE 1: INTEL (parallel agents)                                     |
|  - Research Agent → competitive analysis, best practices              |
|  - Skill Reader → extract rules, constraints, maturity level          |
|  - Context Loader → project memory, git history, session notes        |
|  - Reference-First → GitHub + pattern database search                 |
|  - Plan Lock → documented plan required before code                   |
|                                                                        |
|  PHASE 2: BRAINSTORM (parallel specialized agents)                    |
|  - Standard Mode: Architect + Creative + Pragmatist (3 agents)        |
|  - Design Tribunal: 6 competing design perspectives + judge           |
|  - Backend Tribunal: 5 architecture perspectives + judge              |
|  - Adversarial Spec: Author + Critic + Defender debate               |
|  - Security Brainstorm: Red team + offense/defense agents             |
|  - Performance Brainstorm: Optimization + constraint agents           |
|                                                                        |
|  PHASE 3: BUILD (parallel specialists with isolation)                 |
|  - Frontend Agent, Backend Agent, Design Agent execute in parallel    |
|  - Autonomous sub-mode available (interactive + auto execution)       |
|  - Checkpoint every 3-4 steps, rollback on failure                    |
|                                                                        |
|  PHASE 4: REVIEW CHAIN (automated + agent-based)                      |
|  - 10 Automated Gates (build, tests, TDD, accessibility, perf, etc)   |
|  - 3 Agent Reviewers (code quality, design, security)                 |
|  - All gates must pass before delivery                                |
|  - Evidence-gated validation with JSON schema checks                  |
|                                                                        |
|  PHASE 5: DELIVER & LEARN                                             |
|  - Clean result delivery with implementation notes                     |
|  - Log routing signals, skill performance, new patterns               |
|  - Update routing weights and skill maturity scores                   |
|  - Surface learnings to all agents for next task                      |
|                                                                        |
+------------------------------------------------------------------------+
```

---

## The 15 Modules

| Module | Purpose |
|--------|---------|
| **01-Planning** | Task decomposition, risk assessment, scope definition, complexity tier selection |
| **02-Execution** | Agent routing, parallel dispatch, isolated build contexts, rollback mechanisms |
| **03-Verification** | Code review, test coverage validation, security scanning, accessibility checks |
| **04-Session** | Context budget tracking, JIT bracketing, session notes persistence, memory loading |
| **05-Memory** | 5-layer memory system (conversational, project, theory, pattern, self-healing) |
| **06-ProjectManager** | Multi-sprint coordination, milestone tracking, dependency resolution, progress reporting |
| **07-SelfMonitor** | Workflow telemetry, adherence scoring, system health checks, anomaly detection |
| **08-Skills** | Skill creation wizard, compliance gate enforcement, project initialization scaffolding |
| **09-Learning** | Self-learning routing with signal scoring, skill maturity lifecycle, auto-evolution |
| **10-Brainstorm** | Reference-first methodology, 6 brainstorm modes, design tribunal, spec debate |
| **11-QualityGates** | 10 automated gates (build, tests, TDD, terminal verify, accessibility, performance, security, images, completion, lint) |
| **12-Orchestration** | Progress streaming, context compression, hot-swap agent recovery, parallel execution coordination |
| **13-DeepResearch** | 5-hop iterative research, confidence scoring (0.0-1.0), source triangulation, pattern extraction |
| **14-Autonomous** | Ralph loop execution, 13 circuit breakers, safety limits (50 iteration max), pre-flight checklist |
| **15-Integration** | MCP server management, webhook routing, API bridging, external system synchronization |

---

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/Lunexaa/AutoLearning-Claude-Agent.git

# 2. Run the installer
cd autolearning-claude-agent
bash scripts/install.sh

# 3. Start Claude Code (AutoLearning loads automatically)
claude
```

The installer copies all 15 modules, 311 agents, 533 skills, commands, and memory templates to `~/.claude/`. AutoLearning activates automatically at every session start via `CLAUDE.md`.

### Verify Installation

```bash
# Inside Claude Code:
/self-test           # Run 50+ system integrity checks
/health-check        # Quick diagnostic verification
/skill-audit         # Verify all 533 skills are loaded
```

---

## How It Works

AutoLearning auto-selects execution depth based on task complexity and context:

| Task Complexity | Mode | Execution Pattern |
|-----------------|------|-------------------|
| Quick fix (1-3 files) | **Solo** | Direct implementation, single agent, skip all phases except delivery |
| Feature (4-10 files) | **Lite** | Phase 1 → 3 → 4 → 5 (skip brainstorm) |
| Large feature (10+ files) | **Full** | All 5 phases with design/backend tribunal |
| Complex + autonomy opted | **Autonomous** | Phase 1-2 interactive, Phase 3 autonomous with checkpoints, Phase 4-5 interactive |

The system learns from each task and adjusts routing weights. Agents with higher maturity scores are selected more frequently for their specializations.

---

## Quality Gates (10 Automated)

These run in sequence. All must pass:

1. **Build Gate** — `npm run build` completes without errors
2. **Tests Gate** — All test suites pass with ≥80% coverage
3. **TDD Enforcer** — New code has corresponding test coverage
4. **Terminal Verification** — Fresh terminal run confirms output matches spec
5. **Accessibility Gate** — WCAG 2.1 AA compliance verified
6. **Performance Gate** — Core Web Vitals thresholds met
7. **Security Gate** — No hardcoded secrets, dependency vulnerabilities scanned
8. **Image URLs Gate** — All image references are valid and optimized
9. **Completion Gate** — Task requirements fully met (spec checklist validated)
10. **Lint/Format Gate** — Code style and formatting rules enforced

---

## Brainstorm Modes (6 Specialized)

| Mode | Agents | Use Case |
|------|--------|----------|
| **Standard** | Architect, Creative, Pragmatist | General features, balanced approach |
| **Design Tribunal** | Minimalist, Brutalist, Luxury, Conversion Hawk, Trend Scout, Red Team + Judge | Visual design, UX decisions, aesthetic conflicts |
| **Backend Tribunal** | Scale Expert, Security Expert, DX Expert, Cost Expert, Red Team + Judge | Architecture, infrastructure, performance-critical paths |
| **Adversarial Spec** | Spec Author, Devil's Advocate Critic, Defender | Clarify ambiguous requirements, debate edge cases |
| **Security Brainstorm** | Offense Specialist, Defense Specialist, Compliance Agent | Authentication, data handling, threat modeling |
| **Performance Brainstorm** | Optimization Specialist, Constraint Specialist, Profiling Agent | Latency reduction, throughput maximization, resource constraints |

---

## Slash Commands (13 Always Available)

| Command | Purpose |
|---------|---------|
| `/plan` | Create structured implementation plan with risk assessment |
| `/code-review` | Run full 3-agent review chain on current code |
| `/verify` | Execute verification loop (tests + terminal checks) |
| `/quality-gate` | Run all 10 automated quality gates sequentially |
| `/self-test` | Run 50+ system integrity checks on AutoLearning itself |
| `/health-check` | Quick diagnostic (module load, agent health, memory status) |
| `/build-fix` | Auto-fix common build errors and retry |
| `/refactor-clean` | Dead code cleanup and consolidation |
| `/e2e` | Generate and run E2E test suite |
| `/deep-research` | Run 5-hop research protocol on topic with confidence scoring |
| `/skill-audit` | Verify all 533 skills, check maturity levels |
| `/routing-debug` | Trace agent routing decisions for current task |
| `/memory-compact` | Compress memory across all 5 layers, purge stale entries |

---

## Standing on the Shoulders of Giants

AutoLearning integrates proven concepts from leading Claude Code frameworks:

| Feature | Inspired By | What We Adopted |
|---------|------------|-----------------|
| Reference-First Development | GodMode | GitHub search + pattern matching before coding |
| Terminal Verification | Superpowers | Fresh terminal output required, no hedging |
| TDD Enforcement | Superpowers | Automated warnings for code without tests |
| Skill Maturity Lifecycle | singularity-claude | DRAFT → TESTED → HARDENED → CRYSTALLIZED progression |
| Deep Research Protocol | SuperClaude | 5-hop iterative search with confidence scoring |
| Autonomous Execution | Ralph Wiggum Loop | Circuit breakers, safety limits, checkpoint recovery |
| Adversarial Specification | adversarial-spec | Multi-agent debate on requirements |
| Selective Knowledge Loading | Metaswarm | Load only relevant memories per task context |
| Self-Evolving Skills | OpenSpace | Auto-improvement, success tracking, auto-deprecation |
| Adaptive Agent Routing | Ruflo | Learning-based task-to-agent assignment |

---

## Comparison vs Top 5 Claude Code Frameworks

| Capability | AutoLearning | Superpowers | GodMode | SuperClaude | Ruflo |
|-----------|-------------|------------|---------|------------|-------|
| Multi-agent brainstorm (parallel) | 6 modes, up to 18 agents | No | No | No | Swarm-based |
| Design Tribunal (6 perspectives) | Yes (full judge/fuse) | No | No | No | No |
| Automated quality gates | 10 gates (zero tokens) | 1 (terminal verify) | No | No | No |
| Self-learning routing | Signals + maturity scoring | No | No | No | RL-based |
| Autonomous circuit breakers | 13 breakers, 50 iter limit | No | No | No | Built-in |
| Deep research (5-hop) | Yes, with confidence scoring | No | No | Yes | No |
| Skill compliance gate | 3-layer enforcement | No | Yes (project-level) | No | No |
| TDD enforcement | Gate + real-time warnings | Strict mode | No | No | No |
| Reference-first methodology | GitHub + pattern DB | No | GitHub search | Yes | No |
| Token efficiency | Compressed handoffs, JIT bracketing | No | No | 30-50% savings | WASM skip |
| Skill library | 533 pre-built | 13 | 36 | 30 | 313 MCP tools |
| Agent library | 311 specialized | No | No | 20 | 100+ |
| Memory layers | 5 layers | No | No | No | ReasoningBank |
| Always-on instincts | 12 background monitors | No | No | No | No |
| Session intelligence | Notes, branch memory, theory docs | No | No | No | No |

---

## MCP Server Integration

AutoLearning ships with 7 pre-configured MCP servers. Configure API keys in `~/.claude/settings.json` after installation:

| Server | Purpose | Cost Model |
|--------|---------|-----------|
| **Ruflo** | Agent swarm orchestration, parallel execution management | Free (local) |
| **Supabase** | PostgreSQL operations, real-time data, vector search | Pay-per-query |
| **Playwright** | E2E testing, visual validation, cross-browser testing | Free (local) |
| **GitHub** | PR management, issue tracking, repo operations, code search | Free (with auth) |
| **Google Search** | Research queries, SEO data, competitive intelligence | API key required |
| **Firecrawl** | Web scraping, content extraction, page structure analysis | Free tier available |
| **Meta Ads** | Campaign performance data, audience insights, ad validation | Business account required |

---

## File Structure

```
.claude/
  CLAUDE.md                          # Global instructions (loaded every session start)
  settings.json                      # MCP server config, API keys, system settings
  ROADMAP.md                         # Skill category index and discovery guide

  skills/
    Workflow/
      SKILL.md                       # Master AutoLearning skill definition
      modules/
        01-planning.md ... 15-integration.md

    [533 domain-specific skills organized by category]
    NextJS/
      SKILL.md
      components/
      templates/
    React/
      SKILL.md
      patterns/
    [continuing for all 533 skills]

  agents/
    [311 specialized agents with role definitions]
    Frontend/
      react-component-specialist.md
      next-pages-architect.md
    Backend/
      database-optimizer.md
      api-security-expert.md
    [continuing for all 311 agents]

  commands/
    [13 slash commands with implementations]
    /plan
    /code-review
    /quality-gate
    [continuing for all 13 commands]

  Memory/
    MEMORY.md                        # Memory system index
    routing-signals.md               # Self-learning log (task → agent → score)
    routing-overrides.md             # Manual routing preferences learned over time
    skill-maturity.md                # Skill progression tracking (DRAFT → CRYSTALLIZED)
    feedback_design.md               # Design quality standards and patterns
    patterns-learned.md              # Cross-project patterns extracted

    L1-conversational/               # Current session conversation context
    L2-project/                      # Project-specific facts, decisions, architecture
    L3-theory/                       # Technical knowledge, patterns, best practices
    L4-pattern/                      # Cross-project patterns, templates, reusable solutions
    L5-self-healing/                 # Recovery information, error patterns, fixes
```

---

## Self-Learning System

Every task execution feeds into continuous improvement:

1. **Routing Signals** — After each task, all 5 phases score the agent selection: Did the right agent get routed? Score 1-5.
2. **Signal Aggregation** — Signals are averaged per agent per skill type. Patterns emerge over 5+ tasks.
3. **Skill Maturity Tracking** — Skills start at DRAFT and progress to TESTED (>70% success), HARDENED (>85%), CRYSTALLIZED (>95% + 10+ tasks).
4. **Auto-Evolution** — Skills below 90% success rate receive improvement suggestions. Below 50% for 5+ tasks trigger deprecation flag.
5. **Cross-Project Learning** — Patterns found in 2+ projects get promoted to theory layer and shared across all agents.
6. **Routing Weight Adjustment** — High-maturity, high-success agents get increased routing weight automatically.

---

## Contributing

Contributions follow a standard workflow:

1. **New Skill** — Create `skills/your-skill/SKILL.md` with YAML frontmatter (name, description, tags, maturity, tested_in)
2. **New Agent** — Add `agents/your-agent-name.md` with role definition, specialization, and model tier
3. **New Module** — Add `modules/XX-name.md`, register in Workflow SKILL.md routing table
4. **Bug or Improvement** — Open an issue with reproduction steps or submit a PR

All skills follow the [Anthropic Agent Skills](https://github.com/anthropics/skills) specification. See CONTRIBUTING.md for detailed guidelines.

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## Related Projects

- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) — Curated Claude Code ecosystem index
- [Superpowers](https://github.com/obra/superpowers) — TDD-enforced Claude Code workflow
- [GodMode](https://github.com/NoobyGains/godmode) — 5-phase gated development pipeline
- [Ruflo](https://github.com/ruvnet/ruflo) — WASM-powered agent swarm orchestration
- [OpenSpace](https://github.com/HKUDS/OpenSpace) — Self-evolving skill system
- [Anthropic Skills](https://github.com/anthropics/skills) — Official skill specification

---

**AutoLearning Claude Agent** — The most comprehensive autonomous multi-agent orchestration system for Claude Code. Transform single-agent workflows into self-learning, distributed teams with evidence-gated quality assurance.
