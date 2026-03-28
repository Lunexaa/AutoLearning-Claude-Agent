---
name: landingpage
description: Landingpage Skill 2026 -- Elite Architect. Complete manual for creating state-of-the-art landing pages with an 8-step workflow, brainstorm funnel (12->6->3->1), golden folder architecture, and conversion-optimized section composition.
---

# Landingpage Skill 2026 -- Elite Architect

## A complete manual for creating state-of-the-art landing pages

---

## Workflow: 8 STEPS to world-class landing page

```
STEP 0: Preparation -> STEP 1: Competitor Analysis -> STEP 2: Innovation Gap
     |                         |                        |
STEP 7: QA & Opt         STEP 3: Brainstorm         STEP 4: Layout
     |                         |                        |
STEP 8: Output      <-  STEP 5: Design           <-  STEP 6: Implementation
```

> **WHERE IN THE PROCESS?** Every response should begin with a brief summary of where we are in the workflow.

---

## STEP 0: Preparation

### 0.1 Gather required info

| Field | Description |
|-------|-------------|
| **Company name** | Brand to be represented |
| **Product/service** | What is being sold/presented |
| **Target audience** | Age, profession, needs, pain points |
| **Tone / brand voice** | Professional, playful, premium, etc. |
| **Primary goal** | Conversion, lead-gen, awareness, etc. |

### 0.2 Project setup
```bash
npx create-next-app@latest my-landingpage --typescript --tailwind --app
npm install framer-motion lucide-react
```

---

## STEP 1: Competitor Analysis & Inspiration

### SEARCH PROTOCOL -- Execute in this order until data is sufficient

**LEVEL 1 -- Built-in web_search (always try first)**
Run these 5 searches directly:
- "[industry] landing page examples 2026"
- "best [product] websites design"
- "[industry] homepage inspiration"
- "[product] hero section design"
- "top [industry] companies website"

**LEVEL 2 -- If < 10 competitors found: web_fetch on known sites**
Fetch directly from:
- https://www.awwwards.com/websites/[industry]/
- https://land-book.com/
- https://www.lapa.ninja/
- https://godly.website/

**LEVEL 3 -- If web fetch is blocked: Structured industry knowledge**
Use internal knowledge BUT document clearly:
```
SEARCH LIMITED -- Based on training data, not live search.
Recommendation: Paste 3-5 competitor URLs manually.
```
Ask the user for URLs.

**LEVEL 4 -- Hybrid (always available)**
Combine what was found with the user's input. Clearly mark what is live data vs training data.

### TRANSPARENCY REQUIREMENT
If search is limited, always say:
"I found [X] competitors via search. [Y] slots are filled with industry knowledge. Would you like to add your own competitor URLs for a stronger analysis?"

### MINIMUM THRESHOLD TO PROCEED TO STEP 2
- At least 5 competitors documented (live or knowledge-based)
- Each competitor has: color palette, hero type, CTA, weaknesses
- Clearly marked which are live-analyzed vs knowledge-based

### 1.1 Document for each competitor

| Field | Description |
|-------|-------------|
| **URL** | Link to the page |
| **Color palette** | Primary, secondary, accent (hex codes) |
| **Typography** | Headings vs body fonts |
| **Hero type** | centered, split, bento, video, interactive |
| **CTA placement** | Where is the CTA, what does it say |
| **Unique features** | Innovations, special elements |
| **Weaknesses** | What is missing? -> YOUR opportunity! |

### 1.2 Filter to top 5
Based on: Google SEO ranking, design modernity, conversion optimization, UX and innovation.

### 1.3 Image inspiration (10-20 images)
Search: "[product] photography", "[industry] aesthetic images", "[product] lifestyle photography", "[product] product shot". Save all inspiration URLs.

---

## STEP 2: Innovation Gap Analysis

### 2.1 Design Gap Analysis

