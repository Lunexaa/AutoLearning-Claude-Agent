# MODULE 13 — DEEP RESEARCH PROTOCOL
# Loaded for: RESEARCH tasks, Phase 1 INTEL when task requires external knowledge
# Inspired by: SuperClaude Deep Research (5 hops, 40+ sources, quality scoring)

---

## Purpose

Structured, multi-hop research that goes beyond a single web search. Instead of one query → one answer, this protocol iterates: search → evaluate → refine query → search deeper → triangulate across sources. Result: high-confidence answers backed by multiple independent sources.

---

## 1. WHEN TO ACTIVATE

| Trigger | Action |
|---|---|
| User asks for research / analysis | Full protocol (all 5 hops) |
| Phase 1 INTEL needs external context | Lite protocol (3 hops max) |
| "Deep research" or "investigate" in prompt | Full protocol |
| Quick factual question | Skip — answer directly |

**Rule:** Don't deep-research what you already know with high confidence. This protocol is for unknowns.

---

## 2. THE 5-HOP RESEARCH LOOP

```
HOP 1: BROAD SCAN
  → 3 parallel web searches with different angles
  → Collect 10-15 initial sources
  → Score each source: relevance (1-5), authority (1-5), recency (1-5)
  → Filter: keep only sources scoring ≥ 10/15

HOP 2: DEEP DIVE
  → Read top 5 sources fully (WebFetch)
  → Extract: key claims, data points, methodology, conflicts
  → Identify gaps: "What do I still not know?"
  → Formulate 2 refined queries targeting gaps

HOP 3: GAP FILLING
  → Execute refined queries
  → Specifically target: contradicting viewpoints, edge cases, recent changes
  → Cross-reference: does Source A's claim hold up against Source B?

HOP 4: TRIANGULATION
  → For each key finding, require 2+ independent sources
  → Flag any finding with only 1 source as "unconfirmed"
  → Identify consensus vs. debate in the field

HOP 5: SYNTHESIS
  → Compile findings into structured brief
  → Assign confidence score per finding (see §3)
  → Highlight: what's certain, what's debated, what's unknown
  → Provide actionable recommendations
```

---

## 3. CONFIDENCE SCORING

Every finding gets a confidence score:

| Score | Meaning | Criteria |
|---|---|---|
| 0.9-1.0 | **Confirmed** | 3+ independent authoritative sources agree |
| 0.7-0.89 | **High confidence** | 2 sources agree, no contradictions found |
| 0.5-0.69 | **Moderate** | 1 strong source + logical consistency |
| 0.3-0.49 | **Low confidence** | 1 source only, or sources conflict |
| 0.0-0.29 | **Unverified** | Speculation, single anecdote, or outdated |

**Rule:** Never present a 0.3 finding as fact. Always flag uncertainty.

---

## 4. SOURCE QUALITY ASSESSMENT

| Source type | Authority score |
|---|---|
| Official documentation / RFC / spec | 5 |
| Peer-reviewed / well-known tech blog | 4 |
| GitHub repo with 1k+ stars, active | 4 |
| Recent blog post from practitioner | 3 |
| Forum answer with evidence | 2 |
| Social media / unverified claim | 1 |

**Recency bonus:** +1 for sources < 6 months old on fast-moving topics.
**Recency penalty:** -2 for sources > 2 years old on tech topics.

---

## 5. OUTPUT FORMAT

```markdown
## Research Brief: [Topic]
**Confidence:** [overall 0.0-1.0]
**Sources consulted:** [N]
**Hops completed:** [N/5]

### Key Findings
1. [Finding] — confidence: [score] — sources: [N]
2. [Finding] — confidence: [score] — sources: [N]

### Consensus
[What most sources agree on]

### Debate / Uncertainty
[Where sources disagree or data is lacking]

### Recommendations
[Actionable next steps based on findings]

### Sources
[Numbered list with URLs and authority scores]
```

---

## 6. LITE PROTOCOL (3 hops — for Phase 1 INTEL)

When research is part of Phase 1, not the main task:

1. **HOP 1:** 2 parallel searches (not 3)
2. **HOP 2:** Read top 3 sources (not 5)
3. **HOP 3:** Synthesize — skip gap-filling and triangulation
4. Output: 50-word brief + confidence score (not full report)

**Token budget:** Lite = max 2 agent spawns. Full = max 3 agent spawns.

---

## 7. AGENT DISPATCH

```
Full protocol:
  Agent 1 (sonnet): Broad scan — 3 web searches, collect + filter sources
  Agent 2 (sonnet): Deep dive — read top sources, extract claims
  Agent 3 (sonnet): Gap fill + triangulate + synthesize

Lite protocol:
  Agent 1 (sonnet): Scan + read top sources
  Agent 2 (sonnet): Synthesize findings into brief
```

**All research agents use sonnet** — research is information retrieval, not creative work.

---

## 8. INTEGRATION WITH JARVIS

| Context | How deep research plugs in |
|---|---|
| Standalone research task | Full protocol, deliver Research Brief to user |
| Phase 1 INTEL | Lite protocol, feed brief into Phase 2 brainstorm |
| Phase 2 BRAINSTORM | Reference-First: agents receive research brief in prompt |
| Skill creation (Module 08) | Full protocol before writing new skill |
| Bug investigation | Lite protocol to check known issues / CVEs |

---

## 9. ANTI-PATTERNS

- **Don't research what you know** — if you can answer with >0.8 confidence from training data, skip research
- **Don't use 5 hops for simple questions** — "what's the latest Next.js version?" = 1 search, not 5 hops
- **Don't trust single sources** — always cross-reference on important claims
- **Don't present low-confidence findings as facts** — flag uncertainty explicitly
- **Don't exceed token budget** — research is preparation, not the deliverable
- **Don't web-search for code patterns** — use codebase search (Grep/Glob) instead
