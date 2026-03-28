# SKILL ROADMAP — JARVIS v5.0
Last updated: 2026-03-28

> **533 skills installed.** JARVIS auto-matches skills via their `description` frontmatter.
> This ROADMAP exists for: (1) manual lookup if auto-match misses, (2) understanding what's available, (3) updating when adding skills.

---

## HOW AUTO-ROUTING WORKS

Claude Code reads each skill's `description` field automatically. When you give a task, it matches against all installed skills without consulting this ROADMAP. ROADMAP is backup, not primary router.

---

## CATEGORY INDEX (533 skills, 310 agents, 12 commands, 7 MCP)

### WORKFLOW & PROCESS (8 skills)
Core workflow, planning, verification, context management.
**Key:** `workflow` (JARVIS v5.0) · `planning-with-files` · `context-budget` · `verification-loop` · `verification-before-completion` · `strategic-compact` · `continuous-learning-v2` · `agentic-engineering`

### FRONTEND & UI (35+ skills)
React, Next.js, Tailwind, shadcn, animation, design systems, responsive, performance.
**Key:** `frontend-design` (Anthropic Official) · `react-best-practices` (Vercel) · `composition-patterns` (Vercel) · `web-design-guidelines` (Vercel) · `shadcn-blocks` · `tailwind-v4-shadcn` · `framer-motion` · `design-system` · `ui-ux-pro-max`

### SEO & VISIBILITY (20+ skills)
On-page, technical, content, schema, local, international, AI search, programmatic.

### FULL-STACK DEVELOPMENT (30+ skills)
APIs, databases, auth, state, deployment, patterns per framework.

### TESTING & SECURITY (25+ skills)
TDD, E2E, security review, vulnerability scanning, mutation testing.

### MARKETING & GROWTH (40+ skills)
Ads, CRO, email, copy, content, social, analytics, pricing, launch, referral.

### AUTOMATION & INTEGRATIONS (15+ skills)
n8n, MCP servers, data scraping, document processing.

### AI & ML (10+ skills)
LLM APIs, agent building, ML pipelines, model training/deployment.

### DEVOPS & INFRASTRUCTURE (15+ skills)
Docker, CI/CD, Terraform, Kubernetes, deployment, monitoring.

### BUSINESS & PRODUCT (10+ skills)
MVP, pricing, community, product strategy.

### META-SKILLS (10+ skills)
Skill creation, auditing, compliance, prompt optimization.

---

## AGENTS (310 — auto-dispatched via JARVIS protocol)

### Brainstorm Team (PHASE 2)
`architect` (opus) · `ui-designer` (opus) · `planner` (opus)

### Website Build Team (PHASE 3)
`website-architect` (opus) · `frontend-developer` · `conversion-optimizer` · `seo-specialist`

### Full-Stack Build Team (PHASE 3)
`fullstack-developer` · `api-designer` · `database-reviewer`

### Review Chain (PHASE 4)
`code-reviewer` · `typescript-reviewer` · `security-reviewer` · `design-reviewer` · `qa-expert` · `accessibility-tester` · `performance-engineer`

### + 290 more specialist agents
DevOps, testing, data, AI, content, business, architecture, orchestration, language specialists, and domain experts. See `ls ~/.claude/agents/` for the full list.

---

## SLASH COMMANDS (12)
`/plan` · `/code-review` · `/verify` · `/multi-frontend` · `/multi-plan` · `/multi-execute` · `/build-fix` · `/refactor-clean` · `/e2e` · `/quality-gate` · `/health-check` · `/self-test`

---

## MCP SERVERS (7)
`supabase` · `playwright` · `github` · `firecrawl` + configure your own in `settings.json`

---

## RULES

1. **New skill** → Add to correct category
2. **Skill updated** → Update description if trigger changes
3. **Skill obsolete** → Remove from ROADMAP
4. **New agent/command/MCP** → Add to respective section
