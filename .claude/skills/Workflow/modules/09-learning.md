# MODULE 09 — SELF-LEARNING & SKILL EVOLUTION
# Loaded at: SESSION END (after task completion, before 07-self-monitor)
# Inspired by: Ruflo adaptive routing + OpenSpace self-evolving skills

---

## Purpose

JARVIS starts static — tasks match skills/agents by description. This module makes it ADAPTIVE:
1. **Routing learning** — better skill/agent matching over time
2. **Skill evolution** — skills auto-improve from execution outcomes
3. **Quality tracking** — skills below threshold get flagged/deprecated
4. **Auto-repair** — broken skills get patched, not just reported

---

## 1. POST-TASK SIGNAL CAPTURE

After EVERY completed task, log a signal:

```markdown
<!-- Append to ~/.claude/Memory/routing-signals.md -->

## [DATE] — [TASK SUMMARY]
- **Skill:** [name] | Score: [1-5] | First-try success: [yes/no]
- **Agents:** [names] | Score: [1-5]
- **User feedback:** [positive/negative/neutral]
- **Tokens used:** [estimate — low/medium/high]
- **Lesson:** [one sentence — what to do differently]
```

Scoring: 5=perfect first try, 4=minor fixes, 3=acceptable, 2=wrong match, 1=wasted time.

---

## 2. ROUTING INTELLIGENCE UPDATE

Every 10 signals (or session end if >5 new), analyze:

**Weak routes (avg < 3 over 3+ tasks):**
→ Find alternative skill or flag in ROADMAP

**Strong routes discovered:**
→ Update skill description or add to routing-overrides.md

**Missing coverage (task matched NO skill):**
→ Flag for skill creation (Module 08 §B)

**Update `routing-overrides.md`** with learned routes. At session start, read overrides before auto-routing.

---

## 3. SKILL EVOLUTION (inspired by OpenSpace)

After a skill is used, evaluate whether it should evolve:

### 3a. Success Rate Tracking

Every skill gets a running success rate based on routing signals:

```
Skill success rate = (signals with score ≥ 4) / (total signals for this skill)
```

Track in routing-signals.md. When analyzing:

| Success Rate | Action |
|---|---|
| ≥ 90% | Skill is healthy — no changes |
| 70-89% | **Evolution candidate** — analyze what failed, consider appending improvements |
| 50-69% | **Needs attention** — review skill rules, may be outdated or too narrow |
| < 50% | **Deprecation candidate** — flag in ROADMAP, stop routing to it |

### 3b. Auto-Evolution (append improvements to skill)

When a skill scores 70-89% AND you can identify a specific improvement:

1. Read the skill's SKILL.md
2. Identify what caused the < 4 scores (from signal lessons)
3. **Append** a new section to the skill:

```markdown
---
## LEARNED PATTERN — Added [DATE]
Based on [N] executions, this improvement was identified:
[Specific improvement — e.g., "Always pair with frontend-design skill for visual tasks"]
```

**Rules:**
- NEVER rewrite existing skill content — only APPEND
- NEVER auto-evolve without 3+ consistent signals
- Mark every evolution with date so it can be reviewed/reverted
- Skills from official sources (Anthropic, Vercel) are NEVER auto-evolved — only custom skills

### 3c. Auto-Repair (fix broken skills)

If a skill consistently fails (score ≤ 2 for 3+ consecutive tasks):

1. Read the skill's SKILL.md
2. Check if the failure is a **structural issue** (wrong paths, outdated API, missing dependency)
3. If fixable: **append a correction** to the skill with `## FIX — [DATE]`
4. If not fixable: **flag for manual review** and add to L5 self-healing memory

```markdown
---
## FIX — [DATE]
Previous instruction [X] caused failures because [reason].
Corrected approach: [new instruction].
```

**Auto-repair triggers:**
- 3 consecutive score ≤ 2 for the same skill
- Build failure traced to a skill's folder structure being outdated
- Dependency referenced in skill no longer exists

**Auto-repair limits:**
- Max 1 auto-repair per skill per week
- If repair doesn't improve score within 3 tasks → escalate to user
- Never delete content — only append fixes

---

## 4. SKILL MATURITY LIFECYCLE

Every skill progresses through maturity stages based on execution data. This provides stronger guarantees than simple success rates.

### 4a. Maturity Stages

