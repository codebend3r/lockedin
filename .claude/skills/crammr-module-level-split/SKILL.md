---
name: crammr-module-level-split
description: Use when splitting a single crammr quiz module into three difficulty-level modules (`<lang>-1/2/3` with display names `<Lang> — Level 1/2/3`) in the `crammr` repo (path contains `crammr`). Triggers include "split the X module into level 1/2/3", "break up the Y module by difficulty", "make Z-1/2/3", or normalizing a 100-question seed against the level pattern already used for `javascript`, `typescript`, and `python`. Covers per-question classification, the SQL transform, companion-file updates, verification, and the commit format.
---

# Crammr module level split

Established by commits `eae5e99` (JavaScript) and `f87b0a9` (TypeScript + Python). Reference outputs: `supabase/migrations/003_seed_javascript.sql`, `004_seed_typescript.sql`, `007_seed_python.sql`.

## What it does

Splits one quiz module (1 `modules` row + 100 questions in a seed migration) into three difficulty-level modules. Question prompts, explanations, flashcard backs, recap answers, and choices stay byte-identical — only grouping and `order_index` change. Slug `<lang>` → `<lang>-1`, `<lang>-2`, `<lang>-3`; display name → `<Lang> — Level <N>` (em-dash, not hyphen).

## When to skip

- `002_seed_g1.sql` — `type='static'`, 40 questions, signs vs rules categories. Difficulty split doesn't fit; ask the user first.
- `016`..`021_seed_<language>.sql` — 500 questions each. Pattern works but classification cost is 5× per module. Confirm before proceeding.

## File-layout variants

Determine via `grep -l "slug = '<lang>'" supabase/migrations/*.sql`:

| Variant | Where the `modules` row lives | Files you'll edit |
|---|---|---|
| A | In the seed file itself | `<NNN>_seed_<lang>.sql` only (e.g. `003_seed_javascript.sql`, `004_seed_typescript.sql`) |
| B | In `006_seed_more_modules.sql` | `<NNN>_seed_<lang>.sql` **and** `006_seed_more_modules.sql` (e.g. `007_seed_python.sql`) |

## Naming scheme (non-negotiable)

```
slug: <lang>-1   name: <Lang> — Level 1   description: "<Lang> basics — …"
slug: <lang>-2   name: <Lang> — Level 2   description: "Intermediate <Lang> — …"
slug: <lang>-3   name: <Lang> — Level 3   description: "Advanced <Lang> — …"
```

Descriptions are honest one-liners (~80 chars). Each row's `total_questions` must equal its actual question count from the classification.

## Classification framework

Read every question in context. Assign each to exactly one level:

- **L1 (basics)** — fundamentals a learner masters in the first weeks; core syntax, primitive types, basic library usage, everyday control flow.
- **L2 (intermediate)** — mid-level concepts a working developer uses daily; subtle but common gotchas.
- **L3 (advanced)** — language internals, performance, niche features, deep gotchas that catch experienced devs.

When a question straddles two, pick the deeper level. Do NOT target equal counts — distribution falls out of the questions.

## Procedure

1. **Inspect.** `grep -c "^-- Question" supabase/migrations/<NNN>_seed_<lang>.sql` → 100. Confirm the file matches the JS/TS/Python pattern (CTE `with q as (insert into questions ...)` → `insert into question_choices ... (values ...)`, with `from modules where slug = '<lang>'`).

2. **Classify all 100.** Build three sets of original indices: `L1`, `L2`, `L3`. Assert they partition `{0..99}` exactly.

3. **Transform via one-shot Python script** (write to `/tmp`, run, delete — do not commit):

