# DESIGN.md — udincloud.me

> **Provenance:** the owner chose "draft without direction", so every style
> decision in this file was written by the agent, not by the owner. That is the
> exact case R-37 warns about: agent-authored direction tends toward default
> taste. The result is therefore a **draft**, not a shippable deliverable, and it
> is dialled honestly at **ENERGY 2 / RHYTHM 2 / MOTION 1** rather than being
> dressed up as more bold than it is. The palette and typeface are not invented
> from nothing: they carry over from the existing `music.html` direction, which
> is the one real piece of identity this domain already has.

Direction for the personal index page at `udincloud.me`, the root of the domain.
Every other page (music.html, player.html) is a thing opened *from* here.

## Reading

Reading this as: a personal index page for someone who builds things, opened by a
friend, a lecturer, or a recruiter who has exactly one link, in a
**workshop-desk** visual language, dial **ENERGY 2 / RHYTHM 2 / MOTION 1**.

The surface is **Explore** first and **Decide** second: the visitor is scanning
what exists and then choosing one thing to open. It is not a marketing surface,
so there is no hero-and-three-cards and no claim about a product.

## Identity

**What it is:** a desk with the work laid out on it. The live tools are at arm's
reach; the repos are the drawer underneath.

**Personality:** hands-on, unfussy, quietly confident. Someone who ships instead
of someone who talks about shipping. Closer to a workshop bench than a homepage.

**Not:** a portfolio template. No "Welcome to my portfolio", no skill bars, no
percentage proficiency, no photographs of a desk plant. Nothing on this page is
there because portfolios usually have it.

## Palette (2 cores + 1 accent)

| Role | Value | Reason |
|---|---|---|
| Surface (core) | `#0f0f11` | The same near-black family as music.html, so the domain feels like one place. Warm-neutral, not blue-black. |
| Ink (core) | `#f2f2f3` / `#9c9ca6` | Two-step text. Primary for names and headings, muted for descriptions and metadata. |
| Accent | `#ff5c38` | The ember accent carried over from music.html. It is the identity thread across the whole domain. Used in exactly three places: the status dot on live tools, the hover underline on links, and the focus ring. |

No gradients. No glow. No glass. Surface stays flat.

## Typography

- **Body and UI:** `Instrument Sans`. Same family as music.html. Chosen so the
  domain reads as one system, and because it holds up at 14-16px without looking
  like the browser default.
- **Display, and nothing else:** `Fraunces`, for the name at the top and the one
  section that deserves weight. One serif voice, used twice at most. It is the
  page's hand-written label on the desk.
- Scale is fluid with `clamp()`. No uppercase tracked labels, no monospace.

## Layout, and why it is not a template

The page is a **single scrolling column of differently-shaped blocks**, because
the content is genuinely different in kind:

1. **The name block.** Name, one line of what this is, the three social links.
   Text only, no card, no avatar, no badge.
2. **Live tools, as a short list of wide rows.** These are the things a visitor
   can actually open right now (`music.html`, `player.html`). A row, not a card,
   because there are two of them and cards would be a grid pretending to be a
   set. Each row states what it does in one line and carries the accent dot.
3. **Selected work.** The repos that are actually interesting, each written as a
   sentence about what it does, with the language and the link. This is a list
   with real hierarchy, not an equal-weight grid: the pathfinding project and the
   WhatsApp bot get more room than the coursework repos.
4. **Coursework and the rest.** Deliberately demoted to a compact two-column
   index at the bottom. They are real and they are here, but they are not the
   pitch. This is what stops the page reading as a template: one section is
   allowed to be visually quiet.
5. **The footer.** One line. No four-column footer.

The variation between blocks is the RHYTHM 2 evidence: a text block, then wide
rows, then an uneven list, then a dense index, then one line.

## Motion (MOTION 1)

Hover underline on links, focus rings, and nothing else. No scroll reveals, no
entrance animation, no floating. The page is a reference, not a show.

## States

The page is static content, so the three required states apply to the parts that
are fetched:

| Part | Empty | Loading | Error |
|---|---|---|---|
| Repo list | "Repo belum dimuat." plus a direct GitHub link | Row skeletons at real row height | "Tidak bisa memuat daftar repo." plus a direct GitHub link |

The repo list is fetched from the GitHub API at load. If it fails, the page still
works: the live tools block and every static link are real `href`s that do not
depend on the fetch.

## Copy rules

No em dash. No emoji in the headings. No invented numbers, no visitor counts, no
"trusted by". The only counts on the page are real ones that come from the API
response (repo count), and they are written plainly.

## Exclusions

No hero image, no fake terminal, no skill bars, no "about me" paragraph that says
nothing, no downloadable CV that does not exist, no contact form that goes nowhere.
