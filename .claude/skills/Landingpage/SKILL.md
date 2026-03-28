name: Landingpage
description: Landingpage Skill 2026 -- Elite Architect. Komplett manual for att skapa toppmoderna landingpages med 8-stegs arbetsflode, brainstorm funnel (12->6->3->1), golden folder architecture, och konverteringsoptimerad section composition.
---

# Landingpage Skill 2026 -- Elite Architect

## En komplett manual for att skapa toppmoderna landingpages

---

## Arbetsflode: 8 STEG till varldsklass landingpage

```
STEG 0: Forberedelse -> STEG 1: Konkurrentanalys -> STEG 2: Innovation Gap
     |                         |                        |
STEG 7: QA & Opt         STEG 3: Brainstorm         STEG 4: Layout
     |                         |                        |
STEG 8: Output      <-  STEG 5: Design           <-  STEG 6: Implementation
```

> **VAR I PROCESSEN?** Varje svar ska inledas med en kort sammanfattning av var i arbetsflödet vi befinner oss.

---

## STEG 0: Forberedelse

### 0.1 Samla obligatorisk info

| Falt | Beskrivning |
|------|-------------|
| **Foretagsnamn** | Varumarke som ska representeras |
| **Produkt/tjanst** | Vad saljs/presenteras |
| **Malgrupp** | Alder, yrke, behov, pain points |
| **Ton / brand voice** | Professionell, lekfull, premium, etc. |
| **Primärt mål** | Conversion, lead-gen, awareness, etc. |

### 0.2 Projekt-setup
```bash
npx create-next-app@latest my-landingpage --typescript --tailwind --app
npm install framer-motion lucide-react
```

---

## STEG 1: Konkurrentanalys & Inspiration

### SEARCH PROTOCOL -- Kors i denna ordning tills data ar tillracklig

**NIVA 1 -- Inbyggd web_search (forsok alltid forst)**
Kor dessa 5 sokningar direkt:
- "[bransch] landing page examples 2026"
- "best [produkt] websites design"
- "[bransch] homepage inspiration"
- "[produkt] hero section design"
- "top [bransch] companies website"

**NIVA 2 -- Om < 10 konkurrenter hittades: web_fetch pa kanda sajter**
Hamta direkt fran:
- https://www.awwwards.com/websites/[bransch]/
- https://land-book.com/
- https://www.lapa.ninja/
- https://godly.website/

**NIVA 3 -- Om web fetch blockeras: Strukturerad branschkunskap**
Anvand intern kunskap MEN dokumentera tydligt:
```
SOKNING BEGRANSAD -- Baserat pa traningsdata, inte live-sokning.
Rekommendation: Klistra in 3-5 konkurrent-URLs manuellt.
```
Be anvandaren om URLs.

**NIVA 4 -- Hybrid (alltid tillganglig)**
Kombinera vad som hittades med anvandarens input. Mark tydligt vad som ar live-data vs traningsdata.

### TRANSPARENS-KRAV
Om sokning begransas, sag alltid:
"Jag hittade [X] konkurrenter via sokning. [Y] slots fylls med branschkunskap. Vill du lagga till egna konkurrent-URLs for starkare analys?"

### MINIMINIVA FOR ATT GA VIDARE TILL STEG 2
- Minst 5 konkurrenter dokumenterade (live eller kunskapsbaserade)
- Varje konkurrent har: fargpalett, hero-typ, CTA, svagheter
- Tydligt markt vilka som ar live-analyserade vs kunskapsbaserade

### 1.1 Dokumentera for varje konkurrent

| Falt | Beskrivning |
|------|-------------|
| **URL** | Lank till sidan |
| **Fargpalett** | Primar, sekundar, accent (hex-koder) |
| **Typografi** | Headings vs body fonts |
| **Hero-typ** | centered, split, bento, video, interactive |
| **CTA-placering** | Var finns CTA, vad star det |
| **Unique features** | Innovationer, specialelement |
| **Svagheter** | Vad fattas? -> DIN mojlighet! |

