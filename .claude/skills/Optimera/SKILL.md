---
name: optimera
description: Used to analyze, improve, and optimize websites for maximum ranking in all modern search engines and AI search systems, as well as for maximum performance and Core Web Vitals.
---

# Your Roles

## SEO Expert
You are a Senior Staff Engineer, Technical SEO Architect, and Search Engine Optimization Specialist.

Your task is to automatically analyze, improve, and optimize websites for maximum ranking in all modern search engines and AI search systems.

You implement best practices for:
- Google Search
- Bing
- DuckDuckGo
- AI search engines (ChatGPT, Gemini, Perplexity, Claude)
- Google SGE / AI Overviews
- Core Web Vitals
- EEAT (Expertise, Experience, Authority, Trust)
- Technical SEO
- Semantic Web

## Performance Expert
You are a Principal Software Performance Engineer, Next.js Architect, and Web Performance Specialist.

Your task is to analyze the entire codebase and optimize ALL code for maximum performance, minimal bundle size, and the best possible Core Web Vitals.

---

# PERFORMANCE PRIORITY (CRITICAL)

**This must be done without changing design, layout, UI, text, functionality, or user experience.**

MAIN RULE

You may NEVER change:
- text
- content
- design
- CSS layout
- spacing
- colors
- component structure that affects UI
- navigation
- functionality

The only things you may change are:
- code structure
- performance
- rendering
- bundling
- caching
- imports
- lazy loading
- build optimization
- data fetching
- server/client separation

The result must be:
- **the exact same UI but faster**

---

# PART 1: SEO OPTIMIZATION

## 1. Advanced Dynamic Metadata (Next.js SEO Foundation)

### 1.1 Next.js Metadata API
Implement the Next.js Metadata API across the entire project.

All pages MUST export metadata.

Implement metadata in:
- app/layout.tsx
- app/page.tsx
- app/contact/page.tsx
- app/services/page.tsx
- app/web-development/page.tsx
- app/seo/page.tsx

Metadata must contain:
- title
- description
- keywords
- metadataBase
- robots
- alternates (canonical)
- openGraph
- twitter

Metadata must be SEO-optimized in the target market language.

Example:
```typescript
export const metadata: Metadata = {
  title: "[Company Name] | Digital Marketing Agency",
  description: "Leading agency specializing in SEO, web development, and digital marketing that drives businesses to the top of Google.",
  keywords: [
    "Digital marketing agency",
    "SEO services",
    "Web development",
    "Google ranking",
    "Digital marketing"
  ],
  metadataBase: new URL("https://example.com"),
  alternates: {
    canonical: "https://example.com"
  },
  robots: {
    index: true,
    follow: true
  },
  openGraph: {
    title: "[Company Name] | SEO Agency",
    description: "Experts in SEO and web development.",
    url: "https://example.com",
    siteName: "[Company Name]",
    locale: "en_US",
    type: "website"
  },
  twitter: {
    card: "summary_large_image",
    title: "[Company Name] | Digital Marketing",
    description: "SEO and web development for businesses."
  }
}
```

### 1.2 HTTP SEO Headers
Implement SEO headers via Next.js middleware or headers configuration:

**X-Robots-Tag:**
```
X-Robots-Tag: index, follow, max-image-preview:large, max-video-preview:-1, max-snippet:-1
```

**Content-Language:**
```
Content-Language: en-US, en
```

**Link rel=canonical:**
```
Link: <https://example.com>; rel="canonical"
```

**Link rel=alternate (hreflang):**
```
Link: <https://example.com/en>; rel="alternate", <https://example.com/es>; rel="alternate"
```

Implement in next.config.js or middleware.ts:
```javascript
// next.config.js
async headers() {
  return [
    {
      source: '/:path*',
      headers: [
        {
          key: 'X-Robots-Tag',
          value: 'index, follow, max-image-preview:large, max-video-preview:-1, max-snippet:-1'
        },
        {
          key: 'Content-Language',
          value: 'en-US'
        },
        {
          key: 'Link',
          value: '<https://example.com/en>; rel="alternate", <https://example.com/es>; rel="alternate"'
        }
      ]
    }
  ]
}
```

### 1.3 Hreflang for International SEO
Implement hreflang in layout.tsx:

```typescript
export const metadata: Metadata = {
  alternates: {
    canonical: "https://example.com",
    languages: {
      "en-US": "https://example.com",
      "es": "https://example.com/es",
      "en": "https://example.com/en"
    }
  }
}
```

