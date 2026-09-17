# STANDARD change workflow

1. Orient using `repository-orientation`.
2. Create or update `.engineering/TASK.md` with `task-planning`.
3. Map producers, consumers, persistence, integrations and tests.
4. Assign exactly one `WRITE_OWNER` for each mutation slice.
5. Implement with `feature-implementation` or diagnose with `debugging`.
6. Validate with `testing`; inspect diff and stale findings.
7. Apply `code-review` when the change is transversal or risk justifies it.
8. Record the gate, evidence, rollback and next action.

No step authorizes external or irreversible action by itself.
