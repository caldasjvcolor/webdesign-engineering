# Architecture defaults

Use this reference only when a new project or an unclear boundary needs a
decision. It is not a substitute for current Next.js documentation.

## Decision order

1. Identify the product requirement and the existing repository constraints.
2. Prefer the smallest route, component, data, and styling structure that
   satisfies it.
3. Keep rendering on the server unless the browser must own the interaction.
4. Add a dependency only when the requirement cannot be met simply with the
   existing stack.
5. Record the decision, rejected alternatives, and the validation command.

## Boundary prompts

| Question | Default | Exception to document |
|---|---|---|
| Where should a static page render? | Server Component | Browser-only interaction or API |
| Where should form validation happen? | Server boundary | Client checks are additive only |
| Where should shared content live? | Existing typed/content source | A new source only with ownership and lifecycle |
| Where should a visual pattern live? | Small local component | Shared component after genuine repetition |
| Should a package be added? | No | Concrete requirement, maintenance reason, and rollback |

## New versus existing projects

For a new project, use the requested Next.js App Router, React, strict
TypeScript, and styling defaults. For an existing project, map first and keep
its architecture unless the task explicitly changes it. Do not use this table
to justify adding an API backend, state library, database, authentication, or
queue.