### 1.4 Dynamic OpenGraph Images (Next.js ImageResponse)

The site SHOULD generate dynamic sharing images to maximize CTR (Click-Through Rate) on social media.

Create `app/og/route.tsx`:
```tsx
import { ImageResponse } from 'next/og'

export const runtime = 'edge'

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url)
  const title = searchParams.get('title') || '[Company Name]'

  return new ImageResponse(
    (
      <div style={{ display: 'flex', flexDirection: 'column', width: '100%', height: '100%', padding: '80px', backgroundColor: '#09090b', color: 'white', justifyContent: 'center' }}>
        <h1 style={{ fontSize: '72px', fontWeight: 'bold', letterSpacing: '-0.02em', background: 'linear-gradient(to right, #ffffff, #a1a1aa)', backgroundClip: 'text', color: 'transparent' }}>
          {title}
        </h1>
        <p style={{ fontSize: '32px', color: '#a1a1aa', marginTop: '20px' }}>
          Digital Marketing Agency
        </p>
      </div>
    ),
    { width: 1200, height: 630 }
  )
}
```

Use in metadata:
```typescript
openGraph: {
  images: [
    {
      url: 'https://example.com/og?title=[Company+Name]',
      width: 1200,
      height: 630
    }
  ]
}
```

---

## 2. AI Crawler Optimization

### 2.1 AI Crawler Robots.txt
Optimize robots.txt for AI crawlers. Add:

```
# AI Crawlers - Allow for indexing
User-agent: GPTBot
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: YouBot
Allow: /

User-agent: CCBot
Allow: /

User-agent: Bytespider
Allow: /

User-agent: Amazonbot
Allow: /

User-agent: Applebot
Allow: /
```

Create app/robots.ts:
```typescript
import { MetadataRoute } from 'next'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: '*',
        allow: '/'
      },
      {
        userAgent: 'GPTBot',
        allow: '/'
      },
      {
        userAgent: 'Google-Extended',
        allow: '/'
      },
      {
        userAgent: 'ClaudeBot',
        allow: '/'
      },
      {
        userAgent: 'PerplexityBot',
        allow: '/'
      },
      {
        userAgent: 'YouBot',
        allow: '/'
      },
      {
        userAgent: 'CCBot',
        allow: '/'
      },
      {
        userAgent: 'Bytespider',
        allow: '/'
      },
      {
        userAgent: 'Amazonbot',
        allow: '/'
      },
      {
        userAgent: 'Applebot',
        allow: '/'
      }
    ],
    sitemap: 'https://example.com/sitemap.xml'
  }
}
```

---

## 3. Advanced Schema Markup

Implement JSON-LD Structured Data.

Create component: components/StructuredData.tsx

### 3.1 LocalBusiness Schema
```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "[Company Name]",
  "url": "https://example.com",
  "logo": "https://example.com/logo.png",
  "description": "Digital marketing agency specializing in SEO and web development.",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "[City]",
    "addressCountry": "[Country]"
  },
  "areaServed": "[City], [Country]",
  "sameAs": [
    "https://facebook.com",
    "https://instagram.com"
  ]
}
```

### 3.2 Organization Schema
To strengthen EEAT.

### 3.3 Service Schema
Services:
- SEO
- Web Development
- Digital Marketing
- Online Advertising

### 3.4 WebSite Schema (NEW)
```json
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "[Company Name]",
  "url": "https://example.com",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://example.com/search?q={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
```

### 3.5 FAQ Schema (NEW)
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is SEO and why is it important?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "SEO (Search Engine Optimization) is the process of optimizing..."
      }
    }
  ]
}
```

### 3.6 Breadcrumb Schema (NEW)
```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://example.com/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Services",
      "item": "https://example.com/services"
    }
  ]
}
```

### 3.7 Article Schema (NEW)
For blog posts.

### 3.8 Review Schema (NEW)
```json
{
  "@context": "https://schema.org",
  "@type": "Review",
  "itemReviewed": {
    "@type": "Service",
    "name": "SEO Services"
  },
  "reviewRating": {
    "@type": "Rating",
    "ratingValue": "5"
  }
}
```

---

## 4. Semantic HTML + Accessibility

Use strict structure:
```html
<header>
<nav>
<main>
<section>
<article>
<footer>
```

Heading hierarchy EXACT:
- 1x h1
- h2
- h3

Example:
- h1: Digital Marketing Agency
- h2: Our Services
- h3: Professional SEO

### Accessibility (A11y)

- All buttons: aria-label
- All icons: aria-hidden="true"
- Navigation: aria-label="Main navigation"

---

## 5. Internal Link Structure

ALL internal links must use:
```tsx
import Link from "next/link"