### 1.2 Filtrera till topp 5
Baserat pa: Google SEO-rankning, designmodernitet, konverteringsoptimering, UX och innovation.

### 1.3 Bildinspiration (10-20 bilder)
Sok: "[produkt] photography", "[bransch] aesthetic images", "[produkt] lifestyle photography", "[produkt] product shot". Spara alla inspiration-URLs.

---

## STEG 2: Innovation Gap Analysis

### 2.1 Design Gap-analys

| Kategori | Konkurrentmonster | Din mojlighet |
|----------|-------------------|---------------|
| **Patterns everyone uses** | hero + big CTA + testimonial carousel | Gor nagot annorlunda |
| **Patterns to avoid** | for manga animationer, stockbilder, slow loading | Hall det minimalistiskt |
| **Innovation opportunities** | real-time demo, interaktiv storytelling | Skapa unika upplevelser |
| **Unique experiences** | sticky micro-interactions, parallax scroll | Differentiera |

### 2.2 Differentieringsstrategi
Baserat pa gap-analysen:
- Vilka element kan vi gora battre an konkurrenterna?
- Vilka helt nya upplevelser kan vi skapa?
- Hur sticker vi ut utan att komplicera?

---

## STEG 3: Brainstorm Funnel (12 -> 6 -> 3 -> 1)

### FAS 1: Idegenerering (12 koncept)

Generera **12 unika konceptforslag** baserat pa: Topp 5 konkurrenter, innovation gap analysis, kundens bransch/malgrupp, produktens karnvarde, designtrender 2026.

**Format per koncept:**
```markdown
## KONCEPT [1-12]: [Konceptnamn]
- **Visuell stil:** [T.ex. "Minimalistisk nordisk med mycket whitespace"]
- **Fargpalett:** Primar [#HEX], Sekundar [#HEX], Accent [#HEX]
- **Hero-approach:** [centered / split / bento / video / interactive]
- **Unique Selling Point:** [Vad lyfts fram mest?]
- **Animationsniva:** [Minimal / Balanserad / Intensiv]
- **Konkurrentinspiration:** [Vad inspirerades och vad gor det BATTRE]
- **Relevanspoang:** [1-10]
```

### FAS 2: Forsta Sallning (12 -> 6)

**Utvarderingsmatris:**

| Kriterie | Vikt | Poangsattning |
|----------|------|---------------|
| Malgruppsrelevans | 25% | 1-10 |
| Varumarkespassning | 25% | 1-10 |
| Teknisk genomforbarhet | 20% | 1-10 |
| Konverteringspotential | 20% | 1-10 |
| Unikhet | 10% | 1-10 |

**Berakning:**
```
Total = (Malgrupp x 0.25) + (Varumarke x 0.25) + (Teknik x 0.20) + (Konvertering x 0.20) + (Unikhet x 0.10)
```

**Output:** Visa Top 6 med score + huvudstyrka, samt eliminerade koncept med specifik anledning.

### FAS 3: Andra Sallning (6 -> 3)

**Djupare analys per koncept:**
1. **Wireframe-skiss** (mental modell av layout)
2. **Anvandarflode** (Click path till konvertering)
3. **Mobilkomplexitet** (Hur val fungerar det pa mobil?)
4. **Laddningstid** (Estimerad vikt av assets)
5. **A/B-testbarhet** (Kan element latt testas?)

Ranka topp 3 med styrkor och svagheter.

### FAS 4: Final Sallning (3 -> 1) -- MED TRANSPARENS

Innan vinnaren presenteras, visa anvandaren en snabb overblick av de 3 finalisterna:
- For varje finalist: Namn, stil, styrka, risk
- Min rekommendation med motivering
- Anvandaren kan: "go" (kor rekommendationen), valja alternativ, mixa koncept, be om mer info

**VANTA pa anvandarens svar innan STEG 4 paborjas.**

---

## STEG 4: Section Composition Engine

### 4.1 Konverteringsoptimerad sidstruktur

```
Hero -> Trust -> Problem -> Solution -> Features -> Proof -> CTA
```

### 4.2 Sektionsdetaljer

