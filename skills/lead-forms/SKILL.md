---
name: lead-forms
description: "Design or implement accessible contact, quote, or lead forms in React or Next.js. Use for form state, server-side validation, Server Actions, Zod or an existing validator, accessible errors, and destination adapters; do not add a database or external delivery integration without a separate requirement."
metadata:
  short-description: "Build secure accessible lead forms"
---

# Lead forms

## When to use

Use for contact, quote, enquiry, or lead forms and their server validation,
accessible states, and delivery adapter boundary.

## When not to use

Do not use to add a database, CRM, email provider, API, analytics event, or
secret-backed integration without a separate authorised requirement.

## Inputs

The project profile, field requirements, privacy/retention boundary, existing
validation stack, authorised destination, and affected form components.

## Purpose

Collect a useful lead or enquiry with clear feedback, server-side validation,
and a destination boundary that can evolve without rewriting the UI.

## Process

1. Read the project profile and identify the minimum fields, consent or privacy
   needs, retention boundary, and currently authorised destination.
2. Reuse the existing form and validation conventions. Prefer a Server Action
   plus Zod or the project's established schema mechanism when the stack
   supports it.
3. Validate and normalise on the server. Client validation may improve the
   interaction but is never the security boundary.
4. Model idle, loading, success, validation-error, and server-error states.
   Associate errors with fields, expose a useful summary, and preserve
   keyboard and screen-reader semantics.
5. Keep delivery behind an adapter interface so a future email, CRM, database,
   or API destination can be introduced as a separately authorised change.
6. Protect against spam, over-posting, unsafe logging, secret exposure, and
   untrusted redirect or HTML injection. Do not log raw personal data by
   default.

## Boundaries

Do not introduce a database, email provider, CRM, API call, analytics event, or
secret merely because a form exists. External writes and personal-data
handling require their own authority, contract, readback, and validation.

## Progressive disclosure

Read [form-contract.md](references/form-contract.md) when defining fields,
states, adapters, privacy boundaries, or error semantics.

## Done criteria

- The server is the validation boundary.
- All user-visible states and accessible errors are covered.
- Destination integration is explicit and isolated.
- Secrets and raw personal data are not exposed or logged unnecessarily.

## Evidence

Record the field schema, server-side validation result, accessible state tests,
adapter contract, error handling, and any external-integration limitations.

## Stop / escalation conditions

Stop when personal-data handling, destination authority, retention, credentials,
or external write semantics are undefined or require a new system integration.
