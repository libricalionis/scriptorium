# Scriptorium — WordPress

Minimal literary stylesheet for WordPress.

Scriptorium CSS is designed for atmospheric fiction, serialized narratives, pericopes, and book-like typography. It aims to reproduce part of the rhythm and visual coherence of printed literary layouts directly inside the WordPress block editor.

The stylesheet was originally developed for *Le Livre des Ombres* and *L'Angle Mort*.

---

## Features

- Libertinus Serif integration
- book-like paragraph rhythm
- restrained late nineteenth-century aesthetics
- scene separators
- literary quotations and narrative notes
- small-caps scene titles
- responsive mobile layout
- support for narrative fragments, messages, and SMS-like exchanges
- coherent spacing tuned for long-form reading

---

## Installation

### 1. Upload the stylesheet

Copy `scriptorium.css` into your WordPress custom CSS area:

- Appearance → Customize → Additional CSS

or enqueue it through your theme.

---

### 2. Install the fonts

The stylesheet expects local `.woff2` files to be available in:

```text
/wp-content/uploads/fonts/libertinus/
```

Required files:

```text
LibertinusSerif-Regular.woff2
LibertinusSerif-Italic.woff2
LibertinusSerif-Bold.woff2
LibertinusSerif-BoldItalic.woff2
```

---

## Downloading Libertinus

Official repository:

- https://github.com/alerque/libertinus

Releases:

- https://github.com/alerque/libertinus/releases

Download the `.otf` font files from the latest release.

---

## Converting fonts to `.woff2`

### Option 1 — Online converter

Examples:

- https://cloudconvert.com/otf-to-woff2
- https://convertio.co/otf-woff2/

Convert each `.otf` file individually.

---

### Option 2 — Local conversion

Install:

```bash
sudo apt install woff2
```

Then convert:

```bash
woff2_compress LibertinusSerif-Regular.otf
woff2_compress LibertinusSerif-Italic.otf
woff2_compress LibertinusSerif-Bold.otf
woff2_compress LibertinusSerif-BoldItalic.otf
```

---

## Typography

Scriptorium uses:

- restrained spacing,
- moderate line height,
- centered scene titles,
- historic-inspired color accents,
- minimal ornamentation.

The stylesheet intentionally avoids:
- decorative effects,
- excessive shadows,
- modern UI aesthetics,
- aggressive responsiveness.

The goal is not to imitate print perfectly, but to preserve literary rhythm on screen.

---

# Available blocks and classes

## Scene separators

Standard WordPress separators are automatically restyled:

```html
<hr>
```

or Gutenberg separator blocks.

---

## Narrative notes

### `.scriptorium-note`

Indented literary note or atmospheric fragment.

Example:

```html
<p class="scriptorium-note">
The lamps remained lit long after the station closed.
</p>
```

---

## Signed Calion notes

### `.calion-note`

Variant of `.scriptorium-note` with automatic signature.

Example:

```html
<p class="calion-note">
Meaning survives through repetition.
</p>
```

The signature is added automatically through CSS.

---

## Scriptorium quotes

### `.scriptorium-quote`

Indented quotation, message, archival fragment, or inserted narrative block.

Example:

```html
<div class="scriptorium-quote">
<p>Do not return to the observatory.</p>
</div>
```

---

## SMS blocks

### `.sms-a`
### `.sms-b`

Alternating conversational fragments with horizontal offsets.

Example:

```html
<p class="sms-a">Are you still awake?</p>
<p class="sms-b">The machines never stopped.</p>
```

Offsets are automatically disabled on mobile devices.

---

## Figure highlighting

### `.figura`

Small-caps emphasis for recurring narrative figures.

Example:

```html
<span class="figura">Jonas</span>
```

---

## Mobile behavior

On smaller screens:
- offsets are removed,
- widths are normalized,
- narrative blocks remain centered,
- spacing is preserved.

The stylesheet prioritizes reading comfort over dense layouts.

---

## Repository structure

```text
wordpress/
├── README.md
├── scriptorium.css
└── screenshots/
```

---

## Live example

https://libricalionis.com

---

## License

MIT License.

---

## Author

Calion — writer and builder of quiet narrative systems.