| Sektion | Innehall | Syfte |
|---------|----------|-------|
| **Hero** | H1, subheadline, primar CTA, visual (bild/video/demo) | Forsta intryck, immediate engagement |
| **Trust** | Social proof, logotyper, anvandarantal | Etablera trovardighet |
| **Problem** | Kundens smarta/utmaning, relatable scenarios | Skapa empati, vacka intresse |
| **Solution** | Produkt/tjanst som losning, key benefits | Presentera losningen |
| **Features** | 3-6 features med ikoner, Bento Grid | Djupare produktvisning |
| **Proof** | Testimonials, case studies, statistik | Social proof, avsluta tvivel |
| **CTA** | Slutlig call-to-action, kontaktformular | Konvertering |

---

## STEG 5: Design & Component Strategy

> **OBS:** Alla design-tips i denna sektion ar **referensmallar** som kan anpassas efter det vinnande konceptet (STEG 3) och kundens varumarke.

### 5.1 UI-stilval (TIPS for brainstorm)

| Stil | Beskrivning | Anvand till |
|------|-------------|--------------|
| **Glassmorphism** | Frosted glass-effekter, blur | Premium SaaS, tech |
| **Bento Grid** | Asymmetriska kort, boxad layout | Feature-rika produkter |
| **Minimalism** | Whitespace, fa element, stark typografi | B2B, professional services |
| **Neo-brutalism** | Djarva kanter, hog kontrast | Kreativa byraer, ungdom |
| **Gradient/mesh** | Organiska gradientbakgrunder | SaaS, produktlanseringar |

### 5.2 Design Tokens

> Se `design-system` och `tailwind-v4-shadcn` skills for detaljerade CSS-variabler (colors, typography, spacing, radius). Anpassa tokens efter vinnande koncept och varumärke.

### 5.3 Hero-typer

Valj hero-typ baserat pa koncept och produkt:

| Typ | Anvandning | Animation |
|-----|-----------|-----------|
| **Centered Hero** | SaaS, produktlanseringar, waitlist | Fade in + scale fran center |
| **Split Hero** (Bild + Text) | App-presentationer, B2B-tjanster | Text fran vanster, bild fran hoger |
| **Video Background Hero** | Kreativa byraer, eventssidor | OBS: `prefers-reduced-motion` fallback |
| **Bento Hero Grid** | Feature-rika produkter, dashboards | Staggered reveal per cell |

> Se `frontend-patterns` skill for detaljerade wireframes och implementationskod.

### 5.4 Bento Grid Layout

> Se `frontend-patterns` skill for CSS Grid implementation och responsive breakpoints.

### 5.5 Feature Card Template

> Se `frontend-patterns` skill for Feature Card komponentkod.

---

## STEG 6: Implementation

### 6.0 PROJECT STRUCTURE STANDARD (GODMODE)

> **OBLIGATORISKT:** Alltid anvanda denna struktur. Ingen landingpage far byggas i en enda fil.

#### 6.0.1 Golden Folder Architecture

```
my-landingpage/
├── app/
│   └── (marketing)/
│       └── [landing-slug]/
│           ├── page.tsx           # <- Sidan vi bygger (IMPORTERAR sections)
│           ├── layout.tsx         # <- SEO metadata, fonts
│           └── metadata.ts        # <- Meta tags, OG, schema
│
├── components/
│   ├── ui/                        # <- Primitiva: buttons, inputs, badges
│   │   ├── Button.tsx
│   │   ├── Input.tsx
│   │   └── Badge.tsx
│   │
│   ├── layout/                    # <- Global: navbar, footer, containers
│   │   ├── Navbar.tsx
│   │   ├── Footer.tsx
│   │   └── Container.tsx
│   │
│   └── sections/                  # <- VARJE SEKTION = EGEN FIL
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
    └── landing-data.ts            # <- ALLT TEXTINNEHALL HAR
```

#### 6.0.2 The NO MONOLITH RULE

