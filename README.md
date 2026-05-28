# crammr

Brush up on a skill or topic right before a test, so the material is fresh
in your mind. Pick a module, pick a mode, work through a quick session.

## Screenshots

![Home — module dashboard](docs/screenshots/home.png)

The home page lists available modules with your last score on each.

![Module detail — pick a mode and size](docs/screenshots/module.png)

Each module page lets you choose a mode (multiple choice, flashcards, recap)
and a session size before you start.

![Quiz in progress](docs/screenshots/quiz.png)

Quiz sessions track progress and let you save and exit at any time.

## Modules

18 modules across four categories:

- **Driving licensing** — G1 (Ontario)
- **Programming languages** — JavaScript, TypeScript, Python, C, C++, Java,
  C#, SQL, Go, Rust
- **Test prep** — Real Estate License
- **Languages** — English, Spanish, French, Japanese, Italian, Portuguese

Each module supports three **modes**:

- **Multiple choice** — pick from four options, instant feedback.
- **Flashcards** — front prompts, flip to reveal, self-grade.
- **Recap** — think your answer, reveal the canonical one, self-grade.

Dynamic modules let you choose a session size (10, 20, 50, or all); static
modules always use the full question bank.

## Stack

Bun · Vite · React + TypeScript · wouter · zustand · CSS modules ·
Supabase (Postgres + Auth + RLS) · Vitest.

## Setup

1. Install dependencies:
   ```
   bun install
   ```
2. Create a Supabase project at <https://supabase.com/dashboard>.
3. Create `.env.local` at the repo root with:
   ```
   VITE_SUPABASE_URL=https://xxxx.supabase.co
   VITE_SUPABASE_ANON_KEY=<anon key>
   ```
4. In the Supabase SQL Editor, run each migration in order:
   - `supabase/migrations/001_init.sql` — schema, RLS policies
   - `supabase/migrations/005_module_requests.sql` — module-request feature
   - `supabase/migrations/002_seed_g1.sql` through
     `supabase/migrations/021_seed_portuguese.sql` — seed any modules you
     want. Each `_seed_*.sql` is independent; install only what you need.
5. Run the dev server:
   ```
   bun run dev
   ```

## Scripts

- `bun run dev` — start Vite dev server
- `bun run build` — production build
- `bun run preview` — preview the production build
- `bun run typecheck` — `tsc --noEmit`
- `bun run lint` — ESLint
- `bun run test` — run Vitest once
- `bun run test:watch` — Vitest in watch mode
- `bun run check` — lint + typecheck + test

## Regenerating screenshots

`scripts/capture-screenshots.ts` drives Chromium (Playwright) against the dev
server and writes PNGs to `docs/screenshots/`. It bypasses Supabase by
injecting a synthetic auth session and mocking PostgREST responses, so it
works without real credentials.

```
bun run dev                               # in one terminal
bun run scripts/capture-screenshots.ts    # in another
```
