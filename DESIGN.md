# DESIGN.md: udincloud.me company landing

Direction for the landing page at `udincloud.me`, the root of the domain. It
introduces what the domain runs and sends the visitor into the two apps.

## Reading

Reading this as: a company landing page for a builder who runs their own apps,
opened by a recruiter, a lecturer, or a friend with one link, in a **live
terminal session** visual language, dial **ENERGY 3 / RHYTHM 2 / MOTION 2**.

This is an **Explore then Decide** surface: understand what udincloud is in a
few seconds, then open one app.

## Provenance, and the R-37 note

The direction is the owner's, carried from the domain's existing pages, and it
is on the record:

1. The owner rejected an early flat text version ("masih jelek hasilnya, gua mau
   yg lebih animatif dan berkesan wowwww") and chose a motion-heavy dev /
   terminal register.
2. The owner confirmed the register is **not decoration**: they work in Kali
   Linux and a terminal daily. That lived experience is the criterion R-37 asks
   for. A terminal-styled page for someone who lives in a terminal is identity,
   not costume.

The **company landing** framing of this specific file is agent-authored: it
turns that approved personal identity into a company-style root page. It keeps
the owner's palette, type, and terminal voice, and it fabricates nothing. It is
therefore a **draft of the framing, not the final owner-approved page**. The
owner should confirm or adjust the framing before this is treated as final.

### Overrides, named and approved before building (R-37)

Three patterns sit next to the Hard Gate. Each was named to the owner with its
rule number before any code was written, and the owner chose to keep it on the
condition that each has a stated job. They are recorded here so the exception is
auditable rather than silent:

| Rule | Pattern | Status | The job it does here |
|---|---|---|---|
| R-07 | Glyph rain + hairline rules | **Kept, owner-approved** | The terminal's own texture, drawn at one low opacity behind the text. It is the page's identity motif, which is exactly why it stays nearly invisible. |
| R-06 | Monospace type | **Kept, owner-approved** | The page is a session log. Mono is the native voice of that medium: the type the subject reads all day, not a display font picked to look technical. |
| R-01 / R-13 | Glow | **Kept, owner-approved, dose-capped** | Glow marks **live state only**: the caret, the scroll hairline, and the status chip while it is online. It never sits on static decoration. |

Nothing else in the slop list was requested, and nothing else is present.

## Identity

**What it is:** the page as a terminal session that has already run. The prompt
is at the top, the output is the two apps, and the caret is still blinking.

**Personality:** fast, exact, a little understated. It answers in output, not in
paragraphs.

**Not:** a "cyberpunk" theme park. No glitch text, no katakana rain, no fake
breach logs, no scanlines over everything, no invented CVE numbers, no `ACCESS
GRANTED` theatre, no fake uptime graph. Those are the costume. The real thing is
quieter and it works.

## Palette (2 cores + 2 accents, each with one job)

| Role | Value | Reason |
|---|---|---|
| Surface (core) | `#08090b` | True near-black with a cold cast, the colour of an unlit terminal. Darker than a first draft because the glow needs something to sit against. |
| Surface (raised) | `#0e1014` / `#14171c` | The app row, and the row the pointer is on. One step up, so the row needs no heavy border. |
| Ink (core) | `#e7e9ec` / `#8b929e` / `#78808c` | Three-step text: output, secondary, comment. The comment tier is set at the lightest value that still clears 4.5:1 against both the surface and the raised row. |
| Accent (primary) | `#4ee08a` | Terminal green, the colour of `user@host` in a prompt. Used for live state and the page's own voice. |
| Accent (secondary) | `#ff5c38` | The ember carried from the domain's music page. It appears once, on the one status that means "not reachable", so a problem is visually distinct from normal state. |

## Typography

- **Everything that is output:** `JetBrains Mono`, fallback `ui-monospace`, then
  the system mono stack. One family for the page. No second mono.
- **The brand and the name, and only those:** `Fraunces`, carried from the
  domain's other pages. It is the one human element in the session, which makes
  the page a person's desk rather than a log file.
- Scale is fluid with `clamp()`. Body sits at 14 to 15px because that is what a
  terminal uses, not because small type looks technical.

## Layout, and why it is not a template

The page is a **session transcript**. Each block is a command and its output,
not a "section" with a centred title over a card grid. The rhythm varies on
purpose (RHYTHM 2): a typed prompt line, a large brand, a paragraph, a row list,
a spec table, a link row, a lone prompt.

1. **Hero.** `whoami`, then the brand as the output, then one sentence, then one
   action. The brand is the single focal point of the first screen.
2. **`ls ~/aplikasi`.** Two rows for the apps that open right now. These rows are
   the most interactive element on the page.
3. **`cat ~/server`.** Where it runs. A spec table, not a fake dashboard.
4. **`whoami --long`.** Who runs it, with the real profile links.
5. **The prompt line again, with a blinking caret.** The session ends where it
   can start again.

## What the status chip is allowed to say

Each app row prints a live reachability state, read from the browser, never
invented:

| State | What it prints |
|---|---|
| Idle (before JS) | `cek status` |
| Checking | `memeriksa` |
| Online | `online` (green) |
| Unreachable | `tidak terjangkau` (ember) |

It is a real cross-origin probe of the app's own URL with an 8 second timeout.
If the probe cannot run, it says so; it never defaults to a green light it did
not measure. There is no fake CPU graph, invented uptime, or made-up counter.

## Background (owner-approved, one layer, capped)

The owner asked for the background to be more than flat black. It is a **glyph
rain**: a slow field of falling characters drawn on a canvas behind everything,
at one low opacity, on the near-black field. One layer only, no scanlines on top,
no second effect. It stops entirely for `prefers-reduced-motion`, and it stops
when the tab is hidden, so it never burns a battery in a background tab.

## Motion (MOTION 2: it paces the read, it is not the product)

1. **Entry typing.** The prompt types itself on load, caret following. It sets
   the metaphor in about a second. If JS never runs, the word `whoami` is already
   in the markup and still reads.
2. **Entrance.** Blocks rise and fade once. This is a self-running keyframe with
   **no hidden default state anywhere**: the resting CSS is the visible state, so
   a failed script shows everything rather than a blank page.
3. **Row response.** App rows lift, show an accent edge, and swap background. It
   is the affordance.
4. **Scroll progress.** One hairline at the top fills as the page is read.
5. **Live caret.** The caret blinks forever, including at the closing prompt.
6. **The rain.** Always moving, at the lowest priority on the page.

Every one of the above collapses under `prefers-reduced-motion: reduce`, where
the page renders complete and static and the rain does not start at all.

## Copy rules

No em dash. No fake logs, no invented exit codes on operations that did not
happen, no numbers that did not come from a real source, and no claim about a
break-in. The terminal voice is used for what actually happened on this page,
and nothing else. No emoji as UI decoration.

## Exclusions

No glitch effect, no katakana rain, no scanline overlay, no fake `ACCESS
GRANTED`, no audio, no pointer trap, no motion for a visitor who asked the system
for less.
