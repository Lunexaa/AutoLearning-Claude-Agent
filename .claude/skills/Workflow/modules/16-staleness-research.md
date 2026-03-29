# MODULE 16 — STALENESS-CONDITIONED RESEARCH
# Loaded at: PHASE 1 INTEL (for BUILD/NEW_PROJECT tasks)
# Dependency: last30days skill (~/.claude/skills/last30days)

---

## Purpose

Automatically refresh stale knowledge before brainstorm/build phases. Uses the `last30days` skill to gather fresh real-world data from Reddit, X, YouTube, Hacker News, Polymarket, and web when existing memory or skills are outdated.

**This module is NOT always-on.** It triggers ONLY when staleness conditions are met.

---

## 1. STALENESS CHECK (runs at PHASE 1 start)

Before spawning PHASE 1 agents, check if existing knowledge is stale:

### Step 1: Identify domain from task

Map the user's task to a research domain:

| Task domain | Research topic | Memory files to check |
|---|---|---|
| CRM / Supabase | "CRM best practices {year}" | `project_zenitcrm.md`, `feedback_dev.md` |
| Next.js / React | "Next.js latest features {year}" | `feedback_nextjs.md`, `feedback_vercel.md` |
| Landing page / website | "web design trends {year}" | `feedback_design.md` |
| WhatsApp / messaging | "WhatsApp Business API {year}" | `feedback_whatsapp_bugs.md` |
| SEO | "SEO best practices {year}" | relevant `feedback_*.md` |
| New project (any) | "{project domain} best practices {year}" | all relevant memory |

### Step 2: Check file ages

```bash
# Check modification date of relevant memory files
for f in ~/.claude/Memory/feedback_*.md ~/.claude/Memory/project_*.md; do
  if [ -f "$f" ]; then
    mod_date=$(stat -f "%Sm" -t "%Y-%m-%d" "$f" 2>/dev/null || stat -c "%y" "$f" 2>/dev/null | cut -d' ' -f1)
    days_old=$(( ($(date +%s) - $(date -j -f "%Y-%m-%d" "$mod_date" +%s 2>/dev/null || date -d "$mod_date" +%s 2>/dev/null)) / 86400 ))
    echo "$f|$mod_date|${days_old}d"
  fi
done
```

### Step 3: Check matched skill staleness

If a skill was auto-routed (e.g., `nextjs-crm`), check its SKILL.md modification date:

```bash
skill_path="$HOME/.claude/skills/${MATCHED_SKILL}/SKILL.md"
if [ -f "$skill_path" ]; then
  mod_date=$(stat -f "%Sm" -t "%Y-%m-%d" "$skill_path" 2>/dev/null)
  echo "Skill $MATCHED_SKILL last modified: $mod_date"
fi
```

### Step 4: Apply staleness thresholds

| Age | Status | Action |
|---|---|---|
| 0-14 days | **FRESH** | Skip research — use existing knowledge |
| 15-29 days | **AGING** | Flag in PHASE 2 constraint injection: "Knowledge may be slightly outdated" |
| 30+ days | **STALE** | **Trigger last30days research** before proceeding |

**Override rules:**
- `NEW_PROJECT` intent → ALWAYS research regardless of staleness (need current landscape)
- User explicitly says "research" or "latest" → ALWAYS research
- Solo mode (≤3 files, bugfix) → NEVER research (not worth the time)
- Memory file doesn't exist for this domain → treat as STALE

---

## 2. RESEARCH EXECUTION (when STALE threshold met)

### Step 1: Run last30days research

Spawn as Agent in PHASE 1, parallel with SKILL READER and CONTEXT LOADER:

```
Agent: FRESHNESS RESEARCHER (sonnet, foreground)
  "Run last30days research for '{RESEARCH_TOPIC}'.
   Execute: python3 ~/.claude/skills/last30days/scripts/last30days.py '{RESEARCH_TOPIC}' --emit=compact --store --quick

   Then use WebSearch for 2-3 supplementary queries.

   Return a structured brief:
   - TOP 5 current patterns/trends (with sources)
   - CHANGED since last check: [what's different from our existing knowledge]
   - DEPRECATED/OUTDATED: [patterns we should stop using]
   - NEW TOOLS/APPROACHES: [things to consider]

   Keep brief under 500 words. Cite sources."
```

**Use `--quick` flag** to keep research fast (90s timeout vs 180s default).

### Step 2: Inject into PHASE 2

The research brief becomes part of the constraint injection for ALL brainstorm agents:

```
FRESHNESS BRIEF (researched {date}):
{research output}

All proposals MUST account for these current trends and avoid deprecated patterns.
```

### Step 3: Update memory with fresh data

After research, append a staleness marker to the relevant memory file:

