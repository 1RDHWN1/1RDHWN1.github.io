# DESIGN.md: udincloud.me company landing

## Design Read

Reading this as: a company landing page for technical buyers, founders, and program reviewers, in a restrained modern software-company register informed by Vercel and Linear but not copying either, dial ENERGY 2 / RHYTHM 2 / MOTION 1.

The owner explicitly changed direction from the existing terminal identity to modern SaaS. This user instruction supersedes the previous terminal styling direction for the company homepage. Keep the personal terminal page at `me.udincloud.me` unchanged.

## Direction and R-37 record

- **Surface:** company homepage introducing two real, working web products.
- **Mood:** composed, confident, product-focused, contemporary. No faux enterprise scale.
- **Audience:** potential program reviewers, technical collaborators, and visitors evaluating the products.
- **Reference register:** Vercel / Linear, used only for restraint, typographic hierarchy, and disciplined surfaces. Do not clone their layouts, logos, colors, or language.
- **Explicit override:** replace the former terminal-session presentation on the company root with a modern software-company presentation. The owner requested this change directly in chat on 2026-10-08.
- **R-37 collisions acknowledged:** the old monospace-led terminal voice (R-06), glyph-rain / grid texture (R-07), live-status glow (R-13), typed terminal prompt and terminal framing (R-05/R-06) no longer define this page. Remove them here. The separate personal page remains at `me.udincloud.me`.
- **Do not reproduce the earlier rejected draft cluster:** blue-purple gradient, blurred glow orbs, eyebrow badge repeating the headline, decorative pulsing dot, diamond glyph logo, arrows on most buttons, glass navbar, uniform card grid, or generic template sequence.

## Dials

- **ENERGY 2:** confident visual hierarchy without shouty color or oversized marketing claims.
- **RHYTHM 2:** consistent system with distinct compositions for company introduction, product explanations, and infrastructure evidence.
- **MOTION 1:** restrained hover/focus feedback only. No reveal dependency or looping animation.

## Palette

| Role | Value | Reason |
|---|---|---|
| Base | `#101114` | Near-black graphite gives the two products a shared technical setting without the pure terminal-black look. |
| Surface | `#191b20` | Separates product information from the base using a small, legible luminance step. |
| Text | `#f1f0ed` | Warm off-white reduces glare while keeping strong contrast. |
| Secondary text | `#b2b4bb` | Keeps descriptions readable and distinct from headlines. |
| Accent | `#c6f36a` | A single acidic yellow-green marks key interactive moments; it is not used as a decorative wash. |
| SignaCerta signal | `#8ab6ff` | A limited blue signal differentiates the document-verification product from ClipAI's media workflow; used only in its product detail. |

## Typography

- Use a contemporary sans-serif for headings and body because this is a product/company page, not a terminal transcript.
- Use a restrained monospace only for actual technical identifiers, protocols, and short metadata. It is not the headline voice.
- Font choice must have a legible system fallback; content remains complete if remote fonts fail.

## Layout decisions

1. **Opening:** one concise company statement and direct paths to the two live products. No eyebrow badge. The first screen explains what udincloud is, not a generic promise.
2. **Products:** two distinct editorial product sections rather than identical feature cards. ClipAI gets more space for its multi-stage video workflow; SignaCerta is presented as a compact, precise document-verification tool.
3. **Evidence:** show only verified behavior and technologies. No fabricated users, revenue, uptime, customer logos, or scale claims.
4. **Infrastructure:** a compact, factual account of the self-managed deployment, because running the products is part of the company's real work. No simulated dashboard or fake live status.
5. **Footer:** only real destinations: product apps, personal page, GitHub, and founder email.

## Color and motion use

- Accent highlights primary product links and selected details only. No blue-purple gradient, no full-page glow, no blurred orbs.
- Surfaces are solid. No glass navbar. Radius varies by semantic role; no pill-everything treatment.
- Motion is limited to short hover and focus transitions. Reduced-motion removes transitions. Content is visible by default without JavaScript.

## Content sources and constraints

Use only verified product information already checked for this project:

- ClipAI: paste a YouTube URL; produce vertical 9:16 clips; Whisper transcription; AI scoring of hook, pacing, retention, and payoff; word-level animated subtitles with four presets; face-tracking reframing to 1080x1920; generated title, description, and hashtags; Node.js/Express, BullMQ/Redis, yt-dlp, FFmpeg with AMD VAAPI acceleration. A verified 19-second source produced three clips; top score 91/100. Include numeric proof only if it remains clearly contextualized as one test output, not a general guarantee.
- SignaCerta: digitally sign PDFs and verify authenticity through a QR code; ECDSA NIST P-256, SHA-256, and tamper detection.
- Live product URLs: `https://clipai.udincloud.me`, `https://signacerta.udincloud.me`.
- Personal page: `https://me.udincloud.me`.
- GitHub: `https://github.com/1RDHWN1`.
- Founder contact: `mailto:founder@udincloud.me`.

Invent nothing else. Do not create pricing, testimonials, customer logos, user counts, uptime claims, certifications, or links to non-existent pages.

## Delivery Gate

Before deployment, re-run copy scan, computed-color contrast, mobile range audit, click-through/keyboard verification, reduced-motion check, and no-JavaScript visibility check. Report each gate item with measured evidence. Keep the previous live production version recoverable through Git history and backup tag.
