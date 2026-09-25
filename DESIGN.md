# DESIGN.md — Jarvis Music

Direction for the in-app music page at `udincloud.me/music.html`, opened from the
WhatsApp bot's `!music` / `.lagu` / `!yhtml` reply.

## Reading

Reading this as: a phone-first listening page opened from a chat message, for one
person holding a phone in one hand, in a calm library-listening visual language,
dial **ENERGY 1 / RHYTHM 2 / MOTION 1**.

The page is a utility, not a landing page. It exists so somebody who just typed a
song title in WhatsApp can hear it in two taps. Every section is the list, the
player, or the way between them.

## Identity

**What it is:** a personal listening shelf. The album art is the visual anchor;
everything else steps back.

**Personality:** quiet, tactile, unhurried. Closer to a record sleeve than a
dashboard. No urgency, no badges, no shouting.

**Not:** a streaming service home page. No carousels, no "Because you listened
to", no promotional tiles, no gradient mesh hero.

## Palette (2 cores + 1 accent)

| Role | Value | Reason |
|---|---|---|
| Surface (core) | `#0b0b0d` | Near-black, low chroma. Lets album art carry all the saturation on the page; a lighter surface would fight it. |
| Ink (core) | `#f4f4f5` / `#a1a1aa` | Two-step text: primary for the track title, muted for artist and duration. Calm, not grey-on-grey. |
| Accent | `#ff5c38` | Warm ember, not the blue of every music app. Used in exactly four places: the play button, the progress fill, the active row marker, and the focus ring. |

No gradients. No glow. No glass. Surface stays flat and matte.

## Typography

- **UI text:** `Instrument Sans` (fallback: system sans). Chosen for a slightly
  narrow, workmanlike grotesque that reads well at 14-15px on a phone and does
  not look like the default starter font.
- **Track titles only:** `Fraunces` (fallback: Georgia). One serif voice on the
  page, used only where a human wrote a name. It is what makes the page feel like
  a shelf of records rather than a table of records.
- Scale is fluid (`clamp()`); headings drop a step on mobile. No uppercase
  tracking labels, no monospace.

## Layout

Phone-first. The order is the order of use:

1. Search field, with the query already filled from the WhatsApp link.
2. The track list. This is the page; it gets the height.
3. The player, pinned to the bottom edge, always reachable with a thumb.

At 700px and up the page becomes two states, not a squeezed phone: the list moves
left, the player becomes a fixed panel on the right with the album art at a
larger size. Verified across the whole width range, not just two samples.

## Motion (MOTION 1)

Only two movements, both on user action:

- The row marker slides between rows when the selection changes.
- The play button swaps between play and pause glyphs.

No entrance animations, no floating, no pulses, no scrolling reveals.

## Player behaviour

Audio comes from the iTunes preview URL and plays through a real `<audio>`
element, so it starts on the same tap that selects the row. The YouTube embed is
a fallback for tracks with no preview, and it only appears when it is actually
needed. Every state is drawn: searching, empty, no preview, load failed.

## States (all three required)

| State | What it says |
|---|---|
| Empty | "Belum ada lagu. Cari di kolom atas." plus the search field focused. |
| Loading | The list keeps its rows as skeletons at the real row height, so nothing jumps. |
| Error | What failed and the one thing to try: "Koneksi ke server pencarian gagal. Coba cari ulang." |

## Exclusions

No em dash in any text. No emoji in headings or buttons. No invented play counts,
listener numbers, or "trending" labels: the only numbers on the page are the real
track duration and position.
