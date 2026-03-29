---
name: auto
description: Manually trigger the AutoLearning Claude Agent workflow. Usually not needed — the system loads automatically at every session start via CLAUDE.md. Use /auto to re-initialize mid-session if needed.
---

# /auto — AutoLearning Claude Agent

This command manually triggers the full AutoLearning initialization sequence.

**You normally don't need this** — the system loads automatically at every session start via CLAUDE.md. Use `/auto` only if:
- You want to re-initialize mid-session
- Something feels off and you want a fresh routing check
- You switched projects and want to reload context

## What /auto does:

1. Load `~/.claude/skills/Workflow/SKILL.md` (master workflow)
2. Run Section 0 (SESSION START):
   - Read `~/.claude/Memory/MEMORY.md` → load relevant memory files
   - Read `~/.claude/Memory/routing-overrides.md` → apply learned routes
   - Read `~/.claude/Memory/instincts.md` → load always-on behavioral rules
   - Check `~/.claude/Memory/session-notes.md` → session continuity
   - Apply JIT Context Bracket (FRESH/MODERATE/DEPLETED based on session state)
3. Detect intent from the next user message
4. Auto-route to matching skill + agent
5. Activate AutoLearning Protocol based on complexity

## Confirmation:

After running, confirm with:
```
[AutoLearning] System loaded. 15 modules, 12 instincts, [N] memory files.
Ready for task. Context bracket: [FRESH|MODERATE|DEPLETED].
```
