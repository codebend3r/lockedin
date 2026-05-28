# Vitest setup — implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add Vitest to the `lockedin` (crammr) repo and seed it with 3 unit tests covering the pure helpers in `src/lib/`, then compose `lint` + `typecheck` + `test` into a single `check` gate via `npm-run-all`.

**Architecture:** Vitest 2.x re-uses the existing `vite.config.ts` (the `@/*` alias and React plugin) — its `test` block is added alongside, so there is no second config file. Tests are co-located with source as `*.test.ts`. The `npm-run-all` package (already installed) provides `run-s` for sequential script composition.

**Tech Stack:** Vitest 2.1.x, npm-run-all 4.x, TypeScript 5.x, Vite 5.x (all already installed except Vitest).

**Spec reference:** `docs/superpowers/specs/2026-05-27-vitest-setup-design.md`

---

## File Structure

| File | Action | Responsibility |
|---|---|---|
| `package.json` | Modify | Add `vitest` devDep; add `test` / `test:watch` / `check` scripts |
| `vite.config.ts` | Modify | Add `/// <reference types="vitest" />` and a `test` block |
| `src/lib/sampling.test.ts` | Create | Tests for `sampleN` |
| `src/lib/role.test.ts` | Create | Tests for `getRole` |
| `src/lib/moduleCategories.test.ts` | Create | Tests for `categoryForModule` |

No production source is changed — tests cover existing pure helpers.

---

## Task 1: Install Vitest and wire scripts + config

**Files:**
- Modify: `package.json` (devDependencies, scripts)
- Modify: `vite.config.ts`

- [ ] **Step 1.1: Install Vitest 2.x**

`vitest@^2.1.9` is required (not `@latest`) because `vitest@4` requires `vite@^6` and this repo is pinned to `vite@^5.4.2`.

Run:
```bash
npm install --save-dev vitest@^2.1.9
```

Expected: an `added N packages` line; `package.json` gains `"vitest": "^2.1.9"` under `devDependencies`.

- [ ] **Step 1.2: Add test + check scripts to `package.json`**

Edit the `"scripts"` block. The full block after edit:

```jsonc
"scripts": {
  "dev": "vite",
  "build": "vite build",
  "preview": "vite preview",
  "lint": "eslint . --max-warnings=0",
  "typecheck": "tsc --noEmit -p tsconfig.app.json",
  "test": "vitest run",
  "test:watch": "vitest",
  "check": "run-s lint typecheck test",
  "prepare": "husky"
}
```

Only three keys are new: `test`, `test:watch`, `check`. All others are preserved verbatim.

- [ ] **Step 1.3: Add Vitest config to `vite.config.ts`**

Replace the entire contents of `vite.config.ts` with:

```ts
/// <reference types="vitest/config" />
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { fileURLToPath, URL } from "node:url";

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
  test: {
    include: ["src/**/*.test.ts"],
  },
});
```

The triple-slash reference at the top is mandatory — without it, TypeScript does not recognise the `test` key on `defineConfig`'s argument and `npm run typecheck` will fail. Use the `vitest/config` subpath (the documented type-augmentation entry point), not the bare `vitest` package.

- [ ] **Step 1.4: Verify `vitest` finds no test files yet**

Run:
```bash
npm test
```

Expected output contains:
```
No test files found, exiting with code 1
```

Exit code 1 here is fine — it confirms vitest is wired and discovering correctly. The next tasks will add test files. (Do NOT add any `passWithNoTests` flag.)

- [ ] **Step 1.5: Verify typecheck still passes**

Run:
```bash
npm run typecheck
```

Expected: exits 0 with no output. The `/// <reference types="vitest" />` directive must be respected — if this fails with "object literal may only specify known properties, and 'test' does not exist", the directive was added incorrectly.

- [ ] **Step 1.6: Verify lint still passes**

Run:
```bash
npm run lint
```

Expected: exits 0 with no output.

- [ ] **Step 1.7: Commit**

```bash
git add package.json package-lock.json vite.config.ts
git commit -m "$(cat <<'EOF'
LI: install `vitest` and add `test` + `check` scripts

- pin `vitest@^2.1.9` for `vite@^5` compat
- `test`, `test:watch`, `check` scripts
- `check` composes `lint` → `typecheck` → `test` via `run-s`
- `vite.config.ts` gains `test` block with `/// <reference types="vitest/config" />`
EOF
)"
```

Note: `package-lock.json` may be untracked in this repo (per `.gitignore` and recent history). If `git status` shows it as untracked, omit it from the `git add` line. If `git add package-lock.json` succeeds without complaint, include it.

---

## Task 2: Add `sampling.test.ts`

**Files:**
- Create: `src/lib/sampling.test.ts`

**Reference:** `src/lib/sampling.ts` exports `shuffle<T>(items)` and `sampleN<T>(items, n)`. `sampleN` returns `shuffle(items)` when `n >= items.length`, otherwise `shuffle(items).slice(0, n)`.

- [ ] **Step 2.1: Write the test file**

Create `src/lib/sampling.test.ts` with this exact content:

```ts
import { describe, expect, it } from "vitest";
import { sampleN } from "./sampling";

