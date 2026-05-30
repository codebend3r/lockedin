-- 006_seed_more_modules.sql
-- Add additional module rows: top-10 programming languages (alongside the
-- existing javascript + typescript modules), a real estate license module,
-- and six language-learning modules.
--
-- Only the module rows are seeded here. Question pools must be populated
-- in later migrations before these modules can run a quiz session.

insert into modules (slug, name, description, type, total_questions) values
  ('python-1',    'Python — Level 1',         'Python basics — built-in types, operators, control flow, and core collection usage.', 'dynamic', 34),
  ('python-2',    'Python — Level 2',         'Intermediate Python — comprehensions, decorators, generators, context managers, and OOP basics.', 'dynamic', 54),
  ('python-3',    'Python — Level 3',         'Advanced Python — descriptors, metaclasses, `__slots__`, MRO subtleties, and typing internals.', 'dynamic', 12),
  ('c-1',         'C — Level 1',              'C basics — types, operators, pointers and arrays, control flow, and `printf`/`scanf`.', 'dynamic', 16),
  ('c-2',         'C — Level 2',              'Intermediate C — dynamic memory, structs/unions, function pointers, file I/O, and the preprocessor.', 'dynamic', 65),
  ('c-3',         'C — Level 3',              'Advanced C — undefined behavior, alignment, `restrict`/`volatile`, variadic args, and the memory model.', 'dynamic', 19),
  ('cpp-1',       'C++ — Level 1',            'C++ basics — references vs pointers, const correctness, basic STL containers, and modern syntax (`auto`, range-for, `nullptr`).', 'dynamic', 16),
  ('cpp-2',       'C++ — Level 2',            'Intermediate C++ — RAII, smart pointers, lambdas, move semantics, virtual dispatch, STL algorithms, and C++17 utilities (`optional`, `string_view`).', 'dynamic', 55),
  ('cpp-3',       'C++ — Level 3',            'Advanced C++ — templates and SFINAE/concepts, perfect forwarding, vtable internals, coroutines, ranges, `consteval`, and exception-safety subtleties.', 'dynamic', 29),
  ('java-1',      'Java — Level 1',           'Java basics — primitives vs objects, classes/interfaces, basic collections, and control flow.', 'dynamic', 24),
  ('java-2',      'Java — Level 2',           'Intermediate Java — generics, exceptions, lambdas + streams, `equals`/`hashCode`, and `Optional`.', 'dynamic', 56),
  ('java-3',      'Java — Level 3',           'Advanced Java — JVM internals, the memory model, type erasure, virtual threads, and reflection.', 'dynamic', 20),
  ('csharp-1',    'C# — Level 1',             'C# basics — types, properties, basic collections, control flow, and `using`.', 'dynamic', 32),
  ('csharp-2',    'C# — Level 2',             'Intermediate C# — LINQ, `async`/`await`, generics, delegates, records, and nullable refs.', 'dynamic', 54),
  ('csharp-3',    'C# — Level 3',             'Advanced C# — expression trees, `Span<T>`, async internals, source generators, and runtime details.', 'dynamic', 14),
  ('sql-1',       'SQL — Level 1',            'SQL basics — `SELECT`/`WHERE`/`JOIN`, mutations, and `GROUP BY` aggregates.', 'dynamic', 19),
  ('sql-2',       'SQL — Level 2',            'Intermediate SQL — subqueries, window functions, CTEs, `NULL` semantics, indexes, and transactions.', 'dynamic', 60),
  ('sql-3',       'SQL — Level 3',            'Advanced SQL — planner internals, recursive CTEs, isolation levels, advanced index types, and partitioning.', 'dynamic', 21),
  ('go-1',        'Go — Level 1',             'Go basics — types, slices, maps, strings, structs, functions, packages, and zero values.', 'dynamic', 40),
  ('go-2',        'Go — Level 2',             'Intermediate Go — goroutines, channels, `select`, interfaces, errors, generics, and method sets.', 'dynamic', 58),
  ('go-3',        'Go — Level 3',             'Advanced Go — nil-interface pitfalls and how interface values store a dynamic type plus a value copy.', 'dynamic', 2),
  ('rust-1',      'Rust — Level 1',           'Rust basics — types, mutability, ownership intuition, references, and basic structs/enums.', 'dynamic', 24),
  ('rust-2',      'Rust — Level 2',           'Intermediate Rust — borrow checker, lifetimes, traits, generics, iterators, and error handling with `?`.', 'dynamic', 59),
  ('rust-3',      'Rust — Level 3',           'Advanced Rust — async internals, `Pin`/`Send`/`Sync`, `PhantomData`, macros, `unsafe`, and trait-object layout.', 'dynamic', 17),
  ('real-estate', 'Real Estate License',      'Prep for the real estate licensing exam — agency, contracts, finance, and ethics.', 'dynamic', 100),
  ('english',     'English',                  'Vocabulary, grammar, and idioms — build fluency through practice.',             'dynamic', 500),
  ('spanish',     'Spanish',                  'Vocabulary, grammar, and conjugation — practice Spanish daily.',                'dynamic', 500),
  ('french',      'French',                   'Vocabulary, grammar, and conjugation — practice French daily.',                 'dynamic', 500),
  ('japanese',    'Japanese',                 'Hiragana, katakana, kanji, vocabulary, and grammar — practice Japanese daily.', 'dynamic', 500),
  ('italian',     'Italian',                  'Vocabulary, grammar, and conjugation — practice Italian daily.',                'dynamic', 500),
  ('portuguese',  'Portuguese',               'Vocabulary, grammar, and conjugation — practice Portuguese daily.',             'dynamic', 500);
