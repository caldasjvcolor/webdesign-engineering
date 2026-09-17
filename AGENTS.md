# Webdesign Engineering

This repository combines the complete Engineering Agent Harness v0.2 with a
web-development extension. For non-trivial work, read `CORE.md`, then
`.engineering/PROFILE.md` and `.engineering/TASK.md`; for multi-phase work also
read `.engineering/CAMPAIGN.md`. Load only the relevant workflow, Skill, and
reference.

Permanent rules:

- Preserve the existing architecture and prefer the smallest useful change.
- Do not add dependencies without a concrete requirement.
- Never invent project, client, SEO, review or business facts.
- Use the appropriate checks before declaring work complete.
- Use specialised Skills for specialised procedures.
- Preserve secrets and never place secrets in browser-exposed code.
- When a material defect or regression is discovered, use
  `debugging-remediation`: reproduce when practical, establish an
  evidence-backed root cause, make the smallest justified fix, verify it,
  add appropriate regression coverage, and promote reusable lessons to their
  single harness owner.

## Context efficiency

Use the smallest sufficient context and escalate only when evidence requires it.
Search before broad reads, bound potentially large tool output, avoid rereading
unchanged content, validate narrow-to-broad according to risk, batch independent
read-only work when safe, avoid unnecessary polling or repeated successful
checks, and persist resumable state in the repository. See
`.engineering/CONTEXT_EFFICIENCY.md` for the policy.

## Optional local Graft

Use the local Graft graph when repository orientation or impact tracing benefits
from a structural map:

- `graft build .` regenerates the local structural graph;
- `graft check .` verifies that the graph is in sync;
- `graft map .` provides a compact repository map;
- `graft ask "<question>" .` can answer targeted repository questions.

Treat Graft output as retrieval evidence, not completeness proof; confirm
conclusions in the source, documentation, and tests. Keep `graft/` local and
uncommitted. Do not run `graft build --deep` without an explicit need and
authorised provider/API configuration.
