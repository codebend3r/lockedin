/*
 * One-off capture script for README screenshots.
 *
 * Bypasses Supabase auth + data by injecting a fake session into localStorage
 * and intercepting PostgREST calls with mock JSON. Produces deterministic
 * screenshots without needing real credentials.
 *
 * Usage:
 *   bun run dev   # in another terminal
 *   bun run scripts/capture-screenshots.ts
 *
 * Outputs PNGs to docs/screenshots/{home,module,quiz}.png.
 */
import { chromium, type Route } from "playwright";
import { mkdir } from "node:fs/promises";
import { join } from "node:path";

const DEV_URL = process.env.DEV_URL ?? "http://localhost:5173";
const SUPABASE_HOST = "pflouriolsheawtdleym.supabase.co";
const PROJECT_REF = "pflouriolsheawtdleym";
const OUT_DIR = join(process.cwd(), "docs", "screenshots");

await mkdir(OUT_DIR, { recursive: true });

// ─── Fixture data ─────────────────────────────────────────────────────────
const USER_ID = "00000000-0000-4000-8000-000000000001";
const FAR_FUTURE = Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 365;

const fakeJwt = () => {
  // Three base64url segments. Not cryptographically valid, but well-formed.
  const header = Buffer.from(JSON.stringify({ alg: "HS256", typ: "JWT" }))
    .toString("base64url");
  const body = Buffer.from(
    JSON.stringify({
      sub: USER_ID,
      email: "preview@crammr.dev",
      role: "authenticated",
      aud: "authenticated",
      exp: FAR_FUTURE,
    })
  ).toString("base64url");
  const sig = Buffer.from("preview-sig").toString("base64url");
  return `${header}.${body}.${sig}`;
};

const FAKE_USER = {
  id: USER_ID,
  aud: "authenticated",
  role: "authenticated",
  email: "preview@crammr.dev",
  email_confirmed_at: "2024-01-01T00:00:00.000Z",
  phone: "",
  confirmed_at: "2024-01-01T00:00:00.000Z",
  last_sign_in_at: "2024-01-01T00:00:00.000Z",
  app_metadata: { provider: "email", providers: ["email"] },
  user_metadata: {
    first_name: "Alex",
    last_initial: "R",
    onboarded: true,
  },
  identities: [],
  created_at: "2024-01-01T00:00:00.000Z",
  updated_at: "2024-01-01T00:00:00.000Z",
};

const FAKE_SESSION = {
  access_token: fakeJwt(),
  refresh_token: "preview-refresh",
  expires_in: 60 * 60 * 24 * 365,
  expires_at: FAR_FUTURE,
  token_type: "bearer",
  user: FAKE_USER,
};

const MODULES = [
  {
    id: "m-g1",
    slug: "g1",
    name: "G1 Driver's Test",
    description: "Prep for Ontario's G1 knowledge test — signs, rules, and road safety.",
    type: "static",
    total_questions: 200,
    created_at: "2024-01-01T00:00:00.000Z",
  },
  {
    id: "m-javascript",
    slug: "javascript",
    name: "JavaScript",
    description: "Brush up on JavaScript — closures, prototypes, async, and the language's sharp edges.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-02T00:00:00.000Z",
  },
  {
    id: "m-typescript",
    slug: "typescript",
    name: "TypeScript",
    description: "Sharpen TypeScript — generics, narrowing, conditional types, and inference.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-03T00:00:00.000Z",
  },
  {
    id: "m-python",
    slug: "python",
    name: "Python",
    description: "Brush up on Python — data types, comprehensions, decorators, and gotchas.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-04T00:00:00.000Z",
  },
  {
    id: "m-rust",
    slug: "rust",
    name: "Rust",
    description: "Brush up on Rust — ownership, borrowing, traits, and lifetimes.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-05T00:00:00.000Z",
  },
  {
    id: "m-go",
    slug: "go",
    name: "Go",
    description: "Sharpen Go — goroutines, channels, interfaces, and idioms.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-06T00:00:00.000Z",
  },
  {
    id: "m-sql",
    slug: "sql",
    name: "SQL",
    description: "Practice SQL — joins, indexes, window functions, and query plans.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-07T00:00:00.000Z",
  },
  {
    id: "m-spanish",
    slug: "spanish",
    name: "Spanish",
    description: "Vocabulary, grammar, and conjugation — practice Spanish daily.",
    type: "dynamic",
    total_questions: 500,
    created_at: "2024-01-08T00:00:00.000Z",
  },
  {
    id: "m-japanese",
    slug: "japanese",
    name: "Japanese",
    description: "Hiragana, katakana, kanji, vocabulary, and grammar — practice Japanese daily.",
    type: "dynamic",
    total_questions: 500,
    created_at: "2024-01-09T00:00:00.000Z",
  },
  {
    id: "m-real-estate",
    slug: "real-estate",
    name: "Real Estate License",
    description: "Prep for the real estate licensing exam — agency, contracts, finance, and ethics.",
    type: "dynamic",
    total_questions: 100,
    created_at: "2024-01-10T00:00:00.000Z",
  },
];