| Stage | Criteria | Meaning |
|---|---|---|
| **DRAFT** | New skill, < 3 executions | Untested — may have structural issues |
| **TESTED** | 3+ executions, avg score ≥ 3.0 | Works but not battle-hardened |
| **HARDENED** | 5+ executions, avg score ≥ 4.0, 0 critical failures | Reliable for production use |
| **CRYSTALLIZED** | 10+ executions, avg score ≥ 4.5, stable for 30+ days | Git-tagged as immutable reference |

### 4b. Stage Transitions

```
DRAFT → TESTED
  Trigger: 3rd execution with avg score ≥ 3.0
  Action: Log transition to routing-signals.md

TESTED → HARDENED
  Trigger: 5th execution with avg score ≥ 4.0 AND 0 score-1 entries
  Action: Log transition, increase routing priority

HARDENED → CRYSTALLIZED
  Trigger: 10th execution with avg ≥ 4.5 AND no changes needed for 30 days
  Action: Git tag (skill-[name]-v1.0), mark as immutable reference
  Rule: Crystallized skills are NEVER auto-evolved — only manually revised

Any stage → DRAFT (regression)
  Trigger: 2 consecutive scores ≤ 2 after being TESTED/HARDENED
  Action: Reset to DRAFT, flag for review, log regression reason
```

### 4c. Tracking Format

Add maturity to the skill's routing-signals entry:

```markdown
## Skill: [name]
- **Stage:** [DRAFT|TESTED|HARDENED|CRYSTALLIZED]
- **Executions:** [N]
- **Avg score:** [X.X]
- **Last transition:** [date] [from → to]
- **Git tag:** [tag name, if crystallized]
```

### 4d. Routing Priority by Maturity

When multiple skills could match a task:

| Maturity | Priority |
|---|---|
| CRYSTALLIZED | Highest — proven reliable |
| HARDENED | High — battle-tested |
| TESTED | Normal — functional |
| DRAFT | Low — use only if no better match |

**Rule:** Never auto-route to a DRAFT skill when a TESTED+ alternative exists.

---

## 5. SKILL DEPRECATION

When a skill's success rate drops below 50% over 5+ tasks:

1. Add `⚠️ DEPRECATED` prefix to the skill's description in frontmatter
2. Log deprecation to routing-signals.md with reason
3. Update routing-overrides.md to route away from this skill
4. Do NOT delete the skill — it may contain useful reference content
5. Notify user: "Skill [X] has been deprecated due to low success rate. Consider reviewing or replacing."

---

## 6. CROSS-PROJECT LEARNING

When a lesson learned in one project applies broadly:

1. Check if the lesson is project-specific or universal
2. **Project-specific** → stays in L2 (working memory) or L4 (episodic)
3. **Universal** → promote to L3 (vault) feedback file:
   - Dev pattern → append to `feedback_dev.md`
   - Design pattern → append to `feedback_design.md`
   - New pattern category → create new `feedback_[topic].md` in L3

**Trigger:** A lesson appears in 2+ different projects → auto-promote to L3.

---

## 7. INTEGRATION WITH WORKFLOW

### At Session Start (Module 04):
```
Read routing-overrides.md → apply learned routes before auto-routing
Check if any skills were flagged for deprecation → respect deprecation flags
```

### At Session End (before Module 07):
```
Step 0: Capture routing signal
Step 1: Update success rates for used skills
Step 2: If 10+ new signals → run routing intelligence update
Step 2b: Update maturity stages for used skills
Step 3: Check for evolution candidates (70-89% skills)
Step 4: Check for auto-repair triggers (3x consecutive ≤ 2)
Step 5: Check for deprecation candidates (< 50% over 5+ tasks)
Step 6: Check for cross-project learning opportunities
Step 7: Update routing-overrides.md and skill files if needed
```

---

## 8. ANTI-PATTERNS

- **Never override based on 1 signal** — minimum 2-3 consistent signals
- **Never rewrite skill content** — only append (evolution, fixes, deprecation notes)
- **Never auto-evolve official skills** (Anthropic, Vercel, Trail of Bits)
- **Never delete a skill** — deprecate and route away instead
- **Decay old signals** — older than 90 days get half weight
- **User feedback overrides everything** — explicit "use X" = 5/5 signal
- **Don't over-evolve** — max 1 evolution append per skill per week
