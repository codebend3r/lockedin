-- 007_seed_python.sql
-- Python module: 100 quiz questions

-- Question 0 (type of True) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `type(True)` return in Python?',
         '`bool` is a subclass of `int`, but `type(True)` returns the class `bool` itself, not `int`.',
         '`<class ''bool''>`',
         '`type(True)` returns `<class ''bool''>` because `True` is a `bool` instance.',
         0
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`<class ''int''>`', false, 0),
       ('`<class ''bool''>`', true, 1),
       ('`<class ''bool''>` and `<class ''int''>`', false, 2),
       ('`True`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (truthiness of empty containers) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these values is truthy in Python?',
         'Empty containers, the integer `0`, and `None` are all falsy. A list containing one falsy element is still a non-empty list, so it is truthy.',
         '`[False]` is truthy',
         'A non-empty container is truthy regardless of what its elements are.',
         1
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0`', false, 0),
       ('`[]`', false, 1),
       ('`[False]`', true, 2),
       ('`None`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (None comparison) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the idiomatic way to check that a variable `x` is `None`?',
         '`None` is a singleton, so identity comparison with `is` is correct and preferred. `==` can be overridden by `__eq__`, making it unreliable.',
         '`x is None`',
         'Always use `is None` (or `is not None`) rather than `== None`.',
         2
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`x == None`', false, 0),
       ('`x is None`', true, 1),
       ('`x.is_none()`', false, 2),
       ('`type(x) == None`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (int vs float division) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Python 3, what is the result of `7 / 2`?',
         'The `/` operator always performs true division in Python 3, returning a `float`. Use `//` for floor division.',
         '`3.5`',
         '`/` is true division (float result); `//` is floor division.',
         3
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`3`', false, 0),
       ('`3.5`', true, 1),
       ('`4`', false, 2),
       ('`3.0`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (chained comparison) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the expression `1 < 2 < 3` evaluate to?',
         'Python supports chained comparisons; `a < b < c` is shorthand for `a < b and b < c`. Both sub-comparisons hold, so the result is `True`.',
         '`True`',
         'Chained comparisons in Python are conjunctions of adjacent pair comparisons.',
         4
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`True`', true, 0),
       ('`False`', false, 1),
       ('`SyntaxError`', false, 2),
       ('`1`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (bool is int subclass) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `isinstance(True, int)` return?',
         '`bool` is a subclass of `int` in Python, so `True` is also an `int` instance and arithmetically equal to `1`.',
         '`True`',
         '`bool` inherits from `int`; `True == 1` and `False == 0`.',
         5
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`False`', false, 0),
       ('`True`', true, 1),
       ('`TypeError`', false, 2),
       ('`None`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (identity vs equality of small ints) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which operator checks whether two names refer to the same object in memory?',
         '`is` tests object identity (same `id()`); `==` tests value equality via `__eq__`. They are not interchangeable.',
         '`is`',
         '`is` compares identity, `==` compares value.',
         6
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`==`', false, 0),
       ('`=`', false, 1),
       ('`is`', true, 2),
       ('`equals()`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (immutable types) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these built-in types is immutable?',
         'Tuples, strings, frozensets, and numbers are immutable. `list`, `dict`, and `set` are mutable.',
         '`tuple` is immutable',
         '`tuple`, `str`, `frozenset`, and numeric types are immutable.',
         7
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`list`', false, 0),
       ('`dict`', false, 1),
       ('`set`', false, 2),
       ('`tuple`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (None return) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A function with no explicit `return` statement returns what value?',
         'If a function reaches the end without `return` (or executes a bare `return`), Python implicitly returns `None`.',
         '`None`',
         'A function without an explicit return value returns `None`.',
         8
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0`', false, 0),
       ('`None`', true, 1),
       ('`False`', false, 2),
       ('an empty string', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (NaN equality) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `float(''nan'') == float(''nan'')` evaluate to?',
         'By the IEEE 754 standard, `NaN` is never equal to anything, including itself. Use `math.isnan()` to test for `NaN`.',
         '`False`',
         '`NaN` is not equal to itself; use `math.isnan` to detect it.',
         9
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`True`', false, 0),
       ('`False`', true, 1),
       ('`None`', false, 2),
       ('raises `ValueError`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (string immutability) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you execute `s = ''abc''; s[0] = ''A''`?',
         'Strings are immutable in Python, so item assignment is not supported and raises `TypeError`.',
         '`TypeError`',
         'Strings are immutable; you cannot assign to individual characters.',
         10
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`s` becomes `''Abc''`', false, 0),
       ('Raises `TypeError`', true, 1),
       ('Raises `IndexError`', false, 2),
       ('Silently does nothing', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (slicing) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the value of `''hello''[1:4]`?',
         'Slice `[1:4]` returns characters at indices 1, 2, and 3 (the stop index is exclusive).',
         '`''ell''`',
         'String/sequence slicing is start-inclusive and stop-exclusive.',
         11
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''hell''`', false, 0),
       ('`''ello''`', false, 1),
       ('`''ell''`', true, 2),
       ('`''ellh''`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (reverse a string) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which idiomatic expression reverses a string `s`?',
         'The slice `s[::-1]` walks the string from end to start with step -1, producing the reversed sequence.',
         '`s[::-1]`',
         '`s[::-1]` reverses any sequence by slicing with step -1.',
         12
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`s.reverse()`', false, 0),
       ('`reversed(s)`', false, 1),
       ('`s[::-1]`', true, 2),
       ('`s[-1:0]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (f-string expression) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `f''{2+3}''` evaluate to?',
         'F-strings (PEP 498) evaluate the embedded expression and format the result as a string.',
         '`''5''`',
         'F-strings interpolate evaluated expressions inside `{}`.',
         13
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''2+3''`', false, 0),
       ('`''5''`', true, 1),
       ('`5`', false, 2),
       ('`SyntaxError`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (str.split default) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'With no arguments, what does `''a  b\tc''.split()` return?',
         'Called with no arguments, `str.split()` splits on runs of whitespace and discards empty strings, unlike `split('' '')`.',
         '`[''a'', ''b'', ''c'']`',
         '`str.split()` with no args collapses any whitespace runs.',
         14
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[''a'', '''', ''b'', ''c'']`', false, 0),
       ('`[''a'', ''b'', ''c'']`', true, 1),
       ('`[''a  b\tc'']`', false, 2),
       ('`[''a'', '' '', ''b'', ''\t'', ''c'']`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (join) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the idiomatic way to concatenate a list of strings `parts` with commas?',
         '`str.join` is the standard way to combine an iterable of strings; it is more efficient than repeated `+` concatenation.',
         '`'',''.join(parts)`',
         'Use `separator.join(iterable_of_strings)` to combine strings efficiently.',
         15
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`parts.join('','')`', false, 0),
       ('`'',''.join(parts)`', true, 1),
       ('`str.concat(parts, '','')`', false, 2),
       ('`'' + '',''.join(parts)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (format spec width) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `f''{42:05d}''` produce?',
         'The format spec `05d` formats an integer with zero-padding to a minimum width of 5.',
         '`''00042''`',
         '`05d` zero-pads an integer to width 5.',
         16
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''42000''`', false, 0),
       ('`''   42''`', false, 1),
       ('`''00042''`', true, 2),
       ('`''42''`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (str.startswith) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which method checks whether a string `s` begins with a given prefix?',
         '`str.startswith(prefix)` returns `True` if `s` begins with `prefix`. It also accepts a tuple of candidate prefixes.',
         '`s.startswith(prefix)`',
         '`str.startswith` returns whether a string begins with a given prefix.',
         17
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`s.beginswith(prefix)`', false, 0),
       ('`s.starts(prefix)`', false, 1),
       ('`s.prefix(prefix)`', false, 2),
       ('`s.startswith(prefix)`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (str.strip) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `''  hi  ''.strip()` return?',
         '`str.strip()` removes leading and trailing whitespace (by default) and returns a new string. It does not mutate the original.',
         '`''hi''`',
         '`str.strip()` trims whitespace from both ends without mutating the original.',
         18
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''hi''`', true, 0),
       ('`''  hi''`', false, 1),
       ('`''hi  ''`', false, 2),
       ('`''hi\n''`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (f-string debug =) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Python 3.8+, what does the `=` specifier do in `f''{x=}''`?',
         'PEP 498 added the `=` debug specifier in 3.8: it prints the expression text, an `=`, and its `repr` — useful for quick debug logging.',
         'Prints `x=<repr(x)>`',
         'The `=` debug specifier in f-strings shows both the expression and its value.',
         19
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Asserts that `x` equals the literal value', false, 0),
       ('Prints the expression text and its value', true, 1),
       ('Quotes the value with `=`', false, 2),
       ('Has no effect; it is a syntax error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (list append vs extend) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `a = [1, 2]`, what does `a.append([3, 4])` make `a`?',
         '`list.append(x)` adds `x` as a single element. To add the items of an iterable, use `extend`.',
         '`[1, 2, [3, 4]]`',
         '`append` adds one element; `extend` adds each item of an iterable.',
         20
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[1, 2, 3, 4]`', false, 0),
       ('`[1, 2, [3, 4]]`', true, 1),
       ('`[[1, 2], [3, 4]]`', false, 2),
       ('`[1, 2]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (tuple of one) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the correct way to create a one-element tuple containing the value `42`?',
         'The comma — not the parentheses — makes a tuple. `(42)` is just the integer `42` in parentheses; `(42,)` is a 1-tuple.',
         '`(42,)`',
         'A trailing comma is required for a one-element tuple.',
         21
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`(42)`', false, 0),
       ('`tuple(42)`', false, 1),
       ('`{42}`', false, 2),
       ('`(42,)`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (range half-open) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `list(range(1, 5))` return?',
         '`range(start, stop)` yields integers from `start` up to but not including `stop`.',
         '`[1, 2, 3, 4]`',
         '`range` is half-open: `range(a, b)` includes `a` but excludes `b`.',
         22
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[1, 2, 3, 4, 5]`', false, 0),
       ('`[1, 2, 3, 4]`', true, 1),
       ('`[0, 1, 2, 3, 4]`', false, 2),
       ('`[2, 3, 4]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (list multiplication) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `[0] * 3` in Python?',
         'List multiplication repeats the items, producing `[0, 0, 0]`. Beware: with mutable inner objects this creates shared references.',
         '`[0, 0, 0]`',
         '`list * n` repeats the list contents `n` times.',
         23
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[0, 0, 0]`', true, 0),
       ('`[0, 3]`', false, 1),
       ('`[[0], [0], [0]]`', false, 2),
       ('`TypeError`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (list of mutable refs trap) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of `a = [[]] * 3; a[0].append(1); a`?',
         'Multiplying a list of mutables repeats the reference, so all three inner lists are the same object. Appending through one mutates them all.',
         '`[[1], [1], [1]]`',
         '`[mutable] * n` produces `n` references to the same object.',
         24
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[[1], [], []]`', false, 0),
       ('`[[1], [1], [1]]`', true, 1),
       ('`[[], [], [1]]`', false, 2),
       ('Raises `IndexError`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (tuple mutation) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following raises `TypeError`?',
         'Tuples are immutable: item assignment is not allowed and raises `TypeError`. `+` returns a new tuple, which is fine.',
         '`t[0] = 5` on a tuple',
         'Tuples do not support item assignment.',
         25
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[1, 2][0] = 5`', false, 0),
       ('`(1, 2) + (3,)`', false, 1),
       ('`(1, 2)[0] = 5`', true, 2),
       ('`list((1, 2))`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (list comprehension) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `[x * x for x in range(4)]` produce?',
         'The comprehension applies `x * x` to each `x` in `0, 1, 2, 3`, yielding `[0, 1, 4, 9]`.',
         '`[0, 1, 4, 9]`',
         'List comprehensions build a list by applying an expression to each item of an iterable.',
         26
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[0, 1, 4, 9]`', true, 0),
       ('`[1, 4, 9, 16]`', false, 1),
       ('`[0, 2, 4, 6]`', false, 2),
       ('`[0, 1, 4, 9, 16]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (enumerate) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which built-in yields `(index, item)` pairs while iterating a sequence?',
         '`enumerate(iterable, start=0)` produces `(index, value)` tuples and is preferred over manually managing a counter.',
         '`enumerate`',
         'Use `enumerate(iterable)` instead of maintaining a manual index counter.',
         27
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`zip`', false, 0),
       ('`enumerate`', true, 1),
       ('`iter`', false, 2),
       ('`index`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (zip shortest) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `zip([1, 2, 3], [''a'', ''b''])` behave by default?',
         '`zip` stops at the shortest input, yielding `(1, ''a'')` and `(2, ''b'')`. Use `itertools.zip_longest` to pad to the longest.',
         'Stops at the shortest iterable',
         '`zip` truncates to the shortest input; `itertools.zip_longest` pads.',
         28
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pads the shorter iterable with `None`', false, 0),
       ('Raises `ValueError`', false, 1),
       ('Stops at the shortest iterable', true, 2),
       ('Repeats the shorter iterable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (negative indexing) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `[''a'', ''b'', ''c'', ''d''][-2]`?',
         'Negative indices count from the end. `-1` is the last element, `-2` is the second to last.',
         '`''c''`',
         'Negative indices in a sequence count back from the end.',
         29
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''a''`', false, 0),
       ('`''b''`', false, 1),
       ('`''c''`', true, 2),
       ('`''d''`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (dict literal duplicate keys) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `{''a'': 1, ''a'': 2}` evaluate to?',
         'Dict literals with duplicate keys keep the last value for that key; no error is raised.',
         '`{''a'': 2}`',
         'Duplicate keys in a dict literal silently keep the last value.',
         30
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`{''a'': 1}`', false, 0),
       ('`{''a'': 2}`', true, 1),
       ('`{''a'': [1, 2]}`', false, 2),
       ('Raises `KeyError`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (dict.get default) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the best way to read key `k` from a dict `d`, returning `0` if missing?',
         '`dict.get(key, default)` returns the value if the key exists, else `default`, without raising `KeyError`.',
         '`d.get(k, 0)`',
         'Use `dict.get(key, default)` for safe lookups with a fallback.',
         31
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`d[k] or 0`', false, 0),
       ('`d.get(k, 0)`', true, 1),
       ('`d.fetch(k, 0)`', false, 2),
       ('`d[k] if k else 0`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (dict ordering) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Since which Python version are regular `dict` objects guaranteed to preserve insertion order?',
         'CPython 3.6 preserved insertion order as an implementation detail; Python 3.7 made it a language guarantee.',
         'Python 3.7',
         'Insertion order in `dict` is a language guarantee starting with Python 3.7.',
         32
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Python 2.7', false, 0),
       ('Python 3.4', false, 1),
       ('Python 3.7', true, 2),
       ('Python 3.10', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (set union) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `{1, 2} | {2, 3}`?',
         'The `|` operator on sets computes the union — all unique elements from either set.',
         '`{1, 2, 3}`',
         '`|` is set union; `&` is intersection.',
         33
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`{2}`', false, 0),
       ('`{1, 2, 2, 3}`', false, 1),
       ('`{1, 2, 3}`', true, 2),
       ('`{1, 3}`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (set intersection) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `{1, 2, 3} & {2, 3, 4}`?',
         '`&` on sets computes the intersection — elements present in both sets.',
         '`{2, 3}`',
         '`&` returns the intersection of two sets.',
         34
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`{2, 3}`', true, 0),
       ('`{1, 4}`', false, 1),
       ('`{1, 2, 3, 4}`', false, 2),
       ('`set()`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (set difference) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `{1, 2, 3} - {2}`?',
         'Set difference `a - b` returns elements in `a` that are not in `b`.',
         '`{1, 3}`',
         '`-` returns the elements of the left set not present in the right set.',
         35
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`{1, 2, 3}`', false, 0),
       ('`{2}`', false, 1),
       ('`{1, 3}`', true, 2),
       ('`{}`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (empty set literal) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you create an empty `set`?',
         '`{}` is an empty `dict`, not an empty set. Use `set()` to create an empty set.',
         '`set()`',
         '`{}` is an empty dict; use `set()` for an empty set.',
         36
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`{}`', false, 0),
       ('`set()`', true, 1),
       ('`{None}`', false, 2),
       ('`[]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (dict comprehension) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `{x: x * x for x in range(3)}` evaluate to?',
         'Dict comprehensions use `{key_expr: value_expr for ...}`. Here keys are `0,1,2` and values are their squares.',
         '`{0: 0, 1: 1, 2: 4}`',
         'Dict comprehensions build a `dict` mapping each key expression to its value expression.',
         37
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`{0, 1, 4}`', false, 0),
       ('`{0: 0, 1: 1, 2: 4}`', true, 1),
       ('`[(0, 0), (1, 1), (2, 4)]`', false, 2),
       ('`{0: 0, 1: 2, 2: 4}`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (set unhashable element) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `{[1, 2], [3, 4]}` raise `TypeError`?',
         'Set elements must be hashable. Lists are mutable and unhashable, so they cannot be set members. Use tuples or frozensets instead.',
         'Lists are unhashable',
         'Set elements (and dict keys) must be hashable; `list` is not.',
         38
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sets cannot contain sequences', false, 0),
       ('Lists are unhashable', true, 1),
       ('Sets require strings', false, 2),
       ('You must call `set(...)` instead of using `{}`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (dict merge operator) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Python 3.9+, what does the `|` operator do between two dicts?',
         'PEP 584 added `d1 | d2` to merge two dicts; values from the right operand win on key conflicts.',
         'Merges two dicts',
         'Since 3.9 `dict | dict` returns a merged dict, right-hand wins on conflicts.',
         39
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Computes a dict intersection', false, 0),
       ('Raises `TypeError`', false, 1),
       ('Merges two dicts', true, 2),
       ('Compares dict keys', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (positional vs keyword) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `def f(a, b, c=10): ...`, which call is invalid?',
         'Positional arguments must come before keyword arguments in a call. `f(b=2, 3)` puts a positional after a keyword, which is a `SyntaxError`.',
         '`f(b=2, 3)`',
         'Positional arguments must precede keyword arguments in a call.',
         40
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`f(1, 2)`', false, 0),
       ('`f(1, 2, c=5)`', false, 1),
       ('`f(b=2, 3)`', true, 2),
       ('`f(1, b=2)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (*args) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Inside `def f(*args): ...`, what type is `args`?',
         '`*args` packs any extra positional arguments into a `tuple`. (Conversely, `**kwargs` packs extra keyword arguments into a `dict`.)',
         '`tuple`',
         '`*args` collects extra positional arguments into a tuple.',
         41
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`list`', false, 0),
       ('`tuple`', true, 1),
       ('`dict`', false, 2),
       ('`set`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (**kwargs) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Inside `def f(**kwargs): ...`, what type is `kwargs`?',
         '`**kwargs` packs extra keyword arguments into a `dict` mapping the parameter name (a `str`) to the supplied value.',
         '`dict`',
         '`**kwargs` collects extra keyword arguments into a dict.',
         42
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`tuple`', false, 0),
       ('`list`', false, 1),
       ('`dict`', true, 2),
       ('`NamedTuple`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 (default mutable arg trap) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `def append(item, target=[]): target.append(item); return target` considered buggy?',
         'Default argument values are evaluated once at function definition. A mutable default (`[]`) is shared across all calls, so state leaks between invocations. Use `None` and create a fresh list inside.',
         'Default `[]` is shared across calls',
         'Avoid mutable default arguments — they are evaluated once at definition.',
         43
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Default `[]` is shared across calls', true, 0),
       ('It cannot accept a custom target', false, 1),
       ('Lists are not allowed as defaults', false, 2),
       ('It returns a tuple instead of a list', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (LEGB scope) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In what order does Python resolve a name (the LEGB rule)?',
         'Python looks up names Local, Enclosing (nested function), Global, then Built-in.',
         'Local, Enclosing, Global, Built-in',
         'Name lookup order is Local → Enclosing → Global → Built-in.',
         44
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Built-in, Global, Enclosing, Local', false, 0),
       ('Global, Local, Enclosing, Built-in', false, 1),
       ('Local, Enclosing, Global, Built-in', true, 2),
       ('Local, Global, Built-in', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (global keyword) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `global x` do inside a function?',
         'It declares that assignments to `x` in the function refer to the module-level `x`, instead of creating a new local.',
         'Rebinds the name at module scope',
         '`global` lets a function assign to a module-level name rather than create a local.',
         45
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Imports `x` from another module', false, 0),
       ('Rebinds the name at module scope', true, 1),
       ('Makes `x` immutable', false, 2),
       ('Marks `x` as thread-local', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (nonlocal keyword) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a nested function, how do you assign to a name in the nearest enclosing (non-global) scope?',
         '`nonlocal name` declares that assignments to `name` target the nearest enclosing function scope, not local or global.',
         '`nonlocal`',
         'Use `nonlocal` to rebind a name in an enclosing function scope.',
         46
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`global`', false, 0),
       ('`outer`', false, 1),
       ('`nonlocal`', true, 2),
       ('`enclosing`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (lambda) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a valid `lambda` expression returning the square of `x`?',
         'A `lambda` consists of `lambda params: expression`. The body must be a single expression, not a statement.',
         '`lambda x: x * x`',
         '`lambda` defines an anonymous function with a single-expression body.',
         47
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`lambda x: return x * x`', false, 0),
       ('`lambda(x) => x * x`', false, 1),
       ('`lambda x: x * x`', true, 2),
       ('`def lambda(x): x * x`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (keyword-only arguments) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `def f(a, *, b): ...`, what does the bare `*` enforce?',
         'A bare `*` in the parameter list marks all subsequent parameters as keyword-only — they cannot be supplied positionally.',
         '`b` is keyword-only',
         'A bare `*` makes following parameters keyword-only.',
         48
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`b` is keyword-only', true, 0),
       ('`b` accepts any number of args', false, 1),
       ('`b` is optional', false, 2),
       ('`b` must be `None`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (positional-only arguments) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `/` in `def f(a, b, /, c): ...` (Python 3.8+) mean?',
         'PEP 570 introduced `/` in parameter lists: parameters before `/` are positional-only and cannot be passed by name.',
         '`a` and `b` are positional-only',
         'Parameters before `/` are positional-only (PEP 570, Python 3.8+).',
         49
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Division on the parameters', false, 0),
       ('`a` and `b` are positional-only', true, 1),
       ('`a` and `b` are optional', false, 2),
       ('Marks the end of the function body', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (__init__) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of `__init__` in a Python class?',
         '`__init__` initializes a newly created instance. The actual object is constructed by `__new__`; `__init__` then sets up state.',
         'Initialize a new instance',
         '`__init__` is the initializer that runs after `__new__` constructs the instance.',
         50
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Allocate memory for the class', false, 0),
       ('Define the class metaclass', false, 1),
       ('Initialize a new instance', true, 2),
       ('Run when the class is garbage collected', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (self) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the conventional first parameter `self` in an instance method represent?',
         '`self` is the instance the method is called on; Python passes it implicitly when you call `obj.method(...)`.',
         'The instance',
         '`self` is the instance bound to an instance method call.',
         51
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The class itself', false, 0),
       ('The instance', true, 1),
       ('The metaclass', false, 2),
       ('The module', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (super()) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `super().__init__(...)` do inside a subclass `__init__`?',
         '`super()` returns a proxy for the next class in the MRO. Calling `__init__` on it dispatches to the parent (or next cooperating class), letting inherited initialization run.',
         'Calls the parent class initializer',
         '`super().__init__()` runs the next class in the MRO''s initializer.',
         52
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Creates a new subclass', false, 0),
       ('Calls the parent class initializer', true, 1),
       ('Aliases `self` to the parent', false, 2),
       ('Has no effect at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (dunder repr vs str) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which dunder method should return an unambiguous, developer-oriented representation of an object?',
         '`__repr__` is for developers and should ideally be unambiguous (often eval-able). `__str__` is for end-user display and falls back to `__repr__` if not defined.',
         '`__repr__`',
         '`__repr__` is developer-facing and unambiguous; `__str__` is user-facing.',
         53
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`__str__`', false, 0),
       ('`__repr__`', true, 1),
       ('`__format__`', false, 2),
       ('`__bytes__`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (classmethod vs staticmethod) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the key difference between `@classmethod` and `@staticmethod`?',
         '`@classmethod` receives the class (`cls`) as the first argument; `@staticmethod` receives no implicit first argument.',
         '`classmethod` gets `cls`; `staticmethod` gets neither',
         '`classmethod` receives `cls`; `staticmethod` receives no implicit argument.',
         54
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both receive `self`', false, 0),
       ('Both receive `cls`', false, 1),
       ('`classmethod` gets `cls`; `staticmethod` gets neither', true, 2),
       ('They differ only in name', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (MRO) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which algorithm determines Python''s Method Resolution Order under multiple inheritance?',
         'CPython uses the C3 linearization algorithm to compute the MRO of a class.',
         'C3 linearization',
         'Python''s MRO is computed using the C3 linearization algorithm.',
         55
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Depth-first only', false, 0),
       ('Breadth-first only', false, 1),
       ('Random', false, 2),
       ('C3 linearization', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (dataclass decorator) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `@dataclass` decorator from `dataclasses` generate by default?',
         'It auto-generates `__init__`, `__repr__`, and `__eq__` from the class''s annotated fields. Other behaviors are opt-in via parameters.',
         '`__init__`, `__repr__`, `__eq__`',
         '`@dataclass` autogenerates `__init__`, `__repr__`, and `__eq__` based on annotations.',
         56
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`__init__`, `__repr__`, `__eq__`', true, 0),
       ('Only `__init__`', false, 1),
       ('`__init__` and `__hash__`', false, 2),
       ('No methods; only field validation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (property decorator) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `@property` decorator do?',
         '`@property` turns a method into a managed attribute: accessing `obj.attr` calls the method, while `obj.attr = x` requires a corresponding `@attr.setter` (or it raises `AttributeError`).',
         'Turns a method into a read-only attribute',
         '`@property` exposes a method as a managed (default read-only) attribute.',
         57
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marks an attribute as private', false, 0),
       ('Caches a method''s return value forever', false, 1),
       ('Turns a method into a read-only attribute', true, 2),
       ('Makes the class immutable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (isinstance vs type ==) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `isinstance(x, Base)` usually preferable to `type(x) == Base`?',
         '`isinstance` is True for subclasses too, supporting polymorphism. `type(x) == Base` only matches the exact class and breaks subclass usage.',
         '`isinstance` respects subclasses',
         '`isinstance` matches subclasses; `type(x) == X` does not.',
         58
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is faster', false, 0),
       ('It respects subclasses', true, 1),
       ('It avoids importing `type`', false, 2),
       ('It returns `int` instead of `bool`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (slots) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does declaring `__slots__` on a class do?',
         '`__slots__` replaces per-instance `__dict__` with a fixed set of attribute slots, saving memory and disallowing dynamic attribute creation outside the slot names.',
         'Restricts allowed attributes and saves memory',
         '`__slots__` limits attribute names and removes the per-instance `__dict__`.',
         59
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marks methods as final', false, 0),
       ('Restricts allowed attributes and saves memory', true, 1),
       ('Auto-generates `__init__`', false, 2),
       ('Enables slot-based pattern matching', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 (generator function) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A function containing a `yield` statement is called what?',
         'Any function with `yield` becomes a generator function: calling it returns a generator object, an iterator that produces values lazily.',
         'A generator function',
         'Functions that use `yield` are generator functions and return generator iterators.',
         60
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A coroutine', false, 0),
       ('A decorator', false, 1),
       ('A generator function', true, 2),
       ('A class method', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (generator expression) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `(x*x for x in r)` and `[x*x for x in r]`?',
         'Parentheses build a generator expression (lazy, one-shot iterator). Brackets build a fully materialized list immediately.',
         '`(...)` is a lazy generator; `[...]` is a list',
         'Parentheses give a generator; brackets give a list.',
         61
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are equivalent', false, 0),
       ('`(...)` is a lazy generator; `[...]` is a list', true, 1),
       ('`(...)` is a tuple', false, 2),
       ('`[...]` is lazy and `(...)` is eager', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (yield from) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `yield from iterable` do inside a generator?',
         '`yield from` delegates to a subiterator, yielding all its values and forwarding `send`/`throw`/return values. Equivalent in effect to `for x in iterable: yield x` but with full delegation semantics.',
         'Delegates iteration to another iterable',
         '`yield from` delegates to a subiterator including value/exception forwarding.',
         62
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Imports a generator', false, 0),
       ('Delegates iteration to another iterable', true, 1),
       ('Returns the iterable verbatim', false, 2),
       ('Closes the current generator', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (iter and next) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which two built-in functions form the iterator protocol?',
         '`iter(obj)` produces an iterator; `next(it)` advances it and returns the next value (raising `StopIteration` when exhausted).',
         '`iter` and `next`',
         'The iterator protocol uses `iter()` to get an iterator and `next()` to advance.',
         63
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`iter` and `next`', true, 0),
       ('`begin` and `end`', false, 1),
       ('`first` and `rest`', false, 2),
       ('`open` and `close`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (StopIteration) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which exception signals the end of iteration?',
         'When an iterator is exhausted, `next()` raises `StopIteration` (or returns the supplied default if given).',
         '`StopIteration`',
         'Iterators raise `StopIteration` when there are no more values.',
         64
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`EndOfIteration`', false, 0),
       ('`StopIteration`', true, 1),
       ('`IndexError`', false, 2),
       ('`KeyError`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (set comprehension) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `{x % 3 for x in range(7)}` evaluate to?',
         'A set comprehension produces a `set` of the unique results. The values are `0,1,2,0,1,2,0` → `{0, 1, 2}`.',
         '`{0, 1, 2}`',
         'Set comprehensions deduplicate results into a set.',
         65
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[0, 1, 2, 0, 1, 2, 0]`', false, 0),
       ('`{0, 1, 2}`', true, 1),
       ('`{0, 1, 2, 0, 1, 2, 0}`', false, 2),
       ('`(0, 1, 2)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (generator state) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the main memory advantage of using a generator over building a list?',
         'A generator produces items lazily and holds only one value at a time, while a list materializes the entire sequence in memory.',
         'Produces values lazily, one at a time',
         'Generators stream items on demand and avoid storing the whole sequence.',
         66
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They sort the data automatically', false, 0),
       ('They run on a background thread', false, 1),
       ('Produces values lazily, one at a time', true, 2),
       ('They cache previously yielded values', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (try/except/else) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does the `else` clause of a `try` block execute?',
         'The `else` clause runs only if the `try` body completed without raising. Use it to keep the `try` minimal.',
         'When `try` raised no exception',
         '`else` on a `try` runs only when the `try` block succeeded.',
         67
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always, like `finally`', false, 0),
       ('When `try` raised no exception', true, 1),
       ('Only when an exception was caught', false, 2),
       ('Never; it is a syntax error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 68 (finally) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does the `finally` clause execute?',
         '`finally` runs whether the `try` completed normally, was interrupted by an exception, or executed `return`/`break`/`continue`. It is for guaranteed cleanup.',
         'Always, regardless of exceptions',
         '`finally` always runs, even after exceptions or `return`/`break`.',
         68
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always, regardless of exceptions', true, 0),
       ('Only when no exception was raised', false, 1),
       ('Only when an exception was caught', false, 2),
       ('Only when the program exits', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (re-raising) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Inside an `except` block, what does a bare `raise` statement do?',
         'A bare `raise` re-raises the currently handled exception, preserving its traceback. Useful when you want to log and then propagate.',
         'Re-raises the current exception',
         'A bare `raise` propagates the currently handled exception unchanged.',
         69
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Silently swallows the exception', false, 0),
       ('Raises `Exception()`', false, 1),
       ('Re-raises the current exception', true, 2),
       ('Has no effect', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (custom exception base) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which built-in class should custom exceptions normally inherit from?',
         'Custom user exceptions should subclass `Exception` (not `BaseException`, which also covers `KeyboardInterrupt` and `SystemExit`).',
         '`Exception`',
         'Custom exceptions should subclass `Exception`, not `BaseException`.',
         70
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`object`', false, 0),
       ('`Exception`', true, 1),
       ('`BaseException`', false, 2),
       ('`Error`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (with statement) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the main purpose of the `with` statement?',
         'A `with` block uses a context manager to acquire a resource on entry and release it on exit (even if an exception is raised), reducing boilerplate.',
         'Acquire and release a resource safely',
         '`with` ensures setup/teardown runs around a block via a context manager.',
         71
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Import a module locally', false, 0),
       ('Acquire and release a resource safely', true, 1),
       ('Start a background thread', false, 2),
       ('Catch exceptions globally', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (context manager protocol) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which two dunder methods does a context manager implement?',
         'A context manager defines `__enter__(self)` (run on entry) and `__exit__(self, exc_type, exc, tb)` (run on exit), enabling the `with` statement.',
         '`__enter__` and `__exit__`',
         'Context managers implement `__enter__` and `__exit__`.',
         72
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`__open__` and `__close__`', false, 0),
       ('`__init__` and `__del__`', false, 1),
       ('`__enter__` and `__exit__`', true, 2),
       ('`__begin__` and `__end__`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (exception group) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which Python version introduced `except*` for catching exception groups?',
         'PEP 654 added `ExceptionGroup` and the `except*` syntax in Python 3.11 to handle multiple unrelated exceptions raised together (common in `asyncio`).',
         'Python 3.11',
         '`except*` and `ExceptionGroup` were added in Python 3.11.',
         73
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Python 3.8', false, 0),
       ('Python 3.10', false, 1),
       ('Python 3.11', true, 2),
       ('Python 3.12', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 74 (raise from) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `raise NewError(...) from original` do?',
         'It raises `NewError` and sets `__cause__` to the original exception, so tracebacks show "The above exception was the direct cause of the following exception".',
         'Chains the original exception as the cause',
         '`raise ... from original` sets `__cause__`, producing an explicit exception chain.',
         74
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Suppresses the original exception silently', false, 0),
       ('Chains the original exception as the cause', true, 1),
       ('Renames the original exception class', false, 2),
       ('Re-imports the original module', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (decorator syntax) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `@deco` above `def f(): ...` syntactic sugar for?',
         'A decorator wraps the function: `@deco` followed by `def f` is equivalent to `f = deco(f)`.',
         '`f = deco(f)`',
         '`@deco` on `def f` is shorthand for `f = deco(f)`.',
         75
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`deco = f`', false, 0),
       ('`f = deco(f)`', true, 1),
       ('`deco(f)()`', false, 2),
       ('A type annotation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (closure capture) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a closure in Python capture by default?',
         'Nested functions capture variables by reference (binding the name in the enclosing scope), not by value. Late-binding inside loops is a common pitfall.',
         'Free variables by reference',
         'Closures capture enclosing names by reference (late binding).',
         76
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Variables by value at definition', false, 0),
       ('Free variables by reference', true, 1),
       ('Only globals', false, 2),
       ('Only function arguments', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 77 (functools.lru_cache) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `@functools.lru_cache` do to a decorated function?',
         '`lru_cache` memoizes return values keyed on the call''s arguments, evicting least-recently-used entries when the cache exceeds `maxsize`. Arguments must be hashable.',
         'Memoizes its return values',
         '`lru_cache` caches return values keyed by hashable arguments.',
         77
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Memoizes its return values', true, 0),
       ('Runs the function in a thread pool', false, 1),
       ('Profiles execution time', false, 2),
       ('Compiles it to C', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (functools.partial) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `functools.partial(f, 10)` return?',
         '`partial` returns a callable with some arguments pre-bound. Calling it invokes the original function with the bound args plus any new ones.',
         'A callable with `10` pre-bound as the first arg',
         '`partial` produces a callable with arguments pre-applied.',
         78
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The result of `f(10)`', false, 0),
       ('A callable with `10` pre-bound as the first arg', true, 1),
       ('A tuple `(f, 10)`', false, 2),
       ('A coroutine that calls `f(10)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (functools.wraps) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why should a decorator''s wrapper apply `@functools.wraps(func)`?',
         '`wraps` copies metadata (`__name__`, `__doc__`, `__wrapped__`, etc.) from the wrapped function onto the wrapper, preserving identity for introspection and docs.',
         'Preserve the wrapped function''s metadata',
         '`functools.wraps` preserves name and docstring of the wrapped function.',
         79
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Make the wrapper thread-safe', false, 0),
       ('Cache the wrapped function', false, 1),
       ('Preserve the wrapped function''s metadata', true, 2),
       ('Verify type hints', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 80 (decorator with arguments) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A decorator factory like `@retry(times=3)` is structured as which of the following?',
         'Parametrized decorators are functions that return a decorator: `retry(times=3)` returns the actual decorator, which then wraps the function.',
         'A function returning a decorator',
         'Parametrized decorators are factories: they return the actual decorator.',
         80
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A class with `__init__`', false, 0),
       ('A function returning a decorator', true, 1),
       ('A lambda that calls itself', false, 2),
       ('A coroutine awaiting the function', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (collections.Counter) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which class from `collections` is best for counting occurrences in an iterable?',
         '`collections.Counter` is a `dict` subclass that tallies hashable items and provides helpers like `most_common`.',
         '`Counter`',
         '`collections.Counter` tallies hashable items from any iterable.',
         81
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Counter`', true, 0),
       ('`OrderedDict`', false, 1),
       ('`namedtuple`', false, 2),
       ('`deque`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 82 (collections.deque) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why prefer `collections.deque` over a `list` for a queue?',
         '`deque` supports O(1) appends and pops from both ends. A `list`''s `pop(0)` is O(n).',
         'O(1) pops from both ends',
         '`deque` gives O(1) appends and pops from both ends.',
         82
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is sorted by default', false, 0),
       ('It is thread-safe in all operations', false, 1),
       ('O(1) pops from both ends', true, 2),
       ('It supports slicing', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (defaultdict) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `defaultdict(list)` do on a missing key access?',
         '`defaultdict(factory)` calls `factory()` to create a default value the first time a key is read, inserts it into the dict, and returns it.',
         'Creates an empty list as the default',
         '`defaultdict(factory)` lazily initializes missing keys via `factory()`.',
         83
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Raises `KeyError`', false, 0),
       ('Returns `None`', false, 1),
       ('Creates an empty list as the default', true, 2),
       ('Reuses the value of the last inserted key', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (itertools.chain) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `itertools.chain([1, 2], [3, 4])` yield?',
         '`itertools.chain` lazily concatenates multiple iterables into a single iterator.',
         '`1, 2, 3, 4`',
         '`itertools.chain` produces a flat iterator over multiple iterables.',
         84
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`[[1, 2], [3, 4]]`', false, 0),
       ('`1, 2, 3, 4`', true, 1),
       ('`(1, 3), (2, 4)`', false, 2),
       ('`1, 3, 2, 4`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 85 (pathlib.Path joining) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `pathlib`, which operator joins two `Path` components?',
         '`Path` overloads `/` to join components in a cross-platform way: `Path(''a'') / ''b''` gives `Path(''a/b'')`.',
         'The `/` operator',
         '`pathlib.Path` uses `/` as the path-join operator.',
         85
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`+`', false, 0),
       ('`%`', false, 1),
       ('The `/` operator', true, 2),
       ('`,`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (walrus operator) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the walrus operator `:=` do?',
         'PEP 572 (Python 3.8) introduced the assignment expression `:=`, which assigns a value to a name as part of a larger expression — useful in `while`/`if` headers and comprehensions.',
         'Assigns within an expression',
         'The walrus operator `:=` is an assignment expression introduced in 3.8.',
         86
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compares two values', false, 0),
       ('Defines a default argument', false, 1),
       ('Assigns within an expression', true, 2),
       ('Adds a type annotation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (match/case) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which Python version introduced structural pattern matching via `match`/`case`?',
         'PEP 634/635/636 introduced `match`/`case` in Python 3.10. It is much richer than a simple switch: it supports class, sequence, mapping, and capture patterns.',
         'Python 3.10',
         '`match`/`case` structural pattern matching was added in Python 3.10.',
         87
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Python 3.7', false, 0),
       ('Python 3.8', false, 1),
       ('Python 3.9', false, 2),
       ('Python 3.10', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 88 (match wildcard) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a `match` statement, what does the pattern `case _:` mean?',
         '`_` is the wildcard pattern and matches anything without binding. It is conventionally placed last as a catch-all.',
         'Matches anything (wildcard)',
         '`case _:` is the wildcard arm of a `match` statement.',
         88
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Matches only `None`', false, 0),
       ('Matches anything (wildcard)', true, 1),
       ('Matches the previously captured value', false, 2),
       ('Is a syntax error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (type hint Optional) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which annotation states that a value is either `int` or `None`?',
         '`Optional[X]` is equivalent to `Union[X, None]`. In Python 3.10+ you can also write `int | None`.',
         '`Optional[int]`',
         '`Optional[T]` is shorthand for `Union[T, None]`.',
         89
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Optional[int]`', true, 0),
       ('`Nullable[int]`', false, 1),
       ('`Maybe[int]`', false, 2),
       ('`Default[int]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (typing union pipe) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Since Python 3.10, what does `int | str` mean in a type annotation?',
         'PEP 604 added the `X | Y` union syntax in annotations, equivalent to `Union[X, Y]`.',
         '`Union[int, str]`',
         '`X | Y` in annotations is union syntax added in Python 3.10.',
         90
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Bitwise OR of types', false, 0),
       ('A tuple type', false, 1),
       ('`Union[int, str]`', true, 2),
       ('Always `int`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (itertools.product) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `itertools.product([1, 2], [''a'', ''b''])` yield?',
         '`product` returns the Cartesian product of input iterables: `(1, ''a'')`, `(1, ''b'')`, `(2, ''a'')`, `(2, ''b'')`.',
         'The Cartesian product',
         '`itertools.product` enumerates the Cartesian product of input iterables.',
         91
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The pairwise zip', false, 0),
       ('The Cartesian product', true, 1),
       ('Only `(1, ''a'')`', false, 2),
       ('A sum of the iterables', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (pathlib Path.read_text) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which `pathlib.Path` method reads a file''s entire contents as a string?',
         '`Path.read_text(encoding=...)` opens the file, reads it as text, and closes it — no explicit `with` needed for one-off reads.',
         '`read_text`',
         '`Path.read_text()` returns the whole file as a `str`.',
         92
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`open_text`', false, 0),
       ('`slurp`', false, 1),
       ('`read_text`', true, 2),
       ('`read_string`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (namedtuple) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `collections.namedtuple` mainly used for?',
         '`namedtuple` creates a lightweight immutable class whose fields are accessible by name as well as by index — like a tuple with named attributes.',
         'Named, immutable, tuple-like records',
         '`namedtuple` defines an immutable tuple subclass with named fields.',
         93
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sorting a list of tuples', false, 0),
       ('Caching function results', false, 1),
       ('Named, immutable, tuple-like records', true, 2),
       ('Type-checking arguments at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (json.dumps) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which function serializes a Python object to a JSON string?',
         '`json.dumps(obj)` returns a JSON string. `json.dump(obj, file)` writes JSON to a file-like object. `loads`/`load` go the other direction.',
         '`json.dumps`',
         '`json.dumps` serializes to a JSON string; `json.dump` writes to a file.',
         94
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`json.parse`', false, 0),
       ('`json.dumps`', true, 1),
       ('`json.loads`', false, 2),
       ('`json.encode`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (variable type annotation) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the syntax for annotating a variable `n` as an `int`?',
         'PEP 526 introduced variable annotations: `name: Type = value`. The annotation is not enforced at runtime by default.',
         '`n: int = 5`',
         'Variable annotations use the syntax `name: Type = value` (PEP 526).',
         95
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int n = 5`', false, 0),
       ('`n :: int = 5`', false, 1),
       ('`n = 5 as int`', false, 2),
       ('`n: int = 5`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (typing.Any) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the type `typing.Any` mean to a static type checker?',
         '`Any` is compatible with every type and every type is compatible with `Any`. It effectively disables type checking for that value.',
         'Compatible with everything; disables checking',
         '`Any` opts out of type checking — it is both subtype and supertype of every type.',
         96
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Same as `object`', false, 0),
       ('Compatible with everything; disables checking', true, 1),
       ('Means `None`', false, 2),
       ('A union of all built-ins', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (itertools.islice) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why use `itertools.islice` instead of slicing with `[]`?',
         '`islice` works on any iterator (including generators and infinite ones) and consumes lazily, whereas slice notation requires a sequence and materializes a copy.',
         'Works on iterators and is lazy',
         '`itertools.islice` slices iterators lazily; `[]` requires a sequence.',
         97
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It supports negative indices', false, 0),
       ('Works on iterators and is lazy', true, 1),
       ('It sorts the iterator first', false, 2),
       ('It is the only way to slice tuples', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (collections.OrderedDict relevance) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given that `dict` now preserves insertion order, when is `collections.OrderedDict` still useful?',
         '`OrderedDict` still adds `move_to_end` and treats order in `__eq__`, making it useful for LRU caches and order-sensitive equality, but plain `dict` covers most use cases.',
         'When you need `move_to_end` or order-sensitive equality',
         '`OrderedDict` still offers `move_to_end` and order-sensitive equality.',
         98
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Never; it has been removed', false, 0),
       ('Only on Python 2', false, 1),
       ('When you need `move_to_end` or order-sensitive equality', true, 2),
       ('It is required for `for` loops to be ordered', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (type hint deferred eval) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does adding `from __future__ import annotations` do?',
         'It causes all annotations in the module to be treated as strings and evaluated lazily, allowing forward references and avoiding import cycles at runtime. PEP 563 made this opt-in.',
         'Treats annotations as strings (lazy evaluation)',
         '`from __future__ import annotations` makes type hints lazy (string-form).',
         99
  from modules where slug = 'python'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Enables `match`/`case` early', false, 0),
       ('Treats annotations as strings (lazy evaluation)', true, 1),
       ('Forces runtime type checking', false, 2),
       ('Disables type hints entirely', false, 3)
     ) as c(label, is_correct, order_index);
