---
name: production-ui
description: "Design or improve responsive production UI in React or Next.js, including Tailwind styling, semantic HTML, typography, spacing, accessible interactions, and component composition. Use for page layout and visual-system work; do not use for architecture-only, SEO-only, structured-data-only, or final quality-gate tasks."
metadata:
  short-description: "Build accessible responsive UI"
---

# Production UI

## When to use

Use for page layout, Tailwind styling, responsive behavior, component
composition, semantic HTML, and accessible interaction design.

## When not to use

Do not use for architecture-only, SEO-only, structured-data-only, or final
quality-gate tasks.

## Inputs

The project profile, affected routes/components, existing tokens and styles,
content hierarchy, approved visual references, and viewport requirements.

## Purpose

Turn the project's content and design intent into a coherent, responsive,
accessible interface without introducing a generic AI-template aesthetic.

## Process

1. Inspect the existing design tokens, fonts, components, routes, content
   hierarchy, and responsive conventions. Reuse them before adding new ones.
2. Establish the information hierarchy and semantic HTML before styling.
   Use the smallest reusable components that reflect real repeated structure.
3. Work mobile-first, then verify meaningful breakpoints rather than designing
   separate disconnected desktop and mobile pages.
4. Make keyboard focus, labels, error states, reduced motion, contrast, and
   reading order intentional. Use native controls where they are sufficient.
5. Prefer restrained visual decisions. Do not add gradients, neon effects,
   pills, badges, excessive cards, or animation unless the project brief and
   existing system call for them.
6. Review the changed UI with the available `web-design-guidelines` Skill when
   a UI or accessibility audit is requested. Use browser QA only when runtime
   evidence is needed.

## Progressive disclosure

- Read [design-system.md](references/design-system.md) when tokens or visual
  consistency need definition.
- Read [responsive.md](references/responsive.md) when a layout spans multiple
  viewports or has interaction changes at breakpoints.

## Done criteria

- Semantic structure matches the content hierarchy.
- Layout behaves at narrow, medium, and wide widths.
- Interactions work by keyboard and expose useful accessible names and states.
- Existing design conventions are preserved or the new decision is recorded.
- No decorative effect was added without a concrete purpose.

## Evidence

Record changed routes/components, responsive states inspected, accessibility
checks, design-system decisions, and any browser or guideline review.

## Stop / escalation conditions

Stop when visual authority, asset permission, content hierarchy, or an
accessibility requirement is ambiguous; escalate new design-system or brand
decisions that cannot be inferred from the project profile.
