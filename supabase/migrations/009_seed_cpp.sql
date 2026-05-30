-- 009_seed_cpp.sql
-- C++ modules: split into three difficulty levels (16 / 55 / 29 questions). Module rows are in 006_seed_more_modules.sql.

-- ============================================================
-- cpp-1
-- ============================================================

-- Question 0 [orig 0] (references vs pointers) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement best describes the difference between a C++ reference and a pointer?',
         'A reference must be initialized when declared and cannot be rebound to refer to another object; a pointer can be null, reassigned, and reseated.',
         'Reference: bound at init, non-null, non-reseatable. Pointer: nullable and reseatable.',
         'References must be bound at initialization and cannot be reseated, while pointers can be null and reassigned.',
         0
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('References can be null but pointers cannot', false, 0),
       ('References must be initialized and cannot be reseated; pointers can be null and reassigned', true, 1),
       ('References and pointers are exactly equivalent under the hood', false, 2),
       ('Pointers must be initialized at declaration; references need not be', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 1] (const correctness) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `const int* p;`, which of the following is true?',
         'In `const int* p`, the `const` applies to the pointee — you cannot modify `*p`, but you may reassign `p` itself to point elsewhere.',
         '`const int* p` — pointer to const int; pointee is read-only, pointer is mutable.',
         'In `const int* p`, the pointed-to value is const but the pointer itself can be reassigned.',
         1
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`p` cannot be reassigned, but `*p` can be modified', false, 0),
       ('Both `p` and `*p` are immutable', false, 1),
       ('`*p` cannot be modified, but `p` can be reassigned', true, 2),
       ('Neither `p` nor `*p` is constrained — `const` here is decorative', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 2] (top-level vs low-level const) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `int* const p` mean?',
         '`int* const p` is a const pointer to a non-const int: `p` cannot be reseated, but `*p` may be modified.',
         '`int* const p` — const pointer to mutable int.',
         '`int* const p` declares a pointer whose target may change but the pointer itself cannot be reassigned.',
         2
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pointer to a const int', false, 0),
       ('Const pointer to a const int', false, 1),
       ('Const pointer to a non-const int', true, 2),
       ('Same as `const int* p`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 3] (namespaces) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `using namespace std;` discouraged at file scope in headers?',
         'Placing `using namespace std;` in a header leaks the entire `std` namespace into every translation unit that includes it, causing name collisions and ambiguity.',
         'Pollutes every includer''s global scope with `std` names.',
         'It pollutes the global namespace of every file that includes the header, risking name collisions.',
         3
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It slows compilation significantly', false, 0),
       ('It is a runtime error', false, 1),
       ('It prevents linking against the standard library', false, 2),
       ('It leaks `std` names into every translation unit that includes the header', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 6] (pass-by const ref) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is passing a large object by `const T&` typically preferred over passing by value?',
         'Passing by `const T&` avoids the cost of copying a large object while still preventing modification through the reference.',
         'Avoids the copy; still read-only via `const&`.',
         'Passing by `const T&` avoids an expensive copy while guaranteeing the callee cannot mutate the argument.',
         4
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It allows the function to modify the caller''s object', false, 0),
       ('It guarantees thread safety', false, 1),
       ('It avoids copying while preventing the callee from modifying the argument', true, 2),
       ('It is required by the standard for objects larger than 16 bytes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 7] (nullptr vs NULL) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why was `nullptr` introduced in C++11?',
         '`nullptr` has type `std::nullptr_t` and avoids the ambiguity of `NULL`, which is typically an integer literal `0` and can match integral overloads instead of pointer overloads.',
         '`nullptr` is type-safe (`std::nullptr_t`); `NULL` is `int 0`.',
         '`nullptr` provides a type-safe null pointer constant that resolves overload ambiguities `NULL` (an integer) causes.',
         5
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To make pointers faster at runtime', false, 0),
       ('To replace `void*`', false, 1),
       ('To deprecate raw pointers entirely', false, 2),
       ('To provide a type-safe null pointer that avoids overload ambiguity with integer `NULL`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 8] (header guards / pragma once) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the primary purpose of an include guard such as `#ifndef FOO_H`?',
         'Include guards prevent the contents of a header from being processed more than once in the same translation unit, avoiding redefinition errors.',
         'Prevents multiple inclusion of the same header in one translation unit.',
         'Include guards stop a header''s contents from being included more than once per translation unit.',
         6
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To prevent a header from being included more than once in the same translation unit', true, 0),
       ('To force the compiler to inline all functions in the header', false, 1),
       ('To make the header thread-safe', false, 2),
       ('To strip comments from the header', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 9] (constexpr basics) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `constexpr` specifier on a function indicate?',
         '`constexpr` means the function is eligible for evaluation at compile time when called with constant arguments; it may still be evaluated at runtime when its inputs are not constant expressions.',
         'May be evaluated at compile time given constant inputs.',
         '`constexpr` marks a function as eligible for compile-time evaluation when invoked with constant-expression arguments.',
         7
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The function must be inlined', false, 0),
       ('The function may be evaluated at compile time when called with constant-expression arguments', true, 1),
       ('The function is implicitly `static`', false, 2),
       ('The function cannot be called at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 13] (copy constructor) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the canonical signature of a copy constructor for class `T`?',
         'A copy constructor takes a single argument of type `const T&` (or `T&`) — it must take a reference to avoid infinite recursion, and `const` lets it accept rvalues and const lvalues.',
         '`T(const T&)`',
         'The canonical copy constructor signature is `T(const T&)`.',
         8
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`T(T)`', false, 0),
       ('`T(const T&)`', true, 1),
       ('`T(T*)`', false, 2),
       ('`T(T&&)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 28] (function template basics) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the role of the `template <typename T>` declaration?',
         'It introduces a template parameter `T`; the function or class is a pattern from which the compiler instantiates concrete versions on demand for the deduced or supplied types.',
         'Declares a type parameter for compiler-generated instantiations.',
         '`template <typename T>` introduces a type parameter that the compiler binds to concrete types at instantiation.',
         9
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares a type parameter for compiler-generated instantiations', true, 0),
       ('Declares a runtime-dispatched generic function', false, 1),
       ('Reserves memory for the template at link time', false, 2),
       ('Is equivalent to `auto` in the parameter list', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 40] (std::array) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `std::array<T, N>` differ from a raw C array?',
         '`std::array` wraps a fixed-size array with STL conveniences (`size()`, iterators, value semantics, bounds-checked `at()`) and does not decay to a pointer on assignment.',
         'Fixed-size, value-typed, STL-aware wrapper for `T[N]`.',
         '`std::array` is a fixed-size, value-semantic STL container that does not decay to a pointer.',
         10
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It has value semantics, knows its size, exposes iterators, and does not decay to a pointer', true, 0),
       ('It is heap-allocated', false, 1),
       ('Its size is set at runtime', false, 2),
       ('It cannot be passed to STL algorithms', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 44] (set vs multiset) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `std::set` and `std::multiset`?',
         '`std::set` stores unique keys; `std::multiset` allows duplicate keys — both keep elements ordered and offer O(log n) operations.',
         '`set`: unique keys. `multiset`: duplicates allowed.',
         '`std::set` enforces unique keys, while `std::multiset` permits duplicates.',
         11
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`set` enforces unique keys; `multiset` allows duplicates', true, 0),
       ('`multiset` is unordered; `set` is ordered', false, 1),
       ('`multiset` is hash-based; `set` is tree-based', false, 2),
       ('They are different names for the same container', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 48] (range-for) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `for (auto x : v)`, what does the loop variable `x` represent?',
         'Without a reference, `x` is a copy of each element. To avoid copies use `auto&` (mutable) or `const auto&` (read-only).',
         'A copy of each element; use `auto&` to avoid copies.',
         'In `for (auto x : v)`, `x` is a per-iteration copy of each element; reference qualifiers avoid copying.',
         12
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A by-value copy of each element', true, 0),
       ('A reference to each element', false, 1),
       ('A pointer to each element', false, 2),
       ('An iterator to each element', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 50] (std::find return) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::find` return when the value is not present in the range?',
         '`std::find(first, last, val)` returns the end iterator of the range when no element compares equal to `val`. Compare the result against `last` to detect "not found".',
         'The `last` iterator passed in.',
         '`std::find` returns the supplied `last` iterator when the value is not found.',
         13
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A null iterator', false, 0),
       ('Throws an exception', false, 1),
       ('The `last` iterator passed in', true, 2),
       ('An iterator to the first element', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 52] (std::find_if) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which algorithm searches a range for the first element satisfying a predicate?',
         '`std::find_if(first, last, pred)` returns an iterator to the first element for which `pred(elem)` is true, or `last` if none matches.',
         '`std::find_if`.',
         '`std::find_if` returns an iterator to the first element matching a unary predicate.',
         14
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`std::find_if`', true, 0),
       ('`std::for_each`', false, 1),
       ('`std::transform`', false, 2),
       ('`std::accumulate`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 87] (string vs c-string) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `std::string` generally preferred over a `char*` in modern C++?',
         '`std::string` is an owning, RAII container that manages its own storage, knows its size, supports concatenation, comparison, and small-string optimization, and avoids manual `new`/`delete` and buffer bugs.',
         'Owns storage, knows size, manages lifetime, supports operators.',
         '`std::string` owns its storage and provides safe, value-typed operations, unlike raw `char*` buffers.',
         15
  from modules where slug = 'cpp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is always allocated on the stack', false, 0),
       ('It is faster than any C string operation', false, 1),
       ('It is a `constexpr` type by default', false, 2),
       ('It owns its memory, tracks size, supports operators, and prevents manual buffer bugs', true, 3)
     ) as c(label, is_correct, order_index);

-- ============================================================
-- cpp-2
-- ============================================================

-- Question 0 [orig 4] (auto type deduction) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For `auto x = expr;`, how does C++ deduce the type of `x`?',
         '`auto` uses template-style deduction: top-level cv-qualifiers and references on the initializer are stripped, so `auto` infers a value type by default.',
         '`auto` deduces by value: drops references and top-level const.',
         '`auto` follows template deduction rules and strips references and top-level cv-qualifiers from the initializer.',
         0
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Same as template type deduction — references and top-level const are dropped', true, 0),
       ('It preserves all qualifiers and reference-ness from the initializer', false, 1),
       ('It always deduces a reference type', false, 2),
       ('It defers deduction to link time', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 10] (default constructor) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does the compiler implicitly generate a default constructor for a class?',
         'A default constructor is implicitly declared (and defined when used) only if the user has not declared any constructor at all for the class.',
         'Only when no user-declared constructor exists.',
         'The compiler generates a default constructor only when the user has not declared any constructor for the class.',
         1
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always, regardless of other constructors', false, 0),
       ('Only when the class has virtual functions', false, 1),
       ('Only when the user has not declared any constructor', true, 2),
       ('Only when the class has no data members', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 11] (initializer list) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why should class members typically be initialized in a constructor''s member initializer list rather than assigned inside the body?',
         'The member initializer list directly constructs members, avoiding a default construction followed by assignment. It is also required for `const` and reference members.',
         'Direct construction; required for `const`/reference members.',
         'Member initializer lists directly construct members, which is more efficient and is required for `const` and reference members.',
         2
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is purely stylistic with no semantic difference', false, 0),
       ('It allows constructors to be `virtual`', false, 1),
       ('It permits skipping member destructors', false, 2),
       ('It directly constructs members (avoiding default + assign) and is required for `const`/reference members', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 12] (destructor virtual) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why should a base class intended for polymorphic use declare its destructor `virtual`?',
         'Deleting a derived object through a base pointer with a non-virtual destructor is undefined behavior — making the base destructor `virtual` ensures the correct derived destructor runs.',
         'So `delete base_ptr;` runs the derived destructor.',
         'A virtual destructor ensures the derived destructor is invoked when deleting an object through a base pointer.',
         3
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('So that deleting through a base pointer invokes the derived destructor', true, 0),
       ('To enable copy elision', false, 1),
       ('To force inlining', false, 2),
       ('To allow the destructor to be `constexpr`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 14] (rule of three) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The Rule of Three states that if a class defines any one of which trio of special members, it should generally define all three?',
         'The Rule of Three: if a class needs a user-declared destructor, copy constructor, or copy assignment operator, it almost certainly needs all three (typically because it manages a resource).',
         'Destructor, copy constructor, copy assignment.',
         'The Rule of Three covers the destructor, copy constructor, and copy assignment operator.',
         4
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Constructor, destructor, swap', false, 0),
       ('Move ctor, move assignment, destructor', false, 1),
       ('Destructor, copy constructor, copy assignment operator', true, 2),
       ('Constructor, copy constructor, move constructor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 15] (rule of five) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which two special member functions does the Rule of Five add beyond the Rule of Three?',
         'C++11 added move semantics, so the Rule of Five extends the Rule of Three with the move constructor and move assignment operator.',
         'Move constructor and move assignment.',
         'The Rule of Five adds the move constructor and move assignment operator to the Rule of Three.',
         5
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Default constructor and `swap`', false, 0),
       ('Conversion constructor and `operator==`', false, 1),
       ('Allocator and deallocator', false, 2),
       ('Move constructor and move assignment operator', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 16] (rule of zero) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the Rule of Zero recommend?',
         'The Rule of Zero says to design classes so they need no user-declared copy/move/destructor — let resource-owning members (e.g., `std::vector`, `std::unique_ptr`) handle resource management automatically.',
         'Let RAII members manage resources; declare no special functions.',
         'The Rule of Zero advises composing with RAII types so the compiler-generated special members suffice.',
         6
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compose with RAII members so user-defined special members are unnecessary', true, 0),
       ('Never write any class methods', false, 1),
       ('Always default all five special members explicitly', false, 2),
       ('Use only POD types', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 17] (RAII) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does RAII stand for and what is its core idea?',
         'RAII — Resource Acquisition Is Initialization — ties a resource''s lifetime to an object''s lifetime: acquire in the constructor, release in the destructor, so stack unwinding cleans up automatically.',
         'Resource lifetime = object lifetime; destructor releases.',
         'RAII binds resource ownership to object lifetime so destructors deterministically release resources.',
         7
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Random Access Iterator Implementation — a class of STL iterators', false, 0),
       ('Resource Acquisition Is Initialization — tie resource lifetime to object lifetime', true, 1),
       ('Runtime Address Interception Interface — used by debuggers', false, 2),
       ('Reusable Allocator Initialization Idiom — used by allocators', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 18] (explicit constructor) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does marking a single-argument constructor `explicit` do?',
         '`explicit` prevents the compiler from using the constructor for implicit conversions or copy-initialization, requiring direct-initialization syntax.',
         'Disables implicit conversions through that constructor.',
         '`explicit` blocks implicit conversions, requiring direct initialization to invoke the constructor.',
         8
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Forces the constructor to be `virtual`', false, 0),
       ('Marks it for compile-time evaluation', false, 1),
       ('Prevents the compiler from using it for implicit conversions', true, 2),
       ('Makes it the only callable constructor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 19] (delegating constructor) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a delegating constructor (C++11)?',
         'A delegating constructor calls another constructor of the same class in its member initializer list to reuse initialization logic.',
         'Constructor that invokes a sibling constructor in its init list.',
         'A delegating constructor calls another constructor of the same class to share initialization code.',
         9
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A constructor inherited from a base class', false, 0),
       ('A constructor that runs at static initialization', false, 1),
       ('A constructor that delegates to a virtual base destructor', false, 2),
       ('A constructor that invokes another constructor of the same class in its initializer list', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 20] (virtual functions) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does declaring a member function `virtual` enable?',
         '`virtual` enables dynamic dispatch: the call is resolved by the dynamic type of the object (via the vtable), not the static type of the reference/pointer.',
         'Dynamic dispatch based on the object''s actual type.',
         '`virtual` enables dynamic dispatch so the called function is selected by the object''s dynamic type.',
         10
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Dynamic dispatch — resolution by the object''s runtime type', true, 0),
       ('Implicit `inline`-ing of the function', false, 1),
       ('Compile-time selection by argument type', false, 2),
       ('Static linkage', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 21] (override keyword) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What benefit does the `override` specifier (C++11) provide?',
         '`override` asks the compiler to verify that the function actually overrides a virtual function in a base class; a typo or signature mismatch becomes a compile error.',
         'Compiler-checked override — catches signature mismatches.',
         '`override` causes the compiler to verify that the method actually overrides a base-class virtual, catching subtle mistakes.',
         11
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It makes the function `virtual`', false, 0),
       ('The compiler checks that the function actually overrides a base virtual', true, 1),
       ('It forces the function to be inlined', false, 2),
       ('It removes the function from the vtable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 22] (final keyword) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does marking a virtual function `final` do?',
         '`final` on a virtual function prevents any further override in derived classes; on a class it prevents further inheritance.',
         'Prevents further overriding (or, on a class, derivation).',
         '`final` prevents further overriding of a virtual function — or, on a class, prevents further derivation.',
         12
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Makes it the function called last in destruction order', false, 0),
       ('Marks it for inlining at every call site', false, 1),
       ('Forbids any further derived class from overriding it', true, 2),
       ('Removes the function from the vtable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 23] (pure virtual / abstract class) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a pure virtual function and what does it imply about its class?',
         'A pure virtual function (`= 0`) has no required implementation in the base; any class that has at least one pure virtual function is abstract and cannot be instantiated directly.',
         '`= 0` virtual; makes the class abstract.',
         'A pure virtual function makes its class abstract — it cannot be instantiated, and derived classes must implement the function.',
         13
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is a normal virtual function with default behavior', false, 0),
       ('It is a virtual function whose body must be `constexpr`', false, 1),
       ('It is a function that cannot be overridden', false, 2),
       ('It is a virtual function with `= 0` that makes its class abstract (non-instantiable)', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 25] (slicing) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "object slicing" in C++?',
         'When a derived object is copied into a base-class value (by-value assignment or parameter), the derived parts are sliced off, leaving only the base subobject — polymorphism is lost.',
         'Copying Derived → Base by value drops the derived parts.',
         'Object slicing occurs when a derived object is copied into a base-by-value, dropping the derived portion.',
         14
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Splitting a class definition across multiple headers', false, 0),
       ('Copying a derived object into a base-class value, losing the derived parts', true, 1),
       ('Calling `delete` on half of an array', false, 2),
       ('Truncating a `std::string` to a smaller size', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 29] (template instantiation) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is a function template definition typically required to be visible to the compiler?',
         'Because templates must be instantiated for each used type, the full definition is generally needed where the template is used — most often by placing it in a header.',
         'At every translation unit that instantiates it (header-defined).',
         'Function template definitions usually need to live in headers so they are visible at every instantiation site.',
         15
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only in the .cpp file declaring it', false, 0),
       ('At every translation unit that instantiates the template (typically via a header)', true, 1),
       ('Only at link time', false, 2),
       ('Never — templates are precompiled into the standard library', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 38] (vector growth) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the amortized complexity of `std::vector::push_back`?',
         '`vector` grows geometrically (typically doubling), so pushing back is O(1) amortized — most pushes are constant time, with occasional reallocations averaged across many operations.',
         'Amortized O(1).',
         '`std::vector::push_back` runs in amortized O(1) thanks to geometric capacity growth.',
         16
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('O(n) every call', false, 0),
       ('O(log n) every call', false, 1),
       ('Amortized O(1)', true, 2),
       ('O(n log n) every call', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 39] (vector reserve) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `vec.reserve(n)` do?',
         '`reserve(n)` increases capacity to at least `n` if currently smaller, without changing `size()`. It avoids reallocations for the next `n` insertions but does not construct elements.',
         'Pre-allocates capacity; size unchanged.',
         '`reserve(n)` raises capacity so the next `n` insertions avoid reallocations; it does not change `size()`.',
         17
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sets `size()` to `n` and default-constructs elements', false, 0),
       ('Allocates exactly `n` bytes', false, 1),
       ('Shrinks the capacity to `n`', false, 2),
       ('Ensures capacity is at least `n` without changing `size()`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 41] (deque vs vector) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Compared to `std::vector`, what is `std::deque`''s key advantage?',
         '`std::deque` provides O(1) insertion and removal at both ends; `std::vector` is O(1) at the back but O(n) at the front.',
         'O(1) push/pop on both ends.',
         '`std::deque` supports O(1) insertion and removal at both the front and back.',
         18
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Strictly contiguous storage', false, 0),
       ('O(1) push/pop at both the front and back', true, 1),
       ('Lower memory overhead than `vector`', false, 2),
       ('Faster random access than `vector`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 42] (map underlying structure) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What data structure typically underlies `std::map`?',
         '`std::map` is required to keep elements ordered with logarithmic lookup, insert, and erase — implementations virtually always use a self-balancing binary search tree (most commonly a red-black tree).',
         'Self-balancing BST (typically red-black tree).',
         '`std::map` is implemented with a balanced BST, giving ordered iteration and O(log n) lookups.',
         19
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A hash table', false, 0),
       ('A skip list', false, 1),
       ('A self-balancing binary search tree (commonly a red-black tree)', true, 2),
       ('A B-tree', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 43] (unordered_map) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the average-case complexity of lookup in `std::unordered_map`?',
         '`unordered_map` is a hash table — lookup, insert, and erase are O(1) on average but O(n) worst case if many keys collide.',
         'O(1) average, O(n) worst case.',
         'Hash-based `unordered_map` lookups are O(1) on average and O(n) in the worst case.',
         20
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('O(log n)', false, 0),
       ('O(n)', false, 1),
       ('Always O(1)', false, 2),
       ('O(1) on average; O(n) worst case', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 45] (map operator[] insert behavior) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `m[key]` do on a `std::map<K, V>` when `key` is not present?',
         '`operator[]` value-initializes a new element at the missing key and returns a reference to it — useful, but it silently inserts. Use `find` or `contains` (C++20) to test presence without inserting.',
         'Inserts a value-initialized `V` and returns a reference.',
         '`map::operator[]` inserts a default-constructed value when the key is missing and returns a reference to it.',
         21
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Throws `std::out_of_range`', false, 0),
       ('Default-constructs the value at `key` and returns a reference', true, 1),
       ('Returns a null reference', false, 2),
       ('Returns `V{}` by value without modifying the map', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 46] (vector iterator invalidation) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When are iterators into a `std::vector` invalidated?',
         'Reallocation (e.g., when `push_back` exceeds capacity) invalidates all iterators, pointers, and references; `insert`/`erase` invalidates those at and after the modification point.',
         'On reallocation; insert/erase invalidates from that point.',
         'A `std::vector` invalidates iterators on reallocation, and on insert/erase from the affected position onward.',
         22
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Never', false, 0),
       ('Only when the vector is destroyed', false, 1),
       ('On any reallocation, and from the affected position onward on `insert`/`erase`', true, 2),
       ('Only when `clear()` is called', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 47] (list vs vector) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which standard container offers O(1) splice and never invalidates iterators on insert/erase?',
         '`std::list` is a doubly-linked list — splice is O(1) and only the iterator at the erased element becomes invalid; other iterators remain valid.',
         '`std::list`.',
         '`std::list` provides O(1) splice and keeps iterators stable across most insert/erase operations.',
         23
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`std::vector`', false, 0),
       ('`std::array`', false, 1),
       ('`std::deque`', false, 2),
       ('`std::list`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 49] (std::sort requirements) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What kind of iterator does `std::sort` require?',
         '`std::sort` runs in O(n log n) and needs random-access iterators (so containers like `std::list` are not sortable with it — use `list::sort` instead).',
         'Random-access iterators (`vector`, `array`, `deque`).',
         '`std::sort` requires random-access iterators and runs in O(n log n).',
         24
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Forward iterators', false, 0),
       ('Random-access iterators', true, 1),
       ('Input iterators', false, 2),
       ('Output iterators', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 51] (iterator categories) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which iterator category supports `it + n` arithmetic in constant time?',
         'Random-access iterators support `+`, `-`, indexing, and comparison in O(1) — typical of `std::vector`, `std::array`, and `std::deque` iterators.',
         'Random-access iterators.',
         'Only random-access iterators support O(1) jump arithmetic like `it + n`.',
         25
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Input iterators', false, 0),
       ('Forward iterators', false, 1),
       ('Bidirectional iterators', false, 2),
       ('Random-access iterators', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 53] (erase-remove idiom) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of the erase-remove idiom `v.erase(std::remove(...), v.end())`?',
         '`std::remove` only moves matching elements past a returned partition iterator; it does not shrink the container. `erase` then trims off the tail. C++20 added `std::erase`/`std::erase_if` to simplify this.',
         'Actually removes elements (`remove` only partitions).',
         'The erase-remove idiom physically removes elements that `std::remove` only partitions to the end.',
         26
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reverses the container', false, 0),
       ('Removes elements from the container after `std::remove` partitions them', true, 1),
       ('Sorts the container in-place', false, 2),
       ('Clears the container completely', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 54] (back_inserter) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `std::back_inserter(v)` used for?',
         'It produces an output iterator that calls `v.push_back(...)` on each write — useful for algorithms like `std::copy` or `std::transform` that need an output iterator into a growing container.',
         'Adapts `push_back` into an output iterator.',
         '`std::back_inserter` returns an output iterator that calls `push_back` on the container.',
         27
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reserving capacity in a vector', false, 0),
       ('Constructing an iterator to the last element', false, 1),
       ('Creating an output iterator that calls `push_back` on a container', true, 2),
       ('Reversing the iteration order of a container', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 55] (unique_ptr ownership) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What ownership model does `std::unique_ptr` implement?',
         '`std::unique_ptr` has exclusive ownership and is move-only — copies are deleted, so there is always exactly one owner of the managed resource.',
         'Exclusive, move-only ownership.',
         '`std::unique_ptr` enforces single, exclusive ownership and is move-only.',
         28
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Shared ownership with reference counting', false, 0),
       ('Non-owning observation', false, 1),
       ('Owned by the global allocator', false, 2),
       ('Exclusive, move-only ownership', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 56] (shared_ptr cost) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `std::shared_ptr` impose runtime overhead that `std::unique_ptr` does not?',
         '`shared_ptr` allocates and maintains a control block with atomic reference counts (strong and weak) so it can support thread-safe shared ownership; `unique_ptr` has none of that.',
         'Atomic refcounts in a heap-allocated control block.',
         '`shared_ptr` carries a control block with atomic reference counts, which `unique_ptr` does not need.',
         29
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It manages a control block with atomic reference counts', true, 0),
       ('It always allocates its data on the stack', false, 1),
       ('It performs a deep copy on every dereference', false, 2),
       ('It validates the pointer through a virtual call on every use', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 57] (weak_ptr purpose) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `std::weak_ptr` exist?',
         '`weak_ptr` is a non-owning observer of a `shared_ptr`-managed object; it does not affect the strong count and is used to break reference cycles or detect dangling state via `lock()`.',
         'Non-owning observer; breaks `shared_ptr` cycles.',
         '`weak_ptr` provides non-owning observation of a `shared_ptr` resource, primarily to break reference cycles.',
         30
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To extend the lifetime of a managed object', false, 0),
       ('To observe a `shared_ptr`-managed object without affecting its lifetime, breaking reference cycles', true, 1),
       ('To transfer ownership atomically', false, 2),
       ('To replace raw pointers in low-level code', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 58] (make_unique vs new) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `std::make_unique<T>(...)` generally preferred over `std::unique_ptr<T>(new T(...))`?',
         '`make_unique` keeps allocation and ownership in a single expression, avoids exposing a raw `new`, and prevents subtle leak scenarios in older multi-argument call expressions; it also avoids repeating the type name.',
         'Exception-safe, no raw `new`, no type repetition.',
         '`make_unique` is exception-safe, avoids raw `new`, and does not require repeating the type name.',
         31
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It allocates on the stack', false, 0),
       ('It is `constexpr`', false, 1),
       ('It avoids raw `new`, is exception-safe, and does not duplicate the type name', true, 2),
       ('It enables shared ownership', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 59] (make_shared benefit) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the main performance advantage of `std::make_shared<T>(...)` over `std::shared_ptr<T>(new T(...))`?',
         '`make_shared` performs a single allocation for both the managed object and the control block, instead of two separate allocations.',
         'One allocation for object + control block.',
         '`make_shared` allocates the object and control block together in one heap allocation.',
         32
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It avoids reference counting', false, 0),
       ('It uses a stack allocation', false, 1),
       ('It enables polymorphic deletion', false, 2),
       ('It performs a single allocation for both the object and the control block', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 60] (cyclic shared_ptr) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Two objects each hold a `shared_ptr` to the other. What happens to their lifetimes?',
         'A cycle of `shared_ptr` keeps the strong refcount above zero forever, so the objects leak. Break the cycle by making one direction a `weak_ptr`.',
         'They leak; replace one edge with a `weak_ptr`.',
         'Mutual `shared_ptr` references form a cycle that prevents destruction and leaks memory; use a `weak_ptr` to break it.',
         33
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They leak — the refcount never reaches zero; use a `weak_ptr` to break the cycle', true, 0),
       ('They are destroyed automatically because of cycle detection', false, 1),
       ('It is a compile error to form such a cycle', false, 2),
       ('The objects share a single control block by default, avoiding the leak', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 61] (unique_ptr copy) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if you try to copy a `std::unique_ptr`?',
         '`unique_ptr` deletes its copy constructor and copy assignment; you must transfer ownership with `std::move`. Copying is a compile error.',
         'Compile error — copy is deleted; use `std::move`.',
         'Copying a `unique_ptr` is a compile error because its copy operations are deleted; transfer ownership with `std::move`.',
         34
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It performs a deep copy', false, 0),
       ('It is a compile error — copy is deleted; ownership transfers only via `std::move`', true, 1),
       ('It silently shares ownership', false, 2),
       ('It throws `std::bad_alloc`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 62] (rvalue reference) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What kind of expression can bind to an rvalue reference `T&&`?',
         'Rvalue references bind to rvalues (temporaries and `xvalue`s such as the result of `std::move`) — they signal that the referenced object can be safely moved from.',
         'Rvalues (e.g., temporaries, `std::move(x)`).',
         'Rvalue references `T&&` bind to rvalues — temporaries or moved-from expressions.',
         35
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only named lvalues', false, 0),
       ('Only function pointers', false, 1),
       ('Rvalues such as temporaries and the result of `std::move`', true, 2),
       ('Only `const` lvalues', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 63] (std::move semantics) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::move(x)` actually do at runtime?',
         '`std::move` is just an unconditional cast to an rvalue reference (`static_cast<T&&>(x)`) — it does not move anything; it simply enables overload resolution to select the move-aware operation.',
         'Casts to rvalue reference; no runtime work.',
         '`std::move(x)` is a cast to an rvalue reference that lets callers select move overloads — it performs no actual transfer.',
         36
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Performs a deep copy', false, 0),
       ('Swaps the bytes between two objects', false, 1),
       ('Zeroes the source memory', false, 2),
       ('Casts to an rvalue reference so move overloads are selected — no runtime work itself', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 69] (lambda capture default) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the lambda capture list `[=]` mean?',
         '`[=]` is a default-by-copy capture: each variable used in the body is captured by value into the closure object. Use `[&]` for default-by-reference; explicit lists are usually clearer.',
         'Default by-value capture of used variables.',
         '`[=]` captures by value every variable from the enclosing scope used in the lambda body.',
         37
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Capture every enclosing variable by reference', false, 0),
       ('Capture every variable used in the body by value', true, 1),
       ('Capture nothing', false, 2),
       ('Capture only `this`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 70] (mutable lambda) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is the `mutable` keyword sometimes added to a lambda, e.g., `[=]() mutable { ... }`?',
         'Lambdas'' call operator is `const` by default, so by-value captures are read-only inside the body. `mutable` removes that `const`, allowing modification of by-value captures.',
         'Allows modifying by-value captures inside the body.',
         '`mutable` makes a lambda''s call operator non-const so by-value captures can be modified inside the body.',
         38
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It makes the lambda thread-safe', false, 0),
       ('It captures the enclosing `this` pointer', false, 1),
       ('It permits the lambda body to modify its by-value captures', true, 2),
       ('It forces the lambda to be `constexpr`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 71] (structured bindings) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What C++17 feature allows `auto [k, v] = *map_iter;`?',
         'Structured bindings (C++17) decompose tuples, pairs, arrays, and aggregate types into named variables in one statement.',
         'Structured bindings (C++17).',
         'C++17 structured bindings let you unpack pairs, tuples, arrays, and aggregates into named variables.',
         39
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Concepts', false, 0),
       ('Coroutines', false, 1),
       ('Ranges', false, 2),
       ('Structured bindings', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 [orig 72] (init in if statement) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does C++17 allow in `if (auto it = m.find(k); it != m.end()) { ... }`?',
         'C++17 added init-statements to `if` and `switch`, letting you declare a variable scoped to the `if`/`else` blocks alongside the condition.',
         'C++17 init-statement in `if`/`switch`.',
         'C++17 added an init-statement to `if`/`switch` so a variable can be declared scoped to the conditional.',
         40
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An init-statement in `if`/`switch`, scoping `it` to the branches', true, 0),
       ('A C++20 ranges construct', false, 1),
       ('A coroutine `co_await` shorthand', false, 2),
       ('A constexpr-only construct', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 [orig 73] (auto return type) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `auto add(int a, int b) { return a + b; }`, how is the return type determined?',
         'C++14 introduced return type deduction: the compiler infers the return type from the `return` expression in the function body.',
         'Deduced from the `return` expression (C++14).',
         'C++14 lets the compiler deduce a function''s return type from its `return` statement.',
         41
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always `int`', false, 0),
       ('Deduced from the `return` expression (C++14 return type deduction)', true, 1),
       ('Decided at link time', false, 2),
       ('It is a compile error — `auto` is not allowed as a return type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 [orig 74] (nullptr_t) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type of the expression `nullptr`?',
         'The type of `nullptr` is `std::nullptr_t`. It is implicitly convertible to any pointer type but is not itself a pointer.',
         '`std::nullptr_t`.',
         '`nullptr` has type `std::nullptr_t`, which converts implicitly to any pointer type.',
         42
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int`', false, 0),
       ('`void*`', false, 1),
       ('`std::nullptr_t`', true, 2),
       ('`uintptr_t`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 [orig 75] (range-based for over map) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the element type when iterating `for (const auto& kv : std::map<int, std::string>)`?',
         'Iterating a `std::map<K, V>` yields `std::pair<const K, V>` references — note `K` is `const` because keys cannot be modified through the iterator.',
         '`std::pair<const K, V>`.',
         'Iterating a `std::map<K, V>` yields elements of type `std::pair<const K, V>`.',
         43
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`std::tuple<K, V>`', false, 0),
       ('`V` only', false, 1),
       ('`K` only', false, 2),
       ('`std::pair<const K, V>`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 [orig 77] (std::optional) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::optional<T>` represent?',
         '`std::optional<T>` (C++17) holds either a `T` or no value, modeling "may or may not have a value" without using sentinel values, pointers, or out-parameters.',
         'A possibly-absent `T`; no allocation needed.',
         '`std::optional<T>` represents an inline-stored value that may or may not be present.',
         44
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A reference-counted pointer to `T`', false, 0),
       ('A value that may be present or absent — a type-safe alternative to sentinel values', true, 1),
       ('A coroutine handle for type `T`', false, 2),
       ('A lazy-initialized global of type `T`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 [orig 78] (optional access UB) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For an empty `std::optional<T>` `o`, what is the behavior of `*o`?',
         'Dereferencing an empty `std::optional` with `*` or `->` is undefined behavior — use `o.value()` for a checked access (throws `std::bad_optional_access`) or `o.value_or(default)`.',
         'Undefined behavior. Use `value()`/`value_or`.',
         'Dereferencing an empty `std::optional` is undefined behavior; `value()` throws instead.',
         45
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns a default-constructed `T`', false, 0),
       ('Throws `std::bad_optional_access`', false, 1),
       ('Undefined behavior', true, 2),
       ('Returns `nullptr`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 [orig 81] (std::string_view) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the primary purpose of `std::string_view`?',
         '`std::string_view` (C++17) is a non-owning view (pointer + length) over a contiguous character sequence — usable as a uniform parameter type for `std::string`, `const char*`, and substrings without copying.',
         'Non-owning view over a character sequence (no copy).',
         '`std::string_view` is a non-owning, cheap-to-copy view over a contiguous char sequence.',
         46
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Owning string that always allocates on the heap', false, 0),
       ('A non-owning, cheap-to-copy view over an existing character sequence', true, 1),
       ('A coroutine-safe string', false, 2),
       ('A reference-counted string', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 [orig 88] (operator overloading) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which operator cannot be overloaded in C++?',
         'Most operators can be overloaded, but a small set cannot, including `::`, `.`, `.*`, `?:`, and `sizeof`. The dot operator `.` is the classic example.',
         '`.` (member access) cannot be overloaded.',
         'The dot operator `.` (member access) is one of a few operators that cannot be overloaded in C++.',
         47
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`.` (member access)', true, 0),
       ('`+`', false, 1),
       ('`<<`', false, 2),
       ('`()` (function call)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 [orig 90] (catch by reference) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why should exceptions be caught by `const T&` rather than by value?',
         'Catching by reference avoids slicing of derived exception types and avoids an unnecessary copy of the exception object.',
         'Avoids slicing and avoids a copy.',
         'Catching by `const T&` avoids slicing derived exceptions and prevents an unnecessary copy.',
         48
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is required by the language', false, 0),
       ('It runs the destructor lazily', false, 1),
       ('To avoid slicing derived exception types and to avoid a copy', true, 2),
       ('To make the catch block `noexcept`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 [orig 91] (raw new delete pairing) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What should you use to release memory allocated with `new[]`?',
         'Mixing `new` and `delete[]` (or vice versa) is undefined behavior. Use `delete` for `new`, and `delete[]` for `new[]` — better still, avoid raw `new`/`delete` and use smart pointers and containers.',
         '`delete[]` (matched form).',
         '`new[]` must be paired with `delete[]`; mismatching with `delete` is undefined behavior.',
         49
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`free`', false, 0),
       ('`delete`', false, 1),
       ('`std::destroy`', false, 2),
       ('`delete[]`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 [orig 93] (std::span C++20) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::span<T>` (C++20) represent?',
         '`std::span` is a non-owning view over a contiguous sequence of elements (pointer + size). It is to arrays/vectors what `std::string_view` is to strings.',
         'Non-owning contiguous range view (ptr + size).',
         '`std::span` is a non-owning view over a contiguous sequence of `T` (pointer + size).',
         50
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A coroutine return type', false, 0),
       ('A non-owning view over a contiguous range (pointer + size)', true, 1),
       ('A heap-allocated owning array', false, 2),
       ('A type-erased holder for any iterable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 [orig 94] (designated initializers) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does C++20 add via designated initializers, e.g., `Point p{.x = 1, .y = 2};`?',
         'Designated initializers allow initializing aggregate members by name. Order must match the declaration and only aggregates qualify.',
         'Aggregate init by name (declaration order, aggregates only).',
         'C++20 designated initializers allow naming aggregate members on construction in declaration order.',
         51
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Random-order member initialization for any class', false, 0),
       ('Lazy initialization of static globals', false, 1),
       ('Named initialization of aggregate members in declaration order', true, 2),
       ('Initializing references in member init lists', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 [orig 96] (std::format C++20) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `std::format("{} = {}", k, v)` (C++20) produce?',
         '`std::format` returns a `std::string` formed by substituting arguments into a Python-style format string. It is type-safe and extensible via `std::formatter` specializations.',
         'A type-safe, Python-style formatted `std::string`.',
         '`std::format` returns a type-safe formatted `std::string` using Python-like placeholders.',
         52
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `std::string` formed by substituting `k` and `v` into the template', true, 0),
       ('A `printf`-style stream that prints to stdout immediately', false, 1),
       ('A compile-time `constexpr` literal only', false, 2),
       ('A `std::string_view` over a static buffer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 [orig 98] (default vs delete) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the effect of `= default` and `= delete` on a special member function?',
         '`= default` asks the compiler to generate the canonical implementation; `= delete` forbids the function entirely — attempting to call it is a compile error.',
         '`default`: compiler-generated. `delete`: forbidden — compile error.',
         '`= default` requests the canonical implementation; `= delete` makes the function uncallable.',
         53
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are the same — both request a default implementation', false, 0),
       ('`= default` deletes it; `= delete` defaults it', false, 1),
       ('`= default` asks the compiler to generate it; `= delete` makes any use a compile error', true, 2),
       ('Both are obsolete C++03 syntax', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 [orig 99] (thread-local storage) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the C++11 `thread_local` storage specifier do?',
         '`thread_local` gives each thread its own independent instance of the variable; it is initialized on first use in that thread and destroyed when the thread ends.',
         'One independent instance of the variable per thread.',
         '`thread_local` creates one independent instance of a variable per thread.',
         54
  from modules where slug = 'cpp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Marks a variable as accessible only inside a `std::thread`', false, 0),
       ('Makes a variable atomic across threads', false, 1),
       ('Restricts a variable to the main thread', false, 2),
       ('Gives each thread its own independent instance of the variable', true, 3)
     ) as c(label, is_correct, order_index);
-- ============================================================
-- cpp-3
-- ============================================================

-- Question 0 [orig 5] (auto vs decltype(auto)) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the key difference between `auto` and `decltype(auto)` when used to declare a variable from an expression?',
         '`decltype(auto)` uses `decltype` rules and therefore preserves reference and cv-qualifiers from the initializer expression, whereas `auto` strips them.',
         '`decltype(auto)` keeps references and cv; `auto` strips them.',
         'Unlike `auto`, `decltype(auto)` preserves references and cv-qualifiers on the deduced type.',
         0
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical aliases', false, 0),
       ('`decltype(auto)` preserves references and cv-qualifiers; `auto` strips them', true, 1),
       ('`decltype(auto)` only works on integers', false, 2),
       ('`auto` is C++20 only; `decltype(auto)` is C++11', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 24] (vtable mechanics) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is dynamic dispatch typically implemented for virtual functions in C++?',
         'Most implementations use a per-class virtual function table (vtable); each object carries a hidden vptr to its class''s vtable, which holds function pointers used at call time.',
         'vtable per class + vptr per object → indirect call.',
         'Dynamic dispatch is typically implemented with a per-class vtable indexed via a hidden per-object vptr.',
         1
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Each class has a vtable; each object has a vptr pointing to its class''s vtable', true, 0),
       ('Each call is resolved by hashing the function name at runtime', false, 1),
       ('Each object stores a copy of every method', false, 2),
       ('The linker rewrites call sites at load time', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 26] (virtual inheritance) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why use `virtual` inheritance?',
         'Virtual inheritance ensures that in a diamond-shaped inheritance hierarchy there is exactly one shared base subobject, avoiding ambiguity and duplicated state.',
         'Solves the diamond problem — single shared base subobject.',
         'Virtual inheritance ensures a single shared base subobject in diamond hierarchies, eliminating duplication and ambiguity.',
         2
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To inherit only virtual functions from the base', false, 0),
       ('To make all base methods `virtual` implicitly', false, 1),
       ('To resolve the diamond problem by sharing a single base subobject', true, 2),
       ('To skip running the base constructor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 27] (virtual call in constructor) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when a virtual function is called inside a base class constructor?',
         'During the base constructor the dynamic type of the object is the base — virtual dispatch resolves to the base''s version, not any derived override, because the derived subobject has not yet been constructed.',
         'Dispatches to the base''s version (object is still "base").',
         'In a base constructor, virtual calls resolve to the base version because the derived subobject does not yet exist.',
         3
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It dispatches to the most-derived override', false, 0),
       ('It is a compile error', false, 1),
       ('It causes undefined behavior in every case', false, 2),
       ('Dispatch resolves to the base''s implementation because the object is still being constructed as a base', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 30] (template specialization) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is template specialization?',
         'Specialization provides an alternative implementation for a specific set of template arguments. Full specialization replaces the primary template for an exact argument list; partial specialization is allowed for class templates.',
         'Custom impl for specific template arguments.',
         'Template specialization supplies an alternative implementation when the template is instantiated with specific arguments.',
         4
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A way to inherit from a template', false, 0),
       ('A keyword that disables a template', false, 1),
       ('Providing an alternative implementation for specific template arguments', true, 2),
       ('Forcing the compiler to instantiate every possible type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 31] (partial vs full specialization) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is true about template specialization in C++?',
         'Function templates can be fully specialized but not partially specialized; partial specialization is supported for class templates only (overloading is typically used to achieve a similar effect for functions).',
         'Function templates: full only. Class templates: full + partial.',
         'Functions support only full specialization; partial specialization is reserved for class templates.',
         5
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both function and class templates support partial specialization', false, 0),
       ('Neither function nor class templates can be specialized', false, 1),
       ('Only function templates can be partially specialized', false, 2),
       ('Function templates allow only full specialization; class templates allow partial specialization', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 32] (SFINAE) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does SFINAE stand for?',
         'SFINAE — Substitution Failure Is Not An Error — means a substitution failure during template argument deduction discards the candidate from the overload set instead of producing a hard error.',
         'Substitution Failure Is Not An Error.',
         'SFINAE means a substitution failure during template deduction silently removes the candidate rather than producing a compile error.',
         6
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Substitution Failure Is Not An Error', true, 0),
       ('Static Function Inlining Avoids Name Errors', false, 1),
       ('Standard Forward Iterator Naming Extension', false, 2),
       ('Single-Field Inheritance Naming Acronym Extension', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 33] (enable_if) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `std::enable_if` typically used for?',
         '`std::enable_if<Cond, T>::type` is defined only when `Cond` is true, which lets you SFINAE-out overloads or specializations when a condition does not hold.',
         'SFINAE-based conditional overload selection.',
         '`std::enable_if` enables or removes function or class template overloads at compile time based on a boolean condition.',
         7
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Disabling exceptions in templates', false, 0),
       ('Conditionally enabling/removing template overloads via SFINAE', true, 1),
       ('Replacing the body of a virtual function', false, 2),
       ('Marking a function as `constexpr`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 34] (variadic templates) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a variadic template?',
         'A variadic template accepts a parameter pack — zero or more template arguments — and is used for generic functions like `std::tuple`, `std::make_unique`, and emplacement.',
         'Template with a parameter pack `typename... Ts`.',
         'A variadic template takes a parameter pack and can accept any number of template arguments.',
         8
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A template with no parameters', false, 0),
       ('A template that returns different types each call', false, 1),
       ('A template that accepts a parameter pack (zero or more template arguments)', true, 2),
       ('A template that mutates its arguments', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 35] (concepts C++20) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What problem do C++20 concepts primarily solve?',
         'Concepts let you constrain template parameters with named, composable predicates. This produces clearer interfaces and dramatically better diagnostics than ad-hoc SFINAE tricks.',
         'Named, composable template constraints with good diagnostics.',
         'Concepts provide a structured way to constrain template parameters, improving readability and compiler error messages.',
         9
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They make templates run faster at runtime', false, 0),
       ('They eliminate the need for headers', false, 1),
       ('They make templates dispatch dynamically', false, 2),
       ('They constrain template parameters with named requirements and improve error messages', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 36] (requires expression) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In C++20, what does a `requires` expression evaluate to?',
         'A `requires` expression is a compile-time boolean: it evaluates to `true` if all listed requirements are well-formed for the given arguments, `false` otherwise.',
         'A compile-time `bool` over a requirement set.',
         'A `requires` expression yields a compile-time boolean indicating whether its requirements are satisfied.',
         10
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A compile-time `bool` describing whether the requirements are satisfied', true, 0),
       ('A list of types matching the requirement', false, 1),
       ('A runtime predicate evaluated each call', false, 2),
       ('A pointer to the concept''s vtable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 37] (template type vs non-type) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `template <typename T, size_t N>`, what is `N`?',
         '`N` is a non-type template parameter — a compile-time constant value (here a `size_t`) used by `std::array` and similar.',
         'Non-type template parameter (compile-time constant value).',
         '`N` is a non-type template parameter — a compile-time value (e.g., `std::array`''s size).',
         11
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A reference template parameter', false, 0),
       ('A non-type template parameter (compile-time value)', true, 1),
       ('A type template parameter named `N`', false, 2),
       ('A template template parameter', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 64] (moved-from object state) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the valid state of a moved-from standard-library object?',
         'Standard-library objects guarantee "valid but unspecified" state after a move — destruction and assignment are safe, but the contents are not predictable, so do not read them without first re-assigning or resetting.',
         'Valid but unspecified — safe to destroy/reassign.',
         'Moved-from standard objects are left valid but unspecified — safe to destroy or reassign, not safe to read.',
         12
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Valid but unspecified — safe to destroy or reassign, not safe to inspect', true, 0),
       ('Always empty', false, 1),
       ('Undefined behavior to touch in any way, including destruction', false, 2),
       ('Identical to the source object', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 65] (noexcept move) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is it important to mark move constructors `noexcept` for types stored in `std::vector`?',
         'On reallocation, `std::vector` uses the move constructor only if it is `noexcept`; otherwise it copies to preserve the strong exception guarantee. A `noexcept` move can dramatically improve performance.',
         '`vector` only moves on growth if move is `noexcept`.',
         '`std::vector` only moves elements during reallocation when the move constructor is `noexcept`; otherwise it copies them.',
         13
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is required by the language', false, 0),
       ('`std::vector` only moves elements on reallocation when the move constructor is `noexcept`', true, 1),
       ('It enables move semantics in the first place', false, 2),
       ('It removes the need for a destructor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 66] (perfect forwarding) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "perfect forwarding" in C++?',
         'Perfect forwarding uses a forwarding reference (`T&&` in a deduced context) and `std::forward<T>` to pass arguments along to another function while preserving their value category (lvalue vs rvalue) and const-ness.',
         'Forward args with preserved value category via `std::forward`.',
         'Perfect forwarding passes arguments to another function with their original value category preserved using `std::forward`.',
         14
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compiling a function with no overhead at all', false, 0),
       ('Implicitly inlining every templated function', false, 1),
       ('Passing parameters to another function while preserving their value category and cv-qualifiers via `std::forward`', true, 2),
       ('Promoting all arguments to the largest integer type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 67] (forwarding reference) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `template <typename T> void f(T&& arg);`, what is `arg`?',
         '`T&&` in a deduced context is a forwarding (aka universal) reference: it collapses to an lvalue reference when called with an lvalue and an rvalue reference when called with an rvalue.',
         'A forwarding (universal) reference.',
         'In a deduced template context, `T&&` is a forwarding reference that binds to both lvalues and rvalues.',
         15
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always an rvalue reference', false, 0),
       ('Always an lvalue reference', false, 1),
       ('A const reference', false, 2),
       ('A forwarding (universal) reference that adapts to lvalues and rvalues', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 68] (move on const) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if you `std::move` a `const T` object and pass it to a function that takes `T`?',
         'Moving a `const T` produces a `const T&&`, which usually cannot bind to a `T&&` move parameter and falls back to the copy constructor instead.',
         'You silently get a copy — `const` blocks the move.',
         '`std::move` on a `const` object yields a `const`-qualified rvalue that selects a copy, not a move.',
         16
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The function silently falls back to copy construction', true, 0),
       ('A compile error always occurs', false, 1),
       ('The `const` is stripped and a move occurs', false, 2),
       ('Undefined behavior at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 76] (constexpr if) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `if constexpr (cond) { ... } else { ... }` do (C++17)?',
         '`if constexpr` selects which branch is instantiated based on a constant expression — the unselected branch is discarded at compile time, allowing branches that would not compile for some types.',
         'Compile-time branch selection in templates.',
         '`if constexpr` discards the untaken branch at compile time, letting templates contain code that wouldn''t compile for all types.',
         17
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Discards the untaken branch at compile time, so template-only invalid code is fine', true, 0),
       ('Runs both branches at runtime', false, 1),
       ('Is identical to a normal `if`', false, 2),
       ('Forces the condition to be checked at link time', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 79] (std::variant) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `std::variant<T1, T2, ...>` (C++17)?',
         '`std::variant` is a type-safe tagged union that holds one of its listed alternatives at any time; access goes through `std::get` (throws) or `std::get_if` (pointer), and `std::visit` invokes a visitor.',
         'Type-safe tagged union; visit with `std::visit`.',
         '`std::variant` is a type-safe union holding one of its listed alternatives, accessed via `std::get` or `std::visit`.',
         18
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A tuple holding all types simultaneously', false, 0),
       ('An untagged C-style union', false, 1),
       ('A reference-counted holder for one of several types', false, 2),
       ('A type-safe tagged union holding exactly one of its alternatives', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 80] (std::any) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `std::any` (C++17) differ from `std::variant`?',
         '`std::any` can hold a value of any copy-constructible type; the held type is only known at runtime via `type()` and accessed with `std::any_cast`. `std::variant` is restricted to its declared alternatives.',
         '`std::any`: any type at runtime. `std::variant`: fixed list at compile time.',
         '`std::any` holds an arbitrary type at runtime, while `std::variant` is restricted to a compile-time list of alternatives.',
         19
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`std::any` accepts any type at runtime, `std::variant` is limited to a fixed list', true, 0),
       ('`std::any` is faster than `std::variant`', false, 1),
       ('`std::any` does no runtime type erasure', false, 2),
       ('`std::variant` requires heap allocation; `std::any` never does', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 82] (ranges introduction) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What do C++20 ranges add over classic iterator-pair algorithms?',
         'Ranges allow whole-container algorithms (`std::ranges::sort(v)`), composable lazy views (`std::views::filter`, `std::views::transform`), and stronger constraints via concepts.',
         'Whole-container algorithms + composable lazy views.',
         'C++20 ranges enable whole-container algorithm calls and composable lazy views with concept-checked constraints.',
         20
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They eliminate iterators entirely', false, 0),
       ('They make all algorithms run in parallel', false, 1),
       ('They support whole-container calls and composable lazy views (e.g., `views::filter`, `views::transform`)', true, 2),
       ('They are an alternative to the STL itself', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 83] (views laziness) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is true about C++20 range views like `std::views::filter` and `std::views::transform`?',
         'Range views are lazy — they compute elements only when iterated. They do not own the underlying data and have O(1) copy/move.',
         'Lazy, non-owning composable adapters.',
         'C++20 range views are lazy, non-owning adapters that compute elements only when iterated.',
         21
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They eagerly produce a new container', false, 0),
       ('They own a copy of the underlying data', false, 1),
       ('They iterate eagerly and cache their elements', false, 2),
       ('They are lazy and non-owning — elements are produced on demand', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 84] (modules motivation) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the main motivation for C++20 modules?',
         'Modules replace `#include` for many purposes: they avoid re-tokenizing headers, isolate translation units, eliminate macro leakage, and offer significantly faster builds.',
         'Faster builds, isolation, no macro leakage.',
         'C++20 modules speed up compilation, isolate translation units, and avoid the pitfalls of textual `#include`.',
         22
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Faster, isolated compilation without textual `#include` and macro leakage', true, 0),
       ('Built-in coroutines for all functions', false, 1),
       ('To remove header files from the language', false, 2),
       ('To replace namespaces', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 85] (coroutine keywords) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these keywords marks a function as a C++20 coroutine?',
         'A function is a coroutine if its body uses `co_await`, `co_yield`, or `co_return`; the return type must satisfy the coroutine machinery (e.g., a generator, task, or awaitable type).',
         '`co_await`, `co_yield`, or `co_return`.',
         'Using `co_await`, `co_yield`, or `co_return` inside a function''s body makes it a C++20 coroutine.',
         23
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`async`', false, 0),
       ('`co_await`, `co_yield`, or `co_return` used in the body', true, 1),
       ('`virtual`', false, 2),
       ('`constexpr`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 86] (consteval) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `constexpr` and `consteval` (C++20)?',
         '`constexpr` may run at compile or run time depending on inputs; `consteval` must be evaluated at compile time — calling it with non-constant arguments is a compile error.',
         '`consteval`: must run at compile time. `constexpr`: may.',
         '`consteval` requires compile-time evaluation, while `constexpr` only enables it.',
         24
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are aliases', false, 0),
       ('`constexpr` requires compile-time evaluation; `consteval` is optional', false, 1),
       ('`consteval` functions must be evaluated at compile time; `constexpr` may also run at runtime', true, 2),
       ('`consteval` is only valid on classes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 89] (exception safety guarantees) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the "strong exception guarantee" mean for a function?',
         'Strong guarantee: if the function throws, the program state is rolled back to what it was before the call — no observable side effects. Typical implementation: copy-and-swap.',
         'On throw, program state is unchanged.',
         'The strong exception guarantee means a thrown exception leaves all program state unchanged.',
         25
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('That the function never throws', false, 0),
       ('That if the function throws, observable program state is unchanged', true, 1),
       ('That all exceptions are converted to error codes', false, 2),
       ('That exceptions are caught by the destructor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 92] (placement new) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "placement new" do?',
         'Placement new constructs an object at a pre-allocated memory location instead of allocating new storage — used heavily by containers and custom allocators. The destructor must be invoked manually.',
         'Constructs an object in pre-allocated memory.',
         'Placement new constructs an object in already-allocated memory and requires manual destructor calls.',
         26
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Constructs an object in pre-allocated memory', true, 0),
       ('Allocates a new heap region and zeroes it', false, 1),
       ('Replaces the global allocator', false, 2),
       ('Defers construction until program exit', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 95] (spaceship operator) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the C++20 three-way comparison operator `<=>` enable?',
         'Defining `operator<=>` (and `operator==`) lets the compiler synthesize all six comparison operators (`<`, `<=`, `>`, `>=`, and the unequal partner). Often available as `= default` for aggregates.',
         'Auto-generates all comparison operators from one definition.',
         '`operator<=>` lets the compiler synthesize all six comparison operators from a single declaration.',
         27
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Bitwise rotation of integers', false, 0),
       ('A coroutine awaitable expression', false, 1),
       ('Implicit conversion to `bool`', false, 2),
       ('Generating the full set of comparison operators from a single three-way comparison', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 97] (RVO / NRVO) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is (Named) Return Value Optimization?',
         'NRVO and RVO are copy/move elisions where the compiler constructs the returned object directly in the caller''s storage, avoiding any copy or move. C++17 made certain prvalue elisions mandatory.',
         'Compiler builds return value in the caller — no copy/move.',
         '(N)RVO is copy/move elision where the returned object is constructed directly in the caller''s storage.',
         28
  from modules where slug = 'cpp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reordering of return statements by the optimizer', false, 0),
       ('Constructing a returned object directly in the caller''s storage, eliding copy/move', true, 1),
       ('A debugger feature that names return values', false, 2),
       ('A C++20 ranges algorithm', false, 3)
     ) as c(label, is_correct, order_index);
