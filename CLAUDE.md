# crammr — Conventions

## TypeScript: never use `interface`

Always use `type` aliases. Do not use `interface` declarations anywhere in this
codebase.

- `type Foo = { ... };` instead of `interface Foo { ... }`
- For extension, use intersection: `type Foo = Bar & { ... };` instead of
  `interface Foo extends Bar { ... }`

**One exception:** `src/vite-env.d.ts` uses `interface ImportMetaEnv` and
`interface ImportMeta` because Vite's ambient typings rely on declaration
merging — `type` aliases cannot merge with the library-defined `ImportMeta`
interface. Do not touch those.

## JavaScript: prefer `const`, avoid `let`, never `var`

Favour immutable coding. Always declare bindings with `const` unless mutation
is genuinely required.

- Never use `var`.
- Use `let` only when an immutable alternative would be materially more
  complex. Prefer rewriting the surrounding logic over reaching for `let`.
- For conditional/derived values, use a ternary or extracted helper instead of
  a mutated `let` accumulator.
- For React effect cleanup flags, use `const state = { alive: true }` and
  mutate `state.alive` rather than `let alive = true`.
- For values built up across an `if`/`else`, prefer an IIFE returning the
  value, or extract a helper, instead of declaring with `let` and reassigning.

## Dependencies: pin exact versions

Always pin exact package versions in `package.json`. No `^`, no `~`, no
ranges.

- `"react": "18.3.1"` instead of `"react": "^18.3.1"`.
- Applies to both `dependencies` and `devDependencies`.
- When adding a package, use `bun add --exact <pkg>` (or edit
  `package.json` directly) so the saved spec is the exact version.
- When bumping, edit the version explicitly — don't rely on range
  resolution.
