# MEMORY INDEX -- 3-TIER ARCHITECTURE

> Memory is organized in 3 tiers. Each tier serves a different purpose and retention horizon.
> See Module 05 for details.

---

## TIER 1: WORKING (in-session, project-scoped)

*Active project state and recent decisions you need RIGHT NOW.*

- `project_[name].md` -- Your project: stack, status, key decisions
- `session-notes.md` -- Live memory written during work + pre-compaction capture (Module 15 S1)
- `branches/[branch-name].md` -- Branch-specific memory (Module 15 S5)

---

## TIER 2: VAULT (persistent, cross-project)

*Rules, patterns, and user identity that apply ACROSS projects. Never auto-deleted.*

- `user_profile.md` -- Who you are, working style, preferences
- `feedback_dev.md` -- Dev patterns and corrections
- `feedback_communication.md` -- Communication preferences
- `feedback_design.md` -- Design standards and patterns
- `feedback_[domain].md` -- Domain-specific patterns (create as needed)
- `instincts.md` -- Always-on behavioral rules (Module 15 S3). Max 15 instincts.

---

## TIER 3: SIGNALS (learning data, analyzed offline)

*Routing intelligence and pattern discovery for future improvement.*

- `routing-signals.md` -- Task execution scores (skill match quality, first-try success per task)
- `routing-overrides.md` -- Learned route overrides discovered from signal analysis
- `.freshness-tracker` -- Domain freshness tracking (auto-updated by hooks)
- Pattern mining outputs -- Cross-project lessons, auto-generated instinct candidates (Module 09 S11)
- Decay tracking -- Memory re-verification schedule (Module 09 S12)

---

## ACCESS PATTERNS

| Phase | Read | Write | Max load |
|-------|------|-------|----------|
| **Session start** | Tier 2 (vault) + relevant Tier 1 + Tier 3 overrides | -- | 3 files |
| **During work** | Tier 1 (continuous) + Tier 3 (on routing need) | Tier 1 (real-time) | HOT/WARM/COLD tiers (Module 15 S2) |
| **Pre-compaction** | -- | Tier 1 session-notes (via hook) | -- |
| **Session end** | -- | Tier 3 signals + Tier 1 to Tier 2 promotion | -- |

---

## RULES

1. **Tier 1 (WORKING):** Project-scoped, read at session start, written in real-time.
2. **Tier 2 (VAULT):** Global, loaded at every session, never auto-deleted.
3. **Tier 3 (SIGNALS):** Used for routing decisions, analyzed at session end, older signals decay.
4. **Cross-project promotion:** Entries in Tier 1 with `scope: cross-project` get promoted to Tier 2.
5. **Token efficiency:** Use attention tiers (Module 15 S2) to avoid loading all files simultaneously.
