# Locked In

Brush up on a skill or topic right before a test, so the material is fresh
in your mind. Three modules (G1 driver's test, JavaScript, TypeScript) and
three modes (multiple choice, flashcards, recap).

## Stack

Bun · Vite · React + TypeScript · wouter · zustand · CSS modules ·
Supabase (Postgres + Auth + RLS).

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
   - `supabase/migrations/001_init.sql`
   - `supabase/migrations/002_seed_g1.sql`
   - `supabase/migrations/003_seed_javascript.sql`
   - `supabase/migrations/004_seed_typescript.sql`
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