# JARVIS v5.0

The world's most advanced Claude Code workflow system. JARVIS transforms Claude Code from a single-agent assistant into an autonomous multi-agent platform that brainstorms, builds, and quality-checks everything before you see it.

## Key Specifications

| Metric | Value |
|--------|-------|
| **Available Skills** | 533 on-demand, auto-matched by description |
| **Agent Library** | 310+ specialized agents, auto-dispatched per domain |
| **Workflow Modules** | 12 conditionally loaded modules |
| **Slash Commands** | 12 custom commands |
| **MCP Servers** | 7 configuration profiles |
| **Memory Layers** | 5-layer system (conversational → self-healing) |
| **Quality Gates** | 6-step automated validation pipeline |
| **Routing System** | Self-learning with signal/override mechanism |
| **Test Coverage** | 50+ assertions in self-test suite |

## What Is JARVIS?

JARVIS v5.0 is a **framework for autonomous AI workflows** that sits on top of Claude Code. It applies proven software engineering practices to AI-assisted development:

- **Structured phases** instead of random agent calls
- **Automated quality gates** that validate every result before delivery
- **Specialized agents** dispatched in parallel, not sequentially
- **Self-learning routing** that improves routing decisions over time
- **Session continuity** allowing you to pause and resume mid-workflow
- **Design and architecture tribunals** for high-stakes decisions
- **Rollback protocol** that gracefully handles failures

Think of it as having a senior architect, code review board, and QA team running automatically in the background.

## The JARVIS Protocol: 5 Phases

Every workflow follows a consistent structure:

### Phase 1: INTEL

**3 parallel agents research best practices + load project context + extract skill rules**

- Research Agent: Studies industry best practices and patterns
- Context Agent: Loads project structure, recent commits, existing architecture
- Skill Compliance Agent: Reads and validates skill structure requirements

**Output:** Consolidated intelligence document (50-80 words compressed)

### Phase 2: BRAINSTORM

**Multiple competing perspectives → judge evaluates → hybrid solution**

Three brainstorm modes automatically selected:

#### Standard Mode (3 agents)
- **Architect:** System design, scalability, maintainability
- **Creative:** Novel approaches, user delight, differentiation
- **Pragmatist:** Shipping velocity, resource efficiency, tech debt balance

#### Design Tribunal Mode (6 agents)
- Minimalist: Elegant simplicity, clarity
- Brutalist: Raw functionality, no decorative patterns
- Luxury: Premium experience, polished details
- Conversion Hawk: Goal optimization, friction reduction
- Trend Scout: Modern patterns, contemporary aesthetics
- Red Team: Identifies weaknesses in other approaches

**→ Judge Agent fuses best elements into hybrid solution**

#### Backend Tribunal Mode (5 agents)
- Scale Agent: Handles growth, horizontal scaling patterns
- Security Agent: Threat modeling, hardening, compliance
- DX Agent: Developer experience, maintainability
- Cost Agent: Infrastructure efficiency, budget optimization
- Red Team: Architecture vulnerabilities

**Special features:**
- All modes inject User Persona at brainstorm start
- If confidence < 80%, Devil's Advocate round triggers automatically
- Agents run **in parallel** for maximum speed

**Output:** Decision summary with confidence score

### Phase 3: BUILD

**Parallel specialist agents with worktree isolation**

- Code agents work in isolated filesystem branches
- Each agent receives compressed context (50-80 words)
- Build errors trigger hot-swap agent replacement
- Progress streams in real-time

**Output:** Feature-complete code ready for review

### Phase 4: REVIEW

**Automated quality gates THEN agent review chain**

#### Automated Quality Gates (all must pass):
1. **Build Gate:** Compilation/syntax validation
2. **Test Gate:** Existing test suite passes
3. **A11y Gate:** WCAG 2.1 AA compliance check
4. **Performance Gate:** No regressions in key metrics
5. **Image Gate:** Optimization validation
6. **Karen Gate:** Naming conventions, docs, readability

#### Agent Review Chain (sequential, all must approve):
- **Code Reviewer:** Logic, structure, patterns
- **Design Reviewer:** UI/UX, visual consistency
- **Security Reviewer:** Vulnerabilities, injection points

**Blocking rule:** User never sees unreviewed work.

**Output:** Fully validated code + review summary

### Phase 5: DELIVER

**Clean result + log learnings for future routing**

- Removed debug code, formatted output
- Updated memory with lessons learned
- Signal/override data logged for self-learning
- Performance metrics recorded

## Complexity-Based Routing

JARVIS automatically selects the right workflow depth:

### Quick Fix (≤3 files modified)
**Solo mode** — No agents, direct execution
- Example: Bug fix, typo, single file refactor
- Execution: Seconds

