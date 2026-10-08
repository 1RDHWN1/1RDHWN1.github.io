# DESIGN.md: UdinCloud Technologies Landing Page

## Strategic Objective: Claude for Startups (Anthropic) Alignment

This landing page serves as the corporate public face of **UdinCloud Technologies** (at `udincloud.me`), engineered to meet the high evaluation standards of international tech incubators, partners, and venture grant programs, specifically the **Claude for Startups (Anthropic)** program.

### Target Persona & Evaluator Expectations
- **Audience:** Global technical evaluators, Anthropic partnership reviewers (San Francisco, CA), and prospective enterprise/creator users.
- **Language:** Professional International English.
- **Tone:** Authoritative, high-throughput systems engineering, credible, and focused on working production software over hype.
- **Visual Identity:** Modern Obsidian/Slate Dark Canvas (`#07080b`), precision cyan/emerald accents, crisp sans-serif display typography (Plus Jakarta Sans) with JetBrains Mono for system metrics.

---

## Architecture & Product Moats

### 1. Flagship Engine: ClipAI (`https://clipai.udincloud.me`)
- **Category:** Autonomous Multimodal Video Repurposing Pipeline.
- **Core Technology:**
  - OpenAI Whisper STT with word-level alignment.
  - LLM-assisted narrative intelligence: hook extraction, pacing evaluation, viewer retention scoring, and payoff prediction.
  - Computer vision face tracking with dynamic 9:16 vertical reframing (1080x1920).
  - Automated edge-to-edge viral headline banners.
  - Distributed BullMQ + Redis job orchestration.
  - Multi-platform GPU acceleration: AMD VAAPI (Linux) and AMD AMF (Windows).
  - HTTP 206 partial-content streaming delivery preventing IDM aggressive download locks.

### 2. Cryptographic Security Engine: SignaCerta (`https://signacerta.udincloud.me`)
- **Category:** Zero-Knowledge Document Integrity & Public Attestation.
- **Core Technology:**
  - NIST P-256 (FIPS 186-4) Elliptic Curve Digital Signature Algorithm (ECDSA).
  - SHA-256 cryptographic digest creating tamper-evident document fingerprints.
  - Decentralized/Public QR verification enabling zero-trust validity checks without leaking confidential document contents.

### 3. Sovereign Infrastructure Fabric
- **Compute:** Self-hosted cluster running Proxmox VE 8.4 with isolated Debian LXC workloads.
- **Edge Routing:** Cloudflare Argo Tunnel delivering encrypted zero-trust edge delivery with no open public ports.
- **High Concurrency:** Redis broker managing asynchronous transcode queues with atomic state updates.

---

## Anti-Slop Verification & Quality Controls

1. **R-01 (No Cheap Gradients/Glow):** Solid dark canvas, zero blurred glow orbs, zero radial light leaks.
2. **R-02 (Typography Standards):** No unescaped em-dashes or en-dashes.
3. **R-03 / Mobile:** Full viewport verification across 320px to 1280px with 0 overflow and tap targets strictly >= 44px.
4. **R-04 (No Decorative Glyphs):** Zero emoji used as UI chrome.
5. **R-06 / R-25 (Contrast Compliance):** Strict WCAG AA contrast ratio (> 4.5:1 for body copy and headings, > 3.0:1 for boundaries).
6. **R-16 (No Cheap Buzzwords):** Filtered out ungrounded superlative marketing words.
7. **R-17 / R-36 (Zero Fabricated Metrics):** Every benchmark reported corresponds to verified reproducible internal tests (e.g. 19-second video generating 3 clips with peak score 91/100).
8. **R-35 (Link Integrity):** Every outbound link actively resolves to HTTP 200.