describe("sampleN", () => {
  it("returns n elements drawn from the input with no duplicates when n < items.length", () => {
    const input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] as const;
    const result = sampleN(input, 3);

    expect(result).toHaveLength(3);
    for (const value of result) {
      expect(input).toContain(value);
    }
    expect(new Set(result).size).toBe(result.length);
  });
});
```

This single `it` exercises three properties of `sampleN` (length, subset, uniqueness) — sufficient for the spec's "one test per pure helper" rule.

- [ ] **Step 2.2: Run the test**

Run:
```bash
npm test
```

Expected: 1 test file, 1 passed; exit code 0. The implementation already exists, so this passes immediately.

- [ ] **Step 2.3: Commit**

```bash
git add src/lib/sampling.test.ts
git commit -m "$(cat <<'EOF'
LI: add `sampleN` unit test

- asserts length, subset, and uniqueness on a 10-element input
EOF
)"
```

---

## Task 3: Add `role.test.ts`

**Files:**
- Create: `src/lib/role.test.ts`

**Reference:** `src/lib/role.ts` exports `getRole(user)`. Returns `"regular"` for `null`/`undefined`, returns the role string for `app_metadata.role === "admin"` or `"trial"`, otherwise falls back to `"regular"`.

- [ ] **Step 3.1: Write the test file**

Create `src/lib/role.test.ts` with this exact content:

```ts
import type { User } from "@supabase/supabase-js";
import { describe, expect, it } from "vitest";
import { getRole } from "./role";

const userWithRole = (role: string): User =>
  ({ app_metadata: { role } }) as unknown as User;

describe("getRole", () => {
  it("returns 'regular' when the user is null", () => {
    expect(getRole(null)).toBe("regular");
  });

  it("returns the role when app_metadata.role is admin", () => {
    expect(getRole(userWithRole("admin"))).toBe("admin");
  });

  it("returns 'regular' when app_metadata.role is unknown", () => {
    expect(getRole(userWithRole("hacker"))).toBe("regular");
  });
});
```

The `as unknown as User` cast is unavoidable here — the test only exercises the `app_metadata.role` field, and constructing a full Supabase `User` (id, email, aud, created_at, etc.) would be pure ceremony. ESLint does not forbid this cast.

- [ ] **Step 3.2: Run the tests**

Run:
```bash
npm test
```

Expected: 2 test files, 4 tests passed (1 from Task 2 + 3 here); exit code 0.

- [ ] **Step 3.3: Commit**

```bash
git add src/lib/role.test.ts
git commit -m "$(cat <<'EOF'
LI: add `getRole` unit test

- covers `null` user, `admin` passthrough, unknown-role fallback
EOF
)"
```

---

## Task 4: Add `moduleCategories.test.ts`

**Files:**
- Create: `src/lib/moduleCategories.test.ts`

**Reference:** `src/lib/moduleCategories.ts` exports `MODULE_CATEGORY_SLUG`, `DEFAULT_CATEGORY_SLUG = "other"`, and `categoryForModule(slug)` which returns the mapped category or `DEFAULT_CATEGORY_SLUG`.

- [ ] **Step 4.1: Write the test file**

Create `src/lib/moduleCategories.test.ts` with this exact content:

```ts
import { describe, expect, it } from "vitest";
import { categoryForModule } from "./moduleCategories";

describe("categoryForModule", () => {
  it("maps a known module slug to its category", () => {
    expect(categoryForModule("javascript")).toBe("programming-languages");
  });

  it("falls back to 'other' for an unknown slug", () => {
    expect(categoryForModule("not-a-real-slug")).toBe("other");
  });
});
```

- [ ] **Step 4.2: Run the tests**

Run:
```bash
npm test
```

Expected: 3 test files, 6 tests passed (1 + 3 + 2); exit code 0.

- [ ] **Step 4.3: Commit**

```bash
git add src/lib/moduleCategories.test.ts
git commit -m "$(cat <<'EOF'
LI: add `categoryForModule` unit test

- covers known-slug mapping and `other` fallback
EOF
)"
```

---

## Task 5: Verify the full `check` gate

**Files:** none (verification only).

- [ ] **Step 5.1: Run `npm run check`**

Run:
```bash
npm run check
```

Expected sequence:
1. `> lint` — `eslint . --max-warnings=0` exits 0
2. `> typecheck` — `tsc --noEmit -p tsconfig.app.json` exits 0
3. `> test` — `vitest run` reports 3 test files, 6 tests passed

Final exit code: 0. If any step fails, do NOT proceed — diagnose and fix the failing step before claiming the plan is complete.

- [ ] **Step 5.2: Confirm script order via `run-s`**

If `npm run check` exits non-zero on `lint` or `typecheck`, vitest must NOT have run (sequential execution). Verify by reading the captured output — no `RUN  v2.1.x` line should appear after a lint or typecheck failure.

- [ ] **Step 5.3: No commit**

Task 5 is verification only — there are no file changes to commit.

---

## Acceptance

- `npm test` reports 3 test files, 6 tests passed, exit 0.
- `npm run check` exits 0 with lint, typecheck, and test all green.
- `git log --oneline | head -5` shows 4 new commits (1 setup + 3 tests), each prefixed `LI:`.
- No new top-level files outside `package.json`, `vite.config.ts`, and the three `src/lib/*.test.ts` files.
- No new devDependencies beyond `vitest` (and the already-installed `npm-run-all`).
