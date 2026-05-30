-- 012_seed_sql.sql
-- SQL modules: split into three difficulty levels (19 / 60 / 21 questions). Module rows are in 006_seed_more_modules.sql.

-- ============================================================
-- sql-1
-- ============================================================

-- Question 0 [orig 0] (SELECT projection) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which clause specifies which columns to return from a `SELECT` statement?',
         'The `SELECT` clause itself lists the projected columns or expressions. `FROM` selects the source, `WHERE` filters rows, and `GROUP BY` aggregates them.',
         'The `SELECT` clause',
         'The `SELECT` clause names the columns or expressions to project from the source rows.',
         0
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`SELECT`', true, 0),
       ('`FROM`', false, 1),
       ('`WHERE`', false, 2),
       ('`GROUP BY`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 1] (WHERE basics) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which clause filters rows before any aggregation is applied?',
         '`WHERE` filters individual rows from the source tables before grouping or aggregation. `HAVING` filters groups after aggregation has occurred.',
         '`WHERE` (pre-aggregation row filter)',
         '`WHERE` filters individual rows before `GROUP BY` and aggregation run.',
         1
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`HAVING`', false, 0),
       ('`WHERE`', true, 1),
       ('`FILTER`', false, 2),
       ('`QUALIFY`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 2] (ORDER BY default) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In standard SQL, what is the default sort direction for `ORDER BY col`?',
         'When no direction is given, `ORDER BY` sorts ascending (`ASC`). You must explicitly write `DESC` for descending order.',
         'Ascending (`ASC`) by default',
         '`ORDER BY` defaults to ascending order unless `DESC` is specified.',
         2
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Descending', false, 0),
       ('Undefined / implementation-defined', false, 1),
       ('Ascending', true, 2),
       ('Insertion order', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 3] (LIMIT / OFFSET) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, what does `LIMIT 10 OFFSET 20` return?',
         '`OFFSET 20` skips the first 20 rows of the result, then `LIMIT 10` returns the next 10. Without an `ORDER BY`, the rows skipped are not deterministic.',
         'Skip 20 rows, then return 10',
         '`LIMIT 10 OFFSET 20` skips the first 20 rows and returns the next 10.',
         3
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The first 10 rows, skipping nothing', false, 0),
       ('Rows 20 through 30 inclusive (11 rows)', false, 1),
       ('Skips 20 rows, then returns the next 10', true, 2),
       ('Returns 10 random rows from the first 20', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 4] (DISTINCT) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `SELECT DISTINCT a, b FROM t` return?',
         '`DISTINCT` deduplicates on the entire projected tuple, so unique `(a, b)` pairs are returned. It is not applied to `a` alone.',
         'Unique `(a, b)` tuples',
         '`DISTINCT` removes duplicates across the full projected row, not column-by-column.',
         4
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Unique values of `a` only', false, 0),
       ('Unique combinations of `(a, b)`', true, 1),
       ('Unique values of `b` paired with all `a` values', false, 2),
       ('The same as `GROUP BY a`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 6] (string equality / case) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL with default collation, is `''abc'' = ''ABC''` true?',
         'PostgreSQL string equality is case-sensitive by default. Use `LOWER()`/`UPPER()` or `ILIKE` for case-insensitive comparisons.',
         'No — Postgres `=` is case-sensitive',
         'In default PostgreSQL, string equality is case-sensitive; `LOWER()` or `ILIKE` enables case-insensitive comparison.',
         5
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes — SQL is always case-insensitive', false, 0),
       ('Yes, but only for ASCII strings', false, 1),
       ('No — string `=` is case-sensitive by default', true, 2),
       ('It depends on whether the column is `TEXT` or `VARCHAR`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 7] (LIKE wildcards) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a `LIKE` pattern, what does the `_` wildcard match?',
         '`_` matches exactly one character. `%` matches any sequence of zero or more characters.',
         '`_` = one character; `%` = any sequence',
         'In `LIKE`, `_` matches one character and `%` matches any sequence of zero or more characters.',
         6
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Zero or more characters', false, 0),
       ('Exactly one character', true, 1),
       ('Any digit', false, 2),
       ('A single whitespace character', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 8] (BETWEEN inclusivity) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Is `x BETWEEN 1 AND 10` inclusive or exclusive of its endpoints?',
         '`BETWEEN a AND b` is equivalent to `x >= a AND x <= b` — both endpoints are included.',
         'Inclusive of both endpoints',
         '`BETWEEN a AND b` includes both `a` and `b`; it is `x >= a AND x <= b`.',
         7
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Inclusive of both endpoints', true, 0),
       ('Exclusive of both endpoints', false, 1),
       ('Inclusive of the lower bound only', false, 2),
       ('Inclusive of the upper bound only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 10] (INNER JOIN definition) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'An `INNER JOIN` returns rows where:',
         'An `INNER JOIN` keeps only rows for which the join predicate is true in both tables. Rows with no match on either side are dropped.',
         'Predicate true on both sides',
         '`INNER JOIN` returns only the rows where the join predicate matches on both sides.',
         8
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All rows from the left table, matched where possible', false, 0),
       ('Only rows with a match on both sides of the join', true, 1),
       ('All rows from both tables, padded with NULLs', false, 2),
       ('The Cartesian product of both tables', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 20] (COUNT(*) vs COUNT(col)) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do `COUNT(*)` and `COUNT(col)` differ?',
         '`COUNT(*)` counts all rows regardless of NULLs. `COUNT(col)` counts only rows where `col IS NOT NULL`.',
         '`COUNT(col)` skips NULLs',
         '`COUNT(*)` counts every row; `COUNT(col)` counts only non-NULL values of `col`.',
         9
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical', false, 0),
       ('`COUNT(col)` ignores NULLs in `col`; `COUNT(*)` counts every row', true, 1),
       ('`COUNT(*)` ignores NULLs; `COUNT(col)` counts them', false, 2),
       ('`COUNT(col)` is faster because it scans only one column', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 21] (GROUP BY rule) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In standard SQL, which columns may appear in `SELECT` alongside aggregates without an aggregate wrapper?',
         'Standard SQL requires every non-aggregated `SELECT` expression to appear in `GROUP BY` (or be functionally dependent on it). Other columns must be wrapped in an aggregate.',
         'Only `GROUP BY` columns',
         'Non-aggregated `SELECT` columns must appear in `GROUP BY` (or be functionally dependent on it).',
         10
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any column from any joined table', false, 0),
       ('Only columns listed in `GROUP BY` (or functionally dependent on them)', true, 1),
       ('Only the primary key column', false, 2),
       ('Columns of numeric type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 26] (GROUP BY ordinal) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, what does `GROUP BY 1, 2` mean?',
         'Positional `GROUP BY` references columns by their ordinal in the `SELECT` list. `1` is the first selected expression, `2` is the second.',
         'Group by 1st and 2nd select columns',
         '`GROUP BY 1, 2` groups by the first and second expressions in the `SELECT` list.',
         11
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Group rows whose values equal 1 or 2', false, 0),
       ('Group by columns named `1` and `2`', false, 1),
       ('Group by the 1st and 2nd columns of the `SELECT` list', true, 2),
       ('Group only the first 2 rows', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 80] (CREATE TABLE basic) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which clause makes a column the primary key in `CREATE TABLE`?',
         '`PRIMARY KEY` declares a column (or set of columns) as the table''s primary key, which implies `NOT NULL` and `UNIQUE` and is the row''s default identity.',
         '`PRIMARY KEY`',
         '`PRIMARY KEY` declares the table''s primary identity and implies `NOT NULL` and `UNIQUE`.',
         12
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`UNIQUE KEY`', false, 0),
       ('`PRIMARY KEY`', true, 1),
       ('`INDEX KEY`', false, 2),
       ('`KEY PRIMARY`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 84] (ALTER TABLE add col) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which DDL adds a new column to an existing table?',
         '`ALTER TABLE ... ADD COLUMN col type` adds a column. Most engines allow specifying defaults, constraints, and nullability at the same time.',
         '`ALTER TABLE ... ADD COLUMN`',
         '`ALTER TABLE ... ADD COLUMN` introduces a new column to an existing table.',
         13
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`UPDATE TABLE ... ADD col`', false, 0),
       ('`ALTER TABLE ... ADD COLUMN col TYPE`', true, 1),
       ('`MODIFY TABLE ... ADD col`', false, 2),
       ('`CREATE COLUMN col ON TABLE`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 88] (rename) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, how do you rename a column?',
         'Use `ALTER TABLE t RENAME COLUMN old TO new`. There''s no `RENAME COLUMN OF` or `MODIFY COLUMN` in PostgreSQL.',
         '`ALTER TABLE ... RENAME COLUMN ... TO ...`',
         'PostgreSQL renames columns with `ALTER TABLE ... RENAME COLUMN old TO new`.',
         14
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`ALTER TABLE t RENAME COLUMN old TO new`', true, 0),
       ('`ALTER TABLE t MODIFY COLUMN old new`', false, 1),
       ('`RENAME COLUMN old IN t TO new`', false, 2),
       ('`UPDATE TABLE t RENAME old TO new`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 89] (default value) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `DEFAULT now()` do on a column?',
         'When a row is inserted without supplying a value for the column, the engine substitutes the result of `now()` at insert time.',
         'Inserts `now()` when omitted',
         '`DEFAULT now()` supplies the current timestamp when an `INSERT` omits the column.',
         15
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Recomputes `now()` every time the row is read', false, 0),
       ('Stores `now()` at table creation time only', false, 1),
       ('Substitutes the current timestamp when the column is omitted from `INSERT`', true, 2),
       ('Disables NULL values on the column', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 93] (IS NULL) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you correctly test that `col` is NULL?',
         'Use `col IS NULL` (or `col IS NOT NULL`). The plain `=` operator with NULL yields UNKNOWN, which behaves like false in `WHERE`.',
         '`col IS NULL`',
         '`col IS NULL` is the correct way to test for NULL; `= NULL` is UNKNOWN.',
         16
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`col = NULL`', false, 0),
       ('`col == NULL`', false, 1),
       ('`col IS NULL`', true, 2),
       ('`NULL(col)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 95] (INSERT VALUES) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the correct syntax to insert two rows in a single statement?',
         'Standard SQL supports multi-row `VALUES`: `INSERT INTO t (a, b) VALUES (1, 2), (3, 4)`. Many engines also accept `INSERT INTO t (a, b) SELECT ...`.',
         '`VALUES (..), (..)`',
         'Multi-row insert uses comma-separated tuples after `VALUES`: `VALUES (..), (..)`.',
         17
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`INSERT INTO t (a,b) VALUES (1,2); (3,4)`', false, 0),
       ('`INSERT INTO t (a,b) VALUES (1,2), (3,4)`', true, 1),
       ('`INSERT INTO t (a,b) = (1,2), (3,4)`', false, 2),
       ('`INSERT MANY INTO t (a,b) VALUES (1,2) (3,4)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 96] (UPDATE without WHERE) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `UPDATE t SET status = ''x''` (no `WHERE`) do?',
         'With no `WHERE`, the `UPDATE` applies the `SET` clause to every row in the table. This is a common cause of accidents, so most teams require an explicit `WHERE` in code review.',
         'Updates every row in the table',
         'Without `WHERE`, an `UPDATE` modifies every row in the target table.',
         18
  from modules where slug = 'sql-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Raises a "no `WHERE` clause" error by default', false, 0),
       ('Updates exactly one row chosen by the engine', false, 1),
       ('Updates every row in the table', true, 2),
       ('Updates only the most recently inserted row', false, 3)
     ) as c(label, is_correct, order_index);

-- ============================================================
-- sql-2
-- ============================================================

-- Question 0 [orig 5] (WHERE vs HAVING) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why can you not reference an aggregate like `COUNT(*)` in `WHERE`?',
         '`WHERE` is evaluated before grouping and aggregation, so aggregate functions have no value yet. Filtering on aggregates requires `HAVING`, which runs after `GROUP BY`.',
         '`WHERE` runs before aggregation',
         'Aggregates can be filtered only in `HAVING` because `WHERE` is evaluated before `GROUP BY`.',
         0
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WHERE` is evaluated before `GROUP BY` runs', true, 0),
       ('`WHERE` cannot reference functions at all', false, 1),
       ('Aggregates are only allowed in `SELECT`', false, 2),
       ('It is allowed but discouraged for performance', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 9] (column alias in WHERE) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you reference a `SELECT` column alias from the same query''s `WHERE` clause in standard SQL?',
         'Standard SQL evaluates `WHERE` before `SELECT`, so aliases defined in the projection are not yet visible. Aliases are available in `ORDER BY` and, in some dialects, in `GROUP BY`/`HAVING`.',
         'No — `WHERE` runs before `SELECT`',
         'Column aliases from `SELECT` are not visible in `WHERE`; they become available in `ORDER BY`.',
         1
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, always', false, 0),
       ('Yes, only in PostgreSQL', false, 1),
       ('No — aliases are not visible in `WHERE`', true, 2),
       ('Only when the alias is double-quoted', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 11] (LEFT JOIN semantics) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a `LEFT JOIN` do when there is no matching row on the right?',
         'A `LEFT [OUTER] JOIN` keeps every row from the left table; right-side columns become NULL when no match exists.',
         'Keeps left row; right columns NULL',
         '`LEFT JOIN` preserves all left-side rows and fills right-side columns with NULL when there is no match.',
         2
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Drops the left row entirely', false, 0),
       ('Returns the left row with right columns set to NULL', true, 1),
       ('Raises an error', false, 2),
       ('Returns the left row with right columns set to zero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 12] (RIGHT JOIN equivalence) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         '`A RIGHT JOIN B ON ...` is equivalent to which `LEFT JOIN` form?',
         'Swapping the operand order converts a right outer join into a left outer join. `A RIGHT JOIN B` keeps all of `B` plus matches from `A`, which is the same as `B LEFT JOIN A`.',
         '`B LEFT JOIN A ON ...`',
         '`A RIGHT JOIN B` is equivalent to `B LEFT JOIN A` with the same predicate.',
         3
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`A LEFT JOIN B ON ...`', false, 0),
       ('`B LEFT JOIN A ON ...`', true, 1),
       ('`A INNER JOIN B ON ...`', false, 2),
       ('`A FULL JOIN B ON ...`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 13] (FULL OUTER JOIN) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which join returns matched rows plus unmatched rows from both sides, padded with NULL?',
         'A `FULL OUTER JOIN` returns the union of `LEFT` and `RIGHT` outer joins: matched rows plus unmatched rows from both sides, with NULLs filling the missing side.',
         '`FULL OUTER JOIN`',
         '`FULL OUTER JOIN` returns matched rows plus unmatched rows from both sides, with NULLs on the missing side.',
         4
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`CROSS JOIN`', false, 0),
       ('`INNER JOIN`', false, 1),
       ('`FULL OUTER JOIN`', true, 2),
       ('`NATURAL JOIN`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 14] (CROSS JOIN) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Without a predicate, `A CROSS JOIN B` produces:',
         'A `CROSS JOIN` returns the Cartesian product — every row of `A` paired with every row of `B`. Adding an `ON` filter is just an `INNER JOIN` written differently.',
         'Cartesian product of `A` and `B`',
         '`CROSS JOIN` without a predicate yields the full Cartesian product of the inputs.',
         5
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Rows only where `A.id = B.id`', false, 0),
       ('The Cartesian product of `A` and `B`', true, 1),
       ('The union of `A` and `B`', false, 2),
       ('A syntax error — `CROSS JOIN` requires `ON`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 15] (self join) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is required to write a self-join in SQL?',
         'A self-join references the same table twice, so each reference needs a distinct table alias to disambiguate the columns.',
         'Distinct aliases for each reference',
         'Self-joins require giving each reference to the table its own alias to disambiguate columns.',
         6
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A foreign key on the table', false, 0),
       ('A recursive CTE', false, 1),
       ('Two distinct aliases for the same table', true, 2),
       ('A `UNION` of the table with itself', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 16] (ON vs USING) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `JOIN ... USING (col)` differ from `JOIN ... ON a.col = b.col`?',
         '`USING (col)` requires identically named columns and merges them into a single output column. `ON` allows arbitrary predicates and keeps both columns in the result.',
         '`USING` merges the column; `ON` keeps both',
         '`USING (col)` requires matching column names and collapses them to one column; `ON` allows any predicate and preserves both columns.',
         7
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`USING` is faster than `ON`', false, 0),
       ('`USING` merges the join column into one output column, `ON` keeps both', true, 1),
       ('`ON` only works for primary keys', false, 2),
       ('There is no difference; they are aliases', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 17] (LEFT JOIN filter pitfall) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'You write `A LEFT JOIN B ON ... WHERE B.col = ''x''`. What happens to unmatched left rows?',
         'A `WHERE` predicate on a right-side column rejects rows where that column is NULL, which is the case for unmatched left rows. The result becomes effectively an inner join. To keep them, move the predicate into the `ON` clause.',
         '`WHERE` on right side turns it into an inner join',
         'Filtering a right-side column in `WHERE` drops unmatched left rows, converting a `LEFT JOIN` into an inner join; put the predicate in `ON` instead.',
         8
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are preserved with NULL on the right', false, 0),
       ('They are filtered out, behaving like an inner join', true, 1),
       ('They cause a syntax error', false, 2),
       ('They appear with `B.col = ''x''`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 18] (NATURAL JOIN) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A `NATURAL JOIN` joins on which columns?',
         '`NATURAL JOIN` matches on every column that shares a name between the two tables. It is fragile because schema changes can silently alter the join key, which is why many teams avoid it.',
         'All same-named columns',
         '`NATURAL JOIN` joins on every column whose name exists in both tables — generally avoided due to fragility.',
         9
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All columns with the same name in both tables', true, 0),
       ('Only primary key columns', false, 1),
       ('Only foreign key relationships declared in DDL', false, 2),
       ('No columns — it is a Cartesian product', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 19] (CROSS JOIN row count) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If `A` has 5 rows and `B` has 7 rows, how many rows does `A CROSS JOIN B` return?',
         'A Cartesian product returns `|A| * |B|` rows — every row of `A` paired with every row of `B`, so 5 * 7 = 35.',
         '35 (5 * 7)',
         '`CROSS JOIN` returns `|A| * |B|` rows — the full Cartesian product.',
         10
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('12', false, 0),
       ('5', false, 1),
       ('7', false, 2),
       ('35', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 22] (HAVING usage) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which clause filters groups produced by `GROUP BY`?',
         '`HAVING` is evaluated after `GROUP BY` and can reference aggregate functions to filter groups, e.g. `HAVING COUNT(*) > 10`.',
         '`HAVING`',
         '`HAVING` filters groups after `GROUP BY` and may reference aggregates.',
         11
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WHERE`', false, 0),
       ('`FILTER`', false, 1),
       ('`HAVING`', true, 2),
       ('`QUALIFY`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 23] (AVG and NULL) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `AVG(col)` treat NULL values?',
         'Aggregate functions skip NULLs. `AVG` divides the sum of non-NULL values by the count of non-NULL values — NULLs are excluded from both.',
         'Skips NULLs entirely',
         '`AVG` skips NULLs — both the numerator and denominator only consider non-NULL values.',
         12
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Treats them as 0', false, 0),
       ('Skips them; they do not affect the average', true, 1),
       ('Returns NULL if any NULL exists', false, 2),
       ('Counts them in the denominator only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 24] (DISTINCT inside aggregate) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `COUNT(DISTINCT col)` return?',
         '`COUNT(DISTINCT col)` returns the number of distinct non-NULL values of `col`. NULLs are excluded from the distinct set.',
         'Number of distinct non-NULL values',
         '`COUNT(DISTINCT col)` returns the number of unique non-NULL values of `col`.',
         13
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Number of distinct values including NULL as a value', false, 0),
       ('Number of distinct non-NULL values of `col`', true, 1),
       ('Total non-NULL count divided by group size', false, 2),
       ('Same as `COUNT(*)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 25] (SUM of empty) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `SUM(col)` return when no rows match?',
         'Per the SQL standard, `SUM` over an empty set returns NULL — not zero. Use `COALESCE(SUM(col), 0)` to substitute zero.',
         'NULL (not 0)',
         '`SUM` over zero rows returns NULL; wrap with `COALESCE(..., 0)` to get a zero default.',
         14
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0`', false, 0),
       ('An empty string', false, 1),
       ('NULL', true, 2),
       ('An error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 27] (MIN over strings) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `MIN(text_col)` return?',
         '`MIN` on a text column returns the lexicographically smallest value according to the column''s collation. NULLs are ignored.',
         'Lexicographic minimum (by collation)',
         '`MIN` on text returns the smallest value by collation order, skipping NULLs.',
         15
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The shortest string in the column', false, 0),
       ('The lexicographically smallest value by the column''s collation', true, 1),
       ('An error — `MIN` only accepts numeric input', false, 2),
       ('The first value inserted into the column', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 29] (HAVING without GROUP BY) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can `HAVING` be used without a `GROUP BY`?',
         'If no `GROUP BY` is present, the whole result is treated as one group. A `HAVING` clause then filters that single aggregate row.',
         'Yes — treats whole result as one group',
         '`HAVING` is allowed without `GROUP BY`; the entire result is treated as a single group.',
         16
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — `HAVING` requires `GROUP BY`', false, 0),
       ('Yes — the query is treated as a single implicit group', true, 1),
       ('Yes, but only in MySQL', false, 2),
       ('Only if the `SELECT` list contains no aggregates', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 30] (subquery basic) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A subquery used inside `WHERE col IN (SELECT ...)` is most accurately described as:',
         'It is a non-correlated subquery — it does not depend on the outer query and can be evaluated once. `IN` then checks membership against its result.',
         'Non-correlated set membership',
         '`WHERE col IN (SELECT ...)` uses a non-correlated subquery for set membership.',
         17
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A correlated subquery', false, 0),
       ('A non-correlated subquery returning a set', true, 1),
       ('A scalar subquery', false, 2),
       ('A recursive CTE', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 31] (correlated subquery) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What makes a subquery a "correlated" subquery?',
         'A correlated subquery references a column from the enclosing outer query, so it must be re-evaluated logically for each outer row.',
         'References outer-query columns',
         'A correlated subquery references columns from the outer query and is evaluated per outer row.',
         18
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It uses a CTE', false, 0),
       ('It returns more than one row', false, 1),
       ('It references a column from the enclosing outer query', true, 2),
       ('It uses `EXISTS`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 32] (EXISTS) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `EXISTS (SELECT 1 FROM t WHERE ...)` return?',
         '`EXISTS` is a boolean that is true if the subquery returns at least one row. The projected expression (`SELECT 1`) is irrelevant — only row existence matters.',
         'True if subquery has any rows',
         '`EXISTS (...)` is true when the subquery returns at least one row; the projected expression doesn''t matter.',
         19
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The count of rows matched by the subquery', false, 0),
       ('A boolean — true if the subquery returns at least one row', true, 1),
       ('The first row produced by the subquery', false, 2),
       ('Always 1', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 33] (IN vs EXISTS with NULL) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `col NOT IN (SELECT x FROM t)` risky if the subquery can return NULL?',
         'In SQL three-valued logic, `col != NULL` is UNKNOWN. If the subquery returns even one NULL, `col NOT IN (...)` evaluates to UNKNOWN for every outer row, so nothing is returned. `NOT EXISTS` does not have this pitfall.',
         'NULLs make `NOT IN` UNKNOWN → no rows',
         'A NULL in the subquery makes `NOT IN` evaluate to UNKNOWN for all rows; prefer `NOT EXISTS`.',
         20
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('NULLs cause an error', false, 0),
       ('NULLs make every comparison UNKNOWN, so the predicate is never true', true, 1),
       ('NULLs are silently treated as zero', false, 2),
       ('It is identical to `NOT EXISTS` in all cases', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 34] (scalar subquery) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A scalar subquery must return:',
         'A scalar subquery is one used where a single value is expected. It must return at most one row and one column, otherwise SQL raises a runtime error.',
         'At most one row and one column',
         'Scalar subqueries must return at most one row and one column; otherwise SQL raises an error.',
         21
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Exactly one row and one column', false, 0),
       ('At most one row and exactly one column', true, 1),
       ('Any number of rows, but exactly one column', false, 2),
       ('Exactly one row, any number of columns', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 35] (subquery in FROM) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A subquery in `FROM` is also called:',
         'A subquery in `FROM` is a derived table (sometimes called an inline view). It must be given an alias in standard SQL.',
         'Derived table / inline view',
         'Subqueries in `FROM` are derived tables (inline views) and need an alias.',
         22
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A correlated subquery', false, 0),
       ('A common table expression', false, 1),
       ('A derived table / inline view', true, 2),
       ('A materialized view', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 36] (ALL operator) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `x > ALL (SELECT y FROM t)` mean?',
         '`> ALL` is true when `x` is strictly greater than every value the subquery returns. If the subquery is empty, it is vacuously true.',
         '`x` exceeds every subquery value',
         '`x > ALL (...)` is true when `x` exceeds every row returned by the subquery.',
         23
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`x` is greater than at least one value', false, 0),
       ('`x` is greater than every value returned by the subquery', true, 1),
       ('`x` is greater than the average', false, 2),
       ('`x` is greater than the count of subquery rows', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 37] (anti-join) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which pattern is the cleanest "anti-join" — rows in `A` with no match in `B`?',
         '`NOT EXISTS` with a correlated subquery is the standard, NULL-safe anti-join. `LEFT JOIN ... WHERE B.id IS NULL` also works but is less direct and easy to break.',
         '`WHERE NOT EXISTS (...)`',
         '`NOT EXISTS (...)` is the cleanest, NULL-safe way to express an anti-join.',
         24
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`INNER JOIN ... WHERE B.id IS NULL`', false, 0),
       ('`NOT EXISTS (SELECT 1 FROM B WHERE B.a_id = A.id)`', true, 1),
       ('`A.id NOT IN (SELECT id FROM B)` even when `B.id` allows NULLs', false, 2),
       ('`CROSS JOIN B WHERE A.id <> B.a_id`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 38] (subquery in SELECT) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `SELECT x, (SELECT COUNT(*) FROM y WHERE y.x = t.x) FROM t`, the inner query is:',
         'It is a scalar, correlated subquery: scalar because it returns a single value, correlated because it depends on `t.x` from the outer query.',
         'Scalar correlated subquery',
         'A subquery in `SELECT` that returns a single value and references the outer query is a scalar correlated subquery.',
         25
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A non-correlated set subquery', false, 0),
       ('A derived table', false, 1),
       ('A scalar correlated subquery', true, 2),
       ('A recursive CTE', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 39] (IN with list) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         '`x IN (a, b, c)` is logically equivalent to:',
         '`IN` against a value list is a disjunction of equalities. NULL values in the list make the predicate UNKNOWN when there is no match.',
         '`x = a OR x = b OR x = c`',
         '`x IN (a, b, c)` is shorthand for `x = a OR x = b OR x = c`.',
         26
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`x = a AND x = b AND x = c`', false, 0),
       ('`x = a OR x = b OR x = c`', true, 1),
       ('`x BETWEEN a AND c`', false, 2),
       ('`EXISTS (SELECT 1 WHERE a = b)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 40] (CTE intro) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What keyword introduces a Common Table Expression?',
         'CTEs are introduced with `WITH name AS (subquery) SELECT ...`. They give a name to an inline subquery for use in the main statement.',
         '`WITH`',
         '`WITH` introduces a Common Table Expression — a named inline subquery.',
         27
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`USING`', false, 0),
       ('`WITH`', true, 1),
       ('`AS`', false, 2),
       ('`DECLARE`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 41] (CTE vs subquery) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Compared to an inline subquery, a key advantage of a CTE is:',
         'CTEs name a query so it can be referenced multiple times and chained with other CTEs, improving readability and reuse. They can also be recursive.',
         'Named, reusable, can recurse',
         'CTEs give a name to a query so it can be reused and chained, and they support recursion.',
         28
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always faster execution', false, 0),
       ('It can be referenced multiple times and supports recursion', true, 1),
       ('It bypasses the optimizer', false, 2),
       ('It commits its rows automatically', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 45] (CTE multiple) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can a single `WITH` clause define multiple CTEs?',
         'Yes — multiple CTEs are comma-separated in one `WITH` clause: `WITH a AS (...), b AS (...) SELECT ...`. Later CTEs can reference earlier ones.',
         'Yes — comma-separated',
         'A single `WITH` clause may define multiple CTEs separated by commas, with later CTEs able to reference earlier ones.',
         29
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — only one CTE per query', false, 0),
       ('Yes — comma-separated within one `WITH`', true, 1),
       ('Only with `WITH RECURSIVE`', false, 2),
       ('Only when each CTE is a SELECT', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 47] (CTE scope) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the scope of a CTE name?',
         'A CTE is visible only inside the statement it is declared in. After the statement ends, the name is gone — unlike a view.',
         'Just the enclosing statement',
         'A CTE name is only visible within the statement it is declared in.',
         30
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The entire session', false, 0),
       ('Just the enclosing statement', true, 1),
       ('The whole transaction', false, 2),
       ('Until the database is restarted', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 50] (ROW_NUMBER) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `ROW_NUMBER() OVER (ORDER BY x)` assign?',
         '`ROW_NUMBER` assigns a unique sequential integer (1, 2, 3, ...) to each row in the window, ordered by the `ORDER BY` clause. Ties are broken arbitrarily unless the ordering is unique.',
         'Sequential 1, 2, 3 within window',
         '`ROW_NUMBER` assigns unique sequential integers within the window per its ordering.',
         31
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The same rank to tied rows', false, 0),
       ('A unique sequential integer per row in the window', true, 1),
       ('The row''s primary key', false, 2),
       ('A hash of the row', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 51] (RANK vs DENSE_RANK) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do `RANK()` and `DENSE_RANK()` differ on ties?',
         'Both give tied rows the same rank. `RANK` then skips the next values (1, 1, 3), while `DENSE_RANK` does not (1, 1, 2).',
         '`RANK` skips after ties; `DENSE_RANK` doesn''t',
         '`RANK` leaves gaps after tied rows; `DENSE_RANK` continues without gaps.',
         32
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`RANK` skips ranks after ties; `DENSE_RANK` does not', true, 0),
       ('`DENSE_RANK` skips ranks after ties; `RANK` does not', false, 1),
       ('They are identical', false, 2),
       ('`RANK` breaks ties by primary key', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 52] (PARTITION BY) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `OVER (PARTITION BY dept)` do for a window function?',
         '`PARTITION BY` splits the rows into independent groups (partitions). The window function is then computed separately within each partition.',
         'Restarts window per partition',
         '`PARTITION BY` restarts the window calculation for each partition value, like a `GROUP BY` for window functions.',
         33
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Filters the rows to just one department', false, 0),
       ('Resets the window function calculation per `dept` value', true, 1),
       ('Sorts the result by `dept`', false, 2),
       ('Joins the table to itself by `dept`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 53] (LAG) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `LAG(x, 1) OVER (ORDER BY t)` return?',
         '`LAG(x, n)` returns the value of `x` from the row `n` positions before the current row in the window''s ordering. For rows with no predecessor, it returns NULL unless a default is given.',
         'Value of `x` from previous row',
         '`LAG(x, 1)` returns `x` from the previous row in the window order; NULL when no predecessor.',
         34
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The value of `x` from one row before the current row in the window', true, 0),
       ('The value of `x` from one row after the current row', false, 1),
       ('A rolling 1-row average of `x`', false, 2),
       ('The first value of `x` in the window', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 54] (LEAD) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         '`LEAD(x)` is the counterpart of which window function?',
         '`LEAD(x, n)` returns the value of `x` from the row `n` positions after the current row, where `LAG` looks backward.',
         '`LAG` (it looks forward)',
         '`LEAD` looks forward in the window; `LAG` looks backward.',
         35
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`LAG` — `LEAD` looks at the next row, `LAG` at the previous', true, 0),
       ('`ROW_NUMBER`', false, 1),
       ('`NTILE`', false, 2),
       ('`CUME_DIST`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 56] (SUM as window) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         '`SUM(x) OVER (PARTITION BY g ORDER BY t)` produces what kind of value?',
         'Combining an aggregate with a window and `ORDER BY` produces a running (cumulative) total within each partition.',
         'Running total per partition',
         'An aggregate used with `OVER (PARTITION BY ... ORDER BY ...)` produces a running total within each partition.',
         36
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A single total for each group', false, 0),
       ('A running cumulative sum per partition by `t`', true, 1),
       ('The global average of `x`', false, 2),
       ('NULL for every row', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 57] (NTILE) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `NTILE(4) OVER (ORDER BY x)` do?',
         '`NTILE(n)` divides the ordered rows of the window into `n` buckets of roughly equal size and labels each row with its bucket number (1..n).',
         'Splits into 4 buckets (quartiles)',
         '`NTILE(n)` divides the window into `n` roughly equal buckets, labeling each row 1..n.',
         37
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns the top 4 rows', false, 0),
       ('Divides rows into 4 buckets and labels each with its bucket number', true, 1),
       ('Multiplies each row''s value by 4', false, 2),
       ('Skips every 4th row', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 58] (window vs GROUP BY) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Compared to `GROUP BY`, a window function differs because:',
         '`GROUP BY` collapses multiple rows into one per group. Window functions compute over a window of rows but leave the original rows in the result.',
         'Window keeps the individual rows',
         'Window functions compute over a set of rows without collapsing them, unlike `GROUP BY`.',
         38
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is faster in all cases', false, 0),
       ('It does not collapse rows — each input row is still in the output', true, 1),
       ('It cannot be combined with `ORDER BY`', false, 2),
       ('It cannot use aggregate functions', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 59] (filter window) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you keep only the highest-paid row per department using a window function?',
         'Compute `ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)` and keep rows with rank 1. Wrapping in a subquery or CTE lets you filter on the computed rank since window functions can''t be used directly in `WHERE`.',
         'rank 1 of `ROW_NUMBER` per dept',
         'Compute `ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)` in a subquery, then keep rows where it equals 1.',
         39
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WHERE ROW_NUMBER() OVER (...) = 1`', false, 0),
       ('Use a subquery/CTE that adds the rank, then filter `WHERE rn = 1`', true, 1),
       ('`HAVING ROW_NUMBER() = 1`', false, 2),
       ('`DISTINCT dept, MAX(salary)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 [orig 60] (index purpose) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the primary purpose of a database index?',
         'Indexes are auxiliary data structures that let the engine locate rows matching a predicate without scanning the whole table. They speed up reads at the cost of slower writes and disk space.',
         'Faster lookups; slower writes',
         'Indexes speed up row lookups for matching predicates, trading slower writes and storage cost.',
         40
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reduce disk usage', false, 0),
       ('Speed up row lookups at the cost of slower writes and extra storage', true, 1),
       ('Enforce data types on columns', false, 2),
       ('Replace the need for primary keys', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 [orig 61] (B-tree strength) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which query benefits most from a standard B-tree index on `created_at`?',
         'B-tree indexes are ordered, so they accelerate equality and range queries on the indexed column. Hash indexes only support equality.',
         'Range scans on `created_at`',
         'B-trees accelerate equality and range queries because they store keys in sorted order.',
         41
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WHERE created_at = ''2024-01-01''`', false, 0),
       ('`WHERE created_at BETWEEN ''2024-01-01'' AND ''2024-02-01''`', true, 1),
       ('`WHERE created_at::text LIKE ''%24%''`', false, 2),
       ('`WHERE created_at IS NULL` on a column with very few NULLs', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 [orig 64] (EXPLAIN) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does PostgreSQL''s `EXPLAIN` (without `ANALYZE`) report?',
         'Plain `EXPLAIN` returns the planner''s chosen plan with cost estimates and row estimates but does not actually run the query. `EXPLAIN ANALYZE` runs it and reports real timings.',
         'Planner estimates, no execution',
         '`EXPLAIN` returns the planner''s estimated plan without executing; `EXPLAIN ANALYZE` runs it and reports actual times.',
         42
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Actual execution time only', false, 0),
       ('The planner''s estimated plan and costs without running the query', true, 1),
       ('A list of indexes on the queried tables', false, 2),
       ('A snapshot of `pg_stats` for every column', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 [orig 65] (EXPLAIN ANALYZE) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A key difference between `EXPLAIN` and `EXPLAIN ANALYZE` is:',
         '`EXPLAIN ANALYZE` actually executes the query (including any side-effects of DML), reporting real row counts and timings alongside estimates.',
         '`ANALYZE` actually runs the query',
         '`EXPLAIN ANALYZE` runs the query and reports real timings; plain `EXPLAIN` only shows planner estimates.',
         43
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`ANALYZE` always returns more rows', false, 0),
       ('`ANALYZE` executes the query and adds real timings and row counts', true, 1),
       ('`ANALYZE` disables the use of indexes', false, 2),
       ('`ANALYZE` rebuilds statistics for every table involved', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 [orig 68] (write cost) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Adding more indexes to a table tends to:',
         'Each index must be maintained on `INSERT`/`UPDATE`/`DELETE`, so more indexes mean slower writes plus more storage. Reads can be faster if the index is useful.',
         'Slower writes; more disk',
         'More indexes speed up some reads but slow down writes and use more disk.',
         44
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Speed up writes', false, 0),
       ('Have no effect on writes', false, 1),
       ('Slow down writes and use more storage', true, 2),
       ('Eliminate the need for primary keys', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 [orig 70] (ACID) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `A` in ACID stand for?',
         'A = Atomicity. A transaction is all-or-nothing — either all of its changes are applied, or none are.',
         'Atomicity — all-or-nothing',
         'The `A` in ACID is Atomicity: a transaction is applied entirely or not at all.',
         45
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Asynchronous', false, 0),
       ('Atomicity', true, 1),
       ('Aggregation', false, 2),
       ('Anonymity', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 [orig 71] (commit / rollback) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement makes all uncommitted changes permanent?',
         '`COMMIT` finalizes the current transaction and makes its changes durable. `ROLLBACK` discards them, and `SAVEPOINT` marks a point you can roll back to.',
         '`COMMIT`',
         '`COMMIT` makes uncommitted changes permanent; `ROLLBACK` undoes them.',
         46
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`SAVEPOINT`', false, 0),
       ('`COMMIT`', true, 1),
       ('`ROLLBACK`', false, 2),
       ('`CHECKPOINT`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 [orig 77] (durability) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The `D` in ACID guarantees that:',
         'D = Durability. Once a transaction is committed, its changes survive crashes — they''re written to durable storage (e.g. fsynced WAL).',
         'Committed data survives crashes',
         'Durability ensures committed transactions persist across crashes via durable storage like the WAL.',
         47
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reads never block writes', false, 0),
       ('Transactions are decentralised', false, 1),
       ('Committed changes survive system crashes', true, 2),
       ('Every query runs in under a second', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 [orig 78] (SAVEPOINT) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a `SAVEPOINT` used for?',
         '`SAVEPOINT name` marks a point inside a transaction. `ROLLBACK TO SAVEPOINT name` discards changes made after that mark without aborting the whole transaction.',
         'Partial rollback inside a tx',
         '`SAVEPOINT` lets you roll back part of a transaction without aborting the rest.',
         48
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marking a point inside a transaction to roll back to without aborting the whole transaction', true, 0),
       ('Saving a backup of the database', false, 1),
       ('Committing only some of the changes', false, 2),
       ('Forcing the WAL to flush', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 [orig 81] (foreign key) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A `FOREIGN KEY` constraint enforces:',
         'A foreign key requires each non-NULL value in the child column(s) to match a row in the referenced parent table. It enforces referential integrity.',
         'Referential integrity to a parent row',
         '`FOREIGN KEY` ensures child values reference an existing row in the parent table.',
         49
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Uniqueness within the table', false, 0),
       ('A check constraint per row', false, 1),
       ('That referenced rows exist in the parent table', true, 2),
       ('Encryption at rest', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 [orig 83] (CHECK constraint) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A `CHECK` constraint allows you to:',
         'A `CHECK` constraint declares a boolean predicate that every row must satisfy. Rows are rejected if the predicate evaluates to false (NULL is treated as not-violated).',
         'Per-row boolean invariant',
         '`CHECK` enforces a boolean predicate over each row; rows that violate it are rejected.',
         50
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reference another table''s rows', false, 0),
       ('Encrypt a column', false, 1),
       ('Enforce a boolean predicate on each row', true, 2),
       ('Speed up reads on the column', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 [orig 85] (NOT NULL default) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Adding `NOT NULL` to an existing column requires:',
         'The change is rejected if any existing row has NULL in that column. You typically backfill (`UPDATE ... SET col = ...`) before adding the constraint.',
         'No existing NULLs',
         'Adding `NOT NULL` requires every existing row to already have a non-NULL value.',
         51
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Setting a default value of 0', false, 0),
       ('That every existing row already has a non-NULL value', true, 1),
       ('Disabling all indexes first', false, 2),
       ('A full table rewrite always', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 [orig 86] (DROP vs TRUNCATE) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `TRUNCATE` differ from `DELETE` (without `WHERE`)?',
         '`TRUNCATE` is a DDL-style operation that removes all rows quickly without scanning them, optionally restarting identities. `DELETE` is row-by-row, can be `WHERE`-filtered, and fires per-row triggers.',
         'TRUNCATE = fast bulk wipe',
         '`TRUNCATE` bulk-removes all rows quickly without row scans; `DELETE` is per-row and supports `WHERE`.',
         52
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`TRUNCATE` is the same speed as `DELETE`', false, 0),
       ('`TRUNCATE` removes all rows quickly without scanning them and can reset identities', true, 1),
       ('`TRUNCATE` drops the table definition', false, 2),
       ('`TRUNCATE` supports a `WHERE` clause', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 [orig 87] (CASCADE) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A foreign key declared `ON DELETE CASCADE` will:',
         'When a parent row is deleted, the child rows pointing at it are automatically deleted too. `ON DELETE SET NULL` sets the FK column to NULL instead.',
         'Delete dependent child rows',
         '`ON DELETE CASCADE` automatically deletes child rows when their parent is deleted.',
         53
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Prevent deletion of the parent row if children exist', false, 0),
       ('Delete child rows when the parent row is deleted', true, 1),
       ('Reject deletes and raise an error', false, 2),
       ('Mark child rows as inactive', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 [orig 90] (NULL comparison) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `NULL = NULL` evaluate to in standard SQL?',
         'In SQL three-valued logic, any direct comparison with NULL yields UNKNOWN, including `NULL = NULL`. To test for NULL use `IS NULL`.',
         'UNKNOWN (not TRUE)',
         '`NULL = NULL` is UNKNOWN; use `IS NULL` to test nullness explicitly.',
         54
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('TRUE', false, 0),
       ('FALSE', false, 1),
       ('UNKNOWN', true, 2),
       ('A runtime error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 [orig 91] (COALESCE) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `COALESCE(a, b, c)` return?',
         '`COALESCE` returns the first non-NULL argument from left to right, or NULL if all arguments are NULL.',
         'First non-NULL argument',
         '`COALESCE` returns the leftmost non-NULL argument, or NULL if all are NULL.',
         55
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The last non-NULL argument', false, 0),
       ('The first non-NULL argument, or NULL if all are NULL', true, 1),
       ('The sum of all arguments treating NULL as 0', false, 2),
       ('Always the first argument regardless of NULL', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 [orig 92] (NULLIF) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `NULLIF(a, b)` return?',
         '`NULLIF(a, b)` returns NULL when `a = b`, otherwise it returns `a`. A common use is `NULLIF(divisor, 0)` to avoid divide-by-zero by turning it into a NULL result.',
         'NULL if `a = b`, else `a`',
         '`NULLIF(a, b)` returns NULL when `a = b`; otherwise it returns `a`.',
         56
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('NULL when `a = b`, otherwise `a`', true, 0),
       ('NULL when `a` is NULL, otherwise `b`', false, 1),
       ('The first non-NULL of `a` or `b`', false, 2),
       ('NULL when both `a` and `b` are NULL', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 [orig 97] (DELETE with USING) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, how do you delete rows from `a` matching rows in `b`?',
         'PostgreSQL supports `DELETE FROM a USING b WHERE a.id = b.a_id`. The `USING` clause names additional tables to join against in the predicate.',
         '`DELETE FROM a USING b WHERE a.id = b.a_id`',
         'PostgreSQL''s `DELETE ... USING b WHERE ...` joins additional tables for the delete predicate.',
         57
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`DELETE FROM a JOIN b ON a.id = b.a_id`', false, 0),
       ('`DELETE a FROM b WHERE a.id = b.a_id`', false, 1),
       ('`DELETE FROM a USING b WHERE a.id = b.a_id`', true, 2),
       ('`DELETE INTO a FROM b WHERE a.id = b.a_id`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 [orig 98] (UPSERT) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, which clause turns an `INSERT` into an upsert that updates on conflict?',
         '`ON CONFLICT (col) DO UPDATE SET ...` is PostgreSQL''s upsert syntax. You specify a conflict target (usually a unique index) and an update action; `DO NOTHING` is also valid.',
         '`ON CONFLICT ... DO UPDATE`',
         '`INSERT ... ON CONFLICT (...) DO UPDATE SET ...` performs an upsert in PostgreSQL.',
         58
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`ON DUPLICATE KEY UPDATE`', false, 0),
       ('`MERGE INTO`', false, 1),
       ('`ON CONFLICT (col) DO UPDATE SET ...`', true, 2),
       ('`UPSERT INTO`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 [orig 99] (RETURNING) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does PostgreSQL''s `RETURNING *` clause do?',
         '`RETURNING` lets `INSERT`, `UPDATE`, and `DELETE` return the affected rows (or specific columns) as a result set, avoiding a follow-up `SELECT`.',
         'Returns affected rows from DML',
         '`RETURNING` lets `INSERT`/`UPDATE`/`DELETE` emit the affected rows as a result, no extra `SELECT` needed.',
         59
  from modules where slug = 'sql-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Restarts the transaction', false, 0),
       ('Emits the rows affected by `INSERT`/`UPDATE`/`DELETE` as a result set', true, 1),
       ('Marks the statement as read-only', false, 2),
       ('Returns the SQL plan instead of executing', false, 3)
     ) as c(label, is_correct, order_index);
-- ============================================================
-- sql-3
-- ============================================================

-- Question 0 [orig 28] (ROLLUP) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `GROUP BY ROLLUP (a, b)`, what extra rows does ROLLUP produce?',
         '`ROLLUP` adds subtotal rows for each prefix of the grouping list, plus a grand total. For `(a, b)` you get groupings of `(a, b)`, `(a)`, and `()`.',
         'Subtotals per prefix + grand total',
         '`ROLLUP (a, b)` produces subtotals for each prefix of `(a, b)` plus a grand total row.',
         0
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Subtotals over each prefix of the grouping list plus a grand total', true, 0),
       ('Subtotals over every subset of the grouping columns', false, 1),
       ('Subtotals only on the last column', false, 2),
       ('Nothing — `ROLLUP` is just a synonym for `GROUP BY`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 42] (recursive CTE keyword) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you mark a CTE as recursive in standard SQL?',
         'Standard SQL uses `WITH RECURSIVE name AS (...)`. The CTE body must be a `UNION [ALL]` of a base case (anchor) and a recursive case that references the CTE itself.',
         '`WITH RECURSIVE name AS (...)`',
         '`WITH RECURSIVE` enables a CTE to reference itself; the body must union an anchor and recursive query.',
         1
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WITH RECURSIVE name AS (...)`', true, 0),
       ('`WITH name LOOP AS (...)`', false, 1),
       ('`RECURSIVE WITH name AS (...)`', false, 2),
       ('`CREATE RECURSIVE TABLE name AS (...)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 43] (recursive CTE structure) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A recursive CTE must contain:',
         'A recursive CTE is composed of an anchor (non-recursive) member and a recursive member combined with `UNION` or `UNION ALL`. The recursive member references the CTE name.',
         'Anchor + recursive member via `UNION [ALL]`',
         'A recursive CTE has an anchor member and a recursive member combined with `UNION [ALL]`.',
         2
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `LOOP` statement', false, 0),
       ('Only a recursive member that calls itself', false, 1),
       ('An anchor member and a recursive member combined with `UNION` or `UNION ALL`', true, 2),
       ('A stored procedure wrapper', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 44] (CTE termination) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does a recursive CTE terminate?',
         'Recursion stops when the recursive member produces no new rows — the union grows by zero. If the recursive step always adds rows, you get infinite recursion (bounded only by engine limits or an explicit guard).',
         'When the recursive step adds no new rows',
         'Recursion stops once the recursive step returns no new rows; otherwise it loops forever.',
         3
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('After a fixed number of iterations (10)', false, 0),
       ('When the recursive step produces no new rows', true, 1),
       ('When a `BREAK` keyword is used', false, 2),
       ('When the anchor returns zero rows', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 46] (data-modifying CTE Postgres) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, what is special about `WITH ins AS (INSERT ... RETURNING *) SELECT * FROM ins`?',
         'PostgreSQL allows data-modifying statements (`INSERT`, `UPDATE`, `DELETE`) inside `WITH`, returning their `RETURNING` rows to the outer query. The modifications are visible only after the whole statement finishes.',
         'PG allows DML inside `WITH`',
         'PostgreSQL CTEs can contain `INSERT`/`UPDATE`/`DELETE` with `RETURNING`, exposing affected rows to the outer query.',
         4
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is illegal in PostgreSQL', false, 0),
       ('Postgres allows data-modifying statements inside `WITH`, exposing `RETURNING` rows', true, 1),
       ('It only works with temporary tables', false, 2),
       ('It only works inside stored procedures', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 48] (Postgres MATERIALIZED hint) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In modern PostgreSQL, what does the `MATERIALIZED` keyword on a CTE do?',
         'Since PostgreSQL 12, CTEs are inlined by default. Writing `AS MATERIALIZED` forces the optimizer to compute the CTE separately and reuse the result, like the old default behaviour.',
         'Forces the CTE to be materialized',
         '`MATERIALIZED` forces a CTE to be evaluated once and reused, overriding PostgreSQL 12+''s default inlining.',
         5
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Disables the CTE entirely', false, 0),
       ('Forces the optimizer to materialize the CTE rather than inline it', true, 1),
       ('Creates a permanent materialized view', false, 2),
       ('Has no effect — it is purely cosmetic', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 49] (CTE recursive example) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Recursive CTEs are commonly used to traverse which data structure?',
         'Recursive CTEs are the standard way to walk hierarchical / tree-shaped data such as org charts, threaded comments, and bill-of-materials trees.',
         'Hierarchies / trees',
         'Recursive CTEs are commonly used to traverse hierarchical data such as trees and graphs.',
         6
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Flat lookup tables', false, 0),
       ('Static enum tables', false, 1),
       ('Hierarchical / tree-structured data', true, 2),
       ('Materialized views', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 55] (frame default) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For a window with `ORDER BY` but no explicit frame, what is the default frame?',
         'Per the SQL standard, the default frame when `ORDER BY` is present is `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`. Tied rows share the same frame edge.',
         '`RANGE UNBOUNDED PRECEDING → CURRENT ROW`',
         'The default frame with `ORDER BY` is `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`.',
         7
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`', false, 0),
       ('`ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`', false, 1),
       ('`RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`', true, 2),
       ('Whatever the engine picks for performance', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 62] (hash index) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A hash index is best suited for which operation?',
         'Hash indexes provide O(1) lookups for exact equality matches but cannot answer range queries or ordered scans. B-tree handles both.',
         'Equality lookups only',
         'Hash indexes accelerate equality lookups only; they cannot serve range queries.',
         8
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Range scans', false, 0),
       ('Ordered scans for `ORDER BY`', false, 1),
       ('Exact equality lookups', true, 2),
       ('Prefix-match `LIKE ''abc%''`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 63] (covering index) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What makes an index "covering" for a query?',
         'A covering index contains all columns referenced by the query (in the `WHERE`, `SELECT`, and `ORDER BY`). The engine can answer using the index alone, skipping the heap lookup ("index-only scan").',
         'Index alone has every needed column',
         'A covering index contains every column the query needs, allowing an index-only scan without touching the table heap.',
         9
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It includes every column referenced by the query so the heap isn''t needed', true, 0),
       ('It is partitioned by primary key', false, 1),
       ('It uses a hash function', false, 2),
       ('It is created on a materialized view', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 66] (function-based index pitfall) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `WHERE LOWER(email) = ''a@b.com''` often fail to use an index on `email`?',
         'Wrapping the column in a function makes the predicate non-SARGable for a plain index on `email`. You either need a functional index on `LOWER(email)` or to store/match the lowercased form directly.',
         'Function wraps the column → not SARGable',
         'A function on the indexed column prevents normal index use unless you have a matching functional index.',
         10
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Indexes don''t support text columns', false, 0),
       ('`LOWER(email)` makes the predicate non-SARGable — needs a functional index', true, 1),
       ('`=` is not supported on `text`', false, 2),
       ('PostgreSQL ignores indexes when `LOWER` is involved by configuration default', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 67] (leftmost prefix) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'With a composite B-tree index on `(a, b, c)`, which query can use the index for a sorted range scan?',
         'B-tree composite indexes are used by leftmost-prefix matching. A query filtering on `a` (and optionally `b`, then `c`) can use the index; filtering on `b` alone usually cannot.',
         'Filters must start at leftmost column',
         'Composite B-tree indexes serve queries that filter on a leftmost prefix of the index columns.',
         11
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WHERE b = ?`', false, 0),
       ('`WHERE c = ?`', false, 1),
       ('`WHERE a = ? AND b = ?`', true, 2),
       ('`WHERE a + b = ?`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 69] (partial index) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a "partial index" in PostgreSQL?',
         'A partial index includes a `WHERE` predicate so it only stores rows satisfying that predicate, e.g. `CREATE INDEX ... ON t(col) WHERE active`. It''s smaller and faster for queries that match the predicate.',
         'Index over a `WHERE`-filtered subset',
         'A partial index stores only the rows matching a `WHERE` predicate, making it smaller and faster for matching queries.',
         12
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An index that only covers some columns of the row', false, 0),
       ('An index defined with a `WHERE` predicate, indexing only the matching rows', true, 1),
       ('A backup of an existing index', false, 2),
       ('An index that is rebuilt lazily', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 72] (READ COMMITTED) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'PostgreSQL''s default isolation level is:',
         'PostgreSQL defaults to `READ COMMITTED`. Each statement sees a snapshot taken at its start, so it can never read uncommitted data from another transaction.',
         '`READ COMMITTED`',
         'PostgreSQL''s default isolation level is `READ COMMITTED`.',
         13
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`READ UNCOMMITTED`', false, 0),
       ('`READ COMMITTED`', true, 1),
       ('`REPEATABLE READ`', false, 2),
       ('`SERIALIZABLE`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 73] (dirty read) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A "dirty read" is allowed only under which standard isolation level?',
         'Only `READ UNCOMMITTED` permits seeing uncommitted writes from other transactions. PostgreSQL maps `READ UNCOMMITTED` to `READ COMMITTED`, so it never actually permits dirty reads.',
         '`READ UNCOMMITTED`',
         'Dirty reads are only permitted under `READ UNCOMMITTED` in the SQL standard.',
         14
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`READ COMMITTED`', false, 0),
       ('`REPEATABLE READ`', false, 1),
       ('`SERIALIZABLE`', false, 2),
       ('`READ UNCOMMITTED`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 74] (phantom read) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which isolation level prevents phantom reads in the SQL standard?',
         'The SQL standard says `SERIALIZABLE` prevents phantoms, while `REPEATABLE READ` may still permit them. Note: PostgreSQL''s `REPEATABLE READ` (snapshot isolation) actually prevents phantoms.',
         '`SERIALIZABLE`',
         'In the SQL standard, `SERIALIZABLE` prevents phantom reads (PostgreSQL''s `REPEATABLE READ` also does).',
         15
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`READ UNCOMMITTED`', false, 0),
       ('`READ COMMITTED`', false, 1),
       ('`SERIALIZABLE`', true, 2),
       ('`REPEATABLE READ` per the standard', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 75] (deadlock) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A deadlock between two transactions typically happens when:',
         'A deadlock occurs when two transactions each hold a lock the other needs, forming a cycle. Most DBMSs detect this and abort one transaction with a deadlock error.',
         'Each holds a lock the other needs',
         'Deadlocks arise when transactions hold locks the others need, forming a cycle the engine breaks by aborting one.',
         16
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both run the same query', false, 0),
       ('Each holds a lock the other is waiting for, forming a cycle', true, 1),
       ('A query is too long', false, 2),
       ('They are connected over slow network', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 76] (FOR UPDATE) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `SELECT ... FOR UPDATE` do?',
         'It locks the selected rows for the rest of the current transaction so other transactions can''t update or delete them until you commit or roll back.',
         'Locks selected rows for update',
         '`FOR UPDATE` row-locks the selected rows until the transaction ends, blocking concurrent writes.',
         17
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Auto-commits the transaction', false, 0),
       ('Locks the selected rows for update by the current transaction', true, 1),
       ('Returns rows in update order', false, 2),
       ('Marks rows as modified without actually updating them', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 79] (long transactions) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why are long-running transactions a problem in PostgreSQL?',
         'They hold MVCC snapshots open, which prevents `VACUUM` from cleaning up dead tuples and causes table bloat, and they hold locks longer, increasing contention.',
         'Block vacuum, bloat, hold locks',
         'Long transactions block `VACUUM`, cause bloat, and hold locks longer — hurting throughput.',
         18
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They can''t be rolled back', false, 0),
       ('They prevent `VACUUM` from reclaiming dead tuples and hold locks longer', true, 1),
       ('They use a different protocol', false, 2),
       ('They are committed twice', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 82] (UNIQUE NULL) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In PostgreSQL, how does a `UNIQUE` constraint treat multiple NULL values?',
         'Standard PostgreSQL treats NULLs as distinct, so multiple NULLs are allowed in a `UNIQUE` column. Postgres 15+ adds `UNIQUE NULLS NOT DISTINCT` to disallow that.',
         'NULLs are distinct → multiple allowed',
         'PostgreSQL treats NULLs as distinct in `UNIQUE`, allowing multiple NULLs unless `NULLS NOT DISTINCT` is specified.',
         19
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Multiple NULLs are allowed because NULLs are treated as distinct', true, 0),
       ('Only one NULL is allowed', false, 1),
       ('NULLs are forbidden in `UNIQUE` columns', false, 2),
       ('NULLs are stored as 0', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 94] (three-valued logic) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In SQL three-valued logic, what is `TRUE AND UNKNOWN`?',
         'Following three-valued logic truth tables: `TRUE AND UNKNOWN` is UNKNOWN because the result depends on the unknown value, whereas `FALSE AND UNKNOWN` is FALSE because false short-circuits.',
         'UNKNOWN',
         '`TRUE AND UNKNOWN` is UNKNOWN; only `FALSE AND UNKNOWN` short-circuits to FALSE.',
         20
  from modules where slug = 'sql-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('TRUE', false, 0),
       ('FALSE', false, 1),
       ('UNKNOWN', true, 2),
       ('A runtime error', false, 3)
     ) as c(label, is_correct, order_index);
