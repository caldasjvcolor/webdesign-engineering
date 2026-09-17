# Research policy

External research is not the default debugging step. First use relevant local
instructions, project facts, decisions, incident records, tests/evals, code,
and Skill references.

Research is justified when a behaviour is clearly framework- or
library-specific, the error or API may be version-dependent, known
documentation conflicts with observation, an upstream regression or workaround
is plausible, the issue is security- or provider-specific, two reasonable
local hypotheses failed, or the failure is unusual enough to suspect upstream.

Start with the exact error message, framework or package, and installed version.
Confirm the installed version before applying external advice. Prefer sources in
this order:

1. Current official documentation.
2. Official source repository.
3. Official release notes or changelog.
4. Relevant official issue.
5. Maintainer discussion.
6. Provider or vendor documentation.
7. Technical community sources.
8. Reddit, Stack Overflow, or blogs.

Community sources may generate a hypothesis but do not override compatible
upstream evidence. Stop when a trustworthy, version-compatible explanation
supports a testable solution; do not collect links after the decision is clear.
