# Schema.org patterns

Use only the pattern that matches the visible page and the project facts.

| Page/entity | Candidate type | Minimum honest basis |
|---|---|---|
| Site identity | `WebSite` | public site name and URL |
| Individual professional | `Person` | name and publicly supported role |
| Business entity | `Organization` | real organisation identity |
| Local service provider | `ProfessionalService` or `LocalBusiness` | real service identity and supported locality details |
| Offered service | `Service` | visible service description and provider relationship |
| Hierarchical navigation | `BreadcrumbList` | visible breadcrumb path |
| Questions and answers | `FAQPage` | genuine visible FAQ content and eligibility review |

## Graph rules

Use `@graph` when several related entities are genuinely present. Give stable
`@id` values only when they describe real page/entity relationships. Keep
central generation typed and testable. Do not add `Review`, `AggregateRating`,
`award`, `telephone`, `address`, `openingHours`, or `priceRange` without a
source-backed visible basis and explicit review.
