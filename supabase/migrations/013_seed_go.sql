-- 013_seed_go.sql
-- Go modules: split into three difficulty levels (40 / 58 / 2 questions). Module rows are in 006_seed_more_modules.sql.

-- ============================================================
-- go-1
-- ============================================================

-- Question 0 [orig 0] (zero value of int) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the zero value of a variable declared as `var n int` in Go?',
         'Go guarantees every declared variable starts at its type''s zero value. For numeric types like `int`, that zero value is `0`, not `nil` or an undefined value.',
         '`0` (numeric zero value)',
         'The zero value of an uninitialized `int` in Go is `0`.',
         0
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0`', true, 0),
       ('`nil`', false, 1),
       ('undefined', false, 2),
       ('`-1`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 1] (zero value of string) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the zero value of `var s string` in Go?',
         'In Go, a `string` is never `nil`. Its zero value is the empty string `""`, which has length 0.',
         'Empty string `""`',
         'The zero value of an uninitialized `string` is the empty string `""`.',
         1
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`nil`', false, 0),
       ('`"null"`', false, 1),
       ('`""` (empty string)', true, 2),
       ('a runtime panic on read', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 2] (var vs :=) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about `:=` (short variable declaration) in Go is correct?',
         'The `:=` operator can only be used inside a function body; it declares and initializes in one step. At package scope you must use `var` because every package-level declaration must begin with a keyword.',
         '`:=` is function-scope only',
         'The short declaration `:=` is restricted to function bodies; package-level variables require `var`.',
         2
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It can be used at package scope to declare globals.', false, 0),
       ('It is only valid inside a function body.', true, 1),
       ('It requires an explicit type on the left-hand side.', false, 2),
       ('It cannot be used with multiple return values.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 3] (type conversion not coercion) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `var i int = 10` and `var f float64`, how do you assign `i` to `f` in Go?',
         'Go has no implicit numeric conversion. Even between compatible numeric types you must convert explicitly: `f = float64(i)`. Assigning `i` directly is a compile-time error.',
         '`f = float64(i)` — explicit conversion required',
         'Go requires explicit type conversion between numeric types; there is no implicit coercion.',
         3
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`f = i` — Go converts implicitly', false, 0),
       ('`f = (float64)i`', false, 1),
       ('`f = i.(float64)`', false, 2),
       ('`f = float64(i)`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 4] (bool zero value) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the zero value of a `bool` variable in Go?',
         'Booleans default to `false` when declared without an initializer, consistent with Go''s rule that every type has a defined zero value.',
         '`false`',
         'The zero value of `bool` is `false`.',
         4
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`false`', true, 0),
       ('`true`', false, 1),
       ('`nil`', false, 2),
       ('`0`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 5] (pointer zero value) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the zero value of a pointer type such as `var p *int`?',
         'Pointer types, along with interfaces, slices, maps, channels, and function types, all have `nil` as their zero value. Dereferencing a `nil` pointer panics at runtime.',
         '`nil`',
         'Pointers in Go have a zero value of `nil`.',
         5
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0`', false, 0),
       ('`nil`', true, 1),
       ('undefined memory address', false, 2),
       ('a panic at declaration', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 6] (rune type alias) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Go, `rune` is an alias for which built-in type?',
         '`rune` is an alias for `int32` and represents a Unicode code point. It is distinct from `byte`, which is an alias for `uint8`.',
         '`rune` = `int32`',
         '`rune` is an alias for `int32` and represents a single Unicode code point.',
         6
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`uint8`', false, 0),
       ('`int64`', false, 1),
       ('`int32`', true, 2),
       ('`string`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 7] (byte type alias) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Go, `byte` is an alias for which type?',
         '`byte` is an alias for `uint8` — an 8-bit unsigned integer. It is commonly used when working with raw binary data or single-byte string elements.',
         '`byte` = `uint8`',
         '`byte` is an alias for `uint8`.',
         7
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`uint8`', true, 0),
       ('`int8`', false, 1),
       ('`uint16`', false, 2),
       ('`rune`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 8] (const vs var) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is true about `const` declarations in Go?',
         'Constants in Go must be assignable at compile time, so they can only hold values of basic types (booleans, numbers, strings). They cannot hold slices, maps, or any value computed at runtime.',
         '`const` = compile-time, basic types only',
         'Go `const` values must be known at compile time and are limited to basic kinds.',
         8
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They can hold slices and maps.', false, 0),
       ('They are evaluated lazily at first use.', false, 1),
       ('They must be assignable at compile time and limited to basic types.', true, 2),
       ('They can be reassigned with `:=`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 9] (string to []byte conversion) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `[]byte("hello")` produce in Go?',
         'The conversion creates a new byte slice containing the raw UTF-8 bytes of the string. For ASCII characters like in `"hello"`, you get one byte per character.',
         'A `[]byte` of the string''s UTF-8 bytes',
         'Converting a string to `[]byte` copies its UTF-8 byte representation into a new slice.',
         9
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A pointer to the string''s underlying bytes', false, 0),
       ('A `[]byte` containing the UTF-8 bytes of the string', true, 1),
       ('A `[]rune` of code points', false, 2),
       ('A compile-time error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 10] (slice length vs capacity) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between a slice''s length and its capacity in Go?',
         'A slice''s length is how many elements are currently accessible via indexing. Its capacity is how many elements the underlying array can hold starting from the slice''s first element — `append` can grow the slice up to capacity without reallocating.',
         'len = accessible elements; cap = underlying array size from start',
         'A slice''s length is the number of accessible elements; capacity is how far the slice could extend without reallocating.',
         10
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are always equal.', false, 0),
       ('Length is the underlying array size; capacity is in use.', false, 1),
       ('Length is current elements; capacity is how far the slice can grow without reallocating.', true, 2),
       ('Capacity is always exactly twice the length.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 11] (make slice) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `make([]int, 3, 5)` return?',
         '`make` with three arguments creates a slice with the given length and capacity. So this returns a slice of length 3 (with three zero `int` values) backed by an array of capacity 5.',
         'len=3, cap=5 `[]int` of zeroes',
         '`make([]int, 3, 5)` allocates a slice with length 3 and capacity 5, all elements zeroed.',
         11
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A slice with length 5 and capacity 3', false, 0),
       ('A slice with length 3 and capacity 5', true, 1),
       ('A slice with length 8', false, 2),
       ('A compile-time error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 15] (array vs slice) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does an array differ from a slice in Go?',
         'In Go, the array length is part of its type: `[3]int` and `[4]int` are different types. Arrays are values — assignment copies them. Slices are descriptors (pointer/length/capacity) over an array and are passed by reference-like semantics.',
         'Array length is in the type; arrays copy on assignment',
         'Arrays in Go have a fixed length baked into their type and are value types; slices are dynamic views over an underlying array.',
         12
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Arrays and slices behave identically.', false, 0),
       ('Arrays have a length that is part of the type; slices do not.', true, 1),
       ('Slices have a fixed length; arrays do not.', false, 2),
       ('Arrays are reference types; slices are value types.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 16] (out-of-bounds slice grows backing array?) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you index a slice out of bounds, e.g. `s[10]` when `len(s) == 3`?',
         'Slice indexing is bounds-checked at runtime. Indexing beyond `len(s)-1` causes a runtime panic of type `runtime.Error` with the message `index out of range`.',
         'Runtime panic: index out of range',
         'Out-of-range slice indexing triggers a runtime panic; it does not grow the slice.',
         13
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It returns the zero value silently.', false, 0),
       ('It grows the slice to that index.', false, 1),
       ('It produces a compile-time error.', false, 2),
       ('It panics at runtime with "index out of range".', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 17] (copy builtin) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the built-in `copy(dst, src)` return?',
         '`copy` copies elements from `src` to `dst` and returns the number of elements actually copied, which is `min(len(dst), len(src))`.',
         '`min(len(dst), len(src))`',
         '`copy` returns the number of elements copied — the minimum of the destination and source lengths.',
         14
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The new length of `dst`', false, 0),
       ('The number of elements copied (`min(len(dst), len(src))`)', true, 1),
       ('`true` if all elements fit, `false` otherwise', false, 2),
       ('Nothing — it returns no value', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 20] (nil map writes panic) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you write a key to a `nil` map in Go, e.g. `var m map[string]int; m["x"] = 1`?',
         'Reads from a `nil` map return the zero value, but writes panic at runtime with "assignment to entry in nil map". You must initialize a map with `make` or a literal before writing.',
         'Runtime panic on write',
         'Writing to a `nil` map panics at runtime; reads return the zero value.',
         15
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It silently allocates a new map.', false, 0),
       ('It panics with "assignment to entry in nil map".', true, 1),
       ('It returns a compile-time error.', false, 2),
       ('It writes successfully and the map becomes `{"x":1}`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 21] (map comma-ok lookup) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you distinguish a missing key from a key whose value happens to be the zero value in a Go map?',
         'A single-value lookup `m[key]` always returns the value (or the zero value for missing keys). The two-value form `v, ok := m[key]` returns a boolean indicating whether the key was actually present.',
         '`v, ok := m[key]`',
         'Use the comma-ok idiom `v, ok := m[key]` to detect missing keys reliably.',
         16
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compare the value to `nil`.', false, 0),
       ('Use `len(m)` to test the key.', false, 1),
       ('Use the two-value form: `v, ok := m[key]`.', true, 2),
       ('Use `defer m[key]`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 22] (map iteration order) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the guaranteed iteration order of a Go map?',
         'Go intentionally randomizes the iteration order of maps across runs to discourage code that depends on it. If you need stable order, collect and sort the keys explicitly.',
         'No defined order; randomized',
         'Go map iteration order is unspecified and randomized; sort the keys yourself when you need a stable order.',
         17
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Insertion order.', false, 0),
       ('Sorted by key.', false, 1),
       ('Sorted by hash of the key.', false, 2),
       ('Unspecified and intentionally randomized between iterations.', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 23] (delete builtin) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you remove a key from a Go map?',
         'The built-in `delete(m, key)` removes a key/value pair. If the key isn''t present, `delete` is a no-op. There is no return value.',
         '`delete(m, key)`',
         'Use the built-in `delete(m, key)` to remove an entry from a map.',
         18
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`delete(m, key)`', true, 0),
       ('`m[key] = nil`', false, 1),
       ('`m.remove(key)`', false, 2),
       ('`remove m[key]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 24] (map literal initialization) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which expression creates an initialized, writable map?',
         '`map[string]int{}` and `make(map[string]int)` both create non-`nil`, writable maps. `var m map[string]int` only declares a `nil` map — writing to it panics.',
         '`map[string]int{}` or `make(map[string]int)`',
         'Initialize maps with a literal `{}` or with `make` before writing to them.',
         19
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`var m map[string]int`', false, 0),
       ('`map[string]int{}`', true, 1),
       ('`map(string, int)`', false, 2),
       ('`new(map[string]int)` (and then writing to `*m`)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 26] (len on map) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `len(m)` return when `m` is a Go map?',
         '`len` on a map returns the current number of key/value pairs. It also works on `nil` maps, returning 0.',
         'Number of key/value pairs',
         '`len(m)` returns the number of entries currently stored in the map.',
         20
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The map''s internal bucket capacity', false, 0),
       ('The number of unique key types', false, 1),
       ('The number of key/value pairs in the map', true, 2),
       ('It panics — `len` is undefined on maps', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 30] (string immutability) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is true about Go strings?',
         'Go strings are immutable sequences of bytes. Indexing returns a `byte`, not a `rune`. To safely iterate by Unicode code point, use a `for range` loop, which decodes UTF-8.',
         'Immutable bytes; index = `byte`',
         'Strings in Go are immutable byte sequences; index access returns a single `byte`.',
         21
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are mutable arrays of bytes.', false, 0),
       ('They are immutable byte sequences; `s[i]` is a `byte`.', true, 1),
       ('They are arrays of `rune` values.', false, 2),
       ('They can be modified via slice expressions.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 33] (string concatenation) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For repeated string concatenation in a loop, which type from `strings` is the idiomatic, efficient choice?',
         '`strings.Builder` accumulates into an internal buffer and avoids the quadratic copying that comes from using `+=` in a loop. It exposes `WriteString`, `WriteRune`, and `String()`.',
         '`strings.Builder`',
         'Use `strings.Builder` to build strings efficiently in a loop and avoid quadratic allocation.',
         22
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`strings.Buffer`', false, 0),
       ('`strings.Concat`', false, 1),
       ('`strings.Builder`', true, 2),
       ('`strings.Join` (always, regardless of input)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 34] (strings.Split) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `strings.Split("a,,b", ",")` return?',
         '`strings.Split` includes empty substrings between adjacent separators. So splitting `"a,,b"` on `","` yields the three-element slice `["a", "", "b"]`.',
         '`["a", "", "b"]`',
         '`strings.Split` keeps empty entries from adjacent separators in its result.',
         23
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`["a", "b"]`', false, 0),
       ('`["a", "", "b"]`', true, 1),
       ('`["a,,b"]`', false, 2),
       ('A panic because of the empty field', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 35] (rune literal) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type and value of the literal `''A''` in Go?',
         'Single-quoted character literals in Go are `rune` (i.e., `int32`) values containing the Unicode code point. `''A''` is the integer 65.',
         '`rune` (= `int32`), value 65',
         'Single-quote character literals in Go are untyped rune constants representing a Unicode code point.',
         24
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`string` of length 1', false, 0),
       ('`byte` with value 65', false, 1),
       ('`rune` with value 65', true, 2),
       ('`int8` with value 65', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 38] (strings.Contains) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which standard library function checks whether one string contains another as a substring?',
         '`strings.Contains(s, substr)` returns a `bool`. It is the idiomatic check; `strings.Index` returning `-1` works too but is lower level.',
         '`strings.Contains`',
         'Use `strings.Contains(s, substr)` to test for substring membership in a string.',
         25
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`strings.Has`', false, 0),
       ('`strings.IndexOf`', false, 1),
       ('`strings.Substr`', false, 2),
       ('`strings.Contains`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 39] (raw string literal) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which delimiter creates a raw string literal in Go, where backslashes are taken verbatim?',
         'Backtick-delimited strings are *raw* string literals: escape sequences like `\n` are not interpreted, and the literal can span multiple lines. Double-quoted strings are interpreted literals.',
         'Backticks `...`',
         'Backtick-delimited strings are raw literals — no escape processing, multi-line allowed.',
         26
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Double quotes `"..."`', false, 0),
       ('Single quotes `''...''`', false, 1),
       ('Backticks `` `...` ``', true, 2),
       ('Triple double-quotes `"""..."""`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 40] (multiple return values) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a valid way to declare a Go function returning two values?',
         'Multiple return values are written as a parenthesized list of types: `func f() (int, error)`. They can also be named, but the parentheses are required for >1 return.',
         '`func f() (int, error)`',
         'Multi-return functions in Go use a parenthesized return-type list, e.g. `func f() (int, error)`.',
         27
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`func f() int, error`', false, 0),
       ('`func f() [int, error]`', false, 1),
       ('`func f() (int, error)`', true, 2),
       ('`func f() -> (int, error)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 42] (variadic spread) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `func sum(xs ...int) int` and `s := []int{1,2,3}`, how do you pass `s` as the variadic argument?',
         'The spread syntax is `sum(s...)`. It passes the slice directly as the variadic parameter, sharing its backing array, rather than wrapping the slice as a single element.',
         '`sum(s...)`',
         'Use the `...` spread operator to pass an existing slice as a variadic argument.',
         28
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`sum(s)`', false, 0),
       ('`sum(*s)`', false, 1),
       ('`sum(...s)`', false, 2),
       ('`sum(s...)`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 43] (defer order) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Go, in what order do deferred calls run when a function returns?',
         '`defer`red calls run in LIFO order: the last call deferred runs first when the enclosing function returns. This is convenient for paired resource acquisition and release.',
         'LIFO — last deferred runs first',
         'Deferred function calls run in reverse order of registration when the surrounding function returns.',
         29
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('FIFO — first deferred runs first', false, 0),
       ('LIFO — last deferred runs first', true, 1),
       ('Sorted by function name', false, 2),
       ('Concurrently in goroutines', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 45] (multiple return ignore) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you ignore one return value of a multi-return function in Go?',
         'The blank identifier `_` discards a value at the point of assignment. For example, `n, _ := strconv.Atoi(s)` ignores the error. Unused real variables are a compile error, but `_` is always allowed.',
         'Blank identifier `_`',
         'Use `_` (blank identifier) to explicitly discard a return value.',
         30
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Omit it from the left-hand side.', false, 0),
       ('Assign it to `nil`.', false, 1),
       ('Use the blank identifier `_`.', true, 2),
       ('Cast it to `void`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 47] (function values are first-class) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is true about functions in Go?',
         'Functions are first-class values. You can store them in variables, pass them as arguments, return them from other functions, and put them in slices, maps, and struct fields.',
         'First-class values',
         'Functions in Go are first-class values that can be assigned, passed, and returned like any other type.',
         31
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They cannot be assigned to variables.', false, 0),
       ('They are first-class values.', true, 1),
       ('They can only be defined at package scope.', false, 2),
       ('They must have at least one return value.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 55] (zero value of struct) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the zero value of a `struct` type with two `int` fields?',
         'A struct''s zero value is the composition of the zero values of each of its fields. For two `int` fields, both are `0`. Structs in Go are never `nil`.',
         'Each field at its zero value',
         'A struct''s zero value is a struct with every field set to its own zero value.',
         32
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`nil`', false, 0),
       ('A struct with each field at that field''s zero value.', true, 1),
       ('A runtime panic until initialized.', false, 2),
       ('A pointer to a heap-allocated struct.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 56] (new returns pointer) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the built-in `new(T)` return?',
         '`new(T)` allocates a zero-valued `T` and returns a `*T` pointing at it. It''s often used as `p := new(Point)` — equivalent to `p := &Point{}`.',
         '`*T` pointing at a zero-valued `T`',
         '`new(T)` allocates a zeroed `T` and returns a pointer to it.',
         33
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `T` value (not a pointer)', false, 0),
       ('A `*T` pointing at a zeroed `T`', true, 1),
       ('A `T` with all fields set to `nil`', false, 2),
       ('A `*T` pointing at uninitialized memory', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 89] (errors checked, not exceptions) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does Go handle expected failure modes from operations like file reads or HTTP calls?',
         'Go does not use exceptions for routine failures. Functions return an `error` value as their last result, and callers explicitly check it. Panics exist but are reserved for unrecoverable conditions.',
         'Return `error` values; check explicitly',
         'Expected failures are returned as `error` values that the caller is expected to check, not raised as exceptions.',
         34
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It raises checked exceptions like Java.', false, 0),
       ('It returns `error` values and expects callers to check them.', true, 1),
       ('It uses panics and `recover` for all failure paths.', false, 2),
       ('It uses sum types like Rust''s `Result`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 90] (go module file) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which file defines a Go module''s import path and dependencies?',
         '`go.mod` is the source of truth for a module: it declares the module path, Go language version, and the (potentially transitively-pinned) dependency set. `go.sum` records cryptographic hashes for verification.',
         '`go.mod`',
         '`go.mod` defines a module''s path, Go version, and dependency requirements.',
         35
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`package.json`', false, 0),
       ('`go.mod`', true, 1),
       ('`go.toml`', false, 2),
       ('`Cargo.lock`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 91] (go.sum) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `go.sum` file contain?',
         '`go.sum` stores cryptographic hashes of every module version (and its `go.mod`) the project depends on, including transitive deps. The `go` toolchain verifies downloaded modules against these hashes to prevent tampering.',
         'Checksums of dependency module versions',
         '`go.sum` records cryptographic checksums for dependency modules to verify downloads.',
         36
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A pretty-printed dependency tree.', false, 0),
       ('Cryptographic hashes of each dependency module version, used for verification.', true, 1),
       ('A cache of compiled artifacts.', false, 2),
       ('A list of public APIs exported by the module.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 92] (unexported identifiers) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What controls whether an identifier is exported from a Go package?',
         'In Go, identifiers that start with an uppercase letter are exported (visible to other packages). Lowercase identifiers are package-private. There are no `public`/`private` keywords.',
         'Capitalized = exported',
         'Identifiers beginning with an uppercase letter are exported from their package; lowercase ones are package-private.',
         37
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The presence of a `pub` keyword.', false, 0),
       ('The placement in a special `export.go` file.', false, 1),
       ('Whether its first letter is uppercase.', true, 2),
       ('Adding `// export:` above the declaration.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 93] (init function) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the role of `func init()` in a Go file?',
         '`init` functions run automatically when the package is initialized, after package-level variables are assigned and before `main`. Each file can have multiple `init` functions, and they are called in source-file order.',
         'Package init; runs before `main`',
         'A package''s `init` functions run on import, after var initializers and before `main`.',
         38
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s called by the user manually before using the package.', false, 0),
       ('It runs automatically on package initialization, before `main`.', true, 1),
       ('It registers the package with the Go runtime DNS.', false, 2),
       ('It''s the entry point of every Go program.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 95] (go build vs go run) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `go build` and `go run`?',
         '`go build` compiles the named packages and writes an executable to disk (for `main`) or just type-checks (for libraries). `go run` compiles to a temporary location and immediately executes the result, then cleans up.',
         '`build` keeps binary; `run` compiles + executes temp',
         '`go build` produces a binary; `go run` compiles and immediately runs from a temporary location.',
         39
  from modules where slug = 'go-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical.', false, 0),
       ('`go build` interprets the program; `go run` compiles it.', false, 1),
       ('`go build` writes a binary; `go run` compiles + runs from a temp location.', true, 2),
       ('`go run` is only for tests.', false, 3)
     ) as c(label, is_correct, order_index);

-- ============================================================
-- go-2
-- ============================================================

-- Question 0 [orig 12] (append may reallocate) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does `append` allocate a new backing array for a slice?',
         '`append` writes into the existing backing array when there is spare capacity. If `len + appended > cap`, the runtime allocates a new (typically larger) array and copies elements over, leaving the original array untouched.',
         'When `len + new > cap`',
         '`append` reallocates only when the result would exceed the current capacity.',
         0
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('On every call to `append`', false, 0),
       ('Only when appending to a `nil` slice', false, 1),
       ('When the new length would exceed the slice''s capacity', true, 2),
       ('When appending more than one element at a time', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 13] (slice sharing backing array) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you do `b := a[1:3]` and then write `b[0] = 99`?',
         'Slicing does not copy. `b` shares the same backing array as `a`, so writing through `b` modifies `a` too — `a[1]` becomes 99.',
         'Aliases share backing array',
         'A slice expression aliases the underlying array, so writes through one slice are visible through the other.',
         1
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It modifies a copy; `a` is unchanged.', false, 0),
       ('It modifies the shared backing array, changing `a[1]` to 99.', true, 1),
       ('It panics because slices are immutable.', false, 2),
       ('It only changes `b` if `cap(a) == len(a)`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 14] (nil slice vs empty) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is true about a `nil` slice in Go?',
         'A `nil` slice has length 0, capacity 0, and a `nil` underlying array pointer. You can still `append` to it — `append` will allocate as needed. Only reading or writing via indexing would be invalid.',
         '`nil` slice: len 0, cap 0, append OK',
         'A `nil` slice behaves like an empty slice for `len`, `cap`, and `append`; indexing it is invalid.',
         2
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('You cannot call `append` on it.', false, 0),
       ('It has length 0, capacity 0, and is safe to `append` to.', true, 1),
       ('It always panics when passed to `len`.', false, 2),
       ('It is identical to `[]int{0}`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 18] (slice three-index expression) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the three-index slice expression `s[low:high:max]` control?',
         'The optional third index sets the resulting slice''s capacity to `max - low`, while length remains `high - low`. This is used to prevent later `append`s from clobbering memory beyond what you intend to expose.',
         'Sets capacity = max − low',
         'The three-index form `s[low:high:max]` lets you bound the resulting slice''s capacity explicitly.',
         3
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sets the capacity of the resulting slice to `max - low`.', true, 0),
       ('Specifies a stride/step between elements.', false, 1),
       ('Reverses the slice when `max < high`.', false, 2),
       ('Allocates a new backing array of length `max`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 19] (passing slice to function) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If a function takes a `[]int` parameter and modifies its elements in place, what does the caller see?',
         'A slice header is copied when passed, but the header points to the same backing array. So element writes through the parameter are visible to the caller; only `append`s that reallocate are not.',
         'Element writes are visible; reallocating `append` is not',
         'Slices share their backing array across calls, so in-place element changes are visible to the caller.',
         4
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The caller''s slice is unchanged; slices are passed by value.', false, 0),
       ('The element changes are visible because the backing array is shared.', true, 1),
       ('The caller sees changes only if the slice is `nil`.', false, 2),
       ('The compiler forbids passing slices by value.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 25] (map key types) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which types are valid as Go map keys?',
         'Any comparable type can be a map key — booleans, numbers, strings, pointers, channels, interfaces (whose dynamic type is comparable), and structs/arrays of comparable types. Slices, maps, and functions are not comparable and cannot be keys.',
         'Comparable types only (no slices/maps/funcs)',
         'Map keys must be comparable; slices, maps, and functions are not allowed as keys.',
         5
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any type, including slices and maps.', false, 0),
       ('Only `string` and integer types.', false, 1),
       ('Any comparable type — but not slices, maps, or functions.', true, 2),
       ('Only types that implement `Stringer`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 27] (deleting while iterating) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the Go spec say about deleting map entries during a `for range` loop over that map?',
         'The Go spec explicitly permits deleting map entries during iteration. Entries already produced are guaranteed to have been visited; entries deleted before being visited will not be produced.',
         'Allowed; spec-supported',
         'Go allows deleting map entries while ranging over a map.',
         6
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It causes undefined behavior.', false, 0),
       ('It is forbidden and triggers a runtime panic.', false, 1),
       ('It is explicitly allowed by the language spec.', true, 2),
       ('It works but skips every other entry.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 28] (read from nil map ok) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you read a key from a `nil` map, e.g. `var m map[string]int; v := m["x"]`?',
         'Reading from a `nil` map is well-defined: it returns the value type''s zero value (here, `0`) and `ok == false` in the two-value form. Writes are what panic, not reads.',
         'Returns zero value; no panic',
         'Reading from a `nil` map returns the zero value of the element type without panicking.',
         7
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It panics with "nil map dereference".', false, 0),
       ('It returns the value type''s zero value without panicking.', true, 1),
       ('It returns `nil`.', false, 2),
       ('It silently allocates the map first.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 29] (map of struct values immutable) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `m := map[string]Point{"a": {1,2}}`, why does `m["a"].X = 5` fail to compile?',
         'A map indexing expression `m["a"]` returns a copy of the value, not an addressable lvalue. Therefore you can''t take a field address through it. Either reassign the whole struct, or use `map[string]*Point`.',
         'Map value is not addressable',
         'Map values are not addressable, so you can''t assign to a field of a struct value retrieved via map indexing.',
         8
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`m["a"]` returns a non-addressable value, so its field can''t be assigned.', true, 0),
       ('`Point.X` is unexported and inaccessible.', false, 1),
       ('Maps cannot hold struct values.', false, 2),
       ('Maps require `&` on every read.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 31] (for range string yields runes) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `for i, r := range s` over a string `s`, what type is `r` and what does `i` represent?',
         'A `for range` over a string decodes UTF-8: `r` is a `rune` (code point) and `i` is the *byte* index of the start of that rune — not the rune index. Invalid UTF-8 yields `utf8.RuneError`.',
         '`r` is `rune`; `i` is the byte index',
         '`for range` over a string yields rune values, with `i` being the byte offset of the rune''s first byte.',
         9
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`r` is a `byte` and `i` is the byte index.', false, 0),
       ('`r` is a `rune` and `i` is the byte index of the rune.', true, 1),
       ('`r` is a `rune` and `i` is the rune index.', false, 2),
       ('`r` is a `string` (single character) and `i` is the rune index.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 32] (len string is bytes) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `len(s)` return when `s` is a string in Go?',
         '`len` on a string returns the byte length, not the count of code points. For ASCII this matches the character count, but for multibyte UTF-8 characters it does not. Use `utf8.RuneCountInString` for rune counts.',
         'Byte length, not rune count',
         '`len(s)` returns the number of bytes in the string, not the number of runes.',
         10
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The number of bytes', true, 0),
       ('The number of runes/code points', false, 1),
       ('The number of UTF-16 code units', false, 2),
       ('The capacity of the backing array', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 36] (indexing returns byte) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type of `s[0]` when `s` is a `string`?',
         'String indexing returns a `byte` (an alias for `uint8`), not a rune. For a multibyte UTF-8 character, `s[0]` gives only the first byte, not the whole code point.',
         '`byte`',
         'Indexing a string yields a single `byte` from its UTF-8 representation.',
         11
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`rune`', false, 0),
       ('`string` of length 1', false, 1),
       ('`int`', false, 2),
       ('`byte`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 37] (string is utf8 by convention) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What encoding does Go assume for string literals in source code?',
         'Go source files are UTF-8 by spec, and string literals in source are stored as UTF-8 bytes. A `string` value, however, is just an arbitrary byte sequence — it isn''t validated to be UTF-8.',
         'UTF-8 in source; arbitrary bytes at runtime',
         'String literals are encoded as UTF-8, but `string` values are arbitrary byte sequences.',
         12
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('UTF-16', false, 0),
       ('UTF-8', true, 1),
       ('ASCII only', false, 2),
       ('Locale-dependent', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 41] (named return values) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the effect of named return values in a Go function signature?',
         'Named results are declared (and zeroed) at the start of the function body. A bare `return` statement returns their current values. They also document intent and let `defer` inspect/modify them.',
         'Pre-declared, zeroed; allow bare `return`',
         'Named returns are pre-declared zeroed variables, enabling bare `return` and post-hoc modification via `defer`.',
         13
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They force callers to assign to named variables.', false, 0),
       ('They make the function purely functional.', false, 1),
       ('They pre-declare zeroed variables and enable bare `return`.', true, 2),
       ('They are required for variadic functions.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 44] (defer arg evaluation) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When are the arguments to a `defer`red call evaluated?',
         'Arguments to a deferred call are evaluated when the `defer` statement is reached, not when the call eventually runs. This is why `defer fmt.Println(i)` captures `i`''s value at defer time.',
         'At the `defer` statement, not at call time',
         'A deferred call''s arguments are captured at the moment `defer` is executed.',
         14
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When the deferred call actually executes.', false, 0),
       ('At the moment the `defer` statement runs.', true, 1),
       ('At compile time.', false, 2),
       ('Lazily, the first time the result is read.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 46] (closures share variable) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What do Go function literals close over?',
         'A Go function literal captures the *variable* by reference, not its value. Two closures that capture the same outer variable see and share its updates over time.',
         'Captures variables by reference',
         'Closures in Go capture their enclosing variables by reference, so changes are visible across closures and the outer scope.',
         15
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A snapshot of the outer variable''s value at definition time.', false, 0),
       ('A reference to the enclosing variable.', true, 1),
       ('A deep copy of the enclosing scope.', false, 2),
       ('Only constants from the enclosing scope.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 48] (defer with recover) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Where must a call to `recover` appear to actually stop a panic?',
         '`recover` only has an effect when called directly inside a deferred function. Anywhere else (including from a nested call inside a deferred function) it returns `nil` and does nothing.',
         'Inside a deferred function, directly',
         '`recover` only halts a panic when called directly from a deferred function in the panicking goroutine.',
         16
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Anywhere in the function — Go finds the panic automatically.', false, 0),
       ('Only inside a goroutine spawned by the panicking function.', false, 1),
       ('Inside a deferred function called directly from the panicking goroutine.', true, 2),
       ('Inside the `init` function of the package.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 49] (parameters passed by value) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How are arguments passed to functions in Go?',
         'Go always passes arguments by value. For slices, maps, channels, and pointers, that value happens to be a reference-like header, so changes through it are visible to the caller — but the parameter itself is still a copy of the header.',
         'Always by value (sometimes the value is a reference-like header)',
         'Go always passes arguments by value; reference-like behavior comes from the type, not the call convention.',
         17
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('By value, always — a copy of the argument is bound to the parameter.', true, 0),
       ('By reference, always.', false, 1),
       ('By value for primitives, by reference for compound types.', false, 2),
       ('By pointer, with implicit dereferencing.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 50] (pointer vs value receiver) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the practical difference between a value receiver and a pointer receiver in Go?',
         'A value receiver gets a copy of the underlying struct, so it cannot modify the original. A pointer receiver gets a pointer to it, allowing in-place modification and avoiding a copy. Pointer receivers are also typically used when the struct is large.',
         'Pointer receiver can mutate; value cannot',
         'Pointer receivers can modify the underlying value and avoid copying; value receivers operate on a copy.',
         18
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pointer receivers can mutate the underlying value; value receivers cannot.', true, 0),
       ('Value receivers can mutate the underlying value; pointer receivers cannot.', false, 1),
       ('Pointer receivers can only be used with interfaces.', false, 2),
       ('There is no functional difference.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 51] (struct embedding promotion) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does embedding (anonymous field) achieve in a Go struct?',
         'An anonymous (embedded) field is referred to by its type name. Both its fields and its methods are *promoted* to the outer struct, so they can be accessed directly on the outer value. Go uses this for composition, not inheritance.',
         'Fields/methods promoted to outer type',
         'Embedding a type in a struct promotes its fields and methods, enabling composition without inheritance.',
         19
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Classical inheritance with overrides.', false, 0),
       ('Promotion of the embedded type''s fields and methods to the outer struct.', true, 1),
       ('Compile-time error — Go has no anonymous fields.', false, 2),
       ('Renaming an existing field for convenience.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 52] (method set of *T includes T) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the method set of `*T` (pointer to `T`)?',
         'The method set of `*T` includes methods declared on both `T` and `*T`. The method set of `T` only includes methods on `T`. This is why pointer-receiver methods can be invoked through a `*T`-typed value but not always through a `T`-typed one used as an interface.',
         '`*T` has methods of `T` and `*T`',
         '`*T`''s method set includes methods declared with both pointer and value receivers; `T`''s does not include pointer-receiver methods.',
         20
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only methods declared on `T`.', false, 0),
       ('Only methods declared on `*T`.', false, 1),
       ('Methods declared on both `T` and `*T`.', true, 2),
       ('Methods declared on `*T` and any embedded interfaces.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 53] (calling pointer method on addressable value) -------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'You declare `func (p *Point) Scale(f float64)`. Given `p := Point{1,2}`, can you call `p.Scale(2)`?',
         'Yes. The compiler automatically takes the address of an addressable value when calling a pointer-receiver method. `p.Scale(2)` is shorthand for `(&p).Scale(2)`. If `p` were not addressable (e.g., a map value), this would not compile.',
         'Yes — auto-address-of for addressable values',
         'Go automatically takes the address of an addressable value when invoking a pointer-receiver method.',
         21
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — pointer methods require an explicit pointer.', false, 0),
       ('No — it panics at runtime.', false, 1),
       ('Yes — Go automatically takes the address of an addressable value.', true, 2),
       ('Only if `Point` implements an interface.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 54] (anonymous field name) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If `type Outer struct { *Inner; Name string }`, what is the field name used to access the embedded pointer?',
         'The field name of an embedded type is the (unqualified) type name. For an embedded `*Inner`, the field is `Inner`. You access it as `o.Inner`.',
         '`Inner`',
         'The implicit field name of an embedded `T` or `*T` is just `T`.',
         22
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Inner`', true, 0),
       ('`*Inner`', false, 1),
       ('`InnerPtr`', false, 2),
       ('`Embedded`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 57] (struct tags) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What are struct field tags used for in Go?',
         'A struct field tag is a string literal attached to the field. The Go runtime ignores tags, but they are exposed via reflection so libraries (notably `encoding/json`, ORM packages, validators) can read instructions like `json:"name"`.',
         'Reflection-accessible metadata for libraries',
         'Struct tags are string metadata read via reflection by libraries like `encoding/json`.',
         23
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are compiler hints for inlining.', false, 0),
       ('They define defaults for the field.', false, 1),
       ('They are metadata strings read at runtime via reflection.', true, 2),
       ('They make a field unexported.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 58] (struct comparison) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When can two struct values be compared with `==`?',
         'Two struct values are comparable if every one of their field types is comparable. A struct containing a slice, map, or function is not comparable; using `==` is a compile error.',
         'Iff all field types are comparable',
         'Structs are comparable with `==` only when every field has a comparable type.',
         24
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only when they have the same address.', false, 0),
       ('Always — Go compares structs field by field at runtime, panicking on incomparable ones.', false, 1),
       ('Only when every field has a comparable type.', true, 2),
       ('Only when at least one field is a pointer.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 59] (method on alias from other package?) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you declare a method on a type defined in another package?',
         'Go requires the receiver type to be a defined type in the *same* package as the method. To add behavior to an external type, wrap it via a new type definition: `type MyInt int` then declare methods on `MyInt`.',
         'No — receiver type must be in same package',
         'You can only attach methods to types defined in the same package; wrap external types to add methods.',
         25
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes — Go has open type extension.', false, 0),
       ('Yes, but only with pointer receivers.', false, 1),
       ('No — the receiver type must be defined in the same package.', true, 2),
       ('Yes, but only for exported types.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 60] (interface satisfaction is structural) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does a Go type "implement" an interface?',
         'Interface satisfaction in Go is structural and implicit. If a type has all of the methods named in an interface, with matching signatures, it satisfies that interface — no `implements` keyword required.',
         'Implicitly, by having the right method set',
         'Interfaces in Go are satisfied implicitly: any type whose method set includes all required methods automatically satisfies the interface.',
         26
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It must use `implements InterfaceName`.', false, 0),
       ('It must embed the interface.', false, 1),
       ('Automatically, if it has all the interface''s methods.', true, 2),
       ('It must be in the same package as the interface.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 61] (empty interface) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the empty interface `interface{}` (a.k.a. `any` in Go 1.18+) mean?',
         '`interface{}` (now spelled `any`) has zero method requirements, so every type — including primitives — satisfies it. It''s used for heterogeneous containers and generic-ish APIs from before generics existed.',
         '`any` — satisfied by every type',
         '`interface{}` (alias `any`) has no methods, so every value satisfies it.',
         27
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only pointer types satisfy it.', false, 0),
       ('Any value of any type satisfies it.', true, 1),
       ('Only types with at least one method satisfy it.', false, 2),
       ('It is a compile error.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 62] (type assertion comma-ok) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For an interface value `i`, what does `v, ok := i.(T)` do?',
         'A two-value type assertion checks whether `i` dynamically holds a `T`. If yes, `v` is the underlying `T` and `ok` is `true`. If no, `v` is the zero value of `T` and `ok` is `false` — no panic.',
         'Safe type assertion with `ok`',
         'The comma-ok form of a type assertion checks dynamic type without panicking.',
         28
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Performs a runtime cast and panics if `i` is not a `T`.', false, 0),
       ('Returns the dynamic value of `i` as a `T`, with `ok` indicating success — no panic on failure.', true, 1),
       ('Compares `i` for equality with `T`''s zero value.', false, 2),
       ('Performs an unsafe pointer reinterpretation.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 63] (single-value type assertion panics) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if a single-value type assertion `i.(T)` fails at runtime?',
         'The single-value form panics with a `runtime.TypeAssertionError` if the dynamic type isn''t `T`. Use the comma-ok form when failure is expected.',
         'Panics at runtime',
         'A failed single-value type assertion triggers a runtime panic.',
         29
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It returns the zero value of `T` silently.', false, 0),
       ('It is a compile error.', false, 1),
       ('It panics at runtime.', true, 2),
       ('It returns `nil` and sets an internal error.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 64] (type switch) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the syntax for a type switch on interface value `i`?',
         'A type switch uses the `i.(type)` form inside a `switch`. Inside each case, the bound variable takes on that case''s static type, letting you dispatch on dynamic type.',
         '`switch v := i.(type)`',
         'A type switch is written as `switch v := i.(type)` and dispatches on the dynamic type of an interface value.',
         30
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`switch i.type`', false, 0),
       ('`switch typeof(i)`', false, 1),
       ('`switch v := i.(type)`', true, 2),
       ('`switch i { case T:` ... `}`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 66] (interface embedding) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `type ReadWriter interface { Reader; Writer }` mean?',
         'An interface can embed other interfaces. The resulting `ReadWriter` requires all methods from both `Reader` and `Writer`. This is how `io.ReadWriter` is defined in the standard library.',
         'Method set is union of embedded interfaces',
         'Embedding interfaces composes their method sets — implementers must satisfy all embedded interfaces.',
         31
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`ReadWriter` requires the union of methods from `Reader` and `Writer`.', true, 0),
       ('It is a syntax error — interfaces cannot embed.', false, 1),
       ('`ReadWriter` requires only the intersection of `Reader` and `Writer` methods.', false, 2),
       ('It silently picks one of `Reader` or `Writer`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 67] (Stringer interface) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which method does a type implement to customize its default formatting in `fmt.Println`?',
         '`fmt.Stringer` is defined as `type Stringer interface { String() string }`. The `fmt` package detects this method and uses its return for default formatting.',
         '`String() string` (`fmt.Stringer`)',
         'Implement `String() string` to customize a type''s default `fmt` representation via `fmt.Stringer`.',
         32
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Format(state fmt.State, verb rune)`', false, 0),
       ('`ToString() string`', false, 1),
       ('`String() string`', true, 2),
       ('`MarshalText() ([]byte, error)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 69] (compile-time interface check) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the idiomatic compile-time assertion that `*MyType` satisfies interface `MyIface`?',
         'A package-level declaration `var _ MyIface = (*MyType)(nil)` asks the compiler to confirm `*MyType` implements `MyIface`. It produces no runtime cost.',
         '`var _ MyIface = (*MyType)(nil)`',
         'Use `var _ MyIface = (*MyType)(nil)` to enforce at compile time that `*MyType` satisfies `MyIface`.',
         33
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`assert MyType implements MyIface`', false, 0),
       ('`var _ MyIface = (*MyType)(nil)`', true, 1),
       ('`type MyType implements MyIface`', false, 2),
       ('`reflect.AssertImpl(MyType{}, MyIface{})`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 70] (go keyword) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `go f(x)` do?',
         'The `go` keyword starts a new goroutine — a lightweight, runtime-scheduled thread — running `f(x)` concurrently. Control returns to the caller immediately; `go` is not a function call expression and has no return value.',
         'Starts `f(x)` as a new goroutine',
         'The `go` statement launches a function call as a concurrent goroutine and returns immediately.',
         34
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Calls `f(x)` and returns its result immediately.', false, 0),
       ('Starts `f(x)` in a new goroutine and continues immediately.', true, 1),
       ('Defers `f(x)` until the surrounding function returns.', false, 2),
       ('Spawns a new OS thread blocking on `f(x)`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 71] (unbuffered channel sync) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the synchronization semantics of an unbuffered channel?',
         'On an unbuffered channel, a send blocks until a matching receive is ready, and vice versa. The two operations rendezvous at the channel — useful both for handoff and synchronization.',
         'Send and receive rendezvous (both block)',
         'Unbuffered channels synchronize: a send blocks until a receive happens (and vice versa).',
         35
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sends never block; receives may.', false, 0),
       ('Receives never block; sends may.', false, 1),
       ('A send blocks until a receive happens (and vice versa).', true, 2),
       ('Neither blocks — the runtime buffers a single message.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 72] (buffered channel blocks when full) -----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does a send on a buffered channel block?',
         'A buffered channel''s send completes immediately as long as the buffer has space. Once the buffer is full, further sends block until a receive frees a slot.',
         'When the buffer is full',
         'Sends to a buffered channel only block when the buffer is full.',
         36
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always — buffering doesn''t affect blocking.', false, 0),
       ('Only when no goroutines are scheduled.', false, 1),
       ('When the channel''s buffer is full.', true, 2),
       ('When the channel is closed.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 73] (receive from closed channel) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does receiving from a closed channel produce?',
         'Receives from a closed channel never block: they drain any remaining buffered values, then yield the zero value of the element type. The two-value form `v, ok := <-ch` returns `ok == false` once the channel is closed and drained.',
         'Zero value (after draining); `ok == false`',
         'Closed channels yield buffered values then the zero value, with `ok == false` in the comma-ok form.',
         37
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Panics with "receive on closed channel".', false, 0),
       ('Blocks forever.', false, 1),
       ('Drains buffered values, then yields the zero value with `ok == false`.', true, 2),
       ('Returns the last value sent, repeatedly.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 74] (send on closed channel) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if you `send` on a channel that has already been closed?',
         'Sending on a closed channel triggers a runtime panic. This makes ownership and closing discipline important: usually only the sole sender is allowed to close.',
         'Runtime panic',
         'Sending on a closed channel panics; only the producer should close, and only once.',
         38
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It panics at runtime.', true, 0),
       ('It silently drops the value.', false, 1),
       ('It re-opens the channel.', false, 2),
       ('It blocks until the channel is re-opened.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 75] (range over channel) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `for v := range ch` over a channel do?',
         'Ranging over a channel receives values until the channel is closed and drained, then exits the loop. It does not exit on temporary emptiness; it just blocks waiting for the next value.',
         'Receives until channel closed and drained',
         '`for range` over a channel reads values until the channel is closed and emptied, then ends.',
         39
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reads one value and exits.', false, 0),
       ('Reads values until the channel is empty, then exits — even if not closed.', false, 1),
       ('Reads values until the channel is closed and drained.', true, 2),
       ('Panics if the channel is unbuffered.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 [orig 76] (select statement) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a `select` statement with multiple ready channel operations, which case runs?',
         'When several `select` cases are ready simultaneously, the runtime picks one uniformly at random. This prevents starvation and makes order non-deterministic.',
         'One ready case chosen at random',
         'A `select` chooses uniformly at random among ready cases to avoid starvation.',
         40
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The first one in source order.', false, 0),
       ('One chosen uniformly at random.', true, 1),
       ('The case for the channel with the smallest buffer.', false, 2),
       ('All of them, sequentially.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 [orig 77] (select default) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a `default` clause in a `select` do?',
         'Without `default`, a `select` blocks until at least one case is ready. With `default`, if no case is immediately ready, the `default` runs — making the select non-blocking.',
         'Makes the `select` non-blocking',
         'A `default` case makes `select` non-blocking: it runs immediately if no other case is ready.',
         41
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Runs only after all other cases.', false, 0),
       ('Forces the `select` to retry forever.', false, 1),
       ('Runs immediately if no case is ready, making the `select` non-blocking.', true, 2),
       ('Is run concurrently with the chosen case.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 [orig 78] (channel direction restriction) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the type `chan<- int` mean in a function parameter?',
         '`chan<- int` is a send-only channel of `int`. The compiler forbids receives on this channel, restricting how the function can use it — useful for API clarity.',
         'Send-only channel of `int`',
         '`chan<- T` is a send-only channel; receiving on it is a compile error.',
         42
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A receive-only channel of `int`.', false, 0),
       ('A bidirectional channel that may only carry one value.', false, 1),
       ('A channel restricted to use within a single goroutine.', false, 2),
       ('A send-only channel of `int`.', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 [orig 79] (closing channel is sender''s job) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these is a common Go idiom for channel closing?',
         'Only the sender (or the goroutine that owns the channel) should close it, and only when there are no further values to send. Closing from the receiver, or double-closing, leads to panics.',
         'Only the sender closes; never double-close',
         'In Go, only the sole sender should close a channel — never the receiver, never twice.',
         43
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Either side may close the channel at any time.', false, 0),
       ('Only receivers should close the channel.', false, 1),
       ('Only the sender (or owner) should close, and only once.', true, 2),
       ('Channels close automatically when they go out of scope.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 [orig 80] (error interface) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is the built-in `error` type defined in Go?',
         '`error` is an interface with a single method: `Error() string`. Any type with that method satisfies it. This minimalism is why Go errors can carry arbitrary structured data.',
         '`type error interface { Error() string }`',
         '`error` is the built-in interface with a single method `Error() string`.',
         44
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is a struct with `Code int` and `Message string` fields.', false, 0),
       ('It is an interface with a single method `Error() string`.', true, 1),
       ('It is a type alias for `string`.', false, 2),
       ('It is an exception class with built-in stack capture.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 [orig 81] (errors.Is) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the right way to check whether an error matches a sentinel value like `io.EOF`?',
         '`errors.Is(err, io.EOF)` walks the wrapped-error chain and returns `true` if any error in the chain equals `io.EOF`. Direct `==` only works when the error hasn''t been wrapped.',
         '`errors.Is(err, io.EOF)`',
         'Use `errors.Is` to compare against a sentinel error through any number of wraps.',
         45
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`err == io.EOF`', false, 0),
       ('`err.Is(io.EOF)`', false, 1),
       ('`errors.Is(err, io.EOF)`', true, 2),
       ('`io.EOF.Match(err)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 [orig 82] (errors.As) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you extract a concrete error type `*PathError` from a wrapped error chain?',
         '`errors.As(err, &target)` walks the chain and, if it finds an error whose dynamic type matches `target`''s, assigns it into `*target` and returns `true`. Use this when you need fields off the concrete type.',
         '`errors.As(err, &target)`',
         '`errors.As` walks an error chain and unwraps into a typed target, like a `*PathError`.',
         46
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Use a type assertion: `pe := err.(*PathError)`', false, 0),
       ('Use `errors.As(err, &pe)`', true, 1),
       ('Use `errors.Is(err, PathError{})`', false, 2),
       ('Use `reflect.TypeOf(err).Implements(...)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 [orig 83] (fmt.Errorf wrapping with %w) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which verb in `fmt.Errorf` wraps another error so that `errors.Is`/`errors.As` can find it?',
         'The `%w` verb is special: it tags an argument as a wrapped error, attaching it to the chain that `errors.Is`/`errors.As`/`errors.Unwrap` traverse. `%v` and `%s` only stringify it.',
         '`%w`',
         'Use `%w` in `fmt.Errorf` to wrap an underlying error and preserve the unwrap chain.',
         47
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`%v`', false, 0),
       ('`%s`', false, 1),
       ('`%e`', false, 2),
       ('`%w`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 [orig 84] (panic vs error) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In idiomatic Go, when should you use `panic` instead of returning an `error`?',
         'Panics are for truly unexpected, unrecoverable conditions (programmer bugs, invariants violated). Anything a caller might reasonably want to handle should be returned as an `error`. Libraries should almost never panic across their public API.',
         'Unrecoverable invariants, not expected failures',
         'Reserve `panic` for unrecoverable invariant violations; use `error` returns for expected failure modes.',
         48
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('For any input the caller might pass incorrectly.', false, 0),
       ('Only for unrecoverable, programmer-error conditions.', true, 1),
       ('Whenever the function has no return value.', false, 2),
       ('Whenever an external system fails.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 [orig 85] (errors.New) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `errors.New("something failed")` return?',
         '`errors.New(s)` allocates a fresh `*errors.errorString` carrying `s`. Two calls with the same message return distinct values, so identity comparisons would not match — useful when you don''t want sentinel comparison.',
         'A new `error` (distinct each call)',
         '`errors.New` constructs a new, distinct error value with the given message.',
         49
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A shared singleton error for the message.', false, 0),
       ('A new `error` value that wraps `os.ErrNotExist`.', false, 1),
       ('A new, distinct `error` value with that message.', true, 2),
       ('A panic with the given message.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 [orig 86] (multiple returns idiom) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the canonical Go signature for a function that can fail?',
         'Idiomatic Go puts the error last in the return list: `func F(...) (T, error)`. Callers are expected to check `err != nil` before using `T`.',
         '`func F(...) (T, error)`',
         'The canonical Go pattern is `(T, error)` — value first, error last.',
         50
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`func F(...) error` only', false, 0),
       ('`func F(...) (error, T)`', false, 1),
       ('`func F(...) (T, error)`', true, 2),
       ('`func F(...) Result[T]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 [orig 87] (deferred recover catches panic) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `recover()` return if called inside a deferred function during a panic?',
         'During a panic, `recover` in a directly deferred function returns the value passed to `panic`, halts the panicking sequence, and lets the surrounding function return normally. Outside a panic (or outside a defer), it returns `nil`.',
         'The panic value; stops the panic',
         'A `recover` call inside a deferred function returns the panic value and stops the panic.',
         51
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always `nil`', false, 0),
       ('A string describing the panic site', false, 1),
       ('The value passed to `panic`, and stops the unwinding', true, 2),
       ('A `runtime.Error` with stack trace, and re-panics', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 [orig 88] (wrapping vs replacing message) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is wrong with `return fmt.Errorf("decode: %s", err)` when the caller might want to inspect `err`?',
         'Using `%s` formats `err` as a string and discards the chain. Callers won''t be able to use `errors.Is` or `errors.As` to find the original. Use `%w` instead to preserve the wrapping relationship.',
         '`%s` discards the chain; use `%w`',
         'Formatting an error with `%s` instead of `%w` breaks the error chain for `errors.Is`/`errors.As`.',
         52
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Nothing — `%s` is the standard way to wrap an error.', false, 0),
       ('It loses the original error chain; `errors.Is`/`errors.As` won''t find `err`.', true, 1),
       ('It causes a runtime panic.', false, 2),
       ('It double-wraps the error.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 [orig 94] (blank import) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the effect of `import _ "net/http/pprof"`?',
         'Importing a package with `_` runs its `init` functions but doesn''t introduce any of its identifiers into scope. It''s commonly used to register side effects (HTTP handlers, drivers).',
         'Run side-effect `init`s only',
         'A blank import (`_ "pkg"`) runs the package''s `init` functions purely for side effects.',
         53
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It silences "unused import" errors but is otherwise inert.', false, 0),
       ('It imports the package solely for its `init` side effects.', true, 1),
       ('It imports the package only at runtime via reflection.', false, 2),
       ('It is a syntax error.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 [orig 96] (test files) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Where are tests for a Go package located, and what naming convention do they use?',
         'Tests live in the same directory as the package they test, in files whose names end in `_test.go`. Test functions must start with `Test` and take a `*testing.T`.',
         'Same directory; `*_test.go`; `TestXxx(t *testing.T)`',
         'Go tests live in `*_test.go` files alongside the code, with functions named `TestXxx(t *testing.T)`.',
         54
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('In a separate `tests/` directory, prefixed `test_`.', false, 0),
       ('In the same directory, in files ending `_test.go`, with `TestXxx(t *testing.T)` functions.', true, 1),
       ('Anywhere, as long as the function is named `main_test`.', false, 2),
       ('In `internal/test` subpackages only.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 [orig 97] (generics type parameters) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which Go version introduced generics (type parameters)?',
         'Type parameters were added to Go in version 1.18 (released March 2022). They allow generic functions and types like `func Map[T, U any](s []T, f func(T) U) []U`.',
         'Go 1.18',
         'Go 1.18 (March 2022) introduced generics via type parameters.',
         55
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Go 1.0', false, 0),
       ('Go 1.11', false, 1),
       ('Go 1.18', true, 2),
       ('Go 1.21', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 [orig 98] (constraint comparable) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the built-in constraint `comparable` allow on a generic type parameter `T`?',
         'A type parameter constrained by `comparable` can be compared with `==` and `!=` and used as a map key. Slices, maps, and functions are not comparable and therefore cannot satisfy this constraint.',
         '`==`/`!=` and use as map key',
         'The `comparable` constraint permits using `==`/`!=` and using the type as a map key.',
         56
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Calling any method on `T`.', false, 0),
       ('Ordering `T` values with `<`/`>`.', false, 1),
       ('Comparing `T` values with `==`/`!=` and using `T` as a map key.', true, 2),
       ('Implicit conversion to `any`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 [orig 99] (any alias) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Go 1.18+, `any` is an alias for which type?',
         '`any` was introduced in Go 1.18 as an alias for `interface{}`. It''s purely a readability improvement — semantically identical — and is now the preferred spelling, especially in generic constraints.',
         '`interface{}`',
         '`any` is a Go 1.18+ alias for the empty interface `interface{}`.',
         57
  from modules where slug = 'go-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`interface{}`', true, 0),
       ('`comparable`', false, 1),
       ('`reflect.Value`', false, 2),
       ('`unsafe.Pointer`', false, 3)
     ) as c(label, is_correct, order_index);
-- ============================================================
-- go-3
-- ============================================================

-- Question 0 [orig 65] (nil interface vs nil concrete) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is an interface value equal to `nil`?',
         'An interface value is `nil` only when *both* its dynamic type and dynamic value are `nil`. Assigning a typed `nil` (e.g., `var p *T; var i SomeIface = p`) produces an interface that is non-`nil` but holds a `nil` pointer — a classic Go gotcha.',
         'Only when both type AND value are `nil`',
         'An interface value is `nil` only if both its underlying type and value are `nil`; a typed `nil` pointer makes the interface non-nil.',
         0
  from modules where slug = 'go-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Whenever its underlying value is `nil`.', false, 0),
       ('Whenever its underlying type is `nil`.', false, 1),
       ('Only when both its underlying type and value are `nil`.', true, 2),
       ('Whenever it has not been explicitly assigned.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 68] (interface holds value not pointer always) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When you assign a concrete value `v` of type `T` to an interface variable, what does the interface store?',
         'An interface value is a (dynamic type, dynamic value) pair. Assigning `v` of type `T` stores `T` plus a copy of `v`. To store a reference, assign `&v` so the dynamic type is `*T`.',
         '`(T, copy of v)` — the value is copied',
         'Assigning a value to an interface stores its dynamic type and a copy of the value.',
         1
  from modules where slug = 'go-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A pointer to `v`, always.', false, 0),
       ('A copy of `v`, along with its dynamic type `T`.', true, 1),
       ('A reflection-like description without the value.', false, 2),
       ('A reference into the original variable''s storage.', false, 3)
     ) as c(label, is_correct, order_index);
