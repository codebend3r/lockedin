-- 011_seed_csharp.sql
-- C# modules: split into three difficulty levels (32 / 54 / 14 questions). Module rows are in 006_seed_more_modules.sql.

-- ============================================================
-- csharp-1
-- ============================================================

-- Question 0 [orig 0] (value vs reference types) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following is a *reference* type in C#?',
         'In C#, `class`, `string`, `object`, arrays, and delegates are reference types stored on the heap. `int`, `double`, `bool`, and `struct` instances are value types stored inline (often on the stack or within their containing object).',
         'Reference types: `class`, `string`, arrays, delegates.',
         'Reference types in C# (such as `class` and `string`) store references on the heap, while value types like `int` and `struct` are stored by value.',
         0
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int`', false, 0),
       ('`DateTime`', false, 1),
       ('`string`', true, 2),
       ('`decimal`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 1] (struct vs class) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the key behavioural difference between a `struct` and a `class` in C#?',
         'A `struct` is a value type; assigning a struct copies its data. A `class` is a reference type; assignment copies the reference, so both variables point to the same object.',
         '`struct` copies by value; `class` copies by reference.',
         'In C#, a `struct` has value semantics so assignment copies the data, whereas a `class` has reference semantics so assignment copies a reference to the same object.',
         1
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Structs support inheritance; classes do not.', false, 0),
       ('Structs are copied by value; classes are copied by reference.', true, 1),
       ('Structs can never contain methods.', false, 2),
       ('Classes are always allocated on the stack.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 3] (default value of a struct) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of `default(MyStruct)` for a user-defined `struct`?',
         'Every value type has a zero-initialised default: all fields are set to their respective default values (0, `false`, `null` for reference fields). No constructor is invoked.',
         'All fields zero-initialised; no constructor called.',
         'For a user-defined `struct`, `default` returns an instance with every field set to its zero value, without invoking any constructor.',
         2
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `null` value boxed as the struct.', false, 0),
       ('A `NullReferenceException` at runtime.', false, 1),
       ('An instance where each field is set to its zero value.', true, 2),
       ('The instance produced by the parameterless constructor only.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 8] (Nullable<T>) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For value types, what is `int?` shorthand for?',
         '`int?` is syntactic sugar for `Nullable<int>`, a struct that wraps a value type with an extra `HasValue` flag. Nullable value types are distinct from nullable reference types.',
         '`int?` = `Nullable<int>` value-type wrapper.',
         'For value types, the `T?` shorthand expands to `Nullable<T>`, a struct that tracks both a value and a `HasValue` flag.',
         3
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Nullable<int>`', true, 0),
       ('`object`', false, 1),
       ('`int*`', false, 2),
       ('`Optional<int>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 9] (reference equality) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which method compares two references for *referential* (identity) equality regardless of overridden `==`?',
         '`object.ReferenceEquals(a, b)` always compares references and is unaffected by user-defined `==` operators or `Equals` overrides.',
         '`object.ReferenceEquals` = identity comparison.',
         'To compare two references for identity regardless of operator overloads, use `object.ReferenceEquals`.',
         4
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`a == b`', false, 0),
       ('`a.Equals(b)`', false, 1),
       ('`object.ReferenceEquals(a, b)`', true, 2),
       ('`EqualityComparer<object>.Default.Equals(a, b)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 10] (auto-property) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the compiler generate for `public string Name { get; set; }`?',
         'Auto-properties are backed by a compiler-generated private field. The compiler emits the field plus trivial `get`/`set` accessors that read/write that field.',
         'Auto-property = compiler-generated backing field + accessors.',
         'An auto-property like `public string Name { get; set; }` causes the compiler to emit a hidden backing field plus default accessors.',
         5
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Nothing — the property has no storage.', false, 0),
       ('Two static fields keyed by instance.', false, 1),
       ('A hidden backing field with trivial accessors.', true, 2),
       ('A `ThreadLocal<string>` per instance.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 12] (expression-bodied member) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `public int Square(int x) => x * x;` demonstrate?',
         'The `=>` form is an *expression-bodied member*. It is shorthand for a method (or property/indexer) whose body is a single expression.',
         'Expression-bodied member = `=>` single-expression body.',
         'The `=>` syntax declares an expression-bodied member, a concise form for methods or properties whose body is a single expression.',
         6
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A lambda assigned to a field.', false, 0),
       ('A local function declaration.', false, 1),
       ('An expression-bodied method.', true, 2),
       ('An implicit operator overload.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 13] (indexer) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which signature declares an *indexer* on a class?',
         'Indexers are defined with the `this` keyword followed by parameter list(s) in square brackets, e.g. `public T this[int index] { get; set; }`. They allow instances to be accessed with `obj[i]` syntax.',
         'Indexer = `public T this[…] { get; set; }`.',
         'An indexer is declared with the `this` keyword and bracketed parameters, e.g. `public T this[int index]`.',
         7
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`public T Item[int i] { get; set; }`', false, 0),
       ('`public T operator[](int i)`', false, 1),
       ('`public T this[int i] { get; set; }`', true, 2),
       ('`public T Index(int i) => …`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 14] (readonly field vs const) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does a `readonly` field differ from a `const` field?',
         '`const` is a compile-time constant baked into call sites and limited to literal types. `readonly` is runtime-assigned in the constructor (or at declaration) and can hold any expression.',
         '`const` = compile-time literal; `readonly` = set in ctor.',
         'A `const` field is a compile-time literal substituted at use sites, while a `readonly` field is assigned once at runtime (typically in the constructor).',
         8
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`readonly` is compile-time; `const` is set in the constructor.', false, 0),
       ('`readonly` can be assigned in the constructor; `const` must be a compile-time literal.', true, 1),
       ('Both are identical; the keywords are aliases.', false, 2),
       ('`const` fields can be assigned in the constructor; `readonly` cannot.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 15] (auto-property default init) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `public List<int> Items { get; } = new();` declare?',
         'This is a get-only auto-property initialised at declaration with a target-typed `new()`. The backing field is set during construction and cannot be replaced thereafter, though the list itself remains mutable.',
         'Get-only auto-property with default `new()` initialiser.',
         'The declaration creates a get-only auto-property initialised once with a new `List<int>`; the reference cannot be reassigned later.',
         9
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A static property shared across instances.', false, 0),
       ('A property whose value is recomputed on each read.', false, 1),
       ('A get-only auto-property pre-initialised with a new list.', true, 2),
       ('A property that returns a frozen, read-only list view.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 16] (auto-property field keyword - C# 13 contextual; use compiler-gen behaviour) ----
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why might you replace an auto-property with a property backed by an explicit field?',
         'Auto-properties cannot run custom logic in their accessors. Switching to a property with an explicit backing field lets you add validation, lazy computation, or change-notification logic in the `get`/`set`.',
         'Explicit field = needed when an accessor must run custom logic.',
         'You move from an auto-property to an explicit-field property when accessors need custom logic such as validation, laziness, or notification.',
         10
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To reduce allocations by reusing the property name as the field.', false, 0),
       ('To allow accessors to run validation or notification logic.', true, 1),
       ('To make the property thread-safe automatically.', false, 2),
       ('To enable inheritance of the property.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 17] (static property) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is a `static` property accessed?',
         'Static members belong to the type, not an instance. They are accessed via the type name, e.g. `Math.PI`, not via an instance reference.',
         'Static property = `TypeName.Property`.',
         'A static property is accessed through the declaring type name rather than an instance.',
         11
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Through `this.PropertyName`.', false, 0),
       ('Through an instance via `instance.PropertyName`.', false, 1),
       ('Through the type via `TypeName.PropertyName`.', true, 2),
       ('Only through reflection.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 19] (computed expression-bodied property) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `public string FullName => $"{First} {Last}";`?',
         'This is an expression-bodied, get-only computed property. Each read re-evaluates the expression — no backing field is generated.',
         'Get-only computed property; no backing field.',
         'It is an expression-bodied read-only computed property that re-evaluates its expression on every access.',
         12
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A field initialiser.', false, 0),
       ('An expression-bodied get-only computed property.', true, 1),
       ('A primary-constructor parameter.', false, 2),
       ('An indexer with a single string key.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 20] (generic type parameter) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `class Box<T>`, what is `T`?',
         '`T` is a generic type parameter — a placeholder that is bound to a concrete type when the generic class is instantiated, e.g. `Box<int>`.',
         '`T` = generic type parameter.',
         'In `Box<T>`, `T` is a generic type parameter that gets substituted with a concrete type at the point of use.',
         13
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A required runtime cast.', false, 0),
       ('A reflection token.', false, 1),
       ('A generic type parameter.', true, 2),
       ('A property of the class.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 21] (where T : class) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the constraint `where T : class` enforce?',
         '`where T : class` restricts `T` to reference types. With nullable annotations enabled, `where T : class` also means non-nullable reference types unless written as `where T : class?`.',
         '`where T : class` = T must be a reference type.',
         'The `where T : class` constraint restricts the type parameter to reference types only.',
         14
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`T` must be a reference type.', true, 0),
       ('`T` must be a value type.', false, 1),
       ('`T` must implement `IClass`.', false, 2),
       ('`T` must be sealed.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 22] (where T : new()) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `where T : new()` require?',
         'The `new()` constraint requires `T` to have a public, parameterless constructor so the code can instantiate it via `new T()`.',
         '`where T : new()` = public parameterless constructor.',
         'A `where T : new()` constraint guarantees that `T` exposes a public parameterless constructor, allowing `new T()`.',
         15
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`T` must be `new`-modifier compatible.', false, 0),
       ('`T` must be a struct.', false, 1),
       ('`T` must have a public parameterless constructor.', true, 2),
       ('`T` must be sealed.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 25] (where T : struct) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `where T : struct`, which type argument is valid?',
         '`where T : struct` requires `T` to be a non-nullable value type. `int` satisfies this. `string` is a reference type, `int?` is `Nullable<int>` which is itself a struct but excluded by the constraint, and `object` is a reference type.',
         '`where T : struct` = non-nullable value type only.',
         'The `where T : struct` constraint admits only non-nullable value types such as `int` and excludes reference types and `Nullable<T>`.',
         16
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`string`', false, 0),
       ('`int`', true, 1),
       ('`object`', false, 2),
       ('`int?`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 30] (Func vs Action) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `Func<T, TResult>` and `Action<T>`?',
         '`Func<…, TResult>` represents a delegate that returns `TResult`. `Action<…>` represents a delegate that returns `void`. Both are generic delegate types in the BCL.',
         '`Func` returns a value; `Action` returns `void`.',
         '`Func<…, TResult>` denotes a delegate that returns `TResult`, while `Action<…>` denotes a delegate returning `void`.',
         17
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Func` is synchronous; `Action` is asynchronous.', false, 0),
       ('`Func` returns a value; `Action` returns `void`.', true, 1),
       ('`Func` is for events; `Action` is for callbacks.', false, 2),
       ('`Func` is contravariant; `Action` is covariant.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 37] (Action with 0 params) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is a parameterless `Action` delegate declared?',
         '`Action` (no generic arguments) is a delegate type that takes no parameters and returns `void`. Generic overloads `Action<T>`, `Action<T1,T2>`, etc. add parameters.',
         'Parameterless: `Action` (no generic args).',
         'The non-generic `Action` delegate represents a method that takes no parameters and returns `void`.',
         18
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Action<void>`', false, 0),
       ('`Action`', true, 1),
       ('`Func<void>`', false, 2),
       ('`Delegate<>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 50] (async/await basic) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `await` do to a `Task`?',
         '`await` suspends the current async method until the task completes, then resumes — usually on the captured synchronization context. The compiler rewrites the method into a state machine.',
         '`await` = suspend until task completes, then resume.',
         '`await` asynchronously suspends the caller until the awaited task completes, then resumes execution (typically on the captured context).',
         19
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Spawns a new thread for the task body.', false, 0),
       ('Suspends the async method until the task completes.', true, 1),
       ('Blocks the calling thread until completion.', false, 2),
       ('Cancels the task and returns `default`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 51] (Task vs Task<T>) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the relationship between `Task` and `Task<T>`?',
         '`Task<T>` derives from `Task`. `Task` represents an asynchronous operation with no result; `Task<T>` adds a `Result` of type `T`.',
         '`Task<T>` : `Task` with a `Result`.',
         '`Task<T>` extends `Task` by adding a typed `Result`, while `Task` represents an asynchronous operation without a return value.',
         20
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Task<T>` derives from `Task` and adds a typed `Result`.', true, 0),
       ('`Task` derives from `Task<T>`.', false, 1),
       ('They are unrelated types.', false, 2),
       ('`Task<T>` is a `struct` wrapping a `Task`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 60] (List<T> backing storage) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is `List<T>` implemented internally?',
         '`List<T>` is backed by a contiguous array that grows (typically doubling) when capacity is exceeded. Indexing is O(1); inserts in the middle are O(n) due to shifting.',
         '`List<T>` = dynamic array; O(1) indexing.',
         '`List<T>` stores items in a contiguous, dynamically-resizing array, giving O(1) indexing and amortised O(1) appends.',
         21
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('As a doubly-linked list.', false, 0),
       ('As a hash table keyed by index.', false, 1),
       ('As a contiguous, resizable array.', true, 2),
       ('As a balanced binary tree.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 61] (Dictionary lookup) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the average-case complexity of `Dictionary<TKey, TValue>` lookup?',
         '`Dictionary<TK,TV>` is a hash table. Average-case insertion and lookup are O(1) assuming a well-distributed hash function; worst case (lots of collisions) is O(n).',
         '`Dictionary` lookup is O(1) average.',
         '`Dictionary<TKey,TValue>` uses hashing, giving average O(1) lookups (worst case O(n) on poor hash distribution).',
         22
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('O(n)', false, 0),
       ('O(log n)', false, 1),
       ('O(1) average, O(n) worst case', true, 2),
       ('O(n log n)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 62] (IEnumerable vs ICollection) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `ICollection<T>` add over `IEnumerable<T>`?',
         '`ICollection<T>` extends `IEnumerable<T>` with `Count`, mutation methods (`Add`, `Remove`, `Clear`), and `Contains`/`CopyTo`. `IEnumerable<T>` is iteration-only.',
         '`ICollection<T>`: adds `Count`, `Add`, `Remove`, `Contains`.',
         '`ICollection<T>` augments `IEnumerable<T>` with size, membership, and mutation operations.',
         23
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Indexer access by integer position.', false, 0),
       ('A `Count` property and add/remove/contains operations.', true, 1),
       ('Deferred-execution semantics.', false, 2),
       ('Thread-safety guarantees on enumeration.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 64] (List<T>.AddRange) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which method appends every element of one `List<T>` to another in one call?',
         '`AddRange(IEnumerable<T>)` adds all elements from a source sequence to the end of the list, growing capacity as needed.',
         '`AddRange(IEnumerable<T>)` appends a sequence.',
         '`List<T>.AddRange` appends every element of an `IEnumerable<T>` to the list in a single call.',
         24
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Concat`', false, 0),
       ('`AddRange`', true, 1),
       ('`Merge`', false, 2),
       ('`AppendAll`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 65] (HashSet uniqueness) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What guarantee does `HashSet<T>` provide?',
         '`HashSet<T>` stores unique elements (per `EqualityComparer<T>.Default` or a custom comparer). It offers O(1) average `Add`/`Remove`/`Contains` but no defined ordering.',
         '`HashSet<T>` = unique elements; O(1) ops.',
         '`HashSet<T>` enforces uniqueness with O(1) average membership and mutation, but does not guarantee any iteration order.',
         25
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Stable insertion order.', false, 0),
       ('Sorted iteration order.', false, 1),
       ('Uniqueness of elements with O(1) average membership.', true, 2),
       ('Thread-safe reads and writes by default.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 66] (Dictionary key requirements) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What must `TKey` typically supply for `Dictionary<TKey, TValue>` to work correctly?',
         'The dictionary uses `EqualityComparer<TKey>.Default`, which calls `GetHashCode` and `Equals`. Both should be implemented consistently — equal keys must produce equal hash codes.',
         'Need consistent `Equals` + `GetHashCode`.',
         '`Dictionary<TKey,TValue>` requires keys with consistent `Equals` and `GetHashCode` so that equal keys hash identically.',
         26
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`IComparable<TKey>` and ordering.', false, 0),
       ('A consistent pair of `Equals` and `GetHashCode`.', true, 1),
       ('A parameterless constructor.', false, 2),
       ('Serialisation attributes for persistence.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 69] (using declaration) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `using var stream = File.OpenRead(path);` do?',
         'A `using` *declaration* (no block) declares a disposable variable whose lifetime ends with the enclosing scope. The compiler injects a `Dispose` call at scope exit, wrapped in a try/finally.',
         '`using` declaration = `Dispose` at scope end.',
         'A `using` declaration ensures the resource is disposed when the enclosing scope ends, via a compiler-generated try/finally.',
         27
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares a `static` reference to the stream.', false, 0),
       ('Imports namespace members at the local scope.', false, 1),
       ('Declares a disposable whose `Dispose` runs at scope end.', true, 2),
       ('Pins the object for unmanaged interop.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 73] (finally) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does a `finally` block run?',
         'The `finally` block runs whether the `try` completed normally, threw, or returned. It will not run for some asynchronous abort scenarios (e.g. fail-fast or stack overflow).',
         '`finally` runs on every normal exit path of `try`.',
         'A `finally` block runs on every normal exit from the associated `try`, regardless of success, exception, or early return.',
         28
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only if an exception is thrown.', false, 0),
       ('Only if no exception is thrown.', false, 1),
       ('Whether or not an exception was thrown.', true, 2),
       ('Only if `return` is used inside `try`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 89] (string immutability) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `string` in .NET considered *immutable*?',
         '`string` instances cannot be modified after creation; methods like `Substring`/`Replace` always return new `string` objects. This is a language/runtime guarantee, not enforced by a `readonly` modifier.',
         '`string` is immutable: all "modifying" methods return new strings.',
         '.NET strings are immutable, so operations that appear to modify a string actually return a new string instance.',
         29
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Because the runtime never garbage-collects strings.', false, 0),
       ('Because every modifying operation returns a new string.', true, 1),
       ('Because they are stored as `ReadOnlyMemory<char>`.', false, 2),
       ('Because strings are always allocated on the stack.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 90] (string interpolation) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `$"Hello {name}, age {age:N0}"` produce?',
         'An interpolated string. The compiler converts each `{expr[:format]}` placeholder into a formatted substitution, ultimately calling formatting handlers. The `:N0` is a standard numeric format specifier.',
         'Interpolated string with `:N0` numeric format.',
         'An interpolated string substitutes each `{expr[:format]}` into the result, applying the optional format specifier to each value.',
         30
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A composite format string substituted at runtime with formatting per placeholder.', true, 0),
       ('A culture-independent ASCII representation.', false, 1),
       ('A compiled regex pattern.', false, 2),
       ('A reference to a localized resource.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 92] (StringBuilder) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why use `StringBuilder` instead of repeated `string` concatenation in a loop?',
         'Each `+` on `string`s allocates a new string. `StringBuilder` uses a mutable internal buffer that grows as needed, dramatically reducing allocations and improving performance for long-running concatenation.',
         '`StringBuilder` = mutable buffer; fewer allocations.',
         '`StringBuilder` uses a single mutable buffer to avoid the per-step allocations caused by immutable `string` concatenation.',
         31
  from modules where slug = 'csharp-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It avoids allocating a new string for each concatenation.', true, 0),
       ('It is the only way to interpolate values.', false, 1),
       ('It returns its result as a `Span<char>` instead of a string.', false, 2),
       ('It is automatically thread-safe.', false, 3)
     ) as c(label, is_correct, order_index);

-- ============================================================
-- csharp-2
-- ============================================================

-- Question 0 [orig 2] (nullable reference types) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'With nullable reference types enabled, what does `string?` indicate?',
         'When NRT is enabled, an unannotated `string` is treated as non-nullable, while `string?` explicitly opts in to allowing `null` and triggers flow analysis warnings if dereferenced without a null check.',
         '`string?` = reference type that may be `null`.',
         'Under nullable reference types, `string?` declares a reference that may be `null` and is subject to compiler null-flow analysis.',
         0
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A reference that may be `null`, subject to flow analysis.', true, 0),
       ('A value type wrapper similar to `Nullable<string>`.', false, 1),
       ('A reference that throws at runtime if assigned `null`.', false, 2),
       ('A compile-time alias for `string.Empty`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 4] (NRT null-forgiving operator) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `!` (null-forgiving) operator do, e.g. `value!`?',
         'The `!` operator is a compile-time assertion to the nullable analysis that the expression is not null. It has no runtime effect and does not insert any null check.',
         '`!` = "trust me, not null" (compile-time only).',
         'The `!` null-forgiving operator silences nullable warnings by asserting non-null at compile time, but it has no runtime effect.',
         1
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Throws if the value is `null` at runtime.', false, 0),
       ('Boxes a value type so it can hold `null`.', false, 1),
       ('Logically inverts a boolean expression only.', false, 2),
       ('Suppresses nullable warnings without any runtime check.', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 5] (readonly struct) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What guarantee does a `readonly struct` provide?',
         'A `readonly struct` declares that all of its instance fields are immutable. The compiler can avoid defensive copies when calling its members on `in`/`readonly` references.',
         '`readonly struct` = all fields immutable; no defensive copies.',
         'Marking a struct as `readonly` declares that all instance fields are immutable, which allows the compiler to elide defensive copies on member access.',
         2
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All instance fields are immutable after construction.', true, 0),
       ('It can only contain static members.', false, 1),
       ('Instances are allocated on the managed heap.', false, 2),
       ('It cannot implement any interfaces.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 6] (boxing) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when a value type is *boxed*?',
         'Boxing wraps a value type in a heap-allocated object so it can be treated as `object` or an interface reference. Unboxing extracts the value back, with a type check and a copy.',
         'Boxing = heap-allocate a copy of a value type as `object`.',
         'Boxing copies a value type into a newly heap-allocated object so that it can be used through `object` or interface references.',
         3
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is moved from the stack to a thread-local cache without allocation.', false, 0),
       ('It is wrapped in a heap-allocated object reference.', true, 1),
       ('Its bit pattern is reinterpreted as `IntPtr`.', false, 2),
       ('It becomes immutable via the runtime.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 11] (init accessor) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does an `init` accessor on a property allow?',
         'An `init`-only setter can be invoked during object initialisation (constructor, object initialiser, `with` expression) but not afterwards, enabling immutable objects with object-initializer syntax.',
         '`init` = settable only during construction/initialiser.',
         'An `init` accessor lets a property be assigned in a constructor or object initialiser but blocks further mutation, supporting immutable types.',
         4
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Assignment only during object initialisation.', true, 0),
       ('Assignment only from derived classes.', false, 1),
       ('Lazy evaluation on first read.', false, 2),
       ('Thread-safe assignment via a lock.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 18] (required modifier) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `required` modifier on a property mean?',
         'A `required` member must be set during object initialisation (e.g. in an object initialiser or via a constructor that satisfies `[SetsRequiredMembers]`). The compiler reports an error if it is not.',
         '`required` = must be set when the object is initialised.',
         'The `required` modifier forces callers to set the member at initialisation time, otherwise the compiler reports an error.',
         5
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Callers must set it during initialisation or get a compile error.', true, 0),
       ('It runs lazily on first read.', false, 1),
       ('It must be assigned only from derived types.', false, 2),
       ('It cannot be `null` at runtime; the runtime checks it.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 23] (covariance) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is *covariance* in C# generics?',
         'Covariance (`out T`) lets `IEnumerable<Derived>` be assigned to `IEnumerable<Base>`. The type parameter only appears in output positions.',
         'Covariance = `out T`; assign more-derived to less-derived.',
         'Covariance (`out T`) preserves assignability with more-derived type arguments, allowing e.g. `IEnumerable<Derived>` to flow into `IEnumerable<Base>`.',
         6
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`in T`, allowing assignment of a less-derived to a more-derived type.', false, 0),
       ('`out T`, allowing assignment of a more-derived to a less-derived type.', true, 1),
       ('Allowing arbitrary casts between unrelated generics.', false, 2),
       ('Requiring both type parameters to be identical.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 24] (contravariance) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which built-in interface is *contravariant* in `T`?',
         '`IComparer<in T>` is contravariant: a comparer of base types can stand in where a comparer of derived types is expected, because `T` appears only in input position.',
         'Contravariant: `IComparer<in T>`.',
         '`IComparer<in T>` is contravariant in `T`, so an `IComparer<Base>` can be used where an `IComparer<Derived>` is required.',
         7
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`IList<T>`', false, 0),
       ('`IEnumerable<T>`', false, 1),
       ('`IComparer<T>`', true, 2),
       ('`Dictionary<TKey, TValue>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 26] (generic method type inference) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For `T Identity<T>(T value)`, what allows `Identity(42)` to omit the type argument?',
         'The compiler performs type inference on generic methods by examining the argument types. Since `42` is `int`, the compiler infers `T = int` without an explicit type argument.',
         'Generic methods support compiler type inference from arguments.',
         'Generic-method type inference lets the compiler deduce `T` from the call''s argument types, e.g. `T = int` when called with `42`.',
         8
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reflection at runtime.', false, 0),
       ('Generic type inference from arguments.', true, 1),
       ('Implicit operator overloading.', false, 2),
       ('Boxing of the argument to `object`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 27] (multiple constraints) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `where T : class, IComparable<T>, new()`, which constraint must come *first*?',
         'C# requires that the `class`/`struct`/`notnull`/`unmanaged` constraint (the "primary" constraint) appear first, followed by interface constraints, with `new()` last.',
         'Primary (class/struct) first; interfaces middle; `new()` last.',
         'Generic constraints must be listed primary-first (`class`/`struct`/`unmanaged`/`notnull`), then interfaces, then `new()` last.',
         9
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`new()`', false, 0),
       ('`IComparable<T>`', false, 1),
       ('`class`', true, 2),
       ('Constraints may appear in any order.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 29] (variance on classes) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can a generic *class* (e.g. `class Box<T>`) be declared covariant with `out T`?',
         'Variance modifiers (`in`/`out`) are only allowed on generic *interfaces* and *delegates*, not on classes or structs. Classes always behave invariantly.',
         'Variance: only on interfaces and delegates.',
         '`in` and `out` variance modifiers are only allowed on generic interfaces and delegates; classes are always invariant.',
         10
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, with no restrictions.', false, 0),
       ('Yes, but only on sealed classes.', false, 1),
       ('No — variance is only allowed on interfaces and delegates.', true, 2),
       ('No — variance requires the `where T : class` constraint.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 31] (event keyword) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `event` keyword on a delegate field add?',
         'The `event` keyword restricts external code to only `+=` and `-=` on the delegate. External code cannot directly assign, invoke, or null out the field. Only the declaring type may raise the event.',
         '`event` = limit outside use to `+=` and `-=`.',
         'The `event` keyword restricts callers to subscribing and unsubscribing (`+=`/`-=`), while only the declaring type can invoke or reset the delegate.',
         11
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Thread-safe invocation of the delegate.', false, 0),
       ('Automatic logging of subscribers.', false, 1),
       ('Restricts external code to `+=` and `-=` only.', true, 2),
       ('Forces the delegate to be `static`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 32] (lambda capture) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a lambda *capture* when it references a local variable?',
         'A lambda captures the variable itself (its storage location), not a snapshot of its value. The compiler hoists the captured local into a generated closure class.',
         'Lambdas capture variables by reference (via a closure class).',
         'A lambda captures the storage location of a local variable, not a snapshot, by hoisting it into a compiler-generated closure object.',
         12
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A snapshot copy of the value at lambda creation.', false, 0),
       ('Nothing — locals are not accessible inside lambdas.', false, 1),
       ('The variable''s storage location via a closure.', true, 2),
       ('A weak reference that may be collected.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 33] (multicast delegate) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When you `+=` two handlers to the same delegate and invoke it, what happens?',
         'Delegates in .NET are multicast: invoking a delegate that has multiple subscribers calls each handler in the order they were added. For `Func`-style delegates, only the last handler''s return value is observed.',
         'Delegates are multicast; handlers run in subscription order.',
         'Invoking a multicast delegate calls each subscribed handler in subscription order, returning only the last result for value-returning delegates.',
         13
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only the last handler runs.', false, 0),
       ('Both handlers run in subscription order.', true, 1),
       ('An exception is thrown for duplicate subscription.', false, 2),
       ('Only the first handler runs; the rest are queued.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 34] (expression vs statement lambda) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is a *statement lambda*?',
         'A statement lambda has a body enclosed in braces and may contain multiple statements, including explicit `return`s. An expression lambda has a single expression body without braces.',
         'Statement lambda = braces + multiple statements.',
         'A statement lambda uses `{ … }` and may contain multiple statements, distinguishing it from a single-expression lambda.',
         14
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`x => x + 1`', false, 0),
       ('`(x, y) => x * y`', false, 1),
       ('`x => { var y = x + 1; return y; }`', true, 2),
       ('`() => 42`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 35] (EventHandler signature) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the conventional .NET signature for an event handler delegate?',
         '.NET convention is `void Handler(object? sender, TEventArgs e)`, where `TEventArgs` derives from `EventArgs`. The `EventHandler<T>` delegate captures this pattern.',
         '`void(object? sender, TEventArgs e)`.',
         'The canonical .NET event-handler signature is `void Handler(object? sender, TEventArgs e)`, captured by `EventHandler<T>`.',
         15
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`void(object? sender, EventArgs e)`', true, 0),
       ('`Task<bool>(EventArgs e)`', false, 1),
       ('`void(Sender s)`', false, 2),
       ('`EventResult(object e)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 36] (closure over loop variable) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In modern C#, what does each lambda in `for (int i = 0; i < 3; i++) actions.Add(() => i)` capture?',
         'The `for` loop variable `i` has a single shared storage across iterations. All lambdas close over that same `i`, so after the loop they all return its final value (3).',
         '`for` loop var: one storage shared across iterations.',
         'For a `for`-loop variable, every lambda closes over the same storage location, so all subsequent invocations observe the same (final) value.',
         16
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A separate copy of `i` per iteration.', false, 0),
       ('The single shared `i`, ending at 3.', true, 1),
       ('A null reference because the loop has ended.', false, 2),
       ('A `WeakReference` to `i`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 38] (delegate combine) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Delegate.Combine` do?',
         '`Delegate.Combine` returns a new multicast delegate whose invocation list is the concatenation of the inputs. This is what `+=` uses under the hood for events and delegates.',
         '`Delegate.Combine` builds a multicast delegate.',
         '`Delegate.Combine` returns a new delegate whose invocation list is the concatenation of its inputs — the runtime mechanism behind `+=`.',
         17
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Inverts the order of an invocation list.', false, 0),
       ('Returns a new delegate whose invocation list concatenates the inputs.', true, 1),
       ('Removes a handler from a multicast delegate.', false, 2),
       ('Throws if any handler is `null`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 40] (deferred execution) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does *deferred execution* mean for a LINQ query like `nums.Where(n => n > 0)`?',
         'Standard LINQ-to-Objects operators return `IEnumerable<T>` whose work is performed only when iterated (e.g. via `foreach` or a terminal operator like `ToList`). Side-effecting predicates run on each enumeration.',
         'Deferred = work only happens when the query is iterated.',
         'Deferred execution means LINQ query operators build a pipeline that does no work until the query is enumerated.',
         18
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The query is evaluated eagerly at construction time.', false, 0),
       ('The query is cached and only evaluated once ever.', false, 1),
       ('The query is evaluated each time it is enumerated.', true, 2),
       ('The query throws unless explicitly executed via `.Run()`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 41] (IEnumerable vs IQueryable) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why prefer `IQueryable<T>` over `IEnumerable<T>` against a database?',
         '`IQueryable<T>` builds an expression tree that the provider (e.g. EF Core) translates into SQL, pushing filtering/ordering server-side. `IEnumerable<T>` materialises results client-side first.',
         '`IQueryable` translates to server-side SQL.',
         '`IQueryable<T>` lets a provider translate the query to server-side code (e.g. SQL), while `IEnumerable<T>` evaluates filters client-side after fetching.',
         19
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`IQueryable<T>` is faster for in-memory data.', false, 0),
       ('`IQueryable<T>` can be translated to SQL by the provider.', true, 1),
       ('`IQueryable<T>` allows mutation of the source.', false, 2),
       ('`IQueryable<T>` always implements `IList<T>`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 42] (Select vs SelectMany) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `Select` and `SelectMany`?',
         '`Select` maps each element to a single result, producing one-to-one. `SelectMany` flattens the result of a projection that itself returns a sequence, producing one-to-many.',
         '`Select` = map; `SelectMany` = map + flatten.',
         '`Select` projects each element to one result, while `SelectMany` projects to a sequence and then flattens the results.',
         20
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Select` flattens nested sequences; `SelectMany` does not.', false, 0),
       ('`Select` projects one-to-one; `SelectMany` projects one-to-many and flattens.', true, 1),
       ('`SelectMany` runs in parallel; `Select` does not.', false, 2),
       ('They behave identically for `IEnumerable<T>`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 43] (First vs FirstOrDefault) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'On an empty sequence, what does `First()` do versus `FirstOrDefault()`?',
         '`First()` throws `InvalidOperationException` when the sequence is empty. `FirstOrDefault()` returns `default(T)` (e.g. `null` for reference types, `0` for `int`).',
         '`First` throws on empty; `FirstOrDefault` returns `default`.',
         '`First()` throws if the sequence is empty, whereas `FirstOrDefault()` returns the default value of the element type.',
         21
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both return `null`.', false, 0),
       ('Both throw `InvalidOperationException`.', false, 1),
       ('`First()` throws; `FirstOrDefault()` returns `default(T)`.', true, 2),
       ('`First()` returns `default(T)`; `FirstOrDefault()` throws.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 44] (query syntax to method) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'The query expression `from x in src where x > 0 select x * 2` is roughly equivalent to which method-syntax form?',
         'The compiler rewrites query syntax into method-call chains. `from … where … select …` becomes `.Where(…).Select(…)`.',
         '`from where select` = `.Where(…).Select(…)`.',
         'C# query syntax desugars to standard LINQ method calls, e.g. `from … where … select …` becomes `.Where(…).Select(…)`.',
         22
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`src.Select(x => x > 0).Where(x => x * 2)`', false, 0),
       ('`src.Where(x => x > 0).Select(x => x * 2)`', true, 1),
       ('`src.Aggregate((a, x) => a + x * 2)`', false, 2),
       ('`src.GroupBy(x => x > 0).SelectMany(g => g)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 45] (ToList materialisation) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `ToList()` often used at the end of a LINQ chain?',
         '`ToList()` forces immediate enumeration into a `List<T>`, materialising the results. This avoids repeated enumeration cost and prevents surprises with deferred evaluation.',
         '`ToList()` = force materialisation now.',
         'Calling `ToList()` materialises a LINQ query into a `List<T>` immediately, avoiding repeated evaluation and deferred-execution surprises.',
         23
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It allows mutation of the source.', false, 0),
       ('It forces immediate enumeration and caches results.', true, 1),
       ('It converts the query to parallel mode.', false, 2),
       ('It enables expression-tree translation.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 46] (Aggregate) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `nums.Aggregate(0, (acc, n) => acc + n)` compute?',
         '`Aggregate(seed, accumulator)` is a left fold. It starts with `seed` and applies the accumulator across the sequence — here, summing the numbers.',
         '`Aggregate` = left fold with seed and accumulator.',
         '`Aggregate(seed, fn)` performs a left fold over the sequence, here producing the sum of the numbers.',
         24
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The product of all numbers.', false, 0),
       ('A running list of partial sums.', false, 1),
       ('The sum of all numbers in the sequence.', true, 2),
       ('The first non-zero number.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 47] (GroupBy) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `items.GroupBy(i => i.Category)` return?',
         '`GroupBy` returns an `IEnumerable<IGrouping<TKey, TElement>>`. Each `IGrouping` exposes the key and the elements sharing it.',
         '`GroupBy` returns `IEnumerable<IGrouping<TKey,TElement>>`.',
         '`GroupBy` produces an `IEnumerable<IGrouping<TKey,TElement>>`, one grouping per key.',
         25
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Dictionary<TKey, List<T>>`', false, 0),
       ('`IEnumerable<IGrouping<TKey, T>>`', true, 1),
       ('`HashSet<T>` of unique keys', false, 2),
       ('`ILookup<T, TKey>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 49] (LINQ chaining return type) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the static return type of `list.Where(p).OrderBy(k => k.Name)` where `list` is `List<Person>`?',
         '`Where` returns `IEnumerable<Person>`. `OrderBy` returns `IOrderedEnumerable<Person>`, a subtype of `IEnumerable<Person>` that supports `ThenBy`.',
         '`OrderBy` returns `IOrderedEnumerable<T>`.',
         'A `Where`-then-`OrderBy` chain has static return type `IOrderedEnumerable<T>`, a refinement of `IEnumerable<T>`.',
         26
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`List<Person>`', false, 0),
       ('`IOrderedEnumerable<Person>`', true, 1),
       ('`IQueryable<Person>`', false, 2),
       ('`ICollection<Person>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 53] (async void) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `async void` discouraged except for event handlers?',
         '`async void` methods cannot be awaited and unhandled exceptions propagate directly to the synchronization context, which can crash the process. Use `async Task` so callers can observe completion and errors.',
         'Avoid `async void`: unobservable completion + exceptions.',
         '`async void` is discouraged because the caller can''t await it and unhandled exceptions escape to the synchronization context, often crashing the app.',
         27
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It runs on a thread-pool thread you can''t control.', false, 0),
       ('Exceptions propagate to the synchronization context and can crash the process.', true, 1),
       ('It always deadlocks on UI threads.', false, 2),
       ('It cannot use `await`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 54] (CancellationToken) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does a cooperative cancellation flow with a `CancellationToken`?',
         'The producer of work observes the token (via `ThrowIfCancellationRequested`, `IsCancellationRequested`, or registering callbacks). The caller signals cancellation via the associated `CancellationTokenSource`. The token itself doesn''t cancel work; the worker checks and responds.',
         'Worker observes the token; `Source.Cancel()` requests cancellation.',
         'Cancellation is cooperative: the caller uses `CancellationTokenSource.Cancel()`, and the worker must periodically observe the token and stop voluntarily.',
         28
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The runtime aborts the thread when cancellation is requested.', false, 0),
       ('The token itself is immutable; the source requests cancellation, and workers must observe it.', true, 1),
       ('`CancellationToken.Cancel()` ends the task immediately.', false, 2),
       ('Cancellation works only if the work runs on the thread pool.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 55] (Task.WhenAll vs WhenAny) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do `Task.WhenAll` and `Task.WhenAny` differ?',
         '`WhenAll` returns a task that completes when *every* input task has completed (collecting all exceptions). `WhenAny` returns a task that completes when the *first* input task completes.',
         '`WhenAll` = all complete; `WhenAny` = first to complete.',
         '`Task.WhenAll` completes when every input task finishes, while `Task.WhenAny` completes as soon as any one of them does.',
         29
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`WhenAll` cancels remaining tasks; `WhenAny` waits for the last.', false, 0),
       ('`WhenAll` completes when every task finishes; `WhenAny` when the first does.', true, 1),
       ('They are identical except for return type.', false, 2),
       ('`WhenAll` runs sequentially; `WhenAny` runs in parallel.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 57] (Task.Result vs await) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `task.Result` discouraged in favour of `await task`?',
         '`task.Result` blocks the current thread synchronously and can deadlock on UI/ASP.NET sync contexts. It also wraps exceptions in `AggregateException`. `await` is non-blocking and unwraps the first exception.',
         '`.Result` blocks and can deadlock; `await` is non-blocking.',
         '`task.Result` synchronously blocks the calling thread (risking deadlock) and wraps exceptions in `AggregateException`, while `await` is non-blocking and unwraps.',
         30
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It blocks the calling thread and may deadlock.', true, 0),
       ('It always returns `null`.', false, 1),
       ('It cancels the task.', false, 2),
       ('It only works inside `async` methods.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 59] (await unwraps Task<T>) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type of the expression `await SomeAsync()` if `SomeAsync` returns `Task<int>`?',
         '`await` on a `Task<T>` produces a value of type `T`. So `await someTask` where `someTask` is `Task<int>` yields an `int`.',
         '`await Task<T>` produces a `T`.',
         '`await` on a `Task<T>` evaluates to the wrapped `T` value once the task completes.',
         31
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`Task<int>`', false, 0),
       ('`TaskAwaiter<int>`', false, 1),
       ('`int`', true, 2),
       ('`void`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 67] (IReadOnlyList) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why expose `IReadOnlyList<T>` from a public API instead of `List<T>`?',
         'Exposing `IReadOnlyList<T>` prevents callers from mutating the underlying storage and signals API intent. It also gives the implementer flexibility to change the concrete type later.',
         '`IReadOnlyList<T>` = expose without granting mutation.',
         'Returning `IReadOnlyList<T>` hides the concrete list type, prevents external mutation, and preserves implementation flexibility.',
         32
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To enable parallel enumeration.', false, 0),
       ('To prevent mutation by callers and decouple the concrete type.', true, 1),
       ('Because `List<T>` cannot be serialised.', false, 2),
       ('Because `List<T>` is `internal` to the BCL.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 68] (LinkedList) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is `LinkedList<T>` typically preferred over `List<T>`?',
         '`LinkedList<T>` offers O(1) insertion/removal at known nodes (front, back, or after a held `LinkedListNode<T>`). `List<T>` requires shifting elements for insert/remove away from the end.',
         '`LinkedList<T>` = O(1) splice at known nodes.',
         'Choose `LinkedList<T>` when you need O(1) inserts/removes at known node positions; otherwise `List<T>` is usually faster.',
         33
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When O(1) random-index access is required.', false, 0),
       ('When iteration order should match insertion order.', false, 1),
       ('When O(1) inserts/removes at known nodes are required.', true, 2),
       ('When the data set is fixed-size and small.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 70] (catch when filter) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `catch (HttpRequestException ex) when (ex.StatusCode == 404)` express?',
         'The `when` clause is an exception filter. The `catch` is entered only if the filter expression is `true`; otherwise the exception continues unwinding. Filters run without unwinding the stack.',
         'Exception filter: catch only if `when` is true.',
         'An exception filter (`catch … when (expr)`) only enters the handler when the filter evaluates to true, leaving the stack intact otherwise.',
         34
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The catch block runs only when the filter expression is true.', true, 0),
       ('The exception is silently swallowed if the filter is true.', false, 1),
       ('The filter is evaluated only on retry.', false, 2),
       ('The compiler ignores the filter at runtime.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 71] (throw vs throw ex) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a catch block, why prefer `throw;` over `throw ex;` when rethrowing?',
         'A bare `throw;` preserves the original stack trace. `throw ex;` resets the stack trace to the current line, hiding the true origin of the exception.',
         '`throw;` = preserve stack trace.',
         'Use a bare `throw;` to rethrow while preserving the original stack trace; `throw ex;` resets the trace and loses context.',
         35
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`throw ex;` clears any custom exception data.', false, 0),
       ('`throw;` preserves the original stack trace.', true, 1),
       ('`throw ex;` is slower at runtime.', false, 2),
       ('They behave identically; only style differs.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 72] (IDisposable vs IAsyncDisposable) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When should a type implement `IAsyncDisposable` instead of (or in addition to) `IDisposable`?',
         '`IAsyncDisposable.DisposeAsync` is for resources whose cleanup involves asynchronous I/O (e.g. flushing a network stream). Many types implement both, letting `await using` perform async cleanup.',
         '`IAsyncDisposable` = needs async cleanup (I/O flush).',
         'Implement `IAsyncDisposable` when cleanup itself is asynchronous (e.g. flushing buffers), and pair with `IDisposable` if synchronous disposal also makes sense.',
         36
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Whenever the type is generic.', false, 0),
       ('When cleanup requires asynchronous operations like I/O flushing.', true, 1),
       ('Only for types used from UI threads.', false, 2),
       ('To prevent the GC from finalising the object.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 74] (await using) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `await using var conn = OpenConnection();` require?',
         '`await using` requires that the resource implements `IAsyncDisposable` (or a `DisposeAsync` ambient pattern). The compiler emits `await conn.DisposeAsync()` at scope end.',
         '`await using` needs `IAsyncDisposable`.',
         '`await using` requires the resource to expose `DisposeAsync` (typically via `IAsyncDisposable`), which the compiler awaits at scope exit.',
         37
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The resource implements `IDisposable` only.', false, 0),
       ('The resource implements `IAsyncDisposable`.', true, 1),
       ('The resource is a `Task`.', false, 2),
       ('The method is marked `async void`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 75] (custom exception type) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which base class should a custom application exception typically derive from?',
         'In modern .NET guidance, custom exceptions should derive directly from `System.Exception`. `ApplicationException` is deprecated and provides no useful behaviour. Exceptions should also be sealed if you don''t plan to subtype.',
         'Derive from `System.Exception` directly.',
         'Modern guidance is to derive custom exceptions from `System.Exception`, not from the deprecated `ApplicationException`.',
         38
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`System.SystemException`', false, 0),
       ('`System.ApplicationException`', false, 1),
       ('`System.Exception`', true, 2),
       ('`System.Object`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 76] (Dispose pattern reentrancy) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why should `Dispose` be safe to call multiple times?',
         '`Dispose` may be invoked manually and again by a `using` block or finaliser. Implementations typically check a `_disposed` flag and short-circuit on subsequent calls.',
         '`Dispose` must be idempotent.',
         'A correct `Dispose` implementation is idempotent — safe to call multiple times — typically guarded by a `_disposed` flag.',
         39
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To allow object pooling without resets.', false, 0),
       ('Because the GC calls it multiple times by design.', false, 1),
       ('Because it may be invoked both manually and via `using`/finaliser.', true, 2),
       ('Because the runtime calls it once per thread.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 [orig 77] (record positional declaration) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `public record Point(int X, int Y);` generate?',
         'A positional `record` synthesises an `init`-only property per parameter, a primary constructor, value-based `Equals`/`GetHashCode`, a `ToString`, and a `Deconstruct` method, plus a `with`-expression copy constructor.',
         '`record` = value equality + `init` props + `with` + `Deconstruct`.',
         'A positional `record` generates `init` properties, value-based equality, `ToString`, `Deconstruct`, and `with`-expression support.',
         40
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only a class with two mutable fields.', false, 0),
       ('`init` properties, value-equality, `Deconstruct`, and `with` support.', true, 1),
       ('An `IComparable<Point>` implementation.', false, 2),
       ('A `Span<Point>`-style stack-only struct.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 [orig 78] (switch expression) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does a *switch expression* differ from a *switch statement*?',
         'A switch expression returns a value (`var x = obj switch { … }`), uses `=>` arms, supports rich pattern matching, and the compiler checks for exhaustiveness. A switch statement is purely control flow.',
         'Switch expression = returns a value; statement = control flow.',
         'A switch expression evaluates to a value using `=>` arms with exhaustive pattern matching, whereas a switch statement is procedural control flow.',
         41
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A switch expression evaluates to a value; a switch statement does not.', true, 0),
       ('A switch expression cannot use patterns.', false, 1),
       ('A switch statement supports `=>` arms; an expression does not.', false, 2),
       ('They are syntactic aliases for the same construct.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 [orig 79] (property pattern) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the pattern `Person { Age: > 18, Name: "Ada" }` test?',
         'This is a property pattern. It matches a `Person` whose `Age` property is greater than 18 *and* whose `Name` property equals `"Ada"`. Property patterns can be combined with type/positional/relational sub-patterns.',
         'Property pattern: match by member values.',
         'A property pattern matches an object''s members against sub-patterns, e.g. testing `Age > 18` and `Name == "Ada"` simultaneously.',
         42
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Whether a `Person` instance is null.', false, 0),
       ('Whether `Person` has properties named `Age` and `Name`.', false, 1),
       ('A `Person` whose `Age` > 18 and `Name` equals "Ada".', true, 2),
       ('Whether `Person` derives from a base type with `Age`/`Name`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 [orig 80] (primary constructors) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `public class Logger(ILog log)`, what is the role of `(ILog log)`?',
         'This is a primary constructor on a class: `log` is in scope across the class body and can be used as a captured parameter (effectively a private field) without an explicit field/constructor declaration.',
         'Primary constructor: parameter captured in scope.',
         'A primary constructor parameter is in scope throughout the class body and is automatically captured for use by other members.',
         43
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A primary constructor whose parameter is in scope class-wide.', true, 0),
       ('A type constraint on `Logger`.', false, 1),
       ('A `record`-only deconstruction.', false, 2),
       ('An attribute applied to the class.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 [orig 81] (file-scoped namespace) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `namespace Crammr.Web;` (with a semicolon, no braces) do?',
         'A file-scoped namespace declaration applies to the *entire file* without a wrapping brace block. It reduces indentation and only one such declaration is allowed per file.',
         'File-scoped namespace = whole file, one declaration.',
         'A file-scoped namespace declaration scopes the namespace over the rest of the file with no braces; only one per file is allowed.',
         44
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares a namespace whose scope is just the next type.', false, 0),
       ('Aliases the namespace for the current file.', false, 1),
       ('Declares a namespace scoping the rest of the file with no braces.', true, 2),
       ('Imports the namespace into all files in the project.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 [orig 82] (record vs class equality) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does default equality behave for `record` vs `class`?',
         'A `record` has value-based equality generated by the compiler — two records of the same type are equal if all their declared members are equal. A `class` uses reference equality unless `Equals` is overridden.',
         '`record` = value equality; `class` = reference equality.',
         'Records have synthesised value-based equality, while classes use reference equality unless equality members are overridden.',
         45
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both use reference equality by default.', false, 0),
       ('Both use value equality by default.', false, 1),
       ('Records use value equality; classes use reference equality.', true, 2),
       ('Records cannot override `Equals`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 [orig 83] (with expression) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `point with { X = 5 }` produce, given `point` is a record?',
         'A `with` expression produces a *new* record (or struct, for record structs) that is a shallow copy of the original with the specified members replaced. The original is unchanged.',
         '`with` = non-destructive copy + member overrides.',
         'A `with` expression returns a non-destructive shallow copy of the record with the listed members replaced.',
         46
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Mutates `point` in place.', false, 0),
       ('A new record that is a copy of `point` with `X = 5`.', true, 1),
       ('A tuple `(point, 5)`.', false, 2),
       ('A `KeyValuePair<string, int>`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 [orig 84] (list pattern) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the pattern `[1, 2, ..]` match against an array or list?',
         'List patterns match by length and element. `[1, 2, ..]` matches any list whose first two elements are 1 and 2, with the `..` slice pattern matching any (possibly empty) remainder.',
         'List pattern with `..` slice = first elements + tail.',
         'A list pattern like `[1, 2, ..]` matches any sequence starting with 1 then 2, with `..` consuming the rest of the elements.',
         47
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Exactly the two-element list `[1, 2]`.', false, 0),
       ('Any list whose first two elements are 1 and 2.', true, 1),
       ('A nested list containing `1` and `2`.', false, 2),
       ('Any list whose last two elements are 1 and 2.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 [orig 85] (when in switch arm) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a switch expression arm, what does `Shape s when s.Sides > 4 => …` do?',
         'It''s a type pattern with a `when` guard. The arm only matches when `s` is a `Shape` *and* `s.Sides > 4`. The guard refines patterns that would otherwise be too coarse.',
         '`when` = additional boolean guard on the pattern.',
         'A `when` clause on a switch arm adds an extra boolean guard that must also be true for the pattern to match.',
         48
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Adds a boolean guard that must be true for the arm to match.', true, 0),
       ('Catches exceptions thrown inside the arm.', false, 1),
       ('Declares a sub-pattern that always matches.', false, 2),
       ('Loops the arm until the condition is false.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 [orig 87] (IComparable) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `IComparable<T>.CompareTo(T other)` return?',
         '`CompareTo` returns a negative number if `this` is less than `other`, zero if equal, and a positive number if greater. The exact magnitudes are unspecified.',
         '`CompareTo` returns sign: <0, 0, or >0.',
         '`IComparable<T>.CompareTo` returns a negative value if less, zero if equal, and a positive value if greater than the argument.',
         49
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A `bool` indicating equality.', false, 0),
       ('A negative, zero, or positive `int` depending on ordering.', true, 1),
       ('A `string` describing the ordering.', false, 2),
       ('A `Task<int>` for asynchronous comparison.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 [orig 91] (attribute usage) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of attributes like `[Obsolete]`?',
         'Attributes attach declarative metadata to types and members. The compiler or runtime tooling can inspect them — e.g. `[Obsolete]` produces a compiler warning or error at usage sites.',
         'Attributes = declarative metadata on declarations.',
         'Attributes attach metadata to declarations, consumed by the compiler, runtime, or tooling (e.g. `[Obsolete]` to warn on use).',
         50
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Runtime extension points for monkey-patching.', false, 0),
       ('Pre-compiled regex patterns.', false, 1),
       ('Declarative metadata read by the compiler, runtime, or tools.', true, 2),
       ('Implicit operator overloads.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 [orig 96] (raw string literal) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What problem do raw string literals (`"""…"""`) solve?',
         'Raw strings allow embedding any text — including quotes, backslashes, and newlines — without escape sequences. They can be paired with `$` for interpolation, with multiple `$`s changing the brace-escape count.',
         'Raw strings: no escape sequences needed.',
         'Raw string literals let you embed multi-line text and quotes without escape sequences, optionally combined with interpolation.',
         51
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They guarantee thread-safe access to the string.', false, 0),
       ('They allow embedding quotes, backslashes, and newlines without escapes.', true, 1),
       ('They make the string mutable.', false, 2),
       ('They convert the string to UTF-32 at compile time.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 [orig 97] (sealed override) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `public sealed override void Render()` declare?',
         'It overrides a virtual/abstract base method *and* marks this override as final — subclasses can no longer override `Render` further. `sealed` here closes the overriding chain.',
         '`sealed override` = override and forbid further overrides.',
         '`sealed override` overrides a base member and prevents any derived class from overriding it again.',
         52
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A new method that hides the base.', false, 0),
       ('An override that subclasses can override again.', false, 1),
       ('An override that prevents further overriding by subclasses.', true, 2),
       ('A static replacement for the base method.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 [orig 99] (AttributeUsage) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `[AttributeUsage(AttributeTargets.Method, AllowMultiple = true)]` on a custom attribute class do?',
         '`AttributeUsage` constrains where the attribute can be applied (here, only on methods) and whether multiple instances are allowed on a single target. It''s read by the compiler to validate applications.',
         '`AttributeUsage` = where attribute applies + multiplicity.',
         '`AttributeUsage` restricts the valid targets of a custom attribute and whether it can be applied multiple times to the same element.',
         53
  from modules where slug = 'csharp-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares the attribute as obsolete.', false, 0),
       ('Limits the attribute to method targets and permits multiple instances.', true, 1),
       ('Forces the attribute to be serialised with assemblies.', false, 2),
       ('Makes the attribute apply implicitly to all methods.', false, 3)
     ) as c(label, is_correct, order_index);
-- ============================================================
-- csharp-3
-- ============================================================

-- Question 0 [orig 7] (ref struct) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which restriction applies specifically to a `ref struct` like `Span<T>`?',
         '`ref struct` types must live on the stack. They cannot be boxed, used as a field of a class, captured by a lambda, or used as a generic type argument (with limited exceptions).',
         '`ref struct` = stack-only; no boxing, no heap capture.',
         'A `ref struct` is stack-only: it cannot be boxed, stored on the heap, captured by lambdas, or used as a regular generic type argument.',
         0
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It cannot define instance methods.', false, 0),
       ('It cannot be stored on the heap or captured by a lambda.', true, 1),
       ('It cannot be passed by `ref`.', false, 2),
       ('It cannot implement value equality.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 28] (open generic type) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typeof(List<>)` refer to?',
         '`typeof(List<>)` (with no type argument inside the angle brackets) represents the *open generic* type definition. You can pass it to `MakeGenericType` to construct closed generic types via reflection.',
         '`typeof(List<>)` = open generic type definition.',
         'The expression `typeof(List<>)` produces the open generic type definition, useful with reflection APIs such as `MakeGenericType`.',
         1
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An open generic type definition.', true, 0),
       ('A closed generic type with `object` as the argument.', false, 1),
       ('A syntax error.', false, 2),
       ('A `Type` for `List<int>` specifically.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 39] (lambda implicit type) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does `var f = x => x + 1;` fail to compile (without natural type inference)?',
         'Historically a bare lambda had no type on its own — it required a delegate or expression-tree target. Recent C# can infer a "natural type" in some cases, but ambiguity still causes errors.',
         'Lambdas need a target delegate type to bind.',
         'A lambda has no inherent type until bound to a compatible delegate or expression-tree target, which is why an unannotated `var` declaration can fail.',
         2
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Lambdas may not appear on the right-hand side of `var`.', false, 0),
       ('The compiler needs a target delegate type to bind the lambda.', true, 1),
       ('`var` cannot infer reference types.', false, 2),
       ('Lambdas are always `dynamic`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 48] (LINQ on IQueryable expression tree) ----------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why might `q.Where(x => SomeLocalMethod(x))` fail at runtime against EF Core?',
         'EF Core translates `IQueryable<T>` predicates by inspecting their expression tree. A call into arbitrary C# code (a non-translatable method) cannot be turned into SQL and throws at evaluation time.',
         'EF Core: cannot translate arbitrary methods to SQL.',
         '`IQueryable` providers translate expression trees to SQL; calls to arbitrary client methods can''t be translated and fail at runtime.',
         3
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('LINQ syntax forbids method calls in predicates.', false, 0),
       ('`Where` only accepts compiled delegates against an `IQueryable`.', false, 1),
       ('The provider cannot translate the local method into SQL.', true, 2),
       ('Predicates against `IQueryable` must be `static`.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 52] (ConfigureAwait(false)) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the effect of `await task.ConfigureAwait(false)` in library code?',
         '`ConfigureAwait(false)` tells the awaiter not to capture the current `SynchronizationContext`/`TaskScheduler` for the continuation. This avoids deadlocks and helps performance in libraries that don''t need to resume on the original (e.g. UI) context.',
         '`ConfigureAwait(false)` = don''t marshal back to the captured context.',
         '`ConfigureAwait(false)` skips marshalling the continuation back to the captured synchronization context, which libraries use to avoid context-related deadlocks and overhead.',
         4
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Cancels the task if it hasn''t started.', false, 0),
       ('Marshals the continuation back to the original context.', false, 1),
       ('Skips marshalling the continuation back to the captured context.', true, 2),
       ('Forces the continuation to run on a new thread.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 56] (ValueTask) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does the BCL provide `ValueTask<T>` alongside `Task<T>`?',
         '`ValueTask<T>` is a `readonly struct` that can wrap either a `Task<T>` or a synchronously available result, avoiding the heap allocation of a `Task<T>` for hot, often-synchronous paths.',
         '`ValueTask<T>` avoids `Task` alloc for synchronous results.',
         '`ValueTask<T>` exists to avoid `Task<T>` allocations on hot paths where many calls complete synchronously.',
         5
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is awaitable from any thread.', false, 0),
       ('It avoids heap allocations when results are available synchronously.', true, 1),
       ('It supports multiple awaits more safely than `Task<T>`.', false, 2),
       ('It runs on a dedicated thread pool.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 58] (yield + async iterator IAsyncEnumerable) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `async IAsyncEnumerable<T>` combined with `yield return` enable?',
         'Async iterators allow producing a stream of values asynchronously. Consumers use `await foreach` to iterate, awaiting each item produced by the generator method.',
         'Async streams: produce values via `yield return` in an async method.',
         '`async IAsyncEnumerable<T>` with `yield return` defines an async stream consumed by `await foreach`.',
         6
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Parallel execution across cores.', false, 0),
       ('Producing values asynchronously via `yield return`, consumed by `await foreach`.', true, 1),
       ('Casting synchronous enumerables to async.', false, 2),
       ('Locking the source so only one consumer iterates at a time.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 63] (Span<T>) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Span<T>` represent?',
         '`Span<T>` is a `ref struct` that gives a typed, bounded view over a contiguous region of memory (managed array, stack memory, or unmanaged buffer) without allocations or copies.',
         '`Span<T>` = stack-only view over contiguous memory.',
         '`Span<T>` is a stack-only struct that provides a safe, allocation-free view over a contiguous region of memory.',
         7
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A growable list backed by a queue.', false, 0),
       ('A stack-only view over a contiguous region of memory.', true, 1),
       ('A wrapper around a thread-safe collection.', false, 2),
       ('An async stream of values.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 86] (boxing into interface) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does calling an interface method on a struct via an `interface` reference cause boxing?',
         'When a struct is referenced through an interface, the runtime must store it as a heap-allocated `object` to provide a stable reference for the interface dispatch — this is boxing.',
         'Calling iface method via iface var on struct → boxing.',
         'Using a struct through an interface reference requires the value to be boxed so it can be addressed via a stable heap reference.',
         8
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Generic constraints always avoid boxing automatically.', false, 0),
       ('Interface methods cannot be called on structs at all.', false, 1),
       ('The struct must be heap-allocated to be referenced via the interface.', true, 2),
       ('Boxing happens only when the struct has reference-type fields.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 88] (GC generations) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How many GC generations does the .NET garbage collector use for managed objects (excluding the LOH)?',
         'The .NET GC has three generations for normal objects: Gen 0 (short-lived), Gen 1 (intermediate), Gen 2 (long-lived). The Large Object Heap is sometimes called "Gen 3" informally but is separate.',
         '.NET GC: Gen 0, Gen 1, Gen 2 (+ LOH).',
         'The .NET GC has three managed generations — Gen 0, 1, and 2 — plus the separate Large Object Heap.',
         9
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Two', false, 0),
       ('Three (Gen 0, 1, 2)', true, 1),
       ('Four (Gen 0, 1, 2, 3)', false, 2),
       ('One uniform heap', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 93] (GC.Collect) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is calling `GC.Collect()` from application code generally discouraged?',
         'Manual GC calls disrupt the runtime''s heuristics, often causing more frequent full collections and worse overall throughput. Real fixes for memory issues usually involve eliminating leaks or pooling, not forcing collections.',
         'Don''t force `GC.Collect`; it hurts performance.',
         'Calling `GC.Collect` manually interferes with the GC''s adaptive heuristics, typically degrading overall performance instead of helping it.',
         10
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is forbidden by the runtime.', false, 0),
       ('It synchronously deletes all managed objects.', false, 1),
       ('It interferes with the GC''s self-tuning and usually hurts performance.', true, 2),
       ('It only works in debug builds.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 94] (IDisposable + GC finaliser) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does the classic Dispose pattern call `GC.SuppressFinalize(this)`?',
         'If a type has a finaliser as a safety net, calling `Dispose` cleans up early. `GC.SuppressFinalize` tells the GC not to enqueue the finaliser, avoiding the extra cost of finalisation.',
         '`SuppressFinalize` = skip finaliser after explicit `Dispose`.',
         '`GC.SuppressFinalize(this)` skips the finaliser after explicit `Dispose`, removing unnecessary finalisation work.',
         11
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It prevents `Dispose` from running again.', false, 0),
       ('It avoids running the finaliser since cleanup is already done.', true, 1),
       ('It pins the object in memory.', false, 2),
       ('It runs the finaliser immediately.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 95] (LOH) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Roughly which objects go on the Large Object Heap (LOH)?',
         'By default the LOH holds objects whose size is >= ~85,000 bytes (e.g. large arrays). The LOH is collected with Gen 2 and is not compacted by default to avoid costly moves.',
         'LOH: objects >= ~85,000 bytes; collected with Gen 2.',
         'Objects roughly 85,000 bytes or larger are allocated on the Large Object Heap, which is collected with Gen 2 and not compacted by default.',
         12
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Objects that contain unmanaged handles.', false, 0),
       ('Objects whose size is roughly 85,000 bytes or larger.', true, 1),
       ('All objects that survive Gen 0.', false, 2),
       ('All objects allocated by reflection.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 98] (ref local) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `ref int x = ref arr[0];` declare?',
         'A `ref` local is an alias to existing storage — here, the first element of `arr`. Assigning to `x` writes through to `arr[0]`. `ref` locals are stack-only and have lifetime restrictions.',
         '`ref` local = alias to existing storage.',
         'A `ref` local binds to existing storage, so assignments through the alias mutate the original location.',
         13
  from modules where slug = 'csharp-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A copy of `arr[0]` into a new local.', false, 0),
       ('A pointer requiring `unsafe` code.', false, 1),
       ('An alias to `arr[0]` — assignments write through.', true, 2),
       ('A nullable boxed integer.', false, 3)
     ) as c(label, is_correct, order_index);