### Feature (4-10 files modified)
**JARVIS Lite** — Phases 1 → 3 → 4
- Skip full brainstorm (use architect judgment)
- Single review pass
- Example: New API endpoint, component variant
- Execution: 5-15 minutes

### Large Feature (10+ files modified)
**Full JARVIS** — All 5 phases
- Full intelligence gathering
- Multi-perspective brainstorm (design tribunal)
- Comprehensive review chain
- Example: New service, major refactor, design system feature
- Execution: 30+ minutes (parallelization reduces actual time)

## Unique Features

No other workflow system combines these:

### Design Tribunal
6 competing design perspectives (Minimalist, Brutalist, Luxury, Conversion Hawk, Trend Scout, Red Team) present solutions. Judge agent analyzes tradeoffs and builds hybrid combining best elements. Results in more balanced, considered decisions.

### Backend Tribunal
5 architecture perspectives (Scale, Security, DX, Cost, Red Team) evaluate infrastructure decisions. Prevents single-perspective biases.

### 6-Step Automated Quality Gate
Every deliverable passes: build → tests → a11y → performance → images → naming/docs before human review. Prevents classes of bugs from reaching review.

### Rollback Protocol
On failure: git stash uncommitted work, switch brainstorm approach, attempt rebuild. No dead-end failures.

### Hot-Swap Agents
If a specialist agent fails, auto-replace with backup agent of same domain. Workflow continues without interruption.

### Session Continuity
Pause mid-JARVIS: Current state saved to `jarvis-state.md`. Resume later from exact breakpoint. Great for complex features.

### Token/Cost Efficiency
- Sonnet agents selected by default (gpt-4 reserve for critical decisions)
- Handoff compression: 50-80 word summaries between phases
- Agent-worthiness test: Only spawn agents if decision requires it
- Cost tracking per workflow

### Self-Learning Routing
- **Signals:** Task outcomes recorded (success/failure, time, cost)
- **Overrides:** User can force specific routing ("`/override brainstorm-standard`")
- **Decay:** Older signals gradually lose influence
- System improves routing over time

### 5-Layer Memory System

| Layer | Scope | Lifetime |
|-------|-------|----------|
| L1 | Current conversation | Session |
| L2 | Current project context | Project |
| L3 | Completed workflows | 90 days |
| L4 | Learned patterns | Self-healing, permanent |
| L5 | System health metrics | Permanent |

### Self-Test Suite
```
/self-test
```
Runs 50+ assertions validating:
- Skill index integrity
- Agent availability
- Module structure
- Memory consistency
- MCP connectivity
- Routing logic
- Review gate functions

## Installation

### Full Install
```bash
# Clone repository
git clone https://github.com/ZGColombia/JARVIS-Workflow-Claude-Code.git
cd JARVIS

# Install all skills, agents, modules, and MCP servers
./scripts/install-full.sh

# Verify installation
/self-test
```

### Minimal Install
Workflow + core agents only (30 second install):
```bash
# Clone repository
git clone https://github.com/ZGColombia/JARVIS-Workflow-Claude-Code.git
cd JARVIS

# Install core only
./scripts/install-minimal.sh

# This includes:
# - 5 core modules (planning, intel, brainstorm, build, review)
# - 50 core agents (architect, reviewer, designers, developers)
# - Self-learning routing

# Expand later with:
/skill add <skill-name>
/agent add <agent-name>
```

### Manual Installation
```bash
# Clone into .claude directory
cp -r JARVIS ~/.claude/jarvis-v5

# Link modules
ln -s ~/.claude/jarvis-v5/modules ~/.claude/modules

# Link agents
ln -s ~/.claude/jarvis-v5/agents ~/.claude/agents

# Link skills
ln -s ~/.claude/jarvis-v5/skills ~/.claude/skills

# Initialize
/jarvis init
```

## File Structure

