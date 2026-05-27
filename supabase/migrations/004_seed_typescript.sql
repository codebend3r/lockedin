-- 004_seed_typescript.sql
-- TypeScript module: 100 quiz questions

insert into modules (slug, name, description, type, total_questions)
values (
  'typescript',
  'TypeScript',
  'Sharpen TypeScript — types, generics, narrowing, and tsconfig.',
  'dynamic',
  100
);

-- Question 0 (basic annotations) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following correctly annotates a variable as a string in TypeScript?',
         'TypeScript uses a colon followed by the type name after the variable name for type annotations. `let name: string` is the correct syntax.',
         'let name: string',
         'In TypeScript, type annotations are written with a colon after the variable name: `let name: string`. This tells the compiler to enforce that only string values are assigned to `name`.',
         0
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('let name: string',    true,  0),
       ('let name as string',  false, 1),
       ('let name<string>',    false, 2),
       ('string let name',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (basic annotations) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `number[]` and `Array<number>` in TypeScript?',
         'Both `number[]` and `Array<number>` are exactly equivalent in TypeScript — they represent an array of numbers. The choice is purely stylistic.',
         'They are identical — purely stylistic',
         '`number[]` and `Array<number>` are completely interchangeable in TypeScript. Both describe an array whose elements must be numbers; the difference is only a matter of preference.',
         1
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical — purely stylistic preference',                        true,  0),
       ('`Array<number>` is generic; `number[]` is not and cannot hold subtypes', false, 1),
       ('`number[]` is readonly by default; `Array<number>` is mutable',           false, 2),
       ('`number[]` only works at runtime; `Array<number>` is compile-time only',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (basic annotations) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `let pair: [string, number]`, which assignment is valid?',
         'A tuple type `[string, number]` requires exactly a string at index 0 and a number at index 1. Order and types must match exactly.',
         'Tuple — order and types must match',
         'TypeScript tuples enforce both the number of elements and their types at each position. `["hello", 42]` satisfies `[string, number]` because position 0 is a string and position 1 is a number.',
         2
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('[42, "hello"]',    false, 0),
       ('["hello"]',        false, 1),
       ('[string, number]', false, 2),
       ('["hello", 42]',    true,  3)
     ) as c(label, is_correct, order_index);

-- Question 3 (basic annotations) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does TypeScript infer as the type of `let x = 42`?',
         'TypeScript uses type inference to automatically determine the type from the initial value. Since `42` is a number literal, TypeScript infers `x` has type `number`.',
         'Inferred as `number`',
         'TypeScript infers the type `number` for `let x = 42` because the initial value is a numeric literal. You rarely need to write `: number` explicitly when the value makes the type obvious.',
         3
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('42',       false, 0),
       ('number',   true,  1),
       ('integer',  false, 2),
       ('any',      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (basic annotations) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you annotate a function parameter that can be either `null` or a `string`?',
         'A union type `string | null` is used to express that a value can be either a string or null. This is common when `strictNullChecks` is enabled.',
         'string | null',
         'The union type `string | null` means the parameter accepts either a string or null. With `strictNullChecks` on, you must narrow the type before using string methods on it.',
         4
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string?',          false, 0),
       ('string | null',    true,  1),
       ('nullable<string>', false, 2),
       ('Maybe<string>',    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (basic annotations) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What type does TypeScript assign to a function with no `return` statement?',
         'A function with no return statement (or only bare `return`) has return type `void`. This signals that the return value should not be used.',
         'void',
         'TypeScript infers `void` as the return type of functions that do not return a value. `void` is distinct from `undefined` — it communicates intent that callers should not consume the return value.',
         5
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('undefined', false, 0),
       ('void',      true,  1),
       ('null',      false, 2),
       ('never',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (unknown vs any vs never) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'You receive data from an external API and don''t know its shape. Which type is safest to use?',
         '`unknown` is the type-safe counterpart to `any`. You cannot perform operations on an `unknown` value without first narrowing its type, which forces you to validate the data before use.',
         '`unknown` — must narrow before use',
         '`unknown` is safer than `any` for external data because TypeScript forces you to narrow the type (via `typeof`, `instanceof`, or type guards) before you can access any properties or call methods. `any` skips all checks.',
         6
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('any',     false, 0),
       ('unknown', true,  1),
       ('object',  false, 2),
       ('never',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (unknown vs any vs never) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is true about `any` in TypeScript?',
         '`any` opts the variable out of type checking entirely. You can assign anything to it and read any property from it without compiler errors, which defeats the purpose of TypeScript.',
         '`any` disables type checking',
         '`any` tells TypeScript to skip all type checks for that value. It is assignable to every type and every type is assignable to it, making it a type-system escape hatch that should be avoided when possible.',
         7
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is the same as `unknown` but faster at runtime',          false, 0),
       ('It disables type checking for the annotated value',          true,  1),
       ('It requires narrowing before property access',               false, 2),
       ('It is the return type of functions that never return',       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (unknown vs any vs never) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which type represents a value that can never occur — e.g. the return type of a function that always throws?',
         '`never` is used for values that never exist. A function that always throws or loops forever has return type `never` because it never produces a value.',
         '`never` — impossible value',
         '`never` represents the type of values that never occur. Functions that always throw an error or run an infinite loop have return type `never`, and it also appears as the empty type in exhaustive checks.',
         8
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('void',    false, 0),
       ('never',   true,  1),
       ('null',    false, 2),
       ('unknown', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (unknown vs any vs never) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you try to call `.toUpperCase()` directly on a variable typed `unknown`?',
         'TypeScript does not allow any operations on `unknown` values without narrowing first. You must check the type (e.g. `typeof x === "string"`) before calling string methods.',
         'Compile error — must narrow first',
         'Calling `.toUpperCase()` on an `unknown` variable is a compile-time error. You must narrow the type first using a type guard such as `if (typeof x === "string")` before TypeScript permits string operations.',
         9
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It works fine at compile time',                              false, 0),
       ('TypeScript emits a compile-time error',                     true,  1),
       ('It returns `undefined` instead of throwing',                false, 2),
       ('It works only if `strictNullChecks` is disabled',           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (unknown vs any vs never) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In an exhaustive switch over a discriminated union, what type should the default branch assign to the remaining variable to catch missing cases?',
         'Assigning the unhandled value to a `never` variable in the default branch causes a compile error when a new union member is added but not handled, ensuring exhaustiveness.',
         'Assign to `never` for exhaustiveness',
         'The pattern `const _exhaustive: never = x` in a default branch ensures TypeScript reports an error if any union variant is unhandled. If all cases are covered, `x` is `never` in the default and the assignment is valid.',
         10
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('any',     false, 0),
       ('unknown', false, 1),
       ('never',   true,  2),
       ('void',    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (unknown vs any vs never) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement correctly describes the relationship between `unknown` and `any`?',
         'Every `any` value is assignable to `unknown`, but an `unknown` value is NOT assignable to `any` without an assertion. More precisely, `unknown` requires narrowing; `any` skips all checks.',
         '`any` skips checks; `unknown` requires narrowing',
         '`unknown` and `any` both accept any value, but `unknown` forces the programmer to prove the type before using it. `any` skips all type checking in both directions, making it fundamentally less safe.',
         11
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`any` bypasses all checks; `unknown` requires narrowing before operations are allowed', true,  0),
       ('They are aliases for the same internal type',                                           false, 1),
       ('`unknown` skips checks; `any` requires narrowing',                                     false, 2),
       ('`any` is a subtype of `unknown`',                                                      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (unknown vs any vs never) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the return type of `JSON.parse()` in TypeScript''s standard library?',
         '`JSON.parse()` returns `any` in TypeScript''s built-in typings because the structure of the parsed value is entirely unknown at compile time. This is why you often cast or validate the result.',
         'any',
         '`JSON.parse()` is typed as returning `any` in TypeScript''s standard library declarations. This allows assigning the result anywhere, but also means you get no type safety without an explicit cast or runtime validation.',
         12
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('unknown', false, 0),
       ('object',  false, 1),
       ('any',     true,  2),
       ('Record<string, unknown>', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (interfaces vs type aliases) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which feature is available with `interface` but NOT with `type` aliases?',
         'Declaration merging allows multiple `interface` declarations with the same name to be automatically merged into one. `type` aliases cannot be re-declared — doing so is an error.',
         'Declaration merging',
         'Interfaces support declaration merging: you can declare the same interface name multiple times and TypeScript merges all the declarations. Type aliases do not support this and will produce an error on re-declaration.',
         13
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declaration merging',  true,  0),
       ('Union types',          false, 1),
       ('Intersection types',   false, 2),
       ('Conditional types',    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (interfaces vs type aliases) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of the following can ONLY be expressed with a `type` alias, not an `interface`?',
         'Union types (`A | B`) cannot be expressed with an `interface`. You must use `type` for unions, primitive aliases, and other non-object forms.',
         'Union types require `type`',
         'Interfaces can only describe object shapes. To create a union type like `type Result = Success | Failure`, you must use a `type` alias. Interfaces cannot represent union or primitive types.',
         14
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An object with optional properties',  false, 0),
       ('A union of two object types',         true,  1),
       ('A method signature',                  false, 2),
       ('An index signature',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (interfaces vs type aliases) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does an interface extend another interface?',
         'Interfaces use the `extends` keyword to inherit from one or more other interfaces. This is different from intersection types (`&`) used with type aliases.',
         'interface B extends A {}',
         'An interface uses the `extends` keyword to inherit all properties from another interface: `interface B extends A {}`. Multiple inheritance is also possible: `interface C extends A, B {}`.',
         15
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('interface B implements A {}', false, 0),
       ('interface B extends A {}',   true,  1),
       ('interface B inherits A {}',  false, 2),
       ('interface B & A {}',         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (interfaces vs type aliases) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of declaring two `interface User` blocks with different properties in the same scope?',
         'TypeScript merges multiple interface declarations with the same name. Both property sets become part of a single merged `User` interface — this is declaration merging.',
         'They merge into one interface',
         'TypeScript automatically merges multiple interface declarations with the same name. If you declare `interface User { id: number }` and later `interface User { name: string }`, the result is a single interface with both `id` and `name`.',
         16
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A compile error — duplicate identifier',           false, 0),
       ('They merge into a single interface',               true,  1),
       ('The second declaration overrides the first',       false, 2),
       ('Only the first declaration is used at runtime',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (interfaces vs type aliases) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which keyword is used to combine two type aliases into one that must satisfy BOTH shapes?',
         'The `&` operator creates an intersection type, which requires a value to satisfy all properties of both operands simultaneously.',
         '& (intersection)',
         'The intersection operator `&` combines two types so that a value must satisfy both. `type C = A & B` means a value of type `C` must have all properties from both `A` and `B`.',
         17
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('|',       false, 0),
       ('&',       true,  1),
       ('extends', false, 2),
       ('+',       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (interfaces vs type aliases) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can a `type` alias be re-declared with the same name in the same scope?',
         'Unlike interfaces, `type` aliases cannot be redeclared. Attempting to declare a second `type Foo = ...` with the same name in the same scope produces a compile error.',
         'No — compile error',
         'Type aliases cannot be merged or redeclared. Declaring `type Foo = string` and then `type Foo = number` in the same scope is a compile error. Only interfaces support declaration merging.',
         18
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, they merge like interfaces',                   false, 0),
       ('No — it produces a compile error',                  true,  1),
       ('Yes, the second declaration overrides the first',   false, 2),
       ('Only if they have identical right-hand sides',      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (union & intersection types) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `type A = { x: number }` and `type B = { y: string }`, what properties does `A & B` have?',
         'An intersection type `A & B` requires a value to have all properties from both types. So `A & B` has both `x: number` and `y: string`.',
         'Both x and y',
         'The intersection `A & B` means the value must satisfy both `A` and `B` simultaneously. A value of type `A & B` must have `x: number` (from A) and `y: string` (from B).',
         19
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only x',          false, 0),
       ('Both x and y',    true,  1),
       ('Only y',          false, 2),
       ('Neither — never', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (union & intersection types) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What type do you get from `string & number` in TypeScript?',
         'No value can be both a `string` and a `number` simultaneously. The intersection of two incompatible primitive types resolves to `never`.',
         'never',
         '`string & number` is `never` because no value can satisfy both primitive types at once. TypeScript resolves incompatible primitive intersections to the bottom type `never`.',
         20
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string',          false, 0),
       ('never',           true,  1),
       ('number',          false, 2),
       ('any',             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (union & intersection types) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A function parameter typed `string | number` accepts which values?',
         'A union type `string | number` means the value can be either a string OR a number. Both are valid; booleans and objects are not.',
         'Either a string or a number',
         'The union type `string | number` allows a value to be either type. Inside the function, you must narrow with `typeof` before using type-specific operations like `.toUpperCase()` or arithmetic.',
         21
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only strings',              false, 0),
       ('Either a string or number', true,  1),
       ('Only numbers',              false, 2),
       ('Any value including null',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (union & intersection types) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When accessing a property on a union type `A | B`, which properties are immediately accessible without narrowing?',
         'On a union type, only properties that exist on ALL members of the union are accessible without narrowing. Properties unique to one member require a type guard first.',
         'Only shared properties',
         'TypeScript only allows accessing properties common to every member of a union without narrowing. If `A` has `x` and `B` does not, you must narrow to `A` before accessing `x`.',
         22
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All properties from A',                    false, 0),
       ('Only properties present on all members',   true,  1),
       ('All properties from B',                    false, 2),
       ('No properties — you must always narrow',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (union & intersection types) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `|` operator do when used in a type position?',
         'The `|` operator in a type position creates a union type, meaning the value can be any one of the listed types.',
         'Creates a union type',
         'In TypeScript, `|` between types creates a union, allowing the value to be any one of those types. It does not perform a bitwise OR — type-level operators are purely compile-time constructs.',
         23
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Performs a bitwise OR at runtime',                   false, 0),
       ('Creates a union type at compile time',               true,  1),
       ('Creates an intersection type',                       false, 2),
       ('Marks the type as optional',                         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (discriminated unions & exhaustiveness) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What makes a union a "discriminated union" in TypeScript?',
         'A discriminated union has a common literal-typed property (the discriminant) on every member, which TypeScript uses to narrow the type in control flow.',
         'Shared literal-typed tag property',
         'A discriminated union is a union where every member has a common property (the tag/discriminant) with a unique literal type. TypeScript narrows the union by checking that property, e.g. `if (shape.kind === "circle")`.',
         24
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Every member has a common literal-typed discriminant property',      true,  0),
       ('Every member has the same property names',                           false, 1),
       ('It uses `enum` members as type parameters',                          false, 2),
       ('It is a union that has been narrowed to a single type',              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (discriminated unions & exhaustiveness) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given a discriminated union `type Shape = Circle | Square`, how does TypeScript narrow the type inside `if (shape.kind === "circle")`?',
         'TypeScript''s control flow analysis uses the literal type check on the discriminant to narrow the union to only the matching member inside the branch.',
         'Control flow narrows to Circle',
         'When you check `shape.kind === "circle"`, TypeScript knows inside that branch that `shape` must be `Circle`. This is control flow narrowing — the discriminant check rules out all other union members.',
         25
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('TypeScript cannot narrow unions without a cast',                       false, 0),
       ('TypeScript narrows `shape` to `Circle` inside the if-block',          true,  1),
       ('TypeScript narrows to `Square` inside the if-block',                  false, 2),
       ('TypeScript widens the type to `Shape` inside the if-block',           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (discriminated unions & exhaustiveness) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'You add a new member to a discriminated union but forget to handle it in a switch. Which TypeScript pattern catches this at compile time?',
         'Assigning the remaining variable to `never` in the default case causes a compile error when a new union member reaches the default, because its type is no longer `never`.',
         'Assign to never in default branch',
         'The exhaustiveness pattern assigns the switch''s expression to `never` in the default branch: `const check: never = x`. If a new union member is added but not handled, `x` is that member''s type in the default, which is not assignable to `never`, producing a compile error.',
         26
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Throw an error in the default branch at runtime',                      false, 0),
       ('Assign the remaining value to `never` in the default branch',          true,  1),
       ('Use `instanceof` on each case',                                        false, 2),
       ('Enable `noFallthroughCasesInSwitch` in tsconfig',                     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (discriminated unions & exhaustiveness) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which property makes `{ kind: "circle"; radius: number }` a good discriminated union member?',
         'The `kind` property has a string literal type `"circle"`, making it a unique tag. TypeScript uses this literal type to distinguish this member from others in the union.',
         'Literal-typed `kind` property',
         'The `kind: "circle"` property is a string literal type, which serves as the discriminant. Its uniqueness among union members allows TypeScript to narrow the entire union by checking `kind`.',
         27
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The `radius` property',                                               false, 0),
       ('The use of an interface instead of a type alias',                    false, 1),
       ('The object having exactly two properties',                           false, 2),
       ('The `kind` property with a unique literal type',                     true,  3)
     ) as c(label, is_correct, order_index);

-- Question 28 (discriminated unions & exhaustiveness) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'After handling all cases in a switch over a discriminated union, what type does the switched variable have in the `default` branch?',
         'If every member of the union is handled in prior cases, no value can reach the default branch, so TypeScript infers `never` there — the bottom type.',
         'never',
         'When every case of a discriminated union is handled, the variable in the `default` branch has type `never` because no value can reach it. This is used for exhaustiveness checks by assigning it to a `never`-typed variable.',
         28
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('unknown',  false, 0),
       ('void',     false, 1),
       ('any',      false, 2),
       ('never',    true,  3)
     ) as c(label, is_correct, order_index);

-- Question 29 (discriminated unions & exhaustiveness) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can a discriminated union use a numeric literal as the discriminant instead of a string literal?',
         'TypeScript discriminated unions work with any literal type, including number literals, boolean literals, and string literals — not just strings.',
         'Yes — any literal type works',
         'Discriminated unions can use numeric, boolean, or string literal types as the discriminant. For example, `type A = { code: 0; msg: string } | { code: 1; value: number }` is a valid discriminated union.',
         29
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, any literal type works as a discriminant',                      true,  0),
       ('No, only string literals are allowed as discriminants',              false, 1),
       ('No, only enum values are allowed as discriminants',                  false, 2),
       ('Only if combined with a string literal in a union',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (literal types & as const) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What type does TypeScript infer for `let dir = "north"`?',
         'With `let`, TypeScript widens the string literal to `string` because `let` variables can be reassigned. Use `const` or `as const` to keep the literal type.',
         'string (widened)',
         'TypeScript infers `string` for `let dir = "north"` because `let` allows reassignment to any string. To preserve the literal type `"north"`, use `const dir = "north"` or `let dir = "north" as const`.',
         30
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"north" (string literal)',  false, 0),
       ('string',                   true,  1),
       ('any',                      false, 2),
       ('const string',             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (literal types & as const) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `as const` do to the object `{ x: 1, y: 2 }`?',
         '`as const` makes the object deeply readonly and narrows each property to its literal type: `{ readonly x: 1; readonly y: 2 }` instead of `{ x: number; y: number }`.',
         'Deeply readonly + literal types',
         '`as const` asserts that the object is a deeply readonly literal. Every property becomes `readonly` and each value is narrowed to its literal type — `1` instead of `number`, `"hello"` instead of `string`, etc.',
         31
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Makes the object deeply readonly with literal-typed properties',        true,  0),
       ('Freezes the object at runtime',                                         false, 1),
       ('Converts the object to a `const` enum',                                false, 2),
       ('Has no effect — it is just a hint for the IDE',                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (literal types & as const) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What type is inferred for `const direction = "north" as const`?',
         'Applying `as const` to a string literal keeps the type as the string literal `"north"` rather than widening it to `string`.',
         '"north" (literal)',
         '`as const` prevents widening, so `const direction = "north" as const` has type `"north"` — the exact string literal — not the broader `string` type.',
         32
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('const',     false, 0),
       ('readonly',  false, 1),
       ('"north"',   true,  2),
       ('string',    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (literal types & as const) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `const DIRECTIONS = ["north", "south"] as const` useful for type safety?',
         'Without `as const`, TypeScript infers `string[]`. With `as const`, it infers `readonly ["north", "south"]` — a tuple with literal types — enabling `typeof DIRECTIONS[number]` to produce `"north" | "south"`.',
         'Infers readonly tuple of literals',
         '`as const` on an array infers a readonly tuple with literal element types. This allows using `typeof DIRECTIONS[number]` to derive the union `"north" | "south"`, making the array a type-safe constant list.',
         33
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It freezes the array at runtime preventing mutation',                  false, 0),
       ('TypeScript widens each element to `string`, improving flexibility',   false, 1),
       ('TypeScript infers a readonly tuple of literal types',                  true,  2),
       ('It makes the array into a `Set` type',                                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (literal types & as const) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you define a type that accepts only the string literal `"left"` or `"right"`?',
         'A union of string literals `"left" | "right"` restricts the type to exactly those two values. This is the TypeScript way to express a string enum without using `enum`.',
         '"left" | "right"',
         'You define a string literal union with `type Direction = "left" | "right"`. Only those exact strings are assignable — any other string causes a compile error.',
         34
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('type Direction = string',                    false, 0),
       ('type Direction = "left" | "right"',         true,  1),
       ('enum Direction { left, right }',            false, 2),
       ('type Direction = readonly ["left","right"]', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (function types) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you type a function that takes two numbers and returns a number?',
         'The function type expression `(a: number, b: number) => number` declares a callable that accepts two numbers and returns a number.',
         '(a: number, b: number) => number',
         'Function type expressions use the syntax `(params) => returnType`. For a function taking two numbers and returning a number: `(a: number, b: number) => number`.',
         35
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('(a: number, b: number) => number',           true,  0),
       ('function(number, number): number',           false, 1),
       ('[number, number] => number',                 false, 2),
       ('(number, number) -> number',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (function types) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you make a function parameter optional in TypeScript?',
         'Adding `?` after the parameter name makes it optional. Optional parameters have type `T | undefined` inside the function and can be omitted by callers.',
         'param?: type',
         'A `?` suffix on a parameter name makes it optional: `function greet(name?: string)`. Inside the function, `name` has type `string | undefined`, so you must check before using it.',
         36
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Prefix the parameter with `optional`',         false, 0),
       ('Add `| undefined` to the type only',           false, 1),
       ('Add `?` after the parameter name',             true,  2),
       ('Use a default value of `null`',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (function types) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the rest parameter type `...args: string[]` mean in a function signature?',
         'Rest parameters collect all remaining arguments into an array. `...args: string[]` means any number of additional string arguments, collected into an array named `args`.',
         'Collects remaining args as string[]',
         'The rest parameter `...args: string[]` collects all trailing arguments into a `string[]` array. The caller can pass zero or more strings; they are available inside the function as an array.',
         37
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`args` is a single optional string',                               false, 0),
       ('`args` is a tuple of exactly two strings',                        false, 1),
       ('`args` collects zero or more strings into an array',               true,  2),
       ('`args` is a spread of a fixed-length string array',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (function types) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'TypeScript function overloads require which of the following?',
         'TypeScript overloads require one or more overload signatures followed by a single implementation signature. The implementation is not callable directly — callers see only the overload signatures.',
         'Overload signatures + one implementation',
         'Function overloads in TypeScript are declared as multiple overload signatures followed by a single implementation signature. The implementation must be compatible with all overloads, and only the overload signatures are visible to callers.',
         38
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Multiple separate function bodies with the same name',             false, 0),
       ('A generic type parameter to unify the variants',                  false, 1),
       ('Overload signatures plus a single implementation signature',       true,  2),
       ('The `overload` keyword before the function declaration',           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (function types) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type of `this` in a regular TypeScript arrow function?',
         'Arrow functions do not have their own `this` binding. They capture `this` lexically from the enclosing scope at definition time, so there is no separate `this` type for the arrow function itself.',
         'Lexically captured — no own `this`',
         'Arrow functions capture `this` from their enclosing lexical scope and do not have their own `this`. You cannot annotate a `this` parameter in an arrow function; it is always the outer `this`.',
         39
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`any`, because arrow functions skip type checking',                false, 0),
       ('`void`, because arrow functions cannot use `this`',                false, 1),
       ('Lexically inherited from the enclosing scope',                     true,  2),
       ('`unknown`, requiring a cast before use',                           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `T` represent in `function identity<T>(arg: T): T`?',
         '`T` is a type parameter — a placeholder for a type that is determined when the function is called. The caller can pass a concrete type or let TypeScript infer it.',
         'Type parameter (placeholder)',
         '`T` is a generic type parameter. When `identity(42)` is called, TypeScript infers `T = number`. The function then accepts and returns a `number`. Type parameters make functions reusable across many types.',
         40
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A built-in TypeScript alias for `any`',           false, 0),
       ('A template literal type',                         false, 1),
       ('A type parameter that is resolved at call site',  true,  2),
       ('A shorthand for `typeof`',                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `<T extends object>` mean in a generic function?',
         'The `extends` constraint limits `T` to types that are assignable to `object`. Passing a primitive like `number` would be a compile error.',
         'T must be assignable to object',
         '`<T extends object>` constrains the type parameter `T` so only types that are subtypes of `object` are accepted. Primitives like `string` or `number` are excluded.',
         41
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('T must be a class constructor',                                   false, 0),
       ('T must be assignable to `object`',                               true,  1),
       ('T extends the prototype of `Object`',                            false, 2),
       ('T defaults to `object` if not specified',                         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `function getProperty<T, K extends keyof T>(obj: T, key: K): T[K]` ensure?',
         'The constraint `K extends keyof T` ensures `key` must be a valid property name of `obj`. The return type `T[K]` is the exact type of that property, giving type-safe property access.',
         'Type-safe property access via keyof',
         '`K extends keyof T` restricts `key` to actual property names of `obj`. The return type `T[K]` uses indexed access to return the exact type of that property — making property access fully type-safe without using `any`.',
         42
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`key` is optional and defaults to the first key of `T`',              false, 0),
       ('`obj` must extend `Record<K, unknown>`',                              false, 1),
       ('`key` can be any string, returning `any`',                            false, 2),
       ('`key` must be a valid property name of `obj`, return type is `T[K]`', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 43 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a default type parameter in TypeScript, and how is it written?',
         'A default type parameter provides a fallback type when none is explicitly supplied or inferred. Syntax: `<T = string>` means T defaults to `string`.',
         '<T = DefaultType>',
         'Default type parameters use the `= Type` syntax: `function wrap<T = string>(value: T)`. If the caller does not supply a type argument and TypeScript cannot infer one, `T` falls back to the default.',
         43
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('<T = string>',          true,  0),
       ('<T default string>',    false, 1),
       ('<T: string>',           false, 2),
       ('<T extends string = >', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When TypeScript cannot infer a generic type argument, what must the caller do?',
         'When inference fails, the caller must supply the type argument explicitly: `identity<string>("hello")`. TypeScript cannot always infer the type from usage alone.',
         'Provide explicit type argument: fn<T>(...)',
         'If TypeScript cannot infer the generic type argument, you provide it explicitly in angle brackets: `parse<User>(json)`. This is common when the return type depends on the type parameter but there is no parameter to infer from.',
         44
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Use `any` as the argument type',                                   false, 0),
       ('TypeScript always defaults to `unknown` when inference fails',     false, 1),
       ('Cast the return value with `as`',                                  false, 2),
       ('Provide the type argument explicitly in angle brackets',           true,  3)
     ) as c(label, is_correct, order_index);

-- Question 45 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of a generic interface like `interface Repository<T> { findById(id: string): T }`?',
         'A generic interface allows the same interface shape to be reused with different concrete types. `Repository<User>` has `findById` returning `User`; `Repository<Order>` returns `Order`.',
         'Reusable interface across types',
         'Generic interfaces parameterize the interface with a type variable so the same structure can be used for multiple entity types. `Repository<User>` and `Repository<Order>` are both valid specializations.',
         45
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To make the interface reusable across different entity types',    true,  0),
       ('To enforce that T must be an interface',                          false, 1),
       ('To allow multiple interface declarations to merge',               false, 2),
       ('To restrict T to only class types',                               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Array<T>` mean in terms of generics?',
         '`Array<T>` is a generic type where `T` is the type of the array''s elements. Specializing it to `Array<number>` means an array that can only hold numbers.',
         'T is the element type',
         '`Array<T>` is a built-in generic interface. `T` is the element type — `Array<string>` holds strings, `Array<User>` holds User objects. This is equivalent to the shorthand `T[]`.',
         46
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('T is the length of the array',                  false, 0),
       ('T is the index type of the array',              false, 1),
       ('T is the type of each element in the array',    true,  2),
       ('T must extend `number`',                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `<T extends { length: number }>` allow you to do inside the function?',
         'By constraining `T` to have a `length: number` property, TypeScript lets you safely access `arg.length` inside the function for any compatible type (arrays, strings, etc.).',
         'Access .length on T',
         'The constraint `T extends { length: number }` guarantees that whatever type `T` is, it has a `length` property of type `number`. This lets you safely use `arg.length` inside the function without a cast.',
         47
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Restrict T to array types only',                                   false, 0),
       ('Ensure T has at least one generic type parameter',                 false, 1),
       ('Require T to be a subtype of `object`',                           false, 2),
       ('Safely access `.length` on the argument',                          true,  3)
     ) as c(label, is_correct, order_index);

-- Question 48 (generics) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a generic class in TypeScript, and what syntax declares one?',
         'A generic class uses type parameters to make its members type-safe and reusable. Syntax: `class Stack<T> { ... }` where `T` is used in method signatures and fields.',
         'class Name<T> { ... }',
         'Generic classes are declared with `class Name<T>`. The type parameter `T` can be used for fields, method parameters, and return types within the class, making the class reusable for different element types.',
         48
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('class Name extends Generic<T> {}',  false, 0),
       ('class Name[T] {}',                  false, 1),
       ('class Name<T> {}',                  true,  2),
       ('generic class Name<T> {}',          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `keyof User` produce if `User = { id: number; name: string }`?',
         '`keyof T` produces a union of all the property name strings (or numbers) of T. For `{ id: number; name: string }`, `keyof User` is `"id" | "name"`.',
         '"id" | "name"',
         '`keyof T` produces a union of all key names of the type `T`. For `User = { id: number; name: string }`, `keyof User` is `"id" | "name"` — a string literal union of the property names.',
         49
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string',            false, 0),
       ('number | string',   false, 1),
       ('"id" | "name"',     true,  2),
       ('{ id; name }',      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typeof obj` produce when used in a TYPE position (not a value position)?',
         'In a type position, `typeof x` queries the TypeScript type of a variable or expression, returning a type descriptor that can be used in annotations.',
         'The TypeScript type of the variable',
         '`typeof` in a type position (after `:` or in a type alias) produces the TypeScript type of the given variable. For example, `const user = { id: 1 }; type User = typeof user` gives `{ id: number }`.',
         50
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always `any`',                                             false, 0),
       ('A JavaScript string like "object"',                         false, 1),
       ('The constructor function of the variable''s class',        false, 2),
       ('The TypeScript type of the variable',                      true,  3)
     ) as c(label, is_correct, order_index);

-- Question 51 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `type User = { id: number; name: string }`, what is `User["name"]`?',
         'Indexed access types use bracket notation on a type to extract the type of a specific property. `User["name"]` extracts the type of the `name` property, which is `string`.',
         'string',
         '`T[K]` is an indexed access type — it extracts the type of property `K` from type `T`. `User["name"]` yields `string` because the `name` property of `User` is typed as `string`.',
         51
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string',  true,  0),
       ('number',  false, 1),
       ('User',    false, 2),
       ('any',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `T[keyof T]` produce for `T = { a: string; b: number }`?',
         '`T[keyof T]` uses all keys of T as the index, producing a union of all property value types. For `{ a: string; b: number }`, it produces `string | number`.',
         'Union of all value types',
         '`T[keyof T]` is a common pattern to extract a union of all property value types. For `{ a: string; b: number }`, `keyof T` is `"a" | "b"`, and `T["a" | "b"]` distributes to `string | number`.',
         52
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"a" | "b"',        false, 0),
       ('string & number',  false, 1),
       ('string | number',  true,  2),
       ('{ a: string; b: number }', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you derive a type from an existing variable''s shape without repeating its type annotation?',
         '`typeof variableName` in a type position captures the inferred type of the variable, avoiding repetition and keeping the type in sync automatically.',
         'type T = typeof variable',
         'Using `type T = typeof myVariable` derives the TypeScript type of `myVariable`. If `myVariable` changes shape, `T` automatically reflects that — no need to manually keep a separate type annotation in sync.',
         53
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('type T = infer myVariable',   false, 0),
       ('type T = keyof myVariable',   false, 1),
       ('type T = typeof myVariable',  true,  2),
       ('type T = type(myVariable)',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of `keyof any` in TypeScript?',
         '`keyof any` produces `string | number | symbol` because those are the valid key types for any JavaScript object — property names can be strings, numbers, or symbols.',
         'string | number | symbol',
         '`keyof any` is `string | number | symbol`, the union of all possible JavaScript key types. This is useful in generic constraints to allow any valid object key.',
         54
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string',                      false, 0),
       ('any',                         false, 1),
       ('never',                       false, 2),
       ('string | number | symbol',    true,  3)
     ) as c(label, is_correct, order_index);

-- Question 55 (keyof, typeof, indexed access) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `const palette = { red: "#f00", blue: "#00f" } as const`, what is `typeof palette["red"]`?',
         'Because `as const` narrows the values to their literal types, `palette["red"]` has type `"#f00"` — the string literal — not the broader `string`.',
         '"#f00" (literal)',
         'With `as const`, each property is narrowed to its literal value. `typeof palette["red"]` uses indexed access on the const-asserted type, yielding the literal type `"#f00"` rather than `string`.',
         55
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"red"',     false, 0),
       ('unknown',   false, 1),
       ('"#f00"',    true,  2),
       ('string',    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (mapped types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Partial<User>` do to the type `User = { id: number; name: string }`?',
         '`Partial<T>` makes all properties of T optional by adding `?` to each. `Partial<User>` results in `{ id?: number; name?: string }`.',
         'Makes all properties optional',
         '`Partial<T>` is a built-in mapped type that adds `?` to every property of `T`. `Partial<User>` becomes `{ id?: number; name?: string }` — useful for partial update objects.',
         56
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Makes all properties required',      false, 0),
       ('Makes all properties readonly',      false, 1),
       ('Removes all properties',             false, 2),
       ('Makes all properties optional',      true,  3)
     ) as c(label, is_correct, order_index);

-- Question 57 (mapped types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a custom mapped type `{ [K in keyof T]: boolean }` produce?',
         'This mapped type iterates over every key in `T` and replaces each property''s type with `boolean`. The keys are preserved but all value types become `boolean`.',
         'Same keys, all values become boolean',
         'The mapped type `{ [K in keyof T]: boolean }` creates a new type with the same property names as `T` but with every property typed as `boolean`. It is a homomorphic mapped type.',
         57
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Copies T with all property values typed as boolean',             true,  0),
       ('Removes all non-boolean properties',                              false, 1),
       ('Creates a boolean flag for each method of T',                    false, 2),
       ('Intersects T with `Record<string, boolean>`',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (mapped types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What built-in utility type makes all properties of an object type `readonly`?',
         '`Readonly<T>` is a mapped type that adds the `readonly` modifier to every property of `T`, preventing reassignment after initialization.',
         'Readonly<T>',
         '`Readonly<T>` makes every property of `T` readonly. Attempting to reassign a property of a `Readonly<User>` value produces a compile-time error.',
         58
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Immutable<T>',  false, 0),
       ('Const<T>',      false, 1),
       ('Frozen<T>',     false, 2),
       ('Readonly<T>',   true,  3)
     ) as c(label, is_correct, order_index);

-- Question 59 (mapped types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Required<T>` do?',
         '`Required<T>` is the opposite of `Partial<T>` — it removes the `?` modifier from every property, making them all required.',
         'Removes ? from all properties',
         '`Required<T>` makes all optional properties of `T` mandatory by removing the `?` modifier. A value of type `Required<Partial<T>>` must provide all properties.',
         59
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Restricts properties to required primitive types',      false, 0),
       ('Makes all properties optional',                         false, 1),
       ('Makes all properties readonly',                         false, 2),
       ('Makes all properties required (removes `?`)',           true,  3)
     ) as c(label, is_correct, order_index);

-- Question 60 (mapped types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a mapped type, what does adding `-?` after the key achieve?',
         'The `-?` modifier in a mapped type removes the optional (`?`) flag from each property, making them all required. This is exactly what `Required<T>` uses internally.',
         '-? removes the optional modifier',
         'Mapped type modifiers can add (`+`) or remove (`-`) the `readonly` and `?` modifiers. `-?` removes the optional modifier, making the property required. `+?` or just `?` adds it.',
         60
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Removes the optional modifier',            true,  0),
       ('Adds the optional modifier',               false, 1),
       ('Makes the property nullable',              false, 2),
       ('Deletes the property from the type',       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (conditional types & infer) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the conditional type `T extends string ? "yes" : "no"` produce when `T = number`?',
         '`number extends string` is false, so the conditional type resolves to the false branch: `"no"`.',
         '"no"',
         'Conditional types work like ternary expressions. `number extends string` is false, so `T extends string ? "yes" : "no"` evaluates to `"no"` when `T = number`.',
         61
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"yes"',   false, 0),
       ('never',   false, 1),
       ('boolean', false, 2),
       ('"no"',    true,  3)
     ) as c(label, is_correct, order_index);

-- Question 62 (conditional types & infer) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `infer` keyword do in a conditional type?',
         '`infer` introduces a new type variable inside the `extends` clause of a conditional type, allowing TypeScript to capture and reuse a portion of the matched type.',
         'Captures a type from the pattern',
         '`infer R` in a conditional type like `T extends (...args: any[]) => infer R ? R : never` tells TypeScript to capture the return type into `R` if the pattern matches. It enables extracting sub-types without knowing them in advance.',
         62
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Delays type checking to runtime',                              false, 0),
       ('Infers a generic constraint automatically',                   false, 1),
       ('Captures and names a sub-type from the matched pattern',      true,  2),
       ('Marks the conditional type as distributive',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (conditional types & infer) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `type ReturnType<T> = T extends (...args: any[]) => infer R ? R : never` extract?',
         'This is the definition of the built-in `ReturnType` utility. It matches a function type and uses `infer R` to capture the return type into `R`, returning it.',
         'The return type of a function',
         '`ReturnType<T>` uses `infer R` to capture the return type from a function type `T`. If `T` is not a function, it resolves to `never`. It is a core pattern for working with function types generically.',
         63
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The first parameter type of the function',   false, 0),
       ('The number of parameters',                   false, 1),
       ('The return type of the function',            true,  2),
       ('The this-context type',                      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (conditional types & infer) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When `T` is a union type in a distributive conditional type `T extends string ? T : never`, what happens?',
         'Conditional types are distributive over union types when the type parameter is a naked (unwrapped) union. The conditional is applied to each member of the union individually and the results are unioned.',
         'Distributed over each union member',
         'Distributive conditional types apply the condition to each member of a union separately. `"a" | 1 extends string ? T : never` becomes `("a" extends string ? "a" : never) | (1 extends string ? 1 : never)` = `"a"`.',
         64
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The conditional is applied to each union member separately', true,  0),
       ('The entire union is checked as a single type',               false, 1),
       ('The conditional always returns `never` for union types',     false, 2),
       ('TypeScript throws a compile error for union inputs',         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (conditional types & infer) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you prevent a conditional type from being distributive over a union?',
         'Wrapping the type parameter in a tuple `[T] extends [string]` disables distributivity. The condition now checks the whole union at once rather than each member separately.',
         'Wrap in tuple: [T] extends [U]',
         'Wrapping `T` in brackets — `[T] extends [string] ? ... : ...` — prevents distribution over union members. TypeScript only distributes when the checked type is a naked (unwrapped) type parameter.',
         65
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Wrap the type parameter in a tuple: `[T] extends [U]`',      true,  0),
       ('Use `extends never` instead',                                 false, 1),
       ('Add `readonly` to the conditional',                           false, 2),
       ('Distributivity cannot be disabled',                           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Pick<User, "id" | "name">` produce if `User = { id: number; name: string; email: string }`?',
         '`Pick<T, K>` creates a new type with only the specified keys from `T`. Selecting `"id" | "name"` produces `{ id: number; name: string }`, omitting `email`.',
         '{ id: number; name: string }',
         '`Pick<T, K>` extracts a subset of an object type''s properties. `Pick<User, "id" | "name">` gives `{ id: number; name: string }` — only the properties listed in the second argument.',
         66
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('{ name: string }',                            false, 0),
       ('{ email: string }',                           false, 1),
       ('{ id: number; name: string; email: string }', false, 2),
       ('{ id: number; name: string }',                true,  3)
     ) as c(label, is_correct, order_index);

-- Question 67 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Omit<User, "email">` produce if `User = { id: number; name: string; email: string }`?',
         '`Omit<T, K>` creates a type with all properties of `T` except the ones listed in `K`. Omitting `"email"` leaves `{ id: number; name: string }`.',
         '{ id: number; name: string }',
         '`Omit<T, K>` is the opposite of `Pick` — it keeps all properties except those named in `K`. `Omit<User, "email">` produces `{ id: number; name: string }`.',
         67
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('{ id: number; name: string }',                true,  0),
       ('{ email: string }',                           false, 1),
       ('{ id: number; name: string; email: string }', false, 2),
       ('never',                                       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 68 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Record<string, number>` represent?',
         '`Record<K, V>` creates an object type where keys are of type `K` and values are of type `V`. `Record<string, number>` is an object with string keys and number values.',
         'Object with string keys, number values',
         '`Record<K, V>` is equivalent to `{ [key: K]: V }`. `Record<string, number>` describes an object where any string key maps to a number — like a dictionary or lookup table.',
         68
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An array of strings and numbers',                   false, 0),
       ('A Map from string to number',                       false, 1),
       ('A tuple of [string, number]',                       false, 2),
       ('An object with string keys and number values',      true,  3)
     ) as c(label, is_correct, order_index);

-- Question 69 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Exclude<"a" | "b" | "c", "b">` produce?',
         '`Exclude<T, U>` removes from `T` all members that are assignable to `U`. Excluding `"b"` from `"a" | "b" | "c"` leaves `"a" | "c"`.',
         '"a" | "c"',
         '`Exclude<T, U>` filters a union by removing any member that extends `U`. `Exclude<"a" | "b" | "c", "b">` evaluates to `"a" | "c"` because `"b"` is removed.',
         69
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"a" | "c"', true,  0),
       ('"b"',       false, 1),
       ('"a" | "b"', false, 2),
       ('never',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Extract<"a" | "b" | "c", "a" | "b">` produce?',
         '`Extract<T, U>` keeps only the members of `T` that are assignable to `U`. Extracting `"a" | "b"` from `"a" | "b" | "c"` keeps `"a" | "b"`.',
         '"a" | "b"',
         '`Extract<T, U>` is the complement of `Exclude` — it keeps only the members of `T` that are assignable to `U`. `Extract<"a" | "b" | "c", "a" | "b">` produces `"a" | "b"`.',
         70
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"c"',       false, 0),
       ('"b" | "c"', false, 1),
       ('never',     false, 2),
       ('"a" | "b"', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 71 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Parameters<typeof fn>` return for `function fn(a: string, b: number): void`?',
         '`Parameters<T>` extracts the parameter types of a function type as a tuple. For `fn`, it produces `[a: string, b: number]`.',
         '[string, number]',
         '`Parameters<T>` returns a tuple of the parameter types of the function type `T`. For `(a: string, b: number) => void`, `Parameters` gives `[string, number]`.',
         71
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string | number',          false, 0),
       ('void',                     false, 1),
       ('{ a: string; b: number }', false, 2),
       ('[string, number]',         true,  3)
     ) as c(label, is_correct, order_index);

-- Question 72 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `NonNullable<string | null | undefined>` produce?',
         '`NonNullable<T>` removes `null` and `undefined` from the union type `T`. Applied to `string | null | undefined`, it produces just `string`.',
         'string',
         '`NonNullable<T>` is equivalent to `Exclude<T, null | undefined>`. It strips nullish types from the union, leaving `string` from `string | null | undefined`.',
         72
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('string | null',       false, 0),
       ('string | undefined',  false, 1),
       ('string',              true,  2),
       ('never',               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (utility types) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Awaited<Promise<string>>` produce?',
         '`Awaited<T>` recursively unwraps Promise types, giving the type of the resolved value. `Awaited<Promise<string>>` is `string`.',
         'string',
         '`Awaited<T>` unwraps the resolved type of a Promise, including nested promises. `Awaited<Promise<string>>` is `string`, and `Awaited<Promise<Promise<number>>>` is `number`.',
         73
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Promise<string>',  false, 0),
       ('unknown',          false, 1),
       ('any',              false, 2),
       ('string',           true,  3)
     ) as c(label, is_correct, order_index);

-- Question 74 (narrowing) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does TypeScript''s control flow narrowing do after `if (typeof x === "string")`?',
         'Inside the `if` block, TypeScript narrows `x` to type `string` based on the `typeof` check. You can safely call string methods on `x` without further casts.',
         'x is narrowed to string inside the block',
         'Control flow narrowing means TypeScript tracks type guards and adjusts the type within branches. After `if (typeof x === "string")`, the type of `x` is narrowed to `string` inside that block.',
         74
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('x is narrowed to `string` inside the if-block',               true,  0),
       ('x remains the original union type inside the block',           false, 1),
       ('x is widened to `any` for safety',                            false, 2),
       ('TypeScript requires a cast `(x as string)` even inside the block', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (narrowing) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a user-defined type guard and what is its return type annotation?',
         'A type guard function uses the `is` return type: `param is Type`. When the function returns `true`, TypeScript narrows the parameter to the specified type.',
         'param is Type',
         'A user-defined type guard is a function whose return type is a type predicate: `function isString(x: unknown): x is string { return typeof x === "string"; }`. When it returns `true`, TypeScript narrows `x` to `string`.',
         75
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('asserts param is Type',             false, 0),
       ('never',                             false, 1),
       ('boolean',                           false, 2),
       ('param is Type (type predicate)',     true,  3)
     ) as c(label, is_correct, order_index);

-- Question 76 (narrowing) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does the `in` operator narrow a type in TypeScript?',
         '`"property" in obj` checks whether a property exists on an object. TypeScript uses this to narrow union types: if the property is present, the type must be the union member that has it.',
         '"prop" in obj narrows to the member with that prop',
         'The `in` operator narrows discriminated-union-like types: `if ("radius" in shape)` tells TypeScript that inside the block, `shape` is the union member that has a `radius` property.',
         76
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It widens the type to include all possible members',          false, 0),
       ('It checks the value against an enum at runtime',              false, 1),
       ('It only works with classes, not plain objects',               false, 2),
       ('It narrows the type to union members that have the property', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 77 (narrowing) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When does `instanceof` narrowing work in TypeScript?',
         '`instanceof` narrows when the right-hand side is a class constructor. TypeScript narrows the left-hand side to the instance type of that class inside the `if` block.',
         'With class constructors — narrows to instance type',
         '`if (x instanceof Dog)` narrows `x` to type `Dog` inside the block, because `instanceof` checks the prototype chain. This only works with class constructors, not plain type aliases.',
         77
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('With class constructors — narrows to the class instance type',   true,  0),
       ('Only with interface types',                                       false, 1),
       ('Only when `strictInstanceOf` is enabled in tsconfig',            false, 2),
       ('With any object, including plain object literals',               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (narrowing) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'After a truthiness check `if (x)`, what types does TypeScript remove from `x`?',
         'A truthiness check narrows away `null`, `undefined`, `false`, `0`, `""`, and `0n` — all the falsy values — leaving only the truthy portion of the type.',
         'Removes null, undefined, false, 0, ""',
         'TypeScript''s truthiness narrowing removes falsy types from the type of `x` inside the `if` block. For `string | null | undefined`, after `if (x)`, the type is narrowed to `string` (non-empty strings are truthy).',
         78
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only `undefined`',                                        false, 0),
       ('Only `null` and `undefined`',                              false, 1),
       ('Null, undefined, false, 0, and empty string',             true,  2),
       ('Nothing — truthiness checks do not narrow in TypeScript', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (narrowing) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is an assertion function in TypeScript and how does it affect the type?',
         'An assertion function is annotated with `asserts condition`. When it returns normally (doesn''t throw), TypeScript narrows the type of the condition''s argument in the caller.',
         'asserts param is Type — narrows after call',
         'Assertion functions use `asserts x is Type` or `asserts condition` as their return type. If the function returns without throwing, TypeScript narrows `x` to the asserted type for the rest of the enclosing scope.',
         79
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It returns a boolean like a type guard',                             false, 0),
       ('It widens the type to `any` if the assertion fails',                false, 1),
       ('It only works with `unknown` types',                                false, 2),
       ('It narrows the type in the caller''s scope after the call',          true,  3)
     ) as c(label, is_correct, order_index);

-- Question 80 (enums) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What are the auto-assigned values of a numeric enum `enum Direction { Up, Down, Left, Right }`?',
         'Numeric enum members auto-increment starting from 0. `Up = 0`, `Down = 1`, `Left = 2`, `Right = 3` unless a custom starting value is specified.',
         '0, 1, 2, 3',
         'TypeScript numeric enums auto-assign incrementing integer values starting at 0 by default. `Direction.Up === 0`, `Direction.Down === 1`, and so on.',
         80
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1, 2, 3, 4',                                  false, 0),
       ('"Up", "Down", "Left", "Right"',               false, 1),
       ('0, 1, 2, 3',                                  true,  2),
       ('undefined for all members',                   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (enums) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a `const enum` and how does it differ from a regular `enum`?',
         '`const enum` members are inlined at compile time — no runtime enum object is emitted. This reduces bundle size but means you cannot iterate over the enum or use it with `Object.keys()`.',
         'Inlined at compile time — no runtime object',
         'A `const enum` has its values inlined by the compiler wherever they are used, so no enum object exists at runtime. Regular enums emit a JavaScript object that can be iterated; `const enum` does not.',
         81
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`const enum` only works with string values',                         false, 0),
       ('`const enum` generates a frozen runtime object',                     false, 1),
       ('`const enum` is deprecated in TypeScript 5',                         false, 2),
       ('`const enum` values are inlined; no runtime object is emitted',      true,  3)
     ) as c(label, is_correct, order_index);

-- Question 82 (enums) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why do many TypeScript style guides recommend avoiding enums in favour of `as const` objects?',
         'Enums emit extra JavaScript code, numeric enums have reverse mappings that can cause bugs, and enums are a TypeScript-only concept that does not exist in JavaScript. `as const` objects stay closer to plain JS.',
         'Enums emit JS; as const stays pure JS',
         'Enums generate runtime JavaScript objects and numeric enums create reverse mappings (number → name), which can be surprising. `as const` objects are plain JS with no extra emission and work transparently with `typeof`/`keyof`.',
         82
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Enums emit runtime code and numeric enums have reverse mappings',    true,  0),
       ('Enums cannot be used with generics',                                 false, 1),
       ('Enums do not support string values',                                 false, 2),
       ('`as const` objects compile faster',                                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (enums) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a string enum `enum Status { Active = "ACTIVE", Inactive = "INACTIVE" }`, what is `Status.Active`?',
         'String enum members must be given explicit string values. `Status.Active` equals the string `"ACTIVE"` at runtime.',
         '"ACTIVE"',
         'String enums require explicit string initializers. `Status.Active` evaluates to the string `"ACTIVE"` at runtime, and unlike numeric enums, string enums do not have reverse mappings.',
         83
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0',          false, 0),
       ('"Active"',   false, 1),
       ('"ACTIVE"',   true,  2),
       ('undefined',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (classes) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `private` access modifier do in TypeScript?',
         '`private` restricts access to the member to only within the declaring class. TypeScript enforces this at compile time (and `#` does so at runtime).',
         'Accessible only within the class',
         'A `private` member is accessible only within the class body. Attempting to access it from outside the class or from a subclass is a compile error. Note: TypeScript''s `private` is compile-time only; use `#` for runtime privacy.',
         84
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Accessible within the class and its subclasses', false, 0),
       ('Accessible only at compile time, not runtime',  false, 1),
       ('Accessible from anywhere',                       false, 2),
       ('Accessible only within the declaring class',     true,  3)
     ) as c(label, is_correct, order_index);

-- Question 85 (classes) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a TypeScript "parameter property" and how is it declared?',
         'A parameter property combines constructor parameter declaration and class field initialization into one. You add an access modifier before the parameter: `constructor(public name: string)` automatically creates and assigns `this.name`.',
         'Access modifier in constructor param',
         'Parameter properties are shorthand: adding `public`, `private`, `protected`, or `readonly` before a constructor parameter automatically creates a class field with the same name and assigns the value. `constructor(private id: number)` creates `this.id`.',
         85
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A constructor parameter prefixed with an access modifier',                 true,  0),
       ('A parameter annotated with a property decorator',                          false, 1),
       ('A static class property that can be overridden in subclasses',             false, 2),
       ('An optional constructor parameter with a default value',                   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (classes) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `abstract class` mean in TypeScript?',
         'An abstract class cannot be instantiated directly. It may contain abstract methods (with no body) that subclasses must implement. It serves as a base template.',
         'Cannot instantiate; subclasses must implement abstract methods',
         'An `abstract class` defines a contract for subclasses. It cannot be created with `new` directly. Abstract methods declared inside must be implemented by any non-abstract subclass.',
         86
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A class with only static methods',                                      false, 0),
       ('A class that cannot be extended',                                       false, 1),
       ('A class that cannot be instantiated; subclasses implement its methods', true,  2),
       ('A class whose methods are all `readonly`',                              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (classes) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `readonly` modifier on a class property do?',
         '`readonly` prevents assignment to the property after initialization. The property can only be set in the constructor or at the declaration site.',
         'Only assignable in constructor/declaration',
         'A `readonly` class property can be written only during initialization (declaration or constructor). After that, any assignment is a compile error. It does not freeze the object at runtime.',
         87
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The property is frozen at the JavaScript level via Object.freeze', false, 0),
       ('The property is private and cannot be read outside the class',    false, 1),
       ('The property is omitted from the emitted JavaScript',             false, 2),
       ('The property can only be assigned in constructor or declaration',  true,  3)
     ) as c(label, is_correct, order_index);

-- Question 88 (classes) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `protected` mean for a class member?',
         '`protected` allows access within the declaring class AND any subclass, but not from outside. It is stricter than `public` but more permissive than `private`.',
         'Accessible within class and subclasses',
         'A `protected` member is accessible inside the declaring class and inside any class that extends it, but not from external code. This is useful for members that subclasses need but external consumers should not use.',
         88
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Accessible from anywhere',                               false, 0),
       ('Accessible only within the declaring class',             false, 1),
       ('Accessible within the class and its subclasses',        true,  2),
       ('Accessible only via the `super` keyword',               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (modules) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `import type { Foo } from "./foo"` do differently from `import { Foo } from "./foo"`?',
         '`import type` is a type-only import. It is erased completely at compile time and never emits any runtime code. It ensures the import is used only as a type annotation.',
         'Erased at compile time — no runtime import',
         '`import type` signals that `Foo` is used only as a type. The compiler erases it entirely, producing no `require()` or `import` at runtime. This prevents accidental value usage and enables optimizations in bundlers.',
         89
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It imports only the type''s runtime constructor',         false, 0),
       ('It delays the import until the type is first used',      false, 1),
       ('It is erased at compile time and emits no runtime code', true,  2),
       ('It is identical; `type` is just a hint for developers',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (modules) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a side-effect import and when would you use one?',
         'A side-effect import (`import "./module"`) executes the module''s top-level code without binding any export to a name. Common uses: polyfills, CSS imports, or modules that register globals.',
         'import "./module" — executes but binds nothing',
         'A side-effect import runs the module but does not bind any of its exports. `import "./polyfill"` is a typical use case: the polyfill patches globals and you do not need to name anything from it.',
         90
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('import { } from "./module"',          false, 0),
       ('import type "./module"',              false, 1),
       ('import * from "./module"',            false, 2),
       ('import "./module" — no bindings',     true,  3)
     ) as c(label, is_correct, order_index);

-- Question 91 (modules) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `export type { Foo }` guarantee?',
         '`export type` marks the export as type-only. Importers using `import type` or any bundler with isolated modules support will know this export carries no runtime value.',
         'Type-only export — no runtime value emitted',
         '`export type { Foo }` explicitly marks `Foo` as a type-only export. This is required when `isolatedModules` is enabled and `Foo` is a type alias or interface, ensuring no runtime value is mistakenly imported.',
         91
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Foo is exported as a readonly constant',            false, 0),
       ('Foo is exported only to declaration files',         false, 1),
       ('Foo is exported as a default export',               false, 2),
       ('Foo is a type-only export with no runtime value',   true,  3)
     ) as c(label, is_correct, order_index);

-- Question 92 (tsconfig essentials) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does enabling `strict` in tsconfig do?',
         '`strict` is a shorthand that enables a family of strictness flags including `noImplicitAny`, `strictNullChecks`, `strictFunctionTypes`, `strictPropertyInitialization`, and others.',
         'Enables family of strict checks',
         '`"strict": true` enables multiple strict-mode compiler options at once. The most impactful are `noImplicitAny` (no implicit any types) and `strictNullChecks` (null/undefined are separate from other types).',
         92
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Makes all types readonly by default',                                   false, 0),
       ('Only enables `noImplicitAny`',                                         false, 1),
       ('Enables a family of strictness flags including `strictNullChecks`',     true,  2),
       ('Disables all type inference',                                           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (tsconfig essentials) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `strictNullChecks` change about TypeScript''s type system?',
         'With `strictNullChecks` off, `null` and `undefined` are assignable to every type. With it on, they are their own distinct types that must be explicitly included in a union or handled before use.',
         'null/undefined are distinct types',
         'With `strictNullChecks: true`, `null` and `undefined` are not automatically assignable to other types. You must explicitly write `string | null` to allow null, and narrow before using the value.',
         93
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('null and undefined become their own types separate from other types',     true,  0),
       ('All values become non-nullable by default',                               false, 1),
       ('TypeScript forbids the use of `null` entirely',                           false, 2),
       ('Only function return types are checked for null',                         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (tsconfig essentials) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `target` option in tsconfig control?',
         '`target` specifies which JavaScript version TypeScript compiles the output to — e.g. `"ES2015"`, `"ES2020"`, `"ESNext"`. It affects which syntax features are downleveled.',
         'Output JavaScript version',
         '`target` tells the TypeScript compiler which ECMAScript version to emit. Lower targets (e.g. `"ES5"`) cause more code to be downleveled (e.g. classes to functions, async/await to generators).',
         94
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The TypeScript version that compiles the project',     false, 0),
       ('The target browser''s minimum version',                false, 1),
       ('The module format: CommonJS, ESM, or UMD',            false, 2),
       ('The JavaScript output version (e.g. ES2020)',          true,  3)
     ) as c(label, is_correct, order_index);

-- Question 95 (tsconfig essentials) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `esModuleInterop: true` do in tsconfig?',
         '`esModuleInterop` enables compatibility shims that allow default imports from CommonJS modules, e.g. `import fs from "fs"` instead of `import * as fs from "fs"`.',
         'Allows default imports from CJS modules',
         '`esModuleInterop: true` adds synthetic default imports support and helper functions so you can write `import express from "express"` instead of the more verbose `import * as express from "express"` for CommonJS modules.',
         95
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Converts all imports to dynamic imports at runtime',             false, 0),
       ('Allows default imports from CommonJS modules',                    true,  1),
       ('Disables module resolution for third-party packages',            false, 2),
       ('Enables importing ESM modules from CJS files',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (tsconfig essentials) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `moduleResolution: "node"` tell the TypeScript compiler?',
         '`moduleResolution: "node"` instructs TypeScript to resolve modules using the Node.js resolution algorithm — looking in `node_modules`, respecting `package.json` `main` fields, etc.',
         'Use Node.js module resolution algorithm',
         '`moduleResolution: "node"` makes TypeScript resolve imports the same way Node.js does: checking `node_modules`, `package.json` `main`, and index files. For modern projects, `"bundler"` or `"node16"` may be preferred.',
         96
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Uses Node.js module resolution (node_modules, package.json)',  true,  0),
       ('Restricts imports to Node built-in modules only',              false, 1),
       ('Enables dynamic `require()` calls in TypeScript',              false, 2),
       ('Disables path aliases defined in tsconfig',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (declaration files) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of a `.d.ts` declaration file?',
         'A `.d.ts` file provides type information for a JavaScript module without emitting any runtime code. It describes the shape of the module''s exports so TypeScript can type-check consumers.',
         'Type-only descriptions for JS modules',
         'Declaration files (`.d.ts`) contain only type information — no runnable JavaScript. They allow TypeScript to type-check code that imports from a JS library by describing what that library exports.',
         97
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To provide a minified version of the module',                    false, 0),
       ('To declare environment variables used by the module',            false, 1),
       ('To define the module''s default export at runtime',              false, 2),
       ('To describe types for a module without emitting runtime code',   true,  3)
     ) as c(label, is_correct, order_index);

-- Question 98 (declaration files) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `declare` keyword do in a TypeScript ambient declaration?',
         '`declare` tells TypeScript that a variable, function, or module exists somewhere at runtime (e.g. provided by a global script or external library) without emitting any code for it.',
         'Tells TS the thing exists at runtime — no emit',
         '`declare const jQuery: any` tells TypeScript that `jQuery` exists at runtime without generating any JavaScript for that declaration. It is used to describe values provided by external scripts or environments.',
         98
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It exports the declaration from the current module',                            false, 0),
       ('It makes the declaration immutable',                                            false, 1),
       ('It marks the value as existing at runtime without emitting code for it',        true,  2),
       ('It declares the variable as `const` even if written as `let`',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (React + TS basics) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you type a `useState` hook to hold a `User | null` value?',
         'You pass the type argument explicitly: `useState<User | null>(null)`. The generic parameter tells TypeScript what type the state can hold, allowing `null` as the initial value.',
         'useState<User | null>(null)',
         '`useState<User | null>(null)` initialises state as `null` but declares the type as `User | null`. TypeScript then enforces that you only set state to a `User` or `null`, and you must narrow before accessing `User` properties.',
         99
  from modules where slug = 'typescript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('useState<User>(null)',              false, 0),
       ('useState(null as User)',            false, 1),
       ('useState<User | null>(null)',        true,  2),
       ('useState({ type: "User | null" })', false, 3)
     ) as c(label, is_correct, order_index);
