# Self-Test — AutoLearning v5.0 System Integrity Validator

Run a comprehensive diagnostic of the entire AutoLearning system. Checks structural integrity, cross-references, and configuration health across all components.

## Execution

Run ALL checks below using bash. Report results as a scorecard.

### CHECK 1: Core Files Exist
```bash
echo "=== CORE FILES ==="
for f in \
  ~/.claude/CLAUDE.md \
  ~/.claude/ROADMAP.md \
  ~/.claude/settings.json \
  ~/.claude/skills/Workflow/SKILL.md \
  ~/.claude/skills/Workflow/modules/01-planning.md \
  ~/.claude/skills/Workflow/modules/02-execution.md \
  ~/.claude/skills/Workflow/modules/03-verification.md \
  ~/.claude/skills/Workflow/modules/04-session.md \
  ~/.claude/skills/Workflow/modules/05-memory.md \
  ~/.claude/skills/Workflow/modules/06-pm.md \
  ~/.claude/skills/Workflow/modules/07-self-monitor.md \
  ~/.claude/skills/Workflow/modules/08-skills.md \
  ~/.claude/skills/Workflow/modules/09-learning.md \
  ~/.claude/Memory/MEMORY.md \
  ~/.claude/Memory/routing-overrides.md \
  ~/.claude/Memory/routing-signals.md \
  ~/.claude/Memory/feedback_design.md \
  ~/.claude/Memory/feedback_dev.md \
  ~/.claude/Memory/feedback_communication.md \
  ~/.claude/Memory/user_profile.md; do
  if [ -f "$f" ]; then echo "✅ $(basename $f)"; else echo "❌ MISSING: $f"; fi
done
```

### CHECK 2: Component Counts
```bash
echo "=== COUNTS ==="
echo "Skills: $(ls ~/.claude/skills/ | wc -l | tr -d ' ')"
echo "Agents: $(ls ~/.claude/agents/ | wc -l | tr -d ' ')"
echo "Commands: $(ls ~/.claude/commands/ | wc -l | tr -d ' ')"
echo "MCP Servers: $(cat ~/.claude/settings.json | python3 -c "import json,sys; print(len(json.load(sys.stdin).get('mcpServers',{})))")"
echo "Memory files: $(find ~/.claude/Memory -name '*.md' | wc -l | tr -d ' ')"
echo "Workflow modules: $(ls ~/.claude/skills/Workflow/modules/*.md | wc -l | tr -d ' ')"
```

### CHECK 3: Skills Have SKILL.md
```bash
echo "=== SKILL INTEGRITY ==="
total=$(ls -d ~/.claude/skills/*/ | wc -l | tr -d ' ')
valid=$(find ~/.claude/skills -maxdepth 2 -name "SKILL.md" | wc -l | tr -d ' ')
orphan=$((total - valid))
echo "Total skill dirs: $total"
echo "With SKILL.md: $valid"
echo "Orphan dirs (no SKILL.md): $orphan"
if [ "$orphan" -gt 10 ]; then echo "⚠️ Many orphan dirs — check for empty skills"; fi
```

### CHECK 4: Agents Have Frontmatter
```bash
echo "=== AGENT INTEGRITY ==="
total=$(ls ~/.claude/agents/*.md | wc -l | tr -d ' ')
with_name=$(grep -l "^name:" ~/.claude/agents/*.md 2>/dev/null | wc -l | tr -d ' ')
without=$((total - with_name))
echo "Total agents: $total"
echo "With name frontmatter: $with_name"
echo "Without frontmatter: $without"
if [ "$without" -gt 20 ]; then echo "⚠️ Many agents lack frontmatter — auto-matching may miss them"; fi
```

### CHECK 5: Version Consistency
```bash
echo "=== VERSION SYNC ==="
workflow_ver=$(grep -o "v5\.[0-9]" ~/.claude/skills/Workflow/SKILL.md | head -1)
claude_ver=$(grep -o "v5\.[0-9]" ~/.claude/CLAUDE.md | head -1)
roadmap_ver=$(grep -o "v5\.[0-9]" ~/.claude/ROADMAP.md | head -1)
echo "Workflow: $workflow_ver"
echo "CLAUDE.md: $claude_ver"
echo "ROADMAP: $roadmap_ver"
if [ "$workflow_ver" = "$claude_ver" ] && [ "$claude_ver" = "$roadmap_ver" ]; then
  echo "✅ All versions match"
else
  echo "❌ VERSION MISMATCH — sync needed"
fi
```

