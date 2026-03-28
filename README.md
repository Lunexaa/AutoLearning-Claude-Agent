# JARVIS Workflow for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/ZGColombia/JARVIS-Workflow-Claude-Code?style=social)](https://github.com/ZGColombia/JARVIS-Workflow-Claude-Code)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-blueviolet)](https://claude.ai/code)
[![Agents](https://img.shields.io/badge/Agents-310+-blue)](https://github.com/ZGColombia/JARVIS-Workflow-Claude-Code)
[![Skills](https://img.shields.io/badge/Skills-533-green)](https://github.com/ZGColombia/JARVIS-Workflow-Claude-Code)

The most comprehensive workflow system for Claude Code. 14 modules, 310 agents, 533 skills, autonomous multi-agent orchestration, self-learning routing, and automated quality gates -- all configured through CLAUDE.md and SKILL.md files.

**Works with:** Claude Code CLI, Claude Code VS Code Extension, Claude Code Desktop App

---

## Why JARVIS?

Most Claude Code setups use a single agent working linearly. JARVIS transforms Claude Code into an autonomous engineering team:

- You describe a task
- JARVIS spins up 6-18 specialized agents running **in parallel**
- Agents brainstorm competing approaches, a judge fuses the best elements
- Build agents implement in parallel with isolated contexts
- Automated quality gates catch issues **before** expensive agent reviews
- You only see the validated, reviewed result

No other Claude Code workflow system combines multi-agent brainstorming, autonomous execution, self-learning routing, and automated quality gates in a single framework.

---

## Features

**Multi-Agent Orchestration**
- 310+ specialized agents auto-dispatched by task type
- Design Tribunal: 6 competing design agents (Minimalist, Brutalist, Luxury, Conversion Hawk, Trend Scout, Red Team) judged and fused
- Backend Tribunal: 5 architecture agents (Scale, Security, DX, Cost, Red Team)
- Adversarial Spec Refinement: Author, Critic, Defender debate specifications
- Hot-swap failed agents automatically -- workflow never stalls

**Autonomous Execution**
- 4 complexity tiers: Solo, JARVIS Lite, Full JARVIS, Autonomous JARVIS
- Autonomous mode with circuit breakers (3 same errors = stop, scope drift = stop)
- Pre-flight checklist, checkpoint every 5 items, max 50 iterations
- Humans decide WHAT, machines execute HOW, humans verify QUALITY

**Quality Assurance**
- 8 automated gates: Build, Tests, TDD Enforcer, Terminal Verification, Accessibility, Performance, Image URLs, Completion Check
- Terminal Verification: fresh `npm run build && npm test` output required -- no hedging
- TDD Enforcer: warns when new code lacks corresponding tests
- 3-agent review chain: Code, Design, Security (all must pass)

**Self-Learning**
- Routing signals scored 1-5 after every task
- Skill maturity lifecycle: DRAFT -> TESTED -> HARDENED -> CRYSTALLIZED
- Auto-evolution: skills below 90% success rate get improvement suggestions
- Auto-deprecation: skills below 50% over 5+ tasks get flagged
- Cross-project learning: patterns found in 2+ projects get promoted

**Research and Planning**
- Deep Research Protocol: 5-hop iterative search with confidence scoring (0.0-1.0)
- Reference-First Development: GitHub + pattern search before any coding
- Plan Lock: no code written until a plan exists and is approved
- Selective Knowledge Priming: load only relevant memories per task

**533 Skills** covering: Next.js, React, Tailwind, shadcn/ui, Framer Motion, SEO (17 sub-skills), marketing (33 sub-skills), security (Trail of Bits), Cloudflare (20+), testing, DevOps, AI/ML, and more.

---

## Architecture

```
USER TASK
    |
SESSION START -> INTENT -> AUTO-ROUTE (skills + agents + MCP)
    |
SKILL COMPLIANCE GATE
    |
+--- JARVIS PROTOCOL ------------------------------------+
|                                                         |
|  PHASE 1: INTEL (parallel)                              |
|  - Research agent -> best practices, competitors        |
|  - Skill reader -> extract rules and constraints        |
|  - Context loader -> project memory and git history     |
|  - Reference-First -> GitHub + pattern search           |
|  - Plan Lock -> written plan before any code            |
|                                                         |
|  PHASE 2: BRAINSTORM (parallel, 3-6 agents)             |
|  - Mode A: Standard (Architect + Creative + Pragmatist) |
|  - Mode B: Design Tribunal (6 agents + judge)           |
|  - Mode C: Backend Tribunal (5 agents + judge)          |
|  - Mode D: Adversarial Spec (Author + Critic + Defender)|
|                                                         |
|  PHASE 3: BUILD (parallel specialists)                  |
|  - Frontend, Backend, Design agents in isolation        |
|  - Autonomous mode available (Module 14)                |
|  - Checkpoint every 3-4 steps                           |
|                                                         |
|  PHASE 4: REVIEW CHAIN                                  |
|  - 8 automated gates (zero tokens, bash commands)       |
|  - 3 agent reviewers (code, design, security)           |
|  - All must pass before user sees result                |
|                                                         |
|  PHASE 5: DELIVER                                       |
|  - Clean result to user                                 |
|  - Log learnings to memory                              |
+---------------------------------------------------------+
```

---

## The 14 Modules

| # | Module | What It Does |
|---|--------|-------------|
| 01 | **Planning** | Task decomposition, risk assessment, scope definition |
| 02 | **Execution** | Agent routing, parallel dispatch, build coordination |
| 03 | **Verification** | Code review, testing, quality enforcement |
| 04 | **Session** | Selective knowledge priming, context budget, session capture |
| 05 | **Memory** | 5-layer memory system (conversational -> self-healing) |
| 06 | **Project Manager** | Multi-sprint coordination, milestone tracking |
| 07 | **Self-Monitor** | Workflow telemetry, adherence scoring, health checks |
| 08 | **Skills** | Skill creation, compliance gate, project initialization |
| 09 | **Learning** | Self-learning routing, skill maturity lifecycle, auto-evolution |
| 10 | **Brainstorm** | Reference-first, 4 brainstorm modes (A-D), Design Tribunal |
| 11 | **Quality Gates** | 8 automated gates including TDD enforcer and terminal verification |
| 12 | **Orchestration** | Progress streaming, rollback, context compression, hot-swap |
| 13 | **Deep Research** | 5-hop research protocol, confidence scoring, source triangulation |
| 14 | **Autonomous** | Ralph loop execution, circuit breakers, safety limits |

---

## Quick Start

```bash
# 1. Clone
git clone https://github.com/ZGColombia/JARVIS-Workflow-Claude-Code.git

# 2. Install
cd JARVIS-Workflow-Claude-Code
bash scripts/install.sh

# 3. Start Claude Code -- JARVIS loads automatically
claude
```

The installer copies skills, agents, commands, and memory templates to `~/.claude/`. JARVIS activates automatically at every session start via CLAUDE.md.

### Verify Installation

```bash
# Inside Claude Code:
/self-test
/health-check
```

---

## How It Works

JARVIS auto-selects workflow depth based on task complexity:

| Complexity | Mode | What Happens |
|-----------|------|-------------|
| Quick fix (1-3 files) | **Solo** | Direct implementation, no agents |
| Feature (4-10 files) | **JARVIS Lite** | Phase 1 -> 3 -> 4 (skip brainstorm) |
| Large feature (10+ files) | **Full JARVIS** | All 5 phases with brainstorm tribunal |
| Large + user opts in | **Autonomous** | Phase 1+2 interactive, Phase 3 autonomous, Phase 4+5 interactive |

---

## Slash Commands

| Command | What It Does |
|---------|-------------|
| `/plan` | Create structured implementation plan |
| `/code-review` | Run full review chain on current code |
| `/verify` | Run verification loop |
| `/quality-gate` | Execute all 8 automated quality gates |
| `/self-test` | Run 50+ system integrity checks |
| `/health-check` | Quick diagnostic verification |
| `/build-fix` | Fix build errors automatically |
| `/refactor-clean` | Dead code cleanup and consolidation |
| `/e2e` | Generate and run E2E tests |
| `/deep-research` | Run 5-hop deep research protocol |

---

## MCP Server Integration

JARVIS ships with 7 MCP server configurations:

| Server | Purpose |
|--------|---------|
| **Ruflo** | Agent swarm orchestration |
| **Supabase** | Database operations |
| **Playwright** | E2E testing and visual validation |
| **GitHub** | PR, issue, and repo management |
| **Meta Ads** | Campaign management |
| **Firecrawl** | Web scraping and research |
| **Google Search Console** | SEO data |

Configure API keys in `~/.claude/settings.json` after installation.

---

## File Structure

```
.claude/
  CLAUDE.md                          # Global instructions (auto-loaded)
  ROADMAP.md                         # Skill category index
  settings.json                      # MCP servers, hooks, config
  skills/
    Workflow/
      SKILL.md                       # Master workflow (loaded every session)
      modules/
        01-planning.md ... 14-autonomous.md
    [530+ domain skills]
  agents/
    [310+ specialized agents]
  commands/
    [12 slash commands]
  Memory/
    MEMORY.md                        # Memory index
    routing-signals.md               # Self-learning log
    routing-overrides.md             # Learned route preferences
    feedback_design.md               # Design quality standards
    L1-conversational/ ... L5-self-healing/
```

---

## Standing on the Shoulders of Giants

JARVIS integrates concepts from the best projects in the Claude Code ecosystem:

| Feature | Inspired By | What We Took |
|---------|------------|-------------|
| Reference-First Development | [GodMode](https://github.com/NoobyGains/godmode) | GitHub search before coding |
| Terminal Verification | [Superpowers](https://github.com/obra/superpowers) | Fresh terminal proof, no hedging |
| TDD Enforcer | [Superpowers](https://github.com/obra/superpowers) | Warn on missing tests for new code |
| Skill Maturity Lifecycle | [singularity-claude](https://github.com/Shmayro/singularity-claude) | DRAFT->TESTED->HARDENED->CRYSTALLIZED |
| Deep Research Protocol | [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework) | 5-hop iterative research with scoring |
| Autonomous Mode | [Ralph Wiggum Loop](https://github.com/frankbria/ralph-claude-code) | Circuit breakers, safety limits |
| Adversarial Spec | [adversarial-spec](https://github.com/zscole/adversarial-spec) | Multi-agent spec debate |
| Selective Knowledge Priming | [Metaswarm](https://github.com/dsifry/metaswarm) | Load only relevant memories |
| Self-Evolving Skills | [OpenSpace](https://github.com/HKUDS/OpenSpace) | Auto-evolution, success tracking |
| Adaptive Routing | [Ruflo](https://github.com/ruvnet/ruflo) | Learning-based task routing |

---

## Comparison

| Capability | JARVIS | Superpowers | GodMode | SuperClaude | Ruflo |
|-----------|--------|-------------|---------|-------------|-------|
| Multi-agent brainstorm | 6 agents | -- | -- | -- | -- |
| Design Tribunal | 6 perspectives | -- | -- | -- | -- |
| Automated quality gates | 8 gates | -- | Terminal verify | -- | -- |
| Self-learning routing | Signals + maturity | -- | -- | -- | RL-based |
| Autonomous mode | Circuit breakers | -- | -- | -- | Swarms |
| Deep research (5-hop) | Built-in | -- | -- | 5 hops | -- |
| Skill compliance gate | 3-layer | -- | Project override | -- | -- |
| TDD enforcement | Hook + gate | Strict | -- | -- | -- |
| Reference-first | GitHub + patterns | -- | GitHub search | -- | -- |
| Token efficiency | Compressed handoffs | -- | -- | 30-50% savings | WASM skip |
| Skills library | 533 | 13 | 36 | 30 commands | 313 MCP tools |
| Agent library | 310 | -- | -- | 20 | 100+ |
| Memory layers | 5 | -- | -- | -- | ReasoningBank |

---

## Contributing

1. **New skill:** Add `skills/your-skill/SKILL.md` with YAML frontmatter (`name`, `description`)
2. **New agent:** Add `agents/your-agent.md` with model tier and description
3. **New module:** Add `modules/XX-name.md` and reference in SKILL.md routing table
4. **Bug fix:** Open an issue or PR

All skills follow the [Anthropic Agent Skills](https://github.com/anthropics/skills) specification.

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## Related Projects

- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) -- Curated Claude Code ecosystem index
- [Superpowers](https://github.com/obra/superpowers) -- TDD-enforced workflow
- [GodMode](https://github.com/NoobyGains/godmode) -- 5-phase gated pipeline
- [Ruflo](https://github.com/ruvnet/ruflo) -- WASM-powered agent swarms
- [OpenSpace](https://github.com/HKUDS/OpenSpace) -- Self-evolving skill system
- [claude-task-master](https://github.com/eyaltoledano/claude-task-master) -- PRD to task decomposition
- [Anthropic Skills](https://github.com/anthropics/skills) -- Official skill specification

---

**JARVIS Workflow** -- Autonomous multi-agent orchestration for Claude Code.
