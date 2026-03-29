---
name: feedback_vercel
description: Vercel deployment patterns (cross-project)
type: vault
---

# Vercel Deployment Patterns

Applies to all Vercel-deployed projects. Last verified: 2026-03-29

- **Environment variables in dashboard** — All production env vars MUST be in Vercel dashboard. Never rely on .env files for production. Local dev uses .env.local.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28

- **Chromium: full vs. min** — Use `@sparticuz/chromium` (full, 250MB) for PDF/screenshot generation. Never use chromium-min — it fails in production. Min is testing only.
  - **Confidence:** 1.0
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28

- **100 deployments/day limit** — Free tier: 100 deploys/day max. Batch changes to avoid rate limit. Staging branch deploys count against quota.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28

- **R2_PUBLIC_URL required** — For Cloudflare R2 integration: set `R2_PUBLIC_URL` (public read URL) in Vercel dashboard. Without it, R2 file access fails silently.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28

- **Edge functions: max 1MB compressed** — Edge function bundle size limit is 1MB. Use middleware sparingly. Complex logic → API routes (Node.js runtime, no size limit).
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28

- **Build timeout: 45 seconds (free tier)** — Free tier builds timeout at 45s. Pro tier: 3 minutes. For longer builds, optimize or upgrade plan.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28

- **Logs retention: 3 days free tier** — Runtime logs stored for 3 days on free tier, then deleted. Pro tier: longer retention. Archive logs if you need long-term history.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-05-28
