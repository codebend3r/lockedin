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
  ('c',           'C',                        'Sharpen C fundamentals — pointers, memory, structs, and undefined behavior.',   'dynamic', 100),
  ('cpp',         'C++',                      'Master C++ — RAII, templates, the STL, and modern features.',                   'dynamic', 100),
  ('java',        'Java',                     'Refresh Java — classes, generics, collections, and the JVM.',                   'dynamic', 100),
  ('csharp',      'C#',                       'Brush up on C# — types, LINQ, async, and .NET essentials.',                     'dynamic', 100),
  ('sql',         'SQL',                      'Practice SQL — joins, indexes, window functions, and query plans.',             'dynamic', 100),
  ('go',          'Go',                       'Sharpen Go — goroutines, channels, interfaces, and idioms.',                    'dynamic', 100),
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
