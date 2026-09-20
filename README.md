# Engineering Agent Harness for Software & Web Development

The complete `engineering-agent-harness-v0.2` is the base layer of this
repository. The local web toolkit is an extension on top of that base for
building and reviewing modern web projects with Codex.

The toolkit is intentionally small and composable:

```text
engineering harness + upstream skills + local web skills + project profile + current task
```

## Base harness

The portable engineering layer is present in `CORE.md`,
`AGENT_ORCHESTRATION.md`, `CHANGE_SAFETY.md`, `TRUST_BOUNDARY.md`, `MODES.md`,
`workflows/`, `repo-harness/`, and the 18 base Skills. Its original manifest is
`manifest.json`; `toolkit-manifest.json` records the web extension and upstream
source map.

## Scope

The eight local Skills cover architecture, production UI, SEO/AEO discoverability,
truthful structured data, image assets, lead forms, debugging remediation, and
the final quality gate.
They are guidance and routing, not a replacement for host permissions, tests,
browser tooling, or human authority.

Project-specific facts belong under `projects/<project-name>/`. They must not be
promoted into global Skills.

## Upstream reuse

Use available upstream/vendor-maintained capabilities when they cover the task:

- `nextjs` from `openai/plugins` for Next.js App Router and runtime conventions;
- `vercel-react-best-practices` for React/Next.js performance;
- `security-best-practices` from `openai/skills` for JavaScript/TypeScript/React
  security guidance;
- `playwright` from `openai/skills` for real-browser QA;
- `web-design-guidelines` for UI and accessibility review;
- `computer-use` for Windows UI automation when available;
- `imagegen` for generated or edited raster assets when explicitly needed;
- `skill-creator`, `skill-installer`, and `openai-docs` for Skill lifecycle and
  current Codex guidance.

The curated catalogue listing returned HTTP 403, but direct repository/path
installation succeeded for the three previously missing Skills. The manifest
records the resolved commit SHAs, physical install paths, and update method.
No upstream Skill body was copied into this repository.

## Context efficiency

See [the transversal context policy](.engineering/CONTEXT_EFFICIENCY.md) for
progressive retrieval, bounded output, proportionate validation, and resumable
milestone state.

## Local validation

From the repository root:

```powershell
.\scripts\validate-skills.ps1
.\scripts\run-evals.ps1
.\scripts\update-toolkit.ps1 -CheckOnly
```

For a real web project, run `skills/web-quality-gate/scripts/verify-web-project.ps1`
from that project's root. Browser checks remain environment-dependent.

The Python helpers use `py -3` on Windows; use `python3` or `python` on hosts
where that is the configured interpreter.

## Project profiles

`projects/dj-joao-caldas/` is a factual example profile for a professional DJ
website. It contains no invented reviews, awards, client list, experience
claims, address, certification, or other unsupported business facts.

## Updating

Review upstream versions using the current official Codex/Skill mechanism,
inspect the diff, preserve local changes, validate each Skill, and only then
update the manifest. The local update checker is deliberately report-only.

## Local Graft map

This toolkit also has the optional local `@nanonets/graft` developer aid. The
currently functional global CLI is `0.16.0`; its structural graph has been
built at `graft/` for this repository and is ignored by Git because it is
regenerable. The graph is not part of the website runtime or deployment.

Useful commands from the repository root:

```powershell
graft build .
graft check .
graft map .
graft ask "<repository question>" .
```

The graph is an orientation and impact-tracing aid. It does not replace the
source files, project profile, tests, or the web quality gate. The deep/LLM
layer is intentionally not enabled in this repository.

## Working with a material defect

Use `$debugging-remediation` with the observed problem, the expected behaviour,
and the available reproduction. Reproduce first when practical; do not patch a
symptom. Consult upstream only when the Skill's triggers justify it, add the
smallest appropriate regression coverage, and do not claim the defect is fixed
without observed verification.
