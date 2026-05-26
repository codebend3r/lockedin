-- 006_seed_more_modules.sql
-- Add additional module rows: top-10 programming languages (alongside the
-- existing javascript + typescript modules), a real estate license module,
-- and six language-learning modules.
--
-- Only the module rows are seeded here. Question pools must be populated
-- in later migrations before these modules can run a quiz session.

insert into modules (slug, name, description, type, total_questions) values
  ('python',      'Python Test',              'Brush up on Python — data types, comprehensions, decorators, and gotchas.',     'dynamic', 100),
  ('c',           'C Test',                   'Sharpen C fundamentals — pointers, memory, structs, and undefined behavior.',   'dynamic', 100),
  ('cpp',         'C++ Test',                 'Master C++ — RAII, templates, the STL, and modern features.',                   'dynamic', 100),
  ('java',        'Java Test',                'Refresh Java — classes, generics, collections, and the JVM.',                   'dynamic', 100),
  ('csharp',      'C# Test',                  'Brush up on C# — types, LINQ, async, and .NET essentials.',                     'dynamic', 100),
  ('sql',         'SQL Test',                 'Practice SQL — joins, indexes, window functions, and query plans.',             'dynamic', 100),
  ('go',          'Go Test',                  'Sharpen Go — goroutines, channels, interfaces, and idioms.',                    'dynamic', 100),
  ('rust',        'Rust Test',                'Brush up on Rust — ownership, borrowing, traits, and lifetimes.',               'dynamic', 100),
  ('real-estate', 'Real Estate License Test', 'Prep for the real estate licensing exam — agency, contracts, finance, and ethics.', 'dynamic', 100),
  ('english',     'English',                  'Vocabulary, grammar, and idioms — build fluency through practice.',             'dynamic', 500),
  ('spanish',     'Spanish',                  'Vocabulary, grammar, and conjugation — practice Spanish daily.',                'dynamic', 500),
  ('french',      'French',                   'Vocabulary, grammar, and conjugation — practice French daily.',                 'dynamic', 500),
  ('japanese',    'Japanese',                 'Hiragana, katakana, kanji, vocabulary, and grammar — practice Japanese daily.', 'dynamic', 500),
  ('italian',     'Italian',                  'Vocabulary, grammar, and conjugation — practice Italian daily.',                'dynamic', 500),
  ('portuguese',  'Portuguese',               'Vocabulary, grammar, and conjugation — practice Portuguese daily.',             'dynamic', 500);
