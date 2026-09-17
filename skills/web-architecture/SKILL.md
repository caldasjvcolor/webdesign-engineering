---
name: web-architecture
description: "Choose or review the minimum architecture for Next.js App Router, React, and TypeScript web projects. Use for new project setup, route and layout boundaries, Server versus Client Components, dependency decisions, or architecture changes; do not use for visual styling, SEO-only work, forms-only work, or final QA."
metadata:
  short-description: "Choose minimal Next.js architecture"
---

# Web architecture

## When to use

Use for new web-project setup, route and layout boundaries, Server versus
Client Component decisions, dependency choices, or architecture changes.

## When not to use

Do not use for visual styling, SEO-only work, forms-only work, or final QA when
the architecture is already established and unaffected.

## Inputs

The project profile, current task, repository map, package manifest, route tree,
runtime constraints, existing validation commands, and the requested outcome.

## Purpose

Make the smallest architecture that satisfies the actual web project. Preserve
an existing repository's working structure unless a documented requirement
justifies a change.

## Process

1. Read the project profile and task. Inspect `package.json`, the app/router
   structure, `tsconfig`, existing styling, runtime boundaries, and validation
   commands before proposing a new shape.
2. Default new App Router projects to Next.js, React, TypeScript strict mode,
   and the existing or requested styling system.
3. Prefer Server Components. Introduce a Client Component only for a concrete
   browser API, local interactive state, event handler, or client-only library.
4. Evaluate every dependency against a real requirement that the current stack
   cannot solve simply. Record the reason, cost, and removal path.
5. Keep domain, route, data, and UI boundaries legible. Report the decision,
   alternatives rejected, affected contracts, and validation needed.

## Boundaries

Do not introduce Express, NestJS, a separate backend, Redux, Zustand, a
database, authentication, microservices, or queues by default. These may be
valid project decisions, but require explicit requirements and a separate
scope. Do not copy framework documentation into this Skill.

For Next.js runtime conventions, App Router, Server Components, Client
Component boundaries, Server Actions, Route Handlers, layouts, metadata,
caching, `next/image`, and related framework behavior, delegate to the
installed `nextjs` Skill rather than reproducing its guidance here.

For performance-sensitive React or Next.js implementation, use the available
`vercel-react-best-practices` Skill rather than reproducing its rules here.

## Progressive disclosure

Read [architecture-defaults.md](references/architecture-defaults.md) when
starting a new project or when a Server/Client or dependency boundary is
unclear. It contains decision prompts, not a framework manual.

## Done criteria

- Existing structure and source of truth were inspected.
- The proposed architecture is minimal and its boundaries are explicit.
- New dependencies have a concrete reason or were rejected.
- Server/Client decisions and validation commands are recorded.

## Evidence

Record the inspected entry points, architecture decision, dependency analysis,
affected contracts, and focused validation result.

## Stop / escalation conditions

Stop when the existing architecture or authority is unclear, a dependency would
cross a material boundary, or the change requires authentication, persistence,
external writes, or deployment decisions outside the task.
