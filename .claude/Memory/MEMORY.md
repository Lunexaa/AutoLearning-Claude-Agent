# MEMORY INDEX — 3-TIER ARCHITECTURE

> Memory is organized in 3 tiers. Each tier serves a different purpose and retention horizon.
> See Module 05 for details.

---

## TIER 1: WORKING (in-session, project-scoped)

*Active project state and recent decisions you need RIGHT NOW.*

- `project_[name].md` — Add project-specific memory files here as you work
- `feedback_[project].md` — Project-specific feedback patterns
- `session-notes.md` — Live memory written during work + pre-compaction capture (Module 15 §1)
- `branches/[branch-name].md` — Branch-specific memory (Module 15 §6)

---

## TIER 2: VAULT (persistent, cross-project)

*Rules, patterns, and user identity that apply ACROSS projects. Never auto-deleted.*

- [user_profile.md](user_profile.md) — Who the user is, working style, preferences
- [feedback_dev.md](feedback_dev.md) — Dev patterns and corrections (chromium-min→full, R2_PUBLIC_URL, root cause debugging)
- [feedback_communication.md](feedback_communication.md) — Autonomous, brief, no summaries
- [feedback_design.md](feedback_design.md) — Design standards: real images, depth, wow. No flat/2010.
- [feedback_nextjs.md](feedback_nextjs.md) — Next.js patterns (App Router, next/image, Server vs Client Components)
- [feedback_vercel.md](feedback_vercel.md) — Vercel deployment patterns (env vars, chromium, R2, edge functions)
- `instincts.md` — Always-on behavioral rules (Module 15 §4). Max 15 instincts.

---

## TIER 3: SIGNALS (learning data, analyzed offline)

*Routing intelligence and pattern discovery for future improvement.*

- `routing-signals.md` — Task execution scores (skill match quality, first-try success per task)
- `routing-overrides.md` — Learned route overrides discovered from signal analysis
- Pattern mining outputs — Cross-project lessons, auto-generated instinct candidates (Module 09 §11)
- Decay tracking — Memory re-verification schedule (Module 09 §12)

---

## ACCESS PATTERNS

| Phase | Read | Write | Max load |
|-------|------|-------|----------|
| **Session start** | Tier 2 (vault) + relevant Tier 1 + Tier 3 overrides | — | 3 files |
| **During work** | Tier 1 (continuous) + Tier 3 (on routing need) | Tier 1 (real-time) | HOT/WARM/COLD tiers (Module 15 §3) |
| **Pre-compaction** | — | Tier 1 session-notes (via hook) | — |
| **Session end** | — | Tier 3 signals + Tier 1→Tier 2 promotion | — |

---

## RULES

1. **Tier 1 (WORKING):** Project-scoped, read at session start, written in real-time, archived when project complete.
2. **Tier 2 (VAULT):** Global, loaded at every session, never auto-deleted, user manually archives obsolete entries.
3. **Tier 3 (SIGNALS):** Used for routing decisions, analyzed at session end, older signals decay (Module 09 §12).
4. **Cross-project promotion:** Entries in Tier 1 with `scope: cross-project` get promoted to Tier 2 at session end.
5. **Token efficiency:** Use attention tiers (Module 15 §3) to avoid loading all files simultaneously.