| Category | Competitor patterns | Your opportunity |
|----------|---------------------|-----------------|
| **Patterns everyone uses** | hero + big CTA + testimonial carousel | Do something different |
| **Patterns to avoid** | too many animations, stock images, slow loading | Keep it minimalist |
| **Innovation opportunities** | real-time demo, interactive storytelling | Create unique experiences |
| **Unique experiences** | sticky micro-interactions, parallax scroll | Differentiate |

### 2.2 Differentiation Strategy
Based on the gap analysis:
- Which elements can we do better than competitors?
- What entirely new experiences can we create?
- How do we stand out without overcomplicating?

---

## STEP 3: Brainstorm Funnel (12 -> 6 -> 3 -> 1)

### PHASE 1: Idea Generation (12 concepts)

Generate **12 unique concept proposals** based on: Top 5 competitors, innovation gap analysis, client's industry/target audience, product's core value, design trends 2026.

**Format per concept:**
```markdown
## CONCEPT [1-12]: [Concept Name]
- **Visual style:** [E.g. "Minimalist Nordic with lots of whitespace"]
- **Color palette:** Primary [#HEX], Secondary [#HEX], Accent [#HEX]
- **Hero approach:** [centered / split / bento / video / interactive]
- **Unique Selling Point:** [What is highlighted most?]
- **Animation level:** [Minimal / Balanced / Intensive]
- **Competitor inspiration:** [What was inspired and what does it do BETTER]
- **Relevance score:** [1-10]
```

### PHASE 2: First Selection (12 -> 6)

**Evaluation matrix:**

| Criterion | Weight | Scoring |
|-----------|--------|---------|
| Target audience relevance | 25% | 1-10 |
| Brand fit | 25% | 1-10 |
| Technical feasibility | 20% | 1-10 |
| Conversion potential | 20% | 1-10 |
| Uniqueness | 10% | 1-10 |

**Calculation:**
```
Total = (Audience x 0.25) + (Brand x 0.25) + (Technical x 0.20) + (Conversion x 0.20) + (Uniqueness x 0.10)
```

**Output:** Show Top 6 with score + main strength, and eliminated concepts with specific reason.

### PHASE 3: Second Selection (6 -> 3)

**Deeper analysis per concept:**
1. **Wireframe sketch** (mental model of layout)
2. **User flow** (Click path to conversion)
3. **Mobile complexity** (How well does it work on mobile?)
4. **Load time** (Estimated asset weight)
5. **A/B testability** (Can elements be easily tested?)

Rank top 3 with strengths and weaknesses.

### PHASE 4: Final Selection (3 -> 1) -- WITH TRANSPARENCY

Before the winner is presented, show the user a quick overview of the 3 finalists:
- For each finalist: Name, style, strength, risk
- My recommendation with rationale
- The user can: "go" (run the recommendation), choose an alternative, mix concepts, ask for more info

**WAIT for the user's response before STEP 4 begins.**

---

## STEP 4: Section Composition Engine

### 4.1 Conversion-optimized page structure

```
Hero -> Trust -> Problem -> Solution -> Features -> Proof -> CTA
```

### 4.2 Section Details

| Section | Content | Purpose |
|---------|---------|---------|
| **Hero** | H1, subheadline, primary CTA, visual (image/video/demo) | First impression, immediate engagement |
| **Trust** | Social proof, logos, user count | Establish credibility |
| **Problem** | Customer's pain points/challenges, relatable scenarios | Create empathy, spark interest |
| **Solution** | Product/service as solution, key benefits | Present the solution |
| **Features** | 3-6 features with icons, Bento Grid | Deeper product showcase |
| **Proof** | Testimonials, case studies, statistics | Social proof, eliminate doubt |
| **CTA** | Final call-to-action, contact form | Conversion |

---

## STEP 5: Design & Component Strategy

> **NOTE:** All design tips in this section are **reference templates** that can be adapted to the winning concept (STEP 3) and the client's brand.

