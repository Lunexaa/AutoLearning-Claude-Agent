---
description: Deep multi-source research on any topic using the 5-hop protocol. Searches, reads, synthesizes, verifies, and presents findings.
---

# Deep Research Command

Conduct thorough research on a topic using multiple sources and verification.

**Topic:** $ARGUMENTS

## Instructions

Use the **deep-research** skill (`~/.claude/skills/deep-research/`) for full methodology and tooling.

For research focused on the last 30 days, also load the **last30days** skill (`~/.claude/skills/last30days/`) to prioritize recent sources and detect outdated information.

## 5-Hop Protocol

### Hop 1: SEARCH
- Cast a wide net across multiple sources (web, code, docs, APIs)
- Use at least 3 independent search queries with varied phrasing
- Collect 10+ candidate sources before filtering

### Hop 2: READ
- Deep-read the top 5-7 most relevant sources
- Extract key claims, data points, and code examples
- Note publication dates and author credibility

### Hop 3: SYNTHESIZE
- Cross-reference findings across sources
- Identify consensus, contradictions, and gaps
- Build a structured answer with citations

### Hop 4: VERIFY
- Fact-check critical claims against primary sources
- Flag anything with only a single source
- Test code examples if applicable

### Hop 5: PRESENT
- Deliver a clear, structured research brief
- Include confidence levels (high/medium/low) per finding
- List sources with dates
- Call out open questions and areas needing further research
