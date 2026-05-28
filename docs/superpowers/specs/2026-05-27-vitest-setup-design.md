# Vitest setup — design

## Goal

Add a unit-test runner to the `lockedin` (crammr) repo and seed it with 3
unit tests covering the pure helpers in `src/lib/`. Compose the existing
`lint` + `typecheck` + new `test` script into a single `check` gate via
`npm-run-all`.

## Framework

**Vitest.** Chosen over Jest because:

- Vite-native — reuses the existing `vite.config.ts`, the `@/*` path alias,
  and `tsconfig.app.json` with no extra config.
- ESM-clean — `package.json` is `"type": "module"`, which Jest still
  handles awkwardly (ts-jest + babel + ESM shim).
- Jest-compatible API (`describe` / `it` / `expect`) — minimal learning
  cost.

## Dependencies

Add as `devDependency`:

- `vitest@^2.x` (peer-matches the installed `vite@^5`)

Already installed in this brainstorm session:

- `npm-run-all@^4.1.5`

**Not** added (YAGNI for 3 pure-function tests):

- `@testing-library/react`
- `jsdom` / `happy-dom`
- `@vitest/coverage-*`

## Scripts

In `package.json`:

```jsonc
"test":       "vitest run",                // CI-style single run
"test:watch": "vitest",                    // local TDD
"check":      "run-s lint typecheck test"  // composed gate
```

`run-s` (sequential) over `run-p` (parallel) so failures are read
top-to-bottom and lint/typecheck output isn't interleaved with test
output. Existing `lint`, `typecheck`, `dev`, `build`, `preview`, and
`prepare` scripts are untouched.

## Vitest config

Add a minimal `test` block inside the existing `vite.config.ts` (no
separate `vitest.config.ts` — avoids duplicating the React plugin and
the `@/*` alias):

```ts
test: {
  include: ["src/**/*.test.ts"],
  // node env is default; jsdom not needed for pure helpers
}
```

The Vite config will need the triple-slash directive `/// <reference
types="vitest/config" />` at the top so TypeScript recognises the `test`
key. The `vitest/config` subpath is the documented type-augmentation
entry point for `defineConfig` (the bare `vitest` package re-exports
enough types to typecheck, but it's not the idiomatic form).

## The 3 tests

Co-located next to their source files (standard Vitest convention,
keeps tests discoverable from the unit they cover):

### 1. `src/lib/sampling.test.ts`

Covers `sampleN(items, n)`:

- Returns exactly `n` elements when `n < items.length`.
- All returned elements are drawn from the input (subset assertion).
- No duplicates in the output.

Order is not asserted — `shuffle` uses `Math.random()` and is
non-deterministic.

### 2. `src/lib/role.test.ts`

Covers `getRole(user)`:

- `getRole(null)` → `"regular"` (the unauthenticated fallback).
- `getRole({ app_metadata: { role: "admin" } })` → `"admin"`.
- `getRole({ app_metadata: { role: "hacker" } })` → `"regular"`
  (unknown role falls through to default).

User objects are cast through `as unknown as User` — the test only
exercises the `app_metadata.role` field, so a full Supabase `User` stub
is unnecessary.

### 3. `src/lib/moduleCategories.test.ts`

Covers `categoryForModule(slug)`:

- Known slug: `categoryForModule("javascript")` →
  `"programming-languages"`.
- Unknown slug: `categoryForModule("not-a-real-slug")` → `"other"`
  (`DEFAULT_CATEGORY_SLUG`).

## ESLint

Existing `eslint . --max-warnings=0` will pick up `*.test.ts` files
without change. Vitest globals (`describe`, `it`, `expect`) are
**imported explicitly** from `"vitest"` — no `globals` config needed
in vitest, no env config needed in eslint.

## Out of scope

- Coverage reporting.
- React Testing Library / component or hook tests.
- A husky pre-commit hook for `test` (husky is installed but its config
  is intentionally not touched here).
- CI workflow changes.

## Acceptance

- `npm test` exits 0 with 3 passing tests.
- `npm run check` exits 0 (lint → typecheck → test, all green).
- `npm run typecheck` still exits 0 (the `test` key in `vite.config.ts`
  must type-check via the `vitest` reference directive).