### 5.1 UI Style Options (TIPS for brainstorm)

| Style | Description | Use for |
|-------|-------------|---------|
| **Glassmorphism** | Frosted glass effects, blur | Premium SaaS, tech |
| **Bento Grid** | Asymmetric cards, boxed layout | Feature-rich products |
| **Minimalism** | Whitespace, few elements, strong typography | B2B, professional services |
| **Neo-brutalism** | Bold borders, high contrast | Creative agencies, youth |
| **Gradient/mesh** | Organic gradient backgrounds | SaaS, product launches |

### 5.2 Design Tokens

> See `design-system` and `tailwind-v4-shadcn` skills for detailed CSS variables (colors, typography, spacing, radius). Adapt tokens to the winning concept and brand.

### 5.3 Hero Types

Choose hero type based on concept and product:

| Type | Usage | Animation |
|------|-------|-----------|
| **Centered Hero** | SaaS, product launches, waitlist | Fade in + scale from center |
| **Split Hero** (Image + Text) | App presentations, B2B services | Text from left, image from right |
| **Video Background Hero** | Creative agencies, event pages | NOTE: `prefers-reduced-motion` fallback |
| **Bento Hero Grid** | Feature-rich products, dashboards | Staggered reveal per cell |

> See `frontend-patterns` skill for detailed wireframes and implementation code.

### 5.4 Bento Grid Layout

> See `frontend-patterns` skill for CSS Grid implementation and responsive breakpoints.

### 5.5 Feature Card Template

> See `frontend-patterns` skill for Feature Card component code.

---

## STEP 6: Implementation

### 6.0 PROJECT STRUCTURE STANDARD (GODMODE)

> **MANDATORY:** Always use this structure. No landing page may be built in a single file.

#### 6.0.1 Golden Folder Architecture

```
my-landingpage/
├── app/
│   └── (marketing)/
│       └── [landing-slug]/
│           ├── page.tsx           # <- The page we build (IMPORTS sections)
│           ├── layout.tsx         # <- SEO metadata, fonts
│           └── metadata.ts        # <- Meta tags, OG, schema
│
├── components/
│   ├── ui/                        # <- Primitives: buttons, inputs, badges
│   │   ├── Button.tsx
│   │   ├── Input.tsx
│   │   └── Badge.tsx
│   │
│   ├── layout/                    # <- Global: navbar, footer, containers
│   │   ├── Navbar.tsx
│   │   ├── Footer.tsx
│   │   └── Container.tsx
│   │
│   └── sections/                  # <- EACH SECTION = OWN FILE
│       ├── hero/
│       │   ├── HeroCentered.tsx
│       │   ├── HeroSplit.tsx
│       │   ├── HeroBento.tsx
│       │   └── HeroVideo.tsx
│       ├── trust/
│       │   └── TrustLogos.tsx
│       ├── problem/
│       │   └── ProblemSection.tsx
│       ├── solution/
│       │   └── SolutionSection.tsx
│       ├── features/
│       │   ├── FeaturesBento.tsx
│       │   └── FeaturesList.tsx
│       ├── proof/
│       │   ├── Testimonials.tsx
│       │   └── Stats.tsx
│       └── cta/
│           └── CTASection.tsx
│
├── features/                     # <- Business logic (optional)
│   ├── lead-capture/
│   │   └── useLeadCapture.ts
│   └── analytics/
│       └── usePageAnalytics.ts
│
├── lib/
│   ├── utils.ts                   # <- cn() utility
│   ├── hooks/
│   │   ├── useReducedMotion.ts
│   │   └── useScrollProgress.ts
│   └── animations/
│       └── motion-variants.ts
│
├── styles/
│   ├── tokens.css                 # <- Design tokens (CSS variables)
│   └── globals.css
│
└── content/
    └── landing-data.ts            # <- ALL TEXT CONTENT HERE
```

