# DESIGN.md: udincloud.me

Direction for the personal index page at `udincloud.me`, the root of the domain.
Every other page (music.html, player.html) is a thing opened *from* here.

## Reading

Reading this as: a personal index page for a builder who works in Kali Linux all
day, opened by a friend, a lecturer, or a recruiter with exactly one link, in a
**live terminal session** visual language, dial **ENERGY 3 / RHYTHM 3 /
MOTION 3**.

This is an **Explore** surface with a **Decide** job: scan what exists, then pick
one thing to open.

## Provenance, and the R-37 note

The owner chose this direction in two steps, and both are recorded here because
R-37 is about who wrote the direction:

1. v1 was built after the owner said "draft without direction", so v1's direction
   was agent-authored and it read as a text document. The owner rejected it:
   "masih jelek hasilnya, gua mau yg lebih animatif dan berkesan wowwww".
2. The owner then chose **motion-heavy** and the **dev / terminal / matrix**
   register, and confirmed the register is **not decoration**: they use Kali
   Linux and a terminal daily. That lived experience is the criterion R-37 asks
   for. A terminal-styled page for someone who lives in a terminal is identity,
   not costume.

### Overrides, named and approved before building (R-37)

Three patterns sit next to the Hard Gate. Each was named to the owner with its
rule number before any code was written, and the owner chose to keep them on the
condition that each has a stated job. They are recorded here so the exception is
auditable rather than silent:

| Rule | Pattern | Status | The job it does here |
|---|---|---|---|
| R-07 | Background grid | **Kept, owner-approved** | The terminal's own texture, at 4% opacity. It is the page's identity motif and the only purely decorative element on the page, which is exactly why it is nearly invisible. |
| R-06 | Monospace type | **Kept, owner-approved** | The page is styled as a session log. Mono is the native voice of that medium: it is the type the subject reads all day, not a display font chosen to look technical. |
| R-01 / R-13 | Glow | **Kept, owner-approved, dose-capped** | Glow marks **live state only**: the caret, the prompt line, the scroll bar, and a row the pointer is on. It never sits on static decoration. |

Nothing else in the slop list was requested, and nothing else is present.

## Identity

**What it is:** the page as a terminal session that has already run. The prompt
is at the top, the output is the work, and the caret is still blinking.

**Personality:** fast, exact, a little cocky. It does not explain itself twice.
It answers in output, not in paragraphs.

**Not:** a "cyberpunk" theme park. No glitch text, no katakana rain, no fake
breach logs, no scanlines over everything, no invented CVE numbers, no `ACCESS
GRANTED` theatre. Those are the costume. The real thing is quieter and it works.

## Palette (2 cores + 2 accents, each with one job)

| Role | Value | Reason |
|---|---|---|
| Surface (core) | `#08090b` | True near-black with a cold cast, the colour of an unlit terminal. Darker than v1 because the glow needs something to sit against. |
| Surface (raised) | `#0e1014` | The row the pointer is on. One step up, so it needs no border. |
| Ink (core) | `#e7e9ec` / `#8b929e` / `#78808c` | Three-step text: output, secondary, comment. The comment tier is what makes it read as a session rather than a list, and it is set at the lightest value that still clears 4.5:1 against both the surface and the raised row (4.99:1 and 4.77:1). |
| Accent (primary) | `#4ee08a` | Terminal green, the colour of `user@host` in a prompt. Used for live state and for the page's own voice. |
| Accent (secondary) | `#ff5c38` | The ember carried from `music.html`, kept deliberately: it is the thread tying this page to the music and video pages. It appears **once**, on the one link that leaves the domain, so the exits are visually distinct from internal navigation. |

## Typography

- **Everything that is output:** `JetBrains Mono`, fallback `ui-monospace`, then
  the system mono stack. One family for the page. No second mono.
- **The name, and only the name:** `Fraunces`, carried from `music.html`. It is
  the one human element in the session, which makes the page a person's desk
  rather than a log file.
- Scale is fluid with `clamp()`. The body sits at 14 to 15px because that is what
  a terminal uses, not because small type looks technical.

## Layout, and why it is not a template

The page is a **session transcript**: one column, top to bottom, in the order a
person would actually run it.

1. **The prompt line.** `user@udincloud:~$ whoami`, and the output below it. This
   is the entry point and it types itself out on load. Text only.
2. **The identity output.** Name, one line of what this is, the social links, as
   output rather than as a card.
3. **`ls ~/tools`** then two rows for the things that open right now. These rows
   are the most interactive element on the page.
4. **`git log --projects`** then the repos that matter, each as a commit-like
   entry: name, the sentence describing it, metadata. The strongest project gets
   more weight than the rest.
5. **`ls ~/coursework`** then the coursework as a compact index, visually quiet
   on purpose.
6. **The prompt line again, with a blinking caret.** The session ends where it
   can start again.

The rhythm varies on purpose (RHYTHM 3): a typed line, then output, then a row
list, then an uneven list, then a dense index, then a lone prompt.

## Motion (MOTION 3: it is the point, not the garnish)

The owner asked for motion, so motion carries work instead of decorating:

1. **Entry typing.** The prompt types character by character on load, caret
   following. It sets the metaphor in two seconds.
2. **Scroll reveal.** Blocks rise and fade in once each as they enter, staggered
   by their own lines. It paces the read.
3. **Row response.** Tool rows lift, show a text cursor, and their accent edge
   fills. It is the affordance.
4. **Scroll progress.** One hairline at the very top fills as the page is read.
   It is a position cue.
5. **Live caret.** The caret blinks forever, including at the closing prompt.

Every one of the above collapses under `prefers-reduced-motion: reduce`, where
the page renders complete and static.

## States

The page is static content, so the three required states apply to the repo list,
written in the terminal's own voice:

| State | What it prints |
|---|---|
| Empty | `// belum ada repo yang dimuat.` plus the GitHub link |
| Loading | Skeleton rows at real row height, with a `fetching...` line |
| Error | `!! tidak bisa memuat daftar repo. exit 1` plus the GitHub link |

The fetch has a 10 second timeout and retries once, because a public API on a
phone connection fails more often than one on a desk. If it fails, the page still
works: the tool rows and every static link are real `href`s that do not need it.

## Copy rules

No em dash. No fake logs, no invented exit codes on operations that did not
happen, no numbers that did not come from the API, and no claim about a break-in.
The terminal voice is used for what actually happened on this page, and nothing
else.

## Exclusions

No glitch effect, no katakana rain, no scanline overlay, no fake `ACCESS
GRANTED`, no audio, no pointer trap, and no motion for a visitor who asked the
system for less.
