---
name: structured-data
description: "Create, review, or validate Schema.org and JSON-LD for real visible website content. Use when adding WebSite, Person, Organization, ProfessionalService, LocalBusiness, Service, BreadcrumbList, or contextually justified FAQPage data; do not use for general SEO copy or invented reviews and ratings."
metadata:
  short-description: "Create truthful Schema.org JSON-LD"
---

# Structured data

## When to use

Use when creating, reviewing, centralising, or validating Schema.org or JSON-LD
for a visible web page.

## When not to use

Do not use for general SEO copy, unsupported rich-result claims, or information
that has no visible or authoritative source.

## Inputs

The rendered page, project profile, visible entities, existing schema generator,
canonical URL, and the JSON-LD or HTML file to validate.

## Purpose

Represent real, visible, source-backed entities and relationships in
Schema.org JSON-LD. Structured data improves machine clarity; it does not make
unsupported claims true or guarantee rich results.

## Process

1. Inspect the visible page, project profile, and existing schema generators.
   Identify the entity and properties the page can honestly support.
2. Prefer a central, typed generator when multiple routes share an entity.
   Keep page-specific values close to the page source of truth.
3. Use only appropriate types such as `WebSite`, `Person`, `Organization`,
   `ProfessionalService`, `LocalBusiness`, `Service`, and `BreadcrumbList`.
   Use `FAQPage` only when the page contains genuine, eligible FAQ content.
4. Ensure every material JSON-LD claim has a visible or authoritative source.
   Never invent reviews, aggregate ratings, customers, awards, telephone,
   address, opening hours, price range, experience, or certifications.
5. Validate every changed JSON-LD document with the bundled deterministic
   checker. The checker catches malformed JSON, missing context/type, obvious
   placeholders, and rich-review fields that need an explicit review.

## Validation

```powershell
py -3 .\skills\structured-data\scripts\validate-jsonld.py --file path\to\page.html
```

Use `--allow-rich-reviews` only when the project profile and visible page
provide an explicit, reviewed basis for those fields.

## Progressive disclosure

Read [schema-patterns.md](references/schema-patterns.md) when choosing types,
centralising generation, or reviewing a graph with multiple entities.

## Done criteria

- JSON-LD parses and has Schema.org context and type.
- Types and properties match visible, source-backed content.
- No unsupported rich-result claim is introduced.
- The validation command and any limitations are recorded.

## Evidence

Record the visible/source-backed property map, selected types, generated output,
validator command, result, and any fields requiring human review.

## Stop / escalation conditions

Stop when a requested property is unsupported, conflicts with visible content,
uses fabricated reviews or ratings, or the JSON-LD validator fails.