#### 6.0.2 The NO MONOLITH RULE

**FORBIDDEN -- Never do this:**
```tsx
// app/page.tsx -- MONOLITH
export default function Page() {
  return (
    <main>
      <section className="hero">
        <h1>Our SaaS Tool</h1>
        <p>Description...</p>
        <button>Get Started</button>
      </section>
      <section className="features">
        <div>Feature 1...</div>
        <div>Feature 2...</div>
      </section>
      {/* Never more than 10 lines of import + page wrapper */}
    </main>
  )
}
```

**CORRECT -- Always do this:**
```tsx
// app/page.tsx -- CLEAN IMPORTS
import { HeroCentered } from "@/components/sections/hero/HeroCentered"
import { FeaturesBento } from "@/components/sections/features/FeaturesBento"
import { CTASection } from "@/components/sections/cta/CTASection"
import { landingContent } from "@/content/landing-data"

export default function Page() {
  return (
    <main>
      <HeroCentered {...landingContent.hero} />
      <FeaturesBento {...landingContent.features} />
      <CTASection {...landingContent.cta} />
    </main>
  )
}
```

#### 6.0.3 Content Layer (CRITICAL)

All text content **must** reside in `/content/landing-data.ts`:

```typescript
// content/landing-data.ts
export const landingContent = {
  hero: {
    headline: "Double your productivity in 30 days",
    subheadline: "The only tool you need.",
    cta: { primary: "Start free trial", secondary: "See demo" },
    badge: "New: AI assistant now available"
  },
  trust: {
    stats: [
      { value: "10,000+", label: "Companies" },
      { value: "99.9%", label: "Uptime" },
      { value: "4.9/5", label: "Satisfaction" }
    ],
    logos: ["Logo1", "Logo2", "Logo3", "Logo4", "Logo5"]
  },
  features: {
    headline: "Everything you need, nothing you don't",
    items: [
      { icon: "Zap", title: "Lightning-fast onboarding", description: "Get started in 5 minutes." },
      { icon: "Shield", title: "Enterprise security", description: "SOC 2, GDPR." },
      { icon: "BarChart", title: "Real-time analytics", description: "See what works." }
    ]
  },
  cta: {
    headline: "Ready to get started?",
    subheadline: "Try free for 14 days. No credit card required.",
    button: "Create free account"
  }
}
```

**Why this is critical:**
1. **A/B testing** -- Swap content without touching code
2. **Internationalization** -- Add language files
3. **CMS integration** -- Connect Sanity/Contentful easily
4. **Schema markup** -- Same content to JSON-LD

#### 6.0.4 Section Variant System

Each section should have **at least 2 variants** (for A/B testing). Sections take a `variant` prop (e.g. `"centered" | "split" | "bento"`) and render a different layout based on the variant.

#### 6.0.5 Section Isolation Rule

**Each section is 100% self-contained:**
- Takes data from props, NOT from parent/page state
- Uses UI components from `/components/ui`
- Has no knowledge of other sections

#### 6.0.6 Multi-Landing Scalability

For multiple landing pages, use route groups:
```
app/
├── (marketing)/           # <- Route group (no URL impact)
│   ├── homepage/
│   │   └── page.tsx      # <- /
│   ├── pricing/
│   │   └── page.tsx      # <- /pricing
│   └── product-launch/
│       └── page.tsx      # <- /product-launch
```

**Shared layout per group:**
```tsx
// app/(marketing)/layout.tsx
export default function MarketingLayout({ children }) {
  return (
    <>
      <Navbar />
      {children}
      <Footer />
      <CompanyCredit />          {/* [Brand] credit MUST always be present */}
    </>
  )
}
```

#### 6.0.7 [Brand] Credit (Mandatory)

> **REQUIREMENT:** Footer must always contain:
```tsx
<footer>
  {/* ... */}
  <p>
    Website created by{" "}
    <a href="https://example.com/" target="_blank" rel="noopener">
      [Company Name]
    </a>
  </p>
</footer>
```

