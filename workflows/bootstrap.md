# BOOTSTRAP workflow

1. Copy or install the neutral `repo-harness/` into `.engineering/`.
2. Fill `PROFILE.md` from repository evidence; preserve unknowns explicitly.
3. Record version-control, validation, external-system and rollback boundaries.
4. Create `TASK.md` for the first bounded objective.
5. Run orientation before implementation and select the smallest suitable mode.
6. Validate the harness and profile before relying on it for a material change.
7. Optionally create root routing from `AGENTS.merge-snippet.md` only when no
   root `AGENTS.md` exists; otherwise merge the routing block manually.

Bootstrap writes `.engineering/` repository scaffolding, never application or
runtime source. An existing `.engineering/` directory is not overwritten without
explicit, separately reviewed authorization; an existing root `AGENTS.md` is
never overwritten by the installer.