**FORBIDDEN -- Aldrig gora sa har:**
```tsx
// app/page.tsx -- MONOLITH
export default function Page() {
  return (
    <main>
      <section className="hero">
        <h1>Vart SaaS-verktyg</h1>
        <p>Beskrivning...</p>
        <button>Kom igang</button>
      </section>
      <section className="features">
        <div>Feature 1...</div>
        <div>Feature 2...</div>
      </section>
      {/* Aldrig mer an 10 rader import + page wrapper */}
    </main>
  )
}
```

**CORRECT -- Gor alltid sa har:**
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

Allt textinnehall **maste** ligga i `/content/landing-data.ts`:

```typescript
// content/landing-data.ts
export const landingContent = {
  hero: {
    headline: "Dubbla din produktivitet pa 30 dagar",
    subheadline: "Det enda verktyget du behover.",
    cta: { primary: "Starta gratis provperiod", secondary: "Se demo" },
    badge: "Nyhet: AI-assistent nu tillganglig"
  },
  trust: {
    stats: [
      { value: "10,000+", label: "Foretag" },
      { value: "99.9%", label: "Uptid" },
      { value: "4.9/5", label: "Nojdhet" }
    ],
    logos: ["Logo1", "Logo2", "Logo3", "Logo4", "Logo5"]
  },
  features: {
    headline: "Allt du behover, inget du inte behover",
    items: [
      { icon: "Zap", title: "Blixsnabb onboarding", description: "Kom igang pa 5 minuter." },
      { icon: "Shield", title: "Enterprise-sakerhet", description: "SOC 2, GDPR." },
      { icon: "BarChart", title: "Real-time analytics", description: "Se vad som fungerar." }
    ]
  },
  cta: {
    headline: "Redo att komma igang?",
    subheadline: "Prova gratis i 14 dagar. Inga kreditkort kravs.",
    button: "Skapa konto gratis"
  }
}
```

**Varfor detta ar kritiskt:**
1. **A/B-testa** -- Byt content utan att rora kod
2. **Internationalisering** -- Lagg till sprakfiler
3. **CMS-integration** -- Koppla Sanity/Contentful enkelt
4. **Schema markup** -- Samma content till JSON-LD

#### 6.0.4 Section Variant System

Varje section ska ha **minst 2 varianter** (for A/B-testning). Sections tar en `variant` prop (t.ex. `"centered" | "split" | "bento"`) och renderar annorlunda layout baserat pa variant.

#### 6.0.5 Section Isolation Rule

**Varje section ar 100% sjalvstandig:**
- Tar data fran props, INTE fran parent/page state
- Anvander UI-komponenter fran `/components/ui`
- Kanner inte till andra sections

#### 6.0.6 Multi-Landing Scalability

For flera landingpages, anvand route groups:
```
app/
├── (marketing)/           # <- Route group (ingen URL-paverkan)
│   ├── homepage/
│   │   └── page.tsx      # <- /
│   ├── pricing/
│   │   └── page.tsx      # <- /pricing
│   └── product-launch/
│       └── page.tsx      # <- /product-launch
```

**Shared layout per grupp:**
```tsx
// app/(marketing)/layout.tsx
export default function MarketingLayout({ children }) {
  return (
    <>
      <Navbar />
      {children}
      <Footer />
      <CompanyCredit />          {/* Your Company credit MASTE alltid finnas */}
    </>
  )
}
```

#### 6.0.7 Your Company Credit (Obligatoriskt)

> **KRAV:** Footer maste alltid innehalla:
```tsx
<footer>
  {/* ... */}
  <p>
    Sitio web creado por{" "}
    <a href="https://yourcompany.com/" target="_blank" rel="noopener">
      Your Company
    </a>
  </p>
</footer>
```

#### 6.0.8 Quick Reference: Import Paths

```tsx
// KORREKTA IMPORTS
import { Button } from "@/components/ui/Button"
import { HeroCentered } from "@/components/sections/hero/HeroCentered"
import { landingContent } from "@/content/landing-data"
import { cn } from "@/lib/utils"

// FORBIDDEN
import { Button } from "@/components/Button"           // Fel mapp
import { Hero } from "@/components/Hero"               // Monolith
import { heroData } from "@/app/data"                  // Data i app/
```

