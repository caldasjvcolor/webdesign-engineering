# Change and version-control safety

This protocol applies to any repository mutation. It does not require Git, but
when Git or another VCS exists its status and diff are primary evidence.

Before mutation, inspect the dirty/working state and distinguish pre-existing
changes from the task-owned delta. Preserve unrelated work and avoid broad
rewrites that make ownership ambiguous. Never use destructive reset, clean,
revert, discard or overwrite against unrelated changes to obtain a clean baseline.

Rollback only the owned delta. If owned and pre-existing edits overlap so they
cannot be separated safely, stop and request direction. Checkpoints, backups and
readback should be proportional to risk.

Commit, push, merge, tag, publish and deploy are separate material actions. They
require explicit authorization even when implementation and local validation are
already authorized.

Treat repository writes, command execution, dependency installation, network
access, external writes, secret access, Git mutation and release/deploy as
separate capabilities. Use `docs/CAPABILITY_CONTRACT.md` for the decision and
enforcement vocabulary; a policy document is not host sandboxing.
