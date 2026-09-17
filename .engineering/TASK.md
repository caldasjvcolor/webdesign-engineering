# Current task

- Objective: integrate a transversal, evidence-preserving context-efficiency policy into the harness
- Mode: STANDARD / DEEP
- Scope in: policy owner, minimal root/profile/README/Skill routing, capability matrix, selected policy evals, and focused runner support
- Scope out: DJ website code, new Skills, redesign of debugging remediation or quality-gate semantics, upstream refreshes, browser QA, deployment, commits, and pushes
- Write owner: current agent, serialised across the toolkit
- Baseline: committed toolkit plus uncommitted validated remediation and quality-gate corrections
- Protected contracts: existing quality-gate decision semantics, debugging-remediation workflow, immutable upstream SHAs, project facts under `projects/`, and no fictitious incidents
- Evidence required: policy ownership/readability, selected context evals, local Skill validation, structural harness validation, manifest parse/SHA readback, and focused diff review
- Validation plan: run `validate-skills.ps1`, execute only the new context eval IDs, run `Validate-Toolkit.ps1`, parse manifests, compare upstream SHAs, and inspect diffs
- Rollback plan: remove only this task's policy, routing, matrix, and eval changes after readback; preserve prior uncommitted work
- Stop / escalation conditions: any validation failure, accidental upstream SHA change, policy that encourages under-analysis, duplicate detailed guidance, or a request to begin website work
- Review gate and outcome: GO; 26-Skill validation, 12 selected context evals,
  structural harness validation, manifest parse/SHA comparison, and diff check
  passed
- Status: COMPLETE
- Next action: apply the policy to the next independently scoped harness or
  website task; persist the next milestone before extending session context
