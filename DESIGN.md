# DESIGN.md: udincloud.me company landing

## Design Read

Reading this as: a company landing page for a real, tiny software studio, opened by a program
reviewer deciding whether the products actually work plus technical visitors. Register: modern
software company, restrained and typographic, in the spirit of Vercel and Linear without copying
either. Dial ENERGY 2 / RHYTHM 2 / MOTION 1.

## R-37 record

- The terminal identity is gone from the company home. This page is modern SaaS, not a CLI.
- Provenance: the register (modern SaaS) is the owner's explicit decision and supersedes the older
  terminal direction. The three dials and the surface choices below are agent-authored from the
  owner's brief (calm, credible company page), so treat them as a draft the owner can retune, not
  as owner-authored direction.
- Superseded source: `/home/cutycat15/1RDHWN1.github.io/DESIGN.md` describes the old terminal
  look. Its aesthetics are ignored here; only its values (real engineer, anti-copycat,
  anti-template) carry over.
- Correction against the staged draft that preceded this file: that draft named DM Sans and Space
  Mono, a coral `#ff5c35`, and a JavaScript cursor-following product selector with ENERGY 3 /
  MOTION 2. Three conflicts with the owner's brief were resolved in favour of the brief:
  1. `#ff5c35` text on the paper surface measures 4.06:1, under the 4.5:1 AA floor (R-25), so the
     accent was darkened to `#b8380f`.
  2. The brief requires content to be visible without JavaScript, so the JS cursor-follower was
     dropped and MOTION was set to 1.
  3. The brief asks for a calm, credible company page, so ENERGY was set to 2.
- `me.udincloud.me` (the personal page) is untouched.

## Dials

- **ENERGY 2:** large display type and real product surfaces carry the page, with one warm accent.
  No shouty colour, no oversized claims.
- **RHYTHM 2:** one consistent two-column editorial grid, with deliberate breaks inside it so the
  page is not four identical blocks: a split introduction, a dark full-bleed video section, a warm
  document section that mirrors its screenshot, and a compact ledger of infrastructure facts. The
  internal forms differ on purpose (index cards, numbered flow, spec list, fact ledger).
- **MOTION 1:** short hover lifts and colour transitions only. No reveal dependency, no loops. All
  content is visible by default, and reduced motion removes every transition.

## Visual direction

- **Surface:** light warm paper for the company layer. ClipAI is a dark panel because its product
  works on video at night; SignaCerta is an off-white document surface because its product is a
  PDF. The theme follows the media each product handles.
- **Type:** Schibsted Grotesk for display and reading, chosen for a slightly squarish, editorial
  sans that is not the Inter or Geist default (R-06). IBM Plex Mono appears only for numbers,
  domains, ratios, and protocol identifiers, never as the reading voice.
- **Palette (R-29):** two neutrals plus one accent. Ink `#191712`, muted `#55504a`, and accent
  `#b8380f` on paper `#f4f0e8`; the dark section reuses the same family inverted. One accent, used
  for actions and index numerals only, never as a background or glow.
- **Visual proof:** the two screenshots are captured from the live applications at their real URLs
  and served as product evidence. They are not mockups or skeletons.
- **Identity motif:** a monospace numeral system (01, 02) and rule-separated data rows that read
  like a ledger. The same two gestures repeat in the product index, the ClipAI step flow, the
  SignaCerta spec list, and the infrastructure facts.

## Content constraints

Use only verified facts:

- ClipAI: turns a YouTube URL into vertical 9:16 clips. Whisper transcription, moment scoring for
  hook, pacing, retention and payoff, word subtitles, face-tracking reframe to 1080x1920, edge-to-edge
  auto headline banner, and generated title, description and hashtags. Web player with HTTP 206
  streaming. Stack: Node.js, Express, BullMQ, Redis, yt-dlp, FFmpeg with AMD GPU encoding (VAAPI on
  Linux, AMF on Windows). One verified internal test: a 19-second source produced 3 clips, best
  moment scored 91 out of 100. Stated as one test output, not a guarantee.
- SignaCerta: signs a PDF and proves authenticity through a QR code. ECDSA NIST P-256, SHA-256,
  and tamper detection after signing.
- Infrastructure: Proxmox VE with 3 Debian LXC containers, Cloudflare Tunnels, self-run Redis and
  GPU rendering.
- Links: ClipAI, SignaCerta, me.udincloud.me, GitHub 1RDHWN1, founder email.

No fabricated users, testimonials, customer logos, usage counts, uptime, pricing, or status
indicators. No pricing, docs, or blog pages exist, so no nav items point at them.

## Reason log (R-31)

- Warm paper base: a studio that runs real hardware, not a cold SaaS template; the warmth also
  separates this page from the product screenshots instead of competing with them.
- Dark ClipAI panel: the product output is vertical video, so its section is the one dark surface.
- Off-white SignaCerta panel: the product output is a printed document, so its section reads as
  paper.
- No eyebrow badge, no gradient, no glow orb, no pulsing dot, no glass navbar, no arrow on every
  button, no uniform card grid: each is an explicit reject from the brief, and none of them served
  this page's hierarchy.

## Required gate

Before publishing, test the candidate in a browser at mobile and desktop sizes; test keyboard
focus, all internal anchors, reduced motion, no-JavaScript render, CSS failure fallback, computed
contrast, touch targets, and every real outbound destination. Do not claim completion before a
fresh PASS after the final edit.

## Motion pass (2026-10-08, revisi owner)

Owner menilai versi sebelumnya terlalu kaku dan meminta animasi. Dial diubah
dari MOTION 1 menjadi **MOTION 2**, dengan alasan per animasi (R-19, R-31):

| Animasi | Alasan (R-31) |
|---|---|
| Reveal saat scroll pada blok konten | Memandu mata mengikuti urutan bagian saat halaman turun, bukan sekadar menghias. |
| Stagger pada `.flow` dan `.specs` dan `.facts` | Menunjukkan urutan baca 01, 02, 03 pada tiap daftar, jadi urutannya terasa. |
| `rise` sekali di hero | Memberi satu fokus masuk di layar pertama; tidak diulang di elemen lain. |

Batas yang dijaga:
- Bukan template-animation serentak (R-19): hanya reveal scroll, stagger daftar, dan
  satu animasi hero; tidak ada floating, scale, atau bounce.
- Konten tetap terlihat tanpa JavaScript: kelas `js` hanya ditambah lewat JS, dan
  ada pengaman 3 detik yang melepas kelas itu bila observer tidak pernah jalan.
- `prefers-reduced-motion: reduce` mematikan semua animasi dan transisi.