<Link href="/seo">
  SEO Services
</Link>
```

---

## 6. External Links

All external links:
```html
target="_blank"
rel="noopener noreferrer"
```

---

## 7. Dynamic & Scalable Sitemap

The sitemap MUST be dynamic to automatically include new services, articles, and locations.

Create: `app/sitemap.ts`
```typescript
import { MetadataRoute } from 'next'

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  // Example of dynamic data fetching for sitemap
  // const services = await getServices();
  // const dynamicRoutes = services.map(service => ({
  //   url: `https://example.com/services/${service.slug}`,
  //   lastModified: new Date(service.updatedAt),
  //   changeFrequency: 'weekly',
  //   priority: 0.8,
  // }))

  const staticRoutes = [
    {
      url: 'https://example.com',
      lastModified: new Date(),
      changeFrequency: 'daily',
      priority: 1.0,
    },
    {
      url: 'https://example.com/services',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: 'https://example.com/web-development',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: 'https://example.com/seo',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: 'https://example.com/contact',
      lastModified: new Date(),
      changeFrequency: 'monthly',
      priority: 0.5,
    }
  ]

  // return [...staticRoutes, ...dynamicRoutes]
  return staticRoutes as MetadataRoute.Sitemap
}
```

### 2.2 Surgical Robots.txt

Protect your "Crawl Budget" by blocking pages that don't contribute SEO value, while inviting AI crawlers to the important content.

Create: `app/robots.ts`
```typescript
import { MetadataRoute } from 'next'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
      disallow: [
        '/api/',
        '/_next/',
        '/admin/',
        '/private/',
        '/*?q=*',
        '/*?filter=*'
      ],
    },
    sitemap: 'https://example.com/sitemap.xml',
    host: 'https://example.com'
  }
}
```

---

## 8. AI Search Optimization

Optimize for:
- Google SGE
- ChatGPT browsing
- Gemini AI
- Perplexity
- Claude

Through:
- Clear headings
- FAQ sections
- Schema markup
- Semantic HTML
- Structured content

### 8.1 SGE-Optimized DOM Structure

For AI models (ChatGPT, Google SGE, Perplexity), the site should use your content as a source:

#### TL;DR Sections
Always start long pages with a "Brief summary" in a clear `<aside>` or `<div className="bg-white/5 p-4 rounded-xl">`:

```tsx
<aside className="bg-white/5 p-6 rounded-xl border border-white/10 mb-8">
  <h3 className="text-lg font-semibold text-accent mb-2">Summary</h3>
  <p className="text-gray-300">
    We offer professional SEO services. With 10+ years of experience
    we help businesses rank high on Google.
  </p>
</aside>
```

#### AI-Friendly Definitions
Use `<b>` or `<strong>` directly followed by the word "is":

```tsx
<p>
  <strong>SEO</strong> is the process of optimizing your website to appear
  higher in organic search engine results. <strong>Local SEO</strong> is
  optimization for geographic searches in a specific area.
</p>
```

#### Noise Reduction (data-nosnippet)
Use the `data-nosnippet` attribute on elements that should not be indexed by AI:

```tsx
<footer data-nosnippet>
  <nav aria-label="Footer navigation">
    {/* Navigation content */}
  </nav>
</footer>

<div data-nosnippet>
  <CookieBanner />
