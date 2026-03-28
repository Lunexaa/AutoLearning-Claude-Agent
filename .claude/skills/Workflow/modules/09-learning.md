# MODULE 09 — SELF-LEARNING ROUTING
# Loaded at: SESSION END (after task completion, before 07-self-monitor)

---

## Purpose

JARVIS routing is static by default — tasks match skills/agents by description. This module makes routing ADAPTIVE: it learns from every task what worked and what didn't, and updates routing intelligence over time.

---

## 1. POST-TASK SIGNAL CAPTURE

After EVERY completed task (before session end), log a routing signal:

```markdown
<!-- Append to ~/.claude/Memory/routing-signals.md -->

## [DATE] — [TASK SUMMARY]
- **Matched skill:** [skill name] | Score: [1-5 how well it fit]
- **Matched agents:** [agent names] | Score: [1-5]
- **User feedback:** [positive/negative/neutral — from user's reaction]
- **Build succeeded first try:** [yes/no]
- **Design review score:** [if applicable, from Phase 4]
- **Lesson:** [one sentence — what should route differently next time?]
```

**Scoring guide:**
- 5 = Perfect match, skill/agent solved it first try
- 4 = Good match, minor adjustments needed
- 3 = Acceptable, but another skill would have been better
- 2 = Wrong match, caused rework
- 1 = Complete mismatch, wasted time

---

## 2. ROUTING INTELLIGENCE UPDATE

Every 10 signals (or at session end if >5 new signals), analyze patterns:

### Check for:

**Weak routes (avg score < 3 over 3+ tasks):**
- Skill X keeps getting matched but scores poorly → find alternative or note in ROADMAP
- Agent Y gets dispatched but adds no value → stop dispatching for this task type

**Strong routes discovered:**
- Unexpected skill worked great for task type not in its description → update skill description or add to auto-route table
- Agent combination that produced exceptional results → document as preferred team

**Missing coverage:**
- Task type that matched NO skill → flag for new skill creation (Module 08-skills §B)
- Domain where agents were dispatched but no specialist exists → flag for agent gap

### Update actions:

1. **Update `~/.claude/Memory/routing-overrides.md`** with learned routes:
```markdown
## Learned Routes (auto-updated)

| Task pattern | Default route | Override to | Reason | Confidence |
|---|---|---|---|---|
| "build dashboard with charts" | interface-design | interface-design + tanstack-table | Charts need data tables too | 4/5 (3 tasks) |
| "fix WhatsApp webhook" | nextjs-crm | nextjs-crm + api-design | Webhook = API design pattern | 5/5 (2 tasks) |
| "landing page for restaurant" | Landingpage | Landingpage + frontend-design | Design quality needs both | 5/5 (tested) |
```

2. **At SESSION START**, read `routing-overrides.md` before auto-routing → apply overrides if task pattern matches.

---

## 3. ANTI-PATTERNS FOR LEARNING

- **Never override based on 1 signal** — minimum 2 consistent signals before creating an override
- **Never remove a working route** — only ADD overrides, don't delete existing auto-route table entries
- **Decay old signals** — signals older than 90 days get half weight (context changes)
- **User explicit feedback overrides everything** — if user says "use X skill", that's a 5/5 signal

---

## 4. INTEGRATION WITH WORKFLOW

### At Session Start (Module 04):
```
Step 3.5: Read ~/.claude/Memory/routing-overrides.md (if exists)
→ Apply learned overrides before standard auto-routing
```

### At Session End (before Module 07):
```
Step 0: Capture routing signal for completed task
Step 1: If 10+ new signals → run routing intelligence update
Step 2: Update routing-overrides.md if patterns found
```