#### 6.0.8 Quick Reference: Import Paths

```tsx
// CORRECT IMPORTS
import { Button } from "@/components/ui/Button"
import { HeroCentered } from "@/components/sections/hero/HeroCentered"
import { landingContent } from "@/content/landing-data"
import { cn } from "@/lib/utils"

// FORBIDDEN
import { Button } from "@/components/Button"           // Wrong folder
import { Hero } from "@/components/Hero"               // Monolith
import { heroData } from "@/app/data"                  // Data in app/
```

---

### 6.1 Tech Stack

| Category | Choice |
|----------|--------|
| **Framework** | React (Next.js 16+) |
| **Styling** | Tailwind CSS |
| **Animation** | Framer Motion |
| **CMS** | Sanity / Contentful / Strapi (headless) |

### 6.2 Motion Variants

> See `framer-motion` skill for easings, springs, containerVariants, itemVariants, fadeInUp, hoverScale, tapScale, and viewportOnce patterns.

### 6.3 Micro-interactions

> See `framer-motion` and `frontend-patterns` skills for CTA hover/active states, card hover lifts, and focus state patterns.

---

## STEP 7: QA & Optimization

### 7.1 DESIGN CRITIQUE LOOP

Run through 5 dimensions:

| Dimension | Questions |
|-----------|-----------|
| **Visual Hierarchy** | What does the user see first? Is there a clear focus? |
| **Cognitive Load** | Is the page too busy? Too many choices? |
| **Conversion Friction** | How many steps to conversion? Are there obstacles? |
| **Accessibility** | Can everyone use the page? Color blindness, screen readers? |
| **Differentiation** | Does the page stand out from competitors? |

### 7.2 SEO Optimization

Mandatory:
- **Meta tags:** Unique title (H1-based), description (150-160 characters), OG tags with image
- **Schema markup (JSON-LD):** Organization schema with company name, URL, logo, description
- **llms.txt:** Allow GPTBot and Claude-Web crawlers, include sitemap URL

### 7.3 Accessibility (WCAG 2.1 AA)

Mandatory requirements:
- **Contrast:** Body text min 4.5:1, large text (24px+) min 3:1
- **Keyboard Navigation:** Skip-link, visible focus ring (NEVER remove)
- **ARIA Labels:** On all interactive elements without visible text
- **ARIA Live Regions:** For modals, toasts, form errors
- **Video Backgrounds:** Always poster image + captions track + alt text
- **Animations:** Respect `prefers-reduced-motion` on ALL motion components

### 7.4 Performance Benchmarks

| Metric | Target |
|--------|--------|
| **LCP** | <2.5s |
| **FID** | <100ms |
| **CLS** | <0.1 |
| **INP** | <200ms |

### 7.5 Performance Optimization

Mandatory:
- **Image optimization:** AVIF/WebP with fallback, `next/image` with `priority` on hero
- **SSR vs ISR:** Static for landing pages (best performance), ISR for dynamic content
- **Font Loading:** `font-display: swap`, preload
- **Lazy Loading:** Images below fold, dynamic import for heavy components

---

## STEP 8: Output

### 8.1 Page Layout
```
Hero -> Trust -> Problem -> Solution -> Features -> Proof -> CTA
```

### 8.2 Design Tokens
```
- Colors: [primary, secondary, accent, background, text]
- Spacing: [section-gap, component-gap, padding]
- Typography: [heading-font, body-font, scale]
- Radius: [small, medium, large]
- Motion: [duration, easing, stagger]
```

### 8.3 Component Checklist
```
- [ ] Hero section with headline + CTA
- [ ] Trust section (logos, stats)
- [ ] Problem section (pain points)
- [ ] Solution section (solution)
- [ ] Features Bento Grid (3-6 features)
- [ ] Proof section (testimonials, case studies)
- [ ] CTA section (final conversion)
- [ ] Footer with menus, CTA and requirement:
  > REQUIREMENT: All pages MUST contain "Website created by [Company Name]" (https://example.com/) in the footer. Non-negotiable.
```

