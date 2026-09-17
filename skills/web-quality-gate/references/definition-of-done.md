# Web definition of done

Select only the checks relevant to the changed surface, but do not mark a
material web change done from compilation alone.

| Surface | Evidence to seek |
|---|---|
| Code contract | typecheck, lint, focused tests |
| Build | production build or documented reason it cannot run |
| Browser | affected journey, console, links, navigation, mobile and desktop |
| Forms | validation, loading, success, server error, accessible messaging |
| SEO | title, description, canonical, robots, sitemap, internal links |
| Schema | parsed JSON-LD and visible/source-backed claims |
| Images | dimensions, loading, layout stability, alt text, asset ownership |
| Accessibility | semantic order, keyboard access, focus, labels, contrast |
| Performance | obvious waterfalls, oversized assets, avoidable client JS, LCP path |

Record each check as `PASS`, `FAIL`, `PARTIAL`, `NOT_RUN`, or `UNKNOWN`, with
the exact command or observation and its limitations. Browser and deployment
claims remain environment-specific.

## Decision rules

These four labels are this project's policy, not GitHub check conclusions.
[GitHub status checks](https://docs.github.com/en/pull-requests/reference/status-checks)
use different statuses; do not equate a skipped check with positive evidence here.

Determine applicable material requirements from the task before classifying.
Apply the first matching rule, in this order:

1. `NO_GO`: any applicable material/mandatory requirement has failed (for example,
   failed production build, broken main journey, false delivery success, known
   material vulnerability, or blocked indexing when indexing is required).
2. `UNKNOWN`: no known material failure, but evidence for a material requirement
   is missing or inconclusive, including `NOT_RUN`, `UNKNOWN`, or insufficient
   `PARTIAL` results, an untested relevant browser flow, or unverified integration.
3. `GO_WITH_FIXES`: material evidence is sufficient and all applicable material
   checks pass; only documented non-material, non-blocking defects remain.
   Never use this state for a fix required before publication.
4. `GO`: all applicable material checks positively pass, evidence is sufficient,
   and no known outstanding defects remain.

Never infer a pass from absence of failure or silently convert `UNKNOWN` to `GO`.