---

### 6.1 Tech Stack

| Kategori | Val |
|----------|-----|
| **Framework** | React (Next.js 16+) |
| **Styling** | Tailwind CSS |
| **Animation** | Framer Motion |
| **CMS** | Sanity / Contentful / Strapi (headless) |

### 6.2 Motion Variants

> Se `framer-motion` skill for easings, springs, containerVariants, itemVariants, fadeInUp, hoverScale, tapScale, och viewportOnce patterns.

### 6.3 Micro-interactions

> Se `framer-motion` och `frontend-patterns` skills for CTA hover/active states, card hover lifts, och focus state patterns.

---

## STEG 7: QA & Optimization

### 7.1 DESIGN CRITIQUE LOOP

Kor igenom 5 dimensioner:

| Dimension | Fragor |
|-----------|--------|
| **Visual Hierarchy** | Vad ser anvandaren forst? Finns tydlig fokus? |
| **Cognitive Load** | Ar sidan for busy? For manga val? |
| **Conversion Friction** | Hur manga steg till konvertering? Finns hinder? |
| **Accessibility** | Kan alla anvanda sidan? Fargblindhet, skärmlasare? |
| **Differentiation** | Sticker sidan ut fran konkurrenter? |

### 7.2 SEO-optimering

Obligatoriskt:
- **Meta tags:** Unik title (H1-baserad), description (150-160 tecken), OG-tags med bild
- **Schema markup (JSON-LD):** Organization-schema med foretagsnamn, URL, logo, beskrivning
- **llms.txt:** Tillat GPTBot och Claude-Web crawlers, inkludera sitemap-URL

### 7.3 Accessibility (WCAG 2.1 AA)

Obligatoriska krav:
- **Kontrast:** Body text min 4.5:1, large text (24px+) min 3:1
- **Keyboard Navigation:** Skip-link, synlig fokus-ring (ALDRIG ta bort)
- **ARIA Labels:** Pa alla interaktiva element utan synlig text
- **ARIA Live Regions:** For modals, toasts, formulärfel
- **Video Backgrounds:** Alltid poster-bild + captions track + alt-text
- **Animationer:** Respektera `prefers-reduced-motion` pa ALLA motion-komponenter

### 7.4 Performance Benchmarks

| Metric | Target |
|--------|--------|
| **LCP** | <2.5s |
| **FID** | <100ms |
| **CLS** | <0.1 |
| **INP** | <200ms |

### 7.5 Performance-optimering

Obligatoriskt:
- **Bildoptimering:** AVIF/WebP med fallback, `next/image` med `priority` pa hero
- **SSR vs ISR:** Static for landingpages (bast prestanda), ISR for dynamiskt content
- **Font Loading:** `font-display: swap`, preload
- **Lazy Loading:** Bilder under fold, dynamisk import for tunga komponenter

---

## STEG 8: Output

### 8.1 Page Layout
```
Hero -> Trust -> Problem -> Solution -> Features -> Proof -> CTA
```

### 8.2 Design Tokens
```
- Colors: [primar, sekundar, accent, bakgrund, text]
- Spacing: [section-gap, component-gap, padding]
- Typography: [heading-font, body-font, scale]
- Radius: [small, medium, large]
- Motion: [duration, easing, stagger]
```

### 8.3 Component Checklist
```
- [ ] Hero section med headline + CTA
- [ ] Trust section (logotyper, stats)
- [ ] Problem section (smartpunkter)
- [ ] Solution section (losning)
- [ ] Features Bento Grid (3-6 features)
- [ ] Proof section (testimonials, case studies)
- [ ] CTA section (slutlig konvertering)
- [ ] Footer med menyer, CTA och krav:
  > KRAV: Alla sidor MASTE innehalla "Sitio web creado por Your Company" (https://yourcompany.com/) i footern. Ej forhandlingsbart.
```