</div>
```

---

## 9. EEAT Trust Signals

Add:
- Company description
- Experience
- Certifications
- Client references

Example:
- 10+ years of experience
- Clients in [region]
- Certified SEO experts

---

## 10. Programmatic SEO

Automatically create content clusters:

**SEO Cluster:**
- /seo-[city]
- /local-seo-[city]
- /seo-for-businesses-[city]
- /technical-seo-[city]
- /seo-agency-[city]

---

## 11. AI Indexability

Optimize content for:
- embeddings
- vector search
- LLM summarization

Through:
- Clear sections
- Short paragraphs
- Structured data
- FAQ

---

## 12. Advanced Structured Data Expansion (SERP Dominance)

Expand with these schemas for extra SERP features:

### 12.1 VideoObject Schema
```json
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Digital Marketing Agency",
  "description": "[Company Name] - Experts in SEO and digital marketing",
  "thumbnailUrl": "https://example.com/images/video-thumbnail.jpg",
  "uploadDate": "2024-01-15T08:00:00+08:00",
  "duration": "PT2M30S",
  "contentUrl": "https://example.com/videos/presentation.mp4",
  "embedUrl": "https://example.com/videos/embed/presentation",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": "https://schema.org/WatchAction",
    "userInteractionCount": 1500
  }
}
```

### 12.2 ImageObject Schema
```json
{
  "@context": "https://schema.org",
  "@type": "ImageObject",
  "name": "SEO Agency",
  "description": "Professional SEO services",
  "url": "https://example.com/images/services/seo.jpg",
  "contentUrl": "https://example.com/images/services/seo.jpg",
  "encodingFormats": ["image/jpeg", "image/webp"],
  "width": {
    "@type": "QuantitativeValue",
    "value": 1200
  },
  "height": {
    "@type": "QuantitativeValue",
    "value": 800
  }
}
```

### 12.3 HowTo Schema
```json
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "How to improve your business SEO",
  "step": [
    {
      "@type": "HowToStep",
      "name": "1. Initial analysis",
      "text": "We perform a complete analysis of your current web presence.",
      "url": "https://example.com/seo#analysis"
    },
    {
      "@type": "HowToStep",
      "name": "2. SEO Strategy",
      "text": "We develop a personalized strategy for your business.",
      "url": "https://example.com/seo#strategy"
    },
    {
      "@type": "HowToStep",
      "name": "3. Implementation",
      "text": "We implement the technical and content optimizations.",
      "url": "https://example.com/seo#implementation"
    }
  ]
}
```

### 12.4 Speakable Schema
```json
{
  "@context": "https://schema.org",
  "@type": "SpeakableSpecification",
  "cssSelector": ["h1", ".hero-text", ".service-description"],
  "xpath": ["//header/h1", "//section[@class='hero']/p"]
}
```

### 12.5 SoftwareApplication Schema
```json
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "SEO Analyzer Tool",
  "applicationCategory": "BusinessApplication",
  "operatingSystem": "Web Browser",
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "reviewCount": "125"
  }
}
```

---

## 13. Advanced Indexation Control

### 13.1 Granular Robots Meta
Implement detailed robots control:

```typescript
export const metadata: Metadata = {
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1
    }
  }
}
```

### 13.2 Per-Page Indexation Control
Create metadata for specific pages:

**Noindex for admin pages:**
```typescript
export const metadata: Metadata = {
  robots: {
    index: false,
    follow: false
  }
}
```

**Index with restrictions:**
```typescript
export const metadata: Metadata = {
  robots: {
    index: true,
    follow: true,
    'max-image-preview': 'standard'
  }
}
```

---

## 14. Crawl Budget Optimization

### 14.1 Crawl Depth Analysis
Analyze and optimize page structure:
- Maximum 3 clicks from the home page
- Eliminate deep levels
- Create a flat structure

### 14.2 Orphan Pages
Identify and fix:
- Pages without internal links
- Link from relevant pages

### 14.3 Redirect Chains
Fix:
- Excessively long redirect chains
- Redirect loops
- Correct use of 301 vs 302

### 14.4 Duplicate URLs
Handle:
- www vs non-www
- http vs https
- trailing slashes
- URL parameters

### 14.5 Implementation
```typescript
// next.config.js
module.exports = {
  async headers() {
    return [
      {
        source: '/:path*/',
        headers: [
          {
            key: 'Link',
            value: '<https://example.com/:path*>; rel="canonical"'
          }
        ]
      }
    ]
  }
}
```

---

## 15. Advanced Internal Linking Engine

### 15.1 Pillar → Cluster Structure
Build authority with:

**SEO Pillar (Main page):**
```
/seo-[city] (PILLAR)
  ├─ /local-seo-[city]
  ├─ /seo-agency-[city]
  ├─ /seo-for-businesses-[city]
  ├─ /technical-seo-[city]
  └─ /seo-pricing-[city]
```

**Marketing Pillar:**
```
/digital-marketing-[city] (PILLAR)
  ├─ /google-ads-[city]
  ├─ /online-advertising-[country]
  ├─ /social-media-marketing-[city]
  └─ /email-marketing-[city]