```
JARVIS/
├── README.md                          (You are here)
├── LICENSE                            (MIT)
├── modules/
│   ├── 00-routing.md                  (Complexity router, agent dispatcher)
│   ├── 01-planning.md                 (INTEL phase logic)
│   ├── 02-brainstorm.md               (BRAINSTORM phase, all modes)
│   ├── 03-build.md                    (BUILD phase, worktree isolation)
│   ├── 04-review.md                   (REVIEW phase, 6 gates + chain)
│   ├── 05-deliver.md                  (DELIVER phase, cleanup)
│   ├── 06-memory.md                   (5-layer memory system)
│   ├── 07-self-monitor.md             (Routing signals, learning)
│   ├── 08-skills.md                   (Skill compliance gate)
│   └── 99-commands.md                 (12 slash commands)
│
├── agents/
│   ├── architect.md                   (Senior design decision maker)
│   ├── code-reviewer.md               (Code review specialist)
│   ├── security-reviewer.md           (Security & hardening)
│   ├── design-reviewer.md             (UI/UX, visual consistency)
│   ├── backend-architect.md           (Infrastructure, scaling)
│   ├── creative.md                    (Novel approaches)
│   ├── pragmatist.md                  (Ship velocity)
│   ├── minimalist-designer.md         (Elegant simplicity)
│   ├── brutalist-designer.md          (Raw functionality)
│   ├── luxury-designer.md             (Premium experience)
│   ├── conversion-hawk.md             (Goal optimization)
│   ├── trend-scout.md                 (Modern patterns)
│   ├── judge.md                       (Brainstorm arbiter)
│   └── [270+ more specialists]
│
├── skills/
│   ├── nextjs-crm.md                  (Full-stack CRM skill)
│   ├── landingpage.md                 (Marketing site skill)
│   ├── hemsida.md                     (Swedish site builder)
│   └── [530 more skills]
│
├── memory/
│   ├── routing-signals.json           (Self-learning database)
│   ├── project-context.md             (Current project state)
│   ├── workflows-completed.log        (Historical record)
│   └── system-health.json             (Performance metrics)
│
├── mcp-servers/
│   ├── github.json                    (GitHub API + PRs)
│   ├── claude-docs.json               (Claude API docs)
│   ├── search.json                    (Web search)
│   ├── filesystem-sandbox.json        (Safe file operations)
│   ├── aws.json                       (AWS operations)
│   ├── stripe.json                    (Payment APIs)
│   └── postgres.json                  (Database operations)
│
├── scripts/
│   ├── install-full.sh
│   ├── install-minimal.sh
│   ├── self-test.sh
│   └── upgrade.sh
│
└── docs/
    ├── 01-getting-started.md          (Setup guide)
    ├── 02-commands.md                 (Slash command reference)
    ├── 03-agents.md                   (Agent directory & specs)
    ├── 04-skills.md                   (Skill directory & specs)
    ├── 05-examples.md                 (Real workflow examples)
    ├── 06-troubleshooting.md          (Common issues)
    └── 07-advanced.md                 (Custom agents, skills)
```

## Slash Commands

```
/jarvis init              Initialize JARVIS in current project
/jarvis status            Show current workflow phase & progress
/jarvis pause             Pause workflow, save state to jarvis-state.md
/jarvis resume            Resume from saved state
/jarvis override          Force specific routing (e.g., /override brainstorm-design-tribunal)
/self-test               Run 50+ assertions on JARVIS health
/skill add <name>        Add skill from library
/agent add <name>        Add agent from library
/mcp add <server>        Connect MCP server
/workflow history        Show last 10 completed workflows
/context show            Display current memory state (L1-L5)
/debug trace             Enable detailed trace logging
```

## Comparison to Other Systems

| Feature | JARVIS v5.0 | ECC | Ruflo | Claude Solo |
|---------|------------|-----|-------|------------|
| Multi-agent orchestration | Yes (310+) | Limited (8) | Yes (25) | No |
| Design tribunal | Yes (6-agent) | No | No | No |
| 6-step quality gates | Yes | 1 (test only) | 2 (build+test) | No |
| Session continuity | Yes (jarvis-state.md) | No | No | N/A |
| Self-learning routing | Yes | No | Partial | No |
| Hot-swap agents | Yes | No | No | N/A |
| Memory layers | 5 | 1 | 2 | 1 |
| Skill compliance gate | Yes (3-layer) | No | No | No |
| Token efficiency mode | Yes | No | No | N/A |
| Architecture tribunal | Yes (5-agent) | No | No | No |
| Rollback protocol | Yes | No | No | No |
| MCP integration | 7 servers | 2 | 1 | 0 |

## Quick Start Example

```
User: "Build a Next.js CRM dashboard with real-time sync"

JARVIS routing: Feature (15 files) → Full JARVIS

[JARVIS] PHASE 1/5: INTEL
  Reading skill: nextjs-crm.md
  Researching real-time patterns...
  Loading project context...
  ✓ Intelligence ready

[JARVIS] PHASE 2/5: BRAINSTORM - Design Tribunal
  Minimalist perspective: Clean, focused dashboard
  Luxury perspective: Premium animations, visual depth
  Trend Scout: Latest pattern: Shadcn + Recharts combo
  Judge fusing perspectives...
  ✓ Hybrid approach: Clean base + selective premium details

[JARVIS] PHASE 3/5: BUILD
  Architect agent: Creating structure
  Frontend agent: Components & hooks
  Backend agent: Real-time API
  ✓ Code ready for review

[JARVIS] PHASE 4/5: REVIEW
  Build gate: ✓ Pass
  Test gate: ✓ Pass
  A11y gate: ✓ WCAG AA
  Performance gate: ✓ <2s Lighthouse
  Code review: ✓ Approved
  Design review: ✓ Approved
  ✓ All gates passed

[JARVIS] PHASE 5/5: DELIVER
  Removed debug code
  Updated memory with learnings
  Generated workflow report
  ✓ Dashboard ready
```

