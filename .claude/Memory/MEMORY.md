# MEMORY INDEX — JARVIS v5.0 (5-Layer Architecture)

> Memory is organized in 5 tiers. Lower layers = cheaper to access, higher layers = more persistent.

---

## L1: CONVERSATIONAL (per-session, auto-cleared)
*What's happening right now. Tasks in progress, current decisions.*
Lives in context window — no files needed. Cleared each new session.

## L2: WORKING (cross-session, per-project)
*Active project state, recent decisions, in-progress work.*
<!-- Add your project memory files here -->
<!-- Example: - [project_myapp.md](project_myapp.md) — MyApp: stack, status, architecture -->

## L3: VAULT (permanent, cross-project)
*Who the user is, how they work, what they've decided. Never auto-deleted.*
- [user_profile.md](user_profile.md) — User role, preferences, working style
- [feedback_dev.md](feedback_dev.md) — Development workflow corrections
- [feedback_communication.md](feedback_communication.md) — Communication preferences
- [feedback_design.md](feedback_design.md) — Design quality standards

## L4: EPISODIC (session logs, learnings)
*What happened in past sessions. Patterns discovered. Mistakes made.*
- [routing-signals.md](routing-signals.md) — Self-learning routing: skill/agent match scores
- [routing-overrides.md](routing-overrides.md) — Learned route overrides from signal analysis

## L5: SELF-HEALING (rules from failures)
*Every mistake becomes a rule. Every rule prevents the same mistake.*
<!-- Populates automatically as failures occur and lessons are extracted -->

---

## TIER RULES

1. **Session start:** Read L3 (vault) + relevant L2 (working) + L4 routing-overrides. Max 3 files.
2. **During session:** L1 is the context window. Don't load L3/L4 mid-task unless needed.
3. **Session end:** Log routing signal to L4. If failure → extract rule to L5. Promote L1 insights to L2/L3.
4. **Never:** Load all tiers at once. Read L5 only when routing or at session start.
5. **Decay:** L4 signals older than 90 days get half weight. L2 project files updated when state changes.
