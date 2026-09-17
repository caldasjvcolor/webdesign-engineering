# Design-system reference

Use this reference when a project lacks an explicit visual system or when a
change must extend one.

## Minimum token set

- color roles: page, surface, text, muted text, border, focus, action, danger;
- typography roles: display, heading, body, label, caption;
- spacing scale: a small consistent unit scale rather than arbitrary values;
- shape and shadow roles: only where they communicate grouping or interaction;
- motion roles: duration and easing with a reduced-motion fallback.

Prefer CSS variables or the project's existing Tailwind theme so components
consume roles rather than scattered raw values. Keep contrast and focus tokens
visible in both light and dark contexts when those modes exist.

## Component rule

Extract a component when structure, behavior, or accessibility semantics are
repeated. Do not create a component only to hide one line of markup. A component
should have a clear content contract and should not silently invent copy.

## Quality prompts

- Can a user scan the page hierarchy without relying on color?
- Are action labels specific and understandable out of context?
- Does the visual emphasis match the product priority?
- Are decorative elements removable without losing meaning?
