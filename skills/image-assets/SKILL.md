---
name: image-assets
description: "Plan, integrate, or audit local image assets in Next.js, including next/image, dimensions, aspect ratio, responsive sizes, LCP, loading, file naming, and factual alt text. Use for image and asset work; do not invent image context or use SEO keywords as an alt-text shortcut."
metadata:
  short-description: "Audit and integrate web images"
---

# Image assets

## When to use

Use for local image integration, `next/image`, image performance, dimensions,
responsive sizes, LCP media, loading, file naming, or alt-text review.

## When not to use

Do not use to invent image context, download unauthorised media, or solve a
general visual-design problem without an asset decision.

## Inputs

The project asset directories, ownership/permission facts, affected components,
image dimensions, intended crops, loading requirements, and alt-text context.

## Purpose

Make project-owned or authorised images reliable, performant, accessible, and
easy to maintain in a Next.js site.

## Process

1. Establish asset ownership and permitted use from the project profile before
   copying or transforming media. Do not download external media merely to fill
   a placeholder.
2. Keep source assets in the project's local asset boundary. Use stable,
   lowercase, descriptive kebab-case names and avoid duplicate variants.
3. Use `next/image` when it provides a real benefit. Supply meaningful
   dimensions or aspect-ratio constraints, choose responsive `sizes`, and
   avoid making every image eager.
4. Identify likely LCP media and load it intentionally; lazy-load below-the-
   fold media when appropriate. Preserve a stable layout while images load.
5. Write alt text that describes the image or use an empty alt for genuinely
   decorative media. Never invent people, places, events, or business claims
   and never stuff keywords into alt text.
6. Run the deterministic audit for the relevant asset directory.

## Validation

```powershell
py -3 .\skills\image-assets\scripts\audit-images.py --root public
```

The audit checks supported file names and readable dimensions where the format
allows it; visual suitability and licensing still require human review.

## Progressive disclosure

Read [image-audit.md](references/image-audit.md) when deciding naming,
dimensions, loading, or format rules for a project.

## Done criteria

- Ownership and permitted use are known.
- Dimensions, aspect ratios, loading, and responsive behavior are intentional.
- Alt text is accurate and non-speculative.
- The image audit passes or its findings are explicitly accepted.

## Evidence

Record asset ownership, changed files, parseable dimensions, audit output, LCP
and loading decisions, and the human limitation on visual/licensing review.

## Stop / escalation conditions

Stop when asset ownership or reuse permission is unknown, a requested alt text
would require invented facts, or a performance claim lacks runtime evidence.