## Requirements

- Claude Code (latest)
- Node.js 18+ or Python 3.9+ (depending on skills used)
- Git (for version control during builds)
- 500MB disk space (minimal install)
- 2GB disk space (full install with all 533 skills)

## Configuration

Create `.claude/jarvis.config.json`:

```json
{
  "model": "claude-sonnet-4",
  "fallback_model": "claude-opus-4",
  "max_agents_parallel": 6,
  "memory_retention_days": 90,
  "enable_self_learning": true,
  "quality_gates": ["build", "test", "a11y", "perf", "images", "karen"],
  "complexity_thresholds": {
    "quick_fix": 3,
    "feature": 10,
    "large": 999
  },
  "token_budget_per_workflow": 50000,
  "mcp_servers": [
    "github",
    "claude-docs",
    "filesystem-sandbox"
  ]
}
```

## Performance Characteristics

| Workflow Type | Avg Duration | Token Cost | Agent Count |
|---------------|-------------|-----------|------------|
| Quick fix | 30-60s | 1,200-2,000 | 0 |
| Feature (Lite) | 5-10 min | 8,000-12,000 | 6-8 |
| Large (Full) | 20-40 min | 25,000-45,000 | 12-18 |

Parallelization means 5 agents running simultaneously takes ~same time as 1 sequential agent.

## Core Concepts

### Skill Compliance Gate
3-layer enforcement (you cannot skip this):
1. **Load** the skill's SKILL.md
2. **Extract** required folder structure and components
3. **Follow** the skill's step flow exactly
4. Only then write code

Prevents monolith code when skill requires modular structure.

### Complexity Router
Automatically determines workflow depth:
- Count modified files
- Route to appropriate phase depth
- Select agent team size
- Allocate review intensity

### Agent Worthiness Test
Before spawning agent:
- Will this decision benefit from multiple perspectives?
- Is the outcome ambiguous/contentious?
- Is this a critical path item?

If all are "no", skip agent (save tokens). If any are "yes", dispatch.

### Context Compression
Between phases, complex context compressed to 50-80 words:
```
"CRM dashboard with real-time events. Stack: Next.js 14, Supabase, TailwindCSS.
Current schema: users, contacts, deals. Need WebSocket sync for deal updates.
Existing dashboard shows contact list and 3-column deal pipeline. Speed is critical."
```

This replaces 500-word context without losing intent.

## Troubleshooting

### "JARVIS not responding"
```
/self-test
```
Runs diagnostic. Most issues are:
- Missing skill definition → `/skill add <skill>`
- Agent offline → Check MCP servers
- Memory corruption → `/context reset` (careful!)

### "Review gates failing"
Check which gate failed:
- **Build gate:** Syntax error → Review code-reviewer output
- **Test gate:** Test failed → Debug test failures first
- **A11y gate:** WCAG issue → Review accessibility-expert output
- **Performance gate:** Regression → Profile before/after

### "Brainstorm agents disagreeing"
Feature is genuinely ambiguous. Good sign—means you need human decision input.
```
/jarvis pause
[Human decides between options]
/jarvis override brainstorm-pragmatist
/jarvis resume
```

### "Token budget exceeded"
Workflow is too large. Options:
1. Break into smaller features
2. Disable certain agents
3. Increase token budget in config
4. Use JARVIS Lite instead of Full

## Contributing

JARVIS is designed to be extended. To add:

**New skill:** Create `skills/your-skill.md` following the skill template, add to registry
**New agent:** Create `agents/your-agent.md`, define capabilities + constraints
**New module:** Create `modules/XX-your-module.md`, integrate into routing

See `docs/07-advanced.md` for detailed authoring guide.

## License

MIT License. See LICENSE file for details.

JARVIS v5.0 is built on Claude Code and maintains the same ethical guardrails.

## Support & Feedback

- **Issues:** GitHub Issues (bug reports, feature requests)
- **Discussions:** GitHub Discussions (questions, experiences)
- **Email:** Contact repository maintainer

## Changelog

### v5.0 (Current)
- Full multi-phase workflow system
- Design and Backend tribunals
- 6-step automated quality gates
- 310+ agent library
- 533 skills
- Self-learning routing
- Session continuity
- 5-layer memory

### v4.0
- Basic multi-agent brainstorm
- Single review pass
- 150 agents
- 300 skills

### v3.0
- Initial architect + reviewer pattern
- 50 agents
- 100 skills

---

**JARVIS v5.0** — Autonomous workflow excellence for Claude Code.

Built with precision. Built to ship. Built to learn.
