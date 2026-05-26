-- 010_seed_java.sql
-- Java module: 100 quiz questions

-- Question 0 (primitive vs reference types) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is a primitive type in Java?',
         'Java has eight primitive types: `byte`, `short`, `int`, `long`, `float`, `double`, `char`, and `boolean`. `Integer`, `String`, and `Character` are reference types (classes).',
         '`int` is a primitive; `Integer`/`String`/`Character` are reference types.',
         'Java has eight primitive types (`byte`, `short`, `int`, `long`, `float`, `double`, `char`, `boolean`); everything else is a reference type.',
         0
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Integer`', false, 0),
       ('`String`', false, 1),
       ('`int`', true, 2),
       ('`Character`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (default values for primitives) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the default value of an uninitialised `int` field in a class?',
         'Instance and static fields of primitive numeric types default to `0` (`0L` for `long`, `0.0` for floating-point). `boolean` defaults to `false`, and reference types default to `null`. Local variables have no default and must be assigned before use.',
         '`0` for numeric primitive fields; `false` for `boolean`; `null` for references.',
         'Unassigned primitive numeric fields default to `0`, `boolean` to `false`, and reference fields to `null`; local variables get no defaults.',
         1
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0`', true, 0),
       ('`null`', false, 1),
       ('Undefined — must be initialised', false, 2),
       ('`-1`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (autoboxing) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does autoboxing refer to in Java?',
         'Autoboxing is the automatic conversion of a primitive value (e.g. `int`) to its corresponding wrapper object (`Integer`). The reverse is called unboxing.',
         'Implicit conversion from primitive to wrapper (e.g. `int` -> `Integer`).',
         'Autoboxing automatically wraps a primitive in its wrapper class; unboxing does the reverse.',
         2
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Casting one primitive to another wider primitive', false, 0),
       ('Automatic conversion from a primitive to its wrapper class', true, 1),
       ('Boxing of an object into a `String`', false, 2),
       ('Wrapping a reference type inside `Optional`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (== vs equals on Strings) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `String a = new String("hi"); String b = new String("hi");`, what does `a == b` evaluate to?',
         '`==` on reference types compares references (object identity), not values. Two `new String("hi")` calls produce two distinct objects, so `a == b` is `false`; use `equals()` for value equality.',
         '`false` — `==` compares references, not contents.',
         'For reference types, `==` checks identity; use `equals()` to compare value/content.',
         3
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`true`, because the strings have equal contents', false, 0),
       ('`true`, because all string literals are interned', false, 1),
       ('`false`, because `==` compares references', true, 2),
       ('It does not compile', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (Integer cache) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `Integer.valueOf(100) == Integer.valueOf(100)` return `true` but `Integer.valueOf(200) == Integer.valueOf(200)` return `false`?',
         'The `Integer` wrapper caches boxed values in the range `-128..127` by default. Inside that range, `valueOf` returns the same cached instance, so `==` is `true`; outside, two distinct objects are created.',
         '`Integer` cache covers `-128..127`; outside that range identity differs.',
         '`Integer.valueOf` caches values in `-128..127`, so `==` succeeds inside the cache but fails for larger values.',
         4
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Integer` is mutable, so identity changes', false, 0),
       ('`Integer` caches boxed values from `-128` to `127`', true, 1),
       ('`==` on wrappers calls `equals()` for small numbers', false, 2),
       ('The JIT folds small constants but not large ones', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (NullPointerException on unboxing) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you unbox a `null` `Integer` into an `int`?',
         'Unboxing calls `intValue()` on the wrapper; invoking it on `null` throws `NullPointerException`. This is a common bug when assigning a nullable `Integer` to a primitive `int`.',
         '`NullPointerException` — `null` cannot be unboxed to a primitive.',
         'Unboxing a `null` wrapper to a primitive throws `NullPointerException` because it dereferences the wrapper.',
         5
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It silently becomes `0`', false, 0),
       ('It throws `NullPointerException`', true, 1),
       ('It throws `IllegalArgumentException`', false, 2),
       ('It throws `ClassCastException`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (pass-by-value) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How are arguments passed in Java?',
         'Java is strictly pass-by-value. For reference types, the value passed is a copy of the reference, so the callee can mutate the referenced object but cannot rebind the caller''s variable.',
         'Always pass-by-value; for objects the value is a copy of the reference.',
         'Java is pass-by-value; for object arguments the reference value is copied, so mutations are visible but reassignments are not.',
         6
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Pass-by-reference for objects, pass-by-value for primitives', false, 0),
       ('Pass-by-reference for everything', false, 1),
       ('Pass-by-value for everything (references are copied by value)', true, 2),
       ('Pass-by-name (lazy evaluation)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (equals + hashCode contract) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If two objects are equal according to `equals()`, what must be true of their `hashCode()` values?',
         'The general contract requires that equal objects produce equal hash codes. The reverse is not required — different objects may share a hash code (collision).',
         'Equal objects must have equal hash codes.',
         '`equals()` and `hashCode()` must be consistent: equal objects must return the same hash code.',
         7
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They must be equal', true, 0),
       ('They must be different', false, 1),
       ('They are unrelated', false, 2),
       ('One must be `0`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (widening conversion) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which assignment compiles without an explicit cast?',
         'Widening primitive conversions (e.g. `int` -> `long`, `int` -> `double`) are implicit. Narrowing conversions (e.g. `long` -> `int`, `double` -> `int`) require an explicit cast because they can lose information.',
         '`long x = anInt;` — widening is implicit.',
         'Widening primitive conversions are implicit; narrowing conversions require an explicit cast.',
         8
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int x = aLong;`', false, 0),
       ('`long x = anInt;`', true, 1),
       ('`int x = aDouble;`', false, 2),
       ('`byte x = anInt;`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (== on wrappers) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the safest way to compare two `Integer` references for numeric equality?',
         '`==` on `Integer` compares references, which is only reliable inside the wrapper cache (`-128..127`). Calling `equals()` (or unboxing to `int` and using `==`) compares values correctly.',
         'Use `a.equals(b)` (or unbox to `int` and use `==`).',
         'Compare wrappers with `equals()`; `==` only works coincidentally inside the wrapper cache range.',
         9
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`a == b`', false, 0),
       ('`a.equals(b)`', true, 1),
       ('`a === b`', false, 2),
       ('`Integer.compareReferences(a, b)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (String immutability) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why are `String` instances in Java immutable?',
         'Immutability allows safe sharing across threads, caching in the string pool, safe use as `HashMap` keys, and security guarantees (e.g. for class loading and file paths). Mutating methods return a new `String` instead.',
         'Immutable for safety, caching, and hashing guarantees.',
         '`String` is immutable so it can be safely shared, interned, and used as a stable hash key.',
         10
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To save memory by storing strings on the stack', false, 0),
       ('To enable thread safety, caching, and stable hashing', true, 1),
       ('Because `char[]` cannot be modified', false, 2),
       ('To allow subclassing of `String`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (StringBuilder vs String concatenation) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is the preferred way to build a long string inside a loop?',
         'Repeated `+=` on `String` allocates a new object each iteration, giving O(n^2) behaviour. `StringBuilder` maintains a mutable buffer and appends in amortised O(1).',
         '`StringBuilder.append(...)` in the loop, then `toString()`.',
         'Use `StringBuilder` inside loops; `+=` on `String` is quadratic because each step allocates a new object.',
         11
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Concatenate with `+=` on a `String`', false, 0),
       ('Use `String.concat()` in the loop', false, 1),
       ('Use a `StringBuilder` and call `toString()` at the end', true, 2),
       ('Use `String.format` once per iteration', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (StringBuilder vs StringBuffer) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the main difference between `StringBuilder` and `StringBuffer`?',
         '`StringBuffer` synchronises its mutating methods, making it thread-safe but slower. `StringBuilder` is the unsynchronised, faster choice for single-threaded use.',
         '`StringBuffer` is synchronised; `StringBuilder` is not.',
         '`StringBuffer` is thread-safe via synchronisation; `StringBuilder` is faster but not thread-safe.',
         12
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`StringBuffer` is immutable; `StringBuilder` is mutable', false, 0),
       ('`StringBuffer` is synchronised; `StringBuilder` is not', true, 1),
       ('`StringBuilder` uses UTF-16; `StringBuffer` uses UTF-8', false, 2),
       ('`StringBuilder` is deprecated', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (string pool / interning) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `String.intern()` do?',
         '`intern()` returns a canonical `String` from the string pool: if an equal string is already pooled it returns that instance; otherwise it adds the current string to the pool and returns it.',
         'Returns the canonical pooled instance for an equal `String`.',
         '`intern()` ensures that equal strings share a single canonical pooled instance.',
         13
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compresses a string in memory', false, 0),
       ('Returns the canonical pooled instance for an equal `String`', true, 1),
       ('Makes the string immutable', false, 2),
       ('Removes the string from the string pool', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (string literals interned) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `String a = "hi"; String b = "hi";`, what does `a == b` evaluate to?',
         'String literals are automatically interned, so two equal literals refer to the same pooled instance and `==` is `true`. This guarantee does not extend to `new String(...)`.',
         '`true` — string literals are interned.',
         'Equal `String` literals are interned and share the same reference, so `==` returns `true`.',
         14
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`true`', true, 0),
       ('`false`', false, 1),
       ('Depends on JVM flags', false, 2),
       ('It does not compile', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (String.equals case sensitivity) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which method compares two strings ignoring case?',
         '`equalsIgnoreCase` compares two strings for equality without regard to case. `equals` is case-sensitive, and `compareTo` returns an ordering, not a boolean.',
         '`equalsIgnoreCase`.',
         'Use `String.equalsIgnoreCase` for case-insensitive equality.',
         15
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`equals()`', false, 0),
       ('`compareTo()`', false, 1),
       ('`equalsIgnoreCase()`', true, 2),
       ('`matches()`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (String length unit) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What unit does `String.length()` return?',
         '`length()` returns the number of UTF-16 code units, not code points or bytes. Supplementary characters outside the BMP count as 2; use `codePointCount` for code points.',
         'Number of UTF-16 code units.',
         '`String.length()` counts UTF-16 code units; use `codePointCount` for true code points.',
         16
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Number of bytes in UTF-8', false, 0),
       ('Number of Unicode code points', false, 1),
       ('Number of UTF-16 code units', true, 2),
       ('Number of grapheme clusters', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (String.format) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `String.format("%05d", 42)` return?',
         'The `%05d` format pads an integer with leading zeros to a minimum width of 5. `42` becomes `"00042"`.',
         '`"00042"` — width 5, zero-padded.',
         '`%05d` zero-pads an integer to a minimum width of 5 characters.',
         17
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`"42   "`', false, 0),
       ('`"   42"`', false, 1),
       ('`"00042"`', true, 2),
       ('`"42000"`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (text blocks) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which Java feature introduced multi-line string literals using `"""`?',
         'Text blocks, finalised in Java 15, use triple double-quote delimiters and automatically strip incidental whitespace. They simplify embedding JSON, SQL, or HTML in source code.',
         'Text blocks (`"""..."""`, finalised in Java 15).',
         'Text blocks (Java 15) allow multi-line string literals delimited by `"""`.',
         18
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Records', false, 0),
       ('Text blocks', true, 1),
       ('Sealed classes', false, 2),
       ('Pattern matching for `switch`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (chars vs Strings) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type of the expression `''a''` in Java?',
         'Single-quoted literals are `char`, a 16-bit unsigned primitive. Double-quoted literals are `String`. So `''a''` is a `char` and `"a"` is a `String`.',
         '`char` — single quotes denote a `char` literal.',
         'Single-quoted literals are `char`; double-quoted literals are `String`.',
         19
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`String`', false, 0),
       ('`char`', true, 1),
       ('`byte`', false, 2),
       ('`Character`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (constructor chaining with this) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Inside a constructor, what does `this(...)` do?',
         '`this(...)` invokes another constructor in the same class. It must be the first statement of the constructor and is used to chain constructors so initialisation logic isn''t duplicated.',
         'Calls another constructor of the same class (must be first statement).',
         '`this(...)` chains to another constructor in the same class and must be the first statement.',
         20
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Calls a method named `this`', false, 0),
       ('Calls the superclass constructor', false, 1),
       ('Calls another constructor in the same class', true, 2),
       ('Returns the current instance', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (super in constructor) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If a constructor does not explicitly call `this(...)` or `super(...)`, what does the compiler insert?',
         'When neither is specified, the compiler inserts an implicit `super()` call to the no-arg superclass constructor. If the superclass has no accessible no-arg constructor, compilation fails.',
         'An implicit `super()` call to the no-arg superclass constructor.',
         'Constructors implicitly call `super()` if you don''t call `this(...)` or `super(...)` yourself.',
         21
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Nothing — the superclass is not initialised', false, 0),
       ('An implicit `super()` call', true, 1),
       ('A call to `Object.<init>` directly', false, 2),
       ('An implicit `this()` call', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (static fields) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A `static` field belongs to:',
         '`static` (class) fields live on the class itself, not on instances. All instances share one storage slot; changing it from one instance affects what other instances see.',
         'The class — one shared slot for all instances.',
         '`static` fields belong to the class; there is one shared copy regardless of instance count.',
         22
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Each instance has its own copy', false, 0),
       ('The class — one shared copy for all instances', true, 1),
       ('The thread that first reads it', false, 2),
       ('The package the class is in', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (package-private access) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A class member declared with no access modifier has what visibility?',
         'No modifier means package-private: the member is visible to other classes in the same package but not to classes in other packages, even subclasses.',
         'Package-private — visible only within the same package.',
         'Default (no modifier) access is package-private: visible only inside the same package.',
         23
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`public`', false, 0),
       ('`protected`', false, 1),
       ('Package-private', true, 2),
       ('`private`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (protected access) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A `protected` member is visible to:',
         '`protected` widens package-private access to also include subclasses (regardless of package). Note: subclasses can only access protected members via references of their own type, not arbitrary superclass references.',
         'Same-package classes and subclasses anywhere.',
         '`protected` extends package access to subclasses, even those in other packages.',
         24
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only the declaring class', false, 0),
       ('Only classes in the same package', false, 1),
       ('Classes in the same package and subclasses in any package', true, 2),
       ('Any class in the module', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (final on a class) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does declaring a class `final` mean?',
         'A `final` class cannot be subclassed. Examples include `String` and the wrapper types. Use it to prevent extension that could violate invariants.',
         'The class cannot be subclassed.',
         '`final` on a class forbids subclassing.',
         25
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Its fields cannot be reassigned', false, 0),
       ('It cannot be subclassed', true, 1),
       ('It cannot be instantiated', false, 2),
       ('Its methods must all be `static`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (final on a method) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does declaring a method `final` mean?',
         'A `final` method cannot be overridden by subclasses. It can still be inherited and called normally.',
         'Subclasses cannot override the method.',
         '`final` on a method forbids subclasses from overriding it.',
         26
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Subclasses cannot override the method', true, 0),
       ('It cannot be inherited', false, 1),
       ('It must be `static`', false, 2),
       ('It cannot throw checked exceptions', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (constructors and inheritance) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Are constructors inherited in Java?',
         'Constructors are not inherited. A subclass must define its own constructors, which can chain to a superclass constructor via `super(...)`.',
         'No — constructors are not inherited.',
         'Subclasses do not inherit constructors; they must define their own and chain with `super(...)`.',
         27
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, identically to methods', false, 0),
       ('Yes, but only `public` ones', false, 1),
       ('No', true, 2),
       ('Only if marked `inherited`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (static method shadowing) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when a subclass declares a `static` method with the same signature as a `static` method in its superclass?',
         '`static` methods are not subject to dynamic dispatch; the subclass declaration *hides* (shadows) the superclass method rather than overriding it. Calls resolve based on the compile-time type.',
         'It hides (shadows) the superclass method — not an override.',
         '`static` methods are hidden, not overridden; resolution uses the static (compile-time) type.',
         28
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It overrides the superclass method', false, 0),
       ('It hides the superclass method', true, 1),
       ('Compilation fails', false, 2),
       ('Both methods are called in sequence', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (this in static method) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you use `this` inside a `static` method?',
         '`static` methods have no associated instance, so `this` is not in scope. Attempting to use it is a compile-time error.',
         'No — `this` is not in scope inside `static` methods.',
         '`this` refers to the receiver instance and is unavailable in `static` methods.',
         29
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, it refers to the class', false, 0),
       ('Yes, it is `null`', false, 1),
       ('No — `this` is not in scope', true, 2),
       ('Only inside synchronized blocks', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (interface vs abstract class) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is true of `interface` vs `abstract class` in modern Java?',
         'A class can implement many interfaces but extend only one (abstract or concrete) class. Both can declare abstract methods; interfaces can also have `default` and `static` methods but cannot hold instance state.',
         'Multiple interfaces, single abstract class.',
         'A class can implement many interfaces but extend only one class; only abstract classes can hold instance state.',
         30
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A class may extend many abstract classes', false, 0),
       ('A class may implement many interfaces but extend at most one class', true, 1),
       ('Interfaces cannot contain method bodies', false, 2),
       ('Abstract classes cannot have constructors', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (default methods) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why were `default` methods added to interfaces in Java 8?',
         '`default` methods let library authors add new methods to interfaces without breaking existing implementers, because the interface can provide a default body. This was crucial for retrofitting `Collection` with `stream()`, `forEach()`, etc.',
         'To add interface methods without breaking implementers.',
         '`default` methods enable evolving interfaces by providing a fallback implementation for existing implementers.',
         31
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To replace abstract classes', false, 0),
       ('To enable multiple inheritance of state', false, 1),
       ('To add interface methods without breaking implementers', true, 2),
       ('To make interfaces instantiable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (diamond inheritance with defaults) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A class implements two interfaces that both declare a `default` method with the same signature. What is required?',
         'The implementer must override the conflicting method and choose one (e.g. `InterfaceA.super.foo()`) or supply its own implementation. Otherwise the compiler reports an ambiguity.',
         'Override the method to resolve the conflict.',
         'When two interfaces provide conflicting `default` methods, the class must override and explicitly resolve.',
         32
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The first interface listed wins', false, 0),
       ('The class must override the method to disambiguate', true, 1),
       ('The most recently declared interface wins', false, 2),
       ('Compilation succeeds and a random one is picked at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (interface state) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can an `interface` declare instance fields?',
         'Interfaces cannot hold instance state. Fields declared in an interface are implicitly `public static final` constants.',
         'No — interface fields are implicitly `public static final`.',
         'Interfaces cannot hold instance state; declared fields are implicitly constants.',
         33
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes — they default to `private`', false, 0),
       ('No — declared fields are `public static final` constants', true, 1),
       ('Yes — but only `protected`', false, 2),
       ('Only since Java 17', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (Object methods) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which method is NOT declared on `java.lang.Object`?',
         '`Object` declares `equals`, `hashCode`, `toString`, `getClass`, `clone`, `finalize`, `notify`, `notifyAll`, and `wait`. `compareTo` belongs to `Comparable`, not `Object`.',
         '`compareTo` — it lives on `Comparable`.',
         '`compareTo` is from `Comparable`; `Object` provides `equals`, `hashCode`, `toString`, etc.',
         34
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`hashCode()`', false, 0),
       ('`toString()`', false, 1),
       ('`compareTo()`', true, 2),
       ('`getClass()`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (abstract method rules) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which combination of modifiers is illegal in Java?',
         'An `abstract` method must be overridden, but a `private` method cannot be inherited and a `final` method cannot be overridden. Both `abstract private` and `abstract final` are forbidden.',
         '`abstract final` is illegal — `abstract` requires overriding.',
         '`abstract` is incompatible with `final` and `private` because the method must be overridden.',
         35
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`public abstract`', false, 0),
       ('`protected abstract`', false, 1),
       ('`abstract final`', true, 2),
       ('`abstract`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (Liskov / overriding return type) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When overriding a method, the return type may be:',
         'Java supports covariant return types: the overriding method may return a subtype of the original return type. The throws clause may also be narrowed, not widened.',
         'A subtype of the original return type (covariant).',
         'Overriding methods may declare a covariant (more specific) return type.',
         36
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Identical to the original only', false, 0),
       ('A subtype of the original return type', true, 1),
       ('A supertype of the original return type', false, 2),
       ('Anything, including unrelated types', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (instanceof null) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `null instanceof String` evaluate to?',
         '`instanceof` always returns `false` for a `null` operand, regardless of the target type. This is a useful idiom for null-safe type checks.',
         '`false` — `instanceof` is `false` for `null`.',
         '`instanceof` is `null`-safe and returns `false` when the operand is `null`.',
         37
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`true`', false, 0),
       ('`false`', true, 1),
       ('Throws `NullPointerException`', false, 2),
       ('Does not compile', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (abstract class with no abstract methods) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can an `abstract` class contain zero `abstract` methods?',
         'Yes. Marking a class `abstract` prevents direct instantiation even if every method has an implementation; subclasses are still required to instantiate.',
         'Yes — `abstract` only forbids instantiation.',
         'A class may be `abstract` with no abstract methods; the modifier alone forbids instantiation.',
         38
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — at least one abstract method is required', false, 0),
       ('Yes', true, 1),
       ('Only if it implements an interface', false, 2),
       ('Only if it is also `sealed`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (interface static methods) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you call a `static` method declared on an `interface`?',
         'Interface `static` methods are not inherited; they must be invoked through the interface name itself (e.g. `MyInterface.helper()`).',
         '`InterfaceName.method(...)` — they are not inherited.',
         'Interface `static` methods are invoked through the interface name and are not inherited by implementers.',
         39
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Through an implementing class name', false, 0),
       ('Through an instance reference', false, 1),
       ('Through the interface name', true, 2),
       ('They cannot be called directly', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (generic class declaration) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which declares a generic class `Box` with a single type parameter `T`?',
         'A generic class declares its type parameters in angle brackets after the class name: `class Box<T> { ... }`. Inside the class, `T` is used like any other type.',
         '`class Box<T> { ... }`.',
         'Generic classes declare type parameters in angle brackets after the class name.',
         40
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`class Box<T> { ... }`', true, 0),
       ('`class Box[T] { ... }`', false, 1),
       ('`class Box(T) { ... }`', false, 2),
       ('`generic class Box of T { ... }`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (bounded type parameter) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you constrain a type parameter `T` to subtypes of `Number`?',
         'Use an upper bound with the `extends` keyword: `<T extends Number>`. This allows arithmetic-style operations and treats `T` as `Number` inside the generic body.',
         '`<T extends Number>` — upper-bounded type parameter.',
         'Constrain a type parameter with `<T extends Bound>` to require an upper bound.',
         41
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`<T : Number>`', false, 0),
       ('`<T super Number>`', false, 1),
       ('`<T extends Number>`', true, 2),
       ('`<T implements Number>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (PECS) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'According to the PECS rule, which wildcard should a method accept if it only reads `Number` values from the collection?',
         'PECS: "Producer Extends, Consumer Super". A collection you read from is a producer of values, so use `? extends Number` to accept `List<Number>`, `List<Integer>`, etc.',
         '`? extends Number` — producer extends.',
         'PECS: use `? extends T` for producers (read) and `? super T` for consumers (write).',
         42
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`? super Number`', false, 0),
       ('`? extends Number`', true, 1),
       ('`?` (unbounded)', false, 2),
       ('`Number` (invariant)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 (PECS consumer) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which wildcard would you use for a `List` you only write `Integer` values into?',
         '"Consumer Super": when you only put `Integer` values in, the list is a consumer of `Integer`, so `List<? super Integer>` accepts `List<Integer>`, `List<Number>`, and `List<Object>`.',
         '`List<? super Integer>` — consumer super.',
         'Use `? super T` for a consumer collection that you only write `T` values into.',
         43
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`List<? extends Integer>`', false, 0),
       ('`List<? super Integer>`', true, 1),
       ('`List<Integer>`', false, 2),
       ('`List<Object>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (type erasure) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "type erasure" in Java generics?',
         'At compile time, generic type parameters are checked, then erased to their bounds (or `Object` if unbounded) in the bytecode. The runtime does not retain `<T>` information for instances, so `List<String>.class` does not exist.',
         'Generic type info is stripped at compile time.',
         'Type erasure removes generic parameters at compile time; the runtime sees raw types.',
         44
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Generics are reified and stored at runtime', false, 0),
       ('Generic type parameters are removed at compile time', true, 1),
       ('Erasure happens only for primitive types', false, 2),
       ('It refers to garbage-collecting unused generics', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (generic primitive restriction) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `List<int>` not allowed in Java?',
         'Generic type arguments must be reference types because, after erasure, they are replaced by `Object` (or a bound). Use the wrapper `Integer` (or specialised streams like `IntStream`) instead.',
         'Generic type arguments must be reference types.',
         'Primitives cannot be generic type arguments; use wrapper types like `Integer`.',
         45
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int` is reserved by the compiler', false, 0),
       ('Generic type arguments must be reference types', true, 1),
       ('Lists may not hold primitives by spec', false, 2),
       ('It requires a separate `import`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (raw types) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you assign a `List<String>` to a raw `List` variable?',
         'The compiler issues an unchecked-warning because you have stepped outside the generic type system. The runtime can no longer ensure type safety, so subsequent additions of wrong-typed elements may cause `ClassCastException` at retrieval.',
         'Compiles with an unchecked warning; type safety is lost.',
         'Mixing generics with raw types compiles with an unchecked warning and loses compile-time type safety.',
         46
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compile-time error', false, 0),
       ('Compiles with an unchecked warning', true, 1),
       ('Compiles silently with full type safety', false, 2),
       ('Throws `ClassCastException` immediately', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (generic method syntax) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you declare a generic method that returns its argument unchanged?',
         'Generic methods place type parameters before the return type: `public <T> T identity(T value) { return value; }`. The type parameter is scoped to the method.',
         '`public <T> T identity(T value) { ... }`.',
         'Generic methods declare type parameters in angle brackets before the return type.',
         47
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`public T <T> identity(T value)`', false, 0),
       ('`public <T> T identity(T value)`', true, 1),
       ('`public T identity<T>(T value)`', false, 2),
       ('`public generic T identity(T value)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (multiple bounds) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A type parameter may have multiple bounds with which syntax?',
         'Multiple bounds are joined with `&`: e.g. `<T extends Number & Comparable<T>>`. At most one bound may be a class, and it must come first.',
         '`<T extends Number & Comparable<T>>` — join with `&`.',
         'Multiple bounds use `&`; the optional class bound must come first.',
         48
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`<T extends Number, Comparable<T>>`', false, 0),
       ('`<T extends Number | Comparable<T>>`', false, 1),
       ('`<T extends Number & Comparable<T>>`', true, 2),
       ('`<T extends Number + Comparable<T>>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (unbounded wildcard) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `List<?>` mean?',
         '`List<?>` is an unbounded wildcard: a list of *some* unknown type. You can read elements as `Object` but cannot add anything except `null`, because the unknown element type is not statically known.',
         'List of some unknown type — read-as-`Object`, write-only-`null`.',
         '`List<?>` accepts any element type but is effectively read-only (only `null` may be added).',
         49
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A list of `Object` references', false, 0),
       ('A list of some unspecified type', true, 1),
       ('A `null` list', false, 2),
       ('A list of any primitive', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (List vs Set) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the defining difference between `List` and `Set` in the Java Collections Framework?',
         '`List` is an ordered sequence that allows duplicates and access by index. `Set` is a collection of unique elements without positional access (some implementations also impose ordering).',
         '`List` is ordered and allows duplicates; `Set` rejects duplicates.',
         '`List` is indexed and accepts duplicates; `Set` enforces uniqueness.',
         50
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Set` is ordered; `List` is unordered', false, 0),
       ('`List` allows duplicates; `Set` does not', true, 1),
       ('`Set` is always sorted; `List` is not', false, 2),
       ('`List` is thread-safe; `Set` is not', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (ArrayList vs LinkedList random access) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For random access by index, which is asymptotically better: `ArrayList` or `LinkedList`?',
         '`ArrayList` is array-backed and supports O(1) index access. `LinkedList` is a doubly-linked list with O(n) index access; it is rarely faster than `ArrayList` in practice.',
         '`ArrayList` — O(1) index access vs O(n) for `LinkedList`.',
         '`ArrayList` gives O(1) indexed access; `LinkedList` requires O(n) traversal.',
         51
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`ArrayList`', true, 0),
       ('`LinkedList`', false, 1),
       ('Both are O(1)', false, 2),
       ('Both are O(n)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (HashMap requirement) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For a custom key class to work correctly in a `HashMap`, you must:',
         'Hash-based collections rely on `hashCode()` to bucket entries and `equals()` to confirm matches. Override both consistently or lookups will misbehave.',
         'Override `equals()` and `hashCode()` consistently.',
         '`HashMap` keys require consistent `equals()` and `hashCode()` overrides.',
         52
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Implement `Comparable`', false, 0),
       ('Override `equals()` and `hashCode()` consistently', true, 1),
       ('Implement `Serializable`', false, 2),
       ('Mark the class `final`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (HashMap null keys) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `HashMap` treat `null` keys and values?',
         '`HashMap` allows a single `null` key and any number of `null` values. `Hashtable` and `ConcurrentHashMap` permit neither.',
         'One `null` key allowed; many `null` values allowed.',
         '`HashMap` permits one `null` key and any number of `null` values, unlike `Hashtable`/`ConcurrentHashMap`.',
         53
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No `null` keys, no `null` values', false, 0),
       ('No `null` keys, but `null` values allowed', false, 1),
       ('One `null` key allowed; any number of `null` values', true, 2),
       ('Any number of `null` keys; no `null` values', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (TreeMap ordering) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What ordering does `TreeMap` use for its keys?',
         '`TreeMap` is a red-black-tree-backed `NavigableMap` that orders keys by their natural ordering (`Comparable`) or by a `Comparator` supplied at construction.',
         'Natural ordering or supplied `Comparator`.',
         '`TreeMap` stores keys in sorted order using `Comparable` or a `Comparator`.',
         54
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Insertion order', false, 0),
       ('Natural ordering or a supplied `Comparator`', true, 1),
       ('Hash bucket order', false, 2),
       ('Random order', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (LinkedHashMap order) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What iteration order does `LinkedHashMap` provide by default?',
         '`LinkedHashMap` maintains a doubly-linked list across entries to preserve insertion order on iteration. It can be configured for access order, which makes it useful as an LRU cache.',
         'Insertion order (optional access-order mode).',
         '`LinkedHashMap` iterates in insertion order and can be switched to access order for LRU use.',
         55
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sorted order', false, 0),
       ('Insertion order', true, 1),
       ('Hash order', false, 2),
       ('Reverse insertion order', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (Iterator.remove vs collection.remove during iteration) --------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'During iteration, how should you safely remove elements from an `ArrayList`?',
         'Calling `list.remove(...)` while iterating with a for-each loop throws `ConcurrentModificationException`. Use `Iterator.remove()` or `removeIf(...)` to mutate the list during iteration safely.',
         'Use `Iterator.remove()` or `Collection.removeIf(...)`.',
         'Remove during iteration via `Iterator.remove()` or `removeIf(...)`, not the collection''s own `remove`.',
         56
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Call `list.remove(element)` inside a for-each loop', false, 0),
       ('Call `Iterator.remove()` or use `removeIf`', true, 1),
       ('Set the element to `null`', false, 2),
       ('Synchronize the loop body', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (Collections.unmodifiableList) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Collections.unmodifiableList(list)` return?',
         'It returns a read-only *view* over the original list. Mutating attempts throw `UnsupportedOperationException`, but changes to the underlying list are visible through the view.',
         'Read-only view over the original list.',
         '`Collections.unmodifiableList` wraps a list in a read-only view; the underlying list can still change.',
         57
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A defensive copy of the list', false, 0),
       ('A read-only view of the original list', true, 1),
       ('A thread-safe wrapper', false, 2),
       ('A sorted copy of the list', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (HashMap initial capacity / load factor) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the default load factor of `HashMap`?',
         '`HashMap` resizes (doubles its bucket array) when the number of entries exceeds capacity * load factor. The default load factor is `0.75`, balancing time and space cost.',
         '`0.75`.',
         '`HashMap`''s default load factor is `0.75`, triggering resize past capacity * 0.75.',
         58
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0.5`', false, 0),
       ('`0.75`', true, 1),
       ('`1.0`', false, 2),
       ('`2.0`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (Set implementations) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which `Set` implementation preserves insertion order?',
         '`LinkedHashSet` keeps a linked list across entries to iterate in insertion order. `HashSet` has no guarantee; `TreeSet` uses sorted order.',
         '`LinkedHashSet`.',
         '`LinkedHashSet` preserves insertion order; `HashSet` does not, and `TreeSet` sorts.',
         59
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`HashSet`', false, 0),
       ('`TreeSet`', false, 1),
       ('`LinkedHashSet`', true, 2),
       ('`EnumSet`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 (checked vs unchecked) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is an unchecked exception in Java?',
         'Subclasses of `RuntimeException` (and `Error`) are unchecked; they need not be declared or caught. `IOException`, `SQLException`, and `InterruptedException` are checked.',
         '`IllegalArgumentException` extends `RuntimeException`.',
         'Unchecked exceptions extend `RuntimeException` or `Error`; checked ones must be declared or caught.',
         60
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`IOException`', false, 0),
       ('`SQLException`', false, 1),
       ('`InterruptedException`', false, 2),
       ('`IllegalArgumentException`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (finally always runs) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does a `finally` block run?',
         'A `finally` block runs after the `try` (and any matching `catch`) regardless of normal completion, exception, or `return`. Only JVM termination (e.g. `System.exit`, abrupt shutdown) or thread death can skip it.',
         'After `try`/`catch`, even on exception or `return`.',
         '`finally` runs unconditionally after `try`/`catch`, unless the JVM exits or the thread dies.',
         61
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only when no exception is thrown', false, 0),
       ('Only when an exception is thrown', false, 1),
       ('After `try`/`catch` in nearly all cases', true, 2),
       ('Only when `return` is not used in `try`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (try-with-resources) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What interface must a resource implement to be used in try-with-resources?',
         'Try-with-resources requires `AutoCloseable` (or its subtype `Closeable`). The compiler arranges for `close()` to be invoked at the end of the `try`, even on exception.',
         '`AutoCloseable`.',
         'Try-with-resources requires types that implement `AutoCloseable`.',
         62
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Serializable`', false, 0),
       ('`AutoCloseable`', true, 1),
       ('`Comparable`', false, 2),
       ('`Iterable`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (multi-catch) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you catch either `IOException` or `SQLException` in a single `catch` clause?',
         'Java 7 introduced multi-catch with `|`: `catch (IOException | SQLException e) { ... }`. The shared variable is treated as the common supertype of the listed exceptions.',
         '`catch (IOException | SQLException e) { ... }`.',
         'Multi-catch uses `|` to handle multiple exception types in one clause.',
         63
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`catch (IOException, SQLException e)`', false, 0),
       ('`catch (IOException | SQLException e)`', true, 1),
       ('`catch (IOException & SQLException e)`', false, 2),
       ('`catch (Exception e if e instanceof IOException || e instanceof SQLException)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (throws clause and overrides) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When overriding a method, the overriding method''s `throws` clause may:',
         'An overriding method may throw fewer or more specific *checked* exceptions, but not new checked exceptions. Unchecked exceptions are unrestricted.',
         'List fewer (or more specific) checked exceptions only.',
         'Overrides may narrow but not widen the checked exceptions listed in `throws`.',
         64
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Add new checked exceptions', false, 0),
       ('Be omitted entirely if the parent declares any', false, 1),
       ('Only list fewer/narrower checked exceptions than the parent', true, 2),
       ('Replace checked with unchecked of equal type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (return in finally) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'If both `try` and `finally` execute a `return` statement, which value is returned?',
         'A `return` in `finally` overrides any `return` (or thrown exception) from `try`/`catch`. This is generally considered an anti-pattern because it can swallow exceptions.',
         'The `finally` value wins.',
         'A `return` in `finally` overrides earlier returns or exceptions — avoid it.',
         65
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The value from the `try` block', false, 0),
       ('The value from the `finally` block', true, 1),
       ('Both, joined as an array', false, 2),
       ('Compile-time error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (suppressed exceptions) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a try-with-resources block, what happens if both the `try` body and the resource''s `close()` throw exceptions?',
         'The exception from the `try` body is the primary exception. The exception from `close()` is attached as a "suppressed" exception, accessible via `Throwable.getSuppressed()`.',
         'The `close()` exception is added as suppressed on the primary.',
         'Try-with-resources keeps the primary exception and attaches close-time exceptions as suppressed.',
         66
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only the `close()` exception propagates', false, 0),
       ('Only the body''s exception propagates; `close()` is silently swallowed', false, 1),
       ('The body''s exception propagates with `close()` attached as suppressed', true, 2),
       ('Both are wrapped in a `MultipleException`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (Error vs Exception) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is true of `Error` vs `Exception`?',
         '`Error` represents serious problems an application typically should not catch (e.g. `OutOfMemoryError`, `StackOverflowError`). `Exception` represents conditions an application might reasonably want to catch.',
         '`Error` indicates serious JVM-level problems, not generally to catch.',
         '`Error` denotes unrecoverable JVM-level problems; `Exception` describes recoverable conditions.',
         67
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Error` is checked; `Exception` is unchecked', false, 0),
       ('Both must be declared in `throws`', false, 1),
       ('`Error` represents serious problems applications should not normally catch', true, 2),
       ('`Error` extends `Exception`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 68 (NumberFormatException) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which exception does `Integer.parseInt("abc")` throw?',
         '`Integer.parseInt` throws `NumberFormatException` when the input cannot be parsed as a decimal integer. It extends `IllegalArgumentException`, which extends `RuntimeException`.',
         '`NumberFormatException`.',
         '`Integer.parseInt` throws `NumberFormatException` for non-numeric input.',
         68
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`NumberFormatException`', true, 0),
       ('`ArithmeticException`', false, 1),
       ('`IllegalStateException`', false, 2),
       ('`ClassCastException`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (custom checked exception) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which superclass should a custom checked exception extend?',
         'A checked exception must extend `Exception` (but not `RuntimeException`). Code that throws it must declare or catch it.',
         '`Exception` (but not `RuntimeException`).',
         'Checked exceptions extend `Exception` directly (not `RuntimeException`).',
         69
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Throwable`', false, 0),
       ('`Error`', false, 1),
       ('`RuntimeException`', false, 2),
       ('`Exception`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (Runnable signature) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the signature of `Runnable.run()`?',
         '`Runnable` is a `@FunctionalInterface` with a single method `void run()`. It cannot return a value or throw checked exceptions; for those, use `Callable`.',
         '`void run()` — no return, no checked throws.',
         '`Runnable.run()` is `void` and may not throw checked exceptions; use `Callable` if you need either.',
         70
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Object run()`', false, 0),
       ('`void run()`', true, 1),
       ('`void run() throws Exception`', false, 2),
       ('`Future<?> run()`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (Callable vs Runnable) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `Callable<V>` differ from `Runnable`?',
         '`Callable<V>` returns a value of type `V` and may throw checked exceptions. Submit it to an `ExecutorService` to obtain a `Future<V>`.',
         '`Callable` returns a value and can throw checked exceptions.',
         '`Callable<V>` returns a result and may throw checked exceptions, unlike `Runnable`.',
         71
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It runs on the calling thread only', false, 0),
       ('It returns a value and may throw checked exceptions', true, 1),
       ('It cannot be submitted to an executor', false, 2),
       ('It is synchronized by default', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (synchronized method) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which monitor does a non-static `synchronized` method acquire?',
         'A non-static `synchronized` method locks `this`. A `static synchronized` method locks the `Class` object for the declaring class.',
         '`this` — the receiver instance.',
         'Instance `synchronized` methods lock `this`; static ones lock the `Class` object.',
         72
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The class object', false, 0),
       ('The current thread', false, 1),
       ('`this` (the receiver instance)', true, 2),
       ('A new monitor each call', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (volatile semantics) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `volatile` keyword guarantee?',
         '`volatile` guarantees visibility (reads see the latest write) and prevents certain reorderings, but it does NOT provide atomic compound updates (e.g. `count++` is still unsafe).',
         'Visibility across threads; no compound-update atomicity.',
         '`volatile` ensures cross-thread visibility and ordering but does not make compound operations atomic.',
         73
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Atomic increments and decrements', false, 0),
       ('Visibility of writes across threads', true, 1),
       ('Mutual exclusion across threads', false, 2),
       ('Caching in CPU registers', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 74 (Thread.start vs run) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between calling `thread.start()` and `thread.run()`?',
         '`start()` schedules a new thread and invokes `run()` on it. Calling `run()` directly executes the body on the *current* thread, with no concurrency.',
         '`start()` spawns a new thread; `run()` executes inline.',
         '`Thread.start()` launches a new thread; calling `run()` directly executes on the caller''s thread.',
         74
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical', false, 0),
       ('`run()` starts a new thread; `start()` runs inline', false, 1),
       ('`start()` schedules a new thread; `run()` executes inline', true, 2),
       ('Only `run()` is allowed; `start()` is deprecated', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (ExecutorService shutdown) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'After calling `executor.shutdown()`, what happens?',
         '`shutdown()` initiates an orderly shutdown: previously submitted tasks continue, but no new tasks are accepted. `shutdownNow()` additionally tries to interrupt running tasks.',
         'Previously submitted tasks finish; new ones are rejected.',
         '`shutdown()` lets queued tasks finish but rejects new submissions; `shutdownNow()` also interrupts running ones.',
         75
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All running tasks are immediately cancelled', false, 0),
       ('Previously submitted tasks complete; new submissions are rejected', true, 1),
       ('The JVM exits', false, 2),
       ('Submissions are paused until `restart()` is called', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (Future.get blocking) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Future.get()` do if the task is not yet complete?',
         '`Future.get()` blocks the calling thread until the result is available, the task fails (rethrown wrapped in `ExecutionException`), or the calling thread is interrupted.',
         'Blocks until the task completes (or throws).',
         '`Future.get()` blocks the caller until the task completes or fails.',
         76
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns `null` immediately', false, 0),
       ('Throws `TimeoutException` immediately', false, 1),
       ('Blocks the caller until completion', true, 2),
       ('Spawns a new thread to compute the result', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 77 (atomic vs synchronized) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a thread-safe way to increment a shared counter without using `synchronized`?',
         '`AtomicInteger.incrementAndGet()` uses a CAS (compare-and-swap) operation for lock-free atomicity. `int` and `volatile int` increments are not atomic.',
         '`AtomicInteger.incrementAndGet()`.',
         '`AtomicInteger` provides lock-free atomic updates via CAS, unlike `volatile int`.',
         77
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`volatile int count; count++;`', false, 0),
       ('`int count; count++;`', false, 1),
       ('`AtomicInteger.incrementAndGet()`', true, 2),
       ('`final int count; count++;`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (deadlock cause) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which scenario is the classic deadlock?',
         'Deadlock occurs when threads hold locks and request additional locks in different orders, forming a cycle in the wait graph. Acquiring locks in a globally consistent order avoids this.',
         'Two threads holding one lock each and waiting for the other.',
         'A circular wait on locks (different acquisition orders) is the classic deadlock pattern.',
         78
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Two threads racing to write the same `volatile` variable', false, 0),
       ('Two threads holding lock A/B respectively and waiting on the other', true, 1),
       ('A single thread calling `Thread.sleep(Long.MAX_VALUE)`', false, 2),
       ('A producer faster than a consumer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (Thread.interrupt semantics) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When a thread is interrupted while inside `Thread.sleep`, what happens?',
         '`sleep` (and other blocking methods like `wait`, `join`) throw `InterruptedException` and clear the interrupted status. You should restore the status (`Thread.currentThread().interrupt()`) or propagate the exception.',
         '`InterruptedException` is thrown and the interrupt flag is cleared.',
         'Interrupting a sleeping thread throws `InterruptedException` and clears the interrupt flag.',
         79
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The thread silently wakes up early', false, 0),
       ('The thread terminates immediately', false, 1),
       ('`InterruptedException` is thrown and the interrupt flag is cleared', true, 2),
       ('Nothing — `sleep` ignores interrupts', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 80 (lambda target type) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A lambda expression in Java is compatible with:',
         'Lambdas are converted to instances of a *functional interface* — an interface with exactly one abstract method (`@FunctionalInterface` is optional but recommended). The lambda''s shape must match that single abstract method.',
         'Any functional interface (single-abstract-method).',
         'A lambda is shorthand for an implementation of a functional interface''s single abstract method.',
         80
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any interface', false, 0),
       ('Only `Runnable`', false, 1),
       ('Any abstract class', false, 2),
       ('A functional interface (one abstract method)', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (Stream laziness) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Streams in Java are:',
         'Streams are lazy: intermediate operations (`map`, `filter`, etc.) build a pipeline and do nothing until a terminal operation (`collect`, `forEach`, `reduce`, …) is invoked.',
         'Lazy — intermediate ops run only on terminal invocation.',
         'Java streams are lazy; nothing happens until a terminal operation triggers the pipeline.',
         81
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Eagerly evaluated at each step', false, 0),
       ('Lazy — intermediate operations execute only on a terminal operation', true, 1),
       ('Always parallel by default', false, 2),
       ('Reusable across multiple terminal operations', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 82 (Stream reuse) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if you try to apply two terminal operations to the same `Stream`?',
         'A `Stream` is consumed by its terminal operation; using it again throws `IllegalStateException`. You must create a fresh stream from the source.',
         '`IllegalStateException` — streams are single-use.',
         'A `Stream` is single-use; re-running a terminal op throws `IllegalStateException`.',
         82
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both run independently', false, 0),
       ('It throws `IllegalStateException`', true, 1),
       ('The second is silently ignored', false, 2),
       ('The stream is automatically reset', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (Stream.collect grouping) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which `Collector` groups stream elements by a key function into a `Map`?',
         '`Collectors.groupingBy(classifier)` groups elements into a `Map<K, List<V>>` keyed by the classifier function. Use a downstream collector for richer grouping (e.g. counts).',
         '`Collectors.groupingBy(...)`.',
         '`Collectors.groupingBy` produces a `Map` keyed by a classifier function.',
         83
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Collectors.toList()`', false, 0),
       ('`Collectors.partitioningBy(...)`', false, 1),
       ('`Collectors.groupingBy(...)`', true, 2),
       ('`Collectors.joining(...)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (method references) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a valid method reference equivalent to the lambda `s -> s.length()`?',
         '`String::length` is an instance method reference where the receiver is the lambda argument. It is shorthand for `s -> s.length()` when targeting a `Function<String, Integer>`.',
         '`String::length`.',
         'Method references like `String::length` are shorthand for matching lambda expressions.',
         84
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`String.length`', false, 0),
       ('`String::length`', true, 1),
       ('`length::String`', false, 2),
       ('`s -> length(s)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 85 (Optional purpose) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the primary purpose of `Optional<T>`?',
         '`Optional<T>` is a container designed for return values to express the possibility of absence explicitly. It is intentionally not designed for fields or collection contents.',
         'Express an explicit absence in return values.',
         '`Optional<T>` expresses an explicit "possibly absent" return value; it''s not for fields or collections.',
         85
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Replace all `null` references in fields', false, 0),
       ('Express explicit "value or absence" in return types', true, 1),
       ('Provide thread-safe value containers', false, 2),
       ('Make values lazily computed', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (Optional.orElseGet) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `Optional.orElseGet(Supplier)` differ from `Optional.orElse(T)`?',
         '`orElse` evaluates its argument eagerly even when the `Optional` is present. `orElseGet` defers via a `Supplier`, so the fallback runs only when the value is absent.',
         '`orElse` is eager; `orElseGet` is lazy.',
         'Use `orElseGet` for expensive defaults — `orElse` evaluates eagerly even when the value is present.',
         86
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are equivalent', false, 0),
       ('`orElseGet` is eager; `orElse` is lazy', false, 1),
       ('`orElse` is eager; `orElseGet` is lazy', true, 2),
       ('`orElseGet` throws when the value is present', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (functional interface @ annotation) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of the `@FunctionalInterface` annotation?',
         'It documents intent and asks the compiler to verify that the interface has exactly one abstract method. Without it, accidentally adding a second abstract method silently breaks lambda compatibility.',
         'Compile-time check that the interface has exactly one abstract method.',
         '`@FunctionalInterface` makes the compiler enforce a single-abstract-method shape.',
         87
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It marks the interface for runtime reflection', false, 0),
       ('It enforces a single abstract method at compile time', true, 1),
       ('It auto-generates a lambda implementation', false, 2),
       ('It makes the interface `default`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 88 (Stream.parallel) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `stream.parallel()` do?',
         '`parallel()` marks the stream as parallel; subsequent processing uses the common `ForkJoinPool` to split work. It does not guarantee speedup — small data sets and stateful operations often slow down.',
         'Marks the pipeline as parallel (uses `ForkJoinPool`).',
         '`parallel()` opts the stream into the common `ForkJoinPool`; gains depend on workload.',
         88
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Schedules the stream onto a new dedicated thread', false, 0),
       ('Asks the runtime to process elements concurrently via the common `ForkJoinPool`', true, 1),
       ('Runs each terminal operation on a separate JVM', false, 2),
       ('Forces synchronisation around each element', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (effectively final) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Local variables captured by a lambda must be:',
         'Local variables referenced from a lambda or anonymous class must be `final` or "effectively final" (not reassigned after initialisation). The restriction prevents data races and lifetime issues.',
         '`final` or effectively final.',
         'Captured locals must be effectively final so the lambda sees a stable value.',
         89
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`static`', false, 0),
       ('`volatile`', false, 1),
       ('`final` or effectively final', true, 2),
       ('Primitive-only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (records) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is true of Java `record` types?',
         'Records (Java 16+) are transparent data carriers. The compiler generates the canonical constructor, accessors, `equals`, `hashCode`, and `toString` from the components. Records are implicitly `final` and cannot extend another class.',
         'Transparent data carriers with generated accessors/`equals`/`hashCode`.',
         'A `record` is an implicitly final, transparent data carrier whose accessors and `equals`/`hashCode`/`toString` are auto-generated.',
         90
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Records may extend other classes', false, 0),
       ('Records auto-generate accessors, `equals`, `hashCode`, and `toString`', true, 1),
       ('Records may declare additional instance fields', false, 2),
       ('Records are mutable by default', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (sealed classes) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `sealed class Shape permits Circle, Square { ... }` do?',
         '`sealed` restricts the set of allowed direct subclasses to those listed in `permits`. Each permitted subclass must itself be `final`, `sealed`, or `non-sealed`. This enables exhaustive `switch` pattern matching.',
         'Limits direct subclasses to the listed permitted classes.',
         '`sealed` restricts subclassing to a fixed list, enabling exhaustive analysis (e.g. in `switch`).',
         91
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Prevents the class from being instantiated', false, 0),
       ('Restricts the direct subclasses of `Shape` to `Circle` and `Square`', true, 1),
       ('Marks the class as immutable', false, 2),
       ('Auto-implements the listed types', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (var keyword) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Where can the `var` keyword (Java 10+) be used?',
         '`var` performs local variable type inference. It is allowed for local variables with initialisers, for-loop indices, and try-with-resources. It cannot be used for fields, method signatures, or without an initialiser.',
         'Local variables with an initialiser only.',
         '`var` is limited to local variables with initialisers; not fields, parameters, or return types.',
         92
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any field, parameter, or return type', false, 0),
       ('Only on `static` fields', false, 1),
       ('Only on local variables with an initialiser', true, 2),
       ('Only for primitive types', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (switch expressions) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is one advantage of a switch *expression* (`->`) over a classic switch *statement*?',
         'Switch expressions evaluate to a value, do not fall through between arms, and the compiler enforces exhaustiveness when targeting `sealed` hierarchies or `enum` types.',
         'Yields a value, no fall-through, can be exhaustive.',
         'Switch expressions return values, avoid fall-through, and support compiler-checked exhaustiveness.',
         93
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Implicit fall-through between arms', false, 0),
       ('Yields a value with no implicit fall-through', true, 1),
       ('Allows mutating the switched-on variable', false, 2),
       ('Runs each arm in parallel', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (pattern matching for instanceof) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does pattern matching for `instanceof` allow you to write?',
         'Pattern matching binds a typed name inline: `if (obj instanceof String s) { use(s); }`. The binding variable `s` is in scope where the test definitely succeeds.',
         '`if (obj instanceof String s) { use(s); }`.',
         '`instanceof` patterns bind a typed variable inline, removing the need for an explicit cast.',
         94
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`if (obj instanceof String s) { use(s); }`', true, 0),
       ('`if (obj is String s) { use(s); }`', false, 1),
       ('`switch obj match { ... }`', false, 2),
       ('`if (obj instanceof String as s) { ... }`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (JVM memory regions) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Where are Java objects allocated by default?',
         'Objects live on the heap; the stack stores frames, local primitive variables, and references. The JVM may, via escape analysis, scalar-replace short-lived objects to avoid heap allocation, but this is an optimisation, not the model.',
         'On the heap.',
         'By default, Java allocates objects on the heap; the stack stores frames and references.',
         95
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('On the stack', false, 0),
       ('On the heap', true, 1),
       ('In the method area', false, 2),
       ('Inline in the bytecode', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (garbage collection roots) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is NOT a typical GC root?',
         'Typical GC roots include local variables on stack frames, active thread stacks, `static` fields, and JNI references. Soft references are not roots; reachability through them depends on collector policy.',
         'Soft references are not GC roots.',
         'GC roots include stack variables, threads, and statics; `SoftReference` targets are not roots.',
         96
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Local variables on the stack', false, 0),
       ('Active threads', false, 1),
       ('`static` fields of loaded classes', false, 2),
       ('Targets of `SoftReference`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (finalize deprecated) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the recommended replacement for the deprecated `Object.finalize()` method?',
         '`finalize()` is unpredictable and was deprecated for removal in Java 9. The standard replacements are `Cleaner` (or `PhantomReference`) for native cleanup, and `AutoCloseable` + try-with-resources for deterministic cleanup.',
         '`Cleaner` / `PhantomReference`, plus `AutoCloseable`.',
         '`finalize()` is deprecated — prefer `AutoCloseable` and, for native cleanup, `Cleaner` or `PhantomReference`.',
         97
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`finalizeAndClose()`', false, 0),
       ('`System.gc()`', false, 1),
       ('`Cleaner` / `PhantomReference` (and `AutoCloseable`)', true, 2),
       ('`Thread.cleanup()`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (PermGen / Metaspace) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In modern HotSpot JVMs (Java 8+), class metadata is stored in:',
         'Java 8 removed the fixed-size PermGen and replaced it with Metaspace, which lives in native memory and grows as needed (subject to `MaxMetaspaceSize`). Class metadata, method bytecode, and constant pools live there.',
         'Metaspace (native memory), replacing PermGen.',
         'Since Java 8, class metadata lives in Metaspace (native memory), not the old PermGen.',
         98
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('PermGen', false, 0),
       ('The young generation', false, 1),
       ('Metaspace', true, 2),
       ('The code cache exclusively', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (modern GC default) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which garbage collector has been the default in HotSpot since Java 9?',
         'Java 9 made G1 (Garbage-First) the default collector. It splits the heap into regions and aims for predictable pause times while still being a generational, mostly-concurrent collector. Parallel GC was the default before Java 9.',
         'G1 (Garbage-First).',
         'Since Java 9, HotSpot defaults to the G1 collector for predictable pause times.',
         99
  from modules where slug = 'java'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Serial GC', false, 0),
       ('Parallel GC', false, 1),
       ('CMS', false, 2),
       ('G1 (Garbage-First)', true, 3)
     ) as c(label, is_correct, order_index);
