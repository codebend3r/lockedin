/*
 * Apply Supabase migrations via psql.
 *
 * Reads SUPABASE_DB_URL from the environment (Bun auto-loads .env.local).
 * Get the connection string from Supabase Dashboard →
 *   Project Settings → Database → Connection string (URI, with password).
 *
 * Usage:
 *   bun run db:apply                                # apply all migrations
 *   bun run db:apply supabase/migrations/001_init.sql supabase/migrations/005_module_requests.sql
 *
 * Re-running is not idempotent — these files contain CREATE TABLE / INSERT
 * statements that will error on a populated database. Intended for a fresh
 * project or for applying newly-added migrations one at a time.
 *
 * Requires `psql` on PATH (e.g. `brew install libpq` and add to PATH, or
 * `brew install postgresql`).
 */
import { $ } from "bun";
import { readdir } from "node:fs/promises";
import { join, resolve } from "node:path";

const url = process.env.SUPABASE_DB_URL;
if (!url) {
  console.error(
    "SUPABASE_DB_URL is not set. Add it to .env.local " +
      "(Supabase Dashboard → Project Settings → Database → Connection string).",
  );
  process.exit(1);
}

const migrationsDir = resolve(import.meta.dir, "..", "supabase", "migrations");
const argFiles = process.argv.slice(2);

const files =
  argFiles.length > 0
    ? argFiles.map((f) => resolve(f))
    : (await readdir(migrationsDir))
        .filter((f) => f.endsWith(".sql"))
        .sort()
        .map((f) => join(migrationsDir, f));

for (const file of files) {
  console.log(`-> ${file}`);
  await $`psql ${url} -v ON_ERROR_STOP=1 -f ${file}`;
}

console.log(`Applied ${files.length} migration${files.length === 1 ? "" : "s"}.`);
