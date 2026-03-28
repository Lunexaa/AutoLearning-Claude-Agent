# Health Check — Verify GODMODE installation

Run a full diagnostic of the Claude Code GODMODE setup. Checks skills, agents, commands, MCP servers, and ROADMAP integrity.

## Steps

1. **Count components:**
```bash
echo "Skills: $(ls ~/.claude/skills/ | wc -l | tr -d ' ')"
echo "Agents: $(ls ~/.claude/agents/ | wc -l | tr -d ' ')"
echo "Commands: $(ls ~/.claude/commands/ | wc -l | tr -d ' ')"
echo "MCP Servers: $(cat ~/.claude/settings.json | python3 -c "import json,sys; print(len(json.load(sys.stdin).get('mcpServers',{})))")"
```

2. **Verify critical files exist:**
- `~/.claude/ROADMAP.md`
- `~/.claude/CLAUDE.md`
- `~/.claude/skills/Workflow/SKILL.md`
- `~/.claude/skills/Workflow/modules/01-planning.md`
- `~/.claude/skills/Workflow/modules/02-execution.md`
- `~/.claude/skills/Workflow/modules/03-verification.md`

3. **Check agent stack awareness** — grep each agent for "next.js|nextjs|supabase|prisma|tailwind" and flag any that score 0.

4. **Check MCP server env vars** — for each server in settings.json, check if env vars reference `${...}` placeholders (unconfigured) or actual values.

5. **Verify ROADMAP matches actual skills** — compare skill names in ROADMAP.md against `ls ~/.claude/skills/`.

6. **Output a scorecard:**
```
GODMODE Health Check
═══════════════════
Skills:     XX/XX present  ✓/✗
Agents:     XX/XX stack-aware  ✓/✗
Commands:   XX present  ✓
MCP:        XX configured, XX need env vars  ⚠
ROADMAP:    XX skills listed, XX actual  ✓/✗
Workflow:   v4.0  ✓

Overall: HEALTHY / NEEDS ATTENTION
```
