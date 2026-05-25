# Locked In — v1 Design

**Date:** 2026-05-25
**Status:** Approved (pending final review)

## Purpose

A learning-module web app for brushing up on a skill or topic right before a
test, so the material is fresh in your mind. v1 ships three modules and three
learning modes, with user accounts so progress is captured for a future stats
dashboard.

## Tech stack

- **Runtime / package manager:** Bun (`bun install`, `bun run dev`).
- **Build / dev server:** Vite (React + TS template).
- **UI:** React 18 + TypeScript, CSS modules for styling, `lucide-react` for
  icons. No Tailwind, no component framework.
- **Routing:** wouter.
- **Global state:** zustand (one store for auth, one for the active quiz
  session).
- **Backend:** Supabase — Postgres + Auth + Row-Level Security. No custom
  server.
- **Lint / typecheck:** ESLint + `tsc --noEmit`.

## Project layout

```
src/
  routes/         one folder per route (LoginPage, HomePage, ModulePage, QuizPage, ResultsPage)
  components/     shared UI (Button, Card, Header, ProgressBar, RequireAuth)
  modes/          MultipleChoice/, Flashcards/, Recap/  (one per learning mode)
  store/          zustand stores (authStore, sessionStore)
  lib/            supabase client, sampling helpers, types
  styles/         global.css + CSS variables (light theme for v1)
supabase/
  migrations/     schema + seed data SQL
docs/superpowers/specs/
                  this design and future ones
```

## Modules

Three modules ship in v1:

| slug         | name                     | type    | total questions |
| ------------ | ------------------------ | ------- | --------------- |
| `g1`         | G1 Driver's Test         | static  | 40 (20 signs + 20 rules) |
| `javascript` | JavaScript Test          | dynamic | 100 (session samples 10/20/50/all) |
| `typescript` | TypeScript Test          | dynamic | 100 (session samples 10/20/50/all) |

**Module types:**

- **static** — every question is asked once per session (order may be
  shuffled). `session_size` is always equal to `total_questions`.
- **dynamic** — a random subset of `session_size` questions is drawn from the
  full pool. User picks the size at session start; allowed values for v1 are
  10, 20, 50, and "all".

## Learning modes

Each module supports all three modes. Mode components live in `src/modes/`,
each receiving `{ question, onAnswer }`.

1. **Multiple Choice** — radio-style buttons rendered from
   `question_choices`. Clicking one immediately reveals correctness +
   `question.explanation`, then a "Next" button advances.
2. **Flashcards** — front shows `question.prompt`; tap/click to flip; back
   shows `question.flashcard_back`; "Got it" / "Missed it" buttons advance.
3. **Recap (self-graded reveal)** — shows `question.prompt`; "Reveal answer"
   shows `question.recap_answer`; "Got it" / "Missed it" advance.

All three call `onAnswer(isCorrect, payload)` so `QuizPage` never has to know
mode internals.

## Data model

Five Postgres tables. Anything user-owned is RLS-protected.

```
modules                        seeded, read-only to users
─────────
id              uuid pk
slug            text unique     'g1', 'javascript', 'typescript'
name            text
description     text
type            text            'static' | 'dynamic'
total_questions int             count in pool (cached)
created_at      timestamptz

questions                      seeded, read-only to users
─────────
id              uuid pk
module_id       uuid fk → modules
category        text null       e.g. 'signs' or 'rules' for G1
prompt          text            the question
explanation     text null       shown after answer in MC mode
flashcard_back  text            what's revealed in flashcard mode
recap_answer    text            canonical answer for recap mode
order_index     int             stable display order for static modules
created_at      timestamptz

question_choices               MC options for each question
─────────
id              uuid pk
question_id     uuid fk → questions
label           text            the choice text
is_correct      bool
order_index     int

sessions                       one per quiz attempt (RLS: user_id = auth.uid())
─────────
id              uuid pk
user_id         uuid fk → auth.users
module_id       uuid fk → modules
mode            text            'multiple_choice' | 'flashcards' | 'recap'
session_size    int             N questions in this session
started_at      timestamptz
completed_at    timestamptz null
score           int null        correct count, filled on completion

session_answers                one row per answered question (RLS: via session)
─────────
id              uuid pk
session_id      uuid fk → sessions
question_id     uuid fk → questions
choice_id       uuid fk → question_choices  null   for MC
self_grade      bool null       for flashcards/recap: true=got it, false=missed
is_correct      bool            normalized correctness across modes
answered_at     timestamptz
```

**Notes:**

- One `questions` row supports all three modes — no mode-specific tables.
- For dynamic modules, sampling is `ORDER BY random() LIMIT N` in the client
  query. No spaced-repetition logic in v1.
- `is_correct` is normalized so a future dashboard can do `SUM(is_correct)`
  without caring which mode it came from.
- Seed data: one migration per module
  (`002_seed_g1.sql`, `003_seed_javascript.sql`, `004_seed_typescript.sql`).

