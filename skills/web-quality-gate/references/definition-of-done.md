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