```markdown
---
**Last research refresh:** {YYYY-MM-DD}
**Source:** last30days (Reddit, X, YouTube, HN, Polymarket, web)
**Key updates:** {1-2 sentence summary of what changed}
```

This ensures the NEXT session knows when research was last done.

---

## 3. DOMAIN-SPECIFIC RESEARCH QUERIES

Pre-built queries for common task domains (use as `RESEARCH_TOPIC`):

| Domain | Research query |
|---|---|
| CRM | "CRM software trends best practices" |
| Next.js | "Next.js latest features updates" |
| React | "React best practices patterns" |
| Supabase | "Supabase new features updates" |
| Prisma | "Prisma ORM latest changes" |
| Tailwind | "Tailwind CSS latest features" |
| WhatsApp API | "WhatsApp Business API changes" |
| Landing pages | "landing page design trends conversion" |
| SEO | "SEO algorithm updates best practices" |
| E-commerce | "e-commerce platform trends" |
| Mobile UX | "mobile UX design patterns" |
| AI/LLM | "AI coding tools latest developments" |

**Custom domains:** If task doesn't match above, construct: "{domain} best practices trends {current_year}"

---

## 4. COST & PERFORMANCE GUARDRAILS

| Guard | Limit | Why |
|---|---|---|
| Max 1 research per session | Don't re-research same domain twice | Token efficiency |
| `--quick` flag always | 90s max vs 180s default | Speed |
| Research only in PHASE 1 | Never mid-build | Don't interrupt flow |
| Skip for Solo mode | ≤3 files = not worth 90s research | Proportionality |
| Cache results in memory | Next session skips if <30 days | Avoid redundant API calls |
| Free sources sufficient | reddit_public + hackernews + polymarket work without API keys | Zero cost baseline |

---

## 5. UPDATE SKILLS AND MEMORY WITH RESEARCH FINDINGS (MANDATORY)

After research completes, you MUST update BOTH memory files AND skill files if findings are newer than what they contain.

### 5a. Update memory files

When research reveals that existing memory is wrong or outdated:

1. **Outdated pattern found** → Append `## FIX — {date}` to relevant `feedback_*.md` file
2. **New pattern discovered** → Append to relevant `feedback_*.md` with confidence 0.6 (needs verification)
3. **Deprecated tool/API** → Flag in feedback file: `⚠️ DEPRECATED as of {date}: {detail}`

### 5b. Update matched skill file (CRITICAL — this is the part that was missing)

If research reveals facts NEWER than what the matched skill contains:

1. **Read the matched skill's SKILL.md** (e.g., `~/.claude/skills/nextjs-crm/SKILL.md`)
2. **Compare research findings with skill content** — look for:
   - API changes the skill doesn't mention
   - New best practices the skill contradicts
   - Deprecated patterns the skill still recommends
   - Version numbers that are outdated
3. **If differences found → APPEND to the skill file:**

```markdown
---
## RESEARCH UPDATE — {YYYY-MM-DD}
Source: last30days research (Reddit, X, YouTube, HN, Polymarket, web)
Findings that update this skill:
- {finding 1}: {what changed and why it matters}
- {finding 2}: {what changed and why it matters}
Confidence: {0.6-0.9} (verified via multiple sources / single source)
```

**Rules for skill updates:**
- NEVER rewrite existing skill content — only APPEND updates at the bottom
- NEVER update official skills (Anthropic, Vercel, Trail of Bits) — only custom skills
- Mark every update with date and source so it can be reviewed/reverted
- Only append if 2+ sources agree on the change (confidence ≥ 0.6)
- If finding contradicts existing skill rule → append as `⚠️ POSSIBLE CHANGE` (don't auto-override)

### 5c. Update ROADMAP.md if needed

If research reveals a new tool/framework that should become a skill:
- Add a note to ROADMAP.md in the correct category: `[CANDIDATE] {tool name} — discovered via last30days research {date}`

### 5d. Update freshness tracker

```bash
# Mark this domain as freshly researched
sed -i '' "s#^PROJECT|DOMAIN|[^|]*$#PROJECT|DOMAIN|$(date +%Y-%m-%d)#" ~/.claude/Memory/.freshness-tracker 2>/dev/null
```

This creates a feedback loop: research → skill update → memory update → next session uses updated knowledge → better builds.

---

## 6. ANTI-PATTERNS

- **Don't research during bugfixes** — bugs need code investigation, not market research
- **Don't research what you just researched** — check memory first
- **Don't block build for research** — if last30days times out, proceed with existing knowledge
- **Don't treat research as truth** — it's input for brainstorm, not authoritative
- **Don't research internal project details** — last30days finds public discourse, not your private code patterns
