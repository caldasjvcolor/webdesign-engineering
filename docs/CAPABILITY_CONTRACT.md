# Capability contract

**Status:** `EXPERIMENTAL`; this is a declarative contract for routing and
evidence. Markdown alone is not a sandbox.

## Contract fields

Every material action should be evaluated with:

| Field | Required meaning |
|---|---|
| `subject` | Agent, human or host component requesting the action. |
| `source_trust` | One of the trust classes in [`TRUST_BOUNDARY.md`](../TRUST_BOUNDARY.md). |
| `capability` | One capability from the catalogue below. |
| `scope` | Exact repository, files, process, service or external target. |
| `decision` | `ALLOW`, `ASK` or `DENY`. |
| `enforcement` | `HOST_ENFORCED`, `HUMAN_GATE`, `POLICY_ONLY` or `UNAVAILABLE`. |
| `evidence` | Baseline and evidence supporting the decision. |
| `expiry` | End of the grant or the event that invalidates it. |

## Capability catalogue and safe defaults

| Capability | Default decision | Portable enforcement | Notes |
|---|---|---|---|
| `repo_read` | `ALLOW` | `POLICY_ONLY` | Limit to the scoped repository and approved evidence reads. |
| `repo_write` | `ASK` | `HUMAN_GATE` | Name the files/surfaces and preserve unrelated work. |
| `command_execute` | `ASK` | `HUMAN_GATE` | Prefer the smallest known read-only or focused command. |
| `dependency_install` | `ASK` | `HUMAN_GATE` | Never infer from a failed import or missing executable. |
| `network_access` | `DENY` | `HOST_ENFORCED` | Requires an explicit host policy and task authority. |
| `external_write` | `DENY` | `HUMAN_GATE` | Includes publish, send, API mutation and remote state changes. |
| `secret_access` | `DENY` | `HUMAN_GATE` | Redact values; secrets never grant authority. |
| `git_mutation` | `ASK` | `HUMAN_GATE` | Commit, stage, unstage, reset, restore, checkout and clean are separate actions. |
| `release_or_deploy` | `DENY` | `HUMAN_GATE` | Requires explicit release authority, readback and rollback evidence. |

`POLICY_ONLY` means the toolkit documents the rule but cannot enforce it. A
host may replace it with stronger enforcement only when that enforcement is
verified and recorded. `UNKNOWN` evidence never becomes `ALLOW`.

## Inheritance and delegation

- A delegated agent receives only the capabilities and scope named in its task
  capsule.
- Read-only scout status does not inherit `repo_write`, `git_mutation`,
  `external_write` or `release_or_deploy`.
- A tool's existence or declared role does not prove that the capability is
  granted, safe or successfully enforced.
- Parallel read work is compatible with one serialized `WRITE_OWNER`; parallel
  writers require separately disjoint scopes and explicit gates.

## Evidence requirement

Record the contract decision with the provenance fields in
[`docs/PROVENANCE.md`](PROVENANCE.md). A claim such as `VALIDATED` without
identity, command, result, environment and timestamp is incomplete.