```python
import re
from pathlib import Path

LANG = "<lang>"   # e.g. "go"
SRC = Path(f"supabase/migrations/<NNN>_seed_{LANG}.sql")
L1, L2, L3 = {...}, {...}, {...}
assert L1 | L2 | L3 == set(range(100))
assert not (L1 & L2 or L1 & L3 or L2 & L3)

parts = re.split(r"(?=^-- Question \d+ \()", SRC.read_text(), flags=re.MULTILINE)
blocks = parts[1:]
assert len(blocks) == 100

buckets = {1: [], 2: [], 3: []}
for i, b in enumerate(blocks):
    buckets[1 if i in L1 else 2 if i in L2 else 3].append((i, b))

def rewrite(block, slug, new_idx):
    block = block.replace(f"slug = '{LANG}'", f"slug = '{slug}'")
    pat = re.compile(
        rf"^(\s*)(\d+)(\s*\n\s*from modules where slug = ')" + re.escape(slug) + r"'",
        re.MULTILINE,
    )
    out, n = pat.subn(
        lambda m: f"{m.group(1)}{new_idx}{m.group(3)}{slug}'", block, count=1
    )
    assert n == 1
    return out

# Variant A header. For Variant B, omit the `insert into modules` block and replace
# it with: `-- Module rows are in 006_seed_more_modules.sql.`
new_header = f"""-- <NNN>_seed_{LANG}.sql
-- <Lang> modules: split into three difficulty levels ({len(L1)} / {len(L2)} / {len(L3)} questions).

insert into modules (slug, name, description, type, total_questions) values
  ('{LANG}-1', '<Lang> — Level 1', '<L1 desc>', 'dynamic', {len(L1)}),
  ('{LANG}-2', '<Lang> — Level 2', '<L2 desc>', 'dynamic', {len(L2)}),
  ('{LANG}-3', '<Lang> — Level 3', '<L3 desc>', 'dynamic', {len(L3)});

"""

out = [new_header]
for lvl, slug in [(1, f"{LANG}-1"), (2, f"{LANG}-2"), (3, f"{LANG}-3")]:
    out += [
        "-- ============================================================\n",
        f"-- {slug}\n",
        "-- ============================================================\n\n",
    ]
    for new_idx, (orig_idx, b) in enumerate(buckets[lvl]):
        b = re.sub(
            r"^-- Question \d+ \(",
            f"-- Question {new_idx} [orig {orig_idx}] (",
            b, count=1, flags=re.MULTILINE,
        )
        out.append(rewrite(b, slug, new_idx))

SRC.write_text("".join(out).rstrip() + "\n")
```

4. **Variant B only:** edit `supabase/migrations/006_seed_more_modules.sql`. Replace the single `('<lang>', ...)` row with three rows for `<lang>-1/2/3`. Preserve the column padding of surrounding rows.

5. **Companion files.**
   - `src/lib/moduleCategories.ts` — remove the `<lang>:` entry; add `"<lang>-1/2/3"` keys mapped to the same category.
   - `src/lib/moduleCategories.test.ts` — only touch if the test references the slug you removed.
   - `scripts/capture-screenshots.ts` — if a fixture for `m-<lang>` exists, rename to `m-<lang>-1`, update `slug`/`name`/`description`/`total_questions`, and replace any `module_id`/URL references.

6. **Verify.** All four must pass.
   ```bash
   grep -c "^-- Question" supabase/migrations/<NNN>_seed_<lang>.sql   # → 100
   grep -oE "slug = '<lang>-[123]'" supabase/migrations/<NNN>_seed_<lang>.sql | sort | uniq -c
   python3 -c "
   import re
   text = open('supabase/migrations/<NNN>_seed_<lang>.sql').read()
   per = {}
   for b in re.split(r'(?=^-- Question )', text, flags=re.MULTILINE)[1:]:
       sm = re.search(r\"slug = '(<lang>-\d)'\", b)
       om = re.search(r'^\s*(\d+)\s*\n\s*from modules where slug', b, re.MULTILINE)
       per.setdefault(sm.group(1), []).append(int(om.group(1)))
   for s, idx in sorted(per.items()):
       print(f'{s}: {len(idx)}, contiguous={idx == list(range(len(idx)))}')
   "
   bun run check   # lint + typecheck + tests
   ```

## Commit format

```
LI: split `<lang>` module into `<lang>-1/2/3` by difficulty

- re-bucket `<NNN>_seed_<lang>.sql` into Level 1 (X), Level 2 (Y), and Level 3 (Z) under `<lang>-1/2/3`
- [variant B only] replace the `<lang>` row in `006_seed_more_modules.sql` with three Level rows
- map `<lang>-1/2/3` to its category in `moduleCategories.ts`
- point the `m-<lang>` screenshot fixture at `<lang>-1` (if applicable)
```

No `Co-Authored-By` trailer. Body uses backticks for identifiers.

## Parallelism

When splitting multiple modules in one session, dispatch one general-purpose subagent per module in parallel. Each agent edits ONLY its own seed file (and the `006` row if variant B). The parent agent waits for all to finish, then handles shared files (`moduleCategories.ts`, `scripts/capture-screenshots.ts`) once and commits. Don't let agents fight over those shared files.

## Common mistakes

- Editing the `(values ...)` choices block's `order_index` (0..3). Those are choice indices, independent of the question's `order_index`.
- Editing the seed file when the module row actually lives in `006_seed_more_modules.sql` (variant B). Always determine the variant first.
- Aiming for ~33 questions per level. The original spread determines the result.
- Skipping the contiguity check. The regex-based transform can silently miss substitutions; verifying `0..N-1` per slug catches it.
- Leaving the `/tmp/split_*.py` script behind. Delete it.