const LAST_SCORES = [
  {
    module_id: "m-javascript",
    score: 17,
    session_size: 20,
    completed_at: "2026-05-25T14:22:00.000Z",
  },
  {
    module_id: "m-typescript",
    score: 14,
    session_size: 20,
    completed_at: "2026-05-23T10:11:00.000Z",
  },
  {
    module_id: "m-g1",
    score: 38,
    session_size: 40,
    completed_at: "2026-05-20T19:00:00.000Z",
  },
];

type JSQuestion = {
  category: string;
  prompt: string;
  explanation: string;
  flashcard_back: string;
  recap_answer: string;
  choices: Array<{ label: string; is_correct: boolean }>;
};

const JS_QUESTION_SEEDS: JSQuestion[] = [
  {
    category: "Closures",
    prompt: "What does this snippet log?\n\n```js\nfor (var i = 0; i < 3; i++) setTimeout(() => console.log(i), 0);\n```",
    explanation: "`var` is function-scoped, so all three timeouts share the same `i`. By the time they fire, the loop is done and `i === 3`.",
    flashcard_back: "`3 3 3` — the `var` binding is shared across all three callbacks.",
    recap_answer: "`3 3 3` — `var` is function-scoped.",
    choices: [
      { label: "0 1 2", is_correct: false },
      { label: "3 3 3", is_correct: true },
      { label: "undefined undefined undefined", is_correct: false },
      { label: "Throws a ReferenceError", is_correct: false },
    ],
  },
  {
    category: "Equality",
    prompt: "Which of these comparisons returns `true`?",
    explanation: "`==` performs type coercion. `'5' == 5` becomes `5 == 5`. The others use `===` which compares both type and value.",
    flashcard_back: "`'5' == 5` — `==` coerces the string to a number before comparing.",
    recap_answer: "`'5' == 5` is `true` because `==` coerces.",
    choices: [
      { label: "'5' === 5", is_correct: false },
      { label: "null === undefined", is_correct: false },
      { label: "'5' == 5", is_correct: true },
      { label: "NaN === NaN", is_correct: false },
    ],
  },
  {
    category: "Hoisting",
    prompt: "What is logged?\n\n```js\nconsole.log(typeof foo);\nvar foo = 'hello';\n```",
    explanation: "`var` declarations are hoisted (initialized to `undefined`), so `typeof foo` is `'undefined'` — not a ReferenceError.",
    flashcard_back: "`'undefined'` — the declaration is hoisted but the assignment is not.",
    recap_answer: "`'undefined'` because `var foo` is hoisted.",
    choices: [
      { label: "'string'", is_correct: false },
      { label: "'undefined'", is_correct: true },
      { label: "ReferenceError", is_correct: false },
      { label: "TypeError", is_correct: false },
    ],
  },
  {
    category: "this binding",
    prompt: "Which call pattern makes `this` refer to the global object (in non-strict mode)?",
    explanation: "A bare function call like `fn()` binds `this` to the global object in non-strict mode (or `undefined` in strict mode).",
    flashcard_back: "Bare invocation `fn()` — `this` is the global object in non-strict mode.",
    recap_answer: "`fn()` invoked as a bare function — `this` is the global object.",
    choices: [
      { label: "obj.method()", is_correct: false },
      { label: "new Foo()", is_correct: false },
      { label: "fn()", is_correct: true },
      { label: "fn.call(obj)", is_correct: false },
    ],
  },
  {
    category: "Arrays",
    prompt: "What does `[1, 2, 3].flatMap(x => [x, x * 2])` return?",
    explanation: "`flatMap` maps each element to an array, then flattens one level.",
    flashcard_back: "`[1, 2, 2, 4, 3, 6]`.",
    recap_answer: "`[1, 2, 2, 4, 3, 6]`.",
    choices: [
      { label: "[1, 2, 3, 1, 2, 3]", is_correct: false },
      { label: "[[1, 2], [2, 4], [3, 6]]", is_correct: false },
      { label: "[1, 2, 2, 4, 3, 6]", is_correct: true },
      { label: "[2, 4, 6]", is_correct: false },
    ],
  },
  {
    category: "Promises",
    prompt: "What does this log?\n\n```js\nPromise.resolve(1)\n  .then(v => v + 1)\n  .then(v => { throw v; })\n  .catch(v => console.log(v));\n```",
    explanation: "The first `.then` produces `2`. The second throws `2`. `.catch` receives the thrown value.",
    flashcard_back: "`2` — the catch handler receives the value thrown by the previous `.then`.",
    recap_answer: "`2`.",
    choices: [
      { label: "1", is_correct: false },
      { label: "2", is_correct: true },
      { label: "undefined", is_correct: false },
      { label: "An unhandled rejection", is_correct: false },
    ],
  },
  {
    category: "Spread",
    prompt: "Given `const a = { x: 1, y: 2 }`, what is `{ ...a, x: 3 }`?",
    explanation: "Spread copies enumerable own properties, then later keys overwrite earlier ones.",
    flashcard_back: "`{ x: 3, y: 2 }` — later keys win.",
    recap_answer: "`{ x: 3, y: 2 }`.",
    choices: [
      { label: "{ x: 1, y: 2 }", is_correct: false },
      { label: "{ x: 3, y: 2 }", is_correct: true },
      { label: "{ x: 3 }", is_correct: false },
      { label: "Throws — duplicate key", is_correct: false },
    ],
  },
  {
    category: "Numbers",
    prompt: "Which expression equals `true`?",
    explanation: "`NaN` is the only JavaScript value not equal to itself. `Number.isNaN(NaN)` is the safe check.",
    flashcard_back: "`Number.isNaN(NaN)` — only `NaN !== NaN`.",
    recap_answer: "`Number.isNaN(NaN)` — `NaN` is the only value not equal to itself.",
    choices: [
      { label: "NaN === NaN", is_correct: false },
      { label: "Number.isNaN(NaN)", is_correct: true },
      { label: "isNaN('hello') === false", is_correct: false },
      { label: "0.1 + 0.2 === 0.3", is_correct: false },
    ],
  },
  {
    category: "Async",
    prompt: "In what order do these run?\n\n```js\nconsole.log('A');\nsetTimeout(() => console.log('B'), 0);\nPromise.resolve().then(() => console.log('C'));\nconsole.log('D');\n```",
    explanation: "Synchronous code runs first (`A`, `D`). Microtasks (Promises) run before macrotasks (setTimeout) — so `C` before `B`.",
    flashcard_back: "`A D C B` — microtasks beat macrotasks.",
    recap_answer: "`A D C B`.",
    choices: [
      { label: "A B C D", is_correct: false },
      { label: "A D B C", is_correct: false },
      { label: "A D C B", is_correct: true },
      { label: "A C D B", is_correct: false },
    ],
  },
  {
    category: "Destructuring",
    prompt: "What is `a` after `const { x: a = 5 } = { x: undefined }`?",
    explanation: "Default values apply when the property is `undefined` — but not when it's `null`.",
    flashcard_back: "`5` — defaults apply for `undefined`.",
    recap_answer: "`5`.",
    choices: [
      { label: "undefined", is_correct: false },
      { label: "5", is_correct: true },
      { label: "null", is_correct: false },
      { label: "Throws", is_correct: false },
    ],
  },
  {
    category: "Type coercion",
    prompt: "What is the value of `[] + []`?",
    explanation: "Both arrays convert to empty strings via `toString()`, and `'' + ''` is `''`.",
    flashcard_back: "`''` — both arrays become empty strings, then concatenate.",
    recap_answer: "`''` (an empty string).",
    choices: [
      { label: "0", is_correct: false },
      { label: "[]", is_correct: false },
      { label: "''", is_correct: true },
      { label: "undefined", is_correct: false },
    ],
  },
  {
    category: "Scope",
    prompt: "Which keyword creates a block-scoped binding that cannot be reassigned?",
    explanation: "`const` is block-scoped and prevents reassignment of the binding (though objects it references are still mutable).",
    flashcard_back: "`const` — block-scoped, no reassignment.",
    recap_answer: "`const`.",
    choices: [
      { label: "var", is_correct: false },
      { label: "let", is_correct: false },
      { label: "const", is_correct: true },
      { label: "static", is_correct: false },
    ],
  },
  {
    category: "Iteration",
    prompt: "Which loop iterates over the values of an iterable like an Array or a Set?",
    explanation: "`for...of` iterates values. `for...in` iterates enumerable keys, which is rarely what you want for arrays.",
    flashcard_back: "`for...of` — iterates values of an iterable.",
    recap_answer: "`for...of`.",
    choices: [
      { label: "for...in", is_correct: false },
      { label: "for...of", is_correct: true },
      { label: "forEach (it's a statement)", is_correct: false },
      { label: "while", is_correct: false },
    ],
  },
  {
    category: "Optional chaining",
    prompt: "What does `obj?.foo?.bar` evaluate to when `obj.foo` is `null`?",
    explanation: "Optional chaining short-circuits to `undefined` when the value before `?.` is nullish.",
    flashcard_back: "`undefined` — optional chaining short-circuits on nullish.",
    recap_answer: "`undefined`.",
    choices: [
      { label: "null", is_correct: false },
      { label: "undefined", is_correct: true },
      { label: "Throws a TypeError", is_correct: false },
      { label: "An empty object", is_correct: false },
    ],
  },
  {
    category: "Functions",
    prompt: "What is the result of `((x, y) => x + y)(2, 3)`?",
    explanation: "Arrow functions can be invoked immediately when wrapped in parentheses.",
    flashcard_back: "`5` — IIFE pattern with an arrow function.",
    recap_answer: "`5`.",
    choices: [
      { label: "5", is_correct: true },
      { label: "23", is_correct: false },
      { label: "NaN", is_correct: false },
      { label: "SyntaxError", is_correct: false },
    ],
  },
  {
    category: "Modules",
    prompt: "Which export style allows multiple bindings per module?",
    explanation: "Named exports allow many per module. Default exports allow only one.",
    flashcard_back: "Named exports — many per module.",
    recap_answer: "Named exports.",
    choices: [
      { label: "Default exports", is_correct: false },
      { label: "Named exports", is_correct: true },
      { label: "CommonJS only", is_correct: false },
      { label: "Re-exports only", is_correct: false },
    ],
  },
  {
    category: "Sets",
    prompt: "What is `new Set([1, 1, 2, 3]).size`?",
    explanation: "Sets hold unique values, so duplicates are dropped on construction.",
    flashcard_back: "`3` — duplicates are removed.",
    recap_answer: "`3`.",
    choices: [
      { label: "2", is_correct: false },
      { label: "3", is_correct: true },
      { label: "4", is_correct: false },
      { label: "undefined", is_correct: false },
    ],
  },
  {
    category: "Strings",
    prompt: "Which method returns a new string with leading and trailing whitespace removed?",
    explanation: "`String.prototype.trim()` removes whitespace from both ends. `trimStart` / `trimEnd` only trim one side.",
    flashcard_back: "`trim()` — removes whitespace from both ends.",
    recap_answer: "`trim()`.",
    choices: [
      { label: "strip()", is_correct: false },
      { label: "trim()", is_correct: true },
      { label: "trimEnd()", is_correct: false },
      { label: "replace(/\\s/g, '')", is_correct: false },
    ],
  },
  {
    category: "Loops",
    prompt: "What does `[10, 20, 30].reduce((a, b) => a + b, 0)` return?",
    explanation: "`reduce` accumulates values left-to-right, starting from the initial value.",
    flashcard_back: "`60` — `0 + 10 + 20 + 30`.",
    recap_answer: "`60`.",
    choices: [
      { label: "30", is_correct: false },
      { label: "60", is_correct: true },
      { label: "[10, 20, 30]", is_correct: false },
      { label: "NaN", is_correct: false },
    ],
  },
  {
    category: "Objects",
    prompt: "How do you check whether an object has its own property named `'foo'` (not inherited)?",
    explanation: "`Object.hasOwn(obj, 'foo')` is the modern, safe form — it works even on `Object.create(null)` objects.",
    flashcard_back: "`Object.hasOwn(obj, 'foo')` — modern, prototype-safe.",
    recap_answer: "`Object.hasOwn(obj, 'foo')`.",
    choices: [
      { label: "'foo' in obj", is_correct: false },
      { label: "Object.hasOwn(obj, 'foo')", is_correct: true },
      { label: "obj['foo'] !== undefined", is_correct: false },
      { label: "obj.foo === true", is_correct: false },
    ],
  },
];