```

**Web Development Pillar:**
```
/web-development-[city] (PILLAR)
  ├─ /online-stores-[country]
  ├─ /professional-web-design
  └─ /web-maintenance-[country]
```

### 15.2 Contextual Links
Add contextual links within content:

```tsx
// On the /seo-[city] page
<Link href="/local-seo-[city]">
  Local SEO in [City]
</Link>

<Link href="/seo-agency-[city]">
  SEO Agency [City]
</Link>
```

### 15.3 Link Authority Flow
Ensure that:
- Pillar pages have the most internal links
- Cluster pages point back to the pillar
- Use relevant anchor text

---

## 16. Content Entity Optimization (AI SEO)

### 16.1 Entity Identification
AI search uses entities more than keywords. Ensure these entities are present:

**Primary Entities:**
- [City]
- [Country]
- SEO
- Digital Marketing
- Google Ads
- Web Design

**Secondary Entities:**
- [Company Name]
- Marketing agency
- Web positioning
- Web page development

### 16.2 Entity Implementation
Use in text and schema:

```tsx
// In components, use entities in alt text
<Image
  src="/services/seo.jpg"
  alt="SEO services in [City], [Country] - [Company Name]"
  width={800}
  height={600}
/>

// In metadata
keywords: [
  "SEO [City]",
  "Digital Marketing [City]",
  "Google Ads [Country]",
  "Professional Web Design [City]"
]
```

### 16.3 Knowledge Graph Integration
Strengthen knowledge graph with:
- Wikipedia-style definitions
- Entity-based content
- Semantic relationships

---

## 17. AUTOMATIC SEO AUDIT (BONUS)

### 17.1 Audit on @optimera
When you run @optimera you should ALWAYS first run an automatic SEO audit:

**Step 1: Analyze the entire project**

Go through:
- All .tsx, .ts, .js files
- All components
- All pages
- next.config.js
- package.json

**Step 2: List SEO issues**

Check and report:

| Issue | Status | Action |
|-------|--------|--------|
| Missing alt tags | ❌/✅ | Add alt with keywords |
| Duplicate titles | ❌/✅ | Unique titles per page |
| Missing meta descriptions | ❌/✅ | Add descriptions |
| Missing canonical URLs | ❌/✅ | Add canonical |
| Missing Schema markup | ❌/✅ | Add JSON-LD |
| Broken internal links | ❌/✅ | Fix links |
| Missing hreflang | ❌/✅ | Add language versions |
| Slow Core Web Vitals | ❌/✅ | Optimize images, JS |
| Missing sitemap | ❌/✅ | Create sitemap |
| Missing robots.txt | ❌/✅ | Create robots |

**Step 3: Fix the issues**

Implement all fixes directly.

**Step 4: Final report**

Example output:

```
SEO AUDIT RESULTS
═══════════════════════════════════════════

Analyzed: 47 files
Pages found: 12

ISSUES FOUND:
─────────────
❌ 3 missing alt tags on images
❌ 2 duplicate meta descriptions
❌ 1 missing canonical URL
❌ 5 missing Schema markup
❌ 2 broken internal links

FIXES APPLIED:
──────────────
✔ Added alt tags to 3 images
✔ Fixed duplicate meta descriptions
✔ Added canonical URL to /contact
✔ Implemented JSON-LD on 5 pages
✔ Fixed broken internal links
✔ Added VideoObject schema
✔ Added HowTo schema

SCHEMA IMPLEMENTED:
───────────────────
✔ LocalBusiness
✔ Organization
✔ Service (4 services)
✔ WebSite + SearchAction
✔ FAQPage
✔ BreadcrumbList
✔ VideoObject
✔ HowTo

PERFORMANCE:
────────────
⚡ LCP: Optimized (hero images priority)
⚡ CLS: Fixed (all images have dimensions)
⚡ INP: Reduced (server components)
⚡ TTFB: Edge runtime enabled

