# Responsive reference

Use this reference for multi-viewport layout and interaction decisions.

1. Start with the narrowest useful layout and content order.
2. Let content determine breakpoints; do not target device names alone.
3. Keep tap targets, focus rings, readable line length, and overflow behavior
   usable at every width.
4. Test at least narrow mobile, a medium/tablet width, and wide desktop. Add a
   breakpoint only when the current layout fails a real content or interaction
   requirement.
5. When interaction changes between widths, preserve the same semantic order
   and accessible name. Do not make important content desktop-only by accident.
6. Check zoom and reduced-motion behavior where the project supports them.