const ALL_JS_QUESTIONS = JS_QUESTION_SEEDS.map((seed, i) => ({
  id: `q-${i + 1}`,
  module_id: "m-javascript",
  category: seed.category,
  prompt: seed.prompt,
  explanation: seed.explanation,
  flashcard_back: seed.flashcard_back,
  recap_answer: seed.recap_answer,
  order_index: i,
  created_at: "2024-01-01T00:00:00.000Z",
  choices: seed.choices.map((c, j) => ({
    id: `c-${i + 1}-${j}`,
    question_id: `q-${i + 1}`,
    label: c.label,
    is_correct: c.is_correct,
    order_index: j,
  })),
}));

// ─── Mock helpers ─────────────────────────────────────────────────────────
const json = (route: Route, body: unknown, status = 200) =>
  route.fulfill({
    status,
    contentType: "application/json",
    body: JSON.stringify(body),
  });

const matchEq = (url: URL, column: string): string | null => {
  const v = url.searchParams.get(column);
  if (!v) return null;
  return v.startsWith("eq.") ? v.slice(3) : null;
};

// ─── Run ──────────────────────────────────────────────────────────────────
const browser = await chromium.launch({ headless: true });
const context = await browser.newContext({
  viewport: { width: 1440, height: 900 },
  deviceScaleFactor: 2,
});