### CHECK 6: MCP Server Config
```bash
echo "=== MCP SERVERS ==="
cat ~/.claude/settings.json | python3 -c "
import json, sys
d = json.load(sys.stdin)
for name, cfg in d.get('mcpServers', {}).items():
    env = cfg.get('env', {})
    placeholders = [k for k, v in env.items() if '\${' in str(v)]
    if placeholders:
        print(f'⚠️  {name}: {len(placeholders)} unconfigured env vars ({", ".join(placeholders)})')
    else:
        print(f'✅ {name}: configured')
"
```

### CHECK 7: AutoLearning Protocol Integrity
```bash
echo "=== AutoLearning PROTOCOL ==="
wf=~/.claude/skills/Workflow/SKILL.md
for phase in "PHASE 1" "PHASE 2" "PHASE 3" "PHASE 4" "PHASE 5"; do
  if grep -q "$phase" "$wf"; then echo "✅ $phase defined"; else echo "❌ $phase MISSING"; fi
done
if grep -q "DESIGN TRIBUNAL" "$wf"; then echo "✅ Design Tribunal"; else echo "❌ Design Tribunal MISSING"; fi
if grep -q "SKILL COMPLIANCE GATE" "$wf"; then echo "✅ Skill Compliance Gate"; else echo "❌ Skill Compliance Gate MISSING"; fi
if grep -q "routing-overrides" "$wf"; then echo "✅ Self-learning routing connected"; else echo "❌ Self-learning NOT connected"; fi
```

### CHECK 8: Memory Tier Structure
```bash
echo "=== MEMORY TIERS ==="
for tier in L1-conversational L2-working L3-vault L4-episodic L5-self-healing; do
  if [ -d ~/.claude/Memory/$tier ]; then echo "✅ $tier dir exists"; else echo "⚠️ $tier dir missing"; fi
done
if grep -q "5-Layer" ~/.claude/Memory/MEMORY.md; then echo "✅ MEMORY.md has 5-layer structure"; else echo "❌ MEMORY.md not updated"; fi
```

### CHECK 9: Critical Cross-References
```bash
echo "=== CROSS-REFERENCES ==="
# CLAUDE.md references Workflow
if grep -q "AutoLearning" ~/.claude/CLAUDE.md; then echo "✅ CLAUDE.md → AutoLearning"; else echo "❌ CLAUDE.md missing AutoLearning ref"; fi
# CLAUDE.md references Skill Compliance Gate
if grep -q "SKILL COMPLIANCE GATE" ~/.claude/CLAUDE.md; then echo "✅ CLAUDE.md → Compliance Gate"; else echo "❌ CLAUDE.md missing gate"; fi
# CLAUDE.md references Design Tribunal
if grep -q "DESIGN TRIBUNAL" ~/.claude/CLAUDE.md; then echo "✅ CLAUDE.md → Design Tribunal"; else echo "❌ CLAUDE.md missing tribunal"; fi
# Workflow references routing-overrides
if grep -q "routing-overrides" ~/.claude/skills/Workflow/SKILL.md; then echo "✅ Workflow → routing-overrides"; else echo "❌ Workflow missing learning"; fi
```

### CHECK 10: Disk Usage
```bash
echo "=== DISK USAGE ==="
echo "Skills: $(du -sh ~/.claude/skills/ 2>/dev/null | cut -f1)"
echo "Agents: $(du -sh ~/.claude/agents/ 2>/dev/null | cut -f1)"
echo "Memory: $(du -sh ~/.claude/Memory/ 2>/dev/null | cut -f1)"
echo "Total .claude: $(du -sh ~/.claude/ 2>/dev/null | cut -f1)"
```

## Output Format

After running all checks, produce a scorecard:

```
╔══════════════════════════════════════════╗
║         AutoLearning v5.0 SELF-TEST           ║
╠══════════════════════════════════════════╣
║ Core files:        XX/XX  ✅/❌          ║
║ Skills:            XXX installed         ║
║ Agents:            XXX installed         ║
║ Commands:          XX installed          ║
║ MCP Servers:       X/X configured        ║
║ Skill integrity:   XX orphan dirs        ║
║ Agent frontmatter: XX% coverage          ║
║ Version sync:      ✅/❌                  ║
║ AutoLearning protocol:   X/7 phases OK         ║
║ Memory tiers:      X/5 present           ║
║ Cross-references:  X/4 connected         ║
║ Self-learning:     ✅/❌ connected        ║
╠══════════════════════════════════════════╣
║ OVERALL:  HEALTHY / NEEDS ATTENTION      ║
╚══════════════════════════════════════════╝
```