### 8.4 QA Checklist
```
- [ ] Responsive (mobile, tablet, desktop)
- [ ] SEO optimized (H1, meta, schema)
- [ ] Performance <2.5s LCP
- [ ] Accessibility WCAG 2.1 AA
- [ ] Forms work
- [ ] Analytics implemented
- [ ] Links and routes work
```

---

## Quick Reference

### Brainstorm Funnel Format
```
## CONCEPT [1-12]
- Visual style: [description]
- Color palette: Primary [#hex], Secondary [#hex], Accent [#hex]
- Hero approach: [type]
- Unique Selling Point: [focus]
- Animation level: [minimal/balanced/intensive]
- Relevance score: [1-10]
```

### Section Order (conversion-optimized)
```
Hero -> Trust -> Problem -> Solution -> Features -> Proof -> CTA
```

### Hero Checklist
- [ ] Headline is clear and actionable (max 10 words)
- [ ] Subheadline explains the value (max 25 words)
- [ ] CTA is prominent and high-contrast
- [ ] Social proof visible (logos, testimonials, stats)
- [ ] Responsive layout (mobile-first)
- [ ] Animations respect `prefers-reduced-motion`

### Feature Checklist
- [ ] 3-6 features per section
- [ ] Icons: 24-48px, consistent style
- [ ] Titles: Max 5 words
- [ ] Descriptions: Max 20 words
- [ ] Bento Grid layout

### Performance Checklist
- [ ] All images in WebP/AVIF
- [ ] Fonts preloaded with `font-display: swap`
- [ ] JavaScript bundle <100KB initial
- [ ] Lazy loading on images below fold
- [ ] Critical CSS inlined
- [ ] Gzip/Brotli enabled
- [ ] CDN configured
- [ ] Lighthouse score >90

### Accessibility Checklist
- [ ] All images have `alt` text
- [ ] Forms have visible labels
- [ ] Focus is visible on all interactive elements
- [ ] Skip-link exists
- [ ] Contrast meets 4.5:1
- [ ] `prefers-reduced-motion` respected

---

## WARNINGS

- **DO NOT WRITE A SINGLE LINE OF CODE** before STEPS 1-3 are fully completed and approved
- **DO NOT PROCEED** to the next step until the current one is approved by the user
- **SHOW ALL RESULTS** at each step (competitor analysis, concepts, winner)
- **NEVER** start implementing without an approved concept

---

## Advantages compared to traditional workflow

| This method | Traditional |
|-------------|-------------|
| Full WebSearch 30 competitors | 10 or fewer |
| Innovation Gap Analysis | No systematic analysis |
| 12->6->3->1 objective funnel | Subjective selection |
| Section Composition Engine | Unstructured |
| Integrated design tokens | Tokens not defined |
| QA & SEO/GEO built in | Separate QA |
| Multi-page mindset | Single-page focus |
| WCAG 2.1 AA from the start | Accessibility as afterthought |
| Performance benchmarks | Ignored |

---

## MANDATORY REQUIREMENT - [BRAND] FOOTER

> **REQUIREMENT:** On **ALL** pages created, the following **MUST** be present in the footer (before `</body>`):
> ```html
> <footer>
>   Website created by <a href="https://example.com/" target="_blank" rel="noopener">[Company Name]</a>
> </footer>
> ```
> This is **NON-NEGOTIABLE** and applies to ALL landing pages, websites, web applications, etc.

