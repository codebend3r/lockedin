-- 017_seed_spanish.sql
-- Spanish module: 500 quiz questions

-- Question 0 (hola) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hola" mean?',
         '"Hola" is the most common Spanish greeting, equivalent to "hello" in English.',
         'hello',
         '"Hola" means "hello".',
         0
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hello', true, 0),
       ('goodbye', false, 1),
       ('please', false, 2),
       ('thank you', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 1 (adiós) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "goodbye" to Spanish.',
         '"Adiós" is the standard way to say "goodbye" in Spanish.',
         'adiós',
         '"Goodbye" in Spanish is "adiós".',
         1
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hola', false, 0),
       ('adiós', true, 1),
       ('gracias', false, 2),
       ('por favor', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 2 (buenos días) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "buenos días" mean?',
         '"Buenos días" is used in the morning to wish someone a good day, like "good morning".',
         'good morning',
         '"Buenos días" means "good morning".',
         2
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('good night', false, 0),
       ('good afternoon', false, 1),
       ('good morning', true, 2),
       ('good evening', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 3 (buenas tardes) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "buenas tardes" mean?',
         '"Buenas tardes" is used after noon until evening to greet someone.',
         'good afternoon',
         '"Buenas tardes" means "good afternoon".',
         3
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('good morning', false, 0),
       ('good afternoon', true, 1),
       ('good night', false, 2),
       ('see you later', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 4 (buenas noches) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "buenas noches" mean?',
         '"Buenas noches" works for both "good evening" and "good night" in Spanish.',
         'good evening / good night',
         '"Buenas noches" means "good evening" or "good night".',
         4
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('good morning', false, 0),
       ('good day', false, 1),
       ('good evening / good night', true, 2),
       ('have a nice day', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 5 (¿cómo estás?) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "¿Cómo estás?" mean?',
         '"¿Cómo estás?" is the informal way to ask "how are you?".',
         'how are you?',
         '"¿Cómo estás?" means "how are you?".',
         5
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('what is your name?', false, 0),
       ('how are you?', true, 1),
       ('where are you?', false, 2),
       ('who are you?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 6 (gracias) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "thank you" to Spanish.',
         '"Gracias" is the standard way to say "thank you".',
         'gracias',
         '"Thank you" in Spanish is "gracias".',
         6
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('de nada', false, 0),
       ('por favor', false, 1),
       ('gracias', true, 2),
       ('lo siento', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 7 (de nada) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "de nada" mean?',
         '"De nada" literally means "of nothing" and is used as "you''re welcome".',
         'you''re welcome',
         '"De nada" means "you''re welcome".',
         7
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('you''re welcome', true, 0),
       ('no problem', false, 1),
       ('excuse me', false, 2),
       ('it''s nothing important', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 8 (por favor) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "please" to Spanish.',
         '"Por favor" is the standard expression for "please".',
         'por favor',
         '"Please" in Spanish is "por favor".',
         8
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('gracias', false, 0),
       ('lo siento', false, 1),
       ('disculpa', false, 2),
       ('por favor', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 9 (lo siento) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "lo siento" mean?',
         '"Lo siento" literally means "I feel it" and is used to say "I''m sorry".',
         'I''m sorry',
         '"Lo siento" means "I''m sorry".',
         9
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('thank you', false, 0),
       ('I''m sorry', true, 1),
       ('excuse me', false, 2),
       ('please', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 10 (madre) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "madre" mean?',
         '"Madre" is the Spanish word for "mother".',
         'mother',
         '"Madre" means "mother".',
         10
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('father', false, 0),
       ('sister', false, 1),
       ('mother', true, 2),
       ('aunt', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 11 (padre) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "padre" mean?',
         '"Padre" is the Spanish word for "father".',
         'father',
         '"Padre" means "father".',
         11
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('father', true, 0),
       ('uncle', false, 1),
       ('grandfather', false, 2),
       ('brother', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 12 (hermano) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "brother" to Spanish.',
         '"Hermano" means "brother"; "hermana" is "sister".',
         'hermano',
         '"Brother" in Spanish is "hermano".',
         12
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('primo', false, 0),
       ('hermano', true, 1),
       ('tío', false, 2),
       ('abuelo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 13 (hermana) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hermana" mean?',
         '"Hermana" is the feminine form, meaning "sister".',
         'sister',
         '"Hermana" means "sister".',
         13
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('aunt', false, 0),
       ('cousin', false, 1),
       ('daughter', false, 2),
       ('sister', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 14 (abuelo) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "abuelo" mean?',
         '"Abuelo" means "grandfather"; "abuela" is "grandmother".',
         'grandfather',
         '"Abuelo" means "grandfather".',
         14
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('grandfather', true, 0),
       ('father', false, 1),
       ('uncle', false, 2),
       ('godfather', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 15 (tío) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "tío" mean?',
         '"Tío" means "uncle"; in Spain it''s also used as slang for "guy/dude".',
         'uncle',
         '"Tío" means "uncle".',
         15
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('cousin', false, 0),
       ('nephew', false, 1),
       ('uncle', true, 2),
       ('brother-in-law', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 16 (primo) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "cousin (male)" to Spanish.',
         '"Primo" is a male cousin; "prima" is a female cousin.',
         'primo',
         '"Cousin (male)" in Spanish is "primo".',
         16
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sobrino', false, 0),
       ('cuñado', false, 1),
       ('primo', true, 2),
       ('nieto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 17 (hijo) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hijo" mean?',
         '"Hijo" is the Spanish word for "son"; "hija" is "daughter".',
         'son',
         '"Hijo" means "son".',
         17
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('son', true, 0),
       ('nephew', false, 1),
       ('grandson', false, 2),
       ('child (general)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 18 (esposa) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "esposa" mean?',
         '"Esposa" means "wife"; "esposo" is "husband".',
         'wife',
         '"Esposa" means "wife".',
         18
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('girlfriend', false, 0),
       ('wife', true, 1),
       ('fiancée', false, 2),
       ('mother-in-law', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 19 (familia) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "familia" mean?',
         '"Familia" is the Spanish word for "family".',
         'family',
         '"Familia" means "family".',
         19
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('friend', false, 0),
       ('home', false, 1),
       ('relative', false, 2),
       ('family', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 20 (agua) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "agua" mean?',
         '"Agua" means "water". It''s feminine but takes "el" in singular (el agua) for pronunciation.',
         'water',
         '"Agua" means "water".',
         20
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('water', true, 0),
       ('wine', false, 1),
       ('juice', false, 2),
       ('milk', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 21 (pan) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "bread" to Spanish.',
         '"Pan" is the Spanish word for "bread".',
         'pan',
         '"Bread" in Spanish is "pan".',
         21
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('queso', false, 0),
       ('arroz', false, 1),
       ('pan', true, 2),
       ('mantequilla', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 22 (leche) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "leche" mean?',
         '"Leche" is the Spanish word for "milk".',
         'milk',
         '"Leche" means "milk".',
         22
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('butter', false, 0),
       ('cream', false, 1),
       ('cheese', false, 2),
       ('milk', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 23 (manzana) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "manzana" mean?',
         '"Manzana" means "apple". It can also mean "city block" in many countries.',
         'apple',
         '"Manzana" means "apple".',
         23
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('orange', false, 0),
       ('apple', true, 1),
       ('pear', false, 2),
       ('peach', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 24 (pollo) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pollo" mean?',
         '"Pollo" is the Spanish word for "chicken" (the meat or the bird as food).',
         'chicken',
         '"Pollo" means "chicken".',
         24
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('beef', false, 0),
       ('fish', false, 1),
       ('chicken', true, 2),
       ('pork', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 25 (carne) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "carne" mean?',
         '"Carne" means "meat", and often specifically "beef" in restaurant contexts.',
         'meat',
         '"Carne" means "meat".',
         25
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('meat', true, 0),
       ('bone', false, 1),
       ('skin', false, 2),
       ('fish', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 26 (arroz) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "rice" to Spanish.',
         '"Arroz" is the Spanish word for "rice".',
         'arroz',
         '"Rice" in Spanish is "arroz".',
         26
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('frijoles', false, 0),
       ('arroz', true, 1),
       ('maíz', false, 2),
       ('trigo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 27 (queso) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "queso" mean?',
         '"Queso" is the Spanish word for "cheese".',
         'cheese',
         '"Queso" means "cheese".',
         27
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('butter', false, 0),
       ('yogurt', false, 1),
       ('egg', false, 2),
       ('cheese', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 28 (huevo) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "huevo" mean?',
         '"Huevo" is the Spanish word for "egg".',
         'egg',
         '"Huevo" means "egg".',
         28
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('egg', true, 0),
       ('flour', false, 1),
       ('sugar', false, 2),
       ('honey', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 29 (cerveza) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "cerveza" mean?',
         '"Cerveza" is the Spanish word for "beer".',
         'beer',
         '"Cerveza" means "beer".',
         29
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('wine', false, 0),
       ('soda', false, 1),
       ('beer', true, 2),
       ('coffee', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 30 (mano) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mano" mean?',
         '"Mano" means "hand". It''s feminine despite ending in -o.',
         'hand',
         '"Mano" means "hand".',
         30
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('foot', false, 0),
       ('arm', false, 1),
       ('finger', false, 2),
       ('hand', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 31 (pie) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pie" mean (as a body part)?',
         '"Pie" is the Spanish word for "foot".',
         'foot',
         '"Pie" means "foot".',
         31
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('foot', true, 0),
       ('hand', false, 1),
       ('leg', false, 2),
       ('toe', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 32 (cabeza) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "head" to Spanish.',
         '"Cabeza" is the Spanish word for "head".',
         'cabeza',
         '"Head" in Spanish is "cabeza".',
         32
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('cara', false, 0),
       ('cuello', false, 1),
       ('cabeza', true, 2),
       ('pelo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 33 (ojo) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "ojo" mean?',
         '"Ojo" means "eye". It''s also used as an interjection meaning "watch out!".',
         'eye',
         '"Ojo" means "eye".',
         33
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ear', false, 0),
       ('eye', true, 1),
       ('mouth', false, 2),
       ('nose', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 34 (boca) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "boca" mean?',
         '"Boca" is the Spanish word for "mouth".',
         'mouth',
         '"Boca" means "mouth".',
         34
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tongue', false, 0),
       ('teeth', false, 1),
       ('mouth', true, 2),
       ('lip', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 35 (nariz) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "nariz" mean?',
         '"Nariz" is the Spanish word for "nose".',
         'nose',
         '"Nariz" means "nose".',
         35
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('chin', false, 0),
       ('forehead', false, 1),
       ('cheek', false, 2),
       ('nose', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 36 (rojo) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "rojo"?',
         '"Rojo" is the Spanish word for "red".',
         'red',
         '"Rojo" means "red".',
         36
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('red', true, 0),
       ('blue', false, 1),
       ('green', false, 2),
       ('orange', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 37 (azul) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "azul"?',
         '"Azul" is the Spanish word for "blue".',
         'blue',
         '"Azul" means "blue".',
         37
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('purple', false, 0),
       ('black', false, 1),
       ('blue', true, 2),
       ('gray', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 38 (verde) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "green" to Spanish.',
         '"Verde" is the Spanish word for "green".',
         'verde',
         '"Green" in Spanish is "verde".',
         38
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('amarillo', false, 0),
       ('rosado', false, 1),
       ('marrón', false, 2),
       ('verde', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 39 (amarillo) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "amarillo"?',
         '"Amarillo" is the Spanish word for "yellow".',
         'yellow',
         '"Amarillo" means "yellow".',
         39
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('yellow', true, 0),
       ('orange', false, 1),
       ('gold', false, 2),
       ('beige', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 40 (negro) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "negro"?',
         '"Negro" is the Spanish word for "black".',
         'black',
         '"Negro" means "black".',
         40
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('white', false, 0),
       ('black', true, 1),
       ('dark blue', false, 2),
       ('brown', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 41 (blanco) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What color is "blanco"?',
         '"Blanco" is the Spanish word for "white".',
         'white',
         '"Blanco" means "white".',
         41
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('gray', false, 0),
       ('silver', false, 1),
       ('white', true, 2),
       ('cream', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 42 (gato) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "gato" mean?',
         '"Gato" is the Spanish word for "cat".',
         'cat',
         '"Gato" means "cat".',
         42
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dog', false, 0),
       ('mouse', false, 1),
       ('rabbit', false, 2),
       ('cat', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 43 (perro) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "dog" to Spanish.',
         '"Perro" is the Spanish word for "dog".',
         'perro',
         '"Dog" in Spanish is "perro".',
         43
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('perro', true, 0),
       ('gato', false, 1),
       ('caballo', false, 2),
       ('ratón', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 44 (caballo) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "caballo" mean?',
         '"Caballo" is the Spanish word for "horse".',
         'horse',
         '"Caballo" means "horse".',
         44
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('cow', false, 0),
       ('horse', true, 1),
       ('donkey', false, 2),
       ('pig', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 45 (pájaro) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pájaro" mean?',
         '"Pájaro" is the Spanish word for "bird".',
         'bird',
         '"Pájaro" means "bird".',
         45
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fish', false, 0),
       ('insect', false, 1),
       ('bird', true, 2),
       ('reptile', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 46 (pez) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "pez" mean?',
         '"Pez" refers to a live fish; "pescado" refers to fish as food.',
         'fish (live)',
         '"Pez" means "fish" (the live animal).',
         46
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fish (live)', true, 0),
       ('shark', false, 1),
       ('whale', false, 2),
       ('shellfish', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 47 (vaca) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "vaca" mean?',
         '"Vaca" is the Spanish word for "cow".',
         'cow',
         '"Vaca" means "cow".',
         47
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('goat', false, 0),
       ('sheep', false, 1),
       ('cow', true, 2),
       ('bull', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 48 (ratón) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "ratón" mean?',
         '"Ratón" is the Spanish word for "mouse" (both the animal and the computer device).',
         'mouse',
         '"Ratón" means "mouse".',
         48
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('mouse', true, 0),
       ('rat', false, 1),
       ('rabbit', false, 2),
       ('hamster', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 49 (oso) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "oso" mean?',
         '"Oso" is the Spanish word for "bear".',
         'bear',
         '"Oso" means "bear".',
         49
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('wolf', false, 0),
       ('fox', false, 1),
       ('bear', true, 2),
       ('lion', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 50 (uno) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "uno" mean?',
         '"Uno" is the number "one"; before a masculine noun it becomes "un".',
         'one',
         '"Uno" means "one".',
         50
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('one', true, 0),
       ('two', false, 1),
       ('three', false, 2),
       ('zero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 51 (dos) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "two" to Spanish.',
         '"Dos" is the Spanish word for "two".',
         'dos',
         '"Two" in Spanish is "dos".',
         51
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tres', false, 0),
       ('dos', true, 1),
       ('doce', false, 2),
       ('diez', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 52 (diez) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "diez"?',
         '"Diez" is the Spanish word for "ten".',
         'ten',
         '"Diez" means "ten".',
         52
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('twelve', false, 0),
       ('eleven', false, 1),
       ('ten', true, 2),
       ('one hundred', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 53 (once) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "once"?',
         '"Once" is the Spanish word for "eleven" — not to be confused with the English word "once".',
         'eleven',
         '"Once" means "eleven".',
         53
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('one', false, 0),
       ('twelve', false, 1),
       ('one time', false, 2),
       ('eleven', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 54 (veinte) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "veinte"?',
         '"Veinte" is the Spanish word for "twenty".',
         'twenty',
         '"Veinte" means "twenty".',
         54
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('twenty', true, 0),
       ('twelve', false, 1),
       ('two hundred', false, 2),
       ('thirty', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 55 (cien) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "cien"?',
         '"Cien" is exactly "one hundred"; "ciento" is used in compounds like "ciento uno" (101).',
         'one hundred',
         '"Cien" means "one hundred".',
         55
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ten', false, 0),
       ('one thousand', false, 1),
       ('one hundred', true, 2),
       ('fifty', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 56 (mil) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What number is "mil"?',
         '"Mil" is the Spanish word for "one thousand".',
         'one thousand',
         '"Mil" means "one thousand".',
         56
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('one million', false, 0),
       ('one hundred', false, 1),
       ('ten thousand', false, 2),
       ('one thousand', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 57 (primero) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "primero" mean?',
         '"Primero" is the ordinal "first"; it shortens to "primer" before a masculine singular noun.',
         'first',
         '"Primero" means "first".',
         57
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('first', true, 0),
       ('one', false, 1),
       ('best', false, 2),
       ('initial', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 58 (segundo) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "segundo" mean?',
         '"Segundo" means "second" — both the ordinal number and the unit of time.',
         'second',
         '"Segundo" means "second".',
         58
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('two', false, 0),
       ('next', false, 1),
       ('second', true, 2),
       ('again', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 59 (hora) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hora" mean?',
         '"Hora" is the Spanish word for "hour"; "¿Qué hora es?" asks "what time is it?".',
         'hour',
         '"Hora" means "hour".',
         59
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('minute', false, 0),
       ('hour', true, 1),
       ('day', false, 2),
       ('moment', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 60 (minuto) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "minute" to Spanish.',
         '"Minuto" is the Spanish word for "minute".',
         'minuto',
         '"Minute" in Spanish is "minuto".',
         60
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('momento', false, 0),
       ('segundo', false, 1),
       ('hora', false, 2),
       ('minuto', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 61 (¿qué hora es?) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "¿Qué hora es?" mean?',
         '"¿Qué hora es?" is how you ask "what time is it?" in Spanish.',
         'what time is it?',
         '"¿Qué hora es?" means "what time is it?".',
         61
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('what time is it?', true, 0),
       ('what day is it?', false, 1),
       ('how long has it been?', false, 2),
       ('when?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 62 (es la una) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "it is one o''clock" in Spanish?',
         'For 1:00 use the singular "Es la una"; for other hours use "Son las...".',
         'Es la una.',
         '"It is one o''clock" is "Es la una".',
         62
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Son la una.', false, 0),
       ('Es la una.', true, 1),
       ('Son las uno.', false, 2),
       ('Está la una.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 63 (son las tres) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "it is three o''clock"?',
         'For any hour other than one, use "Son las..." with the feminine plural article.',
         'Son las tres.',
         '"It is three o''clock" is "Son las tres".',
         63
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Es las tres.', false, 0),
       ('Está las tres.', false, 1),
       ('Son las tres.', true, 2),
       ('Es la tres.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 64 (lunes) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "lunes" mean?',
         '"Lunes" is "Monday". Days of the week are not capitalized in Spanish.',
         'Monday',
         '"Lunes" means "Monday".',
         64
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sunday', false, 0),
       ('Tuesday', false, 1),
       ('Friday', false, 2),
       ('Monday', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 65 (martes) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "martes" mean?',
         '"Martes" is "Tuesday".',
         'Tuesday',
         '"Martes" means "Tuesday".',
         65
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tuesday', true, 0),
       ('Thursday', false, 1),
       ('March', false, 2),
       ('Monday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 66 (miércoles) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "miércoles" mean?',
         '"Miércoles" is "Wednesday".',
         'Wednesday',
         '"Miércoles" means "Wednesday".',
         66
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Tuesday', false, 0),
       ('Wednesday', true, 1),
       ('Thursday', false, 2),
       ('Saturday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 67 (jueves) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "jueves" mean?',
         '"Jueves" is "Thursday".',
         'Thursday',
         '"Jueves" means "Thursday".',
         67
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Friday', false, 0),
       ('Tuesday', false, 1),
       ('Thursday', true, 2),
       ('Wednesday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 68 (viernes) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "viernes" mean?',
         '"Viernes" is "Friday".',
         'Friday',
         '"Viernes" means "Friday".',
         68
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Sunday', false, 0),
       ('Saturday', false, 1),
       ('Thursday', false, 2),
       ('Friday', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 69 (sábado) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "sábado" mean?',
         '"Sábado" is "Saturday".',
         'Saturday',
         '"Sábado" means "Saturday".',
         69
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Saturday', true, 0),
       ('Sunday', false, 1),
       ('Friday', false, 2),
       ('weekend', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 70 (domingo) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "Sunday" to Spanish.',
         '"Domingo" is the Spanish word for "Sunday".',
         'domingo',
         '"Sunday" in Spanish is "domingo".',
         70
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sábado', false, 0),
       ('domingo', true, 1),
       ('semana', false, 2),
       ('lunes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 71 (enero) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "enero" mean?',
         '"Enero" is "January". Months are not capitalized in Spanish.',
         'January',
         '"Enero" means "January".',
         71
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('February', false, 0),
       ('June', false, 1),
       ('January', true, 2),
       ('July', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 72 (febrero) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "febrero" mean?',
         '"Febrero" is "February".',
         'February',
         '"Febrero" means "February".',
         72
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('February', true, 0),
       ('March', false, 1),
       ('December', false, 2),
       ('April', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 73 (marzo) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "marzo" mean?',
         '"Marzo" is "March".',
         'March',
         '"Marzo" means "March".',
         73
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('May', false, 0),
       ('March', true, 1),
       ('Tuesday', false, 2),
       ('Monday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 74 (abril) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "abril" mean?',
         '"Abril" is "April".',
         'April',
         '"Abril" means "April".',
         74
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('August', false, 0),
       ('October', false, 1),
       ('April', true, 2),
       ('May', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 75 (mayo) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mayo" mean?',
         '"Mayo" is "May".',
         'May',
         '"Mayo" means "May".',
         75
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('March', false, 0),
       ('June', false, 1),
       ('July', false, 2),
       ('May', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 76 (junio) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "junio" mean?',
         '"Junio" is "June".',
         'June',
         '"Junio" means "June".',
         76
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('June', true, 0),
       ('July', false, 1),
       ('January', false, 2),
       ('August', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 77 (julio) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "julio" mean?',
         '"Julio" is "July".',
         'July',
         '"Julio" means "July".',
         77
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('June', false, 0),
       ('July', true, 1),
       ('August', false, 2),
       ('Tuesday', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 78 (agosto) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "agosto" mean?',
         '"Agosto" is "August".',
         'August',
         '"Agosto" means "August".',
         78
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('October', false, 0),
       ('September', false, 1),
       ('August', true, 2),
       ('April', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 79 (septiembre) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "septiembre" mean?',
         '"Septiembre" is "September".',
         'September',
         '"Septiembre" means "September".',
         79
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('November', false, 0),
       ('December', false, 1),
       ('October', false, 2),
       ('September', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 80 (octubre) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "octubre" mean?',
         '"Octubre" is "October".',
         'October',
         '"Octubre" means "October".',
         80
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('October', true, 0),
       ('August', false, 1),
       ('November', false, 2),
       ('September', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 81 (noviembre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "noviembre" mean?',
         '"Noviembre" is "November".',
         'November',
         '"Noviembre" means "November".',
         81
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('December', false, 0),
       ('November', true, 1),
       ('October', false, 2),
       ('September', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 82 (diciembre) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "diciembre" mean?',
         '"Diciembre" is "December".',
         'December',
         '"Diciembre" means "December".',
         82
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('November', false, 0),
       ('October', false, 1),
       ('December', true, 2),
       ('January', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 83 (hoy) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hoy" mean?',
         '"Hoy" is the Spanish word for "today".',
         'today',
         '"Hoy" means "today".',
         83
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('yesterday', false, 0),
       ('tomorrow', false, 1),
       ('now', false, 2),
       ('today', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 84 (ayer) ----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "ayer" mean?',
         '"Ayer" is the Spanish word for "yesterday".',
         'yesterday',
         '"Ayer" means "yesterday".',
         84
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('yesterday', true, 0),
       ('today', false, 1),
       ('the day before', false, 2),
       ('tomorrow', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 85 (mañana) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mañana" mean?',
         '"Mañana" can mean "tomorrow" or "morning" depending on context.',
         'tomorrow / morning',
         '"Mañana" means "tomorrow" or "morning".',
         85
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('today', false, 0),
       ('tomorrow / morning', true, 1),
       ('yesterday', false, 2),
       ('afternoon', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 86 (semana) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "semana" mean?',
         '"Semana" is the Spanish word for "week".',
         'week',
         '"Semana" means "week".',
         86
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('month', false, 0),
       ('year', false, 1),
       ('week', true, 2),
       ('weekend', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 87 (mes) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "mes" mean?',
         '"Mes" is the Spanish word for "month".',
         'month',
         '"Mes" means "month".',
         87
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('table', false, 0),
       ('month', true, 1),
       ('half', false, 2),
       ('mass', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 88 (año) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "año" mean?',
         '"Año" means "year". Don''t drop the tilde — "ano" without it means something very different.',
         'year',
         '"Año" means "year".',
         88
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('week', false, 0),
       ('day', false, 1),
       ('year', true, 2),
       ('time', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 89 (fecha) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "fecha" mean?',
         '"Fecha" is the Spanish word for "date" (calendar date).',
         'date',
         '"Fecha" means "date".',
         89
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('appointment', false, 0),
       ('day', false, 1),
       ('time', false, 2),
       ('date', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 90 (¿qué fecha es hoy?) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "¿Qué fecha es hoy?" ask?',
         'This question asks "what''s today''s date?".',
         'what''s today''s date?',
         '"¿Qué fecha es hoy?" asks "what''s today''s date?".',
         90
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('what''s today''s date?', true, 0),
       ('what day of the week is it?', false, 1),
       ('what time is it?', false, 2),
       ('when is your birthday?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 91 (hace frío) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hace frío" mean?',
         'Spanish uses "hacer" (to make/do) for many weather expressions. "Hace frío" = "it''s cold".',
         'it''s cold',
         '"Hace frío" means "it''s cold".',
         91
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I''m cold', false, 0),
       ('it''s hot', false, 1),
       ('it''s cold', true, 2),
       ('it''s freezing solid', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 92 (hace calor) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hace calor" mean?',
         '"Hace calor" literally "it makes heat" — used for "it''s hot" (weather).',
         'it''s hot',
         '"Hace calor" means "it''s hot".',
         92
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I''m hot', false, 0),
       ('the food is hot', false, 1),
       ('it''s sunny', false, 2),
       ('it''s hot', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 93 (llueve) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "llueve" mean?',
         '"Llueve" is the present-tense form of "llover" — "it''s raining".',
         'it''s raining',
         '"Llueve" means "it''s raining".',
         93
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('it''s raining', true, 0),
       ('it''s snowing', false, 1),
       ('it''s windy', false, 2),
       ('it''s cloudy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 94 (nieva) ---------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "nieva" mean?',
         '"Nieva" comes from "nevar" — "it''s snowing".',
         'it''s snowing',
         '"Nieva" means "it''s snowing".',
         94
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('it''s windy', false, 0),
       ('it''s snowing', true, 1),
       ('it''s freezing', false, 2),
       ('it''s clearing up', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 95 (sol) -----------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hace sol" mean?',
         '"Hace sol" — literally "it makes sun" — means "it''s sunny".',
         'it''s sunny',
         '"Hace sol" means "it''s sunny".',
         95
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('it''s cloudy', false, 0),
       ('it''s windy', false, 1),
       ('it''s sunny', true, 2),
       ('it''s hot', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 96 (viento) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hace viento" mean?',
         '"Hace viento" means "it''s windy".',
         'it''s windy',
         '"Hace viento" means "it''s windy".',
         96
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('there''s a breeze', false, 0),
       ('it''s freezing', false, 1),
       ('it''s raining', false, 2),
       ('it''s windy', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 97 (tiempo) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "tiempo" mean in "¿Qué tiempo hace?"',
         'In this phrase "tiempo" means "weather". "Tiempo" can also mean "time".',
         'weather',
         'In "¿Qué tiempo hace?", "tiempo" means "weather".',
         97
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('time', false, 0),
       ('weather', true, 1),
       ('season', false, 2),
       ('climate', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 98 (verano) --------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "verano" mean?',
         '"Verano" is the Spanish word for "summer".',
         'summer',
         '"Verano" means "summer".',
         98
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('spring', false, 0),
       ('autumn', false, 1),
       ('summer', true, 2),
       ('winter', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 99 (invierno) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "invierno" mean?',
         '"Invierno" is the Spanish word for "winter".',
         'winter',
         '"Invierno" means "winter".',
         99
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('winter', true, 0),
       ('summer', false, 1),
       ('autumn', false, 2),
       ('cold season', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 100 (hablar - yo) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "hablar" for "yo" in the present tense.',
         'For regular -ar verbs the "yo" form ends in -o: "hablo".',
         'hablo',
         '"Yo hablo" means "I speak".',
         100
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablo', true, 0),
       ('hablas', false, 1),
       ('habla', false, 2),
       ('hablamos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 101 (hablar - tú) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "hablar" for "tú" in the present tense.',
         'Regular -ar verbs in "tú" form end in -as: "hablas".',
         'hablas',
         '"Tú hablas" means "you speak".',
         101
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablo', false, 0),
       ('hablas', true, 1),
       ('habláis', false, 2),
       ('hablan', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 102 (hablar - nosotros) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "hablar" for "nosotros" in the present tense.',
         'Regular -ar verbs in "nosotros" form end in -amos: "hablamos".',
         'hablamos',
         '"Nosotros hablamos" means "we speak".',
         102
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablan', false, 0),
       ('habláis', false, 1),
       ('hablamos', true, 2),
       ('hablo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 103 (comer - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "comer" for "yo" in the present tense.',
         'Regular -er verbs in "yo" form end in -o: "como".',
         'como',
         '"Yo como" means "I eat".',
         103
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('come', false, 0),
       ('como', true, 1),
       ('comes', false, 2),
       ('comemos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 104 (comer - él) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "comer" for "él" in the present tense.',
         'Regular -er verbs in third person singular end in -e: "come".',
         'come',
         '"Él come" means "he eats".',
         104
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('come', true, 0),
       ('comen', false, 1),
       ('coméis', false, 2),
       ('como', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 105 (vivir - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "vivir" for "yo" in the present tense.',
         'Regular -ir verbs in "yo" form end in -o: "vivo".',
         'vivo',
         '"Yo vivo" means "I live".',
         105
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vive', false, 0),
       ('vives', false, 1),
       ('vivo', true, 2),
       ('vivimos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 106 (vivir - nosotros) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "vivir" for "nosotros" in the present tense.',
         'Regular -ir verbs in "nosotros" form end in -imos: "vivimos".',
         'vivimos',
         '"Nosotros vivimos" means "we live".',
         106
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vivamos', false, 0),
       ('vivimos', true, 1),
       ('vivemos', false, 2),
       ('viven', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 107 (ellos hablar) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Choose the correct conjugation: "Ellos ___ español".',
         '"Ellos hablan" — third person plural of -ar verbs ends in -an.',
         'hablan',
         '"Ellos hablan español" means "they speak Spanish".',
         107
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('habla', false, 0),
       ('hablamos', false, 1),
       ('habláis', false, 2),
       ('hablan', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 108 (ser - yo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "ser" for "yo" in the present.',
         '"Ser" is irregular: yo soy, tú eres, él es, nosotros somos, vosotros sois, ellos son.',
         'soy',
         '"Yo soy" means "I am".',
         108
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('soy', true, 0),
       ('estoy', false, 1),
       ('es', false, 2),
       ('eres', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 109 (ser - él) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "ser" for "él" in the present.',
         'Third-person singular of "ser" is "es".',
         'es',
         '"Él es" means "he is".',
         109
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('está', false, 0),
       ('es', true, 1),
       ('son', false, 2),
       ('soy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 110 (ser - nosotros) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "ser" for "nosotros" in the present.',
         '"Nosotros somos" — first person plural of "ser".',
         'somos',
         '"Nosotros somos" means "we are".',
         110
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estamos', false, 0),
       ('sois', false, 1),
       ('somos', true, 2),
       ('son', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 111 (estar - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "estar" for "yo" in the present.',
         '"Estar" is irregular: yo estoy, tú estás, él está, nosotros estamos, vosotros estáis, ellos están.',
         'estoy',
         '"Yo estoy" means "I am" (state/location).',
         111
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('soy', false, 0),
       ('estás', false, 1),
       ('está', false, 2),
       ('estoy', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 112 (estar - tú) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "estar" for "tú" in the present.',
         '"Tú estás" — note the accent on -ás.',
         'estás',
         '"Tú estás" means "you are" (state/location).',
         112
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estas', false, 0),
       ('estás', true, 1),
       ('estoy', false, 2),
       ('eres', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 113 (ir - yo) ------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "ir" for "yo" in the present.',
         '"Ir" is highly irregular: yo voy, tú vas, él va, nosotros vamos, vosotros vais, ellos van.',
         'voy',
         '"Yo voy" means "I go".',
         113
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('voy', true, 0),
       ('vas', false, 1),
       ('va', false, 2),
       ('iré', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 114 (ir - nosotros) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "ir" for "nosotros" in the present.',
         '"Nosotros vamos" — also used as "let''s go!".',
         'vamos',
         '"Nosotros vamos" means "we go" / "let''s go".',
         114
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('voy', false, 0),
       ('van', false, 1),
       ('vamos', true, 2),
       ('iremos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 115 (tener - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "tener" for "yo" in the present.',
         '"Tener" is irregular: yo tengo, tú tienes, él tiene, nosotros tenemos, vosotros tenéis, ellos tienen.',
         'tengo',
         '"Yo tengo" means "I have".',
         115
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('teno', false, 0),
       ('tienes', false, 1),
       ('tengo', true, 2),
       ('tiene', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 116 (tener - tú) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "tener" for "tú" in the present.',
         '"Tú tienes" — stem changes from e to ie in tú/él/ellos forms.',
         'tienes',
         '"Tú tienes" means "you have".',
         116
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tenes', false, 0),
       ('tienes', true, 1),
       ('tengo', false, 2),
       ('tiene', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 117 (hacer - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "hacer" for "yo" in the present.',
         '"Hacer" has an irregular "yo" form: "hago".',
         'hago',
         '"Yo hago" means "I do/make".',
         117
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('haso', false, 0),
       ('haces', false, 1),
       ('hace', false, 2),
       ('hago', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 118 (hacer - ellos) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "hacer" for "ellos" in the present.',
         '"Ellos hacen" — third person plural is regular.',
         'hacen',
         '"Ellos hacen" means "they do/make".',
         118
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hacen', true, 0),
       ('hago', false, 1),
       ('haceis', false, 2),
       ('hacéis', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 119 (yo tengo hambre) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "tengo hambre" mean?',
         'Spanish uses "tener" (to have) for many states: "tengo hambre" literally "I have hunger".',
         'I''m hungry',
         '"Tengo hambre" means "I''m hungry".',
         119
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I''m thirsty', false, 0),
       ('I''m tired', false, 1),
       ('I''m hungry', true, 2),
       ('I''m sleepy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 120 (tener sed) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "tengo sed" mean?',
         '"Tengo sed" literally "I have thirst" — "I''m thirsty".',
         'I''m thirsty',
         '"Tengo sed" means "I''m thirsty".',
         120
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I''m hot', false, 0),
       ('I''m thirsty', true, 1),
       ('I''m hungry', false, 2),
       ('I''m sleepy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 121 (tener años) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I am 25 years old" in Spanish?',
         'Spanish uses "tener" for age: "Tengo 25 años" — literally "I have 25 years".',
         'Tengo 25 años.',
         '"I am 25 years old" is "Tengo 25 años".',
         121
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Soy 25 años.', false, 0),
       ('Estoy 25 años.', false, 1),
       ('Tengo 25 años.', true, 2),
       ('Tengo 25 años viejo.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 122 (querer - yo) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "querer" for "yo" in the present.',
         '"Querer" stem-changes e → ie: yo quiero, tú quieres, él quiere, nosotros queremos.',
         'quiero',
         '"Yo quiero" means "I want".',
         122
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('quero', false, 0),
       ('quieres', false, 1),
       ('quiero', true, 2),
       ('queremos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 123 (poder - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "poder" for "yo" in the present.',
         '"Poder" stem-changes o → ue: yo puedo, tú puedes, él puede, nosotros podemos.',
         'puedo',
         '"Yo puedo" means "I can".',
         123
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('puedo', true, 0),
       ('podo', false, 1),
       ('puede', false, 2),
       ('podemos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 124 (saber vs conocer) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which verb means "to know" a fact or how to do something?',
         '"Saber" is for facts/skills; "conocer" is for people/places (being familiar with).',
         'saber',
         '"Saber" is "to know" a fact; "conocer" is "to know" a person/place.',
         124
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('conocer', false, 0),
       ('saber', true, 1),
       ('aprender', false, 2),
       ('entender', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 125 (saber - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "saber" for "yo" in the present.',
         '"Saber" has an irregular yo form: "sé".',
         'sé',
         '"Yo sé" means "I know".',
         125
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sabo', false, 0),
       ('sabes', false, 1),
       ('sabe', false, 2),
       ('sé', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 126 (conocer - yo) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "conocer" for "yo" in the present.',
         '"Conocer" has an irregular yo form: "conozco".',
         'conozco',
         '"Yo conozco" means "I know" (a person/place).',
         126
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('conozco', true, 0),
       ('conoco', false, 1),
       ('conoce', false, 2),
       ('conoces', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 127 (venir - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "venir" for "yo" in the present.',
         '"Venir" is irregular: yo vengo, tú vienes, él viene, nosotros venimos.',
         'vengo',
         '"Yo vengo" means "I come".',
         127
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('veno', false, 0),
       ('vengo', true, 1),
       ('viene', false, 2),
       ('vienes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 128 (decir - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "decir" for "yo" in the present.',
         '"Decir" is irregular: yo digo, tú dices, él dice, nosotros decimos.',
         'digo',
         '"Yo digo" means "I say".',
         128
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('deco', false, 0),
       ('dices', false, 1),
       ('digo', true, 2),
       ('dije', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 129 (ver - yo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "ver" for "yo" in the present.',
         '"Ver" has an irregular yo form: "veo".',
         'veo',
         '"Yo veo" means "I see".',
         129
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('veo', true, 0),
       ('vo', false, 1),
       ('ves', false, 2),
       ('ve', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 130 (dar - yo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dar" for "yo" in the present.',
         '"Dar" has an irregular yo form: "doy".',
         'doy',
         '"Yo doy" means "I give".',
         130
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('do', false, 0),
       ('das', false, 1),
       ('doy', true, 2),
       ('da', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 131 (poner - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "poner" for "yo" in the present.',
         '"Poner" has an irregular yo form: "pongo".',
         'pongo',
         '"Yo pongo" means "I put".',
         131
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('pones', false, 0),
       ('pongo', true, 1),
       ('puse', false, 2),
       ('pone', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 132 (salir - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "salir" for "yo" in the present.',
         '"Salir" has an irregular yo form: "salgo".',
         'salgo',
         '"Yo salgo" means "I go out / I leave".',
         132
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('salo', false, 0),
       ('sales', false, 1),
       ('sale', false, 2),
       ('salgo', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 133 (oír - yo) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "oír" for "yo" in the present.',
         '"Oír" yo form is "oigo".',
         'oigo',
         '"Yo oigo" means "I hear".',
         133
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('oigo', true, 0),
       ('oyo', false, 1),
       ('oye', false, 2),
       ('oyes', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 134 (pedir - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "pedir" for "yo" in the present.',
         '"Pedir" stem-changes e → i: yo pido, tú pides, él pide, nosotros pedimos.',
         'pido',
         '"Yo pido" means "I ask for".',
         134
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('pedo', false, 0),
       ('pido', true, 1),
       ('pides', false, 2),
       ('pedí', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 135 (dormir - yo) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "dormir" for "yo" in the present.',
         '"Dormir" stem-changes o → ue: yo duermo, tú duermes, él duerme, nosotros dormimos.',
         'duermo',
         '"Yo duermo" means "I sleep".',
         135
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dormo', false, 0),
       ('duermes', false, 1),
       ('duermo', true, 2),
       ('dormimos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 136 (jugar - yo) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "jugar" for "yo" in the present.',
         '"Jugar" is unique in changing u → ue: yo juego.',
         'juego',
         '"Yo juego" means "I play".',
         136
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('jugo', false, 0),
       ('juegas', false, 1),
       ('jugamos', false, 2),
       ('juego', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 137 (escribir - yo) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "escribir" for "yo" in the present.',
         '"Escribir" is a regular -ir verb: yo escribo.',
         'escribo',
         '"Yo escribo" means "I write".',
         137
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('escribo', true, 0),
       ('escribes', false, 1),
       ('escribe', false, 2),
       ('escribimos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 138 (leer - él) ----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "leer" for "él" in the present.',
         '"Leer" is regular in the present: él lee.',
         'lee',
         '"Él lee" means "he reads".',
         138
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('lees', false, 0),
       ('lee', true, 1),
       ('leo', false, 2),
       ('leyó', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 139 (trabajar - tú) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "trabajar" for "tú" in the present.',
         '"Trabajar" is regular -ar: tú trabajas.',
         'trabajas',
         '"Tú trabajas" means "you work".',
         139
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('trabajo', false, 0),
       ('trabajas', true, 1),
       ('trabajan', false, 2),
       ('trabaja', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 140 (estudiar - nosotros) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conjugate "estudiar" for "nosotros" in the present.',
         '"Estudiar" is regular -ar: nosotros estudiamos.',
         'estudiamos',
         '"Nosotros estudiamos" means "we study".',
         140
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estudian', false, 0),
       ('estudiáis', false, 1),
       ('estudiamos', true, 2),
       ('estudio', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 141 (gustar) -------------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I like the book" using "gustar".',
         '"Gustar" works backwards in Spanish: literally "the book is pleasing to me".',
         'Me gusta el libro.',
         '"I like the book" is "Me gusta el libro".',
         141
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yo gusto el libro.', false, 0),
       ('Yo gusta el libro.', false, 1),
       ('Me gusta el libro.', true, 2),
       ('Me gustan el libro.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 142 (gustar plural) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I like the books".',
         'With plural subjects "gustar" becomes "gustan": "Me gustan los libros".',
         'Me gustan los libros.',
         '"I like the books" is "Me gustan los libros".',
         142
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Me gustan los libros.', true, 0),
       ('Me gusta los libros.', false, 1),
       ('Yo gusto los libros.', false, 2),
       ('Me gustas los libros.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 143 (ser para descripción) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which verb is used for permanent characteristics: "ser" or "estar"?',
         '"Ser" is for permanent traits, identity, origin, time, dates; "estar" is for states and locations.',
         'ser',
         '"Ser" is used for permanent characteristics; "estar" is for temporary states/locations.',
         143
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estar', false, 0),
       ('ser', true, 1),
       ('haber', false, 2),
       ('tener', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 144 (estar para ubicación) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which verb expresses location: "ser" or "estar"?',
         'Location of objects/people uses "estar". Exception: events use "ser" ("La fiesta es en mi casa").',
         'estar',
         '"Estar" is used for location.',
         144
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ser', false, 0),
       ('tener', false, 1),
       ('estar', true, 2),
       ('hacer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 145 (ir a + infinitive) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I am going to eat" using "ir"?',
         'Use "ir a" + infinitive to express near future: "Voy a comer".',
         'Voy a comer.',
         '"I am going to eat" is "Voy a comer".',
         145
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Voy comer.', false, 0),
       ('Voy a comer.', true, 1),
       ('Iré comer.', false, 2),
       ('Vaya a comer.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 146 (haber - hay) --------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hay" mean?',
         '"Hay" is the impersonal form of "haber": "there is / there are".',
         'there is / there are',
         '"Hay" means "there is" or "there are".',
         146
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('he has', false, 0),
       ('today', false, 1),
       ('there is / there are', true, 2),
       ('have to', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 147 (ser hora) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I am a student"?',
         '"Soy estudiante" — profession/identity uses "ser". Note: no article needed.',
         'Soy estudiante.',
         '"I am a student" is "Soy estudiante".',
         147
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Estoy estudiante.', false, 0),
       ('Soy un estudiante.', false, 1),
       ('Tengo estudiante.', false, 2),
       ('Soy estudiante.', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 148 (estar contento) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I am happy" (right now)?',
         'A current emotional state uses "estar": "Estoy contento/a".',
         'Estoy contento.',
         '"I am happy" (state) is "Estoy contento/a".',
         148
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Estoy contento.', true, 0),
       ('Soy contento.', false, 1),
       ('Tengo contento.', false, 2),
       ('Hago contento.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 149 (hablar yo present meaning) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "yo hablo español" mean?',
         '"Yo hablo español" — present-tense first person of "hablar".',
         'I speak Spanish',
         '"Yo hablo español" means "I speak Spanish".',
         149
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I will speak Spanish', false, 0),
       ('I speak Spanish', true, 1),
       ('I spoke Spanish', false, 2),
       ('I am speaking Spanish (right now only)', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 150 (preterite hablar yo) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "hablar" for "yo".',
         'Regular -ar preterite "yo" ends in -é: "hablé".',
         'hablé',
         '"Yo hablé" means "I spoke".',
         150
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablé', true, 0),
       ('hablaba', false, 1),
       ('hablo', false, 2),
       ('habló', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 151 (preterite hablar él) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "hablar" for "él".',
         'Regular -ar preterite "él" ends in -ó: "habló".',
         'habló',
         '"Él habló" means "he spoke".',
         151
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablo', false, 0),
       ('habló', true, 1),
       ('hablaba', false, 2),
       ('hablaron', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 152 (preterite comer yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "comer" for "yo".',
         'Regular -er/-ir preterite "yo" ends in -í: "comí".',
         'comí',
         '"Yo comí" means "I ate".',
         152
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comió', false, 0),
       ('comía', false, 1),
       ('comí', true, 2),
       ('comer', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 153 (preterite comer él) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "comer" for "él".',
         'Regular -er/-ir preterite "él" ends in -ió: "comió".',
         'comió',
         '"Él comió" means "he ate".',
         153
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comía', false, 0),
       ('comió', true, 1),
       ('comí', false, 2),
       ('come', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 154 (preterite vivir nosotros) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "vivir" for "nosotros".',
         'For -ir verbs, present and preterite "nosotros" forms are identical: "vivimos".',
         'vivimos',
         '"Nosotros vivimos" can be present or preterite — context tells you which.',
         154
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vivíamos', false, 0),
       ('vivieron', false, 1),
       ('vivimos', true, 2),
       ('viviremos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 155 (preterite ir yo) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "ir" for "yo".',
         '"Ir" and "ser" share the same preterite forms: fui, fuiste, fue, fuimos, fuisteis, fueron.',
         'fui',
         '"Yo fui" means "I went" (or "I was" from ser).',
         155
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('iba', false, 0),
       ('fue', false, 1),
       ('fui', true, 2),
       ('voy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 156 (preterite ser él) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "ser" for "él".',
         '"Ser" and "ir" share preterite forms: él fue = he was / he went.',
         'fue',
         '"Él fue" means "he was" or "he went".',
         156
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('era', false, 0),
       ('fue', true, 1),
       ('fui', false, 2),
       ('es', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 157 (preterite tener yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "tener" for "yo".',
         '"Tener" preterite is irregular: tuve, tuviste, tuvo, tuvimos, tuvisteis, tuvieron.',
         'tuve',
         '"Yo tuve" means "I had".',
         157
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tenía', false, 0),
       ('tuvo', false, 1),
       ('tení', false, 2),
       ('tuve', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 158 (preterite estar yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "estar" for "yo".',
         '"Estar" preterite: estuve, estuviste, estuvo, estuvimos, estuvisteis, estuvieron.',
         'estuve',
         '"Yo estuve" means "I was" (state/location, past).',
         158
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estuve', true, 0),
       ('estaba', false, 1),
       ('estoy', false, 2),
       ('estuvo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 159 (preterite hacer yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "hacer" for "yo".',
         '"Hacer" preterite: hice, hiciste, hizo, hicimos, hicisteis, hicieron.',
         'hice',
         '"Yo hice" means "I did/made".',
         159
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hacía', false, 0),
       ('hice', true, 1),
       ('hizo', false, 2),
       ('hago', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 160 (preterite hacer él) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "hacer" for "él".',
         'Note the spelling change: "hizo" (with z) — pronunciation rule.',
         'hizo',
         '"Él hizo" means "he did/made".',
         160
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hizo', true, 0),
       ('hice', false, 1),
       ('hició', false, 2),
       ('hicieron', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 161 (preterite venir yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "venir" for "yo".',
         '"Venir" preterite: vine, viniste, vino, vinimos, vinisteis, vinieron.',
         'vine',
         '"Yo vine" means "I came".',
         161
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vení', false, 0),
       ('venía', false, 1),
       ('vine', true, 2),
       ('vino', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 162 (preterite decir yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "decir" for "yo".',
         '"Decir" preterite: dije, dijiste, dijo, dijimos, dijisteis, dijeron (note no "i" in -eron).',
         'dije',
         '"Yo dije" means "I said".',
         162
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('decí', false, 0),
       ('dijo', false, 1),
       ('decía', false, 2),
       ('dije', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 163 (preterite poder yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "poder" for "yo".',
         '"Poder" preterite: pude, pudiste, pudo, pudimos, pudisteis, pudieron.',
         'pude',
         '"Yo pude" means "I could / I managed to".',
         163
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('pude', true, 0),
       ('podía', false, 1),
       ('pudo', false, 2),
       ('puedo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 164 (preterite querer yo) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "querer" for "yo".',
         '"Querer" preterite: quise, quisiste, quiso, quisimos, quisisteis, quisieron.',
         'quise',
         '"Yo quise" means "I wanted / I tried".',
         164
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('quiso', false, 0),
       ('quise', true, 1),
       ('quería', false, 2),
       ('quiero', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 165 (preterite saber yo) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "saber" for "yo".',
         '"Saber" preterite: supe, supiste, supo, supimos, supisteis, supieron — "I found out".',
         'supe',
         '"Yo supe" means "I found out".',
         165
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sabí', false, 0),
       ('sabía', false, 1),
       ('supe', true, 2),
       ('supo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 166 (preterite dar yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "dar" for "yo".',
         '"Dar" preterite uses -er/-ir endings without accents: di, diste, dio, dimos, disteis, dieron.',
         'di',
         '"Yo di" means "I gave".',
         166
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dí', false, 0),
       ('di', true, 1),
       ('daba', false, 2),
       ('doy', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 167 (preterite ver yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "ver" for "yo".',
         '"Ver" preterite has no accents: vi, viste, vio, vimos, visteis, vieron.',
         'vi',
         '"Yo vi" means "I saw".',
         167
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('veía', false, 0),
       ('vio', false, 1),
       ('veo', false, 2),
       ('vi', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 168 (imperfect hablar yo) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "hablar" for "yo".',
         'Regular -ar imperfect: hablaba, hablabas, hablaba, hablábamos, hablabais, hablaban.',
         'hablaba',
         '"Yo hablaba" means "I used to speak" / "I was speaking".',
         168
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablé', false, 0),
       ('hablaba', true, 1),
       ('hablo', false, 2),
       ('habló', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 169 (imperfect comer yo) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "comer" for "yo".',
         'Regular -er/-ir imperfect: comía, comías, comía, comíamos, comíais, comían.',
         'comía',
         '"Yo comía" means "I used to eat" / "I was eating".',
         169
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comía', true, 0),
       ('comí', false, 1),
       ('comio', false, 2),
       ('como', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 170 (imperfect ser yo) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "ser" for "yo".',
         '"Ser" imperfect is irregular: era, eras, era, éramos, erais, eran.',
         'era',
         '"Yo era" means "I used to be / I was".',
         170
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fui', false, 0),
       ('soy', false, 1),
       ('era', true, 2),
       ('estaba', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 171 (imperfect ir yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "ir" for "yo".',
         '"Ir" imperfect is irregular: iba, ibas, iba, íbamos, ibais, iban.',
         'iba',
         '"Yo iba" means "I used to go / I was going".',
         171
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fui', false, 0),
       ('iba', true, 1),
       ('voy', false, 2),
       ('iré', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 172 (imperfect ver yo) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "ver" for "yo".',
         '"Ver" imperfect is irregular: veía, veías, veía, veíamos, veíais, veían.',
         'veía',
         '"Yo veía" means "I used to see / I was seeing".',
         172
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('via', false, 0),
       ('vi', false, 1),
       ('veo', false, 2),
       ('veía', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 173 (preterite vs imperfect 1) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense describes a completed action: preterite or imperfect?',
         'Preterite describes completed actions with a clear endpoint; imperfect describes ongoing/habitual past actions.',
         'preterite',
         'Preterite = completed past actions; imperfect = ongoing or habitual past.',
         173
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('preterite', true, 0),
       ('imperfect', false, 1),
       ('both equally', false, 2),
       ('neither', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 174 (preterite vs imperfect 2) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense expresses "used to" or habitual past?',
         'The imperfect translates English "used to" + verb and habitual past actions.',
         'imperfect',
         'Imperfect expresses habitual past actions ("used to").',
         174
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('preterite', false, 0),
       ('imperfect', true, 1),
       ('present', false, 2),
       ('future', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 175 (cuando era niño) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Fill in: "Cuando ___ niño, jugaba mucho."',
         '"Cuando era niño" — imperfect for description of background.',
         'era',
         '"Cuando era niño" means "when I was a child".',
         175
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fui', false, 0),
       ('era', true, 1),
       ('estuve', false, 2),
       ('estaba', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 176 (ayer fui) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Fill in: "Ayer ___ al cine."',
         '"Ayer" signals a completed action — use preterite "fui" (I went).',
         'fui',
         '"Ayer fui al cine" means "yesterday I went to the movies".',
         176
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('voy', false, 0),
       ('iba', false, 1),
       ('fui', true, 2),
       ('iré', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 177 (siempre comía) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Fill in: "Siempre ___ pizza los viernes."',
         '"Siempre" + habitual past → imperfect: "comía".',
         'comía',
         '"Siempre comía pizza los viernes" means "I always used to eat pizza on Fridays".',
         177
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comía', true, 0),
       ('comí', false, 1),
       ('como', false, 2),
       ('comeré', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 178 (de repente) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which time expression typically triggers the preterite?',
         '"De repente" (suddenly) marks a specific completed event — preterite.',
         'de repente',
         '"De repente" signals a single completed action → preterite.',
         178
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('todos los días', false, 0),
       ('siempre', false, 1),
       ('de repente', true, 2),
       ('mientras', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 179 (mientras) ---------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which conjunction typically signals two simultaneous past actions (imperfect)?',
         '"Mientras" (while) is followed by imperfect for parallel actions.',
         'mientras',
         '"Mientras" + imperfect describes simultaneous past actions.',
         179
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('cuando', false, 0),
       ('mientras', true, 1),
       ('después', false, 2),
       ('pronto', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 180 (preterite estar él) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "estar" for "él".',
         '"Estar" preterite él form: "estuvo".',
         'estuvo',
         '"Él estuvo" means "he was" (for a defined period).',
         180
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estuvo', true, 0),
       ('estuve', false, 1),
       ('estaba', false, 2),
       ('está', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 181 (preterite ellos comer) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "comer" for "ellos".',
         'Regular -er preterite ellos form: "comieron".',
         'comieron',
         '"Ellos comieron" means "they ate".',
         181
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comían', false, 0),
       ('comieron', true, 1),
       ('comen', false, 2),
       ('comió', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 182 (preterite hablar nosotros) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "hablar" for "nosotros".',
         'For -ar verbs, present and preterite "nosotros" forms are identical: "hablamos".',
         'hablamos',
         '"Nosotros hablamos" can be present or preterite — context decides.',
         182
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablábamos', false, 0),
       ('hablaron', false, 1),
       ('hablamos', true, 2),
       ('hablaremos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 183 (preterite vivir él) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "vivir" for "él".',
         'Regular -ir preterite él form: "vivió".',
         'vivió',
         '"Él vivió" means "he lived".',
         183
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vivía', false, 0),
       ('vivió', true, 1),
       ('vive', false, 2),
       ('vivirá', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 184 (imperfect ir nosotros) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "ir" for "nosotros".',
         '"Ir" imperfect nosotros form: "íbamos".',
         'íbamos',
         '"Nosotros íbamos" means "we used to go / we were going".',
         184
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('íbamos', true, 0),
       ('fuimos', false, 1),
       ('vamos', false, 2),
       ('iremos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 185 (imperfect ser él) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "ser" for "él".',
         '"Ser" imperfect él form: "era".',
         'era',
         '"Él era" means "he used to be / was".',
         185
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('fue', false, 0),
       ('es', false, 1),
       ('era', true, 2),
       ('estaba', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 186 (imperfect estar yo) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "estar" for "yo".',
         '"Estar" imperfect: estaba, estabas, estaba, estábamos, estabais, estaban — regular.',
         'estaba',
         '"Yo estaba" means "I was / I used to be" (state, ongoing).',
         186
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estuve', false, 0),
       ('estaba', true, 1),
       ('estoy', false, 2),
       ('era', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 187 (imperfect tener yo) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Imperfect of "tener" for "yo".',
         '"Tener" imperfect is regular: tenía, tenías, tenía, teníamos, teníais, tenían.',
         'tenía',
         '"Yo tenía" means "I had / I used to have".',
         187
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tuve', false, 0),
       ('tengo', false, 1),
       ('tendré', false, 2),
       ('tenía', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 188 (mientras yo cocinaba) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Fill in: "Mientras yo ___, él llegó."',
         'Background action (cooking) is imperfect ("cocinaba"); interrupting action is preterite ("llegó").',
         'cocinaba',
         'In "mientras cocinaba" the background ongoing action uses imperfect.',
         188
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('cociné', false, 0),
       ('cocinaba', true, 1),
       ('cocino', false, 2),
       ('cocinaré', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 189 (anoche) -----------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "anoche" mean?',
         '"Anoche" means "last night" — a preterite-triggering time expression.',
         'last night',
         '"Anoche" means "last night".',
         189
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tonight', false, 0),
       ('yesterday', false, 1),
       ('last night', true, 2),
       ('this morning', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 190 (hace dos días) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "hace dos días" mean?',
         '"Hace + time" expresses "ago": "hace dos días" = "two days ago".',
         'two days ago',
         '"Hace dos días" means "two days ago".',
         190
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('in two days', false, 0),
       ('two days ago', true, 1),
       ('for two days', false, 2),
       ('two days long', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 191 (preterite trabajar tú) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "trabajar" for "tú".',
         'Regular -ar preterite tú form: "trabajaste".',
         'trabajaste',
         '"Tú trabajaste" means "you worked".',
         191
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('trabajabas', false, 0),
       ('trabajaste', true, 1),
       ('trabajas', false, 2),
       ('trabajarás', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 192 (preterite leer él) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "leer" for "él".',
         '"Leer" has a spelling change in 3rd person: leyó, leyeron (i → y between vowels).',
         'leyó',
         '"Él leyó" means "he read".',
         192
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('lió', false, 0),
       ('leía', false, 1),
       ('leó', false, 2),
       ('leyó', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 193 (preterite pedir él) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "pedir" for "él".',
         '"Pedir" stem-changes e → i in 3rd person preterite: "pidió".',
         'pidió',
         '"Él pidió" means "he asked for / ordered".',
         193
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('pidió', true, 0),
       ('pedió', false, 1),
       ('pedía', false, 2),
       ('pide', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 194 (preterite dormir él) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "dormir" for "él".',
         '"Dormir" stem-changes o → u in 3rd person preterite: "durmió".',
         'durmió',
         '"Él durmió" means "he slept".',
         194
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('dormió', false, 0),
       ('durmió', true, 1),
       ('dormía', false, 2),
       ('duerme', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 195 (description in past) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense describes background, setting, or appearance in the past?',
         'Description in the past (what someone looked like, weather, time) is imperfect.',
         'imperfect',
         'Imperfect describes ongoing background — setting, weather, descriptions, time.',
         195
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('preterite', false, 0),
       ('imperfect', true, 1),
       ('present perfect', false, 2),
       ('pluperfect', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 196 (eran las tres) ---------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "it was three o''clock" in the past?',
         'Time-telling in the past uses imperfect: "Eran las tres".',
         'Eran las tres.',
         '"It was three o''clock" is "Eran las tres".',
         196
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Fueron las tres.', false, 0),
       ('Eran las tres.', true, 1),
       ('Estaban las tres.', false, 2),
       ('Estuvieron las tres.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 197 (preterite hacer tú) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Preterite of "hacer" for "tú".',
         '"Hacer" preterite tú form: "hiciste".',
         'hiciste',
         '"Tú hiciste" means "you did/made".',
         197
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hizo', false, 0),
       ('hacías', false, 1),
       ('hiciste', true, 2),
       ('hacieste', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 198 (todos los días) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense pairs with "todos los días" when narrating the past?',
         '"Todos los días" (every day) + past = habitual → imperfect.',
         'imperfect',
         '"Todos los días" + past triggers imperfect (habitual).',
         198
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('preterite', false, 0),
       ('present', false, 1),
       ('future', false, 2),
       ('imperfect', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 199 (la semana pasada) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which tense pairs with "la semana pasada"?',
         '"La semana pasada" (last week) marks a closed time frame → preterite.',
         'preterite',
         '"La semana pasada" triggers the preterite.',
         199
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('preterite', true, 0),
       ('imperfect', false, 1),
       ('present', false, 2),
       ('future', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 200 (future hablar yo) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "hablar" for "yo".',
         'Future tense uses the infinitive + endings: -é, -ás, -á, -emos, -éis, -án. "Yo hablaré".',
         'hablaré',
         '"Yo hablaré" means "I will speak".',
         200
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablaré', true, 0),
       ('hablaría', false, 1),
       ('hablé', false, 2),
       ('hablo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 201 (future comer él) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "comer" for "él".',
         '"Él comerá" — infinitive + -á.',
         'comerá',
         '"Él comerá" means "he will eat".',
         201
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comió', false, 0),
       ('comerá', true, 1),
       ('comería', false, 2),
       ('coma', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 202 (future vivir nosotros) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "vivir" for "nosotros".',
         '"Nosotros viviremos" — infinitive + -emos.',
         'viviremos',
         '"Nosotros viviremos" means "we will live".',
         202
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vivamos', false, 0),
       ('vivíamos', false, 1),
       ('viviremos', true, 2),
       ('viviríamos', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 203 (future tener yo - irregular stem) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "tener" for "yo".',
         '"Tener" has an irregular future stem: tendr-. Yo tendré.',
         'tendré',
         '"Yo tendré" means "I will have".',
         203
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('teneré', false, 0),
       ('tendré', true, 1),
       ('tendría', false, 2),
       ('tuve', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 204 (future hacer yo - irregular stem) ---------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "hacer" for "yo".',
         '"Hacer" has irregular stem har-: yo haré.',
         'haré',
         '"Yo haré" means "I will do/make".',
         204
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('haceré', false, 0),
       ('hacería', false, 1),
       ('hice', false, 2),
       ('haré', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 205 (future decir tú) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "decir" for "tú".',
         '"Decir" has irregular stem dir-: tú dirás.',
         'dirás',
         '"Tú dirás" means "you will say".',
         205
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('decirás', false, 0),
       ('dirás', true, 1),
       ('dirías', false, 2),
       ('dijiste', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 206 (future poder yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "poder" for "yo".',
         '"Poder" has irregular stem podr-: yo podré.',
         'podré',
         '"Yo podré" means "I will be able to".',
         206
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('podré', true, 0),
       ('poderé', false, 1),
       ('podría', false, 2),
       ('puedo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 207 (future salir yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "salir" for "yo".',
         '"Salir" has irregular stem saldr-: yo saldré.',
         'saldré',
         '"Yo saldré" means "I will leave / go out".',
         207
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('saliré', false, 0),
       ('saldría', false, 1),
       ('saldré', true, 2),
       ('salí', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 208 (future poner ellos) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "poner" for "ellos".',
         '"Poner" has irregular stem pondr-: ellos pondrán.',
         'pondrán',
         '"Ellos pondrán" means "they will put".',
         208
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ponerán', false, 0),
       ('pondrán', true, 1),
       ('pondrían', false, 2),
       ('pusieron', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 209 (future venir yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "venir" for "yo".',
         '"Venir" has irregular stem vendr-: yo vendré.',
         'vendré',
         '"Yo vendré" means "I will come".',
         209
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vine', false, 0),
       ('vendría', false, 1),
       ('veniré', false, 2),
       ('vendré', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 210 (future querer él) -------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "querer" for "él".',
         '"Querer" has irregular stem querr-: él querrá.',
         'querrá',
         '"Él querrá" means "he will want".',
         210
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('quererá', false, 0),
       ('querrá', true, 1),
       ('quería', false, 2),
       ('quiso', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 211 (future saber tú) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "saber" for "tú".',
         '"Saber" has irregular stem sabr-: tú sabrás.',
         'sabrás',
         '"Tú sabrás" means "you will know".',
         211
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sabrás', true, 0),
       ('saberás', false, 1),
       ('sabrías', false, 2),
       ('supiste', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 212 (future haber/habrá) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "habrá" mean?',
         '"Habrá" is the future of "hay": "there will be".',
         'there will be',
         '"Habrá" means "there will be".',
         212
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('there is', false, 0),
       ('there was', false, 1),
       ('there will be', true, 2),
       ('there would be', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 213 (conditional hablar yo) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conditional of "hablar" for "yo".',
         'Conditional = infinitive + -ía, -ías, -ía, -íamos, -íais, -ían. Yo hablaría.',
         'hablaría',
         '"Yo hablaría" means "I would speak".',
         213
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablaré', false, 0),
       ('hablé', false, 1),
       ('hablaba', false, 2),
       ('hablaría', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 214 (conditional comer ellos) -----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conditional of "comer" for "ellos".',
         '"Ellos comerían" — infinitive + -ían.',
         'comerían',
         '"Ellos comerían" means "they would eat".',
         214
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comerían', true, 0),
       ('comerán', false, 1),
       ('comían', false, 2),
       ('comieron', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 215 (conditional tener yo) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conditional of "tener" for "yo".',
         '"Tener" conditional uses the same irregular stem tendr-: yo tendría.',
         'tendría',
         '"Yo tendría" means "I would have".',
         215
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tenería', false, 0),
       ('tendría', true, 1),
       ('tendré', false, 2),
       ('tuviera', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 216 (conditional hacer él) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conditional of "hacer" for "él".',
         '"Hacer" conditional stem har-: él haría.',
         'haría',
         '"Él haría" means "he would do/make".',
         216
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hacería', false, 0),
       ('haría', true, 1),
       ('hará', false, 2),
       ('hizo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 217 (conditional usage) -----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Which English idea does the Spanish conditional typically express?',
         'Spanish conditional expresses "would + verb" — politeness, hypotheticals, future-in-past.',
         'would + verb',
         'The Spanish conditional translates "would + verb".',
         217
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('will + verb', false, 0),
       ('have + verb', false, 1),
       ('would + verb', true, 2),
       ('used to + verb', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 218 (me gustaría) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "me gustaría" mean?',
         '"Me gustaría" is the polite form: "I would like".',
         'I would like',
         '"Me gustaría" means "I would like".',
         218
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I will like', false, 0),
       ('I liked', false, 1),
       ('I like', false, 2),
       ('I would like', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 219 (present perfect haber + participle) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How is the present perfect formed in Spanish?',
         'Present perfect = present of "haber" + past participle. "He hablado" = "I have spoken".',
         'haber (present) + past participle',
         'Present perfect uses "haber" in present + past participle.',
         219
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ser + past participle', false, 0),
       ('estar + gerund', false, 1),
       ('haber (present) + past participle', true, 2),
       ('tener + past participle', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 220 (he hablado) -------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "he hablado" mean?',
         '"He hablado" = "I have spoken" — present perfect.',
         'I have spoken',
         '"He hablado" means "I have spoken".',
         220
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I have spoken', true, 0),
       ('I spoke', false, 1),
       ('I am speaking', false, 2),
       ('I will speak', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 221 (haber - yo present) ----------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What is the present "yo" form of "haber" (as auxiliary)?',
         '"Yo he" — auxiliary "haber" conjugates: he, has, ha, hemos, habéis, han.',
         'he',
         '"Yo he" is the auxiliary used in the present perfect.',
         221
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hay', false, 0),
       ('he', true, 1),
       ('hago', false, 2),
       ('tengo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 222 (past participle hablar) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "hablar"?',
         'Regular -ar past participle ends in -ado: "hablado".',
         'hablado',
         'The past participle of "hablar" is "hablado".',
         222
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hablando', false, 0),
       ('hablar', false, 1),
       ('hablado', true, 2),
       ('habló', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 223 (past participle comer) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "comer"?',
         'Regular -er/-ir past participle ends in -ido: "comido".',
         'comido',
         'The past participle of "comer" is "comido".',
         223
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('comiendo', false, 0),
       ('comido', true, 1),
       ('comer', false, 2),
       ('comió', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 224 (past participle vivir) -------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "vivir"?',
         '"Vivir" past participle: "vivido".',
         'vivido',
         'The past participle of "vivir" is "vivido".',
         224
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('viviendo', false, 0),
       ('vivió', false, 1),
       ('vivido', true, 2),
       ('vivir', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 225 (past participle escribir - irregular) ----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "escribir"?',
         '"Escribir" is irregular: "escrito".',
         'escrito',
         'The past participle of "escribir" is "escrito".',
         225
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('escribido', false, 0),
       ('escrito', true, 1),
       ('escribiendo', false, 2),
       ('escribió', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 226 (past participle hacer - irregular) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "hacer"?',
         '"Hacer" is irregular: "hecho".',
         'hecho',
         'The past participle of "hacer" is "hecho".',
         226
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('hacido', false, 0),
       ('hechado', false, 1),
       ('hecho', true, 2),
       ('hicho', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 227 (past participle decir - irregular) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "decir"?',
         '"Decir" is irregular: "dicho".',
         'dicho',
         'The past participle of "decir" is "dicho".',
         227
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('decido', false, 0),
       ('dicho', true, 1),
       ('dichado', false, 2),
       ('dijo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 228 (past participle ver - irregular) --------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "ver"?',
         '"Ver" is irregular: "visto".',
         'visto',
         'The past participle of "ver" is "visto".',
         228
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vido', false, 0),
       ('vio', false, 1),
       ('viendo', false, 2),
       ('visto', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 229 (past participle abrir - irregular) -------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "abrir"?',
         '"Abrir" is irregular: "abierto".',
         'abierto',
         'The past participle of "abrir" is "abierto".',
         229
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('abrido', false, 0),
       ('abierto', true, 1),
       ('abrió', false, 2),
       ('abriendo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 230 (past participle volver - irregular) -----------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "volver"?',
         '"Volver" is irregular: "vuelto".',
         'vuelto',
         'The past participle of "volver" is "vuelto".',
         230
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('vuelto', true, 0),
       ('volvido', false, 1),
       ('volvió', false, 2),
       ('volviendo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 231 (past participle poner - irregular) ------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "poner"?',
         '"Poner" is irregular: "puesto".',
         'puesto',
         'The past participle of "poner" is "puesto".',
         231
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('ponido', false, 0),
       ('puesto', true, 1),
       ('puse', false, 2),
       ('poniendo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 232 (he comido) ------------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I have eaten".',
         '"He comido" — present of haber + past participle.',
         'He comido.',
         '"I have eaten" is "He comido".',
         232
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Yo como.', false, 0),
       ('He comido.', true, 1),
       ('Yo comí.', false, 2),
       ('Estoy comiendo.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 233 (hemos visto) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "we have seen".',
         '"Hemos visto" — auxiliary "hemos" + irregular participle "visto".',
         'Hemos visto.',
         '"We have seen" is "Hemos visto".',
         233
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hemos visto.', true, 0),
       ('Habemos visto.', false, 1),
       ('Tenemos visto.', false, 2),
       ('Somos visto.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 234 (han hablado) ----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "they have spoken".',
         '"Han hablado" — "han" is the 3rd plural auxiliary.',
         'Han hablado.',
         '"They have spoken" is "Han hablado".',
         234
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Hablan.', false, 0),
       ('Habían hablado.', false, 1),
       ('Han hablado.', true, 2),
       ('Hablaron.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 235 (alguna vez) -----------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "alguna vez" typically pair with?',
         '"¿Alguna vez has...?" — present perfect — "have you ever...?".',
         'present perfect',
         '"Alguna vez" typically pairs with the present perfect.',
         235
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('preterite', false, 0),
       ('imperfect', false, 1),
       ('present perfect', true, 2),
       ('future', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 236 (todavía no he) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "todavía no he comido" mean?',
         '"Todavía no he comido" = "I have not eaten yet".',
         'I have not eaten yet',
         '"Todavía no he comido" means "I have not eaten yet".',
         236
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I don''t want to eat', false, 0),
       ('I have not eaten yet', true, 1),
       ('I no longer eat', false, 2),
       ('I have never eaten', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 237 (ya he terminado) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "ya he terminado" mean?',
         '"Ya" + present perfect = "already".',
         'I have already finished',
         '"Ya he terminado" means "I have already finished".',
         237
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('I am finishing now', false, 0),
       ('I never finish', false, 1),
       ('I will finish', false, 2),
       ('I have already finished', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 238 (future of probability) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the Spanish future express when used about the present, e.g. "¿Qué hora será?"',
         'Future tense can express probability/conjecture in the present: "I wonder what time it is".',
         'probability / conjecture about the present',
         'Future can express probability in the present ("I wonder...").',
         238
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('probability / conjecture about the present', true, 0),
       ('a definite past', false, 1),
       ('a polite request', false, 2),
       ('habitual action', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 239 (conditional of probability) -------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does the conditional often express about the past, e.g. "Serían las tres"?',
         'Conditional can express probability about the past: "It must have been three".',
         'probability about the past',
         'Conditional can express conjecture about the past.',
         239
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('certainty in the future', false, 0),
       ('probability about the past', true, 1),
       ('command', false, 2),
       ('hypothetical only in present', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 240 (future tener tú) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "tener" for "tú".',
         'Stem tendr- + -ás → tendrás.',
         'tendrás',
         '"Tú tendrás" means "you will have".',
         240
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('tienes', false, 0),
       ('tuviste', false, 1),
       ('tendrás', true, 2),
       ('tendrías', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 241 (future ir ellos) ------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "ir" for "ellos".',
         '"Ir" future is regular: irán.',
         'irán',
         '"Ellos irán" means "they will go".',
         241
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('irán', true, 0),
       ('van', false, 1),
       ('fueron', false, 2),
       ('iran', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 242 (future ser yo) --------------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Future of "ser" for "yo".',
         '"Ser" future is regular: yo seré.',
         'seré',
         '"Yo seré" means "I will be".',
         242
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('soy', false, 0),
       ('seré', true, 1),
       ('sería', false, 2),
       ('fui', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 243 (conditional ser yo) --------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conditional of "ser" for "yo".',
         '"Ser" conditional: yo sería.',
         'sería',
         '"Yo sería" means "I would be".',
         243
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sería', true, 0),
       ('seré', false, 1),
       ('era', false, 2),
       ('estaría', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 244 (conditional estar nosotros) ------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Conditional of "estar" for "nosotros".',
         '"Estar" conditional nosotros: estaríamos.',
         'estaríamos',
         '"Nosotros estaríamos" means "we would be".',
         244
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('estuviéramos', false, 0),
       ('estaremos', false, 1),
       ('estábamos', false, 2),
       ('estaríamos', true, 3)
     ) as c(label, is_correct, order_index);

-- Question 245 (conditional poder yo) ------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'How do you say "I could (would be able to)"?',
         '"Podría" — conditional of poder. Stem podr- + -ía.',
         'podría',
         '"I could" (would be able to) is "podría".',
         245
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('podría', true, 0),
       ('podré', false, 1),
       ('pude', false, 2),
       ('puedo', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 246 (¿podría ayudarme?) ---------------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'What does "¿Podría ayudarme?" mean?',
         'Polite request using conditional: "Could you help me?".',
         'Could you help me?',
         '"¿Podría ayudarme?" means "Could you help me?".',
         246
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Did you help me?', false, 0),
       ('Will you help me?', false, 1),
       ('Could you help me?', true, 2),
       ('Are you helping me?', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 247 (present perfect with ya) --------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Translate "I have already gone".',
         '"Ya he ido" — auxiliary "he" + irregular participle of "ir": "ido".',
         'Ya he ido.',
         '"I have already gone" is "Ya he ido".',
         247
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('Ya fui.', false, 0),
       ('Ya he ido.', true, 1),
       ('Ya voy.', false, 2),
       ('Iré ya.', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 248 (past participle of ir) ----------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "ir"?',
         'The past participle of "ir" is "ido".',
         'ido',
         'The past participle of "ir" is "ido".',
         248
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('yendo', false, 0),
       ('ido', true, 1),
       ('fuido', false, 2),
       ('iba', false, 3)
     ) as c(label, is_correct, order_index);

-- Question 249 (past participle of ser) ---------------------------------
with q as (
  insert into questions (
    module_id, category, prompt, explanation,
    flashcard_back, recap_answer, order_index
  )
  select id, null,
         'Past participle of "ser"?',
         'The past participle of "ser" is "sido".',
         'sido',
         'The past participle of "ser" is "sido".',
         249
  from modules where slug = 'spanish'
  returning id
)
insert into question_choices (question_id, label, is_correct, order_index)
select q.id, c.label, c.is_correct, c.order_index
from q,
     (values
       ('sido', true, 0),
       ('siendo', false, 1),
       ('estado', false, 2),
       ('fui', false, 3)
     ) as c(label, is_correct, order_index);

-- BATCH_2_PLACEHOLDER