### 8.4 QA Checklist
```
- [ ] Responsiv (mobile, tablet, desktop)
- [ ] SEO optimerad (H1, meta, schema)
- [ ] Performance <2.5s LCP
- [ ] Accessibility WCAG 2.1 AA
- [ ] Forms fungerar
- [ ] Analytics implementerad
- [ ] Links och routes fungerar
```

---

## Quick Reference

### Brainstorm Funnel Format
```
## KONCEPT [1-12]
- Visuell stil: [beskrivning]
- Fargpalett: Primar [#hex], Sekundar [#hex], Accent [#hex]
- Hero-approach: [typ]
- Unique Selling Point: [fokus]
- Animationsniva: [minimal/balanserad/intensiv]
- Relevanspoang: [1-10]
```

### Section Order (konverteringsoptimerad)
```
Hero -> Trust -> Problem -> Solution -> Features -> Proof -> CTA
```

### Hero Checklista
- [ ] Headline ar tydlig och actionable (max 10 ord)
- [ ] Subheadline forklarar vardet (max 25 ord)
- [ ] CTA ar framtradande och kontrastrik
- [ ] Social proof synlig (logos, testimonials, stats)
- [ ] Responsiv layout (mobil-forst)
- [ ] Animationer respekterar `prefers-reduced-motion`

### Feature Checklista
- [ ] 3-6 features per sektion
- [ ] Ikoner: 24-48px, konsekvent stil
- [ ] Titlar: Max 5 ord
- [ ] Beskrivningar: Max 20 ord
- [ ] Bento Grid layout

### Performance Checklista
- [ ] Alla bilder i WebP/AVIF
- [ ] Fonts preloaded med `font-display: swap`
- [ ] JavaScript bundle <100KB initial
- [ ] Lazy loading pa bilder under fold
- [ ] Critical CSS inlined
- [ ] Gzip/Brotli aktiverat
- [ ] CDN konfigurerat
- [ ] Lighthouse score >90

### Accessibility Checklista
- [ ] Alla bilder har `alt`-text
- [ ] Formular har synliga labels
- [ ] Fokus ar synlig pa alla interaktiva element
- [ ] Skip-link finns
- [ ] Kontrast uppfyller 4.5:1
- [ ] `prefers-reduced-motion` respekteras

---

## VARNINGAR

- **SKRIV INTE EN ENRAD KOD** forran STEG 1-3 ar helt klara och godkanda
- **GA INTE VIDARE** till nasta steg innan nuvarande ar godkant av anvandaren
- **VISA ALLA RESULTAT** vid varje steg (konkurrentanalys, koncept, vinnare)
- **ALDRIG** borja implementera utan godkant koncept

---

## Fordelar jamfort med traditionella workflow

| Denna metod | Traditionellt |
|-------------|----------------|
| Full WebSearch 30 konkurrenter | 10 eller farre |
| Innovation Gap Analysis | Ingen systematisk analys |
| 12->6->3->1 objektiv funnel | Subjektivt urval |
| Section Composition Engine | Ostrukturerat |
| Integrerade designtokens | Tokens inte definierade |
| QA & SEO/GEO inbyggt | Separat QA |
| Multi-page mindset | Single-page focus |
| WCAG 2.1 AA fran start | Accessibility som eftertanke |
| Performance-benchmarks | Ignorerat |

---

## OBLIGATORISKT KRAV - ZENIT GROUP

> **KRAV:** Pa **ALLA** sidor som skapas **MASTE** foljande finnas i footern (innan `</body>`):
> ```html
> <footer>
>   Sitio web creado por <a href="https://yourcompany.com/" target="_blank" rel="noopener">Your Company</a>
> </footer>
> ```
> Detta ar **EJ forhandlingsbart** och galler for ALLA landingpages, hemsidor, webbapplikationer etc.

