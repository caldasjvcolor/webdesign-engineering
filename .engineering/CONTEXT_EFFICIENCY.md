# Context efficiency

This is the primary owner for context-efficiency rules across the harness.

## Principle and boundary

Use the smallest sufficient context that allows a technically sound decision.
Do not optimize for the smallest possible context: expand when evidence,
correctness, security, or risk requires it.

Nothing entering model context should be unbounded when its size is unknown or
potentially large. Efficiency never justifies ignoring necessary evidence,
skipping a material read, reducing validation below risk, or assuming behavior
without verification.

## Context escalation

Start at the lowest level that can answer a concrete question and escalate only
when that question remains unanswered.

| Level | Scope | Typical use |
|---|---|---|
| 1 — Target | task, error, symbol, route, component, function, known test | Start from the stated problem. |
| 2 — Local file | relevant file and adjacent span | Read the directly related implementation. |
| 3 — Direct relationships | callers, imports, schemas, dependencies, direct tests | Trace the immediate contract. |
| 4 — Feature/module | related flow or module | Assess feature-level interaction. |
| 5 — Repository-wide | cross-cutting repository evidence | Use only for repository-wide work, broad blast radius, or demonstrated insufficiency below. |

Do not start at Level 5 unless the task is repository-wide or lower levels have
proven insufficient. Read a known, small, directly relevant file in full when
that is cheaper and clearer than artificial searching.

## Retrieval and output

When location is unknown, prefer:

`search -> identify -> read target`

Use symbol, exact-text, filename, dependency, or targeted reference search
before broad reading. Filter potentially large output before loading it:
build/test logs, diffs, JSON, generated artifacts, lockfiles, directory trees,
minified files, browser logs, traces, and exports.

For large artifacts, write or retain the complete artifact outside model context,
search it for the relevant error or timestamp, then read a bounded excerpt.
Never repeat a huge dump merely because the first output was truncated.

For Git, start with `git diff --stat`, `git diff --name-only`, or a
file-scoped diff. Use a complete diff only when its size is known to be small or
a cross-cutting review requires it. For logs, prefer relevant error/warning
lines, a bounded tail, timestamps, and surrounding context.

## Reuse durable state

Before rediscovering prior work, consult relevant durable state: `PROJECT.md`,
`TASK.md`, `CAMPAIGN.md`, `DECISIONS.md`, incident index, evidence packet,
manifest, and capability matrix.

Do not reread unchanged content without a concrete reason: a source changed,
new evidence appeared, a different span is needed, the question changed, or a
prior conclusion was invalidated. A reread for comfort is not evidence.

Each durable rule has one primary owner. Project facts belong in `PROJECT.md`,
architectural decisions in `DECISIONS.md`, specialized guidance in a Skill
reference, history in an incident, verifiable behavior in a test/eval, and this
cross-cutting policy here. Use short references elsewhere.

## Validation and scheduling

Start with the smallest reliable validation that answers the question:

`affected assertion/check -> affected test -> affected module -> relevant typecheck/lint -> relevant build -> integration flow -> browser flow -> full quality gate`

Broaden for shared-code impact, architecture changes, security implications,
release risk, uncertainty, or cross-cutting behavior. Do not rerun a successful
check unless relevant code/configuration/dependencies changed, new evidence
contradicts it, another check invalidates its guarantee, or a final quality gate
requires confirmation.

Batch operations only when they are read-only, independent, known in advance,
non-conflicting, and all necessary. Keep dependent, adaptive, write, risky, or
order-sensitive operations sequential. Do not batch speculative reads merely to
reduce round trips.

For builds, tests, installs, and servers, use an appropriate wait and inspect
output when it is expected. Avoid rapid repeated polling; stop observing once
the process completes.

## Milestones and stop conditions

At a campaign milestone, persist the task/campaign state, decisions, blockers,
next step, and any material incident so a future session can resume without a
large transcript. Start a fresh session only after that state is durable and
the current unit of work is closed.

Stop gathering context when the next action is already sufficiently
evidence-backed. In debugging, stop external research once a trustworthy,
version-compatible explanation supports a testable hypothesis; see
`debugging-remediation` for the conditional research policy.

Do not create subagents by default to save tokens. Use them only for genuinely
independent work, necessary expertise, useful context isolation, or a clear
benefit greater than the coordination overhead.

Track indicators such as broad reads avoided, rereads avoided, large output
bounded, targeted validation used, repository-wide escalation required,
external research avoided, and polling avoided. These are indicators, not
token-savings claims.
