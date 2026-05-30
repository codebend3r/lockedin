-- 008_seed_c.sql
-- C modules: split into three difficulty levels (16 / 65 / 19 questions). Module rows are in 006_seed_more_modules.sql.

-- ============================================================
-- c-1
-- ============================================================

-- Question 0 [orig 0] (sizeof char) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `sizeof(char)` always evaluate to in standard C?',
         '`sizeof(char)` is defined by the C standard to be exactly `1`, regardless of platform. All other `sizeof` results are expressed in units of `char`.',
         '1',
         '`sizeof(char)` is always 1 by definition of the C standard.',
         0
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0', false, 0),
       ('1', true, 1),
       ('8', false, 2),
       ('Implementation-defined', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 6] (sizeof pointer) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'On a typical 64-bit platform, what is `sizeof(char *)`?',
         'On a 64-bit data model (LP64/LLP64), pointers are 64 bits = 8 bytes. The size of all data pointers is the same on common platforms.',
         '8 (on 64-bit)',
         'Pointer size depends on the platform; on 64-bit it is typically 8 bytes.',
         1
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', false, 0),
       ('4', false, 1),
       ('8', true, 2),
       ('Same as `sizeof(char)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 11] (short-circuit &&) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `if (p != NULL && p->x > 0)`, what guarantees `p->x` is safe to evaluate?',
         'The `&&` operator short-circuits: if the left operand is false (here `p == NULL`), the right operand is not evaluated. There is a sequence point between them.',
         '`&&` short-circuits',
         '`&&` evaluates left-to-right and skips the right side if the left is false.',
         2
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Operator precedence', false, 0),
       ('Short-circuit evaluation of `&&`', true, 1),
       ('The compiler reorders the operands', false, 2),
       ('Both operands are always evaluated', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 12] (bitwise AND) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `0x0F & 0xF0` in C?',
         'Bitwise AND combines corresponding bits. `0x0F` is `0000 1111` and `0xF0` is `1111 0000`; their AND has no overlapping bits set, yielding `0`.',
         '`0x00`',
         'Bitwise AND keeps only bits set in both operands.',
         3
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0xFF`', false, 0),
       ('`0xF0`', false, 1),
       ('`0x0F`', false, 2),
       ('`0x00`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 13] (left shift) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the value of `1 << 4` in C?',
         'Left shift by N multiplies by 2^N. `1 << 4` equals `2^4 = 16`.',
         '16',
         '`x << N` shifts `x`''s bits left by `N`, equivalent to multiplying by `2^N`.',
         4
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('4', false, 0),
       ('8', false, 1),
       ('16', true, 2),
       ('32', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 15] (XOR) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which bitwise operator returns 1 only when the two operand bits differ?',
         'XOR (`^`) returns 1 only when the operand bits differ. It is the basis of the classic (but unsafe with aliasing) XOR swap trick.',
         '`^` (XOR)',
         '`^` is bitwise XOR: 1 when bits differ, 0 when they match.',
         5
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`&`', false, 0),
       ('`|`', false, 1),
       ('`^`', true, 2),
       ('`~`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 18] (unary ~) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For `unsigned char x = 0x0F;`, what is `(unsigned char)(~x)`?',
         '`~x` flips every bit. After promotion to `int` and conversion back to `unsigned char`, `0x0F` becomes `0xF0`.',
         '`0xF0`',
         '`~` is bitwise NOT: flips all bits of its operand.',
         6
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`0x00`', false, 0),
       ('`0xFF`', false, 1),
       ('`0xF0`', true, 2),
       ('`0x0F`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 20] (address-of) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which operator yields the address of a variable?',
         'The unary `&` operator returns the address of its operand. Its operand must be an lvalue (or function designator).',
         '`&` (address-of)',
         '`&x` produces a pointer to `x`.',
         7
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`*`', false, 0),
       ('`&`', true, 1),
       ('`->`', false, 2),
       ('`#`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 21] (dereference) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `int x = 42; int *p = &x;`, what does `*p` evaluate to?',
         'Unary `*` dereferences the pointer, yielding the lvalue that `p` points at, here the value of `x`.',
         '42',
         '`*p` reads the value at the address held by `p`.',
         8
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The address of `x`', false, 0),
       ('42', true, 1),
       ('The address of `p`', false, 2),
       ('Garbage value', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 23] (NULL) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `NULL` in C?',
         '`NULL` is a macro (commonly defined as `((void*)0)` or `0`) representing a null pointer constant. Dereferencing it is undefined behavior.',
         'A null pointer constant macro',
         '`NULL` represents a null pointer constant; dereferencing it is undefined behavior.',
         9
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A reserved keyword', false, 0),
       ('A null pointer constant macro', true, 1),
       ('Always equal to the integer 1', false, 2),
       ('A special structure type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 38] (strlen) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `strlen("hello")` return?',
         '`strlen` returns the number of characters before the terminating null byte; it does not include the null terminator.',
         '5 (excludes null terminator)',
         '`strlen` returns characters up to but not including the null terminator.',
         10
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('5', true, 0),
       ('6', false, 1),
       ('4', false, 2),
       ('Depends on the platform', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 39] (strcpy danger) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the major hazard of `strcpy`?',
         '`strcpy` performs no bounds checking and copies until it finds the null terminator. If the source is longer than the destination buffer, it overflows the destination — a classic buffer overflow.',
         'No bounds checking (buffer overflow)',
         '`strcpy` has no bounds checking and can overflow the destination buffer.',
         11
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It does not copy the null terminator', false, 0),
       ('It performs no bounds checking', true, 1),
       ('It allocates new memory', false, 2),
       ('It is only available in C99', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 41] (strcmp equal) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `strcmp` return when the two strings compare equal?',
         '`strcmp` returns `0` when the strings are equal, a negative value when the first differing byte in `s1` is less than in `s2`, and positive otherwise.',
         '0 when equal',
         '`strcmp` returns 0 for equal strings, negative/positive for less/greater.',
         12
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', false, 0),
       ('A non-zero value', false, 1),
       ('0', true, 2),
       ('The length of the strings', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 46] (string definition) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In C, a "string" is defined as:',
         'In C, a "string" is a contiguous sequence of characters terminated by a null byte (`\0`). Standard library functions like `strlen` rely on this convention.',
         'NUL-terminated char sequence',
         'A C string is a contiguous, null-terminated sequence of `char`.',
         13
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Any array of `char`', false, 0),
       ('A length-prefixed byte buffer', false, 1),
       ('A `char *` pointing to anything', false, 2),
       ('A contiguous sequence of `char` terminated by `\0`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 78] (recursion base case) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'A recursive function without a reachable base case will most likely:',
         'Without a base case (or with one that is never reached), recursion will not terminate and will exhaust the call stack, typically causing a stack overflow.',
         'Stack overflow',
         'Recursion without a reachable base case exhausts the call stack and overflows.',
         14
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Run forever without errors', false, 0),
       ('Overflow the call stack', true, 1),
       ('Be optimized into a loop by the standard', false, 2),
       ('Leak heap memory', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 83] (scanf address-of) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In `scanf("%d", &x);`, why is `&x` required (not just `x`)?',
         '`scanf` writes into the object you pass; it needs a pointer to the destination. Passing `x` would pass its value, leaving `scanf` no way to update it.',
         '`scanf` needs a pointer to write into',
         '`scanf` writes through pointers; you must pass `&x`, not `x`.',
         15
  from modules where slug = 'c-1'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('To take the value of `x`', false, 0),
       ('Because `scanf` needs a pointer to write through', true, 1),
       ('Because `%d` requires an address as input', false, 2),
       ('To bypass `const`', false, 3)
     ) as c(label, is_correct, order_index);

-- ============================================================
-- c-2
-- ============================================================

-- Question 0 [orig 1] (integer promotion) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In an expression like `char a = 1; char b = 2; a + b`, what is the type of the result of `a + b`?',
         'Operands of type `char` or `short` are promoted to `int` before arithmetic. This is called integer promotion and applies even though both operands are `char`.',
         '`int` (via integer promotion)',
         'Integer promotion converts `char`/`short` operands to `int` before arithmetic.',
         0
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`char`', false, 0),
       ('`short`', false, 1),
       ('`int`', true, 2),
       ('`unsigned char`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 3] (unsigned overflow) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `unsigned int x = 0; x = x - 1;`, what is the resulting value of `x` on a 32-bit `unsigned int`?',
         'Unsigned arithmetic in C is defined to wrap modulo 2^N. For 32-bit `unsigned int`, `0 - 1` becomes `UINT_MAX` = 4294967295.',
         '`UINT_MAX` (e.g., 4294967295)',
         'Unsigned subtraction wraps modulo 2^N, so `0u - 1u` is `UINT_MAX`.',
         1
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('-1', false, 0),
       ('0', false, 1),
       ('4294967295', true, 2),
       ('Undefined behavior', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 4] (sizeof unary) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about `sizeof` is correct?',
         '`sizeof` is a compile-time operator for everything except VLAs (variable-length arrays), where it is evaluated at runtime. Its result has type `size_t`.',
         'Compile-time except for VLAs',
         '`sizeof` is a compile-time operator returning `size_t`, except on VLAs where it is evaluated at runtime.',
         2
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It always evaluates its operand at runtime', false, 0),
       ('It is a function defined in `<stdlib.h>`', false, 1),
       ('It is a compile-time operator except for VLAs', true, 2),
       ('It always returns `int`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 5] (signed vs unsigned compare) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is printed by `int a = -1; unsigned b = 1; printf("%d", a < b);`?',
         'When mixing `int` and `unsigned int`, the `int` is converted to `unsigned`. `-1` becomes `UINT_MAX`, which is greater than `1`, so `a < b` is false (0).',
         '0 (because `a` is converted to unsigned)',
         'Comparing `int` and `unsigned` converts the `int` to unsigned, often producing surprising results.',
         3
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', false, 0),
       ('0', true, 1),
       ('-1', false, 2),
       ('Implementation-defined', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 7] (char signedness) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Is plain `char` signed or unsigned in standard C?',
         'Plain `char` may be signed or unsigned depending on the implementation. Only `signed char` and `unsigned char` are guaranteed to have those signednesses.',
         'Implementation-defined',
         'Whether plain `char` is signed or unsigned is implementation-defined.',
         4
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always signed', false, 0),
       ('Always unsigned', false, 1),
       ('Implementation-defined', true, 2),
       ('Always equal to `int` width', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 8] (int min width) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the minimum width guaranteed by the C standard for `int`?',
         'C guarantees `int` is at least 16 bits wide. For an exact 32-bit type use `int32_t` from `<stdint.h>`.',
         'At least 16 bits',
         '`int` must be at least 16 bits; for exact widths use `<stdint.h>` types.',
         5
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('At least 8 bits', false, 0),
       ('At least 16 bits', true, 1),
       ('At least 32 bits', false, 2),
       ('Exactly 32 bits', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 9] (sizeof does not evaluate) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `int i = 0; sizeof(i++);` — what is the value of `i` afterward (assuming `i` is not used as a VLA size)?',
         'For non-VLA operands, `sizeof` does not evaluate its operand. `i++` is not executed, so `i` remains `0`.',
         '0 (operand not evaluated)',
         '`sizeof` does not evaluate its operand except for VLA expressions.',
         6
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0', true, 0),
       ('1', false, 1),
       ('Undefined behavior', false, 2),
       ('Depends on optimization level', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 14] (precedence == vs &) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `a & b == c` parse as in C?',
         '`==` has higher precedence than `&`. So `a & b == c` is `a & (b == c)`, which is almost always not what you want; parenthesize as `(a & b) == c`.',
         '`a & (b == c)`',
         '`==` binds tighter than `&`; always parenthesize when mixing bitwise and equality.',
         7
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`(a & b) == c`', false, 0),
       ('`a & (b == c)`', true, 1),
       ('`a == (b & c)`', false, 2),
       ('Syntax error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 17] (*p++) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `*p++` mean in C?',
         'Postfix `++` has higher precedence than unary `*`. `*p++` parses as `*(p++)`: dereference `p`, then advance `p`.',
         '`*(p++)` — deref then increment',
         '`*p++` dereferences `p`, then increments the pointer (not the value).',
         8
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Increment the value pointed to', false, 0),
       ('`*(p++)` — dereference, then increment pointer', true, 1),
       ('Same as `(*p)++`', false, 2),
       ('Undefined behavior', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 19] (comma operator) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the value of the expression `(1, 2, 3)` in C?',
         'The comma operator evaluates each operand left to right and yields the value of the last. There is a sequence point at each comma.',
         '3',
         'The comma operator yields the value of its rightmost operand.',
         9
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1', false, 0),
       ('2', false, 1),
       ('3', true, 2),
       ('Syntax error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 22] (pointer arithmetic) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For `int *p;`, incrementing `p` by 1 advances it by how many bytes (assuming `sizeof(int)` is 4)?',
         'Pointer arithmetic is scaled by the size of the pointee. `p + 1` advances by `sizeof(*p)` bytes, i.e., 4 bytes for `int *` when `sizeof(int) == 4`.',
         '4 bytes (one `int`)',
         'Pointer arithmetic moves by `sizeof(*p)` bytes per unit.',
         10
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('1 byte', false, 0),
       ('2 bytes', false, 1),
       ('4 bytes', true, 2),
       ('Depends on the value at `*p`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 24] (double pointer) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `int **pp` declare?',
         '`int **pp` is a pointer to a pointer to `int`. It is commonly used to modify a pointer through a function or to build an array of pointers.',
         'Pointer to pointer to `int`',
         '`int **pp` is a pointer to a pointer to `int`.',
         11
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Array of `int`', false, 0),
       ('Pointer to `int`', false, 1),
       ('Pointer to pointer to `int`', true, 2),
       ('Function returning `int*`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 25] (void pointer) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a defining property of `void *` in C?',
         '`void *` is a generic pointer that can hold the address of any object type. You cannot dereference it directly or perform arithmetic on it; you must cast first.',
         'Generic object pointer (no deref/arithmetic)',
         '`void *` is a generic pointer; cast to a concrete type before dereferencing or arithmetic.',
         12
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It can be dereferenced directly', false, 0),
       ('It supports pointer arithmetic', false, 1),
       ('It can hold the address of any object type', true, 2),
       ('It is the same as `NULL`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 26] (ptrdiff_t) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What type does subtracting two pointers (to elements of the same array) produce?',
         'The difference of two pointers into the same array has type `ptrdiff_t`, defined in `<stddef.h>`. It represents element count, not bytes.',
         '`ptrdiff_t`',
         'Pointer subtraction yields a `ptrdiff_t` element count.',
         13
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`size_t`', false, 0),
       ('`int`', false, 1),
       ('`long`', false, 2),
       ('`ptrdiff_t`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 27] (dangling pointer) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a "dangling pointer"?',
         'A dangling pointer refers to memory that has been freed or otherwise gone out of scope. Dereferencing such a pointer is undefined behavior.',
         'Points to freed/invalid memory',
         'A dangling pointer references memory that is no longer valid; dereferencing it is undefined behavior.',
         14
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A null pointer', false, 0),
       ('A pointer to freed or out-of-scope memory', true, 1),
       ('A pointer to a function', false, 2),
       ('A `const` pointer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 28] (const int *) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `const int *p` declare?',
         '`const int *p` (equivalently `int const *p`) is a pointer to a `const int`: you cannot modify the pointed-to value through `p`, but you can reassign `p` itself.',
         'Pointer to const int (mutable pointer)',
         '`const int *p` makes the pointee const; `int * const p` makes the pointer itself const.',
         15
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Const pointer to `int`', false, 0),
       ('Pointer to const `int`', true, 1),
       ('Const pointer to const `int`', false, 2),
       ('Array of const `int`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 29] (function pointer syntax) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which declaration is a pointer to a function taking an `int` and returning `int`?',
         'The parentheses around `*fp` are required: `int (*fp)(int)` declares `fp` as a pointer to a function. Without them, `int *fp(int)` declares a function returning `int *`.',
         '`int (*fp)(int)`',
         '`int (*fp)(int)` is a function pointer; the parentheses are required.',
         16
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int *fp(int)`', false, 0),
       ('`int fp(*int)`', false, 1),
       ('`int (*fp)(int)`', true, 2),
       ('`*int fp(int)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 30] (array decay) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `int a[10];`, what does the expression `a` (used as a value) decay to?',
         'In most expression contexts, an array name decays to a pointer to its first element, of type `int *` here. Exceptions: operand of `sizeof`, `&`, or used to initialize a `char` array from a string literal.',
         '`int *` to `a[0]`',
         'Arrays decay to a pointer to their first element in most expression contexts.',
         17
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An `int[10]` value', false, 0),
       ('A pointer to the first element', true, 1),
       ('A pointer to the whole array `int (*)[10]`', false, 2),
       ('The number 10', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 31] (sizeof array parameter) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Inside a function declared as `void f(int a[10])`, what is `sizeof(a)`?',
         'Array parameters are adjusted to pointer parameters. Inside the function, `a` is `int *`, so `sizeof(a)` is the pointer size, not the array size.',
         '`sizeof(int *)`',
         'Array parameters decay to pointers; `sizeof` inside the function gives pointer size.',
         18
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`10 * sizeof(int)`', false, 0),
       ('`sizeof(int *)`', true, 1),
       ('`sizeof(int)`', false, 2),
       ('Compile error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 [orig 32] (2D indexing) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `int m[3][4];`, which expression accesses the same element as `m[1][2]`?',
         'In C, `m[1][2]` is equivalent to `*(*(m + 1) + 2)`. The 2D array is laid out row-major and decays to a pointer to its first row.',
         '`*(*(m + 1) + 2)`',
         '`m[i][j]` is equivalent to `*(*(m + i) + j)` for a 2D array.',
         19
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`*(m + 1*4 + 2)`', false, 0),
       ('`*(*(m + 1) + 2)`', true, 1),
       ('`m + 1 + 2`', false, 2),
       ('`*(m[1] + m[2])`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 [orig 33] (array of ptrs vs ptr to array) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between `int *a[10]` and `int (*a)[10]`?',
         '`int *a[10]` is an array of 10 pointers to `int`. `int (*a)[10]` is a single pointer to an array of 10 `int`s. The parentheses change the binding.',
         'Array-of-pointers vs pointer-to-array',
         '`int *a[10]` = array of pointers; `int (*a)[10]` = pointer to an array.',
         20
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are equivalent', false, 0),
       ('Array of 10 `int*` vs pointer to array of 10 `int`', true, 1),
       ('Pointer to array vs array of pointers (reversed)', false, 2),
       ('Both are pointers to `int`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 [orig 34] (a[i] equivalence) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'For an array `a`, which is exactly equivalent to `a[i]` in C?',
         'By definition of subscripting in C, `a[i]` is `*(a + i)`. Because addition is commutative, `i[a]` also works (though it is a curiosity).',
         '`*(a + i)`',
         '`a[i]` is defined as `*(a + i)` in C.',
         21
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`*(a + i)`', true, 0),
       ('`a + i`', false, 1),
       ('`*(a) + i`', false, 2),
       ('`&a[i]`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 [orig 35] (array assignment) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which of these is NOT valid C?',
         'You cannot assign a brace-enclosed initializer to an existing array. Arrays in C cannot be assigned as a whole; they can only be initialized at declaration.',
         'Array assignment after declaration',
         'Arrays cannot be assigned to as a whole; only initialized at declaration.',
         22
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int a[3] = {1, 2, 3};`', false, 0),
       ('`char s[] = "abc";`', false, 1),
       ('`int a[3]; a = (int[3]){1, 2, 3};`', true, 2),
       ('`int a[] = {1, 2, 3};`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 [orig 36] (VLA) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which C feature lets you declare an array whose size is determined at runtime?',
         'C99 introduced variable-length arrays (VLAs), allocated on the stack with a runtime-sized dimension. Support is optional in C11 (`__STDC_NO_VLA__`).',
         'VLAs (C99)',
         'VLAs (C99) allow arrays with runtime-determined sizes; support is optional in C11.',
         23
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Designated initializers', false, 0),
       ('Flexible array members', false, 1),
       ('Variable-length arrays', true, 2),
       ('`_Generic` selection', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 [orig 37] (string literal type) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the type of the string literal `"hello"` in C?',
         'In C, `"hello"` has type `char[6]` (5 chars + null terminator). It decays to `char *` in expressions; in C++ it would be `const char[6]`.',
         '`char[6]`',
         'String literals are `char[N+1]` in C (read-only in practice, but not `const`-typed).',
         24
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`char[5]`', false, 0),
       ('`char[6]`', true, 1),
       ('`const char[6]`', false, 2),
       ('`char *`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 [orig 40] (strncpy quirk) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about `strncpy(dst, src, n)` is correct?',
         '`strncpy` writes exactly `n` characters: it pads with `\0` if `src` is shorter, and does NOT null-terminate if `strlen(src) >= n`. This often leads to non-terminated strings.',
         'May leave `dst` not null-terminated',
         '`strncpy` does not guarantee null-termination when `strlen(src) >= n`.',
         25
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It always null-terminates `dst`', false, 0),
       ('It may leave `dst` not null-terminated', true, 1),
       ('It is safer than `strcpy` in all cases', false, 2),
       ('It stops at the first null in `src` and copies no more bytes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 [orig 42] (sizeof string array) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `sizeof(s)` for `char s[] = "abc";`?',
         '`"abc"` is `{''a'', ''b'', ''c'', ''\0''}`, so `s` is `char[4]`. `sizeof(s)` includes the null terminator.',
         '4 (3 chars + null)',
         '`char s[] = "abc";` has `sizeof(s) == 4` including the null terminator.',
         26
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('3', false, 0),
       ('4', true, 1),
       ('5', false, 2),
       ('Same as `sizeof(char *)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 [orig 44] (strncmp) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `strncmp(a, b, 3)` compare?',
         '`strncmp` compares at most the first `n` bytes of two strings, stopping early at a null terminator. The return value follows the same sign convention as `strcmp`.',
         'At most the first 3 bytes (stops at NUL)',
         '`strncmp` compares up to `n` characters or until a null terminator.',
         27
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Exactly 3 bytes regardless of nulls', false, 0),
       ('The full strings ignoring the `3`', false, 1),
       ('At most the first 3 bytes, stopping at a null', true, 2),
       ('Only their lengths', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 [orig 45] (strcat precondition) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a precondition for safely using `strcat(dst, src)`?',
         '`strcat` writes starting at the existing null terminator of `dst`. `dst` must be a null-terminated string with enough capacity for `strlen(dst) + strlen(src) + 1` bytes.',
         '`dst` is null-terminated and has room',
         '`strcat` requires `dst` to be null-terminated and large enough for the combined string.',
         28
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`dst` must be empty', false, 0),
       ('`src` must not contain spaces', false, 1),
       ('`dst` must be null-terminated and large enough', true, 2),
       ('Length doesn''t matter, only that they don''t overlap', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 [orig 47] (memcpy vs strcpy) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'When is `memcpy` preferable to `strcpy`?',
         '`memcpy` copies a fixed number of bytes and does not stop at null bytes. Use it for binary data or known-length buffers; use `strcpy`/`strncpy` only with null-terminated strings.',
         'Fixed-length / binary data',
         '`memcpy` copies an exact byte count and ignores null bytes; `strcpy` stops at a null.',
         29
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('For binary data or a known byte count', true, 0),
       ('Only when source is null-terminated', false, 1),
       ('Never — `strcpy` is always faster', false, 2),
       ('Only inside `<string.h>` implementations', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 [orig 48] (malloc failure) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `malloc` return when it cannot allocate the requested memory?',
         '`malloc` returns `NULL` to signal allocation failure. The contents of the returned block (on success) are uninitialized.',
         '`NULL`',
         '`malloc` returns `NULL` on failure; the bytes on success are uninitialized.',
         30
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0 cast to the target type', false, 0),
       ('A pointer to a zero-filled block', false, 1),
       ('`NULL`', true, 2),
       ('It aborts the program', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 [orig 49] (calloc) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How does `calloc(n, size)` differ from `malloc(n * size)`?',
         '`calloc` zero-initializes the allocated memory (all bytes set to 0). `malloc` leaves the memory uninitialized.',
         'Zero-initializes the bytes',
         '`calloc` returns zeroed memory; `malloc` returns uninitialized bytes.',
         31
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is faster', false, 0),
       ('It zero-initializes the memory', true, 1),
       ('It allocates only on the stack', false, 2),
       ('It cannot fail', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 [orig 50] (realloc pattern) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the safe pattern for using `realloc`?',
         '`realloc` may return `NULL` on failure while leaving the original block intact. If you overwrite the original pointer with the return value directly and it fails, you leak the original allocation.',
         'Use a temp pointer (avoid losing original)',
         'Assign `realloc`''s result to a temporary; on failure the original block is still valid.',
         32
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`p = realloc(p, n);`', false, 0),
       ('Always pass `NULL` for the first argument', false, 1),
       ('Assign to a temp first, then update `p` only on success', true, 2),
       ('Always `free(p)` before calling `realloc`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 [orig 51] (free NULL) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you call `free(NULL)`?',
         'The C standard guarantees that `free(NULL)` is a no-op. This simplifies cleanup code.',
         'No-op (safe)',
         '`free(NULL)` is a guaranteed no-op.',
         33
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Undefined behavior', false, 0),
       ('It does nothing (no-op)', true, 1),
       ('It crashes the program', false, 2),
       ('It frees the entire heap', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 [orig 52] (double free) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of freeing the same non-null pointer twice?',
         'Calling `free` on the same non-null pointer twice (without an intervening allocation) is undefined behavior — a common heap corruption bug.',
         'Undefined behavior',
         'Double-freeing the same non-null pointer is undefined behavior.',
         34
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Safe — `free` is idempotent', false, 0),
       ('Undefined behavior', true, 1),
       ('It frees twice as much memory', false, 2),
       ('It resets the heap', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 [orig 53] (stack vs heap) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement about stack vs heap allocation in C is correct?',
         'Automatic ("stack") variables have their storage reclaimed when their enclosing scope ends. Heap allocations from `malloc`/`calloc` persist until explicitly freed.',
         'Stack: scope-bound; heap: until `free`',
         'Stack storage ends with scope; heap storage persists until `free`.',
         35
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Both are freed automatically', false, 0),
       ('Stack allocations live until `free` is called', false, 1),
       ('Heap allocations live until `free`; stack ends with scope', true, 2),
       ('Heap allocations are always faster than stack', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 [orig 54] (memory leak) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What constitutes a memory leak in C?',
         'A leak occurs when heap memory remains allocated but no live pointer references it (so `free` can never be called). Common when overwriting the only pointer to a block.',
         'Allocated block with no live pointer',
         'A leak is heap memory that is unreachable yet never freed.',
         36
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Freeing memory twice', false, 0),
       ('Reading uninitialized memory', false, 1),
       ('Heap memory that is unreachable but never freed', true, 2),
       ('A pointer set to `NULL`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 [orig 55] (allocator header) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which header declares `malloc` and `free`?',
         '`malloc`, `calloc`, `realloc`, and `free` are all declared in `<stdlib.h>`.',
         '`<stdlib.h>`',
         '`<stdlib.h>` declares the heap allocation functions.',
         37
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`<stdio.h>`', false, 0),
       ('`<string.h>`', false, 1),
       ('`<memory.h>`', false, 2),
       ('`<stdlib.h>`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 [orig 56] (cast malloc) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In C, should you cast the result of `malloc`?',
         'In C, `void *` converts implicitly to any object pointer, so the cast is unnecessary. The cast can hide a missing `<stdlib.h>` include (which in C89 would implicitly declare `malloc` to return `int`).',
         'No (it can hide bugs in C)',
         'Casting `malloc`''s result is unnecessary in C and can hide missing `<stdlib.h>` includes.',
         38
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yes, always', false, 0),
       ('No — it is unnecessary and can hide missing `<stdlib.h>` includes', true, 1),
       ('Only when allocating arrays', false, 2),
       ('Only in C99 mode', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 [orig 57] (uninitialized malloc) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What are the contents of memory returned by `malloc` on success?',
         '`malloc` returns memory with indeterminate (uninitialized) contents. Reading it before writing is undefined behavior. Use `calloc` for zero-initialization.',
         'Indeterminate (uninitialized)',
         '`malloc` gives uninitialized memory; reading before writing is undefined behavior.',
         39
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All zeros', false, 0),
       ('All `0xFF`', false, 1),
       ('Indeterminate', true, 2),
       ('A copy of the previous heap block', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 [orig 58] (struct access via pointer) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `struct S { int x; }; struct S *p;`, which expression reads the member through `p`?',
         '`p->x` is shorthand for `(*p).x`. Use `->` when accessing members through a pointer; use `.` on a struct value.',
         '`p->x`',
         '`p->x` is `(*p).x`; use `->` through a pointer, `.` on a struct value.',
         40
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`p.x`', false, 0),
       ('`*p.x`', false, 1),
       ('`p->x`', true, 2),
       ('`&p.x`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 [orig 59] (typedef struct) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `typedef struct { int x; } S;` do?',
         'This defines an anonymous struct type and creates a typedef name `S` for it. You can then write `S v;` instead of `struct S v;`.',
         'Creates typedef name `S` for the struct',
         '`typedef` creates an alias for a type so you can omit the `struct` keyword.',
         41
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares a variable `S`', false, 0),
       ('Defines a typedef `S` aliasing the struct type', true, 1),
       ('Defines a function `S`', false, 2),
       ('Creates two types: `struct S` and `S`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 [orig 60] (union semantics) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is true of a `union` in C?',
         'A `union` stores all members in the same memory; only one member is active at a time. Its size is at least the size of its largest member (plus padding for alignment).',
         'All members share storage',
         'A union''s members share the same storage; only one is meaningful at a time.',
         42
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('All members have independent storage', false, 0),
       ('All members share the same storage', true, 1),
       ('It is a kind of class', false, 2),
       ('Size equals the sum of all members', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 [orig 63] (forward decl struct) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which statement enables a self-referential struct (e.g., a linked list node)?',
         'You can refer to a struct''s own tag inside its definition as a pointer (`struct Node *next;`) because the tag is in scope as an incomplete type while the body is being declared.',
         'Pointer to the same struct tag',
         'A struct can contain a pointer to its own (incomplete) tag, enabling self-referential types like lists.',
         43
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Define the struct twice', false, 0),
       ('Use a pointer to the same struct tag as a member', true, 1),
       ('Declare a `static` member', false, 2),
       ('Use `union` instead of `struct`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 [orig 64] (designated initializer) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which C99 feature lets you write `struct Point p = { .x = 1, .y = 2 };`?',
         'C99 introduced designated initializers, allowing struct/array initialization by member name (`.x = 1`) or array index (`[3] = 5`). Order and omission of members is allowed; omitted members are zero-initialized.',
         'Designated initializers',
         'C99 designated initializers let you initialize by member name or array index.',
         44
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Compound literals', false, 0),
       ('Designated initializers', true, 1),
       ('Generic selection', false, 2),
       ('Flexible array members', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 [orig 66] (#define constant) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `#define MAX 100` do?',
         '`#define` creates a preprocessor macro: every textual occurrence of `MAX` after this line (outside string literals/comments) is replaced with `100` before compilation. It is not a typed constant.',
         'Textual replacement of `MAX` with `100`',
         '`#define` performs textual substitution at preprocessing time; it has no type.',
         45
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Declares an `int` named `MAX`', false, 0),
       ('Declares a `const int MAX = 100;`', false, 1),
       ('Substitutes the text `100` for `MAX` at preprocessing', true, 2),
       ('Reserves 100 bytes of memory', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 [orig 67] (macro pitfall) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is `#define SQUARE(x) x * x` considered dangerous?',
         'Without parentheses, `SQUARE(a + 1)` expands to `a + 1 * a + 1`, not `(a + 1) * (a + 1)`. Always parenthesize macro parameters and the whole macro body: `#define SQUARE(x) ((x) * (x))`.',
         'Missing parentheses around parameters',
         'Function-like macros must parenthesize each parameter and the whole body to avoid precedence bugs.',
         46
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Macros cannot take parameters', false, 0),
       ('It does not parenthesize `x`, causing precedence bugs', true, 1),
       ('Macros are not type-checked', false, 2),
       ('`x * x` overflows for any input', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 [orig 68] (include angle vs quotes) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the conventional difference between `#include <foo.h>` and `#include "foo.h"`?',
         '`<...>` searches the implementation''s system include paths first; `"..."` searches local/user paths first (typically the directory of the current file) and falls back to system paths. Exact behavior is implementation-defined.',
         'System vs user search order',
         '`<...>` searches system paths; `"..."` searches user/local paths first.',
         47
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are completely identical', false, 0),
       ('`<>` is for C++ only', false, 1),
       ('`<>` searches system paths first; `""` searches user paths first', true, 2),
       ('`""` is required for the standard library', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 [orig 69] (#ifdef include guard) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of the classic header pattern `#ifndef FOO_H` / `#define FOO_H` / `#endif`?',
         'This is an include guard. It prevents the header''s contents from being processed more than once per translation unit, which would cause duplicate definitions and compilation errors.',
         'Include guard against double inclusion',
         'Include guards prevent a header from being processed more than once per translation unit.',
         48
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Optimizing compile speed', false, 0),
       ('Preventing duplicate inclusion of the header', true, 1),
       ('Declaring a global namespace', false, 2),
       ('Replacing `#pragma once`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 [orig 70] (#ifdef conditional) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `#ifdef DEBUG ... #endif`, when is the enclosed code compiled?',
         '`#ifdef NAME` is true if `NAME` was defined via `#define` (with any value) or via the compiler''s `-D` flag. Otherwise the block is skipped.',
         'Only when `DEBUG` is defined',
         '`#ifdef NAME` includes the block iff `NAME` has been `#define`d.',
         49
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always', false, 0),
       ('Only when `DEBUG` is `#define`d', true, 1),
       ('Only at runtime debug mode', false, 2),
       ('Only when `DEBUG` evaluates to non-zero at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 [orig 72] (predefined macros) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which predefined macro expands to the current source line number?',
         '`__LINE__` expands to the current source line as an integer constant. Other useful predefined identifiers include `__FILE__`, `__DATE__`, `__TIME__`, and `__func__`.',
         '`__LINE__`',
         '`__LINE__` is a predefined preprocessor macro that yields the current source line number.',
         50
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`__FILE__`', false, 0),
       ('`__LINE__`', true, 1),
       ('`__DATE__`', false, 2),
       ('`__func__`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 [orig 73] (macros vs functions) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Compared to a function, a function-like macro has which of these disadvantages?',
         'Macros perform textual substitution, so they re-evaluate their arguments (causing side-effect bugs), do not respect scoping, and are not type-checked. Inline functions are usually safer.',
         'No type checking; may re-evaluate args',
         'Macros are textual and untyped; arguments may be re-evaluated, causing side-effect bugs.',
         51
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('They are always slower than functions', false, 0),
       ('No type checking and possible argument re-evaluation', true, 1),
       ('They cannot take arguments', false, 2),
       ('They cannot use parentheses', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 [orig 74] (function declaration vs definition) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the difference between a function declaration (prototype) and a definition?',
         'A declaration (prototype) announces the function''s signature so callers can be type-checked. A definition provides the body. A function may be declared many times but defined only once.',
         'Prototype declares; definition includes body',
         'A declaration provides a signature; a definition provides the function body.',
         52
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('There is no difference', false, 0),
       ('Declarations include the body; definitions don''t', false, 1),
       ('A declaration provides the signature; a definition provides the body', true, 2),
       ('Only definitions can appear in headers', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 [orig 75] (static function) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `static` keyword on a file-scope function mean?',
         'At file scope, `static` gives a function (or variable) internal linkage: it is only visible within the translation unit. This is the standard way to hide helpers from other files.',
         'Internal linkage (file-local)',
         'File-scope `static` gives a function internal linkage, hiding it from other translation units.',
         53
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It cannot be inlined', false, 0),
       ('It has internal linkage (visible only in this file)', true, 1),
       ('It is loaded into static RAM', false, 2),
       ('It cannot have parameters', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 [orig 76] (static local) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `static` mean on a local variable inside a function?',
         'A function-local `static` variable has static storage duration: it is initialized once and retains its value between calls. Its scope is still the function body.',
         'Persists across calls',
         'A function-local `static` variable is initialized once and persists across calls.',
         54
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Allocated on the heap', false, 0),
       ('Initialized once; retains value between calls', true, 1),
       ('Visible to other functions', false, 2),
       ('Created in shared memory', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 [orig 77] (extern) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `extern int counter;` in a header file express?',
         '`extern` declares a name with external linkage that is defined in some other translation unit. It introduces no storage; the actual definition (e.g., `int counter = 0;`) must appear in exactly one .c file.',
         'Declaration of a variable defined elsewhere',
         '`extern` declares a name defined elsewhere with external linkage; no storage is allocated.',
         55
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Defines `counter` and zero-initializes it', false, 0),
       ('Declares `counter` as defined in another translation unit', true, 1),
       ('Makes `counter` thread-local', false, 2),
       ('Makes `counter` immutable', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 [orig 79] (function pointer invocation) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Given `int (*fp)(int) = foo;`, which call invokes `foo(3)` through `fp`?',
         'A function pointer can be called as either `fp(3)` or `(*fp)(3)` — they are equivalent in C. Both first auto-convert if needed.',
         '`fp(3)` (or `(*fp)(3)`)',
         'A function pointer is invoked with `fp(args)` or the equivalent `(*fp)(args)`.',
         56
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`*fp 3`', false, 0),
       ('`fp[3]`', false, 1),
       ('`fp(3)`', true, 2),
       ('`&fp(3)`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 [orig 80] (storage classes) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which keyword is NOT a storage-class specifier in C?',
         'Storage-class specifiers include `auto`, `register`, `static`, `extern`, and (C11) `_Thread_local`. `const` is a type qualifier, not a storage-class specifier.',
         '`const` (type qualifier)',
         'Storage-class specifiers: `auto`, `register`, `static`, `extern`, `_Thread_local`. `const` is a qualifier.',
         57
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`static`', false, 0),
       ('`extern`', false, 1),
       ('`register`', false, 2),
       ('`const`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 [orig 81] (printf return) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `printf` return?',
         '`printf` returns the number of characters written, or a negative value if an output error occurred. The return value is rarely checked but is well-defined.',
         'Chars written, or negative on error',
         '`printf` returns the number of characters written (or negative on error).',
         58
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`void`', false, 0),
       ('The number of characters written, or negative on error', true, 1),
       ('A pointer to the formatted string', false, 2),
       ('`0` on success, `-1` on failure', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 [orig 87] (stdint exact width) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which type from `<stdint.h>` is guaranteed to be exactly 32 bits wide if it exists?',
         '`int32_t` (and `uint32_t`) are exact-width types defined only on platforms that have a two''s complement type with exactly that width. `int_least32_t` and `int_fast32_t` always exist but may be wider.',
         '`int32_t`',
         '`int32_t` is the exact-width signed 32-bit type from `<stdint.h>` (may not exist on exotic platforms).',
         59
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`int_least32_t`', false, 0),
       ('`int_fast32_t`', false, 1),
       ('`intmax_t`', false, 2),
       ('`int32_t`', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 [orig 89] (_Bool) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is true about `_Bool` introduced in C99?',
         '`_Bool` is a built-in integer type that holds only `0` or `1`. Assigning any non-zero value converts it to `1`. `<stdbool.h>` provides the aliases `bool`, `true`, `false`.',
         'Holds 0 or 1; non-zero becomes 1',
         '`_Bool` holds 0 or 1; any non-zero assignment is converted to 1.',
         60
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It is a typedef for `int`', false, 0),
       ('It holds only 0 or 1, with any non-zero value converted to 1', true, 1),
       ('It is exactly 1 bit wide', false, 2),
       ('Only `<stdbool.h>` provides any boolean facility in C', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 [orig 91] (inline) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the standard meaning of the `inline` specifier (C99)?',
         '`inline` is a hint to the compiler that calls to the function may be inlined. It is not a guarantee. C99 has subtle rules about inline definitions vs external definitions across translation units.',
         'A hint, not a guarantee',
         '`inline` is a hint to the compiler suggesting inlining; the compiler is free to ignore it.',
         61
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Forces inlining at every call site', false, 0),
       ('A hint that inlining may help; not mandatory', true, 1),
       ('Makes the function `static`', false, 2),
       ('Makes the function header-only', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 [orig 96] (fopen) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `fopen("data.bin", "rb")` return on failure?',
         '`fopen` opens a file in the given mode (`"rb"` = read, binary). It returns a `FILE *` on success, or `NULL` on failure (with `errno` set).',
         '`NULL` on failure',
         '`fopen` returns a `FILE *` on success or `NULL` on failure (and sets `errno`).',
         62
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Returns `0`', false, 0),
       ('Returns `NULL`', true, 1),
       ('Aborts the program', false, 2),
       ('Returns `-1`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 [orig 97] (EOF) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why is the return type of `getchar()` declared as `int` rather than `char`?',
         '`getchar` returns either an unsigned char value converted to `int`, or the negative sentinel `EOF`. A plain `char` cannot distinguish `EOF` from a valid `0xFF` byte.',
         'To distinguish bytes from `EOF`',
         '`getchar` returns `int` so it can return `EOF` (a negative value) distinctly from any valid byte.',
         63
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Historical accident; `char` would also work', false, 0),
       ('So it can return `EOF`, which is distinct from any valid byte', true, 1),
       ('Because all stdio functions return `int`', false, 2),
       ('To allow returning Unicode code points', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 [orig 99] (enum) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In C, what is the underlying type of an `enum` constant''s value?',
         'In C, enumeration constants (the names in an `enum`) have type `int`. The enumeration type itself is an integer type compatible with some implementation-chosen integer type able to hold all its values.',
         '`int`',
         'C enumeration constants are of type `int`; the enum type is an implementation-chosen integer type.',
         64
  from modules where slug = 'c-2'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`char`', false, 0),
       ('`int`', true, 1),
       ('`unsigned`', false, 2),
       ('Implementation-defined floating type', false, 3)
     ) as c(label, is_correct, order_index);
-- ============================================================
-- c-3
-- ============================================================

-- Question 0 [orig 2] (signed overflow UB) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the C standard say about signed integer overflow?',
         'Signed integer overflow is undefined behavior in C. Unsigned overflow, by contrast, is well-defined and wraps modulo 2^N.',
         'Undefined behavior',
         'Signed integer overflow is undefined behavior; unsigned overflow wraps modulo 2^N.',
         0
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It wraps around using two''s complement', false, 0),
       ('It is undefined behavior', true, 1),
       ('It saturates at `INT_MAX`/`INT_MIN`', false, 2),
       ('It raises `SIGFPE`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 [orig 10] (sequencing UB) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the expression `int x = 5; int y = x++ + ++x;` produce for `y`?',
         'This expression modifies `x` twice without an intervening sequence point, which is undefined behavior in C.',
         'Undefined behavior',
         'Modifying a scalar twice in the same expression without a sequence point is undefined behavior.',
         1
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('12', false, 0),
       ('11', false, 1),
       ('Undefined behavior', true, 2),
       ('10', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 [orig 16] (right shift signed) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Right-shifting a negative signed integer in C is:',
         'For signed integers, right shift of a negative value is implementation-defined (typically arithmetic shift, replicating the sign bit). Use unsigned types for portable bit operations.',
         'Implementation-defined',
         'Right-shifting a negative signed value is implementation-defined; use unsigned for portable shifts.',
         2
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Always arithmetic (sign-extending)', false, 0),
       ('Always logical (zero-filling)', false, 1),
       ('Implementation-defined', true, 2),
       ('Undefined behavior', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 [orig 43] (modify string literal) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens when you execute `char *p = "hi"; p[0] = ''H'';`?',
         'Modifying a string literal is undefined behavior. String literals typically live in a read-only segment. Use `char s[] = "hi";` if you need to modify the contents.',
         'Undefined behavior',
         'Modifying a string literal is undefined behavior; use `char s[]` if you need a writable copy.',
         3
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('It safely changes the first character to `H`', false, 0),
       ('It is undefined behavior', true, 1),
       ('It always crashes the program', false, 2),
       ('It is a compile-time error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 [orig 61] (struct padding) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Why might `sizeof(struct { char c; int i; })` be larger than `sizeof(char) + sizeof(int)`?',
         'The compiler inserts padding between members so each member meets its alignment requirement. A `char` followed by an `int` typically has 3 bytes of padding (on a 4-byte-aligned `int`).',
         'Padding for alignment',
         'Struct layout includes padding so each member meets its alignment requirement.',
         4
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Padding inserted to satisfy alignment', true, 0),
       ('The compiler reserves space for a vtable', false, 1),
       ('Structs always round up to a power of 2', false, 2),
       ('A hidden length field is added', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 [orig 62] (bitfield) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a bit-field in C?',
         'A bit-field is a struct member declared with a specific number of bits (e.g., `unsigned a : 3;`). The exact layout (bit order, straddling boundaries) is implementation-defined.',
         'Struct member with specified bit width',
         'A bit-field declares a struct member with a fixed bit width; layout is implementation-defined.',
         5
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A standalone variable storing one bit', false, 0),
       ('A struct member with a specified bit width', true, 1),
       ('A new keyword in C23', false, 2),
       ('A bitwise operator', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 [orig 65] (struct alignment) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `_Alignof(T)` return (C11)?',
         '`_Alignof(T)` returns the alignment requirement of type `T` in bytes. `<stdalign.h>` provides the `alignof` macro spelling.',
         'Alignment requirement of `T`',
         '`_Alignof(T)` yields the alignment (in bytes) required by `T`.',
         6
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('The size of `T`', false, 0),
       ('The alignment requirement of `T`', true, 1),
       ('The number of members in `T`', false, 2),
       ('The padding inside `T`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 [orig 71] (stringify) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'In a function-like macro, what does the `#` operator do?',
         'In a function-like macro definition, `#param` turns the macro argument into a string literal at expansion time. The `##` operator concatenates tokens.',
         'Stringify a macro argument',
         '`#` stringifies a macro argument; `##` concatenates tokens.',
         7
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Comment out the argument', false, 0),
       ('Concatenate two tokens', false, 1),
       ('Convert the argument to a string literal', true, 2),
       ('Force evaluation at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 [orig 82] (printf format mismatch) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What happens with `printf("%d\n", 3.14);` (format spec mismatch)?',
         'Mismatching the format specifier with the argument type is undefined behavior for `printf`. Conversion specifiers like `%d` expect an `int`; passing a `double` violates that contract.',
         'Undefined behavior',
         'Type mismatch between a `printf` conversion specifier and its argument is undefined behavior.',
         8
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Prints `3`', false, 0),
       ('Prints `3.140000`', false, 1),
       ('Undefined behavior', true, 2),
       ('Compiler error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 [orig 84] (uninitialized read UB) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Reading an automatic (local) variable that has never been assigned is:',
         'Reading an uninitialized automatic variable of an indeterminate value yields undefined behavior. Always initialize before reading.',
         'Undefined behavior',
         'Reading an uninitialized automatic variable is undefined behavior.',
         9
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Guaranteed to be zero', false, 0),
       ('Undefined behavior', true, 1),
       ('Always equal to the previous stack frame''s value', false, 2),
       ('A compile-time error', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 [orig 85] (strict aliasing) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which is allowed by C''s "strict aliasing" rule?',
         'You may access any object through a `char *` (or `unsigned char *`), but accessing an object through an incompatible pointer type (e.g., reading an `int` as a `float`) is undefined behavior, with limited exceptions.',
         'Access via `char *` is allowed',
         'Strict aliasing forbids accessing objects through incompatible pointer types, except via `char`/`unsigned char *`.',
         10
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Reading an `int` object through `float *`', false, 0),
       ('Accessing any object through `char *`', true, 1),
       ('Reading a `struct` through an unrelated `struct *`', false, 2),
       ('Treating a `double` as two `int`s via pointer cast', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 [orig 86] (division by zero) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the result of integer division by zero in C, e.g., `5 / 0`?',
         'Integer division (or modulo) by zero is undefined behavior in C. Floating-point division by zero is well-defined per IEEE 754 (yields infinity or NaN), but the integer version is UB.',
         'Undefined behavior',
         'Integer division (or `%`) by zero is undefined behavior in C.',
         11
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('0', false, 0),
       ('`INT_MAX`', false, 1),
       ('Undefined behavior', true, 2),
       ('Always raises `SIGFPE`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 [orig 88] (intptr_t) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `intptr_t` for?',
         '`intptr_t` (from `<stdint.h>`) is an integer type wide enough to hold a converted `void *` value without information loss. It is optional in the standard.',
         'Integer wide enough to hold a `void *`',
         '`intptr_t` is an integer type guaranteed to hold a converted `void *` value.',
         12
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('An integer that can hold a `void *` value', true, 0),
       ('A pointer to `int`', false, 1),
       ('The largest exact-width integer', false, 2),
       ('An unsigned size type', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 [orig 90] (restrict) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the `restrict` qualifier (C99) on a pointer parameter promise?',
         '`restrict` is a hint to the compiler that, for the lifetime of the pointer, the object it points to is accessed only through that pointer (or pointers derived from it). Violating this is undefined behavior, but it enables better optimization.',
         'No aliasing through this pointer',
         '`restrict` promises no other pointer aliases the same object, enabling optimizations.',
         13
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('That the pointer cannot be reassigned', false, 0),
       ('That the pointee will not be modified', false, 1),
       ('That no other pointer aliases the same object', true, 2),
       ('That the pointer is `NULL`-checked at runtime', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 [orig 92] (variadic) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which header provides the macros (`va_start`, `va_arg`, `va_end`) for variadic functions?',
         'Variadic-function support comes from `<stdarg.h>`. You declare a `va_list`, initialize with `va_start`, fetch each argument with `va_arg`, and finalize with `va_end`.',
         '`<stdarg.h>`',
         '`<stdarg.h>` declares the variadic-function macros `va_list`, `va_start`, `va_arg`, `va_end`.',
         14
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('`<stdio.h>`', false, 0),
       ('`<stdlib.h>`', false, 1),
       ('`<stdarg.h>`', true, 2),
       ('`<varargs.h>`', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 [orig 93] (compound literal) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is `(int[]){1, 2, 3}` an example of (C99)?',
         'This is a compound literal (C99): an unnamed object of the specified type initialized with the given values. It has storage duration of the enclosing block (or static at file scope).',
         'Compound literal (C99)',
         'A compound literal creates an unnamed object of a given type at the point of use.',
         15
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Designated initializer', false, 0),
       ('Compound literal', true, 1),
       ('Generic selection', false, 2),
       ('VLA declaration', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 [orig 94] (_Generic) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the purpose of the C11 `_Generic` keyword?',
         '`_Generic` provides type-directed selection at compile time: it picks an expression based on the (static) type of its controlling expression. It is commonly used to build type-generic macros like `tgmath`.',
         'Compile-time type-based selection',
         '`_Generic` (C11) selects an expression at compile time based on the type of its controlling expression.',
         16
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Templates like in C++', false, 0),
       ('Runtime type identification', false, 1),
       ('Compile-time selection of an expression based on a type', true, 2),
       ('Generic memory allocation', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 [orig 95] (static_assert) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does `_Static_assert(sizeof(int) == 4, "int must be 32-bit");` do (C11)?',
         '`_Static_assert` evaluates a constant expression at compile time and aborts compilation with the given message if it is false. `<assert.h>` exposes the spelling `static_assert`.',
         'Compile-time assertion',
         '`_Static_assert` performs a compile-time check and fails the build with a diagnostic if it is violated.',
         17
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Runtime assertion with a message', false, 0),
       ('Compile-time assertion that fails the build on a false condition', true, 1),
       ('Documentation comment', false, 2),
       ('Always-true sanity check at startup', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 [orig 98] (flexible array member) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is a "flexible array member" (C99)?',
         'A flexible array member is a final array declared without a size (e.g., `int data[];`) at the end of a struct. It contributes nothing to `sizeof`; the actual storage is provided by the surrounding allocation.',
         'Trailing size-less array in a struct',
         'A flexible array member is an unsized trailing array in a struct, sized by the surrounding allocation.',
         18
  from modules where slug = 'c-3'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('A trailing array of unspecified size at the end of a struct', true, 0),
       ('A pointer that can be resized', false, 1),
       ('A VLA at file scope', false, 2),
       ('An array whose elements can change type', false, 3)
     ) as c(label, is_correct, order_index);