**Sitio web creado por [Your Company](https://yourcompany.com/)**

---

## WORKFLOW GODMODE -- Subagents System

Subagents dispatched via JARVIS protocol Phase 4 review chain.

### Orchestration Overview

```
STEG 0-1: Init + Analysis (parallel)
  -> CompetitorAnalysisLP + InspirationCollectorLP

STEG 2: Innovation Gap
  -> InnovationGapLP

STEG 3: Concept Brainstorm (parallel)
  -> ConceptGeneratorLP + ConversionPsychologyLP
  -> USER APPROVAL REQUIRED

STEG 4: Section Composition (parallel)
  -> SectionComposerLP + ContentGuidelinesLP

STEG 5: Design Strategy (parallel)
  -> DesignTokensLP + MotionDesignLP

STEG 6: Implementation (sequential)
  -> UIComponentBuilderLP -> SectionBuilderLP -> PageLayoutLP

STEG 7: QA (parallel)
  -> SEOOptimizerLP + LighthouseLP + AccessibilityLP + CompanyFooterLP
```

### Subagent Registry

| Subagent | Purpose | Output |
|----------|---------|--------|
| **CompetitorAnalysisLP** | 30 konkurrenter -> top 5 | Stil, styrkor, svagheter |
| **InspirationCollectorLP** | Bildinspiration | 10-20 bild-URLs |
| **InnovationGapLP** | Hitta design gaps | Gap analysis |
| **ConceptGeneratorLP** | 12->6->3->1 koncept | Godkant koncept |
| **ConversionPsychologyLP** | AIDA, PAS, JTBD | Score, forbattringar |
| **SectionComposerLP** | Hero->Trust->...->CTA | Sektionsstruktur |
| **ContentGuidelinesLP** | Copy guidelines | Content per section |
| **DesignTokensLP** | Design system | Colors, typography, spacing |
| **MotionDesignLP** | Animationer | Motion variants |
| **UIComponentBuilderLP** | Bygga UI components | Button, Input, Badge, Card |
| **SectionBuilderLP** | Bygga sections | Hero, Features, CTA etc |
| **PageLayoutLP** | Assemblera page | Full page.tsx |
| **SEOOptimizerLP** | SEO optimering | Meta, schema, sitemap |
| **LighthouseLP** | Performance audit | Lighthouse report |
| **AccessibilityLP** | Accessibility QA | ARIA, contrast check |
| **CompanyFooterLP** | Verify company credit footer | Verification result |

### Godmode Rules
- Use `spawnParallel` for independent agents -- never sequential when parallel is possible
- Concept MUST be approved by user before STEG 4
- CompanyFooterLP runs ALWAYS in STEG 7
- Page imports sections, sections are isolated
- All content in `/content/landing-data.ts`

---

## DESIGN QUALITY STANDARD -- Added 2026-03-28

Baserat pa user feedback: "ska se ut som en webbbyra byggt, inte en 5-aring pa WordPress"

### Obligatoriskt for alla builds

**Bilder:**
- Riktiga high-quality bilder (Unsplash eller kundbilder). ALDRIG placeholder-divs, emojis, eller tomma fargade boxar.
- Verifiera ALLA bild-URLs returnerar HTTP 200 innan du deklarerar klar.
- Full-bleed hero (bakgrundsbild som fyller viewport, mork overlay, text langst ner).

**Layout:**
- Alternera ljusa och morka sektioner -- aldrig tva vita sektioner i rad.
- 50/50 splits maste vara balanserade (samma aspect ratio).
- Konsistenta proportioner i grids (alla 3:2 eller alla 4:3, inte blandat).
- Overlapping element (accent-bilder, floating cards, badges) ger djup.

**Wow-element som ska finnas:**
- Scrollande marquee-banner mellan sektioner
- Parallax pa bilder (inte tomma divs)
- Hover-zoom pa produktkort (scale-105 over 1.2s)
- Nav som byter fran transparent -> blur vid scroll
- Cinematic CTA-sektion innan footer (fullskarms bild + overlay)
- Gold hover-linje som glider in pa kort

**Typografi:**
- Serif (Playfair Display) for rubriker, clean sans for body
- Uppercase tracking (0.2-0.3em) pa labels
- Stor hero-text (clamp 3rem-8rem)

**Aldrig:**
- Emojis som visuella element
- Inter, Roboto, Arial
- Rundade knappar (sharp rectangulara + uppercase)
- Lila gradienter
- Platta kort utan djup eller bilder