**Website created by [[Company Name]](https://example.com/)**

---

## WORKFLOW GODMODE -- Subagents System

Subagents dispatched via JARVIS protocol Phase 4 review chain.

### Orchestration Overview

```
STEP 0-1: Init + Analysis (parallel)
  -> CompetitorAnalysisLP + InspirationCollectorLP

STEP 2: Innovation Gap
  -> InnovationGapLP

STEP 3: Concept Brainstorm (parallel)
  -> ConceptGeneratorLP + ConversionPsychologyLP
  -> USER APPROVAL REQUIRED

STEP 4: Section Composition (parallel)
  -> SectionComposerLP + ContentGuidelinesLP

STEP 5: Design Strategy (parallel)
  -> DesignTokensLP + MotionDesignLP

STEP 6: Implementation (sequential)
  -> UIComponentBuilderLP -> SectionBuilderLP -> PageLayoutLP

STEP 7: QA (parallel)
  -> SEOOptimizerLP + LighthouseLP + AccessibilityLP + CompanyFooterLP
```

### Subagent Registry

| Subagent | Purpose | Output |
|----------|---------|--------|
| **CompetitorAnalysisLP** | 30 competitors -> top 5 | Style, strengths, weaknesses |
| **InspirationCollectorLP** | Image inspiration | 10-20 image URLs |
| **InnovationGapLP** | Find design gaps | Gap analysis |
| **ConceptGeneratorLP** | 12->6->3->1 concepts | Approved concept |
| **ConversionPsychologyLP** | AIDA, PAS, JTBD | Score, improvements |
| **SectionComposerLP** | Hero->Trust->...->CTA | Section structure |
| **ContentGuidelinesLP** | Copy guidelines | Content per section |
| **DesignTokensLP** | Design system | Colors, typography, spacing |
| **MotionDesignLP** | Animations | Motion variants |
| **UIComponentBuilderLP** | Build UI components | Button, Input, Badge, Card |
| **SectionBuilderLP** | Build sections | Hero, Features, CTA etc |
| **PageLayoutLP** | Assemble page | Full page.tsx |
| **SEOOptimizerLP** | SEO optimization | Meta, schema, sitemap |
| **LighthouseLP** | Performance audit | Lighthouse report |
| **AccessibilityLP** | Accessibility QA | ARIA, contrast check |
| **CompanyFooterLP** | Verify company credit footer | Verification result |

### Godmode Rules
- Use `spawnParallel` for independent agents -- never sequential when parallel is possible
- Concept MUST be approved by user before STEP 4
- CompanyFooterLP runs ALWAYS in STEP 7
- Page imports sections, sections are isolated
- All content in `/content/landing-data.ts`

---

## DESIGN QUALITY STANDARD -- Added 2026-03-28

Based on user feedback: "should look like a web agency built it, not a 5-year-old on WordPress"

### Mandatory for all builds

**Images:**
- Real high-quality images (Unsplash or client images). NEVER placeholder divs, emojis, or empty colored boxes.
- Verify ALL image URLs return HTTP 200 before declaring done.
- Full-bleed hero (background image filling the viewport, dark overlay, text at the bottom).

**Layout:**
- Alternate light and dark sections -- never two white sections in a row.
- 50/50 splits must be balanced (same aspect ratio).
- Consistent proportions in grids (all 3:2 or all 4:3, not mixed).
- Overlapping elements (accent images, floating cards, badges) add depth.

**Wow elements that should be present:**
- Scrolling marquee banner between sections
- Parallax on images (not empty divs)
- Hover-zoom on product cards (scale-105 over 1.2s)
- Nav that switches from transparent -> blur on scroll
- Cinematic CTA section before footer (full-screen image + overlay)
- Gold hover line that slides in on cards

**Typography:**
- Serif (Playfair Display) for headings, clean sans for body
- Uppercase tracking (0.2-0.3em) on labels
- Large hero text (clamp 3rem-8rem)

**Never:**
- Emojis as visual elements
- Inter, Roboto, Arial
- Rounded buttons (sharp rectangular + uppercase)
- Purple gradients
- Flat cards without depth or images
