-- 014_seed_rust.sql
-- Rust modules: split into three difficulty levels (24 / 59 / 17 questions).
-- Module rows are in 006_seed_more_modules.sql.

-- ============================================================
-- rust-1
-- ============================================================

-- Question 0 [orig 0] (ownership basics) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In Rust, what happens to the original variable after `let s2 = s1;` when `s1` is a `String`?',
         'Assigning a non-`Copy` value like `String` moves ownership. `s1` is invalidated at compile time and any further use of `s1` is a compile error.',
         'Ownership moves; `s1` is invalidated.',
         'Assigning a `String` transfers ownership, leaving the source variable unusable.',
         0
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`s1` is shallow-copied and both variables are usable', false, 0),
       ('`s1` is deep-cloned automatically', false, 1),
       ('`s1` is moved and can no longer be used', true, 2),
       ('`s1` becomes a shared reference to `s2`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 2] (Copy types) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these types implements `Copy` by default?',
         'Primitive scalar types like `i32`, `bool`, `char`, and fixed-size arrays of `Copy` elements implement `Copy`. `String` and `Vec<T>` own heap data and do not.',
         '`i32` (and other primitive scalars).',
         'Primitive scalars such as `i32` implement `Copy` by default, while heap-owning types like `String` do not.',
         1
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`i32`', true, 0),
       ('`String`', false, 1),
       ('`Vec<i32>`', false, 2),
       ('`Box<i32>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 3] (drop and ownership) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does Rust automatically call `drop` on a value?',
         'A value is dropped when its owner goes out of scope. The compiler inserts the `drop` call deterministically — there is no garbage collector.',
         'When the owner goes out of scope.',
         'Rust drops a value deterministically when its owning binding leaves scope.',
         2
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When a background garbage collector decides to reclaim it', false, 0),
       ('When its reference count hits zero', false, 1),
       ('When the program exits', false, 2),
       ('When its owner goes out of scope', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 4] (move into function) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'You pass a `String` by value to a function. What happens to the caller''s variable?',
         'Passing a non-`Copy` value by value moves it. The caller''s binding is invalidated unless the function returns it back.',
         'Moved into the function; caller can''t use it anymore.',
         'Passing a `String` by value moves ownership into the function, invalidating the caller''s binding.',
         3
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is implicitly cloned', false, 0),
       ('It remains usable because Rust auto-borrows', false, 1),
       ('Ownership moves into the function; the caller can no longer use it', true, 2),
       ('It becomes a `&String` reference automatically', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 5] (returning ownership) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A function takes a `String` and returns it back. What is the standard idiomatic alternative?',
         'Taking `&String` (or better, `&str`) borrows the value instead of moving it, so the caller retains ownership without the round-trip.',
         'Take a `&str` or `&String` reference instead.',
         'Borrowing via a reference avoids moving ownership in and out of a function.',
         4
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wrap it in `Rc<String>`', false, 0),
       ('Take a `&str` (or `&String`) parameter and let the caller keep ownership', true, 1),
       ('Mark the parameter `Copy`', false, 2),
       ('Use `unsafe` to bypass the move', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 7] (Clone semantics) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does calling `.clone()` on a `String` do?',
         '`String::clone` performs a deep copy: it allocates a new heap buffer and duplicates the bytes. Both `String`s independently own their data.',
         'Deep-copies the heap buffer; both `String`s own their data.',
         '`String::clone` allocates a new heap buffer and copies the contents so both values are independently owned.',
         5
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Allocates a new heap buffer and copies the contents', true, 0),
       ('Returns a `&String` borrow', false, 1),
       ('Increments a reference count, sharing the buffer', false, 2),
       ('Moves the original `String` into the clone', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 9] (no GC) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does Rust manage memory without a garbage collector?',
         'Rust uses an ownership system enforced at compile time: each value has a single owner, and the compiler inserts `drop` calls when the owner goes out of scope.',
         'Compile-time ownership rules + deterministic `drop`.',
         'Rust enforces ownership at compile time and inserts deterministic `drop` calls, eliminating the need for a runtime GC.',
         6
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It runs a hidden tracing GC on a background thread', false, 0),
       ('It enforces single ownership at compile time and drops values deterministically when they go out of scope', true, 1),
       ('It uses atomic reference counting on every allocation', false, 2),
       ('It allocates everything on the stack', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 19] (&str vs &String) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `&str` usually preferred over `&String` as a function parameter?',
         '`&str` accepts any string slice — including string literals (`&''static str`), substrings, and `&String` (via deref coercion). It is the most general borrowed string type.',
         '`&str` accepts more callers via deref coercion.',
         'Taking `&str` is more general because `String`, string literals, and substrings all coerce to it.',
         7
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`&str` is more general — `String`, literals, and slices all coerce to it', true, 0),
       ('`&String` is unsafe', false, 1),
       ('`&str` allows mutation of the underlying buffer', false, 2),
       ('`&String` requires explicit lifetimes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 30] (Option) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of `Option<T>` in Rust?',
         '`Option<T>` is the standard way to represent "a value or nothing" without using null pointers. It has variants `Some(T)` and `None` and forces callers to handle the absence explicitly.',
         'Type-safe "maybe a `T`" without null.',
         '`Option<T>` represents an optional value with `Some(T)` or `None`, eliminating null-pointer bugs.',
         8
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It wraps any value to make it nullable at runtime', false, 0),
       ('It is a synonym for `Result<T, ()>`', false, 1),
       ('It encodes "a value of `T` or no value" at the type level, without null', true, 2),
       ('It boxes the value on the heap', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 31] (Result) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which variants does `Result<T, E>` have?',
         '`Result<T, E>` has `Ok(T)` for the success case and `Err(E)` for the failure case. It is the standard recoverable-error type.',
         '`Ok(T)` and `Err(E)`.',
         '`Result<T, E>` is either `Ok(T)` on success or `Err(E)` on failure.',
         9
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Some(T)` and `None`', false, 0),
       ('`Ok(T)` and `Err(E)`', true, 1),
       ('`Pass(T)` and `Fail(E)`', false, 2),
       ('`Just(T)` and `Nothing`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 32] (match exhaustiveness) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does it mean that `match` in Rust is "exhaustive"?',
         'The compiler requires every possible value of the scrutinee to be covered by at least one arm. Missing a variant is a compile error, which makes refactors safe.',
         'Every possible value must be matched.',
         'Rust''s `match` requires all possible variants/values to be handled; otherwise the compiler errors.',
         10
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It tries every arm at runtime until one returns a value', false, 0),
       ('It panics if no arm matches', false, 1),
       ('It is faster than a chain of `if`/`else`', false, 2),
       ('Every possible value of the scrutinee must be covered by at least one arm', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 33] (if let) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When would you prefer `if let Some(x) = opt` over `match`?',
         '`if let` is a concise way to handle a single pattern of interest and ignore the rest. It''s ideal when you only care about one variant (e.g., `Some`) and would otherwise write a `_ => ()` arm.',
         'When you only care about one variant.',
         '`if let` shines when you only need to handle one matching pattern, avoiding a noisy `match`.',
         11
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When you only care about handling one variant and want to ignore the rest', true, 0),
       ('When the value implements `Copy`', false, 1),
       ('When you need exhaustiveness checking', false, 2),
       ('When the enum has exactly two variants', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 34] (struct kinds) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these is a valid Rust struct definition?',
         'Tuple structs use parentheses and positional fields: `struct Point(i32, i32);`. Classic named-field structs use braces, and unit structs have no fields at all.',
         '`struct Point(i32, i32);` is a tuple struct.',
         'Tuple structs declare positional fields in parentheses, as in `struct Point(i32, i32);`.',
         12
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`struct Point { i32 x, i32 y };`', false, 0),
       ('`struct Point(i32, i32);`', true, 1),
       ('`struct Point => (i32, i32);`', false, 2),
       ('`class Point { x: i32; y: i32; }`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 35] (enum data) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about Rust enums is true?',
         'Enums in Rust are tagged unions: each variant may carry its own associated data (tuple-like or struct-like fields). This makes them ideal for modeling sum types.',
         'Variants can carry different data.',
         'Rust enums are tagged unions: each variant can carry its own associated data.',
         13
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Enum variants are just named integer constants and carry no data', false, 0),
       ('All variants must share the same field types', false, 1),
       ('Each variant can carry different associated data, including struct- or tuple-like fields', true, 2),
       ('Enums cannot implement traits', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 36] (match binding) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `match opt { Some(x) => ..., None => ... }`, what is `x`?',
         'The pattern `Some(x)` destructures the `Some` variant and binds its inner value to the new binding `x` in that arm.',
         'A new binding to the inner value.',
         'In `Some(x)`, `x` is a fresh binding to the value held inside the `Some`.',
         14
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A fresh binding to the value inside the `Some` variant', true, 0),
       ('A reference to an outer variable named `x`', false, 1),
       ('A wildcard pattern matching anything', false, 2),
       ('A type parameter for the `Some` constructor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 38] (Option::map) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Option::map` do?',
         '`Option::map` applies a function to the inner value if the `Option` is `Some`, producing a new `Option` of the function''s return type. `None` is returned unchanged.',
         'Apply `f` inside `Some`, leave `None` alone.',
         '`Option::map` transforms the inner `Some` value via a function, leaving `None` unchanged.',
         15
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Panics on `None`', false, 0),
       ('Always returns the original `Option` unchanged', false, 1),
       ('Returns the inner value or panics if `None`', false, 2),
       ('Applies a function to the inner value if `Some`, otherwise returns `None`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 40] (trait basics) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a `trait` in Rust most analogous to?',
         'A `trait` defines a set of methods (and possibly associated items) that a type can implement. It is most similar to an interface or typeclass in other languages, with optional default method bodies.',
         'Interface / typeclass with optional defaults.',
         'A Rust `trait` is an interface or typeclass that types implement to share behavior, with optional default method bodies.',
         16
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A class in object-oriented languages', false, 0),
       ('An interface or typeclass: a set of methods a type implements', true, 1),
       ('A macro that generates code', false, 2),
       ('A module namespace', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 47] (Self vs self) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In an `impl` block, what is the difference between `Self` and `self`?',
         '`Self` (capital S) is the type being implemented; `self` (lowercase) is the runtime receiver value of a method. So `fn new() -> Self` returns the type, while `fn name(&self) -> &str` takes the value.',
         '`Self` = the type; `self` = the receiver value.',
         '`Self` refers to the implementing type, `self` is the method''s receiver value.',
         17
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Self` is the implementing type; `self` is the runtime receiver of a method', true, 0),
       ('They are interchangeable', false, 1),
       ('`Self` is a method parameter; `self` is a trait', false, 2),
       ('`Self` is only valid in trait definitions, not impls', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 49] (associated functions) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What distinguishes an "associated function" from a method?',
         'Associated functions are declared inside an `impl` block but don''t take `self` as a receiver. They are typically called using `Type::function(...)` syntax — e.g., `String::new()`.',
         'No `self` parameter; called as `Type::func()`.',
         'Associated functions live on a type and lack a `self` receiver, called via `Type::func()`.',
         18
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Associated functions are always `unsafe`', false, 0),
       ('Associated functions take `&mut self` only', false, 1),
       ('Associated functions take no `self` receiver and are called like `Type::func(...)`', true, 2),
       ('Methods cannot be called via `Type::method(...)` syntax', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 55] (generic struct) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which signature declares a generic struct with two type parameters?',
         'Generic parameters are introduced in angle brackets after the struct name: `struct Pair<A, B> { first: A, second: B }`.',
         '`struct Pair<A, B> { first: A, second: B }`.',
         'Generic structs declare type parameters in angle brackets after the struct name.',
         19
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`struct Pair<A, B> { first: A, second: B }`', true, 0),
       ('`struct Pair { first: A, second: B }`', false, 1),
       ('`struct Pair[A, B] { first: A, second: B }`', false, 2),
       ('`struct Pair(A, B): generic;`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 73] (unwrap on None) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Option::unwrap` do when the value is `None`?',
         'It panics with a generic message ("called `Option::unwrap()` on a `None` value"). For a custom message use `expect`; for safe handling use `match`, `if let`, or methods like `unwrap_or`.',
         'Panics with a generic message.',
         'Calling `unwrap` on `None` panics; prefer `expect`, `unwrap_or`, or pattern matching for safer handling.',
         20
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns the default value for `T`', false, 0),
       ('Returns `None`', false, 1),
       ('Loops forever waiting for a `Some`', false, 2),
       ('Panics with a generic message', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 97] (Cargo build vs run) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `cargo build` and `cargo run`?',
         '`cargo build` compiles the package into `target/`. `cargo run` builds (if needed) and then executes the resulting binary. Both default to the debug profile unless `--release` is passed.',
         '`run` builds then executes; `build` only compiles.',
         '`cargo build` only compiles, while `cargo run` builds and then runs the resulting binary.',
         21
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are aliases', false, 0),
       ('`cargo build` compiles only; `cargo run` builds (if needed) and executes the resulting binary', true, 1),
       ('`cargo build` runs tests; `cargo run` runs benchmarks', false, 2),
       ('`cargo build` is release mode; `cargo run` is debug mode', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 98] (Cargo.toml) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the role of `Cargo.toml` in a Rust project?',
         '`Cargo.toml` is the package manifest. It declares package metadata, dependencies, features, build targets, and profiles. `Cargo.lock` is the resolved dependency snapshot.',
         'Package manifest (deps, features, metadata).',
         '`Cargo.toml` declares package metadata, dependencies, and build configuration; `Cargo.lock` pins resolved versions.',
         22
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A list of recently used crates from crates.io', false, 0),
       ('A generated lockfile pinning exact dependency versions', false, 1),
       ('The package manifest declaring metadata, dependencies, features, and build configuration', true, 2),
       ('A shell script run before each build', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 99] (release profile) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What changes when you build with `cargo build --release`?',
         'The release profile enables compiler optimizations (`opt-level = 3`), disables debug assertions, and typically produces smaller, much faster binaries. Compile times are longer than debug builds.',
         'Optimized build: faster runtime, longer compile.',
         '`--release` builds with optimizations enabled, producing faster binaries at the cost of compile time.',
         23
  from modules where slug = 'rust-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It strips all dependencies from the output', false, 0),
       ('It enables nightly-only features', false, 1),
       ('It runs the test suite before linking', false, 2),
       ('It compiles with optimizations enabled, producing a faster binary at the cost of longer compile time', true, 3)
     ) as c(label, is_correct, order_index);
-- ============================================================
-- rust-2
-- ============================================================

-- Question 0 [orig 1] (Copy vs Clone) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement best distinguishes `Copy` from `Clone` in Rust?',
         '`Copy` is an implicit bitwise copy on assignment and requires `Clone` as a supertrait. `Clone` is an explicit, potentially expensive duplication invoked via `.clone()`.',
         '`Copy` is implicit bitwise; `Clone` is explicit and may allocate.',
         '`Copy` happens implicitly and bitwise, while `Clone` requires an explicit `.clone()` call.',
         0
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Copy` and `Clone` are functionally identical', false, 0),
       ('`Copy` is implicit on assignment; `Clone` is explicit via `.clone()`', true, 1),
       ('`Copy` requires heap allocation; `Clone` does not', false, 2),
       ('`Clone` is a supertrait of `Copy`, so anything `Clone` is also `Copy`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 6] (move out of Vec) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `let s = v[0];` fail to compile when `v: Vec<String>`?',
         'Indexing returns a place; moving a `String` out of an owned `Vec` via indexing would leave the vector in a partially-initialized state, so the borrow checker rejects it.',
         'Can''t move out of indexed `Vec<String>`.',
         'You cannot move a non-`Copy` element out of a `Vec` by indexing because it would invalidate the rest of the vector.',
         1
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Vec` is immutable by default', false, 0),
       ('`String` doesn''t implement `Index`', false, 1),
       ('You cannot move a non-`Copy` value out of a `Vec` via indexing', true, 2),
       ('The compiler requires explicit lifetimes on every `Vec` access', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 8] (closures and move) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the effect of the `move` keyword on a closure?',
         '`move` forces the closure to take ownership of every captured variable by value, rather than letting the compiler choose by-reference capture. It is required when the closure outlives its environment, e.g. when sent to another thread.',
         '`move` forces by-value capture of the environment.',
         'A `move` closure takes ownership of its captures, which is required when the closure outlives the enclosing scope.',
         2
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Allows the closure to mutate the enclosing scope''s variables in place', false, 0),
       ('Forces the closure to be `Copy`', false, 1),
       ('Marks the closure as `unsafe`', false, 2),
       ('Forces the closure to take ownership of all captured variables', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 10] (shared vs mutable refs) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the core borrow-checker rule about references?',
         'At any point in time, a value may have either any number of shared references (`&T`) or exactly one mutable reference (`&mut T`), but not both. This rules out data races at compile time.',
         'Many `&T` xor one `&mut T`, never both.',
         'You may have many shared references or one exclusive mutable reference to a value, but never both simultaneously.',
         3
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any number of `&mut T` references are allowed if they are in different scopes', false, 0),
       ('You may have any combination of `&T` and `&mut T` simultaneously', false, 1),
       ('At any point you may have either many `&T` or exactly one `&mut T`, never both', true, 2),
       ('Only one reference of any kind may exist at a time', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 11] (&mut exclusivity) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does Rust forbid having a `&T` and `&mut T` to the same value at the same time?',
         'Mixing shared and exclusive access could let one party observe a value while another mutates it, which is a data race. Forbidding the combination eliminates this class of bug at compile time.',
         'Prevents data races and aliased mutation.',
         'Disallowing simultaneous shared and mutable references prevents data races and aliased mutation bugs at compile time.',
         4
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It prevents data races and aliased mutation bugs at compile time', true, 0),
       ('Mutable references are more expensive than shared ones', false, 1),
       ('It is a limitation of the LLVM backend', false, 2),
       ('Shared references cannot represent stack-allocated data', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 14] (slice borrow) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does pushing to a `Vec<T>` while holding a `&T` into it fail to compile?',
         'A push may reallocate the vector''s buffer, invalidating any outstanding references into it. The borrow checker therefore rejects mutating the vec while a shared borrow exists.',
         '`push` may reallocate and invalidate existing refs.',
         'Holding a shared reference into a `Vec` while mutating it is forbidden because a reallocation would dangle the reference.',
         5
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Vec::push` requires the vector to be `Copy`', false, 0),
       ('`&T` references cannot coexist with each other', false, 1),
       ('`push` may reallocate, invalidating any outstanding references into the vector', true, 2),
       ('`Vec` requires explicit lifetime annotations on every borrow', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 15] (split_at_mut) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How can you obtain two disjoint `&mut` slices into the same `Vec` safely?',
         '`slice::split_at_mut` returns two non-overlapping mutable subslices, encapsulating the unsafe pointer split behind a safe API.',
         '`split_at_mut` returns two disjoint `&mut [T]`.',
         '`split_at_mut` gives two disjoint mutable subslices in safe code without violating aliasing rules.',
         6
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Call `slice::split_at_mut`', true, 0),
       ('Take two separate `&mut` borrows in sequence', false, 1),
       ('Use `unsafe` to alias them — the compiler permits it for `Vec`', false, 2),
       ('Wrap the `Vec` in `Rc<RefCell<...>>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 16] (dangling refs) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the borrow checker guarantee about references in safe Rust?',
         'The borrow checker statically ensures references never outlive the data they point to and that aliasing rules hold, so safe references are never dangling.',
         'References never dangle in safe Rust.',
         'In safe Rust the borrow checker statically prevents any reference from outliving its referent.',
         7
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are always `''static`', false, 0),
       ('They never outlive the data they point to', true, 1),
       ('They are always exactly 8 bytes', false, 2),
       ('They are zero-cost compared to raw pointers (but may dangle)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 17] (interior mut for shared) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'You only have `&self` but need to mutate an internal field. What pattern enables this?',
         'Interior mutability types like `Cell`, `RefCell`, `Mutex`, and `RwLock` let you mutate through a shared reference while preserving Rust''s aliasing guarantees, enforcing exclusivity at runtime.',
         'Interior mutability: `Cell`/`RefCell`/`Mutex`.',
         'Interior mutability types let you mutate through `&self` by moving the aliasing check from compile time to runtime.',
         8
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cast `&self` to `&mut self` with `unsafe`', false, 0),
       ('Use `Box<T>` to make the field heap-allocated', false, 1),
       ('Wrap the field in an interior-mutability type like `Cell`, `RefCell`, or `Mutex`', true, 2),
       ('Annotate the field with `mut`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 18] (auto-deref on method call) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does Rust''s "auto-ref/deref" rule do at a method call site?',
         'When you write `value.method()`, the compiler will automatically take `&value`, `&mut value`, or `value` (or repeatedly deref) to find a method whose receiver matches.',
         'Auto-inserts `&`, `&mut`, or deref to match a method receiver.',
         'At method call sites Rust automatically borrows or dereferences the receiver to find a matching method.',
         9
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It implicitly clones the receiver if needed', false, 0),
       ('It rewrites methods into free functions at compile time', false, 1),
       ('It panics if the method receiver does not match exactly', false, 2),
       ('It automatically takes `&`, `&mut`, or dereferences the receiver to match a method''s signature', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 20] (lifetime intuition) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a lifetime annotation like `''a` actually describe?',
         'Lifetimes are compile-time labels that relate the validity scopes of references. They do not change how long values live; they constrain references so the compiler can prove no reference outlives its referent.',
         'A relationship between reference validity scopes.',
         'Lifetime annotations relate reference scopes so the compiler can verify references never outlive their referents.',
         10
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('How long a value will physically exist at runtime', false, 0),
       ('A constraint relating how long references remain valid', true, 1),
       ('A runtime cost associated with a reference', false, 2),
       ('The memory region (heap vs stack) a value lives in', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 21] (lifetime elision rule 1) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For `fn first(s: &str) -> &str`, what lifetime does elision assign to the return type?',
         'The third elision rule does not apply here, but the first two do: each input reference gets its own lifetime, and with exactly one input lifetime it is assigned to all outputs. So the return shares the input''s lifetime.',
         'Same lifetime as the single input reference.',
         'With one input reference, lifetime elision ties the output reference to that same input lifetime.',
         11
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''static`', false, 0),
       ('A fresh lifetime independent of the input', false, 1),
       ('The same lifetime as the input `s`', true, 2),
       ('Elision does not apply — you must annotate it explicitly', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 23] ('static lifetime) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the lifetime `''static` mean for a reference?',
         '`&''static T` means the referent is valid for the entire program duration. String literals are `&''static str`, and `T: ''static` means `T` contains no non-`''static` borrows.',
         'Valid for the entire program.',
         '`''static` indicates a reference whose referent lives for the whole program.',
         12
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is stored on the stack', false, 0),
       ('It can never be dropped', false, 1),
       ('It is a global variable', false, 2),
       ('Its referent is valid for the entire program run', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 24] (lifetimes on structs) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `struct Holder { r: &str }` fail to compile?',
         'Struct fields that hold references require explicit lifetime parameters, e.g. `struct Holder<''a> { r: &''a str }`. Elision rules don''t apply to struct definitions.',
         'Reference fields need an explicit lifetime parameter.',
         'A struct holding a reference must declare a lifetime parameter for that reference.',
         13
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`&str` is not allowed in struct fields', false, 0),
       ('Struct fields holding references require an explicit lifetime parameter', true, 1),
       ('`Holder` needs to derive `Copy`', false, 2),
       ('Structs cannot contain references without `unsafe`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 25] (longest signature) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A function returns the longer of two `&str`s. What is the correct signature?',
         'Both inputs and the output must share a single lifetime so the compiler knows the returned reference is valid as long as both inputs are valid: `fn longest<''a>(x: &''a str, y: &''a str) -> &''a str`.',
         '`fn longest<''a>(x: &''a str, y: &''a str) -> &''a str`.',
         'Both inputs and the output must share a single lifetime so the returned reference is valid as long as both inputs are.',
         14
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`fn longest(x: &str, y: &str) -> &str`', false, 0),
       ('`fn longest<''a, ''b>(x: &''a str, y: &''b str) -> &''a str`', false, 1),
       ('`fn longest<''a>(x: &''a str, y: &''a str) -> &''a str`', true, 2),
       ('`fn longest(x: &''static str, y: &''static str) -> &''static str`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 26] (impl block lifetime) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `impl<''a> Foo<''a> { ... }`, what does the `<''a>` after `impl` do?',
         'The `<''a>` on `impl` declares the generic lifetime parameter so it can be used in `Foo<''a>` and inside the impl body. Without it the lifetime would be undeclared.',
         'Declares `''a` for use in this impl block.',
         '`impl<''a>` introduces the lifetime parameter so it can be referenced in the type and methods.',
         15
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares `''a` so it can be used in the impl type and methods', true, 0),
       ('Restricts the impl to `''static` only', false, 1),
       ('Disables lifetime elision in the impl', false, 2),
       ('Is purely cosmetic and can always be omitted', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 29] (returning &str from String) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does a function that creates a local `String` and returns `&str` to it fail to compile?',
         'The local `String` is dropped at the end of the function, so any reference into it would dangle. The function should return the owned `String` (or `String`) instead.',
         'Returned `&str` would dangle as the local `String` drops.',
         'Returning a reference to a function-local owned value would dangle, so you must return the owned value itself.',
         16
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The local `String` is dropped when the function returns, so the `&str` would dangle', true, 0),
       ('`&str` cannot be returned from any function', false, 1),
       ('You must add `''static` to the return type', false, 2),
       ('`String` does not deref to `str`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 37] (match guards) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a "match guard" do, e.g. `Some(n) if n > 0 => ...`?',
         'A guard is an extra boolean condition attached to a match arm. The arm fires only if the pattern matches AND the guard evaluates true.',
         'Extra boolean condition on a match arm.',
         'A match guard adds a boolean condition that must also hold for the arm to be selected.',
         17
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It catches panics inside the arm', false, 0),
       ('It enforces exhaustiveness for the surrounding `match`', false, 1),
       ('It adds an extra boolean condition that must hold for the arm to fire', true, 2),
       ('It moves the matched value out of the scrutinee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 39] (..Default::default()) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the struct update syntax `..other` do in `Foo { a: 1, ..other }`?',
         '`..other` fills in the remaining fields of the new struct using values moved/copied from `other`. The explicitly listed fields override the corresponding ones from `other`.',
         'Take remaining fields from another instance.',
         'Struct update syntax pulls unspecified fields from another value of the same struct type.',
         18
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fills remaining fields from `other`, while explicit fields override its values', true, 0),
       ('Spreads `other` into a function call argument list', false, 1),
       ('Indicates a range pattern in a `match` arm', false, 2),
       ('Borrows `other` for the lifetime of the new struct', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 41] (default methods) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a trait default method?',
         'A default method body is provided in the trait itself; implementors get it for free unless they choose to override it. Defaults can call other (required) trait methods.',
         'A method body provided by the trait itself.',
         'Default methods supply a body in the trait so implementors inherit behavior unless they override it.',
         19
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A method automatically derived via `#[derive]`', false, 0),
       ('A method that panics if not overridden', false, 1),
       ('A method whose body is provided by the trait itself, so implementors inherit it unless overridden', true, 2),
       ('A method that exists only on `Box<dyn Trait>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 42] (trait objects) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `Box<dyn Trait>` an example of?',
         '`Box<dyn Trait>` is a trait object: a heap-allocated value with a pointer to the data and a vtable pointer for dynamic dispatch. It enables runtime polymorphism over different concrete types that implement `Trait`.',
         'A heap-allocated trait object (dynamic dispatch).',
         '`Box<dyn Trait>` is a trait object that enables dynamic dispatch via a vtable.',
         20
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A generic with a compile-time monomorphized type', false, 0),
       ('A type alias for `Trait`', false, 1),
       ('An unsafe pointer to a function table', false, 2),
       ('A heap-allocated trait object with a vtable for dynamic dispatch', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 43] (impl Trait) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `fn make() -> impl Iterator<Item = i32>` mean?',
         'The function returns some concrete type that implements `Iterator<Item = i32>`, chosen by the function. Callers know only the trait, and dispatch is still static (monomorphized).',
         'Returns some specific type implementing the trait, statically.',
         '`impl Trait` in return position hides a specific concrete type while keeping dispatch static.',
         21
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns a single concrete type chosen by the function that implements `Iterator<Item = i32>`, with static dispatch', true, 0),
       ('Returns a trait object with dynamic dispatch', false, 1),
       ('Returns any of multiple types depending on a runtime condition', false, 2),
       ('Returns a closure that produces iterators', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 44] (orphan rule) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the "orphan rule" for trait impls?',
         'You may implement a trait for a type only if either the trait or the type is defined in your crate. This prevents conflicting external impls and is sometimes called coherence.',
         'Either the trait or the type must be local.',
         'The orphan rule forbids implementing a foreign trait for a foreign type to preserve coherence.',
         22
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Traits cannot be implemented for primitive types', false, 0),
       ('You may implement a trait for a type only if either the trait or the type is defined in your crate', true, 1),
       ('Each trait can only be implemented once per crate', false, 2),
       ('You cannot have associated types on traits with generics', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 45] (blanket impl) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a "blanket impl"?',
         'A blanket impl is `impl<T> SomeTrait for T where T: OtherTrait { ... }` — it provides `SomeTrait` for every type satisfying the bound. The standard library uses this, for example, for `ToString` (any `T: Display`).',
         '`impl<T: B> A for T` — implements A for any T satisfying B.',
         'A blanket impl provides a trait for any type meeting a bound, e.g. `impl<T: Display> ToString for T`.',
         23
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An auto-generated impl from `#[derive]`', false, 0),
       ('An impl marked `unsafe`', false, 1),
       ('An impl of a trait for any type satisfying some bound, e.g. `impl<T: Display> ToString for T`', true, 2),
       ('An impl that overrides every default method', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 50] (monomorphization) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does Rust implement generic functions like `fn foo<T>(x: T)`?',
         'Rust uses monomorphization: at compile time it generates a separate, specialized copy of the function for each concrete type it is instantiated with. This produces fast, statically dispatched code.',
         'Monomorphization: one copy per concrete type.',
         'Generics in Rust are monomorphized, producing a specialized function for each concrete type at compile time.',
         24
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Through reflection and runtime type dispatch', false, 0),
       ('By boxing the argument so all calls share one function body', false, 1),
       ('Generics are erased at compile time, like Java''s type erasure', false, 2),
       ('By monomorphization: it generates a specialized copy of the function for each concrete `T` used', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 51] (trait bounds) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `fn print_all<T: Display>(xs: &[T])` say about `T`?',
         'The `T: Display` bound restricts `T` to types that implement the `Display` trait. Without that bound the function body could not call `Display`-only operations like `{}` formatting.',
         '`T` must implement `Display`.',
         'A trait bound like `T: Display` restricts `T` to types implementing that trait, granting access to its methods.',
         25
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`T` must implement the `Display` trait', true, 0),
       ('`T` is restricted to numeric types', false, 1),
       ('`T` must be heap-allocated', false, 2),
       ('`Display` is a default trait, so this bound is unnecessary', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 52] (where clauses) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When are `where` clauses preferred over inline bounds?',
         '`where` clauses separate bounds from the function signature, which is clearer when there are many bounds or when bounds involve associated types or complex expressions.',
         'When bounds are many or involve associated types.',
         '`where` clauses keep complex or numerous trait bounds out of the function signature for readability.',
         26
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are the only way to bound lifetimes', false, 0),
       ('Inline bounds are deprecated', false, 1),
       ('When bounds are complex or numerous, or involve associated types', true, 2),
       ('They make code run faster at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 53] (associated types) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is an "associated type" on a trait?',
         'An associated type is a placeholder type chosen by the implementor of the trait, e.g. `type Item;` on `Iterator`. Unlike a generic parameter, a type can implement the trait only once per choice of associated types.',
         'Type placeholder picked by the implementor.',
         'An associated type is a placeholder type the implementor chooses, fixed per impl, unlike a generic parameter.',
         27
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A type parameter the caller specifies at every call site', false, 0),
       ('A placeholder type that each implementor of the trait chooses, fixed per impl', true, 1),
       ('A type alias declared at module scope', false, 2),
       ('A runtime-determined type via reflection', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 56] (turbofish) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the "turbofish" syntax `::<T>` do?',
         'Turbofish explicitly supplies generic type arguments to a function or method call when type inference cannot, or would not, pick the type you want — e.g. `collect::<Vec<_>>()`.',
         'Explicitly specifies generic type arguments.',
         'Turbofish lets you pin down generic parameters at a call site, e.g. `parse::<u32>()`.',
         28
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Calls an unsafe variant of a function', false, 0),
       ('Explicitly supplies the generic type arguments to a call', true, 1),
       ('Forces inlining of the call', false, 2),
       ('Indicates dynamic dispatch via a trait object', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 58] (multiple impls) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you write more than one `impl` block for the same type?',
         'Yes — multiple `impl` blocks for the same type are allowed, often used to group related methods, conditionally implement methods behind feature flags, or restrict methods to specific generic bounds.',
         'Yes, multiple impl blocks for one type are allowed.',
         'Rust permits multiple `impl` blocks per type, which is useful for grouping or conditional methods.',
         29
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes — multiple `impl` blocks for the same type are allowed', true, 0),
       ('No, only one `impl` block per type is permitted', false, 1),
       ('Only if each block targets a different trait', false, 2),
       ('Only inside the standard library crate', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 59] (Self vs T in generic impl) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `impl<T: Clone> MyBox<T> { ... }`, what does the `T: Clone` part mean?',
         'It bounds the entire impl block: the methods inside are only available when `T` implements `Clone`. Calling these methods on a `MyBox<NonCloneType>` is a compile error.',
         'Methods in this impl require `T: Clone`.',
         'A bound on an `impl` block restricts the methods within to type arguments that satisfy it.',
         30
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It auto-derives `Clone` for `MyBox<T>`', false, 0),
       ('It forces all callers to clone their arguments', false, 1),
       ('It is just documentation and has no compile-time effect', false, 2),
       ('The methods in this impl are only available when `T: Clone`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 60] (iter vs into_iter) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `iter()`, `iter_mut()`, and `into_iter()` on a `Vec<T>`?',
         '`iter()` yields `&T`, `iter_mut()` yields `&mut T`, and `into_iter()` yields `T` by value, consuming the vector. The choice depends on whether you need to read, mutate, or take ownership.',
         '`&T`, `&mut T`, `T` (consumes) respectively.',
         '`iter`, `iter_mut`, and `into_iter` produce shared refs, mutable refs, and owned values respectively.',
         31
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They all yield `T` by value but differ in iteration order', false, 0),
       ('They yield `&T`, `&mut T`, and `T` (consuming the collection) respectively', true, 1),
       ('`iter` is lazy, `iter_mut` is eager, `into_iter` is parallel', false, 2),
       ('They are all aliases for the same function', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 61] (iterator laziness) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `v.iter().map(|x| x * 2);` (with no terminal operation) do nothing?',
         'Iterator adaptors like `map` and `filter` are lazy — they build a new iterator but do not execute the closure until a terminal operation (e.g., `collect`, `for`, `sum`) drives them.',
         'Iterator adaptors are lazy; need a terminal op.',
         'Iterator adaptors are lazy and only run when consumed by a terminal operation such as `collect` or `for`.',
         32
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`map` requires a mutable iterator, which `iter()` doesn''t produce', false, 0),
       ('The closure body is invalid Rust', false, 1),
       ('Iterator adaptors like `map` are lazy and require a terminal operation (e.g., `collect`, `for`) to execute', true, 2),
       ('The result is discarded by the compiler as dead code', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 62] (collect type ann) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why might `let v = iter.collect();` need a type annotation?',
         '`collect` is generic over the result collection (`FromIterator`). Without a target type via let binding or turbofish, the compiler can''t pick which collection to build.',
         '`collect` is generic; specify target type.',
         '`collect` needs to know the destination collection type, supplied via annotation or turbofish.',
         33
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`collect` is generic over the collection type and needs to know which to build', true, 0),
       ('`collect` requires `unsafe` without a hint', false, 1),
       ('Iterators only know their item type at runtime', false, 2),
       ('It is a parser limitation that has been removed in recent Rust', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 63] (Fn / FnMut / FnOnce) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which closure trait should a parameter take if the callback may consume captured values (call it once)?',
         '`FnOnce` accepts closures that may move out of (consume) their captures and thus can be called at least once. `Fn` and `FnMut` are stricter, requiring callability multiple times.',
         '`FnOnce` allows consuming captures.',
         '`FnOnce` is the most permissive bound — it accepts closures that may consume their captures.',
         34
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Fn`', false, 0),
       ('`FnOnce`', true, 1),
       ('`FnMut`', false, 2),
       ('`Copy`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 64] (Fn vs FnMut) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does a closure implement `Fn` but not `FnMut`?',
         'A closure implements `Fn` when it only captures by shared reference and never mutates its environment. `FnMut` is required when the closure mutates captured state through `&mut`.',
         'When it doesn''t mutate captured state.',
         'A closure that only borrows captures immutably implements `Fn`; mutating captures requires `FnMut`.',
         35
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When it consumes its captures', false, 0),
       ('When it uses the `move` keyword', false, 1),
       ('When it is `unsafe`', false, 2),
       ('When it does not mutate any captured state', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 65] (filter then map) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `v: Vec<i32>`, what does `v.iter().filter(|&&x| x > 0).map(|&x| x * 2).collect::<Vec<_>>()` produce?',
         'It keeps only the positive elements (`filter`), doubles each (`map`), then collects into a new `Vec<i32>`. The double-reference patterns dereference through the iterator''s `&i32` items.',
         'Doubled positives as `Vec<i32>`.',
         'The chain filters out non-positive elements and doubles the rest, yielding a new `Vec<i32>`.',
         36
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `Vec<i32>` of each positive element doubled', true, 0),
       ('A `Vec<i32>` of each element doubled regardless of sign', false, 1),
       ('A `Vec<&i32>` borrowing into the original', false, 2),
       ('An `Iterator<Item = i32>` that is not yet materialized', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 66] (iter::zip) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `a.iter().zip(b.iter())` produce?',
         '`zip` pairs corresponding elements of two iterators and stops when the shorter one is exhausted. Each item is a tuple `(A::Item, B::Item)`.',
         'Iterator of tuples, length = min of inputs.',
         '`zip` produces an iterator of pairs and stops when either input ends.',
         37
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A flattened iterator of all of `a`''s elements followed by `b`''s', false, 0),
       ('An iterator that errors if `a` and `b` have different lengths', false, 1),
       ('An iterator yielding `(a_i, b_i)` tuples, stopping at the shorter input', true, 2),
       ('A parallel iterator that processes both inputs concurrently', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 67] (fold) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `iter.fold(init, |acc, x| ...)` do?',
         '`fold` performs a left-to-right reduction starting from `init`, applying the closure to combine the current accumulator and each element. It is a terminal operation that returns the final accumulator.',
         'Left fold over the iterator with an accumulator.',
         '`fold` reduces an iterator left-to-right with a starting accumulator, returning the final value.',
         38
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Builds a new iterator that yields the running accumulator', false, 0),
       ('Reduces the iterator left-to-right starting from `init`, returning the final accumulator', true, 1),
       ('Sorts the iterator in place', false, 2),
       ('Pairs each element with `init` and yields tuples', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 68] (closure capture inference) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does Rust decide how a (non-`move`) closure captures its environment?',
         'Rust infers the least-restrictive capture mode that still works: by shared reference if possible, otherwise by mutable reference, otherwise by value. Each variable is considered independently.',
         'Least-restrictive: `&`, then `&mut`, then by value.',
         'Closures capture each variable using the least-restrictive mode that still type-checks.',
         39
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always by value', false, 0),
       ('Always by reference', false, 1),
       ('It always captures by mutable reference', false, 2),
       ('It infers the least-restrictive mode that works: `&`, then `&mut`, then by value', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 [orig 70] (? operator) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `?` operator do on a `Result`?',
         'On `Ok(v)` it evaluates to `v`. On `Err(e)` it returns early from the enclosing function with `Err(e.into())`, converting the error via `From` to the function''s declared error type.',
         'Unwrap `Ok` or early-return `Err` (with `From`).',
         'The `?` operator unwraps `Ok` or short-circuits `Err`, converting it via `From` to the function''s error type.',
         40
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Panics if the value is `Err`', false, 0),
       ('Asks the compiler to print the value', false, 1),
       ('Unwraps `Ok` or returns the error from the enclosing function, converting it via `From`', true, 2),
       ('Converts the `Result` into an `Option`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 [orig 71] (? on Option) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can `?` be used on an `Option<T>`?',
         'Yes. `?` on `Some(v)` yields `v`; on `None` it returns `None` from the enclosing function, which must therefore return `Option<_>` (or implement `Try` with compatible residual types).',
         'Yes, in functions returning `Option<_>`.',
         '`?` works on `Option` inside functions whose return type is also an `Option`.',
         41
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes — in a function returning `Option<_>`, `?` unwraps `Some` or returns `None`', true, 0),
       ('No, `?` only works on `Result`', false, 1),
       ('Yes, but it panics on `None`', false, 2),
       ('Only inside `unsafe` blocks', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 [orig 72] (panic vs Result) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is `panic!` preferable to returning a `Result`?',
         '`panic!` is appropriate for unrecoverable bugs and broken invariants where continuing would be unsound. Recoverable, expected failures (I/O, parsing) should use `Result`.',
         'For unrecoverable bugs / invariant violations.',
         '`panic!` signals programmer error or invariant violations; `Result` is for expected, recoverable failures.',
         42
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always — `panic!` is shorter to type', false, 0),
       ('For unrecoverable programmer errors / invariant violations, not for expected failure modes', true, 1),
       ('Whenever you want the caller to be able to handle the error', false, 2),
       ('Inside library code that should not crash callers', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 [orig 74] (Error trait) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of the standard `std::error::Error` trait?',
         '`Error` provides a common interface for error types — primarily `Display`, `Debug`, and an optional `source()` chain. Library and application errors typically implement it to interoperate with generic error handling.',
         'Common interface for error types (`Display`, `source`).',
         'The `Error` trait standardizes the interface for error types, enabling generic error handling and chaining.',
         43
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It catches all panics', false, 0),
       ('It implements `Result` automatically', false, 1),
       ('It defines a common interface for error types, including `Display`, `Debug`, and optional `source()` chaining', true, 2),
       ('It enables async error handling', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 [orig 75] (Box<dyn Error>) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is `Result<T, Box<dyn Error>>` a useful return type?',
         '`Box<dyn Error>` erases the concrete error type, letting a function bubble up many different error kinds without enumerating them. It is common in small applications and `main` functions, less so in libraries.',
         'When you want to combine many error types loosely.',
         '`Box<dyn Error>` lets you propagate multiple error kinds through one return type, useful in apps and small binaries.',
         44
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When you want to propagate many different error types through one signature, e.g. in `main`', true, 0),
       ('When you need maximum performance in a hot loop', false, 1),
       ('When the error must be `Copy`', false, 2),
       ('When you want to convert all errors to `String`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 [orig 76] (From trait + ?) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `?` integrate with the `From` trait?',
         '`?` calls `From::from` on the error when the inner error type differs from the function''s declared error type. Implementing `From` for your error lets foreign errors auto-convert when propagated with `?`.',
         '`?` auto-converts errors via `From::from`.',
         '`?` calls `From::from` on the error, enabling automatic conversion between error types when propagating.',
         45
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It doesn''t — `?` only works when the error types match exactly', false, 0),
       ('`?` calls `From::from` on the inner error to convert it to the function''s error type', true, 1),
       ('`From` is required to derive `Debug` for the error', false, 2),
       ('`From` is used by `?` to convert successes, not errors', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 [orig 77] (panic unwinding) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens by default when `panic!` is invoked in a Rust program?',
         'By default Rust unwinds the stack, running `Drop` impls along the way, then exits the thread. With `panic = "abort"` in `Cargo.toml`, the process is aborted instead. A panic in `main` terminates the program.',
         'Stack unwinds, dropping locals; thread exits.',
         'A panic unwinds the stack by default, running destructors and ending the current thread.',
         46
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The program continues silently with default values', false, 0),
       ('The CPU executes a hardware interrupt', false, 1),
       ('The stack unwinds, running destructors, and the current thread exits', true, 2),
       ('The OS process restarts itself', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 [orig 78] (Result::map_err) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Result::map_err` do?',
         '`map_err` applies a function only to the `Err` variant, transforming the error type. The `Ok` variant passes through unchanged. It is useful when you need to adapt an error type before `?`-propagating it.',
         'Transform the `Err` value via a function.',
         '`map_err` transforms the error inside `Err`, leaving `Ok` untouched.',
         47
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always returns `Err`', false, 0),
       ('Discards the error and returns a default `Ok`', false, 1),
       ('Applies a function to the success value', false, 2),
       ('Applies a function to transform the `Err` value, leaving `Ok` unchanged', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 [orig 79] (thiserror role) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the popular `thiserror` crate help you do?',
         '`thiserror` provides a derive macro that generates `Display`, `Error`, and `From` impls for custom error enums based on attribute annotations, reducing boilerplate for library error types.',
         'Derive `Error`/`Display`/`From` for custom errors.',
         '`thiserror` cuts boilerplate by deriving `Display`, `Error`, and `From` impls for your error types.',
         48
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Generate `Display`, `Error`, and `From` impls for your own error enums via `#[derive(Error)]`', true, 0),
       ('Convert all panics into `Result` automatically', false, 1),
       ('Add async support to your error types', false, 2),
       ('Replace `Result` with a faster alternative', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 [orig 80] (Box) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `Box<T>` in Rust?',
         '`Box<T>` is a smart pointer that owns a heap-allocated `T`. Dropping the box deallocates the value. It is commonly used for recursive types, large values, or to create trait objects.',
         'Owned heap pointer to a `T`.',
         '`Box<T>` is an owning heap pointer used for recursion, large data, or trait objects.',
         49
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A reference-counted shared pointer', false, 0),
       ('A smart pointer that exclusively owns a heap-allocated `T`', true, 1),
       ('A lock that grants exclusive mutable access', false, 2),
       ('A thread-local storage primitive', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 [orig 81] (Rc) ------------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Rc<T>` provide?',
         '`Rc<T>` is a single-threaded reference-counted shared pointer. Cloning increments the count; dropping decrements it; the value is freed when the count reaches zero. It is not `Send`/`Sync`.',
         'Single-thread shared ownership via ref counts.',
         '`Rc<T>` provides shared ownership of a heap value in single-threaded code via non-atomic reference counting.',
         50
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Atomic reference counting safe across threads', false, 0),
       ('Mutable shared access enforced at runtime', false, 1),
       ('Exclusive ownership similar to `Box`', false, 2),
       ('Single-threaded shared ownership via non-atomic reference counting', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 [orig 82] (Arc) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `Arc<T>` differ from `Rc<T>`?',
         '`Arc<T>` is the atomic equivalent of `Rc<T>`: the reference count is updated with atomic operations, making it `Send` and `Sync` so it can be shared across threads. It is slightly more expensive than `Rc`.',
         '`Arc` is atomic + thread-safe; `Rc` is not.',
         '`Arc<T>` uses atomic ref counts so it can be shared across threads, unlike `Rc<T>`.',
         51
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Arc` uses atomic reference counts and is safe to share across threads; `Rc` is single-threaded', true, 0),
       ('`Arc` is faster than `Rc` in single-threaded code', false, 1),
       ('`Arc` is mutable while `Rc` is immutable', false, 2),
       ('They are aliases for the same type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 [orig 83] (RefCell) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `RefCell<T>` enable?',
         '`RefCell<T>` provides interior mutability with borrow-checker rules enforced at runtime, panicking on violations. It is single-threaded (not `Sync`). Use `borrow()` and `borrow_mut()` for runtime-checked references.',
         'Runtime-checked interior mutability (single-thread).',
         '`RefCell<T>` moves Rust''s borrow rules from compile time to runtime, panicking on violation.',
         52
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sharing data safely across threads', false, 0),
       ('Compile-time enforcement of borrowing rules', false, 1),
       ('Interior mutability with borrow-checker rules enforced at runtime (panics on violation)', true, 2),
       ('Automatic memory deallocation when count hits zero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 [orig 84] (Mutex) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Mutex<T>` provide?',
         '`Mutex<T>` is a mutual-exclusion primitive: `.lock()` returns a guard granting exclusive access to the inner `T`. It is thread-safe and is typically combined with `Arc` for shared ownership across threads.',
         'Thread-safe exclusive access via a lock guard.',
         '`Mutex<T>` enforces exclusive access to its contents across threads via a lock guard.',
         53
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reference-counted shared ownership across threads', false, 0),
       ('Thread-safe exclusive access to a value via a lock guard returned by `.lock()`', true, 1),
       ('Compile-time mutual exclusion at the function level', false, 2),
       ('Lock-free atomic operations on primitives', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 [orig 85] (Arc<Mutex>) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `Arc<Mutex<T>>` a common pattern?',
         '`Arc` provides thread-safe shared ownership, and `Mutex` provides thread-safe interior mutability. Together they let multiple threads share and mutate the same value safely.',
         'Shared ownership + thread-safe mutation.',
         '`Arc<Mutex<T>>` combines shared ownership with thread-safe interior mutability.',
         54
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It combines thread-safe shared ownership (`Arc`) with thread-safe interior mutability (`Mutex`)', true, 0),
       ('`Arc` requires `Mutex` to compile', false, 1),
       ('It removes the need for `Send` and `Sync`', false, 2),
       ('It is faster than either `Arc` or `Mutex` alone', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 [orig 87] (Drop trait) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the role of the `Drop` trait?',
         '`Drop` lets a type customize what happens when one of its values goes out of scope. The `drop` method runs deterministically; you cannot call it directly (use `std::mem::drop` instead).',
         'Custom destructor on scope exit.',
         '`Drop` provides a custom destructor that runs deterministically when the value goes out of scope.',
         55
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Drops the value from memory eagerly when assigned', false, 0),
       ('Marks a type as ineligible for `Copy`', false, 1),
       ('Schedules destruction by a background GC', false, 2),
       ('Lets a type run custom code when it goes out of scope (a destructor)', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 [orig 88] (deref coercion) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "deref coercion"?',
         'When a value is passed where a reference is expected, the compiler may automatically apply `Deref` to convert, e.g. `&String` to `&str` or `&Box<T>` to `&T`. This makes generic APIs ergonomic.',
         'Auto `Deref` conversion between reference types.',
         'Deref coercion automatically converts `&T` into `&U` when `T: Deref<Target = U>`.',
         56
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The compiler automatically applies `Deref` to convert `&T` to `&U` when expected', true, 0),
       ('It is an `unsafe` cast between pointer types', false, 1),
       ('It performs a deep clone of the underlying value', false, 2),
       ('It is only available with `Box<T>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 [orig 90] (thread::spawn) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::thread::spawn(|| { ... })` return?',
         '`spawn` returns a `JoinHandle<T>` representing the new thread. Calling `.join()` on it blocks until the thread finishes and yields the closure''s return value as a `Result`.',
         'A `JoinHandle<T>`.',
         '`thread::spawn` returns a `JoinHandle<T>` you can `join()` to await the thread.',
         57
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `Result<(), ThreadError>`', false, 0),
       ('A `Future` that must be `.await`ed', false, 1),
       ('A `JoinHandle<T>` that can be `.join()`ed to await the thread''s result', true, 2),
       ('Nothing; spawn is fire-and-forget', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 [orig 93] (mpsc channels) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::sync::mpsc::channel()` produce?',
         'It returns a `(Sender<T>, Receiver<T>)` pair forming a multi-producer, single-consumer channel. `Sender` can be cloned for multiple producers; `Receiver` cannot.',
         '`(Sender<T>, Receiver<T>)` — multi-producer, single-consumer.',
         '`mpsc::channel` returns a sender/receiver pair where the sender can be cloned but the receiver cannot.',
         58
  from modules where slug = 'rust-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A bidirectional pipe between two threads', false, 0),
       ('A `(Sender<T>, Receiver<T>)` pair — multiple senders, one receiver', true, 1),
       ('A broadcast channel — multiple receivers, one sender', false, 2),
       ('A futures-based async channel', false, 3)
     ) as c(label, is_correct, order_index);

-- ============================================================
-- rust-3
-- ============================================================

-- Question 0 [orig 12] (NLL) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "non-lexical lifetimes" (NLL) refer to in modern Rust?',
         'NLL means a borrow''s effective lifetime ends at its last use, not at the end of the enclosing block. This allows code where an old borrow is no longer needed before a new one starts.',
         'Borrows end at last use, not end of block.',
         'Non-lexical lifetimes shorten a borrow''s lifetime to its last use rather than the end of the lexical scope.',
         0
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Lifetimes are inferred only for `static` references', false, 0),
       ('A borrow''s effective lifetime ends at its last use rather than the end of its scope', true, 1),
       ('Lifetime annotations are no longer required anywhere', false, 2),
       ('References automatically convert into owned values when needed', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 13] (reborrow) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a "reborrow" in Rust?',
         'A reborrow creates a shorter-lived reference from an existing one (often implicitly), letting the original `&mut T` be reused after the reborrow ends. It is how you pass a `&mut T` to a function without permanently moving the borrow.',
         'Short-lived reference derived from another reference.',
         'A reborrow temporarily derives a shorter-lived reference from an existing one, releasing it back to the original when done.',
         1
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Calling `.clone()` on a reference', false, 0),
       ('Casting a `&T` to a `*const T` raw pointer', false, 1),
       ('Promoting a stack value to a `''static` reference', false, 2),
       ('Creating a shorter-lived reference from an existing one so the original can be reused afterward', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 22] (lifetime elision rule 3) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `impl Foo { fn bar(&self, s: &str) -> &str { ... } }`, which lifetime does the returned `&str` get?',
         'The third elision rule says when there is a `&self` (or `&mut self`) input, its lifetime is assigned to all output references. The other input''s lifetime is ignored for the output.',
         '`&self`''s lifetime.',
         'When a method has `&self`, the output reference''s lifetime is elided to match `&self`.',
         2
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The lifetime of `&self`', true, 0),
       ('The lifetime of `s`', false, 1),
       ('`''static`', false, 2),
       ('The shorter of the two input lifetimes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 27] (T: 'static bound) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the bound `T: ''static` mean?',
         '`T: ''static` means `T` may only contain borrows that live for `''static`, or no borrows at all. It does not require the value itself to live forever — only that it has no shorter-lived references inside.',
         '`T` contains no non-`''static` borrows.',
         '`T: ''static` restricts `T` to types that own their data or only borrow `''static` data.',
         3
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`T` must be a `const` item', false, 0),
       ('`T` must implement `Copy`', false, 1),
       ('Values of `T` must live for the entire program', false, 2),
       ('`T` contains no references that are shorter than `''static`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 28] (lifetime subtyping) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If `''long: ''short`, what does that bound express?',
         'It means lifetime `''long` outlives (is at least as long as) `''short`. A `&''long T` can therefore be used wherever a `&''short T` is expected.',
         '`''long` outlives `''short`.',
         'A lifetime bound `''long: ''short` says `''long` lives at least as long as `''short`.',
         4
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`''long` and `''short` must be equal', false, 0),
       ('`''long` outlives `''short` (lives at least as long)', true, 1),
       ('`''short` outlives `''long`', false, 2),
       ('Both lifetimes must be `''static`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 46] (object safety) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why might a trait fail to be usable as `dyn Trait` (i.e., not "object safe")?',
         'A trait is not object safe if it has methods returning `Self`, generic methods, or other constructs that can''t be dispatched through a vtable. Such methods would need a concrete `Self` known at compile time.',
         'Methods using `Self` or generics aren''t vtable-dispatchable.',
         'Methods returning `Self` or that are generic prevent a trait from being used as `dyn Trait`.',
         5
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Because the trait has too many methods to fit in a vtable', false, 0),
       ('Because it has default methods', false, 1),
       ('Because it derives `Debug`', false, 2),
       ('Because it has methods returning `Self` or generic methods, which can''t be dispatched via a vtable', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 48] (Trait + 'static) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `Box<dyn Trait>` (without an explicit lifetime) implicitly mean `Box<dyn Trait + ''static>`?',
         'For trait objects, Rust applies a default lifetime bound. Inside a `Box<dyn Trait>` (an owned container), the default is `''static`, which means the underlying type may not contain non-`''static` borrows.',
         'Default trait-object lifetime in `Box` is `''static`.',
         'Trait objects inside owned containers like `Box` default to `''static` lifetime bounds unless overridden.',
         6
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Box` requires its contents to be `Copy`, which implies `''static`', false, 0),
       ('Trait objects in owned containers default to a `''static` lifetime bound', true, 1),
       ('All heap-allocated values are `''static` in Rust', false, 2),
       ('The orphan rule forces `''static` on trait objects', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 54] (Iterator::Item) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `Iterator` use `type Item;` rather than `trait Iterator<Item>`?',
         'A given iterator produces exactly one item type — making `Item` an associated type ensures each iterator type implements `Iterator` only once and avoids ambiguity at call sites.',
         'One iterator type yields one item type.',
         'Associated types like `Iterator::Item` enforce that a type implements the trait only once, which matches the "one item type per iterator" semantics.',
         7
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It''s a historical accident with no semantic difference', false, 0),
       ('Generic parameters can''t carry methods', false, 1),
       ('Associated types are faster at runtime', false, 2),
       ('A type implements `Iterator` only once, so the item type belongs to the impl, not the trait''s call sites', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 57] (PhantomData) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `PhantomData<T>` used for?',
         '`PhantomData<T>` is a zero-sized marker that tells the compiler your struct "logically owns" or borrows a `T` even though no field actually stores one. It affects variance, drop-check, and `Send`/`Sync` auto-traits.',
         'Zero-sized marker for "logically uses `T`".',
         '`PhantomData<T>` is a zero-sized marker that makes the compiler treat a struct as if it owned/borrowed a `T` for variance and auto-trait purposes.',
         8
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A heap allocation marker required by `unsafe` code', false, 0),
       ('A way to lazily initialize a generic field', false, 1),
       ('A zero-sized marker that tells the compiler the struct logically uses a `T` for variance and drop-check', true, 2),
       ('A runtime tag identifying `T`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 69] (closure as type) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why do two seemingly-identical closures often have different concrete types?',
         'Each closure expression generates a unique, anonymous compiler-generated type. Even closures with the same signature are different types, which is why functions accepting closures use trait bounds (`Fn`, `FnMut`, `FnOnce`) instead of concrete types.',
         'Each closure has a unique anonymous type.',
         'Every closure has its own unique anonymous type, so functions accept them via `Fn`/`FnMut`/`FnOnce` bounds.',
         9
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Each closure expression produces a unique anonymous compiler-generated type', true, 0),
       ('Closures are typed by their argument names', false, 1),
       ('Closures are always typed as `dyn Fn`', false, 2),
       ('Closures have type `()` unless annotated', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 86] (Cell vs RefCell) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `Cell<T>` differ from `RefCell<T>`?',
         '`Cell<T>` provides interior mutability via copy/replace operations (`get`, `set`) on `Copy` (or movable) types without handing out references. `RefCell<T>` hands out `Ref`/`RefMut` guards with runtime borrow checking.',
         '`Cell` swaps values; `RefCell` hands out refs.',
         '`Cell` mutates via value-replacing operations, while `RefCell` issues runtime-checked references.',
         10
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical; the names are aliases', false, 0),
       ('`Cell` is thread-safe; `RefCell` is not', false, 1),
       ('`Cell` swaps whole values without handing out references; `RefCell` hands out runtime-checked borrows', true, 2),
       ('`Cell` requires `unsafe` to use', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 89] (Weak) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What problem does `Weak<T>` solve with `Rc`/`Arc`?',
         '`Weak<T>` is a non-owning reference that doesn''t keep the value alive. It is used to break reference cycles (e.g., parent ↔ child links) that would otherwise leak memory under reference counting.',
         'Breaks reference cycles in `Rc`/`Arc`.',
         '`Weak<T>` is a non-owning handle used to break cycles that would leak memory under `Rc`/`Arc`.',
         11
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Makes ref-counted pointers thread-safe', false, 0),
       ('Provides non-owning references that break cycles in ref-counted graphs', true, 1),
       ('Speeds up cloning of `Rc`/`Arc`', false, 2),
       ('Allows mutation through an `Rc`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 91] (Send) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `Send` auto-trait indicate?',
         '`Send` means values of the type can be safely transferred (moved) to another thread. Most types are `Send`; notable exceptions include `Rc<T>` and raw pointers.',
         'Safe to move to another thread.',
         '`Send` types can be safely transferred across thread boundaries by value.',
         12
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Safe to share concurrently between threads', false, 0),
       ('Implements `Drop` for cleanup', false, 1),
       ('Must implement `Copy`', false, 2),
       ('Safe to transfer ownership of values across thread boundaries', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 92] (Sync) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Sync` mean?',
         '`T: Sync` means it''s safe for multiple threads to hold `&T` simultaneously; equivalently, `&T: Send`. Types like `Cell` and `RefCell` deliberately are not `Sync`.',
         '`&T` is safe to share across threads.',
         '`Sync` means a type''s shared references are safe to use from multiple threads concurrently.',
         13
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sharing `&T` between threads is safe (equivalently, `&T: Send`)', true, 0),
       ('Ownership can be transferred between threads', false, 1),
       ('The type uses synchronous I/O only', false, 2),
       ('The type requires a global lock', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 94] (async fn) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does calling an `async fn` actually do?',
         'Calling an `async fn` does not run the body; it returns a `Future` that, when polled by an executor, drives the body forward. The body only progresses when awaited.',
         'Returns a `Future`; doesn''t run the body yet.',
         'An `async fn` call returns a `Future` that must be polled by an executor before any work happens.',
         14
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Immediately runs the body on a background thread', false, 0),
       ('Runs the body synchronously and returns its value', false, 1),
       ('Returns a `Future` that does no work until it is polled by an executor', true, 2),
       ('Blocks the current thread until completion', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 95] (await) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `.await` operator do?',
         '`.await` polls a `Future` and yields control back to the executor whenever the future is not ready. When the future eventually completes, the surrounding `async` resumes with its output.',
         'Polls a `Future`; yields to executor if pending.',
         '`.await` drives a `Future`, yielding to the executor when not ready and resuming on completion.',
         15
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Spawns a new OS thread to run the future', false, 0),
       ('Blocks the current OS thread until the future completes', false, 1),
       ('Converts a `Future` into a `Result`', false, 2),
       ('Polls the `Future`, yielding to the executor while it isn''t ready, then resumes when complete', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 96] (no built-in runtime) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Does Rust ship a built-in async runtime to actually drive `Future`s?',
         'No — Rust''s standard library defines `Future` and the `async`/`await` syntax, but executing futures requires an external runtime crate such as `tokio` or `async-std`.',
         'No; use `tokio`/`async-std`/etc.',
         'Rust has no built-in async executor; you choose a runtime like `tokio` to drive `Future`s.',
         16
  from modules where slug = 'rust-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — you choose an executor like `tokio` or `async-std`', true, 0),
       ('Yes, `std::async::run` is the default runtime', false, 1),
       ('Yes, but only on nightly Rust', false, 2),
       ('Yes, the compiler embeds a green-thread scheduler', false, 3)
     ) as c(label, is_correct, order_index);