## Routes & flow

```
/login                    LoginPage      public; redirects home if signed in
/                         HomePage       lists the 3 module cards
/m/:slug                  ModulePage     pick mode + session size, then start
/m/:slug/quiz             QuizPage       in-progress session; renders mode component
/m/:slug/results/:id      ResultsPage    score + per-question review
```

Everything except `/login` is wrapped in `<RequireAuth>`, which redirects to
`/login` when `authStore.user` is null.

**Session flow:**

```
LoginPage
   │  email+password or magic link → Supabase Auth
   ▼
HomePage
   │  shows 3 module cards (G1, JavaScript, TypeScript)
   │  each card: name, type badge, # questions, last score if any
   ▼
ModulePage  /m/g1
   │  pick mode:  [Multiple Choice] [Flashcards] [Recap]
   │  pick size:  static → locked to total; dynamic → 10 / 20 / 50 / all
   │  [Start]
   ▼
QuizPage
   │  sessionStore holds: questions[], currentIndex, answers[], mode
   │  renders one of: <MultipleChoice/> <Flashcards/> <Recap/>
   │  progress bar across the top
   │  each answer → push to sessionStore + insert session_answers row
   │  when currentIndex === questions.length → mark session complete,
   │    navigate to results
   ▼
ResultsPage
   │  score, % correct, time taken
   │  scrollable review: every question + what user picked + correct answer
   │  [Try again] [Back home]
```

## State (zustand)

- **`authStore`** — `{ user, session, status, signIn, signUp,
  signInWithMagicLink, signOut }`. Thin wrapper over Supabase auth; subscribes
  to `supabase.auth.onAuthStateChange` so all consumers stay in sync.
- **`sessionStore`** — `{ moduleId, mode, questions, currentIndex, answers,
  startedAt, sessionId, start(), recordAnswer(), finish() }`. Owns the active
  quiz; cleared on `finish()` and on logout.

## Auth flow

Supabase Auth, two options on the login page:

1. Email + password (default).
2. Magic link.

No OAuth providers for v1.

**Wiring:**

- `lib/supabase.ts` creates a single client with `localStorage` persistence.
- `App.tsx` calls `supabase.auth.getSession()` on mount and renders a small
  loading shell while the promise is pending (avoids flashing `/login` for an
  already-signed-in user).
- `authStore` subscribes to `onAuthStateChange` so login, logout, token
  refresh, and tab restoration all flow through one place.
- `<RequireAuth>` wraps protected routes.
- `Header` shows email + sign-out button when authenticated.

**Row-Level Security policies:**

```sql
-- sessions: owner can do anything with their own
create policy "own sessions" on sessions
  for all using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- session_answers: owner via the parent session
create policy "own session answers" on session_answers
  for all using (
    exists (select 1 from sessions s
            where s.id = session_answers.session_id
              and s.user_id = auth.uid())
  );

-- shared content: read-only for any authenticated user
create policy "read modules"   on modules          for select using (auth.role() = 'authenticated');
create policy "read questions" on questions        for select using (auth.role() = 'authenticated');
create policy "read choices"   on question_choices for select using (auth.role() = 'authenticated');
```

The future dashboard becomes a pure-read addition: `select * from sessions`
already returns only the current user's rows because RLS rewrites the query.

## Non-goals (v1)

Named so they don't sneak into scope:

- **Dashboard / stats pages** — schema supports it, UI lands later.
- **Spaced repetition / smart sampling** — uniform random for v1.
- **Authoring UI** — questions added/edited via SQL migrations only.
- **Mobile-app shell** — responsive web only; no PWA, no native wrappers.
- **Offline mode** — requires an internet connection.
- **Question images** — G1 signs use Unicode/emoji or inline SVG placeholders
  in v1; binary image storage lands later.
- **Social features** — no sharing, leaderboards, friends.
- **Password reset UI, email verification gating, OAuth, profile editing.**
- **Test suite** — none for v1; will add when the dashboard or any
  non-trivial logic lands.

## Acceptance criteria

A user can:

1. Sign up with email + password on `/login`, see `HomePage` immediately.
2. Sign out and sign back in; their previous sessions still show "last score"
   on the relevant module card.
3. Pick any module → any mode → start a session.
4. For G1, see all 40 questions in a single session (order shuffled).
5. For JS or TS, pick a session size (10/20/50/all) and see exactly that many
   questions, drawn at random.
6. Complete a session in each mode (MC, flashcards, recap) and reach the
   results page with a correct score.
7. On `ResultsPage`, scroll through every question of the session with their
   answer and the correct answer.
8. Hit "Try again" and start a fresh session of the same module/mode (for
   dynamic modules, a new random sample is drawn; for static modules, the
   order is reshuffled).
9. Open the browser devtools and confirm a query like `select * from sessions`
   returns only rows owned by the logged-in user, even though the client has
   no `where user_id = ...` clause.