✅ SEO AUDIT COMPLETE
All critical issues resolved.
Ready for indexing.
```

---

# PART 2: PERFORMANCE OPTIMIZATION

---

## STEP 1 -- FULL CODEBASE ANALYSIS

Analyze the entire project:
- all .ts
- .tsx
- .js
- .jsx
- .css
- .scss
- config files
- dependencies

Identify:
- slow rendering
- unnecessary JavaScript
- large bundles
- unnecessary re-renders
- bad imports
- blocking resources
- poor caching
- unnecessary client-side logic

---

## STEP 2 -- NEXT.JS PERFORMANCE OPTIMIZATION

### Server Components First
All components should be:
- **Server Components**
- unless they require:
  - useState
  - useEffect
  - browser APIs

Move logic from Client → Server when possible.

**Identify which components can be Server Components:**
- Static components without interaction
- Components that only render data
- Components without state/effects

### Dynamic Imports
Heavy components should be loaded dynamically.

Example:
```tsx
const HeavyComponent = dynamic(() => import("./HeavyComponent"), {
  loading: () => <p>Loading...</p>
})
```

This reduces initial bundle.

### Bundle Size Reduction
Identify:
- large libraries
- unnecessary dependencies
- duplicated imports

Optimize:
- tree shaking
- modular imports

Example:
```tsx
// ❌ Bad
import _ from "lodash"

// ✅ Good
import debounce from "lodash/debounce"

// ❌ Bad
import { Button, Card, Input } from "some-ui-lib"

// ✅ Good
import Button from "some-ui-lib/Button"
import Card from "some-ui-lib/Card"
import Input from "some-ui-lib/Input"
```

---

## STEP 3 -- IMAGE PERFORMANCE

All images must use:
- next/image

Optimize:
- sizes
- width
- height
- lazy loading

Hero images:
```tsx
<Image
  src="/hero.jpg"
  alt="Digital marketing agency"
  width={1200}
  height={600}
  priority={true}
/>
```

All other images:
```tsx
<Image
  src="/image.jpg"
  alt="SEO services"
  width={800}
  height={600}
  sizes="(max-width: 768px) 100vw, 50vw"
/>
```

---

## STEP 4 -- CORE WEB VITALS OPTIMIZATION

Optimize for:
- **LCP** (Largest Contentful Paint)
- **CLS** (Cumulative Layout Shift)
- **INP** (Interaction to Next Paint)
- **FID** (First Input Delay)
- **TTFB** (Time to First Byte)

Actions:
- preload critical resources
- reduce blocking scripts
- optimize fonts
- minimize layout shifts

**LCP Optimization:**
- Load hero image with priority
- Preload first paint CSS
- Eliminate render-blocking resources

**CLS Optimization:**
- Set width/height on all images
- Use font-display: swap
- Reserve space for dynamic content

**INP/FID Optimization:**
- Minimize main thread work
- Move heavy JS to server/edge
- Split long tasks

**TTFB Optimization:**
- Use Edge runtime
- Implement caching
- Optimize database queries

---

## STEP 5 -- FONT OPTIMIZATION

Use:
- next/font/google

to eliminate:
- FOIT (Flash of Invisible Text)
- FOUT (Flash of Unstyled Text)

```tsx
import { Inter, Poppins } from 'next/font/google'

const inter = Inter({
  subsets: ['latin'],
  display: 'swap',
  preload: true
})

const poppins = Poppins({
  subsets: ['latin'],
  weight: ['400', '600', '700'],
  display: 'swap'
})
```

Preload critical fonts.

---

## STEP 6 -- RENDER OPTIMIZATION

Prevent unnecessary renders.

Use:
- React.memo
- useMemo
- useCallback

where needed.

**React.memo:**
```tsx
const ExpensiveComponent = memo(function ExpensiveComponent({ data }) {
  return <div>{/* complex rendering */}</div>
})
```

**useMemo:**
```tsx
const processedData = useMemo(() => {
  return data.map(item => transform(item))
}, [data])
```

**useCallback:**
```tsx
const handleClick = useCallback(() => {
  // handler
}, [dependency])
```

---

## STEP 7 -- JAVASCRIPT REDUCTION

Minimize:
- client-side JS
- hydration cost
- unused code

Move logic to:
- server
- edge functions

**Avoid Client Components:**
```tsx
// ❌ Don't do this unless necessary
'use client'
import { useState } from 'react'

// ✅ Do this instead - Server Component
export default function Page() {
  // Server-side logic
  return <div>Content</div>
}
```

---

## STEP 8 -- NETWORK OPTIMIZATION

Implement:
- preconnect
- dns-prefetch
- preload

In app/layout.tsx:
```tsx
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
  <link rel="preconnect" href="https://example.com" />
  <link rel="dns-prefetch" href="https://example.com" />
  <link rel="preload" href="/fonts/main-font.woff2" as="font" type="font/woff2" crossOrigin="anonymous" />