await context.addInitScript(
  ({ key, session }) => {
    window.localStorage.setItem(key, JSON.stringify(session));
  },
  {
    key: `sb-${PROJECT_REF}-auth-token`,
    session: FAKE_SESSION,
  }
);

const page = await context.newPage();

await page.route(`https://${SUPABASE_HOST}/**`, async (route) => {
  const reqUrl = new URL(route.request().url());
  const method = route.request().method();
  const path = reqUrl.pathname;

  // Auth: return user / session as needed.
  if (path === "/auth/v1/user") {
    return json(route, FAKE_USER);
  }
  if (path === "/auth/v1/token") {
    return json(route, FAKE_SESSION);
  }

  // PostgREST: /rest/v1/<table>
  if (path === "/rest/v1/modules") {
    const slug = matchEq(reqUrl, "slug");
    if (slug) {
      const m = MODULES.find((x) => x.slug === slug);
      return json(route, m ? [m] : []);
    }
    return json(route, MODULES);
  }

  if (path === "/rest/v1/sessions") {
    if (method === "POST") {
      const body = route.request().postDataJSON() as Record<string, unknown>;
      return json(route, [
        {
          id: "sess-1",
          user_id: USER_ID,
          module_id: body.module_id,
          mode: body.mode,
          session_size: body.session_size,
          started_at: new Date().toISOString(),
          completed_at: null,
          score: null,
        },
      ]);
    }
    // GET — fetchLastScoreByModule
    return json(route, LAST_SCORES);
  }

  if (path === "/rest/v1/questions") {
    const moduleId = matchEq(reqUrl, "module_id");
    if (moduleId === "m-javascript") {
      return json(route, ALL_JS_QUESTIONS);
    }
    return json(route, []);
  }

  if (path === "/rest/v1/session_answers") {
    if (method === "POST") {
      const body = route.request().postDataJSON() as Record<string, unknown>;
      return json(route, [
        {
          id: `ans-${Date.now()}`,
          session_id: body.session_id,
          question_id: body.question_id,
          choice_id: body.choice_id,
          self_grade: body.self_grade,
          is_correct: body.is_correct,
          answered_at: new Date().toISOString(),
        },
      ]);
    }
    return json(route, []);
  }

  // Unknown — empty response so nothing throws.
  return json(route, []);
});

page.on("pageerror", (err) => console.log("PAGE ERROR:", err.message));
page.on("console", (msg) => {
  if (msg.type() === "error") console.log("CONSOLE ERR:", msg.text());
});

console.log("→ navigating to /");
await page.goto(`${DEV_URL}/`, { waitUntil: "networkidle" });
await page.waitForLoadState("networkidle");
await page.waitForTimeout(700);

console.log("→ capturing home.png");
await page.screenshot({ path: join(OUT_DIR, "home.png") });

console.log("→ navigating to /m/javascript");
await page.goto(`${DEV_URL}/m/javascript`, { waitUntil: "networkidle" });
await page.waitForTimeout(500);

console.log("→ capturing module.png");
await page.screenshot({ path: join(OUT_DIR, "module.png") });

console.log("→ starting quiz");
await page.getByRole("button", { name: "Start" }).click();
await page.waitForURL("**/m/javascript/quiz", { timeout: 15_000 });
await page.waitForTimeout(800);

console.log("→ capturing quiz.png");
await page.screenshot({ path: join(OUT_DIR, "quiz.png") });

await browser.close();
console.log(`✓ wrote 3 screenshots to ${OUT_DIR}`);
