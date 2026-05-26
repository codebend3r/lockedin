-- 003_seed_javascript.sql
-- JavaScript module: 100 quiz questions

insert into modules (slug, name, description, type, total_questions)
values (
  'javascript',
  'JavaScript Test',
  'Brush up on JavaScript fundamentals — types, scope, async, and gotchas.',
  'dynamic',
  100
);

-- Question 0 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typeof null` return in JavaScript?',
         'This is a long-standing bug in JavaScript. `typeof null` returns `"object"` even though `null` is a primitive. The spec has never fixed this for backward-compatibility reasons.',
         '"object" (historical bug)',
         '`typeof null` returns `"object"`. This is a well-known bug in JavaScript that has been preserved for backward compatibility — null is not actually an object.',
         0
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"object"',  true,  0),
       ('"null"',    false, 1),
       ('"undefined"', false, 2),
       ('"boolean"', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typeof undefined` return?',
         '`typeof undefined` returns the string `"undefined"`. Unlike `typeof null`, this one is correct and expected.',
         '"undefined"',
         '`typeof undefined` returns `"undefined"`. This is one of the few cases where `typeof` is fully reliable with no quirks.',
         1
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"undefined"', true,  0),
       ('"null"',      false, 1),
       ('"object"',    false, 2),
       ('"void"',      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of `NaN === NaN` in JavaScript?',
         'NaN (Not-a-Number) is the only value in JavaScript that is not equal to itself. Use `Number.isNaN()` to check for NaN reliably.',
         'false — NaN never equals itself',
         '`NaN === NaN` evaluates to `false`. NaN is the only JavaScript value that is not equal to itself; use `Number.isNaN(value)` to test for it.',
         2
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('false',                 true,  0),
       ('true',                  false, 1),
       ('undefined',             false, 2),
       ('It throws a TypeError', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Number("")` return?',
         'An empty string coerces to `0` when converted to a Number. This surprises many developers who expect `NaN`.',
         '0',
         '`Number("")` returns `0`. JavaScript coerces an empty string to zero when converting to a number, which is a common source of bugs.',
         3
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0',   true,  0),
       ('NaN', false, 1),
       ('undefined', false, 2),
       ('1',   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `[] == false` evaluate to?',
         'Both sides are coerced to numbers during the abstract equality comparison. `[]` becomes `""` then `0`; `false` becomes `0`. So `0 == 0` is `true`.',
         'true (both coerce to 0)',
         '`[] == false` is `true`. Abstract equality coerces `[]` to `""` then `0`, and `false` to `0`, so the comparison becomes `0 == 0`.',
         4
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('true',                         true,  0),
       ('false',                        false, 1),
       ('It throws a TypeError',        false, 2),
       ('undefined',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `==` and `===` in JavaScript?',
         '`==` performs type coercion before comparing, which can yield surprising results. `===` compares both value and type with no coercion, making it safer and more predictable.',
         '=== checks type + value; == coerces',
         '`===` (strict equality) compares both type and value without coercion. `==` (loose equality) performs type coercion first, which can produce unexpected `true` results between different types.',
         5
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`===` checks type and value without coercion; `==` coerces types',  true,  0),
       ('They are identical in behavior',                                     false, 1),
       ('`==` is stricter than `===`',                                        false, 2),
       ('`===` only works with primitive types',                              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typeof NaN` return?',
         'Even though NaN stands for "Not-a-Number", `typeof NaN` returns `"number"`. This is because NaN is defined as a value of the Number type in the IEEE 754 spec.',
         '"number"',
         '`typeof NaN` returns `"number"`. Despite its name, NaN is part of the Number type in JavaScript (and IEEE 754), so `typeof` correctly identifies it as such.',
         6
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"NaN"',    false, 0),
       ('"undefined"', false, 1),
       ('"number"', true,  2),
       ('"object"', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (primitives & coercion) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `null == undefined` evaluate to (using `==`)?',
         'With loose equality, `null` and `undefined` are only equal to each other and to nothing else. The spec defines this special case explicitly.',
         'true',
         '`null == undefined` is `true`. The abstract equality algorithm has a special rule: `null` and `undefined` are equal to each other but not to any other value.',
         7
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('true',          true,  0),
       ('false',         false, 1),
       ('undefined',     false, 2),
       ('It throws ReferenceError', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (scope, hoisting, var/let/const) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is "hoisting" in JavaScript?',
         'Hoisting is JavaScript''s behavior of moving declarations (not initializations) to the top of their scope during the compilation phase. `var` declarations are hoisted and initialized to `undefined`; `let`/`const` are hoisted but not initialized (TDZ).',
         'declarations moved to top of scope',
         'Hoisting is JavaScript moving declarations to the top of their containing scope before execution. `var` is hoisted and set to `undefined`; `let` and `const` are hoisted but remain uninitialized in the temporal dead zone.',
         8
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Variables are automatically assigned their final value at parse time',  false, 0),
       ('Declarations are moved to the top of their scope before execution',    true,  1),
       ('Functions are copied into every scope that uses them',                  false, 2),
       ('The engine runs code from the bottom of the file upward',              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (scope, hoisting, var/let/const) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the Temporal Dead Zone (TDZ)?',
         'Variables declared with `let` or `const` are hoisted to the top of their block scope but cannot be accessed before their declaration line is reached — this region is the TDZ. Accessing them throws a `ReferenceError`.',
         'TDZ: let/const exist but are inaccessible before declaration',
         'The Temporal Dead Zone is the period between the start of a block scope and the point where a `let` or `const` variable is declared. Accessing the variable in the TDZ throws a `ReferenceError`.',
         9
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A time when the garbage collector runs',                                          false, 0),
       ('The period before a `let`/`const` declaration where accessing it throws ReferenceError', true, 1),
       ('When `var` variables are undefined before assignment',                            false, 2),
       ('A special zone where `null` and `undefined` behave the same way',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (scope, hoisting, var/let/const) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you reassign a `const` variable? Can you mutate an object declared with `const`?',
         '`const` prevents reassignment of the binding, but the value it points to can still be mutated if it is an object or array. The binding is constant, not the contents.',
         'no reassign; yes mutate object',
         '`const` prevents reassignment of the variable binding, so you cannot point it to a new value. However, if the value is an object or array, its properties or elements can still be mutated.',
         10
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both reassignment and mutation are forbidden',                      false, 0),
       ('Reassignment is forbidden; mutation of object properties is allowed', true, 1),
       ('Both reassignment and mutation are allowed',                         false, 2),
       ('Reassignment is allowed; mutation is forbidden',                     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (scope, hoisting, var/let/const) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What scope does `var` use?',
         '`var` is function-scoped (or globally scoped if declared outside a function). It does not respect block boundaries like `if` or `for` loops. `let` and `const` are block-scoped.',
         'function scope (not block scope)',
         '`var` declarations are function-scoped: they are visible throughout the entire function in which they appear, ignoring block boundaries such as `if` statements and `for` loops.',
         11
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Block scope',    false, 0),
       ('Module scope',   false, 1),
       ('Lexical scope',  false, 2),
       ('Function scope', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 12 (scope, hoisting, var/let/const) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Consider this code: `for (var i = 0; i < 3; i++) { setTimeout(() => console.log(i), 0); }` — what is logged?',
         'Because `var` is function-scoped, there is only one `i` shared by all three callbacks. By the time the timeouts fire, the loop has completed and `i` is `3`. Using `let` creates a new binding per iteration.',
         '3, 3, 3 (shared var)',
         'The code logs `3 3 3`. With `var`, all closures share the same `i`. By the time `setTimeout` callbacks run, the loop has ended and `i` is `3`. Using `let` instead would log `0 1 2`.',
         12
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0, 1, 2', false, 0),
       ('3, 3, 3', true,  1),
       ('0, 0, 0', false, 2),
       ('undefined, undefined, undefined', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (scope, hoisting, var/let/const) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What value does a `var` declaration have before its assignment line is reached?',
         'Hoisted `var` declarations are initialized to `undefined`. The declaration is moved to the top of the function scope, but the assignment stays in place.',
         'undefined',
         'A hoisted `var` variable is initialized to `undefined` before its assignment line executes. Reading it before assignment yields `undefined`, not a `ReferenceError`.',
         13
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('null',        false, 0),
       ('undefined',   true,  1),
       ('0',           false, 2),
       ('It throws a ReferenceError', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (closures) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a closure in JavaScript?',
         'A closure is a function that retains access to variables from its outer (enclosing) scope even after that outer function has returned. The inner function "closes over" those variables.',
         'function retaining access to outer scope variables',
         'A closure is a function that remembers and can access variables from its surrounding lexical scope even after that scope has finished executing. This enables patterns like data privacy and factory functions.',
         14
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A function with no return value',                                              false, 0),
       ('A function that retains access to its outer scope''s variables after the outer function returns', true, 1),
       ('A function that is immediately invoked',                                       false, 2),
       ('A function stored as a property of an object',                                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (closures) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does this factory function return: `function makeCounter() { let n = 0; return () => ++n; }`?',
         'Each call to `makeCounter()` creates a new closure with its own `n`. The returned arrow function increments and returns that private `n` each time it is called.',
         'a function that increments a private counter',
         '`makeCounter()` returns an arrow function that closes over the private variable `n`. Each time the returned function is called, `n` increments by 1. Each `makeCounter()` call has its own independent `n`.',
         15
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A function that always returns 0',                          false, 0),
       ('A function that increments and returns a private counter',  true,  2),
       ('The number 1',                                              false, 1),
       ('undefined',                                                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (closures) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is an IIFE?',
         'An Immediately Invoked Function Expression (IIFE) is a function that is defined and called in the same expression: `(function() { ... })()`. It was commonly used to create private scope before block-scoped `let`/`const` existed.',
         'function defined and called immediately',
         'An IIFE (Immediately Invoked Function Expression) is a function expression that executes as soon as it is defined. It creates its own scope, historically used to avoid polluting the global namespace.',
         16
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An Immediately Invoked Function Expression — defined and called at once',   true,  0),
       ('An Inherited Internal Function Expression',                                  false, 1),
       ('A function that only runs inside a module',                                  false, 2),
       ('A function that can only be called once',                                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (closures) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do closures enable data privacy in JavaScript?',
         'By defining variables inside an outer function and only returning inner functions that access them, those variables are inaccessible from the outside. They are "private" to the closure.',
         'outer variables unreachable from outside',
         'Closures enable data privacy by keeping variables in an outer function''s scope that is only reachable through the returned inner functions. External code cannot directly access or modify those variables.',
         17
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('By using `private` keyword on variables',                                            false, 0),
       ('By freezing the object with `Object.freeze`',                                        false, 1),
       ('By using `Symbol` keys that can''t be enumerated',                                   false, 2),
       ('By keeping variables in an outer function scope inaccessible to outside code',       true,  3)
     ) as c(label, is_correct, order_index);

-- Question 18 (closures) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a closure, does the inner function capture the variable''s value or its reference?',
         'Closures capture the variable by reference, not by value. If the outer variable changes after the closure is created, the closure sees the new value. This is why the classic `var` loop bug produces unexpected results.',
         'by reference (live binding)',
         'A closure captures a live reference to the variable, not a snapshot of its value. Changes to the outer variable after the closure is created are reflected when the closure reads it.',
         18
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The value at the time the closure is created',  false, 0),
       ('A deep copy of the variable',                    false, 1),
       ('A live reference to the variable',               true,  2),
       ('A frozen snapshot of the entire scope',          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (closures) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How can you fix the classic `var` loop closure bug so each callback logs its own iteration index?',
         'Using `let` instead of `var` creates a new binding per iteration, so each closure captures a different `i`. Alternatively, an IIFE or `bind` can snapshot the value, but `let` is the modern idiomatic fix.',
         'use `let` instead of `var`',
         'Replace `var` with `let` in the loop declaration. `let` creates a fresh binding for each iteration, so each closure captures a distinct `i`. This is the simplest and most readable fix.',
         19
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Replace `var` with `let` in the loop',           true,  0),
       ('Use `var` but add `"use strict"`',               false, 1),
       ('Use `const` in the loop',                        false, 2),
       ('Wrap the entire loop in `try`/`catch`',          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (`this` binding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `this` refer to inside a regular function called without any explicit receiver (in non-strict mode)?',
         'In non-strict mode, a plain function call sets `this` to the global object (`window` in browsers, `global` in Node.js). In strict mode, `this` is `undefined` in that scenario.',
         'global object (non-strict)',
         'A regular function called without an explicit receiver uses the global object as `this` in non-strict mode. In strict mode, `this` would be `undefined` in the same scenario.',
         20
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('undefined',                            false, 0),
       ('null',                                 false, 1),
       ('The global object',                    true,  2),
       ('The function itself',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (`this` binding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does an arrow function use for `this`?',
         'Arrow functions do not have their own `this`. They inherit `this` from the enclosing lexical scope at the time they are defined. This makes them useful for callbacks where you want to preserve `this` from the outer context.',
         'lexical `this` from enclosing scope',
         'Arrow functions have no own `this` binding. They capture `this` from the surrounding lexical scope where they are defined, making them ideal for callbacks that need to reference the outer `this`.',
         21
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The global object always',                                         false, 0),
       ('The object that called the arrow function',                        false, 1),
       ('`this` from the enclosing lexical scope (no own `this`)',          true,  2),
       ('`undefined` always',                                               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (`this` binding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When a function is called with `new`, what does `this` refer to?',
         'The `new` keyword creates a brand-new empty object, sets `this` to that object inside the constructor, and implicitly returns it (unless the constructor explicitly returns a different object).',
         'the newly created object',
         'Calling a function with `new` creates a fresh object, binds `this` to it inside the constructor, and returns that object. This is the basis of the constructor pattern in JavaScript.',
         22
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The newly created object',               true,  0),
       ('The prototype of the function',          false, 1),
       ('The global object',                      false, 2),
       ('undefined',                              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (`this` binding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `call`, `apply`, and `bind`?',
         '`call` and `apply` both invoke a function immediately with an explicit `this`. `call` passes arguments individually; `apply` passes them as an array. `bind` returns a new function with `this` permanently set, without calling it immediately.',
         'call/apply invoke now; bind returns new function',
         '`call(thisArg, arg1, arg2)` and `apply(thisArg, [args])` both invoke immediately with a given `this`. `bind(thisArg)` returns a new permanently-bound function without calling it.',
         23
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are all identical; just different names',                                                  false, 0),
       ('`call`/`apply` invoke immediately; `bind` returns a new bound function',                        true,  2),
       ('`bind` invokes immediately; `call`/`apply` return new functions',                               false, 1),
       ('`apply` can only be used on arrays',                                                            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (`this` binding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why does a method passed to `setTimeout` lose its `this`?',
         'When you pass `obj.method` to `setTimeout`, you are passing the function reference without the object. When the callback fires, it is called as a plain function, so `this` is the global object (or `undefined` in strict mode).',
         'plain function call loses receiver',
         'Passing `obj.method` to `setTimeout` detaches it from `obj`. When the callback fires, there is no receiver, so `this` defaults to the global object. Fix it with `setTimeout(() => obj.method(), 0)` or `bind`.',
         24
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`setTimeout` clears `this` on all callbacks',                             false, 0),
       ('The function reference is detached from its object, so `this` becomes the global object', true, 1),
       ('Arrow functions inside `setTimeout` always lose `this`',                  false, 2),
       ('`this` is set to `null` inside timer callbacks by the browser',           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (`this` binding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `this` refer to when a method is called on an object, e.g. `obj.greet()`?',
         'Implicit binding: when a function is called as a method with a dot receiver, `this` inside the function refers to the object to the left of the dot — `obj` in this case.',
         'the object before the dot',
         'With implicit binding, `this` refers to the object that the method is called on — the object to the left of the dot. So in `obj.greet()`, `this` is `obj`.',
         25
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The global object',                    false, 0),
       ('undefined',                            false, 1),
       ('The function itself',                  false, 2),
       ('`obj` — the object before the dot',    true,  3)
     ) as c(label, is_correct, order_index);

-- Question 26 (arrow vs regular functions) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can an arrow function be used as a constructor with `new`?',
         'Arrow functions cannot be used as constructors. They have no `prototype` property and no own `this`, so calling one with `new` throws a `TypeError`.',
         'no — TypeError with `new`',
         'Arrow functions cannot be called with `new`. They lack a `prototype` property and do not have their own `this` binding, so the runtime throws a `TypeError` if you attempt `new arrowFn()`.',
         26
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, exactly like a regular function',                              false, 0),
       ('Yes, but only in strict mode',                                      false, 1),
       ('No — arrow functions cannot be used as constructors',               true,  2),
       ('Yes, if they have a `return` statement',                            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (arrow vs regular functions) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Do arrow functions have an `arguments` object?',
         'Arrow functions do not have their own `arguments` object. If you reference `arguments` inside an arrow function, it refers to the `arguments` of the nearest enclosing non-arrow function. Use rest parameters (`...args`) instead.',
         'no own `arguments`; use rest params',
         'Arrow functions do not bind their own `arguments` object. Referencing `arguments` inside one reaches the enclosing non-arrow function''s `arguments`. The modern alternative is rest parameters: `(...args) => {}`.',
         27
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, same as regular functions',                                  false, 0),
       ('Yes, but it is always empty',                                     false, 1),
       ('No — they inherit `arguments` from the enclosing function',       true,  3),
       ('Only in non-strict mode',                                         false, 2)
     ) as c(label, is_correct, order_index);

-- Question 28 (arrow vs regular functions) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the key reason to use an arrow function inside a class method that sets up an event listener?',
         'Because arrow functions inherit `this` from the enclosing lexical scope, using an arrow function as an event-listener callback preserves `this` as the class instance without needing `.bind(this)`.',
         'inherits class `this`; no bind needed',
         'Arrow functions capture `this` from where they are defined, so using one inside a class method as an event callback preserves `this` as the class instance. A regular function would need `.bind(this)` to achieve the same.',
         28
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Arrow functions run faster than regular functions',                   false, 0),
       ('Arrow functions preserve `this` from the enclosing scope without `bind`', true, 1),
       ('Arrow functions automatically remove the event listener after one call', false, 2),
       ('Arrow functions have access to the event object by default',          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (arrow vs regular functions) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Do arrow functions have a `prototype` property?',
         'Arrow functions do not have a `prototype` property. This is directly related to why they cannot be used as constructors — `new` needs a `prototype` to set up the prototype chain.',
         'no `prototype`',
         'Arrow functions have no `prototype` property. Regular functions get a `prototype` object automatically, which is used by `new` to wire up the prototype chain. Since arrow functions lack it, they cannot be constructors.',
         29
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, identical to regular functions',              false, 0),
       ('Yes, but it is always `null`',                     false, 1),
       ('No — arrow functions have no `prototype`',         true,  2),
       ('Only when defined inside a class',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Array.prototype.map` return?',
         '`map` returns a new array of the same length, where each element is the result of the callback function. It does not mutate the original array.',
         'new array of transformed values',
         '`map` creates and returns a new array containing the return value of the callback for each element. The original array is not modified.',
         30
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A new array of transformed values',            true,  0),
       ('The original array, mutated in place',         false, 1),
       ('undefined',                                    false, 2),
       ('A boolean indicating success',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Array.prototype.filter` return when no elements pass the test?',
         '`filter` always returns an array. If no elements pass the predicate, it returns an empty array `[]`, never `null` or `undefined`.',
         'empty array []',
         '`filter` returns a new array containing only elements for which the callback returns truthy. When none pass, it returns `[]` — an empty array, never `null`.',
         31
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('null',              false, 0),
       ('undefined',         false, 1),
       ('false',             false, 2),
       ('An empty array []', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 32 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `[1,2,3].reduce((acc, x) => acc + x, 0)` return?',
         '`reduce` accumulates a single value by applying the callback to each element and the running accumulator. Starting from `0`, adding `1`, `2`, and `3` gives `6`.',
         '6',
         '`reduce` applies `(acc, x) => acc + x` sequentially: `0+1=1`, `1+2=3`, `3+3=6`. The final accumulated value is `6`.',
         32
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('6',       true,  0),
       ('[1,2,3]', false, 1),
       ('3',       false, 2),
       ('0',       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `forEach` and `map`?',
         '`forEach` iterates and returns `undefined`; it is for side effects. `map` returns a new array of the callback''s return values. You cannot chain `forEach` but you can chain `map`.',
         'forEach returns undefined; map returns new array',
         '`forEach` executes a callback for each element and always returns `undefined` — it is used for side effects. `map` transforms each element and returns a new array of the results.',
         33
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical',                                                       false, 0),
       ('`forEach` returns `undefined`; `map` returns a new array',                 true,  1),
       ('`forEach` mutates the array; `map` does not',                              false, 2),
       ('`map` mutates the array; `forEach` does not',                              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Array.prototype.find` return if no element matches?',
         '`find` returns the first element for which the callback returns truthy. If no element matches, it returns `undefined`.',
         'undefined',
         '`find` returns the first matching element, or `undefined` if none is found. Unlike `filter`, it stops at the first match and returns the value itself, not an array.',
         34
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('-1',        false, 0),
       ('null',      false, 1),
       ('false',     false, 2),
       ('undefined', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 35 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `[1, [2, [3]]].flat()` return by default?',
         '`flat()` with no argument (or depth 1) flattens one level. It turns `[1, [2, [3]]]` into `[1, 2, [3]]`. To flatten all levels, use `flat(Infinity)`.',
         '[1, 2, [3]] — one level deep',
         '`flat()` defaults to depth 1, flattening one level of nesting. `[1, [2, [3]]]` becomes `[1, 2, [3]]`. Use `flat(Infinity)` to fully flatten all nesting.',
         35
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('[1, 2, [3]]',  true,  0),
       ('[1, 2, 3]',    false, 1),
       ('[1, [2, [3]]]', false, 2),
       ('[[1, 2], 3]',  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which array method mutates the original array?',
         '`splice` changes the contents of an array in place by removing or inserting elements and mutates the original. `map`, `filter`, and `slice` all return new arrays without mutating the original.',
         'splice (in-place mutation)',
         '`splice` mutates the original array by removing, replacing, or inserting elements in place. `map`, `filter`, and `slice` are non-mutating — they return new arrays.',
         36
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('map',    false, 0),
       ('filter', false, 1),
       ('slice',  false, 2),
       ('splice', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 37 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Array(3).map(x => 1)` return?',
         '`Array(3)` creates a sparse array with 3 empty slots. `map` skips empty slots, so no callback is invoked. The result is still a sparse array with 3 holes, not `[1, 1, 1]`.',
         'sparse array — map skips holes',
         '`Array(3)` creates a sparse array of length 3 with no actual elements. `map` (and `filter`, `forEach`) skip empty slots, so the callback is never called. The result is `[ <3 empty items> ]`, not `[1, 1, 1]`.',
         37
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('[1, 1, 1]',                            false, 0),
       ('A sparse array with 3 empty slots',    true,  1),
       ('[undefined, undefined, undefined]',    false, 2),
       ('It throws a TypeError',                false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Array.prototype.some` do?',
         '`some` returns `true` if at least one element passes the callback test; otherwise `false`. It short-circuits as soon as a match is found.',
         'true if any element passes',
         '`some` iterates over elements and returns `true` if the callback returns truthy for at least one element. It stops early once a match is found. If no element matches, it returns `false`.',
         38
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns true only if ALL elements pass the test',   false, 0),
       ('Returns true if AT LEAST ONE element passes',       true,  1),
       ('Returns the first matching element',                false, 2),
       ('Returns the count of matching elements',            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (arrays) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `flatMap` do differently from `map` followed by `flat`?',
         '`flatMap` is equivalent to `map` followed by `flat(1)` — it maps each element and flattens one level. It is slightly more efficient because it combines the two operations into one pass.',
         'map + flat(1) in one pass',
         '`flatMap` applies a mapping function to each element and then flattens the result by one level. It is equivalent to `arr.map(fn).flat(1)` but marginally more efficient as a single operation.',
         39
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It maps and flattens all nesting levels',         false, 0),
       ('It is identical to `map` — no difference',       false, 1),
       ('It maps then flattens only one level deep',       true,  3),
       ('It flattens first, then maps',                    false, 2)
     ) as c(label, is_correct, order_index);

-- Question 40 (objects) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does object destructuring with a default look like, and when is the default used?',
         'Syntax: `const { a = 10 } = obj`. The default is used only when the property is `undefined` — not when it is `null` or `false` or `0`.',
         'default used when property is `undefined`',
         'In `const { a = 10 } = obj`, the default value `10` is used only when `obj.a` is `undefined`. Any other falsy value like `null`, `0`, or `false` does NOT trigger the default.',
         40
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('When the property is `undefined`',          true,  0),
       ('When the property is any falsy value',      false, 1),
       ('When the property is `null` or `undefined`', false, 2),
       ('When the property does not exist in the prototype', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (objects) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Object.keys(obj)` return?',
         '`Object.keys` returns an array of the object''s own enumerable string-keyed property names. It does not include inherited properties or Symbol keys.',
         'array of own enumerable string keys',
         '`Object.keys(obj)` returns an array of strings containing the names of the object''s own enumerable properties. Symbol-keyed and inherited properties are excluded.',
         41
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All keys including inherited ones',              false, 0),
       ('Own enumerable string keys as an array',         true,  1),
       ('All Symbol keys',                                false, 2),
       ('The count of own properties',                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (objects) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the spread operator do when used with objects: `{ ...a, ...b }`?',
         'Object spread creates a new object containing shallow copies of all own enumerable properties of `a` and `b`. If both have a key with the same name, `b`''s value wins (later spread wins).',
         'shallow merge; last writer wins',
         'Spreading objects creates a new object with all own enumerable properties of each source. Properties from later sources overwrite earlier ones with the same key. It is a shallow copy — nested objects are not deep-cloned.',
         42
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Deep merges `a` and `b` recursively',                         false, 0),
       ('Throws if `a` and `b` have overlapping keys',                 false, 1),
       ('Creates a shallow merge; later source wins on key conflicts',  true,  3),
       ('Creates a reference to both objects',                          false, 2)
     ) as c(label, is_correct, order_index);

-- Question 43 (objects) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What are computed property names in object literals?',
         'Computed property names let you use an expression inside square brackets as a key: `{ [expr]: value }`. The expression is evaluated at runtime to produce the key name.',
         '`[expr]` as a dynamic key name',
         'Computed property names use the syntax `{ [expr]: value }`, where `expr` is evaluated at runtime to become the property key. This allows dynamic key names based on variables or expressions.',
         43
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Using `[expr]` as a property key, evaluated at runtime',              true,  0),
       ('Properties that compute their value lazily',                          false, 1),
       ('Properties defined on the prototype chain',                           false, 2),
       ('Properties accessed through `Object.defineProperty`',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (objects) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Object.entries(obj)` return?',
         '`Object.entries` returns an array of `[key, value]` pairs for the object''s own enumerable string-keyed properties. It is useful for iterating over an object''s properties with `for...of`.',
         'array of [key, value] pairs',
         '`Object.entries(obj)` returns an array of `[key, value]` pairs for each own enumerable string property. Combined with destructuring and `for...of`, it enables clean object iteration.',
         44
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An array of just the keys',                   false, 0),
       ('An array of `[key, value]` pairs',            true,  1),
       ('An array of just the values',                 false, 2),
       ('An iterator over key-value pairs',            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (objects) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the rest syntax do in object destructuring: `const { a, ...rest } = obj`?',
         'The rest syntax collects all remaining own enumerable properties of `obj` that were not explicitly destructured into a new object called `rest`.',
         'collects remaining properties into new object',
         'In `const { a, ...rest } = obj`, `a` gets `obj.a` and `rest` is a new object containing all other own enumerable properties of `obj`. The rest element must always be last.',
         45
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Collects remaining own enumerable properties into a new object',    true,  0),
       ('Creates a reference to the entire original object',                  false, 1),
       ('Spreads `obj` into a new array',                                     false, 2),
       ('Throws if `obj` has more than one remaining property',               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (prototypes & classes) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Object.create(proto)` do?',
         '`Object.create(proto)` creates a new object whose internal `[[Prototype]]` is set to `proto`. It is a direct way to set up prototype-based inheritance without constructors.',
         'new object with given prototype',
         '`Object.create(proto)` returns a new empty object whose `[[Prototype]]` is `proto`. Properties looked up on the new object that do not exist on it are found by walking the prototype chain to `proto`.',
         46
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Copies all properties from `proto` to a new object',         false, 0),
       ('Creates a new object with `proto` as its prototype',         true,  1),
       ('Creates a deep clone of `proto`',                            false, 2),
       ('Freezes `proto` and returns it',                             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (prototypes & classes) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a JavaScript class, what does `super()` do in a subclass constructor?',
         '`super()` calls the parent class''s constructor. It must be called before accessing `this` in a derived class constructor; otherwise a `ReferenceError` is thrown.',
         'calls parent constructor; required before `this`',
         '`super()` in a subclass constructor invokes the parent class''s constructor, which initializes the parent portion of the object and sets up `this`. It must be called before any `this` usage in the derived constructor.',
         47
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Calls the parent class''s constructor; required before `this`',   true,  0),
       ('Copies the parent''s properties onto `this`',                     false, 1),
       ('Creates a new instance of the parent class',                       false, 2),
       ('Returns the prototype of the subclass',                            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (prototypes & classes) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the prototype chain in JavaScript?',
         'When a property is not found on an object, the engine looks at the object''s `[[Prototype]]`, then its prototype''s prototype, and so on until `null` is reached. This chain of prototypes is the prototype chain.',
         'chain of [[Prototype]] links for property lookup',
         'The prototype chain is the series of `[[Prototype]]` links followed when looking up a property. If a property isn''t on the object itself, JavaScript walks up the chain until it finds the property or reaches `null`.',
         48
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The series of `[[Prototype]]` links searched during property lookup',      true,  0),
       ('The list of all functions in the call stack',                              false, 1),
       ('The inheritance tree of classes in a program',                             false, 2),
       ('The order in which constructors are called',                               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (prototypes & classes) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `class` syntax in JavaScript actually create under the hood?',
         'JavaScript classes are syntactic sugar over prototypal inheritance. A `class` declaration still creates a constructor function and sets up the prototype chain — it does not introduce a new object model.',
         'constructor function + prototype chain (syntactic sugar)',
         '`class` is syntactic sugar for constructor functions and prototype-based inheritance. Behind the scenes, the class body methods are added to the constructor''s `prototype`, and `extends` wires up the prototype chain.',
         49
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A completely new object system separate from prototypes',                       false, 0),
       ('A compiled bytecode class similar to Java classes',                             false, 1),
       ('Syntactic sugar over constructor functions and the prototype chain',             true,  2),
       ('An immutable record type',                                                       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (prototypes & classes) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `__proto__` and `prototype`?',
         '`prototype` is a property of constructor functions used to set up the prototype chain for instances. `__proto__` is the actual internal `[[Prototype]]` link on an instance object, pointing to the constructor''s `prototype`.',
         '`prototype` on constructors; `__proto__` on instances',
         '`prototype` exists on constructor functions and becomes the `[[Prototype]]` of instances created with `new`. `__proto__` is the non-standard accessor on instances that exposes their internal `[[Prototype]]` link.',
         50
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`prototype` is on constructor functions; `__proto__` is the instance''s link',       true,  0),
       ('They are identical',                                                                  false, 1),
       ('`__proto__` is on constructor functions; `prototype` is on instances',               false, 2),
       ('Both are deprecated and should never be used',                                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a Promise represent?',
         'A Promise represents the eventual result of an asynchronous operation. It can be in one of three states: pending, fulfilled, or rejected. Once settled (fulfilled or rejected) it cannot change state.',
         'eventual result of async op (pending/fulfilled/rejected)',
         'A Promise is an object representing the eventual completion or failure of an asynchronous operation. It starts as pending and settles to either fulfilled (with a value) or rejected (with a reason), and never changes state after settling.',
         51
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A synchronous wrapper around callback functions',             false, 0),
       ('The eventual result of an async op — pending, fulfilled, or rejected', true, 1),
       ('A function that delays execution by a given number of ms',   false, 2),
       ('An object that can only resolve, never reject',              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Promise.all([p1, p2, p3])` do if one promise rejects?',
         '`Promise.all` rejects immediately when any input promise rejects, and the rejection reason is the error from that first rejection. The other promises are not cancelled, but their results are ignored.',
         'rejects immediately on first rejection',
         '`Promise.all` rejects as soon as any of its input promises rejects. The resulting rejection reason is the error of the first rejection. Successfully resolved values from other promises are discarded.',
         52
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It rejects immediately with the first rejection reason',                 true,  0),
       ('It waits for all promises to settle then returns all results',           false, 1),
       ('It resolves with the values that succeeded',                             false, 2),
       ('It throws a synchronous error',                                          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Promise.allSettled` return compared to `Promise.all`?',
         '`Promise.allSettled` waits for ALL promises to settle (whether fulfilled or rejected) and returns an array of result objects with `status`, `value`, or `reason`. It never short-circuits on rejection.',
         'waits for all; returns status objects',
         '`Promise.allSettled` waits for every promise to settle and returns an array of objects like `{ status: "fulfilled", value }` or `{ status: "rejected", reason }`. Unlike `Promise.all`, it does not reject early.',
         53
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It rejects on the first rejection like `Promise.all`',                   false, 0),
       ('It resolves with only the fulfilled values',                             false, 1),
       ('It waits for all to settle and returns `{ status, value/reason }` for each', true, 3),
       ('It is identical to `Promise.all`',                                       false, 2)
     ) as c(label, is_correct, order_index);

-- Question 54 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Promise.race([p1, p2])` return?',
         '`Promise.race` returns a promise that settles with the same outcome (fulfilled or rejected) as the first promise in the array to settle, regardless of whether it fulfilled or rejected.',
         'settles with first settled promise (either way)',
         '`Promise.race` returns a promise that mirrors the first promise to settle. If the first to settle is rejected, `race` rejects; if fulfilled, it fulfills with that value.',
         54
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns the first promise to fulfill, ignoring rejections',              false, 0),
       ('Returns an array of all settled values',                                 false, 1),
       ('Settles with the outcome of the first promise to settle',                true,  2),
       ('Runs all promises in sequence',                                          false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `return promise` and `return await promise` inside an async function?',
         'Without `await`, the function returns the promise itself (errors thrown in it are not caught by the function''s `try/catch`). With `await`, the function waits for the promise to settle, so rejections are caught by the surrounding `try/catch`.',
         'await lets try/catch catch the rejection',
         'Returning a promise without `await` passes it out of the async function directly — a rejection won''t be caught by that function''s `try/catch`. `return await` suspends until settlement, so a rejection IS caught locally.',
         55
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are identical in all cases',                                           false, 0),
       ('`return await` allows local `try/catch` to catch rejections; bare `return` does not', true, 1),
       ('`return await` is slower because it adds an extra microtask',               false, 2),
       ('`return` resolves the promise synchronously; `return await` does not',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `async` in front of a function declaration do?',
         'An `async` function always returns a Promise. If the function returns a non-Promise value, it is automatically wrapped in `Promise.resolve(value)`. This lets the caller use `.then()` or `await` on it.',
         'always returns a Promise',
         'Marking a function `async` makes it always return a Promise. A returned non-Promise value is wrapped in `Promise.resolve()`. It also unlocks the `await` keyword inside the function body.',
         56
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Makes the function run in a separate thread',                    false, 0),
       ('Enables the `yield` keyword inside the function',                false, 1),
       ('Makes the function always return a Promise',                     true,  2),
       ('Prevents the function from throwing errors',                     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you catch errors from an `await` expression?',
         'Wrap the `await` in a `try/catch` block. If the awaited promise rejects, the rejection is thrown as an exception and caught by `catch`. Alternatively, chain `.catch()` on the promise before awaiting.',
         'try/catch around await',
         'Use a `try { const val = await promise; } catch (err) { }` block. When the promise rejects, the rejection is surfaced as a thrown error at the `await` point and caught by `catch`.',
         57
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Use `.catch()` on the `async` function declaration',            false, 0),
       ('Errors cannot be caught from `await`',                         false, 1),
       ('Wrap the `await` in a `try/catch` block',                      true,  3),
       ('Use `window.onerror`',                                          false, 2)
     ) as c(label, is_correct, order_index);

-- Question 58 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `.then(onFulfilled, onRejected)` return?',
         '`.then()` always returns a new Promise. The returned promise resolves with whatever `onFulfilled` returns (or rejects with whatever `onRejected` throws), enabling chaining.',
         'a new Promise',
         '`.then()` returns a new Promise that resolves with the return value of `onFulfilled` or rejects with whatever `onRejected` throws. This is what enables promise chaining.',
         58
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The original promise',                     false, 0),
       ('A new Promise',                            true,  1),
       ('The resolved value directly',              false, 2),
       ('undefined',                               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if you `await` a non-Promise value like `await 42`?',
         '`await` on a non-thenable value simply wraps it in `Promise.resolve(42)` and immediately resolves. The expression still yields to the microtask queue briefly but resolves with `42`.',
         'resolves immediately with that value',
         '`await 42` is equivalent to `await Promise.resolve(42)`. It resolves immediately with `42`. While it does yield to the microtask queue, it is effectively a no-op await that returns the value.',
         59
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Throws a TypeError',                                     false, 0),
       ('Suspends indefinitely',                                  false, 1),
       ('Returns `undefined`',                                    false, 2),
       ('Wraps it in `Promise.resolve` and resolves immediately', true,  3)
     ) as c(label, is_correct, order_index);

-- Question 60 (promises & async/await) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is top-level `await` and where can it be used?',
         'Top-level `await` lets you use `await` outside of an `async` function at the module''s top level. It is only available in ES modules (files with `type: "module"` or `.mjs`), not in CommonJS.',
         'await at module top level (ESM only)',
         'Top-level `await` allows `await` to appear outside an `async` function, directly in the body of an ES module. It is not available in CommonJS (`require`-style) modules.',
         60
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`await` used without a promise; available everywhere',               false, 0),
       ('`await` at module top level, available only in ES modules',          true,  1),
       ('`await` used inside a `try` block at the top of an async function',  false, 2),
       ('`await` on `Promise.all`, available in CommonJS and ESM',            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (error handling) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Does a `finally` block run if the `try` block has a `return` statement?',
         'Yes. `finally` always executes after `try` (and `catch` if applicable), even if there is a `return` or `throw` in `try`. If `finally` itself returns a value, it overrides the `try`''s return value.',
         'yes — always runs',
         '`finally` always executes, regardless of `return`, `throw`, or normal exit from `try`/`catch`. If `finally` has its own `return`, that value overrides any value returned by `try` or `catch`.',
         61
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — `finally` is skipped if `try` returns normally',        false, 0),
       ('Only if the `return` value is `undefined`',                  false, 1),
       ('Yes — `finally` always executes',                            true,  2),
       ('Only if `catch` also has a `return`',                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (error handling) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you `throw` any value in JavaScript, or only `Error` instances?',
         'You can `throw` any value — strings, numbers, objects, or `Error` instances. However, best practice is to always `throw` an `Error` (or subclass) because it captures a stack trace.',
         'any value; best practice is Error instances',
         'JavaScript allows `throw` of any value including primitives. However, throwing an `Error` instance (or a subclass) is best practice because it provides a message, stack trace, and consistent interface.',
         62
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only `Error` instances — anything else causes a TypeError',     false, 0),
       ('Any value can be thrown',                                        true,  3),
       ('Only strings and Error instances',                               false, 1),
       ('Only objects',                                                   false, 2)
     ) as c(label, is_correct, order_index);

-- Question 63 (error handling) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a `ReferenceError` in JavaScript?',
         'A `ReferenceError` is thrown when code tries to access a variable that has not been declared or is not in scope — for example, reading a variable before declaring it with `let`/`const` (TDZ).',
         'accessing an undeclared or TDZ variable',
         'A `ReferenceError` occurs when you reference a variable that doesn''t exist in the current scope — such as using an undeclared identifier or accessing a `let`/`const` in its temporal dead zone.',
         63
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Accessing a property on `null` or `undefined`',            false, 0),
       ('Accessing an undeclared or TDZ variable',                  true,  1),
       ('Calling a non-function as a function',                     false, 2),
       ('Attempting to parse invalid JSON',                         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (event loop / microtasks vs macrotasks) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which runs first after synchronous code finishes: a `Promise.then` callback or a `setTimeout` callback?',
         'Promise `.then` callbacks are microtasks and run before any macrotasks (like `setTimeout`). The microtask queue is drained completely after each task before the next macrotask is picked up.',
         'Promise.then (microtask) before setTimeout (macrotask)',
         'Microtasks (Promise `.then`, `queueMicrotask`) run before macrotasks (`setTimeout`, `setInterval`). After the current synchronous task finishes, the engine drains the microtask queue before executing the next macrotask.',
         64
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`setTimeout` — it is always scheduled first',              false, 0),
       ('`Promise.then` — microtasks run before macrotasks',        true,  2),
       ('They run in the order they were registered',               false, 1),
       ('It depends on the browser implementation',                 false, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (event loop / microtasks vs macrotasks) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the event loop?',
         'The event loop continuously checks if the call stack is empty and, if so, picks the next task from the task queue (macrotask queue) to execute. It is what allows JavaScript to be non-blocking despite being single-threaded.',
         'picks tasks when call stack is empty',
         'The event loop monitors the call stack. When the stack is empty, it dequeues the next macrotask and pushes it onto the stack to execute. Microtasks are always flushed between macrotasks.',
         65
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A loop that runs JavaScript code in a separate thread',                         false, 0),
       ('A loop that constantly polls the DOM for changes',                              false, 1),
       ('A mechanism that picks tasks from the queue when the call stack is empty',      true,  2),
       ('The interval at which `setInterval` fires',                                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (event loop / microtasks vs macrotasks) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What order do these log? `console.log("A"); setTimeout(() => console.log("B"), 0); Promise.resolve().then(() => console.log("C")); console.log("D");`',
         'Synchronous code runs first: A, D. Then microtasks: C (Promise.then). Then macrotasks: B (setTimeout). Order: A, D, C, B.',
         'A, D, C, B',
         '"A" and "D" log synchronously. The Promise `.then` callback ("C") is a microtask and runs before the `setTimeout` callback ("B"), which is a macrotask. Result: A, D, C, B.',
         66
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A, B, C, D', false, 0),
       ('A, D, B, C', false, 1),
       ('A, D, C, B', true,  2),
       ('A, C, D, B', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (event loop / microtasks vs macrotasks) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Are `async/await` continuations (code after an `await`) run as microtasks or macrotasks?',
         'Code that resumes after an `await` is scheduled as a microtask. This means it runs before any pending `setTimeout` or other macrotasks, consistent with `.then` callback behavior.',
         'microtasks',
         'After an `await`, the continuation is enqueued as a microtask. It will run before any pending macrotasks (`setTimeout`, I/O callbacks), just like a `.then` handler.',
         67
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Macrotasks — same as `setTimeout`',                 false, 0),
       ('Microtasks — same as `.then` handlers',             true,  3),
       ('They run synchronously on the same tick',           false, 1),
       ('It depends on whether the awaited value was already resolved', false, 2)
     ) as c(label, is_correct, order_index);

-- Question 68 (event loop / microtasks vs macrotasks) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the call stack in JavaScript?',
         'The call stack is a LIFO (last-in, first-out) data structure that tracks currently executing function calls. When a function is called it is pushed; when it returns it is popped. A stack overflow occurs when it exceeds its limit.',
         'LIFO stack of active function calls',
         'The call stack tracks which functions are currently executing. Each function call pushes a frame; each return pops it. It is LIFO — the last called is the first to complete. Recursive depth errors are call stack overflows.',
         68
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A LIFO structure tracking currently executing functions',   true,  0),
       ('A queue of async callbacks waiting to run',                 false, 1),
       ('The list of all declared variables in scope',               false, 2),
       ('The memory heap where objects are stored',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (event loop / microtasks vs macrotasks) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens if you queue microtasks inside a microtask (e.g., `.then` inside `.then`)?',
         'Microtasks are processed until the microtask queue is completely empty before the event loop moves to the next macrotask. So chained `.then` calls all run to completion before any macrotask fires — this can starve macrotasks.',
         'microtask queue drains fully (can starve macrotasks)',
         'Microtasks added during microtask processing are added to the same queue and processed before any macrotask runs. The entire microtask queue is drained before the next macrotask, so deeply chained `.then` callbacks can delay macrotasks.',
         69
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are converted to macrotasks automatically',                               false, 0),
       ('They are dropped to prevent infinite loops',                                    false, 1),
       ('They run before the next macrotask; the queue drains fully first',             true,  2),
       ('They run in the next macrotask tick',                                           false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (modules ESM) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between a named export and a default export in ES modules?',
         'A module can have many named exports (using `export { name }` or `export const name`) and at most one `export default`. Named exports are imported with the exact name in braces; default exports are imported without braces under any name.',
         'named: braces, exact name; default: no braces, any name',
         'Named exports are imported with their exact name in curly braces: `import { foo } from ...`. A default export is imported without braces under any name: `import anything from ...`. A module can have many named exports but only one default.',
         70
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Named: imported with braces and exact name; default: imported without braces',   true,  0),
       ('They are the same — just different syntax',                                      false, 1),
       ('Default exports can only export functions',                                       false, 2),
       ('Named exports cannot be renamed on import',                                      false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (modules ESM) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Are ES module `import` declarations hoisted?',
         'Yes. `import` declarations are hoisted and evaluated before any other code in the module. This is different from `require()` in CommonJS, which runs at the point it appears.',
         'yes — evaluated before module code runs',
         '`import` statements are hoisted to the top of the module and processed before any other code executes. This is a key difference from CommonJS `require()`, which is a synchronous call that runs in-line.',
         71
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('No — they run in the order they appear, like `require()`',   false, 0),
       ('Yes — `import` declarations are hoisted and run first',       true,  2),
       ('Only if the module is marked `async`',                        false, 1),
       ('Only named imports are hoisted; default imports are not',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (modules ESM) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `import()` (dynamic import) return?',
         'Dynamic `import()` is a function-like expression that returns a Promise that resolves to the module''s namespace object. It allows lazy, conditional loading of modules at runtime.',
         'a Promise resolving to the module namespace',
         '`import("./module.js")` returns a Promise. When the module loads, the promise resolves to the module''s namespace object (with all its exports as properties). It enables code splitting and lazy loading.',
         72
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A Promise that resolves to the module namespace object',              true,  0),
       ('The module exports synchronously',                                    false, 1),
       ('undefined — it runs the module as a side effect',                     false, 2),
       ('A callback that is called with the module exports',                   false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (modules ESM) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Can you use `import` statements inside an `if` block?',
         'No. Static `import` declarations must appear at the top level of a module and cannot be inside conditionals, loops, or functions. For conditional imports, use dynamic `import()` which is an expression, not a declaration.',
         'no; use dynamic import() for conditional loading',
         'Static `import` declarations are only allowed at the top level of an ES module. To conditionally load a module, use `import()` (dynamic import), which is a regular expression and can appear anywhere.',
         73
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, `import` works anywhere in the file',                                    false, 0),
       ('No — static `import` must be at the top level; use dynamic `import()` instead', true, 3),
       ('Yes, but only in strict mode',                                                 false, 1),
       ('Yes, inside `if` but not inside loops',                                       false, 2)
     ) as c(label, is_correct, order_index);

-- Question 74 (DOM essentials) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `document.querySelector(selector)` return if no element matches?',
         '`querySelector` returns the first matching element, or `null` if none is found. It does not throw an error when there is no match.',
         'null',
         '`document.querySelector()` returns the first element in the document that matches the given CSS selector, or `null` if no match exists. It never throws for a non-matching selector.',
         74
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('undefined',              false, 0),
       ('An empty NodeList',      false, 1),
       ('null',                   true,  2),
       ('It throws an error',     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (DOM essentials) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `event.target` and `event.currentTarget`?',
         '`event.target` is the element that originally dispatched (triggered) the event. `event.currentTarget` is the element the event listener is attached to. They differ during event bubbling — `currentTarget` is the listener''s element, `target` may be a descendant.',
         'target = origin; currentTarget = listener element',
         '`event.target` is the innermost element that triggered the event. `event.currentTarget` is the element on which the event listener is registered. During bubbling, `currentTarget` changes as the event propagates, while `target` stays constant.',
         75
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are always the same element',                                                        false, 0),
       ('`target` is the listener element; `currentTarget` is the triggering element',            false, 1),
       ('`target` is the element that triggered the event; `currentTarget` is where the listener is attached', true, 2),
       ('`currentTarget` is always the document root',                                             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (DOM essentials) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is event delegation?',
         'Event delegation attaches a single listener to a parent element instead of many listeners on individual children. You check `event.target` inside the handler to determine which child was clicked. This is efficient and works for dynamically added children.',
         'one parent listener handles events from many children',
         'Event delegation uses bubbling: you attach one listener to a parent element and inspect `event.target` to react to events on specific child elements. It reduces memory use and handles dynamically created elements automatically.',
         76
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Attaching one listener per child element',                               false, 0),
       ('A pattern where a parent handles events bubbled from children',          true,  3),
       ('Stopping event propagation at the element that was clicked',             false, 1),
       ('Delegating DOM updates to a virtual DOM',                                false, 2)
     ) as c(label, is_correct, order_index);

-- Question 77 (DOM essentials) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `addEventListener` third argument `{ once: true }` do?',
         'The `{ once: true }` option causes the event listener to be automatically removed after it fires once. Equivalent to manually calling `removeEventListener` inside the handler.',
         'listener auto-removed after first invocation',
         'Passing `{ once: true }` as the third argument to `addEventListener` registers a listener that automatically removes itself after being invoked once, without needing to call `removeEventListener` manually.',
         77
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The listener fires once per second',                               false, 0),
       ('The listener captures instead of bubbles',                         false, 1),
       ('The listener is automatically removed after firing once',          true,  2),
       ('The listener is fired during the capture phase only',              false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (JSON gotchas) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `JSON.stringify` do with a property whose value is `undefined`?',
         '`JSON.stringify` omits properties with `undefined` values entirely (they are not JSON-serializable). It also omits Symbol-keyed properties and properties whose values are functions.',
         'omits the property entirely',
         '`JSON.stringify` silently omits object properties whose value is `undefined`, as well as function and Symbol values. The key-value pair does not appear in the output string at all.',
         78
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Serializes it as the string "undefined"',       false, 0),
       ('Serializes it as `null`',                       false, 1),
       ('Omits the property from the output entirely',   true,  3),
       ('Throws a TypeError',                            false, 2)
     ) as c(label, is_correct, order_index);

-- Question 79 (JSON gotchas) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `JSON.parse("invalid")` do?',
         '`JSON.parse` throws a `SyntaxError` when given invalid JSON. Always wrap it in `try/catch` when parsing untrusted input.',
         'throws SyntaxError',
         '`JSON.parse` throws a `SyntaxError` if the input string is not valid JSON. You should always use `try/catch` when parsing JSON from an external source.',
         79
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns `null`',             false, 0),
       ('Returns `undefined`',        false, 1),
       ('Returns the string as-is',   false, 2),
       ('Throws a SyntaxError',       true,  3)
     ) as c(label, is_correct, order_index);

-- Question 80 (JSON gotchas) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `JSON.stringify({ a: 1 }, null, 2)` produce?',
         'The third argument to `JSON.stringify` is the indent level. Passing `2` produces a pretty-printed JSON string with 2-space indentation, making it human-readable.',
         'pretty-printed JSON with 2-space indent',
         'The third argument to `JSON.stringify` controls indentation. `2` means use 2 spaces per level, producing a multi-line, human-readable JSON string. `null` as the second arg means no replacer.',
         80
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A minified JSON string with no whitespace',              false, 0),
       ('A JSON string truncated to 2 characters',               false, 1),
       ('A pretty-printed JSON string with 2-space indentation',  true,  2),
       ('It throws because `null` is not a valid replacer',       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (Map / Set) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What type of keys can a `Map` use, compared to a plain object?',
         'A `Map` can use any value as a key — objects, functions, primitives — while plain objects only support string and Symbol keys (other values are coerced to strings). This makes `Map` more flexible for key-value storage.',
         'any value (objects, functions, primitives)',
         '`Map` accepts any value as a key, including objects and functions, with no coercion. Plain objects coerce non-string keys to strings, leading to key collisions. `Map` avoids this problem.',
         81
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Only strings, same as plain objects',                      false, 0),
       ('Only strings and numbers',                                 false, 1),
       ('Any value including objects and functions',                true,  3),
       ('Only objects',                                             false, 2)
     ) as c(label, is_correct, order_index);

-- Question 82 (Map / Set) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does a `Set` guarantee about its elements?',
         'A `Set` stores unique values — duplicates are silently ignored. Uniqueness is determined by the SameValueZero algorithm (similar to `===`, except `NaN === NaN` is treated as equal).',
         'unique values only; duplicates ignored',
         'A `Set` only stores unique values. Adding a duplicate is a no-op. Uniqueness uses SameValueZero — like `===` but with `NaN` considered equal to itself.',
         82
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Each value appears only once (no duplicates)',       true,  0),
       ('All elements are stored in sorted order',            false, 1),
       ('Elements are stored as key-value pairs',            false, 2),
       ('Throws if you add a duplicate value',               false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (Map / Set) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Does `JSON.stringify` serialize a `Map` or `Set` correctly?',
         'No. `JSON.stringify` does not know how to serialize `Map` or `Set`. A `Map` becomes `{}` and a `Set` becomes `[]` — both effectively empty. You must manually convert them first.',
         'no — Map becomes {}, Set becomes []',
         '`JSON.stringify` cannot serialize `Map` or `Set` natively. A `Map` serializes to `{}` and a `Set` to `[]`. Convert a `Map` with `Object.fromEntries` or spread a `Set` to an array before stringifying.',
         83
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, they serialize as JSON objects and arrays naturally',         false, 0),
       ('Only `Set` serializes; `Map` throws',                             false, 1),
       ('No — `Map` becomes `{}` and `Set` becomes `[]`',                  true,  2),
       ('Both throw a TypeError during serialization',                     false, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (Map / Set) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you get the number of entries in a `Map`?',
         '`Map` has a `.size` property (not `.length`) that returns the number of key-value pairs. Plain objects have no direct equivalent — you use `Object.keys(obj).length`.',
         'map.size',
         '`Map` exposes a `.size` property that holds the number of entries. Unlike arrays, it does not use `.length`. `Set` also uses `.size`.',
         84
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('map.length',           false, 0),
       ('map.count',            false, 1),
       ('Object.keys(map).length', false, 2),
       ('map.size',             true,  3)
     ) as c(label, is_correct, order_index);

-- Question 85 (regex basics) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `g` flag do on a regular expression?',
         'The `g` (global) flag makes the regex search for all matches rather than stopping at the first. It also causes `lastIndex` to be advanced after each match, which can cause confusing behavior if the regex object is reused.',
         'matches all occurrences (global)',
         'The `g` flag enables global matching: methods like `String.matchAll` and `RegExp.exec` in a loop find all matches. It also advances `lastIndex` after each match, so reusing a `g` regex across calls can produce unexpected results.',
         85
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Finds all matches instead of stopping at the first',            true,  0),
       ('Makes the regex case-insensitive',                              false, 1),
       ('Makes the regex match across multiple lines',                   false, 2),
       ('Matches only at the start of the string',                       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (regex basics) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `regex.test(str)` return?',
         '`test` returns a boolean — `true` if the regex matches anywhere in the string, `false` otherwise. It is the simplest way to check for a pattern match.',
         'boolean — true if match found',
         '`regex.test(str)` returns `true` if the pattern matches anywhere in `str`, and `false` otherwise. Use it for simple yes/no pattern checks. Be careful with stateful `g` regexes as `lastIndex` is updated.',
         86
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The matched substring or null',          false, 0),
       ('An array of all matches',               false, 1),
       ('A boolean — true if the pattern matches', true, 3),
       ('The index of the first match',           false, 2)
     ) as c(label, is_correct, order_index);

-- Question 87 (regex basics) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between creating a regex as a literal `/pattern/` vs `new RegExp("pattern")`?',
         'Regex literals are parsed at compile time and are more concise. `new RegExp(str)` is evaluated at runtime and is useful when the pattern is built from a variable. Both produce `RegExp` objects; the difference is when and how they are parsed.',
         'literal: compile-time; RegExp(): runtime, dynamic',
         'Regex literals (`/pattern/`) are parsed when the script is compiled. `new RegExp(string)` is created at runtime, allowing dynamic patterns built from variables. Use `new RegExp` when the pattern is not known ahead of time.',
         87
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They produce different types — literal is a string, `RegExp()` is an object', false, 0),
       ('Literals are parsed at compile time; `new RegExp()` at runtime for dynamic patterns', true, 1),
       ('Literals support flags; `RegExp()` does not',                                 false, 2),
       ('`new RegExp()` is always faster',                                             false, 3)
     ) as c(label, is_correct, order_index);

-- Question 88 (common pitfalls) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `for...in` and `for...of`?',
         '`for...in` iterates over an object''s enumerable property keys (strings), including inherited ones. `for...of` iterates over the values of any iterable (arrays, strings, Maps, Sets). Using `for...in` on arrays is a common pitfall because it can include non-index properties.',
         'for...in: keys; for...of: values of iterables',
         '`for...in` loops over enumerable property keys and can include inherited properties — avoid it for arrays. `for...of` loops over values of any iterable (arrays, Maps, Sets, strings) and is the safe modern choice.',
         88
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`for...in` iterates values; `for...of` iterates keys',                              false, 0),
       ('`for...in` iterates enumerable keys; `for...of` iterates values of iterables',      true,  2),
       ('They are identical for arrays',                                                      false, 1),
       ('`for...of` only works on arrays; `for...in` works on all objects',                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (common pitfalls) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `0.1 + 0.2 !== 0.3` in JavaScript?',
         'JavaScript uses IEEE 754 double-precision floating-point, which cannot exactly represent `0.1` or `0.2` in binary. Their sum is actually `0.30000000000000004`. Use `Number.EPSILON` comparisons or a rounding utility for precision.',
         'IEEE 754 floating-point representation error',
         '`0.1 + 0.2` equals `0.30000000000000004` due to binary floating-point representation limits in IEEE 754. Neither `0.1` nor `0.2` can be exactly represented in binary, so their sum has rounding error.',
         89
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('JavaScript uses integer math internally',                                  false, 0),
       ('This is a bug that was fixed in ES6',                                      false, 1),
       ('IEEE 754 binary floating-point cannot exactly represent these decimals',   true,  3),
       ('Division by zero causes this result',                                      false, 2)
     ) as c(label, is_correct, order_index);

-- Question 90 (common pitfalls) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `parseInt("08", 10)` return, and why is the second argument important?',
         'With radix `10`, `parseInt("08", 10)` correctly returns `8`. Without the radix, older engines might interpret a leading zero as octal (base 8), where `8` is invalid. Always pass the radix.',
         '8; radix prevents octal misinterpretation',
         '`parseInt("08", 10)` returns `8`. The second argument (radix) is critical: without it, some engines parse strings starting with `0` as octal, where digit `8` is invalid and the result could be `0`. Always specify the radix.',
         90
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0 — "08" is always parsed as octal',                           false, 0),
       ('8 — the radix 10 ensures decimal parsing',                     true,  1),
       ('NaN — "08" is never valid in any base',                        false, 2),
       ('It throws a RangeError',                                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (common pitfalls) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you push to an array while iterating it with `forEach`?',
         'If you push new elements to the array during a `forEach`, the callback will visit those newly added elements because `forEach` determines the range at the start but reads the array live. This can be surprising but it is spec-defined behavior.',
         'newly pushed elements ARE visited by forEach',
         '`forEach` reads the live array as it iterates. Elements pushed during iteration are visited because `forEach` accesses each index as it goes, and new elements appear at indices beyond the original length.',
         91
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It throws a ConcurrentModificationError',                        false, 0),
       ('The new elements are visited during the same iteration',         true,  2),
       ('The new elements are always ignored during the current iteration', false, 1),
       ('The iteration restarts from index 0',                            false, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (common pitfalls) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typeof []` return?',
         '`typeof []` returns `"object"`. Arrays are objects in JavaScript, so `typeof` does not distinguish them. Use `Array.isArray([])` to reliably detect arrays.',
         '"object" — use Array.isArray()',
         '`typeof []` returns `"object"` because arrays are a subtype of object. To detect arrays specifically, use `Array.isArray(value)` which returns `true` only for actual arrays.',
         92
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('"array"',   false, 0),
       ('"object"',  true,  1),
       ('"function"', false, 2),
       ('"iterable"', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a `Symbol` in JavaScript?',
         'A `Symbol` is a unique, immutable primitive value. Every call to `Symbol()` produces a guaranteed-unique value. Symbols are useful as property keys that cannot accidentally clash with string keys.',
         'unique immutable primitive for unique keys',
         '`Symbol()` creates a unique, immutable primitive. No two `Symbol()` calls produce equal values. Symbols used as object property keys do not appear in `for...in` loops or `Object.keys`, making them useful for internal or library-level properties.',
         93
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A string prefixed with `#`',                                  false, 0),
       ('A unique, immutable primitive value often used as object keys', true, 2),
       ('An object used for cryptographic hashing',                    false, 1),
       ('A reference to a private class field',                        false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Object.freeze(obj)` do?',
         '`Object.freeze` makes an object non-extensible and makes all existing properties non-writable and non-configurable. However, it is shallow — nested objects are not frozen and can still be mutated.',
         'shallow freeze — prevents adding/changing props on top level',
         '`Object.freeze(obj)` prevents adding, deleting, or modifying properties on `obj`. But it only affects the top-level object — nested objects remain mutable. For deep immutability you need to recursively freeze.',
         94
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Deeply freezes the object and all nested objects',                             false, 0),
       ('Prevents property changes on the top-level object only (shallow)',             true,  1),
       ('Makes the object read-only but still allows adding new properties',            false, 2),
       ('Converts the object into an immutable Map',                                    false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the optional chaining operator `?.` do?',
         'Optional chaining short-circuits and returns `undefined` if the value before `?.` is `null` or `undefined`, instead of throwing a `TypeError`. It avoids verbose null checks like `obj && obj.foo && obj.foo.bar`.',
         'returns undefined instead of throwing on null/undefined',
         '`obj?.prop` returns `undefined` if `obj` is `null` or `undefined`, instead of throwing a `TypeError`. It enables safe deep property access without chaining manual null checks.',
         95
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Throws only in strict mode when accessing null properties', false, 0),
       ('Returns `null` when a property does not exist',             false, 1),
       ('Short-circuits to `undefined` when the receiver is null/undefined', true, 2),
       ('Provides default values like `??`',                         false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the nullish coalescing operator `??` return?',
         '`a ?? b` returns `b` only when `a` is `null` or `undefined`. Unlike `||`, it does NOT fall back for other falsy values like `0`, `false`, or `""`. This makes it safer for default values.',
         'right side only when left is null/undefined',
         '`a ?? b` evaluates to `b` only if `a` is `null` or `undefined`. A value of `0`, `false`, or `""` on the left side does NOT trigger the fallback, unlike `||` which treats all falsy values as triggers.',
         96
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns the right side for any falsy left side',              false, 0),
       ('Returns the right side only when the left is null/undefined', true,  3),
       ('Throws if the left side is undefined',                        false, 1),
       ('Always returns a boolean',                                    false, 2)
     ) as c(label, is_correct, order_index);

-- Question 97 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `Number.isInteger(3.0)` return?',
         '`Number.isInteger(3.0)` returns `true` because `3.0` is mathematically an integer — it has no fractional part. JavaScript does not distinguish `3` from `3.0` at runtime.',
         'true',
         '`Number.isInteger(3.0)` returns `true`. In JavaScript, `3.0 === 3` — there is no separate integer type. `Number.isInteger` returns `true` for any finite number with no fractional part.',
         97
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('false — 3.0 is a float',    false, 0),
       ('true',                      true,  1),
       ('It throws a TypeError',     false, 2),
       ('NaN',                       false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `"use strict"` enable in a JavaScript file or function?',
         'Strict mode opts into a restricted variant of JavaScript that catches common mistakes: undeclared variables throw `ReferenceError`, `this` in plain function calls is `undefined`, duplicate parameter names are forbidden, and more.',
         'strict mode: safer, catches common mistakes',
         '"use strict" enables strict mode, which makes several previously silent errors throw exceptions, disallows undeclared variables, sets `this` to `undefined` in plain calls, and prevents other unsafe patterns.',
         98
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Enables TypeScript-style type checking at runtime',                        false, 0),
       ('Makes all variables `const` by default',                                   false, 1),
       ('Enables a restricted mode that catches common errors and bans unsafe patterns', true, 2),
       ('Disables the event loop',                                                  false, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (misc) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a generator function and what does `yield` do?',
         'A generator function (declared with `function*`) returns a Generator object. Execution pauses at each `yield` expression, producing a value. Calling `.next()` resumes execution until the next `yield` or `return`.',
         'function* pauses at yield; .next() resumes',
         'A generator (`function*`) is a function that can pause execution at `yield` and resume later. Each `yield` produces a value. Calling `.next()` on the returned iterator resumes the function until the next `yield` or the function ends.',
         99
  from modules where slug = 'javascript'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A function that auto-runs on import',                                   false, 0),
       ('A function that always returns an array of values',                     false, 1),
       ('A `function*` that pauses at `yield` and resumes with `.next()`',      true,  3),
       ('A function that yields control to the event loop on every call',        false, 2)
     ) as c(label, is_correct, order_index);
