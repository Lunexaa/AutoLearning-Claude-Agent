---
name: feedback_nextjs
description: Next.js patterns & gotchas (cross-project)
type: vault
---

# Next.js Patterns & Gotchas

Applies to all Next.js projects. Last verified: 2026-03-29

- **App Router preferred** — Use App Router over Pages Router for Next.js 14+. Pages Router is legacy.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27

- **Always use next/image** — For optimized images: lazy loading, responsive sizes, format conversion.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27

- **Server Components by default** — Mark components as Server Components by default. Client Components only when needed (interactivity, hooks, browser APIs).
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27

- **Environment variable naming** — `NEXT_PUBLIC_` prefix for client-side vars, plain names for server-side. Never expose secrets to client.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27

- **Build after migrations** — Always run `next build` after any database migrations. Build-time data fetching may depend on schema changes.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27

- **Middleware limitations** — Middleware can't access database. Use API routes for queries. Middleware is for auth, redirects, headers.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27

- **Dynamic segments in routes** — `[id]` creates dynamic segments. Use `generateStaticParams()` for SSG, fallback to SSR for unknown IDs.
  - **Last verified:** 2026-03-29
  - **Next verify:** 2026-06-27