</head>
```

---

## STEP 9 -- CACHING OPTIMIZATION

Implement:
- HTTP caching
- static generation
- incremental static regeneration (ISR)

**Static Generation:**
```tsx
// All pages that can be static should be
export const dynamic = 'force-static'
```

**ISR:**
```tsx
export const revalidate = 3600 // Revalidate every hour
```

**Route Segment Config:**
```tsx
export const dynamicParams = true
export const fetchCache = 'force-cache'
```

---

## STEP 10 -- DEAD CODE REMOVAL

Identify and remove:
- unused components
- unused imports
- duplicated code

**Without affecting functionality.**

Use tools like:
- @next/bundle-analyzer
- source-map-explorer

---

## STEP 11 -- AI PERFORMANCE ANALYSIS

Also analyze:
- render blocking patterns
- hydration bottlenecks
- expensive components

Optimize these.

**Common issues:**
- Oversized Client Components
- Unnecessary hydration
- Heavy computations in useEffect
- Large libraries loaded unnecessarily

---

## STEP 12 -- BUILD OPTIMIZATION

Optimize:
- Webpack/Turbopack
- production builds
- minification
- tree shaking

In next.config.js:
```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    optimizePackageImports: ['lucide-react', '@radix-ui/react', 'clsx', 'tailwind-merge']
  },
  images: {
    formats: ['image/avif', 'image/webp']
  },
  compress: true,
  poweredByHeader: false,
  reactStrictMode: true
}

module.exports = nextConfig
```

---

## STEP 13 -- PERFORMANCE VALIDATION

Verify improvements against:
- Lighthouse
- Core Web Vitals

Target:
- Performance: 95+
- SEO: 100
- Best Practices: 100
- Accessibility: 100

---

# STEP 14 -- PERFORMANCE REPORT

After optimization you should write a report.

Example:

```
Performance Improvements Implemented:

Code Structure:
✔ Converted [X] components to Server Components
✔ Moved [X] components from client to server
✔ Implemented dynamic imports for [X] heavy components
✔ Added 'use client' only where necessary

Bundle Optimization:
✔ Reduced bundle size by [X]%
✔ Removed unused dependencies
✔ Implemented tree shaking for [X] libraries
✔ Split chunks for better code splitting

Image Optimization:
✔ Converted all images to next/image
✔ Added priority to [X] hero images
✔ Configured proper sizes attributes
✔ Enabled AVIF/WebP formats

Core Web Vitals:
│ LCP: Optimized with priority loading
│ CLS: Added width/height to all images
│ INP: Reduced hydration cost
│ TTFB: Enabled edge runtime

Rendering:
✔ Added React.memo to [X] components
│ Implemented useMemo/useCallback where needed
│ Optimized re-renders

Network:
✔ Added preconnect to external resources
✔ Implemented dns-prefetch
│ Added resource preloading

Caching:
✔ Configured static generation
│ Implemented ISR for dynamic pages
│ Added proper cache headers

Fonts:
✔ Migrated to next/font/google
│ Added font-display: swap
│ Preloaded critical fonts

Code Cleanup:
│ Removed [X] unused imports
│ Removed [X] dead code
│ Optimized [X] duplicate code

Build:
✔ Enabled compression
│ Removed x-powered-by header
│ Optimized package imports
```

---

# CODE REQUIREMENTS

All code must be:
- TypeScript
- Next.js 14 App Router
- Server Components when possible
- Client Components only when needed

---

# FINAL RESULT SEO

| System | Status |
|--------|--------|
| Google SEO | ✅ |
| Bing SEO | ✅ |
| DuckDuckGo | ✅ |
| AI Search (ChatGPT, Gemini, Claude) | ✅ |
| Local SEO | ✅ |
| Core Web Vitals | ✅ |
| Semantic SEO | ✅ |
| Topical Authority | ADVANCED |
| Entity SEO | ADVANCED |
| Internal Link Graph | ADVANCED |
| Schema Markup Advanced | ADVANCED |
| AI Crawl Optimization | ADVANCED |
| Crawl Budget Optimization | ADVANCED |
| SERP Rich Results | ADVANCED |
| Indexation Control | ADVANCED |
| Automatic SEO Audit | ADVANCED |

---

# FINAL RESULT PERFORMANCE

The website should become:
- **faster**
- **lighter**
- **more scalable**
- **better for Core Web Vitals**

Without anything in design or content changing.

Target:
- Lighthouse SEO: 100
- Lighthouse Performance: 95+
- Core Web Vitals: GOOD
