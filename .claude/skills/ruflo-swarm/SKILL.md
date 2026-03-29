# ruflo-swarm

**What:** Ruflo (formerly Claude Flow) — enterprise multi-agent orchestration for Claude Code. Hierarchical swarm with 100+ specialized agents, WASM acceleration, vector memory.
**Version:** 3.5.48 · **Requires:** Node.js 20+ · Claude Code authenticated
**Created:** 2026-03-26

---

## INSTALL

```bash
# Install
curl -fsSL https://cdn.jsdelivr.net/gh/ruvnet/ruflo@main/scripts/install.sh | bash
# OR
npm install -g ruflo@latest

# Register with Claude Code
claude mcp add ruflo -- ruflo mcp start

# Verify
ruflo doctor
ruflo init --yes
```

---

## CORE CONCEPTS

| Component | What it does |
|---|---|
| Queen Coordinator | Orchestrates all agents, prevents goal drift |
| Coder agent | Implementation tasks |
| Tester agent | TDD, verification, >90% coverage targets |
| Reviewer agent | Code quality, regressions |
| Architect agent | Architecture decisions |
| Memory-Specialist | AgentDB, HNSW vector retrieval |
| WASM kernel | <1ms code transforms (352x faster than LLM) |
| SONA | Self-optimizing neural routing, adapts in <0.05ms |

---

## SWARM LIFECYCLE

```bash
# 1. Initialize
ruflo swarm init

# 2. Spawn agents
ruflo spawn coordinator
ruflo spawn coder
ruflo spawn tester
ruflo spawn reviewer

# 3. Delegate tasks
ruflo delegate [agent-id] "[task with full context]"

# 4. Monitor
ruflo swarm status
ruflo status [agent-id]

# 5. Shutdown
ruflo swarm shutdown
```

---

## MEMORY INTEGRATION

Before any agent is delegated a task, inject memory context:

```bash
# Load project memory into agent context
ruflo delegate [agent-id] "$(cat ~/.claude/Memory/feedback_dev.md) --- TASK: [your task]"
```

**Required memory files to inject per task type:**
- All tasks: `feedback_dev.md` + `feedback_communication.md`
- project-specific: + `project_[name].md` + `feedback_[project].md` (if they exist)

---

## STACK CONSTRAINTS (inject into every agent)

```
Next.js 16.2.1+ (your-project) / Next.js 14 (your-project)
Prisma: db push NEVER migrate dev. Build: prisma generate && next build
Supabase: port 6543, pgbouncer=true, connection_limit=1
Cloudflare DNS: grey cloud only. R2_PUBLIC_URL must be set.
Chromium: @sparticuz/chromium full package ONLY.
Vercel: auto-deploy from main branch.
```

---

## DELEGATION PATTERN (Architect/Manager)

```
You (Architect) → review plan → verify DoD
  │
  ├─ Coder agent   → implements feature per task
  ├─ Tester agent  → verifies render + all CRUD work (not just route exists)
  └─ Reviewer agent → checks regressions + code quality
```

**Rules:**
- Architect defines tasks + success criteria before spawning agents
- Tester MUST verify page renders without error AND CRUD works in browser
- Reviewer must confirm no unintended file changes
- If agent fails or returns incomplete → re-delegate, never skip verification
- Architect reviews ALL results before declaring DONE

---

## TOPOLOGIES

| Topology | When to use |
|---|---|
| Hierarchical-mesh (default) | Standard complex tasks |
| Full mesh | All agents need each other's output |
| Ring | Sequential pipeline tasks |
| Star | One coordinator, many workers |

```bash
ruflo swarm config hierarchical  # Switch topology
```

---

## VECTOR MEMORY

```bash
ruflo vector search "[query]"   # Semantic search across sessions
ruflo vector status              # HNSW index health
ruflo memory list                # All stored memories
```

HNSW indexing: 150x-12,500x faster search. Sub-millisecond retrieval.

---

## MCP TOOLS (313 tools via 31 modules)

```bash
ruflo mcp start    # Start MCP server (port 3000 default)
ruflo mcp list     # Show all available tools
ruflo mcp status   # Health check
```

---

## DIAGNOSTICS

```bash
ruflo doctor           # Full system validation
ruflo version          # Version info
ruflo config show      # Current configuration
ruflo security audit   # CVE + vulnerability scan
```

---

## PERFORMANCE

- Agent spawn: <200ms · Swarm consensus: <100ms · WASM: <1ms
- Flash Attention: 2.49x-7.47x speedup, 50-75% memory reduction
- Token compression: 30-50% API cost reduction
- SWE-Bench: 84.8% solve rate · Speed vs sequential: 2.8-4.4x

---

## NEXT.JS INTEGRATION (API route pattern)

```typescript
// app/api/agents/route.ts
import { initializeV3Swarm } from 'ruflo';

export async function POST(req: Request) {
  const swarm = await initializeV3Swarm({ maxAgents: 5 });
  const result = await swarm.delegate(await req.json());
  return Response.json(result);
}
```

---

## ENV VARS

```bash
CLAUDE_API_KEY=...       # Anthropic key (required)
MCP_SERVER_PORT=3000     # MCP server port
LOG_LEVEL=info           # debug|info|warn|error
AGENT_MAX_MEMORY=...     # Per-agent memory limit
```
